# ArkTS-Sta与ArkTS-Dyn集合类型互操作

## 介绍

本工程帮助开发者更好地理解ArkTS-Sta与ArkTS-Dyn之间集合类型（Array、Map、Set）互操作的使用场景。该工程中展示的代码详细描述可查如下链接：

[UI互操作内建集合类型](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui/arkts-ui-interop-builtin-collection.md)

## 使用说明

执行测试用例会先打开相应界面，然后点击按钮或图标，演示接口的使用效果。

## 效果预览

|首页                                   |
|----------------------------------------------|
|![StaInteropDynBuiltinCollection](./screenshots/StaInteropDynBuiltinCollection.png)|

## 工程目录
```
entry/src/
├── main
│   ├── ets
│   │   ├── entryability
│   ├── pages
│   │   ├── Index.ets
│   │   ├── StaDynBuiltinArraySt.ets
│   │   ├── StaDynBuiltinArrayEs.ets
│   │   ├── StaDynBuiltinMapSt.ets
│   │   ├── StaDynBuiltinMapEs.ets
│   │   ├── StaDynBuiltinSetSt.ets
│   │   └── StaDynBuiltinSetEs.ets
│   └── resources
│       ├── ...
├─── ...
dynamic_module/src/
├── main
│   ├── ets
│   │   ├── components
│   │   │   ├── ArrayStPage.ets
│   │   │   ├── MapStPage.ets
│   │   │   ├── SetStPage.ets
│   │   │   └── EsPage.ets
│   │   └── module.json5
│   └── resources
│       ├── ...
├─── ...
```

## 具体实现

1. ArkTS-Sta使用Array传给ArkTS-Dyn st.Array：展示Sta侧Array与Dyn侧st.Array的互操作。

2. ArkTS-Sta使用es.Array传给ArkTS-Dyn Array：展示Sta侧es.Array与Dyn侧Array的互操作。

3. ArkTS-Sta使用Map传给ArkTS-Dyn st.Map：展示Sta侧Map与Dyn侧st.Map的互操作。

4. ArkTS-Sta使用es.Map传给ArkTS-Dyn Map：展示Sta侧es.Map与Dyn侧Map的互操作。

5. ArkTS-Sta使用Set传给ArkTS-Dyn st.Set：展示Sta侧Set与Dyn侧st.Set的互操作。

6. ArkTS-Sta使用es.Set传给ArkTS-Dyn Set：展示Sta侧es.Set与Dyn侧Set的互操作。

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
echo code/DocsSample/ArkUISample-Sta/StaInteropDynBuiltinCollection/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
