require 'chefspec'
require 'chefspec/policyfile'

RSpec.configure do |config|
  config.platform = 'centos-stream'
  config.version = '9'
end