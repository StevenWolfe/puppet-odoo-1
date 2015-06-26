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
  exec { 'install wkhtmltox': # provides wkhtmltopdf
    command => "/usr/bin/wget -O /usr/local/src/wkhtmltox-0.12.2.1_linux-trusty-amd64.deb http://downloads.sourceforge.net/wkhtmltopdf/wkhtmltox-0.12.2.1_linux-trusty-amd64.deb; /usr/bin/dpkg -i /usr/local/src/wkhtmltox-0.12.2.1_linux-trusty-amd64.deb",
    unless  => "/usr/bin/dpkg -l|/bin/grep wkhtmltox",
    require => Package[$odoo::dependancy_packages],
    timeout => 900,
  }
  exec { 'odoo_pip_requirements_install':
    command => "/usr/bin/pip install -r ${odoo::install_path}/requirements.txt",
    require => [Vcsrepo[$odoo::install_path],Package[$odoo::dependancy_packages]],
  }
}