# DialogsDemo 测试用例归档

## 测试环境

- 设备：RK3568 开发板（DAYU200），OpenHarmony 7.0.0.46 Beta1 / 7.1.0.22 Canary1，API 26
- 应用：`com.samples.dialogsdemo`
- 测试框架：Hypium，测试模块 `entry_test`，执行器 `OpenHarmonyTestRunner`
- 开发环境：OpenHarmony SDK API 26，`compileSdkVersion` / `compatibleSdkVersion 26.0.0`，`runtimeOS: OpenHarmony`
- 测试代码：`entry/src/ohosTest/ets/test/`，10 个套件 144 条用例，由 `List.test.ets` 聚合

## 测试设计

设备侧用例分布如下：

| 类别 | 套件 | 用例 | 状态 |
| --- | --- | --- | --- |
| 纯逻辑与设备集成套件 | `Ability` / `DeviceUtil` / `LogUtil` / `DialogModels` | 43 | 已在 RK3568（API 26）真机全量执行通过 |
| 组合展开套件 | `DialogEventLogMatrix` / `DialogModelsMatrix` / `LogUtilMatrix` / `DeviceUtilMatrix` | 82 | 已在 RK3568（API 26）真机全量执行通过 |
| 场景目录与结果格式化 | `DialogScenarios` | 7 | 已在 RK3568（API 26）真机全量执行通过 |
| 场景目录边界与组合 | `DialogScenariosMatrix` | 12 | 已在 RK3568（API 26）真机全量执行通过 |
| 手工 UI 用例 | 见用例表“是否自动 = 否”的行 | 12 | 需在设备上手工操作验证 |

组合套件的设计原则：

- **逐条显式用例**：每个测试点对应一个独立的 `it` 与完整 `@tc` 头（number / name / desc / size / type / level），不使用 `forEach` 批量注册，避免注释与用例脱节；
- **断言真实实现**：只调用 `DialogModels.ets`、`LogUtil.ets`、`DeviceUtil.ets` 中的真实类与函数，测试内不复制实现、不引入镜像类；期望值来自 API 语义（事件行格式、60 行容量、`[HH:mm:ss][级别][tag] 消息` 格式、600 / 840vp 断点）而非重写一遍逻辑；
- **覆盖分支与组合**：在主路径（每种事件格式一次、容量 60/61 一步、每类参数默认值一次、一个断点边界）之外，补充分支与组合（scene 编号 0 / 负数 / 大数、空串与超长文本、多行消息、淘汰后的前缀查询、百条 SheetInfo、枚举另一组合、实例隔离、分数宽度断点等）。

| 组合套件 | 用例 | 覆盖维度 |
| --- | --- | --- |
| `DialogEventLogMatrix.test.ets` | 24 | scene 0 / 负数 / 大数格式化、空名称留尾空格、中文与 emoji 名称、click 行无尾随分隔符、select 的 0 与 -1 下标；记空串 / 重复行 / 1000 字符行 / 含换行行；容量淘汰顺序、淘汰后前缀查询与 last、空前缀（空日志 false、有记录 true）、前缀等于整行 / 超长前缀 / 大小写敏感；clear 后复用与二次 clear、初始快照、顺序保持、快照不受 clear 影响、实例隔离 |
| `DialogModelsMatrix.test.ets` | 26 | 主按钮中文 / emoji 内容、空内容、action 多次触发、同内容不同实例、主次按钮回调与内容互不影响；SheetInfo 单条 / 中文 / 空串标题、action 可重复触发、100 条下标闭包、两次构建回调隔离、顺序保持；插屏配置另一枚举组合（TOP / DARK / OFFSET_FOR_BAR）、中文 / 空串文本、字段可重赋值、实例隔离；Confirm / Alert / Select / Tips / Loading 参数类默认值、六个 sceneId 两两不同、自定义按钮数组顺序与追加 |
| `LogUtilMatrix.test.ets` | 16 | init 不写面板、级别枚举序；03:04:05 / 00:00:00 / 12:00:00 / 23:00:00 / 12:59:59 固定时刻与时间令牌形状；四级行格式、含空格 / 中文标签、消息含方括号、空标签空消息、300 字符消息长度、含换行消息单次投递 |
| `DeviceUtilMatrix.test.ets` | 16 | 480 / 1024 / 1366 常见宽度、599.9 / 600.1 / 839.9 / 840.1 分数边界、档位序号单调、sm 单栏与 md / lg 双栏、双栏结论与断点一致、三个形态标志与 deviceType 精确一致、SDK API 正整数、logDeviceProfile 不抛异常、重复查询稳定 |

