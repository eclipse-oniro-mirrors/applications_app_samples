# CanvasShowcaseDemo

## 介绍

本示例演示 ArkUI Canvas 的画布绘制能力，覆盖 **CanvasGradient（渐变）、CanvasPattern（图案）、Matrix2D（矩阵变换）** 三大特性，以及 OffscreenCanvas 离屏绘制、ImageData 像素读写、CanvasPattern.setTransform 图案矩阵变换、路径 / 文字 / 裁剪合成 / 描边样式、阴影、滤镜等进阶用法，共 23 个注册场景 + 1 个渐变过渡动画。

示例使用以下能力（完整包名与文档链接）：

| 能力 | 使用的组件 / 包 | 说明 | 文档 |
| --- | --- | --- | --- |
| CanvasGradient | ArkUI 内置 `Canvas`（无需 import） | 线性渐变、径向渐变、圆锥渐变、渐变描边、ColorMetrics 断点重载 | [CanvasGradient](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ts-components-canvas-canvasgradient.md) |
| CanvasPattern | ArkUI 内置 `Canvas` | repeat / repeat-x / no-repeat，`setTransform` 图案矩阵变换 | [CanvasPattern](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ts-components-canvas-canvaspattern.md) |
| Matrix2D | ArkUI 内置 `Canvas` | 平移 / 缩放 / 旋转（弧度）/ 倾斜 / 组合变换 / `invert()` | [Matrix2D](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ts-components-canvas-matrix2d.md) |
| OffscreenCanvas | ArkUI 内置 `Canvas` | 离屏绘制 → `transferToImageBitmap` → 主画布变换贴图 | [OffscreenCanvas](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ts-components-canvas-offscreencanvas.md) |
| ImageData | ArkUI 内置 `Canvas` | `createImageData` / `putImageData` 逐像素写入、`getImageData` 回读反相 | [ImageData](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ts-components-canvas-imagedata.md) |
| 路径与文字 | ArkUI 内置 `Canvas` | `bezierCurveTo` / `quadraticCurveTo` / `arcTo`、`fillText` / `strokeText` / `measureText`、`clip`、`globalCompositeOperation`、`setLineDash` | [CanvasRenderingContext2D](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ts-canvasrenderingcontext2d.md) |
| ColorMetrics | `@kit.ArkUI` | `ColorMetrics.rgba` / `resourceColor` 作为渐变断点颜色 | [ArkUI API 参考](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/Readme-CN.md) |
| 图像能力 | `@kit.ImageKit`（`@ohos.multimedia.image`） | 代码生成棋盘格 / 斜纹 / 圆点 PixelMap 图案素材 | [Image Kit](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-image-kit/js-apis-image.md) |
| 设备信息 | `@kit.BasicServicesKit`（`@ohos.deviceInfo`） | 读取设备类型、系统版本、SDK API 版本 | [deviceInfo](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-basic-services-kit/js-apis-device-info.md) |
| 日志 | `@kit.PerformanceAnalysisKit`（`@ohos.hilog`） | hilog 与页面日志面板双通道输出 | [hilog](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-performance-analysis-kit/js-apis-hilog.md) |

主要功能：

- **场景注册表数据驱动**：23 个场景的元数据（id、按钮文案、标题、绘制函数）统一在 `SceneRegistry` 注册，页面按钮自动生成，新增场景只改一处；
- **图案素材自包含**：`createPattern` 所需素材由 `PixelMapUtil` 用代码生成（不依赖外部图片），并按 RGBA_8888 做像素级校验；
- **Matrix2D 正确用法**：先 `identity()` 复位单位矩阵，再链式叠加变换，覆盖旋转弧度、倾斜属性写法与逆矩阵；
- **绘制性能可观测**：每次场景绘制经 `PerfTimer` 计时并写入日志；
- **交互状态可辨识**：当前场景按钮深色高亮并标注“（当前）”；清空画布与日志前弹框二次确认；
- **断点自适应**：sm（<600vp）上下单栏，md / lg 左右双栏，窗口尺寸变化时实时切换；
- **可测试性设计**：场景绘制函数参数为 `CanvasRenderer` 基类，单元测试直接用 `OffscreenCanvas` 无头执行。

