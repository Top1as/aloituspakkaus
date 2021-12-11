apache2:
  pkg.installed

/var/www/html/index.html:
  file.managed:
    - source: salt://weppi/index.html
/etc/skel/public_html/index.html:
  file.managed:
    - source: salt://weppi/skel_index.html
    - makedirs: True

/etc/apache2/mods-enabled/userdir.conf:
  file.symlink:
    - target: /etc/apache2/mods-available/userdir.conf
/etc/apache2/mods-enabled/userdir.load:
  file.symlink:
    - target: /etc/apache2/mods-available/userdir.load    

html:
  service.running:
    - name: apache2
    - watch:
      - pkg: apache2
      - file: /etc/apache2/mods-enabled/userdir.conf
      - file: /etc/apache2/mods-enabled/userdir.load
