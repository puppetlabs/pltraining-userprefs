require 'spec_helper'

describe 'userprefs::atom' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      case os_facts[:osfamily]
      when 'windows'
        it { is_expected.to compile.with_all_deps }
        it {
          is_expected.to contain_package('atom').with(
            'ensure'   => 'present',
            'provider' => 'chocolatey',
          )
        }
      end
    end
  end
end
