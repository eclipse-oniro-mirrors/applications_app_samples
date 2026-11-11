# Stationary 测试说明

> 本说明面向 `Stationary`（OpenHarmony 静止状态感知示例）工程，用于说明本工程 ohosTest 自动化测试的设计思路、覆盖维度、充分性依据与运行限制。

## 1. 文档目标

本文档说明 `Stationary` 自动化测试的分层结构、用例组织、覆盖重点与质量门禁，用于代码评审、测试审计与后续扩展。

- 测试代码位于 `entry/src/ohosTest/ets/test/`。
- `List.test.ets` 注册 **19 个套件、529 条用例**。
- 测试代码共 **11,081 行**（非空行 **10,347 行**），断言 **680** 条（assertEqual 338 / assertTrue 332 / assertFalse 10）。

## 2. 测试设计原则

### 2.1 分层设计

- **API 行为层**：`stationary.on` / `stationary.once` / `stationary.off` 暴露性，`TypeEvent`、`TypeState` 枚举取值与唯一性，`TypeType` 字面量取值，`TypeResponse` 数据结构。
- **运行时行为层**：设备支持时调用成功；不支持、无权限或被拒的入参只允许抛出 `201`（无权限）、`401`（参数错误）与 `801`（能力不支持），并保证每次调用“恰好一个合法结果”。
- **交互序列层**：页面 3 个按钮的单动作、全量有序对、全量有序三元组与回到起点的四连序列，验证“最后一次动作覆盖状态文案”。
- **稳定性与恢复层**：重复点击幂等、两按钮交替操作、应用重启后控件恢复与动作可用。
- **界面行为层**：控件存在性、按钮文案非空且互异、状态文本始终可见。

### 2.2 高复用设计

- **共享驱动**：`StationaryUiSupport.ets` 统一维护 `Driver` 单例、拉起 `EntryAbility`、点击按钮、读取状态文本与“支持/不支持”环境探测。
- **环境自适应断言**：`stationarySupported()` 以一次真实的 `on/off` 探测设备能力；支持时断言动作文案，不支持时断言页面文案保持不变，保证同一套件在真实设备与模拟器上均可稳定运行。
- **真实实现**：测试直接引用 `@kit.MultimodalAwarenessKit` 的 `stationary` 与页面真实控件，不复制业务实现。

### 2.3 矩阵化设计

- **操作 × 事件矩阵**：`still` / `relativeStill` × `ENTER` / `EXIT` / `ENTER_EXIT` × `on` / `off` / `once`。
- **按钮 × 序列矩阵**：3 个按钮的全量有序对（9）、全量有序三元组（27）与四连回到起点序列（27）。
- **重复矩阵**：单按钮重复 3 次、单按钮重复 8 次、两按钮交替 5 轮。
- **重启矩阵**：连续重启 3 次、动作后重启、重启后动作。

矩阵只覆盖真实状态变化与顺序语义，不复制用例体制造数量。

### 2.4 用例元数据规范

- `@tc.number`：`前缀_0100`、`_0200`、`_0300`…（步长 100，最大 9900）；超过 99 条时启用新段 `前缀_ONE_0100`、`_ONE_0200`…
- `@tc.name`：`test<语义>0001`、`0002`、`0003`…（步长 1）。
- `it()` 第二个参数统一使用 `TestType.FUNCTION | Size.<SIZE> | Level.<LEVEL>`，与 `@tc.size/@tc.type/@tc.level` 对应。
- `List.test.ets` 只注册当前有效套件；`Ability.test.ets` 与 `_legacy_backup` 为未注册旧文件。


## 3. 测试对象拆解

### 3.1 主流程

- **应用承载**：`EntryAbility` 启动并加载 `pages/Index`。
- **页面与交互**：`pages/Index.ets` 提供状态文本 `show` 与 3 个动作按钮 `button1~button3`。
- **系统能力**：`@kit.MultimodalAwarenessKit` 的 `stationary`，提供静止状态订阅、一次性获取与取消订阅。

