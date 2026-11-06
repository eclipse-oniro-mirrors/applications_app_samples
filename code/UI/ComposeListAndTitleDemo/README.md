# ComposeListAndTitleDemo

## Introduction

This sample demonstrates the ArkUI composed list and title bar advanced components: **ComposeListItem (V1)**, **ComposeListItemV2**, **ComposeTitleBar (V1)**, and **ComposeTitleBarV2**. It compares the V1 and V2 type systems and capabilities side by side on the same page. `ComposeListItemV2` and `ComposeTitleBarV2` are new in API 26.

Components used in this sample (full package name and documentation link):

| Component | Full package name | Since API | Documentation |
| --- | --- | --- | --- |
| `ComposeListItem` | `@ohos.arkui.advanced.ComposeListItem` | 10 | [ComposeListItem](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-arkui-advanced-ComposeListItem.md) |
| `ComposeListItemV2` | `@ohos.arkui.advanced.ComposeListItemV2` | 26 | [ComposeListItemV2](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-arkui-advanced-ComposeListItemV2.md) |
| `ComposeTitleBar` | `@ohos.arkui.advanced.ComposeTitleBar` | 10 | [ComposeTitleBar](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-arkui-advanced-ComposeTitleBar.md) |
| `ComposeTitleBarV2` | `@ohos.arkui.advanced.ComposeTitleBarV2` | 26 | [ComposeTitleBarV2](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-arkui-advanced-ComposeTitleBarV2.md) |

All components are imported from `@kit.ArkUI`. The project also uses the following kits:

| Kit | Modules used | Purpose | Documentation |
| --- | --- | --- | --- |
| `@kit.ArkUI` | `ComposeListItem(V2)`, `ComposeTitleBar(V2)`, `IconType`, `ContentItem`, `OperateItem` | List item / title bar components and config types | [ArkUI API reference](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/Readme-CN.md) |
| `@kit.BasicServicesKit` | `@ohos.deviceInfo` | Reads device type, system version, and SDK API version | [deviceInfo](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-basic-services-kit/js-apis-device-info.md) |
| `@kit.PerformanceAnalysisKit` | `@ohos.hilog` | Dual-channel output to hilog and the in-page log panel | [hilog](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-performance-analysis-kit/js-apis-hilog.md) |
| `@kit.AbilityKit` | `@ohos.app.ability.UIAbility` | Application entry and lifecycle | [UIAbility](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-ability-kit/js-apis-app-ability-uiAbility.md) |

Main features:

- **Two title bar versions**: the page top uses ComposeTitleBar (V1, avatar + title + subtitle + refresh / settings menu); section 1 uses ComposeTitleBarV2, whose subtitle `N people, M online` updates in real time with the data store.
- **Full V1 list item operations**: besides the contact list (avatar + primary / secondary text + arrow), it independently covers switch, button, checkbox, radio, double icon, image, and text operation areas.
- **List item V2**: the V2 version over the same data; the `toggle` switch updates the data store and covers button, arrow, checkbox, double icon, text, and three-line text.
- **Icon tiers**: BADGE (8vp), NORMAL_ICON (16vp), SYSTEM_ICON (24vp), HEAD_SCULPTURE (40vp), APP_ICON (64vp), and PREVIEW (96vp) compared on the same screen.
- **Live search filtering**: filters contacts by name or department keyword, and the list and title bar counts refresh together.
- **Readable interaction**: menu, arrow, switch, button, checkbox, and other interactions all write timestamped logs; the panel shows newest first, up to 120 entries.
- **Breakpoint adaptation**: sm (<600vp) uses a single column; md / lg use two columns.
- **Data/UI separation**: `ContactStore` and `ListConfigFactory` are pure logic / config-building layers, backed by 158 device-side cases.

## Preview

After launch, the page shows, from top to bottom: ComposeTitleBar (V1) title bar, device info row, search box, ComposeTitleBarV2 section, ComposeListItem (V1) section, and ComposeListItemV2 section. On narrow screens the log panel is fixed at the bottom at 200vp; on wide screens it is on the right and takes 38%.

> This repository does not currently include runtime screenshots. Run it on a device with the usage steps below to see all components.

### Usage

