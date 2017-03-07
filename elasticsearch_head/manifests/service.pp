# elasticsearch-head service
class elasticsearch_head::service (
  $service_name = $elasticsearch_head::params::service_name,
) inherits elasticsearch_head::params {
  file { "/etc/init.d/${service_name}":
    ensure  => present,
    content => template("${module_name}/init.erb"),
    mode    => '0755',
    before  => Service[$service_name],
    notify  => Service[$service_name]
  }

  service { $service_name:
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
    require    => [
      Class['::elasticsearch_head::install']
    ],
  }

}
