{% from "httpd/map.jinja" import httpd with context %}

httpd_harden:
  file.managed:
    - name: {{ httpd.conf_dir }}/harden.conf
    - source: salt://httpd/templates/harden.conf
    - mode: 644
    - user: root
    - group: root
    - require:
      - pkg: {{ httpd.server }}
    - watch_in:
      - service: {{ httpd.service }}
