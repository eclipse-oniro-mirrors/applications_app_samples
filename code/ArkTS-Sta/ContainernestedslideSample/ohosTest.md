# ContainernestedslideSample 测试用例

2026-11-20，用户确认本项目测试用例全部执行成功，结果统一记录为 Pass（用户确认）。本次仅更新文档，未重新运行测试。

## 基础功能用例

自动化预置条件：使用与工程匹配的 OpenHarmony 测试环境，主应用与测试 HAP 已安装，Hypium 能访问测试上下文。
下表结果依据用户执行反馈记录，功能摘要不额外计入源码用例数。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| --- | --- | --- | --- | --- | --- |
| 测试运行时与包信息 | 真实 delegator / bundleManager 可用 | 读取 AppContext、包名、版本和安装时间 | 信息存在、范围合理，多次读取一致 | 是，运行时 | Pass（用户确认） |
| 评论模型和固定数据 | 导入生产 NewsCommentModel / mockData / curUser | 读取八条评论、构造/复制字段样本 | 七字段及固定 ID、用户、正文、时间与样本期望一致 | 是，数据检查 | Pass（用户确认） |
| 草稿编辑和发布 | 新建测试侧 CommentBoard | 打开、输入、发布、取消、重置、重复发布 | 内存草稿、编辑标记、评论数量和发布计数符合辅助规则 | 是，辅助模型 | Pass（用户确认） |
| 回复与文本输入 | 使用测试侧 CommentBoard 和文本工具 | 回复元数据、空白、中文、emoji、重复 ID 等样本 | 辅助回复字段、Unicode/文本与列表断言成立 | 是，辅助模型 | Pass（用户确认） |
| 嵌套页面上下滑动 | 真机安装主应用并进入页面 | 滑动到底，再从底部滑到顶部 | 能到达底部和顶部，无明显卡顿 | 否，人工检查 | Pass（用户确认） |
| 页面发布与回复 | 真机显示评论区域 | 输入内容点击发布，再点击回复并输入发布 | 新评论显示在最新一条位置，回复文字成功显示 | 否，人工检查 | Pass（用户确认） |

## 自动化测试覆盖

当前 [测试目录](entry/src/ohosTest/ets/test) 共 **79 个套件、1,944 条源码用例**，
包含 80 个 `.test.ets` 文件，其中 [List.test.ets](entry/src/ohosTest/ets/test/List.test.ets) 只负责注册。
统计以当前源码中的 `describe` / `it` 定义为准，Shared 辅助文件不计入独立套件或用例数。

当前 79 个套件各注册一次，预期执行 1,944 次用例。

| 目录 | 套件数 | 源码用例数 |
| --- | ---: | ---: |
| Ability | 1 | 7 |
| Publish | 16 | 398 |
| DraftValidation | 8 | 225 |
| ModelValidation | 11 | 409 |
| Interaction | 14 | 368 |
| LifecycleState | 10 | 216 |
| PerformanceStability | 7 | 130 |
| Integration | 9 | 142 |
| Security | 3 | 49 |
| 合计 | 79 | 1,944 |

下表使用真实 `describe` 名称，便于按 `-s class` 过滤。每行给出当前实际检查内容或主要调用的节选。
套件名称只用于索引；覆盖范围以调用代码为准。

多个目录会复用相同辅助模型和相近操作序列，下面保留实际清单，不将目录名称解释为不同系统能力的覆盖。

### Ability：运行时上下文与包信息（1 个套件，7 条）

| 测试套件 | 当前检查摘要 | 用例数 |
| --- | --- | ---: |
| [ActsAbilityTest](entry/src/ohosTest/ets/test/Ability.test.ets) | 真实 delegator / AppContext、包名/版本/安装时间读取，以及测试侧固定时间和字段表 | 7 |

### Publish：评论数据与辅助发布流程（16 个套件，398 条）

