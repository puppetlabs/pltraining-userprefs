require 'spec_helper'

describe "userprefs::nano" do
  on_supported_os(facterversion: '3.6').each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      if os.start_with?('centos')
        it { is_expected.to compile.with_all_deps }

        it { is_expected.to contain_package('nano').with(
          'ensure' => 'present',
        ) } 

        it { is_expected.to contain_file('/root/.nanorc') }

        it { is_expected.to contain_file('/root/.nano.d').with(
          'ensure' => 'directory',
        ) }

        it { is_expected.to contain_file('/root/.nano.d/puppet.nanorc').with(
          'ensure' => 'file',
          'source' => 'puppet:///modules/userprefs/nano/puppet.nanorc',
        ) }
      end
    end
  end
end
