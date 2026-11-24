# Agent 扩展能力测试说明

> 本说明面向 `AgentExtensionAbility`（OpenHarmony 示例工程，包名 `com.sample.agentextensionability`），说明本工程 ohosTest 自动化测试的设计思路、覆盖维度与充分性依据。结构沿用 `ArkTS-Sta/HandletabsSample/ohosTest.md`，运行方式见附录 C。

## 1. 文档目标

本文档说明 Agent 扩展能力自动化测试的对象、隔离策略、参数矩阵、运行方法及实测证据，用于代码评审、版本回归和后续扩展。统计依据为当前注册入口及测试源码；历史运行结果单独记录于附录 D。

当前核心业务是 Agent 生命周期、固定鉴权回复和固定数据回复。配置文件声明天气助手及两个技能，但生产回调尚未实现天气查询、联网预报或握手凭据校验；测试结论以源码实际行为为界。

## 2. 测试设计原则

### 2.1 分层设计

测试采用 Hypium + UiTest，入口为 `entry/src/ohosTest/ets/test/List.test.ets`，运行器为 `OpenHarmonyTestRunner`，承载模块为 `entry_test`，测试 Ability 为 `TestAbility`。

- 共享驱动层：`Shared/AgentTestDriver.ets` 管理包名、Ability 名称、页面文本、UiTest Driver、串行队列、组件查询和前台拉起工具。保留的 Mirror 模型属于辅助资产，不能代替生产代码覆盖证据。
- 回调隔离层：`Shared/AgentCallbackFixture.ets` 直接导入生产 `AgentExtAbility`，通过 fixture 创建实例，使用类型化记录代理替代系统 IPC 端点。
- 核心契约层：`Ability.test.ets` 提供 6 条核心回调用例；`AgentCard/AgentSkillModel.test.ets` 读取真实 `agent_config.json`，提供 6 条配置用例。
- 场景矩阵层：78 个套件、1,966 条用例组合输入、回调顺序、主机实例与失败恢复场景，执行真实生产回调。
- 页面交互层：`AgentCard/AgentCardStress.test.ets` 提供 5 条真实页面用例，验证组件、点击状态、队列读操作与前台 Ability 契约。

回调层验证应用代码，配置层验证资源声明，页面层验证设备组件。真实系统 Agent 注册和跨进程通信仍需专门的系统集成验证。

### 2.2 高复用设计

- 集中入口：`testsuite()` 顺序注册 81 个套件，便于检查遗漏与过滤条件。
- 生产对象复用：核心和矩阵用例复用 `AgentCallbackFixture`，避免在测试中另写一份生产回复逻辑。
- 类型化替身：`RecordingAgentHostProxy implements common.AgentHostProxy`，区分调用尝试、成功结果和调用顺序。
- 用例隔离：每个回调用例创建独立 fixture，在 `try/finally` 中执行 `dispose()`，断开连接、销毁对象并清理记录。
- 非阻塞调度：回调与配置套件的 `beforeEach` / `afterEach` 使用 `setTimeout(resolve, 1)` 让出事件循环，避免大批同步用例持续占用主线程。
- UI 串行化：组件读写进入 `runSerializedUiOperation` 队列，页面等待使用异步延时和文本等待工具。
- 日志与断言：标准 hilog 接口输出英文日志；布尔采用 `assertTrue/assertFalse`，值与顺序采用 `assertEqual`。

### 2.3 矩阵化设计

