require 'spec_helper'

describe 'blog site' do
  it 'responds on port 80' do
    expect(port 80).to be_listening 'tcp'
  end

  it 'returns the wordpress setup page' do
    expect(command('curl http://localhost/wp-admin/install.php').stdout).to match(/WordPress.*Installation/)
  end

  it 'is using HHVM' do
    expect(command('curl --head http://localhost/wp-admin/install.php').stdout).to match(/X-Powered-By: HHVM/)
  end
end
