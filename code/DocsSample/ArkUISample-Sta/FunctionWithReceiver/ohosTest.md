# Function-with-Receiver测试用例归档

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---------|---------|------|---------|:-------:|:-------:|
| Function-with-Receiver支持参数 | 设备正常运行 | 进入页面 | 显示两个Fancy文字，字号分别为16和24 | 是 | Pass |
| 链式调用Function-with-Receiver | 设备正常运行 | 进入页面 | 显示Fancy文字，红色字体 | 是 | Pass |
| 参数为function作为Event事件句柄 | 设备正常运行 | 点击文字 | 文字从Hello World变为Hello ArkUI | 是 | Pass |
| 参数为状态变量 | 设备正常运行 | 点击文字 | 文字字号从20变为30 | 是 | Pass |
| 使用场景(不使用) | 设备正常运行 | 进入页面 | 显示三个不同样式的Hello World文字 | 是 | Pass |
| 使用场景(使用) | 设备正常运行 | 进入页面 | 显示三个不同样式的Hello World文字，代码更简洁 | 是 | Pass |
