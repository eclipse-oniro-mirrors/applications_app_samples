# ComponentSample 测试用例

自动化包含直接调用生产日历/数据源的测试，以及测试侧交互、状态、安全等辅助模型的测试。
2026-11-20，用户确认本项目测试用例全部执行成功，结果统一记录为 Pass（用户确认）。本次仅更新文档，未重新运行测试。

## 基础功能用例

自动化预置条件：使用与当前工程匹配的 OpenHarmony 测试环境，主应用和测试 HAP 已安装，通过 Hypium 入口执行。
下表结果依据用户执行反馈记录，功能摘要不额外计入源码用例数。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| --- | --- | --- | --- | --- | --- |
| 生产日历网格 | 可导入真实 getMonthDate | 平年/闰年、月份及跨年样本 | 日期连续、首日星期/前后补零与独立期望一致 | 是 | Pass（用户确认） |
| 日期模型与文案 | 可导入 DateModel / getRealTimeDate | 构造、改写字段、读取当前日期 | 字段透传及文案中的年月日符合当前数据 | 是 | Pass（用户确认） |
| 生产数据源与通知 | 创建生产数据源和 EventRecorder | 追加、读取、注册及触发通知 | 数量、数据内容和监听记录符合断言 | 是 | Pass（用户确认） |
| 交互、状态和规则 | 创建新的测试侧辅助模型 | 日期选择、购物车、焦点、状态及安全规则序列 | 辅助模型状态和数据满足断言，不作为 UI / 系统能力验收 | 是，辅助模型 | Pass（用户确认） |
| 高负载组件页面滑动 | 真机安装并进入“合理处理高负载组件的渲染文章示例代码” | 上下滑动页面 | 显示当前年份和日历列表，列表可正常滑动 | 否，人工检查 | Pass（用户确认） |
| 购物车跳转商品详情 | 真机进入“跨文件样式复用和组件复用案例” | 点击购物车列表项 | 跳转商品详情页 | 否，人工检查 | Pass（用户确认） |
| 自定义日历面板 | 真机进入“自定义日历选择器案例” | 点击日期时间、上下滚动、选择日期 | 显示近两个月面板且当天高亮；滚动刷新无卡顿；选中后关闭并更新主页日期，过去日期不可选 | 否，人工检查 | Pass（用户确认） |
| 列表二级联动 | 真机进入“列表二级联动” | 点击类别 3，再滚动二级列表至类别 5 | 二级列表定位类别 3，随后一级列表选中类别 5 | 否，人工检查 | Pass（用户确认） |

## 自动化测试覆盖

当前 [测试目录](entry/src/ohosTest/ets/test) 共 **79 个套件、1,360 条源码用例**，
包含 80 个 `.test.ets` 文件，其中 [List.test.ets](entry/src/ohosTest/ets/test/List.test.ets) 只负责注册。
统计以当前源码中的 `describe` / `it` 定义为准，Shared 辅助文件不计入独立套件或用例数。

**注册数量需要单独计算：** List 同时以 `./Ability.test` 和 `./Ability.test.ets` 导入同一文件，
分别调用 `abilityTest()` / `abilitySuite()`，所以 `ActsAbilityTest` 的 5 条源码用例执行两次。
当前共有 **80 次套件注册调用、1,365 次预期用例执行**；1,365 不能作为独立源码用例数。
Runner 的分发防重不消除 List 内这两次注册。本次仅记录现状，未修改注册。

| 目录 | 套件数 | 源码用例数 |
| --- | ---: | ---: |
| Ability | 1 | 5 |
| CalendarCore | 16 | 250 |
| CalendarValidation | 8 | 138 |
| DataSourceValidation | 11 | 154 |
| Interaction | 14 | 317 |
| LifecycleState | 10 | 196 |
| PerformanceStability | 7 | 122 |
| Integration | 9 | 124 |
| Security | 3 | 54 |
| 合计 | 79 | 1,360 |

下表使用真实 `describe` 名称，便于按 `-s class` 过滤。每行给出当前实际检查内容或主要调用的节选。
套件名称只用于索引；覆盖范围以调用代码为准。

### Ability：运行入口和日期基线（1 个套件，5 条）

