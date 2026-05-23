# @Computed装饰器测试用例归档
  	 
## 用例表

根据提供的测试用例，以下是整理出的测试用例表格：

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---------|---------|------|---------|:-------:|:-------:|
| 在自定义组件中使用计算属性 | 设备正常运行 | 点击按钮 | fullName只计算一次，两个Text显示相同 | 是 | Pass |
| 在@ObservedV2类中使用计算属性 | 设备正常运行 | 点击按钮 | fullName只计算一次，两个Text显示相同 | 是 | Pass |
| @Computed属性被@Monitor监听 | 设备正常运行 | 点击+/-按钮 | celsius变化触发fahrenheit和kelvin重新计算，onKelvinMonitor被调用 | 是 | Pass |
| @Computed属性初始化@Param | 设备正常运行 | 点击+/-按钮 | 改变商品数量，total和qualifiesForDiscount重新计算，子组件Text刷新 | 是 | Pass |