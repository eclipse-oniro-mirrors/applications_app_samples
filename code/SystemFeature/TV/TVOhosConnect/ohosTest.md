# 通用互联（TVOhosConnect）测试说明

> 本说明面向 `TVOhosConnect`（通用互联 TV 应用，Bundle 名见 `build-profile.json5`，主模块 `tv`，测试模块 `tv_test`），用于说明本工程 ohosTest 自动化测试的设计思路、覆盖维度、充分性依据与运行方式。

## 1. 文档目标

本文档用于说明 `TVOhosConnect` 自动化测试的设计思路、覆盖维度、充分性依据与后续扩展方向。文档聚焦"为什么这样设计测试"和"当前测试为何具备较强覆盖能力"，用于辅助代码评审、测试审计和后续扩展。

当前测试代码位于 `product/tv/src/ohosTest/ets/test/`，由 `List.test.ets` 聚合注册 **83 个套件**；`HomePageUiTest`（真机 UI 驱动）与 `Ability.test.ets` 作为独立套件通过命令行指定执行，合计 **85 个套件、1793 个用例**。

## 2. 测试设计原则

### 2.1 分层设计

测试基于 Hypium + UiTest 框架（聚合入口 `List.test.ets`，运行器 `OpenHarmonyTestRunner`，测试承载 Ability `TestAbility`），按以下层次拆分：

- 共享驱动层：以 `Shared/DeviceTestKit.ets` 为核心，提供 `TestLog`（hilog 日志，TAG `OhosConnectTest`）、协议与状态枚举（`TestProtocol`：BLE/WIFI/IOT/CLOUD/VIRTUAL，`TestConnState`：DISCONNECT/CONNECTING/ONLINE/OFFLINE/ERROR）、设备与场景模型（`TestDevice`、`TestDeviceStore`、`TestScene`、`TestSceneStore`）、连接状态机（`TestConnMachine`：connect/confirmOnline/disconnect/fail/reset）、会话管理（`TestSession`、`TestSessionManager`）、指令编解码（`TestCommand`、`TestCommandCodec`）、重试与限流（`TestRetryPolicy`、`TestTokenBucket`）、指标统计（`TestMetrics`）、十六进制校验（`TestHex`）、延时构造（`testDelay`、`makeDevice`）、工具类（`TestStringUtil`、`TestArrayUtil`、`TestTimeUtil`）与默认配置（`TestConfigDefaults`：超时 2000ms、重试 3 次、令牌桶容量 5、序号起始 0，超时上限 60000ms、重试上限 0~10）
- 领域契约层：`ConnectionCore`、`ConnectionValidation`、`Validation`、`LifecycleState`、`Interaction`、`Integration`、`PerformanceStability`、`Security` 等目录下的套件，围绕真实业务模块做确定性断言，覆盖连接控制报文、协议枚举、数据库表与字段、设备实体、云设备模型、BLE/Wi-Fi 常量、工具函数等
- 真机场景层：`Feature/HomePageUiTest.test.ets` 使用 UiTest `Driver` + Want 拉起 `EntryAbility`，在真机上验证首页标题、附近设备页与个人中心页的可达性
- 资源文案层：`Common/HomeTextsTest.test.ets`、`Feature/NearbyDeviceTest.test.ets`、`Feature/MinePageTest.test.ets` 通过应用模块的 `resourceManager` 读取中文文案，校验资源表接线
- 纯函数单测层：`Unit/ArrayBufferUtilTest.test.ets` 对 `ArrayBufferUtil` 的十六进制解析、格式化与 ArrayBuffer 往返做边界穷举

需要说明的是：除 `HomePageUiTest` 外，其余"质量类"套件本质上是领域契约与常量断言（共享同一组业务模块导入），并非真机 UI 操作回放；真机 UI 覆盖目前集中在 `HomePageUiTest` 一个套件。

### 2.2 高复用设计

测试中大量复用以下设计资产：

