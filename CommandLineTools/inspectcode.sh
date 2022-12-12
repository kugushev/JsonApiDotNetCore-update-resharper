#!/bin/sh

set -e -u

D=$(dirname "$0")
dotnet exec --runtimeconfig "$D/inspectcode.unix.runtimeconfig.json" "$D/inspectcode.exe" "$@"