# Chef InSpec test for recipe wordpress::default

# The Chef InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/

#unless os.windows?
#  # This is an example test, replace with your own test.
#  describe user('root'), :skip do
#    it { should exist }
#  end
#end
#
## This is an example test, replace it with your own test.
#describe port(80), :skip do
#  it { should_not be_listening }
#end

# Array de paquetes que deseas verificar
packages = ['httpd', 'mariadb-server', 'php']

# Iterar sobre cada paquete y comprobar si está instalado
packages.each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

# Array de comandos que deseas verificar
commands = ['httpd -v', 'mysql --version', 'php -v']

# Iterar sobre cada comando y comprobar su ejecución
commands.each do |cmd|
  describe command(cmd) do
    its('exit_status') { should eq 0 }
    its('stdout') { should_not be_empty }
  end
end

# Array de servicios que deseas verificar
services = ['httpd', 'mariadb']

services.each do |service|
  describe service(service) do
    it { should be_running }
    it { should be_enabled }
  end
end

# Array de puertos que deseas verificar
ports = ['80', '3306']

# Iterar sobre cada puerto y comprobar su ejecución
ports.each do |port|
  describe port(port) do
    it { should be_listening }
  end
end

# Verificar que existe la base de datos wordpress	
describe command("mysql -e 'SHOW DATABASES LIKE \"wordpress\";'") do
  its('stdout') { should match /wordpress/ }
  its('exit_status') { should eq 0 }
end

# Verificar que wordpress levanto correctamente el post por defecto	
describe http('http://localhost') do
  its('status') { should cmp 200 }
  its('body') { should match /Welcome to WordPress/ }
end