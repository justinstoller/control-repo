plan adhoc::file_apply(
  TargetSpec $targets,
  String     $content  = "This is some simple content",
  String     $filepath = "/tmp/orchestrator-file-apply",
) {

  $targets.apply_prep

  $results = apply($targets) {
    file { "my little file":
      ensure  => 'present',
      content => $content,
      path    => $filepath,
    }
  }

  $results.each |$result| {
    $target = $result.target.name
    if $result.ok {
      out::message("${target} returned a value: ${result.value}")
    } else {
      out::message("${target} errored with a message: ${result.error.message}")
    }
  }
}
