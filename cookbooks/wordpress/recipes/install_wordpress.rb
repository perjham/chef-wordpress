# Recipe: install_wordpress

# Instalar wget
package 'wget' do
  action :install
end

# Descargar y configurar WordPress
bash 'download_wordpress' do
  code <<-EOH
    wget -q https://wordpress.org/latest.tar.gz -O /tmp/latest.tar.gz && \
    tar zxf /tmp/latest.tar.gz -C /var/www/ && \
    mv /var/www/wordpress/* /var/www/html/ && \
    rm -rf /var/www/wordpress
  EOH
  action :run
  not_if { ::File.exist?('/var/www/html/wp-config.php') }
end

# Asegurarse de que el directorio /var/www/html existe
directory '/var/www/html' do
  action :create
end

# Instalar policycoreutils-python-utils
package 'policycoreutils-python-utils' do
  action :install
end

# Configurar contextos de seguridad para Apache
execute 'set_apache_defaults' do
  command 'semanage fcontext -a -t httpd_sys_content_t -s system_u "/var/www/html(/.*)?"'
  action :run
  not_if "semanage fcontext -l | grep '/var/www/html'"
end

execute 'restorecon_apache' do
  command 'restorecon -Rv /var/www/html'
  action :run
end

execute 'set_apache_db_boolean' do
  command 'setsebool -P httpd_can_network_connect_db 1'
  action :run
end

# Configurar base de datos para WordPress
cookbook_file '/tmp/wordpress.sql' do
  source 'wordpress.sql'
  action :create
end

execute 'create_wordpress_db' do
  command 'mysql -u root < /tmp/wordpress.sql'
  action :run
  not_if "mysql -u root -e 'SHOW DATABASES;' | grep wordpress"
end

# Configurar wp-config.php
cookbook_file '/var/www/html/wp-config.php' do
  source 'wp-config.php'
  action :create
end

# Script de inicialización de WordPress con template
template '/tmp/init_wordpress.sh' do
  source 'init_wordpress.sh.erb'
  mode '0755'
  variables(
    server_ip: '192.168.33.11',
    weblog_title: 'Actividad_1',
    user_name: 'admin',
    admin_email: 'perjham@gmail.com',
    admin_password: 'admin'
  )
  action :create
end

execute 'init_wordpress' do
  command 'sh /tmp/init_wordpress.sh'
  action :run
end