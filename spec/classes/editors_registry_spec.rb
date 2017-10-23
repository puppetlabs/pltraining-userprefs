require 'spec_helper'

describe "userprefs::editors_registry" do
  on_supported_os(facterversion: '3.6').each do |os, os_facts|
    if os.start_with?('windows')
      context "on #{os}" do
        let(:facts) { os_facts }

        it { is_expected.to compile.with_all_deps }

        it { is_expected.to contain_registry::value('Filetype description').with(
          'key'   => 'HKLM\Software\Classes\sourcecode',
          'value' => '(Default)',
          'data'  => 'Source Code',
        ) }

        it { is_expected.to contain_registry::value('Puppet Manifests').with(
          'key'   => 'HKLM\Software\Classes\.pp',
          'value' => '(Default)',
          'data'  => 'sourcecode',
        ) }

        it { is_expected.to contain_registry::value('YAML files').with(
          'key'   => 'HKLM\Software\Classes\.yaml',
          'value' => '(Default)',
          'data'  => 'sourcecode',
        ) }

        it { is_expected.to contain_registry::value('ERB Templates').with(
          'key'   => 'HKLM\Software\Classes\.erb',
          'value' => '(Default)',
          'data'  => 'sourcecode',
        ) }

        it { is_expected.to contain_registry::value('Ruby Soruce Code').with(
          'key'   => 'HKLM\Software\Classes\.rb',
          'value' => '(Default)',
          'data'  => 'sourcecode',
        ) }
      end
    end
  end
end
