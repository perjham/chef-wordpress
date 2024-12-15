# Recipe: install_mariadb

# Instalar el paquete mariadb-server
package 'mariadb-server' do
  action :install
end

# Configurar el servicio mariadb
service 'mariadb.service' do
  action [:enable, :start]
  supports status: true, restart: true, reload: true
  subscribes :restart, 'package[mariadb-server]', :immediately
end