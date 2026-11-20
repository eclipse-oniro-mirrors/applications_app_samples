# UIExtensionAbility 测试说明

> 本说明面向 `UIExtensionAbility`（OpenHarmony UIExtensionAbility 示例工程），用于说明本工程 ohosTest 自动化测试的设计思路、覆盖维度与充分性依据。

## 1. 文档目标

本文档用于说明 `UIExtensionAbility` 自动化测试的设计原则、测试对象、覆盖维度、充分性依据、目录职责与运行结果。文档聚焦“为什么这样设计测试”以及“当前测试为何具备较强覆盖能力”，用于辅助代码评审、测试审计和后续扩展。

## 2. 测试设计原则

### 2.1 分层设计

测试基于 Hypium 框架（入口 `List.test.ets`，运行器 `OpenHarmonyTestRunner`，测试承载 Ability `TestAbility`），并按以下层次拆分，避免所有用例堆叠在单一场景层：

- 共享驱动层：以 `Shared/SharedDriver.ets` 为核心，提供串行化 UI 操作队列 `runSerializedUiOperation`、非阻塞延时 `serializedDelay`、按键序列化 `triggerSerializedKey`、Driver 单例 `getDriver`、组件与文本轮询 `findComponentsByType`、`checkComponentExists`、`extensionComponentCount`、`checkTextContent`、`findTextByLabel`、扩展可见性探测 `isExtensionVisible`、`waitForExtensionStable`、扩展拉起 `launchProviderApp`、`triggerExtension`、按键与触摸模拟 `pressAndWait`、`simulateTouch`、焦点检查 `getCurrentFocusIndex`、`checkFocusState`，以及 `clampValue`、`safeDivide`、`averageOf`、`computeSuccessRate`、`isValidKeyCode`、`repeatText`、`buildWantParameters`、`buildSessionId` 等可复用纯函数
- 领域层：围绕扩展生命周期阶段、会话记录、LocalStorage 键值、代理事件（`REMOTE_READY`、`RECEIVE`、`RESULT`、`RELEASE`）、Want 参数、权限集合、时延与内存采样等纯逻辑展开确定性单元测试；统一由 `ExtensionTestModel` 承载，隔离系统依赖
- 场景层：模拟 UIExtension 页面拉起、会话创建与销毁、扩展页面加载、调用方代理事件链、存储注入与读取、断连释放等真实链路
- 质量层：补充性能时延、压力与长稳、并发一致性、安全与权限、无障碍与焦点、中英文资源与兼容性等非功能维度

该分层设计确保测试既覆盖基础行为正确性，也覆盖复杂交互与质量属性。

### 2.2 高复用设计

测试中大量复用以下设计资产：

- 集中式套件清单：`List.test.ets` 统一导入并注册全部测试套件，同时保留 `Ability.test.ets` 作为扩展事件冒烟入口
- 统一领域模型：所有套件复用 `ExtensionTestModel`，统一建模 `onCreate/onForeground/onBackground/onDestroy`、`onSessionCreate/onSessionDestroy`、`loadContent`、`LocalStorage` 读写、代理事件、权限、时延与内存采样、计数器与重置
- 统一驱动能力：UI 相关套件复用 `SharedDriver` 的页面回归、文本轮询、按键/触摸模拟与串行化队列，避免各套件重复实现 UI 驱动细节
- 串行化 UI 队列：大屏场景依赖单一线程渲染，所有 UiTest 调用与延时进入 `_uiOperationQueue` 串行执行，消除并发用例之间的焦点竞争与事件丢失
- 主线程节流：`serializedDelay` 使用 `setTimeout` 让出事件循环而非同步阻塞，降低长跑时 `THREAD_BLOCK_6S` 看门狗导致的测试进程被杀风险
- 组件计数避坑：`extensionComponentCount` 优先按具名类型统计，避免部分设备不支持 `'*'` 通配查询导致的空结果与全量无障碍树转储开销
- 双语文本候选：文本断言同时兼容中英文资源，保证语言切换后断言仍可命中

通过复用驱动工具、统一模型与串行/节流策略，使测试更容易扩展到更深的参数矩阵和更长的回归链路。

### 2.3 矩阵化设计

关键场景不只测试单点，而是采用组合矩阵扩展覆盖：

