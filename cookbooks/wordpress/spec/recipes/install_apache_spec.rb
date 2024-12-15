require 'spec_helper'

describe 'wordpress::install_apache' do

  before do
    stub_command("firewall-cmd --list-all | grep -w 'services:.*http'").and_return(false)
  end

  it 'installs the httpd package' do
    expect(chef_run).to install_package('httpd')
  end

  it 'installs additional php packages' do
    %w[php php-mysqlnd php-mbstring php-xml].each do |pkg|
      expect(chef_run).to install_package(pkg)
    end
  end

  it 'enables and starts the httpd service' do
    expect(chef_run).to enable_service('httpd')
    expect(chef_run).to start_service('httpd')
  end

  it 'enables http service in firewalld' do
    expect(chef_run).to run_execute('enable_firewalld_service')
  end
end

