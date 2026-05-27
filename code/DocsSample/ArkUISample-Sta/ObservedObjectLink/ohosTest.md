# @ObjectLink装饰器和@Observed装饰器测试用例归档
  	 
## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---------|---------|------|---------|:-------:|:-------:|
| @ObjectLink字面量this.xxx特例 | 设备正常运行 | 查看页面 | 字面量this.xxx结构正常编译通过 | 是 | Pass |
| @ObjectLink只读示例 | 设备正常运行 | 点击按钮 | 成员属性变化可观察，整体替换在父组件 | 是 | Pass |
| @ObjectLink对象类型示例 | 设备正常运行 | 点击按钮 | Book类属性变化可观察 | 是 | Pass |
| @ObjectLink继承对象示例 | 设备正常运行 | 点击按钮 | 继承类属性变化可观察 | 是 | Pass |
| @ObjectLink嵌套对象示例 | 设备正常运行 | 点击按钮 | 嵌套类属性变化可观察 | 是 | Pass |
| @ObjectLink使用makeObserved示例 | 设备正常运行 | 点击按钮 | makeObserved深度观察生效 | 是 | Pass |
| @ObjectLink对象数组示例 | 设备正常运行 | 点击按钮 | 数组项属性变化可观察 | 是 | Pass |
| @ObjectLink序列化无参构造 | 设备正常运行 | 点击按钮 | 序列化和反序列化正确运行 | 是 | Pass |
| @ObjectLink序列化有参构造 | 设备正常运行 | 点击按钮 | 自定义反序列化方法正确运行 | 是 | Pass |
| @ObjectLink支持联合类型 | 设备正常运行 | 点击按钮 | Source/Data/undefined切换可观察 | 是 | Pass |