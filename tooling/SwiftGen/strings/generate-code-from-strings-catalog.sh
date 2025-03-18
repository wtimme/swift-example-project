#!/usr/bin/env bash

# This script generates Swift code from the string catalog

set -e

REPOSITORY_ROOT_DIRECTORY=$(git rev-parse --show-toplevel)
APP_RESOURCES_DIRECTORY="$REPOSITORY_ROOT_DIRECTORY/App/Resources"
SWIFTGEN_STRINGS_DIRECTORY="$REPOSITORY_ROOT_DIRECTORY/tooling/SwiftGen/strings"

# Generate a `.strings` file from `.xcstrings`
swiftgen --config "$SWIFTGEN_STRINGS_DIRECTORY/xcstrings-json-to-strings.config.yml"

# Generate Swift code from `.strings` file
swiftgen --config "$SWIFTGEN_STRINGS_DIRECTORY/strings-to-swift.config.yml"

# Remove byproduct
rm "$APP_RESOURCES_DIRECTORY/generated.strings"

# Format the generated Swift code
swiftformat $APP_RESOURCES_DIRECTORY/*.swift