| 测试套件 | 当前检查摘要 | 用例数 |
| --- | --- | ---: |
| [ActsAbilityTest](entry/src/ohosTest/ets/test/Ability.test.ets) | 真实 getMonthDate、DateModel 字段读写、日志辅助入口和运行时日期；不启动页面 | 5 |

### CalendarCore：生产日历核心与测试侧投影（16 个套件，250 条）

| 测试套件 | 当前检查摘要 | 用例数 |
| --- | --- | ---: |
| [CalendarModelDeepTest](entry/src/ohosTest/ets/test/CalendarCore/CalendarModelDeep.test.ets) | 真实月网格的日期连续性、最大日期、补零、格子统计与数组独立性 | 22 |
| [DaySelectionTest](entry/src/ohosTest/ets/test/CalendarCore/DaySelection.test.ets) | 真实月网格配合测试侧 CellProjector / SelectionGuard，核对日期位置、星期与可选规则 | 15 |
| [GridCatalogTest](entry/src/ohosTest/ets/test/CalendarCore/GridCatalog.test.ets) | 多组月份网格快照、指纹、日期位置及星期映射 | 25 |
| [GridCellModelTest](entry/src/ohosTest/ets/test/CalendarCore/GridCellModel.test.ets) | 真实网格到测试侧单元格投影的日期、行列、星期与有效日期标记 | 23 |
| [GridConcurrencyTest](entry/src/ohosTest/ets/test/CalendarCore/GridConcurrency.test.ets) | 重复生成真实月网格的内容一致性、对象隔离与独立修改；不证明线程并发 | 11 |
| [GridConsistencyTest](entry/src/ohosTest/ets/test/CalendarCore/GridConsistency.test.ets) | 月网格总格数、首尾非零日期、连续性与重复计算一致性 | 13 |
| [GridEndToEndTest](entry/src/ohosTest/ets/test/CalendarCore/GridEndToEnd.test.ets) | 月网格生成与测试侧日期定位/投影组合；不执行页面端到端流程 | 12 |
| [GridErrorRecoveryTest](entry/src/ohosTest/ets/test/CalendarCore/GridErrorRecovery.test.ets) | 月份输入序列后的网格完整性、日期范围和恢复计算 | 13 |
| [GridFlowTest](entry/src/ohosTest/ets/test/CalendarCore/GridFlow.test.ets) | 月网格、月份文案和测试侧日期选择投影的组合检查 | 21 |
| [GridLifecycleTest](entry/src/ohosTest/ets/test/CalendarCore/GridLifecycle.test.ets) | 月份重复生成、首日星期、标签和网格统计；不触发 Ability 生命周期 | 12 |
| [GridOperationsTest](entry/src/ohosTest/ets/test/CalendarCore/GridOperations.test.ets) | 真实网格的日期索引、星期、范围、补零及辅助统计 | 18 |
| [GridStateManagementTest](entry/src/ohosTest/ets/test/CalendarCore/GridStateManagement.test.ets) | 网格日期定位与测试侧选择状态/单元格投影 | 14 |
| [GridStressTest](entry/src/ohosTest/ets/test/CalendarCore/GridStress.test.ets) | 月份循环中的日期连续性、首日星期、补零与网格统计 | 3 |
| [GridViewProjectionTest](entry/src/ohosTest/ets/test/CalendarCore/GridViewProjection.test.ets) | 真实日期数据到测试侧单元格展示字段的映射；不渲染节点 | 12 |
| [GridWorkflowTest](entry/src/ohosTest/ets/test/CalendarCore/GridWorkflow.test.ets) | 网格生成、日期位置、月份标签和投影组合 | 14 |
| [MonthPanelConfigTest](entry/src/ohosTest/ets/test/CalendarCore/MonthPanelConfig.test.ets) | 月份网格、首日星期、日期数量及月份标签的数值契约 | 22 |

### CalendarValidation：生产日历数据校验（8 个套件，138 条）

