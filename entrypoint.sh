#!/bin/bash

docker pull $BUILD_IMAGE

BUILD_FILE_CMD="sh -c 'TEX_PATH=\"{}\"; cd $(dirname {}); latexmk $LATEXMK_OPTIONS \"$TEX_PATH\"'"

docker run -v ${PWD}:$WORKDIR --entrypoint '' $BUILD_IMAGE sh -c "echo $BUILD_FILES | xargs -I{} -t $BUILD_FILE_CMD"