- 输入族：空串、ASCII、Unicode、emoji、控制字符、空白、分隔符、转义、JSON、XML、URL、协议文本及可疑输入等，共 16 个输入族。
- 长度边界：空串单独覆盖，非空输入覆盖 1 至 16,384 个字符串代码单元；emoji 截断属于字符串边界，不代表字节长度或完整字符数。
- 操作模式：`authReply`、`dataReply`、`authFailureRecovery`、`dataFailureRecovery`、`dualFailureRecovery`、`orderedBatch`、`repeatedDelivery`、`reconnectRouting`、`callbackProxyWins`、`twoHostIsolation`、`twoAbilityIsolation`、`destroyRecreate`。
- 失败维度：授权失败、发送失败、连续失败及后续成功，核对错误注入次数和恢复后的返回内容。
- 路由维度：主次代理、连接代理与回调参数代理不同、断开重连及两个生产实例交错执行。
- 页面维度：组件显示、点击状态、重复点击、队列读取及前台模块。

以上是按场景选择的组合，并非完整笛卡尔积。输入在当前生产实现中是不透明字符串，相关用例验证固定回复稳定性，不将其解释为输入解析或安全过滤能力。

## 3. 测试对象拆解

### 3.1 主流程

- 主 Ability：`entry/src/main/ets/entryability/EntryAbility.ets` 设置颜色模式，在窗口创建时加载 `pages/Index`，记录生命周期日志。
- 首页：`entry/src/main/ets/pages/Index.ets` 展示标识为 `HelloWorld` 的组件，初始文本为 `Hello World`，点击后变为 `Welcome`。
- Agent 扩展：`entry/src/main/ets/agentextability/AgentExtAbility.ets` 实现创建、连接、断开、鉴权、数据接收与销毁回调。
- 连接状态：`onConnect` 保存 `comProxy`，`onDisconnect` 清空引用。字段为私有字段，现有测试通过后续调用记录观察外部行为，不声称直接读取字段值。
- 鉴权回复：`onAuth(proxy, handshakeData)` 调用参数代理的 `authorize('auth success')`，不解析握手；异常路径捕获 `BusinessError` 并记录日志。
- 数据回复：`onData(proxy, data)` 调用参数代理的 `sendData('reply message')`，不回显输入；异常路径捕获错误并记录日志。
- 模块声明：`entry/src/main/module.json5` 的扩展类型为 `agent`，元数据 `ohos.extension.agent` 指向 `$profile:agent_config`。主模块 `deviceTypes` 为 `default`，profile 的设备声明为 `phone/tablet`，两者含义不同。
- 配置资源：`agent_config.json` 声明 `weather_assistant_001`、`WeatherAssistant`、版本 `1.0.0`，以及 `get_weather`、`weather_forecast` 两个技能和输入输出格式。
- 启动时序：运行器取得 AbilityDelegator 后启动 `TestAbility`；测试窗口加载成功后等待 `startAbility(EntryAbility)` 返回，再调用 `Hypium.hypiumTest`。`testsStarted` 防止重复执行，初始化失败以 `finishTest(..., -1)` 结束。

### 3.2 关键风险点

- SDK schema 不支持 `agent` 类型，PreBuild 报 `00303038`。
- 设备锁屏使测试应用启动超时，出现 `00508013 App launch timed out`。
- 在 Delegator 注册前加载 UiTest，或在窗口未就绪时启动测试。
- 大批同步用例持续占用主线程，触发看门狗或冻结。
- 回复错误地发送给保存的连接代理，造成主机间路由错误。
- 主机抛错污染后续调用，或失败尝试被误计为成功结果。
- fixture 共用状态，导致调用次数、顺序与数据串扰。
- 首页点击状态延续，被误判为初始文案错误。
- 将天气技能声明、目录名或用例总数误认为网络、安全、性能及系统集成的验证结果。

## 4. 覆盖维度设计

### 4.1 功能正确性

- 鉴权回调：核对尝试次数、成功次数及精确回复 `auth success`，同时确认没有意外发送数据。
- 数据回调：核对发送次数和精确回复 `reply message`，确认请求未被直接作为回复返回。
- 回调路由：连接主代理后传入次代理，确认回复发送到回调参数指定的代理。
- 调用顺序：精确断言 `authorize>sendData` 等序列，并逐条核对批次结果。
- 实例隔离：两个生产实例、两个主机交错调用，各自记录和结果独立。
- 生命周期：创建、连接、断开、重连、销毁及重建后，固定回复仍符合契约。
- 配置资源：核对真实 profile 的身份、供应商、文档 URL、能力标志、技能顺序、格式和设备声明。
- 页面交互：核对真实组件、点击后的 `Welcome`、重复点击稳定性及前台 `EntryAbility`。

