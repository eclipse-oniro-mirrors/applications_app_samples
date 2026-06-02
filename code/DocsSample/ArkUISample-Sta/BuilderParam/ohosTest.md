# @BuilderParam装饰器测试用例归档

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---------|---------|------|---------|:-------:|:-------:|
| 父组件初始化子组件@BuilderParam | 设备正常运行 | 进入页面 | 显示Parent builder文字 | 是 | Pass |
| this的指向 | 设备正常运行 | 进入页面 | 显示Parent文字 | 是 | Pass |
| 参数初始化组件 | 设备正常运行 | 进入页面 | 显示Parent和global Builder label | 是 | Pass |
| 尾随闭包初始化组件示例1 | 设备正常运行 | 点击testA | 标题变为changeHeader | 是 | Pass |
| 尾随闭包初始化组件示例2 | 设备正常运行 | 进入页面 | 显示Local Builder和Global Builder | 是 | Pass |
| @BuilderParam隔离跳转逻辑 | 设备正常运行 | 进入页面 | ParentPage和ChildPage可跳转，ChildPageBuilderParam不可跳转 | 是 | Pass |
| 全局和局部@Builder初始化 | 设备正常运行 | 进入页面 | 显示Local Builder和Global Builder | 是 | Pass |
| @ComponentV2中使用 | 设备正常运行 | 进入页面 | 显示Local Builder和Global Builder | 是 | Pass |
| @Require和@BuilderParam联合使用 | 设备正常运行 | 进入页面 | 显示Hello World | 是 | Pass |
| @BuilderParam初始化值必须为@Builder | 设备正常运行 | 进入页面 | 显示Hello World | 是 | Pass |
