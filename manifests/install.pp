class opendkim::install inherits opendkim {

  if($opendkim::manage_package)
  {
    package { $opendkim::params::package_name:
      ensure => $opendkim::package_ensure,
    }
  }

}
