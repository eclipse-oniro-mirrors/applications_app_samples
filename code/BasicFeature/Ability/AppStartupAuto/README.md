# AppStartupAuto

[中文说明](README_zh.md) | [Test guide](ohosTest.md)

## Overview

This Stage-model ArkTS sample queries device support with `autoStartupManager.isAutoStartupSupported()` and the current application's auto-start state with `autoStartupManager.getAutoStartupStatusForSelf()`.

It distinguishes unsupported, failed, timed-out, enabled and disabled results. It does **not** enable/disable auto-start, request additional permissions, open an unverified settings route, or prove that the application was actually started at boot. Reference rule catalogs do not replace actual platform responses.

## Preview

No application run or screenshot capture was performed for this revision. Screenshots are intentionally not provided.

The home page contains status, refresh, settings guidance, query records and API details. Other pages provide manual settings follow-up, scoped history/filtering/comparison/export, independent API diagnostics, reference fault catalogs, and a private committed-evidence archive.

## Usage

1. Open the project in a DevEco Studio installation supporting the configured SDK `26.0.0`. Keep the existing SDK and `modelVersion` settings unless the integration owner explicitly changes the toolchain.
2. Configure your own development signature for the referenced `default` signing configuration and deploy to a suitable OpenHarmony standard device (`default` in the module declaration). No signing secrets are supplied.
3. Refresh the state. A visible timeout does not cancel a native request; the shared single-flight slot is released only when that request settles.
4. After a successful sample, explicitly start a manual settings follow-up, leave the application, change settings manually if the device offers them, and return within ten minutes. The sample compares associated queries, not unobserved settings actions.
5. Use history filters and the separate current-scope/full-history export actions. Clearing live history requires confirmation and does not delete the independent archive.
6. Archive capture is opt-in. Read failures block writes; failed or unconfirmed writes are not presented as persisted evidence. Preview cleanup before confirming deletion.
7. UI resources include default English and `zh_CN` Chinese. Re-enter/restart the sample after a system-language change and verify labels, dynamic messages and historical data display.

## Project layout and implementation

- [EntryAbility](entry/src/main/ets/entryability/EntryAbility.ets): lifecycle, resource/storage initialization.
- [AutoStartupRuntime](entry/src/main/ets/autostart/AutoStartupRuntime.ets): injectable platform/clock adapters and shared native request coordination.
- [AutoStartupService](entry/src/main/ets/autostart/AutoStartupService.ets): query phases, timeout handling, foreground refresh, persistence and revisit correlation.
- [AutoStartupHistory](entry/src/main/ets/autostart/AutoStartupHistory.ets): schema validation, 20-record/30-day bounded history and redacted export.
- [AutoStartupTypes](entry/src/main/ets/autostart/AutoStartupTypes.ets): stable source IDs `initial/manual/foreground/settings`; historical Chinese source values are accepted at the decoding boundary. Schema/record/session/archive identifiers remain unchanged.
- [RevisitTracker](entry/src/main/ets/autostart/revisit/RevisitTracker.ets): explicit before/after evidence and bounded follow-up sessions.
- [StartupArchive](entry/src/main/ets/autostart/archive/StartupArchive.ets) and [RDB adapter](entry/src/main/ets/autostart/archive/StartupArchiveRdbStorage.ets): committed-only private evidence, revision checks, bounded capture and confirmed cleanup. Long-term evidence excludes raw platform error explanations.
- `entry/src/main/ets/pages/` and `components/`: production UI; `entry/src/main/resources/`: localized resources.
- `entry/src/ohosTest/ets/`: logic, native RDB and UI tests, fixtures, runner and test ability.

Logging uses domain `0xF811` and tag `[Sample_AppStartupAuto]`. Test entry logging preserves existing case identifiers, flags, runner timeouts and fixture cleanup.

## Permissions and dependencies

The main module declares no additional requested permissions. Runtime code uses system AbilityKit, ArkUI, ArkData, BasicServicesKit and PerformanceAnalysisKit. Tests use Hypium and TestKit; native RDB and UiTest scenarios require a device.

## Constraints and verification status

- Per user instruction, this revision was **not compiled, built or tested**. Only file/text/JSON/resource-reference checks were performed. No test PASS or device-support claim is made.
- SDK `26.0.0`, the existing `modelVersion`, stable routes and IDs are retained. Configure signing locally before deployment.
- Query results are not proof of a real boot launch. Reference catalogs are illustrative, not evidence of granted permissions, sent notifications or available settings APIs.
- The archive is capped at 500 records/1 MiB, with bounded pending capture. Uncommitted evidence is not guaranteed to survive process exit.
- See [the test guide](ohosTest.md) for actual test entry points, manual steps, expectations and the unexecuted status.

## Download

In an empty directory:

```shell
git init
git config core.sparsecheckout true
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
echo code/BasicFeature/Ability/AppStartupAuto/ > .git/info/sparse-checkout
git pull origin master
```

If the change has not yet landed on `master`, use the actual review branch containing this sample. A download failure is not a build result.
