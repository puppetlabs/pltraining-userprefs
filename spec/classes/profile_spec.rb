require 'spec_helper'

describe "userprefs::profile" do
  let(:node) { 'test.example.com' }
  let(:facts) { {
    :fqdn            => 'test.example.com',
    :osfamily        => 'RedHat',
    :operatingsystem => 'CentOS',
  } }

  context "profile" do
    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_file('/root/.profile') }
  end

end
