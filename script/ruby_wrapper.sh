#!/bin/sh
#########################################################################
## This is a wrapper script around the ruby process to source the
## credentials so that the correct environment variables are defined
## before passenger starts rails
#########################################################################
set -e

#source /opt/env.sh

export SECRET_KEY_BASE=c538eeec29b5f96b8982b9f621914d9899a769d9f461b077881a07e73027bf7d83d7edc2935b7544f04ef00a04f45f5466500f98247e6a01fed346800a255289x
export KIDSMEETS_URI=106.186.117.131:27017
export KIDSMEETS_USERNAME=kidsmeets-admin
export KIDSMEETS_PASSWORD=k1dsmeets-admin
export KIDSMEETS_DATABASE=kidsmeets


export RUBY_HEAP_MIN_SLOTS=600000
export RUBY_HEAP_SLOTS_INCREMENT=250000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=59000000

exec "ruby" "$@"