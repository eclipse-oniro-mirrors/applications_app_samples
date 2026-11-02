# 进度与指示器（ProgressAndIndicator）

### 介绍

本示例基于 API 26，演示 ArkUI 的进度、弧形滑块与导航指示器组件：

- [ArcSlider](https://docs.openharmony.cn/pages/v6.0/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-arkui-advanced-ArcSlider.md)：API 18 起的弧形滑动条，面向圆形穿戴屏幕，支持值区间、样式、反向滑动、左右位置及 `onChange/onEnlarge` 回调；
- [ProgressButton](https://docs.openharmony.cn/pages/v6.0/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-arkui-advanced-ProgressButton.md)：文本下载按钮，可在按钮内显示 0~100 的下载进度；
- [ProgressButtonV2](https://docs.openharmony.cn/pages/v6.0/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-arkui-advanced-ProgressButtonV2.md)：API 18 起、基于状态管理 V2 的下载按钮，参数通过 `@Param` 传入；
- Indicator：导航点组件，提供圆点（`DotIndicator`）与数字（`DigitIndicator`）两种样式，支持 `count/initialIndex/loop/vertical/onChange` 与 `IndicatorComponentController`。

工程包含进度/区间/指示器工具类、设备信息与响应式断点工具类，包含 97 条 ohosTest 用例与 4 条本地工具单测。

### 功能特性

- ArcSlider：弧形滑动、值区间、样色/粗细、反向与位置、触摸/放大回调、横屏高度适配；
- ProgressButton/ProgressButtonV2：下载进度、开始/重置/启用禁用、定时器与状态机；
- Indicator：圆点/数字样式、索引切换、上一页/下一页/跳转、样式切换；
- 工具类：进度钳制/步进/状态/百分比、下载会话与控制器、指示器索引；
- 响应式布局：最大内容宽度、断点边距、Scroll 顶部对齐；
- 可视化反馈：Progress/State/Actions 统计卡、下载历史与清空。

### 交互说明

| 页面 | 主要操作 | 反馈 |
|---|---|---|
| ArcSlider | 按钮调整、重置、设定 80 | 进度、事件、放大状态更新 |
| ProgressButton/V2 | 开始、重置、启用/禁用 | 进度条、状态、统计与历史同步 |
| Indicator | 上/下页、跳转、圆点/数字 | 页面内容、索引与状态文本更新 |

### 实现架构

```text
页面 -> DownloadController/DownloadSession
     -> ProgressUtils、ProgressConstants
     -> BreakpointUtils、DeviceInfoUtils、Logger
```

### 测试覆盖

| 类型 | 数量 | 说明 |
|---|---:|---|
| ohosTest | 97 | 入口、ArcSlider、ProgressButton/V2、Indicator、边界、稳定性、逻辑 |
| 本地单测 | 4 | 进度、下载状态、指示器、断点 |

### 效果预览

| 首页 | ProgressButton |
|:---:|:---:|
| <img src="screenshots/index.jpeg" width="360" /> | <img src="screenshots/progressButton.jpeg" width="360" /> |

> 截图基于 OpenHarmony 7.0.0.47 真机（API 26）拍摄。

### 工程目录

```
entry/src/main/ets/
|---entryability
|   |---EntryAbility.ets                   // 应用入口
|---pages
|   |---Index.ets                          // 首页：入口、断点与设备信息
|   |---ArcSliderDemo.ets                  // ArcSlider 弧形滑动条（状态管理 V2）
|   |---ProgressButtonDemo.ets             // ProgressButton 下载进度
|   |---ProgressButtonV2Demo.ets           // ProgressButtonV2 下载进度（状态管理 V2）
|   |---IndicatorDemo.ets                  // Indicator 圆点/数字导航
|---utils
|   |---Constants.ts                       // 路由、进度与断点常量
|   |---BreakpointUtils.ts                 // 断点/栏数/Grid 模板
|   |---ProgressUtils.ts                   // 进度钳制/状态/百分比/指示器索引
|   |---DownloadController.ts              // 下载会话状态机、定时器与日志
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

- ArcSlider：`ArcSliderOptions` 组合 `ArcSliderValueOptions`（40/0/100）、`ArcSliderLayoutOptions`（反向、右侧）与 `ArcSliderStyleOptions`（轨道/高亮色、粗细、模糊），`onChange/onEnlarge` 更新状态并写日志；外部按钮通过 `ProgressUtils.step/clamp` 重建 options，源码参考：[ArcSliderDemo.ets](entry/src/main/ets/pages/ArcSliderDemo.ets)；
- ProgressButton：`progress` 绑定状态，`clickCallback` 通过 `DownloadController` 启动下载；控制器内部使用 `DownloadSession` 状态机与定时器，每 120ms 递增 10，完成/重置/停止时回调页面并清理定时器，源码参考：[ProgressButtonDemo.ets](entry/src/main/ets/pages/ProgressButtonDemo.ets)；
- ProgressButtonV2：使用 `@ComponentV2` + `@Local`，`ProgressButtonV2Color`/`ColorMetrics` 配置颜色，`LengthMetrics.vp` 配置宽度与圆角，复用 `DownloadController` 管理下载状态与定时器，源码参考：[ProgressButtonV2Demo.ets](entry/src/main/ets/pages/ProgressButtonV2Demo.ets)；
- Indicator：`IndicatorComponent(controller)` 配置 `count/initialIndex/loop/vertical/style`，`onChange` 更新当前页；`DotIndicator`/`DigitIndicator` 分别配置圆点尺寸与数字字体，按钮调用 `showPrevious/showNext/changeIndex`，源码参考：[IndicatorDemo.ets](entry/src/main/ets/pages/IndicatorDemo.ets)；
- 工具与适配：`ProgressUtils` 负责进度钳制/步进/百分比/状态与指示器索引；`DownloadController/DownloadSession` 统一下载状态机、定时器与完成/重置/停止日志，V1/V2 共用；`DeviceInfoUtils` 获取设备与屏幕信息；`BreakpointUtils` 负责 600/840vp 断点；`Logger` 统一生命周期、交互、触摸、下载进度与错误日志；页面使用 `Scroll` 适配横屏、平板与 2in1，ArcSlider 高度随窗口高度在 220/300vp 间调整。

### 相关权限

不涉及。

### 依赖

不涉及。

### 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：RK3568、手机、平板、2in1；
2. 本示例基于 ArkTS 1.1 动态环境开发，已适配 API version 26 版本 SDK，版本号：26.0.0；
3. 本示例需要使用 DevEco Studio 26.0.0 及以上版本才可编译运行；
4. ArcSlider 面向圆形穿戴屏幕设计，在手机/平板上以限定区域展示；ProgressButton 自 API 10 起可用，ProgressButtonV2 自 API 18 起可用，IndicatorComponent 自 API 15 起可用；
5. 本示例包含 97 条 ohosTest 用例，另有 4 条本地工具单测，用例说明见 [ohosTest.md](ohosTest.md)；
6. 工程使用 DevEco Studio 自动生成的调试签名，可直接部署；提交仓库前建议将 `signingConfigs` 置空，由使用者在 IDE 中重新自动签名；

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/UI/AdvancedComponents/ProgressAndIndicator/ > .git/info/sparse-checkout
git remote add origin https://gitee.com/openharmony/applications_app_samples.git
git pull origin master
```