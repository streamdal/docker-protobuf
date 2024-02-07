#!/usr/bin/env sh
set -a

. ./deps.list
docker buildx build --push --platform=linux/amd64,linux/arm64 -t streamdal/protoc:latest \
    $(for v in $(cut -d '=' -f 1 < deps.list); do printf "%s " "--build-arg $v=$(printenv ${v})"; done) \
    ${@} .
