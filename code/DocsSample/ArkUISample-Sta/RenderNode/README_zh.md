# 渲染节点 (RenderNode)指南文档示例

### 介绍

本示例通过使用[ArkUI指南文档](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui/)中各场景的开发示例，展示在工程中，帮助开发者更好地理解ArkUI提供的组件及组件属性并合理使用。该工程中展示的代码详细描述可查如下链接：

1. [自定义渲染节点 (RenderNode)](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui/arkts-user-defined-arktsNode-renderNode.md)。

### 效果预览

|首页                                   |
|----------------------------------------------|
|![rendernode](./screenshots/rendernode.png)|

### 工程目录
```
entry/src/
├── main
│   ├── ets
│   │   ├── entryability
│   |   |   └── EntryAbility.ets                     // 程序入口类 
│   │   ├── pages
│   │   │   ├── samples
│   |   |   |   ├── CheckRenderNodeDisposed.ets      // 检查RenderNode是否释放
│   |   |   |   ├── CustomDraw.ets                   // 自定义绘制
│   |   |   |   ├── CustomDrawCanvas.ets             // 自定义绘制画布变换
│   |   |   |   ├── OperationNodeTree.ets            // 操作节点树
│   |   |   |   ├── RenderingProperties.ets          // 渲染属性
│   |   |   |   └── SetLabel.ets                     // 设置标签
│   │   │   └── Index.ets                            // 主界面
│   └── resources
│       ├── ...
├─── ... 
```

### 具体实现

1. 通过RenderNode实现自定义绘制节点，重写draw方法进行自定义绘制；
2. 使用RenderNode的frame、position、scale、rotation等属性控制节点渲染样式；
3. 通过RenderNode的appendChild、removeChild等接口操作渲染节点树。

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
echo code/DocsSample/ArkUISample-Sta/RenderNode/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin OpenHarmony_feature_sta_20260331
```