| 测试套件 | 当前检查摘要 | 用例数 |
| --- | --- | ---: |
| [CommentModelBasicsTest](entry/src/ohosTest/ets/test/Publish/CommentModelBasics.test.ets) | 辅助 CommentBoard 发布；草稿更新；辅助编辑状态开启；辅助按用户筛选 | 35 |
| [CommentModelDeepTest](entry/src/ohosTest/ets/test/Publish/CommentModelDeep.test.ets) | 辅助 CommentBoard 发布；草稿更新；辅助编辑状态开启；辅助按用户筛选 | 39 |
| [PublishComposerConfigurationTest](entry/src/ohosTest/ets/test/Publish/PublishComposerConfiguration.test.ets) | 辅助 CommentBoard 发布；草稿更新；辅助按用户筛选；辅助编辑状态开启 | 35 |
| [PublishConcurrencyTest](entry/src/ohosTest/ets/test/Publish/PublishConcurrency.test.ets) | 草稿更新；辅助 CommentBoard 发布；辅助编辑状态开启；辅助按用户筛选 | 20 |
| [PublishConsistencyTest](entry/src/ohosTest/ets/test/Publish/PublishConsistency.test.ets) | 草稿更新；辅助 CommentBoard 发布；辅助编辑状态开启；辅助按用户筛选 | 19 |
| [PublishEndToEndTest](entry/src/ohosTest/ets/test/Publish/PublishEndToEnd.test.ets) | 草稿更新；辅助 CommentBoard 发布；辅助按用户筛选；辅助编辑状态开启 | 19 |
| [PublishErrorRecoveryTest](entry/src/ohosTest/ets/test/Publish/PublishErrorRecovery.test.ets) | 辅助 CommentBoard 发布；草稿更新；辅助按用户筛选；辅助编辑状态开启 | 20 |
| [PublishInputInteractionTest](entry/src/ohosTest/ets/test/Publish/PublishInputInteraction.test.ets) | 辅助 CommentBoard 发布；草稿更新；辅助按用户筛选；辅助编辑状态开启 | 23 |
| [PublishLifecycleTest](entry/src/ohosTest/ets/test/Publish/PublishLifecycle.test.ets) | 辅助 CommentBoard 发布；辅助按用户筛选；草稿更新；辅助编辑状态开启 | 20 |
| [PublishOperationCatalogTest](entry/src/ohosTest/ets/test/Publish/PublishOperationCatalog.test.ets) | 辅助 CommentBoard 发布；草稿更新；辅助编辑状态开启；辅助按用户筛选 | 39 |
| [PublishOperationFlowTest](entry/src/ohosTest/ets/test/Publish/PublishOperationFlow.test.ets) | 辅助 CommentBoard 发布；草稿更新；辅助按用户筛选；辅助编辑状态开启 | 35 |
| [PublishOperationWorkflowTest](entry/src/ohosTest/ets/test/Publish/PublishOperationWorkflow.test.ets) | 辅助 CommentBoard 发布；草稿更新；辅助按用户筛选；辅助编辑状态开启 | 24 |
| [PublishOperationsTest](entry/src/ohosTest/ets/test/Publish/PublishOperations.test.ets) | 辅助 CommentBoard 发布；草稿更新；辅助编辑状态开启；辅助按用户筛选 | 26 |
| [PublishStateManagementTest](entry/src/ohosTest/ets/test/Publish/PublishStateManagement.test.ets) | 辅助 CommentBoard 发布；草稿更新；辅助按用户筛选；辅助编辑状态开启 | 20 |
| [PublishStressTest](entry/src/ohosTest/ets/test/Publish/PublishStress.test.ets) | 辅助按用户筛选；辅助 CommentBoard 发布；草稿更新；辅助编辑状态开启 | 6 |
| [PublishViewStateTest](entry/src/ohosTest/ets/test/Publish/PublishViewState.test.ets) | 辅助 CommentBoard 发布；辅助按用户筛选；草稿更新；辅助编辑状态开启 | 18 |

### DraftValidation：辅助草稿数据校验（8 个套件，225 条）