## 效果预览

运行后页面从上到下依次为：标题与能力说明、设备信息卡、画布演示区（`onReady` 后自动绘制场景 1）、场景按钮区和事件日志面板；窄屏为上下单栏，宽屏为左右双栏。切换场景时画布重绘，按钮区高亮当前场景。

> 本仓库暂未附带运行截图，按下方“使用说明”在设备上运行即可查看全部场景。

### 使用说明

1. 用 DevEco Studio 打开工程，使用 SDK 自带的 OpenHarmony 默认调试签名（或 DevEco 自动签名），运行到 RK3568 / DAYU200（API 26 镜像）；
2. 启动后画布自动绘制“场景1：线性渐变与渐变描边”，点击任意场景按钮即可切换，当前场景按钮显示“（当前）”；
3. 点击“动画：渐变过渡”启动定时器驱动的渐变过渡动画，按钮变为“停止渐变动画”，再次点击停止；
4. 点击“清空画布与日志”会弹出确认框，确认后清空画布、日志与当前场景状态，取消则不改变页面；
5. 页面底部日志面板显示最近 120 条事件，同时输出到 hilog：

   ```bash
   hdc shell hilog | grep FastBufferStream
   ```

   日志 domain 为 `0x0001`。

命令行编译、安装与启动：

```bash
export DEVECO_SDK_HOME="<DevEco Studio>/sdk"
"<DevEco Studio>/tools/node/node" "<DevEco Studio>/tools/hvigor/bin/hvigorw.js" \
  assembleHap --mode module -p product=default --no-daemon
hdc install -r entry/build/default/outputs/default/entry-default-signed.hap
hdc shell aa start -a EntryAbility -b com.samples.canvasshowcasedemo
```

未配置签名时产物为 `entry/build/default/outputs/default/entry-default-unsigned.hap`。

## 工程目录

```
CanvasShowcaseDemo
├── AppScope                                  应用级配置（bundleName、图标、名称）
├── entry/src/main
│   ├── ets
│   │   ├── model
│   │   │   ├── CanvasScenes.ets              23 个场景的绘制逻辑（主画布 / 离屏画布通用）
│   │   │   └── utils
│   │   │       ├── SceneRegistry.ets         场景注册表（id / 按钮文案 / 标题 / 绘制函数）
│   │   │       ├── PixelMapUtil.ets          棋盘格 / 斜纹 / 圆点图案素材生成（RGBA_8888）
│   │   │       ├── ColorUtil.ets             hex / rgba 解析、颜色插值、多段色带、渐变预设
│   │   │       ├── GeometryUtil.ets          角度弧度、圆周点、矩形包含、距离、夹取
│   │   │       ├── PerfTimer.ets             同步代码块计时与多次采样统计
│   │   │       ├── DeviceUtil.ets            设备档案读取与 sm / md / lg 断点划分
│   │   │       └── LogUtil.ets               统一日志（hilog + UI 面板双通道、级别过滤）
│   │   ├── pages
│   │   │   └── Index.ets                     画布演示区 + 注册表驱动按钮 + 日志面板
│   │   ├── entryability                      应用入口与生命周期日志
│   │   └── entrybackupability                备份扩展
│   └── resources                             字符串、颜色、图标等资源
├── entry/src/test                            本地单测（1 条冒烟用例）
├── entry/src/ohosTest                        设备侧测试（19 个套件，247 条用例）
└── README_zh.md
```

## 具体实现

### 1. 页面与布局

[`Index.ets`](entry/src/main/ets/pages/Index.ets) 使用 `Canvas` 组件承载绘制区，`CanvasRenderingContext2D` 作为上下文；`onReady` 后先绘制场景 1。场景按钮由 `SceneRegistry.getAll()` 数据驱动生成，避免注册表与页面脱节。布局通过 `onAreaChange` 读取窗口宽度并调用 `DeviceUtil.getBreakpoint()`：

