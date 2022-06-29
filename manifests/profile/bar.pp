class profile::bar(
  $buzz = "lalalala",
) {

  file { "/tmp/bar":
    content => $buzz,
  }
}

