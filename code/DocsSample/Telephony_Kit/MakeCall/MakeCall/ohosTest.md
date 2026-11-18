# MakeCall 自动化测试说明

更新日期：2026-11-18。本文依据本工程现有测试源码和已保存的回归结果更新，用于替换原有仅包含“拉起应用”“示例代码验证”的两项用例说明。

## 测试对象与范围

工程位置：`code/DocsSample/Telephony_Kit/MakeCall/MakeCall`。测试根目录为 `entry/src/ohosTest`，用例注册入口为 `ets/test/List.test.ets`。

测试覆盖 MakeCall 页面及 `CallController` 的请求派发、语音能力判断、结果通知、状态监听、异常恢复和资源释放。业务用例通过注入 `FakeCallService` 和 `RecordingCallLogger` 验证生产控制器；页面用例通过 UiTest 操作真实的 `EntryAbility`。

当前共有 **80 个测试套件、1838 条用例**：业务测试 79 个套件、1829 条，页面测试 1 个套件、9 条。数量按源码中的 `describe` 和 `it` 统计；`List.test.ets` 与公共辅助文件不计为独立用例。

业务用例使用 Fake 服务，不要求 SIM 卡、运营商网络或真实通话。文件名中的 Integration、Security 和 PerformanceStability 分别对应控制器与 Fake 的组合验证、实例及过期回调隔离、有限次数请求与资源稳定性验证；不代表真实运营商联调、安全认证或性能基准测试。

## 目录与测试职责

| 路径 | 套件数 | 用例数 | 覆盖内容 |
| --- | ---: | ---: | --- |
| `ets/test/Ability.test.ets` | 1 | 1 | 控制器延迟成功、调用顺序和监听释放 |
| `ets/test/Integration/` | 9 | 127 | 控制器组合流程、能力适配、号码传递及异常恢复 |
| `ets/test/Interaction/` | 14 | 352 | 重复命令、请求序列、监听身份、结果及状态事件 |
| `ets/test/LifecycleState/` | 10 | 205 | 启停重入、订阅生命周期、请求代次和释放重试 |
| `ets/test/PerformanceStability/` | 7 | 127 | 连续请求、回调顺序、监听去重和释放平衡 |
| `ets/test/CallFlow/` | 16 | 380 | 能力检查到请求、订阅、完成、释放的组合行为 |
| `ets/test/CallValidation/` | 8 | 209 | 回调代次、错误记录、状态来源及中断恢复 |
| `ets/test/Security/` | 3 | 45 | 号码透传、无能力零派发和控制器间隔离 |
| `ets/test/Validation/` | 11 | 383 | 状态码、载荷、日志记录及监听所有权 |
| `ets/test/Index.test.ets` | 1 | 9 | 真实页面启动、按钮、布局、重启和点击恢复 |
| **合计** | **80** | **1838** | 1829 条业务测试与 9 条页面测试 |

| 公共文件 | 职责 |
| --- | --- |
| `ets/test/List.test.ets` | 导入并注册全部套件；新增文件后必须同步注册 |
| `ets/test/Shared/CallTestFixture.ets` | 提供 Fake 服务、记录式 Logger、独立控制器、事件循环让步和清理 |
| `ets/test/Shared/SharedDriver.ets` | 共享 Driver、串行 UI 操作、屏幕准备、应用启动和页面稳定轮询 |
| `ets/testrunner/OpenHarmonyTestRunner.ets` | 测试启动时拉起 TestAbility |
| `ets/testability/TestAbility.ets` | 初始化 Hypium 并调用测试注册入口 |
| `ets/testability/pages/Index.ets` | 测试 Ability 的页面 |
| `entry/src/main/ets/call/CallController.ets`（相对工程根） | 业务测试直接导入的生产控制器及服务、监听、日志契约 |

## 框架、断言与隔离方式

测试使用 `@ohos/hypium` 的 `describe/it/expect`，通过 `beforeAll/beforeEach/afterEach/afterAll` 组织生命周期。当前用例标记为 `TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2`；用例注释包含 `@tc.name`、`@tc.number`、`@tc.desc` 等元数据。

业务套件在每条用例开始前创建独立 `CallTestFixture`，结束后调用 `fixture.dispose()`。清理会撤销退订故障注入，再释放控制器，避免异常测试将监听保留到后续用例。Fake、Logger 和控制器均属于各自夹具实例，不跨用例共享计数或回调。

