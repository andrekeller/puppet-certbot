class certbot (
  Regexp[/^\S+@\S+\.\S+$/] $email,
  Boolean $mange_repo = true,
  String $api_url = $::certbot::params::api_url,
) inherits certbot::params {

  class {'::certbot::install':
  }->
  class {'::certbot::config':
  }

  contain ::certbot::install
  contain ::certbot::config

}
