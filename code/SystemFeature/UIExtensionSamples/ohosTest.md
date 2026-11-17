|测试功能|预置条件|输入|预期输出|是否手动|测试结果|
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
|拉起应用|	设备正常运行|		|成功拉起应用|否|Pass|
|测试AbilityStartCallback中接口| AbilityStartCallback开发示例页面 | 1.点击startAbilityByType(onResult)按钮，拉起新界面，点击返回按钮<br/>2.点击startAbilityByType(onError)按钮 | 1.拉起新界面<br/>2.弹出Toast信息 | 否 |Pass|
|测试UIAbilityContext中接口| 位于UIAbilityContext开发示例页面 | 1.点击openLink按钮<br/>2.点击返回按钮，返回UIExtensionContext开发示例界面，点击启动UIExtensionAbility按钮<br/>3.点击reportDrawnCompleted按钮<br/>4.点击terminateSelf（callback）按钮<br/>5.点击启动UIExtensionAbility按钮 | 1.拉起新的Ability<br/>2.进入UIExtensionAbility界面<br/>3.弹出Toast信息<br/>4.UIExtensionAbility界面消失<br/>5.进入UIExtensionAbility界面 | 否 |Pass|
|测试UIAbilityContext中接口| 位于UIAbilityContext开发示例页面 | 1.点击terminateSelf（promise）按钮<br/>2.点击启动UIExtensionAbility按钮，进入UIExtensionAbility界面，点击terminateSelfWithResult（promise）按钮<br/>3.点击启动UIExtensionAbility按钮，进入UIExtensionAbility界面，点击terminateSelfWithResult（callback）按钮 | 1.UIExtensionAbility界面消失<br/>2.UIExtensionAbility界面消失<br/>3.UIExtensionAbility界面消失 | 否 |Pass|
|测试UIExtensionContentSession中接口| 位于UIExtensionContentSession开发示例页面 | 1.点击启动UIExtensionAbility按钮<br/>2.点击terminateSelfWithResult（promise）按钮<br/>3.点击启动UIExtensionAbility按钮，进入UIExtensionAbility界面，点击terminateSelfWithResult（callback）按钮<br/>4.点击启动UIExtensionAbility按钮 | 1.进入UIExtensionAbility界面<br/>2.UIExtensionAbility界面消失<br/>3.UIExtensionAbility界面消失<br/>4.进入UIExtensionAbility界面 | 否 |Pass|
|测试UIExtensionContentSession中接口| 位于UIExtensionContentSession开发示例页面 | 1.点击setWindowPrivacyMode（callback）按钮<br/>2.点击setWindowPrivacyMode（promise）按钮<br/>3.点击getUIExtensionWindowProxy按钮 | 1.弹出Toast信息<br/>2.弹出Toast信息<br/>3.弹出Toast信息 | 否 |Pass|

## 逻辑用例（数据驱动）

以下 2233 条用例位于 `entry/src/ohosTest/ets/test/logic`，每条用例记录 begin/end 日志，断言前打印入参与实际值；
期望值由被测逻辑在对应输入下的确定性结果给出，覆盖典型值、边界值与非法值。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| -------- | -------- | ---- | -------- | -------- | -------- |
| routeOf（函数） | 无 | 90 组输入（UIExtensionSamples_RouteOf_0001~0090） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| titleResourceOf（函数） | 无 | 90 组输入（UIExtensionSamples_TitleResourceOf_0001~0090） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| listKeyOf（函数） | 无 | 90 组输入（UIExtensionSamples_ListKeyOf_0001~0090） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| isListedPage（函数） | 无 | 30 组输入（UIExtensionSamples_IsListedPage_0001~0030） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| modalWantOf（函数） | 无 | 2 组输入（UIExtensionSamples_ModalWantOf_0001~0002） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| terminateResultOf（函数） | 无 | 4 组输入（UIExtensionSamples_TerminateResultOf_0001~0004） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| modalMessageOf（函数） | 无 | 222 组输入（UIExtensionSamples_ModalMessageOf_0001~0222） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| reportDrawnMessageOf（函数） | 无 | 222 组输入（UIExtensionSamples_ReportDrawnMessageOf_0001~0222） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| privacyModeMessageOf（函数） | 无 | 2 组输入（UIExtensionSamples_PrivacyModeMessageOf_0001~0002） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| windowProxyMessageOf（函数） | 无 | 90 组输入（UIExtensionSamples_WindowProxyMessageOf_0001~0090） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| startErrorMessageOf（函数） | 无 | 222 组输入（UIExtensionSamples_StartErrorMessageOf_0001~0222） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| startResultLogOf（函数） | 无 | 222 组输入（UIExtensionSamples_StartResultLogOf_0001~0222） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| openLinkLogOf（函数） | 无 | 222 组输入（UIExtensionSamples_OpenLinkLogOf_0001~0222） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| allowsBrowserFallback（函数） | 无 | 2 组输入（UIExtensionSamples_AllowsBrowserFallback_0001~0002） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| sessionCreateLogOf（函数） | 无 | 222 组输入（UIExtensionSamples_SessionCreateLogOf_0001~0222） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| contentPageOf（函数） | 无 | 50 组输入（UIExtensionSamples_ContentPageOf_0001~0050） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| new UiExtensionPageState（构造） | 无 | 1 组输入（UIExtensionSamples_UiExtensionPageStateCtor_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| UiExtensionPageState.open（实例方法） | 无 | 30 组输入（UIExtensionSamples_UiExtensionPageStateOpen_0001~0030） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| UiExtensionPageState.requestModal（实例方法） | 无 | 60 组输入（UIExtensionSamples_UiExtensionPageStateRequestModal_0001~0060） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| UiExtensionPageState.terminateWithResult（实例方法） | 无 | 2 组输入（UIExtensionSamples_UiExtensionPageStateTerminateWithResult_0001~0002） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| UiExtensionPageState.setPrivacyMode（实例方法） | 无 | 2 组输入（UIExtensionSamples_UiExtensionPageStateSetPrivacyMode_0001~0002） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| UiExtensionPageState.reportDrawn（实例方法） | 无 | 120 组输入（UIExtensionSamples_UiExtensionPageStateReportDrawn_0001~0120） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| UiExtensionPageState flow（调用序列） | 无 | 222 组输入（UIExtensionSamples_UiExtensionPageStateFlow_0001~0222） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| UiExtensionLogic（常量契约） | 无 | 14 组输入（UIExtensionSamples_UiExtensionLogicConstants_0001~0014） | 返回值与状态逐条符合预期 | 是 | 待执行 |
