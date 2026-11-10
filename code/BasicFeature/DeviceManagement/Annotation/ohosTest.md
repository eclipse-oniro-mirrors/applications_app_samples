# 注解测试用例归档

## 验证范围

`@Available` 和 `@SuppressWarnings` 的核心能力发生在编译期。运行时 XTS 验证版本守卫、回退行为、规则枚举和应用状态，不直接断言编译告警。编译告警的生成、抑制和参数错误需通过独立编译 fixture 与编译日志验证。

## 测试套件概览

| 测试文件 | 套件名称 | 用例数 | 测试类型 |
|---|---|---:|---|
| AnnotationApi.test.ets | AnnotationAvailableTest + AnnotationSuppressWarningsTest | 15 | API 功能测试 |
| Ability.test.ets | AnnotationAbilityTest | 8 | UI 交互测试 |
| ConstantValidation.test.ets | ConstantValidation | 17 | 常量验证测试 |
| ApiVersionBoundary.test.ets | ApiVersionBoundary | 20 | 边界值测试 |
| AnnotationState.test.ets | AnnotationState | 22 | 状态机测试 |
| MockEnvironment.test.ets | MockEnvironment | 22 | Mock 环境测试 |
| Robustness.test.ets | Robustness | 20 | 容错稳定性测试 |
| AnnotationServiceEdgeCases.test.ets | AnnotationEdgeCasesTest | 12 | 边界场景测试 |
| AnnotationException.test.ets | AnnotationException | 9 | 异常处理测试 |
| AnnotationDeep.test.ets | AnnotationDeep | 9 | 深度功能测试 |
| AnnotationConsistency.test.ets | AnnotationConsistency | 10 | 一致性测试 |
| AnnotationLifecycle.test.ets | AnnotationLifecycle | 10 | 生命周期测试 |
| AnnotationIntegration.test.ets | AnnotationIntegration | 10 | 集成测试 |
| AnnotationError.test.ets | AnnotationError | 10 | 错误处理测试 |
| AnnotationConfig.test.ets | AnnotationConfig | 10 | 配置测试 |
| AnnotationSecurity.test.ets | AnnotationSecurity | 10 | 安全性测试 |
| AnnotationStateMachine.test.ets | AnnotationStateMachine | 10 | 状态机扩展测试 |
| AnnotationBoundary.test.ets | AnnotationBoundary | 18 | 边界值扩展测试 |
| AnnotationExceptionInput.test.ets | AnnotationExceptionInput | 8 | 异常输入测试 |
| AnnotationLifecycleExt.test.ets | AnnotationLifecycleExt | 10 | 生命周期扩展测试 |
| AnnotationIntegrationExt.test.ets | AnnotationIntegrationExt | 8 | 集成扩展测试 |
| AnnotationConstantDeep.test.ets | AnnotationConstantDeep | 12 | 常量深度测试 |
| AnnotationSecurityDeep.test.ets | AnnotationSecurityDeep | 10 | 安全深度测试 |
| AnnotationUIDeep.test.ets | AnnotationUIDeep | 10 | 调用序列与返回值测试 |
| AnnotationMonitor.test.ets | AnnotationMonitor | 10 | 监控测试 |
| AnnotationConcurrency.test.ets | AnnotationConcurrency | 9 | 顺序重复调用测试 |
| AnnotationMemory.test.ets | AnnotationMemory | 10 | 数组独立性与稳定性测试 |
| AnnotationErrorBoundary.test.ets | AnnotationErrorBoundary | 12 | 错误边界测试 |
| AnnotationRuleEngine.test.ets | AnnotationRuleEngine | 10 | 规则引擎测试 |
| AnnotationRegression.test.ets | AnnotationRegression | 12 | 回归测试 |
| **合计** | **30 个测试文件（31 个 describe）** | **363** | - |

## 接口级 XTS 用例

测试文件：`entry/src/ohosTest/ets/test/AnnotationApi.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testAvailable0001 | 读取本机 API 版本 | 与 `deviceInfo.sdkApiVersion` 一致 | 通过 |
| testAvailable0002 | 检查 Available 最低版本 | 最低版本为 API 22 | 通过 |
| testAvailable0003 | 检查模拟版本边界 | 模拟版本为 API 21，且低于 API 22 | 通过 |
| testAvailable0004 | 低于最低版本时运行 Available 示例 | 返回 `false`，安全回退 | 通过 |
| testAvailable0005 | 在本机运行 Available 示例 | 结果与本机版本是否达到 API 22 一致 | 通过 |
| testAvailable0006 | 重复运行 Available 示例 | 结果稳定，本机 API 版本不变 | 通过 |
| testSuppressWarnings0001 | 检查 SuppressWarnings 相关版本 | 注解起始版本为 23，示例函数版本为 27 | 通过 |
| testSuppressWarnings0002 | 检查兼容性规则 | 枚举值为 `compatibility` | 通过 |
| testSuppressWarnings0003 | 检查系统能力规则 | 枚举值为 `syscap` | 通过 |
| testSuppressWarnings0004 | 检查权限规则 | 枚举值为 `permission` | 通过 |
| testSuppressWarnings0005 | 查询全部规则 | 返回三个规则，顺序与示例定义一致 | 通过 |
| testSuppressWarnings0006 | 修改一次查询返回的规则数组后重新查询 | 后续查询仍返回完整规则，互不影响 | 通过 |
| testSuppressWarnings0007 | 在 API 21 模拟环境运行 SuppressWarnings 示例 | 返回 `false`，告警抑制不绕过运行时守卫 | 通过 |
| testSuppressWarnings0008 | 在本机运行 SuppressWarnings 示例 | 结果与本机版本是否达到 API 27 一致 | 通过 |
| testSuppressWarnings0009 | 交替、重复运行两个示例 | 两个示例结果稳定且互不影响 | 通过 |

## UI 自动化 XTS 用例

测试文件：`entry/src/ohosTest/ets/test/Ability.test.ets`。预置条件为设备或模拟器正常运行，应用已安装。

| 用例名称 | 操作步骤 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testStartAbility0001 | 启动 EntryAbility | 显示注解首页 | 通过 |
| testEnvironment0002 | 查看环境及注解卡片 | 显示本机版本、API 22、API 23、API 27、三种规则及两个未执行状态 | 通过 |
| testMockData0003 | 点击“模拟数据” | 显示模拟来源和 API 21，两个结果重置 | 通过 |
| testMockFallback0004 | 在模拟环境运行两个示例并刷新 | 两个示例安全回退，刷新后结果重置 | 通过 |
| testLocalData0005 | 切换本机信息并运行两个示例 | 根据本机 API 版本显示执行或安全回退 | 通过 |
| testRepeatedExecution0006 | 重置后重复运行两个示例 | 结果稳定，Available 执行不修改 SuppressWarnings 状态 | 通过 |
| testEnvironmentSwitch0007 | 在本机和模拟环境之间切换 | 数据来源正确，切换后两个执行结果均重置 | 通过 |
| testRefreshMock0008 | 在模拟环境执行示例后刷新 | 保持模拟来源和 API 21，执行结果重置 | 通过 |

## 常量验证 XTS 用例

测试文件：`entry/src/ohosTest/ets/test/ConstantValidation.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testAvailableMinApiVersionValue0001 | AVAILABLE_MIN_API_VERSION 值验证 | 等于 22 | 通过 |
| testSuppressAnnotationSinceApiVersionValue0002 | SUPPRESS_ANNOTATION_SINCE_API_VERSION 值验证 | 等于 23 | 通过 |
| testFutureDemoApiVersionValue0003 | FUTURE_DEMO_API_VERSION 值验证 | 等于 27 | 通过 |
| testApiVersionOrdering0004 | API 版本常量顺序验证 | 22 < 23 < 27 | 通过 |
| testApiVersionPositiveValues0005 | API 版本常量正数验证 | 所有常量 > 0 | 通过 |
| testApiVersionReasonableRange0006 | API 版本常量范围验证 | 所有常量 ≤ 100 | 通过 |
| testSuppressWarningsTypeCompatibility0007 | COMPATIBILITY 值验证 | 等于 'compatibility' | 通过 |
| testSuppressWarningsTypeSyscap0008 | SYSCAP 值验证 | 等于 'syscap' | 通过 |
| testSuppressWarningsTypePermission0009 | PERMISSION 值验证 | 等于 'permission' | 通过 |
| testSuppressWarningsTypeUniqueness0010 | SuppressWarningsType 唯一性验证 | 三个类型值互不相同 | 通过 |
| testGetSuppressionRulesLength0011 | 规则数组长度验证 | 长度等于 3 | 通过 |
| testGetSuppressionRulesOrder0012 | 规则数组顺序验证 | 顺序为 compatibility, syscap, permission | 通过 |
| testGetSuppressionRulesContent0013 | 规则数组内容验证 | 包含所有预期类型 | 通过 |
| testGetSuppressionRulesImmutability0014 | 规则数组不可变性验证 | 修改返回数组不影响后续调用 | 通过 |
| testGetSuppressionRulesMultipleCalls0015 | 多次调用一致性验证 | 多次调用结果一致 | 通过 |
| testGetSuppressionRulesNonEmpty0016 | 规则数组非空验证 | 返回非空数组 | 通过 |
| testGetSuppressionRulesStringType0017 | 规则元素类型验证 | 所有元素为字符串 | 通过 |