| 测试套件 | 当前检查摘要 | 用例数 |
| --- | --- | ---: |
| [CalendarCellValidationTest](entry/src/ohosTest/ets/test/CalendarValidation/CalendarCellValidation.test.ets) | 单元格行列、星期、日期有效性与补零位置 | 14 |
| [CalendarGridValidationTest](entry/src/ohosTest/ets/test/CalendarValidation/CalendarGridValidation.test.ets) | 真实月网格的首尾、补零、连续日期与星期对齐 | 11 |
| [CalendarLeapValidationTest](entry/src/ohosTest/ets/test/CalendarValidation/CalendarLeapValidation.test.ets) | 闰年/平年月份的天数、网格连续性与独立闰年规则对照 | 21 |
| [CalendarRangeValidationTest](entry/src/ohosTest/ets/test/CalendarValidation/CalendarRangeValidation.test.ets) | 月份范围输入后的真实网格日期边界和星期对齐 | 13 |
| [CalendarRecoveryValidationTest](entry/src/ohosTest/ets/test/CalendarValidation/CalendarRecoveryValidation.test.ets) | 连续月份调用后的网格内容、指纹与状态隔离 | 16 |
| [CalendarSelectionValidationTest](entry/src/ohosTest/ets/test/CalendarValidation/CalendarSelectionValidation.test.ets) | 真实网格配合测试侧选择/投影规则，核对行列、星期与日期 | 22 |
| [CalendarTimezoneValidationTest](entry/src/ohosTest/ets/test/CalendarValidation/CalendarTimezoneValidation.test.ets) | 固定日期样本的网格、星期和标签；不切换系统时区 | 20 |
| [CalendarYearBoundaryTest](entry/src/ohosTest/ets/test/CalendarValidation/CalendarYearBoundary.test.ets) | 跨年月份的天数、首日位置、日期范围和网格内容 | 21 |

### DataSourceValidation：生产数据源与监听（11 个套件，154 条）

| 测试套件 | 当前检查摘要 | 用例数 |
| --- | --- | ---: |
| [BoundaryErrorTestingTest](entry/src/ohosTest/ets/test/DataSourceValidation/BoundaryErrorTesting.test.ets) | 生产日历数据源的数量、取值和通知记录，结合真实月份数据 | 10 |
| [CascadeDataValidationTest](entry/src/ohosTest/ets/test/DataSourceValidation/CascadeDataValidation.test.ets) | 生产 CascadeSource 的 pushData / getData、数量与通知 | 14 |
| [CascadePointerValidationTest](entry/src/ohosTest/ets/test/DataSourceValidation/CascadePointerValidation.test.ets) | 生产级联数据源数据与监听记录，配合测试侧索引规则 | 17 |
| [DataResourceValidationTest](entry/src/ohosTest/ets/test/DataSourceValidation/DataResourceValidation.test.ets) | 生产日历数据源的 addData / getData、数量和监听通知 | 9 |
| [IndexInputValidationTest](entry/src/ohosTest/ets/test/DataSourceValidation/IndexInputValidation.test.ets) | 生产级联数据源与测试侧 CascadeModel.findItemIndex 索引查询 | 11 |
| [ItemIndexValidationTest](entry/src/ohosTest/ets/test/DataSourceValidation/ItemIndexValidation.test.ets) | 生产级联数据源的追加、索引、数据字段和监听事件 | 22 |
| [ListenerRegistryValidationTest](entry/src/ohosTest/ets/test/DataSourceValidation/ListenerRegistryValidation.test.ets) | 生产数据源监听注册及 notifyDataAdd 等通知的记录核对 | 15 |
| [LoggingPolicyValidationTest](entry/src/ohosTest/ets/test/DataSourceValidation/LoggingPolicyValidation.test.ets) | 实际检查生产日历数据源数据、数量和通知；名称不代表日志策略审计 | 16 |
| [MonthDataSourceValidationTest](entry/src/ohosTest/ets/test/DataSourceValidation/MonthDataSourceValidation.test.ets) | 生产自定义日历 MonthDataSource 的数据追加、读取、数量和通知契约 | 17 |
| [MonthInterfaceValidationTest](entry/src/ohosTest/ets/test/DataSourceValidation/MonthInterfaceValidation.test.ets) | 生产高负载页面 LoadedMonthSource 的数据追加、读取和通知 | 7 |
| [StringSourceValidationTest](entry/src/ohosTest/ets/test/DataSourceValidation/StringSourceValidation.test.ets) | 生产 StringSource 的 addData / pushData / getData、数量和通知 | 16 |

### Interaction：测试侧交互与展示模型（14 个套件，317 条）