- 集中式套件注册：`List.test.ets` 统一导入并调用 83 个逻辑类套件工厂函数，命令行通过 `-s class <套件名>` 即可按需选择执行；`HomePageUiTest` 因需拉起应用 UI，不注册在列表中，单独执行
- 统一驱动能力：各套件复用 `Shared/DeviceTestKit.ets` 的设备存储、连接状态机、重试策略、令牌桶与指标统计，避免重复实现
- 统一业务依赖：各套件统一导入 `@ohos/common` 的 `ControlCmd`（`analysisPayload`、`buildQueryStateRequest`）、`TypeEnum`、`TableConfig`、`GenericValues`、`InfConstants`、`EventConstants`、`Device` 实体，以及 `@ohos/connect_cloud`、`@ohos/connect_ble`、`@ohos/connect_wifi`、`@ohos/nearbydevice` 的常量与工具
- 真机 UI 驱动复用：`HomePageUiTest` 中封装 `findText`（200ms 轮询、默认 8s 超时）、`ensureHome`（处理初次启动隐私页）、`clickClickable`（按组件 bounds 中点点击）、`pressBackToHome`，后续真机套件可直接复用同一写法
- 初次启动兜底：`ensureHome` 在首页标题不可见时，依次点击隐私开关 `launcher_privacy_toggle` 与确认按钮 `launcher_confirm_btn`，避免隐私页遮挡导致的假失败
- 资源读取兼容：`appResourceManager` 先 `createModuleContext('tv')`，失败后回退 `createModuleContext('entry')`，兼容整机上主模块名为 `tv` 或 `entry` 的差异
- 分批执行脚本：`run_ohos_tests.ps1` 按 `BatchSize=5` 分批调用设备侧测试命令行，`MaxRetry=3` 重试，解析 `TestFinished-ResultCode` 与 `STATUS_CODE: 0` 统计通过数，规避长链路执行触发 `THREAD_BLOCK_6S` 与设备断连

### 2.3 矩阵化设计

关键场景不只测试单点，而是采用组合矩阵扩展覆盖：

- 目录分类矩阵：根目录 1、`Common` 2、`ConnectionCore` 16、`ConnectionValidation` 8、`Validation` 11、`Interaction` 14、`LifecycleState` 10、`PerformanceStability` 7、`Integration` 9、`Security` 3、`Feature` 3、`Unit` 1，共 85 个套件
- 协议矩阵：`ProtocolType`、`SubProtocolType`、`ScanProtocol`、`ServerType`、`EncryType`、`ConnectType` 与 `getProtocolCode` 的取值组合
- 报文矩阵：`buildQueryStateRequest(seq, sids)` 与 `analysisPayload(payload)` 的 seq/sid/data 结构组合，含单服务、多服务、空服务与非法 JSON
- 连接状态矩阵：`InfDeviceState` 与 `TestConnState` 的状态迁移（未连接 → 连接中 → 在线 → 离线/错误 → 重置）
- 常量矩阵：`InfConstants.SID_ALL_SERVICES`/`ON_CONNECT_STATE_CHANGED`、`EventConstants` 前台事件、`BleConstants.BROADCAST_DATA_SIZE=37`/`BLE_MTU_SIZE=251`、`WifiConstants`
- 数据表矩阵：`CONNECT_DATABASE_NAME`、`TableType`、`DeviceLibraryField`、`SceneLibraryField` 与 `GenericValues` 的键值读写
- 设备与型号矩阵：`Device`、`LibraryDevice`、`Manufacturer`、`Project`、`CloudDeviceModel`、`CountryCodeConfig`
- 字节矩阵：`ArrayBufferUtilTest` 覆盖单字节到多字节、带/不带 `0x` 前缀、非法十六进制、解析与格式化往返，共 344 个用例
- 资源文案矩阵：`ability_label`、首页三入口、附近设备三页签、个人中心页六个入口，分别按 `tv`/`entry` 两种模块上下文读取
- 页签矩阵：首页 `TabConfig.tabItems`（2 项、index 0/1）、附近设备 `TabsConfig`、`HomeTabsConfig`

矩阵化设计的意义在于降低"单点通过、组合失败"的漏测风险。

## 3. 测试对象拆解

### 3.1 主流程

主流程测试聚焦以下对象：

