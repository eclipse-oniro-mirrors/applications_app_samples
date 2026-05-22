# @SyncMonitor装饰器测试用例归档
   	 
## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---------|---------|------|---------|:-------:|:-------:|
| SyncMonitorArraySum示例 | 设备正常运行 | 点击按钮Calculate a sum | hilog输出sum变化日志 | 是 | Pass |
| SyncMonitorMultiVars示例 | 设备正常运行 | 点击按钮change string | message和name变化日志 | 是 | Pass |
| SyncMonitorClassObject示例 | 设备正常运行 | 点击按钮change info | info change日志 | 是 | Pass |
| SyncMonitorObservedClass示例 | 设备正常运行 | 点击按钮change name | name变化日志 | 是 | Pass |
| SyncMonitorDeepProperty示例 | 设备正常运行 | 点击按钮change num | inner.num变化日志 | 是 | Pass |
| SyncMonitorInheritance示例 | 设备正常运行 | 点击按钮change name | 父子类回调日志 | 是 | Pass |
| SyncMonitorArray示例 | 设备正常运行 | 点击按钮Change dimensionTwo | dimensionTwo变化日志 | 是 | Pass |
| SyncMonitorWildcardClass示例 | 设备正常运行 | 点击按钮Change propA | onClsChanged日志 | 是 | Pass |