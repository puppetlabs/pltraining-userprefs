require 'spec_helper'

describe "userprefs::emacs" do
  let(:node) { 'test.example.com' }
  let(:facts) { {
    :fqdn                   => 'test.example.com',
    :osfamily               => 'RedHat',
    :operatingsystem        => 'CentOS',
    :operatingsystemrelease => '7.2.1511'
  } }

  it { is_expected.to compile.with_all_deps }

end
