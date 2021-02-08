require 'spec_helper'

describe 'userprefs::emacs' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      
      case os_facts[:osfamily]
      when 'RedHat'
        it { is_expected.to compile.with_all_deps }
      end
    end
  end
end