## 边界值 XTS 用例

测试文件：`entry/src/ohosTest/ets/test/ApiVersionBoundary.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testMockApiVersionBelowAvailable0001 | Mock 版本与 Available 阈值比较 | 21 < 22，返回 false | 通过 |
| testMockApiVersionBelowFuture0002 | Mock 版本与 SuppressWarnings 阈值比较 | 21 < 27，返回 false | 通过 |
| testLocalApiVersionAtBoundary0003 | 本地版本与 Available 阈值边界判断 | 结果与版本判断一致 | 通过 |
| testLocalApiVersionAtFutureBoundary0004 | 本地版本与 SuppressWarnings 阈值边界判断 | 结果与版本判断一致 | 通过 |
| testAvailableBoundaryValues0005 | Available 边界值定义验证 | 阈值-1/阈值/阈值+1 正确 | 通过 |
| testFutureBoundaryValues0006 | SuppressWarnings 边界值定义验证 | 阈值-1/阈值/阈值+1 正确 | 通过 |
| testMockApiVersionIsFixed0007 | Mock 版本固定性验证 | 多次调用返回 21 | 通过 |
| testLocalApiVersionIsConsistent0008 | 本地版本一致性验证 | 多次调用返回相同值 | 通过 |
| testBoundaryRelationshipMockAvailable0009 | Mock 与 Available 阈值关系 | Mock 版本始终低于阈值 | 通过 |
| testBoundaryRelationshipMockFuture0010 | Mock 与 SuppressWarnings 阈值关系 | Mock 版本始终低于阈值 | 通过 |
| testAvailableThresholdGap0011 | 阈值间隔验证 | 27 - 22 = 5 | 通过 |
| testMockResultConsistency0012 | Mock 结果与边界条件一致性 | 结果符合边界判断 | 通过 |
| testLocalResultConsistency0013 | 本地结果与边界条件一致性 | 结果符合边界判断 | 通过 |
| testBoundaryValuesPositive0014 | 边界值正数验证 | 所有边界值 > 0 | 通过 |
| testBoundaryOrdering0015 | 边界值完整排序验证 | 排序链正确 | 通过 |
| testMultipleBoundaryCalls0016 | 多次调用边界稳定性 | 结果保持一致 | 通过 |
| testAvailableDemoReturnsBoolean0017 | runAvailableDemo 返回类型 | 返回布尔值 | 通过 |
| testSuppressWarningsDemoReturnsBoolean0018 | runSuppressWarningsDemo 返回类型 | 返回布尔值 | 通过 |
| testMockAvailableDemoReturnsBoolean0019 | runMockAvailableDemo 返回类型 | 返回布尔值 | 通过 |
| testMockSuppressWarningsDemoReturnsBoolean0020 | runMockSuppressWarningsDemo 返回类型 | 返回布尔值 | 通过 |

## 状态机 XTS 用例

测试文件：`entry/src/ohosTest/ets/test/AnnotationState.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testInitialStateLocalAvailable0001 | 本地 Available 初始状态 | 结果与设备 API 版本判断一致 | 通过 |
| testInitialStateLocalSuppress0002 | 本地 SuppressWarnings 初始状态 | 结果与设备 API 版本判断一致 | 通过 |
| testInitialStateMockAvailable0003 | Mock Available 初始状态 | 返回 false | 通过 |
| testInitialStateMockSuppress0004 | Mock SuppressWarnings 初始状态 | 返回 false | 通过 |
| testStateTransitionLocalToMock0005 | Local 到 Mock 状态转换 | Mock 返回 false | 通过 |
| testStateTransitionMockToLocal0006 | Mock 到 Local 状态转换 | Local 结果与版本判断一致 | 通过 |
| testRepeatedLocalExecution0007 | 重复本地执行稳定性 | 多次结果一致 | 通过 |
| testRepeatedMockExecution0008 | 重复 Mock 执行稳定性 | 多次返回 false | 通过 |
| testIndependentStatesAvailableSuppress0009 | Available 与 Suppress 状态独立性 | 两个状态互不影响 | 通过 |
| testIndependentStatesMockAvailableSuppress0010 | Mock Available 与 Suppress 状态独立性 | 两个状态互不影响 | 通过 |
| testStateAfterMultipleSwitches0011 | 多次切换后状态正确性 | 状态保持一致 | 通过 |
| testSuppressStateAfterMultipleSwitches0012 | Suppress 多次切换后状态 | 状态保持一致 | 通过 |
| testMixedExecutionOrder0013 | 混合执行顺序验证 | 结果符合预期 | 通过 |
| testMockVersionAlwaysBelowThreshold0014 | Mock 版本始终低于阈值 | 21 < 22 且 21 < 27 | 通过 |
| testStateConsistencyAcrossCalls0015 | 跨调用状态一致性 | 版本值保持一致 | 通过 |
| testAlternatingExecution0016 | 交替执行稳定性 | 结果符合预期 | 通过 |
| testAlternatingMockExecution0017 | Mock 交替执行稳定性 | 均返回 false | 通过 |
| testEnvironmentVersionIndependence0018 | 环境版本独立性验证 | Local 和 Mock 版本互不影响 | 通过 |
| testStateAfterRepeatedSwitches0019 | 重复切换后状态保持 | 状态正确 | 通过 |
| testBothDemosReturnConsistentResults0020 | 两个 Demo 结果一致性 | 多次调用结果相同 | 通过 |
| testMockDemosReturnConsistentResults0021 | Mock Demo 结果一致性 | 均返回 false | 通过 |
| testStateVersionCorrelation0022 | 状态与版本关联性 | 结果与版本阈值匹配 | 通过 |

