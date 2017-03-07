# elasticsearch-head install
class elasticsearch_head::install (
  $git_ensure = $elasticserach_head::params::git_ensure,
  $user       = $elasticsearch_head::params::user,
  $group      = $elasticsearch_head::params::group,
  $install_dir= $elasticsearch_head::params::install_dir,
) inherits elasticsearch_head::params {

  group { $group :
    ensure => present,
  }

  user { $user :
    ensure  => present,
  #  reuqire => Group[$group],
  }

  file { $install_dir :
    ensure  => directory,
    owner   => $user,
    group   => $group,
    mode    => '0644',
    require => [
      User[$user],
      Group[$group]
    ],
  }

  vcsrepo { $install_dir :
    ensure   => present,
    provider => git,
    source   => 'git://github.com/mobz/elasticsearch-head.git'
  }
 
  class { '::nodejs':
    manage_package_repo       => false,
    nodejs_dev_package_ensure => 'present',
    npm_package_ensure        => 'present',
  }

  package { 'git':
    ensure => present,
  }

  package { 'grunt':
    ensure   => 'present',
    provider => 'npm',
    require   => [
      Class['::nodejs'],
    ]
  }
  #nodejs::npm { 'grunt' :
  #  ensure          => 'present',
  #  target          => "${install_dir}",
  #}
  nodejs::npm { 'grunt-cli' :
    ensure          => 'present',
    target          => "${install_dir}",
  }
   nodejs::npm { 'grunt-contrib-clean' :
    ensure          => 'present',
  #  install_options => ['--save-dev'],
    target          => "${install_dir}",
  }
 nodejs::npm { 'grunt-contrib-concat' :
    ensure          => 'present',
  #  install_options => ['--save-dev'],
   target          => "${install_dir}",
  }
 nodejs::npm { 'grunt-contrib-jasmine':
    ensure          => 'present',
  #  install_options => ['--save-dev'],
    target          => "${install_dir}",
  }
 nodejs::npm { 'grunt-contrib-copy' :
    ensure          => 'present',
  #  install_options => ['--save-dev'],
   target          => "${install_dir}",
  }
 nodejs::npm { 'grunt-contrib-connect' :
    ensure          => 'present',
 #   install_options => ['--save-dev'],
    target          => "${install_dir}",
  }
 nodejs::npm { 'grunt-contrib-watch' :
    ensure          => 'present',
#    install_options => ['--save-dev'],
    target          => "${install_dir}",
  }

}
