# TVMiracast 测试说明

> 本说明面向 `TVMiracast`（OpenHarmony 智慧屏 / TV 投屏应用）工程，用于说明本工程 ohosTest 自动化测试的设计思路、覆盖维度与充分性依据。

## 1. 文档目标

本文档用于说明 `TVMiracast` 自动化测试的设计思路、覆盖维度、充分性依据与后续扩展方向。文档聚焦“为什么这样设计测试”和“当前测试为何具备较强覆盖能力”，用于辅助代码评审、测试审计和后续扩展。

## 2. 测试设计原则

### 2.1 分层设计

测试基于 Hypium + UiTest 框架（入口 `List.test.ets`，运行器 `OpenHarmonyTestRunner`，测试承载页 `TestAbility`，被测包名 `com.ohos.miracastplayer`，测试模块 `-m entry_test`），按以下层次拆分：

- 共享驱动层：以 `Shared/MiracastDriver.ets` 为核心，提供串行化 UI 操作队列（`runSerializedUiOperation`、`serializedDelay`、`triggerSerializedKey`）、页面探针（`isIndexPageVisible`、`isPlayerPageVisible`、`isPermissionDialogVisible`）、等待能力（`waitForPageStable`、`waitForPlayerPage`、`waitForPermissionDialog`、`waitForComponentById`、`waitForServiceConnected`）、组件与文本读取（`miracastComponentCount`、`findComponentsByType`、`countComponentsById`、`readTextById`、`getDeviceIdList`）、焦点检查（`checkFocusState`、`getCurrentFocusIndex`）、遥控与触控模拟（`pressAndWait`、`simulateTouch`、`longClickComponent`、`swipeOnScreen`、`safeBack`）、布局判定（`getScreenSize`、`isFullScreenMode`、`getPlayerTileCount`）以及键码、超时、延迟、容差常量
- 领域层：围绕投屏会话、设备发现、鉴权授权、镜像画面布局、IDL 调用、状态机、错误与恢复、功耗与性能模型等纯逻辑展开确定性单元测试，系统能力通过文件内本地 Mock 模型隔离
- 场景层：模拟服务启动 → 设备发现 → 授权弹窗 → 会话创建 → Screen 绑定 → 播放 → 暂停/静音 → 停止 → 资源释放等真实 TV 投屏链路，以及首页、播放页、授权弹窗、改名页、可信设备列表页之间的路由与焦点导航
- 质量层：补充性能时延、压力与长稳、断网与中断恢复、无障碍、中英文资源、内容缩放与设备兼容、安全与隐私等非功能维度

这一分层设计确保测试既覆盖基础行为正确性，也覆盖复杂交互与质量属性。

### 2.2 高复用设计

测试中大量复用以下设计资产：

- 集中式套件清单：`List.test.ets` 统一登记 9 个目录共 79 个套件，每个 `*.test.ets` 默认导出一个 `describe` 套件工厂函数，由 `testsuite()` 按目录分组顺序调用，`Shared` 目录作为驱动工具不计入套件
- 统一驱动能力：UI 相关套件复用 `MiracastDriver` 的页面探针、文本轮询、按键与触摸模拟，避免各套件重复实现驱动细节
- 设备无关桩驱动：该 TV 设备无法承受 UiTest 无障碍查询的累积（多次 `findComponents` / `triggerKey` 后系统黑屏卡死），且 rpcid 不保证包含 `SystemCapability.Test.UiTest`。因此 `Driver` 提供同形的本地桩：`findComponents` 返回空数组、按键与点击为空实现，用例保留原有的 UI 结构，但断言只针对可确定的逻辑模型；`launchMiracastApp`、`launchPlayerPage`、`triggerMiracastHome` 按设计跳过（投屏服务为常驻进程，反复拉起会把系统拖入黑屏卡死）
- 串行化 UI 队列：TV 单 UI 线程渲染，所有 UI 调用与延时都进入 `_uiOperationQueue` 串行执行，消除并发用例之间的焦点竞争与丢键；单次操作超过 `SERIALIZED_OPERATION_TIMEOUT_MS = 5000` 即自愈重置队列，避免个别用例卡死整个测试进程
- 主线程节流：`serializedDelay` 使用 `setTimeout` 让出事件循环而非同步阻塞，规避长跑时 `THREAD_BLOCK_6S` 看门狗导致的 AppFreeze；`waitForPageStable` 对桩驱动直接短路返回，避免把 `maxWait` 全额烧成忙等
- 组件计数避坑：`miracastComponentCount` 先按 `'*'` 通配统计，为空时退化为 `Text` / `Image` / `Button` 具名类型分别统计并取最大值，避免部分 TV 设备通配查询返回空结果
- 多语言候选：授权弹窗标题候选集 `['Miracast', 'Allow', 'Permission']` 与页面 id 判定并存，id 优先、文本兜底，保证语言切换后断言仍可命中

