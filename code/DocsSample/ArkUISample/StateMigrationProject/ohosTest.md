# 组件内状态变量迁移指导 测试用例归档

## 用例表

| 测试功能                          | 预置条件       | 输入                   | 预期输出    | 是否自动 | 测试结果 |
|-------------------------------| -------------- |----------------------|---------|:-----| -------- |
| 测试V1装饰器@State是否成功             | 设备正常运行   | 进入各个示例页面，push页面，然后返回 | 页面跳转正常  | 是    | Pass     |
| 测试V2装饰器@Local是否成功             | 设备正常运行 | 进入各个示例页面，push页面，然后返回 | 页面跳转正常  | 是    | Pass     |
| 测试V2装饰器@ObservedV2和@Trace是否成功 | 设备正常运行 | 进入各个示例页面，push页面，然后返回 | 页面跳转正常  | 是    | Pass     |
| 测试V2装饰器@Param和@Once是否成功       | 设备正常运行   | 进入各个示例页面，push页面，然后返回 | 页面跳转正常  | 是    | Pass     |
| 测试V1装饰器@Link是否成功              | 设备正常运行 | 进入各个示例页面，push页面，然后返回 | 页面跳转正常  | 是    | Pass     |
| 测试V2装饰器@Param和@Event是否成功      | 设备正常运行   | 进入各个示例页面，push页面，然后返回 | 页面跳转正常  | 是    | Pass     |
| 测试V1装饰器@Prop是否成功              | 设备正常运行 | 进入各个示例页面，push页面，然后返回 | 页面跳转正常  | 是    | Pass     |
| 测试V2装饰器@Param是否成功             | 设备正常运行 | 进入各个示例页面，push页面，然后返回 | 页面跳转正常  | 是    | Pass     |
| 测试V1装饰器@Provide和@Consume是否成功  | 设备正常运行 | 进入各个示例页面，push页面，然后返回 | 页面跳转正常  | 是    | Pass     |
| 测试V2装饰器@Provider和@Consumer是否成功 | 设备正常运行 | 进入各个示例页面，push页面，然后返回 | 页面跳转正常  | 是    | Pass     |
| 测试V1装饰器@Watch是否成功             | 设备正常运行 | 进入各个示例页面，push页面，然后返回 | 页面跳转正常  | 是    | Pass     |
| 测试V2装饰器@Monitor是否成功           | 设备正常运行 | 进入各个示例页面，push页面，然后返回 | 页面跳转正常  | 是    | Pass     |
| 测试V2装饰器@Computed是否成功          | 设备正常运行 | 进入各个示例页面，push页面，然后返回 | 页面跳转正常  | 是    | Pass     |
| 测试if使用场景下@ReusableV2复用组件 | 设备正常运行 | 进入ReusableIfScene页面，点击Hello按钮切换显隐 | 复用组件正常显示与隐藏 | 是 | Pass |
| 测试列表滚动Repeat使用场景下@ReusableV2复用组件 | 设备正常运行 | 进入ReusableRepeatScene页面，滑动列表 | 列表项正常显示，滑动复用正常 | 是 | Pass |
| 测试列表滚动if使用场景下@ReusableV2复用组件 | 设备正常运行 | 进入ReusableListIfScene页面，滑动列表 | 列表项正常显示，滑动复用正常 | 是 | Pass |
| 测试Repeat全量加载使用场景下@ReusableV2复用组件 | 设备正常运行 | 进入ReusableRepeatAllLoadScene页面，点击update生成数据，点击列表项展开，点击clear清空 | 列表项正常创建、展开、复用与清空 | 是 | Pass |
| 测试Grid使用场景下@ReusableV2复用组件 | 设备正常运行 | 进入ReusableGridScene页面，滑动网格 | 网格项正常显示，滑动复用正常 | 是 | Pass |
| 测试WaterFlow使用场景下@ReusableV2复用组件 | 设备正常运行 | 进入ReusableWaterFlowScene页面，滑动瀑布流，点击back top | 瀑布流项正常显示，滑动复用正常，回到顶部 | 是 | Pass |
| 测试Swiper使用场景下@ReusableV2复用组件 | 设备正常运行 | 进入ReusableSwiperScene页面，滑动轮播 | 轮播项正常显示，滑动复用正常 | 是 | Pass |
| 测试ListItemGroup使用场景下@ReusableV2复用组件 | 设备正常运行 | 进入ReusableListItemGroupScene页面，滑动分组列表 | 分组列表项正常显示，滑动复用正常 | 是 | Pass |
| 测试多种条目类型有限变化型@ReusableV2复用组件 | 设备正常运行 | 进入ReusableLimitTypeScene页面，滑动列表 | 奇偶项分别渲染不同样式，滑动复用正常 | 是 | Pass |
| 测试多种条目类型组合型@ReusableV2复用组件 | 设备正常运行 | 进入ReusableGroupTypeScene页面，滑动列表 | 组合型子组件正常显示，滑动复用正常 | 是 | Pass |

