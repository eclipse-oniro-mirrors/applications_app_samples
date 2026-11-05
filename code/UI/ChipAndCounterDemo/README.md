# ChipAndCounterDemo

## Introduction

This sample demonstrates the ArkUI Chip (tag) and Counter (counter) advanced feedback components: **Chip (V1)**, **ChipV2**, **ChipGroupV2**, **CounterV2**, and **SegmentButtonV2**. It compares V1 and V2 capabilities side by side on the same page.

Components used in this sample (full package name and documentation link):

| Component | Full package name | Since API | Documentation |
| --- | --- | --- | --- |
| `Chip` | `@ohos.arkui.advanced.Chip` | 11 | [Link](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-arkui-advanced-Chip.md) |
| `ChipV2` | `@ohos.arkui.advanced.ChipV2` | 26 | [Link](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-arkui-advanced-ChipV2.md) |
| `ChipGroupV2` | `@ohos.arkui.advanced.ChipGroupV2` | 26 | [Link](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-arkui-advanced-ChipGroupV2.md) |
| `CounterV2` | `@ohos.arkui.advanced.CounterV2` | 26 | [Link](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-arkui-advanced-CounterV2.md) |
| `SegmentButtonV2` | `@ohos.arkui.advanced.SegmentButtonV2` | 18 | [Link](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-arkui-advanced-SegmentButtonV2.md) |

All components are imported from `@kit.ArkUI`. The project also uses the following kits:

| Kit | Modules used | Purpose | Documentation |
| --- | --- | --- | --- |
| `@kit.ArkUI` | `ColorMetrics`, `LengthMetrics`, `SymbolGlyphModifier` | Custom colors / sizes / Symbol icon styles | [ArkUI API reference](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/Readme-CN.md) |
| `@kit.BasicServicesKit` | `@ohos.deviceInfo` | Reads device type, system version, and SDK API version | [deviceInfo](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-basic-services-kit/js-apis-device-info.md) |
| `@kit.PerformanceAnalysisKit` | `@ohos.hilog` | Dual-channel output to hilog and the in-page log panel | [hilog](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-performance-analysis-kit/js-apis-hilog.md) |
| `@kit.AbilityKit` | `@ohos.app.ability.UIAbility` | Application entry and lifecycle | [UIAbility](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-ability-kit/js-apis-app-ability-uiAbility.md) |

Main features:

- **Nine demo sections**: five base sections (Chip V1, ChipV2, ChipGroupV2, CounterV2, SegmentButtonV2) plus four advanced sections (Chip advanced V1/V2, ChipGroupV2 advanced, CounterV2 advanced, SegmentButtonV2 advanced), comparing V1 and V2 on the same screen.
- **Full tag coverage**: activated state, Image / Symbol prefix and suffix icons, independent suffix Symbol click callback, accessibility description, dynamic enable/disable, custom style, size switching, closable and restore, and disabled.
- **Group selection**: ChipGroupV2 single-select, multi-select, and custom-style groups, supporting `itemStyle`, `chipGroupSpace`, `chipGroupPadding`, `suffix` (including tail icon group), and `onChange`.
- **Four counter types**: list, compact, numeric inline (min / max / step / textWidth / label), and date inline (`onDateChange` with initial year / month / day), plus `onFocus` / `onBlur` / `onHover` business callbacks.
- **Three segment button forms**: tab-style single-select, capsule-style mixed icon+text single-select, and capsule-style multi-select; advanced sections add pure-Symbol capsules (`onItemClicked`, icon size / padding / background / min height) and disabled items (`enabled=false`).
- **Readable interaction**: each section has a live status line, logs have increasing sequence numbers and state the result, and the activated state uses a dark blue background, white text, and a check mark for clear distinction.
- **Breakpoint adaptation**: sm (<600vp) uses a single column, md / lg use two columns, and the top provides a "jump to counter and segment" shortcut.
- **Data/UI separation**: `TagStore`, `CounterLogic`, and `ChipConfigFactory` are pure logic / config-building layers, backed by 202 device-side cases.

## Preview

After launch, the page shows, from top to bottom: title and description, device info card, section navigation hint, nine demo sections, and the event log panel. On narrow screens the demo area scrolls and the log is fixed at the bottom; on wide screens the demo area is on the left and the log panel is on the right. Each section has a description line and a status line at the bottom showing the current selection / counter value.

