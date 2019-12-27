#!/bin/sh
docker pull $BUILD_IMAGE

BUILD_FILE_CMD="latexmk $LATEXMK_OPTIONS {}"

docker run -v "$HOST_WORKSPACE\:$WORKDIR" --workdir="$WORKDIR" --entrypoint '' $BUILD_IMAGE sh -c "echo '$BUILD_FILES' | xargs -I{} -t $BUILD_FILE_CMD"