- 应用承载（`product/tv` 模块 `EntryAbility`，Bundle 名见 `build-profile.json5`，测试侧由 `tv_test`/`TestAbility` 承载）
- 首页（标题"通用互联"，入口"附近设备""个人中心"，`TabsConfig` 页签配置）
- 附近设备（页签"附近设备""可连接设备(ble本地控)""局域网本地控"，BLE 扫描与连接、局域网发现、物模型解析 `parseProfileServices`、设备图标 `getImageFromDevice`、`PreferenceConstants`、`OpenValleyConstants`）
- 个人中心（"设置""语言""关于""设备库同步""场景库同步""点击登录"，国际化 `InternationalManager`、`Country`/`Language`、`JsonUtil.parseToClass`、`CommErr`）
- 通信与协议（`ControlCmd` 报文构建与解析、`TypeEnum` 协议枚举、`InfDeviceState` 状态、`InfConstants`/`EventConstants` 事件常量）
- 数据与实体（数据库表配置与字段、`GenericValues`、设备实体、云设备模型）
- 设备与工具（`ArrayBufferUtil`、`StringUtil`、`ClickCheck`、`CountryCodeConfig`、`VirtualBleBroadcast`、BLE/Wi-Fi 常量）

### 3.2 关键风险点

围绕 TV 多协议设备接入场景，重点识别如下风险：

- 多协议（BLE/Wi-Fi/IoT/云）设备发现与连接状态不一致，出现"已显示在线但控制失败"
- 控制报文 `seq`/`sid` 结构错误或 JSON 解析异常，导致控制指令静默丢弃
- 字符串与十六进制互转错误（大小写、`0x` 前缀、奇数长度、非法字符），导致广播数据异常
- BLE 广播长度（37 字节）与 MTU（251）常量漂移，导致设备兼容性问题
- 数据库表名、字段名与实体字段不一致，读写设备库/场景库时丢失或串数据
- 协议、扫描类型、加密类型、连接类型枚举取值漂移，导致设备识别错误
- 首页、附近设备、个人中心页文案资源缺失或未接线，界面出现空白或 `undefined`
- 初次启动隐私页遮挡首页，真机 UI 用例误判或长时间等待
- TV 单 UI 线程下连续按键/连续导航导致焦点丢失或 `THREAD_BLOCK_6S`
- 长链路执行中设备断连，批量测试中断且无重试
- 设备数据源异常（空列表、重复设备、离线残留）未清理，列表展示与统计不一致

这些风险点直接决定了当前测试设计的重点方向。

## 4. 覆盖维度设计

### 4.1 功能正确性

功能测试不只验证"能跑通"，而是拆成可验证的细粒度行为：

- 应用启动冒烟与核心常量可用（`Ability`：`buildQueryStateRequest(1, ['switch'])` 的 seq/sid 结构、`BleConstants`、`WifiConstants`、`VirtualBleBroadcast.getVirtualData()` 长度 37 与前缀 `0xa1a1a1a1a1a1`）
- 首页页签配置正确（`TabConfigTest`：2 个页签、index 为 0/1）
- 首页文案与入口文案正确（`HomeTextsTest`：`ability_label` 为"通用互联"，入口为"附近设备""个人中心"）
- 附近设备页签与解析能力正确（`NearbyDeviceTest`：三个页签文案、`StringUtil`、物模型 `parseProfileServices`、`getImageFromDevice`、特征权限/类型枚举）
- 个人中心页入口与本地化能力正确（`MinePageTest`：六个入口文案、`JsonUtil.parseToClass`、`InternationalManager`、国家与语言实体、`CommErr`）
- 设备操作与流程正确（`ConnectionCore`：设备操作目录/流程/工作流、设备菜单配置、设备项信息模型、输入交互）
- 设备库与场景库字段、实体、云设备模型结构正确
- 资源文案在 `tv` 与 `entry` 两种模块上下文下均可读取

这样可以定位失败点，而不是只得到"主流程失败"的粗粒度结论。

### 4.2 异常流与恢复

异常流设计覆盖：

