#!/usr/bin/env bash

die () {
    echo "find-latest-tag.sh: $@"
    exit 1
}

repo=${1}
query=${2}
if [ -z "${query}" ]; then
    query=''
fi

all_tags="$(git ls-remote --tags --refs --exit-code --sort=-v:refname ${1} \
    | grep -oE 'refs/tags/(.+)$' \
    | sed 's/refs\/tags\///')"

tag="$(printf "%s\n" $all_tags \
    | grep -oE "${query}" \
    | sort -V \
    | tail -1)"

if [ -z "${tag}" ]; then
    die "cannot find tag matching regex: ${2}"
fi

echo "tag=${tag}" >> $GITHUB_OUTPUT
