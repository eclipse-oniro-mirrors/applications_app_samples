# ReminderAgentManager 测试说明

> 本说明面向 `ReminderAgentManager`（OpenHarmony 后台任务提醒管理示例）工程，用于说明本工程 ohosTest 自动化测试的设计思路、覆盖维度、充分性依据与后续扩展方向。

## 1. 文档目标

本文档用于说明 `ReminderAgentManager` 自动化测试的分层结构、用例组织、覆盖重点与质量门禁。文档聚焦“为什么这样设计测试”和“当前测试能证明什么”，用于辅助代码评审、测试审计和后续扩展。

当前测试代码位于 `entry/src/ohosTest/ets/test/`，由 `List.test.ets` 统一注册 **35 个测试套件、2,212 条用例**，测试代码约 **50,323 行**。

## 2. 测试设计原则

### 2.1 分层设计

测试基于 Hypium + UiTest 框架（入口 `List.test.ets`，运行器 `OpenHarmonyTestRunner`，测试承载页 `TestAbility`），按以下层次拆分：

- **基础能力层**：覆盖 `entryability/EntryAbility.ets` 拉起、通知授权、页面切换、时间/日期选择器、计数器与日历/闹钟/计时器的真实 UI 操作。
- **接口与模型层**：覆盖 `reminderAgentManager` 的提醒发布、取消、有效列表查询、通知槽位，以及 `ReminderRequestTimer`、`ReminderRequestAlarm`、`ReminderRequestCalendar`、`WantAgent`、`LocalDateTime` 等模型字段契约。
- **领域逻辑层**：覆盖 `util/TimeConversion.ets` 的时间/日期换算、`common/Constant.ets` 的常量契约、`util/PreferencesDataManager.ets` 的持久化行为。
- **边界与异常层**：覆盖时间点全网格、日期跨月/跨年/闰年、非法小时/分钟/月/日、负值、超范围值、超长字符串和特殊字符。
- **质量与一致性层**：覆盖偏好键隔离、覆盖写、删除语义、类型保持、API 模型字段一致性、用例元数据与断言完整性。

### 2.2 高复用设计

测试通过以下方式降低维护成本：

- **统一套件注册**：`List.test.ets` 统一 import 并调用 35 个测试入口，所有套件按固定顺序执行，便于审计和按类回归。
- **共享被测实现**：测试直接引用 `TimeConversion`、`Constant`、`reminderAgentManager` 和 Preferences API，不在测试内复制业务实现。
- **统一环境常量**：`PREF_NAME = 'ReminderAgentManager'`、`BUNDLE_NAME = 'com.example.reminderagentmanager'`、`ABILITY_NAME = 'EntryAbility'` 在各套件中保持一致。
- **统一数据构造**：提醒请求通过 `timerRequest`、`alarmRequest`、`calendarRequest`、`wantAgent` 等辅助函数构造，减少字段遗漏。
- **统一断言风格**：每条用例至少包含 3 个有效断言，覆盖返回值、类型、状态、边界或副作用。

### 2.3 矩阵化设计

关键路径采用组合矩阵扩展覆盖：

- **时间矩阵**：覆盖 `00:00` 至 `23:59` 全部 **1,440 个合法时间点**，并额外覆盖 `24:00`、`00:60`、负值、超大值等非法输入。
- **日期矩阵**：覆盖同月日偏移、跨月、跨年、闰年、世纪年、月首/月末、日界与年界。
- **Preferences 矩阵**：覆盖字符串、数字、布尔、空串、长文本、中文、特殊字符、键覆盖、键隔离、键删除和长键。
- **API 模型矩阵**：覆盖提醒类型、触发值、铃声时长、重复字段、通知 ID、资源 ID、分组、自定义文案等字段组合。
- **常量矩阵**：覆盖声明值、算术关系、尺寸关系和时序关系。

矩阵只用于真实边界和分支组合，不通过复制用例体或重复命名放大数量。

## 3. 测试对象拆解

### 3.1 主流程

- **应用承载**：`entryability/EntryAbility.ets` 负责应用启动与页面加载；测试验证 bundle/ability 拉起、首页可交互。
- **页面与交互**：
  - `pages/Index.ets`：闹钟、日历、计时器三个 Tab 的切换与页面容器。
  - `pages/alarmClock/AlarmClock.ets`、`AlarmClockSetting.ets`、`DrawClock.ets`：闹钟列表、设置弹窗、重复日、振动、铃声与开关。
  - `pages/calendar/Calendar.ets`、`CalendarSetting.ets`：日历提醒列表与设置弹窗。
  - `pages/timer/Timer.ets`、`SelectTime.ets`：计时器倒计时、开始/暂停/重置与时间选择器。
