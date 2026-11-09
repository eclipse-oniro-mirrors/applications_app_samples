# Motion 测试说明

> 本说明面向 `Motion`（OpenHarmony 运动感知示例）工程，用于说明本工程 ohosTest 自动化测试的设计思路、覆盖维度、充分性依据与运行限制。

## 1. 文档目标

本文档说明 `Motion` 自动化测试的分层结构、用例组织、覆盖重点与质量门禁，用于代码评审、测试审计与后续扩展。

- 测试代码位于 `entry/src/ohosTest/ets/test/`。
- `List.test.ets` 注册 **8 个套件、146 条用例**。
- 测试代码约 **2,728 行**，断言 **281** 条（assertEqual 138 / assertTrue 141 / assertFalse 2）。

## 1.1 测试结论的边界（先读这一节）

本工程的 UI 自动化用例只断言**点击后状态文案是否变化**，不等价于“motion 接口调用成功”：

- `pages/Index.ets` 中 5 个动作处理函数在 **try 与 catch 两个分支写入同一句文案**（如 `Index.ets:38` 与 `Index.ets:44` 同为 `'motion subscribeOperating'`），这是示例代码为便于在无权限/无能力设备上演示而刻意保留的写法。
- 因此 UI 用例（`MotionUiMatrix` / `MotionUiSequenceMatrix` / `MotionUiRepeat` / `MotionUiLabel` / `MotionLifecycle`）验证的是“控件存在、点击被响应、最后一次动作覆盖文案”，**不能**作为系统能力调用成功的证据。
- 系统能力调用是否成功，由 `MotionApiRobust` / `MotionApiInterleave` 直接调用 `motion.on/off/getRecentOperatingHandStatus` 并按“成功或 201/801”判定，属真实接口覆盖。
- 本工程在 `entry/src/main/module.json5` 中申请 `ohos.permission.ACTIVITY_MOTION`，但用户级授权结果取决于设备上的授予情况：未授权时接口抛 `201`，属被测预期分支而非用例失败。
- 手势识别精度、左右手判定准确性**不在**自动化断言范围，需人工验证。

## 2. 测试设计原则

### 2.1 分层设计

- **API 契约层**：`motion.on` / `motion.off` / `motion.getRecentOperatingHandStatus` 暴露性，`OperatingHandStatus`、`HoldingHandStatus` 枚举取值与唯一性。
- **运行时契约层**：设备支持时调用成功；不支持或无权限时仅允许文档定义的 `201`（无权限）/`801`（能力不支持），并保证每次调用“恰好一个合法结果”。
- **交互序列层**：页面 5 个按钮的单动作、全量两两、全量三元序列，验证“最后一次动作覆盖状态文案”。
- **稳定性与恢复层**：重复点击幂等、交替操作、应用重启后控件恢复与动作可用。
- **界面契约层**：控件存在性、按钮文案非空且互异、状态文本始终可见。

### 2.2 高复用设计

- **共享驱动**：每个 UI 套件复用一个 `Driver` 单例，`beforeAll` 统一拉起 `EntryAbility` 并等待首个按钮。
- **统一辅助**：`clickButton` / `clickSequence` / `readShowText` 统一点击与文本读取；API 侧用 `run(action)` 把调用折叠为“成功/允许错误/非法错误”计数。
- **真实实现**：测试直接引用 `@kit.MultimodalAwarenessKit` 的 `motion` 与页面真实控件，不复制业务实现。

### 2.3 矩阵化设计

- **事件 × 操作矩阵**：`operatingHandChanged` / `holdingHandChanged` × 3 步 on/off 的 8 种序列。
- **按钮 × 序列矩阵**：5 个按钮的全量有序对（25）与全量有序三元组（60）。
- **重复矩阵**：单按钮重复 3 次、单按钮重复 8 次、两按钮交替 5 轮。
- **重启矩阵**：连续重启 3 次、动作后重启、重启后动作。

矩阵只覆盖真实状态变化与顺序语义，不复制用例体制造数量。

## 3. 测试对象拆解

### 3.1 主流程

- **应用承载**：`EntryAbility` 启动并加载 `pages/Index`。
- **页面与交互**：`pages/Index.ets` 提供状态文本 `show` 与 5 个动作按钮 `button1~button5`。
- **系统能力**：`@kit.MultimodalAwarenessKit` 的 `motion`（操作手/握持手订阅、取消订阅、查询最近状态）。

### 3.2 关键风险

