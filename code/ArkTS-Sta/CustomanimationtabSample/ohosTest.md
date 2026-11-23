# CustomanimationtabSample 测试用例

当前自动化均围绕测试侧 TabState、标签/尺寸常量和资源表副本，未直接导入生产 main 模块。
2026-11-20，用户确认本项目测试用例全部执行成功，结果统一记录为 Pass（用户确认）。本次仅更新文档，未重新运行测试。

## 基础功能用例

自动化预置条件：在匹配工程的 OpenHarmony 环境安装主应用与测试 HAP，通过 Hypium 执行测试侧模型。
下表结果依据用户执行反馈记录，功能摘要不额外计入源码用例数。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| --- | --- | --- | --- | --- | --- |
| 标签和尺寸样本 | 加载 SharedDriver | 读取五标签、八行数据、背景条尺寸和颜色 | 数据与测试侧固定期望一致 | 是，测试侧副本 | Pass（用户确认） |
| 页签状态切换 | 创建新的 TabState | select / onChange 及往返路径 | 索引、位移、history 和操作计数符合辅助模型 | 是，辅助模型 | Pass（用户确认） |
| 拖动与颜色序列 | 创建新的 TabState | drag 偏移、toggleColor 奇偶序列 | 偏移累加与颜色切换符合测试侧计算 | 是，辅助模型 | Pass（用户确认） |
| 资源数值表 | 加载两份测试侧资源表 | 比较 float / integer / color 和缺失 key | 副本值、单位、范围和哨兵值符合断言 | 是，副本对照 | Pass（用户确认） |
| 真实 tab 页签切换 | 真机安装并启动主应用 | 点击 tab，再点击修改背景条颜色 | 切换页面；选中 tab 字体放大加粗并有默认灰色背景条；点击改色后变黄 | 否，人工检查 | Pass（用户确认） |
| 真实滑动切换与回弹 | 真机显示 tab 内容 | 滑动不足一半，再滑动超过一半 | 不足一半背景条回弹；超过一半背景条移动到下一页签且切页 | 否，人工检查 | Pass（用户确认） |

## 自动化测试覆盖

当前 [测试目录](entry/src/ohosTest/ets/test) 共 **80 个套件、2,331 条源码用例**，
包含 81 个 `.test.ets` 文件，其中 [List.test.ets](entry/src/ohosTest/ets/test/List.test.ets) 只负责注册。
统计以当前源码中的 `describe` / `it` 定义为准，Shared 辅助文件不计入独立套件或用例数。

当前 80 个套件各注册一次，预期执行 2,331 次用例。

| 目录 | 套件数 | 源码用例数 |
| --- | ---: | ---: |
| Ability | 1 | 4 |
| Tabs | 16 | 484 |
| TabValidation | 8 | 264 |
| SkeletonValidation | 11 | 494 |
| Interaction | 14 | 435 |
| LifecycleState | 10 | 257 |
| PerformanceStability | 7 | 164 |
| Integration | 10 | 172 |
| Security | 3 | 57 |
| 合计 | 80 | 2,331 |

下表使用真实 `describe` 名称，便于按 `-s class` 过滤。每行给出当前实际检查内容或主要调用的节选。
套件名称只用于索引；覆盖范围以调用代码为准。

多个目录会复用相同辅助模型和相近操作序列，下面保留实际清单，不将目录名称解释为不同系统能力的覆盖。

### Ability：测试侧标签和尺寸基线（1 个套件，4 条）

| 测试套件 | 当前检查摘要 | 用例数 |
| --- | --- | ---: |
| [ActsAbilityTest](entry/src/ohosTest/ets/test/Ability.test.ets) | SharedDriver 中五标签、八行数据、初始灰色与 95/90 尺寸关系；未查询 Ability | 4 |

### Tabs：测试侧 TabState 核心序列（16 个套件，484 条）

