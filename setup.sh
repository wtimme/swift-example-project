#!/usr/bin/env bash

# This script sets up the local development environment.

set -e

BUNDLER_VERSION="~>2.6"

setup_homebrew() {
    if [[ $(command -v brew) == "" ]]; then
        echo "Installing homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        echo "Updating homebrew..."
        brew update
    fi
}

install_dependencies_from_homebrew() {
    echo "Installing dependencies from Homebrew..."
    brew bundle
}

configure_git_hooks_path() {
    echo "Configuring Git to use the shared Git hooks..."
    git config core.hooksPath .githooks
}

install_bundler() {
    echo "Installing bundler ($BUNDLER_VERSION)..."
    gem install --user-install bundler:$BUNDLER_VERSION
}

install_dependencies_from_gemfile() {
    echo "Installing dependencies in Gemfile..."
    bundle install
}

install_certificates_and_provisioning_profiles() {
    echo "Installing certificates and provisioning profiles..."

    ./login-to-AWS.sh
    eval "$(./export-aws-credentials.sh)"
    bundle exec fastlane setup_code_signing
}

setup_homebrew
install_dependencies_from_homebrew
configure_git_hooks_path
install_bundler
install_dependencies_from_gemfile
install_certificates_and_provisioning_profiles

echo "Done. Happy coding! 🎉"