### 3.2 关键风险

- 设备不支持静止感知或无权限时，API 抛出 `801`/`201`；实测本机对非法 类型字面量同步抛出 `401`。页面在异常分支**不更新文案**，因此 UI 用例必须按设备能力自适应断言。
- `reportLatencyNs` 存在下限约束：实测 `1e6` 会被拒绝，`1e9` 起可用；用例固定使用 `1e9`/`2e9`/`3e9`。
- UiTest 每进程仅允许一个驱动，且要求应用在前台。
- 设备熄屏后 UiTest 只能看到锁屏窗口，按钮点击全部失效；`StationaryUiSupport.startApp` 会先唤醒屏幕（`KEYCODE_WAKEUP`）再拉起 `EntryAbility` 并重试，`resetStatusText` 在按钮不可见时同样走该恢复路径。
- 页面状态在多次点击间保留，需用“最后动作覆盖”语义而不是初值假设。

## 4. 覆盖维度设计

### 4.1 功能正确性

- 3 个按钮点击后的状态文案映射。
- 两两/三元/四连动作序列的“最后动作生效”。
- 应用重启后控件恢复与动作仍可用。

### 4.2 边界与异常

- API 无权限（201）、参数被拒（401）与能力不支持（801）三类错误，其余异常判为非法。
- 未订阅直接取消、重复订阅、重复取消、一次性获取与订阅交错。
- 重复点击与交替点击的幂等性。

### 4.3 接口与数据

- `TypeEvent`：`ENTER=1`、`EXIT=2`、`ENTER_EXIT=3`，且 `ENTER_EXIT` 等于 `ENTER | EXIT`；`TypeState` 与 `TypeEvent` 的 `ENTER`/`EXIT` 取值相同（均为 `1`/`2`）。
- `TypeState`：`ENTER=1`、`EXIT=2`，与同名事件数值一致。
- `TypeType`：`'still'`、`'relativeStill'` 两个字面量均被接受且互异。
- 三个按钮文案分别为 `订阅` / `取消订阅` / `获取`，非空且互异。

### 4.4 稳定性与隔离

- 每个 UI 套件共享单例驱动，`beforeAll` 统一拉起应用。
- API 用例对每次调用做“成功或允许错误”计数，非法异常计数必须为 0。
- 重启用例通过 `startAbility` 恢复页面，避免跨用例残留。

### 4.5 可维护性

- 按“API 行为、运行时健壮、交错矩阵、单动作、序列矩阵、重复、文案、重启”分组。
- 新增覆盖优先追加到对应矩阵套件，不修改既有编号。

## 5. 充分性说明

### 5.1 为什么认为当前测试具备较强充分性

- **层次完整**：从 API 枚举/函数行为、运行时错误语义，到 UI 单动作、全量序列矩阵、重启恢复均有覆盖。
- **结果严格**：API 侧只接受“成功”或“201/401/801”，非法异常直接失败；UI 侧在支持设备上断言精确文案，不支持设备上断言文案确实保持不变。
- **顺序覆盖**：全量有序对与三元组验证状态机“最后动作生效”，不是重复单动作。
- **可审计**：枚举取值、序列输入与期望文案均可独立复核。

### 5.2 数量与质量门禁

| 指标 | 当前值 |
|---|---:|
| 注册套件 | 19 |
| 用例总数 | 529 |
| 测试文件 | 21（含 `List.test.ets` 与 `StationaryUiSupport.ets`） |
| 测试代码行数 | 11,081 |
| 有效代码行数 | 10,347 |
| 断言总数 | 680（assertEqual 338 / assertTrue 332 / assertFalse 10） |
| 超过 120 字符的行 | 0 |

每个用例都首尾输出 `begin`/`end` 日志，且至少包含两条断言（或调用带断言的复用助手）
并给出 action 文案，避免空用例与重复用例（`it()` 名称与 `@tc.number` 均已去重）。

