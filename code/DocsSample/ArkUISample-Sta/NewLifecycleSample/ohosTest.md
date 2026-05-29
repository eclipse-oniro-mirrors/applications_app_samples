# 自定义组件生命周期测试用例归档

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---------|---------|------|---------|:-------:|:-------:|
| 自定义组件嵌套使用 | 设备正常运行 | 点击delete按钮 | Parent和Child组件创建/删除，生命周期日志输出 | 是 | Pass |
| 自定义组件回收复用 | 设备正常运行 | 点击Hello按钮两次 | Child组件回收复用，Init/Appear/Built/Recycle/Reuse日志输出 | 是 | Pass |
| 自定义组件生命周期注册监听 | 设备正常运行 | 点击Hello按钮两次 | Observer监听aboutToAppear/onDidBuild/aboutToRecycle/aboutToReuse | 是 | Pass |
| 监听自定义组件激活与非激活状态 | 设备正常运行 | 进入页面操作Navigation和Tabs | ParamComponent和DelayComponent触发Active/Inactive | 是 | Pass |
| ComponentAppear与aboutToAppear区别 | 设备正常运行 | 点击start按钮 | Swiper缓存节点正常触发，非缓存节点myDisappear不误触发myAppear | 是 | Pass |
| ComponentReuse与aboutToReuse区别 | 设备正常运行 | 点击a和b按钮 | ReusableComp3的myReuse受状态机约束不被误调用 | 是 | Pass |
