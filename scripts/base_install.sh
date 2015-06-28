#!/bin/sh

sudo apt-get update
sudo apt-get install -y aptitude

sudo aptitude update
sudo aptitude upgrade -y

sudo aptitude install -y \
  vim git build-essential libpq-dev

# Configure git
git config --global color.ui auto
git config --global credential.helper 'cache --timeout=360000'
