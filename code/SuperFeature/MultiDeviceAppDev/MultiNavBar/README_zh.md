# 一多导航栏

### 介绍

本示例展示导航组件在不同设备形态与不同窗口尺寸下的响应式样式。示例使用[一次开发多端部署](https://gitcode.com/openharmony/docs/tree/master/zh-cn/application-dev/key-features/multi-device-app-dev)中介绍的自适应布局能力与响应式布局能力，由 GridRow 的断点事件驱动整体布局切换。

工程按完整示例组织，同时兼顾可运行与可教学：

- 在 sm 断点（窄屏）下，导航以 [Tabs](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ts-container-tabs.md) 形式显示在底部，内容与导航为上下布局，点击底部一级菜单切换内容，二级菜单横向排列在内容区顶部。
- 在 md/lg 断点（宽屏）下，导航以 [SideBarContainer](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ts-container-sidebarcontainer.md) 形式显示在左侧，内容与导航为左右布局，点击侧边栏一级菜单与二级菜单切换内容。
- 侧边栏自身有两种形态：list 形态较窄（md 64vp、lg 96vp），tabs 形态宽 240vp，可拖拽至 280vp，通过侧边栏左上角的抽屉图标切换。
- 内容区的 Banner 与应用列表随断点调整可见张数与栅格列数，改变窗口尺寸时浏览进度保持不变。

断点只分 sm、md、lg 三档：sm 走底部 Tabs 一套结构，md/lg 走侧边栏一套结构。两套结构常驻组件树，切换时只改变可见性，不做组件的销毁与重建。

### 效果预览

| 窄屏 sm：底部 Tabs                        | 宽屏 md：侧边栏 tabs 形态                  | 宽屏 lg：侧边栏 tabs 形态                  |
| ---------------------------------------- | ----------------------------------------- | ----------------------------------------- |
| ![sm](screenshots/devices/image1.png)     | ![md](screenshots/devices/image2.png)      | ![lg](screenshots/devices/image4.png)      |

| 宽屏 md：侧边栏 list 形态                  | 宽屏 lg：侧边栏 list 形态                  |
| ----------------------------------------- | ----------------------------------------- |
| ![md-list](screenshots/devices/image3.png) | ![lg-list](screenshots/devices/image5.png) |

日志打印

在日志中过滤 "Sample_MultiNavBar" 关键字，可以看到 UIAbility 生命周期与页面加载结果的日志打印，包括 `onCreate`、`onWindowStageCreate` 与 `loadContent` 的执行结果。

### 使用说明

1. 安装编译生成的 HAP 包并打开应用。
2. 在 DevEco Studio 中打开预览器查看初始效果，预览器可切换设备形态，也可在开启窗口拖拽后自由调整窗口宽度。
3. 把窗口拖到 sm 断点，界面切换为底部 Tabs 形态；拖回 md/lg 断点，界面切换为左侧侧边栏形态。
4. 在 md/lg 下点击侧边栏左上角的抽屉图标，在 tabs 形态与 list 形态之间切换；list 形态下点击搜索框同样会回到 tabs 形态。
5. 点击一级菜单切换主内容，点击二级菜单切换对应的子页面：md/lg 的 tabs 形态下二级菜单在侧边栏内，sm 与 list 形态下二级菜单横向排在内容区顶部。
6. 左右滑动 Banner 或上下滚动推荐列表后拖动窗口改变尺寸，内容区的浏览进度保持不变。

### 工程目录

```
├──entry/src/main
│  ├──ets
│  │  ├──common
│  │  │  ├──BreakpointSystem.ets         // 泛型取值器：按断点取样式、按侧边栏形态取样式
│  │  │  ├──CommonMainTabs.ets           // 一级 Tabs，承载主菜单内容
│  │  │  ├──CommonSubTabs.ets            // 二级 Tabs，承载二级菜单与推荐内容
│  │  │  ├──Configuration.ets            // 响应式样式表：设计稿数值与按断点取样式的方法
│  │  │  ├──Constants.ets                // 全局常量：断点 key、颜色、尺寸、时长、组件 id
│  │  │  ├──RecommendationList.ets       // 内容区：Banner 与应用/游戏列表
│  │  │  └──SideBarController.ets        // 侧边栏与底部导航：抽屉按钮、一级/二级菜单、搜索、工具条
│  │  ├──entryability
│  │  │  └──EntryAbility.ets             // 程序入口类
│  │  ├──model
│  │  │  ├──MenuType.ets                 // 菜单数据类型
│  │  │  ├──SideListData.ets             // 侧边栏一级与二级菜单数据
│  │  │  └──StyleType.ets                // 样式数据类
│  │  └──pages
│  │     └──Index.ets                    // 首页：断点分发与整体布局
│  └──resources                          // 字符串，颜色，尺寸与页面配置
└──entry/src/ohosTest                    // 自动化测试用例，详见 ohosTest.md
```

### 具体实现

**整体布局与断点分发**

整体布局在 [Index.ets](entry/src/main/ets/pages/Index.ets)。根节点是 GridRow，断点名经由 LocalStorage 共享给全部子组件，因此一次断点变化就能让侧边栏、内容区与样式表同时更新：

1. 在 `GridRow.onBreakpointChange` 中把回调得到的断点名写回 `currentBreakpoint`，取值 `sm`、`md`、`lg`。
2. md/lg 分支由 SideBarContainer 加 CommonMainTabs 组成，sm 分支由 CommonMainTabs 加底部 SideBarController 组成，两个分支都常驻组件树，用互补的 `visibility` 控制显隐。
3. 断点变化后延时 100ms 再以 300ms 动画更新侧边栏宽度，避免宽度变化与布局重排挤在同一帧里。
4. SideBarContainer 关闭了自带的控制按钮与自动隐藏（`showControlButton(false)`、`autoHide(false)`），抽屉按钮由 SideBarController 自绘，两套形态复用同一个按钮。

**断点取值封装**

[BreakpointSystem.ets](entry/src/main/ets/common/BreakpointSystem.ets) 用两个泛型取值器把「按断点取不同值」收敛成一行调用：

| 取值器 | 构造参数 | GetValue 入参 | 未知入参 |
| -------- | -------- | -------- | -------- |
| `BreakpointType<T>` | sm / md / lg 三档取值 | 断点 key | 返回 `undefined` |
| `SideBarMode<T>` | list / tabs 两档取值 | 侧边栏形态 key | 返回 `undefined` |

调用处以 `?? 原值` 兜底，取不到值时不改动上一帧的样式。例如抽屉按钮与侧边栏底部工具条只在 md/lg 出现：`new BreakpointType(false, true, true).GetValue(this.currentBreakpoint)`。

**侧边栏与底部导航**

[SideBarController.ets](entry/src/main/ets/common/SideBarController.ets) 同时承担 md/lg 的侧边栏与 sm 的底部导航，自上而下分三段：抽屉按钮、一级与二级菜单、底部工具条。一级与二级菜单整体包在 Scroll 中并以 `layoutWeight(1)` 占满剩余高度。

1. 一级菜单是 List：sm 下 `listDirection` 为横向，即底部导航条；md/lg 下为纵向。sm 与 list 形态下选中项切换为激活图标并以主色 `#0a59f7` 填充；tabs 形态下图标不做着色，选中态改由二级菜单项体现（浅主色背景加主色文字）。
2. 二级菜单的位置由 `getSubTabsControllerStyle` 的 `isShowSecondMenu` 与 `isShowPageTitle` 决定：tabs 形态下二级菜单挂在当前一级菜单内部、内容区顶部显示页面标题；sm 与 list 形态下二级菜单改为横向列表显示在内容区顶部。
3. list 形态下侧边栏宽度取断点值，md 为 64vp、lg 为 96vp，`minSideBarWidth` 与 `maxSideBarWidth` 同为当前宽度，因此不可拖拽；tabs 形态下宽度为 240vp，可在 240vp 至 280vp 之间拖拽。
4. list 形态下 md 的一级菜单只显示图标，lg 因宽度足够仍显示图标与文字；搜索框收窄至 40vp 且不可聚焦，点击后回到 tabs 形态；底部工具条收起为「更多」菜单。

**内容区**

[RecommendationList.ets](entry/src/main/ets/common/RecommendationList.ets) 由推荐 Banner 与应用、游戏列表组成，尺寸全部按断点取值：

1. Swiper 的 `displayCount` 在 sm、md、lg 下分别为 1、2、3 张，缓存 3 张、间距 8vp，指示器只在 sm 显示。
2. 推荐区使用 `GridRow({ columns: GridColumns.RECOMMEND })`，sm、md、lg 分别 4、8、12 列；横向应用列表的间距分别为 20vp、32vp、36vp。
3. 因为两套结构常驻、切换只改可见性，Swiper 与滚动容器的状态不会被重建，所以窗口尺寸变化后浏览进度保持不变。

**响应式样式表**

[Configuration.ets](entry/src/main/ets/common/Configuration.ets) 把设计稿数值集中到内部类 `DesignSpec`，再由四个静态方法按断点与侧边栏形态返回样式对象，组件内不再散落具体数值：

| 方法 | 作用 |
| -------- | -------- |
| `getBreakpointStyle(currentBreakpoint)` | 断点级样式：侧边栏列表高度、边距、项宽，内容区外边距，推荐区高度，背景色 |
| `getCurrentMainTabsStyle(index, currentIndex, currentBreakpoint)` | 一级菜单选中态与未选中态的配色 |
| `getSubTabsControllerStyle(currentBreakpoint, currentSideBarMode)` | 二级菜单容器：排列方向、对齐方式、是否显示页面标题与二级菜单、搜索与工具条内边距 |
| `getCurrentSubTabsStyle(currentBreakpoint, currentSideBarMode, index, currentIndex)` | 二级菜单项的字号、背景色与字体颜色 |

样式对象的字段声明在 [StyleType.ets](entry/src/main/ets/model/StyleType.ets)；颜色、尺寸、时长等常量以及组件 id（`switchButton`、`searchButton`、`addTools`、`moreTools` 等）集中在 [Constants.ets](entry/src/main/ets/common/Constants.ets)，UI 自动化用例按这些 id 定位控件。

### 相关权限

不涉及。

### 依赖

不涉及第三方依赖。

工程仅在 `devDependencies` 中引入 `@ohos/hypium 1.0.6`，用于 `entry/src/ohosTest` 下的自动化用例，不影响应用本身的运行时依赖。

### 约束与限制

1. 本示例仅支持在标准系统上运行。
2. 本示例支持的设备类型为 default 与 tablet。
3. 本示例为 Stage 模型，使用 API version 26.0.0 版本 SDK 编译，SDK 版本号为 26.0.0。
4. 本示例需要使用 DevEco Studio 26.0.0.851 及以上版本才可编译运行。
5. 断点只识别 sm、md、lg 三档；三档之外的取值不做处理，取值器返回 `undefined`，调用方保留上一帧的样式。
6. 侧边栏形态切换的入口只在 md/lg 提供，sm 断点固定为底部 Tabs 布局。
7. 侧边栏宽度、字号与边距为设计稿冻结数值，调整时需同步修改响应式样式表与自动化用例中的冻结期望。

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/SuperFeature/MultiDeviceAppDev/MultiNavBar/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
