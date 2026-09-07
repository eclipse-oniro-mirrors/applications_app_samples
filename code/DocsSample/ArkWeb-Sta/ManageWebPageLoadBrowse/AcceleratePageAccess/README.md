# 加速Web页面的访问

### 介绍

本工程主要实现了对以下指南文档中 https://docs.openharmony.cn/pages/v5.0/zh-cn/application-dev/web/web-predictor.md 示例代码片段的工程化，主要目标是实现指南中示例代码需要与sample工程文件同源。

本示例主要介绍加速Web页面的访问，可以通过以下方式实现页面加载加速：

1. 通过 [prepareForPageLoad()](https://docs.openharmony.cn/pages/v5.0/zh-cn/application-dev/web/web-predictor.md) 来预解析或者预连接将要加载的页面；
2. 通过 [initializeBrowserEngine()](https://docs.openharmony.cn/pages/v5.0/zh-cn/application-dev/web/web-predictor.md) 来提前初始化内核，然后在初始化内核后调用 prepareForPageLoad() 对即将要加载的页面进行预解析、预连接；
3. 通过 [prefetchPage()](https://docs.openharmony.cn/pages/v5.0/zh-cn/application-dev/web/web-predictor.md) 来预加载即将要加载页面；
4. 通过 [prefetchResource()](https://docs.openharmony.cn/pages/v5.0/zh-cn/application-dev/web/web-predictor.md) 预获取将要加载页面中的post请求；
5. 通过 [precompileJavaScript()](https://docs.openharmony.cn/pages/v5.0/zh-cn/application-dev/web/web-predictor.md) 在页面加载前提前生成脚本文件的编译缓存；
6. 通过 [injectOfflineResources()](https://docs.openharmony.cn/pages/v5.0/zh-cn/application-dev/web/web-predictor.md) 在页面加载前提前将图片、样式表或脚本资源注入到应用的内存缓存中。

### 效果预览

|PrepareForPageLoad_one|PrepareForPageLoad_two|Prefetching|PrefetchingAPOSTRequest_one|
|---|---|---|---|
|![image](./screenshots/PrepareForPageLoad_one_1.png)|![image](./screenshots/PrepareForPageLoad_two_1.png)|![image](./screenshots/Prefetching.png)|![image](./screenshots/PrefetchingAPOSTRequest_one.png)|

|PrefetchingAPOSTRequest_two|PrefetchingAPOSTRequest_three|PrecompForCompCache|InjOffResNoInt|
|---|---|---|---|
|![image](./screenshots/PrefetchingAPOSTRequest_two.png)|![image](./screenshots/PrefetchingAPOSTRequest_three.png)|![image](./screenshots/PrecompForCompCache_1.png)|![image](./screenshots/InjOffResNoInt_1.png)|

使用说明

1. 在Web组件的onAppear中对要加载的页面进行预连接；
2. Ability的onCreate中提前初始化Web内核并对首页进行预连接；
3. 在onPageEnd的时候触发下一个要访问的页面的预加载；
4. 对要加载页面中的post请求进行预获取，在onPageEnd中可以清除预获取的post请求缓存；
5. 在onPageEnd中，触发预获取一个要访问页面的post请求；
6. 在Ability的onCreate中，提前初始化Web内核并预获取首页的post请求；
7. 应用启动时EntryAbility将UIContext存到localstorage，初始化预编译Web组件生成编译缓存，点击加载页面按钮加载业务用Web组件展示business.html页面，此时会使用之前生成的编译缓存；
8. 进入Index.ets页面自动触发aboutToAppear方法，点击加载页面按钮加载业务用Web组件展示business.html页面。

### 工程目录

```
entry/src/main/
|---ets
|---|---entryability
|---|---|---EntryAbility.ets
|---|---pages
|---|---|---Index.ets						// 首页
|---resources								// 静态资源
|---ohosTest
|---|---ets
|---|---|---tests
|---|---|---|---Ability.test.ets            // 自动化测试用例

entry1/src/main/
|---ets
|---|---entryability
|---|---|---EntryAbility.ets
|---|---pages
|---|---|---Index.ets						// 首页
|---resources								// 静态资源
|---ohosTest
|---|---ets
|---|---|---tests
|---|---|---|---Ability.test.ets            // 自动化测试用例

entry2/src/main/
|---ets
|---|---entryability
|---|---|---EntryAbility.ets
|---|---pages
|---|---|---Index.ets						// 首页
|---|---|---Prefetching.ets
|---|---|---PrefetchingAPOSTRequest_one.ets
|---|---|---PrefetchingAPOSTRequest_three.ets
|---|---|---PrefetchingAPOSTRequest_two.ets
|---resources								// 静态资源
|---ohosTest
|---|---ets
|---|---|---tests
|---|---|---|---Ability.test.ets            // 自动化测试用例

entry3/src/main/
|---ets
|---|---entryability
|---|---|---EntryAbility.ets
|---|---pages
|---|---|---BusinessWebview.ets
|---|---|---DynamicComponent.ets
|---|---|---Index.ets						// 首页
|---|---|---PrecompileConfig.ets
|---|---|---Precompile Webview.ets
|---resources								// 静态资源
|---ohosTest
|---|---ets
|---|---|---tests
|---|---|---|---Ability.test.ets            // 自动化测试用例

entry4/src/main/
|---ets
|---|---entryability
|---|---|---EntryAbility.ets
|---|---pages
|---|---|---BusinessWebview.ets
|---|---|---DynamicComponent.ets
|---|---|---Index.ets						// 首页
|---|---|---Inject Webview.ets
|---|---|---Resource.ets
|---resources								// 静态资源
|---ohosTest
|---|---ets
|---|---|---tests
|---|---|---|---Ability.test.ets            // 自动化测试用例
```

### 具体实现

* 加速Web页面的访问
  * 调用prepareForPageLoad接口对目标URL进行预处理。参考源码：[Index.ets](./entry/src/main/ets/pages/Index.ets)
  * 在Web组件的onAppear或onPageEnd生命周期进行预加载，调用prefetchPage对预测的下一个页面URL进行后台预下载，或通过prefetchResource实现请求的预获取。参考源码：[Index.ets](./entry1/src/main/ets/pages/Index.ets)
  * 使用离线的Web组件用于生成字节码缓存，并在适当的时机加载业务用Web组件使用这些字节码缓存。参考源码：[Index.ets](./entry3/src/main/ets/pages/Index.ets)
  * 使用离线的Web组件用于将资源注入到内核的内存缓存中，并在适当的时机加载业务用Web组件使用这些资源。参考源码：[Index.ets](./entry4/src/main/ets/pages/Index.ets)

### 相关权限

[ohos.permission.INTERNET](https://docs.openharmony.cn/pages/v5.0/zh-cn/application-dev/security/AccessToken/permissions-for-all.md#ohospermissioninternet)

### 依赖

不涉及。

### 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：RK3568。
2. 本示例支持API18版本SDK，SDK版本号(API Version 18 Release)。
3. 本示例需要使用DevEco Studio 版本号(5.0.1Release)才可编译运行。

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/ArkWeb-Sta/ManageWebPageLoadBrowse/AcceleratePageAccess/ > .git/info/sparse-checkout
git remote add origin https://gitee.com/openharmony/applications_app_samples.git
git pull origin master
```
