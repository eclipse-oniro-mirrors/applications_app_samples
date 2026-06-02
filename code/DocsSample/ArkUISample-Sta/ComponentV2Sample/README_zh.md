# @ComponentV2装饰器：自定义组件

## 介绍

本工程帮助开发者更好地理解@ComponentV2装饰器的使用场景。该工程中展示的代码详细描述可查如下链接：

[@ComponentV2装饰器：自定义组件](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui/state-management-static/arkts-static-componentv2.md)

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
│   │   │   ├── ComponentV2Basic.ets
│   │   │   └── ComponentV2Extend.ets
│   └── resources
│       ├── ...
├─── ...
```

## 具体实现

1. @ComponentV2基本用法：展示@ComponentV2装饰器的基本结构，配合@Local装饰器使用。

2. 支持自定义组件扩展：展示在@ComponentV2自定义组件中重写通用属性方法，使用super关键字调用基类方法，配合@Provider/@Consumer实现跨层级数据传递。

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
echo code/DocsSample/ArkUISample-Sta/ComponentV2Sample/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
