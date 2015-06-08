# == Class: odoo::install
#
# Full description of class odoo here.

class odoo::install inherits odoo {
    vcsrepo { $odoo::install_path:
      ensure   => present,
      provider => git,
      source   => $odoo::odoo_repo_url,
      revision => $odoo::branch,
      identity => $odoo::gitsshkey,
      user     => $odoo::odoo_repouser,
      }
  # install dependancy packages
  package { $odoo::dependancy_packages:
    ensure => installed,
    }
  exec { 'odoo_pip_requirements_install':
    command => "/usr/bin/pip install -r ${odoo::install_path}/requirements.txt",
    require => [Vcsrepo[$odoo::install_path],Package['python-pip']],
  }
}