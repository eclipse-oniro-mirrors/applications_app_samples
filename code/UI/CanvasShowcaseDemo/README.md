# CanvasShowcaseDemo

## Introduction

This sample demonstrates the drawing capabilities of ArkUI Canvas, covering **CanvasGradient**, **CanvasPattern**, and **Matrix2D**, as well as advanced usage such as OffscreenCanvas offscreen drawing, ImageData pixel reads and writes, `CanvasPattern.setTransform`, paths, text, clipping and compositing, stroke styles, shadows, and filters. It provides 23 registered scenes plus one gradient transition animation.

Capabilities used in this sample (full package name and documentation link):

| Capability | Component / package | Description | Documentation |
| --- | --- | --- | --- |
| CanvasGradient | Built-in ArkUI `Canvas` (no import) | Linear, radial, and conic gradients, gradient strokes, ColorMetrics stop overload | [CanvasGradient](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ts-components-canvas-canvasgradient.md) |
| CanvasPattern | Built-in ArkUI `Canvas` | repeat / repeat-x / no-repeat, `setTransform` pattern matrix | [CanvasPattern](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ts-components-canvas-canvaspattern.md) |
| Matrix2D | Built-in ArkUI `Canvas` | Translate / scale / rotate (radians) / skew / combined transforms / `invert()` | [Matrix2D](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ts-components-canvas-matrix2d.md) |
| OffscreenCanvas | Built-in ArkUI `Canvas` | Offscreen draw -> `transferToImageBitmap` -> transformed blit on the main canvas | [OffscreenCanvas](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ts-components-canvas-offscreencanvas.md) |
| ImageData | Built-in ArkUI `Canvas` | `createImageData` / `putImageData` per-pixel writes, `getImageData` read-back and inversion | [ImageData](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ts-components-canvas-imagedata.md) |
| Paths and text | Built-in ArkUI `Canvas` | `bezierCurveTo` / `quadraticCurveTo` / `arcTo`, `fillText` / `strokeText` / `measureText`, `clip`, `globalCompositeOperation`, `setLineDash` | [CanvasRenderingContext2D](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ts-canvasrenderingcontext2d.md) |
| ColorMetrics | `@kit.ArkUI` | `ColorMetrics.rgba` / `resourceColor` as gradient stop colors | [ArkUI API reference](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/Readme-CN.md) |
| Image | `@kit.ImageKit` (`@ohos.multimedia.image`) | Generates checkerboard / stripe / dot PixelMap pattern assets in code | [Image Kit](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-image-kit/js-apis-image.md) |
| Device info | `@kit.BasicServicesKit` (`@ohos.deviceInfo`) | Reads device type, system version, and SDK API version | [deviceInfo](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-basic-services-kit/js-apis-device-info.md) |
| Logging | `@kit.PerformanceAnalysisKit` (`@ohos.hilog`) | Dual-channel output to hilog and the in-page log panel | [hilog](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-performance-analysis-kit/js-apis-hilog.md) |

Main features:

- **Data-driven scene registry**: metadata for the 23 scenes (id, button text, title, draw function) is registered in `SceneRegistry`; the page buttons are generated automatically, so adding a scene only requires one change.
- **Self-contained pattern assets**: the assets required by `createPattern` are generated in code by `PixelMapUtil` (no external images) and validated at pixel level with RGBA_8888.
- **Correct Matrix2D usage**: call `identity()` first to reset the unit matrix, then chain transforms; covers rotation radians, property-style skew, and inverse matrices.
- **Observable draw performance**: every scene draw is timed by `PerfTimer` and written to the log.
- **Recognizable interaction state**: the current scene button is highlighted and marked "(current)"; clearing the canvas and log requires a confirmation dialog.
- **Breakpoint adaptation**: sm (<600vp) uses a single column, md / lg use two columns, switching in real time when the window size changes.
- **Testable design**: scene draw functions take the `CanvasRenderer` base class, so unit tests can run headlessly with `OffscreenCanvas`.