- **提醒能力**：`reminderAgentManager.publishReminder`、`cancelReminder`、`getAllValidReminders`、`addNotificationSlot`，以及通知到达与权限状态。
- **时间与日期换算**：`TimeConversion.timeToMillisecond`、`TimeConversion.dateToMillisecond`。
- **数据与常量**：`util/PreferencesDataManager.ets`、`util/AlarmClockReminder.ets`、`util/CalendarReminder.ets`、`common/Constant.ets`、`common/Reminder.ets`。

### 3.2 关键风险

- 通知权限未授予或通知服务不可用时，发布/查询提醒失败。
- 时间选择器、日历选择器、Tab 切换和列表滑动等 UI 操作存在渲染时序差。
- 倒计时为 0 时误启动、暂停后文本继续变化、重置后状态未归零。
- 小时/分钟越界值未拦截，导致提醒时间错误。
- 时间换算跨日、跨月、跨年、闰年时出现过期或偏差。
- Preferences 键冲突、覆盖写、删除失败或类型丢失。
- 长文本、中文、特殊字符写入后截断或乱码。
- 提醒模型可选字段缺失或字段类型不一致。
- 设备锁屏、后台限制或通知权限拒绝导致 UI 用例假失败。

## 4. 覆盖维度设计

### 4.1 功能正确性

- 应用启动、首页展示、Tab 切换和页面返回。
- 闹钟/日历/计时器的创建、设置、开关、取消和删除。
- 计时器开始、暂停、重置和 0 秒负向行为。
- 提醒发布、有效列表查询、取消后状态变化。
- 通知槽位添加和通知到达。
- 偏好数据写入、读取、覆盖、删除。

### 4.2 边界与异常

- 时间点：`00:00`、`23:59`、整点、分钟边界和全部 1,440 个合法时间点。
- 日期：月首、月末、跨月、跨年、闰年 2 月 29 日、世纪年、日界和年界。
- 非法输入：小时 24、分钟 60、负值、超大值、月份 0/13、日期 0/32。
- 存储：空字符串、长字符串、中文、Emoji、特殊字符、长键和键前缀冲突。
- UI：0 秒启动、重复重置、选择器取消、重复日与振动/铃声设置。

### 4.3 契约与数据

- `@tc.number`、`@tc.name`、`@tc.desc`、`@tc.type`、`@tc.size`、`@tc.level` 全量存在。
- 用例名统一 `testXxxNNNN`，全局唯一；`@tc.name` 与 `it()` 名称一致。
- 每条用例至少 3 个断言；全局无重复用例体。
- 提醒模型字段、常量值、常量关系和 Preferences 读写语义保持稳定。

### 4.4 稳定性与隔离

- 每个 Preferences 用例使用独立 key，结束后删除，避免跨用例污染。
- 提醒发布用例在 `finally` 中清理 reminderId，避免残留提醒影响后续用例。
- 时间/日期断言使用容差，规避跨秒、跨分钟和真机调度误差。
- UI 用例统一等待组件出现后再操作，避免固定延时导致的假失败。

### 4.5 可维护性

- 套件按“核心场景、API/契约、时间矩阵、日期矩阵、Preferences、异常输入、综合扩展”分组。
- 新增边界优先追加到对应矩阵文件，不修改既有编号和用例名。
- 失败用例按 `class + testName` 可唯一定位，不受重复名称干扰。

## 5. 充分性说明

### 5.1 为什么认为当前测试具备较强充分性

- **覆盖层次完整**：从真实 UI、系统提醒 API 到时间/日期算法、常量、Preferences 和模型契约均有覆盖。
- **覆盖方式多样**：包含 UI 流程、API 正反向、全时间网格、日期边界、模型字段组合和存储矩阵。
- **数量与质量同时约束**：2,212 条用例名称和编号全部唯一，无重复用例体，每条至少 3 个断言。
- **断言可定位**：同时校验返回值、类型、状态、边界、副作用和后置条件，而不是只验证“接口存在”。
- **矩阵可审计**：时间点覆盖 1,440/1,440，日期和 Preferences 组合可独立复核。

### 5.2 数量与质量门禁

| 指标 | 当前值 |
|---|---:|
| 测试套件 | 35 + `List.test.ets` |
| 用例总数 | 2,212 |
| 测试代码行数 | 50,323 |
| 有效代码行数 | 31,574 |
| 唯一用例名 | 2,212 |
| 唯一 `@tc.number` | 2,212 |
| 重复用例体 | 0 |
| 断言少于 3 个的用例 | 0 |
| 超过 120 字符的行 | 0 |

