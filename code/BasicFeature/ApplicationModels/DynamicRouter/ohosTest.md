# DynamicRouter 测试说明

> 面向 `DynamicRouter`（OpenHarmony 动态路由示例，bundle `com.samples.navigation`）的 ohosTest 自动化测试设计说明。

## 1. 文档目标

说明本工程自动化测试的设计思路、覆盖维度、充分性依据与扩展方向，辅助评审、审计与持续回归。

## 2. 测试设计原则

### 2.1 分层设计

基于 Hypium（入口 `List.test.ets`，运行器 `testrunner/OpenHarmonyTestRunner`，承载页 `TestAbility`）分层：

- 共享驱动层：`Shared/SharedDriver.ets`（导航常量、串行化操作 `runSerializedUiOperation`、延时 `serializedDelay`、导航 `navigateTo/backToHome`、`RouteVisitTracker`）。
- 领域层：路由域模型 `RouteScenario`、`RouteUrlParser`、`BuilderRegistry`、`NavStackModel`、`HarInitResolver`、`PageCatalog`、`RouteStats`、`RouteNameValidator`，对应 `RouterModule` 语义。
- 场景层：首页入口、HarA/HarB 互跳、返回栈、无效 URL、空栈出栈。
- 质量层：性能/长稳、异常恢复、命名与参数校验、交互/无障碍、资源与设备兼容、安全。

### 2.2 高复用设计

- `List.test.ets` 统一注册 78 个套件 + `Ability.test`（79 个默认导出）。
- 各套件复用 `RouteScenario` 断言 builder/router 注册、栈深度、栈顶、URL 解析。
- 路由栈单例语义，避免并发入栈竞争。
- 每文件行数不小于对应参考文件，用例按参考规模分配（总计约 2000 例）。

### 2.3 矩阵化设计

- 分类：Navigation 16、Interaction 14、LifecycleState 10、Validation 11、Integration 9、RouterValidation 8、PerformanceStability 7、Security 3（共 78 套件）。
- URL：`HarA/HarB` × `page1..3` × builder 名（合法/非法）。
- 栈：`push/pop/clear/depth/top` × 空/单/多。
- 注册：`registerBuilder/createRouter/hasBuilder/getBuilder` × 同名/异名。
- 页面：6 个目标标题 × 6 个入口按钮成对校验。

## 3. 测试对象拆解

### 3.1 主流程

- 应用承载：`entryability/EntryAbility.ts`（`windowStage.loadContent('pages/Index')`、onCreate/onForeground/onBackground）。
- 首页：`pages/Index.ets`（`NavIndex`、6 个入口按钮、`HapA_Router` 路由栈 `createRouter`）。
- 路由模块：`RouterModule/src/main/ets/utils/RouterModule.ets`（`builderMap/routerMap`、`registerBuilder/getBuilder/createRouter/getRouter/push/pop/clear`）。
- HAR 页面：`harA`/`harB`（`Index.harInit` 按 page1..3 动态导入，`harBuilder` 注册 `HarA_Page*_Builder`/`HarB_Page*_Builder`）。
- 资源与配置：`module.json5`、`main_pages.json`、`syscap.json`、`AppScope/app.json5`。

### 3.2 关键风险点

- 冷启动首帧未渲染即操作，入口点击无效。
- 路由栈未注册或名称不一致，`push` 后不跳转。
- URL 解析错误导致跳转目标错误。
- 页面栈未清理导致返回异常或内存增长。
- builder 重名/未注册导致 `getBuilder` 为空。
- `harInit` 路径映射遗漏导致动态 import 失败。
- 空栈 pop/clear 边界行为不一致。
- 资源缺失/未绑定字段渲染异常。
- 长链路执行触发主线程阻塞或看门狗。
- 中英文资源切换后文案不一致。

## 4. 覆盖维度设计

### 4.1 功能正确性

- 启动至首页可交互，6 个入口按钮与目标标题成对出现。
- `registerBuilder/getBuilder` 注册与查询一致。
- `createRouter` 创建路由栈，`addToStack/depth/top/pop/clear` 正确。
- `push` 的 URL 解析：`HarA/HarB`、`page1..3`、`HapA_Router`、`HarA_Page*_Builder`/`HarB_Page*_Builder`。
- `harInit` 对 page1..3 的路径映射与 `.ets` 导入路径。
- 首页→HarA、HarA→HarB、HarB→首页 跨 HAR 跳转。
- 中英文资源切换后文案与断言一致。

### 4.2 异常流与恢复

- 非法 URL（缺分隔符/非法 builder）解析为空。
- 未注册 builder/未创建 router 的查询与操作。
- 空栈 `pop/top` 的安全返回。
- 重复注册同名 builder/router 的幂等性。
- `clear` 后重新入栈的状态恢复。

### 4.3 并发与长稳

- 连续 `addToStack`/`pop`/`clear` 高频操作下的栈一致性。
- 多路由名并发创建与查询。
- 长链路混合动作回放（注册→建栈→入栈→出栈→清空）。
- 路由操作期间的主线程让出（`serializedDelay`）。

### 4.4 性能与兼容性

