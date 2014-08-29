require 'spec_helper'

# write up RSpec integration tests here

%w{
  git
  php5-fpm
  php5-common
  nginx
  python-selinux
  foobar
}.each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end
