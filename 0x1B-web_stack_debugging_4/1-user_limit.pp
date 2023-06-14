# change the security limits fle to allow more files

exec {'replacement':
  provider => shell,
  command  => 'sudo sed -i "s/nofile 5/nofile 5120/" /etc/security/limits.conf;sudo sed -i "s/nofile 4/nofile 4096/" /etc/security/limits.conf'
}