- `sm`（<600vp）：按钮区固定高度滚动，日志面板在下方；
- `md` / `lg`（≥600vp）：左侧 38% 按钮区、右侧 62% 日志面板的双栏布局。

清空操作为不可恢复操作，`confirmClear()` 调用 `showAlertDialog` 进行二次确认，取消时只记录日志。

### 2. 场景注册表

[`SceneRegistry.ets`](entry/src/main/ets/model/utils/SceneRegistry.ets) 以 `SceneInfo { id, button, title, draw }` 描述场景，注册了 23 个场景：

| 分类 | 场景 |
| --- | --- |
| 场景1 渐变 | 线性渐变（5 断点）+ 渐变描边、径向渐变光晕、圆锥渐变（`createConicGradient`） |
| 场景2 图案 | repeat、repeat-x / no-repeat |
| 场景3 矩阵 | 平移、缩放、旋转、倾斜（属性方式）、组合变换与逆矩阵 |
| 场景4 综合 | OffscreenCanvas 离屏合成（渐变 + 图案 + Matrix2D 串联） |
| 扩展 | ImageData 写入与回读反相、GeometryUtil 圆环阵、贝塞尔 / 二次曲线路径、clip 裁剪 + 合成模式、文字绘制与 measureText、虚线描边与线帽拐角 |
| 补充 | CanvasPattern.setTransform、drawImage 源矩形裁剪、阴影 + 渐变、filter 模糊、ColorMetrics 渐变断点 |

### 3. Canvas 能力实现

[`CanvasScenes.ets`](entry/src/main/ets/model/CanvasScenes.ets) 中所有绘制函数接收 `CanvasRenderer`（主画布与离屏画布的公共基类），因此同一套逻辑既能在页面上绘制，也能在测试中用 `OffscreenCanvas` 无头执行。

关键点：

- **CanvasGradient**：`createLinearGradient` / `createRadialGradient` / `createConicGradient` + 多段 `addColorStop`，并演示 `ColorMetrics` 断点重载（API 12+）；
- **CanvasPattern**：`createPattern(ImageBitmap, repetition)` 支持三种重复方式；素材无效时返回 `null`，调用侧已判空；`CanvasPattern.setTransform(Matrix2D)` 演示图案自身的旋转 / 缩放 / 平移；
- **Matrix2D**：`new Matrix2D()` 默认为全 0 矩阵（奇异矩阵），必须先 `identity()` 复位；`rotate` 参数单位为弧度；倾斜使用属性方式（`rotateX` / `rotateY` 直接赋值）；`invert()` 演示逆矩阵；
- **OffscreenCanvas**：离屏绘制渐变与图案 → `transferToImageBitmap` → 主画布用 `Matrix2D` 变换贴图；
- **ImageData**：逐像素写入渐变后 `putImageData`；`getImageData` 回读指定区域并对 RGB 逐像素反相后写回；
- **路径绘制**：`bezierCurveTo` 波浪线、`quadraticCurveTo` 心形、`arcTo` 圆角矩形，覆盖曲线路径的常用组合；
- **裁剪与合成**：`clip()` 分别以圆形与矩形作为裁剪区，`globalCompositeOperation` 对比 `source-over` / `multiply` / `screen` 双圆叠加效果；
- **文字绘制**：`fillText` / `strokeText` / 渐变填充文字，并用 `measureText` 获取宽度；`textAlign` / `textBaseline` 控制对齐；
- **描边样式**：`setLineDash` / `lineDashOffset` 画虚线并控制相位，`lineCap` 对比 `butt` / `round` / `square`，`lineJoin` 对比 `miter` / `round` / `bevel`；
- **阴影与滤镜**：对比 `shadowBlur` / `shadowColor` / `shadowOffsetX/Y` 与 `ctx.filter = 'blur(4px)'` 的开启 / 关闭效果。

### 4. 图案素材与工具

