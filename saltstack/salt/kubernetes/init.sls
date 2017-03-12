include:
  - docker

kubernetes:
  pkg.installed:
    - require:
      - pkg: docker

kubernetes-helm:
  pkg.installed

# Configure kubelet to use kubeadm.
kubelet_kubeadm_config:
  file.managed:
    - name: /etc/systemd/system/kubelet.service.d/10-kubeadm.conf
    - source: salt://kubernetes/files/etc/systemd/system/kubelet.service.d/kubeadm.conf
    - user: root
    - group: root
    - mode: 664

kubelet:
  service.running:
    - enable: True
    - watch:
      - pkg: kubernetes
      - file: kubelet_kubeadm_config

# Initialize kubeadm
# Skip the preflight checks due to an issue where it complains if the
# kubelet server is not started, but if it is started it complains about
# the port being used etc.
kubeadm_initialization:
  cmd.run:
    - name: kubeadm init --skip-preflight-checks --pod-network-cidr 10.244.0.0/16
    - creates:
      - /etc/kubernetes/manifests
      - /etc/kubernetes/pki
      - /var/lib/etcd
      - /var/lib/kubelet
      - /etc/kubernetes/admin.conf
      - /etc/kubernetes/kubelet.conf
    - require:
      - service: kubelet

# Setup the network to use for the kubernetes cluster.
kubernetes_network:
  file.managed:
    - name: /etc/kubernetes/kube-flannel.yml
    - source: salt://kubernetes/files/etc/kubernetes/kube-flannel.yml
    - user: root
    - group: root
    - mode: 664
  cmd.run:
    - name: kubectl --kubeconfig /etc/kubernetes/admin.conf --namespace kube-system apply -f /etc/kubernetes/kube-flannel.yml
    - unless: kubectl --kubeconfig /etc/kubernetes/admin.conf --namespace kube-system get pod -l app=flannel -o name | grep pod/
    - require:
      - file: kubernetes_network
      - cmd: kubeadm_initialization

# Allow running pods on master, since we run a one node cluster.
kubernetes_allow_pods_on_master:
  cmd.run:
    - name: kubectl --kubeconfig /etc/kubernetes/admin.conf taint nodes --all dedicated-
    - unless: kubectl --kubeconfig /etc/kubernetes/admin.conf --namespace kube-system describe nodes | egrep 'Taints:\s+<none>'
    - require:
      - cmd: kubeadm_initialization

{% for name, user in salt['pillar.get']('users', {}).items()
        if user.kubeadm_user is defined and user.kubeadm_user %}
{%- set current = salt.user.info(name) -%}
{%- set home = current.get('home', "/home/%s" % name) -%}
{%- set gid = current.get('gid') -%}
remove_outdated_kubernetes_config_for_user_{{ name }}:
  cmd.run:
    - name: rm  {{ home }}/.kube/config
    - onchanges:
      - cmd: kubeadm_initialization

# Copy configuration to users local kubernetes config.
kubernetes_config_for_user_{{ name }}:
  file.copy:
    - name: {{ home }}/.kube/config
    - source: /etc/kubernetes/admin.conf
    - user: {{ name }}
    - group: {{ gid }}
    - require:
      - cmd: kubeadm_initialization

# Initialize helm for both user and server.
kubernetes-helm_initialization:
  cmd.run:
    - name: helm init --kube-context admin@kubernetes
    - unless: helm version --server
    - runas: {{ name }}
    - require:
      - cmd: kubeadm_initialization
      - cmd: kubernetes_network
      - file: kubernetes_config_for_user_{{ name }}
{% endfor %}
