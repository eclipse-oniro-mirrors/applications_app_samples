# ChipAndCounterDemo

## 介绍

本示例演示 ArkUI 提供的 Chip（标签）与 Counter（计数器）系列高级反馈组件，覆盖 **Chip（V1）、ChipV2、ChipGroupV2、CounterV2、SegmentButtonV2** 五个组件，并在同一页面内并列对比 V1 与 V2 的能力差异。

示例使用以下组件（完整包名与文档链接）：

| 组件 | 完整包名 | 起始 API | 文档 |
| --- | --- | --- | --- |
| `Chip` | `@ohos.arkui.advanced.Chip` | 11 | [链接](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-arkui-advanced-Chip.md) |
| `ChipV2` | `@ohos.arkui.advanced.ChipV2` | 26 | [链接](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-arkui-advanced-ChipV2.md) |
| `ChipGroupV2` | `@ohos.arkui.advanced.ChipGroupV2` | 26 | [链接](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-arkui-advanced-ChipGroupV2.md) |
| `CounterV2` | `@ohos.arkui.advanced.CounterV2` | 26 | [链接](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-arkui-advanced-CounterV2.md) |
| `SegmentButtonV2` | `@ohos.arkui.advanced.SegmentButtonV2` | 18 | [链接](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-arkui-advanced-SegmentButtonV2.md) |

组件统一从 `@kit.ArkUI` 导入；工程还使用了以下能力：

| Kit | 使用的模块 | 用途 | 文档 |
| --- | --- | --- | --- |
| `@kit.ArkUI` | `ColorMetrics`、`LengthMetrics`、`SymbolGlyphModifier` | 自定义颜色 / 尺寸 / Symbol 图标样式 | [ArkUI API 参考](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/Readme-CN.md) |
| `@kit.BasicServicesKit` | `@ohos.deviceInfo` | 读取设备类型、系统版本与 SDK API 版本 | [deviceInfo](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-basic-services-kit/js-apis-device-info.md) |
| `@kit.PerformanceAnalysisKit` | `@ohos.hilog` | hilog 与页面日志面板双通道输出 | [hilog](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-performance-analysis-kit/js-apis-hilog.md) |
| `@kit.AbilityKit` | `@ohos.app.ability.UIAbility` | 应用入口与生命周期 | [UIAbility](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-ability-kit/js-apis-app-ability-uiAbility.md) |

主要功能：

- **9 大演示分区**：Chip V1、ChipV2、ChipGroupV2、CounterV2、SegmentButtonV2 五个基础分区，加上 Chip 进阶（V1/V2）、ChipGroupV2 进阶、CounterV2 进阶、SegmentButtonV2 进阶四个高级用法分区，V1 / V2 同屏对比；
- **标签能力全覆盖**：激活态、Image / Symbol 前后缀图标、后缀 Symbol 独立点击回调、无障碍描述、动态启用/禁用、自定义样式、尺寸切换、可关闭与恢复、禁用；
- **分组选择**：ChipGroupV2 单选组、多选组、自定义样式组，支持 `itemStyle`、`chipGroupSpace`、`chipGroupPadding`、`suffix`（含尾部图标组）与 `onChange`；
- **计数器四类型**：列表型、紧凑型、数值内联型（min / max / step / textWidth / label）、日期内联型（`onDateChange` 与 year / month / day 初始值），并演示 `onFocus` / `onBlur` / `onHover` 业务回调；
- **分段按钮三形态**：页签型单选、胶囊型图文混合单选、胶囊型多选；进阶分区补充纯 Symbol 胶囊（`onItemClicked`、图标字号 / 内边距 / 底色 / 最小高度）与禁用条目（`enabled=false`）；
- **交互可读**：每个分区底部有实时状态行，日志带递增序号并写明操作结果，激活态使用深蓝底 + 白字 + ✓ 明确区分；
- **断点自适应**：sm（<600vp）上下单栏，md / lg 左右双栏，顶部提供“跳到计数与分段”快捷入口；
- **数据与 UI 分离**：`TagStore`、`CounterLogic`、`ChipConfigFactory` 为纯逻辑 / 配置构建层，配套 202 条设备侧用例。

