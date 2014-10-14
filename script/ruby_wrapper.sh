#!/bin/sh
#########################################################################
## This is a wrapper script around the ruby process to source the
## credentials so that the correct environment variables are defined
## before passenger starts rails
#########################################################################
set -e

. /opt/env.sh

export RUBY_HEAP_MIN_SLOTS=600000
export RUBY_HEAP_SLOTS_INCREMENT=250000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=59000000

exec "ruby" "$@"