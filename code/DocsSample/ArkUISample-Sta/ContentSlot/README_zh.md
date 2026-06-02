# 内容插槽 (ContentSlot)指南文档示例

### 介绍

本示例通过使用[ContentSlot：混合开发](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui/arkts-rendering-control-contentslot.md)指南文档中各场景的开发示例，展示在工程中，帮助开发者更好地理解ArkUI提供的组件及组件属性并合理使用。

### 效果预览

|首页                                   |
|----------------------------------------------|
|![contentslot](./screenshots/contentslot.png)|

### 工程目录
```
entry/src/
├── main
│   ├── cpp
│   |   ├── ani_init.cpp                             // native侧业务逻辑代码
│   |   └── CMakeLists.txt                           // 编译配置文件
│   ├── ets
│   │   ├── entryability
│   |   |   └── EntryAbility.ets                      // 程序入口类 
│   │   ├── pages
│   │   │   └── Index.ets                            // 主界面（ContentSlot示例）
│   └── resources
│       ├── ...
├─── ... 
```

### 具体实现

1. 使用ContentSlot组件显示NodeContent管理器中的Native侧组件；
2. 通过NodeContent管理Native侧组件的生命周期；
3. 在aboutToAppear和aboutToDisappear中创建和销毁Native节点。

### 相关权限

不涉及。

### 依赖

不涉及。

### 约束与限制

1.本示例已适配26.0.0及以上版本SDK。

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/ArkUISample-Sta/ContentSlot/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin OpenHarmony_feature_sta_20260331
```