| 测试套件 | 当前检查摘要 | 用例数 |
| --- | --- | ---: |
| [DraftContentRulesTest](entry/src/ohosTest/ets/test/DraftValidation/DraftContentRules.test.ets) | 辅助 CommentBoard 发布；草稿更新；辅助编辑状态开启；字符计数 | 34 |
| [DraftInputBindingTest](entry/src/ohosTest/ets/test/DraftValidation/DraftInputBinding.test.ets) | 辅助 CommentBoard 发布；草稿更新；辅助编辑状态开启；字符计数 | 21 |
| [DraftInterruptionRecoveryTest](entry/src/ohosTest/ets/test/DraftValidation/DraftInterruptionRecovery.test.ets) | 辅助 CommentBoard 发布；草稿更新；辅助编辑状态开启；字符计数 | 26 |
| [DraftOfflineQueueTest](entry/src/ohosTest/ets/test/DraftValidation/DraftOfflineQueue.test.ets) | 辅助 CommentBoard 发布；草稿更新；辅助编辑状态开启；字符计数 | 34 |
| [DraftPublishFeedbackTest](entry/src/ohosTest/ets/test/DraftValidation/DraftPublishFeedback.test.ets) | 辅助 CommentBoard 发布；草稿更新；辅助编辑状态开启；字符计数 | 35 |
| [DraftSessionValidationTest](entry/src/ohosTest/ets/test/DraftValidation/DraftSessionValidation.test.ets) | 辅助 CommentBoard 发布；草稿更新；辅助编辑状态开启；字符计数 | 22 |
| [DraftTextNormalizationTest](entry/src/ohosTest/ets/test/DraftValidation/DraftTextNormalization.test.ets) | 辅助 CommentBoard 发布；草稿更新；辅助编辑状态开启；字符计数 | 20 |
| [DraftWhitespacePolicyTest](entry/src/ohosTest/ets/test/DraftValidation/DraftWhitespacePolicy.test.ets) | 辅助 CommentBoard 发布；草稿更新；辅助编辑状态开启；字符计数 | 33 |

### ModelValidation：评论字段和辅助数据校验（11 个套件，409 条）

| 测试套件 | 当前检查摘要 | 用例数 |
| --- | --- | ---: |
| [ModelBoundaryValuesTest](entry/src/ohosTest/ets/test/ModelValidation/ModelBoundaryValues.test.ets) | 文本哈希；生产 mockData 固定评论；评论样本构造；UUID 格式检查 | 27 |
| [ModelCloningTest](entry/src/ohosTest/ets/test/ModelValidation/ModelCloning.test.ets) | 文本哈希；生产 mockData 固定评论；UUID 格式检查；Unicode 码点计数 | 45 |
| [ModelDefaultsTest](entry/src/ohosTest/ets/test/ModelValidation/ModelDefaults.test.ets) | 文本哈希；UUID 格式检查；生产 mockData 固定评论；测试侧 UUID 形状样本 | 21 |
| [ModelEqualityTest](entry/src/ohosTest/ets/test/ModelValidation/ModelEquality.test.ets) | 文本哈希；生产 mockData 固定评论；评论样本构造；UUID 格式检查 | 44 |
| [ModelFieldTransmissionTest](entry/src/ohosTest/ets/test/ModelValidation/ModelFieldTransmission.test.ets) | 文本哈希；生产 mockData 固定评论；评论样本构造；Unicode 码点计数 | 49 |
| [ModelIdentityTest](entry/src/ohosTest/ets/test/ModelValidation/ModelIdentity.test.ets) | 文本哈希；生产 mockData 固定评论；Unicode 码点计数；评论样本构造 | 43 |
| [ModelMutationTrackingTest](entry/src/ohosTest/ets/test/ModelValidation/ModelMutationTracking.test.ets) | 文本哈希；生产 mockData 固定评论；评论样本构造；Unicode 码点计数 | 48 |
| [ModelReplyFieldsTest](entry/src/ohosTest/ets/test/ModelValidation/ModelReplyFields.test.ets) | 文本哈希；生产 mockData 固定评论；UUID 格式检查；Unicode 码点计数 | 19 |
| [ModelSerializationTest](entry/src/ohosTest/ets/test/ModelValidation/ModelSerialization.test.ets) | 文本哈希；生产 mockData 固定评论；评论样本构造；UUID 格式检查 | 33 |
| [ModelTextValidationTest](entry/src/ohosTest/ets/test/ModelValidation/ModelTextValidation.test.ets) | 文本哈希；生产 mockData 固定评论；评论样本构造；UUID 格式检查 | 26 |
| [ModelUnicodeTest](entry/src/ohosTest/ets/test/ModelValidation/ModelUnicode.test.ets) | 文本哈希；生产 mockData 固定评论；评论样本构造；UUID 格式检查 | 54 |

