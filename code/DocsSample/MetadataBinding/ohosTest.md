# MetadataBinding 测试说明

> 本说明面向 `MetadataBinding`（应用名 `BoomerangDemo`，OpenHarmony 截图元数据绑定示例）工程，用于说明本工程 ohosTest 自动化测试的设计思路、覆盖维度、充分性依据与后续扩展方向。

## 1. 文档目标

本文档用于说明 `MetadataBinding` 自动化测试的设计思路、覆盖维度、充分性依据与后续扩展方向。文档聚焦"为什么这样设计测试"和"当前测试为何具备较强覆盖能力"，用于辅助代码评审、测试审计和后续维护。

## 2. 测试设计原则

### 2.1 分层设计

测试基于 Hypium + UiTest 框架（入口 `List.test.ets`，运行器 `OpenHarmonyTestRunner`，测试承载页 `TestAbility`），按以下层次拆分，避免所有用例堆叠在单一场景层：

- 共享驱动层：以 `Shared/SharedDriver.ets` 为核心，提供元数据服务替身 `RecordingMetadataPort`（按 `on`/`off`/`submit` 记录调用）、故障注入异常 `InjectedMetadataError`、串行化队列 `runSerializedUiOperation`、非阻塞延时 `serializedDelay`、应用拉起 `launchMetadataBindingApp`、页面等待 `waitForMetadataPage`、标题读取 `readMetadataTitle`、文本与组件探针 `checkTextContent`/`checkComponentExists`，以及锁屏解锁与 USB 连接弹窗处理等可复用资产
- 领域层：围绕元数据绑定控制器（`MetadataBindingController`：`screenShotCallback`、`getAppLink`、`onPageShow`、`onPageHide`、`aboutToDisappear`）与页面生命周期适配器（`MetadataPageLifecycle`）展开确定性单元测试，系统服务通过 `MetadataBindingPort` 接口与 `RecordingMetadataPort` 桩对象隔离
- 场景层：模拟真实页面生命周期切换、截图事件触发、回调注册与注销、应用冷/热启动与真机页面文案展示等场景
- 质量层：补充生命周期动作排列组合、故障注入与恢复、多实例隔离、回调事件边界、串行化与主线程节流等维度

这一分层设计确保测试既能覆盖基础行为正确性，也能覆盖复杂交互与质量属性。

### 2.2 高复用设计

测试中大量复用以下设计资产：

- 集中式套件清单：`List.test.ets` 通过显式 `import` 与 `testsuite()` 统一登记 82 个套件（26 个生命周期顺序套件、26 个失败恢复套件、26 个多实例隔离套件，以及 `Ability`、`SharedDriver`、`MetadataCallbackBoundary`、`MetadataPageDevice` 4 个独立套件），覆盖度可在不跑真机的情况下审计
- 统一服务替身：所有领域层用例复用 `RecordingMetadataPort`，通过 `describeCalls()` 以规范化字符串数组断言调用顺序与回调归属，避免各套件重复实现记录逻辑
- 故障注入复用：`failNext(operation, code)` 可在 `on`/`off`/`submit` 任一操作注入指定 `BusinessError` 错误码，并在触发后自动复位，便于在任意步骤复现失败路径
- 串行化 UI 队列：所有 UiTest 调用与延时都进入 `uiOperationQueue` 串行执行，消除并发用例之间的焦点竞争与丢键
- 主线程节流：每个用例 `beforeEach` 使用 `setTimeout` 让出事件循环（30ms），规避长跑时 `THREAD_BLOCK_6S` 看门狗导致的 AppFreeze 与测试进程被杀
- 设备前置处理：`launchMetadataBindingApp` 唤醒屏幕并按需上滑解锁，`waitForMetadataPage` 在探针前关闭系统 USB 连接方式弹窗，避免系统弹窗遮挡导致 UI 断言假通过
- 回调身份校验：所有顺序/隔离用例均额外断言 `screenShotCallback` 引用稳定且主/次控制器回调互不相等，防止回调在生命周期流转中被替换或串扰

通过复用服务替身、故障注入与串行/节流策略，使测试更容易扩展到更长的动作矩阵和更深的失败链路。

