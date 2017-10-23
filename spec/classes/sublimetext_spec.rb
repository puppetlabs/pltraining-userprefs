require 'spec_helper'

describe "userprefs::sublimetext" do
  on_supported_os(facterversion: '3.6').each do |os, os_facts|
    if os.start_with?('windows')
      context "on #{os}" do
        let(:facts) { os_facts }

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_package('sublimetext3').with(
          'ensure' => 'present',
          'provider' => 'chocolatey',
        ) }
      end
    end
  end
end
