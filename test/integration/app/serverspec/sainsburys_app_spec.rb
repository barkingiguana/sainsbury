require 'serverspec'

set :backend, :exec

describe "Sainsburys Backend App" do
  it "is listening on port 8484" do
    expect(port(8484)).to be_listening
  end
end
