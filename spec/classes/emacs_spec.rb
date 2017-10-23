require 'spec_helper'

describe "userprefs::emacs" do
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

        it { is_expected.to contain_file('/bin/emacs').with(
          'ensure'  => 'link',
          'target'  => '/bin/mg',
          'require' => 'Package[mg]',
        ) }
      end
    end
  end
end