### Interaction：辅助交互场景数据（14 个套件，368 条）

| 测试套件 | 当前检查摘要 | 用例数 |
| --- | --- | ---: |
| [ButtonStateModelTest](entry/src/ohosTest/ets/test/Interaction/ButtonStateModel.test.ets) | Unicode 码点计数；代理对文本；ID 拼接；辅助编辑状态开启 | 32 |
| [ComposerPositionModelTest](entry/src/ohosTest/ets/test/Interaction/ComposerPositionModel.test.ets) | Unicode 码点计数；辅助编辑状态开启；草稿更新；辅助 CommentBoard 发布 | 11 |
| [ContentScalingModelTest](entry/src/ohosTest/ets/test/Interaction/ContentScalingModel.test.ets) | Unicode 码点计数；ID 拼接；辅助多次发布；ID 去重数量 | 11 |
| [DataBindingModelTest](entry/src/ohosTest/ets/test/Interaction/DataBindingModel.test.ets) | Unicode 码点计数；代理对文本；ID 拼接；辅助编辑状态开启 | 15 |
| [EventHandlingModelTest](entry/src/ohosTest/ets/test/Interaction/EventHandlingModel.test.ets) | Unicode 码点计数；代理对文本；ID 拼接；辅助编辑状态开启 | 35 |
| [EventPropagationModelTest](entry/src/ohosTest/ets/test/Interaction/EventPropagationModel.test.ets) | Unicode 码点计数；代理对文本；ID 拼接；辅助编辑状态开启 | 32 |
| [FocusNavigationModelTest](entry/src/ohosTest/ets/test/Interaction/FocusNavigationModel.test.ets) | Unicode 码点计数；代理对文本；ID 拼接；辅助编辑状态开启 | 44 |
| [FocusRingModelTest](entry/src/ohosTest/ets/test/Interaction/FocusRingModel.test.ets) | Unicode 码点计数；代理对文本；ID 拼接；辅助编辑状态开启 | 25 |
| [GestureRecognitionModelTest](entry/src/ohosTest/ets/test/Interaction/GestureRecognitionModel.test.ets) | Unicode 码点计数；代理对文本；ID 拼接；辅助编辑状态开启 | 32 |
| [NavigationModelTest](entry/src/ohosTest/ets/test/Interaction/NavigationModel.test.ets) | Unicode 码点计数；代理对文本；ID 拼接；辅助编辑状态开启 | 33 |
| [RenderPipelineModelTest](entry/src/ohosTest/ets/test/Interaction/RenderPipelineModel.test.ets) | Unicode 码点计数；代理对文本；ID 拼接；辅助编辑状态开启 | 28 |
| [ThemeVariationModelTest](entry/src/ohosTest/ets/test/Interaction/ThemeVariationModel.test.ets) | ID 拼接；辅助编辑状态开启；草稿更新；辅助 CommentBoard 发布 | 11 |
| [TouchInteractionModelTest](entry/src/ohosTest/ets/test/Interaction/TouchInteractionModel.test.ets) | Unicode 码点计数；代理对文本；ID 拼接；辅助编辑状态开启 | 35 |
| [VisualEffectsModelTest](entry/src/ohosTest/ets/test/Interaction/VisualEffectsModel.test.ets) | Unicode 码点计数；代理对文本；ID 拼接；辅助编辑状态开启 | 24 |

### LifecycleState：辅助状态序列（10 个套件，216 条）

