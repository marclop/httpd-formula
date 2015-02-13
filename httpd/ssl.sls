{% from "httpd/map.jinja" import apache with context %}

httpd_ssl:
  pkg.installed:
    - name: mod_ssl
    - require:
      - pkg: {{ httpd.server }}
    - watch_in:
      - service: {{ httpd.service }}

httpd_ssl_enforced:
  file.replace:
    - path: {{ httpd.conf_dir }}/ssl.conf
    - pattern: 'SSLProtocol all -SSLv2$'
    - replace: 'SSLProtocol all -SSLv2 -SSLv3'
    - dry_run: True # Don't make any changes just yet