- 分类矩阵：`UIExtension` 16、`ExtensionValidation` 8、`Security` 3、`PerformanceStability` 7、`Integration` 9、`Interaction` 14、`Lifecycle` 10、`Validation` 11，共 78 个功能套件
- 会话矩阵：会话 ID 为空/重复/合法 × 活跃数 × 销毁未知会话
- 生命周期矩阵：create/foreground/background/destroy × sessionCreate/sessionDestroy × 阶段顺序
- 存储矩阵：`setOrCreate/get/has/delete/clear/keys/size` × 覆盖写 × 重置恢复
- 代理事件矩阵：`REMOTE_READY/RECEIVE/RESULT/RELEASE` × 事件顺序 × 载荷与释放码
- Want 参数矩阵：`bundleName/abilityName/moduleName/uiExtensionType` × 合法/缺失
- 数值边界矩阵：延迟与内存采样上下界、按键码合法/非法、索引边界、比例计算
- 权限矩阵：授予/撤销/重复授予 × 权限数量
- 长跑矩阵：会话批量创建、事件批量触发、重置后复用

矩阵化设计的意义在于降低“单点通过、组合失败”的漏测风险。

## 3. 测试对象拆解

### 3.1 主流程

主流程测试聚焦以下对象：

- 扩展承载（`uiextensionability/UIExtensionAbility.ets`）：`onCreate`、`onForeground`、`onBackground`、`onDestroy`、`onSessionCreate`、`onSessionDestroy`，以及 `LocalStorage.setOrCreate('session', session)` 注入与 `session.loadContent('pages/Extension')`
- 扩展提供页（`pages/Extension.ets`）：页面标题消息、`onPageShow` 发布 `page_show` 公共事件、从 LocalStorage 读取 session
- 调用方页面（`pages/Index.ets`）：`UIExtensionComponent` 的 Want 参数（bundleName/abilityName/moduleName/uiExtensionType）、`onRemoteReady`/`onReceive`/`onResult`/`onRelease` 回调与状态消息
- 应用承载（`entryability/EntryAbility.ts`）：onCreate/onForeground/onBackground/onWindowStageCreate/onWindowStageDestroy 与 `loadContent('pages/Index')`
- 日志与配置（`model/Logger.ts`、`module.json5`、`syscap.json`、`build-profile.json5`、签名 profile）：hilog 封装、扩展能力声明、设备能力裁剪、SDK 与包名一致性

### 3.2 关键风险点

围绕 UIExtension 场景，重点识别如下风险：

- 扩展冷启动或扩展页面未渲染即被操作，导致事件丢失
- 会话创建失败、重复会话、销毁未知会话导致状态不一致
- `LocalStorage` 键缺失或会话对象未注入，扩展页读取为空
- `loadContent` 页面路径错误或加载失败，扩展页空白
- 代理事件乱序、载荷错误、释放码丢失，调用方状态不更新
- Want 参数缺失或包名/模块名不匹配，扩展无法拉起
- 高频会话/事件操作下的并发竞争与状态污染
- 长跑过程 UI 操作并发、同步阻塞触发 `THREAD_BLOCK_6S`
- 设备 syscap 与应用所需能力不匹配，安装/启动报 `00401004`
- 中英文资源缺失或未绑定字段渲染为 `undefined`/`null`

这些风险点直接决定了当前测试设计的重点方向。

## 4. 覆盖维度设计

### 4.1 功能正确性

功能测试不只验证“页面能看到”，而是拆成可验证的细粒度行为：

- 扩展生命周期回调按序触发，阶段计数与阶段值正确
- 会话创建成功、活跃会话计数正确，销毁后活跃数归零
- 空会话 ID 被拒绝、重复会话 ID 被拒绝、未知会话销毁返回失败
- `LocalStorage` 写入、读取、存在性、删除、清空、键集合与大小正确
- `loadContent('pages/Extension')` 成功后页面记录与计数正确
- 代理就绪、接收、结果、释放四类事件计数、载荷与释放码正确
- 事件顺序与最后一次消息记录一致
- 重置后阶段、会话、存储、事件、权限、计数器全部回到初始状态

这样可以定位失败点，而不是只得到“主流程失败”的粗粒度结论。

### 4.2 异常流与恢复

异常流设计覆盖：

- 空会话 ID、重复会话、未知会话销毁等负向输入
- 空页面路径、空 Want 字段、非法数值范围
- 非法按键码、越界索引、超范围延迟/内存采样
- 会话中断、扩展销毁后的状态恢复
- 存储删除不存在键、重复授予/撤销权限
- 重置后重新创建会话、重新加载页面

恢复类测试要求不仅校验返回值，还要求校验：

- 活跃会话数是否回到一致状态
- 存储键集合与大小是否与操作一致
- 已销毁状态、前台状态、阶段记录是否可预测
- 重置后再次创建会话是否成功

### 4.3 并发与长稳

大屏形态下，用户可能连续触发会话与事件，因此覆盖：

- 批量会话创建与批量事件触发
- 会话创建/销毁交替执行
- 代理事件高频触发与计数一致性
- 长跑前后存储、权限、计数器的一致性
- 长链路执行期间的主线程让出