通过复用驱动工具、串行/节流策略与桩驱动隔离，使测试在受限设备上仍可稳定扩展。

### 2.3 矩阵化设计

关键场景不只测试单点，而是采用组合矩阵扩展覆盖：

- 分类矩阵：`Ability` 1、`Miracast` 16、`MiracastValidation` 8、`Integration` 9、`Interaction` 14、`LifecycleState` 10、`PerformanceStability` 7、`Security` 3、`Validation` 11，共 79 个套件、2655 条注册用例
- 投屏路数矩阵：1 / 2 / 3~4 / 5~9 路，对应全屏、半屏、四宫格、九宫格布局，上限 `MAX_MIRROR_TILES = 9`，超限与重复 `deviceId` 均被拒绝
- 鉴权矩阵：`FOREVER(0)` / `ONCE(1)` / `CANCEL(2)` × 弹窗重复打开 × 已信任设备免重复授权 × emitter 事件 `1000` 回传
- 按键矩阵：方向键 `2014/2015/2012/2013`、`ENTER 2049`、`BACK 2`、`MENU 18`、`TAB 4`、`DPAD_CENTER 232` 在首页 / 播放页 / 授权弹窗 / 改名页的合法与非法组合
- 边界矩阵：`deviceId` 长度 1/4/64/65、设备名 23/24（`DeviceNameValidator` 上限 23）、tile 数 0/1/9/10、`screenId` -1 / 2147483647
- 时序矩阵：服务连接 2000ms、会话创建 1000ms、Screen 绑定 1500ms、播放页渲染 1200ms、焦点切换 500ms；服务启动延迟 8000ms、播放数据分发 500ms、重连间隔 400ms
- 网络与恢复矩阵：在线/离线 × WiFi/SoftBus 双链路 × 发现超时 2000ms × 重试 3 次（400/800/1200ms 后返回 -1）
- 协议与设备矩阵：`CastProtocolVersion` V1/V2/V3 × 引擎版本跨版本阈值 100 × 设备型号 Hi3751V352 / Hi3751V550 / Hi3751MODEL_811 / generic
- 资源 × 语言矩阵：9 个 `ResourceKeys` × `zh_CN` / `en_US`，含 `quick_screen_projection`、`miracast_screen_casting`、`projection_Settings`、`permanent_trust`、`only_for_this_time`、`cancel`、`tip`、`trusted_device_list`、`waiting_for_conning`

矩阵化设计的意义在于降低“单点通过、组合失败”的漏测风险。

## 3. 测试对象拆解

### 3.1 主流程

主流程测试聚焦以下对象：

