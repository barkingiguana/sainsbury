nginx_site 'default' do
    enable false
end

app_nodes = search :node, "role:app"
template "#{node.nginx.dir}/sites-available/proxy" do
  source "proxy.erb"
  variables app_nodes: app_nodes
  owner node.nginx.user
  group node.nginx.user
end

nginx_site 'proxy'