### 5.3 运行与限制

- 运行前需唤醒并解锁设备；锁屏会导致 `startApp` 后无法找到首页控件。
- 通知发布/通知到达依赖通知权限和提醒服务状态；权限未授予时相关用例会失败，这是环境前置条件而非用例逻辑问题。
- 时间/日期断言使用秒级容差，避免真机跨秒调度造成偶发误差。
- UI 自动化对 Picker 滑动、列表拖动等无稳定 ID 的操作覆盖有限，相关场景以取消/存在性/状态断言为主。

## 6. 当前测试目录与职责

测试代码位于 `entry/src/ohosTest/ets/test/`，由 `List.test.ets` 统一注册 35 个套件：

| 分组 | 套件数 | 用例数 | 代表套件与职责 |
|---|---:|---:|---|
| 核心场景 | 2 | 69 | `ActsAbilityTest`（55）：启动、通知授权、Tab、Picker、计时器、提醒 API、设置弹窗；`ReminderMatrixTest`（14）：核心场景矩阵 |
| API/模型/契约 | 6 | 94 | `ReminderQualityApiTest`、`ReminderApiModelExtraTest`、`ReminderApiOptionalExtraTest`、`ReminderApiVariantExtraTest`、`ReminderContractTest`、`ReminderConstantRelationExtraTest`：提醒 API、模型字段、常量与关系契约 |
| 时间矩阵 | 11 | 1,468 | `ReminderTimeMatrixTest`、`ReminderTimeExpandedTest`、`ReminderTimeExpanded2Test`、`ReminderTimeMatrix300Test`、`ReminderTimeMatrix210Test`、`ReminderTimeMatrix629Test`、`ReminderTimeMatrix25Test`、`ReminderTimeMatrix2Test`、`ReminderTimeExtra20Test`、`ReminderQualityTimeTest`、`ReminderQualityTime2Test`：1,440 个合法时间点与边界时间 |
| 日期与边界 | 8 | 372 | `ReminderBoundaryTest`、`ReminderDateBoundaryExtraTest`、`ReminderDateLeapExtraTest`、`ReminderDateRolloverExtraTest`、`ReminderDateVariantExtraTest`、`ReminderDateMatrixExtraTest`、`ReminderDateMatrix200Test`、`ReminderDateMatrix6Test`：跨月、跨年、闰年、世纪年、日界与固定日期 |
| Preferences | 6 | 157 | `ReminderPrefKeyExtraTest`、`ReminderPrefKeyConflictExtraTest`、`ReminderPrefVariantExtraTest`、`ReminderQualityStorageTest`、`ReminderQualityStorage2Test`、`ReminderQualityStorage3Test`：键模式、键隔离、值类型、长文本、特殊字符与删除语义 |
| 异常输入 | 1 | 10 | `ReminderInvalidInputExtraTest`：非法小时/分钟/月/日、负值和超范围值 |
| 综合扩展 | 1 | 42 | `ReminderExtraTest`：时间、日期、常量和 Preferences 的综合补充 |
| **合计** | **35** | **2,212** | |

## 7. 结论

`ReminderAgentManager` 当前测试已经形成“真实 UI + 系统提醒 API + 领域换算 + 模型/常量契约 + Preferences + 边界矩阵”的组合式覆盖结构。该结构具备明确的分层、可复现的环境前置、唯一的用例编号和较完整的边界组合，可作为后续版本回归、接口变更审计和测试扩展的基础。

后续扩展应优先补充真实业务分支和可稳定执行的异常场景，不再通过重复矩阵放大数量；新增用例需继续保持唯一名称/编号、至少 3 个有效断言和零重复用例体。

## 附录：手工用例归档

### 测试环境

- 设备：deviceType 为 `default` 的标准系统开发板，系统 API version 26
- 工程 SDK：OpenHarmony 26.0.0 Release（`compileSdkVersion: "26.0.0"`）
- 测试套件：`ActsAbilityTest` 等 35 个套件
- 测试目录：`entry/src/ohosTest/ets/test/`
- 用例格式：`@tc.number` / `@tc.name` / `@tc.desc` / `@tc.type` / `@tc.size` / `@tc.level`；JSDoc `@tc.level` 统一 `LEVEL0`，`it()` 第三参为 `Level.LEVEL0`

运行方式：

