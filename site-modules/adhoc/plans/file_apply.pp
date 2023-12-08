plan adhoc::file_apply(
  TargetSpec $targets,
  String     $content = "This is some simple content",
  String     $path    = "/tmp/orchestrator-file-apply",
) {

  $targets.apply_prep

  $results = apply($targets) {
    file { "my little file":
      ensure  => 'file',
      content => $content,
      path    => $path,
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
