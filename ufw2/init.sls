ufw:
  pkg.installed:
    - pkgs:
      - ufw

ufw allow 22/tcp:
  cmd.run:
    - unless: "ufw status verbose | grep '22/tcp'"
ufw allow 80/tcp:
  cmd.run:
    - unless: "ufw status verbose | grep '80/tcp'"
ufw allow 1337/tcp:
  cmd.run:
    - unless: "ufw status verbose | grep '1337/tcp'"
ufw allow 4505/tcp:
  cmd.run:
    - unless: "ufw status verbose | grep '4505/tcp'"
ufw allow 4506/tcp:
  cmd.run:
    - unless: "ufw status verbose | grep '4506/tcp'"

ufw enable:
  cmd.run:
    - unless: "ufw status | grep 'Status: active'"