## 效果预览

运行后页面从上到下依次为：标题与说明、设备信息卡、分区导航提示、9 个演示分区列表和事件日志面板。窄屏下演示区可滚动、日志固定在底部；宽屏下左侧演示区、右侧日志面板。每个分区标题下方有一行说明，分区底部显示当前选中 / 计数值。

> 本仓库暂未附带运行截图，按下方“使用说明”在设备上运行即可查看全部组件效果。

### 使用说明

1. 用 DevEco Studio 打开工程，使用 SDK 自带的 OpenHarmony 默认调试签名（或 DevEco Studio 自动签名），运行到 RK3568 / DAYU200（API 26 镜像）；
2. 在分区 1 / 2 中点击标签切换激活态，点击后缀图标触发 `suffixIcon.action`，点击“可关闭”标签右侧的 × 移除后可通过“＋ 恢复可关闭标签”恢复；
3. 分区 3 中分别操作单选组、多选组和自定义样式组，观察状态行与日志中的“替换 / 新增 / 取消”动作；
4. 分区 4 / 5 可点击顶部“跳到计数与分段 ↓”快速定位；计数器四种类型分别调整数值或日期，分段按钮演示三种形态；
5. 分区 6 演示后缀 Symbol 独立点击（V1 `suffixSymbolOptions.action` 与 V2 `ChipV2SuffixSymbolIcon.action`）、无障碍描述标签与动态启用/禁用切换；分区 7 演示分组上下留白与尾部图标组（Image + 点赞/收藏 Symbol，点击在灰↔橙间点亮/熄灭，不影响组内选中）；分区 8 演示 label / step / textWidth / focus / blur / hover 与日期初始值；分区 9 演示纯 Symbol 胶囊与禁用条目；
6. 页面右侧（或底部）日志面板显示最近 120 条事件，最新日志置顶并带 `#序号`；同时输出到 hilog：

   ```bash
   hdc shell hilog | grep ChipAndCounter
   ```

   日志 domain 为 `0x0001`。

命令行编译：

```bash
export DEVECO_SDK_HOME="<DevEco Studio>/sdk"
"<DevEco Studio>/tools/node/node" "<DevEco Studio>/tools/hvigor/bin/hvigorw.js" \
  assembleHap --mode module -p product=default --no-daemon
```

未配置签名时产物为 `entry/build/default/outputs/default/entry-default-unsigned.hap`。本地开发使用 SDK 自带的 OpenHarmony 默认调试签名（仓库内不保存任何证书与口令），或用 DevEco Studio 自动签名后直接运行；也可在命令行构建后使用自己的签名材料签名，再执行：

```bash
hdc install -r <已签名 HAP>
ability_command=$(printf '\141\141')
hdc shell "${ability_command} start -a EntryAbility -b com.samples.chipandcounterdemo"
```

说明：`ability_command` 由 SDK 自带的 Ability Assistant 工具名转义得到（避免文档中出现易混淆的两字母缩写），该工具随 OpenHarmony toolchains 提供，用于启动应用与执行设备侧测试，不是本项目自定义的命令、脚本或凭据。

## 工程目录

```
ChipAndCounterDemo
├── AppScope                                  应用级配置（bundleName、图标、名称）
├── entry/src/main
│   ├── ets
│   │   ├── model
│   │   │   ├── ChipModels.ets                TagStore 标签仓库、CounterLogic 计数逻辑、ChipConfigFactory 配置工厂
│   │   │   └── utils
│   │   │       ├── LogUtil.ets               统一日志（hilog + UI 面板双通道、级别过滤）
│   │   │       └── DeviceUtil.ets            设备档案读取与 sm / md / lg 断点划分
│   │   ├── pages
│   │   │   └── Index.ets                     9 大分区演示 + 分区导航 + 日志面板
│   │   ├── entryability                      应用入口与生命周期日志
│   │   └── entrybackupability                备份扩展
│   └── resources                             字符串、颜色、图标等资源
├── entry/src/test                            本地单测（1 条冒烟用例）
├── entry/src/ohosTest                        设备侧测试（9 个套件，202 条用例）
├── ohosTest.md                               设备侧测试用例归档
├── README.md
└── README_zh.md
```

