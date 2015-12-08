#!/usr/bin/env bash

bower install tracekit
PACKAGE_VERSION=$(bower info tracekit version | tail -n 1 | cut -d "'" -f 2)
cd ./bower_components
rm -rf ./TraceKit
mv ./tracekit ./TraceKit
zip -r "../TraceKit-$PACKAGE_VERSION.zip" ./TraceKit/tracekit.js ./TraceKit/README.md
cd ..
scp "TraceKit-$PACKAGE_VERSION.zip" distrib@ftp.anakeen.com:/share/ftp/third-party/
echo $PACKAGE_VERSION > VERSION