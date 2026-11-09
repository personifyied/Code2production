#!/bin/sh
# Readable project history from git, at zero Claude usage.
# Usage: sh scripts/c2p-log.sh            (everything)
#        sh scripts/c2p-log.sh M1-done     (since a milestone tag)
range=${1:+$1..HEAD}
git log $range --no-merges --date=short --format='%ad  %s' 
