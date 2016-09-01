require 'spec_helper'

describe "userprefs::editors" do
  let(:node) { 'test.example.com' }
  let(:facts) { {
    :fqdn            => 'test.example.com',
    :osfamily        => 'windows',
    :operatingsystem => 'windows',
  } }

  it { is_expected.to compile.with_all_deps }

end
