define role::foobar(
  Integer $port,
  String[1] root = "barfoo"
)
{
  package { 'vim': ensure => present }

  file { '/tmp/foobar':
    content => template('role/foobar/template.erb'),
    require => Package['vim'],
  }

}
