require 'spec_helper'

describe "userprefs::mg" do
  on_supported_os(facterversion: '3.6').each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      let(:pre_condition) { 'include epel' }

      if os.start_with?('centos')
        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_package('mg').with(
          'ensure'  => 'present',
          'require' => 'Class[Epel]',
        ) }
      end
    end
  end
end
