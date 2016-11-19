class opendkim::service inherits opendkim {

  #
  validate_bool($opendkim::manage_docker_service)
  validate_bool($opendkim::manage_service)
  validate_bool($opendkim::service_enable)

  validate_re($opendkim::service_ensure, [ '^running$', '^stopped$' ], "Not a valid daemon status: ${opendkim::service_ensure}")

  $is_docker_container_var=getvar('::eyp_docker_iscontainer')
  $is_docker_container=str2bool($is_docker_container_var)

  if( $is_docker_container==false or
      $opendkim::manage_docker_service)
  {
    if($opendkim::manage_service)
    {
      service { $opendkim::params::service_name:
        ensure => $opendkim::service_ensure,
        enable => $opendkim::service_enable,
      }
    }
  }
}
