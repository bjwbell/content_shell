#!/bin/sh

# Start the master
cd bb-master && ./bin/buildbot start master

# Start the worker
cd bb-worker && ./bin/buildbot-worker start worker
