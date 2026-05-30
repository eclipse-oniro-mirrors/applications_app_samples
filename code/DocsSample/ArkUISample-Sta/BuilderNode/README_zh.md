# ArkUI使用滚动类指南文档示例

### 介绍

本示例通过使用[ArkUI指南文档](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui/)中各场景的开发示例，展示在工程中，帮助开发者更好地理解ArkUI提供的组件及组件属性并合理使用。该工程中展示的代码详细描述可查如下链接：

1. [自定义声明式节点 (BuilderNode)（ArkTS-Sta）](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/ui/arkts-v1.2-user-defined-arktsNode-builderNode.md)。

### 效果预览

|首页                                   |
|----------------------------------------------|
|![buildernode](./screenshots/buildernode.png)|

### 工程目录
```
entry/src/
├── main
│   ├── ets
│   │   ├── entryability
|   |   |   └── EntryAbility.ets                         // 程序入口类 
│   │   ├── pages
│   │   │   ├── samples
|   |   |   |   ├── BuilderNodeMakeNode.ets              // 构建节点（基础场景）
|   |   |   |   ├── BuilderNodeRenderNode.ets            // 构建渲染节点
|   |   |   |   ├── BuilderNodeUpdateConfiguration.ets   // 构建节点更新与配置
|   |   |   |   └── BuilderNodeUpdateTree.ets            // 构建节点更新树
│   │   │   └── Index.ets                               // 主界面
│   └── resources
│       ├── ...
├─── ... 
```
### 具体实现

一、BuilderNodeMakeNode（构建节点-基础场景）
1. 定义全局@Builder函数封装需渲染的组件树，支持传入参数；
2. 实现NodeController，在makeNode方法中创建BuilderNode，绑定@Builder与参数，将生成的FrameNode返回；
3. 在UI中使用NodeContainer承载自定义节点。

二、BuilderNodeRenderNode（构建渲染节点）
1. 创建FrameNode作为根节点，创建RenderNode控制节点渲染属性；
2. 通过BuilderNode创建自定义渲染节点，获取其渲染节点；
3. 将多个RenderNode按层级结构组合到根节点的渲染节点树中。

三、BuilderNodeUpdateConfiguration（构建节点更新与配置）
1. 定义自定义组件并通过@PropRef装饰器支持属性响应式更新；
2. BuilderNode创建后可通过更新方法实现主动内容更新；
3. 支持通知BuilderNode环境变量改变，触发深浅色切换等配置更新；
4. 在组件生命周期中创建和释放节点，管理节点生命周期。

四、BuilderNodeUpdateTree（构建节点更新树）
1. 在makeNode中创建BuilderNode并绑定@Builder和参数；
2. 自定义组件通过装饰器接收更新后的参数；
3. 通过更新方法触发组件树重新渲染，更新显示内容。

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

````
git init
git config core.sparsecheckout true
echo code/DocsSample/ArkUISample-Sta/BuilderNode/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin OpenHarmony_feature_sta_20260331
````