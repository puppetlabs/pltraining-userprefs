require 'spec_helper'

describe "userprefs::vim" do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end
    end
    context "vimrc" do
      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_file('/root/.vimrc') }
    end
  end
end

#  let(:node) { 'test.example.com' }
#  let(:facts) { {
#    :fqdn            => 'test.example.com',
#    :osfamily        => 'RedHat',
#    :operatingsystem => 'CentOS',
#  } }