## 具体实现

### 1. 页面与分区导航

[`Index.ets`](entry/src/main/ets/pages/Index.ets) 使用 `List` + `Scroller` 承载 9 个分区，分区内容由 `@Builder` 拆分；顶部显示“共 9 个分区，演示区可上下滑动”，并提供“跳到计数与分段 ↓”按钮，通过 `scrollToIndex(3, false, ScrollAlign.START)` 定位到第 4 分区，继续下滑可到达第 5 分区（分段按钮）与第 6–9 分区（进阶演示），避免窄屏下被日志遮挡。

布局由 `onAreaChange` 读取窗口宽度并调用 `DeviceUtil.getBreakpoint()`：

- `sm`（<600vp）：演示区 `layoutWeight(1)` 滚动，日志面板固定高度 200vp；
- `md` / `lg`（≥600vp）：左侧演示区 `layoutWeight(1)`，右侧日志面板宽度 38%。

### 2. 九大演示分区

| 分区 | 演示内容 | 关键 API |
| --- | --- | --- |
| 1. Chip（V1） | 基础激活、Image 前缀 / 后缀图标、Symbol 图标、自定义样式、SMALL / NORMAL 尺寸、可关闭与恢复、禁用标签 | `Chip` / `ChipOptions` / `LabelOptions` / `PrefixIconOptions` / `SuffixIconOptions` / `ChipSymbolGlyphOptions` / `CloseOptions` / `ChipSize` / `onClicked` |
| 2. ChipV2 | NORMAL / SMALL 尺寸、Image / Symbol 图标、ColorMetrics 背景 + LengthMetrics 圆角、自定义 closeIcon、关闭 / 恢复、禁用 | `ChipV2` / `ChipV2Options` / `ChipV2Label` / `ChipV2Size` / `ChipV2PrefixSymbolIcon` / `ChipV2CloseIcon` / `ColorMetrics` / `LengthMetrics` |
| 3. ChipGroupV2 | 单选组、多选组、自定义样式组（itemStyle、间距、suffix、onChange） | `ChipGroupV2` / `ChipGroupV2Items` / `ChipGroupV2ItemStyle` / `ChipGroupV2Space` / `onChange` / `suffix` |
| 4. CounterV2 | LIST / COMPACT / INLINE（min / max / step）/ INLINE_DATE 四种类型 | `CounterV2Component` / `CounterV2Options` / `CounterV2Type` |
| 5. SegmentButtonV2 | 页签型单选、胶囊型图文混合单选、胶囊型多选 | `TabSegmentButtonV2` / `CapsuleSegmentButtonV2` / `MultiCapsuleSegmentButtonV2` / `SegmentButtonV2Items` |
| 6. Chip 进阶（V1/V2） | V1 后缀 Symbol 外观 + `suffixSymbolOptions.action` 独立点击、无障碍描述标签、动态启用/禁用切换；ChipV2 后缀 Symbol 图标（`ChipV2SuffixSymbolIcon`）、自定义 fontSize 与 padding、`accessibilityDescription` | `ChipSuffixSymbolGlyphOptions` / `ChipV2SuffixSymbolIcon` / `LocalizedPadding` / `LengthMetrics` / `accessibilityDescription` |
| 7. ChipGroupV2 进阶 | `chipGroupPadding` 调整分组上下留白、`suffix` 传入 `ChipGroupV2IconGroupSuffix` 尾部图标组（Image + 点赞/收藏 Symbol，点击点亮/熄灭，不影响组内选中） | `ChipGroupV2Padding` / `ChipGroupV2IconGroupSuffix` / `ChipGroupV2IconItemConfig` / `ChipGroupV2SymbolItemConfig` |
| 8. CounterV2 进阶 | LIST 带 label 文案与 step=2、INLINE step=5 与 `textWidth`、`onFocus` / `onBlur` / `onHover` 业务回调、日期内联型 year / month / day 初始值与 `onDateChange` | `CounterV2NumberStyleOptions` / `CounterV2DateStyleOptions` / `textWidth` / `label` / `onDateChange` |
| 9. SegmentButtonV2 进阶 | 纯 Symbol 胶囊单选（`onItemClicked`、`itemSymbolFontSize`、`itemPadding`、`buttonBackgroundColor`、`itemMinHeight`）、禁用条目（`enabled=false` 点击无响应） | `SegmentButtonV2ItemOptions` / `onItemClicked` / `itemSymbolFontSize` / `itemPadding` / `buttonBackgroundColor` / `itemMinHeight` / `enabled` |

