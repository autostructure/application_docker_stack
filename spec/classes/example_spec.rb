require 'spec_helper'

describe 'application_docker_stack' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "application_docker_stack class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('application_docker_stack::params') }
          it { is_expected.to contain_class('application_docker_stack::install').that_comes_before('application_docker_stack::config') }
          it { is_expected.to contain_class('application_docker_stack::config') }
          it { is_expected.to contain_class('application_docker_stack::service').that_subscribes_to('application_docker_stack::config') }

          it { is_expected.to contain_service('application_docker_stack') }
          it { is_expected.to contain_package('application_docker_stack').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'application_docker_stack class without any parameters on Solaris/Nexenta' do
      let(:facts) do
        {
          :osfamily        => 'Solaris',
          :operatingsystem => 'Nexenta',
        }
      end

      it { expect { is_expected.to contain_package('application_docker_stack') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
