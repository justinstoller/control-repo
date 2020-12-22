class profile::base(
  $message = "The Default Message"
) {

  notify { $message: }
  notify { "Foo": }

}
