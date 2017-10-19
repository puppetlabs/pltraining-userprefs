require 'spec_helper'

describe "userprefs::windows_editor" do
  on_supported_os(facterversion: '3.6').each do |os, os_facts|
    if os == 'windows'
      context "on #{os}" do
        let(:facts) { os_facts }

        it { is_expected.to compile.with_all_deps }

        describe "when declaring Atom" do
          let(:params) { { :editor => 'atom', } }

          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_class('userprefs::atom') }
        end

        describe "when declaring gVim" do
          let(:params) { { :editor => 'gvim', } }

          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_class('userprefs::gvim') }
        end

        describe "when declaring Notepad++" do
          let(:params) { { :editor => 'npp', } }

          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_class('userprefs::npp') }
        end

        describe "when declaring SublimeText" do
          let(:params) { { :editor => 'sublimetext', } }
  
          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_class('userprefs::sublimetext') }
        end
      end
    end
  end
end
