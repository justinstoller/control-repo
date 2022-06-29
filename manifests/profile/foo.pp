class profile::foo(
  $fizz = "lalalala"
) {

  file { "/tmp/foo":
    content => $fizz
  }
}
