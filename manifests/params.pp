class certbot::params {

  $api_url = 'https://acme-v01.api.letsencrypt.org/directory'

  case downcase($::osfamily) {
    'debian': {
      case downcase($::lsbdistcodename) {
        /^(trusty|xenial)$/: {
          $config_dir = '/etc/certbot'
          $package_name = 'certbot'
        }
        default: {
          fail("certbot unsupported release ${::lsbdistcodename}")
        }
      }
    }
    default: {
      fail("certbot unsupported on platform ${::osfamily}")
    }
  }

}
