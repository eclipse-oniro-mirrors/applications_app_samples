# 选择器（Pickers）

### 介绍

本示例基于 API 26，演示 ArkUI 的日期、日历与滚轮选择器组件：

- [CalendarPicker](https://docs.openharmony.cn/pages/v6.0/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ts-basic-components-calendarpicker.md)：下拉日历弹窗，支持 `selected/start/end`、`edgeAlign`、`markToday`、`onChange`；
- [DatePickerComponent](https://docs.openharmony.cn/pages/v6.0/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-arkui-advanced-DatePickerComponent.md)：API 26 新增高级组件，支持日期（DATE）、时间（TIME）、日期时间（DATE_TIME）三种 `displayMode`，以及 `onChange/onScrollStop` 回调；
- [UIPickerComponent](https://docs.openharmony.cn/pages/v6.0/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ts-container-ui-picker-component.md)：API 22 起的立体滚轮单选容器，支持 `selectedIndex`、`onChange`、`onScrollStop`。

工程包含日志、日期时间/区间格式化、设备信息、响应式断点等工具类，并包含 93 条 ohosTest 用例与 3 条本地工具单测。

### 功能特性

- CalendarPicker：下拉日历、起止日期限制、今天快捷选择、选中日期与事件历史；
- DatePickerComponent：DATE/TIME/DATE_TIME 三种模式，Lunar、Loop、24 小时制、秒显示；
- UIPickerComponent：滚轮单选、上一项/下一项、循环开关、onChange/onScrollStop 回调；
- 日期工具：`formatDate/formatDateParts/formatTimeParts`、范围判断与日期钳制；
- 响应式布局：内容最大宽度、断点边距、顶部对齐与横向/矮窗口滚动；
- 可视化反馈：Selected/Events/Range 统计卡、最近事件面板与清空。

### 交互说明

| 页面 | 主要操作 | 反馈 |
|---|---|---|
| CalendarPicker | 选择日期、点击今天 | 选中文本、事件、统计与历史更新 |
| DatePicker | 切换模式/高级参数 | 选择器与结果文本同步刷新 |
| UIPicker | 上/下切换、滚动、Loop | 选中项、回调与边界钳制生效 |

### 实现架构

```text
页面 -> PickerUtils（格式化/范围/钳制）
     -> PickerConstants、BreakpointUtils
     -> Logger
```

### 测试覆盖

| 类型 | 数量 | 说明 |
|---|---:|---|
| ohosTest | 93 | 入口、Calendar、DatePicker 三模式、UIPicker、边界、稳定性、逻辑 |
| 本地单测 | 3 | 日期时间、范围、断点 |

### 效果预览

| 首页 | CalendarPicker |
|:---:|:---:|
| <img src="screenshots/index.jpeg" width="360" /> | <img src="screenshots/calendar.jpeg" width="360" /> |

> 截图基于 OpenHarmony 7.0.0.47 真机（API 26）拍摄。

### 工程目录

```
entry/src/main/ets/
|---entryability
|   |---EntryAbility.ets                   // 应用入口
|---pages
|   |---Index.ets                          // 首页：入口、断点与设备信息
|   |---CalendarPickerDemo.ets             // CalendarPicker 示例
|   |---DatePickerDemo.ets                 // DatePickerComponent 三种模式
|   |---UIPickerDemo.ets                   // UIPickerComponent 滚轮选择
|---utils
|   |---Constants.ts                       // 路由、范围与断点常量
|   |---BreakpointUtils.ts                 // 断点/栏数/Grid 模板
|   |---PickerUtils.ts                     // 日期时间/区间格式化、范围与索引钳制
|   |---DeviceInfoUtils.ts                 // 设备类型/屏幕/方向信息
|---util
|   |---Logger.ts                          // 统一日志
entry/src/ohosTest/ets/
|---testkit/SharedDriver.ets               // 测试驱动与断言封装
|---test/*.test.ets                        // 功能、稳定性与逻辑单测
entry/src/test/
|---UtilsUnit.test.ets                    // 工具类本地单元测试
```

### 具体实现

- CalendarPicker：配置 `hintRadius/selected/start/end`，使用 `edgeAlign(CalendarAlign.END)`、`markToday(true)`，`selected/start/end` 复用 `PickerConstants`，`onChange` 通过 `PickerUtils.clampDate` 限制范围并写日志，源码参考：[CalendarPickerDemo.ets](entry/src/main/ets/pages/CalendarPickerDemo.ets)；
- DatePickerComponent：按 `displayMode` 切换 DATE/TIME/DATE_TIME，`dateOptions` 配置 `DateMode.DATE`、起止日期与回调，`timeOptions` 配置 `TimeFormat` 与 `useMilitaryTime`；配置摘要由 `PickerUtils.describeConfig` 统一生成，源码参考：[DatePickerDemo.ets](entry/src/main/ets/pages/DatePickerDemo.ets)；
- UIPickerComponent：`UIPickerComponent({ selectedIndex }) { ForEach(Text...) }` 构建滚轮选项，`onChange/onScrollStop` 记录索引变化，按钮通过 `PickerUtils.clampIndex` 更新选中项，源码参考：[UIPickerDemo.ets](entry/src/main/ets/pages/UIPickerDemo.ets)；
- 工具封装：`PickerUtils` 负责日期/时间/区间格式化、范围判断与钳制、索引边界、配置摘要；`DeviceInfoUtils` 统一获取设备类型、屏幕尺寸、密度与方向；`BreakpointUtils` 负责 600/840vp 断点与 Grid 模板；`Logger` 统一生命周期、交互、错误与设备信息日志；
- 设备适配：首页按断点 1/2/3 栏并展示设备信息；三个示例页均使用 `Scroll` 承载内容，支持手机横屏、平板与 2in1 等不同高度形态；选择器组件自身按系统尺寸渲染。

### 相关权限

不涉及。

### 依赖

不涉及。

### 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：RK3568、手机、平板、2in1；
2. 本示例基于 ArkTS 1.1 动态环境开发，已适配 API version 26 版本 SDK，版本号：26.0.0；
3. 本示例需要使用 DevEco Studio 26.0.0 及以上版本才可编译运行；
4. UIPickerComponent 自 API 22 起可用，DatePickerComponent 为 API 26 新增高级组件；
5. 本示例包含 93 条 ohosTest 用例，另有 3 条本地工具单测，用例说明见 [ohosTest.md](ohosTest.md)；

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/UI/AdvancedComponents/Pickers/ > .git/info/sparse-checkout
git remote add origin https://gitee.com/openharmony/applications_app_samples.git
git pull origin master
```