| 测试套件 | 当前检查摘要 | 用例数 |
| --- | --- | ---: |
| [TabConcurrencyTest](entry/src/ohosTest/ets/test/Tabs/TabConcurrency.test.ets) | 辅助 select 选中路径；拖动数值求和；位移数值不变量；滚动终值期望 | 23 |
| [TabConsistencyTest](entry/src/ohosTest/ets/test/Tabs/TabConsistency.test.ets) | 辅助 select 选中路径；拖动数值求和；位移数值不变量；辅助 drag 偏移累计 | 22 |
| [TabEndToEndTest](entry/src/ohosTest/ets/test/Tabs/TabEndToEnd.test.ets) | 辅助 select 选中路径；拖动数值求和；位移数值不变量；索引位移期望 | 23 |
| [TabErrorRecoveryTest](entry/src/ohosTest/ets/test/Tabs/TabErrorRecovery.test.ets) | 辅助 select 选中路径；位移数值不变量；拖动数值求和；背景条位置期望 | 24 |
| [TabInputInteractionTest](entry/src/ohosTest/ets/test/Tabs/TabInputInteraction.test.ets) | 辅助 select 选中路径；位移数值不变量；背景条位置期望；拖动数值求和 | 28 |
| [TabItemInfoModelTest](entry/src/ohosTest/ets/test/Tabs/TabItemInfoModel.test.ets) | 辅助 select 选中路径；位移数值不变量；拖动数值求和；滚动终值期望 | 44 |
| [TabLifecycleTest](entry/src/ohosTest/ets/test/Tabs/TabLifecycle.test.ets) | 辅助 select 选中路径；位移数值不变量；拖动数值求和；索引位移期望 | 24 |
| [TabMenuConfigurationTest](entry/src/ohosTest/ets/test/Tabs/TabMenuConfiguration.test.ets) | 辅助 select 选中路径；位移数值不变量；拖动数值求和；背景条位置期望 | 43 |
| [TabModelDeepTest](entry/src/ohosTest/ets/test/Tabs/TabModelDeep.test.ets) | 辅助 select 选中路径；位移数值不变量；滚动终值期望；背景条位置期望 | 49 |
| [TabOperationCatalogTest](entry/src/ohosTest/ets/test/Tabs/TabOperationCatalog.test.ets) | 辅助 select 选中路径；位移数值不变量；索引位移期望；拖动数值求和 | 48 |
| [TabOperationFlowTest](entry/src/ohosTest/ets/test/Tabs/TabOperationFlow.test.ets) | 辅助 select 选中路径；位移数值不变量；背景条位置期望；拖动数值求和 | 44 |
| [TabOperationWorkflowTest](entry/src/ohosTest/ets/test/Tabs/TabOperationWorkflow.test.ets) | 辅助 select 选中路径；位移数值不变量；拖动数值求和；背景条位置期望 | 29 |
| [TabOperationsTest](entry/src/ohosTest/ets/test/Tabs/TabOperations.test.ets) | 辅助 select 选中路径；位移数值不变量；拖动数值求和；背景条位置期望 | 32 |
| [TabStateManagementTest](entry/src/ohosTest/ets/test/Tabs/TabStateManagement.test.ets) | 辅助 select 选中路径；位移数值不变量；拖动数值求和；背景条位置期望 | 24 |
| [TabStressTest](entry/src/ohosTest/ets/test/Tabs/TabStress.test.ets) | 拖动数值求和；辅助 drag 偏移累计；辅助 select 选中路径；颜色切换奇偶 | 5 |
| [TabSurfaceModelTest](entry/src/ohosTest/ets/test/Tabs/TabSurfaceModel.test.ets) | 辅助 select 选中路径；拖动数值求和；位移数值不变量；背景条位置期望 | 22 |

### TabValidation：测试侧页签数据校验（8 个套件，264 条）