长稳测试采用混合操作回放，而不是单一动作重复，更贴近真实使用路径。

### 4.4 性能与兼容性

性能设计不只关注单个耗时值，而是通过以下方式提升充分性：

- 记录并校验延迟样本、平均延迟、最大延迟与内存增长
- 采用限时上界与容差断言，适配真机波动
- 对同一操作序列多次采样，避免单次抖动被平均值掩盖
- 覆盖并发控制、压力轮次、长期稳定性、内存泄漏检测、功耗与性能指标
- 在设备兼容、网络、本地化场景下重复执行
- 通过 `syscap.json` 裁剪设备不支持的系统能力，保证安装与启动兼容

### 4.5 安全与契约

安全与契约测试设计包含：

- 权限授予、撤销、去重与权限数量
- exported Want 的 bundleName/abilityName 必填校验
- 会话身份与活跃状态校验
- 输入字符长度、空值、边界值校验
- 资源路径、配置键、事件名契约校验
- 日志脱敏与统一 hilog 输出，禁止 `console.log`

### 4.6 可达性与易用性

针对 UIExtension 交互特点，测试设计特别覆盖：

- 无障碍文本与焦点索引边界
- 焦点导航、焦点环样式与可见性
- 按钮、触摸、手势与事件分发
- 内容缩放、布局与弹窗定位
- 主题变化与视觉效果
- 中英文文案与资源完整性

## 5. 充分性说明

### 5.1 为什么认为当前测试具备较强充分性

当前测试充分性主要来自以下几个方面：

- 覆盖层次完整：从共享驱动层到领域模型层、场景层与质量层都有对应测试
- 覆盖维度：功能、异常、并发、性能、契约、无障碍、资源与兼容性均已纳入
- 覆盖方式多样：单点验证、矩阵组合、压力回放、多采样统计、统一模型隔离并存
- 数据校验细化：不仅校验方法返回值，还校验阶段顺序、事件顺序、计数、载荷、存储键集合与时延上界
- 资产可审计：统一 `ExtensionTestModel` 与 `SharedDriver`，测试意图清晰、可复用、易扩展
- 规模与稳定性：78 个功能套件 + Ability 冒烟套件，共 1171 条用例；在 API 26 `default` 设备上实测全部通过
- 行数约束：每个改造后测试文件的物理行数均不小于对应参考文件，测试目录文本行数约 59,390 行

## 6. 当前测试目录与职责

测试代码位于 `entry/src/ohosTest/ets/test/`，由 `List.test.ets` 统一注册，按测试意图分组如下：

| 分组 | 数量 | 代表套件与职责 |
|---|---|---|
| 共享驱动 | 1 | `Shared/SharedDriver.ets`：串行 UI 队列、页面回归、文本/组件轮询、按键与触摸模拟、焦点检查、时延与容差常量、纯函数工具 |
| 核心扩展（`UIExtension`） | 16 | `UIExtensionConcurrency`、`UIExtensionConsistency`、`UIExtensionEndToEnd`、`UIExtensionErrorRecovery`、`UIExtensionLifecycle`、`UIExtensionStateManagement`、`UIExtensionStress`、`UIExtensionUI`、`SessionInputInteraction`、`ExtensionItemInfoModel`、`ExtensionMenuConfiguration`、`ExtensionModelDeep`、`ExtensionOperationCatalog`、`ExtensionOperationFlow`、`ExtensionOperations`、`ExtensionOperationWorkflow`：生命周期、会话、页面加载、代理事件、并发/一致性/压力、操作目录与工作流 |
| 扩展校验（`ExtensionValidation`） | 8 | `ExtensionAppVersion`、`ExtensionAuthSession`、`ExtensionDataSourceValidation`、`ExtensionEventToolValidation`、`ExtensionInterruptionRecovery`、`ExtensionNotification`、`ExtensionOfflineNetwork`、`ExtensionSessionValidation`：版本、鉴权、数据源、事件工具、中断恢复、通知、离线网络、会话校验 |
| 安全（`Security`） | 3 | `ExtensionSecurity`、`SecurityAccessibility`、`SecurityValidation`：权限、导出 Want、无障碍、输入与会话安全 |
| 性能与稳定（`PerformanceStability`） | 7 | `ExtensionConsumption`、`ExtensionPerformance`、`AnimationPerformance`、`ConcurrencyControl`、`LongTermStability`、`MemoryLeakDetection`、`PerformanceStress`：功耗、性能、动画、并发、长稳、内存泄漏、压力 |
| 集成与场景（`Integration`） | 9 | `Compatibility`、`AdvancedScenarios`、`ComprehensiveRegression`、`DeviceCompatibility`、`IntegrationTesting`、`LocalizationTesting`、`NetworkConnectivity`、`SystemIntegration`、`UserScenarios`：兼容、端到端、回归、设备、本地化、网络、系统联调 |
| 交互（`Interaction`） | 14 | `AccessibilityNavigation`、`ButtonInteraction`、`ContentScaling`、`DataBinding`、`DialogPositioning`、`EventHandling`、`EventPropagation`、`FocusNavigation`、`FocusRingBehavior`、`GestureRecognition`、`ThemeVariation`、`TouchInteraction`、`UIComponentRendering`、`VisualEffects`：事件、焦点、触摸、手势、主题、缩放、渲染 |
| 生命周期（`Lifecycle`） | 10 | `ConfigurationChanges`、`SessionLifecycle`、`SessionStateManagement`、`ErrorRecovery`、`ExceptionHandling`、`ExtensionLifecycle`、`ResourceManagement`、`SessionManagement`、`StatePersistence`、`StateRecovery`：阶段、会话、配置、资源、异常、持久化与恢复 |
| 校验（`Validation`） | 11 | `AnimationControllerValidation`、`BoundaryErrorTesting`、`CommonEventUtilValidation`、`ConfigurationManagerValidation`、`SessionStateManagerValidation`、`FocusManagerValidation`、`InputValidation`、`KeyCodeValidation`、`LoggerValidation`、`PointerUtilValidation`、`ResourceLoaderValidation`：动画、边界、公共事件、配置、会话状态、焦点、输入、按键、日志、指针、资源 |
| 冒烟（根目录） | 1 | `Ability.test.ets`：订阅 `page_show`、Want 参数与包名/命令契约校验；`List.test.ets`：统一注册全部套件 |