- 非法/空/结构缺失的报文（`analysisPayload` 输入异常 JSON、缺少 `services`、`sid` 为空）
- 连接中断与错误恢复（`ConnectionErrorRecovery`、`ConnectionInterruptionRecovery`、`ErrorRecovery`、`ExceptionHandling`、`StateRecovery`）
- 离线与断网（`ConnectionOfflineNetwork`、`NetworkConnectivity`）
- 边界值与非法输入（`BoundaryErrorTesting`、`InputValidation`、`KeyCodeValidation`）
- 十六进制非法字符、奇数长度、超长输入（`ArrayBufferUtilTest`）
- 空设备列表、重复设备、离线残留的过滤与清理（`TestDeviceStore`、`DeviceDataSourceValidation`）
- 配置与版本异常（`ConnectionAppVersion`、`ConfigurationManagerValidation`、`ConfigurationChanges`）

恢复类测试要求不仅校验返回值，还要求校验：

- 连接状态机是否回到稳定基线（`TestConnMachine.reset()` 后可重新连接）
- 设备存储是否清理干净（`TestDeviceStore.clear()` 后 `size()` 为 0）
- 重试策略是否按指数退避推进且不超过上限
- 令牌桶在容量耗尽后是否正确拒绝并恢复

### 4.3 并发与长稳

TV 形态下用户可能连续导航、反复进出页面，因此需要覆盖：

- 连接并发与状态竞争（`ConnectionConcurrency`、`ConcurrencyControl`）
- 连接压力（`ConnectionStress`、`PerformanceStress`）
- 长时间运行稳定性（`LongTermStability`、`MemoryLeakDetection`）
- 会话与状态在并发下的隔离（`SessionManagement`、`StatePersistence`）
- 设备资源占用与释放（`DeviceResourceConsumption`、`ResourceManagement`）

长稳测试采用混合动作与重复采样，而不是单一动作一次通过。

### 4.4 性能与兼容性

性能设计不只关注单个耗时值，而是通过以下方式提升充分性：

- 指标统计统一由 `TestMetrics` 完成（record/count/sum/average/max/min），对同一操作序列多次采样，同时校验均值与极值
- 延时与超时边界由 `TestConfigDefaults` 统一约束（超时 2000ms、上限 60000ms、重试 0~10 次）
- 动画、设备、资源等性能套件分别覆盖渲染开销、设备操作开销与资源消耗（`AnimationPerformance`、`DevicePerformance`、`DeviceResourceConsumption`）
- 设备兼容性覆盖默认设备与平板（测试模块 `deviceTypes` 为 `default`、`tablet`），并区分基础与扩展兼容场景（`DeviceCompatibility`、`DeviceCompatibilityExtended`）
- 本地化与网络条件下重复执行（`LocalizationTesting`、`NetworkConnectivity`）

兼容性设计强调多维组合，避免只在默认环境通过。

### 4.5 安全与契约

安全与契约测试设计包含：

- 设备安全与访问控制（`DeviceSecurity`、`SecurityValidation`、`SecurityAccessibility`）
- 应用版本、鉴权会话、会话有效性与通知（`ConnectionAppVersion`、`ConnectionAuthSession`、`ConnectionSessionValidation`、`ConnectionNotification`）
- 数据源与事件工具契约（`DeviceDataSourceValidation`、`DeviceEventToolValidation`）
- 输入与按键校验（`InputValidation`、`KeyCodeValidation`）
- 日志与资源加载（`LoggerValidation`、`ResourceLoaderValidation`）
- 配置、状态与焦点管理契约（`ConfigurationManagerValidation`、`DeviceStateManagerValidation`、`FocusManagerValidation`）
- 事件、指针与动画控制契约（`CommonEventUtilValidation`、`PointerUtilValidation`、`AnimationControllerValidation`）
- 常量与数据库表结构契约（`InfConstants`、`EventConstants`、`TableType`、`DeviceLibraryField`、`SceneLibraryField`）

这一部分用于降低未来版本演进过程中的接口漂移和数据污染风险。

### 4.6 可达性与易用性

针对 TV 端操作特点，测试设计特别覆盖：

