{% if (pillar['php-fpm'] is defined) and (pillar['php-fpm'] is not none) %}
  {%- if (pillar['php-fpm']['enabled'] is defined) and (pillar['php-fpm']['enabled'] is not none) and (pillar['php-fpm']['enabled']) %}
    {%- if (pillar['php-fpm']['version_5_6'] is defined) and (pillar['php-fpm']['version_5_6'] is not none) and (pillar['php-fpm']['version_5_6']) %}
php-fpm_repo_deb:
  pkgrepo.managed:
    - name: deb http://ppa.launchpad.net/ondrej/php/ubuntu xenial main
    - dist: xenial
    - file: /etc/apt/sources.list.d/ondrej-ubuntu-php-xenial.list
    - keyserver: keyserver.ubuntu.com
    - keyid: E5267A6C
    - refresh_db: true

php-fpm_5_6_installed:
  pkg.installed:
    - pkgs:
      - php5.6-cli
      - php5.6-fpm

      {%- if (pillar['php-fpm']['modules'] is defined) and (pillar['php-fpm']['modules'] is not none) %}
        {%- if (pillar['php-fpm']['modules']['php5_6'] is defined) and (pillar['php-fpm']['modules']['php5_6'] is not none) %}
php-fpm_5_6_modules_installed:
  pkg.installed:
    - pkgs:
          {%- for pkg_name in pillar['php-fpm']['modules']['php5_6'] %}
            {%- if (pkg_name != 'php5.6-ioncube') %}
      - {{ pkg_name }}
            {%- endif %}
          {%- endfor %}

          {%- for pkg_name in pillar['php-fpm']['modules']['php5_6'] %}
            {%- if (pkg_name == 'php5.6-ioncube') %}
php-fpm_5_6_modules_ioncube_1:
  file.managed:
    - name: '/usr/lib/php/20131226/ioncube_loader_lin_5.6.so'
    - user: root
    - group: root
    - source: 'salt://php-fpm/files/ioncube/ioncube_loader_lin_5.6.so'

php-fpm_5_6_modules_ioncube_2:
  file.managed:
    - name: '/etc/php/5.6/mods-available/ioncube.ini'
    - user: root
    - group: root
    - source: 'salt://php-fpm/files/ioncube/ioncube.ini'
    - template: jinja
    - defaults:
        path: '/usr/lib/php/20131226/ioncube_loader_lin_5.6.so'

php-fpm_5_6_modules_ioncube_3:
  file.symlink:
    - name: '/etc/php/5.6/fpm/conf.d/00-ioncube.ini'
    - target: '/etc/php/5.6/mods-available/ioncube.ini'

            {%- endif %}
          {%- endfor %}
        {%- endif %}
      {%- endif %}
    {%- endif %}
    {%- if (pillar['php-fpm']['version_7_0'] is defined) and (pillar['php-fpm']['version_7_0'] is not none) and (pillar['php-fpm']['version_7_0']) %}
php-fpm_repo_deb:
  pkgrepo.managed:
    - name: deb http://ppa.launchpad.net/ondrej/php/ubuntu xenial main
    - dist: xenial
    - file: /etc/apt/sources.list.d/ondrej-ubuntu-php-xenial.list
    - keyserver: keyserver.ubuntu.com
    - keyid: E5267A6C
    - refresh_db: true

php-fpm_7_0_installed:
  pkg.installed:
    - pkgs:
      - php7.0-cli
      - php7.0-fpm

      {%- if (pillar['php-fpm']['modules'] is defined) and (pillar['php-fpm']['modules'] is not none) %}
        {%- if (pillar['php-fpm']['modules']['php7_0'] is defined) and (pillar['php-fpm']['modules']['php7_0'] is not none) %}
php-fpm_7_0_modules_installed:
  pkg.installed:
    - pkgs:
          {%- for pkg_name in pillar['php-fpm']['modules']['php7_0'] %}
            {%- if (pkg_name != 'php7.0-ioncube') %}
      - {{ pkg_name }}
            {%- endif %}
          {%- endfor %}

          {%- for pkg_name in pillar['php-fpm']['modules']['php7_0'] %}
            {%- if (pkg_name == 'php7.0-ioncube') %}
php-fpm_7_0_modules_ioncube_1:
  file.managed:
    - name: '/usr/lib/php/20151012/ioncube_loader_lin_7.0.so'
    - user: root
    - group: root
    - source: 'salt://php-fpm/files/ioncube/ioncube_loader_lin_7.0.so'

php-fpm_7_0_modules_ioncube_2:
  file.managed:
    - name: '/etc/php/7.0/mods-available/ioncube.ini'
    - user: root
    - group: root
    - source: 'salt://php-fpm/files/ioncube/ioncube.ini'
    - template: jinja
    - defaults:
        path: '/usr/lib/php/20151012/ioncube_loader_lin_7.0.so'

