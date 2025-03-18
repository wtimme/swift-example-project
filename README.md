# Swift Example Project

An example iPadOS/iOS project that showcases several ways to improve development, ie. using tooling.

## Development

### Installing the correct Ruby version

For our tooling, we utilize fastlane, which in turn depends on Ruby.
The Ruby that ships with macOS is
[not recommended by fastlane](https://docs.fastlane.tools/getting-started/ios/setup/#managed-ruby-environment-bundler-macoslinuxwindows).
Follow these steps to ensure that you are using the correct Ruby version.

1. Install and setup `rbenv` (see [their README](https://github.com/rbenv/rbenv))
2. Install the Ruby version that we are using for this repository (`rbenv install`)

### Setting up the project

To get a local copy up and running, simply follow these steps.

1. Clone the repository using **https** preferably with [GitHub CLI](https://docs.github.com/en/get-started/getting-started-with-git/caching-your-github-credentials-in-git#github-cli)
2. Run `setup.sh` to setup the tooling on your machine
3. Generate the Xcode project file by running `xcodegen`
4. Open `ExampleProject.xcodeproj` with Xcode

#### Trust & Enable “SwiftLintBuildToolPlugin”

We are using SwiftLint for linting the source code, which is installed as a
build plugin. Upon running the build for the very first time, Xcode
will produce the following error:

> “SwiftLintBuildToolPlugin” must be enabled before it can be used.
> Enable it now?

Click "Trust & Enable".

### fastlane

For deployment and automation, we utilize [fastlane](https://docs.fastlane.tools/).
Since we are using Bundler to install fastlane, you need to prefix fastlane commands
with `bundler exec`. For example:

```bash
bundle exec fastlane setup_code_signing
```