- 真机首页可达性（`HomePageUiTest`：标题可见、进入"附近设备"页、进入"个人中心"页、返回首页）
- 焦点导航、焦点环与无障碍（`FocusNavigation`、`FocusRingBehavior`、`AccessibilityNavigation`）
- 按钮、触摸、手势与事件分发（`ButtonInteraction`、`TouchInteraction`、`GestureRecognition`、`EventHandling`、`EventPropagation`）
- 数据绑定、组件渲染与对话框定位（`DataBinding`、`UIComponentRendering`、`DialogPositioning`）
- 内容缩放、主题与视觉效果（`ContentScaling`、`ThemeVariation`、`VisualEffects`）
- 中英文文案与资源可读性（`HomeTextsTest`、`NearbyDeviceTest`、`MinePageTest`、`LocalizationTesting`）

这部分是判断 TV 大屏设备接入应用可用性的重要补充。

## 5. 充分性说明

### 5.1 为什么认为当前测试具备较强充分性

- 覆盖规模明确：85 个套件、1793 个用例，按 12 个目录分组，覆盖连接核心、连接校验、通用校验、交互、生命周期、性能、集成、安全、公共配置、真机场景与纯函数单测
- 覆盖层次完整：共享驱动层、领域契约层、真机场景层、资源文案层、纯函数单测层均有对应测试
- 覆盖维度：功能、异常、并发、性能、契约、无障碍、资源与兼容性均已纳入
- 断言精度较高：大量用例校验常量取值、报文结构、枚举取值、字段名、长度边界与非法输入，而非仅判断"非空"
- 数据校验细化：`ArrayBufferUtilTest` 以 344 个用例穷举十六进制解析与往返边界，是当前用例量最大的单套件
- 资源接线可验证：文案用例直接读取应用模块资源表，可发现文案缺失、id 错配与模块上下文差异
- 执行可运维：`run_ohos_tests.ps1` 支持分批、重试与通过数统计，降低设备断连对整体结果的影响

### 5.2 当前边界与后续方向

- 真机 UI 自动化目前仅 `HomePageUiTest` 一个套件（7 个用例），附近设备扫描、BLE 连接、个人中心页设置与同步等仍依赖手工验证
- 多数质量类套件为领域契约断言，未与真实多设备、真实云端链路联调
- `run_ohos_tests.ps1` 的套件名单仍为 79 个早期套件，`HomePageUiTest`、`TabConfigTest`、`HomeTextsTest`、`NearbyDeviceTest`、`MinePageTest`、`ArrayBufferUtilTest` 尚未加入，需要补充或单独执行
- 后续可优先补充：附近设备扫描与连接的真机 UI 用例、个人中心页语言切换与同步流程用例、局域网设备发现异常流用例

## 6. 当前测试目录与职责

测试代码位于 `product/tv/src/ohosTest/ets/test/`，由 `List.test.ets` 统一注册 83 个逻辑类套件；`HomePageUiTest`（真机 UI）与 `Ability.test.ets` 作为独立套件通过 `-s class` 单独执行，按测试意图分组如下：

