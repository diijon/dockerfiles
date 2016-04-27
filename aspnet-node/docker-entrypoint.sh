#!/bin/bash

# Add node as command if needed
if [ "${1:0:1}" = '-' ]; then
	set -- node "$@"
fi

# Drop root privileges for node, npm, yo
# allow the container to be started with `--user`
if [ "$1" = 'node' -o "$1" = 'npm' -o "$1" = 'yo' ] && [ "$(id -u)" = '0' ]; then
	set -- gosu devx "$@"
fi

# Run command
exec "$@"