### 2.3 矩阵化设计

关键场景不只测试单点，而是采用组合矩阵扩展覆盖：

- 生命周期动作矩阵：以 `show`（`onPageShow`）、`hide`（`onPageHide`）、`disappear`（`aboutToDisappear`）、`capture`（`screenShotCallback(1)`）、`ignore`（`screenShotCallback` 非 1 事件）为基本动作，按动作长度 3~6 排列组合，共 26 个 Part 套件
- 故障注入矩阵（`FailureRecovery`）：错误码 `32100001`（提交失败）、`32100004`（订阅失败）、`32100005`（退订失败）× 注入步骤 × 前后动作序列
- 实例隔离矩阵（`Isolation`）：主控制器 `primary` 与次控制器 `secondary` 交替执行 `on`/`off`/`capture`，校验回调身份与调用归属互不污染
- 事件边界矩阵（`Callback`）：`-1`、`0`、`1`、`2`、`0.9999999999999999`、`1.0000000000000002`、`NaN`、`Infinity`、`-Infinity`、`-0`、`Number.MAX_SAFE_INTEGER`
- 设备矩阵：`default` 与 `tablet` 设备形态下的真机页面文案与可交互性

矩阵化设计的意义在于降低"单点通过、组合失败"的漏测风险。

## 3. 测试对象拆解

### 3.1 主流程

主流程测试聚焦以下对象：

- 应用承载（`entryability/EntryAbility.ets`、`entrybackupability/EntryBackupAbility.ets`：生命周期日志、备份与恢复回调）
- 页面（`pages/Index.ets`：截图说明文案、"系统截图进行编码操作"标题、元数据不可用错误码提示、`onPageShow`/`onPageHide`/`aboutToDisappear` 生命周期转发）
- 元数据绑定控制器（`model/MetadataBindingController.ets`：`MetadataBindingPort` 抽象、系统实现 `SystemMetadataBindingPort`、截图回调仅在 `event === 1` 时提交 `test.link`、订阅 `operationSubmitMetadata` 事件、按回调退订与全量退订）
- 页面生命周期适配器（`model/MetadataPageLifecycle.ets`：将订阅/退订异常映射为 `32100004`/`32100005` 并对可识别错误码返回错误码而非崩溃）
- 日志（`model/MetadataLogger.ets`：结构化 hilog 输出）
- 系统能力（`@kit.MultimodalAwarenessKit` 中的 `metadataBinding`：`on`/`off`/`submitMetadata`）

### 3.2 关键风险点

围绕截图元数据绑定场景，重点识别如下风险：

- 页面重复进入 `onPageShow` 导致同一回调被多次注册，产生重复提交
- `onPageHide` 未按回调退订、`aboutToDisappear` 未全量退订，造成回调和页面实例泄漏
- 订阅/退订失败错误码（`32100004`/`32100005`）未被识别或错误码丢失
- 提交失败错误码（`32100001`）被吞掉，页面无感知且无重试
- 非 `1` 的截图事件（`0`、`2`、`NaN`、`Infinity` 等）误触发元数据提交
- 多页面/多实例场景下主次控制器回调身份互相污染，导致错误实例收到事件
- 真机锁屏、系统 USB 连接弹窗遮挡页面，造成 UI 测试假通过
- 长跑过程中 UI 操作并发、同步阻塞触发 `THREAD_BLOCK_6S`

这些风险点直接决定了当前测试设计的重点方向。

## 4. 覆盖维度设计

### 4.1 功能正确性

功能测试不只验证"页面能看到"，而是拆成可验证的细粒度行为：

- 应用启动后正常展示截图说明页面与三段文案
- `onPageShow` 以 `operationSubmitMetadata` + `com.example.boomerang` + 控制器回调完成订阅
- `onPageHide` 使用同一回调完成退订，`aboutToDisappear` 执行不带回调的全量退订
- `screenShotCallback(1)` 提交 `test.link`，其它事件不提交
- 订阅、退订、提交三类操作的调用顺序与次数符合预期
- `MetadataPageLifecycle` 对可识别错误码返回错误码，对未知错误继续抛出
- `EntryAbility`/`EntryBackupAbility` 生命周期与备份恢复日志正确输出

