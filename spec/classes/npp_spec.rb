require 'spec_helper'

describe "userprefs::npp" do
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

  it { is_expected.to compile.with_all_deps }

end
