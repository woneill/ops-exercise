require 'spec_helper'

## Nginx
describe 'webserver installed' do
  it 'nginx service running' do
    expect(service 'nginx').to be_enabled
    expect(service 'nginx').to be_running
  end
end

## HHVM
describe 'HHVM installed' do
  it 'HHVM service running' do
    expect(service 'hhvm').to be_enabled
    expect(service 'hhvm').to be_running
  end

  it 'php has HHVM enabled' do
    expect(command('/usr/bin/php --version').stdout).to match(/HHVM/)
    expect(command('curl --head http://localhost/dummy.php').stdout).to match(/X-Powered-By: HHVM/)
  end
end