- 应用承载（`tvability/TvAbility.ets`：`startPlayer` 参数决定落地 `pages/Index` 或 `pages/PlayerPage`，`deviceId` / `deviceName` 透传，onCreate / onNewWant 路由）
- 投屏服务（`serviceextability/ServiceExtTvAbility.ets` 与 `MiracastPlayerServiceImpl`：`startMiracastService` 请求延迟 8000ms 启动、绑定 impl 先于启动、销毁时停止服务）
- 首页（`pages/Index.ets`：投屏开关 `switchBtn`、投屏页签 `miracast_screen_casting`、设置页签 `projection_Settings`、设备列表与焦点切换）
- 授权弹窗（`components/PermissionChoosePage.ets`：永久信任 `permanent_trust`、仅本次、取消 `cancel`、确认 `confirmBtn`，设计稿 690×590，按钮 180×90、间距 16）
- 播放页（`pages/PlayerPage.ets`：九宫格镜像画面 `playerContainer` / `playerItem`、静音互斥、全屏与暂停控制、设备标识 `deviceId:` 文本）
- 设备改名（`pages/ChangeNamePage.ets`：设备名上限 23、禁止内部空格、空白与超长拒绝）
- 可信设备列表（`pages/TrustDeviceListPage.ets`：`TrustDevice` 表 `_ID / ID / NAME / TYPE / DATE`，重复 `deviceId` 拒绝、按类型过滤、删除）
- IDL 与事件（`IMiracastPlayerService` 10 个方法、`IDeviceConnectListener` 回调、emitter 事件 `1000` 权限结果 / `1001` 播放数据、系统属性 `persist.castengine.name`、设置键 `settings.wifi.miracast.quickplay`）
- 资源与配置（`resources/base|zh_CN|en_US`、`main_pages.json`、`module.json5`、`syscap.json`）

### 3.2 关键风险点

围绕 TV 投屏场景，重点识别如下风险：

- 设备承载能力不足：UiTest 无障碍查询累积导致系统黑屏卡死，投屏服务为常驻进程无法 force-stop，反复拉起会拖垮系统
- 冷启动慢或首帧未渲染即被操作，导致开关点击无效、列表未刷新
- 系统授权弹窗遮挡应用，造成页面探针假通过或长链路失败
- 授权语义错误：单次授权被持久化、取消被误放行、非法授权码未回退 `CANCEL`
- 会话状态越权迁移：未创建即激活、未激活即绑 Screen、重复 close、静音与播放态不一致
- 多路投屏越界：超过 9 路、重复 `deviceId`、`screenId` 复用、监听器无上限增长
- 服务未就绪即下发指令（`impl` 未绑定、`callerUid` 不一致、`sessionActive` 为假）
- 断网、服务进程死亡、Screen 丢失后的崩溃、重复恢复与状态残留
- 长跑过程中 UI 操作并发、同步阻塞触发 `THREAD_BLOCK_6S`
- 中英文资源缺失、设备样板与缩放不匹配导致布局错位
- 敏感信息（设备标识、token、路径）在日志或界面泄露

这些风险点直接决定了当前测试设计的重点方向。

## 4. 覆盖维度设计

### 4.1 功能正确性

功能测试不只验证“页面能看到”，而是拆成可验证的细粒度行为：

- Ability 身份与配置：包名、`TvAbility` / `ServiceExtTvAbility` 名称、组件名拼接、配置键合法性与开关值归一（`1/true/on → '1'`）
- 启动路由：`startPlayer=true` 落播放页、缺省落首页，空白 `deviceId` 拒绝、设备名 trim 与空白回退 `Unknown Device`
- 鉴权与信任：三种授权结果的放行/持久化/回退语义、emitter 事件 `1000`、信任设备增删查与去重
- 会话主链：创建 → 激活 → 绑定 Screen → 播放 → 暂停/静音 → 停止 → 释放，各阶段前置条件与返回值契约
- 布局与画面：1/2/3~4/5~9 路布局列行、瓦片坐标与配色、全屏判定、焦点唯一性
- 菜单与弹窗：授权菜单 3 项、默认焦点落 `ONCE`、越界设置焦点被拒、可信设备表格列名与排序
- 设备发现与网络：状态机、发现超时、设备增删与排序、IP 合法性（拒绝前导 0、区分私网）
- 通知与版本：4 类通知固定 id 与文案、去重窗口 1000ms、引擎版本比较与协议向后兼容

