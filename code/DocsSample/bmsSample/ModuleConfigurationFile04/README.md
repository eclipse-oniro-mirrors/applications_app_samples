# ModuleConfigurationFile04

## Introduction

This sample demonstrates how the `module.json5` and `app.json5` configuration files of a Stage model
application describe a bundle that consists of an `entry` HAP and a `feature` HAP. The `entry` module
preloads the `feature` module through the `atomicService.preloads` field and the configuration is
validated by a set of logic oriented test suites.

Bundle name: `com.example.moduleconfigurationfile04`

## Preview

No UI preview is required. The sample focuses on configuration files and automated tests.

## Usage

1. Open the project in DevEco Studio.
2. Build `entry@default` and `entry@ohosTest` using the same product and signing configuration.
3. Install the two signed HAPs and run the `entry_test` test module. The current suites do not require an installed `feature` HAP; feature configuration and cross-module rules are tested using configuration objects.
4. Build and install `feature@default` only when exercising the complete multi-module sample. See [ohosTest.md](ohosTest.md) for installation and test commands.

## Project structure

```
ModuleConfigurationFile04/
|-- AppScope/
|   |-- app.json5                              // Application level configuration
|   |-- resources/                             // Application level resources
|-- entry/
|   |-- src/main/
|   |   |-- module.json5                       // Entry HAP configuration with atomicService preloads
|   |   |-- ets/entryability/EntryAbility.ets  // Entry ability
|   |   |-- ets/pages/Index.ets                // Entry page
|   |-- src/ohosTest/
|       |-- ets/harness/                       // Configuration models, validators and test helpers
|       |-- ets/test/                          // Hypium test suites
|-- feature/
|   |-- src/main/
|       |-- module.json5                       // Feature HAP configuration
|       |-- ets/featureability/FeatureAbility.ets
```

## Implementation

- `entry/src/ohosTest/ets/harness/ConfigModels.ets` defines the typed configuration model.
- `entry/src/ohosTest/ets/harness/AppConfigValidator.ets` validates `app.json5`.
- `entry/src/ohosTest/ets/harness/ModuleConfigValidator.ets` validates `module.json5`.
- `entry/src/ohosTest/ets/harness/CrossModuleValidator.ets` validates rules that span modules.
- `entry/src/ohosTest/ets/test/` contains the Hypium suites that exercise the validators.

## Permissions

No permission is required.

## Constraints

1. This sample runs on the standard system. Supported device: tablet.
2. This sample uses the Stage model and requires OpenHarmony API 26 SDK (validated SDK version 26.0.0.38). Configure the installed SDK root using `sdk.dir` in local.properties.
3. DevEco Studio 5.1.1 Release (5.1.1.840) or later is required.

## Download

```
git init
git config core.sparsecheckout true
echo code/DocsSample/bmsSample/ModuleConfigurationFile04 > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