| 测试套件 | 当前检查摘要 | 用例数 |
| --- | --- | ---: |
| [TabAppVersionTest](entry/src/ohosTest/ets/test/TabValidation/TabAppVersion.test.ets) | 辅助 select 选中路径；位移数值不变量；拖动数值求和；滚动终值期望 | 40 |
| [TabAuthSessionTest](entry/src/ohosTest/ets/test/TabValidation/TabAuthSession.test.ets) | 辅助 select 选中路径；位移数值不变量；索引位移期望；拖动数值求和 | 39 |
| [TabDataSourceValidationTest](entry/src/ohosTest/ets/test/TabValidation/TabDataSourceValidation.test.ets) | 辅助 select 选中路径；位移数值不变量；拖动数值求和；索引位移期望 | 25 |
| [TabEventToolValidationTest](entry/src/ohosTest/ets/test/TabValidation/TabEventToolValidation.test.ets) | 辅助 select 选中路径；位移数值不变量；滚动终值期望；索引位移期望 | 23 |
| [TabInterruptionRecoveryTest](entry/src/ohosTest/ets/test/TabValidation/TabInterruptionRecovery.test.ets) | 辅助 select 选中路径；位移数值不变量；索引位移期望；滚动终值期望 | 30 |
| [TabNotificationTest](entry/src/ohosTest/ets/test/TabValidation/TabNotification.test.ets) | 辅助 select 选中路径；位移数值不变量；索引位移期望；辅助 onChange 索引变化 | 41 |
| [TabOfflineNetworkTest](entry/src/ohosTest/ets/test/TabValidation/TabOfflineNetwork.test.ets) | 辅助 select 选中路径；位移数值不变量；滚动终值期望；索引位移期望 | 41 |
| [TabSessionValidationTest](entry/src/ohosTest/ets/test/TabValidation/TabSessionValidation.test.ets) | 辅助 select 选中路径；位移数值不变量；索引位移期望；辅助 drag 偏移累计 | 25 |

### SkeletonValidation：以骨架命名的辅助状态场景（11 个套件，494 条）

| 测试套件 | 当前检查摘要 | 用例数 |
| --- | --- | ---: |
| [SkeletonAnimationControllerValidationTest](entry/src/ohosTest/ets/test/SkeletonValidation/SkeletonAnimationControllerValidation.test.ets) | 辅助 select 选中路径；位移数值不变量；索引位移期望；滚动终值期望 | 60 |
| [SkeletonBoundaryErrorTestingTest](entry/src/ohosTest/ets/test/SkeletonValidation/SkeletonBoundaryErrorTesting.test.ets) | 辅助 select 选中路径；位移数值不变量；滚动终值期望；索引位移期望 | 32 |
| [SkeletonCommonEventValidationTest](entry/src/ohosTest/ets/test/SkeletonValidation/SkeletonCommonEventValidation.test.ets) | 辅助 select 选中路径；位移数值不变量；滚动终值期望；索引位移期望 | 59 |
| [SkeletonConfigurationManagerValidationTest](entry/src/ohosTest/ets/test/SkeletonValidation/SkeletonConfigurationManagerValidation.test.ets) | 辅助 select 选中路径；位移数值不变量；滚动终值期望；背景条位置期望 | 25 |
| [SkeletonFocusManagerValidationTest](entry/src/ohosTest/ets/test/SkeletonValidation/SkeletonFocusManagerValidation.test.ets) | 辅助 select 选中路径；位移数值不变量；背景条位置期望；索引位移期望 | 53 |
| [SkeletonInputValidationTest](entry/src/ohosTest/ets/test/SkeletonValidation/SkeletonInputValidation.test.ets) | 辅助 select 选中路径；位移数值不变量；滚动终值期望；背景条位置期望 | 30 |
| [SkeletonKeyCodeValidationTest](entry/src/ohosTest/ets/test/SkeletonValidation/SkeletonKeyCodeValidation.test.ets) | 辅助 select 选中路径；位移数值不变量；背景条位置期望；滚动终值期望 | 66 |
| [SkeletonLoggerValidationTest](entry/src/ohosTest/ets/test/SkeletonValidation/SkeletonLoggerValidation.test.ets) | 辅助 select 选中路径；位移数值不变量；索引位移期望；选中数量 | 39 |
| [SkeletonPointerValidationTest](entry/src/ohosTest/ets/test/SkeletonValidation/SkeletonPointerValidation.test.ets) | 辅助 select 选中路径；位移数值不变量；滚动终值期望；背景条位置期望 | 55 |
| [SkeletonResourceLoaderValidationTest](entry/src/ohosTest/ets/test/SkeletonValidation/SkeletonResourceLoaderValidation.test.ets) | 辅助 select 选中路径；位移数值不变量；索引位移期望；选中数量 | 23 |
| [SkeletonStateManagerValidationTest](entry/src/ohosTest/ets/test/SkeletonValidation/SkeletonStateManagerValidation.test.ets) | 辅助 select 选中路径；位移数值不变量；背景条位置期望；滚动终值期望 | 52 |

### Interaction：测试侧交互序列（14 个套件，435 条）

