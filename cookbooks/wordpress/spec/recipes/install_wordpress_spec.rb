require 'spec_helper'

describe 'wordpress::install_wordpress' do

  before do
    stub_command("mysql -u root -e 'SHOW DATABASES;' | grep wordpress").and_return(false)
    stub_command("semanage fcontext -l | grep '/var/www/html'").and_return(false)
#    allow(File).to receive(:exist?).with('/var/www/html/wp-config.php').and_return(false)
  end

  it 'installs the wget package' do
    expect(chef_run).to install_package('wget')
  end

  it 'downloads and configures WordPress' do
    expect(chef_run).to run_bash('download_wordpress')
  end

  it 'creates /var/www/html directory' do
    expect(chef_run).to create_directory('/var/www/html')
  end

  it 'installs policycoreutils-python-utils package' do
    expect(chef_run).to install_package('policycoreutils-python-utils')
  end
#
  it 'configures SELinux contexts for Apache' do
    expect(chef_run).to run_execute('set_apache_defaults')
    expect(chef_run).to run_execute('restorecon_apache')
    expect(chef_run).to run_execute('set_apache_db_boolean')
  end

  it 'uploads and imports the WordPress SQL file' do
    expect(chef_run).to create_cookbook_file('/tmp/wordpress.sql')
    expect(chef_run).to run_execute('create_wordpress_db')
  end

  it 'uploads the wp-config.php file' do
    expect(chef_run).to create_cookbook_file('/var/www/html/wp-config.php')
  end

  it 'creates the WordPress initialization script' do
    expect(chef_run).to create_template('/tmp/init_wordpress.sh')
  end

  it 'runs the WordPress initialization script' do
    expect(chef_run).to run_execute('init_wordpress')
  end
end
