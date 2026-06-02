# 状态管理V1V2混用指导

## 介绍

本工程帮助开发者更好地理解状态管理V1V2混用的使用场景。该工程中展示的代码详细描述可查如下链接：

[状态管理V1V2混用指导（ArkTS-Sta）](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui/state-management-static/arkts-static-v1-v2-mixusage.md)

## 使用说明

执行测试用例会先打开相应界面，然后点击按钮或图标，演示接口的使用效果。

## 工程目录

```
entry/src/
├── main
│   ├── ets
│   │   ├── entryability
│   │   │   └── EntryAbility.ets
│   │   └── pages
│   │       ├── Index.ets
│   │       ├── MixCommonV1ToV2.ets
│   │       ├── MixCommonV2ToV1.ets
│   │       ├── MixObservedV1ToV2.ets
│   │       ├── MixObservedV2ToV1.ets
│   │       ├── MixArrayV1ToV2.ets
│   │       ├── MixArrayV2ToV1.ets
│   │       ├── MixTwoDimV1ToV2.ets
│   │       ├── MixTwoDimV2ToV1.ets
│   │       ├── MixNestedV1ToV2.ets
│   │       └── MixNestedV2ToV1.ets
│   └── resources
│       ├── base
│       ├── dark
│       └── rawfile
├── ohosTest
│   └── ets/test
│       ├── Ability.test.ets
│       ├── index.test.ets
│       └── List.test.ets
└── test
    ├── V1V2MixUsageUnit.test.ets
    └── List.test.ets
```

## 具体实现

1. **普通JS Object V1->V2**：展示非@Observed/@ObservedV2装饰的普通class在V1->V2传递时不可观察属性变化。
2. **普通JS Object V2->V1**：展示非@Observed/@ObservedV2装饰的普通class在V2->V1传递时不可观察属性变化。
3. **@Observed装饰的class V1->V2**：展示@Observed装饰的class从@Component(@State)传递给@ComponentV2(@Param)时，@Track属性可观察变化。
4. **@Observed装饰的class V2->V1**：展示@Observed装饰的class从@ComponentV2(@Local)传递给@Component(@ObjectLink)时，@Track属性可观察变化。
5. **内置类型Array V1->V2**：展示Array类型从@Component(@State)传递给@ComponentV2(@Param)时，数组项变化可观察。
6. **内置类型Array V2->V1**：展示Array类型从@ComponentV2(@Local)传递给@Component(@ObjectLink)时，双向同步数组项变化。
7. **二维数组 V1->V2**：展示二维数组从@Component(@State)传递给@ComponentV2(@Param)，支持深度观察。
8. **二维数组 V2->V1**：展示二维数组从@ComponentV2(@Local)传递给@Component(@ObjectLink)，支持深度观察。
9. **嵌套类型 V1->V2**：展示嵌套@Observed class从@Component传递给@ComponentV2，@State仅观察第一层，@ObjectLink和@Param可深度观察。
10. **嵌套类型 V2->V1**：展示嵌套@Observed class从@ComponentV2传递给@Component，@Local可深度观察，V1需多层@ObjectLink实现深度观察。

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
echo code/DocsSample/ArkUISample-Sta/V1V2MixUsage/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