### 4.2 异常流与恢复

记录代理可为 `authorize` 和 `sendData` 分别配置失败次数及错误码，先记录调用尝试，再模拟抛错，只有成功时才写入成功数组。恢复用例同时校验：

- 第一次失败后尝试次数增长，成功结果仍为零。
- 剩余失败次数递减，异常由生产回调捕获。
- 再次调用成功，内容符合固定回复契约。
- 授权失败与数据失败互不污染，另一代理仍可正常处理。
- 连续失败后的顺序和结果数量一致。
- 断开、重连及重建后仍能执行新的回调流程。

这些用例注入的是接口调用错误，未模拟设备进程死亡、真实 Binder 断链或系统自动重连。

### 4.3 并发与长稳

批次用例覆盖重复授权、重复发送、混合回调、双主机交错及多实例隔离。回调以顺序调用和交错回放为主，不能据此推导多线程 IPC 并发正确性。

UI 用例通过 `Promise.all` 发起两次读取请求，由共享队列串行调用 UiTest，核对读取一致。回调套件钩子主动让出事件循环，使全量执行持续推进。

`PerformanceStability` 当前验证批次与隔离契约；一次全量回归不等同于小时级或天级长稳鉴权。

### 4.4 性能与兼容性

大输入、重复批次和连续会话场景可发现计数、顺序及异常后无法继续执行等问题。全量记录包含执行耗时，但未建立接口延迟分位数、资源水位或性能阈值。

当前编译、目标和兼容 SDK 均为 OpenHarmony `26.0.0`，设备需满足最低 API 26 要求。profile 的 `phone/tablet` 校验属于配置契约，不代表已完成两类实机覆盖。

功耗、泄漏、帧率、网络质量、主题及字体缩放，需要后续在明确设备矩阵和测量方案下补充专项验证。

### 4.5 安全与契约

- 不可信输入：可疑文本仍验证固定回复，明确当前没有隐式输入验证器。
- 数据隔离：回复不回显输入，不同主机与生产实例的记录分离。
- 授权契约：`auth success` 是示例固定字符串，不代表真实身份鉴权或凭据校验成功。
- 资源契约：直接导入生产 JSON，避免仅断言测试自建 Mirror。
- 日志规范：使用标准 hilog 和英文内容；异常用例检查恢复行为，未对所有设备日志独立采集断言。
- 配置规范：`.json5` 保留首部版权注释，扩展类型及元数据对应实际 Agent 声明。

### 4.6 可达性与易用性

当前 5 条 UI 用例验证组件可达、点击生效、重复点击稳定、队列读取一致及前台模块正确。页面可能保留点击状态，组件读取允许 `Hello World` 或 `Welcome`；点击用例明确等待 `Welcome`。

焦点导航、读屏、触摸目标尺寸、多语言、横竖屏和缩放尚无独立实测结论，后续应按真实页面功能补充。

## 5. 充分性说明

### 5.1 为什么认为当前测试具备较强充分性

- 生产关联明确：回调直接执行 `AgentExtAbility`，配置读取实际资源，UI 操作真实组件。
- 结果校验细化：断言尝试次数、成功数据、顺序和另一代理未被调用，减少仅检查“不抛异常”的假通过。
- 恢复路径明确：覆盖授权失败、发送失败、连续失败、代理切换及后续成功。
- 输入多样：包含空串、长度边界、特殊字符和结构化文本，验证不透明输入契约的一致性。
- 状态隔离：fixture 按用例创建清理，UI 集中排队，钩子主动让出主线程。
- 证据可追溯：注册 81 个套件、1,983 条用例，历史全量日志全部通过。

