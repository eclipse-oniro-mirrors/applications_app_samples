# @Provider和@Consumer装饰器测试用例归档
  	 
## 用例表

根据提供的测试用例，以下是整理出的测试用例表格：

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---------|---------|------|---------|:-------:|:-------:|
| @Provider和@Consumer双向同步 | 设备正常运行 | 点击按钮 | str值双向同步变化 | 是 | Pass |
| @Provider和@Consumer未建立双向绑定 | 设备正常运行 | 点击按钮 | str1和str各自独立变化 | 是 | Pass |
| 装饰字面量类型变量 | 设备正常运行 | 点击按钮 | 字面量整体变化可观察，属性变化不可观察 | 是 | Pass |
| 装饰数组类型变量 | 设备正常运行 | 点击按钮 | 数组整体和数组项变化可观察 | 是 | Pass |
| 装饰Date类型变量 | 设备正常运行 | 点击按钮 | Date整体和API操作变化可观察 | 是 | Pass |
| 装饰Map类型变量 | 设备正常运行 | 点击按钮 | Map整体和API操作变化可观察 | 是 | Pass |
| 装饰Set类型变量 | 设备正常运行 | 点击按钮 | Set整体和API操作变化可观察 | 是 | Pass |
| @Provider和@Consumer装饰箭头函数 | 设备正常运行 | 点击按钮 | 箭头函数跨组件调用成功 | 是 | Pass |
| @Provider和@Consumer装饰复杂类型 | 设备正常运行 | 点击按钮 | 配合@Trace观察复杂类型属性变化 | 是 | Pass |
| @Consumer向上查找最近的@Provider | 设备正常运行 | 进入页面 | @Consumer查找最近的@Provider数据 | 是 | Pass |
| @Provider和@Consumer初始化@Param | 设备正常运行 | 点击按钮 | @Consumer变化同步给@Param | 是 | Pass |