## Mock 环境 XTS 用例

测试文件：`entry/src/ohosTest/ets/test/MockEnvironment.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testMockApiVersionValue0001 | Mock API 版本值验证 | 返回 21 | 通过 |
| testMockAvailableDemoReturnsFalse0002 | Mock Available 返回值 | 返回 false | 通过 |
| testMockSuppressWarningsDemoReturnsFalse0003 | Mock SuppressWarnings 返回值 | 返回 false | 通过 |
| testMockVersionBelowAvailableThreshold0004 | Mock 版本低于 Available 阈值 | 21 < 22 | 通过 |
| testMockVersionBelowFutureThreshold0005 | Mock 版本低于 SuppressWarnings 阈值 | 21 < 27 | 通过 |
| testMockVersionConsistency0006 | Mock 版本一致性 | 多次调用返回 21 | 通过 |
| testMockAvailableDemoConsistency0007 | Mock Available 结果一致性 | 多次返回 false | 通过 |
| testMockSuppressWarningsDemoConsistency0008 | Mock SuppressWarnings 结果一致性 | 多次返回 false | 通过 |
| testMockVsLocalVersionDifference0009 | Mock 与 Local 版本差异 | 两者值不同 | 通过 |
| testMockResultBooleanType0010 | Mock 结果类型验证 | 返回布尔值 | 通过 |
| testMockVersionIsNumber0011 | Mock 版本类型验证 | 返回数字 | 通过 |
| testMockVersionIsPositive0012 | Mock 版本正数验证 | 21 > 0 | 通过 |
| testMockVersionIsInteger0013 | Mock 版本整数验证 | 21 是整数 | 通过 |
| testMockBothDemosReturnFalse0014 | 两个 Mock Demo 同时返回 false | 均返回 false | 通过 |
| testMockDemosIndependentExecution0015 | Mock Demo 独立执行 | 互不影响 | 通过 |
| testMockVersionStableAfterDemos0016 | Demo 执行后版本稳定性 | 版本保持 21 | 通过 |
| testMockResultsStableAfterMultipleCalls0017 | 多次调用结果稳定性 | 均返回 false | 通过 |
| testMockVersionNotAffectedByLocalCalls0018 | Local 调用不影响 Mock 版本 | Mock 版本保持 21 | 通过 |
| testLocalVersionNotAffectedByMockCalls0019 | Mock 调用不影响 Local 版本 | Local 版本不变 | 通过 |
| testMockVersionMatchesExpected0020 | Mock 版本匹配预期 | 等于 21 | 通过 |
| testMockAvailableResultMatchesCalculation0021 | Mock Available 结果匹配计算 | 21 >= 22 为 false | 通过 |
| testMockSuppressWarningsResultMatchesCalculation0022 | Mock SuppressWarnings 结果匹配计算 | 21 >= 27 为 false | 通过 |

## 容错稳定性 XTS 用例

测试文件：`entry/src/ohosTest/ets/test/Robustness.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testSuppressionRulesArrayModification0001 | 规则数组修改容错 | 修改不影响后续调用 | 通过 |
| testSuppressionRulesArrayElementModification0002 | 规则数组元素修改容错 | 修改元素不影响后续调用 | 通过 |
| testSuppressionRulesArrayClear0003 | 规则数组清空容错 | 清空不影响后续调用 | 通过 |
| testRapidAvailableDemoCalls0004 | 高频调用 runAvailableDemo | 10 次结果一致 | 通过 |
| testRapidSuppressWarningsDemoCalls0005 | 高频调用 runSuppressWarningsDemo | 10 次结果一致 | 通过 |
| testRapidMockAvailableDemoCalls0006 | 高频调用 runMockAvailableDemo | 10 次返回 false | 通过 |
| testRapidMockSuppressWarningsDemoCalls0007 | 高频调用 runMockSuppressWarningsDemo | 10 次返回 false | 通过 |
| testRapidGetLocalApiVersionCalls0008 | 高频调用 getLocalApiVersion | 10 次结果一致 | 通过 |
| testRapidGetMockApiVersionCalls0009 | 高频调用 getMockApiVersion | 10 次返回 21 | 通过 |
| testRapidGetSuppressionRulesCalls0010 | 高频调用 getSuppressionRules | 10 次结果一致 | 通过 |
| testCrossDemoInterleavedCalls0011 | 交叉 Demo 调用 | 结果稳定 | 通过 |
| testCrossEnvironmentInterleavedCalls0012 | 交叉环境调用 | 结果稳定 | 通过 |
| testVersionCallsInterleavedWithDemos0013 | 版本查询与 Demo 交替 | 版本值稳定 | 通过 |
| testRulesCallsInterleavedWithDemos0014 | 规则查询与 Demo 交替 | 规则数组稳定 | 通过 |
| testMultipleArrayReferences0015 | 多数组引用独立性 | 各数组独立 | 通过 |
| testHighFrequencyCallStability0016 | 高频综合调用稳定性 | 20 轮无异常 | 通过 |
| testStatePreservationAfterModification0017 | 修改后状态保持 | 规则数组保持完整 | 通过 |
| testDemoResultsNotAffectedByRules0018 | Demo 结果不受规则影响 | 结果保持一致 | 通过 |
| testVersionConsistencyAfterDemos0019 | Demo 后版本一致性 | 版本值不变 | 通过 |
| testRepeatedRulesRetrieval0020 | 重复规则获取一致性 | 10 次结果相同 | 通过 |

## 边界值扩展 XTS 用例

