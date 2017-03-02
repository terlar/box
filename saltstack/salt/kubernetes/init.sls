include:
  - docker

kubernetes:
  pkg.installed

kubernetes-helm:
  pkg.installed

kubelet:
  service.running:
    - enable: True
    - reload: True
    - watch:
      - pkg: kubernetes
      - file: /etc/systemd/system/kubelet.service.d/10-kubeadm.conf

/etc/systemd/system/kubelet.service.d/10-kubeadm.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 664
    - source: salt://kubernetes/files/etc/systemd/system/kubelet.service.d/kubeadm.conf

initialize_kubeadm:
  cmd.run:
    - name: kubeadm init --skip-preflight-checks
    - creates:
      - /etc/kubernetes/manifests
      - /etc/kubernetes/pki
      - /var/lib/etcd
      - /var/lib/kubelet
      - /etc/kubernetes/admin.conf
      - /etc/kubernetes/kubelet.conf
    - require:
      - service: kubelet

install_kubernetes_network:
  cmd.run:
    - name: kubectl --kubeconfig /etc/kubernetes/admin.conf apply -f https://git.io/weave-kube
    - unless: kubectl --namespace kube-system get pod -l name=weave-net -o name | grep pod/
    - require:
      - service: kubelet

allow_kubernetes_pods_on_master:
  cmd.run:
    - name: kubectl --kubeconfig /etc/kubernetes/admin.conf taint nodes --all dedicated-
    - unless: kubectl --namespace kube-system describe nodes | egrep 'Taints:\s+<none>'
    - require:
      - service: kubelet

{% for name, user in pillar.get('users', {}).items()
        if user.kubeadm_user is defined and user.kubeadm_user %}
{%- set current = salt.user.info(name) -%}
{%- set home = current.get('home', "/home/%s" % name) -%}
{%- set gid = current.get('gid') -%}
kubernetes_config_for_{{ name }}_user:
  file.copy:
    - name: {{ home }}/.kube/config
    - source: /etc/kubernetes/admin.conf
    - user: {{ name }}
    - group: {{ gid }}
    - require:
      - service: kubelet

initialize_helm:
  cmd.run:
    - name: helm init --kube-context admin@kubernetes
    - unless: helm version --server
    - runas: {{ name }}
    - require:
      - file: kubernetes_config_for_{{ name }}_user
{% endfor %}
