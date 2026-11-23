# CustomCamera-master测试用例归档

## 用例表

> UI 自动化用例保留在 `entry/src/ohosTest/ets/test/Ability.test.ets`，默认不在 `List.test.ets` 注册：
> 真机上权限弹窗/页面加载会导致 `LIFECYCLE_TIMEOUT`，从而中断整个测试进程。默认执行以下逻辑用例。

## 逻辑用例（数据驱动）

以下 2496 条逻辑与调用序列用例位于 `entry/src/ohosTest/ets/test/logic` 与 `entry/src/ohosTest/ets/test/core`，
每条用例记录 begin/end 日志，断言前打印入参与实际值；期望值由被测逻辑在对应输入下的确定性结果给出，覆盖典型值、边界值与非法值。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| -------- | -------- | ---- | -------- | -------- | -------- |
| FillTest | 无 | 46 组输入（Camera_Fill_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| FocusFrameOffsetTest | 无 | 48 组输入（Camera_FocusFrameOffset_0001~0048） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| FlashIconTest | 无 | 46 组输入（Camera_FlashIcon_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| WhiteBalanceTextTest | 无 | 46 组输入（Camera_WhiteBalanceText_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| WhiteBalanceValidTest | 无 | 46 组输入（Camera_WhiteBalanceValid_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| SwitchCameraIndexTest | 无 | 45 组输入（Camera_SwitchCameraIndex_0001~0045） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| CaptureMirrorTest | 无 | 45 组输入（Camera_CaptureMirror_0001~0045） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| SliderSettingsTest | 无 | 46 组输入（Camera_SliderSettings_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ZoomRoundTest | 无 | 46 组输入（Camera_ZoomRound_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ZoomLabelTest | 无 | 46 组输入（Camera_ZoomLabel_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| SnapshotGuardTest | 无 | 40 组输入（Camera_SnapshotGuard_0001~0040） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| VideoUriTest | 无 | 41 组输入（Camera_VideoUri_0001~0041） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| SceneModeTextTest | 无 | 46 组输入（Camera_SceneModeText_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| NextFlagTest | 无 | 46 组输入（Camera_NextFlag_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ConcatDateTest | 无 | 45 组输入（Camera_ConcatDate_0001~0045） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ConcatTimeTest | 无 | 45 组输入（Camera_ConcatTime_0001~0045） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| FocusPointXTest | 无 | 48 组输入（Camera_FocusPointX_0001~0048） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| FocusPointYTest | 无 | 48 组输入（Camera_FocusPointY_0001~0048） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| VideoTimeTest | 无 | 48 组输入（Camera_VideoTime_0001~0048） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ZoomClampTest | 无 | 48 组输入（Camera_ZoomClamp_0001~0048） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ExposureBiasClampTest | 无 | 47 组输入（Camera_ExposureBiasClamp_0001~0047） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| MeteringPointTest | 无 | 46 组输入（Camera_MeteringPoint_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| Px2VpTest | 无 | 46 组输入（Camera_Px2Vp_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ZoomCycleTest | 无 | 46 组输入（Camera_ZoomCycle_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| DeviceIndexValidTest | 无 | 46 组输入（Camera_DeviceIndexValid_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| SceneModeSupportedTest | 无 | 46 组输入（Camera_SceneModeSupported_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| VideoFrameAllowedTest | 无 | 46 组输入（Camera_VideoFrameAllowed_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ProfileMatchTest | 无 | 44 组输入（Camera_ProfileMatch_0001~0044） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| CameraPositionTest | 无 | 46 组输入（Camera_CameraPosition_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| EditSceneContractTest | 无 | 46 组输入（Camera_EditSceneContract_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| CameraSessionInitTest | 无 | 46 组输入（Camera_SessionInit_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| CameraSessionReleaseTest | 无 | 46 组输入（Camera_SessionRelease_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| CameraSessionSwitchTest | 无 | 46 组输入（Camera_SessionSwitch_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| CameraSessionCaptureTest | 无 | 46 组输入（Camera_SessionCapture_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| CameraSessionVideoTest | 无 | 34 组输入（Camera_SessionVideo_0001~0034） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| CameraSessionFlashTest | 无 | 46 组输入（Camera_SessionFlash_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| CameraSessionFocusTest | 无 | 46 组输入（Camera_SessionFocus_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| CameraSessionZoomTest | 无 | 46 组输入（Camera_SessionZoom_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| AnimateStateTest | 无 | 34 组输入（Camera_AnimateState_0001~0034） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| AnimateSequenceTest | 无 | 35 组输入（Camera_AnimateSequence_0001~0035） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| AnimateModeSwitchTest | 无 | 46 组输入（Camera_AnimateModeSwitch_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| AnimateSwitchCameraTest | 无 | 46 组输入（Camera_AnimateSwitchCamera_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| AnimateCaptureTest | 无 | 46 组输入（Camera_AnimateCapture_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| AnimateFrameStartTest | 无 | 46 组输入（Camera_AnimateFrameStart_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| WhiteBalanceModelFlowTest | 无 | 12 组输入（Camera_WhiteBalanceModelFlow_0001~0012） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| FlashingLightModelFlowTest | 无 | 46 组输入（Camera_FlashingLightModelFlow_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| SlideModelFlowTest | 无 | 46 组输入（Camera_SlideModelFlow_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| EditPageModelFlowTest | 无 | 46 组输入（Camera_EditPageModelFlow_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| GlobalContextModelFlowTest | 无 | 46 组输入（Camera_GlobalContextModelFlow_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ProfileFindTest | 无 | 46 组输入（Camera_ProfileFind_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| CameraPipelineTest | 无 | 46 组输入（Camera_CameraPipeline_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| BoundaryEnvelopeTest | 无 | 40 组输入（Camera_BoundaryEnvelope_0001~0040） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| CameraEventNotifyTest | 无 | 46 组输入（Camera_EventNotify_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| CameraConstantsCoreTest | 无 | 45 组输入（Camera_Constants_0001~0045） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| CameraAnimationCoreTest | 无 | 46 组输入（Camera_AnimCore_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| CameraServiceCoreTest | 无 | 48 组输入（Camera_ServiceCore_0001~0048） | 返回值与状态逐条符合预期 | 是 | 待执行 |
