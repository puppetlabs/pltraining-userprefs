require 'spec_helper'

describe "userprefs::vim" do
  on_supported_os(facterversion: '3.6').each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      if os.start_with?('centos')
        it { is_expected.to compile.with_all_deps }

        it { is_expected.to contain_package('vim-enhanced').with(
          'ensure' => 'present',
        ) }

        it { is_expected.to contain_file('/root/.vim').with(
          'ensure' => 'directory',
          'recurse' => 'true',
          'source'  => 'puppet:///modules/userprefs/vim/vim',
        ) }

        it { is_expected.to contain_file('/root/.vimrc').with_content(
          /filetype plugin indent on/
        ) }
      end
    end
  end
end
