#!/usr/bin/env bash

# This script re-generates the mocks.

REPOSITORY_ROOT_DIRECTORY=$(git rev-parse --show-toplevel)
TOOLING_DIRECTORY="$REPOSITORY_ROOT_DIRECTORY/tooling"

sourcery --config "$TOOLING_DIRECTORY/sourcery/mocks.yml"
swiftformat $REPOSITORY_ROOT_DIRECTORY/**/Mocks/*.swift