### 5.3 运行与限制

- 运行前建议解锁设备；即使设备在运行中熄屏，UI 用例也会自行唤醒屏幕并重新拉起应用。
- 设备是否支持静止感知不影响本套件通过：API 用例接受 `201/401/801`，UI 用例按 `stationarySupported()` 自适应断言。
- 窗口相关用例通过前台 `UIAbility` 的 `UIAbilityContext` 调 `window.getLastWindow`，取不到窗口或窗口尺寸为 0 时断言失败（不静默跳过）；需保证测试期间应用处于前台。
- UiTest 每进程仅允许一个驱动；UI 套件共享单例并在 `beforeAll` 拉起应用。
- 真实静止/相对静止状态的识别精度与时延不在自动化断言范围，需人工验证。

## 6. 当前测试目录与职责

`List.test.ets` 按原有写法注册 19 个套件：

| 分组 | 套件 | 用例数 | 职责 |
|---|---|---:|---|
| 安装声明 | `StationaryManifest` | 5 | 入口 Ability 唯一且导出、备份扩展唯一且不导出、只声明 default 设备类型、模块归属运行包 |
| API 行为 | `StationaryApiContract` | 9 | 函数暴露性、两个枚举取值/唯一性、类型字面量与响应结构 |
| API 健壮 | `StationaryApiRobust` | 17 | 订阅/一次性获取/取消只允许成功或 201/401/801；省略回调、报告周期上下界、relativeStill 重复查询、重复取消、同一回调重复注册 |
| API 交错 | `StationaryApiInterleave` | 20 | still on/off 三连 8 种组合 + once 混排 + relativeStill 全事件与省略回调 |
| 枚举行为 | `StationaryEnumCore` | 23 | `TypeEvent`/`TypeState` 取值、类型、正整数、成员互异；`TypeType` 两个字面量取值与命名 |
| 接口形态 | `StationaryApiShapeCore` | 36 | `on`/`off`/`once` 暴露性、错误码白名单（201/401/801）、`TypeResponse` 字段形态、六类调用折叠为三态 |
| 结果矩阵 | `StationaryApiOutcomeMatrix` | 134 | 单动作、二动作、三动作混排、回调形态与重复轮次；每步只允许成功或文档错误 |
| 入参边界 | `StationaryApiBoundary` | 74 | `TypeType` 合法/畸形字面量、`TypeEvent` 越界值、`reportLatencyNs` 1e9~3e9 窗口内外、`off` 回调有无 |
| UI 单动作 | `StationaryUiMatrix` | 14 | 控件存在、三按钮文案映射、幂等、整轮操作、三按钮纵向堆叠等宽居中、标题位于按钮上方、按钮宽度约 30%、标题高度约 20% |
| UI 序列 | `StationaryUiSequenceMatrix` | 63 | 全量有序对（9）+ 全量有序三元组（27）+ 四连回起点（27） |
| UI 重复 | `StationaryUiRepeat` | 10 | 单按钮重复 3/8 次、两按钮交替 5 轮 |
| 视图对应关系 | `StationaryViewContract` | 33 | 标题/按钮层级、等宽居中、覆盖三分之四布局、控件文案与 id 行为 |
| 状态迁移 | `StationaryStateTransition` | 48 | 单动作、两连/三连序列、重置后动作、末次生效，按环境自适应断言 |
| UI 文案 | `StationaryUiLabel` | 5 | 按钮文案非空且互异、精确定义、状态文本持续可见 |
| 性能稳定 | `StationaryPerf` | 5 | 三个动作点击到文案落定的耗时（宽松上界 3s、最长耗时≤最短耗时×10）、20 次点击不漂移、控件反复可查询、连点后回到空闲文案 |
| 重启恢复 | `StationaryLifecycle` | 9 | 重启 3 次、动作后重启、重启后动作、重启后序列与文案可读 |
| Ability 行为 | `StationaryAbilityContract` | 9 | EntryAbility 位于前台与上下文一致；EntryBackupAbility 的 onBackup/onRestore 正常/边界/连跑/多实例 |
| 运行上下文 | `StationaryAppContext` | 11 | 包名与版本、entry 模块唯一性、EntryAbility 与 deviceTypes、备份扩展注册、Ability 归属、前台 Ability、窗口尺寸、缓存目录 |
| **合计** | **19** | **529** | |

