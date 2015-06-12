# == Class: odoo
#
# Full description of class odoo here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'odoo':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class odoo (

  # install options
  $odoo_repo_url   = $odoo::params::odoo_repo_url,
  $branch          = $odoo::params::branch,
  $config_path     = $odoo::params::config_path,
  $install_path    = $odoo::params::install_path,
  $service_status  = $odoo::params::service_status,
  $odoo_user       = $odoo::params::odoo_user,
  $odoo_group      = $odoo::params::odoo_group,
  $odoo_repouser   = $odoo::params::odoo_repouser,
  $gitsshkey       = $odoo::params::gitsshkey,
  
  # configuration file options
  $adminpass       = $odoo::params::adminpass,
  $db_host         = $odoo::params::db_host,
  $db_port         = $odoo::params::db_port,
  $db_user         = $odoo::params::db_user,
  $db_password     = $odoo::params::db_password,
  $addons_path     = $odoo::params::addons_path

) inherits odoo::params {

  # validates variable data types
  validate_absolute_path($config_path)
  validate_absolute_path($install_path)
  validate_string($service_status)
  validate_string($odoo_user)
  validate_string($odoo_group)

  contain 'odoo::install'
  contain 'odoo::config'
  contain 'odoo::service'

  Exec {
    path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
  }

  Class ['odoo::install'] ->
  Class ['odoo::config'] ~>
  Class ['odoo::service']

}