- [`PixelMapUtil.ets`](entry/src/main/ets/model/utils/PixelMapUtil.ets)：用代码生成棋盘格、45° 斜纹、圆点阵 `PixelMap`，颜色按 RGBA_8888 打包，测试中通过 `readPixelsToBuffer` 做像素级校验；
- [`ColorUtil.ets`](entry/src/main/ets/model/utils/ColorUtil.ets)：hex / rgba 解析与打包、颜色插值、多段色带（`lerpHexStops`）及天空 / 日落 / 海洋 / 森林渐变预设；
- [`GeometryUtil.ets`](entry/src/main/ets/model/utils/GeometryUtil.ets)：角度弧度转换、圆周点、矩形包含、距离与夹取，用于圆环阵等几何绘制；
- [`PerfTimer.ets`](entry/src/main/ets/model/utils/PerfTimer.ets)：包装同步绘制代码并输出耗时，支持多次采样统计；
- [`DeviceUtil.ets`](entry/src/main/ets/model/utils/DeviceUtil.ets)：读取设备类型、系统版本与 SDK API；按 `sm < 600vp`、`md < 840vp`、`lg ≥ 840vp` 划分断点；
- [`LogUtil.ets`](entry/src/main/ets/model/utils/LogUtil.ets)：`debug / info / warn / error` 双通道输出，支持最低级别过滤，时间格式 `HH:mm:ss`。

### 5. 测试

设备侧测试位于 `entry/src/ohosTest/ets/test/`，共 19 个套件、247 条用例，通过 `List.test.ets` 聚合：

| 套件 | 用例 | 覆盖 |
| --- | --- | --- |
| `CanvasScenes.test.ets` | 23 | 各场景无头绘制不抛异常、离屏合成管线、图案判空、动画全相位、圆锥渐变 / 路径 / 裁剪合成 / 文字 / 虚线 / ImageData 回读 |
| `ColorUtil.test.ets` | 15 | rgba 打包、hex 解析（6 / 8 位与非法值）、插值端点与夹取、多段色带、渐变预设 |
| `Matrix2D.test.ets` | 12 | 单位矩阵、平移 / 缩放 / 旋转属性、链式顺序、逆矩阵、属性方式倾斜 |
| `LogUtil.test.ets` | 6 | 回调投递、行格式、级别过滤与标记、时间格式、错误级别 |
| `PixelMapUtil.test.ets` | 8 | 尺寸、像素颜色、RGBA 打包、通用生成器与渐变 |
| `PerfTimer.test.ets` | 7 | 返回值透传、对象计时、采样与统计、空统计、重置、报告关键字 |
| `SceneRegistry.test.ets` | 7 | 非空、id 唯一、元数据完整、命中 / 未命中、全场景冒烟绘制 |
| `DeviceUtil.test.ets` | 6 | 设备类型非空、形态互斥、断点边界、档位一致性 |
| `GeometryUtil.test.ets` | 6 | 角度弧度往返、四象限圆周点、矩形包含、夹取、距离 |
| `IndexUi.test.ets` | 3 | 初始场景高亮、切换高亮、清空二次确认流程（UI 自动化） |
| `Ability.test.ets` | 1 | Ability 冒烟用例 |
| `ColorUtilMatrix.test.ets` | 34 | rgba 位掩码/无符号、parseHex 空白与大小写/长度/非法字符、toHex 越界、alpha 取整、四段色带、四组预设精确色带 |
| `GeometryUtilMatrix.test.ets` | 26 | 已知角与负角、九角往返、圆周点边界、角度版逐角一致、矩形四边/零尺寸/负坐标、clamp 退化、距离不变式 |
| `LogUtilMatrix.test.ets` | 16 | init 保持原门限、setMinLevel 上/下调、INFO/ERROR 门限、固定时间格式化、四级别整行、sink 替换 |
| `PerfTimerMatrix.test.ets` | 16 | boolean/null/数组透传、fn 恰好一次、异常传播、统计不变式、两位小数、reset/multi-instance |
| `PixelMapUtilMatrix.test.ets` | 19 | 棋盘格分块/奇偶/alpha、斜纹对角等值、圆点半径边界/零半径、generate 行主序、create 行主序映射 |
| `SceneRegistryMatrix.test.ets` | 17 | id 连续、首末映射、补充场景按钮≠标题、按钮/标题唯一、getById 边界与引用、逐场景独立画布 |
| `DeviceUtilMatrix.test.ets` | 17 | 0/320/599.9/600.1/839.9/840.1/1280 断点、单调性、preferTwoColumn 一致性、形态标志一致 |
| `CanvasScenesMatrix.test.ets` | 8 | 极小 / 超宽 / 超窄画布、重复执行、虚线数组复位、文字 measureText、裁剪区像素、回读中心不透明 |

