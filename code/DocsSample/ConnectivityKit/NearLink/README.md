# NearLink

## 介绍

本示例演示了OpenHarmony星闪(NearLink)技术的应用，基于`@ohos.nearlink`系列API实现以下功能：

- **Manager**:
  查询星闪状态，设备支持，本地名称和已配对设备，对应包[@ohos.nearlink.manager](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-nearlink-manager)。
- **Advertising**:
  启动/停止星闪广播，支持自定义厂商数据和服务数据，对应包[@ohos.nearlink.advertising](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-nearlink-advertising)。
- **Scan**:
  设备发现，支持按名称，地址过滤和全量扫描，对应包[@ohos.nearlink.scan](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-nearlink-scan)。
- **SSAP Server**:
  创建SSAP服务端，添加服务和属性，支持读，写，通知操作，对应包[@ohos.nearlink.ssap](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-nearlink-ssap)。
- **SSAP Client**:
  创建SSAP客户端，扫描并连接服务端，执行读，写，通知订阅，对应包[@ohos.nearlink.ssap](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-nearlink-ssap)。
- **DataTransfer**:
  基于端口的数据传输，支持创建/销毁端口，连接/断开，收发数据，对应包[@ohos.nearlink.dataTransfer](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-nearlink-data-transfer-api)。
- **CDSM**:
  合作设备集管理，查询设备组成员信息，对应包[@ohos.nearlink.cdsm](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-nearlink-cdsm)。

## 效果预览

| 主页                                                | Manager                                         | SSAP Client                                         | CDSM                                         |
|---------------------------------------------------|-------------------------------------------------|-----------------------------------------------------|----------------------------------------------|
| <img src="screenshots/main_page.png" width="200"> | <img src="screenshots/manager.png" width="200"> | <img src="screenshots/ssap_client.png" width="200"> | <img src="screenshots/cdsm.png" width="200"> |

### 使用说明

1. 启动应用后，主页展示所有功能模块入口。
2. 点击**Manager**查看当前设备星闪状态和支持情况。
3. 点击**Advertising**启动广播，可自定义广播参数。
4. 点击**Scan**扫描附近星闪设备，支持按名称或地址过滤。
5. 点击**SSAP Server**创建服务端并启动广播，等待客户端连接后可发送属性通知。
6. 点击**SSAP Client**扫描服务端设备，连接后可执行读，写和通知订阅操作。
7. 点击**DataTransfer**创建数据端口，扫描并连接对端设备后可收发数据。
8. 点击**CDSM**查询已配对设备的合作设备集信息。

## 工程目录

```
entry/src/main/ets/
├── entryability/
│   └── EntryAbility.ets              // Ability入口
├── entrybackupability/
│   └── EntryBackupAbility.ets        // 备份恢复入口
├── pages/
│   └── Index.ets                     // 入口页面, Navigation容器
├── nearlink/                         // 场景业务目录
│   ├── pages/
│   │   ├── MainPage.ets              // 主页, 功能模块导航
│   │   ├── ManagerPage.ets           // 星闪管理页面
│   │   ├── AdvertisingPage.ets       // 广播功能页面
│   │   ├── ScanConfigPage.ets        // 扫描配置页面
│   │   ├── SsapServerPage.ets        // SSAP服务端页面
│   │   ├── SsapClientPage.ets        // SSAP客户端页面
│   │   ├── DataTransferPage.ets      // 数据传输页面
│   │   └── CdsmPage.ets             // CDSM管理页面
│   └── components/
│       └── CommonComponents.ets      // 通用UI组件(NavBar, SectionCard等)

Library/src/main/ets/
└── nearlink/                         // 特性封装目录
    ├── feature/
    │   └── NearLinkConstants.ets     // 特性常量(UUID, ManufacturerID等)
    └── NearLinkFeature.ets           // 特性接口封装(Manager/Advertising/Scan)

entry/src/ohosTest/ets/test/          // UI自动化测试用例
├── List.test.ets                     // 测试套件入口
├── Ability.test.ets                  // 应用启动测试
├── MainPageNavigation.test.ets       // 页面导航测试
└── ...                               // 各功能页面UI验证测试
```

## 具体实现

Library模块封装了NearLink特性通用接口，entry模块展示具体使用方式：

- **星闪管理**: entry中ManagerPage直接调用`manager.getState()`、`manager.isNearLinkSupported()`、`manager.onStateChange`等接口查询设备信息并监听状态变化；Library中`NearLinkFeature`封装了`getLocalName()`、`getPairedDevices()`供页面复用。
- **广播**: Library中`NearLinkFeature.buildAdvertisingParams()`封装广播参数构建；entry中AdvertisingPage(含自定义服务数据)和SsapServerPage调用该接口生成参数，并通过
  `advertising.startAdvertising/stopAdvertising`控制广播。
- **扫描**: Library中`NearLinkFeature.buildManufacturerFilter()`封装过滤条件构建；entry中ScanConfigPage调用
  `scan.startScan/stopScan`按名称，地址过滤，SsapClientPage和DataTransferPage通过该接口按`manufacturerId`过滤特定设备。
- **SSAP协议**: entry中SsapServerPage创建`Server`实例，添加`Service`和`Property`，注册连接状态，读写请求和MTU变化回调；SsapClientPage创建
  `Client`实例，连接后执行`readProperty`，`writeProperty`和`setPropertyNotification`。
- **数据传输**: entry中DataTransferPage通过`createPort/destroyPort`管理端口，使用`connect/disconnect`建立连接，通过
  `writeData`发送数据，通过`onReadData`回调接收数据。
- **CDSM**: entry中CdsmPage通过`createCdsmClient`创建客户端，调用`getCdsmInfo`查询设备集信息，使用`onCdsmInfoChange`监听变化。

## 相关权限

- [ohos.permission.ACCESS_NEARLINK](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/permissions-for-all-user#ohospermissionaccess_nearlink):
  用于接入星闪并使用星闪能力。

## 依赖

无外部依赖。

## 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：搭载星闪硬件的OpenHarmony设备。
2. 本示例为Stage模型，支持API version 26。SDK版本号：26.0.0。
3. 本示例需要使用DevEco Studio NEXT (Build Version: 5.0.5.200及以上)才可编译运行。
4. 本应用使用`ohos.permission.ACCESS_NEARLINK`权限，该权限为normal级别、user_grant授权方式，应用运行时向用户申请授权即可，无需配置ACL。

## 下载

如需单独下载本工程，执行如下命令：

```bash
git init
git config core.sparsecheckout true
echo code/DocsSample/ConnectivityKit/NearLink/ > .git/info/sparse-checkout
git remote add origin https://gitee.com/openharmony/applications_app_samples.git
git pull origin master
```
