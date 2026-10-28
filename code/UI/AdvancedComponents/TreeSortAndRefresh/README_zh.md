# 树形、排序与刷新（TreeSortAndRefresh）

### 介绍

本示例基于 API 26，演示 ArkUI 的树视图、网格排序、添加到桌面菜单、文本片段容器与下拉刷新：

- [TreeView](https://docs.openharmony.cn/pages/v6.0/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-arkui-advanced-TreeView.md)：API 10 起的树视图，支持父子节点、展开/折叠、节点监听与增删改；
- [TreeViewV2](https://docs.openharmony.cn/pages/v6.0/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-arkui-advanced-TreeViewV2.md)：API 26 新增、基于状态管理 V2 的树视图，使用 `TreeControllerV2` 与 `TreeListenerV2`；
- [GridObjectSortComponent](https://docs.openharmony.cn/pages/v6.0/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-arkui-advanced-GridObjectSortComponent.md)：API 11 起的网格对象排序组件，支持编辑、拖动排序、新增、删除、保存与取消；
- [FormMenu](https://docs.openharmony.cn/pages/v6.0/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-arkui-advanced-formmenu.md)：API 12 起的“添加至桌面”菜单，通过 `AddFormMenuItem` 与 `bindContextMenu` 实现长按菜单；
- [SwipeRefresherV2](https://docs.openharmony.cn/pages/v6.0/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-arkui-advanced-SwipeRefresherV2.md)：API 26 起、基于状态管理 V2 的下拉刷新加载提示，支持自定义文本与加载状态；
- [ContainerSpan](https://docs.openharmony.cn/pages/v6.0/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ts-basic-components-containerspan.md)：API 11 起的文本子容器，统一管理多个 `Span`/`ImageSpan` 的背景色与圆角。

工程包含排序/刷新/树状态、设备信息与响应式断点工具类，包含 33 条 ohosTest 用例（含 8 条逻辑单测）与 6 条本地工具单测。

### 效果预览

| 首页 | TreeView | GridObjectSort | FormMenu | SwipeRefresherV2 |
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
| 运行后补充截图 | 运行后补充截图 | 运行后补充截图 | 运行后补充截图 | 运行后补充截图 |

使用说明：

1. 首页展示 6 个入口、当前断点与设备信息，入口随宽度按 1/2/3 栏排列；
2. ContainerSpan：点击“切换样式”在深色/浅色背景间切换，文本与图标共享背景与圆角；
3. TreeView / TreeViewV2：点击文档等节点选中并更新状态，点击“重置选择”清空状态；文件夹可展开/折叠；
4. GridObjectSortComponent：点击右上角编辑图标进入编辑，可点击未选项添加、移除已选项并拖动排序；保存/取消会更新状态文本；
5. FormMenu：长按“快捷笔记”卡片弹出“添加至桌面”菜单；示例未内置卡片提供方，实际加桌需配置 FormExtensionAbility 与 form_config；
6. SwipeRefresherV2：点击“开始刷新”显示加载状态，1.2 秒后完成并更新刷新计数；可中途停止。

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
5. 本示例包含 33 条 ohosTest 用例（8 入口 + 2 ContainerSpan + 3 TreeView + 3 TreeViewV2 + 3 GridObjectSort + 1 FormMenu + 3 SwipeRefresherV2 + 2 稳定性 + 8 逻辑单测），另有 6 条本地工具单测，用例说明见 [ohosTest.md](ohosTest.md)；
6. 工程已配置本机 DevEco 调试签名，可直接在 IDE 部署；提交仓库前请清空 `signingConfigs` 并重新自动签名；
7. 效果预览截图需在真机运行后补充。

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/UI/AdvancedComponents/TreeSortAndRefresh/ > .git/info/sparse-checkout
git remote add origin https://gitee.com/openharmony/applications_app_samples.git
git pull origin master
```