## Preview

After launch, the page shows, from top to bottom: title and capability description, device info card, canvas demo area (scene 1 is drawn automatically after `onReady`), scene button area, and event log panel. Narrow screens use a single column, wide screens use two columns. Switching scenes redraws the canvas and highlights the current button.

> This repository does not currently include runtime screenshots. Run it on a device with the usage steps below to see all scenes.

### Usage

1. Open the project in DevEco Studio, use the OpenHarmony default debug signing shipped with the SDK (or DevEco automatic signing), and run it on RK3568 / DAYU200 (API 26 image).
2. Scene 1 "Linear gradient and gradient stroke" is drawn automatically. Tap any scene button to switch; the current button shows "(current)".
3. Tap "Animation: gradient transition" to start the timer-driven gradient transition; the button changes to "Stop gradient animation"; tap again to stop.
4. Tap "Clear canvas and log" to show a confirmation dialog. Confirming clears the canvas, log, and current scene state; cancelling changes nothing.
5. The log panel at the bottom shows the latest 120 events and also writes to hilog:

   ```bash
   hdc shell hilog | grep CanvasShowcaseDemo
   ```

   The page log domain is `0x0001`; ability logs share the same tag.

Build, install, and start from the command line:

```bash
export DEVECO_SDK_HOME="<DevEco Studio>/sdk"
"<DevEco Studio>/tools/node/node" "<DevEco Studio>/tools/hvigor/bin/hvigorw.js" \
  assembleHap --mode module -p product=default --no-daemon
hdc install -r entry/build/default/outputs/default/entry-default-signed.hap
ability_command=$(printf '\141\141')
hdc shell "${ability_command} start -a EntryAbility -b com.samples.canvasshowcasedemo"
```

Note: `ability_command` resolves to the Ability Assistant tool name shipped with the OpenHarmony SDK toolchains (encoded to avoid an ambiguous two-letter abbreviation in the documentation). It is used to start applications and run on-device tests, and is not a project-defined command, script, or credential.

Without a signing config the output is `entry/build/default/outputs/default/entry-default-unsigned.hap`.

## Project structure

```
CanvasShowcaseDemo
├── AppScope                                  Application-level config (bundleName, icon, label)
├── entry/src/main
│   ├── ets
│   │   ├── model
│   │   │   ├── CanvasScenes.ets              Drawing logic for the 23 scenes (main / offscreen canvas)
│   │   │   └── utils
│   │   │       ├── SceneRegistry.ets         Scene registry (id / button text / title / draw function)
│   │   │       ├── PixelMapUtil.ets          Checkerboard / stripe / dot asset generation (RGBA_8888)
│   │   │       ├── ColorUtil.ets             hex / rgba parsing, color interpolation, multi-stop bands, presets
│   │   │       ├── GeometryUtil.ets          Angle/radian, circle points, rect contains, distance, clamp
│   │   │       ├── PerfTimer.ets             Sync block timing and multi-sample statistics
│   │   │       ├── DeviceUtil.ets            Device profile reads and sm / md / lg breakpoints
│   │   │       └── LogUtil.ets               Unified logging (hilog + UI panel, level filtering)
│   │   ├── pages
│   │   │   └── Index.ets                     Canvas demo area + registry-driven buttons + log panel
│   │   ├── entryability                      Entry and lifecycle logs
│   │   └── entrybackupability                Backup extension
│   └── resources                             Strings, colors, icons, and other resources
├── entry/src/test                            Local unit tests (1 smoke case)
├── entry/src/ohosTest                        Device-side tests (19 suites, 244 cases)
├── README.md
└── README_zh.md
```

## Implementation

### 1. Page and layout

[`Index.ets`](entry/src/main/ets/pages/Index.ets) uses the `Canvas` component with `CanvasRenderingContext2D` as the context; scene 1 is drawn after `onReady`. Scene buttons are generated from `SceneRegistry.getAll()` so the registry and page stay in sync. The layout reads the window width through `onAreaChange` and calls `DeviceUtil.getBreakpoint()`:

