default['opsworks_jarsigner']['user']='opsworks_jarsigner'
default['opsworks_jarsigner']['group']='opsworks_jarsigner'
default[:awscli][:compile_time] = false
default[:awscli][:region] = "us-east-1"
default[:opsworks_jarsigner][:source][:file] = "tnt-jar-signer.tar.gz"
default[:opsworks_jarsigner][:source][:s3][:bucket] = "tnt-build-release"
default[:opsworks_jarsigner][:source][:s3][:path] = "tnt-jarsigner"
default[:opsworks_jarsigner][:source][:s3][:fullpath] = "#{node[:opsworks_jarsigner][:source][:s3][:path]}/#{node[:opsworks_jarsigner][:source][:s3][:file]}"