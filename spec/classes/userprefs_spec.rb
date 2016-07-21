require 'spec_helper'

describe "userprefs" do
  let(:node) { 'test.example.com' }

  context "when applied on CentOS 7" do
    let(:facts) { {
      :fqdn            => 'test.example.com',
      :osfamily        => 'RedHat',
      :operatingsystem => 'CentOS',
    } }

    context "declaring bash and vim" do
      let(:params) { { :shell => 'bash', :editor => 'vim', } }

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('userprefs::bash') }
      it { is_expected.to contain_class('userprefs::vim') }
    end

    context "declaring zsh and vim" do
      let(:params) { { :shell => 'zsh', :editor => 'vim', } }

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('userprefs::zsh') }
      it { is_expected.to contain_class('userprefs::vim') }
    end

    context "declaring bash with a gitprompt" do
      let(:params) { { :shell => 'bash', :gitprompt => true, } }

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('userprefs::bash').with_gitprompt(true) }
    end

    context "declaring bash without a gitprompt" do
      let(:params) { { :shell => 'bash', :gitprompt => false, } }

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('userprefs::bash').with_gitprompt(false) }
    end

    context "declaring zsh with a gitprompt" do
      let(:params) { { :shell => 'zsh', :gitprompt => true, } }

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('userprefs::zsh').with_gitprompt(true) }
    end

    context "declaring bash without a gitprompt" do
      let(:params) { { :shell => 'zsh', :gitprompt => false, } }

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('userprefs::zsh').with_gitprompt(false) }
    end

  end

  context "when applied on Windows" do
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

    context "declaring Atom" do
      let(:params) { { :editor => 'atom', } }

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('userprefs::atom') }
    end

    context "declaring gVim" do
      let(:params) { { :editor => 'gvim', } }

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('userprefs::gvim') }
    end

    context "declaring Notepad++" do
      let(:params) { { :editor => 'npp', } }

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('userprefs::npp') }
    end

    context "declaring SublimeText" do
      let(:params) { { :editor => 'sublimetext', } }

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('userprefs::sublimetext') }
    end

    context "declaring with a shell" do
      let(:params) { { :shell => 'bash', } }

      it { is_expected.to compile.and_raise_error(/not supported/) }
    end

  end

end
