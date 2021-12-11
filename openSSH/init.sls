asennus:
  pkg.installed:
    - name: openssh-server

/etc/ssh/sshd_config:
  file.managed:
    - source: salt://openSSH/sshd_config

banner:
  file.managed:
    - source: salt://openSSH/sshbanner
    - name: /etc/ssh/sshbanner

sshd:
  service.running:
    - enable: True
    - watch:
      - file: /etc/ssh/sshd_config


