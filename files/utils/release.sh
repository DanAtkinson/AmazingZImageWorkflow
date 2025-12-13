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


#===========================================================================#
#////////////////////////////////// MAIN ///////////////////////////////////#
#===========================================================================#

INDEX=${1:-1}
VERSION=${2:-v1.0.0}
TEMP_DIR=${3:-/tmp}

OUTPUT_DIR="$TEMP_DIR/amazing-z-image-workflow"

mkdir -

# busca amazing-z-comics_GGUF.json y amazin-z-comics_SAFETENSORS.json en el directorio actual
# y los empaquete en un zip en el directorio OUTPUT_DIR
mkdir -p "$OUTPUT_DIR"
zip -j "$OUTPUT_DIR/amazing-z-comics.zip" "amazing-z-comics_GGUF.json" "amazing-z-comics_SAFETENSORS.json"

# devuelve el path al archivo zip creado
echo "$OUTPUT_DIR/amazing-z-comics.zip"