使用 OpenHarmony 测试框架执行 `ActsAbilityTest`，指定运行器 `/ets/TestRunner/OpenHarmonyTestRunner` 和超时时间 15000。运行前需唤醒并解锁设备，并设置 `power-shell timeout -o 600000`。

### 手工用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|
| 拉起应用 | 应用已安装 | 以 bundle `com.example.reminderagentmanager`、ability `EntryAbility` 启动 | 应用启动，闹钟 Tab 可见 | Pass |
| 通知授权 | 应用启动时弹出通知授权框 | 点击“允许” | `isNotificationEnabled()` 返回 true | Pass |
| Tab 切换 | 应用位于主页 | 依次点击日历、计时器、闹钟 Tab | 分别出现 `addCalendar`、`countDown`、`addClock` | Pass |
| 闹钟时间选择 | 位于闹钟页 | 点击“+”，再点击“取消” | 弹出系统时间选择框，取消后回到闹钟页 | Pass |
| 日历日期选择 | 位于日历页 | 点击“+”，再点击“取消” | 弹出系统日期选择框，取消后回到日历页 | Pass |
| 计时器 0 秒启动与重置（负向） | 位于计时器页，时间为 0 | 点击开始并等待 1.5 秒；再点击重置 | 开始后仍为 `00:00:00`；重置后仍为 `00:00:00` | Pass |
| 计时器提醒 API | 通知已启用 | 发布 TIMER 提醒（60 秒） | 返回 reminderId > 0，查询存在；取消后不再存在 | Pass |
| 闹钟提醒 API | 通知已启用 | 发布 ALARM 提醒（5 分钟后） | 返回 reminderId > 0，查询存在；取消后不再存在 | Pass |
| 日历提醒 API | 通知已启用 | 发布 CALENDAR 提醒（10 分钟后） | 返回 reminderId > 0，查询存在；取消后不再存在 | Pass |
| 不完整请求（负向） | 通知已启用 | `publishReminder` 传入缺少必填字段的请求 | 发布失败并抛出异常 | Pass |
| 时间换算 | 无 | 调用 `TimeConversion.timeToMillisecond` / `dateToMillisecond` | 未来为正、过去为负，误差在允许范围内 | Pass |
| Preferences 读写 | 无 | 写入、读取、删除测试 key | 读回值与写入值一致，删除后读回默认值 | Pass |
| 闹钟完整流程 | 通知已启用，位于闹钟页 | 点击“+”并确定；打开开关；在行上向左滑动 | 列表新增 1 条且开关为开；滑动删除后列表恢复原数量 | Pass |
| 日历完整流程 | 通知已启用，位于日历页 | 点击“+”并确定；打开开关；在行上向左滑动 | 列表新增 1 条且开关为开；滑动删除后列表恢复原数量 | Pass |
| 计时器完整流程 | 位于计时器页 | 滑动秒选择器设为非 0，点击开始；再点开始暂停；点重置 | 倒计时非 `00:00:00`；暂停后文本不变；重置后为 `00:00:00` | Pass |
| 通知到达 | 通知已启用 | 发布 5 秒 TIMER 提醒 | 等待 9 秒后，通知中心出现该提醒 | Pass |
| 闹钟设置弹窗 | 闹钟页存在 1 条闹钟 | 点击闹钟行；选周一；开振动；铃声选 Demo；确定 | 重复日包含 1、振动开启、audioSrc 为 demo.wav | Pass |
| 日历设置弹窗 | 日历页存在 1 条提醒 | 点击日历行；开振动；铃声选 Demo；确定 | 振动开启、audioSrc 为 demo.wav | Pass |
| 闹钟开关关闭 | 闹钟页存在 1 条闹钟 | 打开开关，再关闭开关 | `isStart` 由 true 变 false，对应 reminderId 不再有效 | Pass |
| 设置弹窗取消 | 闹钟页存在 1 条闹钟 | 打开设置，选周一后点取消 | 重复日未被写入（daysOfWeek 不含 1） | Pass |

## 断言真实性说明

- 运行时探针确认 `findComponent` / `waitForComponent` 未命中返回 **`null`**（不是 `undefined`），测试统一使用 `existsById` / `existsByText` / `waitForId` 做存在性断言。
- 主工程无假函数：提醒发布/取消、振动、音频播放、Preferences、时间换算均为真实实现；无 TODO/mock/空函数。
- 无恒假断言、无空壳用例；`catch` 中的 `assertFail()` 为正常失败上报。
- 静态校验结果：2,212 条用例名称与 `@tc.number` 全部唯一，名称与 `@tc.name` 全部一致，重复用例体 0，断言少于 3 个 0，超过 120 字符行 0。