`DialogScenarios.test.ets`（7 例）验证场景目录与选择结果格式化：目录 14 项、id 连续、9–14 的 API 映射、越界查询返回 null，以及日期 `YYYY-MM-DD`、时间 `HH:mm`、文本 `index=n value=xxx` 的补零与拼接。

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| --- | --- | --- | --- | --- | --- |
| 应用启动与首页渲染 | 设备已安装应用 | 启动 `EntryAbility` | 首页显示 14 个场景按钮与底部「事件日志」面板 | 否 | Pass |
| 场景1 确认对话框 | 位于首页 | 点击场景1，勾选复选框，分别点击主按钮、次按钮 | `ConfirmDialogV2` 弹出，复选框触发 `onCheckedChange`，按钮回调与关闭依次写入事件日志（open → check → click → close） | 否 | Pass |
| 场景2 警告详情弹窗 | 位于首页 | 点击场景2，观察双标题并点击两个按钮 | `AlertDialogV2` 显示 `primaryTitle` / `secondaryTitle` 与内容，按钮回调写入日志 | 否 | Pass |
| 场景3 单选列表弹窗 | 位于首页 | 点击场景3，切换单选项后点击“确定” | `SelectDialogV2` 预选中 `selectedIndex`；选择项记录 `select#n`；确定后关闭并记录选中项（本 ROM 选项点击会触发组件内部关闭，示例已重开同一弹窗保持“先选后确定”） | 否 | Pass |
| 场景4 图示提示弹窗 | 位于首页 | 点击场景4，勾选提示项并点击按钮 | `TipsDialogV2` 显示 `imageRes` 图标与 `checkTips`，勾选与按钮回调写入日志 | 否 | Pass |
| 场景5 加载中弹窗 | 位于首页 | 点击场景5 | `LoadingDialogV2` 显示提示文案，约 2 秒后由 `closeCustomDialog` 自动关闭，日志记录 open / close | 否 | Pass |
| 场景6 自定义内容弹窗 | 位于首页 | 点击场景6，点击自定义内容区与按钮数组中的按钮 | `CustomContentDialogV2` 渲染 `contentBuilder` 内容，按钮回调写入日志 | 否 | Pass |
| 场景7 气泡弹窗 | 位于首页 | 点击场景7 锚点按钮，再次点击锚点 | `PopoverDialogV2` 在锚点下方弹出非模态气泡，`visible` 与按钮文案同步；点击外部消失后再次点击可重新弹出 | 否 | Pass |
| 场景8 插屏弹窗 | 位于首页 | 点击场景8，点击弹窗本体、右上角 X | `InterstitialDialogAction` 以底部横幅样式弹出，`onDialogClick` / `onDialogClose` 写入日志；重复点击场景8 不叠加 | 否 | Pass |
| 场景9 操作列表弹窗 | 位于首页 | 点击场景9，依次点击“重命名”“分享”“删除”或取消/遮罩 | ActionSheet 底部弹出，`sheets` 回调写入 `click#9` + `close#9`，取消与遮罩关闭写入 `close#9` | 否 | Pass |
| 场景10 日期选择弹窗 | 位于首页 | 点击场景10，选择日期后点击确定/取消 | DatePickerDialog 弹出，确定写入 `click#10`（`YYYY-MM-DD`）与 `close#10`，取消写入 `close#10` | 否 | Pass |
| 场景11 时间选择弹窗 | 位于首页 | 点击场景11，选择时间后点击确定/取消 | TimePickerDialog 弹出，确定写入 `click#11`（`HH:mm`）与 `close#11`，取消写入 `close#11` | 否 | Pass |
| 场景12 文本选择弹窗 | 位于首页 | 点击场景12，选择城市后点击确定/取消 | TextPickerDialog 弹出，确定写入 `click#12`（`index=n value=xxx`）与 `close#12`，取消写入 `close#12` | 否 | Pass |
| 场景13 轻提示 | 位于首页 | 点击场景13 | Toast 弹出并记录 toastId，1 秒后自动 `closeToast`，写入 `open#13` / `close#13` | 否 | Pass |
| 场景14 系统按钮弹窗 | 位于首页 | 点击场景14，点击“不保存”或“保存” | showDialog 弹出，Promise 返回按钮 `index`，写入 `click#14` 与 `close#14` | 否 | Pass |
| 事件日志与序号 | 已执行多个场景 | 观察「事件日志」面板 | 事件行按 `open#n / close#n / click#n / select#n / check#n` 格式递增，最新置顶，容量 60 行 | 否 | Pass |
| 弹窗不叠加 | 位于首页 | 连续点击不同场景按钮 | 场景 1–7 打开新弹窗前先关闭已存在弹窗；场景 8 在插屏打开期间忽略重复点击并记录日志 | 否 | Pass |
| hilog 输出 | 已执行若干场景 | `hdc shell hilog \| grep DialogsDemo` | 输出与面板一致的事件日志，domain `0x0001` | 否 | Pass |
| DialogEventLog 事件簿记 | 设备侧测试环境 | 执行 `DialogModels.test.ets` 中事件格式、容量与查询相关用例 | `open/close/click/select/check/error` 格式化正确；容量 60 的边界（第 60/61 条）、快照隔离、前缀行首匹配、clear 均符合预期 | 是 | Pass |
| 按钮 / SheetInfo / 参数类工厂 | 设备侧测试环境 | 执行配置工厂与参数类相关用例 | 主按钮 `EMPHASIZED`、次按钮 `TEXTUAL` 默认值与回调正确；SheetInfo 空列表、标题快照、重复标题下标闭包正确；IconStyle / TitlePosition / BottomOffset 枚举值与各参数类 sceneId、实例隔离正确 | 是 | Pass |
| LogUtil 日志双通道 | 设备侧测试环境 | 执行 `LogUtil.test.ets` 12 条用例 | 回调注入与替换、未传级别保持阈值、行格式含时间戳、级别过滤与等值边界、`setMinLevel` 即时生效、levelMark（含未知值）、时间补零均通过 | 是 | Pass |
| DeviceUtil 设备与断点 | 设备侧测试环境 | 执行 `DeviceUtil.test.ets` 8 条用例 | 设备类型非空、形态互斥、宽屏与形态一致、断点边界与极值、`preferTwoColumn` 阈值（599/600）正确 | 是 | Pass |
| Ability 冒烟 | 设备侧测试环境 | 执行 `Ability.test.ets` 1 条用例 | 用例通过 | 是 | Pass |
| DialogEventLog 组合 | 设备侧测试环境 | 执行 `DialogEventLogMatrix.test.ets` 24 条用例 | scene 编号边界、空串 / 重复 / 超长 / 多行事件、容量淘汰后的查询、空前缀与大小写敏感、快照与实例隔离 | 是 | Pass |
| DialogModels 组合 | 设备侧测试环境 | 执行 `DialogModelsMatrix.test.ets` 26 条用例 | 按钮内容边界与回调独立、SheetInfo 百条与回调隔离、插屏配置枚举组合与可变性、参数类默认值与 sceneId 唯一 | 是 | Pass |
| LogUtil 组合 | 设备侧测试环境 | 执行 `LogUtilMatrix.test.ets` 16 条用例 | init 不写面板、枚举序、固定时刻格式化、四级行格式、标签与消息保真、长消息与多行消息 | 是 | Pass |
| DeviceUtil 组合 | 设备侧测试环境 | 执行 `DeviceUtilMatrix.test.ets` 16 条用例 | 常见宽度与分数边界、档位单调、双栏结论一致、形态标志精确一致、重复查询稳定、日志不抛异常 | 是 | Pass |
| DialogScenarios 目录与格式化 | 设备侧测试环境 | 执行 `DialogScenarios.test.ets` 7 条用例 | 目录 14 项、id 连续、9–14 API 映射、越界查询、日期/时间/文本结果格式化 | 是 | Pass |
| DialogScenariosMatrix 边界与组合 | 设备侧测试环境 | 执行 `DialogScenariosMatrix.test.ets` 12 条用例 | 分组计数、标题/API 唯一、目录独立副本、分组边界、日期/时间边界、Unicode/越界下标、两位 sceneId 事件行 | 是 | Pass |

