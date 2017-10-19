require 'spec_helper'

describe "userprefs::bash" do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end
    end

    context "with a gitprompt" do
      let(:params) { { :gitprompt => true, } }

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_file('/root/.bashrc.puppet')
        .with_content %r{^export PS1=.*git_color} }
    end

    context "without a gitprompt" do
      let(:params) { { :gitprompt => false, } }

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_file('/root/.bashrc.puppet')
        .without_content %r{^export PS1=.*git_color} }
    end
  end
end
  #let(:node) { 'test.example.com' }
  #let(:facts) { {
  #  :fqdn            => 'test.example.com',
  #  :osfamily        => 'RedHat',
  #  :operatingsystem => 'CentOS',
  #} }
