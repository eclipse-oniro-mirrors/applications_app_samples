# UI互操作声明文件规范测试用例归档

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---------|---------|------|---------|:-------:|:-------:|
| ArkTS-Sta调用ArkTS-Dyn V1装饰器 | 设备正常运行 | 点击按钮进入V1装饰器页面 | 页面正常展示ChildV1组件及状态变量文本 | 否 | Pass |
| ArkTS-Sta调用ArkTS-Dyn @Builder等 | 设备正常运行 | 点击按钮进入@Builder页面 | 页面正常展示ChildBuilder组件、staticBuilder和staticWrappedBuilder | 否 | Pass |
