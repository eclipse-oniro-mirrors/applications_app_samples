# 一多天气

### 介绍

本示例展示一个天气应用界面，包括首页、城市管理、添加城市、更新时间弹窗，体现一次开发，多端部署的能力。

1.本示例参考[一次开发，多端部署](https://gitcode.com/openharmony/docs/tree/master/zh-cn/application-dev/key-features/multi-device-app-dev)的指导，主要使用响应式布局的栅格断点系统实现在不同尺寸窗口界面上不同的显示效果。

2.使用[SideBarContainer](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ts-container-sidebarcontainer.md)实现侧边栏功能。

3.使用[栅格容器组件](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ts-container-gridrow.md)实现界面内容的分割和展示。

4.使用Canvas和CanvasRenderingContext2D完成空气质量和日出月落图的曲线绘制。

### 效果预览

| 首页 | 城市管理 | 添加城市 |
|--------------------------------------|--------------------------------------|--------------------------------------|
|![home](./screenshots/devices/zh/home.png)|![city](./screenshots/devices/zh/city.png)|![add_city](./screenshots/devices/zh/add_city.png)|

使用说明：

1.启动应用后，首页展示已添加城市的天气信息，默认展示2个城市，左右滑动可以切换城市，在LG设备上，默认显示侧边栏，侧边栏显示时，右侧内容区占2/3，侧边栏隐藏时，内容区自动铺满界面。

2.在支持窗口自由拖拽的设备上，拖拽窗口大小，可以分别实现拖动到最大窗口侧边栏显示（点击侧边栏控制按钮可以隐藏和显示侧边栏），拖动窗口缩小到MD大小时侧边栏和侧边栏控制按钮隐藏。

3.在支持窗口自由拖拽的设备上，拖拽窗口大小，天气内容区跟随窗口大小会自动换行显示。

4.点击右上角菜单按钮，在菜单中点击**更新时间**，弹出更新时间弹窗，没有功能，此处只做展示，在平板设备上显示2列，在小屏设备上显示一列。

5.点击右上角菜单按钮，在菜单中点击**管理城市**，进入管理城市界面，展示已添加的城市，在平板设备上显示2列，在小屏设备上显示一列。

6.点击管理城市界面的**添加城市**，进入添加城市界面，已添加的城市不可点击，未添加的城市点击可以添加并返回管理城市界面显示。

### 工程目录
```
/Weather
├─common                                  // 公共 HAR 模块，供应用与测试共同引用
│  └─src/main/ets
│      ├─mock
│      │      CityInfo.ts                 // 城市列表模拟数据
│      │      Mock.ts                     // 天气数据模拟（测试冻结基线）
│      │      RequestData.ts              // 空气质量与生活指数请求数据
│      ├─model
│      │      BasicDataSource.ets         // LazyForEach 数据源
│      │      FormDate.ts                 // 日期格式化（fill / 月日）
│      │      Main.ts                     // 页面数据模型
│      │      MenuData.ts                 // 菜单数据
│      ├─util
│      │      Constants.ts                // 存储 key、断点与布局常量
│      │      Logger.ts                   // hilog 封装
│      │      Style.ts                    // 公共样式令牌
│      └─index.ets                        // HAR 入口，导出全部公共符号
└─product/default/src
    ├─main/ets
    │  ├─Application
    │  │      MyAbilityStage.ets          // 自定义 AbilityStage
    │  ├─common/images                    // 绘制曲线使用的图片
    │  ├─feature
    │  │      AirQualityFeature.ts        // 空气质量曲线绘制
    │  │      CanvasConstants.ts          // 画布尺寸、颜色与业务常量
    │  │      SunCanvasFeature.ts         // 日出日落曲线绘制
    │  ├─MainAbility
    │  │      MainAbility.ets             // 主窗口
    │  └─pages
    │      ├─AddCity.ets                  // 添加城市
    │      ├─CityList.ets                 // 城市列表
    │      ├─Home.ets                     // 入口
    │      └─home
    │          ├─AirQuality.ets           // 空气质量
    │          ├─HomeContent.ets          // 主页面
    │          ├─HoursWeather.ets         // 每小时天气组件
    │          ├─IndexEnd.ets             // 首页尾
    │          ├─IndexHeader.ets          // 首页头
    │          ├─IndexTitleBar.ets        // 首页标题
    │          ├─LifeIndex.ets            // 生活建议
    │          ├─MultidayWeather.ets      // 天气组件
    │          ├─SideContent.ets          // 侧边栏
    │          ├─SunCanvas.ets            // 日出日落组件
    │          └─UpdateTimeDialog.ets     // 时间更新弹窗
    └─ohosTest/ets
        ├─Application                     // 测试用 AbilityStage
        ├─test                            // 60 个套件 / 2445 条用例，注册表 List.test.ets
        ├─testability                     // 测试用 UIAbility 与页面
        ├─testrunner                      // OpenHarmonyTestRunner
        └─util                            // 测试辅助与 UI 探针工具
```

### 测试

- 测试工程：`product/default/src/ohosTest`（bundleName `ohos.samples.weather`，测试模块 `entry_test`，runner `OpenHarmonyTestRunner`）
- 规模：**60 个套件 / 2445 条用例**（14 个手写 L1 套件 + 41 个 `@volume` 生成套件 + 5 个 L2 UI 探针套件，编号前缀 `SUB_WEATHER_*`）
- 结果：2026-11-19 在真机（OpenHarmony 7.1.0.21 / API 26）执行 2445/2445 通过；该执行发生在 `FormDate.fill()` 修复、资源与常量整改和测试侧风格整改之后，受影响的 288 条断言已按新行为重算并在本轮全量回归中验证。

构建 ohosTest HAP（在 DevEco Studio 中执行 `Build > Build Hap(s)/APP(s) > Build Hap(s)` 并选择 module `default` 的 `ohosTest`，或执行 `devecocli build --modules default@ohosTest`，也可使用随工程提供的 `hvigorw` / `hvigorw.bat`；wrapper 首次运行会安装 hvigor，需可访问 npm 源）：

```shell
# Windows
hvigorw.bat --mode module -p module=default@ohosTest assembleHap --no-daemon
# Linux / macOS
./hvigorw --mode module -p module=default@ohosTest assembleHap --no-daemon
```

CLI 直出的 `default-ohosTest-unsigned.hap` 无法安装到真机（报 `code:9568320 error: no signature file`），需先签名：在 IDE 的 `File > Project Structure > Signing Configs` 中开启自动签名，或用 `toolchains/lib` 自带的 `OpenHarmony.p12`、`OpenHarmonyProfileRelease.pem` 配合 `hap-sign-tool.jar` 依次执行 `generate-app-cert` → `sign-profile` → `sign-app`，得到 `default-ohosTest-signed.hap` 后再安装。

安装并运行（不指定 `-s class` 时执行 `List.test.ets` 注册的全部套件；单次整跑触发 App died 时，按 [ohosTest.md](./ohosTest.md) 的 9 批清单分批执行）：

```shell
hdc install product/default/build/default/outputs/ohosTest/default-ohosTest-signed.hap
hdc shell aa test -b ohos.samples.weather -m entry_test -s unittest OpenHarmonyTestRunner -s timeout 60000
```

> UI 探针用例通过 `Driver.create()` 连接 AAMS，执行前需保证设备已解锁，且无系统弹窗（如“USB 连接方式”）或其它应用占据顶层窗口；出现 `Can not connect to AAMS, RET_ERR_CONNECTION_EXIST` 时重启设备后重跑即可。

用例矩阵、`@tc` 元数据与分批方案见 [ohosTest.md](./ohosTest.md)。

### 具体实现
1、Home.ets 中引入 SideContent() 和 HomeContent()。
2、定义 showSideBar 判断是否展示侧边栏，定义 mediaquery.MediaQueryListener 媒体监听器 smListener、mdListener、lgListener。
3、在 aboutToAppear 中调用 mediaquery 监听界面尺寸变化，[源码参考](product/default/src/main/ets/pages/Home.ets)。
4、监听到当前屏幕尺寸后，调用 this.isBreakpoint 断点方法对 curBp、showSideBar 赋值，[源码参考](product/default/src/main/ets/pages/Home.ets)。

### 相关权限

不涉及。

### 依赖

不涉及。

### 约束与限制

1.本示例仅支持标准系统上运行。

2.本示例已适配 API version 26 版本 SDK，`compileSdkVersion`、`compatibleSdkVersion` 均为 `"26.0.0"`（runtimeOS：OpenHarmony）。

3.本示例需要使用DevEco Studio 26及以上版本才可编译运行。

### 下载

如需单独下载本工程，执行如下命令：
```
git init
git config core.sparsecheckout true
echo code/SuperFeature/MultiDeviceAppDev/Weather/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```