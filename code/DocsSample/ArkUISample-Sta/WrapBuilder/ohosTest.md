# wrapBuilder测试用例归档

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---------|---------|------|---------|:-------:|:-------:|
| @Builder方法赋值给变量 | 设备正常运行 | 进入页面 | 显示Hello World文字 | 是 | Pass |
| @Builder方法赋值给变量在UI语法中使用 | 设备正常运行 | 进入页面 | 显示Hello World和粉色Hello World文字 | 是 | Pass |
| 引用传递 | 设备正常运行 | 点击Click me按钮 | 文字追加感叹号 | 是 | Pass |
| 动态切换 | 设备正常运行 | 点击Click to change按钮 | textBuilder和buttonBuilder动态切换 | 是 | Pass |
