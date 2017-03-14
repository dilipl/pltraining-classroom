require 'spec_helper'

describe 'classroom' do
  context 'agent' do
    let(:node) { 'test.example.com' }
    let(:facts) { { :servername => 'time.nist.gov', } }

    it { should compile }

    it { is_expected.to contain_file("/etc/puppet").with(
        ensure:  'absent',
        recurse: true,
        force:   true,
    )}
  end

  context 'master' do
    let(:node) { 'test.example.com' }
    let(:facts) { {
      :servername => 'time.nist.gov',
      :classroom__offline => true,
    } }
    let(:params) { { } }

    it { should compile }
    it { should contain_file('/root/.gemrc').with('ensure' => 'file') }

  end
end
#    it { is_expected.to contain_file("/usr/bin/pip-python").with(
#        ensure: "link",
#        target: "/usr/bin/pip",
#    )}

#    ['/root/.gemrc', '/opt/puppetlabs/puppet/etc/gemrc'].each do |x| it {
#      is_expected.to contain_file(x).with({
#        'ensure' => 'file',
#        })
#      }
#    end


#    it { is_expected.to contain_file_line("Remove rubygems.org from $gemrc_file when offline").with(
#        ensure:            "absent",
#        path:              "$gemrc_file",
#        match:             "\\-\\ https:\\/\\/rubygems\\.org",
#        match_for_absence: true,
#      )}

#    it { is_expected.to contain_ini_setting("environment timeout").with(
#        ensure:  "present",
#        path:    "$classroom::confdir/puppet.conf",
#        section: "main",
#        setting: "environment_timeout",
#        value:   "0",
#        notify:  "Service[pe-puppetserver]",
#      )}

#    it { is_expected.to contain_file("$classroom::codedir/environments/production/manifests/classroom.pp")
#      .with(
#        ensure: "file",
#        source: "puppet:///modules/classroom/classroom.pp",
#      )
#    }

#    it { is_expected.to contain_file("$environmentspath").with(
#        ensure: "directory",
#        mode:   "1777",
#      )}
#  end

#  context 'adserver' do
#    let(:node) { 'test.example.com' }
#    let(:facts) { {
#      :servername => 'time.nist.gov',
#    } }
#    it { should compile }
#  end

#  context 'proxy' do
#    let(:node) { 'test.example.com' }
#    let(:facts) { {
#      :servername => 'time.nist.gov',
#    } }
#    it { should compile }
#  end
