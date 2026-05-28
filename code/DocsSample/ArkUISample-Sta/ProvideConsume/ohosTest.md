# @Provide装饰器和@Consume装饰器测试用例归档
  	 
## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---------|---------|------|---------|:-------:|:-------:|
| @Provide和@Consume装饰interface字面量 | 设备正常运行 | 点击按钮 | interface字面量属性变化可观察 | 是 | Pass |
| @Provide和@Consume基本使用 | 设备正常运行 | 点击按钮 | count值双向同步变化 | 是 | Pass |
| @Consume禁止外部传入初始化 | 设备正常运行 | 查看页面 | @Consume正确匹配@Provide变量 | 是 | Pass |
| @Consume设置默认值示例 | 设备正常运行 | 查看页面 | @Consume使用本地默认值初始化 | 是 | Pass |
| @Provide和@Consume装饰Map类型 | 设备正常运行 | 点击按钮 | Map整体和API操作变化可观察 | 是 | Pass |
| @Provide和@Consume装饰Set类型 | 设备正常运行 | 点击按钮 | Set整体和API操作变化可观察 | 是 | Pass |
| @Provide和@Consume装饰Date类型 | 设备正常运行 | 点击按钮 | Date整体和API操作变化可观察 | 是 | Pass |
| @Provide和@Consume支持联合类型 | 设备正常运行 | 点击按钮 | string和undefined切换可观察 | 是 | Pass |
| @Provide支持allowOverride参数 | 设备正常运行 | 点击按钮 | reviewVotes值变化可观察 | 是 | Pass |
| @Consume使用本地默认值初始化 | 设备正常运行 | 点击按钮 | 本地默认值变化可观察 | 是 | Pass |