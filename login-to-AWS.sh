#!/usr/bin/env bash

# This script configures AWS SSO (if necessary) and performs the login.

set -e

# Configuration
AWS_CONTEXT="my-context-name"
AWS_ACCOUNT="PROD"
AWS_CLI_PROFILE_NAME="$AWS_CONTEXT-$AWS_ACCOUNT"

ensure_aws_sso_is_configured() {
    if aws configure list-profiles | grep -q "$AWS_CLI_PROFILE_NAME"; then
        # The profile is configured; nothing to do here.
        return 0
    fi

    echo "Setting up your AWS configuration file..."

    # Ensure that the `~/.aws` directory and the configuration file exist
    mkdir -p ~/.aws
    touch ~/.aws/config
    
    cat .aws-config >> ~/.aws/config

    echo "Done. You can now login using AWS SSO."
    echo ""
}

login_to_aws_if_necessary() {
    AWS_ACCOUNT_ID=$(aws sts get-caller-identity --profile "$AWS_CLI_PROFILE_NAME" 2>/dev/null | jq -r .Account || echo "")
    if [ -n "$AWS_ACCOUNT_ID" ]; then
        echo "Looks like you are logged in."
        return 0
    fi

    aws sso login \
        --profile "$AWS_CLI_PROFILE_NAME"
}

configure_and_login_to_aws() {
    echo """
    Our code signing assets are stored in an AWS S3 bucket.
    In order to be able to download them, we are going to log you in to our context,
    '$AWS_CONTEXT'.
    """

    ensure_aws_sso_is_configured
    login_to_aws_if_necessary
}

configure_and_login_to_aws