> 原 `Ability.test.ets`（同为 `describe('AppTest')` 的旧副本）已从注册表中移除，避免同名 describe 被注册两次；
> `abilityTest.test.ets` 现为唯一入口，describe 更名为 `StationaryAppTest`（启动、订阅、取消订阅、获取四项，已改为环境自适应断言）。

## 7. 结论

`Stationary` 当前测试形成“API/枚举行为 + 运行时错误语义 + 全量按钮序列矩阵 + 重启恢复”的组合结构。由于主工程只有一个 UI 页面且无纯逻辑函数，当前覆盖已触及该工程在不修改主代码前提下的合理上限；继续放大数量只能重复点击循环，属于低价值水分。

后续如需继续扩量，应优先在逻辑更丰富的工程（如 AudioMusicPlayer/Audio/AVRecorder）做矩阵扩展；本工程保持现状并在真实设备上做静止状态识别的人工验证。

## 附录：手工用例归纳

### 测试环境

- 设备：支持静止感知的手机或模拟器（bundle `com.samples.stationary`，`deviceTypes: default`）。
- 测试目录：`entry/src/ohosTest/ets/test/`。
- 用例格式：`@tc.number` / `@tc.name` / `@tc.desc` / `@tc.size` / `@tc.type` / `@tc.level`。

运行方式：

使用 DevEco Studio 或 hdc 运行 `List.test.ets`，指定运行器 `OpenHarmonyTestRunner` 与测试 Ability `TestAbility`；运行前需唤醒并解锁设备。

### 手工用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|
| 启动应用 | 应用已安装 | 拉起 `EntryAbility` | 顶层 Ability 为 EntryAbility，显示状态文本与三个按钮 | Pass |
| 订阅 | 进入主界面 | 点击“订阅” | 支持设备上状态文本显示 `stationary subscribe`；不支持时保持不变 | Pass |
| 取消订阅 | 进入主界面 | 点击“取消订阅” | 支持设备上状态文本显示 `stationary unsubscribe`；不支持时保持不变 | Pass |
| 获取状态 | 进入主界面 | 点击“获取” | 支持设备上状态文本显示 `stationary getStatus`；不支持时保持不变 | Pass |
| 顺序操作 | 进入主界面 | 先点“订阅”，再点“取消订阅” | 状态文本最终为 `stationary unsubscribe` | Pass |
| 重复操作 | 进入主界面 | 同一按钮连续点击多次 | 状态文本保持对应动作文案 | Pass |
| 应用重启 | 进入主界面 | 重启应用后再次点击动作按钮 | 控件恢复、点击后状态文本正常更新 | Pass |
| 无权限/不支持（负向） | 拒绝权限或设备不支持 | 点击订阅/获取按钮 | 不崩溃，页面状态文本保持原值 | Pass |

## 断言真实性说明

- API 用例通过 `run(action)` 统计结果：只允许成功或 `201/401/801`，非法异常计数必须为 0，每次调用必须恰好一个结果。
- UI 用例在支持设备上断言精确文案，在设备不支持时断言文案确实保持操作前的值，避免“无条件通过”。
- 序列矩阵断言“最后一次动作的文案”，不是重复单动作的弱断言。
- 无恒真/空壳用例；不复制主实现常量做自证。
- UI 用例启动时会唤醒屏幕并拉起应用；熄屏不再是失败原因。状态文本读不到时 `readShowText` 会直接失败并打印顶层 Ability 名称。
