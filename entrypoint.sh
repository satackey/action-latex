#!/bin/sh

echo Pull the Docker image
docker pull $BUILD_IMAGE

ARG_ENTRYPOINT=""
if [ -n "$BUILD_ENTRYPOINT" ]; then
    ARG_ENTRYPOINT="--entrypoint \"$BUILD_ENTRYPOINT\""
fi

ARG_MOUNT=""
BUILD_DIR="$PWD"
if [ -n "$HOST_WORKSPACE" ]; then
    ARG_MOUNT="-v \"$HOST_WORKSPACE\":/custom/workspace"
    BUILD_DIR="/custom/workspace"
fi

echo "$BUILD_FILES" | xargs -I{TEX_FILE} -P $(nproc) -t sh -c "
    WORKDIR=\"$BUILD_DIR/\$(dirname ./{TEX_FILE})\"
    docker run --rm \\
        --volumes-from $(basename $(cat /proc/1/cpuset)) \\
        $ARG_ENTRYPOINT \\
        $ARG_MOUNT \\
        --workdir=\"\$WORKDIR\" \\
        $BUILD_IMAGE \\
        $BUILD_ARGS \\
        \$(basename {TEX_FILE})
"