充分性针对当前固定回调行为、资源声明和简单首页。用例数量不代表分支覆盖率；现有资产尚未提供覆盖率报告或真实 AgentHost 系统集成报告。

## 6. 当前测试目录与职责

`entry/src/ohosTest/ets/test/` 共 **84 个 ArkTS 文件**：81 个用例文件、1 个入口、2 个共享文件，共 **55,155 行**。整个 `entry/src/ohosTest/` 加上运行器、测试 Ability 和测试页面，共 **87 个 ArkTS 文件、55,344 行**。用例总数 **1,983**；行数包含注释和空行，统计日期为 2026-11-19。

| 分组 | 套件数 | 用例数 | 代表套件与职责 |
| --- | --- | --- | --- |
| 核心回调 | 1 | 6 | `AgentCoreCallbacks`：固定回复、恢复、代理路由和重建 |
| AgentCard | 2 | 11 | `AgentProductionProfile` 6 条配置；`AgentEntryPageUI` 5 条页面交互 |
| Integration | 9 | 139 | `CallbackIntegration`、`CallbackRegression`：组合回调 |
| Interaction | 14 | 379 | `HostUnicodePayloads`、`HostCallbackOrdering`：文本边界、隔离及顺序 |
| LifecycleState | 10 | 222 | `CallbackLifecycle`、`ReconnectSessions`：生命周期与恢复 |
| PerformanceStability | 7 | 137 | `SequentialCallbackBatches`、`LargeDataBatches`：批次与实例隔离 |
| PowerDialog | 16 | 408 | `AgentCallbackMatrix`、`TwoHostInterleaving`：Agent 回调矩阵，目录名不表示电源弹窗覆盖 |
| PowerValidation | 8 | 223 | `AuthorizationContract`、`ProxyEventContract`：授权与参数契约 |
| Security | 3 | 50 | `UntrustedPayloadContract`、`HostIsolationContract`：不透明输入与隔离 |
| Validation | 11 | 408 | `FixedReplyValidation`、`ErrorBoundaryValidation`：固定回复及错误边界 |
| **合计** | **81** | **1,983** | 78 个矩阵套件与 3 个核心、配置、页面套件 |

各目录文件数与行数明细：

| 目录或文件 | 文件数 | 行数 | 用例数 |
| --- | --- | --- | --- |
| `Ability.test.ets` | 1 | 117 | 6 |
| `AgentCard/` | 2 | 174 | 11 |
| `Integration/` | 9 | 3,913 | 139 |
| `Interaction/` | 14 | 10,266 | 379 |
| `LifecycleState/` | 10 | 6,091 | 222 |
| `PerformanceStability/` | 7 | 3,787 | 137 |
| `PowerDialog/` | 16 | 11,092 | 408 |
| `PowerValidation/` | 8 | 6,035 | 223 |
| `Security/` | 3 | 1,401 | 50 |
| `Validation/` | 11 | 10,921 | 408 |
| `Shared/` | 2 | 1,178 | 0 |
| `List.test.ets` | 1 | 180 | 0 |
| **合计** | **84** | **55,155** | **1,983** |

## 7. 结论

当前测试由生产回调、类型化 IPC 替身、输入与时序矩阵、真实 profile 校验和页面交互组成，覆盖固定回复契约及异常后恢复。后续新增真实鉴权、天气服务或系统主机接入时，应同步新增集成断言，并更新本模板中的覆盖边界和实测记录。

## 附录 A：测试框架与模式

