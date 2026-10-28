# 标题栏与工具栏（TitleBarsAndToolbars）

### 介绍

本示例基于 API 26，演示 ArkUI 的高级标题栏与工具栏组件：

- [EditableTitleBar](https://docs.openharmony.cn/pages/v6.0/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-arkui-advanced-EditableTitleBar.md)：API 10 起的编辑型标题栏，支持取消/返回、头像、副标题、右侧菜单、保存按钮、背景模糊与内容边距；
- [EditableTitleBarV2](https://docs.openharmony.cn/pages/v6.0/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-arkui-advanced-EditableTitleBarV2.md)：API 26 新增、基于状态管理 V2 的编辑型标题栏，通过 `EditableLeftIconV2/EditableTitleV2/EditableSaveButtonV2` 组合配置；
- [SelectTitleBar](https://docs.openharmony.cn/pages/v6.0/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-arkui-advanced-SelectTitleBar.md)：API 10 起的下拉菜单标题栏，支持下拉选项、返回箭头、副标题、角标与右侧菜单；
- [TabTitleBar](https://docs.openharmony.cn/pages/v6.0/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-arkui-advanced-TabTitleBar.md)：API 10 起的页签型标题栏，页签与 `swiperContent` 内容联动，支持右侧菜单；
- [ToolBarV2](https://docs.openharmony.cn/pages/v6.0/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-arkui-advanced-ToolBarV2.md)：API 18 起、基于状态管理 V2 的底部工具栏，支持文本/图标、启用/禁用/激活状态、分割线与自定义高度/背景/内边距。

工程包含标题栏索引/角标/描述、设备信息与响应式断点工具类，包含 34 条 ohosTest 用例（含 6 条逻辑单测）与 5 条本地工具单测。

### 效果预览

| 首页 | EditableTitleBar | SelectTitleBar | TabTitleBar | ToolBarV2 |
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
| 运行后补充截图 | 运行后补充截图 | 运行后补充截图 | 运行后补充截图 | 运行后补充截图 |

使用说明：

1. 首页展示 5 个入口、当前断点与设备信息，入口随宽度按 1/2/3 栏排列；
2. EditableTitleBar：左侧取消、右侧保存/分享图标；点击“切换副标题”可显示/隐藏副标题，页面同步展示各操作计数；
3. EditableTitleBarV2：使用 V2 配置对象实现相同的取消/保存/分享交互，计数与 V1 一致；
4. SelectTitleBar：点击标题打开下拉菜单选择项目；也可使用“下一个项目/重置项目”按钮，状态文本显示当前索引；
5. TabTitleBar：点击“概览/详情/设置”页签切换关联内容，右侧分享图标更新计数；
6. ToolBarV2：底部工具栏提供首页、编辑、分享、更多操作，前三个可点击并更新激活索引与计数，更多为禁用态。

### 工程目录

```
entry/src/main/ets/
|---entryability
|   |---EntryAbility.ets                   // 应用入口
|---pages
|   |---Index.ets                          // 首页：入口、断点与设备信息
|   |---EditableTitleBarDemo.ets           // EditableTitleBar 示例
|   |---EditableTitleBarV2Demo.ets         // EditableTitleBarV2 示例（状态管理 V2）
|   |---SelectTitleBarDemo.ets             // SelectTitleBar 下拉标题栏
|   |---TabTitleBarDemo.ets                // TabTitleBar 页签标题栏
|   |---ToolBarV2Demo.ets                  // ToolBarV2 底部工具栏
|---utils
|   |---Constants.ts                       // 路由、项目/页签/工具项常量
|   |---BreakpointUtils.ts                 // 断点/栏数/Grid 模板
|   |---TitleBarUtils.ts                   // 索引/角标/动作与状态描述
|   |---TitleBarActions.ts                 // 保存/取消/菜单计数、摘要与日志
|   |---DeviceInfoUtils.ts                 // 设备类型/屏幕/方向信息
|---util
|   |---Logger.ts                          // 统一日志
entry/src/ohosTest/ets/
|---testkit/SharedDriver.ets               // 测试驱动、子按钮点击与断言封装
|---test/*.test.ets                        // 功能、稳定性与逻辑单测
entry/src/test/
|---UtilsUnit.test.ets                    // 工具类本地单元测试
```

### 具体实现

- EditableTitleBar：`leftIconStyle` 切换取消/返回，`isSaveIconRequired` 控制保存按钮，`menuItems` 配置分享菜单，`options.backgroundColor` 配置背景；保存/取消/菜单回调更新计数并写日志，源码参考：[EditableTitleBarDemo.ets](entry/src/main/ets/pages/EditableTitleBarDemo.ets)；
- EditableTitleBarV2：使用 `EditableLeftIconV2`、`EditableTitleV2`、`EditableTitleBarMenuItemV2`、`EditableSaveButtonV2` 与 `EditableTitleBarStyleV2` 组合配置，`onAction` 统一处理交互，源码参考：[EditableTitleBarV2Demo.ets](entry/src/main/ets/pages/EditableTitleBarV2Demo.ets)；
- SelectTitleBar：`options` 提供下拉项目，`selected` 与 `onSelected` 同步选择，`subtitle/badgeValue` 展示补充信息，页面按钮复用 `TitleBarUtils.nextIndex`，源码参考：[SelectTitleBarDemo.ets](entry/src/main/ets/pages/SelectTitleBarDemo.ets)；
- TabTitleBar：`tabItems` 定义页签，`swiperContent` 通过 `@Builder` 提供三页内容，`menuItems` 提供分享操作并计数，源码参考：[TabTitleBarDemo.ets](entry/src/main/ets/pages/TabTitleBarDemo.ets)；
- ToolBarV2：`aboutToAppear` 构建 `ToolBarV2Item` 列表，`ToolBarV2ItemText` 配置文本、`ToolBarV2ItemState` 配置禁用态，`ToolBarV2Modifier` 配置高度/背景/按压效果，源码参考：[ToolBarV2Demo.ets](entry/src/main/ets/pages/ToolBarV2Demo.ets)；
- 工具与适配：`TitleBarActions` 统一封装编辑标题栏的保存/取消/菜单计数、摘要与日志；`TitleBarUtils` 负责索引循环/钳制、角标 99+、动作与页签/工具栏描述；`DeviceInfoUtils` 获取设备与屏幕信息；`BreakpointUtils` 负责 600/840vp 断点；`Logger` 统一生命周期、交互与错误日志；首页按断点 1/2/3 栏；内容区在 md/lg 下限制为 720/960vp 并居中，手机为 560vp，水平边距按断点取 16/24/32vp；Scroll 页面顶部对齐，支持横屏与矮窗口滚动。

### 相关权限

不涉及。

### 依赖

不涉及。

### 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：RK3568、手机、平板、2in1；
2. 本示例基于 ArkTS 1.1 动态环境开发，已适配 API version 26 版本 SDK，版本号：26.0.0；
3. 本示例需要使用 DevEco Studio 26.0.0 及以上版本才可编译运行；
4. `EditableTitleBarV2` 相关类型在 SDK 26.0.0 中需从 `@ohos.arkui.advanced.EditableTitleBarV2` 导入，`@kit.ArkUI` 未导出；其余组件可从 `@kit.ArkUI` 导入；
5. 本示例包含 34 条 ohosTest 用例（7 入口 + 5 EditableTitleBar + 4 EditableTitleBarV2 + 3 SelectTitleBar + 3 TabTitleBar + 4 ToolBarV2 + 2 稳定性 + 6 逻辑单测），另有 5 条本地工具单测，用例说明见 [ohosTest.md](ohosTest.md)；
6. 工程使用 DevEco Studio 自动生成的调试签名，可直接在 IDE 部署；提交仓库前建议清空 `signingConfigs`，由使用者在 IDE 中重新自动签名；
7. 效果预览截图需在真机运行后补充。

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/UI/AdvancedComponents/TitleBarsAndToolbars/ > .git/info/sparse-checkout
git remote add origin https://gitee.com/openharmony/applications_app_samples.git
git pull origin master
```
