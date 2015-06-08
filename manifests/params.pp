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
  $addons_path = "${install_path}/addons"

  case $::operatingsystem {
    'Ubuntu': {
      $dependancy_packages = ['wkhtmltopdf','python-dev','python-pip','libxml2-dev','libxslt1-dev','libevent-dev','libsasl2-dev','postgresql-server-dev-all','libldap2-dev']
    }
    default: {
      fail("${::operatingsystem} is not supported")
    }
  }
}