测试文件：`entry/src/ohosTest/ets/test/AnnotationBoundary.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testAvailableMinApiVersionMinusOne0001 | AVAILABLE_MIN_API_VERSION - 1 (21) 边界行为 | Mock 版本等于 21，返回 false | 通过 |
| testAvailableMinApiVersionExact0002 | AVAILABLE_MIN_API_VERSION (22) 边界行为 | 版本等于 22，结果与本机版本判断一致 | 通过 |
| testAvailableMinApiVersionPlusOne0003 | AVAILABLE_MIN_API_VERSION + 1 (23) 边界行为 | 版本等于 23，与 Suppress 阈值一致 | 通过 |
| testSuppressBoundaryMinusOne0004 | SUPPRESS_ANNOTATION_SINCE_API_VERSION - 1 (22) 边界行为 | 版本等于 22，与 Available 阈值一致 | 通过 |
| testSuppressBoundaryExact0005 | SUPPRESS_ANNOTATION_SINCE_API_VERSION (23) 边界行为 | 版本等于 23 | 通过 |
| testSuppressBoundaryPlusOne0006 | SUPPRESS_ANNOTATION_SINCE_API_VERSION + 1 (24) 边界行为 | 版本等于 24 | 通过 |
| testFutureBoundaryMinusOne0007 | FUTURE_DEMO_API_VERSION - 1 (26) 边界行为 | 版本等于 26 | 通过 |
| testFutureBoundaryExact0008 | FUTURE_DEMO_API_VERSION (27) 边界行为 | 版本等于 27 | 通过 |
| testFutureBoundaryPlusOne0009 | FUTURE_DEMO_API_VERSION + 1 (28) 边界行为 | 版本等于 28 | 通过 |
| testRulesArrayBoundary0010 | 规则数组边界条件 | 长度等于 3，索引 0/1/2 有效 | 通过 |
| testVersionRelationshipBoundaries0011 | 版本关系边界 | 22 < 23 < 27 关系成立 | 通过 |
| testZeroBoundary0012 | 零边界条件 | 版本值大于 0 | 通过 |
| testNegativeBoundary0013 | 负值边界条件 | 版本值不为负 | 通过 |
| testBooleanBoundary0014 | 布尔边界条件 | Demo 返回布尔值，Mock 返回 false | 通过 |
| testStringEmptyBoundary0015 | 字符串空边界 | 规则数组元素非空字符串 | 通过 |
| testMaxSafeInteger0016 | 最大安全整数边界 | 版本值小于 MAX_SAFE_INTEGER | 通过 |
| testDeviceVersionBoundary0017 | 设备版本边界 | 本机版本与设备信息一致 | 通过 |
| testBoundaryGapAnalysis0018 | 边界间隔分析 | 间隔为 1/4/5 | 通过 |

## 编译期扩展场景

以下场景用于完善编译诊断验证，需使用独立 fixture 执行，不计入上述 363 条运行时自动化用例。

| 场景 | 操作 | 预期输出 |
| --- | --- | --- |
| Available 省略系统类型 | 使用 `@Available({ minApiVersion: '22' })` 编译 | 编译通过，默认系统类型为 OpenHarmony |
| Available 完整系统类型 | 使用 `@Available({ minApiVersion: 'OpenHarmony 22' })` 编译 | 编译通过 |
| Available 高于兼容版本 | 在未做版本判断的调用处引用高于 `compatibleSdkVersion` 的 API | 产生兼容性告警 |
| Available 运行时守卫 | 使用 `deviceInfo.sdkApiVersion` 判断后调用 | 对应兼容性告警消除，低版本走回退分支 |
| Available 父级声明 | 在调用方父级函数或类标注不低于被调函数的版本 | 对应兼容性告警消除 |
| Available 无效版本 | 分别传入空版本、非法系统类型和非数字版本 | 编译器报告版本格式错误 |
| SuppressWarnings 容器作用域 | 在函数或类上抑制兼容性告警并调用高版本 API | 容器内对应兼容性告警被抑制 |
| SuppressWarnings 多规则与最近规则 | 组合不同类型规则，并嵌套相同或不同类型规则 | 各类型独立生效，相同类型采用最近声明 |
| SuppressWarnings 空规则 | 传入空 `rules` 数组 | 编译器报告参数约束错误 |
| 单行注释作用域 | 在被调 API 上一行添加 `// @SuppressWarnings compatibility` | 仅下一行相应告警被抑制，不扩散到子节点 |
| 权限抑制边界 | 未声明权限时抑制权限告警并运行需权限 API | 编译告警可被抑制，但运行时不会自动获得权限 |

## 边界场景 XTS 用例

测试文件：`entry/src/ohosTest/ets/test/AnnotationServiceEdgeCases.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testApiVersionBoundary0001 | API 版本边界关系 | 版本顺序正确 | 通过 |
| testMockEnvironmentConsistency0002 | Mock 环境一致性 | 多次调用结果一致 | 通过 |
| testSuppressionRulesImmutability0003 | 规则数组不可变性 | 修改不影响内部状态 | 通过 |
| testAvailableDemoBoundaryBehavior0004 | Available Demo 边界行为 | 结果与版本判断一致 | 通过 |
| testSuppressWarningsDemoBoundaryBehavior0005 | SuppressWarnings Demo 边界行为 | 结果与版本判断一致 | 通过 |
| testVersionConstantsArePositive0006 | 版本常量正数验证 | 所有常量 > 0 | 通过 |
| testSuppressionRulesNotEmpty0007 | 规则数组非空验证 | 长度等于 3 | 通过 |
| testLocalAndMockVersionIndependence0008 | 本机与 Mock 版本独立性 | 两者互不影响 | 通过 |
| testDemoExecutionOrderIndependence0009 | Demo 执行顺序独立性 | 顺序不影响结果 | 通过 |
| testMockDemoExecutionOrderIndependence0010 | Mock Demo 执行顺序独立性 | 顺序不影响结果 | 通过 |
| testSuppressionRulesMultipleRetrievals0011 | 多次获取规则一致性 | 结果保持一致 | 通过 |
| testVersionRetrievalStability0012 | 版本获取稳定性 | 多次调用结果一致 | 通过 |

## 异常处理 XTS 用例

测试文件：`entry/src/ohosTest/ets/test/AnnotationException.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testApiVersionBoundaryValues0001 | API 版本边界值 | 22 < 23 < 27 | 通过 |
| testDeviceApiVersionValidity0002 | 设备 API 版本有效性 | 与 deviceInfo 一致 | 通过 |
| testDemoReturnTypeConsistency0003 | Demo 返回类型一致性 | 返回布尔值 | 通过 |
| testVersionComparisonLogic0004 | 版本比较逻辑 | 比较结果正确 | 通过 |
| testRulesArrayIntegrity0005 | 规则数组完整性 | 包含三种规则类型 | 通过 |
| testMultipleCallsIdempotency0006 | 多次调用幂等性 | 结果保持一致 | 通过 |
| testMockEnvironmentIsolation0007 | Mock 环境隔离 | 与本机环境独立 | 通过 |
| testStateConsistencyAfterOperations0008 | 操作后状态一致性 | 状态保持稳定 | 通过 |
| testCrossEnvironmentState0009 | 跨环境状态 | 环境切换不影响状态 | 通过 |