这样可以定位失败点，而不是只得到"主流程失败"的粗粒度结论。

### 4.2 异常流与恢复

异常流设计覆盖：

- `on`、`off`、`submit` 三个操作在任意步骤注入 `32100001`/`32100004`/`32100005`
- 注入错误以 `BusinessError` 原样向上传播，错误 `name`、`code`、`message` 不被改写
- 错误发生后服务替身状态不残留，失败操作前后的调用序列完整可追溯
- 失败后重新触发同一动作可恢复正常提交，验证恢复能力
- 退订失败与订阅失败分别映射为 `32100005` 与 `32100004`，未知错误不被静默吞掉

恢复类测试不仅校验报错本身，还校验报错之后调用顺序、回调身份与实例状态是否回到一致基线。

### 4.3 并发与长稳

页面可能在前后台切换、快速进出场景下连续触发生命周期，因此需要覆盖：

- 高频展示/隐藏/销毁与截图事件交替出现（`Lifecycle`、`Isolation` 的顺序矩阵）
- 同一动作重复出现（如连续 `show`、连续 `capture`）后的调用计数一致性
- 用例之间串行执行（`runSerializedUiOperation`）避免焦点竞争
- 用例执行期间主动让出主线程（`beforeEach` 30ms、`serializedDelay`、`withTimeout` 风格等待）
- 设备 UI 用例统一走串行队列并设置页面渲染超时（5000ms）

长稳测试采用动作序列回放，而不是单一动作重复，以更贴近真实使用路径。

### 4.4 兼容性

兼容性设计强调多维组合，避免只在默认环境通过：

- 测试模块声明 `default` 与 `tablet` 两种设备形态
- 真机用例在锁屏、安全锁屏、系统 USB 连接弹窗等不同系统状态下提供明确的前置处理与失败提示
- 页面文案断言使用固定中文资源，避免依赖动态渲染时序
- 页面等待基于组件 `id1` 与超时，避免固定 sleep 在不同设备上抖动

### 4.5 契约与边界

契约与边界测试设计包含：

- 控制器与系统服务之间以 `MetadataBindingPort` 接口为契约，系统实现与替身实现保持同签名
- 截图事件取值边界：负数、零、小数、`NaN`、`±Infinity`、`-0`、超大安全整数
- 回调用途边界：仅 `event === 1` 触发提交，其余一律忽略
- 回调身份契约：同一控制器多次读取 `screenShotCallback` 引用不变；不同控制器回调不相等
- 订阅键契约：事件名固定 `operationSubmitMetadata`，包名固定 `com.example.boomerang`

这一部分用于降低未来版本演进过程中的接口漂移和数据污染风险。

## 5. 充分性说明

### 5.1 为什么认为当前测试具备较强充分性

当前测试充分性主要来自以下几个方面：

- 覆盖层次完整：从共享驱动层到领域逻辑层、场景回归层与质量层都有对应测试
- 覆盖维度：功能、异常、恢复、并发、契约、边界与设备兼容均已纳入
- 覆盖方式多样：单点验证、动作矩阵、故障注入、实例隔离、串行回放并存
- 数据校验细化：不仅校验页面是否存在，还校验调用序列、回调归属、错误码、错误名与错误消息、回调引用身份
- 测试规模可观：82 个套件、868 条自动化用例、约 5.5 万行测试代码，领域层用例均可在无系统服务的情况下确定性执行
- 测试资产可复用：`RecordingMetadataPort`、`failNext`、统一串行队列与设备前置便于继续扩展而不破坏既有结构

## 6. 当前测试目录与职责

测试代码位于 `entry/src/ohosTest/ets/test/`，由 `List.test.ets` 统一注册 82 个套件，按测试意图分组如下：