## 执行方式

设备侧测试（签名使用 SDK 自带的 OpenHarmony 默认调试签名，或在 DevEco Studio 中启用自动签名）：

```bash
"<DevEco Studio>/tools/node/node" "<DevEco Studio>/tools/hvigor/bin/hvigorw.js" \
  assembleHap --mode module -p module=entry@ohosTest -p product=default --no-daemon
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
hdc shell aa test -b com.samples.dialogsdemo -m entry_test \
  -s unittest OpenHarmonyTestRunner -s timeout 150000
```

未配置签名时 hvigor 仅输出 `No signingConfig found for product default` 警告并跳过签名，产物为 unsigned HAP；此时可直接编译验证用例代码，但无法安装到设备。

查看应用日志：

```bash
hdc shell hilog | grep DialogsDemo
```

## 验证结果

- **设备侧用例**：144 条用例已在 RK3568（API 26）真机全量执行，`Tests run: 144, Failure: 0, Error: 0, Pass: 144`（DialogModels 22、LogUtil 12、DeviceUtil 8、Ability 1、DialogEventLogMatrix 24、DialogModelsMatrix 26、LogUtilMatrix 16、DeviceUtilMatrix 16、DialogScenarios 7、DialogScenariosMatrix 12）；
- **手工 UI 用例**：12 条需在设备上手工操作验证。

