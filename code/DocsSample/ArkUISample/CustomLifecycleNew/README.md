# CustomLifecycleNew（自定义组件生命周期）

### 介绍

本示例通过使用[自定义组件生命周期（推荐）](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/ui/state-management/arkts-custom-components-new-lifecycle.md)中各场景开发实例，主要展示了新增自定义组件生命周期装饰器（@ComponentInit、@ComponentAppear、@ComponentBuilt、@ComponentDisappear、@ComponentReuse、@ComponentRecycle、@ComponentActive、@ComponentInactive）的使用方法和多种常见的使用场景，便于开发者学习与理解。

自定义组件生命周期回调函数受状态机限制，生命周期回调函数调用时机符合预期。@ComponentActive和@ComponentInactive用于监听组件激活状态变化，支持组件回收复用、懒创建、预加载和页面可见性变化等场景。

### 工程目录

```
entry/src/main/ets/
|---entryability
|---entrybackupability
|---pages
|   |---Index.ets                                         // 主页
|   |---ComponentActiveRecycle.ets                        // 回收复用场景监听激活状态变化
|   |---ComponentActivePageVisible.ets                    // 页面可见性变化场景监听激活状态变化
|   |---ComponentNesting.ets                              // 自定义组件嵌套使用
|   |---ComponentRecycleReuse.ets                         // 自定义组件回收复用
|   |---ComponentLifecycleObserver.ets                    // 自定义组件生命周期的注册监听
|   |---ComponentReuseDifference.ets                      // ComponentReuse/Recycle与aboutToReuse/Recycle区别
|   |---ComponentActiveLazyCreate.ets                     // 懒创建场景监听激活状态变化（Navigation）
|   |---PageOne.ets                                       // 懒创建场景PageOne页面
|   |---PageTwo.ets                                       // 懒创建场景PageTwo页面
|   |---ComponentActivePreRender.ets                      // 预加载场景监听激活状态变化（LazyForEach）
|   |---BasicDataSource.ets                               // 预加载场景数据源
|   |---LifecycleDifference.ets                           // ComponentAppear/Disappear与aboutToAppear/Disappear区别
|   |---SwiperPage.ets                                    // 区别场景SwiperPage页面
```

### 具体实现

* 回收复用场景监听激活状态变化，展示组件回收复用场景下激活和非激活生命周期回调触发情况，源码参考[ComponentActiveRecycle.ets](./entry/src/main/ets/pages/ComponentActiveRecycle.ets)；
  * 使用@Reusable装饰Child组件，使其具备复用能力；
  * 通过@ComponentActive、@ComponentInactive、@ComponentReuse、@ComponentRecycle监听组件状态变化；
  * 进入复用池的组件转变为非激活态，从复用池中重新添加到节点树时转变为激活态；
* 懒创建场景监听激活状态变化，展示Navigation和Tabs场景中激活/非激活生命周期触发时机，源码参考[ComponentActiveLazyCreate.ets](./entry/src/main/ets/pages/ComponentActiveLazyCreate.ets)；
  * 使用Navigation路由跳转PageOne和PageTwo页面；
  * FreezeChild配置freezeWhenInactive: true，切换tab时触发@ComponentActive和@ComponentInactive；
* 预加载场景监听激活状态变化，展示List和LazyForEach场景下的组件激活/非激活状态变化，源码参考[ComponentActivePreRender.ets](./entry/src/main/ets/pages/ComponentActivePreRender.ets)；
  * 使用LazyForEach和cachedCount设置预加载区域；
  * 进入预加载区域的组件创建完毕转变为非激活态，触发@ComponentInactive；
* 页面可见性变化场景监听激活状态变化，展示页面息屏/亮屏时组件激活状态变化，源码参考[ComponentActivePageVisible.ets](./entry/src/main/ets/pages/ComponentActivePageVisible.ets)；
  * 息屏时组件触发@ComponentInactive，亮屏时触发@ComponentActive；
* 自定义组件嵌套使用，展示自定义组件在嵌套使用时生命周期的调用时序，源码参考[ComponentNesting.ets](./entry/src/main/ets/pages/ComponentNesting.ets)；
  * 使用@ComponentAppear、@ComponentBuilt、@ComponentDisappear装饰器；
  * 体现自定义组件懒展开特性，Parent执行完myBuilt后才会执行Child的myAppear；
* 自定义组件回收复用，展示回收复用的生命周期调用时序，源码参考[ComponentRecycleReuse.ets](./entry/src/main/ets/pages/ComponentRecycleReuse.ets)；
  * 使用@ComponentInit、@ComponentAppear、@ComponentBuilt、@ComponentRecycle、@ComponentReuse、@ComponentDisappear装饰器；
  * 演示Child和GrandChild的回收复用流程；
* 自定义组件生命周期的注册监听，展示通过CustomComponentLifecycleObserver监听生命周期，源码参考[ComponentLifecycleObserver.ets](./entry/src/main/ets/pages/ComponentLifecycleObserver.ets)；
  * 使用UIUtils.getLifecycle(this)获取生命周期对象并注册Observer；
  * 在@ComponentInit中注册监听，在@ComponentDisappear中解除注册监听；
* ComponentAppear/Disappear与aboutToAppear/Disappear区别，展示状态机约束下@ComponentDisappear不会误调用@ComponentAppear，源码参考[LifecycleDifference.ets](./entry/src/main/ets/pages/LifecycleDifference.ets)；
  * 通过Swiper缓存节点演示aboutToDisappear会强制触发aboutToAppear，但myDisappear不会误触发myAppear；
* ComponentReuse/Recycle与aboutToReuse/Recycle区别，展示状态机约束下@ComponentReuse不会被误调用，源码参考[ComponentReuseDifference.ets](./entry/src/main/ets/pages/ComponentReuseDifference.ets)；
  * 演示ReusableComp3从未创建时aboutToReuse被误调用，但@ComponentReuse受状态机约束不被误调用；

### 相关权限

无。

### 依赖

无。

### 约束与限制

1. 本示例仅支持标准系统上运行，支持设备如：RK3568；
2. 本示例为Stage模型，仅支持API23及以上版本SDK；
3. @ComponentActive和@ComponentInactive自API版本26.0.0起可用；
4. 新增生命周期装饰器只能在@Component或@ComponentV2装饰的struct中使用；
5. 回收复用场景需使用@Reusable或@ReusableV2装饰复用组件；

### 下载

如需单独下载本工程，在本地目录使用git执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/ArkUISample/CustomLifecycleNew > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
