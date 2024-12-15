# Recipe: install_apache

# Instalar el paquete httpd
package 'httpd' do
  action :install
end

# Lista de paquetes adicionales
packages = ['php', 'php-mysqlnd', 'php-mbstring', 'php-xml']

# Instalar los paquetes adicionales
packages.each do |pkg|
  package pkg do
    action :install
    #notifies :restart, 'service[httpd]', :immediately
  end
end

# Configurar el servicio httpd
service 'httpd' do
  action [:enable, :start]
  supports status: true, restart: true, reload: true
  #subscribes :restart, 'package[httpd]', :immediately
end

# Configurar el servicio firewalld
service 'firewalld' do
  supports status: true, restart: true, reload: true
  action [ :enable, :start ]
end

# Habilitar el servicio web en firewalld
execute 'enable_firewalld_service' do
  command 'firewall-cmd --permanent --add-service=http && firewall-cmd --reload'
  action :run
  not_if "firewall-cmd --list-all | grep -w 'services:.*http'"
end