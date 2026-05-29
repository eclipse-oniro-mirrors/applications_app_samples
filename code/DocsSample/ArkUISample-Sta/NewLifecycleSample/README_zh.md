# 自定义组件生命周期

## 介绍

本工程帮助开发者更好地理解自定义组件生命周期的使用场景。该工程中展示的代码详细描述可查如下链接：

[自定义组件生命周期](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui/state-management-static/arkts-static-custom-components-new-lifecycle.md)

## 使用说明

执行测试用例会先打开相应界面，然后点击按钮或图标，演示接口的使用效果。

## 工程目录
```
entry/src/
├── main
│   ├── ets
│   │   ├── entryability
│   │   ├── pages
│   │   │   ├── Index.ets
│   │   │   ├── LifecycleNest.ets
│   │   │   ├── LifecycleReuse.ets
│   │   │   ├── LifecycleObserver.ets
│   │   │   ├── LifecycleActiveInactive.ets
│   │   │   ├── LifecycleSwiper.ets
│   │   │   ├── LifecycleReuseDiff.ets
│   │   │   └── SwiperPage.ets
│   └── resources
│       ├── ...
├─── ...
```

## 具体实现

1. 自定义组件嵌套使用：展示Index、Parent、Child嵌套组件的@ComponentAppear、@ComponentBuilt、@ComponentDisappear生命周期调用时序。

2. 自定义组件回收复用：展示@Reusable组件的@ComponentInit、@ComponentAppear、@ComponentBuilt、@ComponentDisappear、@ComponentReuse、@ComponentRecycle完整生命周期。

3. 自定义组件生命周期注册监听：展示CustomComponentLifecycleObserver的使用，在@ComponentInit中注册监听，在@ComponentDisappear中取消注册。

4. 监听自定义组件激活与非激活状态：展示@ComponentActive和@ComponentInactive装饰器在Navigation和Tabs混用场景下的触发时机。

5. ComponentAppear与aboutToAppear区别：通过Swiper缓存场景展示myDisappear不会误触发myAppear。

6. ComponentReuse与aboutToReuse区别：展示myReuse受状态机约束不会被误调用。

## 相关权限

不涉及。

## 依赖

不涉及。

## 约束与限制

1.本示例已适配API version 23及以上版本SDK。

## 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/ArkUISample-Sta/NewLifecycleSample/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
