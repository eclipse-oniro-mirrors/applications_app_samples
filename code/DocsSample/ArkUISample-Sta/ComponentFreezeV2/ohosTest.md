# V2自定义组件冻结测试用例归档

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---------|---------|------|---------|:-------:|:-------:|
| 页面路由冻结-Page1 | 设备正常运行 | 点击按钮 | 修改bookName触发@Monitor | 是 | Pass |
| 页面路由冻结-Page2 | 设备正常运行 | 点击按钮 | 返回Page1后触发@Monitor | 是 | Pass |
| TabContent冻结 | 设备正常运行 | 点击按钮 | 当前激活TabContent的@Monitor触发 | 是 | Pass |
| Navigation冻结 | 设备正常运行 | 点击按钮 | 当前激活NavDestination的@Monitor触发 | 是 | Pass |
| Navigation和TabContent混用冻结 | 设备正常运行 | 点击按钮 | 仅解冻可见TabContent的@Monitor触发 | 是 | Pass |