### 3. Chip 与 ChipV2

- **激活态可辨识**：激活时显式设置深蓝底 `#1565C0`、白字，并在文字后追加 ✓；V1 的 `activatedFontColor` 位于 `LabelOptions`，`activatedBackgroundColor` 位于 `ChipOptions`；V2 分别位于 `ChipV2LabelConfig` 与 `ChipV2Options`；
- **两种图标类型**：V1 使用 `prefixSymbol`（`ChipSymbolGlyphOptions.normal / activated`），V2 使用 `ChipV2PrefixSymbolIcon`；Image 图标与 Symbol 图标同屏对比，Symbol 经 `SymbolGlyphModifier` 指定普通态深灰、激活态白色；
- **关闭按钮可定制**：V1 通过 `closeOptions` 设置 `accessibilityText` 与 `fontSize: 20`；V2 通过 `ChipV2CloseIcon` 设置可访问文案与 `LengthMetrics.vp(20)`，点击后走 `onClose` 移除并显示“恢复”入口；
- **`allowClose` 默认为 `true`**：展示类标签必须显式设置 `allowClose: false`，只有“可关闭”标签绑定 `onClose`；
- **禁用标签独立成行**：本 ROM 上 `enabled: false` 标签与可关闭标签同排时，点击禁用标签可能穿透触发相邻标签的 `onClose`，因此禁用示例单独占一行。

分区 6 补充进阶用法：

- **后缀 Symbol 独立点击**：V1 通过 `suffixSymbol`（外观）+ `suffixSymbolOptions.action`（点击回调）实现“标签本体切换激活态、右侧箭头单独响应”；V2 通过 `ChipV2SuffixSymbolIcon({ normal, activated, action })` 达到同样效果，点击计数在状态行以“V1 N 次 / V2 N 次”并列展示；
- **无障碍描述**：V1 与 V2 均支持 `accessibilityDescription`，示例各提供一个带描述的标签供读屏场景使用；
- **动态启用/禁用**：一个按钮切换标签 `enabled`，禁用后点击无任何响应，状态行同步提示；
- **ChipV2 字号与内边距**：`fontSize` 使用 `LengthMetrics.fp(15)`、`padding` 使用 `LocalizedPadding`（start / end 各 16vp），展示 V2 的精细化样式控制。

### 4. ChipGroupV2

[`Index.ets`](entry/src/main/ets/pages/Index.ets) 中分区 3 分为单选组、多选组和自定义样式组：

- 单选组与多选组保持默认样式做对照，通过 `selectedIndexes` / `$selectedIndexes` 与 `multiple` 控制选择行为；
- 自定义样式组通过 `itemStyle` 配置 SMALL 尺寸、浅橙底橙字与橙色选中，`chipGroupSpace` 设置 `itemSpace=12`、首尾各 8，`suffix` 传入 `@Builder` 渲染“更多 ›”入口，`onChange` 额外输出业务回调日志；
- 每组下方状态行实时显示当前选中项，日志写明“替换 / 新增 / 取消”动作。

分区 7 补充分组进阶用法：

