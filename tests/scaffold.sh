#!/bin/bash
set -e

export SEMAPHORE_PROJECT_DIR=$PWD

npm install vue-cli -g

# Scaffold boilerplate with given templateName
cd "$PWD/tests"
node scaffold.js "$1"

# Install dependencies
cd "$PWD/builds/$1"
yarn

# Run unit/e2e testing
#yarn test

# Run webpack and build electron
yarn run build

# Clean up current scaffold
cd ..
rm -rf "$1"
