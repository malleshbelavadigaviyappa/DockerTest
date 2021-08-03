#!/bin/bash
cd /solr-8.2.0/bin/
# The options -d /var/solr -s /var/solr/data not working. So solr use default home folder /solr-8.2.0/server/solr
./solr start -f -p 8983 -force