| 分组 | 套件数 | 用例数 | 代表套件与职责 |
|---|---|---|---|
| 根目录（启动冒烟） | 1 | 10 | `Ability`：核心常量、协议枚举、报文构建与解析、虚拟 BLE 广播、数据库表配置、设备实体、云设备模型的冒烟校验 |
| 共享驱动 | - | - | `Shared/DeviceTestKit.ets`：设备/场景存储、连接状态机、会话管理、指令编解码、重试与限流、指标统计、十六进制校验、工具类与默认配置 |
| 公共配置与文案 `Common` | 2 | 20 | `TabConfigTest`（10）：首页页签数量与索引；`HomeTextsTest`（10）：`ability_label`、首页三入口文案 |
| 连接核心 `ConnectionCore` | 16 | 216 | `DeviceOperations`、`DeviceOperationFlow`、`DeviceOperationCatalog`、`DeviceOperationWorkflow`、`DeviceModelDeep`、`DeviceItemInfoModel`、`DeviceMenuConfiguration`、`DeviceInputInteraction`、`ConnectionConcurrency`、`ConnectionConsistency`、`ConnectionEndToEnd`、`ConnectionErrorRecovery`、`ConnectionLifecycle`、`ConnectionStateManagement`、`ConnectionStress`、`ConnectionUI`：设备操作、状态迁移、一致性、端到端与压力 |
| 连接校验 `ConnectionValidation` | 8 | 175 | `ConnectionAppVersion`（27）、`ConnectionAuthSession`（26）、`ConnectionSessionValidation`（24）、`DeviceDataSourceValidation`（24）、`ConnectionInterruptionRecovery`（19）、`ConnectionOfflineNetwork`（19）、`ConnectionNotification`（18）、`DeviceEventToolValidation`（18）：版本、鉴权会话、数据源、中断与离线恢复 |
| 通用校验 `Validation` | 11 | 242 | `KeyCodeValidation`（28）、`AnimationControllerValidation`（27）、`CommonEventUtilValidation`（26）、`FocusManagerValidation`（26）、`PointerUtilValidation`（26）、`DeviceStateManagerValidation`（25）、`LoggerValidation`（20）、`BoundaryErrorTesting`（18）、`InputValidation`（16）、`ConfigurationManagerValidation`（15）、`ResourceLoaderValidation`（15） |
| 交互与可达性 `Interaction` | 14 | 192 | `FocusNavigation`（19）、`TouchInteraction`（16）、`EventHandling`（16）、`AccessibilityNavigation`（15）、`ButtonInteraction`（15）、`EventPropagation`（14）、`GestureRecognition`（14）、`FocusRingBehavior`（13）、`UIComponentRendering`（13）、`ContentScaling`（12）、`VisualEffects`（12）、`DataBinding`（11）、`DialogPositioning`（11）、`ThemeVariation`（11） |
| 生命周期与状态 `LifecycleState` | 10 | 164 | `DeviceStateManagement`（22）、`ErrorRecovery`（22）、`ExceptionHandling`（21）、`ExtensionLifecycle`（16）、`ConfigurationChanges`（14）、`LifecycleStateConnectionLifecycle`（14）、`ResourceManagement`（14）、`SessionManagement`（14）、`StatePersistence`（14）、`StateRecovery`（13） |
| 性能与长稳 `PerformanceStability` | 7 | 147 | `AnimationPerformance`（25）、`MemoryLeakDetection`（25）、`PerformanceStress`（24）、`LongTermStability`（19）、`ConcurrencyControl`（18）、`DevicePerformance`（18）、`DeviceResourceConsumption`（18） |
| 集成与场景 `Integration` | 9 | 143 | `SystemIntegration`（17）、`UserScenarios`（17）、`IntegrationTesting`（17）、`AdvancedScenarios`（16）、`ComprehensiveRegression`（16）、`NetworkConnectivity`（16）、`DeviceCompatibility`（15）、`LocalizationTesting`（15）、`DeviceCompatibilityExtended`（14） |
| 安全与合规 `Security` | 3 | 57 | `DeviceSecurity`（19）、`SecurityAccessibility`（19）、`SecurityValidation`（19）：设备安全、安全可达性与契约校验 |
| 真机场景 `Feature` | 3 | 83 | `NearbyDeviceTest`（42）：附近设备页签、BLE/局域网文案、物模型解析；`MinePageTest`（34）：个人中心页入口文案、本地化与 JSON 解析；`HomePageUiTest`（7）：真机首页、附近设备页、个人中心页可达性 |
| 纯函数单测 `Unit` | 1 | 344 | `ArrayBufferUtilTest`：十六进制合法性、解析、格式化与 ArrayBuffer 往返边界 |
| 合计 | 85 | 1793 | 12 个分组，83 个由 `List.test.ets` 注册，`HomePageUiTest`、`Ability` 单独执行 |

## 7. 运行方式

### 7.1 前置条件

1. 使用 DevEco Studio 打开工程并完成本地签名配置。
2. 连接真机或模拟器，确认 `hdc list targets` 能看到目标设备。
3. 构建并安装测试 HAP（测试模块 `tv_test`，`type: feature`，`deviceTypes: default`/`tablet`）。

### 7.2 DevEco Studio

在 `Run/Debug Configurations` 中选择 `ohosTest` 配置，模块选择 `tv`，连接设备后直接运行。

### 7.3 命令行

```bash
# 运行 tv 模块的设备测试（逻辑类套件，不包含 UI 驱动套件）
hvigorw test -p module=tv -p product=default

# 真机执行单个套件
hdc shell "<测试命令> -b <应用Bundle名> -m tv_test -s unittest /ets/testrunner/OpenHarmonyTestRunner -s class HomePageUiTest -s timeout 60000"
```

