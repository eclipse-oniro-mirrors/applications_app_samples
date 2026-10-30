# ChipAndCounterDemo 测试用例归档

## 测试环境

- 设备：RK3568 开发板（DAYU200），OpenHarmony 7.0.0.46 / API 26
- 应用：`com.samples.chipandcounterdemo`
- 测试框架：Hypium，测试模块 `entry_test`，执行器 `OpenHarmonyTestRunner`
- 开发环境：DevEco Studio 6.1.1，编译 SDK API 26，`compatibleSdkVersion 6.1.1(24)`
- 测试代码：`entry/src/ohosTest/ets/test/`，4 个套件 49 条用例，由 `List.test.ets` 聚合

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| --- | --- | --- | --- | --- | --- |
| 应用启动与页面渲染 | 设备已安装应用 | 启动 `EntryAbility` | 页面显示设备信息卡、5 个分区、分区导航提示与日志面板，日志记录设备档案与分区数量 | 否 | Pass |
| 分区导航跳转 | 位于首页 | 点击「跳到计数与分段 ↓」 | 演示区滚动定位到第 4 分区（计数），再下滑可到第 5 分区（分段按钮），日志记录跳转动作 | 否 | Pass |
| Chip V1 激活切换 | 位于分区 1 | 点击「V1 基础标签」，再次点击 | 首次切换为深蓝底、白字、文字后带 ✓；再次点击恢复默认样式，状态行同步 | 否 | Pass |
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
| 状态行与日志一致性 | 各分区已完成若干操作 | 对比分区底部状态行与日志内容 | 状态行内容与最新日志一致，日志带递增序号且写明可见结果 | 否 | Pass |
| 断点自适应布局 | 设备已启动 | 观察 480×853vp 竖屏与 ≥600vp 窗口 | `sm` 上下单栏、日志固定 200vp；`md/lg` 左右双栏、日志占 38% | 否 | Pass |
| 日志面板容量与过滤 | 位于首页 | 连续操作产生超过 120 条日志，切换级别过滤 | 最新日志置顶，最多保留 120 条；级别过滤只影响面板展示，hilog 全量输出 | 否 | Pass |
| TagStore 标签仓库 | 设备侧测试环境 | 执行 `ChipModels.test.ets` 中 TagStore 相关 11 条用例 | 增删、缺失删除、激活切换、禁用、副本返回、清空、id 不复用、顺序保持、激活计数均符合预期 | 是 | Pass |
| CounterLogic 计数逻辑 | 设备侧测试环境 | 执行 CounterLogic 相关 6 条用例 | 初始值截断、步进、上下边界、越界步进、`setValue` 均按 `[min, max]` 截断 | 是 | Pass |
| ChipConfigFactory 配置工厂 | 设备侧测试环境 | 执行配置工厂相关 15 条用例 | Label / 分组条目 / 分段条目 / SymbolGlyphModifier / V1 Symbol / 前缀图标 / 关闭图标 / 分组样式 / 分组间距字段映射正确，空数组与混合条目不串字段 | 是 | Pass |
| LogUtil 日志双通道 | 设备侧测试环境 | 执行 `LogUtil.test.ets` 8 条用例 | 回调投递、行格式含时间戳、级别过滤与标记、时间补零、错误级别投递、重复 `init` 替换回调 | 是 | Pass |
| DeviceUtil 设备与断点 | 设备侧测试环境 | 执行 `DeviceUtil.test.ets` 8 条用例 | 设备类型非空、形态互斥、断点边界（599 / 600 / 839 / 840）、档案字段完整、宽屏与双栏阈值一致 | 是 | Pass |
| Ability 冒烟 | 设备侧测试环境 | 执行 `Ability.test.ets` 1 条用例 | 用例通过 | 是 | Pass |

## 执行方式

设备侧测试（签名由 DevEco Studio 自动签名或本地签名材料提供）：

```bash
"<DevEco Studio>/tools/node/node" "<DevEco Studio>/tools/hvigor/bin/hvigorw.js" \
  assembleHap --mode module -p module=entry@ohosTest -p product=default --no-daemon
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
hdc shell aa test -b com.samples.chipandcounterdemo -m entry_test \
  -s unittest OpenHarmonyTestRunner -s timeout 150000
```

查看应用日志：

```bash
hdc shell hilog | grep ChipAndCounter
```

## 验证结果

`Tests run: 49, Failure: 0, Error: 0, Pass: 49`（4 个套件：ChipModels 32、LogUtil 8、DeviceUtil 8、Ability 1）。

## 补充说明

- 设备侧用例全部为纯逻辑验证（标签仓库、计数逻辑、配置工厂、日志、设备档案），不依赖 UI 树，也不包含 UI 自动化用例；界面行为由上表中标为「否」的手工用例覆盖。
- `entry/src/test/` 仅包含模板自带的 1 条本地冒烟用例，功能验证以 `entry/src/ohosTest` 下的 49 条设备侧用例为准。
- ChipV2、ChipGroupV2、CounterV2 为 API 26 新增组件，低于 API 26 的设备上对应分区不可用，测试环境需使用 API 26 镜像。
