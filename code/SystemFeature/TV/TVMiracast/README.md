# 投屏项目

### 介绍

投屏应用是一个面向 OpenHarmony 电视设备的 Miracast 示例工程，覆盖以下核心能力：

- 无线投屏（Miracast）设备的发现、连接、断开与状态管理；
- 投屏会话控制：播放、暂停、停止、静音、取消静音和画面尺寸设置；
- 可信设备管理：设备信任、重命名与信任列表维护；
- 遥控器按键与焦点交互、权限申请弹窗、投屏设置项管理；
- 投屏服务（ServiceExtensionAbility）与静态订阅者等系统能力集成。

应用入口为 `product/tv/src/main/ets/tvability/TvAbility.ets`，主页面为
`product/tv/src/main/ets/pages/Index.ets`，投屏服务实现在
`product/tv/src/main/ets/serviceextability/` 目录。

使用说明：

1. 安装并启动应用，按提示授予相关系统权限。
2. 在首页选择投屏开关，等待可投屏设备列表刷新。
3. 选择目标设备发起投屏，进入播放页面后可进行暂停、静音、停止等操作。
4. 在设置页可修改本机名称，并管理可信设备列表。

### 截图预览

> 说明：真机截图待补充，请将截图放置于 `screenshots/` 目录后，将下方占位替换为实际图片。

<!--
![](./screenshots/screenshot_1.png)
![](./screenshots/screenshot_2.png)
-->

### 工程目录

```text
common/library/src/main/ets/
|---utils
|   |---ConfigData.ets                   // 常量与配置数据
|   |---Log.ets                          // 日志工具
|   |---PermissionPanelSizeUtils.ets     // 权限面板尺寸计算
|   |---TrustDeviceManager.ets           // 可信设备管理

product/tv/src/main/ets/
|---components
|   |---PermissionChoosePage.ets         // 权限选择弹窗
|   |---ProjectionScreenView.ets         // 投屏画面组件
|   |---SettingView.ets                  // 设置视图
|---entrybackupability
|   |---EntryBackupAbility.ets           // 备份扩展 Ability
|---pages
|   |---Index.ets                        // 首页
|   |---ChangeNamePage.ets               // 修改设备名称页面
|   |---PlayerPage.ets                   // 投屏播放页面
|   |---TrustDeviceListPage.ets          // 可信设备列表页面
|---serviceextability
|   |---ServiceExtTvAbility.ets          // 投屏服务扩展 Ability
|   |---MiracastPlayerServiceClient.ets  // 服务客户端
|   |---MiracastPlayerServiceImpl.ets    // 服务实现
|   |---DeviceConnectListener.ets        // 设备连接监听
|   |---idl                              // IPC 接口定义与 Stub/Proxy
|---staticsubscriber
|   |---StaticSubscriber.ets             // 静态订阅者
|---tvability
|   |---TvAbility.ets                    // 主入口 Ability
|---utils
|   |---PermissionWindowManager.ets      // 权限窗口管理

product/tv/src/ohosTest/ets/test/        // Hypium 自动化测试用例
```

### 具体实现

- 投屏服务能力封装在 [MiracastPlayerServiceImpl.ets](product/tv/src/main/ets/serviceextability/MiracastPlayerServiceImpl.ets)，
  通过 IPC 向客户端提供开始/停止投屏、播放、暂停、静音、设置画面等接口。
- 客户端调用封装在 [MiracastPlayerServiceClient.ets](product/tv/src/main/ets/serviceextability/MiracastPlayerServiceClient.ets)，
  负责连接 `ServiceExtTvAbility` 并转发控制指令。
- 设备连接回调由 [DeviceConnectListener.ets](product/tv/src/main/ets/serviceextability/DeviceConnectListener.ets)
  统一分发，并在 [Index.ets](product/tv/src/main/ets/pages/Index.ets) 中驱动页面状态刷新。
- 可信设备信息持久化与校验逻辑位于
  [TrustDeviceManager.ets](common/library/src/main/ets/utils/TrustDeviceManager.ets)。
- 设备名称修改与可信设备列表分别由
  [ChangeNamePage.ets](product/tv/src/main/ets/pages/ChangeNamePage.ets) 和
  [TrustDeviceListPage.ets](product/tv/src/main/ets/pages/TrustDeviceListPage.ets) 实现。

### 相关权限

| 权限名 | 权限说明 | 级别 |
|----------------------------------------------|------------------------------|--------------|
| ohos.permission.MANAGE_SECURE_SETTINGS        | 允许修改安全设置                     | system_basic |
| ohos.permission.ACCESS_CAST_ENGINE_MIRROR     | 允许使用镜像投屏能力                   | system_basic |
| ohos.permission.ACCESS_CAST_ENGINE_STREAM     | 允许使用媒体流投屏能力                  | system_basic |
| ohos.permission.RECEIVER_STARTUP_COMPLETED    | 允许接收开机完成广播                   | system_basic |
| ohos.permission.START_ABILITIES_FROM_BACKGROUND | 允许后台拉起 Ability              | system_basic |

### 依赖

- OpenHarmony API（AbilityKit/ArkUI/IPCKit/BasicServicesKit/PerformanceAnalysisKit 等）
- 测试框架：Hypium（`product/tv/src/ohosTest`）

### 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：TV。
2. 本示例为 Stage 模型，支持 API 18 版本 SDK。
3. 本示例需要使用 DevEco Studio 5.0 Release 及以上版本才可编译运行。
4. 本示例涉及 `system_basic` 级权限，需要配置高等级应用签名，可参考
   [特殊权限配置方法](https://gitcode.com/openharmony/docs/blob/master/zh-cn/device-dev/subsystems/subsys-app-privilege-config-guide.md)。

### 签名说明

本工程默认不提交签名文件。`sign/` 与 `signature/` 目录仅用于本地调试签名，
已在 `.gitignore` 中忽略，请勿提交到代码仓库。若应用功能强依赖特定签名，
请在提交说明中单独注明原因并仅提交必要的签名描述文件。

### 下载

如需单独下载本工程，执行如下命令：

```bash
git init
git config core.sparsecheckout true
echo code/SystemFeature/TV/TVMiracast/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
