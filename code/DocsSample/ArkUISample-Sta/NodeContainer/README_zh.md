# 节点容器 (NodeContainer)指南文档示例

### 介绍

本示例通过使用[ArkUI指南文档](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui/)中各场景的开发示例，展示在工程中，帮助开发者更好地理解ArkUI提供的组件及组件属性并合理使用。该工程中展示的代码详细描述可查如下链接：

1. [自定义占位节点](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui/arkts-user-defined-place-holder.md)。

### 效果预览

|首页                                   |
|----------------------------------------------|
|![nodecontainer](./screenshots/nodecontainer.png)|

### 工程目录
```
entry/src/
├── main
│   ├── ets
│   │   ├── entryability
│   |   |   └── EntryAbility.ets                     // 程序入口类 
│   │   ├── pages
│   │   │   ├── samples
│   |   |   |   ├── CustomNode.ets                   // 自定义节点
│   |   |   |   └── LayoutDiff.ets                   // 布局差异对比
│   │   │   └── Index.ets                            // 主界面
│   └── resources
│       ├── ...
├─── ... 
```

### 具体实现

1. 使用NodeContainer组件承载通过NodeController创建的自定义节点；
2. 使用BuilderNode构建自定义组件节点，通过wrapBuilder绑定@Builder方法；
3. 通过NodeController的makeNode方法创建FrameNode，控制节点的显示与隐藏。

### 相关权限

不涉及。

### 依赖

不涉及。

### 约束与限制

1.本示例仅支持标准系统上运行, 支持设备：RK3568。

2.本示例为Stage模型，arkTSVersion为1.2。

3.本示例需要使用Sta SDK配套IDE版本才可编译运行。

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/ArkUISample-Sta/NodeContainer/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin OpenHarmony_feature_sta_20260331
```
