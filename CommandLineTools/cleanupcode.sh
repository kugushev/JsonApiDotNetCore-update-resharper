#!/bin/sh

set -e -u

D=$(dirname "$0")
dotnet exec --runtimeconfig "$D/cleanupcode.unix.runtimeconfig.json" "$D/cleanupcode.exe" "$@"