## 补充说明

- 设备侧用例全部为纯逻辑验证（事件簿记、按钮 / SheetInfo / 参数类工厂、日志、设备档案、场景目录与结果格式化），不依赖 UI 树，也不包含 UI 自动化用例；14 类弹窗/提示的实际呈现与 `open → click → close` 时序由上表中标为「否」的手工用例覆盖。
- 组合用例的期望值来自各实现类的 API 语义：`DialogEventLog` 的 `open#n / close#n / select#n index / check#n checked=` 行格式与 60 行容量、`buildSheetInfos` 的逐项下标闭包、`LogUtil` 的 `[HH:mm:ss][级别][tag] 消息` 格式与级别门限、`DeviceUtil` 的 600 / 840vp 断点；测试内不复制业务逻辑。
- `entry/src/test/` 仅包含模板自带的 1 条本地冒烟用例，功能验证以 `entry/src/ohosTest` 下的 144 条设备侧用例为准。
- 系统弹窗（场景 9–14：ActionSheet / 日期 / 时间 / 文本选择 / Toast / showDialog）的外观与按钮文案跟随系统，不同 ROM 可能略有差异；用例只校验收到的回调与日志时序。
- hilog tag 为 `DialogsDemo`（LogUtil 与 EntryAbility 共用），domain `0x0001`，排查时直接 `grep DialogsDemo`。
- 本 ROM 上 `SelectDialogV2` 点击选项后组件内部会关闭弹窗（`autoCancel:false` 与 `onWillDismiss` 无法拦截），示例在 `SheetInfo.action` 中重开同一弹窗并以 `TransitionEffect.IDENTITY` 关闭显隐动画；其他 ROM 行为不同时可移除该重开逻辑。
- `InterstitialDialogAction` 标注 `@atomicservice`，本工程在普通应用上验证通过；其他 ROM / 版本的行为以实际运行为准。
