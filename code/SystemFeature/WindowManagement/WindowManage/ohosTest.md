# WindowManager 测试用例归档

## 用例表

| 测试功能         | 预置条件     | 输入                                     | 预期输出                            | 是否自动 | 测试结果 |
|--------------| ------------ | ---------------------------------------- |---------------------------------| -------- | -------- |
| 拉起应用         | 设备正常运行 |                                          | 成功拉起WindowManager               | 是       | Pass     |
| 跳转视频页        | 应用正常拉起 | 点击“窗口视频”文字                       | 拉起视频播放页                         | 是       | Pass     |
| 切换窗口方向       | 位于视频页   | 点击切换窗口方向按钮                     | 点击按钮后，视频组件left坐标增加，窗口切换为横屏      | 是       | Pass     |
| 小窗视频是否正常播放   | 位于视频页   | 点击视频                                 | 点击视频出现小窗，再次点击视频小窗消失             | 是       | Pass     |
| 拖拽小窗         | 位于视频页   | 触发小窗，向右上方拖拽小窗               | 获取拖拽前后的小窗中心坐标，前后坐标的变化趋势与拖动的方向一致 | 是       | Pass     |
| 窗口是否正常获焦     | 位于视频页   | 点击视频                                 | 点击视频出现小窗，页面显示窗口状态为“获焦状态”        | 是       | Pass     |
| 窗口是否正常失焦     | 位于视频页   | 点击视频                                 | 再次点击视频小窗消失，页面显示窗口状态为“失焦状态”      | 是       | Pass     |
| 拉起悬浮应用       | 位于视频页   | 触发小窗，点击小窗中的“拉起悬浮应用”按钮 | 成功拉起WindowRatio应用               | 是       | Pass     |
| 跳转系统状态栏属性页   |应用正常拉起  |点击“获取系统栏属性页”按钮                | 成功拉起系统状态栏属性页                    |是        |Pass       |
| 获取系统栏属性      |位于系统状态栏属性页|点击“获取系统栏属性”按钮               | 成功在文本框显示系统栏属性                   |是     |Pass       |
| 跳转设置窗口可触摸区域页 |应用正常拉起|点击“设置窗口可触摸区域页”按钮               | 成功设置窗口可触摸区域页                    |是        |Pass        |
| 点击可触摸区域1     |位于设置窗口可触摸区域页  | 点击“区域1"按钮                 | showToast显示“click 区域1”          |是        |Pass        |
| 点击不可触摸区域2    |位于设置窗口可触摸区域页  | 点击“区域2"按钮                 | 处于不可触摸区域，不响应点击事件        |是        |Pass        |
| 点击不可触摸区域3    |位于设置窗口可触摸区域页  | 点击“区域3"按钮                 | 处于不可触摸区域，不响应点击事件        |是        |Pass        |
| 点击可触摸区域4     |位于设置窗口可触摸区域页  | 点击“区域4"按钮                 | showToast显示“click 区域4”          |是        |Pass        |
| 入口日志工具（EntryLoggerCore，10 条用例） | 位于测试应用 | 调用 entry 日志工具各级别接口 | 10 条用例全部通过 | 是 | Pass |
| HAR 日志工具（HarLoggerCore，10 条用例） | 位于测试应用 | 调用 WindowComponent 日志工具各级别接口 | 10 条用例全部通过 | 是 | Pass |
| 窗口常量模型（WindowConstModelCore，12 条用例） | 位于测试应用 | 读取窗口事件 ID、系统栏颜色等常量 | 12 条用例全部通过 | 是 | Pass |
| 窗口管理逻辑（WindowMangerLogicCore，10 条用例） | 位于测试应用 | 调用 WindowManger 显示参数更新与子窗口回调接口 | 10 条用例全部通过 | 是 | Pass |
| 首页 UI 状态（IndexUiState，10 条用例） | 应用正常拉起 | 在首页点击各导航按钮并返回 | 10 条用例全部通过 | 是 | Pass |
| 窗口视频页 UI（VideoPageUi，8 条用例） | 应用正常拉起 | 进入窗口视频页，检查视频、方向按钮与焦点文本 | 8 条用例全部通过 | 是 | Pass |
| 系统栏属性页 UI 状态（SystemBarUiState，8 条用例） | 应用正常拉起 | 进入系统栏属性页并点击查询按钮 | 8 条用例全部通过 | 是 | Pass |
| 可触摸区域页 UI 状态（TouchableUiState，7 条用例） | 应用正常拉起 | 进入可触摸区域页，点击区域1、区域4并往返进出 | 7 条用例全部通过 | 是 | Pass |

