#!/bin/sh
docker pull $BUILD_IMAGE

BUILD_FILE_CMD="latexmk $LATEXMK_OPTIONS {}"

DEFAULT_WORKSPACE="$RUNNER_WORKSPACE/$(basename $RUNNER_WORKSPACE)"
HOST_WORKSPACE=${HOST_WORKSPACE:-$DEFAULT_WORKSPACE}

docker run \
    -v "$HOST_WORKSPACE":"$WORKDIR" \
    --workdir="$WORKDIR" \
    --entrypoint '' \
    $BUILD_IMAGE \
    sh -c "
        echo \"$BUILD_FILES\" | xargs -I{} -t $BUILD_FILE_CMD
    "
