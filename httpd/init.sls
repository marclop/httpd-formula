{% from "httpd/map.jinja" import httpd with context %}

httpd_pkg:
  pkg.installed:
    - name: {{ httpd.server }}
  service.running:
    - name: {{ httpd.service }}
    - enable: {{ httpd.enabled }}
    - reload: True

{% if 'production' in pillar['httpd'] or 'ssl' in pillar['httpd'] %}
{% if pillar['httpd']['production'] == True or pillar['httpd']['ssl'] == True %}

include:
{%- if pillar['httpd']['production'] == True %}
  - httpd.production
{%- endif %} # END of Pillar production Value
{%- if pillar['httpd']['ssl'] == True %}
  - httpd.ssl
{%- endif %} # END of Pillar ssl Value
{% endif %} #END of Pillar check
{% endif %} #END of Pillar value
