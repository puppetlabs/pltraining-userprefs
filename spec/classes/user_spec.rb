require 'spec_helper'

describe "userprefs::user" do
  on_supported_os(facterversion: '3.6').each do |os, os_facts|
    if os.start_with?('centos')
      context "on #{os}" do
        let(:facts) { os_facts }

        it { is_expected.to compile.with_all_deps }
      end
    end
  end
end
