# 导航与布局高级组件（NavigationAndLayout）

### 介绍

本示例基于 API 26，演示 ArkUI 高级组件在导航与多设备布局场景中的组合使用：

- [MultiNavigation（含 MultiNavPathStack / SplitPolicy）](https://docs.openharmony.cn/pages/v6.0/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-arkui-advanced-MultiNavigation.md)：分栏导航、多层页面栈、HOME/DETAIL/FULL 三种页面策略；
- [SplitLayout](https://docs.openharmony.cn/pages/v6.0/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-arkui-advanced-SplitLayout.md)：图片 + 主/副/三级文本的自适应分栏布局，按 600vp/840vp 断点切换；
- [FoldSplitContainer](https://docs.openharmony.cn/pages/v6.0/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-arkui-advanced-FoldSplitContainer.md)：折叠屏折叠态/悬停态/展开态区域布局，支持三分栏与扩展区域；
- [NavPushPathHelper](https://docs.openharmony.cn/pages/v6.0/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-atomicservice-NavPushPathHelper.md)：从 HSP 分包动态加载 NavDestination 页面，加载失败时回退本地页面。

工程同时封装了日志、断点、设备形态、导航栈等工具类，包含 118 条 ohosTest 用例与 3 条本地工具单测。

### 功能特性

- MultiNavigation 分栏导航：Home/Detail/Full/Placeholder 路由，支持 Pop、Move、Remove、Placeholder、Home 操作；
- 栈状态可视化：Depth/Mode/Actions 统计卡、路径面包屑、最近操作历史与一键清空；
- MultiNavPathStack APIs：pushPath、pushPathByName、replacePath、removeByIndexes、pop、popToName、popToIndex、moveIndexToTop、clear、查询与全屏状态等；
- SplitLayout 自适应分栏：500/700/1000vp 预览宽度、可选文案开关、断点与栏数联动；
- FoldSplitContainer 折叠形态：折叠/半折叠/展开模拟、比例与位置切换、额外区域开关；
- HSP 导航：NavPushPathHelper 从 feature 模块加载页面，覆盖 push/replace/destination/onPop 场景；
- 全流程日志：页面生命周期、导航动作、栈变化、设备/窗口/折叠状态。

### 交互说明

| 页面 | 主要操作 | 反馈 |
|---|---|---|
| MultiNavigation | 顶部栈操作、点击列表项 | Toast、统计卡、路径与历史同步更新 |
| Stack API | 调用栈 API 按钮 | 日志面板、Last API 统计、Toast |
| SplitLayout | 切换预览宽度/文案 | 分栏比例与断点文本实时变化 |
| FoldSplit | 切换折叠模拟/比例/位置 | 布局、比例文本与动画状态更新 |
| HSP | push/replace HSP 页面 | 页面跳转与栈摘要更新 |

### 实现架构

```text
页面 UI（MultiNavigation/SplitLayout/FoldSplit/HSP）
  -> MultiNavPathStack、NavPushPathHelper、FoldSplitContainer
  -> NavigationUtils、FoldConfigUtils、WindowUtils、DeviceUtils
  -> BreakpointUtils、Logger
```

页面只维护展示状态，导航栈、折叠配置、窗口信息与断点计算由工具类统一处理；所有关键操作统一 Toast + 日志。

### 测试覆盖

| 类型 | 数量 | 说明 |
|---|---:|---|
| ohosTest | 118 | 入口、MultiNavigation、Stack API、Split/Fold/HSP、稳定性、逻辑 |
| 本地单测 | 3 | 断点、折叠加载配置、导航摘要 |

### 效果预览

| 首页 | MultiNavigation |
|:---:|:---:|
| <img src="screenshots/index.jpeg" width="360" /> | <img src="screenshots/multiNavigation.jpeg" width="360" /> |

> 截图基于 OpenHarmony 7.0.0.47 真机（API 26）拍摄。

### 工程目录

```
entry/src/main/ets/
|---entryability
|   |---EntryAbility.ets                   // 应用入口
|---models
|   |---DemoModels.ets                     // 导航参数与入口数据模型
|---pages
|   |---Index.ets                          // 首页：入口与断点展示
|   |---MultiNavigationDemo.ets            // MultiNavigation + SplitPolicy
|   |---SplitLayoutDemo.ets                // SplitLayout 自适应布局
|   |---FoldSplitDemo.ets                  // FoldSplitContainer + 三态模拟
|   |---HspDemo.ets                        // NavPushPathHelper + 本地兜底
|---utils
|   |---Constants.ts                       // 路由与布局常量
|   |---BreakpointUtils.ts                 // 断点、栏数与网格模板
|   |---FoldConfigUtils.ts                 // 折叠比例/位置/配置摘要
|   |---WindowUtils.ts                     // 设备类型、屏幕尺寸/密度/方向
|   |---DeviceUtils.ts                     // 折叠能力、状态与监听
|   |---NavigationUtils.ets                // 导航策略名与栈摘要
|---util
|   |---Logger.ts                          // 统一日志
feature/src/main/ets/pages/
|---FeatureDetail.ets                      // HSP 中的 NavDestination 页面
|---FeatureIndex.ets                       // HSP 入口页
feature/src/main/resources/base/profile/
|---route_map.json                         // HSP 路由映射（FeatureDetailBuilder）
entry/src/ohosTest/ets/
|---testkit/SharedDriver.ets               // 测试驱动与断言封装
|---test/*.test.ets                        // 功能、稳定性与逻辑单元测试
entry/src/test/
|---UtilsUnit.test.ets                    // 工具类本地单元测试（3 条）
```

### 具体实现

- MultiNavigation：`MultiNavPathStack` 统一管理主页、详情页与全屏页；`pushPathByName(name, param, animated, SplitPolicy)` 指定页面策略；`onNavigationModeChange` 与 `onHomeShowOnTop` 记录模式与栈变化，源码参考：[MultiNavigationDemo.ets](entry/src/main/ets/pages/MultiNavigationDemo.ets)；
- SplitLayout：传 `mainImage`、`primaryText`、`secondaryText`、`tertiaryText` 与尾随容器内容，组件自动按宽度切换布局；页面通过 `onAreaChange` 记录当前断点，源码参考：[SplitLayoutDemo.ets](entry/src/main/ets/pages/SplitLayoutDemo.ets)；
- FoldSplitContainer：配置 `expandedLayoutOptions`、`hoverModeLayoutOptions`、`foldedLayoutOptions` 与 `onHoverStatusChange`；`DeviceUtils` 负责 `display.isFoldable()`、`getFoldStatus()` 与 `foldStatusChange` 监听；非折叠设备通过同一组主/次/扩展内容按比例渲染模拟预览，源码参考：[FoldSplitDemo.ets](entry/src/main/ets/pages/FoldSplitDemo.ets)；
- NavPushPathHelper：主包只持有 `NavPathStack`，通过 `pushPath('feature', { name: 'FeatureDetail', param })` 从 HSP 加载页面；HSP 在 `route_map.json` 注册 `FeatureDetailBuilder`；失败时 `catch` 中回退 `LocalFallback`，源码参考：[HspDemo.ets](entry/src/main/ets/pages/HspDemo.ets) 与 [route_map.json](feature/src/main/resources/base/profile/route_map.json)；
- 工具封装：`BreakpointUtils`（600/840 断点、栏数）、`DeviceUtils`（折叠状态、监听注册/注销）、`NavigationUtils`（策略名、栈摘要）、`Logger`（统一 DOMAIN/前缀）均有日志与单元测试覆盖。

### 相关权限

不涉及。

### 依赖

本示例包含 `feature` HSP 分包，用于 NavPushPathHelper 演示。运行时需同时安装主包与 `feature-default.hsp`；未安装时示例自动回退本地页面。

### 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：RK3568、手机、平板、2in1；
2. 本示例基于 ArkTS 1.1 动态环境开发，已适配 API version 26 版本 SDK，版本号：26.0.0；
3. 本示例需要使用 DevEco Studio 26.0.0 及以上版本才可编译运行；
4. 真实折叠/悬停状态需要折叠屏设备；非折叠设备仅能验证折叠态与模拟预览；
5. HSP 分包的 `deviceTypes` 为 `default/tablet`，手机侧加载失败属预期，会走本地兜底页；
6. 本示例包含 118 条 ohosTest 用例，另有 3 条本地工具单测，用例说明见 [ohosTest.md](ohosTest.md)；

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/UI/AdvancedComponents/NavigationAndLayout/ > .git/info/sparse-checkout
git remote add origin https://gitee.com/openharmony/applications_app_samples.git
git pull origin master
```