## 7. 运行方式与实测结果

构建与运行（以 API 26、`deviceType=default` 设备为例）：

```bash
hvigorw.bat --mode module -p product=default -p module=entry@default,entry@ohosTest assembleHap
hdc -t <serial> install entry/build/default/outputs/default/entry-default-signed.hap
hdc -t <serial> install entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
```

测试通过 `OpenHarmonyTestRunner` 在 `entry_test` 模块中运行。

实测结果：

```text
Tests run: 1171, Failure: 0, Error: 0, Pass: 1171, Ignore: 0
TestFinished-ResultCode: 0
TestFinished-ResultMsg: your test finished!!!
```

说明：

- 工程使用 SDK 18（`UIExtensionComponent` 仅 SDK 18 提供）
- `entry/src/main/module.json5` 的 `deviceTypes` 为 `default/tablet`，与设备一致
- `entry/src/main/syscap.json` 与 `entry/src/ohosTest/syscap.json` 通过 `removedSysCaps` 裁剪设备不支持的系统能力，避免 `00401004`
- 日志统一使用 `@ohos.hilog`，无 `console.log`

## 8. 结论

`UIExtensionAbility` 当前测试设计已形成“共享驱动 + 领域校验 + 真实场景 + 非功能质量”的组合式覆盖结构。该结构具备良好的扩展性、可维护性和风险发现能力，可以作为 UIExtension 示例工程后续持续集成、版本回归和测试审计的核心基础。

## 附录：手工用例归档

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| UIExtensionAbility 页面拉起 | 1. 真机测试<br/>2. 构建并安装测试 HAP<br/>3. 设备正常启动 | 启动应用进入 Index 页面 | 扩展页面在指定位置显示 | 是 | Pass |
| 扩展生命周期回调 | 1. 真机测试<br/>2. 扩展已创建 | onCreate/onForeground/onBackground/onDestroy | 阶段按序执行且状态正确 | 是 | Pass |
| 会话创建与销毁 | 1. 真机测试<br/>2. 扩展进程可用 | onSessionCreate/onSessionDestroy | 会话创建成功、销毁后活跃数归零 | 是 | Pass |
| LocalStorage 共享数据 | 1. 真机测试<br/>2. session 已注入 | setOrCreate/get/has/delete | 键值读写一致 | 是 | Pass |
| 扩展页面加载 | 1. 真机测试<br/>2. 会话创建成功 | loadContent('pages/Extension') | 扩展页加载且计数正确 | 是 | Pass |
| 调用方代理事件 | 1. 真机测试<br/>2. UIExtensionComponent 已挂载 | onRemoteReady/onReceive/onResult/onRelease | 事件顺序、载荷与释放码正确 | 是 | Pass |
| 权限授予与撤销 | 1. 真机测试<br>2. 权限可配置 | 授予/撤销/重复授予 | 权限数量与存在性符合预期 | 是 | Pass |
| 设备能力兼容 | 1. 真机测试<br/>2. 设备已连接 | 安装并启动应用 | 无 00401004，应用可正常启动 | 是 | Pass |
