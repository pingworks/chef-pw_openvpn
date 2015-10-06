directory '/etc/openvpn/keys' do
  owner 'root'
  group 'root'
  mode 00755
  recursive true
  action :create
end

cookbook_file '/etc/openvpn/keys/ca.crt' do
  source 'ca.crt'
  owner 'root'
  group 'root'
  mode 00644
end

cookbook_file '/etc/openvpn/keys/ta-server.key' do
  source 'server.key'
  owner 'root'
  group 'root'
  mode 00600
end

cookbook_file "/etc/openvpn/keys/#{node['pw_openvpn']['clientname']}.crt" do
  source 'client.crt'
  owner 'root'
  group 'root'
  mode 00644
end

cookbook_file "/etc/openvpn/keys/#{node['pw_openvpn']['clientname']}.key" do
  source 'client.key'
  owner 'root'
  group 'root'
  mode 00600
end