- 框架：项目声明 `@ohos/hypium` `1.0.25`，使用 `describe` / `it` / `expect`；另声明 `@ohos/hamock`，核心替身由类型化记录代理实现。
- 用例标识：采用 `it(name, 0, callback)`，矩阵名称编码操作、输入族、长度及部分错误码或批次；不套用模板工程的元数据和等级统计。
- 生产导入：fixture 通过 `../../../../main/ets/agentextability/AgentExtAbility` 导入生产类；配置套件通过对应路径导入 `main/resources/base/profile/agent_config.json`。
- 断言：`expect(actual).assertEqual(expected)` 比较回复、次数和顺序；布尔采用 `assertTrue/assertFalse`。
- 异步：回调主体主要同步执行，钩子和 UI 用例使用 Promise / `async` / `await`，不混用完成回调。`-s timeout` 按模板设置单用例超时，不表示全量仅允许运行 15 秒。
- 隔离：fixture 在 `try/finally` 中清理，UI 经共享队列操作。
- 日志：`@kit.PerformanceAnalysisKit` 的 `hilog`，英文内容。
- 启动：运行器避免提前导入 UiTest 驱动，窗口就绪并拉起主 Ability 后，仅启动一次 Hypium。

## 附录 B：手工用例归档

表格沿用模板字段。自动用例的 Pass 对应附录 D 的历史全量记录，不是本次文档修改后重新执行的结果。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| --- | --- | --- | --- | --- | --- |
| 拉起首页 | 已解锁且已安装两个 HAP | 启动测试 | `EntryAbility` 在前台，`HelloWorld` 存在 | 是 | Pass |
| 点击首页文本 | 组件可见 | 点击并重复点击 | 显示并保持 `Welcome` | 是 | Pass |
| 固定鉴权回复 | 创建生产扩展与记录代理 | 调用 `onAuth` | 参数代理收到 `auth success` | 是 | Pass |
| 固定数据回复 | 创建生产扩展与记录代理 | 调用 `onData` | 参数代理收到 `reply message` | 是 | Pass |
| 代理路由 | 已连接主代理 | 回调传入次代理 | 回复只进入指定代理记录 | 是 | Pass |
| 授权异常恢复 | 授权失败一次 | 连续鉴权 | 第一次无成功结果，后续恢复 | 是 | Pass |
| 数据异常恢复 | 发送失败一次 | 连续发送 | 第一次无成功数据，后续恢复 | 是 | Pass |
| 重连与实例隔离 | 两代理或两生产实例 | 重连和交错回放 | 次数、顺序、结果互不串扰 | 是 | Pass |
| profile 资源契约 | 真实 JSON 可导入 | 读取身份、技能和格式 | 与生产声明一致 | 是 | Pass |
| 系统主机接入 | 支持 Agent 的系统和真实主机 | 系统发现、连接和鉴权 | 完成真实跨进程交互 | 否 | 待专项验证 |

## 附录 C：运行方式

> **前置条件（必做）**：设备屏幕必须已解锁。锁屏可能出现 `00508013 App launch timed out. Make sure the screen is unlocked.`。唤醒不能替代解锁；滑动坐标仅为模板示例，按屏幕尺寸调整，密码锁需人工解锁。

```bash
hdc shell power-shell wakeup
hdc shell "uinput -T -m 360 1000 360 200 400"
hdc shell power-shell timeout -o 86400000
```

使用指定的 `C:\Users\23924\Desktop\devecostudio64.exe - 快捷方式.lnk` 打开工程，确认 DevEco 使用支持 `agent` 的 OpenHarmony SDK `26.0.0`。当前 `local.properties` 指向 SDK 根目录 `F:/OpenHarmony/sdk2`，该目录下需存在可用的 `26.0.0`。编译、目标和兼容 SDK 均为 `26.0.0`。

在工程根目录执行模板中的构建、安装和运行流程。下方沿用模板 Bash 换行写法；PowerShell 中将每条跨行命令合并为一行，并使用环境中可用的 Hvigor 启动器。

