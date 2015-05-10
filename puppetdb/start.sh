#!/bin/sh
set -x

#  -c ${CONFIG}
# shellcheck disable=SC2086
exec /usr/bin/java "
  -cp /usr/share/puppetdb/puppetdb.jar
  clojure.main
  -m com.puppetlabs.puppetdb.core
  services
  --chuid puppetdb
  -XX:OnOutOfMemoryError='kill -9 %p'
  -Xms=192m
  -Xmx=512m
" 2>&1