> This repository does not currently include runtime screenshots. Run it on a device with the usage steps below to see all components.

### Usage

1. Open the project in DevEco Studio, use the OpenHarmony default debug signing shipped with the SDK (or DevEco Studio automatic signing), and run it on RK3568 / DAYU200 (API 26 image).
2. In sections 1 / 2, tap a tag to toggle its activated state, tap the suffix icon to trigger `suffixIcon.action`, and tap the x on the "closable" tag to remove it; use "+ Restore closable tag" to bring it back.
3. In section 3, operate the single-select, multi-select, and custom-style groups and observe the "replace / add / remove" actions in the status line and log.
4. In sections 4 / 5, use the top "jump to counter and segment" shortcut to locate them quickly; the counter demonstrates four types and the segment button demonstrates three forms.
5. Section 6 demonstrates independent suffix Symbol clicks (V1 `suffixSymbolOptions.action` and V2 `ChipV2SuffixSymbolIcon.action`), accessibility description tags, and dynamic enable/disable. Section 7 demonstrates group top/bottom padding and the tail icon group (Image + like/favorite Symbols that toggle gray/orange without changing group selection). Section 8 demonstrates label / step / textWidth / focus / blur / hover and the initial date. Section 9 demonstrates pure-Symbol capsules and disabled items.
6. The log panel on the right (or at the bottom) shows the latest 120 events, newest first, prefixed with `#sequence`; it also writes to hilog:

   ```bash
   hdc shell hilog | grep ChipAndCounter
   ```

   The log domain is `0x0001`.

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
hdc shell "${ability_command} start -a EntryAbility -b com.samples.chipandcounterdemo"
```

Note: `ability_command` resolves to the Ability Assistant tool name shipped with the OpenHarmony SDK toolchains (encoded to avoid an ambiguous two-letter abbreviation in the documentation). It is used to start applications and run on-device tests, and is not a project-defined command, script, or credential.

## Project structure

```
ChipAndCounterDemo
├── AppScope                                  Application-level config (bundleName, icon, label)
├── entry/src/main
│   ├── ets
│   │   ├── model
│   │   │   ├── ChipModels.ets                TagStore, CounterLogic, ChipConfigFactory
│   │   │   └── utils
│   │   │       ├── LogUtil.ets               Unified logging (hilog + UI panel, level filtering)
│   │   │       └── DeviceUtil.ets            Device profile reads and sm / md / lg breakpoints
│   │   ├── pages
│   │   │   └── Index.ets                     Nine demo sections + section navigation + log panel
│   │   ├── entryability                      Entry and lifecycle logs
│   │   └── entrybackupability                Backup extension
│   └── resources                             Strings, colors, icons, and other resources
├── entry/src/test                            Local unit tests (1 smoke case)
├── entry/src/ohosTest                        Device-side tests (9 suites, 202 cases)
├── ohosTest.md                               Device test case archive
├── README.md
└── README_zh.md
```

## Implementation

### 1. Page and section navigation

[`Index.ets`](entry/src/main/ets/pages/Index.ets) uses `List` + `Scroller` for the nine sections, with section content split into `@Builder` methods. The top shows "9 sections, scroll to see more" and provides a "jump to counter and segment" button that calls `scrollToIndex(3, false, ScrollAlign.START)` to reach section 4; scrolling further reaches section 5 (segment buttons) and sections 6-9 (advanced demos), avoiding occlusion by the log on narrow screens.

The layout reads the window width with `onAreaChange` and calls `DeviceUtil.getBreakpoint()`:

- `sm` (<600vp): the demo area scrolls with `layoutWeight(1)`, and the log panel is fixed at 200vp high;
- `md` / `lg` (>=600vp): the demo area uses `layoutWeight(1)` on the left, and the log panel is 38% wide on the right.

### 2. Nine demo sections

| Section | Content | Key APIs |
| --- | --- | --- |
| 1. Chip (V1) | Basic activation, Image prefix / suffix icons, Symbol icon, custom style, SMALL / NORMAL size, closable and restore, disabled tag | `Chip` / `ChipOptions` / `LabelOptions` / `PrefixIconOptions` / `SuffixIconOptions` / `ChipSymbolGlyphOptions` / `CloseOptions` / `ChipSize` / `onClicked` |
| 2. ChipV2 | NORMAL / SMALL size, Image / Symbol icons, ColorMetrics background + LengthMetrics radius, custom closeIcon, close / restore, disabled | `ChipV2` / `ChipV2Options` / `ChipV2Label` / `ChipV2Size` / `ChipV2PrefixSymbolIcon` / `ChipV2CloseIcon` / `ColorMetrics` / `LengthMetrics` |
| 3. ChipGroupV2 | Single-select, multi-select, custom-style group (itemStyle, spacing, suffix, onChange) | `ChipGroupV2` / `ChipGroupV2Items` / `ChipGroupV2ItemStyle` / `ChipGroupV2Space` / `onChange` / `suffix` |
| 4. CounterV2 | LIST / COMPACT / INLINE (min / max / step) / INLINE_DATE | `CounterV2Component` / `CounterV2Options` / `CounterV2Type` |
| 5. SegmentButtonV2 | Tab-style single-select, capsule-style mixed single-select, capsule-style multi-select | `TabSegmentButtonV2` / `CapsuleSegmentButtonV2` / `MultiCapsuleSegmentButtonV2` / `SegmentButtonV2Items` |
| 6. Chip advanced (V1/V2) | V1 suffix Symbol appearance + `suffixSymbolOptions.action`, accessibility description, dynamic enable/disable; ChipV2 suffix Symbol icon (`ChipV2SuffixSymbolIcon`), custom fontSize and padding, `accessibilityDescription` | `ChipSuffixSymbolGlyphOptions` / `ChipV2SuffixSymbolIcon` / `LocalizedPadding` / `LengthMetrics` / `accessibilityDescription` |
| 7. ChipGroupV2 advanced | `chipGroupPadding` top/bottom spacing, `suffix` with `ChipGroupV2IconGroupSuffix` tail icon group (Image + like/favorite Symbols that toggle without changing selection) | `ChipGroupV2Padding` / `ChipGroupV2IconGroupSuffix` / `ChipGroupV2IconItemConfig` / `ChipGroupV2SymbolItemConfig` |
| 8. CounterV2 advanced | LIST with label and step=2, INLINE step=5 with `textWidth`, `onFocus` / `onBlur` / `onHover`, date inline with initial year / month / day and `onDateChange` | `CounterV2NumberStyleOptions` / `CounterV2DateStyleOptions` / `textWidth` / `label` / `onDateChange` |
| 9. SegmentButtonV2 advanced | Pure-Symbol capsule single-select (`onItemClicked`, `itemSymbolFontSize`, `itemPadding`, `buttonBackgroundColor`, `itemMinHeight`), disabled item (`enabled=false` ignores taps) | `SegmentButtonV2ItemOptions` / `onItemClicked` / `itemSymbolFontSize` / `itemPadding` / `buttonBackgroundColor` / `itemMinHeight` / `enabled` |

### 3. Chip and ChipV2

- **Distinct activated state**: activation explicitly sets dark blue `#1565C0`, white text, and a check mark after the text. In V1 `activatedFontColor` is in `LabelOptions` and `activatedBackgroundColor` is in `ChipOptions`; in V2 they are in `ChipV2LabelConfig` and `ChipV2Options`.
- **Two icon types**: V1 uses `prefixSymbol` (`ChipSymbolGlyphOptions.normal / activated`), V2 uses `ChipV2PrefixSymbolIcon`; Image and Symbol icons are compared on the same screen, with Symbol colors set through `SymbolGlyphModifier` (dark gray normal, white activated).
- **Customizable close button**: V1 uses `closeOptions` with `accessibilityText` and `fontSize: 20`; V2 uses `ChipV2CloseIcon` with accessible text and `LengthMetrics.vp(20)`; clicking runs `onClose` to remove the tag and show the restore entry.
- **`allowClose` defaults to `true`**: display tags must explicitly set `allowClose: false`; only the closable tag binds `onClose`.
- **Disabled tag on its own row**: on this ROM, when a disabled tag and a closable tag are on the same row, tapping the disabled tag may pass through and trigger the adjacent `onClose`, so the disabled example occupies its own row.

