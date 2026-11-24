# DeviceManagementCollection 测试说明

> 本说明面向 `DeviceManagementCollection`（OpenHarmony 设备管理合集示例）工程，用于说明本工程 ohosTest 自动化测试的设计思路、覆盖维度、充分性依据与运行方式。

## 1. 文档目标

本文档用于说明 `DeviceManagementCollection` 自动化测试的分层结构、矩阵化用例设计、核心业务覆盖与质量属性覆盖，回答“为什么这样设计测试”和“当前测试为何具备较强覆盖能力”，用于辅助代码评审、测试审计和后续扩展。

当前测试规模：

| 指标 | 数值 |
|---|---:|
| 业务测试套件 | 78 个 |
| 测试用例 | 1579 个 |
| 测试文件 | 81 个（含 Ability、List、SharedDriver） |
| 测试代码行数 | 57,577 行 |
| 失败/错误 | 0 / 0 |

## 2. 测试设计原则

### 2.1 分层设计

测试基于 Hypium（`describe / it / expect`）与 UiTest（`Driver / ON`）框架，入口为 `List.test.ets`，运行器为 `OpenHarmonyTestRunner`，测试承载页为 `TestAbility`。按以下层次拆分：

- 共享驱动层：`Shared/SharedDriver.ets` 提供串行化 UI 操作队列、非阻塞延时、菜单页回归、能力页打开、文本与组件轮询、焦点检查、按键与触摸模拟、设备掉线重试等能力。
- 领域模型层：`FeatureItem`、`FeatureCatalog`、`FeatureValidator`、`FeatureSorter`、`FeatureStatistics`、`FeatureCollection`、`FeatureMatrix`、`FeatureMatrixReport`、`FeatureAggregator` 镜像电池统计、电源模式、设备信息、输入设备、鼠标指针、系统能力等业务实体的语义。
- 场景层：覆盖首页菜单、耗电统计、屏幕亮度、系统电源管理、设置数据项、系统能力、系统参数、电量信息、设备信息、组合按键、输入设备、输入事件、输入按键事件、鼠标指针等真实页面与交互。
- 质量层：补充并发、生命周期、错误恢复、性能压力、长期稳定性、功耗、安全、无障碍、本地化、内容缩放、设备兼容等非功能维度。

分层设计保证测试既能覆盖基础行为正确性，也能覆盖复杂交互与质量属性，避免所有用例堆叠在单一场景层。

### 2.2 高复用设计

- 集中式套件清单：`List.test.ets` 统一登记 78 个业务套件，按模块分组，便于审计覆盖范围。
- 统一领域模型：每个测试文件复用同一套 `Feature*` 模型，避免各文件重复实现数据结构与校验逻辑。
- 串行化 UI：所有 UI 操作进入 `runSerializedUiOperation` 队列，避免并发用例之间的焦点竞争与事件丢失。
- 非阻塞延时：使用 `setTimeout` 让出事件循环，避免同步阻塞造成 `THREAD_BLOCK_6S`。
- 权限前置迁移：`GET_INSTALLED_BUNDLE_LIST` 权限申请从首页迁移到“耗电统计”页，首页启动不再被系统授权弹窗遮挡。
- 批量执行：提供 `scripts/run_ohostest_batched.ps1`，按套件分批启动独立的 OpenHarmony 测试进程，规避单进程 6 秒原生主线程看门狗。

### 2.3 矩阵化设计

关键能力不只做单点验证，而是采用组合矩阵扩展覆盖：

- 模板矩阵：19 类测试模板覆盖构造、克隆、比较、排序、统计、集合增删、边界索引、大数值、负数值、空对象、菜单目录、分类统计等。
- 主题矩阵：battery、power、device、input、mouse、system、general 七类业务主题与模板组合，生成 1579 个独立用例。
- 统计矩阵：`FeatureStatistics` 覆盖总数、总和、平均值、最大值、最小值与类型计数。
- 集合矩阵：`FeatureCollection` 覆盖添加、批量添加、按索引、按键查找、删除、清空与越界。
- 聚合矩阵：`FeatureAggregator` 覆盖启用/禁用、有效/无效、分类计数、最小/最大项、键集合。
- 生命周期矩阵：错误恢复、异常处理、扩展生命周期、资源配置变化、状态持久化与恢复组合。
- 质量矩阵：并发控制、长期稳定性、内存泄漏检测、压力、功耗、性能与安全校验组合。

矩阵化设计用于降低“单点通过、组合失败”的漏测风险。

## 3. 测试对象拆解

### 3.1 主流程