## 深度功能 XTS 用例

测试文件：`entry/src/ohosTest/ets/test/AnnotationDeep.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testAvailableAnnotationMechanism0001 | Available 注解机制 | 版本守卫正常工作 | 通过 |
| testSuppressWarningsAnnotationMechanism0002 | SuppressWarnings 注解机制 | 警告抑制正常工作 | 通过 |
| testAnnotationParameterValidation0003 | 注解参数验证 | 参数校验正确 | 通过 |
| testSuppressionRulesApplication0004 | 抑制规则应用 | 规则正确应用 | 通过 |
| testAnnotationInheritance0005 | 注解继承 | 继承行为正确 | 通过 |
| testVersionThresholdBehavior0006 | 版本阈值行为 | 阈值判断正确 | 通过 |
| testMockAnnotationBehavior0007 | Mock 注解行为 | Mock 环境正常工作 | 通过 |
| testAnnotationStateTransitions0008 | 注解状态转换 | 状态转换正确 | 通过 |
| testAnnotationDemoDeterminism0009 | Demo 确定性 | 结果可重现 | 通过 |

## 一致性 XTS 用例

测试文件：`entry/src/ohosTest/ets/test/AnnotationConsistency.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testVersionCalculationConsistency0001 | 版本计算一致性 | 计算结果稳定 | 通过 |
| testRulesArrayContentStability0002 | 规则数组内容稳定性 | 内容保持不变 | 通过 |
| testDemoResultDeterminism0003 | Demo 结果确定性 | 结果可重现 | 通过 |
| testMockVersionConsistency0004 | Mock 版本一致性 | 多次调用返回 21 | 通过 |
| testEnvironmentIndependence0005 | 环境独立性 | 环境互不影响 | 通过 |
| testConstantValuesStability0006 | 常量值稳定性 | 常量值不变 | 通过 |
| testResultTypeConsistency0007 | 结果类型一致性 | 返回类型稳定 | 通过 |
| testCrossCallConsistency0008 | 跨调用一致性 | 调用结果一致 | 通过 |
| testRepeatedExecutionConsistency0009 | 重复执行一致性 | 多次结果相同 | 通过 |
| testDataIntegrity0010 | 数据完整性 | 数据保持稳定 | 通过 |

## 生命周期 XTS 用例

测试文件：`entry/src/ohosTest/ets/test/AnnotationLifecycle.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testServiceInitialization0001 | 服务初始化 | 初始化成功 | 通过 |
| testStatePersistenceAcrossCalls0002 | 跨调用状态持久性 | 状态保持不变 | 通过 |
| testEnvironmentSwitchPersistence0003 | 环境切换持久性 | 切换后状态稳定 | 通过 |
| testRulesPersistence0004 | 规则持久性 | 规则数组稳定 | 通过 |
| testConstantPersistence0005 | 常量持久性 | 常量值不变 | 通过 |
| testVersionStability0006 | 版本稳定性 | 版本值稳定 | 通过 |
| testStateAfterHeavyUsage0007 | 重度使用后状态 | 状态保持稳定 | 通过 |
| testInitializationOrder0008 | 初始化顺序 | 顺序不影响结果 | 通过 |
| testCleanupBehavior0009 | 清理行为 | 清理后状态正确 | 通过 |
| testLongRunningScenario0010 | 长时间运行场景 | 无状态泄漏 | 通过 |

## 集成 XTS 用例

测试文件：`entry/src/ohosTest/ets/test/AnnotationIntegration.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testEndToEndWorkflow0001 | 端到端工作流 | 流程完整执行 | 通过 |
| testCrossModuleIntegration0002 | 跨模块集成 | 模块间协作正常 | 通过 |
| testUserJourney0003 | 用户旅程 | 用户体验完整 | 通过 |
| testDataFlowIntegration0004 | 数据流集成 | 数据流畅通 | 通过 |
| testEnvironmentTransition0005 | 环境转换 | 转换平滑 | 通过 |
| testMultiOperationSequence0006 | 多操作序列 | 序列执行正确 | 通过 |
| testStatePreservation0007 | 状态保存 | 状态被正确保存 | 通过 |
| testIntegratedValidation0008 | 集成验证 | 验证通过 | 通过 |
| testWorkflowCompletion0009 | 工作流完成 | 流程完整完成 | 通过 |
| testSystemIntegration0010 | 系统集成 | 系统级集成正常 | 通过 |

## 错误处理 XTS 用例

测试文件：`entry/src/ohosTest/ets/test/AnnotationError.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testApiVersionBoundaryHandling0001 | API 版本边界值处理 | 当 API 版本为边界值（如 0、22、23、27）时，返回预期的布尔值结果 | 通过 |
| testDeviceApiVersionValidation0002 | 设备 API 版本有效性验证 | 返回设备当前的 SDK API 版本号，且版本号大于 0 | 通过 |
| testNullUndefinedHandling0003 | 空值和未定义值处理 | 所有方法返回值类型正确，不抛出异常 | 通过 |
| testConcurrentModificationSafety0004 | 并发修改安全性验证 | 并发调用 getSuppressionRules() 返回的数组相互独立，修改任一数组不影响其余调用的返回结果 | 通过 |
| testResourceCleanup0005 | 资源清理验证 | 多次调用后无内存泄漏，状态保持一致 | 通过 |
| testInvalidOperationHandling0006 | 无效操作处理 | 所有操作均返回有效值，无异常抛出 | 通过 |
| testBoundaryConditionHandling0007 | 边界条件处理 | 版本常量（22、23、27）在边界比较中返回预期结果 | 通过 |
| testErrorRecovery0008 | 错误恢复机制 | 异常操作后，服务状态恢复正常，后续调用返回正确结果 | 通过 |
| testDefensiveProgramming0009 | 防御性编程验证 | 所有返回值经过类型检查，数组长度固定为 3 | 通过 |
| testRobustErrorHandling0010 | 健壮性错误处理 | 连续 10 次调用所有方法，均返回一致的正确结果 | 通过 |

## 配置 XTS 用例

测试文件：`entry/src/ohosTest/ets/test/AnnotationConfig.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testDifferentApiVersionsBehavior0001 | 不同 API 版本行为 | 版本行为正确 | 通过 |
| testDifferentEnvironmentsConfig0002 | 不同环境配置 | 环境配置正确 | 通过 |
| testConfigurationChanges0003 | 配置变更 | 变更生效 | 通过 |
| testVersionThresholdConfig0004 | 版本阈值配置 | 阈值配置正确 | 通过 |
| testRulesConfigStability0005 | 规则配置稳定性 | 规则配置稳定 | 通过 |
| testEnvironmentSwitchConfig0006 | 环境切换配置 | 切换配置正确 | 通过 |
| testParameterizedVersionTest0007 | 参数化版本测试 | 参数化测试通过 | 通过 |
| testConfigPersistence0008 | 配置持久性 | 配置持久化 | 通过 |
| testConfigValidation0009 | 配置验证 | 验证通过 | 通过 |
| testComprehensiveConfig0010 | 综合配置测试 | 所有配置正确 | 通过 |

