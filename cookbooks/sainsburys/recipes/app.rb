# FIXME: I'd normally want to install a native package. This has the
# advantage that the artefact shipped is the binary that was tested. For the
# sake of this test I have taken a short-cut and compiled the app directly
# on the "production" servers. This creates an artefact which is built at
# different times on different machines, each of which is different from the
# artefact which was tested in CI.
#
# For the sake of completing the test in less than a day I'm going to skip
# creating the CI setup and building the native packages!
remote_directory '/usr/src/app' do
  source 'app'
end

bash "compile the Sainsburys application backend" do
  user 'root'
  code <<-EOF
    cd /usr/src/app
    /usr/local/go/bin/go build sainsburys.go
    mv /usr/src/app/sainsburys /usr/local/bin/sainsburys
  EOF
  creates "/usr/local/bin/sainsburys"
end

# FIXME: I'd normally want to use runit - or at least upstart - here. Again,
# for the same of keeping things simple, I've chosen to simply run this app
# in the background.
execute 'Sainsburys application backend' do
  command 'nohup /usr/local/bin/sainsburys &'
end