- 设备不支持运动感知或无权限时，API 抛出 `801`/`201`；页面成功与异常分支都会更新文案，因此需分别校验“结果合法”而不是假设必然成功。
- UiTest 每进程仅允许一个驱动，且要求应用在前台。
- 设备锁屏会导致 `GetCurrentTopAbility`/控件查找失败，属环境前置条件。
- 页面状态在多次点击间保留，需用“最后动作覆盖”语义而不是初值假设。

## 4. 覆盖维度设计

### 4.1 功能正确性

- 5 个按钮点击后的状态文案映射。
- 两两/三元动作序列的“最后动作生效”。
- 应用重启后控件恢复与动作仍可用。

### 4.2 边界与异常

- API 无权限（201）与能力不支持（801）两类错误，其余异常判为非法。
- 未订阅直接取消、重复订阅、两事件同时订阅。
- 重复点击与交替点击的幂等性。

### 4.3 契约与数据

- `OperatingHandStatus`：`UNKNOWN_STATUS=0`、`LEFT_HAND_OPERATED=1`、`RIGHT_HAND_OPERATED=2`。
- `HoldingHandStatus`：`NOT_HELD=0`、`LEFT_HAND_HELD=1`、`RIGHT_HAND_HELD=2`、`BOTH_HANDS_HELD=3`、`UNKNOWN_STATUS=16`。
- 五个按钮文案非空且互异，状态文本始终可见。

### 4.4 稳定性与隔离

- 每个 UI 套件共享单例驱动，`beforeAll` 统一拉起应用。
- API 用例对每次调用做“成功或允许错误”计数，非法异常计数必须为 0。
- 重启用例通过 `startAbility` 恢复页面，避免跨用例残留。

### 4.5 可维护性

- 按“API 契约、运行时健壮、交错矩阵、单动作、序列矩阵、重复、文案、重启”分组。
- 新增覆盖优先追加到对应矩阵套件，不修改既有编号。

## 5. 充分性说明

### 5.1 覆盖范围与不覆盖项

**已覆盖：**

- API 函数暴露性与两个枚举的文档取值（`MotionApiContract`）。
- `motion.on/off/getRecentOperatingHandStatus` 的真实调用结果只能是“成功”或文档错误码 `201/801`，非法异常计 0（`MotionApiRobust`）。
- 两事件 × 3 步 on/off 的 8 种序列（`MotionApiInterleave`）。
- 页面控件存在性、按钮文案非空且互异，以及单动作 / 有序对 / 三元组 / 重复 / 重启后的**文案覆盖语义**（5 个 UI 套件）。

**不覆盖（不得据本套件结论推断）：**

- 系统能力调用成功时的手势识别结果（左右手、握持状态）是否正确。
- 页面在 `motion.on/off/get` 成功与失败时的**差异化表现**——示例页面两个分支写同一句文案。
- `401`、`31500001`、`31500002`、`31500003` 等文档错误码：白名单仅 `201/801`，出现其它错误码即判失败。
- 冷启动（进程被杀后的重建）行为：`MotionLifecycle` 通过 `startAbility` 重复拉起，应用已在前台时为 `onNewWant` 语义。

### 5.2 数量与质量门禁

| 指标 | 当前值 |
|---|---:|
| 注册套件 | 8 |
| 用例总数 | 146 |
| 测试文件 | 9（含 `List.test.ets`） |
| 测试代码行数 | 2,728 |
| 断言总数 | 281（assertEqual 138 / assertTrue 141 / assertFalse 2） |
| 超过 120 字符的行 | 0 |

### 5.3 运行与限制

- 运行前需唤醒并解锁设备；锁屏会导致应用无法前台运行、控件查找失败。
- 设备是否支持运动感知不影响本套件通过：API 用例接受 `201/801`，UI 用例成功/异常分支都会更新文案。
- UiTest 每进程仅允许一个驱动；UI 套件共享单例并在 `beforeAll` 拉起应用。
- 真实手势识别精度、左右手判定准确性不在自动化断言范围，需人工验证。

## 6. 当前测试目录与职责

`List.test.ets` 注册 8 个套件：

| 分组 | 套件 | 用例数 | 职责 |
|---|---|---:|---|
| API 契约 | `MotionApiContract` | 7 | 函数暴露性、两个枚举文档取值与成员集合 |
| API 健壮 | `MotionApiRobust` | 7 | 订阅/取消/查询只允许成功或 201/801，非法异常计 0 |
| API 交错 | `MotionApiInterleave` | 16 | 两事件 × 8 种 3 步 on/off 序列 |
| UI 单动作 | `MotionUiMatrix` | 10 | 控件存在、五按钮文案映射、幂等、整轮操作 |
| UI 序列 | `MotionUiSequenceMatrix` | 85 | 全量有序对（25）+ 全量有序三元组（60） |
| UI 重复 | `MotionUiRepeat` | 11 | 单按钮重复 3/8 次、两按钮交替 5 轮 |
| UI 文案 | `MotionUiLabel` | 4 | 按钮文案非空且互异、状态文本持续可见 |
| 重启恢复 | `MotionLifecycle` | 6 | 重复拉起 3 次、动作后拉起、拉起后动作 |
| **合计** | **8** | **146** | |