断言以可观察结果为准：`assertEqual` 核对请求内容、调用顺序、成功及失败次数、错误码和消息、监听引用与状态载荷；`assertTrue` 核对页面就绪和组件状态；`assertLarger`、`assertLargerOrEqual` 核对按钮布局边界。异常场景通过注入失败并检查记录，不能将捕获异常本身作为通过依据。

`FakeCallService` 实现生产 `CallService` 接口，可配置能力不可用、能力检查异常、请求异常、订阅异常、退订异常，以及同步或延迟完成结果。它记录 `requests/completions/listeners/removedListeners/operations` 等数据，支持按索引完成请求和发送状态事件。`RecordingCallLogger` 记录成功计数、失败操作与错误字段、状态和号码快照。

异步用例使用 `async/await`。`completeLater` 通过 Promise 微任务延迟完成；逆序完成场景显式选择回调索引。每个业务套件的 `beforeEach` 还会等待 **10 ms 的正延时定时器**，让原生事件循环处理生命周期和 watchdog 事件。这个让步与 Promise 微任务用途不同，维护时必须保留正延时。

页面操作通过 `runSerializedUiOperation` 排队，避免并发操作同一个 Driver。`beforeEach` 调用 `launchMakeCallApp` 并断言 `waitForMakeCallStable(driver, 5000)` 成功；页面尚未就绪时用例失败。

## 核心业务场景与预期结果

| 测试功能 | 预置条件与输入 | 主要预期结果 | 是否自动 |
| --- | --- | --- | --- |
| 延迟成功 | 能力可用，调用 start，随后完成回调 | 顺序为 capability、makeCall、subscribe；号码保持原样；完成前成功数为 0，完成后为 1 | Yes |
| 同步完成与失败通知 | 配置同步完成或延迟失败，注入错误对象 | 结果计数与完成时机一致；失败操作为 makeCall，错误码和消息保持一致 | Yes |
| 无语音能力 | supported=false，单次或连续 start | 逐次检查能力；请求、完成回调、订阅及退订次数均为 0 | Yes |
| 能力或请求抛错 | 注入 capabilityFailure 或 makeFailure | 记录 start 失败及指定错误字段；后续请求或订阅不越过失败位置执行 | Yes |
| 订阅失败与恢复 | 首次订阅抛错，清除异常后重新 start | 记录 subscribe 失败；请求完成仍可报告成功；重试后建立有效监听 | Yes |
| 状态事件透传 | 建立监听，发送状态码和号码载荷 | Logger 中状态码、号码、事件顺序及数量与发送值一致 | Yes |
| 连续请求与监听复用 | 同一控制器多次 start | 请求逐次记录、完成结果可核对；已有监听不会因重复启动而重复订阅 | Yes |
| 回调逆序完成 | 创建多个请求，按反向索引完成 | 每个请求的结果按实际完成顺序计入，成功失败计数符合输入 | Yes |
| 释放与旧回调隔离 | start 后 dispose，再触发旧完成或旧状态 | 退订引用与订阅引用一致；旧代次结果和状态不再写入 Logger | Yes |
| 退订异常与再次释放 | 注入 unsubscribeFailure 后 dispose，再清除异常重试 | 记录 unsubscribe 失败；再次 dispose 继续尝试退订并释放资源 | Yes |
| 释放后重启 | dispose 后再次 start，混合触发新旧回调 | 新代次可正常工作，旧代次回调保持隔离 | Yes |
| 多控制器独立 | 不同 Fake 和 Logger 创建两个控制器 | 请求、监听、计数及释放互不影响 | Yes |
| 号码载荷保持 | 不同前缀、格式或边界号码字符串传入 start | 按各用例断言原样传递；不将此结果解释为系统已接受或拨通该号码 | Yes |

测试代码中的错误码由 Fake 注入，用于验证传递和错误处理。相关用例不等同于真实设备上的权限申请、权限弹窗或系统错误码兼容性验证。

## 业务测试文件清单

下列路径均相对 `entry/src/ohosTest/ets/test`。用例数来自对应文件的实际 `it` 数量；覆盖摘要概括该文件已有断言。不同参数、错误码、状态载荷和重复次数仍由各条用例分别核对。

