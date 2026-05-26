# @CanBeObserved装饰器测试用例归档
  	 
## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---------|---------|------|---------|:-------:|:-------:|
| 被@Observed装饰的类 | 设备正常运行 | 点击按钮 | @CanBeObserved返回true | 是 | Pass |
| 被@Trace装饰的属性 | 设备正常运行 | 点击按钮 | @CanBeObserved返回true | 是 | Pass |
| 被@ObservedV2装饰的类 | 设备正常运行 | 点击按钮 | @CanBeObserved返回true | 是 | Pass |
| 对象字面量 | 设备正常运行 | 点击按钮 | @CanBeObserved返回false | 是 | Pass |
| 内置类型 | 设备正常运行 | 点击按钮 | Array、Map、Set、Date返回true | 是 | Pass |
| 不能触发UI刷新的情况 | 设备正常运行 | 点击按钮 | @CanBeObserved返回true但UI不刷新 | 是 | Pass |
| 被@Observed装饰后的嵌套属性 | 设备正常运行 | 点击按钮 | 嵌套属性可观察判断 | 是 | Pass |