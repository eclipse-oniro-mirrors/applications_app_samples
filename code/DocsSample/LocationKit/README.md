# LocationKit

## 介绍

本示例演示了OpenHarmony位置服务(Location Kit)的应用，基于`@kit.LocationKit`提供的`@ohos.geoLocationManager` ArkTS接口与位置服务C API实现以下功能：

- **位置获取**:
  查询位置开关状态、获取最近一次缓存位置、单次获取当前位置、订阅与取消订阅持续位置变化，对应指导[获取设备的位置信息开发指导(ArkTS)](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/device/location/location-guidelines.md).
- **地理编码**:
  查询地理编码服务可用性，逆地理编码（坐标转地址）与正地理编码（地址转坐标），对应指导[正地理编码与逆地理编码开发指导](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/device/location/geocode-guidelines.md).
- **地理围栏**:
  创建圆形GNSS地理围栏，订阅进入/退出围栏事件并接收系统通知，支持删除围栏，对应指导[基于设备自身定位的地理围栏开发指导](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/device/location/geofence-guidelines.md).
- **定位C API**:
  在Native侧通过位置服务C接口查询位置开关、订阅与取消订阅位置变化，定位结果回传ArkTS界面展示，对应指导[获取设备的位置信息开发指导(C/C++)](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/device/location/location-guidelines-capi.md).

本示例为指南代码同源工程，页面代码中通过`[Start xxx]`/`[End xxx]`注释锚点与上述指导文档中的示例代码一一对应.

## 效果预览

截图待补充（screenshot目录）.

### 使用说明

1. 启动应用后会弹出位置权限申请，请允许后体验各功能.
2. 点击**位置获取**查询位置开关状态，获取缓存位置或当前位置，以及开始/结束持续定位.
3. 点击**地理编码**查询服务可用性，输入坐标转换为地址描述，或输入地址描述转换为坐标（需设备联网）.
4. 点击**地理围栏**设置围栏圆心与半径后添加围栏，设备进出围栏时页面显示事件并收到系统通知（需室外开阔环境）.
5. 点击**定位C API**通过Native侧接口查询开关状态并订阅位置变化，结果实时回传界面展示.

## 工程目录

```
entry/src/main/
├── cpp/                              // Native侧代码(C API定位)
│   ├── CMakeLists.txt                // 构建脚本, 链接位置服务Native动态库
│   ├── napi_init.cpp                 // NAPI接口实现(开关查询/订阅/取消订阅定位)
│   └── types/libentry/
│       ├── index.d.ts                // NAPI接口声明
│       └── oh-package.json5
├── ets/
│   ├── entryability/
│   │   └── EntryAbility.ets          // Ability入口, 申请位置权限
│   ├── entrybackupability/
│   │   └── EntryBackupAbility.ets    // 备份恢复入口
│   ├── pages/
│   │   └── Index.ets                 // 入口页面, Navigation容器
│   └── location/                     // 场景业务目录
│       ├── pages/
│       │   ├── MainPage.ets          // 主页, 功能模块导航
│       │   ├── LocationPage.ets      // 位置获取页面
│       │   ├── GeocodePage.ets       // 地理编码页面
│       │   ├── GeofencePage.ets      // 地理围栏页面
│       │   └── LocationCapiPage.ets  // 定位C API页面
│       └── components/
│           └── CommonComponents.ets  // 通用UI组件(NavBar, SectionCard等)
└── resources/                        // 应用资源(字符串, 颜色, 图片)

entry/src/ohosTest/ets/test/          // UI自动化测试用例
├── List.test.ets                     // 测试套件入口
├── Ability.test.ets                  // 应用启动测试
├── MainPageNavigation.test.ets       // 页面导航测试
└── ...                               // 各功能页面UI验证测试
```

## 具体实现

- **位置获取**: LocationPage调用`geoLocationManager.isLocationEnabled()`查询开关状态；`getLastLocation()`获取系统缓存位置；`getCurrentLocation(request)`以快速定位策略单次定位；`on('locationChange', request, callback)`与`off('locationChange', callback)`订阅和取消订阅持续位置变化，回调中刷新界面经纬度与精度.源码参考[LocationPage.ets](entry/src/main/ets/location/pages/LocationPage.ets).
- **地理编码**: GeocodePage调用`isGeocoderAvailable()`查询服务可用性；`getAddressesFromLocation()`将输入坐标转换为地址描述；`getAddressesFromLocationName()`将输入地址描述转换为坐标，结果列表在页面展示.源码参考[GeocodePage.ets](entry/src/main/ets/location/pages/GeocodePage.ets).
- **地理围栏**: GeofencePage构造`Geofence`与`GnssGeofenceRequest`（含进入/退出事件监听与对应通知对象），调用`addGnssGeofence()`添加围栏并记录围栏ID，`removeGnssGeofence()`删除围栏，围栏事件通过回调展示在页面.源码参考[GeofencePage.ets](entry/src/main/ets/location/pages/GeofencePage.ets).
- **定位C API**: napi_init.cpp中通过`OH_Location_IsLocatingEnabled()`查询开关，`OH_Location_StartLocating()`/`OH_Location_StopLocating()`订阅和取消订阅位置变化；位置回调通过NAPI线程安全函数将结果回传，LocationCapiPage解析后展示.源码参考[napi_init.cpp](entry/src/main/cpp/napi_init.cpp)与[LocationCapiPage.ets](entry/src/main/ets/location/pages/LocationCapiPage.ets).

## 相关权限

[ohos.permission.LOCATION](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/security/AccessToken/permissions-for-all-user.md#ohospermissionlocation)

[ohos.permission.APPROXIMATELY_LOCATION](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/security/AccessToken/permissions-for-all-user.md#ohospermissionapproximately_location)

## 依赖

不涉及.

## 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：RK3568.

2. 本示例为Stage模型，支持API 26版本SDK.

3. 本示例需要使用DevEco Studio NEXT Developer Preview2及以上版本才可编译运行.

4. 地理编码功能需要设备联网；地理围栏功能依赖GNSS芯片，仅在室外开阔区域才能准确识别进出围栏事件.

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/LocationKit/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
