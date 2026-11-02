# 树形、排序与刷新（TreeSortAndRefresh）

### 介绍

本示例基于 API 26，演示 ArkUI 的树视图、网格排序、添加到桌面菜单、文本片段容器与下拉刷新：

- [TreeView](https://docs.openharmony.cn/pages/v6.0/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-arkui-advanced-TreeView.md)：API 10 起的树视图，支持父子节点、展开/折叠、节点监听与增删改；
- [TreeViewV2](https://docs.openharmony.cn/pages/v6.0/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-arkui-advanced-TreeViewV2.md)：API 26 新增、基于状态管理 V2 的树视图，使用 `TreeControllerV2` 与 `TreeListenerV2`；
- [GridObjectSortComponent](https://docs.openharmony.cn/pages/v6.0/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-arkui-advanced-GridObjectSortComponent.md)：API 11 起的网格对象排序组件，支持编辑、拖动排序、新增、删除、保存与取消；
- [FormMenu](https://docs.openharmony.cn/pages/v6.0/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-arkui-advanced-formmenu.md)：API 12 起的“添加至桌面”菜单，通过 `AddFormMenuItem` 与 `bindContextMenu` 实现长按菜单；
- [SwipeRefresherV2](https://docs.openharmony.cn/pages/v6.0/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-arkui-advanced-SwipeRefresherV2.md)：API 26 起、基于状态管理 V2 的下拉刷新加载提示，支持自定义文本与加载状态；
- [ContainerSpan](https://docs.openharmony.cn/pages/v6.0/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ts-basic-components-containerspan.md)：API 11 起的文本子容器，统一管理多个 `Span`/`ImageSpan` 的背景色与圆角。

工程包含排序/刷新/树状态、设备信息与响应式断点工具类，包含 102 条 ohosTest 用例与 6 条本地工具单测。

### 功能特性

- ContainerSpan：统一多个 Span/ImageSpan 的背景与圆角，深浅样式切换；
- TreeView/TreeViewV2：6 节点层级树、点击选中、文件夹展开、最近事件与统计；
- GridObjectSortComponent：编辑、添加、拖动排序、保存/取消；
- FormMenu：长按卡片弹出“添加至桌面”菜单并记录回调；
- SwipeRefresherV2：开始/停止刷新、加载状态与刷新计数；
- 工具类：树结构、刷新状态机、选中统计、断点与内容边距；
- 响应式布局：弹性高度、顶部对齐、内容滚动与断点适配。

### 交互说明

| 页面 | 主要操作 | 反馈 |
|---|---|---|
| ContainerSpan | 切换样式 | 背景/文字颜色与状态更新 |
| TreeView/V2 | 点击节点、重置 | 选中节点、事件、统计与历史 |
| GridSort | 编辑、添加、保存、取消 | 状态计数与排序结果更新 |
| FormMenu | 长按卡片 | 弹出添加至桌面菜单 |
| SwipeRefresh | 开始/停止刷新 | 加载状态、计数与状态文本 |

### 实现架构

```text
页面 -> TreeSpecUtils（节点结构）
     -> TreeSortUtils、RefreshController/RefreshSession
     -> BreakpointUtils、DeviceInfoUtils、Logger
```

### 测试覆盖

| 类型 | 数量 | 说明 |
|---|---:|---|
| ohosTest | 102 | 入口、6 类组件、树/排序/刷新、边界、稳定性、逻辑 |
| 本地单测 | 6 | 树结构、刷新状态、排序、断点 |

### 效果预览

| 首页 | TreeView |
|:---:|:---:|
| <img src="screenshots/index.jpeg" width="360" /> | <img src="screenshots/treeView.jpeg" width="360" /> |

> 截图基于 OpenHarmony 7.0.0.47 真机（API 26）拍摄。

### 工程目录

```
entry/src/main/ets/
|---entryability
|   |---EntryAbility.ets                   // 应用入口（含窗口尺寸日志）
|---pages
|   |---Index.ets                          // 首页：入口、断点与设备信息
|   |---ContainerSpanDemo.ets              // ContainerSpan 统一背景/圆角
|   |---TreeViewDemo.ets                   // TreeView 树视图
|   |---TreeViewV2Demo.ets                 // TreeViewV2 树视图（状态管理 V2）
|   |---GridSortDemo.ets                   // GridObjectSortComponent 排序
|   |---FormMenuDemo.ets                   // FormMenu 添加至桌面菜单
|   |---SwipeRefreshDemo.ets               // SwipeRefresherV2 下拉刷新
|---utils
|   |---Constants.ts                       // 路由、节点/排序/刷新常量
|   |---BreakpointUtils.ts                 // 断点/栏数/Grid 模板
|   |---TreeSortUtils.ts                   // 选中统计、排序/刷新/树/表单状态描述
|   |---TreeSpecUtils.ts                   // 树节点结构、根/子节点查询
|   |---RefreshController.ts               // 刷新状态机、定时器与日志
|   |---DeviceInfoUtils.ts                 // 设备类型/屏幕/方向信息
|---util
|   |---Logger.ts                          // 统一日志
entry/src/ohosTest/ets/
|---testkit/SharedDriver.ets               // 测试驱动、长按/子按钮/多语言点击
|---test/*.test.ets                        // 功能、稳定性与逻辑单测
entry/src/test/
|---UtilsUnit.test.ets                    // 工具类本地单元测试
```

### 具体实现

- TreeView/TreeViewV2：`TreeSpecUtils` 统一定义 6 个节点的父子/目录结构，`TreeController/TreeControllerV2` 遍历 `addNode` 并 `buildDone`，`TreeListenerManager/TreeListenerManagerV2` 监听点击并更新状态，目录节点可展开，源码参考：[TreeViewDemo.ets](entry/src/main/ets/pages/TreeViewDemo.ets)、[TreeViewV2Demo.ets](entry/src/main/ets/pages/TreeViewV2Demo.ets)；
- GridObjectSortComponent：`GridObjectSortComponentItem` 定义 4 个频道（2 个已选），`GridObjectSortComponentOptions` 配置标题与提示；`onSave/onCancel` 使用 `TreeSortUtils` 更新状态，源码参考：[GridSortDemo.ets](entry/src/main/ets/pages/GridSortDemo.ets)；
- FormMenu：`AddFormMenuItem(want, componentId, { formBindingData, callback })` 放在 `Menu` 中，卡片通过 `bindContextMenu(..., ResponseType.LongPress)` 展示；回调记录 formId/错误码，源码参考：[FormMenuDemo.ets](entry/src/main/ets/pages/FormMenuDemo.ets)；
- SwipeRefresherV2：`RefreshController/RefreshSession` 统一刷新状态机、定时器与日志，`isLoading` 控制加载提示，1.2 秒后完成并更新计数，停止/销毁时清理定时器，源码参考：[SwipeRefreshDemo.ets](entry/src/main/ets/pages/SwipeRefreshDemo.ets)；
- ContainerSpan：`ContainerSpan().textBackgroundStyle()` 包裹两个 `Span` 与一个 `ImageSpan`，统一切换深/浅背景与圆角，源码参考：[ContainerSpanDemo.ets](entry/src/main/ets/pages/ContainerSpanDemo.ets)；
- 工具与适配：`RefreshController`/`RefreshSession` 负责刷新状态与定时器；`TreeSpecUtils` 负责树结构；`TreeSortUtils` 负责选中统计、排序/刷新/树/表单状态描述；`BreakpointUtils.contentPadding` 随断点调整内容边距；`DeviceInfoUtils` 获取设备与屏幕信息；`BreakpointUtils` 负责 600/840vp 断点；`Logger` 统一生命周期、节点点击、排序保存、刷新与表单回调日志；首页按断点 1/2/3 栏，页面高度自适应。

### 相关权限

不涉及。

### 依赖

不涉及。

### 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：RK3568、手机、平板、2in1；
2. 本示例基于 ArkTS 1.1 动态环境开发，已适配 API version 26 版本 SDK，版本号：26.0.0；
3. 本示例需要使用 DevEco Studio 26.0.0 及以上版本才可编译运行；
4. `TreeViewV2`、`SwipeRefresherV2` 为 API 26 新增组件；FormMenu 实际加桌需应用提供 FormExtensionAbility 与卡片配置，本示例重点演示长按菜单 UI 与回调；
5. 本示例包含 102 条 ohosTest 用例，另有 6 条本地工具单测，用例说明见 [ohosTest.md](ohosTest.md)；
6. 工程已配置本机 DevEco 调试签名，可直接在 IDE 部署；提交仓库前请清空 `signingConfigs` 并重新自动签名；

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/UI/AdvancedComponents/TreeSortAndRefresh/ > .git/info/sparse-checkout
git remote add origin https://gitee.com/openharmony/applications_app_samples.git
git pull origin master
```