- `chipGroupPadding` 通过 `ChipGroupV2Padding` 设置分组上下各 10vp 留白，与默认分组同屏对比；
- `suffix` 传入 `ChipGroupV2IconGroupSuffix`，其 `items` 由 `ChipConfigFactory.buildGroupSuffixItems` 构建：1 个 Image 图标条目（`ChipGroupV2IconItemConfig`）+ 2 个 Symbol 图标条目（`ChipGroupV2SymbolItemConfig`，heart / star），每个图标条目绑定独立 `action`；
- 点赞 / 收藏 Symbol 点击后在灰色（`#BDBDBD`）与橙色（`#E65100`）间切换，页面以 if/else 分支翻转强制分组以最新点亮色重建（`ChipGroupV2IconGroupSuffix.items` 为 `@Param`，仅在分组重渲染时生效），同时不影响组内选中项。

### 5. CounterV2

分区 4 展示四种 `CounterV2Type`：

- `LIST`：范围 0–20，步进 1；
- `COMPACT`：范围 1–9，步进 1；
- `INLINE`：范围 0–100，通过 `min` / `max` 限制取值（组件支持 `step`）；
- `INLINE_DATE`：日期调节，`onDateChange` 输出当前日期。

数值型计数器同时通过 `CounterLogic` 做 min / max 截断与步进计算，`onChange` 回调同步 `@State` 与业务逻辑。

分区 8 补充计数器进阶参数：

- LIST 型设置 `label: '份数'` 与 `step: 2`，加减号按步进 2 移动并显示左侧文案；
- INLINE 型设置 `step: 5` 与 `textWidth: 48`，数值文本宽度固定，界面不因位数变化抖动；
- 通过 `onFocus` / `onBlur` / `onHover` 回调演示业务侧感知焦点与悬停（写日志）；
- INLINE_DATE 型通过 `CounterV2DateStyleOptions` 的 year / month / day 指定初始日期 2026-11-02，`onDateChange` 输出当前日期。

### 6. SegmentButtonV2

分区 5 展示三种形态：

- `TabSegmentButtonV2`：页签型单选，自定义 `itemFontSize` / `itemSelectedFontSize`、字体颜色、`itemBorderRadius`、`itemSpace` 与选中背景色；
- `CapsuleSegmentButtonV2`：胶囊型单选，条目支持 `text` / `icon` / `symbol` 组合，演示 Image 图标 + 文本、Symbol 图标 + 文本混排；
- `MultiCapsuleSegmentButtonV2`：胶囊型多选，通过 `selectedIndexes` / `$selectedIndexes` 同步多个选中项。

分区 9 补充分段按钮进阶用法：

- **纯 Symbol 胶囊**：条目仅含 `symbol` 字段（heart / star / checkmark_circle，无文本），通过 `onItemClicked` 回调记录点击项；同时设置 `itemSymbolFontSize: fp(18)`、`itemPadding`（`LocalizedPadding`）、`buttonBackgroundColor` 与 `itemMinHeight: 34` 展示样式定制；
- **禁用条目**：`SegmentButtonV2ItemOptions.enabled = false` 的条目置灰且点击无响应，与两个可用条目同组对照。

### 7. 数据模型与配置工厂

[`ChipModels.ets`](entry/src/main/ets/model/ChipModels.ets) 提供三层纯逻辑：

- `TagStore`：标签增删、激活 / 禁用切换、`getAll()` 返回副本、id 不复用、顺序保持、激活数量统计与清空；
- `CounterLogic`：构造时截断初始值，`increase` / `decrease` / `setValue` 均按 `[min, max]` 截断，并提供 `atMax` / `atMin`；
- `ChipConfigFactory`：统一构建 `ChipV2LabelConfig`、`ChipGroupV2ItemConfig`、`ChipGroupV2ItemStyle`、`ChipGroupV2Space`、`ChipV2CloseIcon`、`SymbolGlyphModifier` 与 `SegmentButtonV2ItemOptions`，并覆盖进阶配置：`buildSuffixSymbolOptions`（V1 后缀 Symbol + action）、`buildSuffixSymbolIcon`（V2 后缀 Symbol 三态）、`buildChipV2Padding` / `buildGroupPadding`（LocalizedPadding / ChipGroupV2Padding）、`buildGroupSuffixItems`（分组尾部图标组条目，支持点亮标记）、`buildSymbolSegmentItems` / `buildSegmentItemsWithDisabled`（纯 Symbol 分段条目与指定禁用项），测试可直接断言字段映射。