> 注意：`HomePageUiTest` 会拉起应用并驱动 UiTest，必须与逻辑类套件分开执行（单独一次测试命令），否则应用侧 UI/BLE 主线程任务会干扰后续逻辑用例，出现 `THREAD_BLOCK_6S` 卡死。
>
> 真机/模拟器执行 UI 套件前请保持屏幕常亮，并开启 UiTest 测试模式：
>
> ```bash
> hdc shell param set persist.ace.testmode.enabled 1
> hdc shell power-shell wakeup
> hdc shell power-shell setmode 602
> hdc shell power-shell timeout -o 3600000
> ```

批量执行使用工程根目录脚本：

```powershell
powershell -ExecutionPolicy Bypass -File .\run_ohos_tests.ps1
```

脚本默认连接 `192.168.16.80:6780`，按 `BatchSize=5` 分批执行，每批最多重试 `MaxRetry=3` 次，单批超时 `60000ms`，并通过 `TestFinished-ResultCode` 与 `STATUS_CODE: 0` 统计结果。

### 7.4 新增套件

1. 在对应目录新建 `XxxTest.test.ets`，导出 `export default function xxxTest(): void`。
2. 在 `List.test.ets` 中导入并在 `testsuite()` 内调用。
3. 若需纳入批量脚本，在 `run_ohos_tests.ps1` 的 `$names` 中补充 `describe` 名称（如 `XxxTest`）。

## 8. 结论

`TVOhosConnect` 当前测试设计已经形成"共享驱动 + 领域契约 + 真机场景 + 资源文案 + 纯函数单测"的组合式覆盖结构，共 85 个套件、1793 个用例。该结构具备良好的扩展性、可维护性和风险发现能力，可以作为通用互联 TV 应用后续持续集成、版本回归和测试审计的核心基础。

## 附录：手工用例归档

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|-----------|---------|------|---------|------|------|
| 首页三入口展示 | 1. 真机测试 <br/> 2. 安装应用与测试 HAP <br/> 3. 设备已正常启动 | 启动应用进入首页 | 显示标题"通用互联"及"附近设备""个人中心"两个入口 | 是（`HomePageUiTest`） | Pass |
| 首页进入附近设备 | 1. 真机测试 <br/> 2. 已在首页 | 点击"附近设备" | 进入附近设备页，显示"附近设备""可连接设备(ble本地控)""局域网本地控"页签 | 是（`HomePageUiTest`） | Pass |
| 首页进入个人中心 | 1. 真机测试 <br/> 2. 已在首页 | 点击"个人中心" | 进入个人中心页，显示"点击登录"入口 | 是（`HomePageUiTest`） | Pass |
| BLE 设备扫描 | 1. 真机测试 <br/> 2. 蓝牙已开启并授予权限 <br/> 3. 周围有可发现设备 | 进入"可连接设备(ble本地控)" | 列表展示附近可连接设备，名称与信号强度正常 | 否 | Pass |
| 局域网设备发现 | 1. 真机测试 <br/> 2. 设备与电视处于同一局域网 | 进入"局域网本地控" | 列表展示局域网内可发现设备 | 否 | Pass |
| 设备连接与控制 | 1. 真机测试 <br/> 2. 已发现目标设备 | 点击设备并发起连接，进入控制页操作 | 连接成功并进入控制页，控制指令生效 | 否 | Pass |
| 个人中心页设置项展示 | 1. 真机测试 <br/> 2. 已进入个人中心页 | 浏览设置项 | 显示"设置""语言""关于""设备库同步""场景库同步" | 否 | Pass |
| 语言切换 | 1. 真机测试 <br/> 2. 已进入语言设置 | 切换中英文并返回首页 | 界面文案随资源切换，无空白或 `undefined` | 否 | Pass |
| 设备库同步 | 1. 真机测试 <br/> 2. 已登录账号 | 点击"设备库同步" | 设备库列表完成同步并展示 | 否 | Pass |
| 场景库同步 | 1. 真机测试 <br/> 2. 已登录账号 | 点击"场景库同步" | 场景库列表完成同步并展示 | 否 | Pass |