| 测试套件 | 当前检查摘要 | 用例数 |
| --- | --- | ---: |
| [AccessibilityNavigationTest](entry/src/ohosTest/ets/test/Interaction/AccessibilityNavigation.test.ets) | 测试侧焦点网格/焦点环/事件节点，结合日历投影；不接入无障碍服务 | 25 |
| [ButtonInteractionTest](entry/src/ohosTest/ets/test/Interaction/ButtonInteraction.test.ets) | 测试侧购物车选中/数量、底栏和日期面板；不点击真实按钮 | 24 |
| [ContentScalingTest](entry/src/ohosTest/ets/test/Interaction/ContentScaling.test.ets) | 测试侧缩放、主题间距、行高和面板参数；不读取真实屏幕布局 | 12 |
| [DataBindingTest](entry/src/ohosTest/ets/test/Interaction/DataBinding.test.ets) | 真实 DateModel / 数据源与测试侧快照、购物车状态；不触发 ArkUI 绑定机制 | 11 |
| [DialogPositioningTest](entry/src/ohosTest/ets/test/Interaction/DialogPositioning.test.ets) | 测试侧 PanelMachine、主题数值与日历单元格投影；不显示 Dialog | 11 |
| [EventHandlingTest](entry/src/ohosTest/ets/test/Interaction/EventHandling.test.ets) | 测试侧 GestureClassifier、购物车和面板状态机的事件序列 | 32 |
| [EventPropagationTest](entry/src/ohosTest/ets/test/Interaction/EventPropagation.test.ets) | 测试侧 EventNode 事件轨迹、焦点位置与 RolePolicy 权限规则 | 23 |
| [FocusNavigationTest](entry/src/ohosTest/ets/test/Interaction/FocusNavigation.test.ets) | 测试侧 FocusGrid 移动/边界与单元格投影；不注入系统焦点事件 | 32 |
| [FocusRingBehaviorTest](entry/src/ohosTest/ets/test/Interaction/FocusRingBehavior.test.ets) | 测试侧焦点网格、焦点环边框和主题/日期投影数值 | 21 |
| [GestureRecognitionTest](entry/src/ohosTest/ets/test/Interaction/GestureRecognition.test.ets) | 测试侧手势样本分类、缩放、日历投影与合成帧序列 | 34 |
| [ThemeVariationTest](entry/src/ohosTest/ets/test/Interaction/ThemeVariation.test.ets) | 测试侧 ThemeResolver、星期标题和日历展示字段 | 12 |
| [TouchInteractionTest](entry/src/ohosTest/ets/test/Interaction/TouchInteraction.test.ets) | 测试侧购物车操作、事件节点和日期投影；不注入触摸 | 28 |
| [UIComponentRenderingTest](entry/src/ohosTest/ets/test/Interaction/UIComponentRendering.test.ets) | 测试侧 ProductInfoModel 展示字段、星期标题和面板投影；不渲染组件 | 29 |
| [VisualEffectsTest](entry/src/ohosTest/ets/test/Interaction/VisualEffects.test.ets) | 测试侧 AnimationTimeline 合成帧、焦点环和主题数值 | 23 |

### LifecycleState：测试侧生命周期和状态模型（10 个套件，196 条）