| 测试套件 | 当前检查摘要 | 用例数 |
| --- | --- | ---: |
| [TabAccessibilityNavigationTest](entry/src/ohosTest/ets/test/Interaction/TabAccessibilityNavigation.test.ets) | 辅助 select 选中路径；位移数值不变量；背景条位置期望；滚动终值期望 | 40 |
| [TabButtonInteractionTest](entry/src/ohosTest/ets/test/Interaction/TabButtonInteraction.test.ets) | 辅助 select 选中路径；位移数值不变量；背景条位置期望；滚动终值期望 | 39 |
| [TabComponentRenderingTest](entry/src/ohosTest/ets/test/Interaction/TabComponentRendering.test.ets) | 辅助 select 选中路径；位移数值不变量；索引位移期望；滚动终值期望 | 33 |
| [TabContentScalingTest](entry/src/ohosTest/ets/test/Interaction/TabContentScaling.test.ets) | 辅助 select 选中路径；位移数值不变量；索引位移期望；背景条位置期望 | 12 |
| [TabDataBindingTest](entry/src/ohosTest/ets/test/Interaction/TabDataBinding.test.ets) | 辅助 select 选中路径；位移数值不变量；辅助 drag 偏移累计；背景条位置期望 | 16 |
| [TabEventHandlingTest](entry/src/ohosTest/ets/test/Interaction/TabEventHandling.test.ets) | 辅助 select 选中路径；位移数值不变量；索引位移期望；辅助 onChange 索引变化 | 41 |
| [TabEventPropagationTest](entry/src/ohosTest/ets/test/Interaction/TabEventPropagation.test.ets) | 辅助 select 选中路径；位移数值不变量；背景条位置期望；索引位移期望 | 38 |
| [TabFocusNavigationTest](entry/src/ohosTest/ets/test/Interaction/TabFocusNavigation.test.ets) | 辅助 select 选中路径；位移数值不变量；索引位移期望；背景条位置期望 | 54 |
| [TabFocusRingBehaviorTest](entry/src/ohosTest/ets/test/Interaction/TabFocusRingBehavior.test.ets) | 辅助 select 选中路径；位移数值不变量；背景条位置期望；历史索引去重 | 30 |
| [TabGestureRecognitionTest](entry/src/ohosTest/ets/test/Interaction/TabGestureRecognition.test.ets) | 辅助 select 选中路径；位移数值不变量；历史索引去重；辅助 drag 偏移累计 | 37 |
| [TabPositioningTest](entry/src/ohosTest/ets/test/Interaction/TabPositioning.test.ets) | 辅助 select 选中路径；位移数值不变量；背景条位置期望；滚动终值期望 | 13 |
| [TabThemeVariationTest](entry/src/ohosTest/ets/test/Interaction/TabThemeVariation.test.ets) | 辅助 select 选中路径；位移数值不变量；索引位移期望；历史索引去重 | 12 |
| [TabTouchInteractionTest](entry/src/ohosTest/ets/test/Interaction/TabTouchInteraction.test.ets) | 辅助 select 选中路径；位移数值不变量；背景条位置期望；滚动终值期望 | 41 |
| [TabVisualEffectsTest](entry/src/ohosTest/ets/test/Interaction/TabVisualEffects.test.ets) | 辅助 select 选中路径；位移数值不变量；滚动终值期望；索引位移期望 | 29 |

### LifecycleState：测试侧状态序列（10 个套件，257 条）