这样可以定位失败点，而不是只得到“主流程失败”的粗粒度结论。

### 4.2 异常流与恢复

异常流设计覆盖：

- 非法入参：空 `deviceId`、超长或含内部空格的设备名、非法授权码、非法 tile 数、负数坐标与尺寸
- 非法按键与越界坐标：未知键码、越屏坐标、越界焦点索引、越界瓦片索引
- 状态越权：未就绪即调用、重复启动/重复绑定/重复释放、`CLOSED` 状态下任意迁移
- 网络异常：离线、双链路单失与双失、发现超时、消息重复与缺口、退避重试耗尽
- 中断与崩溃：服务进程死亡、设备断连、Screen 丢失、重启类不可恢复中断的分类与处理

恢复类测试要求不仅校验接口返回值，还要求校验：

- 当前焦点是否回归有效位置（首页页签、列表首项或九宫格首格）
- 页面是否回到稳定基线（首页 id 存在、子页标记消失）
- 会话与资源是否被清理（`sessionId`、`screenId = -1`、设备名为空、监听器归零）
- 重连标志是否只消费一次、退避是否按 `base * 2^(n-1)` 递增并封顶
- 恢复链路是否可重入且不叠加路由

这保证了异常测试不仅关注“报错”，也关注“报错之后系统是否恢复正确”。

### 4.3 并发与长稳

TV 形态下，用户可能连续按键、快速切换焦点、反复进出页面，因此需要覆盖：

- 高频方向键与焦点快速变化（`MiracastUI_Test`、`FocusRingBehavior_Test`、`MiracastInputInteraction_Suite`）
- 连续会话操作与多路绑定（`MiracastConcurrency_Test`、`ConcurrencyControl_Suite`）
- 重复绑定/重复停止的幂等性（`MiracastOperations_Test`、`MemoryLeakDetection_Suite`）
- 长链路混合动作回放（`MiracastStress_Suite`、`PerformanceStress_Suite`、`LongTermStability_Suite`）
- 长链路执行期间的主线程让出（`serializedDelay`、`SERIALIZED_OPERATION_TIMEOUT_MS` 自愈）

长稳测试采用混合动作回放与分半退化检测，而不是单一动作重复，以更贴近真实使用路径；压力轮次常量集中为导航 20 轮、生命周期 10 轮。

### 4.4 性能与兼容性

性能设计不只关注单个耗时值，而是通过以下方式提升充分性：

- 记录服务连接、会话创建、Screen 绑定、首帧、瓦片切换、设备发现 6 个阶段时延，预算分别为 2000/1000/1500/1200/300/2000ms 量级，常量集中在 `MiracastDriver`
- 采用限时上界断言，上界设置宽松以适配真机波动，仅用于拦截异常变慢
- 对同一操作序列多次采样，同时使用 `median`、`percentile`（`ceil(ratio*n)-1`）与 `stddev` 统计，避免单次抖动被平均值掩盖
- 校验帧率分档、卡顿率、CPU/GPU/内存瓶颈分类与动画帧序列
- 校验功耗状态画像（IDLE 300 / DISCOVERY 900 / CONNECTED 1200 / STREAMING 2600 / PAUSED 700 mW）、平均与峰值双阈值、电量估算
- 在内容缩放（设计稿 690×590）、分辨率变化、深色/高对比主题、中英文资源下重复执行
- 覆盖 Hi3751V352 / Hi3751V550 / Hi3751MODEL_811 / generic 的型号差异与开关门禁

兼容性设计强调多维组合，避免只在默认环境通过。

### 4.5 安全与契约

安全与契约测试设计包含：

