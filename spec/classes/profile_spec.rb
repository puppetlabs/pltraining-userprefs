require 'spec_helper'

describe "userprefs::profile" do
  on_supported_os(facterversion: '3.6').each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      if os.start_with?('centos')
        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_file('/root/.profile').with(
          'ensure'  => 'file',
          'replace' => 'false',
          'source'  => 'puppet:///modules/userprefs/shell/profile',
        ) }
      end
    end
  end
end