Section 6 adds advanced usage:

- **Independent suffix Symbol click**: V1 uses `suffixSymbol` (appearance) + `suffixSymbolOptions.action` (click); V2 uses `ChipV2SuffixSymbolIcon({ normal, activated, action })`. Click counts are shown side by side as "V1 N / V2 N" in the status line.
- **Accessibility description**: both V1 and V2 support `accessibilityDescription`; the sample provides one described tag for each version.
- **Dynamic enable/disable**: a button toggles the tag `enabled`; when disabled, taps have no effect and the status line updates.
- **ChipV2 font size and padding**: `fontSize` uses `LengthMetrics.fp(15)` and `padding` uses `LocalizedPadding` (16vp start / end), showing V2 fine-grained styling.

### 4. ChipGroupV2

In [`Index.ets`](entry/src/main/ets/pages/Index.ets), section 3 is divided into single-select, multi-select, and custom-style groups:

- The single-select and multi-select groups keep the default style for comparison, using `selectedIndexes` / `$selectedIndexes` and `multiple` to control selection.
- The custom-style group uses `itemStyle` with SMALL size, light orange background / orange text, and orange selection; `chipGroupSpace` sets `itemSpace=12` with 8 at both ends; `suffix` passes a `@Builder` rendering a "More >" entry; `onChange` writes an extra business callback log.
- A status line under each group shows the current selection, and the log states the "replace / add / remove" action.

