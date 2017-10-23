require 'spec_helper'

describe "userprefs::bash" do
  on_supported_os(facterversion: '3.6').each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile.with_all_deps }

      if os.start_with?('centos')
        describe "with a gitprompt" do
          let(:params) { { :gitprompt => true, } }

          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_file('/root/.bashrc.puppet')
            .with_content %r{^export PS1=.*git_color} }
        end

        describe "without a gitprompt" do
          let(:params) { { :gitprompt => false, } }

          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_file('/root/.bashrc.puppet')
            .without_content %r{^export PS1=.*git_color} }
        end
      end
    end
  end
end
