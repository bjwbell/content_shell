#!/bin/sh
virtualenv --no-site-packages bb-master

cd bb-master

./bin/pip install --pre buildbot[bundle]
./bin/buildbot create-master master
git clone https://github.com/bjwbell/ironframe
mv ironframe/buildbot/master/master.cfg master/master.cfg
rm -rf ironframe

# Start the master
./bin/buildbot start master

cd ../

virtualenv --no-site-packages bb-worker
cd bb-worker
./bin/pip install --pre buildbot-worker
./bin/buildbot-worker create-worker worker localhost slave0 pass

# Start the worker
./bin/buildbot-worker start worker
