require_relative '../spec_helper'

describe process('openvpn') do
  its(:args) { should match /--config \/etc\/openvpn\/pingworks.conf/ }
end

describe routing_table do
  it do
    should have_entry(
      :destination => $node['pw_openvpn']['tunsubnet'],
      :interface   => 'tun0',
      :gateway     => $node['pw_openvpn']['tungw']
    )
    should have_entry(
      :destination => $node['pw_openvpn']['tunsubnet'],
      :interface   => 'tun0',
      :gateway     => $node['pw_openvpn']['tungw']
    )
    should have_entry(
      :destination => $node['pw_openvpn']['tungw'],
      :interface   => 'tun0',
    )
  end
end

describe file('/etc/openvpn/keys/ta-server.key') do
  it { should be_mode '600' }
end

describe file("/etc/openvpn/keys/#{$node['pw_openvpn']['clientname']}.key") do
  it { should be_mode '600' }
end
