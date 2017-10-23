require 'spec_helper'

describe "userprefs::npp" do
  on_supported_os(facterversion: '3.6').each do |os, os_facts|
    if os.start_with?('windows')
      context "on #{os}" do
        let(:facts) { os_facts }

        before :each do
          Puppet[:autosign] = false
          Puppet::Util::Platform.stubs(:windows?).returns true
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_package('notepadplusplus').with(
          'ensure'   => 'present',
          'provider' => 'chocolatey',
        ) }

        it { is_expected.to contain_file(
          'C:/Users/Administrator/AppData/Roaming/Notepad++').with(
            'ensure' => 'directory',
            'require' => 'Package[Notepadplusplus]',
        ) }

        it { is_expected.to contain_file(
          'C:/Users/${user}/AppData/Roaming/Notepad++/userDefineLang.xml').with(
            'ensure' => 'file',
            'replace' => 'false',
            'source'  => 'puppet:///modules/userprefs/npp/userDefineLang.xml',
            'require' => 'Package[Notepadplusplus]',
        ) }
      end
    end
  end
end
