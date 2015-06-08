# == Class: odoo::install
#
# Full description of class odoo here.

class odoo::config inherits odoo {
  file { $odoo::config_path :
    ensure => directory,
  } ~>
  file { "${odoo::config_path}/odoo.conf" :
    content => template('odoo/odoo.conf.erb'),
    }
}