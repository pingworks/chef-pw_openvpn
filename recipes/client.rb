include_recipe 'pw_openvpn::openvpn-ca'

package 'openvpn'

template '/etc/openvpn/pingworks.conf' do
  source 'openvpn-client-conf.erb'
  owner 'root'
  group 'root'
  mode 00644
end

service 'openvpn' do
  supports :status => true
  action [ :enable, :start ]
end

cookbook_file '/etc/default/openvpn' do
  source 'default-openvpn'
  owner 'root'
  group 'root'
  mode 00644
  notifies :restart, 'service[openvpn]', :delayed
end
