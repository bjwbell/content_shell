#!/bin/sh

# Start the master
cd bb-master && ./bin/buildbot start master
cd ..

# Start the worker
cd bb-worker && ./bin/buildbot-worker start worker