## 逻辑用例（数据驱动）

以下 2366 条用例位于 `entry/src/ohosTest/ets/test/logic`，每条用例记录 begin/end 日志，断言前打印入参与实际值；
期望值由被测逻辑在对应输入下的确定性结果给出，覆盖典型值、边界值与非法值。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| -------- | -------- | ---- | -------- | -------- | -------- |
| vp2pxAt（函数） | 无 | 244 组输入（WindowManage_Vp2pxAt_0001~0244） | 返回值与状态逐条符合预期 | 是 | Pass |
| windowEventMessageOf（函数） | 无 | 90 组输入（WindowManage_WindowEventMessageOf_0001~0090） | 返回值与状态逐条符合预期 | 是 | Pass |
| subWindowWidthPx（函数） | 无 | 120 组输入（WindowManage_SubWindowWidthPx_0001~0120） | 返回值与状态逐条符合预期 | 是 | Pass |
| subWindowHeightPx（函数） | 无 | 120 组输入（WindowManage_SubWindowHeightPx_0001~0120） | 返回值与状态逐条符合预期 | 是 | Pass |
| displayMoveYOf（函数） | 无 | 120 组输入（WindowManage_DisplayMoveYOf_0001~0120） | 返回值与状态逐条符合预期 | 是 | Pass |
| subWindowStartYOf（函数） | 无 | 60 组输入（WindowManage_SubWindowStartYOf_0001~0060） | 返回值与状态逐条符合预期 | 是 | Pass |
| restartsGesture（函数） | 无 | 50 组输入（WindowManage_RestartsGesture_0001~0050） | 返回值与状态逐条符合预期 | 是 | Pass |
| nextEndOf（函数） | 无 | 243 组输入（WindowManage_NextEndOf_0001~0243） | 返回值与状态逐条符合预期 | 是 | Pass |
| insideBounds（函数） | 无 | 50 组输入（WindowManage_InsideBounds_0001~0050） | 返回值与状态逐条符合预期 | 是 | Pass |
| indexAlignmentOf（函数） | 无 | 2 组输入（WindowManage_IndexAlignmentOf_0001~0002） | 返回值与状态逐条符合预期 | 是 | Pass |
| attributeAreaOf（函数） | 无 | 243 组输入（WindowManage_AttributeAreaOf_0001~0243） | 返回值与状态逐条符合预期 | 是 | Pass |
| isValidBrightness（函数） | 无 | 50 组输入（WindowManage_IsValidBrightness_0001~0050） | 返回值与状态逐条符合预期 | 是 | Pass |
| new SubWindowDragModel（构造） | 无 | 113 组输入（WindowManage_SubWindowDragModelCtor_0001~0113） | 返回值与状态逐条符合预期 | 是 | Pass |
| SubWindowDragModel.updateDisplay（实例方法） | 无 | 243 组输入（WindowManage_SubWindowDragModelUpdateDisplay_0001~0243） | 返回值与状态逐条符合预期 | 是 | Pass |
| SubWindowDragModel.setTopHeight（实例方法） | 无 | 119 组输入（WindowManage_SubWindowDragModelSetTopHeight_0001~0119） | 返回值与状态逐条符合预期 | 是 | Pass |
| SubWindowDragModel.touch（实例方法） | 无 | 243 组输入（WindowManage_SubWindowDragModelTouch_0001~0243） | 返回值与状态逐条符合预期 | 是 | Pass |
| SubWindowDragModel flow（调用序列） | 无 | 243 组输入（WindowManage_SubWindowDragModelFlow_0001~0243） | 返回值与状态逐条符合预期 | 是 | Pass |
| WindowMoveLogic（常量契约） | 无 | 13 组输入（WindowManage_WindowMoveLogicConstants_0001~0013） | 返回值与状态逐条符合预期 | 是 | Pass |