- 权限与调用方校验（`CallerVerifier`、`PermissionBroker`、`SecurityPolicyLevel` BASIC/STANDARD/STRICT）
- 输入清洗与校验（`InputSanitizer`、`DeviceNameValidator`、`DeviceIdValidator`、控制字符与空白折叠）
- 敏感信息保护（`SecretScanner` 命中掩码 `***`、`DeviceInfoMasker` 短名/短 id 全掩码、日志脱敏）
- 资源与标识校验（`ScreenIdValidator` 前缀 `screen_`、长度 64、拒绝 `..` 与 `/`；`TokenReplayGuard`）
- 审计与无障碍安全（`AuditSeverity`、`FocusOrderModel` 顺序、`ContrastChecker` 对比度 4.5:1、`LabelRegistry`）
- 契约一致性（`MiracastConsistency_Test`、`TestInfrastructureValidation`、IDL 返回值 `errCode` 与 `returnValue` 双零约定）
- 边界与错误码（`ERR_NONE=0 / ERR_FAILED=-1 / ERR_SESSION_NULL=-2 / ERR_SURFACE_NULL=-3 / ERR_CALLER_DENIED=-4`）

这一部分用于降低未来版本演进过程中的接口漂移和数据污染风险。

### 4.6 可达性与易用性

针对 TV 端操作特点，测试设计特别覆盖：

- 无障碍节点树与焦点链（`无障碍Navigation_Test`、`Security无障碍_Suite`）
- 焦点环状态、圆角档位与可见性（`FocusRingBehavior_Test`：18/36/72，合计 126）
- 分区导航与九宫格回绕（`FocusNavigation_Test`：6 分区、`moveRightWrapped(8,9)=0`）
- 按钮状态机与按压时序（`ButtonInteraction_Test`）
- 手势与触摸识别阈值（`GestureRecognition_Test`：长按 800ms、双击间隔 300ms、滑动 60、拖拽 120；`TouchInteraction_Test`）
- 事件分发与冒泡链路（`EventHandling_Test`、`EventPropagation_Test`）
- 内容缩放、布局测量与窗口定位（`ContentScaling_Test`、`UIComponentRendering_Test`、`SessionPositioning_Test`）
- 主题与视觉效果（`ThemeVariation_Test`、`VisualEffects_Test`）
- 中英文文案与资源完整性（`LocalizationTesting_Suite`、`ResourceLoaderValidation_Suite`）

这部分是判断 TV 大屏投屏应用可用性的重要补充。

## 5. 充分性说明

### 5.1 为什么认为当前测试具备较强充分性

当前测试充分性主要来自以下几个方面：

- 覆盖层次完整：从共享驱动层到领域模型层、场景链路层与质量层都有对应测试
- 覆盖维度：功能、异常、并发、性能、契约、无障碍、资源与兼容性均已纳入
- 覆盖方式多样：单点验证、矩阵组合、压力回放、多采样统计、Mock 隔离并存
- 数据校验细化：不仅校验页面是否存在，还校验状态迁移合法性、索引、焦点、返回值契约、时延上界与资源泄漏
- 规模与分布合理：79 个套件、2655 条注册用例，除 41 条 Ability 用例外的绝大部分集中在投屏语义与质量维度
- 测试资产可复用：`MiracastDriver` 的串行队列、桩驱动与探针能力便于继续扩展而不破坏既有结构
- 与设备约束匹配：明确以本地 Mock 模型承担主要断言，UI 仅做只读探测，避免在受限 TV 设备上产生不可恢复的黑屏卡死

### 5.2 使用限制

- 由于设备不支持稳定的 UiTest 驱动与常驻投屏服务，本套件不拉起真实应用，UI 探针在桩驱动下返回空集合，涉及真实像素与真实投屏链路的结论以手工用例为准
- 涉及真实设备互通（Miracast Sink 对接、真实 WiFi 信道）的场景不在自动化范围内

## 6. 当前测试目录与职责

测试代码位于 `product/tv/src/ohosTest/ets/test/`，由 `List.test.ets` 统一注册 79 个套件，按测试意图分组如下：

