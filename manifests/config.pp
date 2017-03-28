class certbot::config {

  $email = $::certbot::email
  $api_url = $::certbot::api_url

  file {"${::certbot::config_dir}/cli.ini":
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('certbot/cli.ini.erb'),
  }

}
