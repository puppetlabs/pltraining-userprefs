require 'spec_helper'

describe "userprefs::zsh" do
  let(:node) { 'test.example.com' }
  let(:facts) { {
    :fqdn            => 'test.example.com',
    :osfamily        => 'RedHat',
    :operatingsystem => 'CentOS',
  } }

  context "with a gitprompt" do
    let(:params) { { :gitprompt => true, } }

    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_file('/root/.zshrc.puppet').with_content %r{^PROMPT=.*git_prompt_string} }
  end

  context "without a gitprompt" do
    let(:params) { { :gitprompt => false, } }

    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_file('/root/.zshrc.puppet').without_content %r{^PROMPT=.*git_prompt_string} }
  end

end