| 测试套件 | 当前检查摘要 | 用例数 |
| --- | --- | ---: |
| [ConfigurationChangesTest](entry/src/ohosTest/ets/test/LifecycleState/ConfigurationChanges.test.ets) | 测试侧 ConfigSnapshot 和 Snapshot 编解码/字段保持 | 14 |
| [DialogLifecycleTest](entry/src/ohosTest/ets/test/LifecycleState/DialogLifecycle.test.ets) | 测试侧 PanelMachine 打开/关闭/迁移与主题、面板数值 | 6 |
| [DialogStateManagementTest](entry/src/ohosTest/ets/test/LifecycleState/DialogStateManagement.test.ets) | 测试侧面板/会话迁移、快照、重试预算、资源池与日期投影 | 34 |
| [ErrorRecoveryTest](entry/src/ohosTest/ets/test/LifecycleState/ErrorRecovery.test.ets) | 测试侧资源池、队列、错误分类、退避与令牌桶 | 35 |
| [ExceptionHandlingTest](entry/src/ohosTest/ets/test/LifecycleState/ExceptionHandling.test.ets) | 测试侧异常分类、限流/令牌桶和真实日期计算的组合 | 34 |
| [ExtensionLifecycleTest](entry/src/ohosTest/ets/test/LifecycleState/ExtensionLifecycle.test.ets) | 测试侧会话/面板迁移、配置、快照和离线队列 | 23 |
| [ResourceManagementTest](entry/src/ohosTest/ets/test/LifecycleState/ResourceManagement.test.ets) | 测试侧资源池、队列、限流和合成能耗台账；不测系统资源占用 | 13 |
| [SessionManagementTest](entry/src/ohosTest/ets/test/LifecycleState/SessionManagement.test.ets) | 测试侧 SessionStore、Snapshot、PanelMachine 与审计规则 | 16 |
| [StatePersistenceTest](entry/src/ohosTest/ets/test/LifecycleState/StatePersistence.test.ets) | 测试侧内存 Snapshot 编解码与面板/配置；不访问持久化存储 | 10 |
| [StateRecoveryTest](entry/src/ohosTest/ets/test/LifecycleState/StateRecovery.test.ets) | 真实 DateModel 与测试侧快照恢复、错误退避及重试预算 | 11 |

### PerformanceStability：数据循环与测试侧性能辅助模型（7 个套件，122 条）

| 测试套件 | 当前检查摘要 | 用例数 |
| --- | --- | ---: |
| [AnimationPerformanceTest](entry/src/ohosTest/ets/test/PerformanceStability/AnimationPerformance.test.ets) | 真实月份数据与测试侧合成帧/计时/台账；不测渲染帧率 | 28 |
| [ConcurrencyControlTest](entry/src/ohosTest/ets/test/PerformanceStability/ConcurrencyControl.test.ets) | 真实月份计算与测试侧确定性随机数、令牌桶和重试预算 | 7 |
| [LongTermStabilityTest](entry/src/ohosTest/ets/test/PerformanceStability/LongTermStability.test.ets) | 月份/当前日期计算循环与确定性样本；无长时间设备稳定性结论 | 7 |
| [MemoryLeakDetectionTest](entry/src/ohosTest/ets/test/PerformanceStability/MemoryLeakDetection.test.ets) | 生产数据源监听与测试侧资源池/快照/队列计数；不采集堆内存 | 6 |
| [PerformanceStressTest](entry/src/ohosTest/ets/test/PerformanceStability/PerformanceStress.test.ets) | 真实月份生成循环与测试侧计时状态、合成帧和台账 | 20 |
| [PowerConsumptionTest](entry/src/ohosTest/ets/test/PerformanceStability/PowerConsumption.test.ets) | 测试侧令牌桶、队列、合成帧与台账；不采集设备能耗 | 28 |
| [PowerPerformanceTest](entry/src/ohosTest/ets/test/PerformanceStability/PowerPerformance.test.ets) | 真实网格指纹/随机样本与测试侧计时、合成帧和台账 | 26 |

### Integration：数据和辅助模型组合（9 个套件，124 条）

| 测试套件 | 当前检查摘要 | 用例数 |
| --- | --- | ---: |
| [AdvancedScenariosTest](entry/src/ohosTest/ets/test/Integration/AdvancedScenarios.test.ets) | 生产日历数据源的监听流程，结合测试侧快照、资源与状态辅助逻辑 | 8 |
| [ComprehensiveRegressionTest](entry/src/ohosTest/ets/test/Integration/ComprehensiveRegression.test.ets) | 生产日期生成/当前日期文案与数据源，结合测试侧面板构建和记录 | 15 |
| [DeviceCompatibilityTest](entry/src/ohosTest/ets/test/Integration/DeviceCompatibility.test.ets) | 测试侧 ConfigSnapshot、ThemeResolver、缩放和面板参数；不做多设备实测 | 5 |
| [IntegrationTestingTest](entry/src/ohosTest/ets/test/Integration/IntegrationTesting.test.ets) | 生产月网格/数据源与测试侧面板投影、监听轨迹组合 | 11 |
| [LocalizationTestingTest](entry/src/ohosTest/ets/test/Integration/LocalizationTesting.test.ets) | 生产 getRealTimeDate / getMonthDate，结合测试侧标签、投影和配置 | 23 |
| [NetworkConnectivityTest](entry/src/ohosTest/ets/test/Integration/NetworkConnectivity.test.ets) | 测试侧错误分类、退避、TokenBucket 与 OfflineQueue；无真实网络请求 | 6 |
| [PowerCompatibilityTest](entry/src/ohosTest/ets/test/Integration/PowerCompatibility.test.ets) | 测试侧限流、令牌桶、错误重试和计时状态；无设备功耗测量 | 22 |
| [SystemIntegrationTest](entry/src/ohosTest/ets/test/Integration/SystemIntegration.test.ets) | 真实日期计算与测试侧会话、队列、资源池和面板的组合 | 12 |
| [UserScenariosTest](entry/src/ohosTest/ets/test/Integration/UserScenarios.test.ets) | 测试侧 CartModel 数量/选中状态、面板与状态机的组合 | 22 |

