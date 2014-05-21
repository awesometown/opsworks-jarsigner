#
# Cookbook Name:: opsworks_jarsigner
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#
case node[:platform]
when 'debian', 'ubuntu'
  execute "apt-get-update-periodic" do
    command "apt-get update"
    ignore_failure true
    action :nothing
  end.run_action(:run)
end

case node[:platform]
when 'redhat', 'centos', 'fedora', 'amazon'
  cmd1 = "yum -y install glibc.i686 glibc-devel.i686 libstdc++.i686 zlib-devel.i686 ncurses-devel.i686 libX11-devel.i686 libXrender.i686 libXrandr.i686 libstdc++44.i686 ncurses-devel.x86_64 zlib.i686 libX11-devel.x86_64"
  r = execute "install android depdencies" do
    command cmd1
  end
  r.run_action(:run)
end

case node[:platform]
when 'debian', 'ubuntu'
  file = '/usr/bin/zip'
  cmd = 'apt-get install -y zip ia32-libs'
when 'redhat', 'centos', 'fedora', 'amazon'
  file = '/usr/bin/zip'
  cmd = 'yum -y install zip ia32-libs'
end

execute 'install zip' do
  command cmd
  not_if {::File.exists?(file)}
end.run_action(:run)


# case node[:platform]
# when 'debian','ubuntu'
# 	file = '/usr/local/bin/aws'
# 	cmd = "apt-get install -y python-pip && pip install awscli"
# when 'redhat','centos','fedora','amazon'
# 	file = "/usr/bin/aws"
# 	cmd ="yum -y install python-pip && pip install awscli"
# end