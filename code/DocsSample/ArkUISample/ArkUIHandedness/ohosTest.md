# ArkUIHandedness弹窗跟手测试用例

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| ------------------------ | ------------ | -------------------- | ------------------------ | -------- | -------- |
| 拉起应用 | 设备正常运行 | 点击应用图标 | 成功拉起应用，显示跟手模式与组件选择主界面 | 是 | 待执行 |
| 指向性跟手AlertDialog弹窗 | 位于主界面 | 点击指向性跟手分组AlertDialog按钮，进入页面后点击AlertDialog按钮 | 弹出AlertDialog，弹窗向触发组件一侧偏移 | 是 | 待执行 |
| 指向性跟手bindSheet半模态 | 位于主界面 | 点击指向性跟手分组bindSheet按钮，进入页面后点击Open sheet on left/center/right按钮 | 弹出居中样式半模态，半模态向触发组件一侧偏移 | 是 | 待执行 |
| 关闭指向性跟手弹窗 | 弹窗已弹出 | 点击弹窗确定按钮 | 弹窗正常关闭 | 是 | 待执行 |
| 智感握姿跟手AlertDialog弹窗流程 | 位于主界面 | 点击智感握姿跟手分组AlertDialog按钮，进入页面后点击AlertDialog按钮，点击确定按钮 | 弹窗正常弹出与关闭 | 是 | 待执行 |
| 智感握姿跟手AlertDialog弹窗（左手） | 左手单手握持设备 | 点击智感握姿跟手分组AlertDialog按钮，进入页面后点击AlertDialog按钮 | 弹出AlertDialog，弹窗向左偏移 | 否 | 待执行 |
| 智感握姿跟手AlertDialog弹窗（右手） | 右手单手握持设备 | 点击智感握姿跟手分组AlertDialog按钮，进入页面后点击AlertDialog按钮 | 弹出AlertDialog，弹窗向右偏移 | 否 | 待执行 |
| 智感握姿跟手bindSheet半模态流程 | 位于主界面 | 点击智感握姿跟手分组bindSheet按钮，进入页面后点击Open sheet on right按钮 | 半模态正常弹出与关闭 | 是 | 待执行 |
| 智感握姿跟手bindSheet半模态 | 单手握持设备 | 点击智感握姿跟手分组bindSheet按钮，进入页面后点击Open sheet按钮 | 弹出居中样式半模态，半模态向握持手一侧偏移 | 否 | 待执行 |
| 不跟手AlertDialog弹窗 | 位于主界面 | 点击不跟手分组AlertDialog按钮，进入页面后点击AlertDialog按钮 | 弹出AlertDialog，弹窗保持默认居中布局 | 是 | 待执行 |
| 不跟手bindSheet半模态 | 位于主界面 | 点击不跟手分组bindSheet按钮，进入页面后点击Open sheet on left按钮 | 弹出居中样式半模态，半模态保持默认居中布局 | 是 | 待执行 |