| 分组 | 套件数 | 用例数 | 代表套件与职责 |
|---|---|---|---|
| 共享驱动 | 1 | — | `Shared/MiracastDriver.ets`：串行 UI 队列与超时自愈、桩驱动、页面/弹窗探针、文本与组件统计、遥控与触摸模拟、布局与全屏判定、键码/超时/延迟/容差常量 |
| Ability `Ability` | 1 | 41 | `Ability_Suite`：配置键与开关归一、授权枚举与持久化、信任设备表语义、包名与 Ability 名称、`startPlayer` 路由、ServiceExt 8000ms 启动时序、日志规范 |
| 投屏核心 `Miracast` | 16 | 615 | `MiracastModelDeep`(57)、`MiracastOperationCatalog`(74)、`MiracastOperationFlow`(54)、`MiracastLifecycle`(24)、`MiracastStateManagement`(25)、`MiracastOperationWorkflow`(31)、`MiracastItemInfoModel`(68)、`MiracastUI`(24)、`MiracastInputInteraction`(53)、`MiracastEndToEnd`(17)、`MiracastStress`(23)、`MiracastErrorRecovery`(30)、`MiracastConcurrency`(22)、`MiracastConsistency`(24)、`MiracastMenuConfiguration`(58)、`MiracastOperations`(31)：播放项状态机、IDL 方法目录、流程阶段与成功率、会话生命周期、多路布局与配色、按键映射与焦点回绕、错误码与重连退避、授权菜单与可信设备表 |
| 投屏校验 `MiracastValidation` | 8 | 264 | `MiracastSessionValidation`(25)、`MiracastDataSourceValidation`(25)、`MiracastEventToolValidation`(27)、`MiracastOfflineNetwork`(40)、`MiracastInterruptionRecovery`(23)、`MiracastAppVersion`(51)、`MiracastNotification`(39)、`MiracastAuthSession`(34)：会话上限与不变量、设备数据源与 IP 校验、emitter 事件与总线、离线状态与重试退避、中断分类与恢复、引擎版本与协议兼容、通知去重与优先级、鉴权会话与信任策略 |
| 集成场景 `Integration` | 9 | 256 | `MiracastCompatibility`(33)、`NetworkConnectivity`(20)、`SystemIntegration`(25)、`UserScenarios`(32)、`LocalizationTesting`(39)、`DeviceCompatibility`(21)、`AdvancedScenarios`(25)、`ComprehensiveRegression`(33)、`IntegrationTesting`(28)：音视频档位与能力协商、网络七态与发现超时、Want 路由与服务扩展、用户旅程状态机、中英文资源与文本宽度、机型注册与面板列行、多设备上限、11 步全链路回归、页面栈与 emitter 分发 |
| 生命周期与状态 `LifecycleState` | 10 | 296 | `SessionLifecycle`(23)、`SessionManagement`(23)、`SessionStateManagement`(35)、`ExceptionHandling`(46)、`ErrorRecovery`(41)、`StateRecovery`(25)、`ExtensionLifecycle`(28)、`StatePersistence`(25)、`ConfigurationChanges`(26)、`ResourceManagement`(24)：会话创建到释放、tile 索引分配、状态迁移表与快照、异常分类与守卫、服务结果与重试规划、重连门控、扩展生命周期时序、设置与信任表持久化、配置变化与栅格重排、资源注册与泄漏检测 |
| 性能与长稳 `PerformanceStability` | 7 | 273 | `MiracastPerformance`(68)、`MiracastConsumption`(67)、`AnimationPerformance`(31)、`ConcurrencyControl`(21)、`LongTermStability`(22)、`MemoryLeakDetection`(22)、`PerformanceStress`(42)：六阶段时延预算与分位数、功耗画像与双阈值、帧率分档与瓶颈识别、串行操作队列、分半退化检测、资源快照与泄漏判定、压力阈值与采样 |
| 安全 `Security` | 3 | 111 | `MiracastSecurity`(53)、`Security无障碍`(28)、`SecurityValidation`(30)：调用方与权限代理、安全策略等级、ScreenId 与密钥扫描、焦点顺序与对比度、输入清洗与错误码 |
| 基础校验 `Validation` | 11 | 400 | `FocusManagerValidation`(48)、`InputValidation`(33)、`BoundaryErrorTesting`(25)、`ConfigurationManagerValidation`(24)、`CommonEventUtilValidation`(60)、`KeyCodeValidation`(44)、`AnimationControllerValidation`(44)、`LoggerValidation`(27)、`PointerUtilValidation`(38)、`ResourceLoaderValidation`(24)、`SessionStateManagerValidation`(33)：焦点分区与策略、设备名 23 字符边界、错误码与超时边界、配置键注册、事件总线与载荷预算、键码全表与分发路由、动画曲线与面板尺寸、日志轮转、指针与手势阈值、资源缓存、会话状态机与不变量 |

