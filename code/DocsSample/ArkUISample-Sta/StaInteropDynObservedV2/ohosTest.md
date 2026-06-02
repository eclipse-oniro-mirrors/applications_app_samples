# @ObservedV2跨模式调用测试用例归档

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---------|---------|------|---------|:-------:|:-------:|
| @ObservedV2基础用法示例 | 设备正常运行 | 点击按钮add age | age数值加1，UI刷新 | 否 | Pass |
| 嵌套类场景示例 | 设备正常运行 | 点击按钮change length | 嵌套属性length增加100，UI刷新 | 否 | Pass |
| 继承类场景示例 | 设备正常运行 | 点击按钮change Son age | Son的age数值加1，UI刷新 | 否 | Pass |
| 继承类场景示例 | 设备正常运行 | 点击按钮change Cousin age | Cousin的age数值加1，UI刷新 | 否 | Pass |