1. Open the project in DevEco Studio, use the OpenHarmony default debug signing shipped with the SDK (or DevEco Studio automatic signing), and run it on RK3568 / DAYU200 (API 26 image).
2. Tap the avatar, "Refresh", and "Settings" on the top title bar and observe the log; tapping "Refresh" updates the list and title bar count together.
3. Enter a name or department keyword in the search box to filter the list in real time; clear the keyword to restore all contacts.
4. In section 2 (V1) and section 3 (V2), operate the arrow, switch / toggle, button, checkbox, and double icons and observe the log; V2 contact switches also update the online count, and the section 1 subtitle follows.
5. The log panel on the right (or at the bottom) shows the latest 120 events, newest first; it also writes to hilog:

   ```bash
   hdc shell hilog | grep ComposeList
   ```

   The hilog domain is `0x0001`.

Build from the command line:

```bash
export DEVECO_SDK_HOME="<DevEco Studio>/sdk"
"<DevEco Studio>/tools/node/node" "<DevEco Studio>/tools/hvigor/bin/hvigorw.js" \
  assembleHap --mode module -p product=default --no-daemon
```

Without a signing config the output is `entry/build/default/outputs/default/entry-default-unsigned.hap`. For local development use the OpenHarmony default debug signing shipped with the SDK (the repository stores no certificates or passwords), or use DevEco Studio automatic signing and run directly; you can also build from the command line and sign with your own material, then run:

```bash
hdc install -r <signed HAP>
ability_command=$(printf '\141\141')
hdc shell "${ability_command} start -a EntryAbility -b com.samples.composelistandtitledemo"
```

Note: `ability_command` resolves to the Ability Assistant tool name shipped with the OpenHarmony SDK toolchains (encoded to avoid an ambiguous two-letter abbreviation in the documentation). It is used to start applications and run on-device tests, and is not a project-defined command, script, or credential.

## Project structure

```
ComposeListAndTitleDemo
├── AppScope                                  Application-level config (bundleName, icon, label)
├── entry/src/main
│   ├── ets
│   │   ├── model
│   │   │   ├── ListModels.ets                ContactStore and ListConfigFactory (V1 / V2)
│   │   │   └── utils
│   │   │       ├── LogUtil.ets               Unified logging (hilog + UI panel, level filtering)
│   │   │       └── DeviceUtil.ets            Device profile reads and sm / md / lg breakpoints
│   │   ├── pages
│   │   │   └── Index.ets                     Title bar + search + 3 demo sections + log panel
│   │   ├── entryability                      Entry and lifecycle logs
│   │   └── entrybackupability                Backup extension
│   └── resources                             Strings, colors, icons, and other resources
├── entry/src/test                            Local unit tests (1 smoke case)
├── entry/src/ohosTest                        Device-side tests (8 suites, 158 cases)
├── ohosTest.md                               Device test case archive
├── README.md
└── README_zh.md
```

## Implementation

### 1. Page structure

[`Index.ets`](entry/src/main/ets/pages/Index.ets) uses a `Column` as the page: ComposeTitleBar (V1) is fixed at the top, followed by the device info row, search box, and demo area; the log panel position changes with the breakpoint.

- `sm` (<600vp): the demo area uses `Scroll` + `layoutWeight(1)`, and the log panel is fixed at 200vp high;
- `md` / `lg` (>=600vp): the demo area uses `layoutWeight(1)` on the left, and the log panel is 38% wide on the right.

The breakpoint is computed by [`DeviceUtil.getBreakpoint()`](entry/src/main/ets/model/utils/DeviceUtil.ets) from the window width read in the root container's `onAreaChange` (thresholds 600vp and 840vp), and switching writes a log.

### 2. Title bar V1 and V2

- The V1 title bar title is "List and title", and the subtitle describes the four components; the right menu items "Refresh" and "Settings" and the avatar all bind callbacks and write logs. Tapping "Refresh" re-runs `ContactStore.search()` and records the current displayed count.
- The ComposeTitleBarV2 in section 1 uses `title`, `subtitle`, `item`, and `menuItems`; the subtitle is built from `store.count()` and `store.onlineCount()` and refreshes automatically when data changes.

### 3. ComposeListItem (V1)

Section 2 drives the list from contact data and covers:

- **Content**: `IconType.HEAD_SCULPTURE` avatar + primary text (name) + secondary text (department + phone);
- **Operations**: arrow (`OperateItem` arrow), switch, button, checkbox, radio, double icon (icon + subIcon), plus text and image operation areas;
- **Icon tiers**: BADGE (8vp badge), NORMAL_ICON (16vp), SYSTEM_ICON (24vp), APP_ICON (64vp), PREVIEW (96vp);
- **Three-line text**: `primaryText` + `secondaryText` + `description`, with description supporting line breaks.

