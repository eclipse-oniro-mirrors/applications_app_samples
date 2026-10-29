# 弹窗与提示（PopupsAndPrompts）

### 介绍

本示例基于 API 26，演示 ArkUI 的气泡、异常提示与文本选择菜单：

- [PopupV2](https://docs.openharmony.cn/pages/v6.0/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-arkui-advanced-PopupV2.md)：API 26 新增气泡组件，支持图标、标题、内容、关闭按钮、最多两个操作按钮、布局方向与最大宽度；
- [ExceptionPrompt](https://docs.openharmony.cn/pages/v6.0/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-arkui-advanced-ExceptionPrompt.md)：异常提示，支持 `tip`、图标、边距类型、右侧操作文本与显示开关；
- [ExceptionPromptV2](https://docs.openharmony.cn/pages/v6.0/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-arkui-advanced-ExceptionPromptV2.md)：API 26 新增、基于状态管理 V2 的异常提示；
- [SelectionMenu](https://docs.openharmony.cn/pages/v6.0/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-arkui-advanced-SelectionMenu.md)：文本选择菜单，通过 `RichEditor.bindSelectionMenu` 绑定自定义编辑菜单。

工程包含日志、计数/区间工具、响应式断点等工具类，并包含 28 条 ohosTest 用例与 2 条本地工具单测。

### 功能特性

- PopupV2：图标、标题、内容、关闭按钮、确认/取消按钮、状态与计数；
- ExceptionPrompt：异常提示、操作文本、显示/隐藏、边距与点击回调；
- ExceptionPromptV2：状态管理 V2 版本，支持动态重建提示配置；
- SelectionMenu：RichEditor 自定义选择菜单，支持选区摘要与菜单动作计数；
- PromptUtils：选区范围钳制、摘要、动作计数与显隐切换；
- 响应式布局：内容最大宽度、断点边距、顶部对齐与滚动；
- 可视化反馈：Confirm/Cancel/Actions 统计卡、操作历史与清空。

### 交互说明

| 页面 | 主要操作 | 反馈 |
|---|---|---|
| PopupV2 | 确认、取消、关闭 | 状态文本、统计卡、历史同步 |
| ExceptionPrompt/V2 | 点击提示/操作文本、隐藏/显示 | 状态与动作计数更新 |
| SelectionMenu | 选中文本、设置选区、菜单动作 | 选区摘要与菜单计数更新 |

### 实现架构

```text
页面 -> PromptUtils（范围/摘要/状态）
     -> PopupV2、ExceptionPrompt、SelectionMenu
     -> BreakpointUtils、Logger
```

### 测试覆盖

| 类型 | 数量 | 说明 |
|---|---:|---|
| ohosTest | 28 | 入口、PopupV2、ExceptionPrompt/V2、SelectionMenu、稳定性、逻辑 |
| 本地单测 | 2 | 提示工具与断点 |

### 效果预览

| 首页 | PopupV2 |
|:---:|:---:|
| <img src="screenshots/index.jpeg" width="360" /> | <img src="screenshots/popup.jpeg" width="360" /> |

> 截图基于 OpenHarmony 7.0.0.47 真机（API 26）拍摄。

### 工程目录

```
entry/src/main/ets/
|---entryability
|   |---EntryAbility.ets                   // 应用入口
|---pages
|   |---Index.ets                          // 首页：入口与响应式 Grid
|   |---PopupV2Demo.ets                    // PopupV2 气泡与按钮
|   |---ExceptionPromptDemo.ets            // ExceptionPrompt 异常提示
|   |---ExceptionPromptV2Demo.ets          // ExceptionPromptV2（状态管理 V2）
|   |---SelectionMenuDemo.ets              // RichEditor + SelectionMenu
|---utils
|   |---Constants.ts                       // 路由与断点常量
|   |---BreakpointUtils.ts                 // 断点/栏数/Grid 模板
|   |---PromptUtils.ts                     // 计数、显示切换、区间/选区工具
|   |---DeviceInfoUtils.ts                  // 设备类型/屏幕/方向信息
|---util
|   |---Logger.ts                          // 统一日志
entry/src/ohosTest/ets/
|---testkit/SharedDriver.ets               // 测试驱动与断言封装
|---test/*.test.ets                        // 功能、稳定性与逻辑单测
entry/src/test/
|---UtilsUnit.test.ets                    // 工具类本地单元测试
```

### 具体实现

- PopupV2：配置 `icon/title/message/showClose/buttons/maxWidth/direction`，按钮使用 `PopupV2Button`，关闭与按钮回调更新计数并写日志，源码参考：[PopupV2Demo.ets](entry/src/main/ets/pages/PopupV2Demo.ets)；
- ExceptionPrompt：`PromptOptions` 配置 `icon/tip/marginType/actionText/marginTop/isShown`，`onTipClick/onActionTextClick` 更新状态；显示/隐藏通过重建 options 控制，源码参考：[ExceptionPromptDemo.ets](entry/src/main/ets/pages/ExceptionPromptDemo.ets)；
- ExceptionPromptV2：使用 `@ComponentV2` + `@Local PromptOptionsV2`，通过 `new PromptOptionsV2({...})` 创建配置，其余交互同 V1，源码参考：[ExceptionPromptV2Demo.ets](entry/src/main/ets/pages/ExceptionPromptV2Demo.ets)；
- SelectionMenu：`EditorMenuOptions` 定义菜单图标与 `action`，`SelectionMenu({editorMenuOptions, controller})` 作为 `RichEditor.bindSelectionMenu` 的菜单构建器，`onSelect` 记录选区，源码参考：[SelectionMenuDemo.ets](entry/src/main/ets/pages/SelectionMenuDemo.ets)；
- 工具与适配：`PromptUtils` 负责计数/显示切换/选区钳制与摘要；`DeviceInfoUtils` 统一获取设备类型、屏幕尺寸、密度与方向；`BreakpointUtils` 负责 600/840vp 断点与 Grid 模板；`Logger` 统一生命周期、交互、错误与设备信息日志；首页展示设备信息并按断点 1/2/3 栏。

### 相关权限

不涉及。

### 依赖

不涉及。

### 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：RK3568、手机、平板、2in1；
2. 本示例基于 ArkTS 1.1 动态环境开发，已适配 API version 26 版本 SDK，版本号：26.0.0；
3. 本示例需要使用 DevEco Studio 26.0.0 及以上版本才可编译运行；
4. PopupV2、ExceptionPromptV2 为 API 26 新增组件；`ExceptionPromptV2` 在 SDK 26.0.0 中从 `@ohos.arkui.advanced.ExceptionPromptV2` 导入；
5. ExceptionPrompt 的 `marginTop` 已调整为 140vp，避免提示条与页面按钮重叠导致点击被拦截；
6. 本示例包含 28 条 ohosTest 用例，另有 2 条本地工具单测，用例说明见 [ohosTest.md](ohosTest.md)；

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/UI/AdvancedComponents/PopupsAndPrompts/ > .git/info/sparse-checkout
git remote add origin https://gitee.com/openharmony/applications_app_samples.git
git pull origin master
```