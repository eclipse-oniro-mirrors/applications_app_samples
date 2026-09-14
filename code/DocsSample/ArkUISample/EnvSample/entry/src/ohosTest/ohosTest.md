| 测试功能                           | 预置条件     | 输入               | 预期输出                                                     | 测试结果 |
|--------------------------------| ------------ | ------------------|----------------------------------------------------------| -------- |
| 首页加载测试                         | 设备正常运行 | 验证基础元素渲染    | 检查列表组件                                                   | Pass     |
| @Env初始化流程示例                    | 设备正常运行 | 点击"envInitFlow" | 跳转成功且页面展示Index/Child1/Child2/GrandChild1/GrandChild2的breakpoint信息 | Pass     |
| 在@ComponentV2中使用@Env            | 设备正常运行 | 点击"envInComponentV2" | 跳转成功且可通过Landscape/Portrait切换横竖屏，并通过addMonitor监听breakpoint属性变化 | Pass     |
| 在@Component中使用@Env             | 设备正常运行 | 点击"envInComponent" | 跳转成功且用法与@ComponentV2类似                                  | Pass     |
| 通过BuilderNode切换窗口              | 设备正常运行 | 点击"envBuilderNode" | 跳转成功且可通过BuilderNode切换窗口触发@Env重新获取环境变量并刷新关联组件            | Pass     |
| 通过lambda闭包传递@Env触发刷新        | 设备正常运行 | 点击"envBuilderLambda" | 跳转成功且通过lambda闭包将@Env向下传递，切窗时触发Comp内组件刷新（对比上例常规变量不刷新） | Pass     |
| @Watch监听@Env装饰的变量             | 设备正常运行 | 点击"envWatch" | 跳转成功且通过WithEnv设置FONT_SCALE并触发子组件@Watch监听回调            | Pass     |
| @Monitor监听@Env装饰的变量           | 设备正常运行 | 点击"envMonitor" | 跳转成功且通过WithEnv设置FONT_SCALE并触发子组件@Monitor监听回调         | Pass     |
