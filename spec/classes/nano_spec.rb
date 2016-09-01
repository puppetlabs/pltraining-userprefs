require 'spec_helper'

describe "userprefs::nano" do
  let(:node) { 'test.example.com' }
  let(:facts) { {
    :fqdn            => 'test.example.com',
    :osfamily        => 'RedHat',
    :operatingsystem => 'CentOS',
  } }

  context "nanorc" do
    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_file('/root/.nanorc') }
  end

end