| 测试文件 | 用例数 | 实际覆盖场景 |
| --- | ---: | --- |
| `Ability.test.ets` | 1 | 延迟成功回调与请求原样透传 |
| `CallFlow/CallCallbackOrdering.test.ets` | 18 | 延迟成功回调与请求原样透传；延迟失败回调与错误字段记录；同步失败回调；逆序完成请求与结果计数；同步成功回调 |
| `CallFlow/CallControllerTransitions.test.ets` | 38 | 延迟成功回调与请求原样透传；无语音能力时零请求、零订阅；拨号服务同步异常；通话状态及号码事件透传；释放监听及回调身份核对；请求异常后再次启动恢复；多个控制器实例相互独立 |
| `CallFlow/CallFlowCommandContract.test.ets` | 17 | 延迟成功回调与请求原样透传；无语音能力时零请求、零订阅；拨号服务同步异常；通话状态及号码事件透传；释放监听及回调身份核对；请求异常后再次启动恢复；多个控制器实例相互独立 |
| `CallFlow/CallFlowErrorRecovery.test.ets` | 19 | 请求异常后再次启动恢复；订阅异常后再次启动恢复；退订失败记录及再次释放重试；语音能力开关切换；释放后重新启动与新旧代次隔离 |
| `CallFlow/CallFlowLifecycle.test.ets` | 19 | 释放监听及回调身份核对；释放后旧请求回调隔离；释放后旧监听事件隔离；释放后重新启动与新旧代次隔离；退订失败记录及再次释放重试；未启动直接释放的幂等行为 |
| `CallFlow/CallFlowRequestBursts.test.ets` | 4 | 重复启动复用同一监听；逆序完成请求与结果计数；连续请求数量及逐次完成；通话状态及号码事件透传 |
| `CallFlow/CallFlowStateEvents.test.ets` | 18 | 通话状态及号码事件透传；重复启动复用同一监听；订阅异常且请求完成仍可通知；订阅异常后再次启动恢复 |
| `CallFlow/CallOperationOutcomes.test.ets` | 38 | 能力检查异常与错误记录；拨号服务同步异常；订阅异常且请求完成仍可通知；延迟失败回调与错误字段记录；同步失败回调；退订失败记录及再次释放重试 |
| `CallFlow/CallRequestConsistency.test.ets` | 18 | 重复启动复用同一监听；逆序完成请求与结果计数；连续请求数量及逐次完成；通话状态及号码事件透传 |
| `CallFlow/CallStateInfoModel.test.ets` | 34 | 通话状态及号码事件透传；重复启动复用同一监听；订阅异常且请求完成仍可通知；订阅异常后再次启动恢复 |
| `CallFlow/CapabilityConfiguration.test.ets` | 34 | 无语音能力时零请求、零订阅；能力检查异常与错误记录；语音能力开关切换 |
| `CallFlow/ControllerEndToEnd.test.ets` | 17 | 延迟成功回调与请求原样透传；无语音能力时零请求、零订阅；拨号服务同步异常；通话状态及号码事件透传；释放监听及回调身份核对；请求异常后再次启动恢复；多个控制器实例相互独立 |
| `CallFlow/MakeCallOperationFlow.test.ets` | 36 | 延迟成功回调与请求原样透传；无语音能力时零请求、零订阅；拨号服务同步异常；通话状态及号码事件透传；释放监听及回调身份核对；请求异常后再次启动恢复；多个控制器实例相互独立 |
| `CallFlow/MakeCallOperationWorkflow.test.ets` | 23 | 请求异常后再次启动恢复；订阅异常后再次启动恢复；退订失败记录及再次释放重试；语音能力开关切换；释放后重新启动与新旧代次隔离 |
| `CallFlow/MakeCallOperations.test.ets` | 25 | 延迟成功回调与请求原样透传；无语音能力时零请求、零订阅；拨号服务同步异常；通话状态及号码事件透传；释放监听及回调身份核对；请求异常后再次启动恢复；多个控制器实例相互独立 |
| `CallFlow/PhoneNumberInputForwarding.test.ets` | 22 | 延迟成功回调与请求原样透传；无语音能力时零请求、零订阅；拨号服务同步异常；通话状态及号码事件透传；释放监听及回调身份核对；请求异常后再次启动恢复；多个控制器实例相互独立 |
| `CallValidation/CallCallbackGeneration.test.ets` | 33 | 释放监听及回调身份核对；释放后旧请求回调隔离；释放后旧监听事件隔离；释放后重新启动与新旧代次隔离；退订失败记录及再次释放重试；未启动直接释放的幂等行为 |
| `CallValidation/CallEventDispatchValidation.test.ets` | 18 | 通话状态及号码事件透传；重复启动复用同一监听；订阅异常且请求完成仍可通知；订阅异常后再次启动恢复 |
| `CallValidation/CallRequestSessionValidation.test.ets` | 20 | 释放监听及回调身份核对；释放后旧请求回调隔离；释放后旧监听事件隔离；释放后重新启动与新旧代次隔离；退订失败记录及再次释放重试；未启动直接释放的幂等行为 |
| `CallValidation/CallResultNotifications.test.ets` | 32 | 延迟成功回调与请求原样透传；延迟失败回调与错误字段记录；同步失败回调；逆序完成请求与结果计数；同步成功回调 |
| `CallValidation/CallServicePermissionErrors.test.ets` | 31 | 能力检查异常与错误记录；拨号服务同步异常；订阅异常且请求完成仍可通知；延迟失败回调与错误字段记录；同步失败回调；退订失败记录及再次释放重试 |
| `CallValidation/CallStateSourceValidation.test.ets` | 19 | 通话状态及号码事件透传；重复启动复用同一监听；订阅异常且请求完成仍可通知；订阅异常后再次启动恢复 |
| `CallValidation/InterruptedCallRecovery.test.ets` | 24 | 请求异常后再次启动恢复；订阅异常后再次启动恢复；退订失败记录及再次释放重试；语音能力开关切换；释放后重新启动与新旧代次隔离 |
| `CallValidation/UnavailableVoiceCapability.test.ets` | 32 | 无语音能力时零请求、零订阅；能力检查异常与错误记录；语音能力开关切换 |
| `Integration/CallRegression.test.ets` | 17 | 延迟成功回调与请求原样透传；无语音能力时零请求、零订阅；拨号服务同步异常；通话状态及号码事件透传；释放监听及回调身份核对；请求异常后再次启动恢复；多个控制器实例相互独立 |
| `Integration/CallServiceCompatibility.test.ets` | 22 | 无语音能力时零请求、零订阅；能力检查异常与错误记录；语音能力开关切换 |
| `Integration/CallServiceIntegration.test.ets` | 13 | 延迟成功回调与请求原样透传；无语音能力时零请求、零订阅；拨号服务同步异常；通话状态及号码事件透传；释放监听及回调身份核对；请求异常后再次启动恢复；多个控制器实例相互独立 |
| `Integration/CallbackOrderingScenarios.test.ets` | 7 | 延迟成功回调与请求原样透传；延迟失败回调与错误字段记录；同步失败回调；逆序完成请求与结果计数；同步成功回调 |
| `Integration/CapabilityUnavailable.test.ets` | 3 | 无语音能力时零请求、零订阅；能力检查异常与错误记录；语音能力开关切换 |
| `Integration/ControllerIntegration.test.ets` | 12 | 延迟成功回调与请求原样透传；无语音能力时零请求、零订阅；拨号服务同步异常；通话状态及号码事件透传；释放监听及回调身份核对；请求异常后再次启动恢复；多个控制器实例相互独立 |
| `Integration/MakeCallUserScenarios.test.ets` | 27 | 延迟成功回调与请求原样透传；无语音能力时零请求、零订阅；拨号服务同步异常；通话状态及号码事件透传；释放监听及回调身份核对；请求异常后再次启动恢复；多个控制器实例相互独立 |
| `Integration/PhoneNumberForwarding.test.ets` | 24 | 延迟成功回调与请求原样透传；无语音能力时零请求、零订阅；拨号服务同步异常；通话状态及号码事件透传；释放监听及回调身份核对；请求异常后再次启动恢复；多个控制器实例相互独立 |
| `Integration/VoiceCapabilityCompatibility.test.ets` | 2 | 无语音能力时零请求、零订阅；能力检查异常与错误记录 |
| `Interaction/CallCommandAvailability.test.ets` | 33 | 无语音能力时零请求、零订阅；能力检查异常与错误记录；语音能力开关切换 |
| `Interaction/CallCommandState.test.ets` | 27 | 无语音能力时零请求、零订阅；能力检查异常与错误记录；语音能力开关切换 |
| `Interaction/CallEventHandling.test.ets` | 32 | 延迟成功回调与请求原样透传；延迟失败回调与错误字段记录；同步失败回调；逆序完成请求与结果计数；同步成功回调 |
| `Interaction/CallListenerIdentity.test.ets` | 24 | 释放监听及回调身份核对；释放后旧请求回调隔离；释放后旧监听事件隔离；释放后重新启动与新旧代次隔离；退订失败记录及再次释放重试；未启动直接释放的幂等行为 |
| `Interaction/CallRequestSequencing.test.ets` | 43 | 重复启动复用同一监听；逆序完成请求与结果计数；连续请求数量及逐次完成；通话状态及号码事件透传 |
| `Interaction/CallResultNotification.test.ets` | 24 | 延迟成功回调与请求原样透传；延迟失败回调与错误字段记录；同步失败回调；逆序完成请求与结果计数；同步成功回调 |
| `Interaction/CallStateEventPropagation.test.ets` | 30 | 通话状态及号码事件透传；重复启动复用同一监听；订阅异常且请求完成仍可通知；订阅异常后再次启动恢复 |
| `Interaction/CallStatePayloadBinding.test.ets` | 14 | 通话状态及号码事件透传；重复启动复用同一监听；订阅异常且请求完成仍可通知；订阅异常后再次启动恢复 |
| `Interaction/ControllerInstanceIndependence.test.ets` | 10 | 多个控制器实例相互独立；释放后旧请求回调隔离；释放后旧监听事件隔离 |
| `Interaction/ListenerOwnership.test.ets` | 10 | 释放监听及回调身份核对；释放后旧请求回调隔离；释放后旧监听事件隔离；释放后重新启动与新旧代次隔离；退订失败记录及再次释放重试；未启动直接释放的幂等行为 |
| `Interaction/MakeCallCommandInteraction.test.ets` | 31 | 延迟成功回调与请求原样透传；无语音能力时零请求、零订阅；拨号服务同步异常；通话状态及号码事件透传；释放监听及回调身份核对；请求异常后再次启动恢复；多个控制器实例相互独立 |
| `Interaction/MakeCallRequestDispatch.test.ets` | 33 | 重复启动复用同一监听；逆序完成请求与结果计数；连续请求数量及逐次完成；通话状态及号码事件透传 |
| `Interaction/PhoneNumberPayloadPreservation.test.ets` | 10 | 延迟成功回调与请求原样透传；延迟失败回调与错误字段记录；同步失败回调；逆序完成请求与结果计数；同步成功回调 |
| `Interaction/RepeatedMakeCallCommands.test.ets` | 31 | 重复启动复用同一监听；逆序完成请求与结果计数；连续请求数量及逐次完成；通话状态及号码事件透传 |
| `LifecycleState/CallExceptionHandling.test.ets` | 37 | 能力检查异常与错误记录；拨号服务同步异常；订阅异常且请求完成仍可通知；延迟失败回调与错误字段记录；同步失败回调；退订失败记录及再次释放重试 |
| `LifecycleState/CallFailureRecovery.test.ets` | 37 | 请求异常后再次启动恢复；订阅异常后再次启动恢复；退订失败记录及再次释放重试；语音能力开关切换；释放后重新启动与新旧代次隔离 |
| `LifecycleState/CallListenerResourceManagement.test.ets` | 13 | 释放监听及回调身份核对；释放后旧请求回调隔离；释放后旧监听事件隔离；释放后重新启动与新旧代次隔离；退订失败记录及再次释放重试；未启动直接释放的幂等行为 |
| `LifecycleState/CallRequestLifetime.test.ets` | 14 | 延迟成功回调与请求原样透传；延迟失败回调与错误字段记录；同步失败回调；逆序完成请求与结果计数；同步成功回调 |
| `LifecycleState/CallSubscriptionLifecycle.test.ets` | 36 | 释放监听及回调身份核对；释放后旧请求回调隔离；释放后旧监听事件隔离；释放后重新启动与新旧代次隔离；退订失败记录及再次释放重试；未启动直接释放的幂等行为 |
| `LifecycleState/ControllerLifecycle.test.ets` | 9 | 释放监听及回调身份核对；释放后旧请求回调隔离；释放后旧监听事件隔离；释放后重新启动与新旧代次隔离；退订失败记录及再次释放重试；未启动直接释放的幂等行为 |
| `LifecycleState/ControllerReentry.test.ets` | 25 | 释放监听及回调身份核对；释放后旧请求回调隔离；释放后旧监听事件隔离；释放后重新启动与新旧代次隔离；退订失败记录及再次释放重试；未启动直接释放的幂等行为 |
| `LifecycleState/SubscriptionPersistence.test.ets` | 10 | 通话状态及号码事件透传；重复启动复用同一监听；订阅异常且请求完成仍可通知；订阅异常后再次启动恢复 |
| `LifecycleState/SubscriptionRecovery.test.ets` | 10 | 请求异常后再次启动恢复；订阅异常后再次启动恢复；退订失败记录及再次释放重试；语音能力开关切换；释放后重新启动与新旧代次隔离 |
| `LifecycleState/VoiceCapabilityChanges.test.ets` | 14 | 无语音能力时零请求、零订阅；能力检查异常与错误记录；语音能力开关切换 |
| `PerformanceStability/CallRequestBursts.test.ets` | 21 | 重复启动复用同一监听；逆序完成请求与结果计数；连续请求数量及逐次完成；通话状态及号码事件透传 |
| `PerformanceStability/DeferredCallbackBursts.test.ets` | 30 | 延迟成功回调与请求原样透传；延迟失败回调与错误字段记录；同步失败回调；逆序完成请求与结果计数；同步成功回调 |
| `PerformanceStability/ListenerReleaseBalance.test.ets` | 7 | 释放监听及回调身份核对；释放后旧请求回调隔离；释放后旧监听事件隔离；释放后重新启动与新旧代次隔离；退订失败记录及再次释放重试；未启动直接释放的幂等行为 |
| `PerformanceStability/RepeatedControllerReuse.test.ets` | 6 | 释放监听及回调身份核对；释放后旧请求回调隔离；释放后旧监听事件隔离；释放后重新启动与新旧代次隔离；退订失败记录及再次释放重试；未启动直接释放的幂等行为 |
| `PerformanceStability/RequestCallbackOrdering.test.ets` | 5 | 延迟成功回调与请求原样透传；延迟失败回调与错误字段记录；同步失败回调；逆序完成请求与结果计数；同步成功回调 |
| `PerformanceStability/SubscriptionDeduplicationBursts.test.ets` | 28 | 重复启动复用同一监听；逆序完成请求与结果计数；连续请求数量及逐次完成；通话状态及号码事件透传 |
| `PerformanceStability/UnsupportedDeviceNoDispatch.test.ets` | 30 | 无语音能力时零请求、零订阅；能力检查异常与错误记录；语音能力开关切换 |
| `Security/CallFailureIsolation.test.ets` | 11 | 多个控制器实例相互独立；释放后旧请求回调隔离；释放后旧监听事件隔离 |
| `Security/SensitiveNumberForwarding.test.ets` | 22 | 延迟成功回调与请求原样透传；无语音能力时零请求、零订阅；拨号服务同步异常；通话状态及号码事件透传；释放监听及回调身份核对；请求异常后再次启动恢复；多个控制器实例相互独立 |
| `Security/UnsupportedCallIsolation.test.ets` | 12 | 无语音能力时零请求、零订阅；能力检查异常与错误记录；语音能力开关切换 |
| `Validation/CallBoundaryErrorTesting.test.ets` | 25 | 能力检查异常与错误记录；拨号服务同步异常；订阅异常且请求完成仍可通知；延迟失败回调与错误字段记录；同步失败回调；退订失败记录及再次释放重试 |
| `Validation/CallLoggerValidation.test.ets` | 30 | 延迟成功回调与请求原样透传；延迟失败回调与错误字段记录；同步失败回调；逆序完成请求与结果计数；同步成功回调 |
| `Validation/CallStateCodeValidation.test.ets` | 49 | 通话状态及号码事件透传；重复启动复用同一监听；订阅异常且请求完成仍可通知；订阅异常后再次启动恢复 |
| `Validation/CallStateEventValidation.test.ets` | 44 | 通话状态及号码事件透传；重复启动复用同一监听；订阅异常且请求完成仍可通知；订阅异常后再次启动恢复 |
| `Validation/CallbackIdentityValidation.test.ets` | 42 | 释放监听及回调身份核对；释放后旧请求回调隔离；释放后旧监听事件隔离；释放后重新启动与新旧代次隔离；退订失败记录及再次释放重试；未启动直接释放的幂等行为 |
| `Validation/CapabilityTransitionValidation.test.ets` | 20 | 无语音能力时零请求、零订阅；能力检查异常与错误记录；语音能力开关切换 |
| `Validation/DeferredCompletionValidation.test.ets` | 47 | 延迟成功回调与请求原样透传；延迟失败回调与错误字段记录；同步失败回调；逆序完成请求与结果计数；同步成功回调 |
| `Validation/ListenerOwnershipValidation.test.ets` | 43 | 释放监听及回调身份核对；释放后旧请求回调隔离；释放后旧监听事件隔离；释放后重新启动与新旧代次隔离；退订失败记录及再次释放重试；未启动直接释放的幂等行为 |
| `Validation/ListenerResourceValidation.test.ets` | 18 | 释放监听及回调身份核对；释放后旧请求回调隔离；释放后旧监听事件隔离；释放后重新启动与新旧代次隔离；退订失败记录及再次释放重试；未启动直接释放的幂等行为 |
| `Validation/PhonePayloadValidation.test.ets` | 24 | 延迟成功回调与请求原样透传；无语音能力时零请求、零订阅；拨号服务同步异常；通话状态及号码事件透传；释放监听及回调身份核对；请求异常后再次启动恢复；多个控制器实例相互独立 |
| `Validation/SubscriptionTransitionValidation.test.ets` | 41 | 释放监听及回调身份核对；释放后旧请求回调隔离；释放后旧监听事件隔离；释放后重新启动与新旧代次隔离；退订失败记录及再次释放重试；未启动直接释放的幂等行为 |
| **业务合计（79 个文件）** | **1829** | 与 List.test.ets 的业务套件注册一致 |

