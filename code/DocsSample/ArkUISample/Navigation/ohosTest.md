# Navigation 测试用例归档

## 用例表

| 测试功能            | 预置条件       | 输入                    | 预期输出                                                     | 是否自动 | 测试结果 |
| ------------------- | -------------- | ----------------------- | ------------------------------------------------------------ | :------- | -------- |
| Navigation示例代码验证    | 设备正常运行   | 进入各个示例页面，push页面然后返回           | 页面跳转、动画、布局均正常 | 是       | Pass     |
| NavDestination示例代码验证    | 设备正常运行 | 进入各个示例页面，push页面然后返回            | 页面跳转、动画、布局均正常    | 是       | Pass     |
| NavPathStack派生类示例代码验证    | 设备正常运行 | 进入各个示例页面，push页面然后查询页面栈        | 页面栈内容和实际效果一致 | 是       | Pass     |
| 无感监听示例代码验证    | 设备正常运行   | 点击页面跳转按钮            | 页面跳转正常 | 是       | Pass     |
| SideBarContainer示例代码验证    | 设备正常运行 | 进入各个示例页面，点击不同的索引            | 页面切换正常    | 是       | Pass     |
| Stepper派生类示例代码验证    | 设备正常运行 | 点击status，然后再点击下一页    | 页面切换正常 | 是       | Pass     |