### Security：测试侧安全规则（3 个套件，54 条）

| 测试套件 | 当前检查摘要 | 用例数 |
| --- | --- | ---: |
| [PowerSecurityTest](entry/src/ohosTest/ets/test/Security/PowerSecurity.test.ets) | 测试侧限流/令牌桶、会话、审计和日志输入规则 | 24 |
| [SecurityAccessibilityTest](entry/src/ohosTest/ets/test/Security/SecurityAccessibility.test.ets) | 测试侧角色策略、审计、配置、缩放与日志输入规则 | 16 |
| [SecurityValidationTest](entry/src/ohosTest/ets/test/Security/SecurityValidation.test.ets) | 测试侧权限/审计、错误退避、限流与确定性输入 | 14 |

## 框架、断言及覆盖边界

各文件通过 `@ohos/hypium` 的 `describe` / `it` 注册；使用 `expect(...).assertEqual`、
`assertTrue`、`assertFalse` 和 `assertThrowError` 检查值、布尔条件及异常。
套件按需使用 beforeAll / beforeEach 等钩子。部分 beforeEach 通过 `Promise<void>` 和 1 ms 定时回调让出调度，
回调再调用 `resolve(undefined)`；业务断言主要同步执行，不能将调度等待当作后台并发覆盖。
Runner 使用 `Hypium.hypiumTest` 分发并设置分发防重标记；启动回执使用 delegator 的 `printSync`。

| 类型 | 当前来源 | 实际边界 |
| --- | --- | --- |
| 生产日期逻辑 | [GetDate](entry/src/main/ets/pages/CustomCalendar/components/GetDate.ets)、[DateModel](entry/src/main/ets/pages/CustomCalendar/components/DateModel.ets) | 直接生成月份网格、读取当前日期文案及检查字段 |
| 生产数据源 | [日历数据源](entry/src/main/ets/pages/CustomCalendar/components/MonthDataSource.ets)、[高负载数据源](entry/src/main/ets/pages/HighlyLoaded/MonthDataSource.ets)、[级联数据源](entry/src/main/ets/pages/SecondaryLinkage/DataType.ets)、[字符串数据源](entry/src/main/ets/pages/DynamicAttributes/common/LazyForEach.ets) | 直接调用数据与监听接口，未驱动真实列表 |
| 期望和监听记录 | [Support](entry/src/ohosTest/ets/test/Shared/Support.ets)、[SharedDriver](entry/src/ohosTest/ets/test/Shared/SharedDriver.ets) | 固定样本、独立日期算法、数组检查、EventRecorder 与日期投影辅助逻辑 |
| 交互和展示辅助模型 | [UiModels](entry/src/ohosTest/ets/test/Shared/UiModels.ets)、[CartModel](entry/src/ohosTest/ets/test/Shared/CartModel.ets)、[SecondaryModel](entry/src/ohosTest/ets/test/Shared/SecondaryModel.ets) | 测试侧焦点/手势/主题/购物车/二级联动数值，未挂载 ArkUI 组件 |
| 状态和规则辅助模型 | [LifecycleModels](entry/src/ohosTest/ets/test/Shared/LifecycleModels.ets)、[SecurityModels](entry/src/ohosTest/ets/test/Shared/SecurityModels.ets) | 测试侧状态机、内存快照、资源池、队列、角色策略和限流 |