- 记录路由注册、入栈、出栈、URL 解析耗时（`RouteStats`）。
- 限时上界断言，多次采样断言均值与最大值。
- 在内容缩放、深色模式、中英文资源下重复执行。
- 覆盖 default/tablet 设备类型与 `syscap.json` 能力裁剪。

### 4.5 安全与契约

- 路由名/builder 名格式校验（`RouteNameValidator`）。
- URL 参数解析的边界与非法输入（空串、缺分隔符、多余分隔符）。
- 未注册目标的安全降级（返回空而非崩溃）。
- 配置与资源契约（`module.json5`、`main_pages.json`、`syscap.json`）。

### 4.6 可达性与易用性

- 首页入口按钮可达性与焦点顺序（交互套件）。
- 触摸/按键/手势事件处理与冒泡（交互套件）。
- 焦点环可见性与主题/对比度（交互套件）。
- 中英文文案与资源完整性。

## 5. 充分性说明

- 覆盖层次完整：共享驱动、领域模型、场景回归、质量维度均有对应套件。
- 覆盖维度：功能、异常、并发、性能、契约、可达性、资源与兼容性均已纳入。
- 覆盖方式多样：单点断言、矩阵组合、多采样、边界注入并存。
- 数据校验细化：校验注册数量、栈深度、栈顶、URL 解析字段与命名合法性。
- 资产可审计：`List.test.ets` 统一注册，套件名称与分类清晰。
- 规模达标：78 套件、约 2000 用例、每文件行数不低于参考。

## 6. 当前测试目录与职责

测试代码位于 `entry/src/ohosTest/ets/test/`，由 `List.test.ets` 统一注册，按测试意图分组：

| 分组 | 数量 | 代表套件与职责 |
|---|---|---|
| 共享驱动 | 1 | `Shared/SharedDriver.ets`：导航常量、串行化操作、延时、导航与访问追踪 |
| Navigation | 16 | `NavigationUI`、`RouterModelDeep`、`RouterOperationCatalog`、`RouterOperationFlow`、`RouterOperationWorkflow`、`RouterOperations`、`RouterMenuConfiguration`、`RouterItemInfoModel`、`NavigationStateManagement`、`NavigationLifecycle`、`NavigationConcurrency`、`NavigationConsistency`、`NavigationEndToEnd`、`NavigationErrorRecovery`、`NavigationStress`、`RouterInputInteraction` |
| RouterValidation | 8 | `RouterAppVersion`、`RouterNotification`、`RouterOfflineNetwork`、`RouterAuthSession`、`RouterInterruptionRecovery`、`RouterSessionValidation`、`RouterDataSourceValidation`、`RouterEventToolValidation` |
| Interaction | 14 | `FocusNavigation`、`TouchInteraction`、`AccessibilityNavigation`、`EventHandling`、`ButtonInteraction`、`GestureRecognition`、`EventPropagation`、`UIComponentRendering`、`FocusRingBehavior`、`VisualEffects`、`DataBinding`、`ContentScaling`、`ThemeVariation`、`PagePositioning` |
| LifecycleState | 10 | `ConfigurationChanges`、`PageLifecycle`、`PageStateManagement`、`ErrorRecovery`、`ExceptionHandling`、`ExtensionLifecycle`、`ResourceManagement`、`SessionManagement`、`StatePersistence`、`StateRecovery` |
| Validation | 11 | `KeyCodeValidation`、`AnimationControllerValidation`、`CommonEventUtilValidation`、`FocusManagerValidation`、`PointerUtilValidation`、`PageStateManagerValidation`、`LoggerValidation`、`BoundaryErrorTesting`、`InputValidation`、`ConfigurationManagerValidation`、`ResourceLoaderValidation` |
| Integration | 9 | `IntegrationTesting`、`SystemIntegration`、`ComprehensiveRegression`、`RouterCompatibility`、`DeviceCompatibility`、`LocalizationTesting`、`NetworkConnectivity`、`AdvancedScenarios`、`UserScenarios` |
| PerformanceStability | 7 | `AnimationPerformance`、`RouterConsumption`、`RouterPerformance`、`PerformanceStress`、`MemoryLeakDetection`、`LongTermStability`、`ConcurrencyControl` |
| Security | 3 | `RouterSecurity`、`SecurityAccessibility`、`SecurityValidation` |

## 7. 结论

本工程测试已形成“共享驱动 + 路由领域模型 + 场景回归 + 非功能质量”的组合式覆盖，具备良好扩展性与回归价值，可作为动态路由样例持续集成与版本回归的基础。

## 附录：手工用例归档

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|-----------|---------|------|---------|------|------|
| 拉起应用 | 设备正常运行 | - | 成功拉起应用 | 是 | Pass |
| 从首页跳转到 HarA 页面 | 进入首页 | 点击 ToHarAPage1 | 成功跳转到 HarA_Page1 | 是 | Pass |
| 从 HarA 跳转到 HarB 页面 | 进入 HarA 页面 | 点击 ToHarBPage1 | 成功跳转到 HarB_Page1 | 是 | Pass |
| 从 HarB 跳转到首页 | 进入 HarB 页面 | 点击 ToIndex | 成功返回 NavIndex | 是 | Pass |
