# UdmfNdkSample 测试用例归档

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---------|---------|------|---------|---------|
| 拉起应用 | 设备正常运行 | - | 成功拉起应用，显示主界面 | Pass |
| 获取UTD类型标识符功能测试 | 位于主页 | 点击getTypeId按钮 | 控制台输出typeId数量，并显示utd1与utd2比较结果 | Pass |
| 发送统一数据功能测试 | 位于主页 | 点击sendUnifiedData按钮 | 控制台打印key值 | Pass |
| 获取统一数据功能测试 | 位于主页 | 点击getUnifiedData按钮 | 控制台输出失败结果 | Pass |
| 延迟发送统一数据功能测试 | 位于主页 | 点击delaySendUnifiedData按钮 | 控制台输出生成的key值 | Pass |
