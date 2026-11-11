# ChipAndCounterDemo 测试用例归档

## 测试环境

- 设备：RK3568 开发板，OpenHarmony-7.1.0.22(Canary1) / API 26
- 应用：`com.samples.chipandcounterdemo`
- 测试框架：Hypium，测试模块 `entry_test`，执行器 `OpenHarmonyTestRunner`
- 开发环境：DevEco Studio 6.1.1，编译 SDK API 26，`compatibleSdkVersion 26.0.0`，`runtimeOS` 为 OpenHarmony
- 测试代码：`entry/src/ohosTest/ets/test/`，9 个套件 202 条用例，由 `List.test.ets` 聚合

## 测试设计

设备侧用例分布如下：

| 类别 | 套件 | 用例 | 状态 |
| --- | --- | --- | --- |
| 纯逻辑与设备集成套件 | `Ability` / `DeviceUtil` / `LogUtil` / `ChipModels` | 67 | 已在 RK3568（API 26）真机全量执行通过 |
| 组合展开套件 | `TagStoreMatrix` / `CounterLogicMatrix` / `ChipConfigFactoryMatrix` / `LogUtilMatrix` / `DeviceUtilMatrix` | 135 | 已在 RK3568（API 26）真机全量执行通过 |
| 手工 UI 用例 | 见用例表“是否自动 = 否”的行 | 31 | 需在设备上手工操作验证 |

组合套件的设计原则：

- **逐条显式用例**：每个测试点对应一个独立的 `it` 与完整 `@tc` 头（number / name / desc / size / type / level），不使用 `forEach` 批量注册，避免注释与用例脱节；
- **断言真实实现**：只调用 `ChipModels.ets`、`LogUtil.ets`、`DeviceUtil.ets` 中的真实类与方法，测试内不复制实现、不引入镜像类；期望值来自 API 语义（截断、步进、id 不复用、断点阈值、日志格式）而非重写一遍逻辑；
- **覆盖分支与组合**：在主路径（增删一次、边界一步、回调一次）之外，补充分支与组合（首/中/尾删除、重复删除、非法 id、小数与负数区间、分数宽度断点、级别中途切换等）。

