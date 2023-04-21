# This manifest kills a specific process using the execute command

exec { 'pkill killmenow':
  command => 'pkill killmenow',
  path    => '/usr/bin'
}