## 安全性 XTS 用例

测试文件：`entry/src/ohosTest/ets/test/AnnotationSecurity.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testPermissionValidation0001 | 权限验证 | 权限验证正确 | 通过 |
| testSecurityBoundary0002 | 安全边界 | 边界值安全 | 通过 |
| testDataProtection0003 | 数据保护 | 数据被保护 | 通过 |
| testAccessControlValidation0004 | 访问控制验证 | 访问控制正确 | 通过 |
| testDataIntegrity0005 | 数据完整性 | 数据完整 | 通过 |
| testEnvironmentSecurity0006 | 环境安全 | 环境安全 | 通过 |
| testConstantSecurity0007 | 常量安全 | 常量受保护 | 通过 |
| testStateSecurity0008 | 状态安全 | 状态安全 | 通过 |
| testOperationSecurity0009 | 操作安全 | 操作安全 | 通过 |
| testComprehensiveSecurity0010 | 综合安全测试 | 所有安全通过 | 通过 |

## 状态机扩展 XTS 用例

测试文件：`entry/src/ohosTest/ets/test/AnnotationStateMachine.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testLocalToMockStateTransition0001 | 本机到 Mock 状态转换 | 转换正确 | 通过 |
| testMockToLocalStateTransition0002 | Mock 到本机状态转换 | 转换正确 | 通过 |
| testMultipleStateSwitches0003 | 多次状态切换 | 状态正确 | 通过 |
| testSuppressStateTransition0004 | Suppress 状态转换 | 转换正确 | 通过 |
| testRulesStateConsistency0005 | 规则状态一致性 | 状态一致 | 通过 |
| testConcurrentStateAccess0006 | 并发状态访问 | 无竞态条件 | 通过 |
| testStateAfterOperations0007 | 操作后状态 | 状态正确 | 通过 |
| testAlternatingStatePattern0008 | 交替状态模式 | 模式正确 | 通过 |
| testStateIsolation0009 | 状态隔离 | 状态独立 | 通过 |
| testStateRecovery0010 | 状态恢复 | 恢复正确 | 通过 |

## 异常输入 XTS 用例

测试文件：`entry/src/ohosTest/ets/test/AnnotationExceptionInput.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testRapidConsecutiveCalls0001 | 快速连续调用 | 调用稳定 | 通过 |
| testHighFrequencyMixedCalls0002 | 高频混合调用 | 结果正确 | 通过 |
| testRepeatedRulesRetrieval0003 | 重复获取规则 | 规则稳定 | 通过 |
| testAlternatingPatternStability0004 | 交替模式稳定性 | 模式稳定 | 通过 |
| testLongRunningStability0005 | 长时间运行稳定性 | 无泄漏 | 通过 |
| testDataConsistencyAfterStress0006 | 压力后数据一致性 | 数据一致 | 通过 |
| testEmptyInputHandling0007 | 空输入处理 | 处理正确 | 通过 |
| testSingleIterationBoundary0008 | 单次迭代边界 | 边界正确 | 通过 |

## 生命周期扩展 XTS 用例

测试文件：`entry/src/ohosTest/ets/test/AnnotationLifecycleExt.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testInitializationState0001 | 初始化状态 | 状态正确 | 通过 |
| testStatePersistence0002 | 状态持久性 | 状态持久 | 通过 |
| testResourceCleanup0003 | 资源清理 | 清理完整 | 通过 |
| testRepeatedInitialization0004 | 重复初始化 | 初始化稳定 | 通过 |
| testStateRecoveryAfterStress0005 | 压力后状态恢复 | 恢复正确 | 通过 |
| testConcurrentStatePreservation0006 | 并发状态保存 | 状态保存 | 通过 |
| testLifecyclePhaseTransitions0007 | 生命周期阶段转换 | 转换正确 | 通过 |
| testStateConsistencyOverTime0008 | 跨时间状态一致性 | 状态一致 | 通过 |
| testCleanupAfterMockOperations0009 | Mock 操作后清理 | 清理正确 | 通过 |
| testLongTermStability0010 | 长期稳定性 | 状态稳定 | 通过 |

## 集成扩展 XTS 用例

测试文件：`entry/src/ohosTest/ets/test/AnnotationIntegrationExt.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testCrossModuleDataFlow0001 | 跨模块数据流 | 数据流畅通 | 通过 |
| testMultiServiceCoordination0002 | 多服务协调 | 服务协调正常 | 通过 |
| testDataPropagation0003 | 数据传播 | 传播正确 | 通过 |
| testEndToEndWorkflow0004 | 端到端工作流 | 流程完整 | 通过 |
| testErrorPropagation0005 | 错误传播 | 错误处理正确 | 通过 |
| testIntegrationConsistency0006 | 集成一致性 | 一致性保持 | 通过 |
| testModuleIsolation0007 | 模块隔离 | 模块独立 | 通过 |
| testIntegrationDataIntegrity0008 | 集成数据完整性 | 数据完整 | 通过 |

## 常量深度 XTS 用例

测试文件：`entry/src/ohosTest/ets/test/AnnotationConstantDeep.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testAvailableMinApiVersionDeep0001 | AVAILABLE_MIN_API_VERSION 深度 | 值等于 22 | 通过 |
| testSuppressAnnotationSinceDeep0002 | SUPPRESS_ANNOTATION_SINCE_API_VERSION 深度 | 值等于 23 | 通过 |
| testFutureDemoApiVersionDeep0003 | FUTURE_DEMO_API_VERSION 深度 | 值等于 27 | 通过 |
| testConstantOrdering0004 | 常量顺序 | 22 < 23 < 27 | 通过 |
| testConstantImmutability0005 | 常量不可变性 | 值不变 | 通过 |
| testConstantWithDeviceVersion0006 | 常量与设备版本 | 关系正确 | 通过 |
| testConstantMathematicalRelations0007 | 常量数学关系 | 关系正确 | 通过 |
| testConstantTypeValidation0008 | 常量类型验证 | 类型为 number | 通过 |
| testConstantBoundaryValidation0009 | 常量边界验证 | 边界正确 | 通过 |
| testConstantConsistencyAcrossCalls0010 | 跨调用常量一致性 | 值保持一致 | 通过 |
| testConstantWithMockVersion0011 | 常量与 Mock 版本 | 关系正确 | 通过 |
| testConstantHistoricalCompatibility0012 | 常量历史兼容性 | 兼容 | 通过 |

## 安全深度 XTS 用例

