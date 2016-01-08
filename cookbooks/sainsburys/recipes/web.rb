nginx_site 'default' do
    enable false
end

app_nodes = search :node, "role:app"
app_ips = app_nodes.map do |node|
  node[:network][:interfaces][:eth1][:addresses].detect{ |k,v| v[:family] == "inet" }.first
end

template "#{node.nginx.dir}/sites-available/proxy" do
  source "proxy.erb"
  variables app_nodes: app_ips
  owner node.nginx.user
  group node.nginx.user
end

nginx_site 'proxy'