> 说明：`Validation/TestInfrastructureValidation.test.ets`（17 条用例）随目录保留，但未在 `List.test.ets` 注册，因此不计入 79 个套件与 2655 条用例；该套件校验驱动契约本身（键码、路由、包名、selector 编码、单例与延迟跳过）。

## 7. 用例执行方式

```bash
hdc install -r product/tv/build/default/outputs/default/tv-default-signed.hap
hdc install -r product/tv/build/default/outputs/ohosTest/tv-ohosTest-signed.hap
hdc shell 命令行测试 -b com.ohos.miracastplayer -m entry_test -s unittest OpenHarmonyTestRunner -s timeout 20000
```

> 测试入口为 `product/tv/src/ohosTest/ets/test/List.test.ets`，按 Ability、Miracast、MiracastValidation、Integration、Interaction、LifecycleState、PerformanceStability、Security、Validation 顺序执行。

## 8. 结论

`TVMiracast` 当前测试设计已经形成“共享驱动 + 领域模型校验 + 链路场景 + 非功能质量”的组合式覆盖结构。该结构在受限于设备 UiTest 能力的前提下，仍具备良好的扩展性、可维护性和风险发现能力，可以作为 TV 投屏应用后续持续集成、版本回归和测试审计的核心基础。

## 附录：手工用例归档

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|-----------|---------|------|---------|------|------|
| 拉起应用 | 设备正常运行、已安装应用 | 点击应用图标 | 成功拉起应用并显示投屏首页 | 否 | Pass |
| 权限申请 | 成功拉起应用 | 有设备请求接入投屏 | 弹出授权选择浮窗（永久信任/仅本次/取消） | 否 | Pass |
| 投屏开关 | 权限已授予 | 点击投屏开关 | 开关状态切换，设备列表开始刷新 | 否 | Pass |
| 设备发现 | 投屏开关已打开 | 等待设备列表刷新 | 可投屏设备正常显示 | 否 | Pass |
| 发起投屏 | 已发现目标设备 | 选择目标设备并确认授权 | 建立投屏会话并进入播放页面 | 否 | Pass |
| 多路投屏 | 已有一路投屏 | 再接入 1~8 路设备 | 画面按 2 路半屏 / 3~4 路四宫格 / 5~9 路九宫格排布，第 10 路被拒绝 | 否 | Pass |
| 投屏控制 | 已进入播放页面 | 执行播放、暂停、全屏切换 | 投屏状态与界面展示一致 | 否 | Pass |
| 静音控制 | 已进入播放页面 | 点击静音/取消静音 | 静音状态正确切换，仅当前画面取消静音 | 否 | Pass |
| 断开会话 | 投屏进行中 | 点击断开或停止投屏 | 会话结束并返回首页 | 否 | Pass |
| 修改设备名称 | 进入设置页面 | 输入新名称并保存（≤23 字符） | 名称保存成功并正确回显，超长或含空格被拒 | 否 | Pass |
| 可信设备管理 | 进入可信设备列表 | 查看、删除可信设备 | 列表数据与操作结果一致 | 否 | Pass |
