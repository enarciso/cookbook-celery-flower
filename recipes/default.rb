#
# Cookbook Name:: celery-flower
# Recipe:: default
#
# Copyright 2014, Eugene Narciso
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'build-essential'
include_recipe 'python'
include_recipe 'runit'

user node['celery-flower']['user'] do
  comment "default user to run celery-flower"
  home "/home/#{node['celery-flower']['user']}"
  shell "/bin/bash"
end

group node['celery-flower']['group']
directory "/var/lib/celery-flower"

case node['platform']
  when 'debian'
    %w{python-dev libffi-dev ssl-cert}.each do |pkg|
      package pkg
    end
  when 'rhel', 'fedora', 'centos'
    %w{python-devel libffi-devel crypto-utils}.each do |pkg|
      package pkg
    end
end

python_virtualenv 'flower-virtualenv' do
  owner node['celery-flower']['user']
  group node['celery-flower']['group']
  path node['celery-flower']['virtualenv']
  not_if { ::File.exists?("#{node['celery-flower']['virtualenv']}/bin/pip") }
end

#FIXME: pip install pyopenssl breaks in rhel platform
%w{ requests pyopenssl flower}.each do |pip_pkg|
  python_pip pip_pkg do
    virtualenv node['celery-flower']['virtualenv']
    action :install
    not_if { ::File.exists?("#{node['celery-flower']['virtualenv']}/bin/flower") }
  end
end

broker_url = sprintf("%s://%s:%s@%s:%d/%s",
  node['celery-flower']['broker']['protocol'],
  node['celery-flower']['broker']['username'],
  node['celery-flower']['broker']['password'],
  node['celery-flower']['broker']['host'],
  node['celery-flower']['broker']['port'],
  node['celery-flower']['broker']['vhost']
)

flower_cmd = sprintf("flower --log_file_prefix='%s' --port='%s' --auto_refresh --persistent --db='%s' --broker='%s'",
  node['celery-flower']['log_path'],
  node['celery-flower']['listen_port'],
  node['celery-flower']['db_path'],
  broker_url
)

if node['celery-flower']['auth']
  flower_cmd = sprintf("%s --auth='%s'",
    flower_cmd,
    node['celery-flower']['auth']
  )
elsif node['celery-flower']['basic_auth']
  flower_cmd = sprintf("%s --basic_auth='%s'",
    flower_cmd,
    node['celery-flower']['basic_auth']
  )
end

if node['celery-flower']['broker_api']['enable']
  flower_cmd = sprintf("%s --broker_api='%s://%s:%s@%s:%s/api/'",
  	flower_cmd,
    node['celery-flower']['broker_api']['protocol'],
    node['celery-flower']['broker']['username'],
    node['celery-flower']['broker']['password'],
    node['celery-flower']['broker']['host'],
    node['celery-flower']['broker_api']['port']
  )
end

runit_service "celery-flower" do
  default_logger true
  options({
    :virtualenv => node['celery-flower']['virtualenv'],
    :flower_cmd => flower_cmd,
    :user => node['celery-flower']['user'],
    :group => node['celery-flower']['group']
  })
end
