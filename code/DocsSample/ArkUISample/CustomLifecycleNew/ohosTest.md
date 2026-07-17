# CustomLifecycleNew（自定义组件生命周期）测试用例归档

## 用例表

根据提供的测试用例，以下是整理出的测试用例表格：

| 测试功能                              | 预置条件     | 输入                   | 预期输出      | 测试结果 |
|-----------------------------------| ------------ | ---------------------- |-----------| -------- |
| 回收复用场景监听激活状态变化                            | 设备正常运行 | 点击"change"按钮两次 | Child组件被回收和复用，依次触发@ComponentInactive、@ComponentRecycle、@ComponentReuse、@ComponentActive    | Pass     |
| 懒创建场景监听激活状态变化                            | 设备正常运行 | 点击"PageTwo"按钮跳转，切换tab，点击"back"返回 | 页面路由切换时FreezeChild触发@ComponentInactive和@ComponentActive    | Pass     |
| 预加载场景监听激活状态变化                            | 设备正常运行 | 点击"change"按钮创建List，滑动列表 | 预加载区域组件触发@ComponentInactive，进入加载区域触发@ComponentActive    | Pass     |
| 页面可见性变化场景监听激活状态变化                            | 设备正常运行 | 进入页面，息屏后亮屏 | 息屏触发@ComponentInactive，亮屏触发@ComponentActive    | Pass     |
| 自定义组件嵌套使用                            | 设备正常运行 | 点击"delete Parent And Child"按钮两次 | Parent和Child依次触发@ComponentAppear、@ComponentBuilt、@ComponentDisappear    | Pass     |
| 自定义组件回收复用                            | 设备正常运行 | 点击"recycle child"/"reuse child"按钮两次 | Child和GrandChild依次触发@ComponentInit、@ComponentAppear、@ComponentBuilt、@ComponentRecycle、@ComponentReuse    | Pass     |
| 自定义组件生命周期的注册监听                            | 设备正常运行 | 点击"recycle child"/"reuse child"按钮两次 | MyObserver依次触发aboutToAppear、onDidBuild、aboutToRecycle、aboutToReuse    | Pass     |
| ComponentAppear/Disappear与aboutToAppear/Disappear区别                            | 设备正常运行 | 点击"start"按钮两次 | Swiper缓存节点触发aboutToAppear，非缓存节点销毁前强制触发aboutToAppear，myDisappear不会误触发myAppear    | Pass     |
| ComponentReuse/Recycle与aboutToReuse/Recycle区别                            | 设备正常运行 | 点击"change flag 1"和"change flag 2"按钮 | ReusableComp3的aboutToReuse被误调用，但@ComponentReuse受状态机约束不被误调用    | Pass     |
