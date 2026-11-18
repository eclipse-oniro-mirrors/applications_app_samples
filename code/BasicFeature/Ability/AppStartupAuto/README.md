# Auto-Startup Status Query (AppStartupAuto)

[中文说明](<README_zh.md>) | [Test guide](<ohosTest.md>)

## Overview

This Stage-model ArkTS sample uses [@ohos.app.ability.autoStartupManager](<https://gitee.com/openharmony/docs/blob/master/en/application-dev/reference/apis-ability-kit/js-apis-app-ability-autoStartupManager.md>), imported through `@kit.AbilityKit`, to query device auto-start capability and the auto-start status of **this application**:

- `autoStartupManager.isAutoStartupSupported()`: detects device auto-start support, available from `26.0.0`.
- `autoStartupManager.getAutoStartupStatusForSelf()`: asynchronously queries this application's status, available from API 21.

The sample uses [@ohos.data.preferences](<https://gitee.com/openharmony/docs/blob/master/en/application-dev/reference/apis-arkdata/js-apis-data-preferences.md>) for query history, [@ohos.data.relationalStore](<https://gitee.com/openharmony/docs/blob/master/en/application-dev/reference/apis-arkdata/js-apis-data-relationalStore.md>) for local query evidence, and [@ohos.hilog](<https://gitee.com/openharmony/docs/blob/master/en/application-dev/reference/apis-performance-analysis-kit/js-apis-hilog.md>) for logging. It provides manual settings follow-up, history filtering and comparison, independent diagnostics, and archive management.

## Preview

The home page shows device capability, this app's auto-start status and recent queries, with entries for history, follow-up, independent diagnostics and the evidence archive.

## Usage

### Preparation

1. Open the project in DevEco Studio supporting OpenHarmony SDK `26.0.0`, the Stage model, and ArkTS. Install the declared dependencies.
2. Configure a local development signature for `default` and deploy to a compatible OpenHarmony standard-system device. Prepare your own certificates, private keys, and signing passwords.
3. On first launch, inspect the device capability, application status, and API results on the home page.

### Actions and expected behavior

| Feature | Actions | Expected behavior |
|---|---|---|
| Status query | Open the home page, refresh, and expand API details or query records | Device capability and application status appear separately, with the source, time, and actual result; failures and timeouts have distinct messages |
| Manual settings follow-up | After a successful sample no more than ten minutes old, start a follow-up, leave the application, then return to inspect associated samples | Departure and return times and the related queries are recorded |
| History and comparison | Open history, filter by source, outcome, and time, inspect details, and select comparison samples | Lists, summaries, and comparisons match the current scope; insufficient samples produce a message |
| History export and clearing | Export the current scope and full history separately; clear history as needed | Exports are redacted and their scope is explicit; cancellation preserves history, while confirmation clears history and retains the independent archive |
| Independent diagnostics | Run the capability and self-status probes separately | Each probe displays its own stage, result, code, and duration |
| Manual archive and recovery | Save a query result, then close and reopen the application after success | Committed records appear as saved and are restored on reopening; save failures display an error |
| Automatic capture | Read the privacy notice, cancel the enable confirmation first, then enable or disable as needed | Capture is off by default; cancellation preserves the state, enabling starts capture under its rules, and disabling retains existing evidence |
| Archive cleanup | Filter or page through records, preview cleanup, then cancel or confirm | Cleanup uses a valid preview and protects the latest valid sample and unknown-time records; archive changes require a new preview |
| Reference and language | Inspect fault and archive rules; switch the system to English or `zh_CN` and reopen the application | Text uses current resources while source codes, rule IDs, and stored fields remain stable |

## Project layout

```text
AppScope/                              Application configuration and resources
entry/src/main/ets/
  pages/Index.ets                       Entry page
  startup/pages/                       Follow-up, history, diagnostics, and fault scenes
  entryability/                        Lifecycle and resource/storage attachment
  autostart/                           Platform queries, persistence, logging, and scene business logic
    AutoStartupRuntime.ets             Query API, clock, shared requests, and Preferences
    StoragePorts.ets                   Application-internal storage interfaces
    SampleLogger.ets                   Safe Hilog implementation
    archive/                           Archive codec, repository, cleanup, and RDB adapter
    diagnostics/                       Independent diagnostics and reference rules
    history/                           History filtering and presentation models
    revisit/                           Manual settings follow-up state machine
    text/                              Resources and message catalogs
  components/                          API details, record sheet, and archive panel
entry/src/main/resources/              Default English and Chinese resources
entry/src/ohosTest/ets/                 Controlled model, native RDB, and isolated UI tests
```

## Implementation

- **Platform and storage (entry):** [AutoStartupRuntime](<entry/src/main/ets/autostart/AutoStartupRuntime.ets>) implements platform queries, clocks, Preferences, and shared request coordination within this application. [StoragePorts](<entry/src/main/ets/autostart/StoragePorts.ets>) defines internal storage interfaces. [RdbDocumentStore](<entry/src/main/ets/autostart/archive/RdbDocumentStore.ets>) serializes document access, checks revisions, and runs business validation within transactions.
- **Query scene (entry):** The [entry page](<entry/src/main/ets/pages/Index.ets>) displays queries and scene navigation. [AutoStartupService](<entry/src/main/ets/autostart/AutoStartupService.ets>) manages query phases, timeouts, foreground refresh, saving, and follow-up associations.
- **History and follow-up (entry):** [AutoStartupHistory](<entry/src/main/ets/autostart/AutoStartupHistory.ets>) maintains up to 20 records for 30 days and redacts exports. [RevisitTracker](<entry/src/main/ets/autostart/revisit/RevisitTracker.ets>) associates follow-up sessions and queries. [AutoStartupTypes](<entry/src/main/ets/autostart/AutoStartupTypes.ets>) defines stable `initial/manual/foreground/settings` source codes and accepts historical Chinese source values.
- **Archive (entry):** [StartupArchive](<entry/src/main/ets/autostart/archive/StartupArchive.ets>) provides saving, filtering, paging, and cleanup, displays committed records, and limits storage to 500 records and 1 MiB. [StartupArchiveRdbStorage](<entry/src/main/ets/autostart/archive/StartupArchiveRdbStorage.ets>) handles business encoding, privacy validation, and RDB adaptation, with platform error information redacted for long-term storage.
- **Resources and logging:** [MessageCatalog](<entry/src/main/ets/autostart/text/MessageCatalog.ets>) supplies text from current resources. Logging uses `0xF811` and `[Sample_AppStartupAuto]` to record query stages, outcomes, and redacted parameters.

## Permissions

The main module declares no additional `requestPermissions`. Users operate system settings manually.

## Dependencies

- The project contains only the entry application module. Platform, storage, and business implementations stay within entry; no separate shared module or other Sample is required.
- In addition to the APIs in the overview, the sample uses [ArkUI](<https://gitee.com/openharmony/docs/tree/master/en/application-dev/reference/apis-arkui>) and [BasicServicesKit](<https://gitee.com/openharmony/docs/tree/master/en/application-dev/reference/apis-basic-services-kit>).
- Tests use `@ohos/hypium` `1.0.25` and [@kit.TestKit](<https://gitee.com/openharmony/docs/tree/master/en/application-dev/reference/apis-test-kit>).

## Constraints

1. The sample targets OpenHarmony standard systems and declares the `default` device type. API capability depends on the target-system response.
2. Compile, target, and compatible SDK versions are `26.0.0`; runtimeOS is OpenHarmony. The IDE must support this SDK, Stage, and ArkTS. See the [test environment and entry points](<ohosTest.md#环境与运行入口>) for preparation.
3. The sample queries only its own status. It does not change auto-start switches, manage other applications, or register a `StartupTask`. Unsupported capability, a disabled switch, failure, and timeout are handled separately.
4. After a query timeout, the native request retains the shared request slot until completion. Normal queries and independent diagnostics follow this serialization rule. Archive read failures pause writes, and recovery uses committed data.
5. Follow-up records departure, return, and query associations. Settings changes and system launch after reboot require separate system evidence. Version, permission, device, and reminder catalogs explain reference rules.

## Test entry

The [test guide](<ohosTest.md>) includes basic operations, automated scenarios, the case index, and an execution-record template.

## Download

Run these commands in an **empty directory**, using a Git version that supports `sparse-checkout`. They check out only `code/BasicFeature/Ability/AppStartupAuto/` from the repository:

```shell
git init
git sparse-checkout init --no-cone
git sparse-checkout set code/BasicFeature/Ability/AppStartupAuto/
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```

For another branch, replace `master` in the final command with the required branch.
