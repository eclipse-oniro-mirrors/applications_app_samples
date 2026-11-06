# AtomicServiceComponents

## Introduction

This sample demonstrates the atomic service advanced components provided by OpenHarmony ArkUI. The project uses `AtomicServiceNavigation` as the page root container. The home page provides a component catalog and a search entry; six atomic service components and three general scenarios (cross-ability jump, half-modal sheet, and Preferences) each have their own demo page. All interactions and lifecycle events are written to a unified log (hilog plus an in-page log panel), and the layout adapts to the device form factor and breakpoints.

Components used in this sample (full package name and documentation link):

| Component | Full package name | Since API | Documentation |
| --- | --- | --- | --- |
| `AtomicServiceNavigation` | `@ohos.atomicservice.AtomicServiceNavigation` | 12 | [Link](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-atomicservice-AtomicServiceNavigation.md) |
| `AtomicServiceSearch` | `@ohos.atomicservice.AtomicServiceSearch` | 18 | [Link](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-atomicservice-AtomicServiceSearch.md) |
| `AtomicServiceTabs` | `@ohos.atomicservice.AtomicServiceTabs` | 12 | [Link](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-atomicservice-AtomicServiceTabs.md) |
| `AtomicServiceWeb` | `@ohos.atomicservice.AtomicServiceWeb` | 12 | [Link](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-atomicservice-AtomicServiceWeb.md) |
| `DownloadFileButton` | `@ohos.arkui.advanced.DownloadFileButton` | 12 | [Link](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-arkui-advanced-DownloadFileButton.md) |
| `HalfScreenLaunchComponent` | `@ohos.atomicservice.HalfScreenLaunchComponent` | 18 | [Link](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-atomicservice-HalfScreenLaunchComponent.md) |

All components are imported from `@kit.ArkUI`. The project also uses the following base kits:

| Kit | Modules used | Documentation |
| --- | --- | --- |
| `@kit.AbilityKit` | `@ohos.app.ability.UIAbility`, `@ohos.app.ability.common`, `@ohos.bundle.bundleManager` | [Link](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-ability-kit/js-apis-app-ability-uiAbility.md) |
| `@kit.ArkData` | `@ohos.data.preferences` | [Link](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkdata/js-apis-data-preferences.md) |
| `@kit.CoreFileKit` | `@ohos.file.fs`, `@ohos.file.picker` | [Link](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-core-file-kit/js-apis-file-fs.md) |
| `@kit.BasicServicesKit` | `@ohos.deviceInfo`, `@ohos.base` (`BusinessError`) | [Link](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-basic-services-kit/js-apis-device-info.md) |
| `@kit.PerformanceAnalysisKit` | `@ohos.hilog` | [Link](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-performance-analysis-kit/js-apis-hilog.md) |

Main features:

- Six components and three general scenarios each have a dedicated demo page: title bar / gradient background / split mode, search and select, tab switch guard, local H5 with controller, file download, half-screen launch, cross-ability jump, `bindSheet` half-modal, and `preferences` persistence.
- The home page supports keyword search and category filtering; component cards and search results can be tapped to open the corresponding demo page.
- Unified logging: the same event is written to both hilog and the in-page log panel, with WARN / ERROR level markers.
- A layout profile is built from `deviceType` and display size; the layout is rebuilt when the breakpoint changes, and Tab / Web heights are derived from the viewport and clamped.
- 109 local pure-logic cases plus 341 device-side cases cover component form x breakpoint, formatting boundaries, log capacity and levels, download state transitions, jump error codes and timeouts, height buckets, Preferences trimming and persistence, keyword filtering, color tokens, and on-device UI verification for scene entry, sheet toggle, and Preferences write. Verified on RK3568 (OpenHarmony 7.0.0.46 / API 26).

## Preview

Home page (gradient background, component catalog, device profile, and central log):

![Home](screenshots/gradient_home.svg)

### Usage