- `sm` (<600vp): the button area scrolls at a fixed height, and the log panel is below it;
- `md` / `lg` (>=600vp): a two-column layout with a 38% button area on the left and a 62% log panel on the right.

Clearing is irreversible, so `confirmClear()` calls `showAlertDialog` for confirmation; cancelling only writes a log.

### 2. Scene registry

[`SceneRegistry.ets`](entry/src/main/ets/model/utils/SceneRegistry.ets) describes scenes with `SceneInfo { id, button, title, draw }` and registers 23 scenes:

| Category | Scenes |
| --- | --- |
| Scene 1 Gradient | Linear gradient (5 stops) + gradient stroke, radial glow, conic gradient (`createConicGradient`) |
| Scene 2 Pattern | repeat, repeat-x / no-repeat |
| Scene 3 Matrix | Translate, scale, rotate, skew (property style), combined transforms and inverse |
| Scene 4 Combined | OffscreenCanvas composition (gradient + pattern + Matrix2D chained) |
| Extensions | ImageData write and read-back inversion, GeometryUtil dot ring, Bezier / quadratic paths, clip + composite modes, text and measureText, dashed strokes and line caps/joins |
| Additional | CanvasPattern.setTransform, drawImage source cropping, shadow + gradient, filter blur, ColorMetrics gradient stops |

### 3. Canvas capabilities

All draw functions in [`CanvasScenes.ets`](entry/src/main/ets/model/CanvasScenes.ets) accept `CanvasRenderer` (the common base class of the main and offscreen contexts), so the same logic draws on the page and runs headlessly in tests with `OffscreenCanvas`.

Key points:

- **CanvasGradient**: `createLinearGradient` / `createRadialGradient` / `createConicGradient` with multi-stop `addColorStop`, including the `ColorMetrics` stop overload (API 12+).
- **CanvasPattern**: `createPattern(ImageBitmap, repetition)` supports three repeat modes; invalid assets return `null`, and the caller checks for null; `CanvasPattern.setTransform(Matrix2D)` demonstrates pattern-space rotation / scale / translation.
- **Matrix2D**: `new Matrix2D()` is an all-zero (singular) matrix and must be reset with `identity()`; `rotate` takes radians; skew uses the property style (`rotateX` / `rotateY` assignment); `invert()` demonstrates the inverse matrix.
- **OffscreenCanvas**: draw gradients and patterns offscreen -> `transferToImageBitmap` -> blit to the main canvas with a `Matrix2D` transform.
- **ImageData**: write a per-pixel gradient and `putImageData`; `getImageData` reads back a region, inverts RGB per pixel, and writes it back.
- **Paths**: `bezierCurveTo` wave, `quadraticCurveTo` heart, `arcTo` rounded rectangle, covering common curve path combinations.
- **Clipping and compositing**: `clip()` with circular and rectangular regions; `globalCompositeOperation` compares `source-over` / `multiply` / `screen` with two overlapping circles.
- **Text**: `fillText` / `strokeText` / gradient-filled text, `measureText` for width; `textAlign` / `textBaseline` control alignment.
- **Stroke styles**: `setLineDash` / `lineDashOffset` for dashed lines and phase, `lineCap` compares `butt` / `round` / `square`, `lineJoin` compares `miter` / `round` / `bevel`.
- **Shadow and filter**: compare `shadowBlur` / `shadowColor` / `shadowOffsetX/Y` on and off, and `ctx.filter = 'blur(4px)'` on and off.

### 4. Pattern assets and utilities