> 原 `Ability`（`AppTest`）套件已删除：其 6 条用例与 `MotionUiMatrix` 的控件存在/文案映射用例重复，且使用旧式 `it(name, 0, done)` 写法与错误的 `@tc.level Level 2` 标记。

## 7. 结论

`Motion` 当前测试形成“API/枚举契约 + 运行时错误语义 + 按钮序列矩阵 + 重启恢复”的组合结构。由于主工程只有一个 UI 页面且无纯逻辑函数，覆盖重点应放在 **API 运行时契约**（真实接口调用）上，UI 用例只用于验证交互与文案语义，不能替代接口验证。

后续如需继续扩量，应优先在逻辑更丰富的工程（如 AudioMusicPlayer/Audio/AVRecorder）做矩阵扩展；本工程保持现状并在真实设备上做手势识别的人工验证。

## 附录：手工用例归档

### 测试环境

- 设备：支持运动感知的手机或模拟器（bundle `com.samples.motion`，`deviceTypes: default`）。
- 测试目录：`entry/src/ohosTest/ets/test/`。
- 用例格式：`@tc.number` / `@tc.name` / `@tc.desc` / `@tc.size` / `@tc.type` / `@tc.level`。

运行方式：

使用 DevEco Studio 或 hdc 运行 `List.test.ets`，指定运行器 `OpenHarmonyTestRunner` 与测试 Ability `TestAbility`；也可按套件运行，例如通过 `-s class MotionUiSequenceMatrixTest` 指定套件。运行前需唤醒并解锁设备。

### 手工用例表

以下为**功能性人工验证清单**，需配合自动化结果阅读；“测试结果”一栏填写所在设备与实际时间，未执行时保持“待执行”，不得预填 Pass。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|
| 启动应用 | 应用已安装 | 拉起 `EntryAbility` | 顶层 Ability 为 EntryAbility，显示状态文本与五个按钮 | 待执行 |
| 订阅操作手 | 进入主界面 | 点击“订阅操作手” | 状态文本显示 `motion subscribeOperating`；日志出现 `on succeeded` | 待执行 |
| 取消订阅操作手 | 进入主界面 | 点击“取消订阅操作手” | 状态文本显示 `motion unsubscribeOperating`；日志出现 `off succeeded` | 待执行 |
| 获取操作手状态 | 进入主界面 | 点击“获取操作手状态” | 状态文本显示 `motion getOperating`；日志出现 `get succeeded` 及状态值 | 待执行 |
| 订阅握持手 | 进入主界面 | 点击“订阅握持手” | 状态文本显示 `motion subscribeHolding` | 待执行 |
| 取消订阅握持手 | 进入主界面 | 点击“取消订阅握持手” | 状态文本显示 `motion unsubscribeHolding` | 待执行 |
| 顺序操作 | 进入主界面 | 先点“订阅操作手”，再点“取消订阅操作手” | 状态文本最终为 `motion unsubscribeOperating` | 待执行 |
| 重复操作 | 进入主界面 | 同一按钮连续点击多次 | 状态文本保持对应动作文案 | 待执行 |
| 应用重启 | 进入主界面 | 重启应用后再次点击动作按钮 | 控件恢复、点击后状态文本正常更新 | 待执行 |
| 无权限/不支持（负向） | 拒绝权限或设备不支持 | 点击订阅/查询按钮 | 不崩溃，日志出现 `Failed ... err code is 201/801`，页面文案仍更新 | 待执行 |

## 断言真实性说明

- API 用例用 `run(action)` 结果计数：只允许成功或 `201/801`，非法异常计数必须为 0，每次调用必须恰好一个结果。
- UI 用例断言精确文案与控件存在性；顺序矩阵断言“最后一次动作的文案”。
- **UI 文案断言不等于接口成功**：`pages/Index.ets` 的成功与异常分支写入同一句文案，故 UI 用例只证明交互与文案语义，接口结果由 `MotionApiRobust` / `MotionApiInterleave` 覆盖（详见 1.1 节）。
- 枚举用例只断言**文档取值与成员集合**，不断言成员之间的数值大小关系（不属于接口契约）。
- UI 用例依赖设备解锁；锁屏会导致控件查找失败，属环境前置条件而非用例逻辑。