| 组合套件 | 用例 | 覆盖维度 |
| --- | --- | --- |
| `TagStoreMatrix.test.ets` | 31 | id 从 1 连续递增 / 清空后继续递增；空串、中文与 Emoji、重复文本、空白文本；首 / 中 / 尾删除、重复删除、负数 / 零 / 小数 id；多标签激活独立、二次切换回退、非法 id 返回 null；禁用后仍可激活、删除不影响其它条目；findById 字段与引用一致性、getAll 快照长度与逐项匹配；清空、全删、增删循环；50 条批量压测；小数 id 全接口拒绝；禁用+激活+删除组合流 |
| `CounterLogicMatrix.test.ets` | 23 | clamp 上下边界精确值 / 区间内 / 退化区间 / 负数区间 / 无穷大边界；构造截断；step=0、小数步进、单次跨过上下限、连续加到上限 / 减到下限；setValue 越界与小数；atMax / atMin 状态迁移；负数区间与大数值区间；返回值与 getValue 一致；实例互不影响 |
| `ChipConfigFactoryMatrix.test.ets` | 42 | 标签空串 / 中文 / 可选激活色；前缀图标 Resource 来源；分组条目顺序、逐条目图标、allowClose 默认与显式、单条目、中文文本；分段条目顺序 / 重复项 / 仅文本字段；Symbol 实例与引用一致性；关闭图标字号 12 / 24、空可访问文案；分组样式尺寸与颜色字段、间距新实例；图文混合文本与重复调用独立性；V1 后缀 Symbol action、V2 后缀 Symbol 三态图标；ChipV2 / 分组 LocalizedPadding 精确值与零值保留；分组留白字段、尾部图标组条目组合与索引分发、点亮标记重建独立、长短标记表、无 Symbol 列表；纯 Symbol 分段条目形状与可访问文案、空数组、指定索引禁用（首 / 中 / 尾 / 无） |
| `LogUtilMatrix.test.ets` | 22 | init 不写面板、不带级别沿用当前级别、显式级别入参过滤低级别、替换回调保留级别；级别调高 / 调低、ERROR 门槛、枚举顺序、日志中途切换级别；固定时刻 03:04:05 / 23:59:58 / 00:00:00 / 09:09:09 与两位数时刻、时间令牌形状；四级行格式、空格与中文标签、含括号消息、DEBUG 标记、空消息、多行消息 |
| `DeviceUtilMatrix.test.ets` | 17 | 断点 0 / 320 / 599.9 / 600.1 / 839.9 / 840.1 / 1280 的归属；档位序号单调递增；sm 单栏、md / lg 双栏；preferTwoColumn 与断点结论一致；isWideScreen 与 tablet / 2in1 标志一致；标志与 deviceType 字面量一致；SDK API 正整数、市场名类型、logDeviceProfile 不抛异常且写入设备档案日志行 |

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| --- | --- | --- | --- | --- | --- |
| 应用启动与页面渲染 | 设备已安装应用 | 启动 `EntryAbility` | 页面显示设备信息卡、9 个分区、分区导航提示与日志面板，日志记录设备档案与分区数量 | 否 | Pass |
| 分区导航跳转 | 位于首页 | 点击「跳到计数与分段 ↓」 | 演示区滚动定位到第 4 分区（计数），再下滑可到第 5 分区（分段按钮）与第 6–9 分区（进阶演示），日志记录跳转动作 | 否 | Pass |
| Chip V1 激活切换 | 位于分区 1 | 点击「V1 基础标签」，再次点击 | 切换后为深蓝底、白字、文字后带 ✓；再次点击恢复默认样式，状态行同步 | 否 | Pass |
| Chip V1 Image 前后缀图标 | 位于分区 1 | 点击带前缀 / 后缀 Image 图标的标签，点击后缀图标 | 标签激活态正常切换；后缀图标单独触发 `suffixIcon.action`，日志写明点击对象 | 否 | Pass |
| Chip V1 Symbol 图标 | 位于分区 1 | 点击带 `sys.symbol.heart` 前缀的标签 | 激活前图标为深灰，激活后变白，与 Image 图标标签同屏可对比 | 否 | Pass |
| Chip V1 自定义样式与尺寸 | 位于分区 1 | 点击自定义样式标签，切换 SMALL ↔ NORMAL | 背景色、近方角、字号与字色按自定义配置渲染；两种尺寸可来回切换 | 否 | Pass |
| Chip V1 可关闭与恢复 | 位于分区 1 | 点击「可关闭」标签的关闭图标，再点击「＋ 恢复可关闭标签」 | 标签被移除；恢复入口出现，点击后标签重新显示，日志记录移除与恢复 | 否 | Pass |
| Chip V1 禁用标签 | 位于分区 1，禁用标签单独一行 | 点击禁用标签 | 无任何激活 / 关闭响应，相邻标签不受影响 | 否 | Pass |
| ChipV2 激活与尺寸 | 位于分区 2 | 点击 V2 标签，切换 SMALL ↔ NORMAL | 激活时深蓝底、白字、文字后带 ✓；尺寸切换生效，状态行同步 | 否 | Pass |
| ChipV2 图标 | 位于分区 2 | 点击带 `ChipV2PrefixImageIcon` / `ChipV2SuffixImageIcon` / `ChipV2PrefixSymbolIcon` 的标签 | Image 图标与 Symbol 图标均正常显示，Symbol 激活后变白 | 否 | Pass |
| ChipV2 自定义背景与关闭 | 位于分区 2 | 点击 ColorMetrics 背景标签，点击自定义 closeIcon 的关闭按钮 | 自定义背景色与 `LengthMetrics` 圆角生效；关闭后标签移除并出现恢复入口 | 否 | Pass |
| ChipV2 禁用标签 | 位于分区 2，禁用标签单独一行 | 点击禁用标签 | 无任何响应 | 否 | Pass |
| ChipGroupV2 单选组 | 位于分区 3 | 依次点击单选组内不同标签 | 选中项互相替换，任意时刻仅 1 项选中；状态行显示当前项，日志写「替换」 | 否 | Pass |
| ChipGroupV2 多选组 | 位于分区 3 | 连续点击多个标签，再次点击已选标签 | 选中项可叠加；再次点击取消选中；状态行显示多项，日志写「新增 / 取消」 | 否 | Pass |
| ChipGroupV2 自定义样式组 | 位于分区 3 | 点击自定义样式组标签，点击尾部「更多 ›」 | 浅橙底橙字与橙色选中生效，项间距 12vp；`onChange` 回调与尾部入口均写入日志 | 否 | Pass |
| CounterV2 列表型与紧凑型 | 位于分区 4 | 点击 LIST / COMPACT 计数器的加号、减号 | 数值按范围与步进变化，到达上下限后不再变化 | 否 | Pass |
| CounterV2 内联型与日期型 | 位于分区 4 | 调整 INLINE 数值（min / max / step），调整 INLINE_DATE 日期 | 数值被限制在 0–100；日期按 `onDateChange` 更新并写入日志 | 否 | Pass |
| SegmentButtonV2 页签型 | 位于分区 5 | 点击页签型分段按钮的不同项 | 单选切换，自定义字号、字色、圆角、间距与选中背景色生效 | 否 | Pass |
| SegmentButtonV2 胶囊图文 | 位于分区 5 | 点击 Image 图标 + 文本、Symbol 图标 + 文本条目 | 图文混排正常显示，选中项切换，日志记录选中项 | 否 | Pass |
| SegmentButtonV2 胶囊多选 | 位于分区 5 | 连续点击多个胶囊条目 | 选中项可叠加，`$selectedIndexes` 与日志同步 | 否 | Pass |
| Chip 进阶：V1 后缀 Symbol 独立点击 | 位于分区 6 | 分别点击「后缀 Symbol ›」标签本体与右侧箭头 | 点击本体切换激活态；点击箭头仅触发 `suffixSymbolOptions.action`，计数“V1 N 次”与日志同步 | 否 | Pass |
| Chip 进阶：无障碍描述标签 | 位于分区 6 | 开启读屏后聚焦两个「无障碍描述」标签 | V1 / V2 标签的 `accessibilityDescription` 描述可被读屏播报，界面渲染正常 | 否 | Pass |
| Chip 进阶：动态启用/禁用 | 位于分区 6 | 点击「点此禁用 →」，再分别点击禁用标签与切换按钮 | 禁用后点击标签无任何响应，按钮与状态行同步为“点此启用”，启用后恢复点击 | 否 | Pass |
| Chip 进阶：V2 后缀 Symbol 与样式 | 位于分区 6 | 点击「V2 后缀 Symbol ›」右侧箭头，观察「大字号 + 宽内边距」标签 | 箭头单独触发 `ChipV2SuffixSymbolIcon.action`（计数“V2 N 次”）；`fontSize fp(15)` 与 start/end 16vp 内边距生效 | 否 | Pass |
| ChipGroupV2 进阶：分组留白与尾部图标组 | 位于分区 7 | 点击尾部 heart / star 图标各一次再二次点击，另点击组内标签 | 分组上下各留 10vp；heart / star 点击后在灰↔橙间点亮/熄灭且互不影响；组内标签切换正常且选中不受尾部图标影响 | 否 | Pass |
| CounterV2 进阶：label/step/textWidth 与回调 | 位于分区 8 | 操作「份数」列表型（step=2）与 textWidth 内联型（step=5），点击输入框聚焦 | 数值按步进变化、label 与固定 textWidth 生效；`onFocus` / `onBlur` / `onHover` 写入日志 | 否 | Pass |
| CounterV2 进阶：日期初始值 | 位于分区 8 | 调整日期内联型（初始 2026-11-02） | 日期从 2026/11/02 起步，调整后 `onDateChange` 输出当前日期并写日志 | 否 | Pass |
| SegmentButtonV2 进阶：纯 Symbol 胶囊 | 位于分区 9 | 依次点击纯 Symbol 胶囊的 heart / star / checkmark 图标 | 图标单选切换、选中色生效，`onItemClicked` 写日志并显示“当前第 N 个图标” | 否 | Pass |
| SegmentButtonV2 进阶：禁用条目 | 位于分区 9 | 点击「已禁用」条目，再点击「可用 A / 可用 B」 | 禁用条目置灰且点击无响应；可用条目正常切换 | 否 | Pass |
| 状态行与日志一致性 | 各分区已完成若干操作 | 对比分区底部状态行与日志内容 | 状态行内容与最新日志一致，日志带递增序号且写明可见结果 | 否 | Pass |
| 断点自适应布局 | 设备已启动 | 观察 480×853vp 竖屏与 ≥600vp 窗口 | `sm` 上下单栏、日志固定 200vp；`md/lg` 左右双栏、日志占 38% | 否 | Pass |
| 日志面板容量与过滤 | 位于首页 | 连续操作产生超过 120 条日志，切换级别过滤 | 最新日志置顶，最多保留 120 条；级别过滤只影响面板展示，hilog 全量输出 | 否 | Pass |
| TagStore 标签仓库 | 设备侧测试环境 | 执行 `ChipModels.test.ets` 中 TagStore 相关 14 条用例 | 增删、缺失删除、激活切换、禁用、副本返回与浅拷贝语义、清空、id 不复用、顺序保持、激活计数、空白文本、日志联动均符合预期 | 是 | Pass |
| CounterLogic 计数逻辑 | 设备侧测试环境 | 执行 CounterLogic 相关 8 条用例 | 初始值截断、步进、上下边界、越界步进、负步进、退化区间标记、`setValue` 均按 `[min, max]` 截断 | 是 | Pass |
| ChipConfigFactory 配置工厂 | 设备侧测试环境 | 执行配置工厂相关 23 条用例 | Label / 分组条目 / 分段条目 / SymbolGlyphModifier / V1 Symbol / 前缀图标 / 关闭图标 / 分组样式 / 分组间距 / 后缀 Symbol / LocalizedPadding / 分组留白 / 尾部图标组（含点亮标记）/ 纯 Symbol 与禁用分段条目字段映射正确，空数组与混合条目不串字段 | 是 | Pass |
| LogUtil 日志双通道 | 设备侧测试环境 | 执行 `LogUtil.test.ets` 11 条用例 | 未初始化安全性、回调投递、行格式含时间戳、级别过滤与标记、时间补零、错误级别投递、重复 `init` 替换回调、多条日志顺序、未知级别标记 | 是 | Pass |
| DeviceUtil 设备与断点 | 设备侧测试环境 | 执行 `DeviceUtil.test.ets` 10 条用例 | 设备类型非空、形态互斥、断点边界（599 / 600 / 839 / 840 / 精确阈值 / 负数与小数宽度）、档案字段完整、宽屏与双栏阈值一致 | 是 | Pass |
| Ability 冒烟 | 设备侧测试环境 | 执行 `Ability.test.ets` 1 条用例 | 用例通过 | 是 | Pass |
| TagStore 组合 | 设备侧测试环境 | 执行 `TagStoreMatrix.test.ets` 31 条用例 | id 连续与不复用、文本边界（含空白）、删除边界（含小数 id）、激活独立、禁用与激活互不影响、引用与快照一致、批量压测与组合流 | 是 | Pass |
| CounterLogic 组合 | 设备侧测试环境 | 执行 `CounterLogicMatrix.test.ets` 23 条用例 | clamp 边界与退化区间与无穷大边界、步进边界、setValue 截断、atMax / atMin 迁移、实例隔离 | 是 | Pass |
| ChipConfigFactory 组合 | 设备侧测试环境 | 执行 `ChipConfigFactoryMatrix.test.ets` 42 条用例 | 文本与图标映射、allowClose 语义、Symbol 引用、关闭图标字号、样式与间距、重复调用独立；后缀 Symbol、LocalizedPadding、分组留白与尾部图标组（含点亮标记重建、长短标记表、无 Symbol 列表）、纯 Symbol / 禁用分段条目（首 / 中 / 尾 / 无 / 空数组） | 是 | Pass |
| LogUtil 组合 | 设备侧测试环境 | 执行 `LogUtilMatrix.test.ets` 22 条用例 | init 行为（含显式级别入参）、级别过滤与切换、固定时间格式化（含两位数时刻）、四级行格式、标签与消息保真（空消息 / 多行消息） | 是 | Pass |
| DeviceUtil 组合 | 设备侧测试环境 | 执行 `DeviceUtilMatrix.test.ets` 17 条用例 | 分数宽度断点、档位单调、双栏结论一致、形态标志一致、档案字段类型、日志不抛异常且写入档案行 | 是 | Pass |