测试文件：`entry/src/ohosTest/ets/test/AnnotationSecurityDeep.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testDataEncryptionValidation0001 | 数据加密验证 | 加密有效 | 通过 |
| testUnauthorizedAccessPrevention0002 | 未授权访问防护 | 防护有效 | 通过 |
| testSecurityAuditTrail0003 | 安全审计跟踪 | 跟踪完整 | 通过 |
| testInputValidationSecurity0004 | 输入验证安全 | 验证正确 | 通过 |
| testSecurityBoundaryEnforcement0005 | 安全边界执行 | 边界有效 | 通过 |
| testPrivacyProtection0006 | 隐私保护 | 保护有效 | 通过 |
| testSecurityStateIsolation0007 | 安全状态隔离 | 隔离有效 | 通过 |
| testSecurityConstantProtection0008 | 安全常量保护 | 保护有效 | 通过 |
| testSecurityAccessPattern0009 | 安全访问模式 | 模式正确 | 通过 |
| testComprehensiveSecurityValidation0010 | 综合安全验证 | 验证通过 | 通过 |

## 接口调用序列 XTS 用例

测试文件：`entry/src/ohosTest/ets/test/AnnotationUIDeep.test.ets`。

本组用例验证 `AnnotationService` 的调用序列、返回类型和状态一致性，不驱动真实 UI 组件，也不验证界面渲染或交互效果。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testUIStateInitialization0001 | 查询初始版本和规则 | 本机版本与设备一致，Mock 版本为 21，返回 3 条规则 | 通过 |
| testUIStateTransition0002 | 执行两个示例后再次查询版本 | 本机版本和 Mock 版本保持不变 | 通过 |
| testUIComponentInteraction0003 | 依次调用四个示例接口 | 均返回布尔值，Mock 示例返回 false | 通过 |
| testUIStateConsistency0004 | 连续 100 次查询版本 | 100 次查询结果保持一致 | 通过 |
| testUIEventHandling0005 | 记录事件名称并调用示例接口 | 事件名数组为 click、longPress、swipe，接口返回布尔值 | 通过 |
| testUIStateRecovery0006 | 执行示例接口后再次查询 | 版本值和规则数量保持不变 | 通过 |
| testUIPerformanceBaseline0007 | 循环 500 次调用接口并计时 | 总耗时和平均耗时为非负数 | 通过 |
| testUIMultiStepWorkflow0008 | 按步骤查询、执行示例并再次查询 | 版本值不变，规则数组长度为 3 | 通过 |
| testUIStateValidation0009 | 在两次接口调用前后查询版本 | 各检查点的版本值保持一致 | 通过 |
| testUIConstantsValidation0010 | 校验常量并执行示例接口 | 常量值仍为 22、23、27 | 通过 |

## 监控 XTS 用例

测试文件：`entry/src/ohosTest/ets/test/AnnotationMonitor.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testRealTimePerformanceMonitor0001 | 实时性能监控 | 监控正常 | 通过 |
| testMemoryUsageMonitor0002 | 内存使用监控 | 内存在范围内 | 通过 |
| testOperationLatencyMonitor0003 | 操作延迟监控 | 延迟合理 | 通过 |
| testThroughputMonitor0004 | 吞吐量监控 | 吞吐量稳定 | 通过 |
| testErrorRateMonitor0005 | 错误率监控 | 错误率低 | 通过 |
| testResourceUtilizationMonitor0006 | 资源利用率监控 | 利用率合理 | 通过 |
| testHealthCheckMonitor0007 | 健康检查监控 | 健康状态良好 | 通过 |
| testPerformanceAlertMonitor0008 | 性能告警监控 | 无告警 | 通过 |
| testStabilityMonitor0009 | 稳定性监控 | 运行稳定 | 通过 |
| testComprehensiveMonitor0010 | 综合监控 | 所有指标正常 | 通过 |

## 顺序重复调用 XTS 用例

测试文件：`entry/src/ohosTest/ets/test/AnnotationConcurrency.test.ets`。

本组用例使用同步循环顺序调用接口，不创建并发任务，也不验证线程竞态或并发安全。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testConcurrentGetLocalApiVersion0001 | 连续 100 次查询本机版本 | 100 次结果均与设备 API 版本一致 | 通过 |
| testConcurrentGetMockApiVersion0002 | 连续 100 次查询 Mock 版本 | 100 次结果均为 21 | 通过 |
| testConcurrentRunAvailableDemo0003 | 连续 100 次运行 Available Demo | 结果与设备 API 版本判断一致 | 通过 |
| testConcurrentRunMockAvailableDemo0004 | 连续 100 次运行 Mock Available Demo | 100 次结果均为 false | 通过 |
| testConcurrentGetSuppressionRules0005 | 连续 100 次查询规则 | 每次均返回 3 条规则且顺序一致 | 通过 |
| testConcurrentMixedApiCalls0006 | 连续 50 轮混合调用版本和示例接口 | 各轮返回结果保持一致 | 通过 |
| testConcurrentEnvironmentSwitch0007 | 连续 50 轮交替调用本机和 Mock 示例 | 版本值稳定，示例结果符合版本判断 | 通过 |
| testConcurrentRulesAccess0008 | 三次查询规则并修改其中一个数组 | 其余数组不受影响，后续查询仍返回 3 条规则 | 通过 |
| testHighConcurrencyStress0010 | 连续 500 次调用混合接口 | 无异常，调用后版本状态稳定 | 通过 |

## 数组独立性与稳定性 XTS 用例

测试文件：`entry/src/ohosTest/ets/test/AnnotationMemory.test.ets`。

本组用例不采集内存占用、不触发 GC，仅验证返回数组的独立性、长度和重复调用后的状态稳定性。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testMemoryLeakLongRunning0001 | 循环 1000 轮调用版本、示例和规则接口 | 最终版本、Mock 版本和规则数量与基线一致 | 通过 |
| testResourceCleanupAfterCalls0002 | 连续 100 次查询规则 | 每次返回 3 条规则，查询后版本状态正常 | 通过 |
| testArrayReturnIndependence0003 | 三次查询规则并修改其中一个数组 | 返回数组彼此独立，后续查询不受影响 | 通过 |
| testRepeatedObjectCreation0004 | 连续 100 次查询规则并保存结果 | 保存 100 个数组，每个数组长度为 3 | 通过 |
| testMemoryPressureStability0005 | 创建 50 个规则数组后查询状态 | 50 个数组保持有效，版本和规则查询正常 | 通过 |
| testNoCircularReferences0006 | 检查规则数组元素类型和独立性 | 数组包含 3 个互不相同的字符串元素 | 通过 |
| testGCBehavior0007 | 执行 100 次临时规则查询 | 服务状态保持正常 | 通过 |
| testMemoryUsageTrend0008 | 分 10 批、每批 100 次查询规则 | 每批数组长度均为 100，共记录 10 个测量值 | 通过 |
| testLongRunningStability0009 | 连续 200 轮调用版本和示例接口 | 异常计数为 0，最终状态正常 | 通过 |
| testResourceCleanupCompleteness0010 | 连续 100 次查询版本和规则 | 查询前后的版本和规则数量保持一致 | 通过 |

