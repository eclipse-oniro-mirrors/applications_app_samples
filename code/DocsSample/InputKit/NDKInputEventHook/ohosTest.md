# 事件末端拦截再分发（C/C++）

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|--------------|----------------|---------------------------------------------|--------------------------------------------------------------|------|------|
| 拉起应用 | 设备正常运行 | | 成功拉起应用，页面显示事件结果展示区、输入框和两个功能按钮 | 是 | Pass |
| 创建并启用handler | 成功拉起应用，已在设置中手动开启输入事件拦截授权 | 点击**Create and enable event handler. Observing key/mouse/touch/axis events** | 结果区显示**Event handler enabled, observing key/mouse/touch/axis events** | 是 | Pass |
| 按键事件拦截 | handler已启用 | 点击数字键"1" | 结果区显示按键事件信息，"1"不输入到输入框 | 否 | Pass |
| 按键事件再分发 | handler已启用 | 点击数字键"2" | 结果区显示按键事件信息，"2"正常输入到输入框 | 否 | Pass |
| 鼠标/触摸/轴事件接收 | handler已启用 | 移动鼠标、点击触屏、滚动滚轮 | 结果区实时显示对应事件信息，事件正常分发 | 否 | Pass |
| handler超时禁用回调 | handler已启用且事件回调处理超时 | 等待系统超时禁用 | 结果区显示**Event handler disabled (callback timeout), input events resume default dispatch**，事件恢复默认分发 | 否 | Pass |
| 禁用并销毁handler | handler已启用 | 点击**Disable and destroy event handler** | 结果区显示**Event handler disabled and destroyed**，输入事件恢复默认分发 | 是 | Pass |
| 权限未授权时创建handler | 未在设置中开启输入事件拦截授权 | 点击**Create and enable event handler. Observing key/mouse/touch/axis events** | 结果区显示创建失败信息及返回码 | 否 | Pass |

## 测试报告

测试环境：2in1真机，SDK 26.1.0，DevEco Studio 6.0。

自动化用例（ohosTest，共3条）：

| 用例名 | 测试步骤 | 测试结果 |
|--------|--------------------------------------------------------------|------|
| NDKInputEventHook_StartAbility_001 | 拉起应用，断言两个功能按钮存在 | Pass |
| NDKInputEventHook_createAndEnableHandler_001 | 拉起应用，点击创建按钮，断言结果区文本更新 | Pass |
| NDKInputEventHook_disableAndDestroyHandler_001 | 拉起应用，点击禁用按钮，断言结果区文本更新 | Pass |

手工用例（按键拦截、事件接收、超时禁用、权限未授权）已在2in1真机验证通过。