用例命名采用文件内连续的三位序号（如 `001`、`002`）；`@tc.number` 使用 `SUB_TELEPHONY_MAKECALL_` 前缀，并按 `0100`、`0200` 递增。两种编号分别用于用例名称与测试标识，不应混用。

## 页面测试用例表

共同预置条件：安装本工程主 HAP 与 ohosTest HAP，测试框架可启动 `EntryAbility`，屏幕可交互。`SharedDriver` 自动唤醒屏幕，识别当前已验证的无密码滑动锁屏提示后滑动解锁，等待提示消失及 UI 空闲；启动异常最多尝试 3 次，重试间隔 500 ms。等待或重试耗尽仍报错。PIN 或密码锁屏需先由设备使用者解锁。

| 用例名称（Index.test.ets 的 @tc.name / it） | 测试功能 | 输入或操作 | 预期输出 | 是否自动 |
| --- | --- | --- | --- | --- |
| MakeCallPage_EntryAbilityLaunch_001 | 拉起应用 | 启动后获取栈顶 Ability | Ability 名称为 EntryAbility，Make Call 可见 | Yes |
| MakeCallPage_MakeCallButtonLabel_002 | 按钮文本与状态 | 按 makeCallButton 标识查找按钮 | 文本为 Make Call，按钮可用、可点击 | Yes |
| MakeCallPage_SingleMakeCallButton_003 | 按钮数量 | 按 Make Call 文本查找所有组件 | 数量为 1，文本正确且可用 | Yes |
| MakeCallPage_SystemDialActionAbsent_004 | 已移除按钮检查 | 查找 Dial Call，同时核对保留按钮 | Dial Call 数量为 0；查找结果为 null 时按 0 处理；Make Call 保留 | Yes |
| MakeCallPage_MakeCallButtonBounds_005 | 布局有效性 | 读取按钮 bounds | 右边界大于左边界，下边界大于上边界，左上坐标非负 | Yes |
| MakeCallPage_PageRelaunch_006 | 页面重新启动 | 再次启动 EntryAbility | 页面稳定可见，按钮文本和可用状态正确 | Yes |
| MakeCallPage_ButtonComponentPresence_007 | 通用组件查询 | 按 Button 类型调用公共查询方法 | 组件存在，数量为 1，文本为 Make Call | Yes |
| MakeCallPage_PageStablePolling_008 | 页面稳定轮询 | 每轮轮询 5000 ms；首轮超时后重新拉起并再轮询一次 | 页面稳定，按钮可见、可点击 | Yes |
| MakeCallPage_ClickAndResume_009 | 点击后恢复 | 点击 Make Call，再次启动应用 | 页面恢复，按钮文本为 Make Call 且可用 | Yes |

