# 自定义组件异步加载（ArkTS-Sta）

## 介绍

本工程帮助开发者更好地理解自定义组件异步加载的使用场景。该工程中展示的代码详细描述可查如下链接：

[自定义组件异步加载（ArkTS-Sta）](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui/state-management-static/arkts-static-custom-component-async-load.md)

## 使用说明

执行测试用例会先打开相应界面，演示各场景的使用效果。

## 工程目录
```
entry/src/
|---main
|   |---ets
|   |   |---pages
|   |   |   |---AsyncLoadBasic.ets        // 基础用法：启用异步加载
|   |   |   |---AsyncLoadPlaceholder.ets  // 配置占位组件
|   |   |   |---AsyncLoadTimeout.ets      // 超时策略选择
```

## 具体实现

- 在@ComponentInit装饰的函数内调用UIUtils.getCustomComponentContext(this).enableAsyncLoad()启用异步加载（仅静态范式ArkTS-Sta）。
- 通过CustomComponentAsyncLoadOptions配置占位组件（placeholder）与超时阈值（timeout，整数）。
