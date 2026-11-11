# Shortcut

[中文说明](<README_zh.md>) · [Test cases and verification status](<ohosTest.md>)

## Overview

This OpenHarmony Stage/ArkUI sample detects shortcut support, queries this app's static desktop shortcuts, and changes their visibility. Its three business destinations are notes, date-based tasks, and saved resources. The bundle is `com.example.shortcut`; see [shortcuts_config.json](<entry/src/main/resources/base/profile/shortcuts_config.json>) for the stable shortcut IDs and Want parameters.

## Using the sample

1. Open the home page and check platform support. On supported devices, refresh the shortcut list and inspect details or invocation history.
2. Long-press the installed app icon in a supporting desktop launcher to open Create note, Today's tasks, or Saved resources. Cold and warm starts share validation for `sc.action`, `sc.version`, and `sc.filter`.
3. Change one shortcut or select several, generate a preview, and confirm. Batch history retains at most five batches and distinguishes confirmed, verified failure, unknown, and not-run results.
4. Verify unknown outcomes before continuing. Compensation is **not** an atomic platform rollback: unknown original visibility cannot be precisely restored, and external changes require an explicit keep/overwrite choice. Failed journal reads or writes block blind replay.
5. Notes provide drafts, revisions, line differences, conflict branches, and a 30-day trash. Permanent deletion is irreversible. Trash batch actions commit a single root document, not independent per-note writes.
6. Tasks support date selection, history, editing, and completion filters. Saved resources support search, categories, and favorites. The rule center demonstrates local routing, search, filters, due dates, and repetition; it does not implement background alarms, network services, or cross-device synchronization.

## Architecture

- [EntryAbility.ets](<entry/src/main/ets/entryability/EntryAbility.ets>): lifecycle, resource binding, cold/warm entry.
- [ShortcutService.ets](<entry/src/main/ets/services/ShortcutService.ets>) and [VisibilityBatch.ets](<entry/src/main/ets/services/VisibilityBatch.ets>): SDK boundary, batch previews, journal validation, verification, retry and compensation.
- [AppNavigation.ets](<entry/src/main/ets/navigation/AppNavigation.ets>): routes, unsaved-edit confirmation and stale callback isolation.
- [BusinessStore.ets](<entry/src/main/ets/business/BusinessStore.ets>) and [BusinessStorage.ets](<entry/src/main/ets/business/BusinessStorage.ets>): workspace, history, trash and Preferences recovery.
- [NoteRecyclePanel.ets](<entry/src/main/ets/components/NoteRecyclePanel.ets>): the production component reused by isolated native UI cases.
- [List.test.ets](<entry/src/ohosTest/ets/test/List.test.ets>) and [CaseScope.ets](<entry/src/ohosTest/ets/support/CaseScope.ets>): test registration, watchdog, cleanup and shared case logs.

## Localization and data safety

Default resources are English, with `zh_CN` translations. Existing string-only APIs use [Strings.ets](<entry/src/main/ets/i18n/Strings.ets>), bound before business initialization. Static display catalog fields resolve lazily. User note/task content, stable IDs, stored keys, filter contracts, and Chinese synonym/search sample inputs are deliberately not rewritten by locale changes.

Business data remains in `shortcut_business_v1/workspace`; visibility journals remain in `shortcut_visibility_batches_v1/journal`. An uncertain write must be reloaded and reconciled before retry. Diagnostic logs use domain `0xF811` and tag `[Sample_Shortcut]`; telemetry excludes notes, Wants, storage documents, and user input.

## Preview

No application or device session was run and no screenshots were captured for this review. Real home, batch-preview and trash screenshots in both languages remain to be added. Long-text layout and dark mode need device verification; no PASS image is fabricated.

## Requirements, permissions and dependencies

- Existing SDK `26.0.0` and `modelVersion: 26.0.0` are retained. The configured runtime is OpenHarmony and the device type is `default`; use a compatible SDK26 DevEco toolchain.
- Configure your own local signing before deploying. No personal signing certificate or key is supplied.
- The main module declares no `requestPermissions`. Shortcut behavior depends on the platform and launcher; unsupported devices and API failures are reported explicitly.
- Tests depend on `@ohos/hypium` 1.0.25. Platform APIs come from AbilityKit, ArkUI, ArkData, LocalizationKit, PerformanceAnalysisKit, BasicServicesKit and TestKit.
- Active notes and trash are capped at 50 each, history at 100 total revisions, and the root document at 8 MiB UTF-8. Oversized writes are rejected rather than silently truncating user data.
- **These changes have not been compiled, built, type-checked, or run in application/device tests, as requested.** Text, JSON and reference checks are not a build/device PASS. See [ohosTest.md](<ohosTest.md>) for pending verification.

## Obtaining the sample

The local delivery is `xiugai/Shortcut`. Its final upstream directory has not yet been confirmed; do not treat this local path as an existing remote directory. Once a maintainer confirms it, use sparse checkout (illustrative only; not executed in this review):

```sh
git clone --filter=blob:none --sparse https://gitcode.com/openharmony/applications_app_samples.git
cd applications_app_samples
git sparse-checkout set <maintainer-confirmed-Shortcut-directory>
```
