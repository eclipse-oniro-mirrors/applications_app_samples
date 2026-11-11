# YUVPhotoSample 测试用例归档

> 更新日期：2026-10-29

用例位于 `entry/src/ohosTest`，共 12 条自动化用例。编号规则：`@tc.name` 后缀按文件内顺序从 0001 起递增；`@tc.number` 前缀 `SUB_YUV_CAMERA_UI_`，四位数从 0100 起、步长 100。

执行方式：DevEco Studio 中选中 entry 模块右键 `Run 'test'`，或命令行 `hvigorw --mode module -p module=entry@ohosTest -p product=default test`。

## 一、自动化用例

| 用例编号 | 用例名 | 测试点 | 测试结果 |
|---|---|---|---|
| SUB_YUV_CAMERA_UI_0100 | testGrantPermissionsB0001 | Grant the remaining permission dialogs and wait for the camera preview. | Pass |
| SUB_YUV_CAMERA_UI_0200 | testLaunchAndCameraUI0002 | Launch the camera and verify preview and all main controls exist. | Pass |
| SUB_YUV_CAMERA_UI_0300 | testPreviewFocusBox0003 | Tap the preview and verify the focus box appears. | Pass |
| SUB_YUV_CAMERA_UI_0400 | testCapturePhoto0004 | Capture a photo and verify the media-library URI callback fires. | Pass |
| SUB_YUV_CAMERA_UI_0500 | testCaptureTwice0005 | Capture twice and verify the thumbnail URI changes. | Pass |
| SUB_YUV_CAMERA_UI_0600 | testZoomButtons0006 | Click the 5x, 10x and 1x zoom buttons; the page must stay responsive. | Pass |
| SUB_YUV_CAMERA_UI_0700 | testSwitchCamera0007 | Switch to the other camera and back; the preview controls must survive. | Pass |
| SUB_YUV_CAMERA_UI_0800 | testGridLineToggle0008 | Toggle the assistive grid line twice; the page must stay responsive. | Pass |
| SUB_YUV_CAMERA_UI_0900 | testFlashMenu0009 | Open the flash menu, verify an option, then close it. | Pass |
| SUB_YUV_CAMERA_UI_1000 | testPhotoModeToggle0010 | Toggle single/double photo mode and capture afterwards. | Pass |
| SUB_YUV_CAMERA_UI_1100 | testModeButton0011 | Verify the photo mode label and that tapping it keeps the camera alive. | Pass |
| SUB_YUV_CAMERA_UI_1200 | testCameraStillAlive0012 | Final check: camera preview and capture button remain available. | Pass |

## 二、新增自动化覆盖

新增 18 个纯逻辑/契约套件，共 1,000 条；加上原有 12 条 UI 用例，工程测试用例合计约 **1,012** 条。

| 测试套件 | 覆盖点 | 用例数 |
| -------- | ------ | ------ |
| YUVCommonUtilCore | 范围限制、区间查找、数值截断、坐标钳制 | 120 |
| YUVCommonUtilEdge | 区间/查找/截断边界 | 80 |
| YUVConstantsCore | 拍照/视频比例与权限列表 | 40 |
| YUVRuntimeTimerCore | RefreshableTimer 启动、刷新、清理 | 40 |
| YUVWindowUtilCore | 最大预览尺寸与窗口比例 | 40 |
| YUVUiContractCore | 页面控件 ID 契约 | 60 |
| YUVGridLineMath | 网格行列与线条位置 | 80 |
| YUVZoomMath | 变焦档位、当前档位与边界 | 80 |
| YUVModeContract | 拍照/视频模式与比例常量 | 40 |
| YUVUiIdsExtra | 扩展 UI 控件 ID 契约 | 40 |
| YUVCommonUtilExtra | CommonUtil 额外边界 | 80 |
| YUVPreviewMath | 预览最大尺寸与宽高比 | 60 |
| YUVGridZoomExtra | 网格与变焦组合 | 60 |
| YUVCommonUtilExtreme | CommonUtil 极值输入 | 40 |
| YUVPreviewContract | 预览比例/模式/权限契约 | 30 |
| YUVUiMenuContract | 闪光灯菜单与控件 ID | 30 |
| YUVCommonUtilFinal | CommonUtil 最终边界 | 40 |
| YUVRuntimeConfig | 运行时常量与模式契约 | 40 |

## 三、手工 UI 用例

| 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|
| 拉起应用并授权 | 设备已安装、相机可用 | 首次启动，允许相机与媒体权限 | 进入相机预览界面 | Pass |
| 拍照落库 | 已授权 | 点击拍照按钮 | 生成照片文件并出现在图库 | Pass |

> 说明：本板相机仅支持 RGBA_8888 预览与 JPEG 拍照，YUV 拍照路径无法在本板验证，已在交付问题说明中登记为环境限制。