| 测试套件 | 当前检查摘要 | 用例数 |
| --- | --- | ---: |
| [AbilityLifecycleTest](entry/src/ohosTest/ets/test/LifecycleState/AbilityLifecycle.test.ets) | 辅助按用户筛选；辅助编辑状态开启；草稿更新；辅助 CommentBoard 发布 | 26 |
| [BoardErrorRecoveryTest](entry/src/ohosTest/ets/test/LifecycleState/BoardErrorRecovery.test.ets) | 辅助按用户筛选；辅助编辑状态开启；草稿更新；辅助 CommentBoard 发布 | 38 |
| [BoardExceptionHandlingTest](entry/src/ohosTest/ets/test/LifecycleState/BoardExceptionHandling.test.ets) | 辅助按用户筛选；辅助编辑状态开启；草稿更新；辅助 CommentBoard 发布 | 38 |
| [BoardResourceManagementTest](entry/src/ohosTest/ets/test/LifecycleState/BoardResourceManagement.test.ets) | 辅助编辑状态开启；辅助按用户筛选；草稿更新；辅助 CommentBoard 发布 | 14 |
| [BoardSessionManagementTest](entry/src/ohosTest/ets/test/LifecycleState/BoardSessionManagement.test.ets) | 辅助按用户筛选；辅助编辑状态开启；草稿更新；辅助 CommentBoard 发布 | 17 |
| [BoardStateManagementTest](entry/src/ohosTest/ets/test/LifecycleState/BoardStateManagement.test.ets) | 辅助按用户筛选；辅助编辑状态开启；草稿更新；辅助 CommentBoard 发布 | 37 |
| [BoardStatePersistenceTest](entry/src/ohosTest/ets/test/LifecycleState/BoardStatePersistence.test.ets) | 辅助按用户筛选；辅助编辑状态开启；草稿更新；辅助 CommentBoard 发布 | 11 |
| [BoardStateRecoveryTest](entry/src/ohosTest/ets/test/LifecycleState/BoardStateRecovery.test.ets) | 辅助按用户筛选；辅助编辑状态开启；草稿更新；辅助 CommentBoard 发布 | 11 |
| [ComposerLifecycleTest](entry/src/ohosTest/ets/test/LifecycleState/ComposerLifecycle.test.ets) | 辅助编辑状态开启；草稿更新；辅助 CommentBoard 发布；辅助按用户筛选 | 10 |
| [PageConfigurationTest](entry/src/ohosTest/ets/test/LifecycleState/PageConfiguration.test.ets) | 辅助按用户筛选；辅助编辑状态开启；草稿更新；辅助 CommentBoard 发布 | 14 |

### PerformanceStability：辅助批次与循环（7 个套件，130 条）

| 测试套件 | 当前检查摘要 | 用例数 |
| --- | --- | ---: |
| [ConcurrencyControlTest](entry/src/ohosTest/ets/test/PerformanceStability/ConcurrencyControl.test.ets) | 辅助按用户筛选；辅助编辑状态开启；草稿更新；辅助 CommentBoard 发布 | 7 |
| [LongTermStabilityTest](entry/src/ohosTest/ets/test/PerformanceStability/LongTermStability.test.ets) | 辅助按用户筛选；辅助编辑状态开启；草稿更新；辅助 CommentBoard 发布 | 8 |
| [MemoryLeakDetectionTest](entry/src/ohosTest/ets/test/PerformanceStability/MemoryLeakDetection.test.ets) | 辅助按用户筛选；辅助编辑状态开启；草稿更新；辅助 CommentBoard 发布 | 8 |
| [PerformanceStressTest](entry/src/ohosTest/ets/test/PerformanceStability/PerformanceStress.test.ets) | 辅助按用户筛选；辅助编辑状态开启；草稿更新；辅助 CommentBoard 发布 | 21 |
| [RenderLoopPerformanceTest](entry/src/ohosTest/ets/test/PerformanceStability/RenderLoopPerformance.test.ets) | 辅助按用户筛选；辅助编辑状态开启；草稿更新；辅助 CommentBoard 发布 | 29 |
| [ThroughputProfileTest](entry/src/ohosTest/ets/test/PerformanceStability/ThroughputProfile.test.ets) | 辅助按用户筛选；辅助编辑状态开启；草稿更新；辅助 CommentBoard 发布 | 28 |
| [WorkloadBudgetTest](entry/src/ohosTest/ets/test/PerformanceStability/WorkloadBudget.test.ets) | 辅助按用户筛选；辅助编辑状态开启；草稿更新；辅助 CommentBoard 发布 | 29 |

### Integration：评论数据和辅助模型组合（9 个套件，142 条）

