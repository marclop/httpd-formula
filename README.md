# Apache HTTPD formula

Formula to set up the Apache httpd server. Made for RHEL family although the base httpd state can work with Debian servers as well.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``httpd``
------------
Installs the Apache httpd server from distribution packages, enables and starts the service by default

``httpd.production``
--------------------
Removes Server info and version from the headers and errors thrown by apache

``httpd.ssl``
--------------------
Installs mod_ssl and forces httpd to not use SSLv2 and SSLv3
