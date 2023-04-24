# Updates, installs nginx server, says hello, give scustom redirect, gives custom 404

exec { 'install':
  provider => shell,
  command  => 'sudo apt-get -y update ; sudo apt-get -y install nginx ;',
  before   => Exec['files']
}

exec { 'files':
  provider => shell,
  command  => 'sudo echo "Hello World!" > /var/www/html/index.nginx-debian.html ; sudo ufw allow "Nginx HTTP"',
  before   => Exec['sed']
}

exec { 'sed':
  provider => shell,
  command  => 'sed -i "s/server_name  _;/server_name _;\n\trewrite ^\/redirect_me https:\/\/www.youtube.com\/watch?v=dQw4w9WgXcQ permanent;\n\n\terror_page 404 \/custom_404_not_found.html;\n\tlocation = \/custom_404_not_found.html {\n\t\troot \/usr\/share\/nginx\/html;\n\t\tinternal;\n\t}/" /etc/nginx/sites-available/default',
  before   => Exec['initialize']
}

exec { 'initialize':
  provider => shell,
  command  => 'sudo service nginx start'
}
