# 组件扩展测试用例归档

## 用例表
### @CustomEnv用例
| 测试功能                       | 预置条件       | 输入    | 预期输出                                                      | 是否自动 | 测试结果 |
|----------------------------| -------------- |-------|-----------------------------------------------------------| :------- | -------- |
| 测试@CustomEnv用例-装饰字符串类型     | 设备正常运行 | 运行程序  | 页面显示正常          | 是       | Pass     |
| 测试@CustomEnv用例-装饰数字类型      | 设备正常运行 | 运行程序  | 页面显示正常          | 是       | Pass     |
| 测试@CustomEnv用例-装饰boolean类型 | 设备正常运行 | 运行程序  | 页面显示正常          | 是       | Pass     |
| 测试@CustomEnv用例-装饰class     | 设备正常运行 | 运行程序  | 页面显示正常          | 是       | Pass     |
| 测试@CustomEnv用例-装饰set类型      | 设备正常运行 | 运行程序  | 页面显示正常          | 是       | Pass     |
| 测试@CustomEnv用例-装饰array类型 | 设备正常运行 | 运行程序  | 页面显示正常          | 是       | Pass     |
| 测试@CustomEnv用例-装饰map类型      | 设备正常运行 | 运行程序  | 页面显示正常          | 是       | Pass     |
| 测试@CustomEnv用例-装饰date类型 | 设备正常运行 | 运行程序  | 页面显示正常          | 是       | Pass     |
| 测试@CustomEnv用例-遵循就近查找原则 | 设备正常运行 | 嵌套WithEnv组件  | 页面显示正常，内容显示为子组件最近的WithEnv的值         | 是       | Pass     |
| 测试@CustomEnv用例-支持响应式能力 | 设备正常运行 |  设置WithEnv组件，点击button，更新.customEnv的值  | 页面显示正常，对应子组件的值同步更新         | 是       | Pass     |
| 测试@CustomEnv用例-支持Monitor能力 | 设备正常运行 |  设置Monitor监听，点击button，更改被监听属性的值  | 页面显示正常，触发Monitor监听         | 是       | Pass     |
| 测试@CustomEnv用例-支持addMonitor能力 | 设备正常运行 |  设置addMonitor监听，点击button，更改被监听属性的值  | 页面显示正常，触发addMonitor监听         | 是       | Pass     |
| 测试@CustomEnv用例-支持V1V2混合使用 | 设备正常运行 |  运行程序  | 页面显示正常         | 是       | Pass     |