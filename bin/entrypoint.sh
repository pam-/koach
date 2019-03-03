#!/bin/bash

# remove errant mysql server pids
rm -f ./tmp/pids/*.pid

# check that deps are installed as expected
bundle check || bundle install
yarn check || yarn install

exec "$@"
