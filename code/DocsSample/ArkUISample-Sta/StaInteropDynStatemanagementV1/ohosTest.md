# 状态管理V1跨模式调用测试用例归档

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---------|---------|------|---------|:-------:|:-------:|
| @State交互示例 | 设备正常运行 | 点击按钮parent change value | 父组件count加2，仅父组件UI刷新 | 否 | Pass |
| @State交互示例 | 设备正常运行 | 点击按钮child change value | 子组件数值变化，UI刷新 | 否 | Pass |
| @Prop交互示例 | 设备正常运行 | 点击按钮parent change value | 父组件count加2，父子组件UI均刷新 | 否 | Pass |
| @Prop交互示例 | 设备正常运行 | 点击按钮child change value | 子组件数值变化，UI刷新 | 否 | Pass |
| @Link交互示例 | 设备正常运行 | 点击按钮parent change value | 父组件count加2，父子组件UI均刷新 | 否 | Pass |
| @Link交互示例 | 设备正常运行 | 点击按钮child change value | 子组件数值变化，父子组件UI均刷新 | 否 | Pass |
| @Provide/@Consume交互示例 | 设备正常运行 | 点击按钮parent change value | 祖先组件count加2，祖先与后代组件UI均刷新 | 否 | Pass |
| @Provide/@Consume交互示例 | 设备正常运行 | 点击按钮child change value | 后代组件数值变化，祖先与后代组件UI均刷新 | 否 | Pass |
