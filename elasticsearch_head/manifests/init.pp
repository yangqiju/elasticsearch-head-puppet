# elasticsearch-head init
class elasticsearch_head {
  class {'elasticsearch_head::install': }
  class { 'elasticsearch_head::service':
    require => Class['::elasticsearch_head::install'],
  }
}