页面用例沿用示例占位号码 `13xxxx`。点击用例验证页面恢复及按钮状态，不断言真实电话接通。已有设备回归记录未发起真实电话。

## 执行方法与结果判定

先构建并安装同一工程版本的主 HAP 与 ohosTest HAP。设备应支持应用实际声明的系统能力，应用签名、SDK 与设备版本应匹配；出现安装错误 00401004 时先核对设备 rpcid 与 HAP 要求的能力，安装失败不属于测试断言失败。

在 DevEco Studio 中运行 `entry/src/ohosTest/ets/test` 下已注册的测试，或在已配置 hdc 的终端中执行：

```text
hdc shell aa test -b com.samples.MakeCall -m entry_test -s unittest /ets/testrunner/OpenHarmonyTestRunner -s timeout 15000 -s coverage true -w 600000
```

只回归页面套件时，增加 class 过滤：

```text
hdc shell aa test -b com.samples.MakeCall -m entry_test -s unittest /ets/testrunner/OpenHarmonyTestRunner -s class MakeCallPageTest -s timeout 15000 -w 600000
```

`timeout=15000` 是单条用例的等待参数，`-w 600000` 是整次测试命令的等待上限。全量运行时应核对实际完成数为 1838，并分别核对失败、错误、通过和忽略计数；页面专项应完成 9 条。命令被断开或缺少最终汇总时，不能仅根据已打印的通过用例判为全量通过。

