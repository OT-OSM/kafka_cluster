control 'zookeeper-01' do
    impact 1.0
    title 'Zookeeper file permissions'
    desc 'Zookeeper file permission should be valid'

    describe file('/opt/zookeeper') do
        it { should exist }
        its('owner') { should eq 'kafka' }
        its('group') { should eq 'kafka' }
        its('mode') { should cmp '0755' }
    end

    describe file('/etc/systemd/system/zookeeper.service') do
        it { should exist }
        its('owner') { should eq 'root' }
        its('group') { should eq 'root' }
        its('mode') { should cmp '0644' }
    end

    describe file('/opt/zookeeper/myid') do
        it { should exist }
        its('owner') { should eq 'kafka' }
        its('group') { should eq 'kafka' }
        its('mode') { should cmp '0644' }
    end

    describe file('/opt/kafka/config/zookeeper.properties') do
        it { should exist }
        its('owner') { should eq 'kafka' }
        its('group') { should eq 'kafka' }
        its('mode') { should cmp '0644' }
    end
end

control 'zookeeper-02' do
    impact 1.0
    title 'Zookeeper service status'
    desc 'Zookeeper service should be up and running'

    describe service('zookeeper') do
        it { should be_installed }
        it { should be_enabled }
        it { should be_running }
    end
end

control 'zookeeper-03' do
    impact 1.0
    title 'Zookeeper port status'
    desc 'zookeeper port should be listening on 0.0.0.0'

    describe port(2181) do
        its('protocols') { should include 'tcp' }
        its('addresses') { should include '0.0.0.0' }
    end
end
