# Shortcut

[中文说明](<README_zh.md>) · [Test scenarios and case index](<ohosTest.md>)

## Introduction

This OpenHarmony Stage/ArkTS/ArkUI sample demonstrates static desktop shortcuts and an application-local workspace. The bundle name is `com.samples.shortcut`. A single `entry` module owns shortcut API access, models, persistence, diagnostics, business data and navigation, organized in its existing responsibility directories.

- **Desktop shortcuts**: detect support, query this application's static entries, change individual or batch visibility, and open Create note, Today's tasks, or Saved resources from the desktop.
- **In-app workspace**: manage notes, drafts, revisions and recycling; edit and filter dated tasks; search local resources and manage favorites; inspect local rules.

The table lists the full API module names, official references, and Kit import entry points used by the sample.

| Full API module and official reference | Kit import | Use in this sample |
|---|---|---|
| [@ohos.bundle.shortcutManager](https://github.com/openharmony/docs/blob/master/en/application-dev/reference/apis-ability-kit/js-apis-shortcutManager.md) | `@kit.AbilityKit` | `isShortcutSupported()` checks device support, `getAllShortcutInfoForSelf()` queries this application's static shortcuts, and `setShortcutVisibleForSelf()` changes an individual shortcut's visibility. |
| [@ohos.app.ability.UIAbility](https://github.com/openharmony/docs/blob/master/en/application-dev/reference/apis-ability-kit/js-apis-app-ability-uiAbility.md) and [@ohos.app.ability.Want](https://github.com/openharmony/docs/blob/master/en/application-dev/reference/apis-ability-kit/js-apis-app-ability-want.md) | `@kit.AbilityKit` | `onCreate()` and `onNewWant()` receive cold and warm launches and supply validated navigation parameters. |
| [@ohos.data.preferences](https://github.com/openharmony/docs/blob/master/en/application-dev/reference/apis-arkdata/js-apis-data-preferences.md) | `@kit.ArkData` | `getPreferences()`, `get()`, `put()`, and `flush()` persist the business workspace and visibility journal; `removePreferencesFromCache()` supports reloading after uncertain writes. |
| [@ohos.router](https://github.com/openharmony/docs/blob/master/en/application-dev/reference/apis-arkui/js-apis-router.md), [@ohos.promptAction](https://github.com/openharmony/docs/blob/master/en/application-dev/reference/apis-arkui/js-apis-promptAction.md), and [@ohos.window](https://github.com/openharmony/docs/blob/master/en/application-dev/reference/apis-arkui/arkts-apis-window.md) | `@kit.ArkUI` | Navigate between pages, confirm leaving an editor, display feedback, and load the home page. |
| [@ohos.resourceManager](https://github.com/openharmony/docs/blob/master/en/application-dev/reference/apis-localization-kit/js-apis-resource-manager.md) | `@kit.LocalizationKit` | Resolve default English and `zh_CN` Chinese resources for string-only interfaces and lazily evaluated scene descriptions. |
| [@ohos.hilog](https://github.com/openharmony/docs/blob/master/en/application-dev/reference/apis-performance-analysis-kit/js-apis-hilog.md), [@ohos.hiTraceMeter](https://github.com/openharmony/docs/blob/master/en/application-dev/reference/apis-performance-analysis-kit/js-apis-hitracemeter.md), and [@ohos.hiAppEvent](https://github.com/openharmony/docs/blob/master/en/application-dev/reference/apis-performance-analysis-kit/js-apis-hiviewdfx-hiappevent.md) | `@kit.PerformanceAnalysisKit` | Fixed diagnostic messages, asynchronous batch traces, and redacted timing events. |
| [@ohos.systemDateTime](https://github.com/openharmony/docs/blob/master/en/application-dev/reference/apis-basic-services-kit/js-apis-date-time.md) and [@ohos.base](https://github.com/openharmony/docs/blob/master/en/application-dev/reference/apis-basic-services-kit/js-apis-base.md) | `@kit.BasicServicesKit` | Read system uptime and handle system API `BusinessError` values. |

## Preview

The home page provides Create note, Today's tasks and Saved resources, together with desktop shortcut and batch management. Business pages provide a return action to the home page.

## How to Use

### Preparation

1. Obtain the project as described under Download, then open the `code/BasicFeature/ApplicationModels/Shortcut/` project root in DevEco Studio. Install SDK `26.0.0` and a compatible build toolchain, then synchronize the project dependencies declared for `entry`. See Constraints for the distinction between SDK settings and `modelVersion`.
2. Configure a development signature matching `com.samples.shortcut` on your own machine. Select a device, install and run the `entry` module, and open the app normally to check the home page.
3. Unlock the device and try the desktop shortcuts and in-app workspace described below. Device requirements are listed under Constraints; see the [test guide](<ohosTest.md>) for preparation, scenarios and validation results.

### Desktop shortcuts

1. On the home page, check support, recheck it, or refresh the shortcut list. Open an entry's details and invocation history to inspect its information and interface results.
2. On a supporting launcher, long-press the app icon and select Create note, Today's tasks, or Saved resources. The definitions are in [shortcuts_config.json](<entry/src/main/resources/base/profile/shortcuts_config.json>). Verify all three both when the app is stopped (cold launch) and when it is running in the background (warm launch). Both paths validate `sc.action`, `sc.version`, and `sc.filter`; unknown actions and incompatible parameters are rejected.
3. Show or hide one entry from the home page, then inspect the actual desktop menu and refresh the app list. For a batch, select entries and target visibility, generate a preview, review it, and confirm. Previewing alone does not change platform shortcuts. The result distinguishes confirmed, verified failure, unknown, and not-run items; up to five batches are retained.
4. Reconcile unknown results before retrying. Compensation creates a new preview using each known original value. If an external change is detected, choose keep or overwrite and review the plan before confirming.

### In-app notes, tasks, and saved resources

1. **Notes**: enter a title and body, save a note, or keep a draft. Edit an existing note to view revisions and line differences or save a conflict branch. When leaving unsaved edits, choose Save / Keep and leave, Discard changes, or Continue editing.
2. **Recycle bin**: delete a test note, open the recycle bin, and restore it within the retention period. Check the selected test items before permanent deletion. Batch restore or deletion requires reviewing a preview and confirming a single root-document submission.
3. **Tasks**: select dates, review history, add or edit tasks, change completion state, and filter by completion. **Saved resources**: search by keyword, select a category, and change favorite markers or the favorites filter.
4. **Rules and display**: the rule center demonstrates local routing, task transitions, due dates and recurrence, tag search, filter chains, note save decisions, and recycle rules. Re-enter pages after changing the system language to inspect English or Chinese text, and check dark theme and long-text layouts on the device. Stored content, stable IDs, storage keys, protocol values, and Chinese search sample inputs remain unchanged.

## Project Structure

```text
Shortcut/
├── AppScope/                              # Application identity and resources
└── entry/
    └── src/
        ├── main/
        │   ├── ets/
        │   │   ├── entryability/EntryAbility.ets # Lifecycle and cold/warm entry
        │   │   ├── pages/Index.ets             # Home page
        │   │   ├── scenes/pages/               # Six business/detail/rule pages
        │   │   ├── scenes/data/                # Localized examples and fixed rule inputs
        │   │   ├── services/                   # API, visibility batches, storage, telemetry, Logger
        │   │   ├── model/                      # ShortcutModels and existing ShortcutScenes
        │   │   ├── i18n/                       # Context, shortcut text port, fallback and labels
        │   │   ├── business/                   # Notes, tasks, resources and business rules
        │   │   ├── navigation/                 # Want validation and routing
        │   │   └── components/                 # Shared UI and recycle panel
        │   └── resources/                      # English, Chinese, dark theme and shortcut profiles
        └── ohosTest/                           # Cases, fixtures, Runner and isolated UI
```

## Implementation

1. **Shortcut APIs and services**. [ShortcutApi.ets](<entry/src/main/ets/services/ShortcutApi.ets>) wraps the three `shortcutManager` APIs. [ShortcutService.ets](<entry/src/main/ets/services/ShortcutService.ets>) coordinates support, queries, visibility and batches. Pages and tests import these concrete local files; [ShortcutModels.ets](<entry/src/main/ets/model/ShortcutModels.ets>) holds the API view models alongside the existing scene catalog.
2. **Visibility batches**. [VisibilityBatch.ets](<entry/src/main/ets/services/VisibilityBatch.ets>) models previews and recorded outcomes; [BatchStorage.ets](<entry/src/main/ets/services/BatchStorage.ets>) stores `shortcut_visibility_batches_v1/journal`. An unknown marker precedes platform modification, and readback confirms the result. Reconciliation, retry and compensation retain distinct meanings.
3. **Launch and navigation**. [EntryAbility.ets](<entry/src/main/ets/entryability/EntryAbility.ets>) receives cold/warm Wants, [LaunchRequest.ets](<entry/src/main/ets/navigation/LaunchRequest.ets>) validates them, and [AppNavigation.ets](<entry/src/main/ets/navigation/AppNavigation.ets>) coordinates initialization, leave confirmation and routing. [ShortcutScenes.ets](<entry/src/main/ets/model/ShortcutScenes.ets>) keeps the application scene catalog in `entry`.
4. **Local workspace**. [BusinessStore.ets](<entry/src/main/ets/business/BusinessStore.ets>) manages notes, drafts, revisions, recycling, tasks and favorites. [BusinessStorage.ets](<entry/src/main/ets/business/BusinessStorage.ets>) stores `shortcut_business_v1/workspace` and reloads uncertain writes before retry. [NoteRecyclePanel.ets](<entry/src/main/ets/components/NoteRecyclePanel.ets>) is the application's recycle component and is also reused by isolated UI tests.
5. **Resources, diagnostics and testing**. [Strings.ets](<entry/src/main/ets/i18n/Strings.ets>) owns Context/resolver binding, the shortcut text port and its English fallback in one place; static UI uses `$r` where supported. [Logger.ets](<entry/src/main/ets/services/Logger.ets>) uses domain `0xF811` and tag `[Sample_Shortcut]`, while [BatchTelemetry.ets](<entry/src/main/ets/services/BatchTelemetry.ets>) records redacted stages and timings, not user content. [List.test.ets](<entry/src/ohosTest/ets/test/List.test.ets>) registers the suites; the [test guide](<ohosTest.md>) provides manual, controlled, native API and isolated UI scenarios, with an execution-record form and complete case index.

## Permissions

The main [module.json5](<entry/src/main/module.json5>) declares no `requestPermissions`. The `ForSelf` APIs manage this application's static shortcuts. See the [access control overview](https://github.com/openharmony/docs/blob/master/en/application-dev/security/AccessToken/Readme-EN.md) for permission definitions and requests.

## Dependencies

1. The single `entry` module uses its own local implementation files. There is no external Sample dependency or local feature-package dependency.
2. System APIs are supplied by the SDK; full module names and Kit imports are listed above.
3. Tests depend on [@ohos/hypium](https://gitee.com/openharmony/testfwk_arkxtest) `1.0.25`, declared in the [project package file](<oh-package.json5>). Device automation imports [@ohos.UiTest](https://github.com/openharmony/docs/blob/master/en/application-dev/reference/apis-test-kit/js-apis-uitest.md) and [@ohos.app.ability.abilityDelegatorRegistry](https://github.com/openharmony/docs/blob/master/en/application-dev/reference/apis-test-kit/js-apis-app-ability-abilityDelegatorRegistry.md) through `@kit.TestKit`.

## Constraints

1. The sample targets OpenHarmony standard-system devices; the configured device type is `default`. Desktop features require `SystemCapability.BundleManager.BundleFramework.Launcher` and a launcher supporting shortcuts. Notes, tasks, saved resources, and other local pages remain available on desktops without shortcut support.
2. `compileSdkVersion`, `targetSdkVersion`, and `compatibleSdkVersion` use SDK `26.0.0`; `modelVersion` uses project/build model version `26.0.0`. Use DevEco Studio and build tools compatible with both. See [test preparation](<ohosTest.md#测试范围与环境>) for environment requirements.
3. The application identity is `com.samples.shortcut`. Configure a matching development signature locally for deployment; do not submit personal certificates, private keys, or signing configuration.
4. Active notes and recycled notes are each limited to 50, history to 100 total revisions, and the root document to 8 MiB of UTF-8 data. Oversized writes are rejected. Recycle retention is 30 days; permanent deletion is irreversible, so use disposable test data.
5. Visibility batches execute item by item. Reconcile unknown states and follow the feedback for terminal permission errors, in-flight calls, and journal failures. Compensation plans use known original values; the platform provides no atomic batch rollback.
6. The rule center demonstrates local rules. Background alarms, network services, and cross-device synchronization are outside the sample's scope.

## Tests

The [test guide](<ohosTest.md>) includes basic operations, automated scenarios and the complete case index. Record actual device, version, scope and evidence with execution results.

## Download

Run the following commands in an empty directory using Git with `sparse-checkout` support. The sample directory is `code/BasicFeature/ApplicationModels/Shortcut/`.

```sh
git init
git sparse-checkout init --no-cone
git sparse-checkout set code/BasicFeature/ApplicationModels/Shortcut/
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```

If the sample is delivered on another branch, replace `master` with the actual branch containing it.
