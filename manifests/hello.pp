file { '/tmp/puppet-hello.txt':
  ensure  => file,
  content => 'Hello from Puppet Manifest',
}
