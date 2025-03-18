fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

### tests

```sh
[bundle exec] fastlane tests
```

Runs the tests



Use the `scheme` parameter to select the scheme that should be tested.

### create_and_upload_testflight_build

```sh
[bundle exec] fastlane create_and_upload_testflight_build
```

Creates and uploads a new build to TestFlight

### create_and_sign_release_build

```sh
[bundle exec] fastlane create_and_sign_release_build
```

Sets up signing and builds the app with the 'Release' configuration

### setup_code_signing

```sh
[bundle exec] fastlane setup_code_signing
```

Fetch codesigning assets.

By default, this lane fetches the certificate and provisioning profile for development, and performs read-only operations.
Use `readonly:false` to update assets on https://developer.apple.com/ and the Git repository used for fastlane Match.
Example: `fastlane setup_code_signing readonly:false`

### create_development_certificate

```sh
[bundle exec] fastlane create_development_certificate
```

Creates a new "Development" certificate

Use this lane to re-generate the certificate in case the existing one is about to expire.

### generate_app_icon

```sh
[bundle exec] fastlane generate_app_icon
```

Re-generates the app icon from a 1024x1024 template image.

Requires the GraphicsMagick library to be installed on your machine (`brew install graphicsmagick`).

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
