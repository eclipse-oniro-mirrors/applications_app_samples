# AppPerformance

[简体中文](README_zh.md) · [Test cases and verification status](ohosTest.md)

## Overview

A Stage-model OpenHarmony sample for file-page eviction requests, HyperSnap controls, and repeatable workload experiments. It keeps request outcomes separate from measured effects and records missing evidence explicitly.

- Discover installed file/module targets and call `appMemoryOptimizer.evictFilePages` or `evictModuleFilePages`.
- Enable/disable HyperSnap and request a rebuild with a local cooldown.
- Execute six stages: target discovery, configuration validation, workload read, control/eviction request, same-resource reread, and configuration reread.
- Record workload integrity, stage durations, conditions and gaps in a bounded ledger; repeat a selected workload sequentially, select historical series, and export redacted Markdown/CSV reports.
- Capture AbilityStage launch evidence separately from page-content-loaded timing.
- Provide a test-only C++ N-API page probe, including private-file calibration and held-mapping observations.

**A successful request does not prove that memory was reclaimed. Content-loaded duration is not tap-to-first-frame time, nor proof of a HyperSnap launch.** An actual `AbilityStage.onLaunchFromHyperSnap` callback is separate evidence; no callback must be invented.

## Preview

No verified screenshots are provided with this revision. The main page contains Memory optimization, HyperSnap, Call records, Maintenance plan and Check results tabs. The workload laboratory contains single-run controls, repeated experiments, history, comparisons and exports. English and Simplified Chinese visual checks remain pending; screenshots must be captured from an actual run rather than generated as evidence.

## Usage

1. Open the project in an OpenHarmony-capable DevEco Studio setup and configure your own local signing identity. `signingConfigs` is empty; the product still references `default`, so deployment requires a matching local signing configuration.
2. Use a standard-system device supporting the APIs in the configured SDK. Select an actual discovered target or enter an installed `.hap`, `.hsp` or `.so` file name. The sample does not grant access to inaccessible targets.
3. Start with a no-eviction control experiment. Compare file/module eviction only under matching device, version, foreground/background, resource and target conditions.
4. Inspect request status, integrity, elapsed time and explicit gaps. A timeout or cancel action ends local waiting, not the underlying SDK call; unsettled work remains isolated from new runs.
5. Use HyperSnap controls only when changing this application's setting is intended. Rebuild requests have a local cooldown and do not guarantee a new snapshot or a subsequent HyperSnap launch.
6. Copy call records, samples, the redacted ledger, or selected-series reports as needed. Clear actions affect the local records, not system settings. Review copied diagnostics before sharing.

## Structure and implementation

```text
AppScope/                          Application identity and localized label
entry/src/main/ets/
  entryability/                    UIAbility lifecycle
  entrystage/                      AbilityStage and HyperSnap evidence
  pages/                           Main tools and workload laboratory
  components/                      Shared reactive cards/series/history controls
  core/AppPlatform.ets             Native SDK and persistence boundary
  core/AppService.ets              Request/flow/series ownership and persistence
  core/SafeExecutor.ets            Bounded waiting, cancellation and quarantine
  core/Experiment*.ets             Ledger and repeated experiments
  core/report/                     Conditions, statistics and redacted exports
  core/Logger.ets                   0xF811 / [Sample_AppPerformance]
  core/UiText.ets                   Current-context resource resolution
entry/src/main/cpp/                libpageprobe N-API implementation and declarations
entry/src/main/resources/          Localized strings and packaged workloads
entry/src/ohosTest/                Hypium cases, fixtures, UI support and diagnostic runners
```

The native platform boundary is [AppPlatform.ets](entry/src/main/ets/core/AppPlatform.ets); sequencing and storage are owned by [AppService.ets](entry/src/main/ets/core/AppService.ets). [SafeExecutor.ets](entry/src/main/ets/core/SafeExecutor.ets) does not claim to cancel SDK work. [ReportExport.ets](entry/src/main/ets/core/report/ReportExport.ets) validates redaction before returning reports. The C++ probe is in [pageprobe.cpp](entry/src/main/cpp/pageprobe.cpp); this review changes its copyright header, not its native behavior.

## Permissions and dependencies

The main module declares no `requestPermissions`. This does **not** guarantee that every API, installed target, pagemap read or residency measurement is accessible on every device. Support, system policy and error codes must be evaluated on the target device.

Dependencies declared by the project are Hypium `1.0.25`, the Hvigor OpenHarmony plugin supplied by the toolchain, and local `libpageprobe.so`. Native CMake/N-API support is required by the project configuration. No extra network permission is declared.

## Constraints and known remaining work

- The project retains compile/target/compatible SDK `26.0.0`, `runtimeOS: OpenHarmony`, `deviceTypes: [default]`, and `modelVersion: 26.0.0`. These are configuration facts, not a claim that this revision was built or deployed.
- Per the current review instruction, no compilation, build, type-check, application test or device operation was run for the revised files. Source/JSON/resource/diff inspection is not a test PASS.
- Base UI resources are English, with `zh_CN` translations. Main controls, dialogs, counters and workload selection resolve resources using the current UI context. Historical serialized status/group values are retained and mapped only at the display boundary.
- Localization is **not yet complete**: service-generated messages, series/history presentation text, statistics, conditions and exported reports still contain Chinese text. They are not all protocol values. Further work must separate presentation text from validation/serialization, then re-authorize and perform regression validation. See the detailed remaining-work section in the Chinese README.
- Packaged business data include text, notes, image-index and form-draft workloads. Their Chinese content is fixture data, not proof of a successful run; do not translate or modify it merely to make a source-text scan pass.
- Missing data are not zero. Raw `mincore` results may be untrusted; private-file calibration does not grant access to or prove observability of an installed HAP. A held mapping's pagemap PRESENT bits are not a global page-cache reclamation counter.
- The custom `app-performance-test-report.json` counts only cases using the `BoundedCase` wrapper, not every direct Hypium `it`. Use the complete framework report and runner results for full-suite conclusions.

## Tests

[ohosTest.md](ohosTest.md) records case identifiers, steps, expected results, test scopes and explicit pending status. UI test support retains owned-TestAbility cleanup, timeout limits and credential-lock diagnostics. Existing test names and stable UI IDs are not mechanically renamed.

## Download

The following is a sparse-checkout **template for the intended repository location**. Confirm the target branch and whether this revision has been merged before using it; this review did not fetch or modify a remote repository.

```sh
git init applications_app_samples
cd applications_app_samples
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git sparse-checkout init --cone
git sparse-checkout set code/BasicFeature/Ability/AppPerformance
git pull origin master
```