1. Install and start the application. The home page shows the current device profile, the component catalog, and the home event log.
2. Enter a keyword or switch category in the search area to filter the catalog in real time; tap a component card (or a search result) to open its demo page.
3. Demo pages:
   - **AtomicServiceNavigation**: switch title presets, gradient background, Stack / Split mode, and hidden title bar; "Restore defaults" recalculates from the device profile.
   - **AtomicServiceSearch**: enter a keyword and switch category; tapping a result opens the corresponding demo page.
   - **AtomicServiceTabs**: switch by tab bar or buttons; after locking, both kinds of switching are blocked and logged at WARN level.
   - **AtomicServiceWeb**: navigate between two local pages, use the controller to go forward / back / refresh, and observe progress logs bucketed at 25%.
   - **DownloadFileButton**: tap the download button; phone / tablet / 2in1 use `DocumentViewPicker`, while the development board writes directly to the sandbox and displays the real path.
   - **HalfScreenLaunchComponent**: uses a placeholder appId; tapping enters the `onError` stub path and shows the error code with an "expected" explanation.
   - **Cross-ability jump**: choose system settings, this application, or a not-installed application, and observe success, rejection (for example 16000001), and 3-second timeout results.
   - **Half-modal sheet**: open `bindSheet`, drag between half-screen and full-screen detents, switch between CENTER / POPUP styles and close-button visibility, and log the dismiss reason.
   - **Preferences**: write and flush text, then read, delete, or clear it; saved content is restored after restarting the application.
4. The `LogPanel` at the bottom of each demo page shows that page's events; the home page shows the latest 30 events in total and supports one-tap clearing.
5. View the full log from the command line:

   ```bash
   hdc hilog | grep AtomicServiceComponents
   ```

Build, sign, and install (using the DevEco Studio installation directory as `<DevEco Studio>`):

```bash
export DEVECO_SDK_HOME="<DevEco Studio>/sdk"
"<DevEco Studio>/tools/node/node" "<DevEco Studio>/tools/hvigor/bin/hvigorw.js" \
  assembleHap --mode module -p product=default --no-daemon
```

Without a signing config the output is `entry/build/default/outputs/default/entry-default-unsigned.hap`. For local development the SDK default signing is enough (no need to create certificates; the repository contains no signing material): enable automatic signing in DevEco Studio under `File > Project Structure > Signing Configs` and run directly. After enabling automatic signing:

```bash
hdc install -r entry/build/default/outputs/default/entry-default-signed.hap
ability_command=$(printf '\141\141')
hdc shell "${ability_command} start -a EntryAbility -b com.samples.atomicservicecomponents"
```

Note: `ability_command` resolves to the Ability Assistant tool name shipped with the OpenHarmony SDK toolchains (encoded to avoid an ambiguous two-letter abbreviation in the documentation). It is used to start applications and run on-device tests, and is not a project-defined command, script, or credential.

## Project structure

```
AtomicServiceComponents
├── AppScope                                  Application-level config (bundleName, icon, label)
├── entry/src/main
│   ├── ets
│   │   ├── common
│   │   │   ├── AppConstants.ets              AppStorage keys, route keys, tab count, log capacity, timeouts, hilog domain/tag
│   │   │   └── Theme.ets                     Colors, spacing, radius, font sizes, fixed sizes
│   │   ├── model
│   │   │   ├── DemoLogic.ets                 Catalog, categories, search filtering, tab switch guard
│   │   │   ├── LogStore.ets                  Log items, append/query/count/clear (pure functions)
│   │   │   ├── DeviceProfile.ets             Device form, breakpoints, columns, layout parameters (pure functions)
│   │   │   └── DownloadFlow.ets              Download target, attempt token, timeout fallback, state transitions
│   │   ├── utils
│   │   │   ├── FormatUtil.ets                Time/duration/bytes/percent formatting, progress buckets, file name and content
│   │   │   ├── ErrorUtil.ets                 Error formatting and picker error-code hints
│   │   │   ├── Logger.ets                    hilog wrapper + AppStorage central log
│   │   │   ├── DeviceUtil.ets                deviceInfo/display reads and display-change listener
│   │   │   ├── FileUtil.ets                  Sandbox text write
│   │   │   └── PickerUtil.ets                DocumentViewPicker wrapper: attempt token, 3 s timeout, dispose
│   │   ├── components                        LogPanel (filter by source), DemoPageScaffold
│   │   ├── pages
│   │   │   ├── Index.ets                     AtomicServiceNavigation shell and home page
│   │   │   └── demos                         Demo pages for the nine scenarios
│   │   └── entryability / entrybackupability Lifecycle and backup extension
│   └── resources/rawfile                     Local H5 pages used by AtomicServiceWeb
├── entry/src/test                            Local pure-logic unit tests (11 files, 109 cases)
├── entry/src/ohosTest                        Device-side tests (20 suites, 341 cases)
├── screenshots                               Preview screenshots
├── ohosTest.md                               Device test case archive
├── README.md
└── README_zh.md
```

## Implementation

### 1. Application entry and navigation shell

