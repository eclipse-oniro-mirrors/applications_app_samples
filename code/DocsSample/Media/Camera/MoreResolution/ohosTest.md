# ImageEffect测试用例归档

## 用例表

| 测试功能     | 预置条件     | 输入                  | 预期输出     | 是否自动 | 测试结果 |
|----------|----------|---------------------|----------| -------- | -------- |
| 拉起应用     | 设备正常运行   |                     | 成功拉起应用   | 是       | Pass     |
| 申请相机权限   | 进入主界面    | 点击允许按钮              | 成功获取相机权限 | 是 | Pass |
| 拍照模式预览输出 | 进入拍照模式页面 | 点击拍照模式页面，查看相机预览是否正常 | 相机预览输出正常 | 是       | Pass     |
| 录像模式预览输出 | 进入录像模式页面 | 点击录像模式页面，查看相机预览是否正常 | 相机预览输出正常 | 是       | Pass     |
| 拍照保存图片   | 点击拍照     | 点击拍照，自动跳转输出图片       | 照片显示正常   | 是       | Pass     |
| 录像模式预览输出 | 进入录像模式页面 | 点击录像模式页面，查看相机预览是否正常 | 相机预览输出正常 | 是       | Pass     |

## 逻辑用例（数据驱动）

以下 2487 条逻辑与调用序列用例位于 `entry/src/ohosTest/ets/test/logic` 与 `entry/src/ohosTest/ets/test/core`，
每条用例记录 begin/end 日志，断言前打印入参与实际值；期望值由被测逻辑在对应输入下的确定性结果给出，覆盖典型值、边界值与非法值。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| -------- | -------- | ---- | -------- | -------- | -------- |
| ResolutionWidthTest | 无 | 43 组输入（Resolution_ResWidth_0001~0043） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ResolutionHeightTest | 无 | 43 组输入（Resolution_ResHeight_0001~0043） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ResolutionLabelTest | 无 | 43 组输入（Resolution_ResLabel_0001~0043） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ResolutionRatioTest | 无 | 43 组输入（Resolution_ResRatio_0001~0043） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ResolutionFindTest | 无 | 45 组输入（Resolution_ResFind_0001~0045） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ResolutionValidTest | 无 | 43 组输入（Resolution_ResValid_0001~0043） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ResolutionChangeTest | 无 | 48 组输入（Resolution_ResChange_0001~0048） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ProfileFormatTest | 无 | 46 组输入（Resolution_ProfileFormat_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| VideoFrameAllowedTest | 无 | 46 组输入（Resolution_FrameAllowed_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| PreviewSelectTest | 无 | 40 组输入（Resolution_PreviewSelect_0001~0040） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ExactProfileTest | 无 | 46 组输入（Resolution_ExactProfile_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| SelectCameraDeviceTest | 无 | 46 组输入（Resolution_SelectDevice_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| SceneModeSupportTest | 无 | 46 组输入（Resolution_SceneSupport_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| DeviceGuardsTest | 无 | 46 组输入（Resolution_DeviceGuards_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ConfigRatioSelectedTest | 无 | 43 组输入（Resolution_ConfigRatio_0001~0043） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| DynamicConfigRatioTest | 无 | 46 组输入（Resolution_DynamicRatio_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| AngleDiffTest | 无 | 46 组输入（Resolution_AngleDiff_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| UpdateRotationAngleTest | 无 | 43 组输入（Resolution_UpdateRotation_0001~0043） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| SnapshotRotationTest | 无 | 43 组输入（Resolution_SnapshotRotation_0001~0043） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| SaveRotationInfoTest | 无 | 8 组输入（Resolution_SaveRotation_0001~0008） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| DeviceDegreeTest | 无 | 16 组输入（Resolution_DeviceDegree_0001~0016） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| XComponentSizeTest | 无 | 46 组输入（Resolution_XComponentSize_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| SwitchCameraPositionTest | 无 | 43 组输入（Resolution_SwitchPosition_0001~0043） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ModeSwitchNeedsTest | 无 | 36 组输入（Resolution_ModeNeeds_0001~0036） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| FoldDeviceIndexTest | 无 | 46 组输入（Resolution_FoldIndex_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| FoldFallbackTest | 无 | 8 组输入（Resolution_FoldFallback_0001~0008） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| FoldStatusUpdateTest | 无 | 45 组输入（Resolution_FoldUpdate_0001~0045） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ShowResolutionSelectTest | 无 | 2 组输入（Resolution_ShowSelect_0001~0002） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| SliderRangeTest | 无 | 10 组输入（Resolution_SliderRange_0001~0010） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| SliderStepTest | 无 | 46 组输入（Resolution_SliderStep_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ZoomClampTest | 无 | 13 组输入（Resolution_ZoomClamp_0001~0013） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ZoomRoundLabelTest | 无 | 46 组输入（Resolution_ZoomRoundLabel_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| EditSceneTest | 无 | 5 组输入（Resolution_EditScene_0001~0005） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| SaveToastTest | 无 | 46 组输入（Resolution_SaveToast_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| RecordingGuardTest | 无 | 4 组输入（Resolution_RecordGuard_0001~0004） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| FirstRecordingActionTest | 无 | 2 组输入（Resolution_FirstAction_0001~0002） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| PageReloadTest | 无 | 4 组输入（Resolution_PageReload_0001~0004） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ErrorAndRouteTest | 无 | 6 组输入（Resolution_ErrorRoute_0001~0006） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ResolutionPageFlowTest | 无 | 36 组输入（Resolution_PageFlow_0001~0036） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ResolutionChangeFlowTest | 无 | 46 组输入（Resolution_ChangeFlow_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ResolutionIndexFlowTest | 无 | 46 组输入（Resolution_IndexFlow_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| CameraInit2FlowTest | 无 | 17 组输入（Resolution_Init2Flow_0001~0017） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| CameraInit2SequenceTest | 无 | 46 组输入（Resolution_Init2Seq_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ProfileSelectionFlowTest | 无 | 10 组输入（Resolution_ProfileFlow_0001~0010） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| EventNotifyFlowTest | 无 | 46 组输入（Resolution_EventFlow_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| EditPageFlowTest | 无 | 6 组输入（Resolution_EditFlow_0001~0006） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ResolutionDecisionMatrixTest | 无 | 480 组输入（Resolution_DecisionMatrix_0001~0480） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ResolutionProfileMatrixTest | 无 | 24 组输入（Resolution_ProfileMatrix_0001~0024） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ResolutionLifecycleMatrixTest | 无 | 356 组输入（Resolution_LifecycleMatrix_0001~0356） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ResolutionConstantsCoreTest | 无 | 38 组输入（Resolution_Constants_0001~0038） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ResolutionTableCoreTest | 无 | 46 组输入（Resolution_TableCore_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ProfileContractCoreTest | 无 | 13 组输入（Resolution_ProfileCore_0001~0013） | 返回值与状态逐条符合预期 | 是 | 待执行 |