### 4. ComposeListItemV2

Section 3 builds the V2 version over the same contacts:

- `new ContentItemV2(options)` and `new OperateItemV2(options)` build the config objects;
- the switch field changes from V1 `switch` to `toggle`; toggling calls `store.toggleOnline(id)` and `refreshList()`, and the log records the result;
- covers toggle, button, arrow, checkbox, double icon, text operation area, and PREVIEW tier + three-line text.

### 5. V1 vs V2 type differences

| Item | V1 | V2 |
| --- | --- | --- |
| Config construction | `ContentItem` / `OperateItem` are constructor-less classes; literals need an explicit `as` type | `ContentItemV2` / `OperateItemV2` have `constructor(options?)` and use `new` |
| Switch field | `switch` | `toggle` |
| Icon enum | `IconType` | `IconTypeV2` |
| Component properties | `contentItem` / `operateItem` | `contentItemV2` / `operateItemV2` |

The page encapsulates the differences in `ListConfigFactory`, so business code does not need to know the field names.

### 6. Data model and config factory

[`ListModels.ets`](entry/src/main/ets/model/ListModels.ets) provides two pure-logic layers:

- `ContactStore`: `add` / `remove` / `toggleOnline` / `search` / `findById` / `getAll` (returns a copy) / `count` / `onlineCount` / `clear`; ids increase monotonically and are not reused after deletion.
- `ListConfigFactory`: V1 / V2 builders covering content items (including the three-line description), eight operation areas (arrow, switch / toggle, button, checkbox, radio, double icon, image, text), and title bar menu items. Tests can assert field mappings directly and invoke callbacks manually.

### 7. Logging

[`LogUtil.ets`](entry/src/main/ets/model/utils/LogUtil.ets) provides `debug / info / warn / error` and writes both to hilog and the in-page log panel:

- hilog domain `0x0001`, tag `ComposeListTitle` (`EntryAbility` uses tag `ComposeListAndTitle`, and `grep ComposeList` covers both);
- the page log keeps at most 120 entries, newest first;
- level filtering (`LogLevel.DEBUG / INFO / WARN / ERROR`) is supported; when no panel callback is injected, only hilog is written.

### 8. Tests

Device tests are under `entry/src/ohosTest/ets/test/`, with 8 suites and 158 cases aggregated by `List.test.ets`:

| Category | Suites | Cases | Status |
| --- | --- | --- | --- |
| Pure logic and device integration | `Ability` / `DeviceUtil` / `LogUtil` / `ListModels` | 59 | Fully passed on RK3568 (API 26) |
| Combination suites | `ContactStoreMatrix` / `ListConfigFactoryMatrix` / `LogUtilMatrix` / `DeviceUtilMatrix` | 99 | Fully passed on RK3568 (API 26) |
| Manual UI cases | See `ohosTest.md` | 17 | Require manual device operation |

| Suite | Cases | Coverage |
| --- | --- | --- |
| `ListModels.test.ets` | 36 | ContactStore add/remove / missing remove / online toggle / search (including special characters and partial keywords) / copy return / clear / id non-reuse and monotonic increase / findById (15); add log line (1); config factory V1/V2 content items, 7 operation areas, menu items, field passthrough (20) |
| `LogUtil.test.ets` | 12 | Callback delivery, line format and timestamp, level filtering and marks, time padding, error level delivery, repeated init replaces callback, omitted level keeps minimum, uninitialized call does not throw, multiline message order, unknown level mark |
| `DeviceUtil.test.ets` | 10 | Non-empty device type, mutually exclusive forms, breakpoint boundaries (599 / 600 / 839 / 840), profile fields, wide-screen and two-column threshold consistency, extremes, fractional and negative widths |
| `Ability.test.ets` | 1 | Ability smoke case |
| `ContactStoreMatrix.test.ets` | 31 | Id starts at 1 continuously and continues after clear, empty / Chinese / Emoji names, field preservation and default offline, first/middle/last and repeated remove, invalid id, fractional id rejection, 50-contact batch id continuity, independent online states and rollback, case-insensitive / Chinese partial / blank / no-hit / after-delete search, findById reference consistency, add/remove cycle keeps order |
| `ListConfigFactoryMatrix.test.ets` | 30 | V1 / V2 icon tier variants and Resource icons, three-line text all fields, V1 switch / checkbox / radio initial states and callbacks, V2 toggle / checkbox / radio, button and text empty strings, image Resource, independent double-icon callbacks, operation field isolation, menu item empty value fidelity and Unicode, builders return new instances each time, field omission without description |
| `LogUtilMatrix.test.ets` | 21 | init does not write panel and replaces callback while keeping level, level up/down and mid-switch, ERROR threshold, enum order, fixed-time formatting (03:04:05 / 00:00:00 / 09:09:09 / 12:00:00 / 23:00:00 / 12:34:56 / 23:45:59 / 10:00:00), four-level line format, tag and message fidelity, empty and multiline messages |
| `DeviceUtilMatrix.test.ets` | 17 | Breakpoints 480 / 1024 / 599.9 / 600.1 / 839.9 / 840.1 / 1366, bucket monotonicity, sm single column and md / lg two columns, stable repeated query at the same width, form flags match deviceType, profile field types, logDeviceProfile does not throw and delivers the log line |

