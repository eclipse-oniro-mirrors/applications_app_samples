# 自定义组件异步加载示例

### 介绍

本示例通过使用[ArkUI指南文档](https://gitcode.com/openharmony/docs/tree/master/zh-cn/application-dev/ui)中自定义组件异步加载各场景的开发示例，展示enableAsyncLoad的使用方法，帮助开发者更好地理解自定义组件异步加载并合理使用。

自定义组件异步加载将组件实际内容的构建从首帧推迟到之后的空闲时段执行，页面其余部分正常渲染，转场更流畅；加载完成前可显示占位组件，超时未完成时由框架强制加载兜底。

### 示例文档

[自定义组件异步加载](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/ui/state-management/arkts-custom-component-async-load.md)。

### 使用说明

1. 在主界面，点击AsyncLoadBasic进入基础用法页面：页面转场时构建耗时较长的组件不阻塞首帧，实际内容在后续空闲时段构建呈现。

2. 点击AsyncLoadPlaceholder进入占位组件页面：异步加载期间显示已注册的占位组件，加载完成后自动替换为实际内容。

3. 点击AsyncLoadTimeout进入超时策略页面：演示超时阈值三档语义（正数到期强制加载、0不等待、负数永不超时），可在AsyncLoadTimeout.ets中切换注释体验。

### 工程目录

```
entry/src/main/ets/
|---entryability
|---entrybackupability
|---pages
|   |---AsyncLoadBasic.ets        // 基础用法：启用异步加载
|   |---AsyncLoadPlaceholder.ets  // 配置占位组件
|   |---AsyncLoadTimeout.ets      // 超时策略选择
```

### 具体实现

1、在@ComponentInit装饰的函数内调用UIUtils.getCustomComponentContext(this).enableAsyncLoad()启用异步加载，源码参考：entry/src/main/ets/pages/AsyncLoadBasic.ets。

2、通过CustomComponentAsyncLoadOptions配置占位组件（placeholder）与超时阈值（timeout），占位模板经getPlaceholderRegister()注册，须为全局无参@Builder({ isPlaceholder: true })函数，源码参考：entry/src/main/ets/pages/AsyncLoadPlaceholder.ets、entry/src/main/ets/pages/AsyncLoadTimeout.ets。

### 相关权限

不涉及。

### 依赖

不涉及。

### 约束与限制

1.本示例仅支持标准系统上运行，支持设备：RK3568。

2.本示例为Stage模型，支持API 26.1版本SDK，版本号：26.1.0。

3.本示例需要使用DevEco Studio 5.0.5.300及以上版本才可编译运行。

### 下载

如需单独下载本工程，执行如下命令：

````
git init
git config core.sparsecheckout true
echo code/DocsSample/ArkUISample/AsyncLoad/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
````