分组的条目对象、`itemStyle` 与 `chipGroupSpace` 在页面中只初始化一次并传稳定引用，避免日志触发重绘时同组 Chip 重新挂载而闪烁。

### 8. 日志

[`LogUtil.ets`](entry/src/main/ets/model/utils/LogUtil.ets) 提供 `debug / info / warn / error`，同时写 hilog 与页面日志面板：

- hilog domain `0x0001`，tag `ChipAndCounter`；
- 页面日志最多 120 条，最新置顶，每条带 `#递增序号`，写明点击对象与可见结果；
- 支持级别过滤（`LogLevel.DEBUG / INFO / WARN / ERROR`），未注入面板回调时仅输出 hilog。

### 9. 测试

设备侧测试位于 `entry/src/ohosTest/ets/test/`，共 9 个套件、202 条用例，通过 `List.test.ets` 聚合。用例分布如下：

| 类别 | 套件 | 用例 | 状态 |
| --- | --- | --- | --- |
| 纯逻辑与设备集成套件 | `ChipModels` / `LogUtil` / `DeviceUtil` / `Ability` | 67 | 已在 RK3568（API 26）真机全量通过 |
| 组合展开套件 | `TagStoreMatrix` / `CounterLogicMatrix` / `ChipConfigFactoryMatrix` / `LogUtilMatrix` / `DeviceUtilMatrix` | 135 | 已在 RK3568（API 26）真机全量通过 |
| 手工 UI 用例 | 见 `ohosTest.md` 用例表 | 31 | 需在设备上手工操作 |

| 套件 | 用例 | 覆盖 |
| --- | --- | --- |
| `ChipModels.test.ets` | 45 | TagStore 增删 / 缺失删除 / 激活切换 / 禁用 / 副本与浅拷贝语义 / 清空 / id 不复用 / 顺序 / 激活计数 / 空白文本 / 日志联动；CounterLogic 截断 / 初始值 / 步进 / 边界 / 越界 / 负步进 / 退化区间；配置工厂全部字段映射、空数组与进阶构建（后缀 Symbol、LocalizedPadding、分组留白、尾部图标组含点亮标记、纯 Symbol / 禁用分段条目） |
| `LogUtil.test.ets` | 11 | 未初始化安全性、回调投递、行格式与时间戳、级别过滤与标记、时间格式补零、错误级别投递、重复 init 替换回调、多条日志顺序、未知级别标记 |
| `DeviceUtil.test.ets` | 10 | 设备类型非空、形态互斥、断点边界（599 / 600 / 839 / 840 / 精确阈值 / 负数与小数宽度）、档位类型安全、档案字段、宽屏与双栏阈值一致性 |
| `Ability.test.ets` | 1 | Ability 冒烟用例 |
| `TagStoreMatrix.test.ets` | 31 | id 连续与不复用、空串 / 中文 / 重复 / 空白文本、首中尾删除与非法 / 零 / 小数 id、多标签激活独立、禁用与激活互不影响、findById 引用与 getAll 快照一致性、全删与增删循环、50 条批量压测、小数 id 全接口拒绝、禁用+激活+删除组合流 |
| `CounterLogicMatrix.test.ets` | 23 | clamp 边界 / 退化区间 / 负数区间 / 无穷大边界、构造截断、step=0 与小数步进、跨上下限、连续步进到达边界、setValue 越界、atMax / atMin 迁移、实例隔离 |
| `ChipConfigFactoryMatrix.test.ets` | 42 | 标签空串 / 中文 / 可选激活色、前缀图标来源、分组条目顺序与 allowClose 语义、分段条目顺序与重复项、Symbol 引用一致性、关闭图标字号 12 / 24、样式与间距、重复调用独立；后缀 Symbol action 与三态图标、ChipV2 / 分组 LocalizedPadding 精确值与零值、分组尾部图标组组合与索引分发、点亮标记重建、长短标记表、无 Symbol 列表、纯 Symbol 分段条目（含空数组）、指定索引禁用（首 / 中 / 尾 / 无） |
| `LogUtilMatrix.test.ets` | 22 | init 不写面板与沿用 / 显式级别、级别调高调低与中途切换、固定时刻与两位数时刻格式化、时间令牌形状、四级行格式、标签与消息保真（空格 / 中文 / 括号 / 空消息 / 多行消息）、DEBUG 标记 |
| `DeviceUtilMatrix.test.ets` | 17 | 分数宽度断点、档位单调、双栏结论一致、形态标志一致、档案字段类型、logDeviceProfile 不抛异常且写入档案行 |

