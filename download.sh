#!/bin/sh

versions=$(curl -s http://nodejs.org/dist/ -o - | grep 'v[0-9\.]*/' | sed -e 's/.*node-//' -e 's/<[^>]*>//' -e 's/\/<[^>]*>.*//')
for node_version in $versions; do
  save_dir="www/node/$node_version"
  mkdir -p $save_dir
  node_url="http://s3pository.heroku.com/node/$node_version/node-$node_version-linux-x64.tar.gz"
  echo $node_url
  curl $node_url -o "$save_dir/node-$node_version-linux-x64.tar.gz"
done
