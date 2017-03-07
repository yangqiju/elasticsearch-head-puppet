# elasticsearch-head params
class elasticsearch_head::params {
  $version      = ''
  $install_dir  = '/usr/share/elasticsearch-head'
  $group        = 'elasticsearch'
  $user         = 'elasticsearch'
  $git_ensure   = 'present'
  $service_name = 'elasticsearch_head'
}
