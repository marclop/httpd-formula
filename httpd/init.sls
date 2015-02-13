{% from "httpd/map.jinja" import apache with context %}

httpd_pkg:
  pkg.installed:
    - name: {{ httpd.server }}
  service.running:
    - name: {{ httpd.service }}
    - enable: True
    - reload: True

{% if 'production' in pillar['httpd'] %}
{% if pillar['httpd']['production'] == True %}

include:
  - httpd.production
{% endif %} #END Production functionality
{% endif %} #END Production tag check

{% if 'ssl' in pillar['httpd'] %}
{% if pillar['httpd']['ssl'] == True %}

include:
  - httpd.ssl
{% endif %} #END SSL functionality
{% endif %} #END SSL tag check