Combination cases are written explicitly with full `@tc` headers (number / name / desc / size / type / level) and call only the real implementations in `ListModels.ets`, `LogUtil.ets`, and `DeviceUtil.ets`; tests do not copy business logic. Expected values come from API semantics (monotonic non-reused ids, case-insensitive search, V1 / V2 field mapping, log line format, 600 / 840vp breakpoints).

Local unit tests are under `entry/src/test/` and contain 1 smoke case. Device test command (signing uses the OpenHarmony default debug signing shipped with the SDK):

```bash
"<DevEco Studio>/tools/node/node" "<DevEco Studio>/tools/hvigor/bin/hvigorw.js" \
  assembleHap --mode module -p module=entry@ohosTest -p product=default --no-daemon
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
ability_command=$(printf '\141\141')
hdc shell "${ability_command} test -b com.samples.composelistandtitledemo -m entry_test \
  -s unittest OpenHarmonyTestRunner -s timeout 150000"
```

Without a signing config the output is an unsigned HAP, usable for compile verification but not installable on a device.

## Permissions

None. Component data is in-memory sample data and icons come from project resources; no network, storage, or other permission is required.

## Dependencies

No third-party runtime dependencies and no dependency on other samples. `oh-package.json5` only includes the test framework dependencies `@ohos/hypium` and `@ohos/hamock`.

## Constraints

| Item | Requirement |
| --- | --- |
| Development environment | DevEco Studio 6.1.1 |
| SDK | Compile SDK API 26 (`targetSdkVersion 26.0.0`), `compatibleSdkVersion 6.1.1(24)` |
| System version | **API 26 or later**: ComposeListItemV2 and ComposeTitleBarV2 are API 26 components; the V2 sections are unavailable below API 26 |
| Verified device | RK3568 / DAYU200 (API 26); `module.json5` declares `phone / tablet / 2in1` |
| Signing | Local development uses the OpenHarmony default debug signing shipped with the SDK; the repository stores no certificate, key, or password |

Other limitations:

- **V1 literal types**: `ContentItem` / `OperateItem` and other V1 types have no constructor; object literals must use an explicit `as` type, otherwise ArkTS strict mode fails to compile.
- **V2 construction**: V2 types must be built with `new` + the Options interface; writing literals directly does not compile.
- **Field name differences**: the V1 switch field is `switch` and the V2 field is `toggle`; migration must update both.
- **Screenshots**: the repository does not currently include runtime screenshots; use actual device output as the reference.
- **Tablet / 2in1 adaptation**: not verified on real devices. Breakpoint unit tests cover the 599 / 600 / 839 / 840 boundaries, and the startup log outputs the real device profile for verification.

## Download

The project is currently maintained as a standalone directory; copy the `ComposeListAndTitleDemo` directory to use it. After it is merged into the application samples repository, the project is located at `code/UI/ComposeListAndTitleDemo` and can be fetched separately with:

```bash
git clone https://gitcode.com/openharmony/applications_app_samples.git
cp -r applications_app_samples/code/UI/ComposeListAndTitleDemo .
```

Open the `ComposeListAndTitleDemo` root directory in DevEco Studio after fetching.
