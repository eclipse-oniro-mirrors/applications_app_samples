# 导航与布局高级组件（NavigationAndLayout）

### 介绍

本示例基于 API 26，演示 ArkUI 高级组件在导航与多设备布局场景中的组合使用：

- [MultiNavigation（含 MultiNavPathStack / SplitPolicy）](https://docs.openharmony.cn/pages/v6.0/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-arkui-advanced-MultiNavigation.md)：分栏导航、多层页面栈、HOME/DETAIL/FULL 三种页面策略；
- [SplitLayout](https://docs.openharmony.cn/pages/v6.0/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-arkui-advanced-SplitLayout.md)：图片 + 主/副/三级文本的自适应分栏布局，按 600vp/840vp 断点切换；
- [FoldSplitContainer](https://docs.openharmony.cn/pages/v6.0/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-arkui-advanced-FoldSplitContainer.md)：折叠屏折叠态/悬停态/展开态区域布局，支持三分栏与扩展区域；
- [NavPushPathHelper](https://docs.openharmony.cn/pages/v6.0/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-atomicservice-NavPushPathHelper.md)：从 HSP 分包动态加载 NavDestination 页面，加载失败时回退本地页面。

工程同时封装了日志、断点、设备形态、导航栈等工具类，包含 24 条 ohosTest 用例（含纯逻辑单元测试）。

### 效果预览

| 首页 | 折叠布局模拟 | HSP 导航 |
|--------------------------------|--------------------------------|--------------------------------|
| 运行后补充截图 | 运行后补充截图 | 运行后补充截图 |

使用说明：

1. 首页展示 4 个专题入口与当前断点（width/breakpoint）；
2. MultiNavigation：点击列表项进入详情（DETAIL_PAGE），点击“打开全屏页”进入 FULL_PAGE；大屏下详情与主页分栏显示；
3. SplitLayout：拖动窗口宽度或旋转设备，观察 600vp/840vp 断点下布局变化；
4. FoldSplitContainer：真实折叠状态由系统上报；非折叠设备可使用“折叠态/悬停态/展开态（模拟预览）”查看三种布局；
5. HSP 导航：点击“从 HSP 打开页面”尝试加载 `feature` 分包；未安装分包或加载失败时自动回退本地兜底页。

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
6. 本示例包含 52 条 ohosTest 用例（6 功能入口 + 14 MultiNavigation + 4 SplitLayout + 7 FoldSplit + 12 HSP + 3 稳定性 + 6 逻辑单元测试），并提供 entry/src/test 下的本地工具类单元测试，用例说明见 [ohosTest.md](ohosTest.md)；
7. 效果预览截图需在真机运行后补充。

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/UI/AdvancedComponents/NavigationAndLayout/ > .git/info/sparse-checkout
git remote add origin https://gitee.com/openharmony/applications_app_samples.git
git pull origin master
```
