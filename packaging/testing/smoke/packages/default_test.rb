if version_check = ( os_env('STAGING_VERSION').content eq nil )

describe package('td-agent-bit') do
  it { should be_installed }
  if version_check
    its('version') { should eq os_env('STAGING_VERSION').content() }
  end
end

describe service('td-agent-bit') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end