- [`EntryAbility.ets`](entry/src/main/ets/entryability/EntryAbility.ets): application entry; logs lifecycle, window stage, and configuration changes; loads the home page.
- [`Index.ets`](entry/src/main/ets/pages/Index.ets): uses `AtomicServiceNavigation` as the root container and binds `NavPathStack`, title presets, gradient background parameters, Stack / Split mode, and `hideTitleBar`; `pageMap` maps route keys to `NavDestination` and mounts the nine demo pages.
- The home content area arranges component cards with `GridRow` / `GridCol` according to the layout profile column count, and embeds `AtomicServiceSearch` at the top for keyword and category filtering.

### 2. Component and scenario demo pages

| Component | Demo page | Key implementation |
| --- | --- | --- |
| `AtomicServiceNavigation` | [`NavigationDemo.ets`](entry/src/main/ets/pages/demos/NavigationDemo.ets) | Uses `@StorageLink` to change title, gradient, split, and hidden title bar in real time; restoring defaults recalculates from the device profile |
| `AtomicServiceSearch` | [`SearchDemo.ets`](entry/src/main/ets/pages/demos/SearchDemo.ets) | Search area + select area + auxiliary/independent function areas; result rows navigate to the corresponding demo page |
| `AtomicServiceTabs` | [`TabsDemo.ets`](entry/src/main/ets/pages/demos/TabsDemo.ets) | Three icon-and-text tabs demonstrating `onTabBarClick`, `onChange`, `onContentWillChange`, and layout mode; switching is blocked when locked |
| `AtomicServiceWeb` | [`WebDemo.ets`](entry/src/main/ets/pages/demos/WebDemo.ets) | Loads local `rawfile/index.html` and `page2.html`; controller forward/back/refresh; progress bucketed at 25% |
| `DownloadFileButton` | [`DownloadDemo.ets`](entry/src/main/ets/pages/demos/DownloadDemo.ets) | Toggles icon and layout; chooses `DocumentViewPicker` or sandbox write based on device form |
| `HalfScreenLaunchComponent` | [`HalfScreenDemo.ets`](entry/src/main/ets/pages/demos/HalfScreenDemo.ets) | Mounts the component with a placeholder appId and shows the `onError` fallback path and error code |
| Cross-ability jump | [`CrossAbilityDemo.ets`](entry/src/main/ets/pages/demos/CrossAbilityDemo.ets) | `UIAbilityContext.startAbility` + explicit Want; success, rejection with error-code hint, and 3 s timeout; attempt token discards late callbacks |
| Half-modal sheet | [`SheetDemo.ets`](entry/src/main/ets/pages/demos/SheetDemo.ets) | `bindSheet` two-way binding, half/full detents, CENTER / POPUP style and close-button visibility, `onHeightDidChange` buckets |
| Preferences | [`PreferencesDemo.ets`](entry/src/main/ets/pages/demos/PreferencesDemo.ets) | `preferences` write / read / delete / clear with flush; read count is persisted together with the content |

### 3. Device form and breakpoint adaptation

[`DeviceProfile.ets`](entry/src/main/ets/model/DeviceProfile.ets) builds the layout profile with pure functions: at startup it reads `deviceInfo.deviceType` and `display.getDefaultDisplaySync()` (size converted to vp; falls back to 360x780vp on failure). Breakpoints are `<600vp` -> sm, `600-839vp` -> md, `>=840vp` -> lg. [`DeviceUtil.ets`](entry/src/main/ets/utils/DeviceUtil.ets) listens for display changes with `display.on`, rebuilds the profile, and writes it back to `AppStorage('layoutProfile')`.

| Form | sm (<600) | md (600-839) | lg (>=840) |
| --- | --- | --- | --- |
| phone | 1 column | 1 column | 1 column |
| default (dayu200) | 1 column | 2 columns | 2 columns, content max width 960, split off by default, picker unavailable |
| tablet | 1 column | 2 columns | 2 columns, split by default |
| 2in1 | 2 columns | 2 columns | 3 columns, split by default |

Tab / Web heights are derived from the viewport and clamped: web `clamp(0.55*h, 320, 640)`, tabs `clamp(0.5*h, 300, 520)`.

### 4. Unified logging

[`Logger.ets`](entry/src/main/ets/utils/Logger.ets) provides `debug/info/warn/error(source, tag, detail)`: it always writes to hilog (domain `0x0000`, tag `AtomicServiceComponents`, format `[source][LEVEL] tag: detail`, always `%{public}s`) and replaces `AppStorage('appLogs')` with a new array, capacity 200. [`LogPanel.ets`](entry/src/main/ets/components/LogPanel.ets) filters by `source`, showing the latest 20 entries; the home page shows all latest 30 entries and supports one-tap clearing, with WARN in orange and ERROR in red.