| 测试套件 | 当前检查摘要 | 用例数 |
| --- | --- | ---: |
| [AdvancedScenariosTest](entry/src/ohosTest/ets/test/Integration/AdvancedScenarios.test.ets) | 文本哈希；生产 mockData 固定评论；辅助编辑状态开启；草稿更新 | 9 |
| [CompatibilityMatrixTest](entry/src/ohosTest/ets/test/Integration/CompatibilityMatrix.test.ets) | 文本哈希；生产 mockData 固定评论；辅助编辑状态开启；草稿更新 | 24 |
| [ComprehensiveRegressionTest](entry/src/ohosTest/ets/test/Integration/ComprehensiveRegression.test.ets) | 文本哈希；生产 mockData 固定评论；辅助编辑状态开启；草稿更新 | 18 |
| [DeviceCompatibilityTest](entry/src/ohosTest/ets/test/Integration/DeviceCompatibility.test.ets) | 文本哈希；辅助编辑状态开启；草稿更新；辅助 CommentBoard 发布 | 4 |
| [IntegrationTestingTest](entry/src/ohosTest/ets/test/Integration/IntegrationTesting.test.ets) | 文本哈希；生产 mockData 固定评论；辅助编辑状态开启；草稿更新 | 15 |
| [LocalizationTestingTest](entry/src/ohosTest/ets/test/Integration/LocalizationTesting.test.ets) | 文本哈希；生产 mockData 固定评论；辅助编辑状态开启；草稿更新 | 26 |
| [OfflineCommentSyncTest](entry/src/ohosTest/ets/test/Integration/OfflineCommentSync.test.ets) | 生产 mockData 固定评论；辅助脚本操作序列；ID 去重数量；ID 拼接 | 5 |
| [SystemIntegrationTest](entry/src/ohosTest/ets/test/Integration/SystemIntegration.test.ets) | 文本哈希；生产 mockData 固定评论；辅助编辑状态开启；草稿更新 | 14 |
| [UserScenariosTest](entry/src/ohosTest/ets/test/Integration/UserScenarios.test.ets) | 文本哈希；生产 mockData 固定评论；辅助编辑状态开启；草稿更新 | 27 |

### Security：辅助文本与输入场景（3 个套件，49 条）

| 测试套件 | 当前检查摘要 | 用例数 |
| --- | --- | ---: |
| [DataExposureTest](entry/src/ohosTest/ets/test/Security/DataExposure.test.ets) | Unicode 码点计数；辅助回复元数据；代理对文本；辅助编辑状态开启 | 14 |
| [InputSanitizationTest](entry/src/ohosTest/ets/test/Security/InputSanitization.test.ets) | Unicode 码点计数；代理对文本；辅助回复元数据；辅助编辑状态开启 | 23 |
| [SecurityValidationTest](entry/src/ohosTest/ets/test/Security/SecurityValidation.test.ets) | Unicode 码点计数；辅助回复元数据；代理对文本；评论样本构造 | 12 |

## 框架、断言及覆盖边界

测试使用 `@ohos/hypium` 的 `describe` / `it` / `expect`，当前断言包括 `assertEqual`、
`assertTrue`、`assertFalse`、`assertNull` 和 `assertLarger`。
beforeAll 等钩子输出套件日志；部分 beforeEach 使用 `Promise<void>` 和 1 ms 定时调度，
由零参回调调用 `resolve(undefined)`。这些调度不代表真实网络、并发发布或后台任务被执行。
Runner 直接分发 `Hypium.hypiumTest`，通过 delegator 输出启动回执，未在测试中驱动真实页面。

| 类型 | 当前来源 | 实际检查内容 |
| --- | --- | --- |
| 生产类型 | [NewsCommentModel.ets](entry/src/main/ets/model/NewsCommentModel.ets) | `id / url / user / replyId / replyUser / text / commentTime` 七字段的样本构造、读写及复制 |
| 生产固定数据 | [NewsDetailData.ets](entry/src/main/ets/mock/NewsDetailData.ets) | `mockData` 的八条评论及 `curUser`，与独立固定期望对照 |
| 测试侧发布模型 | [SharedDriver.ets](entry/src/ohosTest/ets/test/Shared/SharedDriver.ets) 中的 CommentBoard | `openComposer / updateDraft / publish / cancel / reply / byUser / reset / ids` 及计数、快照和脚本序列 |
| 测试侧预期和工具 | 同一 SharedDriver | 固定时间解析/格式化、UUID 形状/确定性样本、文本哈希、码点计数、字段和 ID 对照 |
| 运行时依赖 | Ability.test 中的 delegator / bundleManager | 读取真实测试上下文和本包元信息，不验证 UIAbility 的前后台切换 |
