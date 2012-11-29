class bind::settings(

  $allow_query       = undef,
  $allow_query_cache = undef,
  $allow_recursion   = undef,
  $ipv6              = 'any'
) {
  file {
    '/etc/bind/named.conf.options':
      ensure  => file,
      owner   => root,
      group   => bind,
      mode    => '0644',
      content => template('bind/named.conf.options.erb'),
      require => Package['bind9'];
  }

  if $ipv6 == 'none' {
    file {
      '/etc/default/bind9':
        ensure  => file,
        owner   => root,
        group   => root,
        mode    => '0644',
        content => template('bind/bind9.erb'),
        require => Package['bind9'];
    }
  }
}