php-fpm_7_0_modules_ioncube_3:
  file.symlink:
    - name: '/etc/php/7.0/fpm/conf.d/00-ioncube.ini'
    - target: '/etc/php/7.0/mods-available/ioncube.ini'

            {%- endif %}
          {%- endfor %}
        {%- endif %}
      {%- endif %}
    {%- endif %}
    {%- if (pillar['php-fpm']['version_7_1'] is defined) and (pillar['php-fpm']['version_7_1'] is not none) and (pillar['php-fpm']['version_7_1']) %}
php-fpm_repo_deb:
  pkgrepo.managed:
    - name: deb http://ppa.launchpad.net/ondrej/php/ubuntu xenial main
    - dist: xenial
    - file: /etc/apt/sources.list.d/ondrej-ubuntu-php-xenial.list
    - keyserver: keyserver.ubuntu.com
    - keyid: E5267A6C
    - refresh_db: true

php-fpm_7_1_installed:
  pkg.installed:
    - pkgs:
      - php7.1-cli
      - php7.1-fpm

      {%- if (pillar['php-fpm']['modules'] is defined) and (pillar['php-fpm']['modules'] is not none) %}
        {%- if (pillar['php-fpm']['modules']['php7_1'] is defined) and (pillar['php-fpm']['modules']['php7_1'] is not none) %}
php-fpm_7_1_modules_installed:
  pkg.installed:
    - pkgs:
          {%- for pkg_name in pillar['php-fpm']['modules']['php7_1'] %}
            {%- if (pkg_name != 'php7.1-ioncube') %}
      - {{ pkg_name }}
            {%- endif %}
          {%- endfor %}

          {%- for pkg_name in pillar['php-fpm']['modules']['php7_1'] %}
            {%- if (pkg_name == 'php7.1-ioncube') %}
php-fpm_7_1_modules_ioncube_1:
  file.managed:
    - name: '/usr/lib/php/20160505/ioncube_loader_lin_7.1.so'
    - user: root
    - group: root
    - source: 'salt://php-fpm/files/ioncube/ioncube_loader_lin_7.1.so'

php-fpm_7_1_modules_ioncube_2:
  file.managed:
    - name: '/etc/php/7.1/mods-available/ioncube.ini'
    - user: root
    - group: root
    - source: 'salt://php-fpm/files/ioncube/ioncube.ini'
    - template: jinja
    - defaults:
        path: '/usr/lib/php/20160505/ioncube_loader_lin_7.1.so'

php-fpm_7_1_modules_ioncube_3:
  file.symlink:
    - name: '/etc/php/7.1/fpm/conf.d/00-ioncube.ini'
    - target: '/etc/php/7.1/mods-available/ioncube.ini'

            {%- endif %}
          {%- endfor %}
        {%- endif %}
      {%- endif %}
    {%- endif %}
    {%- if (pillar['php-fpm']['version_5_5'] is defined) and (pillar['php-fpm']['version_5_5'] is not none) and (pillar['php-fpm']['version_5_5']) %}
php-fpm_5_5_installed:
  pkg.installed:
    - pkgs:
      - php5-cli
      - php5-fpm

      {%- if (pillar['php-fpm']['modules'] is defined) and (pillar['php-fpm']['modules'] is not none) %}
        {%- if (pillar['php-fpm']['modules']['php5_5'] is defined) and (pillar['php-fpm']['modules']['php5_5'] is not none) %}
php-fpm_5_5_modules_installed:
  pkg.installed:
    - pkgs:
          {%- for pkg_name in pillar['php-fpm']['modules']['php5_5'] %}
            {%- if (pkg_name != 'php5-ioncube') %}
      - {{ pkg_name }}
            {%- endif %}
          {%- endfor %}

          {%- for pkg_name in pillar['php-fpm']['modules']['php5_5'] %}
            {%- if (pkg_name == 'php5-ioncube') %}
php-fpm_5_5_modules_ioncube_1:
  file.managed:
    - name: '/usr/lib/php5/20121212/ioncube_loader_lin_5.5.so'
    - user: root
    - group: root
    - source: 'salt://php-fpm/files/ioncube/ioncube_loader_lin_5.5.so'

php-fpm_5_5_modules_ioncube_2:
  file.managed:
    - name: '/etc/php5/mods-available/ioncube.ini'
    - user: root
    - group: root
    - source: 'salt://php-fpm/files/ioncube/ioncube.ini'
    - template: jinja
    - defaults:
        path: '/usr/lib/php5/20121212/ioncube_loader_lin_5.5.so'

php-fpm_5_6_modules_ioncube_3:
  file.symlink:
    - name: '/etc/php5/fpm/conf.d/00-ioncube.ini'
    - target: '/etc/php5/mods-available/ioncube.ini'

            {%- endif %}
          {%- endfor %}
        {%- endif %}
      {%- endif %}
    {%- endif %}
  {%- endif %}
{% endif %}