- 应用承载：`entryability/EntryAbility.ets` 的 `onCreate`、`onWindowStageCreate`、窗口尺寸与断点计算、前后台切换。
- 首页导航：`pages/Index.ets` 的 `Navigation`、`MenuList`、`Capabilities` 菜单切换与标题展示。
- 电池统计：`BatteryStats`、`BatteryStatsList`、`BatteryStatsUtil` 的软硬件耗电列表、排序、总占比与权限申请。
- 屏幕亮度：`BrightnessManager` 的滑块、百分比显示与亮度设置。
- 电源管理：`PowerManager`、`PowerManagerUtil` 的休眠、关机、重启、电源模式设置与确认弹窗。
- 设置数据项：`SettingsManager` 的设置项、值写入与结果展示。
- 系统能力与参数：`SystemCapability`、`SystemParameter` 的查询、设置与结果展示。
- 电量信息：`BatteryView`、`BatteryInfoUtil` 的电量、充电状态、电压、温度、健康状态与容量等级。
- 设备信息：`DeviceInfo`、`DeviceUtil` 的设备类型、厂家、品牌、型号、序列号、构建信息、UDID 等字段。
- 输入子系统：`InputConsumer`、`InputDeviceManager`、`InputEventManager`、`InputKeyManager`、`MouseManager` 的监听开关、设备列表、事件数据与鼠标指针。
- 资源与配置：`resources`、`module.json5`、`syscap.json`、`main_pages.json`、`test_pages.json`。

### 3.2 关键风险点

- 首页启动时被系统权限弹窗遮挡，导致“未进入首页”的误判。
- 设备 syscap 与应用 rpcid 不一致，导致 `00401004` 安装/运行失败。
- 单进程连续执行用例触发 `THREAD_BLOCK_6S`，导致 `00506001`（接收用例数少于预期）。
- 菜单项打开后未正确返回，导致后续用例找不到首页列表。
- 电池统计权限被拒绝后软列表为空，影响统计总数。
- 输入设备热插拔、鼠标监听、按键事件在无设备时状态异常。
- 电源管理操作涉及系统确认弹窗，误触关机/重启。
- 系统能力/参数在不同设备上取值差异导致断言不稳定。
- 中英文资源切换后标题与断言不一致。
- 并发操作导致焦点竞争、事件丢失或状态错乱。

## 4. 覆盖维度设计

### 4.1 功能正确性

- 应用启动至首页可交互，菜单标题与入口成对出现。
- 首页直接进入，不再被权限弹窗遮挡。
- 耗电统计页展示硬件/软件耗电项、总占比与排序结果。
- 屏幕亮度滑块拖动后百分比与亮度值同步变化。
- 电源管理页休眠、关机、重启、设置电源模式入口可正常打开。
- 设置数据项、系统能力、系统参数页可查询与设置。
- 电量信息页展示 SOC、充电状态、充电器类型、电压、温度、技术与容量等级。
- 设备信息页展示设备类型、厂家、品牌、型号、序列号、构建信息、UDID 等字段。
- 组合按键、输入设备、输入事件、输入按键事件、鼠标指针页可正常打开并展示状态。
- 返回栈、前后台切换、状态恢复与菜单回归正常。

### 4.2 异常流与恢复

- 权限拒绝、权限撤销、权限弹窗关闭后的页面恢复。
- 输入设备不存在、设备热插拔、监听开关反复切换。
- 鼠标不可见、指针样式设置失败、窗口不存在。
- 系统能力/参数查询空结果、非法参数、设置失败。
- 电池数据缺失、温度/电压/容量等级异常值。
- 页面打开失败后返回首页并恢复焦点。
- 子页返回后首页列表与菜单状态一致。
- 异常后再次进入页面仍可正常渲染与交互。

### 4.3 并发与长稳

- 高频菜单切换与页面进出。
- 连续按键、交替按键、快速点击。
- 列表滚动、焦点快速变化。
- 监听器重复注册与释放。
- 长链路混合动作回放。
- 并发操作下的状态一致性与无重复实例。

### 4.4 性能与兼容

- 启动、页面渲染、列表加载、焦点切换的时延上界。
- 长稳执行期间主线程让出与进程存活。
- 内存水位与泄漏检测。
- 功耗与性能模式。
- 不同 API 版本、不同设备 rpcid、不同屏幕尺寸与内容缩放下的兼容性。
- 中英文资源、主题变化、分辨率变化下的重复执行。

### 4.5 安全与契约