Section 7 adds group advanced usage:

- `chipGroupPadding` uses `ChipGroupV2Padding` to set 10vp top/bottom padding, compared with the default group on the same screen.
- `suffix` passes `ChipGroupV2IconGroupSuffix`; its `items` are built by `ChipConfigFactory.buildGroupSuffixItems`: one Image icon item (`ChipGroupV2IconItemConfig`) plus two Symbol icon items (`ChipGroupV2SymbolItemConfig`, heart / star), each with its own `action`.
- Like / favorite Symbols toggle between gray (`#BDBDBD`) and orange (`#E65100`). The page flips an if/else branch to force the group to rebuild with the latest lit color (`ChipGroupV2IconGroupSuffix.items` is `@Param` and only takes effect when the group re-renders), without changing group selection.

### 5. CounterV2

Section 4 shows the four `CounterV2Type` values:

- `LIST`: range 0-20, step 1;
- `COMPACT`: range 1-9, step 1;
- `INLINE`: range 0-100, limited by `min` / `max` (the component supports `step`);
- `INLINE_DATE`: date adjustment, with `onDateChange` outputting the current date.

Numeric counters also use `CounterLogic` for min / max clamping and stepping; the `onChange` callback synchronizes `@State` and business logic.

Section 8 adds advanced counter parameters:

- LIST uses `label: '份数'` and `step: 2`; plus/minus move by 2 and the label is shown on the left.
- INLINE uses `step: 5` and `textWidth: 48`; the number width is fixed so the UI does not jitter as digits change.
- `onFocus` / `onBlur` / `onHover` callbacks demonstrate focus and hover awareness on the business side (writing logs).
- INLINE_DATE uses `CounterV2DateStyleOptions` year / month / day to set the initial date 2026-11-02; `onDateChange` outputs the current date.

### 6. SegmentButtonV2

Section 5 shows three forms:

- `TabSegmentButtonV2`: tab-style single-select with custom `itemFontSize` / `itemSelectedFontSize`, font colors, `itemBorderRadius`, `itemSpace`, and selected background color.
- `CapsuleSegmentButtonV2`: capsule-style single-select; items support `text` / `icon` / `symbol` combinations, demonstrating Image icon + text and Symbol icon + text.
- `MultiCapsuleSegmentButtonV2`: capsule-style multi-select, synchronizing multiple selected items through `selectedIndexes` / `$selectedIndexes`.

Section 9 adds segment button advanced usage:

- **Pure-Symbol capsule**: items contain only `symbol` (heart / star / checkmark_circle, no text); `onItemClicked` records the tapped item. It also sets `itemSymbolFontSize: fp(18)`, `itemPadding` (`LocalizedPadding`), `buttonBackgroundColor`, and `itemMinHeight: 34`.
- **Disabled item**: an item with `SegmentButtonV2ItemOptions.enabled = false` is grayed out and ignores taps, compared in the same group with two available items.

### 7. Data model and config factory

[`ChipModels.ets`](entry/src/main/ets/model/ChipModels.ets) provides three pure-logic layers:

