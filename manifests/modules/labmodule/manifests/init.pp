class labmodule {
  file { '/tmp/puppet-module.txt':
    ensure  => file,
    content => 'Puppet module executed',
  }
}