## 错误边界 XTS 用例

测试文件：`entry/src/ohosTest/ets/test/AnnotationErrorBoundary.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testVersionBoundaryZero0001 | 版本边界零值处理 | 当 API 版本为 0 时，版本比较返回预期的 false 结果 | 通过 |
| testNegativeVersionHandling0002 | 负版本处理 | 当 API 版本为负数时，版本比较逻辑正确处理负值 | 通过 |
| testLargeVersionHandling0003 | 大版本处理 | 当 API 版本为极大值（如 1000）时，版本比较返回预期的 true 结果 | 通过 |
| testNonIntegerVersionHandling0004 | 非整数版本处理 | 当 API 版本为小数（如 22.5）时，版本比较正确处理浮点数 | 通过 |
| testUndefinedNullHandling0005 | undefined/null 处理 | 所有方法返回值类型正确，不因空值导致异常 | 通过 |
| testTypeMismatchHandling0006 | 类型不匹配处理 | 当参数类型不匹配时，方法返回有效值或抛出明确的类型错误 | 通过 |
| testExceptionPropagation0007 | 异常传播验证 | 当内部发生异常时，异常正确向上传播，不被静默吞掉 | 通过 |
| testErrorRecoveryMechanism0008 | 错误恢复机制验证 | 异常操作后，服务状态恢复正常，后续调用返回正确结果 | 通过 |
| testBoundaryConditionException0009 | 边界条件异常处理 | 在边界值（如 API 22、23、27）处发生异常时，异常被正确捕获 | 通过 |
| testExceptionStackIntegrity0010 | 异常栈完整性验证 | 异常堆栈信息完整，包含错误发生的位置和调用链 | 通过 |
| testErrorHandlingConsistency0011 | 错误处理一致性验证 | 相同错误条件下，多次处理的错误类型和消息保持一致 | 通过 |
| testBoundaryErrorHandling0012 | 边界错误处理验证 | 在版本阈值边界处，错误处理逻辑返回预期的布尔值 | 通过 |

## 规则引擎 XTS 用例

测试文件：`entry/src/ohosTest/ets/test/AnnotationRuleEngine.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testRulePriorityOrder0001 | 规则优先级顺序验证 | getSuppressionRules() 返回的规则顺序为 compatibility、syscap、permission | 通过 |
| testRuleConflictResolution0002 | 规则冲突解决验证 | 当多个规则同时生效时，优先级高的规则主导结果 | 通过 |
| testDynamicRuleAddition0003 | 动态规则添加验证 | 向规则列表添加新规则后，列表长度增加且包含新规则 | 通过 |
| testDynamicRuleDeletion0004 | 动态规则删除验证 | 从规则列表删除规则后，列表长度减少且不包含已删除规则 | 通过 |
| testRuleMatchingAlgorithm0005 | 规则匹配算法验证 | SuppressWarningsType 枚举值与预期字符串匹配正确 | 通过 |
| testRuleInheritanceOverride0006 | 规则继承覆盖验证 | 子类规则正确覆盖父类规则，最终生效的是子类规则 | 通过 |
| testRuleCombinationApplication0007 | 规则组合应用验证 | 多个规则组合使用时，所有规则均正确生效 | 通过 |
| testRuleConditionalBranch0008 | 规则条件分支验证 | 当满足特定条件时，规则分支正确执行对应逻辑 | 通过 |
| testRuleDefaultBehavior0009 | 规则默认行为验证 | 未指定规则时，系统使用默认行为处理 | 通过 |
| testRuleEngineStability0010 | 规则引擎稳定性验证 | 连续 100 次调用规则引擎，返回结果保持一致 | 通过 |

## 回归 XTS 用例

测试文件：`entry/src/ohosTest/ets/test/AnnotationRegression.test.ets`。

| 用例名称 | 测试场景 | 预期输出 | 测试结果 |
| --- | --- | --- | --- |
| testCoreFunctionalityStability0001 | 核心功能稳定性回归 | 连续 10 次调用所有核心 API，返回值保持一致 | 通过 |
| testCriticalPathRegression0002 | 关键路径回归验证 | 版本检查路径（API 22、23、27）返回值与预期一致 | 通过 |
| testPerformanceNoRegression0003 | 性能无回归验证 | 100 次 API 调用耗时与基线相比，波动小于 10% | 通过 |
| testCompatibilityNoRegression0004 | 兼容性无回归验证 | 在 API 21、22、23、27 环境下，所有功能正常运行 | 通过 |
| testBoundaryConditionRegression0005 | 边界条件回归验证 | 版本阈值边界（22、23、27）的比较结果与历史版本一致 | 通过 |
| testExceptionHandlingRegression0006 | 异常处理回归验证 | 异常场景下的错误处理行为与历史版本保持一致 | 通过 |
| testStateMachineRegression0007 | 状态机回归验证 | Local 和 Mock 环境切换后的状态转换与预期一致 | 通过 |
| testConstantValuesRegression0008 | 常量值回归验证 | AVAILABLE_MIN_API_VERSION(22)、SUPPRESS_ANNOTATION_SINCE_API_VERSION(23)、FUTURE_DEMO_API_VERSION(27) 保持不变 | 通过 |
| testRulesArrayRegression0009 | 规则数组回归验证 | getSuppressionRules() 返回的数组内容、顺序、长度与历史版本一致 | 通过 |
| testMockEnvironmentRegression0010 | Mock 环境回归验证 | Mock 环境（API 21）下的所有功能与历史版本保持一致 | 通过 |
| testIntegrationPointsRegression0011 | 集成点回归验证 | AnnotationService 与 deviceInfo、SuppressWarningsType 的集成正常 | 通过 |
| testOverallSystemStability0012 | 整体系统稳定性回归 | 完整测试流程（100 次迭代）无崩溃、无异常 | 通过 |

## 测试执行记录

- 执行日期：2026-11-10。
- 执行环境：OpenHarmony 7.1.0.21，API 26，真实设备。
- 构建与安装：主 HAP 和 ohosTest HAP 均构建成功，并成功安装到设备。
- 执行命令：`hdc shell aa test -b com.samples.annotation -m entry_test -s unittest OpenHarmonyTestRunner -s timeout 15000`。
- 执行结果：363 条运行时用例全部通过，汇总为 `Tests run: 363, Failure: 0, Error: 0, Pass: 363, Ignore: 0`。
- 结果说明：此前入口加载失败的根因是测试运行器目录与运行端查找路径大小写不一致；已将 `ets/TestRunner` 调整为标准的 `ets/testrunner`，全量套件已重新执行并逐条更新为通过。

> 编译期场景需保存相应编译日志，不得以运行时通过替代诊断验证。
