gnupg:
  pkg.installed

/usr/local/etc/ssl/certs/sks-keyservers.netCA.pem:
  file.managed:
    - source: https://sks-keyservers.net/sks-keyservers.netCA.pem
    - source_hash: d0a056251372367230782e050612834a2efa2fdd80eeba08e490a770691e4ddd52a744fd3f3882ca4188f625c3554633381ac90de8ea142519166277cadaf7b0
    - makedirs: True
