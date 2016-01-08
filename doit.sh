#!/bin/sh

vagrant destroy -f
find nodes -type f -name "*.json" -delete
berks vendor
vagrant up
curl http://127.0.0.1:8282/
echo
curl http://127.0.0.1:8282/
