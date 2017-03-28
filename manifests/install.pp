class certbot::install {

  if ($::certbot::manage_repo) {
    apt::source {'ppa-certbot-certbot':
      location => 'http://ppa.launchpad.net/certbot/certbot/ubuntu',
      release  => $::lsbdistcodename,
      repos    => 'main',
      key      => {
        'id'     => '7BF576066ADA65728FC7E70A8C47BE8E75BCA694',
        'server' => 'keyserver.ubuntu.com',
      },
      include  => {
        'deb' => true,
      },
    } -> Package[$::certbot::package_name]
  }
  package {$::certbot::package_name:
    ensure => 'present',
  }

}
