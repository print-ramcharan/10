class lab_class {
  file { '/tmp/puppet-class.txt':
    ensure  => file,
    content => 'Puppet class executed',
  }
}
include lab_class
