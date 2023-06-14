# increase the limit on open files to allow requests to be handled

exec {'sedstart':
  provider => shell,
  command  => 'sudo sed -i "s/15/4000/" /etc/default/nginx;sudo service nginx restart'
}