测试日志使用 `@ohos.hilog` 输出英文内容，不使用 `console.log`。排查页面启动问题时关注 `MakeCallTest` 与 `testTag` 等相关日志、前台 Ability、锁屏状态和最终用例状态码。

## 已保存的回归记录

下表记录编号与注释修复、格式化后重新编译的设备回归，已核对源码中当前 1838 条用例的名称；结果不作为未来执行的默认值。

| 检查项 | 时间或条件 | 已保存结果 |
| --- | --- | --- |
| 全量设备回归 | 2026-11-18 17:47:28 至 17:49:29（UTC+08:00）；118.12 秒 | 1838 通过，0 失败，0 错误，0 忽略；80 个套件 |
| 页面专项 | 2026-11-18 17:45:45 至 17:46:05（UTC+08:00）；从无密码滑动锁屏启动 | 9/9 通过 |
| 启动准备 | 主机仅建立锁屏条件；由测试辅助代码唤醒、解锁并启动应用 | 未依赖主机提前解锁、启动应用或修改息屏超时 |
| 运行稳定性 | 全量运行期间 | 测试命令退出码 0，无新增本应用故障记录 |
| 主包与测试包编译 | 对应上述最终产物 | 均构建成功，ArkTS 告警为 0 |

本地证据路径相对仓库根目录：`test-adaptation/ui-readiness/full-results.json`、`full-test.log`、`page-results.json`、`page-test.log` 及 `test-adaptation/build-results.json`。这些文件属于本地验证资料，本文所述结果以其时间戳和产物哈希为准；未随测试源码提交时，应由执行者另行留存。

本次回归产物的 SHA-256 如下，用于将结果与实际安装包对应：

| 产物 | SHA-256 |
| --- | --- |
| `entry-default-signed.hap` | `4c83261746d14bc506c81f7b3e0dcbadbb911fdd76caf8d6f2f92623c303eae3` |
| `entry-ohosTest-signed.hap` | `b8bb0dca128ccfff58cd051adf1eff98fa64266749fddebe2dc733bf7ac79792` |

## 维护要求

新增测试必须在 `List.test.ets` 注册，并同步更新本文的逐文件数量和目录汇总。修改生命周期或异步辅助逻辑后，应复核旧请求及旧监听隔离，并保留业务套件的 10 ms 事件循环让步；修改屏幕准备逻辑后，应从锁屏状态回归全部 9 条页面用例。

维护时保留有效断言和故障注入清理，不以跳过用例、吞掉启动异常或固定返回成功代替修复。配置文件按工程约定保留版权头；本次文档更新不包含配置文件提交。
