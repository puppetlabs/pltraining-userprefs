require 'spec_helper'

describe "userprefs::defaults" do
  on_supported_os(facterversion: '3.6').each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('userprefs::bash').with(
        'password' => '$1$hgIZHl1r$tEqMTzoXz.NBwtW3kFv33/',
        'replace'  => true,
      ) }
      
      it { is_expected.to contain_class('userprefs::mg').with(
        'default' => false,
      ) }
      
      it { is_expected.to contain_class('userprefs::vim').with(
        'default' => false,
      ) }
    end
  end
end
