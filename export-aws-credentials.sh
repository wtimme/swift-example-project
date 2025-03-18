#!/usr/bin/env bash

# This script exports (prints) the AWS credentials
# Unfortunately, fastlane is not able to pick up the session that we configured using SSO.
# Therefore, we need to export the credentials as environment variables.

# Usage: `eval "$(./export-aws-credentials.sh)"`

set -e

# Configuration
AWS_CONTEXT="my-context-name"
AWS_ACCOUNT="PROD"
AWS_CLI_PROFILE_NAME="$AWS_CONTEXT-$AWS_ACCOUNT"

CREDENTIALS_JSON=$(aws configure export-credentials --profile "$AWS_CLI_PROFILE_NAME")
AWS_ACCESS_KEY_ID=$(jq -r .AccessKeyId <<< "$CREDENTIALS_JSON")
AWS_SECRET_ACCESS_KEY="$(jq -r .SecretAccessKey <<< "$CREDENTIALS_JSON")"
AWS_SESSION_TOKEN="$(jq -r .SessionToken <<< "$CREDENTIALS_JSON")"

echo """
export AWS_ACCESS_KEY_ID=\"$AWS_ACCESS_KEY_ID\"
export AWS_SECRET_ACCESS_KEY=\"$AWS_SECRET_ACCESS_KEY\"
export AWS_SESSION_TOKEN=\"$AWS_SESSION_TOKEN\"
"""
