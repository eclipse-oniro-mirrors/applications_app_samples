# 蓝牙基础Profile

中文 | [English](README.md)

### 介绍

本示例展示了如何在OpenHarmony上使用蓝牙基础Profile相关API，覆盖八种经典蓝牙Profile，并提供设备扫描、连接管理和Profile交互的完整界面：

1. **A2DP**（高级音频分发Profile）：音频流传输与播放控制。
2. **HFP**（免提Profile）：电话接听、挂断与音量控制。
3. **HID**（人机接口设备Profile）：输入设备连接与状态展示。
4. **PAN**（个人局域网Profile）：网络共享管理。
5. **PBAP**（电话簿访问Profile）：通讯录同步。
6. **MAP**（消息访问Profile）：消息列表查看。
7. **AVRCP**（音频/视频远程控制Profile）：媒体播放远程控制。
8. **HDP**（健康设备Profile）：健康数据展示。

此外，示例还提供了设备扫描、已配对设备、连接日志、Profile统计、组合场景和设置等辅助页面。

### 使用说明

1. 启动应用后，首页列出所有蓝牙Profile功能入口。
2. 点击某个Profile卡片（例如 **Audio (A2DP)**），进入对应的Profile页面。
3. 在各Profile页面中，通过连接按钮连接或断开设备，并使用对应的功能面板（媒体控制、通话控制、通讯录同步等）与Profile交互。
4. 点击 **Scan Devices** 搜索附近的蓝牙设备，或点击 **Bonded Devices** 查看已配对设备列表。
5. 点击 **Connection Log** 或 **Statistics** 查看连接历史记录和Profile使用统计。

### 工程目录

```
entry/src/main/ets/
|---entryability
|   |---EntryAbility.ets                    // 应用入口Ability
|---pages
|   |---Index.ets                           // 首页，包含所有Profile入口
|   |---A2dpPage.ets                        // A2DP音频Profile页面
|   |---HfpPage.ets                         // HFP免提Profile页面
|   |---HidPage.ets                         // HID输入设备页面
|   |---PanPage.ets                         // PAN网络共享页面
|   |---PbapPage.ets                        // PBAP电话簿页面
|   |---MapPage.ets                         // MAP消息页面
|   |---AvrcpPage.ets                       // AVRCP媒体控制页面
|   |---HdpPage.ets                         // HDP健康设备页面
|   |---BondedDevicesPage.ets               // 已配对设备列表页面
|   |---ConnectionLogPage.ets               // 连接历史记录页面
|   |---ProfileStatisticsPage.ets           // Profile使用统计页面
|   |---CombinedScenarioPage.ets            // 多Profile组合场景页面
|---components
|   |---AudioStreamControl.ets              // 音频流控制组件
|   |---CallControlPanel.ets                // 通话控制面板组件
|   |---MediaControlPanel.ets               // 媒体控制面板组件
|   |---BluetoothDeviceCard.ets             // 蓝牙设备卡片组件
|   |---ScanResultList.ets                  // 扫描结果列表组件
|   |---ProfileStatusIndicator.ets          // Profile状态指示组件
library/src/main/ets/
|---bluetooth
|   |---A2dpProfileManager.ts               // A2DP Profile管理器
|   |---HfpProfileManager.ts                // HFP Profile管理器
|   |---HidProfileManager.ts                // HID Profile管理器
|   |---PanProfileManager.ts                // PAN Profile管理器
|   |---PbapProfileManager.ts               // PBAP Profile管理器
|   |---MapProfileManager.ts                // MAP Profile管理器
|   |---AvrcpProfileManager.ts              // AVRCP Profile管理器
|   |---HdpProfileManager.ts                // HDP Profile管理器
|---service
|   |---BluetoothScanService.ts             // 蓝牙设备扫描服务
|   |---BluetoothConnectionManager.ts       // 蓝牙连接管理器
|   |---A2dpService.ts                      // A2DP服务（其余Profile服务类似）
|---model                                   // 各Profile数据模型
|---mock                                    // 演示用Mock数据生成器
|---constants                               // 蓝牙与页面常量
|---utils                                   // 基础、设备、网络与校验工具类
```

其中，`entry`模块实现UI页面与组件，`library`模块封装Profile管理器、服务、数据模型和工具类。每种Profile均遵循相同的分层设计：**Manager**（生命周期与连接管理）-> **Service**（Profile业务逻辑）-> **Model**（数据状态）。

### 相关权限

本示例使用Mock数据演示Profile功能，未声明任何权限。如需接入真实蓝牙硬件，请在`entry/src/main/module.json5`中声明以下权限：

| 权限名 | 权限说明 | 级别 |
| ---- | ---- | ---- |
| ohos.permission.USE_BLUETOOTH | 允许应用查看蓝牙的配置。 | normal |
| ohos.permission.DISCOVER_BLUETOOTH | 允许应用配置本地蓝牙，查找远端设备且与之配对连接。 | normal |
| ohos.permission.ACCESS_BLUETOOTH | 允许应用接入蓝牙并使用蓝牙能力，例如配对、连接外围设备等。 | normal |

### 依赖

无

### 测试

本示例基于Hypium框架提供了ohosTest测试套件，覆盖Profile管理器、服务、数据模型、工具类及集成场景。详见[ohosTest.md](ohosTest.md)。

### 约束与限制

1. 本示例仅支持标准系统上运行。
2. 本示例为Stage模型，SDK版本号：26.0.0（runtimeOS：OpenHarmony）。
3. 本示例需要使用DevEco Studio 26.0及以上版本编译运行。
4. 真实蓝牙Profile交互需要蓝牙硬件支持，示例内置Mock数据用于界面演示。

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/BasicFeature/Connectivity/BluetoothBaseProfile/ > .git/info/sparse-checkout
git remote add origin https://gitee.com/openharmony/applications_app_samples.git
git pull origin master
```
