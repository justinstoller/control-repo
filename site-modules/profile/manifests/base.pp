class profile::base(
  $message = "The Default Message"
) {


  concat::fragment { 'tmpfile base':
    target  => '/tmp/file',
    content => "\n more test contents",
    order   => '02'
  }

  file { "/tmp/templated":
    ensure  => present,
    content => template("profile/foo.txt.erb"),
  }

  file { "/tmp/served":
    ensure => present,
    source => [
      "puppet:///modules/profile/bar.txt.${osfamily}",
      "puppet:///modules/profile/bar.txt"
    ],
  }

  notify { $message: }

}
