require 'spec_helper'

describe 'userprefs::gitconfig' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      case os_facts[:osfamily]
      when 'CentOS'
        let(:facts) { os_facts.merge({ :home => '/root/.gitconfig', }) }

        it { is_expected.to compile }
      end
    end
  end
end
