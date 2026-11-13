# Application Memory Optimization and Quick Launch (AppPerformance)

[简体中文](<README_zh.md>) · [Test case archive (Chinese)](<ohosTest.md>)

## Introduction

This OpenHarmony Stage-model ArkTS sample demonstrates file-page cache eviction requests, application Quick Launch (HyperSnap) management, and repeatable packaged-workload experiments. Its bundle name is `com.samples.appperformance`. The single entry module contains the execution, ledger and report implementations in its core directory, alongside platform and resource adapters, pages and Ability lifecycles.

| Full API module and official reference | Kit import | Use in this sample |
|---|---|---|
| [@ohos.app.ability.appMemoryOptimizer](https://developer.huawei.com/consumer/en/doc/harmonyos-references/js-apis-app-ability-appmemoryoptimizer/) | `@kit.AbilityKit` | Discover this application's file or module targets before requesting file-page eviction. File targets accept `.so`, `.hap` and `.hsp`; experiments also validate packaged configuration. |
| [@ohos.app.ability.hyperSnapManager](https://developer.huawei.com/consumer/en/doc/harmonyos-references/js-apis-app-ability-hypersnapmanager/) | `@kit.AbilityKit` | Change this application's Quick Launch setting and request a rebuild, keeping request results separate from actual launches. |
| [@ohos.resourceManager](https://gitee.com/openharmony/docs/blob/master/en/application-dev/reference/apis-localization-kit/js-apis-resource-manager.md) | `@kit.LocalizationKit` | Read text, note-list, image-index and form-draft workloads and check reread integrity. |
| [@ohos.data.preferences](https://gitee.com/openharmony/docs/blob/master/en/application-dev/reference/apis-arkdata/js-apis-data-preferences.md) | `@kit.ArkData` | Save bounded call records, the experiment ledger and series metadata. |
| [@ohos.pasteboard](https://gitee.com/openharmony/docs/blob/master/en/application-dev/reference/apis-basic-services-kit/js-apis-pasteboard.md) | `@kit.BasicServicesKit` | Copy call records, a redacted ledger and Markdown / CSV reports on user request. |
| [Node-API](https://gitee.com/openharmony/docs/blob/master/en/application-dev/napi/napi-introduction.md) | Native | Provide private-file calibration and held-mapping samples for independent diagnostic runners. |

## Preview

The main tools cover memory optimization, Quick Launch, call records, maintenance plans and check results. The workload laboratory provides workload and mode selection, single and repeated runs, results and history.

## Usage

### Preparation

1. Download the project using the commands below and open the `AppPerformance` project root in DevEco Studio. Keep AppScope, entry and root build files in their relative locations; do not import entry alone.
2. Prepare OpenHarmony SDK `26.0.0` with its Native / CMake tools. Synchronize dependencies in the IDE or run `ohpm install --all` at the project root.
3. Configure local debug signing for product `default`, select a compatible standard-system device, then build and run entry.
4. Start with a resource read and a no-eviction control on the main tools page, then explore the other features.

### Memory optimization and resource integrity

1. Refresh targets on the memory optimization page and inspect actually discovered files and modules. Select a target or enter a valid file name; empty input, directory paths and invalid suffixes are blocked.
2. Read a packaged resource to establish a baseline, then verify integrity. The page shows resource identity, byte count, checks and read errors.
3. Select file or module targets, send the request, and inspect its status, error code and duration in call records.

### Workloads, history and reports

1. Open the workload laboratory, select text, note list, image index or form draft, and first run the no-eviction control. The six stages are target discovery, configuration validation, workload read, control or eviction request, same-resource reread, and configuration reread.
2. Select file or module mode as needed. Use the same device, application/system versions, foreground state, target and workload content for comparisons.
3. Choose 1–10 sequential repetitions, default 3. Stop-after-current ends later iterations. Cancel waiting ends local waiting while an SDK request already dispatched continues processing.
4. Select a historical series to view planned, started and completed counts and sample references. Reports use the selected series and list missing samples as gaps.
5. Copy Markdown / CSV reports or a redacted ledger and review them before sharing. Clear actions affect the corresponding local records, not the system Quick Launch setting.

### Application Quick Launch

1. Enable or disable Quick Launch on its page. Select rebuild when you need to reinitialize the snapshot.
2. Rebuild has a cooldown. Call records show its processing status and errors.
3. The application records actual system Quick Launch starts through `AbilityStage.onLaunchFromHyperSnap`.

## Project structure

```text
AppScope/                                  Application identity and resources
entry/src/main/
  ets/pages/Index.ets                       Main tools entry and existing routes
  ets/workload/pages/WorkloadLabPage.ets     Workload scenario
  ets/core/
    AppService.ets                         Service and experiment orchestration
    AppPlatform.ets                        I/O ports plus SDK, resource and storage adapter
    SafeExecutor.ets                       Timeout, cancellation and quarantine
    Types.ets                              Shared data types
    Experiment*.ets                        Ledger, record and series implementations
    SeriesHistory.ets                      Series metadata and sample references
    report/                                Condition groups, statistics and reports
    TextMessages.ets                       Formatter, lookup port and Context adapter
    MessageCatalog.ets                     Message IDs, resource names and fallback text
  ets/entryability/                        Content loading and UIAbility lifecycle
  ets/entrystage/                          Actual launch-path records
  ets/components/                          Scenario components
  cpp/
    pageprobe.cpp                          Native probe
    CMakeLists.txt                         Native build definition
    types/libpageprobe/                     Local libpageprobe.so type package
  resources/                               English/Chinese text, config and workloads
entry/src/ohosTest/                         Cases, isolated UI and independent runners
```

## Implementation

1. **Single-entry implementation.** [AppService.ets](<entry/src/main/ets/core/AppService.ets>) directly uses [SafeExecutor.ets](<entry/src/main/ets/core/SafeExecutor.ets>), [ExperimentLedger.ets](<entry/src/main/ets/core/ExperimentLedger.ets>) and `exportReport` from [ReportExport.ets](<entry/src/main/ets/core/report/ReportExport.ets>). The core directory holds the implementations rather than forwarding bridges; no separate feature facade or public export module is required.
2. **Platform and experiment orchestration.** [AppPlatform.ets](<entry/src/main/ets/core/AppPlatform.ets>) contains both the I/O ports and their SDK, target-discovery, resource and Preferences adapter. [AppService.ets](<entry/src/main/ets/core/AppService.ets>) coordinates exclusion, cooldowns, the six-stage flow, series references and serialized saves. [SafeExecutor.ets](<entry/src/main/ets/core/SafeExecutor.ets>) distinguishes local waiting from underlying completion. The [laboratory page](<entry/src/main/ets/workload/pages/WorkloadLabPage.ets>) and the routes in [Index.ets](<entry/src/main/ets/pages/Index.ets>) remain unchanged.
3. **Integrity and reports.** The packaged [configuration](<entry/src/main/resources/rawfile/memory_optimizer.json>) participates in experiment checks. [ExperimentLedger.ets](<entry/src/main/ets/core/ExperimentLedger.ets>) retains conditions, integrity and gaps; [ReportExport.ets](<entry/src/main/ets/core/report/ReportExport.ets>) groups conditions and generates length-limited, redacted reports. The report helpers remain in the core report subdirectory.
4. **Language and launch records.** [TextMessages.ets](<entry/src/main/ets/core/TextMessages.ets>) combines the formatter, injectable lookup port and current-Context resource adapter; [MessageCatalog.ets](<entry/src/main/ets/core/MessageCatalog.ets>) supplies message identities and fallbacks. Display language does not rewrite persisted facts or workloads. [EntryStage.ets](<entry/src/main/ets/entrystage/EntryStage.ets>) records actual system launch callbacks; [EntryAbility.ets](<entry/src/main/ets/entryability/EntryAbility.ets>) records content-loaded completion.
5. **Independent Native diagnostics.** [pageprobe.cpp](<entry/src/main/cpp/pageprobe.cpp>), [CMakeLists.txt](<entry/src/main/cpp/CMakeLists.txt>) and the local [libpageprobe.so type declarations](<entry/src/main/cpp/types/libpageprobe/index.d.ts>) are retained Native components. They supply private-file calibration and held-mapping sampling for independent runners. See the [test guide](<ohosTest.md>) for parameters and result definitions.

## Permissions

No additional permissions are requested. File access and Native sampling follow system permission policy. See the [access control overview](https://gitee.com/openharmony/docs/blob/master/en/application-dev/security/AccessToken/Readme-EN.md).

## Dependencies

1. Application logic is implemented in the single entry module, without a separate feature module or a dependency on another Sample.
2. Native builds retain the local `libpageprobe.so` type package and CMake / Node-API sources under entry; this is a Native dependency, not a separate ArkTS feature module.
3. Automation uses [@ohos/hypium](https://gitee.com/openharmony/testfwk_arkxtest) `1.0.25`. The matching toolchain supplies the Hvigor OpenHarmony plugin.

## Constraints

1. The sample uses Stage on OpenHarmony standard-system devices with device type `default`. Compile, target and compatible SDK versions are `26.0.0`; `modelVersion` separately identifies the build model.
2. `appMemoryOptimizer` starts at `26.0.0`; Quick Launch setting and rebuild APIs start at API 24. Availability depends on the target OpenHarmony system. This project uses the `26.0.0` interface set.
3. Eviction APIs return `Promise<void>` with a request result, without a reclaimed-byte count. The system schedules snapshot creation and use; `onLaunchFromHyperSnap` records the actual launch path.
4. Native sampling requires file access and kernel pagemap / mincore support. Unobservable items appear as gaps or `null`.
5. English base and `zh_CN` resources are provided. Reopen the application after changing system language. Configure debug signing locally; certificates and private keys are not distributed with the project.

## Tests

The [test guide](<ohosTest.md>) describes basic operations, automated scenarios, 444 numbered leaf cases and 2,301 source assertions, including safe assertion logging and explicit English/Chinese display contracts. These are source-coverage counts, not execution or pass counts. Record actual environments and results from Hypium reports and dedicated device procedures for system eviction, Quick Launch starts, Native diagnostics and language/layout checks.

## Download

Run these commands in an empty directory using a Git version supporting `sparse-checkout`:

```shell
git init
git sparse-checkout init --no-cone
git sparse-checkout set code/BasicFeature/Ability/AppPerformance/
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```

Replace `master` with the corresponding release or review branch when needed. Open the downloaded `code/BasicFeature/Ability/AppPerformance/` project root in DevEco Studio.
