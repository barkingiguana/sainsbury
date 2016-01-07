nginx_site 'default' do
    enable false
end

template "#{node.nginx.dir}/sites-available/proxy" do
  source "proxy.erb"
  owner node.nginx.user
  group node.nginx.user
end

nginx_site 'proxy'
