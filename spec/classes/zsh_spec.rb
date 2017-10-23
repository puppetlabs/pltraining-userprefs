require 'spec_helper'

describe "userprefs::zsh" do
  on_supported_os(facterversion: '3.6').each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      if os.start_with?('centos')
        it { is_expected.to compile.with_all_deps }

        describe "with a gitprompt" do
          let(:params) { { :gitprompt => true, } }

          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_file('/root/.zshrc.puppet').with_content(
            /^GIT_PROMPT_SYMBOL=/
          ) }
        end

        describe "without a gitprompt" do
          let(:params) { { :gitprompt => false, } }

          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_file(
            '/root/.zshrc.puppet').without_content %r{^PROMPT=.*git_prompt_string} }
        end
      end
    end
  end
end

