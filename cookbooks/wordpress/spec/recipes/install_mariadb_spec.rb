require 'spec_helper'

describe 'wordpress::install_mariadb' do

  it 'installs the mariadb-server package' do
    expect(chef_run).to install_package('mariadb-server')
  end

  it 'enables and starts the mariadb service' do
    expect(chef_run).to enable_service('mariadb.service')
    expect(chef_run).to start_service('mariadb.service')
  end
end
