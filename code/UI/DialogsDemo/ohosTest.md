# DialogsDemo 测试用例归档

## 测试环境

- 设备：RK3568 开发板（DAYU200），OpenHarmony 7.0.0.46 Beta1 / 7.1.0.22 Canary1，API 26
- 应用：`com.samples.dialogsdemo`
- 测试框架：Hypium，测试模块 `entry_test`，执行器 `OpenHarmonyTestRunner`
- 开发环境：DevEco Studio 6.1.1，编译 SDK API 26，`compatibleSdkVersion 6.1.1(24)`
- 测试代码：`entry/src/ohosTest/ets/test/`，4 个套件 43 条用例，由 `List.test.ets` 聚合

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| --- | --- | --- | --- | --- | --- |
| 应用启动与首页渲染 | 设备已安装应用 | 启动 `EntryAbility` | 首页显示 8 个场景按钮与底部「事件日志」面板 | 否 | Pass |
| 场景1 确认对话框 | 位于首页 | 点击场景1，勾选复选框，分别点击主按钮、次按钮 | `ConfirmDialogV2` 弹出，复选框触发 `onCheckedChange`，按钮回调与关闭依次写入事件日志（open → check → click → close） | 否 | Pass |
| 场景2 警告详情弹窗 | 位于首页 | 点击场景2，观察双标题并点击两个按钮 | `AlertDialogV2` 显示 `primaryTitle` / `secondaryTitle` 与内容，按钮回调写入日志 | 否 | Pass |
| 场景3 单选列表弹窗 | 位于首页 | 点击场景3，切换单选项后点击“确定” | `SelectDialogV2` 预选中 `selectedIndex`；选择项记录 `select#n`；确定后关闭并记录选中项（本 ROM 选项点击会触发组件内部关闭，示例已重开同一弹窗保持“先选后确定”） | 否 | Pass |
| 场景4 图示提示弹窗 | 位于首页 | 点击场景4，勾选提示项并点击按钮 | `TipsDialogV2` 显示 `imageRes` 图标与 `checkTips`，勾选与按钮回调写入日志 | 否 | Pass |
| 场景5 加载中弹窗 | 位于首页 | 点击场景5 | `LoadingDialogV2` 显示提示文案，约 2 秒后由 `closeCustomDialog` 自动关闭，日志记录 open / close | 否 | Pass |
| 场景6 自定义内容弹窗 | 位于首页 | 点击场景6，点击自定义内容区与按钮数组中的按钮 | `CustomContentDialogV2` 渲染 `contentBuilder` 内容，按钮回调写入日志 | 否 | Pass |
| 场景7 气泡弹窗 | 位于首页 | 点击场景7 锚点按钮，再次点击锚点 | `PopoverDialogV2` 在锚点下方弹出非模态气泡，`visible` 与按钮文案同步；点击外部消失后再次点击可重新弹出 | 否 | Pass |
| 场景8 插屏弹窗 | 位于首页 | 点击场景8，点击弹窗本体、右上角 X | `InterstitialDialogAction` 以底部横幅样式弹出，`onDialogClick` / `onDialogClose` 写入日志；重复点击场景8 不叠加 | 否 | Pass |
| 事件日志与序号 | 已执行多个场景 | 观察「事件日志」面板 | 事件行按 `open#n / close#n / click#n / select#n / check#n` 格式递增，最新置顶，容量 60 行 | 否 | Pass |
| 弹窗不叠加 | 位于首页 | 连续点击不同场景按钮 | 场景 1–7 打开新弹窗前先关闭已存在弹窗；场景 8 在插屏打开期间忽略重复点击并记录日志 | 否 | Pass |
| hilog 输出 | 已执行若干场景 | `hdc shell hilog \| grep DialogsDemo` | 输出与面板一致的事件日志，domain `0x0001` | 否 | Pass |
| DialogEventLog 事件簿记 | 设备侧测试环境 | 执行 `DialogModels.test.ets` 中事件格式、容量与查询相关用例 | `open/close/click/select/check/error` 格式化正确；容量 60 的边界（第 60/61 条）、快照隔离、前缀行首匹配、clear 均符合预期 | 是 | Pass |
| 按钮 / SheetInfo / 参数类工厂 | 设备侧测试环境 | 执行配置工厂与参数类相关用例 | 主按钮 `EMPHASIZED`、次按钮 `TEXTUAL` 默认值与回调正确；SheetInfo 空列表、标题快照、重复标题下标闭包正确；IconStyle / TitlePosition / BottomOffset 枚举值与各参数类 sceneId、实例隔离正确 | 是 | Pass |
| LogUtil 日志双通道 | 设备侧测试环境 | 执行 `LogUtil.test.ets` 12 条用例 | 回调注入与替换、未传级别保持阈值、行格式含时间戳、级别过滤与等值边界、`setMinLevel` 即时生效、levelMark（含未知值）、时间补零均通过 | 是 | Pass |
| DeviceUtil 设备与断点 | 设备侧测试环境 | 执行 `DeviceUtil.test.ets` 8 条用例 | 设备类型非空、形态互斥、宽屏与形态一致、断点边界与极值、`preferTwoColumn` 阈值（599/600）正确 | 是 | Pass |
| Ability 冒烟 | 设备侧测试环境 | 执行 `Ability.test.ets` 1 条用例 | 用例通过 | 是 | Pass |

## 执行方式

设备侧测试（签名由 DevEco Studio 自动签名或本地签名材料提供）：

```bash
"<DevEco Studio>/tools/node/node" "<DevEco Studio>/tools/hvigor/bin/hvigorw.js" \
  assembleHap --mode module -p module=entry@ohosTest -p product=default --no-daemon
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
hdc shell aa test -b com.samples.dialogsdemo -m entry_test \
  -s unittest OpenHarmonyTestRunner -s timeout 150000
```

查看应用日志：

```bash
hdc shell hilog | grep DialogsDemo
```

## 验证结果

`Tests run: 43, Failure: 0, Error: 0, Pass: 43`（4 个套件：DialogModels 22、LogUtil 12、DeviceUtil 8、Ability 1）。

## 补充说明

- 设备侧用例全部为纯逻辑验证（事件簿记、按钮 / SheetInfo / 参数类工厂、日志、设备档案），不依赖 UI 树，也不包含 UI 自动化用例；8 类弹窗的实际呈现与 `open → click → close` 时序由上表中标为「否」的手工用例覆盖。
- `README_zh.md` 的“测试矩阵”表（22 / 12 / 8 / 1）与本文件一致；工程目录注释中的套件用例数已同步为 22 / 12 / 8 / 1。
- `entry/src/test/` 仅包含模板自带的 1 条本地冒烟用例，功能验证以 `entry/src/ohosTest` 下的 43 条设备侧用例为准。
- 本 ROM 上 `SelectDialogV2` 点击选项后组件内部会关闭弹窗（`autoCancel:false` 与 `onWillDismiss` 无法拦截），示例在 `SheetInfo.action` 中重开同一弹窗并以 `TransitionEffect.IDENTITY` 关闭显隐动画；其他 ROM 行为不同时可移除该重开逻辑。
- `InterstitialDialogAction` 标注 `@atomicservice`，本工程在普通应用上验证通过；其他 ROM / 版本的行为以实际运行为准。
