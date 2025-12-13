#!/usr/bin/env bash
# File    : release.sh
# Purpose : Release script for the AmazingZImageWorkflow project
# Author  : Martin Rizzo | <martinrizzo@gmail.com>
# Date    : Dec 12, 2025
# Repo    : https://github.com/martin-rizzo/AmazingZImageWorkflow
# License : Unlicense2
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#                           Amazing Z-Image Workflow
#  Z-Image workflow with customizable image styles and GPU-friendly versions
#_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _


zip_z_comics() {
    local VERSION=${1:-v1.0.0}
    local ZCOMICS_ZIP="$2/amazing-z-comics.zip"
    local ZIMAGE_ZIP="$2/amazing-z-image.zip"

    # busca amazing-z-comics_GGUF.json y amazin-z-comics_SAFETENSORS.json en el directorio actual
    # y los empaquete en un zip en el directorio OUTPUT_DIR
    zip -j "$ZCOMICS_ZIP" "amazing-z-comics_GGUF.json" "amazing-z-comics_SAFETENSORS.json"
    zip -j "$ZIMAGE_ZIP" "amazing-z-image_GGUF.json" "amazing-z-image_SAFETENSORS.json"
}

#===========================================================================#
#////////////////////////////////// MAIN ///////////////////////////////////#
#===========================================================================#

# este valor es retornado (no es local)
export RELEASE_DIR="${2:-/tmp/}amazing_release"
mkdir -p "$RELEASE_DIR"

zip_z_comics "$1" "$RELEASE_DIR"

