require 'spec_helper'

describe 'userprefs::gitconfig' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      case os_facts[:osfamily]
      when 'RedHat'
        it { is_expected.to compile }
      end
    end
  end
end
