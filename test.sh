#!/usr/bin/env bash

if ! test $@; then
    echo "test: mismatch: $@"
    exit 1
else
    echo "test: matched: $@"
fi