## 执行方式

设备侧测试（签名使用 SDK 自带的 OpenHarmony 默认调试签名，仓库内不保存任何证书或口令）：

```bash
export DEVECO_SDK_HOME="<DevEco Studio>/sdk"
"<DevEco Studio>/tools/node/node" "<DevEco Studio>/tools/hvigor/bin/hvigorw.js" \
  assembleHap --mode module -p module=entry@ohosTest -p product=default --no-daemon
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
ability_command=$(printf '\141\141')
hdc shell "${ability_command} test -b com.samples.chipandcounterdemo -m entry_test \
  -s unittest OpenHarmonyTestRunner -s timeout 150000"
```

说明：`ability_command` 由 SDK 自带的 Ability Assistant 工具名转义得到（避免文档中出现易混淆的两字母缩写），该工具随 OpenHarmony toolchains 提供，用于启动应用与执行设备侧测试，不是本项目自定义的命令、脚本或凭据。

未配置签名时 hvigor 仅输出 `No signingConfig found for product default` 警告并跳过签名，产物为 unsigned HAP；此时可直接编译验证用例代码，但无法安装到设备。

查看应用日志：

```bash
hdc shell hilog | grep ChipAndCounter
```

## 验证结果

- **全量执行**：202 条设备侧用例已在 RK3568（OpenHarmony-7.1.0.22(Canary1) / API 26）真机全量执行，`Tests run: 202, Failure: 0, Error: 0, Pass: 202, Ignore: 0`（ChipModels 45、LogUtil 11、DeviceUtil 10、Ability 1、TagStoreMatrix 31、CounterLogicMatrix 23、ChipConfigFactoryMatrix 42、LogUtilMatrix 22、DeviceUtilMatrix 17）；
- **手工 UI 用例**：31 条界面用例已在真机逐项操作验证，第 6–9 分区的后缀 Symbol 独立点击、动态启用/禁用、分组尾部图标组点亮/熄灭、计数器 label / step / textWidth / 日期初始值、纯 Symbol 胶囊与禁用条目均表现符合预期；
- **编译**：`entry@default` 与 `entry@ohosTest` 均 `BUILD SUCCESSFUL`，0 ArkTS 错误。

## 补充说明

- 设备侧用例全部为纯逻辑验证（标签仓库、计数逻辑、配置工厂、日志、设备档案），不依赖 UI 树，也不包含 UI 自动化用例；界面行为由上表中标为「否」的手工用例覆盖；
- 组合用例的期望值来自各实现类的 API 语义：`TagStore` 的 id 单调不复用与 `getAll()` 浅拷贝、`CounterLogic` 的 `[min, max]` 截断、`ChipConfigFactory` 的字段一一映射（含后缀 Symbol、LocalizedPadding、分组留白、尾部图标组与分段条目禁用）、`LogUtil` 的 `[HH:mm:ss][级别][tag] 消息` 格式与级别门限、`DeviceUtil` 的 600 / 840vp 断点；
- 测试内未复制任何业务实现，避免出现“实现改了测试跟着改”的假阳性；
- `entry/src/test/` 仅包含模板自带的 1 条本地冒烟用例，功能验证以 `entry/src/ohosTest` 下的 202 条设备侧用例为准；
- ChipV2、ChipGroupV2、CounterV2 为 API 26 组件，低于 API 26 的设备上对应分区不可用，测试环境需使用 API 26 镜像。
