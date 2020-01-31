control 'kafka-01' do
    impact 1.0
    title 'Java package check'
    desc 'Java should be installed'

    describe command('java -version') do
        its('exit_status') { should eq 0 }
    end
end

control 'kafka-02' do
    impact 1.0
    title 'Kafka user and file permissions'
    desc 'Kafka user should exist and file permission should be valid'

    describe user('kafka') do
        it { should exist }
        its('shell') { should eq '/sbin/nologin' }
    end

    describe file('/var/log/kafka') do
        it { should exist }
        its('owner') { should eq 'kafka' }
        its('group') { should eq 'kafka' }
        its('mode') { should cmp '0755' }
    end

    describe file('/etc/systemd/system/kafka-server.service') do
        it { should exist }
        its('owner') { should eq 'root' }
        its('group') { should eq 'root' }
        its('mode') { should cmp '0644' }
    end

    describe file('/opt/kafka/config/server.properties') do
        it { should exist }
        its('owner') { should eq 'kafka' }
        its('group') { should eq 'kafka' }
        its('mode') { should cmp '0644' }
    end
end

control 'kafka-03' do
    impact 1.0
    title 'Kafka service status'
    desc 'Kafka service should be up and running'

    describe service('kafka-server') do
        it { should be_installed }
        it { should be_enabled }
        it { should be_running }
      end
end

control 'kafka-04' do
    impact 1.0
    title 'Kafka port status'
    desc 'kafka port should be listening on 0.0.0.0'

    describe port(9092) do
        its('protocols') { should include 'tcp' }
        its('addresses') { should include '0.0.0.0' }
    end
end