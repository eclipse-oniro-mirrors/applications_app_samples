# @Provide装饰器和@Consume装饰器：与后代组件双向同步

## 介绍

本工程帮助开发者更好地理解@Provide和@Consume装饰器的使用场景。该工程中展示的代码详细描述可查如下链接：

[@Provide装饰器和@Consume装饰器：与后代组件双向同步](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui/state-management-static/arkts-static-provide-and-consume.md)

## 使用说明

执行测试用例会先打开相应界面，然后点击按钮或图标，演示接口的使用效果。

## 效果预览

|首页                                   |
|----------------------------------------------|
|![provideconsume](./screenshots/provideconsume.png)|

## 工程目录
```
entry/src/
├── main
│   ├── ets
│   │   ├── entryability
│   │   ├── pages
│   │   │   ├── Index.ets
│   │   │   ├── ProvideConsumeInterface.ets
│   │   │   ├── ProvideConsumeBasic.ets
│   │   │   ├── ConsumeNoExternalInit.ets
│   │   │   ├── ConsumeDefaultValueExample.ets
│   │   │   ├── ProvideConsumeMap.ets
│   │   │   ├── ProvideConsumeSet.ets
│   │   │   ├── ProvideConsumeDate.ets
│   │   │   ├── ProvideConsumeUnion.ets
│   │   │   ├── ProvideAllowOverride.ets
│   │   │   └── ConsumeDefaultValue.ets
│   └── resources
│       ├── ...
├─── ... 
```

## 具体实现

1. @Provide和@Consume装饰interface字面量：可以观察到字面量整体以及属性的变化。

2. @Provide和@Consume基本使用：通过相同的变量名或别名绑定变量，实现祖先与后代组件的双向同步。

3. @Consume禁止外部传入初始化：@Consume装饰的变量禁止外部传入初始化，只能通过别名匹配对应的@Provide变量。

4. @Consume设置默认值示例：当没有对应的@Provide变量时，给@Consume装饰的变量设置本地默认值。

5. @Provide和@Consume装饰Map类型：可以观察到Map整体赋值以及通过API操作带来的变化。

6. @Provide和@Consume装饰Set类型：可以观察到Set整体赋值以及通过API操作带来的变化。

7. @Provide和@Consume装饰Date类型：可以观察到Date整体赋值以及通过API操作带来的变化。

8. @Provide和@Consume支持联合类型：支持null、undefined以及联合类型。

9. @Provide支持allowOverride参数：允许在同一组件树下通过allowOverride重写同名的@Provide。

10. @Consume使用本地默认值初始化：当找不到匹配的@Provide变量时，使用本地默认值初始化。

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
echo code/DocsSample/ArkUISample-Sta/ProvideConsume/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```