require 'spec_helper'

describe "userprefs::windows_editor" do
  let(:node) { 'test.example.com' }
  let(:facts) { {
    :fqdn            => 'test.example.com',
    :osfamily        => 'windows',
    :operatingsystem => 'windows',
  } }

  # fake out the file checks so that they validate as absolute even though they're Windows paths
  before :each do
    Puppet[:autosign] = false
    Puppet::Util::Platform.stubs(:windows?).returns true
  end

  context "when declaring Atom" do
    let(:params) { { :editor => 'atom', } }

    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_class('userprefs::atom') }
  end

  context "when declaring gVim" do
    let(:params) { { :editor => 'gvim', } }

    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_class('userprefs::gvim') }
  end

  context "when declaring Notepad++" do
    let(:params) { { :editor => 'npp', } }

    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_class('userprefs::npp') }
  end

  context "when declaring SublimeText" do
    let(:params) { { :editor => 'sublimetext', } }

    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_class('userprefs::sublimetext') }
  end

end
