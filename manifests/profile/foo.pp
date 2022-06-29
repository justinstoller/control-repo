class profile::foo(
  $fizz = "lalalala",
  $fazz = "nananana"
) {

  file { "/tmp/foo":
    content => $fizz
  }

  file { "/tmp/foo2":
    content => $fazz
  }
}