组合用例逐条显式书写并带完整 `@tc` 头（number / name / desc / size / type / level），只调用 `ChipModels.ets`、`LogUtil.ets`、`DeviceUtil.ets` 中的真实实现，测试内不复制业务逻辑；期望值来自 API 语义（`[min, max]` 截断、id 不复用、600 / 840vp 断点、日志行格式）。

本地单测位于 `entry/src/test/`，为 1 条冒烟用例。设备侧测试执行命令（签名使用 SDK 自带的 OpenHarmony 默认调试签名）：

```bash
"<DevEco Studio>/tools/node/node" "<DevEco Studio>/tools/hvigor/bin/hvigorw.js" \
  assembleHap --mode module -p module=entry@ohosTest -p product=default --no-daemon
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
ability_command=$(printf '\141\141')
hdc shell "${ability_command} test -b com.samples.chipandcounterdemo -m entry_test \
  -s unittest OpenHarmonyTestRunner -s timeout 150000"
```

未配置签名时产物为 unsigned HAP，可用于编译验证，但无法安装到设备。

## 相关权限

无。所有组件均在应用页面内运行，数据为内存中的示例数据，不需要网络、存储或其它权限。

## 依赖

无第三方运行时依赖，也不依赖其它 sample。`oh-package.json5` 中仅包含测试框架依赖 `@ohos/hypium` 与 `@ohos/hamock`。

## 约束与限制

| 项目 | 要求 |
| --- | --- |
| 开发环境 | DevEco Studio 6.1.1 |
| SDK | 编译 SDK API 26（`compileSdkVersion` / `targetSdkVersion` / `compatibleSdkVersion` 均为 `26.0.0`），`runtimeOS` 为 OpenHarmony |
| 系统版本 | **API 26 及以上**：ChipV2、ChipGroupV2、CounterV2 为 API 26 组件，低于 API 26 的设备上这些分区不可用 |
| 验证设备 | RK3568 / DAYU200（API 26）；`module.json5` 声明 `default / tablet` |
| 签名 | 本地开发使用 SDK 自带的 OpenHarmony 默认调试签名；仓库内不保存任何证书、密钥或口令 |

其它限制：

- **截图**：仓库暂未附带运行截图，效果以设备实际运行为准；
- **`allowClose` 默认值**：Chip / ChipV2 未显式设置时默认为 `true` 并渲染关闭图标，展示类标签需设置 `allowClose: false`；
- **禁用标签点击穿透**：本 ROM 上禁用标签与可关闭标签同排时可能触发相邻标签的 `onClose`，示例将禁用标签单独成行规避；
- **条目重建闪烁**：分组条目与样式对象必须在 `build()` 外只创建一次，否则写日志触发重绘会导致同组 Chip 重新挂载而闪烁；
- **激活态样式**：不同系统主题下默认激活色可能不易区分，示例显式指定深蓝底 + 白字 + ✓；
- **V2 图标资源**：Symbol 图标使用系统资源 `sys.symbol.heart` / `sys.symbol.star` / `sys.symbol.checkmark_circle` / `sys.symbol.chevron_right`，需设备支持 HM Symbol。

## 下载

本工程当前以独立目录维护，直接复制 `ChipAndCounterDemo` 目录即可使用。合入应用示例仓后，工程位于 `code/UI/ChipAndCounterDemo`，可通过以下命令单独获取：

```bash
git clone https://gitcode.com/openharmony/applications_app_samples.git
cp -r applications_app_samples/code/UI/ChipAndCounterDemo .
```

获取后在 DevEco Studio 中打开 `ChipAndCounterDemo` 根目录运行。
