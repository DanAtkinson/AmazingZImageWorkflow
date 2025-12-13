#!/usr/bin/env bash
# File    : release.sh
# Purpose : Release script for the AmazingZImageWorkflow project
# Author  : Martin Rizzo | <martinrizzo@gmail.com>
# Date    : Dec 12, 2025
# Repo    : https://github.com/martin-rizzo/AmazingZImageWorkflow
# License : Unlicense
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#                           Amazing Z-Image Workflow
#  Z-Image workflow with customizable image styles and GPU-friendly versions
#_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _


# Creates zip archives containing the rela
#
# This function takes a version string, creates two zip archives containing
# z-comic and z-image workflow related files, and places them in the specified
# output directory. It also handles the README file and license files.
#
# Usage:
#   zip_z_comics [VERSION] [OUTPUT_DIR]
#
# Parameters:
#   VERSION   : The version string
#   OUTPUT_DIR: The directory where zip archives will be created
#
# Example:
#   zip_z_comics "v1.2.3" "/path/to/output"
#
zip_z_comics() {
    local VERSION=${1:-v1.2.3}
    local OUTPUT_DIR=$2
    local MAJOR MINOR
    MAJOR=$(echo "${VERSION##v}" | cut -d '.' -f1)
    MINOR=$(echo "${VERSION##v}" | cut -d '.' -f2)

    local ZCOMICS_ZIP="$OUTPUT_DIR/amazingZComics_v${MAJOR}${MINOR}.zip"
    local ZIMAGE_ZIP="$OUTPUT_DIR/amazingZImage_v${MAJOR}${MINOR}.zip"

    # copy temporarily README file from 'files' directory
    cp files/amazing-z-readme.txt README.TXT

    # create zip archive for z-comics workflow files
    # (the zip command with -j flag creates archives without directory paths)
    zip -j "$ZCOMICS_ZIP" \
        "amazing-z-comics_GGUF.json" \
        "amazing-z-comics_SAFETENSORS.json" \
        "LICENSE" \
        "README.TXT" \
        "amazing-z-comics_GGUF.png"

    # create zip archive for z-image workflow files
    zip -j "$ZIMAGE_ZIP" \
        "amazing-z-image_GGUF.json" \
        "amazing-z-image_SAFETENSORS.json" \
        "LICENSE" \
        "README.TXT" \
        "amazing-z-image_GGUF.png"

    # remove the temporary README.TXT file
    rm README.TXT
}

#===========================================================================#
#////////////////////////////////// MAIN ///////////////////////////////////#
#===========================================================================#
# The "RELEASE_DIR" variable is exported so it can be used by github workflow.

# generate the release directory taking as base the second argument
# (if the second parameter is not provided, use '/tmp/amazing_release')
export RELEASE_DIR="${2:-/tmp}/amazing_release"
mkdir -p "$RELEASE_DIR"

# calls "zip_z_comics"
#  - the first parameter is the version,
#  - the second parameter is the output directory.
zip_z_comics "$1" "$RELEASE_DIR"

# prints a message with the location of zip archives
echo
echo "The files were created in: $RELEASE_DIR"
echo