本地单测位于 `entry/src/test/`，为 1 条冒烟用例。设备侧测试执行命令：

```bash
"<DevEco Studio>/tools/node/node" "<DevEco Studio>/tools/hvigor/bin/hvigorw.js" \
  assembleHap --mode module -p module=entry@ohosTest -p product=default --no-daemon
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
hdc shell aa test -b com.samples.canvasshowcasedemo -m entry_test \
  -s unittest OpenHarmonyTestRunner -s timeout 150000
```

其中 `SceneRegistry.registry_smokeTest_allScenesDraw` 会遍历注册表在 `OffscreenCanvas` 上执行全部场景，防止注册表与实现脱节；组合套件按输入维度展开边界组合，每条用例均为显式 `it` 并带完整 `@tc` 注释；`IndexUi` 通过 `@kit.TestKit` 的 `Driver` / `ON` 完成按钮高亮与清空确认流程的 UI 自动化。

验证状态：247 条设备侧用例已在 RK3568 真机执行通过（`Tests run: 247, Failure: 0, Error: 0, Pass: 247`），其中 94 条主路径与冒烟用例、153 条组合与边界用例。

## 相关权限

无。所有绘制均在本应用页面内完成，图案素材由代码生成，不读取外部文件，也不需要网络、存储或相机权限。

## 依赖

无第三方运行时依赖，也不依赖其它 sample。`oh-package.json5` 中仅包含测试框架依赖 `@ohos/hypium` 与 `@ohos/hamock`。

## 约束与限制

| 项目 | 要求 |
| --- | --- |
| 开发环境 | DevEco Studio 6.1.1 |
| SDK | 编译 SDK API 26（`compileSdkVersion` / `targetSdkVersion` / `compatibleSdkVersion` 均为 `26.0.0`），`runtimeOS` 为 OpenHarmony |
| 系统版本 | API 26 及以上；本工程在 OpenHarmony 7.1.0.22（API 26）上验证 |
| 验证设备 | RK3568 / DAYU200（`deviceType=default`）；`module.json5` 声明 `default / tablet / 2in1` |
| 签名 | 使用 SDK 自带的 OpenHarmony 默认调试签名（或 DevEco 自动签名）；仓库不保存证书、密钥与口令 |

其它限制：

- **截图**：仓库暂未附带运行截图，效果以设备实际运行为准；
- **Matrix2D 默认值**：`new Matrix2D()` 为全 0 矩阵，直接叠加变换会导致图形不可见，必须先 `identity()`；
- **图案素材**：`createPattern` 在素材无效时返回 `null`，示例已在调用侧判空，接入自定义素材时需保留该判断；
- **性能计时**：`PerfTimer` 基于 `Date.now()`，仅用于单帧绘制耗时的相对比较，不代表严格的性能基准；
- **动画帧率**：渐变过渡动画由 100ms 定时器驱动，实际帧率受设备负载影响；
- **hilog tag**：日志 tag 沿用工程历史值 `FastBufferStream`，domain 为 `0x0001`，过滤时请使用该 tag；
- **渲染差异**：抗锯齿、阴影与滤镜的最终像素效果可能因设备 GPU 与系统版本存在差异。

## 下载

本工程当前以独立目录维护，直接复制 `CanvasShowcaseDemo` 目录即可使用。合入应用示例仓后，工程位于 `UI/CanvasShowcaseDemo`，可通过以下命令单独获取：

```bash
git clone https://gitcode.com/openharmony/applications_app_samples.git
cp -r applications_app_samples/UI/CanvasShowcaseDemo .
```

获取后在 DevEco Studio 中打开 `CanvasShowcaseDemo` 根目录运行。
