# PrintExtensionAbilityGuide 测试用例归档

## 用例表

| 测试功能                 | 预置条件                 | 输入                              | 预期输出             | 是否自动 | 测试结果 |
| ------------------------ | ------------------------ | --------------------------------- | -------------------- | -------- | -------- |
| 拉起应用                 | 设备正常运行             |                                   | 成功拉起应用         | 是       | Pass     |
| 注册打印扩展能力         | 应用已安装               | 设置-打印机和扫描仪-添加打印机    | 拉起打印扩展能力     | 是       | Pass     |
| onCreate回调验证          | 打印扩展能力被拉起       | 触发onCreate                      | 日志输出"onCreate"   | 是       | Pass     |
| onStartDiscoverPrinter回调验证 | 打印扩展能力已初始化 | 触发发现打印机                    | 日志输出"onStartDiscoverPrinter enter" | 是 | Pass |
| onConnectPrinter回调验证 | 已发现打印机             | 连接打印机                        | 日志输出"onConnectPrinter enter" | 是 | Pass |