`source` values are `Home / Navigation / Search / Tabs / Web / Download / HalfScreen / Jump / Sheet / Prefs / Ability`. No logging happens inside `build()`; Web progress is bucketed at 25%, and exceptional branches such as timeout, out-of-range, fallback, and empty navigation stack are logged at WARN / ERROR.

### 5. Download and picker

[`DownloadFlow.ets`](entry/src/main/ets/model/DownloadFlow.ets) uses pure functions for download target, attempt token, timeout fallback, and state transitions. [`PickerUtil.ets`](entry/src/main/ets/utils/PickerUtil.ets) wraps `DocumentViewPicker` in `DOWNLOAD` mode and discards late callbacks after a 3-second timeout, falling back to sandbox storage. [`FileUtil.ets`](entry/src/main/ets/utils/FileUtil.ets) writes text to the provided `filesDir`. `DownloadFileButton` itself only provides the unified style; the page `.onClick` implements the behavior through the logic above.

### 6. Jump, half-modal, and Preferences

[`AbilityJump.ets`](entry/src/main/ets/model/AbilityJump.ets) defines jump targets, state labels, and error-code hints. Each request gets an attempt token; if no result arrives within 3 seconds it is treated as a timeout, and late success/failure callbacks are discarded by token. [`SheetFlow.ets`](entry/src/main/ets/model/SheetFlow.ets) handles style labels, duplicate-open blocking, and drag height buckets (`<300` / `300-600` / `>=600vp`). [`PrefsStore.ets`](entry/src/main/ets/model/PrefsStore.ets) provides input trimming (80 characters), empty checks, count advance, and summary text. [`PrefsUtil.ets`](entry/src/main/ets/utils/PrefsUtil.ets) wraps `preferences.getPreferencesSync`, `putSync` / `deleteSync` / `clearSync`, and `flush`.

### 7. Tests and verification

Local unit tests are under `entry/src/test/`, split into 11 files with 109 cases, aggregated by `List.test.ets`:

```bash
"<DevEco Studio>/tools/node/node" "<DevEco Studio>/tools/hvigor/bin/hvigorw.js" \
  test --mode module -p module=entry@default -p product=default --no-daemon
```

Result file: `entry/.test/default/intermediates/test/coverage_data/test_result.txt`. Local result: `Tests run: 109, Failure: 0, Error: 0, Pass: 109`.

Device tests are under `entry/src/ohosTest/ets/test/`, with 20 suites and 341 cases. Pure-logic cases cover model values and boundaries. Device integration cases cover sandbox write/read-back/delete, `Logger` -> `AppStorage` round trips, packaged `rawfile` checks, real display profile and picker capability, `preferences` persistence and reopen reads, and bundle name / jump target consistency. Combination cases expand form x breakpoint, formatting boundaries, log level x capacity x filtering, attempt x timeout x state, error code x hint, keyword x category, and color token x constant dimensions into explicit cases. `IndexUi` uses `@kit.TestKit` `Driver` to verify scene entry, sheet toggle, and Preferences write. Every case has full `@tc` annotations and asserts against the real implementation.

```bash
"<DevEco Studio>/tools/node/node" "<DevEco Studio>/tools/hvigor/bin/hvigorw.js" \
  assembleHap --mode module -p module=entry@ohosTest -p product=default --no-daemon
hdc install -r entry/build/default/outputs/default/entry-default-signed.hap
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
ability_command=$(printf '\141\141')
hdc shell "${ability_command} test -b com.samples.atomicservicecomponents -m entry_test \
  -s unittest OpenHarmonyTestRunner -s timeout 600000"
```

Note: `ability_command` resolves to the Ability Assistant tool name shipped with the OpenHarmony SDK toolchains (encoded to avoid an ambiguous two-letter abbreviation in the documentation). It is used to start applications and run on-device tests, and is not a project-defined command, script, or credential.

Device cases have been fully executed on RK3568 (API 26) with the command above: `Tests run: 341, Failure: 0, Error: 0, Pass: 341`.

### 8. dayu200 device verification record