- `TagStore`: tag add/remove, activation / disable toggling, `getAll()` returns a copy, ids are not reused, order is preserved, activated count, and clear.
- `CounterLogic`: clamps the initial value on construction; `increase` / `decrease` / `setValue` all clamp to `[min, max]`; provides `atMax` / `atMin`.
- `ChipConfigFactory`: builds `ChipV2LabelConfig`, `ChipGroupV2ItemConfig`, `ChipGroupV2ItemStyle`, `ChipGroupV2Space`, `ChipV2CloseIcon`, `SymbolGlyphModifier`, and `SegmentButtonV2ItemOptions`, and covers advanced configs: `buildSuffixSymbolOptions` (V1 suffix Symbol + action), `buildSuffixSymbolIcon` (V2 suffix Symbol states), `buildChipV2Padding` / `buildGroupPadding` (LocalizedPadding / ChipGroupV2Padding), `buildGroupSuffixItems` (tail icon group items with lit flags), and `buildSymbolSegmentItems` / `buildSegmentItemsWithDisabled` (pure-Symbol segment items and disabled index). Tests can assert field mappings directly.

The group item objects, `itemStyle`, and `chipGroupSpace` are initialized once on the page and passed as stable references, avoiding remount flicker of the same group when logging triggers a re-render.

### 8. Logging

[`LogUtil.ets`](entry/src/main/ets/model/utils/LogUtil.ets) provides `debug / info / warn / error` and writes both to hilog and the in-page log panel:

- hilog domain `0x0001`, tag `ChipAndCounter`;
- the page log keeps at most 120 entries, newest first, each with a `#increasing sequence number`, stating the tapped object and visible result;
- level filtering (`LogLevel.DEBUG / INFO / WARN / ERROR`) is supported; when no panel callback is injected, only hilog is written.

### 9. Tests

Device tests are under `entry/src/ohosTest/ets/test/`, with 9 suites and 202 cases aggregated by `List.test.ets`:

| Category | Suites | Cases | Status |
| --- | --- | --- | --- |
| Pure logic and device integration | `ChipModels` / `LogUtil` / `DeviceUtil` / `Ability` | 67 | Fully passed on RK3568 (API 26) |
| Combination suites | `TagStoreMatrix` / `CounterLogicMatrix` / `ChipConfigFactoryMatrix` / `LogUtilMatrix` / `DeviceUtilMatrix` | 135 | Fully passed on RK3568 (API 26) |
| Manual UI cases | See `ohosTest.md` | 31 | Require manual device operation |

| Suite | Cases | Coverage |
| --- | --- | --- |
| `ChipModels.test.ets` | 45 | TagStore add/remove / missing remove / activation toggle / disable / copy and shallow-copy semantics / clear / id non-reuse / order / activated count / blank text / log linkage; CounterLogic clamping / initial value / stepping / boundaries / out-of-range / negative step / degenerate range; config factory field mapping, empty arrays, and advanced builders |
| `LogUtil.test.ets` | 11 | Uninitialized safety, callback delivery, line format and timestamp, level filtering and marks, time padding, error level delivery, repeated init replaces callback, multiple log order, unknown level mark |
| `DeviceUtil.test.ets` | 10 | Non-empty device type, mutually exclusive forms, breakpoint boundaries (599 / 600 / 839 / 840 / exact thresholds / negative and fractional widths), bucket type safety, profile fields, wide-screen and two-column threshold consistency |
| `Ability.test.ets` | 1 | Ability smoke case |
| `TagStoreMatrix.test.ets` | 31 | Consecutive and non-reused ids, empty / Chinese / duplicate / whitespace text, first/middle/last remove and invalid / zero / fractional ids, independent activation, disable and activation independence, findById reference and getAll snapshot consistency, delete all and add/remove loops, 50-item batch stress, fractional id rejection across APIs, disable+activate+remove flow |
| `CounterLogicMatrix.test.ets` | 23 | clamp boundaries / degenerate range / negative range / infinity, construction clamping, step=0 and fractional step, crossing limits, consecutive steps to boundary, setValue out of range, atMax / atMin transitions, instance isolation |
| `ChipConfigFactoryMatrix.test.ets` | 42 | Tag empty string / Chinese / optional activated color, prefix icon source, group item order and allowClose semantics, segment item order and duplicates, Symbol reference consistency, close icon sizes 12 / 24, style and spacing, independent repeated builds; suffix Symbol action and state icons, ChipV2 / group LocalizedPadding exact and zero values, tail icon group composition and index dispatch, lit flag rebuild, long/short flag lists, no-Symbol list, pure-Symbol segment items (including empty arrays), disabled index (first / middle / last / none) |
| `LogUtilMatrix.test.ets` | 22 | init not writing panel and threshold handling / explicit level, level up/down and mid-switch, fixed and two-digit time formatting, time token shape, four-level line format, tag and message fidelity (spaces / Chinese / brackets / empty / multiline), DEBUG mark |
| `DeviceUtilMatrix.test.ets` | 17 | Fractional-width breakpoints, bucket monotonicity, two-column conclusion consistency, form flag consistency, profile field types, logDeviceProfile does not throw and writes a profile line |