| 测试套件 | 当前检查摘要 | 用例数 |
| --- | --- | ---: |
| [TabConfigurationChangesTest](entry/src/ohosTest/ets/test/LifecycleState/TabConfigurationChanges.test.ets) | 辅助 select 选中路径；位移数值不变量；背景条位置期望；索引位移期望 | 17 |
| [TabExceptionHandlingTest](entry/src/ohosTest/ets/test/LifecycleState/TabExceptionHandling.test.ets) | 辅助 select 选中路径；位移数值不变量；背景条位置期望；滚动终值期望 | 47 |
| [TabExtensionLifecycleTest](entry/src/ohosTest/ets/test/LifecycleState/TabExtensionLifecycle.test.ets) | 辅助 select 选中路径；位移数值不变量；索引位移期望；滚动终值期望 | 31 |
| [TabIndicatorLifecycleTest](entry/src/ohosTest/ets/test/LifecycleState/TabIndicatorLifecycle.test.ets) | 辅助 select 选中路径；位移数值不变量；索引位移期望；颜色切换奇偶 | 11 |
| [TabResourceManagementTest](entry/src/ohosTest/ets/test/LifecycleState/TabResourceManagement.test.ets) | 辅助 select 选中路径；位移数值不变量；滚动终值期望；索引位移期望 | 16 |
| [TabSessionManagementTest](entry/src/ohosTest/ets/test/LifecycleState/TabSessionManagement.test.ets) | 辅助 select 选中路径；位移数值不变量；索引位移期望；辅助 drag 偏移累计 | 19 |
| [TabStateErrorRecoveryTest](entry/src/ohosTest/ets/test/LifecycleState/TabStateErrorRecovery.test.ets) | 辅助 select 选中路径；位移数值不变量；索引位移期望；滚动终值期望 | 46 |
| [TabStatePersistenceTest](entry/src/ohosTest/ets/test/LifecycleState/TabStatePersistence.test.ets) | 辅助 select 选中路径；位移数值不变量；背景条位置期望；滚动终值期望 | 12 |
| [TabStateRecoveryTest](entry/src/ohosTest/ets/test/LifecycleState/TabStateRecovery.test.ets) | 辅助 select 选中路径；位移数值不变量；背景条位置期望；历史索引去重 | 12 |
| [TabStateTransitionsTest](entry/src/ohosTest/ets/test/LifecycleState/TabStateTransitions.test.ets) | 辅助 select 选中路径；位移数值不变量；索引位移期望；背景条位置期望 | 46 |

### PerformanceStability：测试侧批次与循环（7 个套件，164 条）

| 测试套件 | 当前检查摘要 | 用例数 |
| --- | --- | ---: |
| [TabAnimationPerformanceTest](entry/src/ohosTest/ets/test/PerformanceStability/TabAnimationPerformance.test.ets) | 辅助 select 选中路径；位移数值不变量；背景条位置期望；滚动终值期望 | 38 |
| [TabConcurrencyControlTest](entry/src/ohosTest/ets/test/PerformanceStability/TabConcurrencyControl.test.ets) | 辅助 select 选中路径；背景条位置期望；位移数值不变量；颜色切换奇偶 | 8 |
| [TabLongTermStabilityTest](entry/src/ohosTest/ets/test/PerformanceStability/TabLongTermStability.test.ets) | 辅助 select 选中路径；位移数值不变量；背景条位置期望；选中数量 | 9 |
| [TabMemoryStabilityTest](entry/src/ohosTest/ets/test/PerformanceStability/TabMemoryStability.test.ets) | 辅助 select 选中路径；位移数值不变量；索引位移期望；颜色切换奇偶 | 9 |
| [TabPerformanceStressTest](entry/src/ohosTest/ets/test/PerformanceStability/TabPerformanceStress.test.ets) | 辅助 select 选中路径；位移数值不变量；历史索引去重；辅助 drag 偏移累计 | 26 |
| [TabPowerConsumptionTest](entry/src/ohosTest/ets/test/PerformanceStability/TabPowerConsumption.test.ets) | 辅助 select 选中路径；位移数值不变量；背景条位置期望；索引位移期望 | 39 |
| [TabPowerPerformanceTest](entry/src/ohosTest/ets/test/PerformanceStability/TabPowerPerformance.test.ets) | 辅助 select 选中路径；位移数值不变量；滚动终值期望；历史索引去重 | 35 |

### Integration：测试侧状态和资源副本组合（10 个套件，172 条）