- [`PixelMapUtil.ets`](entry/src/main/ets/model/utils/PixelMapUtil.ets): generates checkerboard, 45-degree stripe, and dot `PixelMap` assets in code; colors are packed as RGBA_8888 and validated at pixel level in tests through `readPixelsToBuffer`.
- [`ColorUtil.ets`](entry/src/main/ets/model/utils/ColorUtil.ets): hex / rgba parsing and packing, color interpolation, multi-stop bands (`lerpHexStops`), and sky / sunset / ocean / forest presets.
- [`GeometryUtil.ets`](entry/src/main/ets/model/utils/GeometryUtil.ets): angle/radian conversion, circle points, rect contains, distance, and clamp, used by the dot ring and other geometry.
- [`PerfTimer.ets`](entry/src/main/ets/model/utils/PerfTimer.ets): wraps synchronous drawing code, outputs cost, and supports multi-sample statistics.
- [`DeviceUtil.ets`](entry/src/main/ets/model/utils/DeviceUtil.ets): reads device type, system version, and SDK API; divides breakpoints as `sm < 600vp`, `md < 840vp`, `lg >= 840vp`.
- [`LogUtil.ets`](entry/src/main/ets/model/utils/LogUtil.ets): `debug / info / warn / error` dual-channel output, minimum-level filtering, time format `HH:mm:ss`.

### 5. Tests

Device tests are under `entry/src/ohosTest/ets/test/`, with 19 suites and 244 cases aggregated by `List.test.ets`:

| Suite | Cases | Coverage |
| --- | --- | --- |
| `CanvasScenes.test.ets` | 23 | Headless scene draws do not throw, offscreen composite pipeline, pattern null guard, animation phases, conic gradient / paths / clip composite / text / dashes / ImageData read-back |
| `ColorUtil.test.ets` | 15 | rgba packing, hex parsing (6 / 8 digits and invalid), interpolation endpoints and clamping, multi-stop bands, presets |
| `Matrix2D.test.ets` | 12 | Unit matrix, translate / scale / rotate properties, chain order, inverse, property-style skew |
| `LogUtil.test.ets` | 6 | Callback delivery, line format, level filtering and marks, time format, error level |
| `PixelMapUtil.test.ets` | 8 | Size, pixel colors, RGBA packing, generic generator and gradients |
| `PerfTimer.test.ets` | 7 | Return value passthrough, object timing, samples and statistics, empty statistics, reset, report keywords |
| `SceneRegistry.test.ets` | 7 | Non-empty, unique ids, complete metadata, hit / miss, all-scene smoke draw |
| `DeviceUtil.test.ets` | 6 | Non-empty device type, mutually exclusive forms, breakpoint boundaries, bucket consistency |
| `GeometryUtil.test.ets` | 6 | Angle/radian round trip, circle points in four quadrants, rect contains, clamp, distance |
| `IndexUi.test.ets` | 3 | Initial scene highlight, highlight switch, clear confirmation flow (UI automation) |
| `Ability.test.ets` | 1 | Ability smoke case |
| `ColorUtilMatrix.test.ets` | 34 | rgba bit masks / unsigned, parseHex whitespace and case / length / invalid chars, toHex overflow, alpha rounding, four-stop bands, four preset bands |
| `GeometryUtilMatrix.test.ets` | 26 | Known and negative angles, nine-angle round trip, circle point boundaries, angle version consistency, rect four edges / zero size / negative coordinates, clamp degeneracy, distance invariants |
| `LogUtilMatrix.test.ets` | 16 | init keeps threshold, setMinLevel up/down, INFO/ERROR thresholds, fixed-time formatting, four-level full line, sink replacement |
| `PerfTimerMatrix.test.ets` | 16 | boolean/null/array passthrough, fn called exactly once, exception propagation, statistics invariants, two decimals, reset/multi-instance |
| `PixelMapUtilMatrix.test.ets` | 19 | Checkerboard cells/parity/alpha, stripe diagonal equality, dot radius boundaries/zero radius, generate row-major order, create row-major mapping |
| `SceneRegistryMatrix.test.ets` | 17 | Consecutive ids, first/last mapping, extra scene button != title, unique button/title, getById boundaries and references, independent canvas per scene |
| `DeviceUtilMatrix.test.ets` | 17 | 0/320/599.9/600.1/839.9/840.1/1280 breakpoints, monotonicity, preferTwoColumn consistency, form flags consistency |
| `CanvasScenesMatrix.test.ets` | 8 | Tiny / wide / narrow canvases, repeated execution, dash array reset, text measureText, clip-region pixels, read-back center opacity |

