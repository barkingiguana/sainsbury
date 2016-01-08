require 'serverspec'

set :backend, :exec

describe "Nginx" do
  it "is listening on port 80" do
    expect(port(80)).to be_listening
  end

  it "has a running service of nginx" do
    expect(service("nginx")).to be_running
  end

  it "defines the app nodes as servers in the sainsburys upstream" do
    expect(file('/etc/nginx/sites-enabled/proxy')).to contain('server 10.0.0.75:8484').from(/^upstream sainsburys {$/).to(/^}$/)
  end
end
