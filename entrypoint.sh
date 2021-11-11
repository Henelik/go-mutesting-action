#!/bin/bash

# Get config from environment variables and prepare run
cmd=""

if [ -n "$BLACKLIST" ]; then
    cmd="$cmd --blacklist=$BLACKLIST"
fi

if [ -n "$DISABLED" ]; then
    cmd="$cmd --disable=$DISABLED"
fi

if [ -n "$OUTPUT" ]; then
    arrOutput=("${OUTPUT//,/ }")
    sorted=($(echo "${arrOutput[@]}"| tr " " "\n" | sort -n | tr "\n" " "))
    if [ "${sorted[0]}" == "debug" ]; then
        cmd="$cmd --debug"
    fi
    if [ "${sorted[1]}" == "verbose" ]; then
        cmd="$cmd --verbose"
    fi
fi

# Trim spaces
cmd=$(echo "$cmd" | xargs)

# Run go-mutesting
if [ -n "$cmd" ]; then
    echo "Submitted options are $cmd"
fi
echo "Will run mutation tests on $TARGETS"

/usr/local/go/bin/go-mutesting "$TARGETS" "$cmd"