| 测试套件 | 当前检查摘要 | 用例数 |
| --- | --- | ---: |
| [ResourceContractTest](entry/src/ohosTest/ets/test/Integration/ResourceContract.test.ets) | 测试内 float / integer / color 表与 SharedDriver 副本对照、单位/范围/缺失 key 哨兵值 | 13 |
| [TabAdvancedScenariosTest](entry/src/ohosTest/ets/test/Integration/TabAdvancedScenarios.test.ets) | 辅助 select 选中路径；位移数值不变量；滚动终值期望；颜色切换奇偶 | 10 |
| [TabComprehensiveRegressionTest](entry/src/ohosTest/ets/test/Integration/TabComprehensiveRegression.test.ets) | 辅助 select 选中路径；位移数值不变量；辅助 drag 偏移累计；背景条位置期望 | 20 |
| [TabDeviceCompatibilityTest](entry/src/ohosTest/ets/test/Integration/TabDeviceCompatibility.test.ets) | 颜色切换奇偶；辅助 drag 偏移累计；辅助 select 选中路径；辅助颜色切换 | 3 |
| [TabIntegrationTestingTest](entry/src/ohosTest/ets/test/Integration/TabIntegrationTesting.test.ets) | 辅助 select 选中路径；位移数值不变量；滚动终值期望；背景条位置期望 | 17 |
| [TabLocalizationTestingTest](entry/src/ohosTest/ets/test/Integration/TabLocalizationTesting.test.ets) | 辅助 select 选中路径；位移数值不变量；滚动终值期望；索引位移期望 | 29 |
| [TabNetworkConnectivityTest](entry/src/ohosTest/ets/test/Integration/TabNetworkConnectivity.test.ets) | 辅助 select 选中路径；索引位移期望；位移数值不变量；颜色切换奇偶 | 5 |
| [TabPlatformCompatibilityTest](entry/src/ohosTest/ets/test/Integration/TabPlatformCompatibility.test.ets) | 辅助 select 选中路径；位移数值不变量；背景条位置期望；背景条数值范围 | 28 |
| [TabSystemIntegrationTest](entry/src/ohosTest/ets/test/Integration/TabSystemIntegration.test.ets) | 辅助 select 选中路径；位移数值不变量；滚动终值期望；索引位移期望 | 16 |
| [TabUserScenariosTest](entry/src/ohosTest/ets/test/Integration/TabUserScenarios.test.ets) | 辅助 select 选中路径；位移数值不变量；滚动终值期望；辅助 drag 偏移累计 | 31 |

### Security：测试侧页签输入场景（3 个套件，57 条）

| 测试套件 | 当前检查摘要 | 用例数 |
| --- | --- | ---: |
| [TabSecurityTest](entry/src/ohosTest/ets/test/Security/TabSecurity.test.ets) | 辅助 select 选中路径；位移数值不变量；历史索引去重；滚动终值期望 | 27 |
| [TabSecurityAccessibilityTest](entry/src/ohosTest/ets/test/Security/TabSecurityAccessibility.test.ets) | 辅助 select 选中路径；滚动终值期望；位移数值不变量；背景条位置期望 | 16 |
| [TabSecurityValidationTest](entry/src/ohosTest/ets/test/Security/TabSecurityValidation.test.ets) | 辅助 select 选中路径；位移数值不变量；索引位移期望；颜色切换奇偶 | 14 |

## 框架、断言及覆盖边界

各套件使用 `@ohos/hypium` 的 `describe` / `it` / `expect`，当前主要为 `assertEqual`、`assertTrue` 和 `assertFalse`。
部分 beforeEach 使用 `Promise<void>` 和 1 ms 定时回调让出调度，回调再调用 `resolve(undefined)`；
Runner 的分发防重只控制 `Hypium.hypiumTest` 的调用次数。
Runner 日志仍有“source-projected callbacks”等旧说明，不能用该日志文字证明当前套件直接运行了生产回调。

当前 `.test.ets` 没有导入 `entry/src/main` 下的生产模块，主要对象位于
[SharedDriver.ets](entry/src/ohosTest/ets/test/Shared/SharedDriver.ets)。

| 测试侧对象 | 当前检查内容 | 覆盖边界 |
| --- | --- | --- |
| TABS / DATA_ROWS | 五个页签标签，八行数据（索引 0–7） | 固定副本，未读取真实页面树 |
| TabState | select、onChange、drag、toggleColor、history 和计数 | 内存辅助实现，未调用生产 Swiper / Scroller |
| 尺寸/样式常量 | 页签间距 95、背景条 90×60、圆角 20、字号 18/17、灰/黄切换 | 测试侧数值，未测量真实组件 |
| 位移/滚动期望 | 索引位移、拖动求和、索引 3 的 scrollX=90、索引 1 的 scrollX=-90 及路径累积 | 独立期望与辅助实现比较，不是实际滚动回执 |
| 停靠/回弹计算 | settleTargetIndex / settleRebounds / clampIndex | 测试侧算法，不代表真实滑动阈值和动效已验收 |
| FLOAT / INT / COLOR_ENTRIES | 资源值、单位、颜色通道/亮度、范围和缺失值 | 手工副本；ResourceContract 又定义样本表对照，未读取运行时资源表 |
