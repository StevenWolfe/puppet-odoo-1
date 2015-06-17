# == Class: odoo::params
#
# Full description of class odoo here.

class odoo::params {
  $odoo_repo_url = 'git@github.com:bhaymore/odoo_module.git'
  $branch = 'master'
  $config_path = '/etc'
  $install_path = '/opt/odoo'
  $service_status = 'running'
  $odoo_user = 'odoo'
  $odoo_group = 'odoo'
  $odoo_repouser = undef
  $git_sshkey = undef

  $adminpass = 'admin'
  $db_host = '127.0.0.1'
  $db_port = '5432'
  $db_user = 'odoo'
  $db_password = undef
  $addons_path = undef
  $log_level = undef
  $logfile = undef
  
  case $::operatingsystem {
    'Ubuntu': {
      $dependancy_packages = ['python-dev','python-pip','libxml2-dev','libxslt1-dev','libevent-dev','libsasl2-dev','postgresql-server-dev-all', 'libldap2-dev', 'xfonts-base', 'xfonts-75dpi', 'xfonts-utils', 'libfontenc1', 'libxfont1', 'xfonts-encodings', 'fontconfig', 'libjpeg-turbo8', 'libfontconfig1', 'libjpeg-dev']
    }
    default: {
      fail("${::operatingsystem} is not supported")
    }
  }
}