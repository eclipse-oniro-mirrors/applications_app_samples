# @BuilderV2跨模式调用测试用例归档

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---------|---------|------|---------|:-------:|:-------:|
| @Builder按引用传递示例 | 设备正常运行 | 点击按钮Click me | 文本从Local Interop变为ArkUI，UI刷新 | 否 | Pass |
| @BuilderParam成员属性示例 | 设备正常运行 | 点击CustomContainer中的文本 | 文本从header变为changeHeader，UI刷新 | 否 | Pass |
| WrappedBuilder对象示例 | 设备正常运行 | 点击按钮Click me | 文本从Hello World!变为Hello ArkUI!，UI刷新 | 否 | Pass |