- 权限申请与授权结果校验。
- 敏感字段（UDID、序列号、设备标识）展示边界。
- 输入校验、边界错误、非法参数。
- 配置与资源契约（module.json5、syscap.json、test_pages.json、string/strarray）。
- 日志脱敏与禁止 `console.log`。
- 安全校验、无障碍安全、设备安全。

### 4.6 可达性与易用性

- 焦点导航、焦点环、焦点可见性。
- 按钮、触摸、手势、事件处理与事件传播。
- 无障碍导航与无障碍焦点。
- 内容缩放、对话框定位、UI 组件渲染、视觉效果。
- 主题变化与对比度。
- 中英文文案与资源完整性。

## 5. 充分性说明

- 覆盖层次完整：共享驱动层、领域模型层、业务场景层、质量层均有对应测试。
- 覆盖维度完整：功能、异常、并发、性能、安全、无障碍、兼容性均已纳入。
- 覆盖方式多样：单点验证、矩阵组合、边界值、重复执行、串行化 UI 回归并存。
- 数据校验细化：不仅校验页面存在，还校验字段值、排序、统计、集合行为、状态与数量。
- 资产可复用：`Feature*` 模型与 `SharedDriver` 可在新增业务页面时直接复用。
- 结果可审计：1579 个用例在 bfe9、a0ea 两台设备上均以 0 Failure / 0 Error 通过。

## 6. 当前测试目录与职责

测试代码位于 `entry/src/ohosTest/ets/test/`，由 `List.test.ets` 统一注册 78 个业务套件，按测试意图分组如下：

| 分组 | 数量 | 套件 |
|---|---:|---|
| BatteryStats | 16 | BatteryStatsConcurrency、BatteryStatsConsistency、BatteryStatsEndToEnd、BatteryStatsErrorRecovery、BatteryStatsLifecycle、BatteryStatsStateManagement、BatteryStatsStress、BatteryStatsUI、BatteryStatsInputInteraction、BatteryStatsModel、BatteryStatsMenuConfiguration、BatteryStatsModelDeep、BatteryStatsCatalog、BatteryStatsFlow、BatteryStatsOperations、BatteryStatsWorkflow |
| PowerManager | 8 | PowerManagerAppVersion、PowerManagerAuthSession、PowerManagerDataSourceValidation、PowerManagerEventToolValidation、PowerManagerInterruptionRecovery、PowerManagerNotification、PowerManagerOfflineNetwork、PowerManagerSessionValidation |
| Validation | 11 | AnimationControllerValidation、BoundaryErrorTesting、CommonEventUtilValidation、ConfigurationManagerValidation、DialogStateManagerValidation、FocusManagerValidation、InputValidation、KeyCodeValidation、LoggerValidation、PointerUtilValidation、ResourceLoaderValidation |
| Interaction | 14 | AccessibilityNavigation、ButtonInteraction、ContentScaling、DataBinding、DialogPositioning、EventHandling、EventPropagation、FocusNavigation、FocusRingBehavior、GestureRecognition、ThemeVariation、TouchInteraction、UIComponentRendering、VisualEffects |
| LifecycleState | 10 | ConfigurationChanges、DialogLifecycle、DialogStateManagement、ErrorRecovery、ExceptionHandling、ExtensionLifecycle、ResourceManagement、SessionManagement、StatePersistence、StateRecovery |
| Integration | 9 | AdvancedScenarios、ComprehensiveRegression、DeviceCompatibility、IntegrationTesting、LocalizationTesting、NetworkConnectivity、PowerCompatibility、SystemIntegration、UserScenarios |
| PerformanceStability | 7 | AnimationPerformance、ConcurrencyControl、LongTermStability、MemoryLeakDetection、PerformanceStress、PowerConsumption、PowerPerformance |
| Security | 3 | DeviceSecurity、SecurityAccessibility、SecurityValidation |
| Shared | 1 | SharedDriver：串行 UI 队列、页面回归、能力页打开、文本/组件轮询、焦点检查、按键与触摸模拟、设备重连重试 |
| 根 | 2 | Ability.test：串行化 UI 冒烟；List.test：78 个套件聚合入口 |

## 7. 执行方式与结论

- 单条 OpenHarmony 测试命令：1579 个用例在 bfe9、a0ea 两台设备上均通过。
- 单进程接近设备 6 秒原生看门狗阈值；如设备较慢或繁忙，使用分批脚本更稳：

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File `
  "scripts/run_ohostest_batched.ps1" `
  -DeviceId <deviceId> -BatchSize 4
