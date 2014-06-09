#
# Cookbook Name:: celery-flower
# Recipe:: apache
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

include_recipe  'apache2'
include_recipe  'apache2::mod_ssl'
include_recipe  'apache2::mod_proxy'
include_recipe  'apache2::mod_proxy_http'
include_recipe  'apache2::mod_rewrite'

node.override['poise-proxy']['provider'] = 'apache'
node.override['poise-proxy']['ssl_enabled'] = node['celery-flower']['ssl']['enable']

poise_proxy node['fqdn'] do 
  port node['celery-flower']['listen_port']
end