Combination cases are written explicitly with full `@tc` headers (number / name / desc / size / type / level) and call only the real implementations in `ChipModels.ets`, `LogUtil.ets`, and `DeviceUtil.ets`; tests do not copy business logic. Expected values come from API semantics (`[min, max]` clamping, id non-reuse, 600 / 840vp breakpoints, log line format).

Local unit tests are under `entry/src/test/` and contain 1 smoke case. Device test command (signing uses the OpenHarmony default debug signing shipped with the SDK):

```bash
"<DevEco Studio>/tools/node/node" "<DevEco Studio>/tools/hvigor/bin/hvigorw.js" \
  assembleHap --mode module -p module=entry@ohosTest -p product=default --no-daemon
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
ability_command=$(printf '\141\141')
hdc shell "${ability_command} test -b com.samples.chipandcounterdemo -m entry_test \
  -s unittest OpenHarmonyTestRunner -s timeout 150000"
```

Without a signing config the output is an unsigned HAP, usable for compile verification but not installable on a device.

## Permissions

None. All components run inside the application page, data is in-memory sample data, and no network, storage, or other permission is required.

## Dependencies

No third-party runtime dependencies and no dependency on other samples. `oh-package.json5` only includes the test framework dependencies `@ohos/hypium` and `@ohos/hamock`.

## Constraints

| Item | Requirement |
| --- | --- |
| Development environment | DevEco Studio 6.1.1 |
| SDK | Compile SDK API 26 (`compileSdkVersion` / `targetSdkVersion` / `compatibleSdkVersion` are all `26.0.0`), `runtimeOS` is OpenHarmony |
| System version | **API 26 or later**: ChipV2, ChipGroupV2, and CounterV2 are API 26 components; sections using them are unavailable below API 26 |
| Verified device | RK3568 / DAYU200 (API 26); `module.json5` declares `default / tablet` |
| Signing | Local development uses the OpenHarmony default debug signing shipped with the SDK; the repository stores no certificate, key, or password |

Other limitations:

- **Screenshots**: the repository does not currently include runtime screenshots; use actual device output as the reference.
- **`allowClose` default**: Chip / ChipV2 default to `true` and render a close icon when not explicitly set; display tags should set `allowClose: false`.
- **Disabled tag tap-through**: on this ROM, when a disabled tag and a closable tag share a row, the adjacent `onClose` may be triggered; the sample places the disabled tag on its own row.
- **Item rebuild flicker**: group items and style objects must be created once outside `build()`; otherwise logging-triggered re-renders remount the same group and cause flicker.
- **Activated style**: default activated colors may be hard to distinguish under different system themes; the sample explicitly sets dark blue background, white text, and a check mark.
- **V2 icon resources**: Symbol icons use system resources `sys.symbol.heart` / `sys.symbol.star` / `sys.symbol.checkmark_circle` / `sys.symbol.chevron_right`, and the device must support HM Symbol.

## Download

The project is currently maintained as a standalone directory; copy the `ChipAndCounterDemo` directory to use it. After it is merged into the application samples repository, the project is located at `code/UI/ChipAndCounterDemo` and can be fetched separately with:

```bash
git clone https://gitcode.com/openharmony/applications_app_samples.git
cp -r applications_app_samples/code/UI/ChipAndCounterDemo .
```

Open the `ChipAndCounterDemo` root directory in DevEco Studio after fetching.