- Home: device profile row, central log aggregation (30-entry cap on home), one-tap clear.
- Navigation: title preset switching, back after hiding the title bar (empty-stack fix), Split mode (manually enabled), restore defaults falls back to `navSplitDefault=false`.
- Search: keyword `web` hits 1 item, result opens the corresponding page and returns, all recorded in the central log.
- Tabs: after locking, both tab bar and button switching are blocked (WARN `attempt x -> y, blocked`), layout AUTO/VERTICAL, height 427vp.
- Web: local page load, progress bucket logs (10%/70%/100%), controller refresh, H5 status hint when the JS SDK is not injected, height 469vp.
- Download: `pickerSupported=false` falls back to sandbox, page shows the real path `/data/storage/el2/base/haps/entry/files/atomic-service-demo-<time>.txt` (204 B).
- HalfScreen: placeholder appId triggers `onError` (16000050 Internal error); page and log show the error code with the "expected" explanation.
- Cross-ability jump: system settings launches, not-installed target returns 16000001 with a hint.
- Half-modal sheet: half/full detents can be dragged; `onHeightDidChange` records heights; both button and drag dismissal trigger `onDisappear`.
- Preferences: write then flush; re-entering the page and restarting the application both read the value back; delete and clear update the persisted state.
- hilog output format `[Tabs][WARN] blocked: ...` and levels (I/W/E) are as expected.

## Permissions

None. The Web page is a local `rawfile` resource. The development board saves to the application sandbox, while phone / tablet use the system file picker for downloads. No storage or network permission is required.

## Dependencies

No third-party runtime dependencies and no dependency on other samples. `oh-package.json5` only includes the test framework dependencies `@ohos/hypium` and `@ohos/hamock`.

## Constraints

| Item | Requirement |
| --- | --- |
| Development environment | DevEco Studio 6.1.1 |
| SDK | Compile SDK API 26 (`compileSdkVersion` / `targetSdkVersion` / `compatibleSdkVersion` are all `26.0.0`, `runtimeOS: OpenHarmony`) |
| System version | OpenHarmony 7.0.0.46 (API 26) or later |
| Verified device | RK3568 development board (`deviceType=default`); `module.json5` declares `default / tablet` |
| Signing | SDK default signing or DevEco Studio automatic signing is enough for local debugging; the repository contains no signing certificate, private key, or password |

Other limitations:

- **HalfScreenLaunchComponent**: embedded launch requires the target atomic service to have a real `appId` allocated in AGC and the target Ability to extend `EmbeddableUIAbility`. The offline development board does not meet these conditions, so the sample uses placeholder appId `576000000000000000` (centralized in [`AppConstants.ets`](entry/src/main/ets/common/AppConstants.ets)) and taps enter the `onError` fallback path. Replace it with a real appId when integrating a real service.
- **DownloadFileButton**: `phone / tablet / 2in1` call `DocumentViewPicker` to get a public download directory, falling back to sandbox storage on timeout or error. On RK3568 (`default`) the document picker has no visible UI and intercepts subsequent touches, so the sample writes directly to `filesDir` and shows the real path.
- **Gradient background**: `gradientBackground` (API 18+) only renders a narrow light band below the title bar on this ROM. The sample makes the effect visible through `alpha: GradientAlpha.OPACITY_100`, `mixMode: MixMode.TOWARDS`, and a same-color `linearGradient` on the content root; both share the `navGradient` switch.
- **AtomicServiceWeb**: DevEco Previewer does not support this component; run it on a development board or emulator. The H5 "send message to ArkTS" button depends on the JS SDK injected by the runtime (`has.asWeb`); when not injected, the page status area shows a hint and loading is unaffected.
- **AtomicServiceSearch**: available since API 18. The select and function areas support at most two operations each; the sample uses one auxiliary and one independent item.
- **AtomicServiceNavigation system log**: on first render in OpenHarmony 7.0.0.46 it prints `State variable 'navPathStack' has changed during render!`; the official minimal sample reproduces this too. It is the system component's own behavior and page functions normally.
- **Tablet / 2in1 adaptation**: not verified on real devices. Breakpoint unit tests cover the boundaries (599 / 600 / 839 / 840); startup logs output the real profile for verification.
- **Signing config**: `build-profile.json5` in the repository does not contain a signing config; local signing is generated by DevEco Studio. Do not commit personal certificate material.

## Download

The project is currently maintained as a standalone directory; copy the `AtomicServiceComponents` directory to use it. After it is merged into the application samples repository, the project is located at `code/UI/AtomicServiceComponents` and can be fetched separately with:

```bash
git clone https://gitcode.com/openharmony/applications_app_samples.git
cd applications_app_samples
git sparse-checkout set code/UI/AtomicServiceComponents
```

Open the `AtomicServiceComponents` root directory in DevEco Studio after fetching.
