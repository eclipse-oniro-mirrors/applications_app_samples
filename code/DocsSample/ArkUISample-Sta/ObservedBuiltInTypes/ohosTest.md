# ObservedArray/ObservedMap/ObservedSet/ObservedDate测试用例归档
  	 
## 用例表

根据提供的测试用例，以下是整理出的测试用例表格：

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---------|---------|------|---------|:-------:|:-------:|
| 使用ObservedArray | 设备正常运行 | 点击按钮 | push、reverse操作触发UI刷新 | 是 | Pass |
| 使用ObservedMap | 设备正常运行 | 点击按钮 | set、delete操作触发UI刷新 | 是 | Pass |
| 使用ObservedSet | 设备正常运行 | 点击按钮 | add、delete操作触发UI刷新 | 是 | Pass |
| 使用ObservedDate | 设备正常运行 | 点击按钮 | setFullYear、setMonth操作触发UI刷新 | 是 | Pass |
| 与UIUtils.makeObserved的关系 | 设备正常运行 | 点击按钮 | 对比三种方式的观察效果 | 是 | Pass |
| 常见问题1 | 设备正常运行 | 点击按钮 | 元素属性修改不触发UI刷新 | 是 | Pass |
| 常见问题2 | 设备正常运行 | 点击按钮 | 对比三种继承方式的观察效果 | 是 | Pass |
