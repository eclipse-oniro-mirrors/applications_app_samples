# V1自定义组件冻结测试用例归档

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---------|---------|------|---------|:-------:|:-------:|
| 页面路由冻结 | 设备正常运行 | 点击go to next page | 跳转到Page2 | 是 | Pass |
| TabContent冻结 | 设备正常运行 | 点击change message | 当前TabContent的@Watch被触发 | 是 | Pass |
| LazyForEach冻结 | 设备正常运行 | 点击change message | 当前显示的ListItem的@Watch被触发 | 是 | Pass |
| Navigation冻结 | 设备正常运行 | 点击change message | 当前NavDestination的@Watch被触发 | 是 | Pass |
| 组件复用冻结 | 设备正常运行 | 点击change desc | 可视区域内的@Watch被触发 | 是 | Pass |
| Navigation+TabContent混用 | 设备正常运行 | 点击Next Page | 跳转到pageOne | 是 | Pass |
