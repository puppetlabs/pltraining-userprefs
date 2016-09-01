require 'spec_helper'

describe "userprefs::user" do
  let(:node) { 'test.example.com' }
  let(:facts) { {
    :id              => 'root',
    :fqdn            => 'test.example.com',
    :osfamily        => 'RedHat',
    :operatingsystem => 'CentOS',
  } }

  it { is_expected.to compile.with_all_deps }

end