```bash
# 1. 构建 ohosTest HAP
hvigorw --mode module -p module=entry@ohosTest -p isOhosTest=true \
  -p product=default -p buildMode=test assembleHap \
  --analyze=normal --parallel --incremental --no-daemon

# 2. 构建主应用 HAP
hvigorw --mode module -p module=entry@default -p product=default \
  assembleHap --analyze=normal --parallel --incremental --no-daemon

# 3. 安装两个 HAP
hdc install -r entry/build/default/outputs/default/entry-default-signed.hap
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap

# 4. 执行 Ability assistant 的 test 子命令
# <ability-assistant> 是模板占位符，执行前替换为设备提供的工具命令名
hdc shell <ability-assistant> test -b com.sample.agentextensionability -m entry_test \
  -s unittest /ets/testrunner/OpenHarmonyTestRunner -s timeout 15000
```

> **注意**：占位符不能原样执行。同一个包同一时间只运行一个会话，避免 DevEco 与命令行相互干扰。修改测试后确认产物时间戳，必要时先清理再构建。也可在指定 DevEco 中运行 `entry/src/ohosTest`，使用同一 `OpenHarmonyTestRunner`。

> **构建检查**：PreBuild 提示 `extensionAbilities[0].type` 不在枚举时，检查实际 SDK 和 schema 是否支持 `agent`。保留生产扩展类型，不能改为其它类型掩盖问题。

## 附录 D：实测结果（最近一次记录）

| 项目 | 数值或证据 |
| --- | --- |
| 最近全量记录日期 | 2026-11-18 |
| 注册套件数 | 81 |
| 用例总数 | 1,983 |
| 通过 / 失败 / 错误 / 忽略 | 1,983 / 0 / 0 / 0 |
| 用例执行耗时 | `taskconsuming=66651`，约 66.651 秒；不是启动耗时 |
| 完成标识 | `TestFinished-ResultCode: 0` |
| 全量日志 | 上级目录 `AgentExtensionAbility_DEVICE_ALL_VERIFIED.log` |
| SDK 26 主包构建 | 上级目录 `AgentExtensionAbility_SDK26_PERMANENT_MAIN_BUILD.log`：`BUILD SUCCESSFUL` |
| SDK 26 测试包构建 | 上级目录 `AgentExtensionAbility_SDK26_PERMANENT_TEST_BUILD.log`：`BUILD SUCCESSFUL` |

全量测试日志与后续 SDK 配置构建日志分别保留，不合并为一次验证。2026-11-19 本次操作只重写说明文档，没有重新构建或运行设备全量测试，也未重新测量启动耗时。

## 附录 E：已知问题与陷阱（保留记录）

| 问题 | 表现 | 处置 |
| --- | --- | --- |
| SDK schema 不支持 Agent | PreBuild 报 `00303038`，扩展类型校验失败 | 使用支持 `agent` 的 SDK；检查三个版本字段、DevEco SDK 路径及设备 API |
| 设备锁屏 | 报 `00508013`，UI 无法操作 | 按附录 C 唤醒并完成解锁，保持屏幕可用 |
| UiTest 初始化过早 | 启动时缺少有效 Delegator 或驱动 | 保持运行器不提前导入 UI 驱动，待 Delegator 就绪后启动测试 Ability |
| 窗口未就绪 | 加载或主 Ability 拉起失败 | 保留窗口加载后的初始化及 `finishTest(..., -1)` 失败出口，检查英文 hilog |
| 同步占用主线程 | 大规模执行可能冻结或被中止 | 保留钩子中的异步让出，避免忙等和同步阻塞 |
| 首页状态延续 | 后续用例已显示 `Welcome` | 读取接受已有状态，点击明确等待 `Welcome`；不能假设每次拉起都会重建页面 |
| 目录名称造成误解 | 将 Power、Performance 当作专项结果 | 以实际实现为准，这些目录当前主要承载 Agent 回调矩阵 |
| 声明被误认成实现 | 有天气技能但没有真实天气结果 | 分开记录 profile 和回调契约，天气服务另补集成测试 |
| 仅看工具退出状态 | 忽略实际用例失败 | 同时核对 Hypium 的总数、Pass、Failure、Error、Ignore 和完成标识 |
