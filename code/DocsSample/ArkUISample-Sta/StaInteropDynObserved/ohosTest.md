# @Observed跨模式调用测试用例归档

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---------|---------|------|---------|:-------:|:-------:|
| @Observed装饰的类示例 | 设备正常运行 | 点击按钮Member Assignment | name属性值更新，UI刷新 | 否 | Pass |
| @Observed装饰的类示例 | 设备正常运行 | 点击按钮Overall Assignment | 整体对象替换后UI刷新 | 否 | Pass |
| @ObjectLink示例 | 设备正常运行 | 点击按钮Member Assignment | objectLink的name属性值更新，UI刷新 | 否 | Pass |
| Map类型示例 | 设备正常运行 | 点击按钮map member | map成员属性更新，UI刷新 | 否 | Pass |
| Map类型示例 | 设备正常运行 | 点击按钮map whole | 整体替换map对象后UI刷新 | 否 | Pass |
| Map类型示例 | 设备正常运行 | 点击按钮clear | map清空，UI刷新 | 否 | Pass |
| Set类型示例 | 设备正常运行 | 点击按钮set member | set成员属性更新，UI刷新 | 否 | Pass |
| Set类型示例 | 设备正常运行 | 点击按钮set whole | 整体替换set对象后UI刷新 | 否 | Pass |
| Set类型示例 | 设备正常运行 | 点击按钮clear | set清空，UI刷新 | 否 | Pass |
