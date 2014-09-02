require 'spec_helper'

# write up RSpec integration tests here
%w{
  git
  php5-fpm
  php5-common
  nginx
  python-selinux
}.each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

describe user('dash') do
  it { should exist }
  it { should belong_to_group 'dash' }
  it { should have_home_directory '/srv/linuxdash' }
end

describe group('dash') do
  it { should exist }
end

describe user('www-data') do
  it { should exist }
  it { should belong_to_group 'dash' }
end

describe file('/srv/linuxdash') do
  it { should be_directory }
  it { should be_mode 755 }
  it { should be_owned_by 'dash' }
  it { should be_grouped_into 'dash' }
end

describe file('/etc/php5/fpm/pool.d/linuxdash.conf') do
  it { should be_file }
  it { should be_mode 644 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  its(:content) { should match '[linuxdash]' }
end

describe file('/etc/nginx/conf.d/linuxdash.conf') do
  it { should be_file }
  it { should be_mode 644 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  its(:content) { should match 'root /srv/linuxdash/linuxdash;' }
end

%w{
  nginx
  php5-fpm
}.each do |srv|
  describe service(srv) do
    it { should be_enabled }
    it { should be_running }
  end
end

describe port('8088') do
  it { should be_listening }
end
