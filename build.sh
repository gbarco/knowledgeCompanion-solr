#!/bin/bash
set -e
if [ ! -z "" ]; then
  build_arg="--build-arg SOLR_DOWNLOAD_SERVER="
fi
cmd="docker build --pull --rm=true  --tag docker-solr/docker-solr:6.2.0-alpine ."
echo "running: $cmd"
$cmd
for t in 6.2.0-alpine 6.2-alpine 6-alpine; do
  if [[ "$t" = "6.2.0-alpine" ]]; then
    continue
  fi
  cmd="docker tag docker-solr/docker-solr:6.2.0-alpine docker-solr/docker-solr:$t"
  echo "running: $cmd"
  $cmd
done
