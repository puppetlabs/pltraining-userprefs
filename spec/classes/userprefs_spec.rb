require 'spec_helper'

describe "userprefs" do
  on_supported_os(facterversion: '3.6').each do |os, os_facts|
    if os.start_with?('centos')
      context "on #{os}" do
        let(:facts) { os_facts }

        it { is_expected.to compile.with_all_deps }

        describe 'declaring bash and vim' do
          let(:params) { {
              'shell'  => 'bash',
              'editor' => 'vim',
            } }

          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_class('userprefs::bash') }
          it { is_expected.to contain_class('userprefs::vim') }
        end

        describe 'declaring zsh and vim' do
          let(:params) { {
              'shell'  => 'zsh',
              'editor' => 'vim',
            } }

          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_class('userprefs::zsh') }
          it { is_expected.to contain_class('userprefs::vim') }
        end

        describe 'declaring bash with gitprompt' do
          let(:params) { {
              'shell'     => 'bash',
              'gitprompt' => true,
            } }

          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_class('userprefs::bash').with_gitprompt(true) }
        end

        describe 'declaring bash without gitprompt' do
          let(:params) { {
              'shell'     => 'bash',
              'gitprompt' => false,
            } }

          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_class('userprefs::bash').with_gitprompt(false) }
        end

        describe 'declaring zsh with gitprompt' do
          let(:params) { {
              'shell'     => 'zsh',
              'gitprompt' => true,
            } }

          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_class('userprefs::zsh').with_gitprompt(true) }
        end

        describe 'declaring zsh without gitprompt' do
          let(:params) { {
              'shell'     => 'zsh',
              'gitprompt' => false,
            } }

          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_class('userprefs::zsh').with_gitprompt(false) }
        end
      end
    end

    if os.start_with?('windows')
      context "on #{os}" do
        let(:facts) { os_facts }

        it { is_expected.to compile.with_all_deps }

        describe "declaring Atom" do
          let(:params) { { :editor => 'atom', } }

          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_class('userprefs::atom') }
        end

        describe "declaring Atom" do
          let(:params) { { :editor => 'atom', } }

          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_class('userprefs::atom') }
        end

        describe "declaring gVim" do
          let(:params) { { :editor => 'gvim', } }

          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_class('userprefs::gvim') }
        end

        describe "declaring Notepad++" do
          let(:params) { { :editor => 'npp', } }

          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_class('userprefs::npp') }
        end

        describe "declaring SublimeText" do
          let(:params) { { :editor => 'sublimetext', } }

          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_class('userprefs::sublimetext') }
        end

        describe "declaring with a shell" do
          let(:params) { { :shell => 'bash', } }

          it { is_expected.to compile.and_raise_error(/not supported/) }
        end
      end
    end
  end
end
