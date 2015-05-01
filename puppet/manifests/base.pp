package {
  'imagemagick': ensure => latest;
}
class { 'nodejs':
    version => 'stable',
}