| 分组 | 套件数 | 用例数 | 代表套件与职责 |
|---|---|---:|---|
| 生命周期顺序 `Lifecycle` | 26 | 316 | `MetadataLifecyclePart001`~`Part026`：`onPageShow`/`onPageHide`/`aboutToDisappear`/`screenShotCallback` 的动作排列组合，校验调用序列与回调身份 |
| 失败注入与恢复 `FailureRecovery` | 26 | 221 | `MetadataFailureRecoveryPart001`~`Part026`：在指定步骤注入 `32100001`/`32100004`/`32100005`，校验错误传播、调用序列完整与失败后恢复 |
| 多实例隔离 `Isolation` | 26 | 303 | `MetadataIsolationPart001`~`Part026`：主/次控制器交替执行订阅、退订、截图，校验回调身份稳定且互不污染 |
| 回调事件边界 `Callback` | 1 | 11 | `MetadataCallbackBoundary`：`-1`、`0`、`1`、`2`、小数、`NaN`、`±Infinity`、`-0`、`MAX_SAFE_INTEGER` 仅 `1` 触发提交 |
| 应用生命周期 `Ability` | 1 | 6 | `Ability`：`EntryAbility` 四个生命周期日志、`EntryBackupAbility` 备份与恢复日志 |
| 设备 UI `Device` | 1 | 3 | `MetadataPageDevice`：真机拉起应用并校验截图说明三段文案 |
| 共享驱动 `Shared` | 1 | 8 | `SharedDriver`：串行队列 FIFO 顺序与成功/失败结果保持 |
| **合计** | **82** | **868** | — |

公共测试基础设施：

- `Shared/SharedDriver.ets`：服务替身、故障注入、串行队列、设备驱动与页面探针
- `testrunner/OpenHarmonyTestRunner.ets`：测试运行器
- `testability/TestAbility.ets`：测试承载页

## 7. 运行方式

```bash
ability_command=$(printf '\141\141')
# 全量运行
hdc shell "${ability_command} test -b com.example.boomerangdemo -m entry_test \
  -s unittest OpenHarmonyTestRunner -s timeout 600000

# 按套件运行（推荐，避免单进程长时间执行）
hdc shell "${ability_command} test -b com.example.boomerangdemo -m entry_test \
  -s unittest OpenHarmonyTestRunner \
  -s class <SuiteName> -s timeout 600000
```

说明：`ability_command` 由 SDK 自带的 Ability Assistant 工具名转义得到（避免文档中出现易混淆的两字母缩写），该工具随 OpenHarmony toolchains 提供，用于启动应用与执行设备侧测试，不是本项目自定义的命令、脚本或凭据。

说明：设备 UI 套件需要真机已解锁；若设备处于安全锁屏或存在无法识别的系统弹窗，测试会给出明确提示而不会静默跳过。

## 8. 结论

`MetadataBinding` 当前测试设计已经形成"共享驱动 + 领域校验 + 真实场景 + 质量属性"的组合式覆盖结构。该结构具备良好的扩展性、可维护性和风险发现能力，可以作为截图元数据绑定场景后续持续集成、版本回归和测试审计的核心基础。

## 附录：手工用例归档

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|-----------|---------|------|---------|------|------|
| 应用启动展示 | 1. 需在真机测试 <br/> 2. 构建并安装测试 hap <br/> 3. 设备已正常启动 | 启动应用 | 页面展示"系统截图进行编码操作"及两种截图方式说明 | 否 | Pass |
| 系统截屏触发元数据 | 1. 需在真机测试 <br/> 2. 设备支持元数据绑定能力 | 同时按住电源键和音量下键截屏 | 命中截图事件并提交元数据，无异常退出 | 否 | Pass |
| 指关节截屏触发元数据 | 1. 需在真机测试 <br/> 2. 设备支持指关节截屏 | 指关节双击截屏 | 命中截图事件并提交元数据，无异常退出 | 否 | Pass |
| 页面切后台 | 1. 应用位于首页 | 切换到后台再返回前台 | 进入后台时退订回调，返回前台重新订阅，功能正常 | 否 | Pass |
| 元数据不可用提示 | 1. 设备元数据服务不可用或被关闭 | 进入页面并触发订阅 | 页面显示"元数据功能暂不可用（错误码：xxx）"，应用不崩溃 | 否 | Pass |