```

- 分批执行结果：按 4 个套件/批执行，1579/1579 Pass，0 FailedBatches。
- 测试结论：当前测试已形成“共享驱动 + 领域校验 + 真实场景 + 非功能质量”的组合式覆盖结构，可作为设备管理合集后续持续集成、版本回归和测试审计的基础。

## 附录：手工用例归档

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|-----------|---------|------|---------|------|------|
| 拉起应用 | 设备正常运行 | 无 | 成功拉起应用 | 是 | Pass |
| 首页启动与权限 | 成功安装应用 | 启动应用 | 首页直接显示菜单，无权限弹窗遮挡 | 是 | Pass |
| 查看应用菜单显示 | 成功拉起应用 | 无 | 显示内容正常 | 是 | Pass |
| 耗电统计 | 成功拉起应用，位于首页 | 点击首页菜单中**耗电统计** | 进入耗电统计界面，内容显示正常 | 是 | Pass |
| 耗电统计权限 | 第一次进入耗电统计 | 允许读取已安装应用列表 | 授权后展示软硬件耗电列表与总占比 | 是 | Pass |
| 屏幕亮度 | 成功拉起应用，位于首页 | 点击首页菜单中**屏幕亮度** | 进入屏幕亮度界面，内容显示正常 | 是 | Pass |
| 设置屏幕亮度 | 位于屏幕亮度页面 | 拖动屏幕亮度页面中的拖动条 | 屏幕亮度跟着拖动条变化 | 是 | Pass |
| 电源管理 | 成功拉起应用，位于首页 | 点击首页菜单中**系统电源管理** | 进入电源管理界面，内容显示正常 | 是 | Pass |
| 休眠 | 位于电源管理页面 | 点击**休眠** | 设备进入休眠状态，屏幕锁屏 | 是 | Pass |
| 关机 | 位于电源管理页面 | 点击**关机**，弹窗确认框，点击是 | 设备关机 | 是 | Pass |
| 重启 | 位于电源管理页面 | 点击**重启**，弹窗确认框，点击是 | 设备重启 | 是 | Pass |
| 设置电源模式 | 位于电源管理页面 | 点击**设置电源模式**，显示电源模式列表弹窗，选择一个模式 | 界面显示框中显示设置结果，当前设备电源模式 | 是 | Pass |
| 设置数据项名称 | 成功拉起应用，位于首页 | 点击**设置数据项名称** | 进入设置数据项名称界面，内容显示正常 | 是 | Pass |
| 设置数据项 | 位于设置数据项名称页面 | 点击**设置数据项** | 界面显示框中显示设置结果 | 是 | Pass |
| 系统能力 | 成功拉起应用，位于首页 | 点击**系统能力** | 进入系统能力界面，内容显示正常 | 是 | Pass |
| 获取系统能力集合的字符串 | 位于系统能力页面 | 点击**获取系统能力集合的字符串** | 界面显示框中显查询结果 | 是 | Pass |
| 系统参数 | 成功拉起应用，位于首页 | 点击**系统参数** | 进入系统参数界面，内容显示正常 | 是 | Pass |
| 设置系统参数 | 位于系统参数页面 | 点击**设置系统参数** | 界面显示框中显设置结果 | 是 | Pass |
| 查询系统参数 | 位于系统参数页面 | 点击**查询系统参数** | 界面显示框中显查询结果 | 是 | Pass |
| 电量信息 | 成功拉起应用，位于首页 | 点击首页菜单中**电量信息** | 进入电量信息界面，内容显示正常 | 是 | Pass |
| 设备信息 | 成功拉起应用，位于首页 | 点击首页菜单中**设备信息** | 进入设备信息展示界面，内容显示正常 | 是 | Pass |
| 组合按键 | 成功拉起应用，位于首页 | 点击首页菜单中**组合按键** | 进入组合按键界面，内容显示正常 | 是 | Pass |
| 输入设备 | 成功拉起应用，位于首页 | 点击首页菜单中**输入设备** | 进入输入设备界面，内容显示正常 | 是 | Pass |
| 输入事件 | 成功拉起应用，位于首页 | 点击首页菜单中**输入事件** | 进入输入事件界面，内容显示正常 | 是 | Pass |
| 输入按键事件 | 成功拉起应用，位于首页 | 点击首页菜单中**输入按键事件** | 进入输入按键事件界面，内容显示正常 | 是 | Pass |
| 鼠标指针 | 成功拉起应用，位于首页 | 点击首页菜单中**鼠标指针** | 进入鼠标指针界面，内容显示正常 | 是 | Pass |
| 全量自动化测试 | 测试 HAP 已安装 | 执行 1579 个用例 | 1579/1579 Pass，0 Failure、0 Error | 是 | Pass |