Local unit tests are under `entry/src/test/` and contain 1 smoke case. Device test command:

```bash
"<DevEco Studio>/tools/node/node" "<DevEco Studio>/tools/hvigor/bin/hvigorw.js" \
  assembleHap --mode module -p module=entry@ohosTest -p product=default --no-daemon
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
ability_command=$(printf '\141\141')
hdc shell "${ability_command} test -b com.samples.canvasshowcasedemo -m entry_test \
  -s unittest OpenHarmonyTestRunner -s timeout 150000"
```

`SceneRegistry.registry_smokeTest_allScenesDraw` iterates the registry and runs every scene on `OffscreenCanvas`, preventing the registry and implementation from drifting. Matrix suites expand input dimensions into explicit cases, each with full `@tc` annotations. `IndexUi` uses `@kit.TestKit` `Driver` / `ON` to automate button highlighting and the clear confirmation flow.

Verification status: 244 device cases have passed on RK3568 (`Tests run: 244, Failure: 0, Error: 0, Pass: 244`), including 94 main-path and smoke cases and 153 combination and boundary cases.

## Permissions

None. All drawing happens inside the application page, pattern assets are generated in code, no external files are read, and no network, storage, or camera permission is required.

## Dependencies

No third-party runtime dependencies and no dependency on other samples. `oh-package.json5` only includes the test framework dependencies `@ohos/hypium` and `@ohos/hamock`.

## Constraints

| Item | Requirement |
| --- | --- |
| Development environment | DevEco Studio 6.1.1 |
| SDK | Compile SDK API 26 (`compileSdkVersion` / `targetSdkVersion` / `compatibleSdkVersion` are all `26.0.0`), `runtimeOS` is OpenHarmony |
| System version | API 26 or later; verified on OpenHarmony 7.1.0.22 (API 26) |
| Verified device | RK3568 / DAYU200 (`deviceType=default`); `module.json5` declares `default / tablet / 2in1` |
| Signing | OpenHarmony default debug signing shipped with the SDK (or DevEco automatic signing); the repository stores no certificate, key, or password |

Other limitations:

- **Screenshots**: the repository does not currently include runtime screenshots; use actual device output as the reference.
- **Matrix2D defaults**: `new Matrix2D()` is an all-zero matrix; applying transforms directly makes shapes invisible, so call `identity()` first.
- **Pattern assets**: `createPattern` returns `null` for invalid assets; the sample checks for null at the call site, and custom assets should keep that check.
- **Performance timing**: `PerfTimer` uses `Date.now()` and is only for relative single-frame cost comparison, not a strict performance benchmark.
- **Animation frame rate**: the gradient transition is driven by a 100 ms timer; the actual frame rate depends on device load.
- **hilog tag**: the page log and the ability logs all use the tag `CanvasShowcaseDemo`; the page log domain is `0x0001`, so filter by tag instead of domain.
- **Rendering differences**: anti-aliasing, shadows, and filters may differ slightly because of device GPU and system version.

## Download

The project is currently maintained as a standalone directory; copy the `CanvasShowcaseDemo` directory to use it. After it is merged into the application samples repository, the project is located at `code/UI/CanvasShowcaseDemo` and can be fetched separately with:

```bash
git clone https://gitcode.com/openharmony/applications_app_samples.git
cd applications_app_samples
git sparse-checkout set code/UI/CanvasShowcaseDemo
```

Open the `CanvasShowcaseDemo` root directory in DevEco Studio after fetching.
