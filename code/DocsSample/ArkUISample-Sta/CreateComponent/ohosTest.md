# @Component装饰器测试用例归档

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---------|---------|------|---------|:-------:|:-------:|
| 自定义组件基本用法 | 设备正常运行 | 点击Hello文本 | message变为'Hello, ArkUI!' | 是 | Pass |
| @Entry装饰器 | 设备正常运行 | 进入页面 | 显示@Entry参数说明文本 | 是 | Pass |
| 自定义组件参数规定 | 设备正常运行 | 进入页面 | 显示countDownFrom: 10（粉色） | 是 | Pass |
| build()函数 | 设备正常运行 | 进入页面 | 显示Hello world | 是 | Pass |
| build()中变量声明 | 设备正常运行 | 进入页面 | 显示show text1 | 是 | Pass |
| build()中日志打印 | 设备正常运行 | 点击按钮 | stateVar值变化，日志输出 | 是 | Pass |
| switch/case结构 | 设备正常运行 | 点击按钮 | 文本在text1、text2、default间切换 | 是 | Pass |
| 本地作用域 | 设备正常运行 | 进入页面 | 显示hello world | 是 | Pass |
| 表达式 | 设备正常运行 | 点击文本 | 在'is equal to 1'和'is not euqal to 1'间切换 | 是 | Pass |
| 不建议用法 | 设备正常运行 | 进入页面 | 显示hello文本 | 是 | Pass |
| 自定义组件通用样式 | 设备正常运行 | 进入页面 | Button显示红色背景 | 是 | Pass |
| 支持自定义组件扩展 | 设备正常运行 | 进入页面 | ChildComponent背景为粉色，message变化 | 是 | Pass |
