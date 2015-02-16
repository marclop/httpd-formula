{% from "httpd/map.jinja" import httpd with context %}

httpd_ssl:
  pkg.installed:
    - name: {{ httpd.ssl_name }}
    - require:
      - pkg: {{ httpd.server }}
    - watch_in:
      - service: {{ httpd.service }}

httpd_ssl_enforced:
  file.replace:
    - name: {{ httpd.conf_dir }}/ssl.conf
    - path: {{ httpd.conf_dir }}/ssl.conf
    - pattern: 'SSLProtocol all -SSLv2$'
    - repl: 'SSLProtocol all -SSLv2 -SSLv3'
    - dry_run: True # Don't make any changes just yet
    - require:
      - pkg: {{ httpd.ssl_name }}
