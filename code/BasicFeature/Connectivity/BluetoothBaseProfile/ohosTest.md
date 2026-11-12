# 蓝牙基础Profile测试用例归档

## 验证范围

本示例基于 Hypium（1.0.25）框架对八种蓝牙 Profile（A2DP、HFP、HID、PAN、PBAP、MAP、AVRCP、HDP）进行运行时自动化验证，覆盖 Profile 管理器、Profile 服务、数据模型、设备与存储工具、网络与安全工具、全局常量、校验工具以及多 Profile 集成与异常处理场景。业务层使用 Mock 数据，不依赖真实蓝牙硬件，不直接断言真实蓝牙协议交互。

用例不共享可变全局状态：每个用例自行完成初始化、执行被测动作并断言结果，涉及全局静态缓存（Preferences、内存缓存、网络状态、权限集合、拦截器）的用例在起始与结束时复位，保证用例之间相互独立、可任意顺序执行。

随机生成类用例采用「循环内计数、循环后聚合断言」的写法：多次抽取的合法性在循环内累命中标记，循环结束后统一断言命中次数与边界值，既保留抽样矩阵覆盖，又避免单条用例长时间占用主线程触发 `THREAD_BLOCK_6S`。

全部用例遵循统一命名规范：`@tc.number` 为 `SUB_<MODULE>_<SEQ>00`（后四位从 0100 起每条自增 100），`@tc.name` 为 `test<Feature><NNNN>`（后四位从 0001 起每条自增 1），并与 `it()` 用例名完全一致；每条用例至少包含 3 个有效断言，禁止恒真断言与空断言。

共 58 个测试套件、1206 条用例，均已在真机全量执行并通过（Failure: 0，Error: 0），连续两轮结果一致。

## 测试套件概览

| 测试文件 | 套件名称 | 用例数 | 测试类型 |
|---|---|---:|---|
| A2dpProfileControl.ets | A2dpProfileControlTest | 14 | Profile 专项功能测试 |
| A2dpProfileManager.ets | A2dpProfileManagerTest | 32 | Profile 管理器功能测试 |
| AvrcpProfileManager.ets | AvrcpProfileManagerTest | 32 | Profile 管理器功能测试 |
| AvrcpProfileMedia.ets | AvrcpProfileMediaTest | 12 | Profile 专项功能测试 |
| HdpProfileManager.ets | HdpProfileManagerTest | 32 | Profile 管理器功能测试 |
| HdpProfileMeasure.ets | HdpProfileMeasureTest | 11 | Profile 专项功能测试 |
| HfpProfileCall.ets | HfpProfileCallTest | 16 | Profile 专项功能测试 |
| HfpProfileManager.ets | HfpProfileManagerTest | 32 | Profile 管理器功能测试 |
| HidProfileInput.ets | HidProfileInputTest | 12 | Profile 专项功能测试 |
| HidProfileManager.ets | HidProfileManagerTest | 32 | Profile 管理器功能测试 |
| MapProfileManager.ets | MapProfileManagerTest | 32 | Profile 管理器功能测试 |
| MapProfileMessage.ets | MapProfileMessageTest | 11 | Profile 专项功能测试 |
| PanProfileManager.ets | PanProfileManagerTest | 32 | Profile 管理器功能测试 |
| PanProfileNetwork.ets | PanProfileNetworkTest | 11 | Profile 专项功能测试 |
| PbapProfileManager.ets | PbapProfileManagerTest | 32 | Profile 管理器功能测试 |
| PbapProfilePhonebook.ets | PbapProfilePhonebookTest | 11 | Profile 专项功能测试 |
| A2dpService.ets | A2dpServiceTest | 30 | Profile 服务功能测试 |
| AvrcpService.ets | AvrcpServiceTest | 30 | Profile 服务功能测试 |
| BluetoothScanService.ets | BluetoothScanServiceTest | 10 | 扫描功能测试 |
| ConnectionManager.ets | ConnectionManagerTest | 12 | 连接管理测试 |
| HdpService.ets | HdpServiceTest | 30 | Profile 服务功能测试 |
| HfpService.ets | HfpServiceTest | 30 | Profile 服务功能测试 |
| HidService.ets | HidServiceTest | 30 | Profile 服务功能测试 |
| MapService.ets | MapServiceTest | 30 | Profile 服务功能测试 |
| PanService.ets | PanServiceTest | 30 | Profile 服务功能测试 |
| PbapService.ets | PbapServiceTest | 30 | Profile 服务功能测试 |
| A2dpModel.ets | A2dpModelTest | 16 | 数据模型测试 |
| AvrcpModel.ets | AvrcpModelTest | 12 | 数据模型测试 |
| BluetoothDeviceModel.ets | BluetoothDeviceModelTest | 16 | 数据模型测试 |
| HdpModel.ets | HdpModelTest | 12 | 数据模型测试 |
| HfpModel.ets | HfpModelTest | 16 | 数据模型测试 |
| HidModel.ets | HidModelTest | 12 | 数据模型测试 |
| MapModel.ets | MapModelTest | 12 | 数据模型测试 |
| PanModel.ets | PanModelTest | 12 | 数据模型测试 |
| PbapModel.ets | PbapModelTest | 12 | 数据模型测试 |
| DeviceUtils.ets | DeviceUtilsTest | 11 | 设备与存储工具测试 |
| FileUtils.ets | FileUtilsTest | 19 | 设备与存储工具测试 |
| PreferenceUtils.ets | PreferenceUtilsTest | 18 | 设备与存储工具测试 |
| StorageUtils.ets | StorageUtilsTest | 15 | 设备与存储工具测试 |
| EncryptionUtils.ets | EncryptionUtilsTest | 20 | 网络与安全工具测试 |
| HttpUtils.ets | HttpUtilsTest | 18 | 网络与安全工具测试 |
| NetworkUtils.ets | NetworkUtilsTest | 14 | 网络与安全工具测试 |
| PermissionUtils.ets | PermissionUtilsTest | 15 | 网络与安全工具测试 |
| CommonUtils.ets | CommonUtilsTest | 30 | 工具类测试 |
| Constants.ets | ConstantsTest | 18 | 全局常量测试 |
| DateUtils.ets | DateUtilsTest | 30 | 工具类测试 |
| FormatUtils.ets | FormatUtilsTest | 24 | 工具类测试 |
| Logger.ets | LoggerTest | 26 | 工具类测试 |
| MathUtils.ets | MathUtilsTest | 26 | 工具类测试 |
| StringUtils.ets | StringUtilsTest | 27 | 工具类测试 |
| TypeUtils.ets | TypeUtilsTest | 26 | 工具类测试 |
| ClipboardUtils.ets | ClipboardUtilsTest | 17 | 校验工具测试 |
| FormValidator.ets | FormValidatorTest | 20 | 校验工具测试 |
| RandomUtils.ets | RandomUtilsTest | 22 | 校验工具测试 |
| ValidationUtils.ets | ValidationUtilsTest | 20 | 校验工具测试 |
| BluetoothConstants.ets | BluetoothConstantsTest | 12 | 领域常量测试 |
| ErrorHandling.ets | ErrorHandlingTest | 22 | 集成与异常处理测试 |
| MultiProfileIntegration.ets | MultiProfileIntegrationTest | 20 | 集成与异常处理测试 |
| **合计** | **58 个套件** | **1206** | - |

## 用例明细

以下各节按套件列出全部用例。`场景说明` 取自用例的 `@tc.desc`，`级别` 取自 `@tc.level`，`结果` 为真机执行结论。

## A2DP 音频流控制 XTS 用例

套件 `A2dpProfileControlTest`，测试文件：`entry/src/ohosTest/ets/test/Bluetooth/A2dpProfileControl.test.ets`，共 14 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_A2DP_CTRL_0100 | testA2dpCtrl0001 | Verify that every audio operation is rejected before the manager is initialized. | Level 0 | Pass |
| SUB_A2DP_CTRL_0200 | testA2dpCtrl0002 | Verify playback control fails and volume or codec control succeeds without a connected device. | Level 1 | Pass |
| SUB_A2DP_CTRL_0300 | testA2dpCtrl0003 | Verify the codec list content and that a fresh copy is returned on every call. | Level 0 | Pass |
| SUB_A2DP_CTRL_0400 | testA2dpCtrl0004 | Verify that selecting a codec moves the active flag and updates the model bit rate. | Level 0 | Pass |
| SUB_A2DP_CTRL_0500 | testA2dpCtrl0005 | Verify that an unsupported codec identifier is rejected and leaves the codec state untouched. | Level 1 | Pass |
| SUB_A2DP_CTRL_0600 | testA2dpCtrl0006 | Verify that quality metrics track every codec switch and expose the effective bit rate. | Level 0 | Pass |
| SUB_A2DP_CTRL_0700 | testA2dpCtrl0007 | Verify the default playback information snapshot and its copy semantics. | Level 0 | Pass |
| SUB_A2DP_CTRL_0800 | testA2dpCtrl0008 | Verify that play after a successful connection updates model, playback info and callbacks. | Level 0 | Pass |
| SUB_A2DP_CTRL_0900 | testA2dpCtrl0009 | Verify that repeated pause calls keep reporting success while the paused flag stays set. | Level 0 | Pass |
| SUB_A2DP_CTRL_1000 | testA2dpCtrl0010 | Verify that stop clears playback position while the configured volume is preserved. | Level 0 | Pass |
| SUB_A2DP_CTRL_1100 | testA2dpCtrl0011 | Verify that track skipping reports success without changing an empty track list. | Level 1 | Pass |
| SUB_A2DP_CTRL_1200 | testA2dpCtrl0012 | Verify volume clamping and rounding across out of range and fractional input values. | Level 1 | Pass |
| SUB_A2DP_CTRL_1300 | testA2dpCtrl0013 | Verify that the playing flag survives a disconnect while new playback attempts are refused. | Level 1 | Pass |
| SUB_A2DP_CTRL_1400 | testA2dpCtrl0014 | Verify codec and playback state after destroy and after a repeated initialization cycle. | Level 0 | Pass |

## A2DP Profile 管理器 XTS 用例

套件 `A2dpProfileManagerTest`，测试文件：`entry/src/ohosTest/ets/test/Bluetooth/A2dpProfileManager.test.ets`，共 32 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_A2DP_PROFILE_0100 | testA2dpProfile0001 | Verify that initialize returns true on the first call. | Level 0 | Pass |
| SUB_A2DP_PROFILE_0200 | testA2dpProfile0002 | Verify that initialize returns false when already initialized. | Level 0 | Pass |
| SUB_A2DP_PROFILE_0300 | testA2dpProfile0003 | Verify that connect succeeds with a valid device ID. | Level 0 | Pass |
| SUB_A2DP_PROFILE_0400 | testA2dpProfile0004 | Verify that connect fails with an empty device ID. | Level 1 | Pass |
| SUB_A2DP_PROFILE_0500 | testA2dpProfile0005 | Verify that reconnecting the same device returns true without duplicate counting. | Level 0 | Pass |
| SUB_A2DP_PROFILE_0600 | testA2dpProfile0006 | Verify that disconnect succeeds for a connected device. | Level 0 | Pass |
| SUB_A2DP_PROFILE_0700 | testA2dpProfile0007 | Verify that disconnect fails for a device that is not connected. | Level 1 | Pass |
| SUB_A2DP_PROFILE_0800 | testA2dpProfile0008 | Verify that getProfileType returns the expected profile type. | Level 0 | Pass |
| SUB_A2DP_PROFILE_0900 | testA2dpProfile0009 | Verify that getService returns a non-null service instance. | Level 0 | Pass |
| SUB_A2DP_PROFILE_1000 | testA2dpProfile0010 | Verify that getModel returns a non-null model instance. | Level 0 | Pass |
| SUB_A2DP_PROFILE_1100 | testA2dpProfile0011 | Verify that getConnectedDeviceIds returns an empty array when no device is connected. | Level 0 | Pass |
| SUB_A2DP_PROFILE_1200 | testA2dpProfile0012 | Verify that getConnectedDeviceIds contains the connected device ID. | Level 0 | Pass |
| SUB_A2DP_PROFILE_1300 | testA2dpProfile0013 | Verify that getManagedDeviceCount increases after a device is connected. | Level 0 | Pass |
| SUB_A2DP_PROFILE_1400 | testA2dpProfile0014 | Verify that setConfig updates the connection timeout configuration. | Level 0 | Pass |
| SUB_A2DP_PROFILE_1500 | testA2dpProfile0015 | Verify that getStatistics returns a non-null statistics object. | Level 0 | Pass |
| SUB_A2DP_PROFILE_1600 | testA2dpProfile0016 | Verify that getOperationRecords returns an array. | Level 0 | Pass |
| SUB_A2DP_PROFILE_1700 | testA2dpProfile0017 | Verify that the statistics health score is greater than zero. | Level 0 | Pass |
| SUB_A2DP_PROFILE_1800 | testA2dpProfile0018 | Verify that a removed state callback is not invoked. | Level 0 | Pass |
| SUB_A2DP_PROFILE_1900 | testA2dpProfile0019 | Verify that data callback registration and removal work correctly. | Level 0 | Pass |
| SUB_A2DP_PROFILE_2000 | testA2dpProfile0020 | Verify that reset clears connections and resets state. | Level 0 | Pass |
| SUB_A2DP_PROFILE_2100 | testA2dpProfile0021 | Verify that destroy releases resources and disconnects devices. | Level 0 | Pass |
| SUB_A2DP_PROFILE_2200 | testA2dpProfile0022 | Verify that multiple devices can be connected simultaneously. | Level 0 | Pass |
| SUB_A2DP_PROFILE_2300 | testA2dpProfile0023 | Verify that the service connection state is CONNECTED after connecting. | Level 0 | Pass |
| SUB_A2DP_PROFILE_2400 | testA2dpProfile0024 | Verify that statistics are updated when a device is connected. | Level 0 | Pass |
| SUB_A2DP_PROFILE_2500 | testA2dpProfile0025 | Verify that statistics are updated when a device is disconnected. | Level 0 | Pass |
| SUB_A2DP_PROFILE_2600 | testA2dpProfile0026 | Verify that the health score is calculated as expected after operations. | Level 0 | Pass |
| SUB_A2DP_PROFILE_2700 | testA2dpProfile0027 | Verify that operations are recorded in the operation records. | Level 0 | Pass |
| SUB_A2DP_PROFILE_2800 | testA2dpProfile0028 | Verify that configuration changes persist across reads. | Level 0 | Pass |
| SUB_A2DP_PROFILE_2900 | testA2dpProfile0029 | Verify that repeated callback registration and removal behave correctly. | Level 1 | Pass |
| SUB_A2DP_PROFILE_3000 | testA2dpProfile0030 | Verify that concurrent operations keep state consistent. | Level 1 | Pass |
| SUB_A2DP_PROFILE_3100 | testA2dpProfile0031 | Verify that operations in an invalid state return expected errors without crashing. | Level 1 | Pass |
| SUB_A2DP_PROFILE_3200 | testA2dpProfile0032 | Verify the full manager lifecycle of initialize, connect, disconnect and destroy. | Level 0 | Pass |

## AVRCP Profile 管理器 XTS 用例

套件 `AvrcpProfileManagerTest`，测试文件：`entry/src/ohosTest/ets/test/Bluetooth/AvrcpProfileManager.test.ets`，共 32 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_AVRCP_PROFILE_0100 | testAvrcpProfile0001 | Verify that initialize returns true on the first call. | Level 0 | Pass |
| SUB_AVRCP_PROFILE_0200 | testAvrcpProfile0002 | Verify that initialize returns false when already initialized. | Level 0 | Pass |
| SUB_AVRCP_PROFILE_0300 | testAvrcpProfile0003 | Verify that connect succeeds with a valid device ID. | Level 0 | Pass |
| SUB_AVRCP_PROFILE_0400 | testAvrcpProfile0004 | Verify that connect fails with an empty device ID. | Level 1 | Pass |
| SUB_AVRCP_PROFILE_0500 | testAvrcpProfile0005 | Verify that reconnecting the same device returns true without duplicate counting. | Level 0 | Pass |
| SUB_AVRCP_PROFILE_0600 | testAvrcpProfile0006 | Verify that disconnect succeeds for a connected device. | Level 0 | Pass |
| SUB_AVRCP_PROFILE_0700 | testAvrcpProfile0007 | Verify that disconnect fails for a device that is not connected. | Level 1 | Pass |
| SUB_AVRCP_PROFILE_0800 | testAvrcpProfile0008 | Verify that getProfileType returns the expected profile type. | Level 0 | Pass |
| SUB_AVRCP_PROFILE_0900 | testAvrcpProfile0009 | Verify that getService returns a non-null service instance. | Level 0 | Pass |
| SUB_AVRCP_PROFILE_1000 | testAvrcpProfile0010 | Verify that getModel returns a non-null model instance. | Level 0 | Pass |
| SUB_AVRCP_PROFILE_1100 | testAvrcpProfile0011 | Verify that getConnectedDeviceIds returns an empty array when no device is connected. | Level 0 | Pass |
| SUB_AVRCP_PROFILE_1200 | testAvrcpProfile0012 | Verify that getConnectedDeviceIds contains the connected device ID. | Level 0 | Pass |
| SUB_AVRCP_PROFILE_1300 | testAvrcpProfile0013 | Verify that getManagedDeviceCount increases after a device is connected. | Level 0 | Pass |
| SUB_AVRCP_PROFILE_1400 | testAvrcpProfile0014 | Verify that setConfig updates the connection timeout configuration. | Level 0 | Pass |
| SUB_AVRCP_PROFILE_1500 | testAvrcpProfile0015 | Verify that getStatistics returns a non-null statistics object. | Level 0 | Pass |
| SUB_AVRCP_PROFILE_1600 | testAvrcpProfile0016 | Verify that getOperationRecords returns an array. | Level 0 | Pass |
| SUB_AVRCP_PROFILE_1700 | testAvrcpProfile0017 | Verify that the statistics health score is greater than zero. | Level 0 | Pass |
| SUB_AVRCP_PROFILE_1800 | testAvrcpProfile0018 | Verify that a removed state callback is not invoked. | Level 0 | Pass |
| SUB_AVRCP_PROFILE_1900 | testAvrcpProfile0019 | Verify that data callback registration and removal work correctly. | Level 0 | Pass |
| SUB_AVRCP_PROFILE_2000 | testAvrcpProfile0020 | Verify that reset clears connections and resets state. | Level 0 | Pass |
| SUB_AVRCP_PROFILE_2100 | testAvrcpProfile0021 | Verify that destroy releases resources and disconnects devices. | Level 0 | Pass |
| SUB_AVRCP_PROFILE_2200 | testAvrcpProfile0022 | Verify that multiple devices can be connected simultaneously. | Level 0 | Pass |
| SUB_AVRCP_PROFILE_2300 | testAvrcpProfile0023 | Verify that the service connection state is CONNECTED after connecting. | Level 0 | Pass |
| SUB_AVRCP_PROFILE_2400 | testAvrcpProfile0024 | Verify that statistics are updated when a device is connected. | Level 0 | Pass |
| SUB_AVRCP_PROFILE_2500 | testAvrcpProfile0025 | Verify that statistics are updated when a device is disconnected. | Level 0 | Pass |
| SUB_AVRCP_PROFILE_2600 | testAvrcpProfile0026 | Verify that the health score is calculated as expected after operations. | Level 0 | Pass |
| SUB_AVRCP_PROFILE_2700 | testAvrcpProfile0027 | Verify that operations are recorded in the operation records. | Level 0 | Pass |
| SUB_AVRCP_PROFILE_2800 | testAvrcpProfile0028 | Verify that configuration changes persist across reads. | Level 0 | Pass |
| SUB_AVRCP_PROFILE_2900 | testAvrcpProfile0029 | Verify that repeated callback registration and removal behave correctly. | Level 1 | Pass |
| SUB_AVRCP_PROFILE_3000 | testAvrcpProfile0030 | Verify that concurrent operations keep state consistent. | Level 1 | Pass |
| SUB_AVRCP_PROFILE_3100 | testAvrcpProfile0031 | Verify that operations in an invalid state return expected errors without crashing. | Level 1 | Pass |
| SUB_AVRCP_PROFILE_3200 | testAvrcpProfile0032 | Verify the full manager lifecycle of initialize, connect, disconnect and destroy. | Level 0 | Pass |

## AVRCP 媒体控制 XTS 用例

套件 `AvrcpProfileMediaTest`，测试文件：`entry/src/ohosTest/ets/test/Bluetooth/AvrcpProfileMedia.test.ets`，共 12 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_AVRCP_MEDIA_0100 | testAvrcpMedia0001 | Verify that all media operations are refused and metadata reads empty before initialization. | Level 0 | Pass |
| SUB_AVRCP_MEDIA_0200 | testAvrcpMedia0002 | Verify that only the play request requires a managed device while other controls proceed. | Level 1 | Pass |
| SUB_AVRCP_MEDIA_0300 | testAvrcpMedia0003 | Verify the recorded details of a full playback sequence on a connected device. | Level 0 | Pass |
| SUB_AVRCP_MEDIA_0400 | testAvrcpMedia0004 | Verify that the numeric playback state stays zero although the textual state changes. | Level 0 | Pass |
| SUB_AVRCP_MEDIA_0500 | testAvrcpMedia0005 | Verify that track metadata stays empty because no source ever fills the media model. | Level 0 | Pass |
| SUB_AVRCP_MEDIA_0600 | testAvrcpMedia0006 | Verify that track skipping on an empty playlist reports success without moving the index. | Level 1 | Pass |
| SUB_AVRCP_MEDIA_0700 | testAvrcpMedia0007 | Verify volume rounding and clamping while the exposed model keeps its own value. | Level 1 | Pass |
| SUB_AVRCP_MEDIA_0800 | testAvrcpMedia0008 | Verify that refused operations leave no trace in the manager operation records. | Level 0 | Pass |
| SUB_AVRCP_MEDIA_0900 | testAvrcpMedia0009 | Verify the recorded order when play, pause and stop are issued concurrently. | Level 1 | Pass |
| SUB_AVRCP_MEDIA_1000 | testAvrcpMedia0010 | Verify that losing the device blocks play but still allows pause and volume changes. | Level 1 | Pass |
| SUB_AVRCP_MEDIA_1100 | testAvrcpMedia0011 | Verify that reset clears records and the operation identifier counter keeps increasing. | Level 0 | Pass |
| SUB_AVRCP_MEDIA_1200 | testAvrcpMedia0012 | Verify the manager state after destroy and after a second initialization cycle. | Level 0 | Pass |

## HDP Profile 管理器 XTS 用例

套件 `HdpProfileManagerTest`，测试文件：`entry/src/ohosTest/ets/test/Bluetooth/HdpProfileManager.test.ets`，共 32 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_HDP_PROFILE_0100 | testHdpProfile0001 | Verify that initialize returns true on the first call. | Level 0 | Pass |
| SUB_HDP_PROFILE_0200 | testHdpProfile0002 | Verify that initialize returns false when already initialized. | Level 0 | Pass |
| SUB_HDP_PROFILE_0300 | testHdpProfile0003 | Verify that connect succeeds with a valid device ID. | Level 0 | Pass |
| SUB_HDP_PROFILE_0400 | testHdpProfile0004 | Verify that connect fails with an empty device ID. | Level 1 | Pass |
| SUB_HDP_PROFILE_0500 | testHdpProfile0005 | Verify that reconnecting the same device returns true without duplicate counting. | Level 0 | Pass |
| SUB_HDP_PROFILE_0600 | testHdpProfile0006 | Verify that disconnect succeeds for a connected device. | Level 0 | Pass |
| SUB_HDP_PROFILE_0700 | testHdpProfile0007 | Verify that disconnect fails for a device that is not connected. | Level 1 | Pass |
| SUB_HDP_PROFILE_0800 | testHdpProfile0008 | Verify that getProfileType returns the expected profile type. | Level 0 | Pass |
| SUB_HDP_PROFILE_0900 | testHdpProfile0009 | Verify that getService returns a non-null service instance. | Level 0 | Pass |
| SUB_HDP_PROFILE_1000 | testHdpProfile0010 | Verify that getModel returns a non-null model instance. | Level 0 | Pass |
| SUB_HDP_PROFILE_1100 | testHdpProfile0011 | Verify that getConnectedDeviceIds returns an empty array when no device is connected. | Level 0 | Pass |
| SUB_HDP_PROFILE_1200 | testHdpProfile0012 | Verify that getConnectedDeviceIds contains the connected device ID. | Level 0 | Pass |
| SUB_HDP_PROFILE_1300 | testHdpProfile0013 | Verify that getManagedDeviceCount increases after a device is connected. | Level 0 | Pass |
| SUB_HDP_PROFILE_1400 | testHdpProfile0014 | Verify that setConfig updates the connection timeout configuration. | Level 0 | Pass |
| SUB_HDP_PROFILE_1500 | testHdpProfile0015 | Verify that getStatistics returns a non-null statistics object. | Level 0 | Pass |
| SUB_HDP_PROFILE_1600 | testHdpProfile0016 | Verify that getOperationRecords returns an array. | Level 0 | Pass |
| SUB_HDP_PROFILE_1700 | testHdpProfile0017 | Verify that the statistics health score is greater than zero. | Level 0 | Pass |
| SUB_HDP_PROFILE_1800 | testHdpProfile0018 | Verify that a removed state callback is not invoked. | Level 0 | Pass |
| SUB_HDP_PROFILE_1900 | testHdpProfile0019 | Verify that data callback registration and removal work correctly. | Level 0 | Pass |
| SUB_HDP_PROFILE_2000 | testHdpProfile0020 | Verify that reset clears connections and resets state. | Level 0 | Pass |
| SUB_HDP_PROFILE_2100 | testHdpProfile0021 | Verify that destroy releases resources and disconnects devices. | Level 0 | Pass |
| SUB_HDP_PROFILE_2200 | testHdpProfile0022 | Verify that multiple devices can be connected simultaneously. | Level 0 | Pass |
| SUB_HDP_PROFILE_2300 | testHdpProfile0023 | Verify that the service connection state is CONNECTED after connecting. | Level 0 | Pass |
| SUB_HDP_PROFILE_2400 | testHdpProfile0024 | Verify that statistics are updated when a device is connected. | Level 0 | Pass |
| SUB_HDP_PROFILE_2500 | testHdpProfile0025 | Verify that statistics are updated when a device is disconnected. | Level 0 | Pass |
| SUB_HDP_PROFILE_2600 | testHdpProfile0026 | Verify that the health score is calculated as expected after operations. | Level 0 | Pass |
| SUB_HDP_PROFILE_2700 | testHdpProfile0027 | Verify that operations are recorded in the operation records. | Level 0 | Pass |
| SUB_HDP_PROFILE_2800 | testHdpProfile0028 | Verify that configuration changes persist across reads. | Level 0 | Pass |
| SUB_HDP_PROFILE_2900 | testHdpProfile0029 | Verify that repeated callback registration and removal behave correctly. | Level 1 | Pass |
| SUB_HDP_PROFILE_3000 | testHdpProfile0030 | Verify that concurrent operations keep state consistent. | Level 1 | Pass |
| SUB_HDP_PROFILE_3100 | testHdpProfile0031 | Verify that operations in an invalid state return expected errors without crashing. | Level 1 | Pass |
| SUB_HDP_PROFILE_3200 | testHdpProfile0032 | Verify the full manager lifecycle of initialize, connect, disconnect and destroy. | Level 0 | Pass |

## HDP 健康数据采集 XTS 用例

套件 `HdpProfileMeasureTest`，测试文件：`entry/src/ohosTest/ets/test/Bluetooth/HdpProfileMeasure.test.ets`，共 11 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_HDP_MEAS_0100 | testHdpMeas0001 | Verify that measurement control and every reading are blocked before initialization. | Level 0 | Pass |
| SUB_HDP_MEAS_0200 | testHdpMeas0002 | Verify that starting a measurement needs a device while stopping one does not. | Level 1 | Pass |
| SUB_HDP_MEAS_0300 | testHdpMeas0003 | Verify the records of a repeated start and stop cycle on a connected device. | Level 0 | Pass |
| SUB_HDP_MEAS_0400 | testHdpMeas0004 | Verify that numeric readings stay at their defaults through a full measurement cycle. | Level 0 | Pass |
| SUB_HDP_MEAS_0500 | testHdpMeas0005 | Verify that the three numeric status readings stay zero because the model keeps text values. | Level 1 | Pass |
| SUB_HDP_MEAS_0600 | testHdpMeas0006 | Verify that the measuring flag survives a disconnection and that stopping needs no device. | Level 1 | Pass |
| SUB_HDP_MEAS_0700 | testHdpMeas0007 | Verify that an interrupted measurement is reported active again after re-initialization. | Level 1 | Pass |
| SUB_HDP_MEAS_0800 | testHdpMeas0008 | Verify the recorded order when measurement calls are issued concurrently. | Level 1 | Pass |
| SUB_HDP_MEAS_0900 | testHdpMeas0009 | Verify that repeated start and stop calls are all recorded without state validation. | Level 1 | Pass |
| SUB_HDP_MEAS_1000 | testHdpMeas0010 | Verify that reset keeps the measuring flag and lets the operation identifier counter grow. | Level 0 | Pass |
| SUB_HDP_MEAS_1100 | testHdpMeas0011 | Verify that measurement control only depends on having at least one managed device. | Level 1 | Pass |

## HFP 通话控制 XTS 用例

套件 `HfpProfileCallTest`，测试文件：`entry/src/ohosTest/ets/test/Bluetooth/HfpProfileCall.test.ets`，共 16 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_HFP_CALL_0100 | testHfpCall0001 | Verify that every call operation and getter is blocked before initialization. | Level 0 | Pass |
| SUB_HFP_CALL_0200 | testHfpCall0002 | Verify call guards without a device while audio settings stay adjustable. | Level 1 | Pass |
| SUB_HFP_CALL_0300 | testHfpCall0003 | Verify the call record built by a successful dial request and its notifications. | Level 0 | Pass |
| SUB_HFP_CALL_0400 | testHfpCall0004 | Verify that an empty number is refused while a blank number starts a call. | Level 1 | Pass |
| SUB_HFP_CALL_0500 | testHfpCall0005 | Verify that answering without an established call report success and raise the active count. | Level 1 | Pass |
| SUB_HFP_CALL_0600 | testHfpCall0006 | Verify that answering a dialed call switches the call record to the active state. | Level 0 | Pass |
| SUB_HFP_CALL_0700 | testHfpCall0007 | Verify holding and resuming a call and the guard that blocks a second resume. | Level 0 | Pass |
| SUB_HFP_CALL_0800 | testHfpCall0008 | Verify that hold and resume keep working after the device has been disconnected. | Level 1 | Pass |
| SUB_HFP_CALL_0900 | testHfpCall0009 | Verify that ending a call archives the record and clears the active call context. | Level 0 | Pass |
| SUB_HFP_CALL_1000 | testHfpCall0010 | Verify that rejecting a call archives a rejected record without a call duration. | Level 0 | Pass |
| SUB_HFP_CALL_1100 | testHfpCall0011 | Verify that redial without any previous call is refused and logged under the redial label. | Level 1 | Pass |
| SUB_HFP_CALL_1200 | testHfpCall0012 | Verify that redial repeats the archived number and creates a fresh dialing record. | Level 0 | Pass |
| SUB_HFP_CALL_1300 | testHfpCall0013 | Verify microphone and speaker volume clamping across invalid and fractional input values. | Level 1 | Pass |
| SUB_HFP_CALL_1400 | testHfpCall0014 | Verify mute and speaker toggling flips both the model and the audio routing path. | Level 0 | Pass |
| SUB_HFP_CALL_1500 | testHfpCall0015 | Verify voice recognition start and stop behaviour on every connection state. | Level 0 | Pass |
| SUB_HFP_CALL_1600 | testHfpCall0016 | Verify network, audio and battery snapshots and their state after a destroy cycle. | Level 0 | Pass |

## HFP Profile 管理器 XTS 用例

套件 `HfpProfileManagerTest`，测试文件：`entry/src/ohosTest/ets/test/Bluetooth/HfpProfileManager.test.ets`，共 32 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_HFP_PROFILE_0100 | testHfpProfile0001 | Verify that initialize returns true on the first call. | Level 0 | Pass |
| SUB_HFP_PROFILE_0200 | testHfpProfile0002 | Verify that initialize returns false when already initialized. | Level 0 | Pass |
| SUB_HFP_PROFILE_0300 | testHfpProfile0003 | Verify that connect succeeds with a valid device ID. | Level 0 | Pass |
| SUB_HFP_PROFILE_0400 | testHfpProfile0004 | Verify that connect fails with an empty device ID. | Level 1 | Pass |
| SUB_HFP_PROFILE_0500 | testHfpProfile0005 | Verify that reconnecting the same device returns true without duplicate counting. | Level 0 | Pass |
| SUB_HFP_PROFILE_0600 | testHfpProfile0006 | Verify that disconnect succeeds for a connected device. | Level 0 | Pass |
| SUB_HFP_PROFILE_0700 | testHfpProfile0007 | Verify that disconnect fails for a device that is not connected. | Level 1 | Pass |
| SUB_HFP_PROFILE_0800 | testHfpProfile0008 | Verify that getProfileType returns the expected profile type. | Level 0 | Pass |
| SUB_HFP_PROFILE_0900 | testHfpProfile0009 | Verify that getService returns a non-null service instance. | Level 0 | Pass |
| SUB_HFP_PROFILE_1000 | testHfpProfile0010 | Verify that getModel returns a non-null model instance. | Level 0 | Pass |
| SUB_HFP_PROFILE_1100 | testHfpProfile0011 | Verify that getConnectedDeviceIds returns an empty array when no device is connected. | Level 0 | Pass |
| SUB_HFP_PROFILE_1200 | testHfpProfile0012 | Verify that getConnectedDeviceIds contains the connected device ID. | Level 0 | Pass |
| SUB_HFP_PROFILE_1300 | testHfpProfile0013 | Verify that getManagedDeviceCount increases after a device is connected. | Level 0 | Pass |
| SUB_HFP_PROFILE_1400 | testHfpProfile0014 | Verify that setConfig updates the connection timeout configuration. | Level 0 | Pass |
| SUB_HFP_PROFILE_1500 | testHfpProfile0015 | Verify that getStatistics returns a non-null statistics object. | Level 0 | Pass |
| SUB_HFP_PROFILE_1600 | testHfpProfile0016 | Verify that getOperationRecords returns an array. | Level 0 | Pass |
| SUB_HFP_PROFILE_1700 | testHfpProfile0017 | Verify that the statistics health score is greater than zero. | Level 0 | Pass |
| SUB_HFP_PROFILE_1800 | testHfpProfile0018 | Verify that a removed state callback is not invoked. | Level 0 | Pass |
| SUB_HFP_PROFILE_1900 | testHfpProfile0019 | Verify that data callback registration and removal work correctly. | Level 0 | Pass |
| SUB_HFP_PROFILE_2000 | testHfpProfile0020 | Verify that reset clears connections and resets state. | Level 0 | Pass |
| SUB_HFP_PROFILE_2100 | testHfpProfile0021 | Verify that destroy releases resources and disconnects devices. | Level 0 | Pass |
| SUB_HFP_PROFILE_2200 | testHfpProfile0022 | Verify that multiple devices can be connected simultaneously. | Level 0 | Pass |
| SUB_HFP_PROFILE_2300 | testHfpProfile0023 | Verify that the service connection state is CONNECTED after connecting. | Level 0 | Pass |
| SUB_HFP_PROFILE_2400 | testHfpProfile0024 | Verify that statistics are updated when a device is connected. | Level 0 | Pass |
| SUB_HFP_PROFILE_2500 | testHfpProfile0025 | Verify that statistics are updated when a device is disconnected. | Level 0 | Pass |
| SUB_HFP_PROFILE_2600 | testHfpProfile0026 | Verify that the health score is calculated as expected after operations. | Level 0 | Pass |
| SUB_HFP_PROFILE_2700 | testHfpProfile0027 | Verify that operations are recorded in the operation records. | Level 0 | Pass |
| SUB_HFP_PROFILE_2800 | testHfpProfile0028 | Verify that configuration changes persist across reads. | Level 0 | Pass |
| SUB_HFP_PROFILE_2900 | testHfpProfile0029 | Verify that repeated callback registration and removal behave correctly. | Level 1 | Pass |
| SUB_HFP_PROFILE_3000 | testHfpProfile0030 | Verify that concurrent operations keep state consistent. | Level 1 | Pass |
| SUB_HFP_PROFILE_3100 | testHfpProfile0031 | Verify that operations in an invalid state return expected errors without crashing. | Level 1 | Pass |
| SUB_HFP_PROFILE_3200 | testHfpProfile0032 | Verify the full manager lifecycle of initialize, connect, disconnect and destroy. | Level 0 | Pass |

## HID 输入设备状态 XTS 用例

套件 `HidProfileInputTest`，测试文件：`entry/src/ohosTest/ets/test/Bluetooth/HidProfileInput.test.ets`，共 12 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_HID_INPUT_0100 | testHidInput0001 | Verify that every input injection is refused before the manager is initialized. | Level 0 | Pass |
| SUB_HID_INPUT_0200 | testHidInput0002 | Verify that input injection needs a managed device while the pointer speed setting does not. | Level 1 | Pass |
| SUB_HID_INPUT_0300 | testHidInput0003 | Verify the recorded key press and release details on a connected device. | Level 0 | Pass |
| SUB_HID_INPUT_0400 | testHidInput0004 | Verify the recorded details of pointer, button, scroll and touch events. | Level 0 | Pass |
| SUB_HID_INPUT_0500 | testHidInput0005 | Verify that out of range coordinates and key codes are accepted without validation. | Level 1 | Pass |
| SUB_HID_INPUT_0600 | testHidInput0006 | Verify the operation names recorded by the five injection methods in calling order. | Level 0 | Pass |
| SUB_HID_INPUT_0700 | testHidInput0007 | Verify pointer speed clamping for values below and above the supported range. | Level 1 | Pass |
| SUB_HID_INPUT_0800 | testHidInput0008 | Verify that key mapping queries stay empty after injection and return independent arrays. | Level 0 | Pass |
| SUB_HID_INPUT_0900 | testHidInput0009 | Verify that the pointer speed survives destroy and re-initialization of the manager. | Level 1 | Pass |
| SUB_HID_INPUT_1000 | testHidInput0010 | Verify the record order when three injection calls are issued concurrently. | Level 1 | Pass |
| SUB_HID_INPUT_1100 | testHidInput0011 | Verify that losing the device blocks injections but keeps the pointer speed setting usable. | Level 1 | Pass |
| SUB_HID_INPUT_1200 | testHidInput0012 | Verify that reset clears records and the identifier counter keeps increasing. | Level 0 | Pass |

## HID Profile 管理器 XTS 用例

套件 `HidProfileManagerTest`，测试文件：`entry/src/ohosTest/ets/test/Bluetooth/HidProfileManager.test.ets`，共 32 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_HID_PROFILE_0100 | testHidProfile0001 | Verify that initialize returns true on the first call. | Level 0 | Pass |
| SUB_HID_PROFILE_0200 | testHidProfile0002 | Verify that initialize returns false when already initialized. | Level 0 | Pass |
| SUB_HID_PROFILE_0300 | testHidProfile0003 | Verify that connect succeeds with a valid device ID. | Level 0 | Pass |
| SUB_HID_PROFILE_0400 | testHidProfile0004 | Verify that connect fails with an empty device ID. | Level 1 | Pass |
| SUB_HID_PROFILE_0500 | testHidProfile0005 | Verify that reconnecting the same device returns true without duplicate counting. | Level 0 | Pass |
| SUB_HID_PROFILE_0600 | testHidProfile0006 | Verify that disconnect succeeds for a connected device. | Level 0 | Pass |
| SUB_HID_PROFILE_0700 | testHidProfile0007 | Verify that disconnect fails for a device that is not connected. | Level 1 | Pass |
| SUB_HID_PROFILE_0800 | testHidProfile0008 | Verify that getProfileType returns the expected profile type. | Level 0 | Pass |
| SUB_HID_PROFILE_0900 | testHidProfile0009 | Verify that getService returns a non-null service instance. | Level 0 | Pass |
| SUB_HID_PROFILE_1000 | testHidProfile0010 | Verify that getModel returns a non-null model instance. | Level 0 | Pass |
| SUB_HID_PROFILE_1100 | testHidProfile0011 | Verify that getConnectedDeviceIds returns an empty array when no device is connected. | Level 0 | Pass |
| SUB_HID_PROFILE_1200 | testHidProfile0012 | Verify that getConnectedDeviceIds contains the connected device ID. | Level 0 | Pass |
| SUB_HID_PROFILE_1300 | testHidProfile0013 | Verify that getManagedDeviceCount increases after a device is connected. | Level 0 | Pass |
| SUB_HID_PROFILE_1400 | testHidProfile0014 | Verify that setConfig updates the connection timeout configuration. | Level 0 | Pass |
| SUB_HID_PROFILE_1500 | testHidProfile0015 | Verify that getStatistics returns a non-null statistics object. | Level 0 | Pass |
| SUB_HID_PROFILE_1600 | testHidProfile0016 | Verify that getOperationRecords returns an array. | Level 0 | Pass |
| SUB_HID_PROFILE_1700 | testHidProfile0017 | Verify that the statistics health score is greater than zero. | Level 0 | Pass |
| SUB_HID_PROFILE_1800 | testHidProfile0018 | Verify that a removed state callback is not invoked. | Level 0 | Pass |
| SUB_HID_PROFILE_1900 | testHidProfile0019 | Verify that data callback registration and removal work correctly. | Level 0 | Pass |
| SUB_HID_PROFILE_2000 | testHidProfile0020 | Verify that reset clears connections and resets state. | Level 0 | Pass |
| SUB_HID_PROFILE_2100 | testHidProfile0021 | Verify that destroy releases resources and disconnects devices. | Level 0 | Pass |
| SUB_HID_PROFILE_2200 | testHidProfile0022 | Verify that multiple devices can be connected simultaneously. | Level 0 | Pass |
| SUB_HID_PROFILE_2300 | testHidProfile0023 | Verify that the service connection state is CONNECTED after connecting. | Level 0 | Pass |
| SUB_HID_PROFILE_2400 | testHidProfile0024 | Verify that statistics are updated when a device is connected. | Level 0 | Pass |
| SUB_HID_PROFILE_2500 | testHidProfile0025 | Verify that statistics are updated when a device is disconnected. | Level 0 | Pass |
| SUB_HID_PROFILE_2600 | testHidProfile0026 | Verify that the health score is calculated as expected after operations. | Level 0 | Pass |
| SUB_HID_PROFILE_2700 | testHidProfile0027 | Verify that operations are recorded in the operation records. | Level 0 | Pass |
| SUB_HID_PROFILE_2800 | testHidProfile0028 | Verify that configuration changes persist across reads. | Level 0 | Pass |
| SUB_HID_PROFILE_2900 | testHidProfile0029 | Verify that repeated callback registration and removal behave correctly. | Level 1 | Pass |
| SUB_HID_PROFILE_3000 | testHidProfile0030 | Verify that concurrent operations keep state consistent. | Level 1 | Pass |
| SUB_HID_PROFILE_3100 | testHidProfile0031 | Verify that operations in an invalid state return expected errors without crashing. | Level 1 | Pass |
| SUB_HID_PROFILE_3200 | testHidProfile0032 | Verify the full manager lifecycle of initialize, connect, disconnect and destroy. | Level 0 | Pass |

## MAP Profile 管理器 XTS 用例

套件 `MapProfileManagerTest`，测试文件：`entry/src/ohosTest/ets/test/Bluetooth/MapProfileManager.test.ets`，共 32 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_MAP_PROFILE_0100 | testMapProfile0001 | Verify that initialize returns true on the first call. | Level 0 | Pass |
| SUB_MAP_PROFILE_0200 | testMapProfile0002 | Verify that initialize returns false when already initialized. | Level 0 | Pass |
| SUB_MAP_PROFILE_0300 | testMapProfile0003 | Verify that connect succeeds with a valid device ID. | Level 0 | Pass |
| SUB_MAP_PROFILE_0400 | testMapProfile0004 | Verify that connect fails with an empty device ID. | Level 1 | Pass |
| SUB_MAP_PROFILE_0500 | testMapProfile0005 | Verify that reconnecting the same device returns true without duplicate counting. | Level 0 | Pass |
| SUB_MAP_PROFILE_0600 | testMapProfile0006 | Verify that disconnect succeeds for a connected device. | Level 0 | Pass |
| SUB_MAP_PROFILE_0700 | testMapProfile0007 | Verify that disconnect fails for a device that is not connected. | Level 1 | Pass |
| SUB_MAP_PROFILE_0800 | testMapProfile0008 | Verify that getProfileType returns the expected profile type. | Level 0 | Pass |
| SUB_MAP_PROFILE_0900 | testMapProfile0009 | Verify that getService returns a non-null service instance. | Level 0 | Pass |
| SUB_MAP_PROFILE_1000 | testMapProfile0010 | Verify that getModel returns a non-null model instance. | Level 0 | Pass |
| SUB_MAP_PROFILE_1100 | testMapProfile0011 | Verify that getConnectedDeviceIds returns an empty array when no device is connected. | Level 0 | Pass |
| SUB_MAP_PROFILE_1200 | testMapProfile0012 | Verify that getConnectedDeviceIds contains the connected device ID. | Level 0 | Pass |
| SUB_MAP_PROFILE_1300 | testMapProfile0013 | Verify that getManagedDeviceCount increases after a device is connected. | Level 0 | Pass |
| SUB_MAP_PROFILE_1400 | testMapProfile0014 | Verify that setConfig updates the connection timeout configuration. | Level 0 | Pass |
| SUB_MAP_PROFILE_1500 | testMapProfile0015 | Verify that getStatistics returns a non-null statistics object. | Level 0 | Pass |
| SUB_MAP_PROFILE_1600 | testMapProfile0016 | Verify that getOperationRecords returns an array. | Level 0 | Pass |
| SUB_MAP_PROFILE_1700 | testMapProfile0017 | Verify that the statistics health score is greater than zero. | Level 0 | Pass |
| SUB_MAP_PROFILE_1800 | testMapProfile0018 | Verify that a removed state callback is not invoked. | Level 0 | Pass |
| SUB_MAP_PROFILE_1900 | testMapProfile0019 | Verify that data callback registration and removal work correctly. | Level 0 | Pass |
| SUB_MAP_PROFILE_2000 | testMapProfile0020 | Verify that reset clears connections and resets state. | Level 0 | Pass |
| SUB_MAP_PROFILE_2100 | testMapProfile0021 | Verify that destroy releases resources and disconnects devices. | Level 0 | Pass |
| SUB_MAP_PROFILE_2200 | testMapProfile0022 | Verify that multiple devices can be connected simultaneously. | Level 0 | Pass |
| SUB_MAP_PROFILE_2300 | testMapProfile0023 | Verify that the service connection state is CONNECTED after connecting. | Level 0 | Pass |
| SUB_MAP_PROFILE_2400 | testMapProfile0024 | Verify that statistics are updated when a device is connected. | Level 0 | Pass |
| SUB_MAP_PROFILE_2500 | testMapProfile0025 | Verify that statistics are updated when a device is disconnected. | Level 0 | Pass |
| SUB_MAP_PROFILE_2600 | testMapProfile0026 | Verify that the health score is calculated as expected after operations. | Level 0 | Pass |
| SUB_MAP_PROFILE_2700 | testMapProfile0027 | Verify that operations are recorded in the operation records. | Level 0 | Pass |
| SUB_MAP_PROFILE_2800 | testMapProfile0028 | Verify that configuration changes persist across reads. | Level 0 | Pass |
| SUB_MAP_PROFILE_2900 | testMapProfile0029 | Verify that repeated callback registration and removal behave correctly. | Level 1 | Pass |
| SUB_MAP_PROFILE_3000 | testMapProfile0030 | Verify that concurrent operations keep state consistent. | Level 1 | Pass |
| SUB_MAP_PROFILE_3100 | testMapProfile0031 | Verify that operations in an invalid state return expected errors without crashing. | Level 1 | Pass |
| SUB_MAP_PROFILE_3200 | testMapProfile0032 | Verify the full manager lifecycle of initialize, connect, disconnect and destroy. | Level 0 | Pass |

## MAP 消息访问 XTS 用例

套件 `MapProfileMessageTest`，测试文件：`entry/src/ohosTest/ets/test/Bluetooth/MapProfileMessage.test.ets`，共 11 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_MAP_MSG_0100 | testMapMsg0001 | Verify that message synchronization and every message reading are blocked before initialization. | Level 0 | Pass |
| SUB_MAP_MSG_0200 | testMapMsg0002 | Verify that only starting synchronization requires a managed device. | Level 1 | Pass |
| SUB_MAP_MSG_0300 | testMapMsg0003 | Verify the recorded details of a synchronization cycle on a connected device. | Level 0 | Pass |
| SUB_MAP_MSG_0400 | testMapMsg0004 | Verify that the message type filter is stored as text and read back as a number. | Level 1 | Pass |
| SUB_MAP_MSG_0500 | testMapMsg0005 | Verify that the default message type reads zero while the service model keeps the text value. | Level 1 | Pass |
| SUB_MAP_MSG_0600 | testMapMsg0006 | Verify that folder and message listings stay empty and return independent copies. | Level 0 | Pass |
| SUB_MAP_MSG_0700 | testMapMsg0007 | Verify that message counters and the sync timestamp stay zero after synchronization attempts. | Level 0 | Pass |
| SUB_MAP_MSG_0800 | testMapMsg0008 | Verify that an unfinished synchronization is reported again after re-initialization. | Level 1 | Pass |
| SUB_MAP_MSG_0900 | testMapMsg0009 | Verify the recorded order when synchronization calls are issued concurrently. | Level 1 | Pass |
| SUB_MAP_MSG_1000 | testMapMsg0010 | Verify that reset keeps the synchronization flag and lets the operation identifier counter grow. | Level 0 | Pass |
| SUB_MAP_MSG_1100 | testMapMsg0011 | Verify that synchronization control only depends on having at least one managed device. | Level 1 | Pass |

## PAN Profile 管理器 XTS 用例

套件 `PanProfileManagerTest`，测试文件：`entry/src/ohosTest/ets/test/Bluetooth/PanProfileManager.test.ets`，共 32 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_PAN_PROFILE_0100 | testPanProfile0001 | Verify that initialize returns true on the first call. | Level 0 | Pass |
| SUB_PAN_PROFILE_0200 | testPanProfile0002 | Verify that initialize returns false when already initialized. | Level 0 | Pass |
| SUB_PAN_PROFILE_0300 | testPanProfile0003 | Verify that connect succeeds with a valid device ID. | Level 0 | Pass |
| SUB_PAN_PROFILE_0400 | testPanProfile0004 | Verify that connect fails with an empty device ID. | Level 1 | Pass |
| SUB_PAN_PROFILE_0500 | testPanProfile0005 | Verify that reconnecting the same device returns true without duplicate counting. | Level 0 | Pass |
| SUB_PAN_PROFILE_0600 | testPanProfile0006 | Verify that disconnect succeeds for a connected device. | Level 0 | Pass |
| SUB_PAN_PROFILE_0700 | testPanProfile0007 | Verify that disconnect fails for a device that is not connected. | Level 1 | Pass |
| SUB_PAN_PROFILE_0800 | testPanProfile0008 | Verify that getProfileType returns the expected profile type. | Level 0 | Pass |
| SUB_PAN_PROFILE_0900 | testPanProfile0009 | Verify that getService returns a non-null service instance. | Level 0 | Pass |
| SUB_PAN_PROFILE_1000 | testPanProfile0010 | Verify that getModel returns a non-null model instance. | Level 0 | Pass |
| SUB_PAN_PROFILE_1100 | testPanProfile0011 | Verify that getConnectedDeviceIds returns an empty array when no device is connected. | Level 0 | Pass |
| SUB_PAN_PROFILE_1200 | testPanProfile0012 | Verify that getConnectedDeviceIds contains the connected device ID. | Level 0 | Pass |
| SUB_PAN_PROFILE_1300 | testPanProfile0013 | Verify that getManagedDeviceCount increases after a device is connected. | Level 0 | Pass |
| SUB_PAN_PROFILE_1400 | testPanProfile0014 | Verify that setConfig updates the connection timeout configuration. | Level 0 | Pass |
| SUB_PAN_PROFILE_1500 | testPanProfile0015 | Verify that getStatistics returns a non-null statistics object. | Level 0 | Pass |
| SUB_PAN_PROFILE_1600 | testPanProfile0016 | Verify that getOperationRecords returns an array. | Level 0 | Pass |
| SUB_PAN_PROFILE_1700 | testPanProfile0017 | Verify that the statistics health score is greater than zero. | Level 0 | Pass |
| SUB_PAN_PROFILE_1800 | testPanProfile0018 | Verify that a removed state callback is not invoked. | Level 0 | Pass |
| SUB_PAN_PROFILE_1900 | testPanProfile0019 | Verify that data callback registration and removal work correctly. | Level 0 | Pass |
| SUB_PAN_PROFILE_2000 | testPanProfile0020 | Verify that reset clears connections and resets state. | Level 0 | Pass |
| SUB_PAN_PROFILE_2100 | testPanProfile0021 | Verify that destroy releases resources and disconnects devices. | Level 0 | Pass |
| SUB_PAN_PROFILE_2200 | testPanProfile0022 | Verify that multiple devices can be connected simultaneously. | Level 0 | Pass |
| SUB_PAN_PROFILE_2300 | testPanProfile0023 | Verify that the service connection state is CONNECTED after connecting. | Level 0 | Pass |
| SUB_PAN_PROFILE_2400 | testPanProfile0024 | Verify that statistics are updated when a device is connected. | Level 0 | Pass |
| SUB_PAN_PROFILE_2500 | testPanProfile0025 | Verify that statistics are updated when a device is disconnected. | Level 0 | Pass |
| SUB_PAN_PROFILE_2600 | testPanProfile0026 | Verify that the health score is calculated as expected after operations. | Level 0 | Pass |
| SUB_PAN_PROFILE_2700 | testPanProfile0027 | Verify that operations are recorded in the operation records. | Level 0 | Pass |
| SUB_PAN_PROFILE_2800 | testPanProfile0028 | Verify that configuration changes persist across reads. | Level 0 | Pass |
| SUB_PAN_PROFILE_2900 | testPanProfile0029 | Verify that repeated callback registration and removal behave correctly. | Level 1 | Pass |
| SUB_PAN_PROFILE_3000 | testPanProfile0030 | Verify that concurrent operations keep state consistent. | Level 1 | Pass |
| SUB_PAN_PROFILE_3100 | testPanProfile0031 | Verify that operations in an invalid state return expected errors without crashing. | Level 1 | Pass |
| SUB_PAN_PROFILE_3200 | testPanProfile0032 | Verify the full manager lifecycle of initialize, connect, disconnect and destroy. | Level 0 | Pass |

## PAN 网络共享 XTS 用例

套件 `PanProfileNetworkTest`，测试文件：`entry/src/ohosTest/ets/test/Bluetooth/PanProfileNetwork.test.ets`，共 11 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_PAN_NET_0100 | testPanNet0001 | Verify that tethering control and every network reading are blocked before initialization. | Level 0 | Pass |
| SUB_PAN_NET_0200 | testPanNet0002 | Verify that only enabling tethering requires a managed device while disabling always succeeds. | Level 1 | Pass |
| SUB_PAN_NET_0300 | testPanNet0003 | Verify the recorded details of a tethering cycle on a connected device. | Level 0 | Pass |
| SUB_PAN_NET_0400 | testPanNet0004 | Verify that the four network parameters stay empty even while tethering is enabled. | Level 0 | Pass |
| SUB_PAN_NET_0500 | testPanNet0005 | Verify that throughput readings stay zero because no traffic is ever accounted. | Level 0 | Pass |
| SUB_PAN_NET_0600 | testPanNet0006 | Compare the profile device counter with the managed device list of the manager. | Level 1 | Pass |
| SUB_PAN_NET_0700 | testPanNet0007 | Verify that the numeric network role stays zero while the model keeps the text role. | Level 1 | Pass |
| SUB_PAN_NET_0800 | testPanNet0008 | Verify that enabling tethering is invisible through the model exposed by the manager. | Level 1 | Pass |
| SUB_PAN_NET_0900 | testPanNet0009 | Verify the recorded order when tethering calls are issued concurrently. | Level 1 | Pass |
| SUB_PAN_NET_1000 | testPanNet0010 | Verify that reset keeps tethering records consistent and the identifier counter grows. | Level 0 | Pass |
| SUB_PAN_NET_1100 | testPanNet0011 | Verify that tethering control only depends on having at least one managed device. | Level 1 | Pass |

## PBAP Profile 管理器 XTS 用例

套件 `PbapProfileManagerTest`，测试文件：`entry/src/ohosTest/ets/test/Bluetooth/PbapProfileManager.test.ets`，共 32 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_PBAP_PROFILE_0100 | testPbapProfile0001 | Verify that initialize returns true on the first call. | Level 0 | Pass |
| SUB_PBAP_PROFILE_0200 | testPbapProfile0002 | Verify that initialize returns false when already initialized. | Level 0 | Pass |
| SUB_PBAP_PROFILE_0300 | testPbapProfile0003 | Verify that connect succeeds with a valid device ID. | Level 0 | Pass |
| SUB_PBAP_PROFILE_0400 | testPbapProfile0004 | Verify that connect fails with an empty device ID. | Level 1 | Pass |
| SUB_PBAP_PROFILE_0500 | testPbapProfile0005 | Verify that reconnecting the same device returns true without duplicate counting. | Level 0 | Pass |
| SUB_PBAP_PROFILE_0600 | testPbapProfile0006 | Verify that disconnect succeeds for a connected device. | Level 0 | Pass |
| SUB_PBAP_PROFILE_0700 | testPbapProfile0007 | Verify that disconnect fails for a device that is not connected. | Level 1 | Pass |
| SUB_PBAP_PROFILE_0800 | testPbapProfile0008 | Verify that getProfileType returns the expected profile type. | Level 0 | Pass |
| SUB_PBAP_PROFILE_0900 | testPbapProfile0009 | Verify that getService returns a non-null service instance. | Level 0 | Pass |
| SUB_PBAP_PROFILE_1000 | testPbapProfile0010 | Verify that getModel returns a non-null model instance. | Level 0 | Pass |
| SUB_PBAP_PROFILE_1100 | testPbapProfile0011 | Verify that getConnectedDeviceIds returns an empty array when no device is connected. | Level 0 | Pass |
| SUB_PBAP_PROFILE_1200 | testPbapProfile0012 | Verify that getConnectedDeviceIds contains the connected device ID. | Level 0 | Pass |
| SUB_PBAP_PROFILE_1300 | testPbapProfile0013 | Verify that getManagedDeviceCount increases after a device is connected. | Level 0 | Pass |
| SUB_PBAP_PROFILE_1400 | testPbapProfile0014 | Verify that setConfig updates the connection timeout configuration. | Level 0 | Pass |
| SUB_PBAP_PROFILE_1500 | testPbapProfile0015 | Verify that getStatistics returns a non-null statistics object. | Level 0 | Pass |
| SUB_PBAP_PROFILE_1600 | testPbapProfile0016 | Verify that getOperationRecords returns an array. | Level 0 | Pass |
| SUB_PBAP_PROFILE_1700 | testPbapProfile0017 | Verify that the statistics health score is greater than zero. | Level 0 | Pass |
| SUB_PBAP_PROFILE_1800 | testPbapProfile0018 | Verify that a removed state callback is not invoked. | Level 0 | Pass |
| SUB_PBAP_PROFILE_1900 | testPbapProfile0019 | Verify that data callback registration and removal work correctly. | Level 0 | Pass |
| SUB_PBAP_PROFILE_2000 | testPbapProfile0020 | Verify that reset clears connections and resets state. | Level 0 | Pass |
| SUB_PBAP_PROFILE_2100 | testPbapProfile0021 | Verify that destroy releases resources and disconnects devices. | Level 0 | Pass |
| SUB_PBAP_PROFILE_2200 | testPbapProfile0022 | Verify that multiple devices can be connected simultaneously. | Level 0 | Pass |
| SUB_PBAP_PROFILE_2300 | testPbapProfile0023 | Verify that the service connection state is CONNECTED after connecting. | Level 0 | Pass |
| SUB_PBAP_PROFILE_2400 | testPbapProfile0024 | Verify that statistics are updated when a device is connected. | Level 0 | Pass |
| SUB_PBAP_PROFILE_2500 | testPbapProfile0025 | Verify that statistics are updated when a device is disconnected. | Level 0 | Pass |
| SUB_PBAP_PROFILE_2600 | testPbapProfile0026 | Verify that the health score is calculated as expected after operations. | Level 0 | Pass |
| SUB_PBAP_PROFILE_2700 | testPbapProfile0027 | Verify that operations are recorded in the operation records. | Level 0 | Pass |
| SUB_PBAP_PROFILE_2800 | testPbapProfile0028 | Verify that configuration changes persist across reads. | Level 0 | Pass |
| SUB_PBAP_PROFILE_2900 | testPbapProfile0029 | Verify that repeated callback registration and removal behave correctly. | Level 1 | Pass |
| SUB_PBAP_PROFILE_3000 | testPbapProfile0030 | Verify that concurrent operations keep state consistent. | Level 1 | Pass |
| SUB_PBAP_PROFILE_3100 | testPbapProfile0031 | Verify that operations in an invalid state return expected errors without crashing. | Level 1 | Pass |
| SUB_PBAP_PROFILE_3200 | testPbapProfile0032 | Verify the full manager lifecycle of initialize, connect, disconnect and destroy. | Level 0 | Pass |

## PBAP 电话簿同步 XTS 用例

套件 `PbapProfilePhonebookTest`，测试文件：`entry/src/ohosTest/ets/test/Bluetooth/PbapProfilePhonebook.test.ets`，共 11 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_PBAP_PB_0100 | testPbapPb0001 | Verify that phonebook synchronization and every contact reading are blocked before initialization. | Level 0 | Pass |
| SUB_PBAP_PB_0200 | testPbapPb0002 | Verify that only starting synchronization requires a managed device. | Level 1 | Pass |
| SUB_PBAP_PB_0300 | testPbapPb0003 | Verify the recorded details of a phonebook synchronization cycle on a connected device. | Level 0 | Pass |
| SUB_PBAP_PB_0400 | testPbapPb0004 | Verify that every sort order value is accepted and stored as text without a matching getter. | Level 1 | Pass |
| SUB_PBAP_PB_0500 | testPbapPb0005 | Verify that contact search ignores the keyword and hands out the internal list twice. | Level 1 | Pass |
| SUB_PBAP_PB_0600 | testPbapPb0006 | Verify that a caller appended contact is retained by the following searches. | Level 1 | Pass |
| SUB_PBAP_PB_0700 | testPbapPb0007 | Verify that contact counters and the sync timestamp stay zero through synchronization cycles. | Level 0 | Pass |
| SUB_PBAP_PB_0800 | testPbapPb0008 | Verify that the numeric phonebook type stays zero while the model keeps the text type. | Level 1 | Pass |
| SUB_PBAP_PB_0900 | testPbapPb0009 | Verify that an unfinished synchronization is reported again after re-initialization. | Level 1 | Pass |
| SUB_PBAP_PB_1000 | testPbapPb0010 | Verify the recorded order when synchronization calls are issued concurrently. | Level 1 | Pass |
| SUB_PBAP_PB_1100 | testPbapPb0011 | Verify synchronization control with two managed devices and the record counter after reset. | Level 1 | Pass |

## A2DP 服务 XTS 用例

套件 `A2dpServiceTest`，测试文件：`entry/src/ohosTest/ets/test/Service/A2dpService.test.ets`，共 30 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_A2DP_SERVICE_0100 | testA2dpService0001 | Verify the default state of a newly created service before initialization. | Level 0 | Pass |
| SUB_A2DP_SERVICE_0200 | testA2dpService0002 | Verify initialization registers five codecs and creates default playback state. | Level 0 | Pass |
| SUB_A2DP_SERVICE_0300 | testA2dpService0003 | Verify a repeated initialization is rejected and recorded as a failed operation. | Level 1 | Pass |
| SUB_A2DP_SERVICE_0400 | testA2dpService0004 | Verify destroy clears callbacks and codecs while allowing a later re-initialization. | Level 0 | Pass |
| SUB_A2DP_SERVICE_0500 | testA2dpService0005 | Verify connect is rejected before initialization and records the reason. | Level 1 | Pass |
| SUB_A2DP_SERVICE_0600 | testA2dpService0006 | Verify connect rejects an empty device identifier. | Level 1 | Pass |
| SUB_A2DP_SERVICE_0700 | testA2dpService0007 | Verify a successful connection updates state, device list and statistics. | Level 0 | Pass |
| SUB_A2DP_SERVICE_0800 | testA2dpService0008 | Verify reconnecting the same device is idempotent but recorded as already connected. | Level 1 | Pass |
| SUB_A2DP_SERVICE_0900 | testA2dpService0009 | Verify disconnecting one of two connected devices keeps the service connected. | Level 1 | Pass |
| SUB_A2DP_SERVICE_1000 | testA2dpService0010 | Verify disconnecting the last device resets playing state and stream flags. | Level 0 | Pass |
| SUB_A2DP_SERVICE_1100 | testA2dpService0011 | Verify disconnect is rejected before initialization. | Level 1 | Pass |
| SUB_A2DP_SERVICE_1200 | testA2dpService0012 | Verify disconnect rejects a device that is not connected. | Level 1 | Pass |
| SUB_A2DP_SERVICE_1300 | testA2dpService0013 | Verify reset clears connections and history while restoring playback defaults. | Level 0 | Pass |
| SUB_A2DP_SERVICE_1400 | testA2dpService0014 | Verify destroy releases connections, callbacks and codec table. | Level 0 | Pass |
| SUB_A2DP_SERVICE_1500 | testA2dpService0015 | Verify all playback controls are rejected when no device is connected. | Level 1 | Pass |
| SUB_A2DP_SERVICE_1600 | testA2dpService0016 | Verify play starts playback and updates model, playback info and history. | Level 0 | Pass |
| SUB_A2DP_SERVICE_1700 | testA2dpService0017 | Verify pause clears the playing flag and sets the paused flag. | Level 0 | Pass |
| SUB_A2DP_SERVICE_1800 | testA2dpService0018 | Verify stop clears playing and paused flags and rewinds the position. | Level 0 | Pass |
| SUB_A2DP_SERVICE_1900 | testA2dpService0019 | Verify skip controls report success but keep the track index when the playlist is empty. | Level 1 | Pass |
| SUB_A2DP_SERVICE_2000 | testA2dpService0020 | Verify setting a normal volume synchronizes model, playback info and history. | Level 0 | Pass |
| SUB_A2DP_SERVICE_2100 | testA2dpService0021 | Verify volume clamping, rounding and the mute flag at the range boundaries. | Level 1 | Pass |
| SUB_A2DP_SERVICE_2200 | testA2dpService0022 | Verify setVolume is rejected before initialization and keeps the default volume. | Level 1 | Pass |
| SUB_A2DP_SERVICE_2300 | testA2dpService0023 | Verify selecting a supported codec switches the single active codec and updates metrics. | Level 0 | Pass |
| SUB_A2DP_SERVICE_2400 | testA2dpService0024 | Verify an unsupported codec is rejected and leaves the active codec unchanged. | Level 1 | Pass |
| SUB_A2DP_SERVICE_2500 | testA2dpService0025 | Verify getters return defensive copies for devices, playback info, metrics and codecs. | Level 1 | Pass |
| SUB_A2DP_SERVICE_2600 | testA2dpService0026 | Verify statistics reflect the connected, playing and codec-switched state. | Level 0 | Pass |
| SUB_A2DP_SERVICE_2700 | testA2dpService0027 | Verify stream config and device capability return null because they are never populated. | Level 1 | Pass |
| SUB_A2DP_SERVICE_2800 | testA2dpService0028 | Verify connection callbacks fire for connect transitions and stop after removal. | Level 0 | Pass |
| SUB_A2DP_SERVICE_2900 | testA2dpService0029 | Verify data and playback callbacks fire on play and stop firing after removal. | Level 0 | Pass |
| SUB_A2DP_SERVICE_3000 | testA2dpService0030 | Verify a throwing data callback does not break play or later callbacks. | Level 1 | Pass |

## AVRCP 服务 XTS 用例

套件 `AvrcpServiceTest`，测试文件：`entry/src/ohosTest/ets/test/Service/AvrcpService.test.ets`，共 30 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_AVRCP_SERVICE_0100 | testAvrcpService0001 | Verify the default view of a service instance created but never initialized. | Level 0 | Pass |
| SUB_AVRCP_SERVICE_0200 | testAvrcpService0002 | Verify the first initialize call succeeds and establishes a clean service baseline. | Level 0 | Pass |
| SUB_AVRCP_SERVICE_0300 | testAvrcpService0003 | Verify a repeated initialize is rejected and preserves the live connection state. | Level 0 | Pass |
| SUB_AVRCP_SERVICE_0400 | testAvrcpService0004 | Verify connect and syncData are rejected before the service is initialized. | Level 0 | Pass |
| SUB_AVRCP_SERVICE_0500 | testAvrcpService0005 | Verify destroy releases all callbacks and lets the service be initialized again. | Level 0 | Pass |
| SUB_AVRCP_SERVICE_0600 | testAvrcpService0006 | Verify a successful connection writes transitions history and an operation record. | Level 0 | Pass |
| SUB_AVRCP_SERVICE_0700 | testAvrcpService0007 | Verify connect rejects an empty device identifier without changing any state. | Level 0 | Pass |
| SUB_AVRCP_SERVICE_0800 | testAvrcpService0008 | Verify reconnecting an already connected device reports success without new side effects. | Level 1 | Pass |
| SUB_AVRCP_SERVICE_0900 | testAvrcpService0009 | Verify two devices can be connected and are tracked in the order they joined. | Level 0 | Pass |
| SUB_AVRCP_SERVICE_1000 | testAvrcpService0010 | Verify disconnecting an unknown device is rejected and leaves the connection untouched. | Level 0 | Pass |
| SUB_AVRCP_SERVICE_1100 | testAvrcpService0011 | Verify disconnecting one of two devices keeps the service connected and skips the model reset. | Level 1 | Pass |
| SUB_AVRCP_SERVICE_1200 | testAvrcpService0012 | Verify a successful connection leaves the bound model untouched by the state entry point. | Level 1 | Pass |
| SUB_AVRCP_SERVICE_1300 | testAvrcpService0013 | Verify dropping the last connection resets the model and returns the service to disconnected. | Level 0 | Pass |
| SUB_AVRCP_SERVICE_1400 | testAvrcpService0014 | Verify the accessor methods return defensive copies rather than internal collections. | Level 1 | Pass |
| SUB_AVRCP_SERVICE_1500 | testAvrcpService0015 | Verify syncing data on a connected device records one operation and no state transition. | Level 0 | Pass |
| SUB_AVRCP_SERVICE_1600 | testAvrcpService0016 | Verify syncing data for a disconnected device is rejected without counting a sync event. | Level 0 | Pass |
| SUB_AVRCP_SERVICE_1700 | testAvrcpService0017 | Verify the connection configuration merges partial updates and returns a detached copy. | Level 0 | Pass |
| SUB_AVRCP_SERVICE_1800 | testAvrcpService0018 | Verify a shortened connection timeout still completes the handshake with full bookkeeping. | Level 1 | Pass |
| SUB_AVRCP_SERVICE_1900 | testAvrcpService0019 | Verify the derived performance metrics keep duration and error aggregates untouched. | Level 1 | Pass |
| SUB_AVRCP_SERVICE_2000 | testAvrcpService0020 | Verify connection callbacks fire once per settled connection and skip intermediate states. | Level 0 | Pass |
| SUB_AVRCP_SERVICE_2100 | testAvrcpService0021 | Verify registering the same callback twice is deduplicated and removal is selective. | Level 1 | Pass |
| SUB_AVRCP_SERVICE_2200 | testAvrcpService0022 | Verify data and operation callbacks receive live payloads and a throwing listener is isolated. | Level 1 | Pass |
| SUB_AVRCP_SERVICE_2300 | testAvrcpService0023 | Verify the operation history is trimmed to its ceiling while the counters keep growing. | Level 1 | Pass |
| SUB_AVRCP_SERVICE_2400 | testAvrcpService0024 | Verify rejected operations create no record while accepted ones receive increasing identifiers. | Level 1 | Pass |
| SUB_AVRCP_SERVICE_2500 | testAvrcpService0025 | Verify the statistics snapshot agrees with every individual accessor after a session. | Level 0 | Pass |
| SUB_AVRCP_SERVICE_2600 | testAvrcpService0026 | Verify reset drops every session collection while the accumulated metrics survive. | Level 1 | Pass |
| SUB_AVRCP_SERVICE_2700 | testAvrcpService0027 | Verify the operation identifier counter is not restored by reset although the record list is. | Level 1 | Pass |
| SUB_AVRCP_SERVICE_2800 | testAvrcpService0028 | Verify every entry point is rejected after destroy until the service is initialized again. | Level 0 | Pass |
| SUB_AVRCP_SERVICE_2900 | testAvrcpService0029 | Verify a full initialize connect sync disconnect destroy lifecycle leaves a clean service. | Level 0 | Pass |
| SUB_AVRCP_SERVICE_3000 | testAvrcpService0030 | Verify two service instances keep their models devices histories and metrics independent. | Level 1 | Pass |

## 蓝牙扫描服务 XTS 用例

套件 `BluetoothScanServiceTest`，测试文件：`entry/src/ohosTest/ets/test/Service/BluetoothScanService.test.ets`，共 10 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_BT_SCAN_0100 | testBluetoothScan0001 | Verify the initial idle state exposes empty scan results. | Level 0 | Pass |
| SUB_BT_SCAN_0200 | testBluetoothScan0002 | Verify a full scan discovers the expected mock devices and completes. | Level 0 | Pass |
| SUB_BT_SCAN_0300 | testBluetoothScan0003 | Verify a second start request is rejected while a scan is running. | Level 1 | Pass |
| SUB_BT_SCAN_0400 | testBluetoothScan0004 | Verify scan callbacks receive every device and complete notification, isolating listener errors. | Level 1 | Pass |
| SUB_BT_SCAN_0500 | testBluetoothScan0005 | Verify stopScan switches the state immediately and is safe to call repeatedly. | Level 1 | Pass |
| SUB_BT_SCAN_0600 | testBluetoothScan0006 | Verify name filtering is case insensitive and handles empty and unmatched keywords. | Level 0 | Pass |
| SUB_BT_SCAN_0700 | testBluetoothScan0007 | Verify type filtering returns devices of the requested type only. | Level 0 | Pass |
| SUB_BT_SCAN_0800 | testBluetoothScan0008 | Verify RSSI sorting is descending and the discovered list is returned as a copy. | Level 1 | Pass |
| SUB_BT_SCAN_0900 | testBluetoothScan0009 | Verify clearDevices empties results without touching state and reset restores the idle state. | Level 1 | Pass |
| SUB_BT_SCAN_1000 | testBluetoothScan0010 | Verify reset removes registered callbacks so later scans deliver no notifications. | Level 1 | Pass |

## 蓝牙连接管理器 XTS 用例

套件 `ConnectionManagerTest`，测试文件：`entry/src/ohosTest/ets/test/Service/ConnectionManager.test.ets`，共 12 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_CONN_MGR_0100 | testConnMgr0001 | Verify initial state and that initialize resets all connection data. | Level 0 | Pass |
| SUB_CONN_MGR_0200 | testConnMgr0002 | Verify that connect and disconnect are rejected before initialization. | Level 1 | Pass |
| SUB_CONN_MGR_0300 | testConnMgr0003 | Verify a successful connection updates device, records and profile lookup. | Level 0 | Pass |
| SUB_CONN_MGR_0400 | testConnMgr0004 | Verify the simulated connection failure is recorded and reported to error callbacks. | Level 1 | Pass |
| SUB_CONN_MGR_0500 | testConnMgr0005 | Verify repeated connect with the same profile is idempotent while other profiles stay independent. | Level 1 | Pass |
| SUB_CONN_MGR_0600 | testConnMgr0006 | Verify the maximum connected device limit rejects additional devices. | Level 1 | Pass |
| SUB_CONN_MGR_0700 | testConnMgr0007 | Verify the fifth rapid connection attempt succeeds and the sixth is rate limited. | Level 1 | Pass |
| SUB_CONN_MGR_0800 | testConnMgr0008 | Verify disconnectAll releases a single connected device and returns the released count. | Level 0 | Pass |
| SUB_CONN_MGR_0900 | testConnMgr0009 | Verify record queries by device, profile and time window return defensive copies. | Level 1 | Pass |
| SUB_CONN_MGR_1000 | testConnMgr0010 | Verify statistics aggregate connections, disconnections and profile counters consistently. | Level 1 | Pass |
| SUB_CONN_MGR_1100 | testConnMgr0011 | Verify all callbacks are notified, a throwing callback is isolated and reset clears callbacks. | Level 1 | Pass |
| SUB_CONN_MGR_1200 | testConnMgr0012 | Verify reset clears connections and records while destroy blocks further connections. | Level 1 | Pass |

## HDP 服务 XTS 用例

套件 `HdpServiceTest`，测试文件：`entry/src/ohosTest/ets/test/Service/HdpService.test.ets`，共 30 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_HDP_SERVICE_0100 | testHdpService0001 | Verify the default view of a service instance created but never initialized. | Level 0 | Pass |
| SUB_HDP_SERVICE_0200 | testHdpService0002 | Verify the first initialize call succeeds and establishes a clean service baseline. | Level 0 | Pass |
| SUB_HDP_SERVICE_0300 | testHdpService0003 | Verify a repeated initialize is rejected and preserves the live connection state. | Level 0 | Pass |
| SUB_HDP_SERVICE_0400 | testHdpService0004 | Verify connect and syncData are rejected before the service is initialized. | Level 0 | Pass |
| SUB_HDP_SERVICE_0500 | testHdpService0005 | Verify destroy releases all callbacks and lets the service be initialized again. | Level 0 | Pass |
| SUB_HDP_SERVICE_0600 | testHdpService0006 | Verify a successful connection writes transitions history and an operation record. | Level 0 | Pass |
| SUB_HDP_SERVICE_0700 | testHdpService0007 | Verify connect rejects an empty device identifier without changing any state. | Level 0 | Pass |
| SUB_HDP_SERVICE_0800 | testHdpService0008 | Verify reconnecting an already connected device reports success without new side effects. | Level 1 | Pass |
| SUB_HDP_SERVICE_0900 | testHdpService0009 | Verify two devices can be connected and are tracked in the order they joined. | Level 0 | Pass |
| SUB_HDP_SERVICE_1000 | testHdpService0010 | Verify disconnecting an unknown device is rejected and leaves the connection untouched. | Level 0 | Pass |
| SUB_HDP_SERVICE_1100 | testHdpService0011 | Verify disconnecting one of two devices keeps the service connected and skips the model reset. | Level 1 | Pass |
| SUB_HDP_SERVICE_1200 | testHdpService0012 | Verify a successful connection leaves the bound model untouched by the state entry point. | Level 1 | Pass |
| SUB_HDP_SERVICE_1300 | testHdpService0013 | Verify dropping the last connection resets the model and returns the service to disconnected. | Level 0 | Pass |
| SUB_HDP_SERVICE_1400 | testHdpService0014 | Verify the accessor methods return defensive copies rather than internal collections. | Level 1 | Pass |
| SUB_HDP_SERVICE_1500 | testHdpService0015 | Verify syncing data on a connected device records one operation and no state transition. | Level 0 | Pass |
| SUB_HDP_SERVICE_1600 | testHdpService0016 | Verify syncing data for a disconnected device is rejected without counting a sync event. | Level 0 | Pass |
| SUB_HDP_SERVICE_1700 | testHdpService0017 | Verify the connection configuration merges partial updates and returns a detached copy. | Level 0 | Pass |
| SUB_HDP_SERVICE_1800 | testHdpService0018 | Verify a shortened connection timeout still completes the handshake with full bookkeeping. | Level 1 | Pass |
| SUB_HDP_SERVICE_1900 | testHdpService0019 | Verify the derived performance metrics keep duration and error aggregates untouched. | Level 1 | Pass |
| SUB_HDP_SERVICE_2000 | testHdpService0020 | Verify connection callbacks fire once per settled connection and skip intermediate states. | Level 0 | Pass |
| SUB_HDP_SERVICE_2100 | testHdpService0021 | Verify registering the same callback twice is deduplicated and removal is selective. | Level 1 | Pass |
| SUB_HDP_SERVICE_2200 | testHdpService0022 | Verify data and operation callbacks receive live payloads and a throwing listener is isolated. | Level 1 | Pass |
| SUB_HDP_SERVICE_2300 | testHdpService0023 | Verify the operation history is trimmed to its ceiling while the counters keep growing. | Level 1 | Pass |
| SUB_HDP_SERVICE_2400 | testHdpService0024 | Verify rejected operations create no record while accepted ones receive increasing identifiers. | Level 1 | Pass |
| SUB_HDP_SERVICE_2500 | testHdpService0025 | Verify the statistics snapshot agrees with every individual accessor after a session. | Level 0 | Pass |
| SUB_HDP_SERVICE_2600 | testHdpService0026 | Verify reset drops every session collection while the accumulated metrics survive. | Level 1 | Pass |
| SUB_HDP_SERVICE_2700 | testHdpService0027 | Verify the operation identifier counter is not restored by reset although the record list is. | Level 1 | Pass |
| SUB_HDP_SERVICE_2800 | testHdpService0028 | Verify every entry point is rejected after destroy until the service is initialized again. | Level 0 | Pass |
| SUB_HDP_SERVICE_2900 | testHdpService0029 | Verify a full initialize connect sync disconnect destroy lifecycle leaves a clean service. | Level 0 | Pass |
| SUB_HDP_SERVICE_3000 | testHdpService0030 | Verify two service instances keep their models devices histories and metrics independent. | Level 1 | Pass |

## HFP 服务 XTS 用例

套件 `HfpServiceTest`，测试文件：`entry/src/ohosTest/ets/test/Service/HfpService.test.ets`，共 30 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_HFP_SERVICE_0100 | testHfpService0001 | Verify the default state of a newly created service before initialization. | Level 0 | Pass |
| SUB_HFP_SERVICE_0200 | testHfpService0002 | Verify initialization creates default audio, network and battery configurations. | Level 0 | Pass |
| SUB_HFP_SERVICE_0300 | testHfpService0003 | Verify a repeated initialization is rejected and recorded as a failed operation. | Level 1 | Pass |
| SUB_HFP_SERVICE_0400 | testHfpService0004 | Verify destroy clears all callback registrations and allows re-initialization. | Level 0 | Pass |
| SUB_HFP_SERVICE_0500 | testHfpService0005 | Verify connect is rejected before initialization. | Level 1 | Pass |
| SUB_HFP_SERVICE_0600 | testHfpService0006 | Verify connect rejects an empty device identifier. | Level 1 | Pass |
| SUB_HFP_SERVICE_0700 | testHfpService0007 | Verify a successful connection updates connection state, HFP state and statistics. | Level 0 | Pass |
| SUB_HFP_SERVICE_0800 | testHfpService0008 | Verify reconnecting the same device is idempotent but recorded as already connected. | Level 1 | Pass |
| SUB_HFP_SERVICE_0900 | testHfpService0009 | Verify disconnecting one of two connected devices keeps the service connected. | Level 1 | Pass |
| SUB_HFP_SERVICE_1000 | testHfpService0010 | Verify disconnecting the last device resets model state and connection flags. | Level 0 | Pass |
| SUB_HFP_SERVICE_1100 | testHfpService0011 | Verify disconnect is rejected before initialization and for unknown devices. | Level 1 | Pass |
| SUB_HFP_SERVICE_1200 | testHfpService0012 | Verify reset clears connections and call state while restoring default audio config. | Level 0 | Pass |
| SUB_HFP_SERVICE_1300 | testHfpService0013 | Verify destroy releases connections and registered callbacks. | Level 0 | Pass |
| SUB_HFP_SERVICE_1400 | testHfpService0014 | Verify all call controls are rejected when no device is connected. | Level 1 | Pass |
| SUB_HFP_SERVICE_1500 | testHfpService0015 | Verify answerCall activates the call state without an incoming call record. | Level 1 | Pass |
| SUB_HFP_SERVICE_1600 | testHfpService0016 | Verify dialNumber creates an outgoing call with expected metadata. | Level 0 | Pass |
| SUB_HFP_SERVICE_1700 | testHfpService0017 | Verify dialNumber rejects an empty phone number and keeps state idle. | Level 1 | Pass |
| SUB_HFP_SERVICE_1800 | testHfpService0018 | Verify holdCall and resumeCall switch the call hold flag and model state. | Level 0 | Pass |
| SUB_HFP_SERVICE_1900 | testHfpService0019 | Verify holdCall and resumeCall guards reject calls in the wrong state. | Level 1 | Pass |
| SUB_HFP_SERVICE_2000 | testHfpService0020 | Verify endCall archives the call record and clears the active call. | Level 0 | Pass |
| SUB_HFP_SERVICE_2100 | testHfpService0021 | Verify rejectCall archives the call as rejected and resets call state. | Level 0 | Pass |
| SUB_HFP_SERVICE_2200 | testHfpService0022 | Verify endCall and rejectCall succeed without an active call and keep counts at zero. | Level 1 | Pass |
| SUB_HFP_SERVICE_2300 | testHfpService0023 | Verify redialLastNumber requires call history and redials the archived number. | Level 0 | Pass |
| SUB_HFP_SERVICE_2400 | testHfpService0024 | Verify microphone and speaker volume clamping keeps model and config in sync. | Level 0 | Pass |
| SUB_HFP_SERVICE_2500 | testHfpService0025 | Verify mute and speaker toggles flip model, config and audio routing. | Level 0 | Pass |
| SUB_HFP_SERVICE_2600 | testHfpService0026 | Verify audio controls are rejected before initialization and keep default values. | Level 1 | Pass |
| SUB_HFP_SERVICE_2700 | testHfpService0027 | Verify voice recognition lifecycle and the unguarded stop path. | Level 1 | Pass |
| SUB_HFP_SERVICE_2800 | testHfpService0028 | Verify statistics reflect connection, call and callback state. | Level 0 | Pass |
| SUB_HFP_SERVICE_2900 | testHfpService0029 | Verify getters return defensive copies and call callback registration deduplicates. | Level 1 | Pass |
| SUB_HFP_SERVICE_3000 | testHfpService0030 | Verify connection, data and call callbacks fire on connect and dial, and stop after removal. | Level 0 | Pass |

## HID 服务 XTS 用例

套件 `HidServiceTest`，测试文件：`entry/src/ohosTest/ets/test/Service/HidService.test.ets`，共 30 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_HID_SERVICE_0100 | testHidService0001 | Verify the default view of a service instance created but never initialized. | Level 0 | Pass |
| SUB_HID_SERVICE_0200 | testHidService0002 | Verify the first initialize call succeeds and establishes a clean service baseline. | Level 0 | Pass |
| SUB_HID_SERVICE_0300 | testHidService0003 | Verify a repeated initialize is rejected and preserves the live connection state. | Level 0 | Pass |
| SUB_HID_SERVICE_0400 | testHidService0004 | Verify connect and syncData are rejected before the service is initialized. | Level 0 | Pass |
| SUB_HID_SERVICE_0500 | testHidService0005 | Verify destroy releases all callbacks and lets the service be initialized again. | Level 0 | Pass |
| SUB_HID_SERVICE_0600 | testHidService0006 | Verify a successful connection writes transitions history and an operation record. | Level 0 | Pass |
| SUB_HID_SERVICE_0700 | testHidService0007 | Verify connect rejects an empty device identifier without changing any state. | Level 0 | Pass |
| SUB_HID_SERVICE_0800 | testHidService0008 | Verify reconnecting an already connected device reports success without new side effects. | Level 1 | Pass |
| SUB_HID_SERVICE_0900 | testHidService0009 | Verify two devices can be connected and are tracked in the order they joined. | Level 0 | Pass |
| SUB_HID_SERVICE_1000 | testHidService0010 | Verify disconnecting an unknown device is rejected and leaves the connection untouched. | Level 0 | Pass |
| SUB_HID_SERVICE_1100 | testHidService0011 | Verify disconnecting one of two devices keeps the service connected and skips the model reset. | Level 1 | Pass |
| SUB_HID_SERVICE_1200 | testHidService0012 | Verify a successful connection leaves the bound model untouched by the state entry point. | Level 1 | Pass |
| SUB_HID_SERVICE_1300 | testHidService0013 | Verify dropping the last connection resets the model and returns the service to disconnected. | Level 0 | Pass |
| SUB_HID_SERVICE_1400 | testHidService0014 | Verify the accessor methods return defensive copies rather than internal collections. | Level 1 | Pass |
| SUB_HID_SERVICE_1500 | testHidService0015 | Verify syncing data on a connected device records one operation and no state transition. | Level 0 | Pass |
| SUB_HID_SERVICE_1600 | testHidService0016 | Verify syncing data for a disconnected device is rejected without counting a sync event. | Level 0 | Pass |
| SUB_HID_SERVICE_1700 | testHidService0017 | Verify the connection configuration merges partial updates and returns a detached copy. | Level 0 | Pass |
| SUB_HID_SERVICE_1800 | testHidService0018 | Verify a shortened connection timeout still completes the handshake with full bookkeeping. | Level 1 | Pass |
| SUB_HID_SERVICE_1900 | testHidService0019 | Verify the derived performance metrics keep duration and error aggregates untouched. | Level 1 | Pass |
| SUB_HID_SERVICE_2000 | testHidService0020 | Verify connection callbacks fire once per settled connection and skip intermediate states. | Level 0 | Pass |
| SUB_HID_SERVICE_2100 | testHidService0021 | Verify registering the same callback twice is deduplicated and removal is selective. | Level 1 | Pass |
| SUB_HID_SERVICE_2200 | testHidService0022 | Verify data and operation callbacks receive live payloads and a throwing listener is isolated. | Level 1 | Pass |
| SUB_HID_SERVICE_2300 | testHidService0023 | Verify the operation history is trimmed to its ceiling while the counters keep growing. | Level 1 | Pass |
| SUB_HID_SERVICE_2400 | testHidService0024 | Verify rejected operations create no record while accepted ones receive increasing identifiers. | Level 1 | Pass |
| SUB_HID_SERVICE_2500 | testHidService0025 | Verify the statistics snapshot agrees with every individual accessor after a session. | Level 0 | Pass |
| SUB_HID_SERVICE_2600 | testHidService0026 | Verify reset drops every session collection while the accumulated metrics survive. | Level 1 | Pass |
| SUB_HID_SERVICE_2700 | testHidService0027 | Verify the operation identifier counter is not restored by reset although the record list is. | Level 1 | Pass |
| SUB_HID_SERVICE_2800 | testHidService0028 | Verify every entry point is rejected after destroy until the service is initialized again. | Level 0 | Pass |
| SUB_HID_SERVICE_2900 | testHidService0029 | Verify a full initialize connect sync disconnect destroy lifecycle leaves a clean service. | Level 0 | Pass |
| SUB_HID_SERVICE_3000 | testHidService0030 | Verify two service instances keep their models devices histories and metrics independent. | Level 1 | Pass |

## MAP 服务 XTS 用例

套件 `MapServiceTest`，测试文件：`entry/src/ohosTest/ets/test/Service/MapService.test.ets`，共 30 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_MAP_SERVICE_0100 | testMapService0001 | Verify the default view of a service instance created but never initialized. | Level 0 | Pass |
| SUB_MAP_SERVICE_0200 | testMapService0002 | Verify the first initialize call succeeds and establishes a clean service baseline. | Level 0 | Pass |
| SUB_MAP_SERVICE_0300 | testMapService0003 | Verify a repeated initialize is rejected and preserves the live connection state. | Level 0 | Pass |
| SUB_MAP_SERVICE_0400 | testMapService0004 | Verify connect and syncData are rejected before the service is initialized. | Level 0 | Pass |
| SUB_MAP_SERVICE_0500 | testMapService0005 | Verify destroy releases all callbacks and lets the service be initialized again. | Level 0 | Pass |
| SUB_MAP_SERVICE_0600 | testMapService0006 | Verify a successful connection writes transitions history and an operation record. | Level 0 | Pass |
| SUB_MAP_SERVICE_0700 | testMapService0007 | Verify connect rejects an empty device identifier without changing any state. | Level 0 | Pass |
| SUB_MAP_SERVICE_0800 | testMapService0008 | Verify reconnecting an already connected device reports success without new side effects. | Level 1 | Pass |
| SUB_MAP_SERVICE_0900 | testMapService0009 | Verify two devices can be connected and are tracked in the order they joined. | Level 0 | Pass |
| SUB_MAP_SERVICE_1000 | testMapService0010 | Verify disconnecting an unknown device is rejected and leaves the connection untouched. | Level 0 | Pass |
| SUB_MAP_SERVICE_1100 | testMapService0011 | Verify disconnecting one of two devices keeps the service connected and skips the model reset. | Level 1 | Pass |
| SUB_MAP_SERVICE_1200 | testMapService0012 | Verify a successful connection leaves the bound model untouched by the state entry point. | Level 1 | Pass |
| SUB_MAP_SERVICE_1300 | testMapService0013 | Verify dropping the last connection resets the model and returns the service to disconnected. | Level 0 | Pass |
| SUB_MAP_SERVICE_1400 | testMapService0014 | Verify the accessor methods return defensive copies rather than internal collections. | Level 1 | Pass |
| SUB_MAP_SERVICE_1500 | testMapService0015 | Verify syncing data on a connected device records one operation and no state transition. | Level 0 | Pass |
| SUB_MAP_SERVICE_1600 | testMapService0016 | Verify syncing data for a disconnected device is rejected without counting a sync event. | Level 0 | Pass |
| SUB_MAP_SERVICE_1700 | testMapService0017 | Verify the connection configuration merges partial updates and returns a detached copy. | Level 0 | Pass |
| SUB_MAP_SERVICE_1800 | testMapService0018 | Verify a shortened connection timeout still completes the handshake with full bookkeeping. | Level 1 | Pass |
| SUB_MAP_SERVICE_1900 | testMapService0019 | Verify the derived performance metrics keep duration and error aggregates untouched. | Level 1 | Pass |
| SUB_MAP_SERVICE_2000 | testMapService0020 | Verify connection callbacks fire once per settled connection and skip intermediate states. | Level 0 | Pass |
| SUB_MAP_SERVICE_2100 | testMapService0021 | Verify registering the same callback twice is deduplicated and removal is selective. | Level 1 | Pass |
| SUB_MAP_SERVICE_2200 | testMapService0022 | Verify data and operation callbacks receive live payloads and a throwing listener is isolated. | Level 1 | Pass |
| SUB_MAP_SERVICE_2300 | testMapService0023 | Verify the operation history is trimmed to its ceiling while the counters keep growing. | Level 1 | Pass |
| SUB_MAP_SERVICE_2400 | testMapService0024 | Verify rejected operations create no record while accepted ones receive increasing identifiers. | Level 1 | Pass |
| SUB_MAP_SERVICE_2500 | testMapService0025 | Verify the statistics snapshot agrees with every individual accessor after a session. | Level 0 | Pass |
| SUB_MAP_SERVICE_2600 | testMapService0026 | Verify reset drops every session collection while the accumulated metrics survive. | Level 1 | Pass |
| SUB_MAP_SERVICE_2700 | testMapService0027 | Verify the operation identifier counter is not restored by reset although the record list is. | Level 1 | Pass |
| SUB_MAP_SERVICE_2800 | testMapService0028 | Verify every entry point is rejected after destroy until the service is initialized again. | Level 0 | Pass |
| SUB_MAP_SERVICE_2900 | testMapService0029 | Verify a full initialize connect sync disconnect destroy lifecycle leaves a clean service. | Level 0 | Pass |
| SUB_MAP_SERVICE_3000 | testMapService0030 | Verify two service instances keep their models devices histories and metrics independent. | Level 1 | Pass |

## PAN 服务 XTS 用例

套件 `PanServiceTest`，测试文件：`entry/src/ohosTest/ets/test/Service/PanService.test.ets`，共 30 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_PAN_SERVICE_0100 | testPanService0001 | Verify the default view of a service instance created but never initialized. | Level 0 | Pass |
| SUB_PAN_SERVICE_0200 | testPanService0002 | Verify the first initialize call succeeds and establishes a clean service baseline. | Level 0 | Pass |
| SUB_PAN_SERVICE_0300 | testPanService0003 | Verify a repeated initialize is rejected and preserves the live connection state. | Level 0 | Pass |
| SUB_PAN_SERVICE_0400 | testPanService0004 | Verify connect and syncData are rejected before the service is initialized. | Level 0 | Pass |
| SUB_PAN_SERVICE_0500 | testPanService0005 | Verify destroy releases all callbacks and lets the service be initialized again. | Level 0 | Pass |
| SUB_PAN_SERVICE_0600 | testPanService0006 | Verify a successful connection writes transitions history and an operation record. | Level 0 | Pass |
| SUB_PAN_SERVICE_0700 | testPanService0007 | Verify connect rejects an empty device identifier without changing any state. | Level 0 | Pass |
| SUB_PAN_SERVICE_0800 | testPanService0008 | Verify reconnecting an already connected device reports success without new side effects. | Level 1 | Pass |
| SUB_PAN_SERVICE_0900 | testPanService0009 | Verify two devices can be connected and are tracked in the order they joined. | Level 0 | Pass |
| SUB_PAN_SERVICE_1000 | testPanService0010 | Verify disconnecting an unknown device is rejected and leaves the connection untouched. | Level 0 | Pass |
| SUB_PAN_SERVICE_1100 | testPanService0011 | Verify disconnecting one of two devices keeps the service connected and skips the model reset. | Level 1 | Pass |
| SUB_PAN_SERVICE_1200 | testPanService0012 | Verify a successful connection leaves the bound model untouched by the state entry point. | Level 1 | Pass |
| SUB_PAN_SERVICE_1300 | testPanService0013 | Verify dropping the last connection resets the model and returns the service to disconnected. | Level 0 | Pass |
| SUB_PAN_SERVICE_1400 | testPanService0014 | Verify the accessor methods return defensive copies rather than internal collections. | Level 1 | Pass |
| SUB_PAN_SERVICE_1500 | testPanService0015 | Verify syncing data on a connected device records one operation and no state transition. | Level 0 | Pass |
| SUB_PAN_SERVICE_1600 | testPanService0016 | Verify syncing data for a disconnected device is rejected without counting a sync event. | Level 0 | Pass |
| SUB_PAN_SERVICE_1700 | testPanService0017 | Verify the connection configuration merges partial updates and returns a detached copy. | Level 0 | Pass |
| SUB_PAN_SERVICE_1800 | testPanService0018 | Verify a shortened connection timeout still completes the handshake with full bookkeeping. | Level 1 | Pass |
| SUB_PAN_SERVICE_1900 | testPanService0019 | Verify the derived performance metrics keep duration and error aggregates untouched. | Level 1 | Pass |
| SUB_PAN_SERVICE_2000 | testPanService0020 | Verify connection callbacks fire once per settled connection and skip intermediate states. | Level 0 | Pass |
| SUB_PAN_SERVICE_2100 | testPanService0021 | Verify registering the same callback twice is deduplicated and removal is selective. | Level 1 | Pass |
| SUB_PAN_SERVICE_2200 | testPanService0022 | Verify data and operation callbacks receive live payloads and a throwing listener is isolated. | Level 1 | Pass |
| SUB_PAN_SERVICE_2300 | testPanService0023 | Verify the operation history is trimmed to its ceiling while the counters keep growing. | Level 1 | Pass |
| SUB_PAN_SERVICE_2400 | testPanService0024 | Verify rejected operations create no record while accepted ones receive increasing identifiers. | Level 1 | Pass |
| SUB_PAN_SERVICE_2500 | testPanService0025 | Verify the statistics snapshot agrees with every individual accessor after a session. | Level 0 | Pass |
| SUB_PAN_SERVICE_2600 | testPanService0026 | Verify reset drops every session collection while the accumulated metrics survive. | Level 1 | Pass |
| SUB_PAN_SERVICE_2700 | testPanService0027 | Verify the operation identifier counter is not restored by reset although the record list is. | Level 1 | Pass |
| SUB_PAN_SERVICE_2800 | testPanService0028 | Verify every entry point is rejected after destroy until the service is initialized again. | Level 0 | Pass |
| SUB_PAN_SERVICE_2900 | testPanService0029 | Verify a full initialize connect sync disconnect destroy lifecycle leaves a clean service. | Level 0 | Pass |
| SUB_PAN_SERVICE_3000 | testPanService0030 | Verify two service instances keep their models devices histories and metrics independent. | Level 1 | Pass |

## PBAP 服务 XTS 用例

套件 `PbapServiceTest`，测试文件：`entry/src/ohosTest/ets/test/Service/PbapService.test.ets`，共 30 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_PBAP_SERVICE_0100 | testPbapService0001 | Verify the default view of a service instance created but never initialized. | Level 0 | Pass |
| SUB_PBAP_SERVICE_0200 | testPbapService0002 | Verify the first initialize call succeeds and establishes a clean service baseline. | Level 0 | Pass |
| SUB_PBAP_SERVICE_0300 | testPbapService0003 | Verify a repeated initialize is rejected and preserves the live connection state. | Level 0 | Pass |
| SUB_PBAP_SERVICE_0400 | testPbapService0004 | Verify connect and syncData are rejected before the service is initialized. | Level 0 | Pass |
| SUB_PBAP_SERVICE_0500 | testPbapService0005 | Verify destroy releases all callbacks and lets the service be initialized again. | Level 0 | Pass |
| SUB_PBAP_SERVICE_0600 | testPbapService0006 | Verify a successful connection writes transitions history and an operation record. | Level 0 | Pass |
| SUB_PBAP_SERVICE_0700 | testPbapService0007 | Verify connect rejects an empty device identifier without changing any state. | Level 0 | Pass |
| SUB_PBAP_SERVICE_0800 | testPbapService0008 | Verify reconnecting an already connected device reports success without new side effects. | Level 1 | Pass |
| SUB_PBAP_SERVICE_0900 | testPbapService0009 | Verify two devices can be connected and are tracked in the order they joined. | Level 0 | Pass |
| SUB_PBAP_SERVICE_1000 | testPbapService0010 | Verify disconnecting an unknown device is rejected and leaves the connection untouched. | Level 0 | Pass |
| SUB_PBAP_SERVICE_1100 | testPbapService0011 | Verify disconnecting one of two devices keeps the service connected and skips the model reset. | Level 1 | Pass |
| SUB_PBAP_SERVICE_1200 | testPbapService0012 | Verify a successful connection leaves the bound model untouched by the state entry point. | Level 1 | Pass |
| SUB_PBAP_SERVICE_1300 | testPbapService0013 | Verify dropping the last connection resets the model and returns the service to disconnected. | Level 0 | Pass |
| SUB_PBAP_SERVICE_1400 | testPbapService0014 | Verify the accessor methods return defensive copies rather than internal collections. | Level 1 | Pass |
| SUB_PBAP_SERVICE_1500 | testPbapService0015 | Verify syncing data on a connected device records one operation and no state transition. | Level 0 | Pass |
| SUB_PBAP_SERVICE_1600 | testPbapService0016 | Verify syncing data for a disconnected device is rejected without counting a sync event. | Level 0 | Pass |
| SUB_PBAP_SERVICE_1700 | testPbapService0017 | Verify the connection configuration merges partial updates and returns a detached copy. | Level 0 | Pass |
| SUB_PBAP_SERVICE_1800 | testPbapService0018 | Verify a shortened connection timeout still completes the handshake with full bookkeeping. | Level 1 | Pass |
| SUB_PBAP_SERVICE_1900 | testPbapService0019 | Verify the derived performance metrics keep duration and error aggregates untouched. | Level 1 | Pass |
| SUB_PBAP_SERVICE_2000 | testPbapService0020 | Verify connection callbacks fire once per settled connection and skip intermediate states. | Level 0 | Pass |
| SUB_PBAP_SERVICE_2100 | testPbapService0021 | Verify registering the same callback twice is deduplicated and removal is selective. | Level 1 | Pass |
| SUB_PBAP_SERVICE_2200 | testPbapService0022 | Verify data and operation callbacks receive live payloads and a throwing listener is isolated. | Level 1 | Pass |
| SUB_PBAP_SERVICE_2300 | testPbapService0023 | Verify the operation history is trimmed to its ceiling while the counters keep growing. | Level 1 | Pass |
| SUB_PBAP_SERVICE_2400 | testPbapService0024 | Verify rejected operations create no record while accepted ones receive increasing identifiers. | Level 1 | Pass |
| SUB_PBAP_SERVICE_2500 | testPbapService0025 | Verify the statistics snapshot agrees with every individual accessor after a session. | Level 0 | Pass |
| SUB_PBAP_SERVICE_2600 | testPbapService0026 | Verify reset drops every session collection while the accumulated metrics survive. | Level 1 | Pass |
| SUB_PBAP_SERVICE_2700 | testPbapService0027 | Verify the operation identifier counter is not restored by reset although the record list is. | Level 1 | Pass |
| SUB_PBAP_SERVICE_2800 | testPbapService0028 | Verify every entry point is rejected after destroy until the service is initialized again. | Level 0 | Pass |
| SUB_PBAP_SERVICE_2900 | testPbapService0029 | Verify a full initialize connect sync disconnect destroy lifecycle leaves a clean service. | Level 0 | Pass |
| SUB_PBAP_SERVICE_3000 | testPbapService0030 | Verify two service instances keep their models devices histories and metrics independent. | Level 1 | Pass |

## A2DP 数据模型 XTS 用例

套件 `A2dpModelTest`，测试文件：`entry/src/ohosTest/ets/test/Model/A2dpModel.test.ets`，共 16 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_A2DP_MODEL_0100 | testA2dpModel0001 | Verify the default field values of an A2DP model created without arguments. | Level 0 | Pass |
| SUB_A2DP_MODEL_0200 | testA2dpModel0002 | Verify a model built with a device identifier stays disconnected and retryable. | Level 0 | Pass |
| SUB_A2DP_MODEL_0300 | testA2dpModel0003 | Verify entering the connecting state records the start time and one log entry. | Level 0 | Pass |
| SUB_A2DP_MODEL_0400 | testA2dpModel0004 | Verify a successful connection clears the previous error information and retry counter. | Level 0 | Pass |
| SUB_A2DP_MODEL_0500 | testA2dpModel0005 | Verify the disconnecting and disconnected transitions reset the connection duration. | Level 0 | Pass |
| SUB_A2DP_MODEL_0600 | testA2dpModel0006 | Verify the error transition stores the message, the code and the incrementing retry counter. | Level 0 | Pass |
| SUB_A2DP_MODEL_0700 | testA2dpModel0007 | Verify the retry allowance is exhausted exactly after the third failed attempt. | Level 1 | Pass |
| SUB_A2DP_MODEL_0800 | testA2dpModel0008 | Verify each appended log carries an ISO timestamp prefix and raises the operation counter. | Level 0 | Pass |
| SUB_A2DP_MODEL_0900 | testA2dpModel0009 | Verify the log buffer keeps only the latest entries once the configured ceiling is exceeded. | Level 1 | Pass |
| SUB_A2DP_MODEL_1000 | testA2dpModel0010 | Verify the returned log array is a copy and clearing logs keeps the operation counter. | Level 1 | Pass |
| SUB_A2DP_MODEL_1100 | testA2dpModel0011 | Verify updating audio data stores the payload and refreshes the update timestamp. | Level 0 | Pass |
| SUB_A2DP_MODEL_1200 | testA2dpModel0012 | Verify the model keeps the payload by reference so later external edits stay visible. | Level 1 | Pass |
| SUB_A2DP_MODEL_1300 | testA2dpModel0013 | Verify connection state updates are mapped to the matching transitions and unknown states are ignored. | Level 0 | Pass |
| SUB_A2DP_MODEL_1400 | testA2dpModel0014 | Verify the reported connection duration switches between the live and the stored value by state. | Level 1 | Pass |
| SUB_A2DP_MODEL_1500 | testA2dpModel0015 | Verify reset clears session data while the audio settings and device binding survive. | Level 1 | Pass |
| SUB_A2DP_MODEL_1600 | testA2dpModel0016 | Verify the serialized object and the text summary expose session fields but omit audio settings. | Level 1 | Pass |

## AVRCP 数据模型 XTS 用例

套件 `AvrcpModelTest`，测试文件：`entry/src/ohosTest/ets/test/Model/AvrcpModel.test.ets`，共 12 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_AVRCP_MODEL_0100 | testAvrcpModel0001 | Verify the default field values of an AVRCP model created without arguments. | Level 0 | Pass |
| SUB_AVRCP_MODEL_0200 | testAvrcpModel0002 | Verify two models bound to different identifiers keep their own media metadata and counters. | Level 0 | Pass |
| SUB_AVRCP_MODEL_0300 | testAvrcpModel0003 | Verify entering the connecting state records the start time and one log entry. | Level 0 | Pass |
| SUB_AVRCP_MODEL_0400 | testAvrcpModel0004 | Verify a successful connection clears the previous error information and retry counter. | Level 0 | Pass |
| SUB_AVRCP_MODEL_0500 | testAvrcpModel0005 | Verify the disconnecting and disconnected transitions reset the connection duration. | Level 0 | Pass |
| SUB_AVRCP_MODEL_0600 | testAvrcpModel0006 | Verify the retry allowance is exhausted exactly after the third failed attempt. | Level 1 | Pass |
| SUB_AVRCP_MODEL_0700 | testAvrcpModel0007 | Verify appended logs carry an ISO timestamp prefix and the accessor returns a defensive copy. | Level 0 | Pass |
| SUB_AVRCP_MODEL_0800 | testAvrcpModel0008 | Verify the log buffer is trimmed to the ceiling while clearing keeps the operation counter. | Level 1 | Pass |
| SUB_AVRCP_MODEL_0900 | testAvrcpModel0009 | Verify updating media data stores the payload by reference without touching logs or state. | Level 0 | Pass |
| SUB_AVRCP_MODEL_1000 | testAvrcpModel0010 | Verify the connection state entry point only refreshes the timestamp and never mutates the model. | Level 1 | Pass |
| SUB_AVRCP_MODEL_1100 | testAvrcpModel0011 | Verify reset clears session data while media metadata and the device binding survive. | Level 1 | Pass |
| SUB_AVRCP_MODEL_1200 | testAvrcpModel0012 | Verify the serialized object and the text summary expose session fields but omit media metadata. | Level 1 | Pass |

## 蓝牙设备数据模型 XTS 用例

套件 `BluetoothDeviceModelTest`，测试文件：`entry/src/ohosTest/ets/test/Model/BluetoothDeviceModel.test.ets`，共 16 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_BT_DEVICE_MODEL_0100 | testBluetoothDeviceModel0001 | Verify the default field values of a device model created without arguments. | Level 0 | Pass |
| SUB_BT_DEVICE_MODEL_0200 | testBluetoothDeviceModel0002 | Verify a device model built with identity arguments keeps its own empty capability lists. | Level 0 | Pass |
| SUB_BT_DEVICE_MODEL_0300 | testBluetoothDeviceModel0003 | Verify switching to the connected state stores the timestamp and raises the connection counter. | Level 0 | Pass |
| SUB_BT_DEVICE_MODEL_0400 | testBluetoothDeviceModel0004 | Verify transitional and failed states change the label without touching the connection counter. | Level 1 | Pass |
| SUB_BT_DEVICE_MODEL_0500 | testBluetoothDeviceModel0005 | Verify repeated connections accumulate the counter and keep the last timestamp non decreasing. | Level 1 | Pass |
| SUB_BT_DEVICE_MODEL_0600 | testBluetoothDeviceModel0006 | Verify the bonding predicate is satisfied only by the bonded state value twelve. | Level 1 | Pass |
| SUB_BT_DEVICE_MODEL_0700 | testBluetoothDeviceModel0007 | Verify supported profiles are appended once and the support query follows the list content. | Level 0 | Pass |
| SUB_BT_DEVICE_MODEL_0800 | testBluetoothDeviceModel0008 | Verify major services are de duplicated while the insertion order is preserved. | Level 0 | Pass |
| SUB_BT_DEVICE_MODEL_0900 | testBluetoothDeviceModel0009 | Verify the received signal value is clamped at both ends and mapped linearly in between. | Level 1 | Pass |
| SUB_BT_DEVICE_MODEL_1000 | testBluetoothDeviceModel0010 | Verify each signal level boundary switches exactly at the documented percentage thresholds. | Level 1 | Pass |
| SUB_BT_DEVICE_MODEL_1100 | testBluetoothDeviceModel0011 | Verify every device type maps to its own readable label. | Level 0 | Pass |
| SUB_BT_DEVICE_MODEL_1200 | testBluetoothDeviceModel0012 | Verify all defined connection states resolve to a concrete label instead of the fallback text. | Level 0 | Pass |
| SUB_BT_DEVICE_MODEL_1300 | testBluetoothDeviceModel0013 | Verify the readable description carries identity fields and reflects only the state of one instance. | Level 1 | Pass |
| SUB_BT_DEVICE_MODEL_1400 | testBluetoothDeviceModel0014 | Verify the serialized snapshot mirrors every instance field and shares the capability lists. | Level 1 | Pass |
| SUB_BT_DEVICE_MODEL_1500 | testBluetoothDeviceModel0015 | Verify reset drops the connection and signal state while identity and capabilities survive. | Level 1 | Pass |
| SUB_BT_DEVICE_MODEL_1600 | testBluetoothDeviceModel0016 | Verify a full discovery to bonding to connection lifecycle keeps every derived value consistent. | Level 0 | Pass |

## HDP 数据模型 XTS 用例

套件 `HdpModelTest`，测试文件：`entry/src/ohosTest/ets/test/Model/HdpModel.test.ets`，共 12 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_HDP_MODEL_0100 | testHdpModel0001 | Verify the default field values of an HDP model created without arguments. | Level 0 | Pass |
| SUB_HDP_MODEL_0200 | testHdpModel0002 | Verify two models bound to different identifiers keep their own measurement fields and counters. | Level 0 | Pass |
| SUB_HDP_MODEL_0300 | testHdpModel0003 | Verify entering the connecting state records the start time and one log entry. | Level 0 | Pass |
| SUB_HDP_MODEL_0400 | testHdpModel0004 | Verify a successful connection clears the previous error information and retry counter. | Level 0 | Pass |
| SUB_HDP_MODEL_0500 | testHdpModel0005 | Verify the disconnecting and disconnected transitions reset the connection duration. | Level 0 | Pass |
| SUB_HDP_MODEL_0600 | testHdpModel0006 | Verify the retry allowance is exhausted exactly after the third failed attempt. | Level 1 | Pass |
| SUB_HDP_MODEL_0700 | testHdpModel0007 | Verify appended logs carry an ISO timestamp prefix and the accessor returns a defensive copy. | Level 0 | Pass |
| SUB_HDP_MODEL_0800 | testHdpModel0008 | Verify the log buffer is trimmed to the ceiling while clearing keeps the operation counter. | Level 1 | Pass |
| SUB_HDP_MODEL_0900 | testHdpModel0009 | Verify updating health data stores the payload by reference without touching logs or state. | Level 0 | Pass |
| SUB_HDP_MODEL_1000 | testHdpModel0010 | Verify the connection state entry point only refreshes the timestamp and never mutates the model. | Level 1 | Pass |
| SUB_HDP_MODEL_1100 | testHdpModel0011 | Verify reset clears session data while measurement settings and the device binding survive. | Level 1 | Pass |
| SUB_HDP_MODEL_1200 | testHdpModel0012 | Verify the serialized object and the text summary expose session fields but omit measurement settings. | Level 1 | Pass |

## HFP 数据模型 XTS 用例

套件 `HfpModelTest`，测试文件：`entry/src/ohosTest/ets/test/Model/HfpModel.test.ets`，共 16 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_HFP_MODEL_0100 | testHfpModel0001 | Verify the default field values of an HFP model created without arguments. | Level 0 | Pass |
| SUB_HFP_MODEL_0200 | testHfpModel0002 | Verify a model bound to a device identifier starts disconnected and keeps its own state. | Level 0 | Pass |
| SUB_HFP_MODEL_0300 | testHfpModel0003 | Verify entering the connecting state records the start time and one log entry. | Level 0 | Pass |
| SUB_HFP_MODEL_0400 | testHfpModel0004 | Verify a successful connection clears the previous error information and retry counter. | Level 0 | Pass |
| SUB_HFP_MODEL_0500 | testHfpModel0005 | Verify the disconnecting and disconnected transitions reset the connection duration. | Level 0 | Pass |
| SUB_HFP_MODEL_0600 | testHfpModel0006 | Verify the error transition stores the message, the code and the incrementing retry counter. | Level 0 | Pass |
| SUB_HFP_MODEL_0700 | testHfpModel0007 | Verify the retry allowance is exhausted exactly after the third failed attempt. | Level 1 | Pass |
| SUB_HFP_MODEL_0800 | testHfpModel0008 | Verify each appended log carries an ISO timestamp prefix and raises the operation counter. | Level 0 | Pass |
| SUB_HFP_MODEL_0900 | testHfpModel0009 | Verify the log buffer keeps only the latest entries once the configured ceiling is exceeded. | Level 1 | Pass |
| SUB_HFP_MODEL_1000 | testHfpModel0010 | Verify the returned log array is a copy and clearing logs keeps the operation counter. | Level 1 | Pass |
| SUB_HFP_MODEL_1100 | testHfpModel0011 | Verify direct call and audio field updates stay independent from the data payload. | Level 0 | Pass |
| SUB_HFP_MODEL_1200 | testHfpModel0012 | Verify updating call data stores the payload and refreshes the update timestamp. | Level 0 | Pass |
| SUB_HFP_MODEL_1300 | testHfpModel0013 | Verify the model keeps the payload by reference so later external edits stay visible. | Level 1 | Pass |
| SUB_HFP_MODEL_1400 | testHfpModel0014 | Verify connection state updates are mapped to the matching transitions and unknown states are ignored. | Level 0 | Pass |
| SUB_HFP_MODEL_1500 | testHfpModel0015 | Verify reset clears session data while call attributes and audio settings survive. | Level 1 | Pass |
| SUB_HFP_MODEL_1600 | testHfpModel0016 | Verify the serialized object and the text summary expose session fields but omit call settings. | Level 1 | Pass |

## HID 数据模型 XTS 用例

套件 `HidModelTest`，测试文件：`entry/src/ohosTest/ets/test/Model/HidModel.test.ets`，共 12 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_HID_MODEL_0100 | testHidModel0001 | Verify the default field values of an HID model created without arguments. | Level 0 | Pass |
| SUB_HID_MODEL_0200 | testHidModel0002 | Verify two models bound to different identifiers keep their own input settings and counters. | Level 0 | Pass |
| SUB_HID_MODEL_0300 | testHidModel0003 | Verify entering the connecting state records the start time and one log entry. | Level 0 | Pass |
| SUB_HID_MODEL_0400 | testHidModel0004 | Verify a successful connection clears the previous error information and retry counter. | Level 0 | Pass |
| SUB_HID_MODEL_0500 | testHidModel0005 | Verify the disconnecting and disconnected transitions reset the connection duration. | Level 0 | Pass |
| SUB_HID_MODEL_0600 | testHidModel0006 | Verify the retry allowance is exhausted exactly after the third failed attempt. | Level 1 | Pass |
| SUB_HID_MODEL_0700 | testHidModel0007 | Verify appended logs carry an ISO timestamp prefix and the accessor returns a defensive copy. | Level 0 | Pass |
| SUB_HID_MODEL_0800 | testHidModel0008 | Verify the log buffer is trimmed to the ceiling while clearing keeps the operation counter. | Level 1 | Pass |
| SUB_HID_MODEL_0900 | testHidModel0009 | Verify updating input data stores the payload by reference without touching logs or state. | Level 0 | Pass |
| SUB_HID_MODEL_1000 | testHidModel0010 | Verify the connection state entry point only refreshes the timestamp and never mutates the model. | Level 1 | Pass |
| SUB_HID_MODEL_1100 | testHidModel0011 | Verify reset clears session data while input settings and the device binding survive. | Level 1 | Pass |
| SUB_HID_MODEL_1200 | testHidModel0012 | Verify the serialized object and the text summary expose session fields but omit input settings. | Level 1 | Pass |

## MAP 数据模型 XTS 用例

套件 `MapModelTest`，测试文件：`entry/src/ohosTest/ets/test/Model/MapModel.test.ets`，共 12 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_MAP_MODEL_0100 | testMapModel0001 | Verify the default field values of a MAP model created without arguments. | Level 0 | Pass |
| SUB_MAP_MODEL_0200 | testMapModel0002 | Verify two models bound to different identifiers keep their own message lists and counters. | Level 0 | Pass |
| SUB_MAP_MODEL_0300 | testMapModel0003 | Verify entering the connecting state records the start time and one log entry. | Level 0 | Pass |
| SUB_MAP_MODEL_0400 | testMapModel0004 | Verify a successful connection clears the previous error information and retry counter. | Level 0 | Pass |
| SUB_MAP_MODEL_0500 | testMapModel0005 | Verify the disconnecting and disconnected transitions reset the connection duration. | Level 0 | Pass |
| SUB_MAP_MODEL_0600 | testMapModel0006 | Verify the retry allowance is exhausted exactly after the third failed attempt. | Level 1 | Pass |
| SUB_MAP_MODEL_0700 | testMapModel0007 | Verify appended logs carry an ISO timestamp prefix and the accessor returns a defensive copy. | Level 0 | Pass |
| SUB_MAP_MODEL_0800 | testMapModel0008 | Verify the log buffer is trimmed to the ceiling while clearing keeps the operation counter. | Level 1 | Pass |
| SUB_MAP_MODEL_0900 | testMapModel0009 | Verify updating message data stores the payload by reference without touching logs or state. | Level 0 | Pass |
| SUB_MAP_MODEL_1000 | testMapModel0010 | Verify the connection state entry point only refreshes the timestamp and never mutates the model. | Level 1 | Pass |
| SUB_MAP_MODEL_1100 | testMapModel0011 | Verify reset clears session data while message settings and the device binding survive. | Level 1 | Pass |
| SUB_MAP_MODEL_1200 | testMapModel0012 | Verify the serialized object and the text summary expose session fields but omit message settings. | Level 1 | Pass |

## PAN 数据模型 XTS 用例

套件 `PanModelTest`，测试文件：`entry/src/ohosTest/ets/test/Model/PanModel.test.ets`，共 12 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_PAN_MODEL_0100 | testPanModel0001 | Verify the default field values of a PAN model created without arguments. | Level 0 | Pass |
| SUB_PAN_MODEL_0200 | testPanModel0002 | Verify two models bound to different identifiers keep their own network settings and counters. | Level 0 | Pass |
| SUB_PAN_MODEL_0300 | testPanModel0003 | Verify entering the connecting state records the start time and one log entry. | Level 0 | Pass |
| SUB_PAN_MODEL_0400 | testPanModel0004 | Verify a successful connection clears the previous error information and retry counter. | Level 0 | Pass |
| SUB_PAN_MODEL_0500 | testPanModel0005 | Verify the disconnecting and disconnected transitions reset the connection duration. | Level 0 | Pass |
| SUB_PAN_MODEL_0600 | testPanModel0006 | Verify the retry allowance is exhausted exactly after the third failed attempt. | Level 1 | Pass |
| SUB_PAN_MODEL_0700 | testPanModel0007 | Verify appended logs carry an ISO timestamp prefix and the accessor returns a defensive copy. | Level 0 | Pass |
| SUB_PAN_MODEL_0800 | testPanModel0008 | Verify the log buffer is trimmed to the ceiling while clearing keeps the operation counter. | Level 1 | Pass |
| SUB_PAN_MODEL_0900 | testPanModel0009 | Verify updating network data stores the payload by reference without touching logs or state. | Level 0 | Pass |
| SUB_PAN_MODEL_1000 | testPanModel0010 | Verify the connection state entry point only refreshes the timestamp and never mutates the model. | Level 1 | Pass |
| SUB_PAN_MODEL_1100 | testPanModel0011 | Verify reset clears session data while network settings and the device binding survive. | Level 1 | Pass |
| SUB_PAN_MODEL_1200 | testPanModel0012 | Verify the serialized object and the text summary expose session fields but omit network settings. | Level 1 | Pass |

## PBAP 数据模型 XTS 用例

套件 `PbapModelTest`，测试文件：`entry/src/ohosTest/ets/test/Model/PbapModel.test.ets`，共 12 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_PBAP_MODEL_0100 | testPbapModel0001 | Verify the default field values of a PBAP model created without arguments. | Level 0 | Pass |
| SUB_PBAP_MODEL_0200 | testPbapModel0002 | Verify two models bound to different identifiers keep their own phonebook progress and counters. | Level 0 | Pass |
| SUB_PBAP_MODEL_0300 | testPbapModel0003 | Verify entering the connecting state records the start time and one log entry. | Level 0 | Pass |
| SUB_PBAP_MODEL_0400 | testPbapModel0004 | Verify a successful connection clears the previous error information and retry counter. | Level 0 | Pass |
| SUB_PBAP_MODEL_0500 | testPbapModel0005 | Verify the disconnecting and disconnected transitions reset the connection duration. | Level 0 | Pass |
| SUB_PBAP_MODEL_0600 | testPbapModel0006 | Verify the retry allowance is exhausted exactly after the third failed attempt. | Level 1 | Pass |
| SUB_PBAP_MODEL_0700 | testPbapModel0007 | Verify appended logs carry an ISO timestamp prefix and the accessor returns a defensive copy. | Level 0 | Pass |
| SUB_PBAP_MODEL_0800 | testPbapModel0008 | Verify the log buffer is trimmed to the ceiling while clearing keeps the operation counter. | Level 1 | Pass |
| SUB_PBAP_MODEL_0900 | testPbapModel0009 | Verify updating phonebook data stores the payload by reference without touching logs or state. | Level 0 | Pass |
| SUB_PBAP_MODEL_1000 | testPbapModel0010 | Verify the connection state entry point only refreshes the timestamp and never mutates the model. | Level 1 | Pass |
| SUB_PBAP_MODEL_1100 | testPbapModel0011 | Verify reset clears session data while phonebook settings and the device binding survive. | Level 1 | Pass |
| SUB_PBAP_MODEL_1200 | testPbapModel0012 | Verify the serialized object and the text summary expose session fields but omit phonebook settings. | Level 1 | Pass |

## 设备信息工具 XTS 用例

套件 `DeviceUtilsTest`，测试文件：`entry/src/ohosTest/ets/test/Device/DeviceUtils.test.ets`，共 11 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_DEVICE_UTILS_0100 | testDeviceUtils0001 | Read brand, model and OS version of the running device. | Level 0 | Pass |
| SUB_DEVICE_UTILS_0200 | testDeviceUtils0002 | Read the SDK API version as a positive numeric string. | Level 0 | Pass |
| SUB_DEVICE_UTILS_0300 | testDeviceUtils0003 | Read the device type and confirm it belongs to the supported type set. | Level 0 | Pass |
| SUB_DEVICE_UTILS_0400 | testDeviceUtils0004 | Compare the tablet and phone flags against the reported device type. | Level 0 | Pass |
| SUB_DEVICE_UTILS_0500 | testDeviceUtils0005 | Confirm the bluetooth capability flags stay enabled on the test device. | Level 1 | Pass |
| SUB_DEVICE_UTILS_0600 | testDeviceUtils0006 | Collect the full device info object and match every field with its single getter. | Level 0 | Pass |
| SUB_DEVICE_UTILS_0700 | testDeviceUtils0007 | Confirm the collected device id is rebuilt from the brand and model prefix. | Level 1 | Pass |
| SUB_DEVICE_UTILS_0800 | testDeviceUtils0008 | Generate successive device identifiers and keep every one of them unique. | Level 1 | Pass |
| SUB_DEVICE_UTILS_0900 | testDeviceUtils0009 | Read the memory and storage descriptions exposed by the device helper. | Level 1 | Pass |
| SUB_DEVICE_UTILS_1000 | testDeviceUtils0010 | Format the device info into six labelled lines and verify every label. | Level 0 | Pass |
| SUB_DEVICE_UTILS_1100 | testDeviceUtils0011 | Format a modified device info object and reflect the new field values. | Level 1 | Pass |

## 文件路径与类型工具 XTS 用例

套件 `FileUtilsTest`，测试文件：`entry/src/ohosTest/ets/test/Device/FileUtils.test.ets`，共 19 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_FILE_UTILS_0100 | testFileUtils0001 | Extract the trailing extension of ordinary and multi dotted file names. | Level 0 | Pass |
| SUB_FILE_UTILS_0200 | testFileUtils0002 | Return an empty extension for names without a usable dot separator. | Level 1 | Pass |
| SUB_FILE_UTILS_0300 | testFileUtils0003 | Strip the directory part from absolute, relative and trailing slash paths. | Level 0 | Pass |
| SUB_FILE_UTILS_0400 | testFileUtils0004 | Remove only the last extension from a file name. | Level 0 | Pass |
| SUB_FILE_UTILS_0500 | testFileUtils0005 | Chain the name, extension and base name helpers on one path. | Level 1 | Pass |
| SUB_FILE_UTILS_0600 | testFileUtils0006 | Format byte level sizes with two decimals and the raw byte unit. | Level 0 | Pass |
| SUB_FILE_UTILS_0700 | testFileUtils0007 | Format sizes at every unit boundary from kilobyte to terabyte. | Level 0 | Pass |
| SUB_FILE_UTILS_0800 | testFileUtils0008 | Recognize every supported image extension and reject the remaining types. | Level 0 | Pass |
| SUB_FILE_UTILS_0900 | testFileUtils0009 | Recognize every supported audio extension and reject the remaining types. | Level 0 | Pass |
| SUB_FILE_UTILS_1000 | testFileUtils0010 | Recognize every supported video extension and reject the remaining types. | Level 0 | Pass |
| SUB_FILE_UTILS_1100 | testFileUtils0011 | Recognize every supported document extension and reject the remaining types. | Level 0 | Pass |
| SUB_FILE_UTILS_1200 | testFileUtils0012 | Keep the four file categories mutually exclusive for representative extensions. | Level 1 | Pass |
| SUB_FILE_UTILS_1300 | testFileUtils0013 | Map known extensions to their MIME types case insensitively. | Level 0 | Pass |
| SUB_FILE_UTILS_1400 | testFileUtils0014 | Fall back to the binary MIME type for unmapped extensions. | Level 1 | Pass |
| SUB_FILE_UTILS_1500 | testFileUtils0015 | Resolve the icon name of each category and the generic fallback. | Level 1 | Pass |
| SUB_FILE_UTILS_1600 | testFileUtils0016 | Normalize backslashes and repeated separators into single forward slashes. | Level 0 | Pass |
| SUB_FILE_UTILS_1700 | testFileUtils0017 | Resolve the parent directory of absolute, relative and root level paths. | Level 0 | Pass |
| SUB_FILE_UTILS_1800 | testFileUtils0018 | Reject empty paths and every reserved path character while accepting valid paths. | Level 1 | Pass |
| SUB_FILE_UTILS_1900 | testFileUtils0019 | Run one path through the whole helper chain and keep the results consistent. | Level 1 | Pass |

## Preferences 读写工具 XTS 用例

套件 `PreferenceUtilsTest`，测试文件：`entry/src/ohosTest/ets/test/Device/PreferenceUtils.test.ets`，共 18 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_PREFERENCE_UTILS_0100 | testPreferenceUtils0001 | Initialize a named preference store and confirm it starts empty. | Level 0 | Pass |
| SUB_PREFERENCE_UTILS_0200 | testPreferenceUtils0002 | Store, overwrite and read back string preferences including the empty string. | Level 0 | Pass |
| SUB_PREFERENCE_UTILS_0300 | testPreferenceUtils0003 | Fall back to the supplied default value when a string key was never stored. | Level 1 | Pass |
| SUB_PREFERENCE_UTILS_0400 | testPreferenceUtils0004 | Store positive, negative, fractional and zero numeric preferences. | Level 0 | Pass |
| SUB_PREFERENCE_UTILS_0500 | testPreferenceUtils0005 | Convert a stored string back to a number and report non numeric text as NaN. | Level 1 | Pass |
| SUB_PREFERENCE_UTILS_0600 | testPreferenceUtils0006 | Store boolean preferences in both states and read them with an explicit default. | Level 0 | Pass |
| SUB_PREFERENCE_UTILS_0700 | testPreferenceUtils0007 | Read stored values through a mismatched accessor and observe the conversion rules. | Level 1 | Pass |
| SUB_PREFERENCE_UTILS_0800 | testPreferenceUtils0008 | Remove an existing key and confirm removing an absent key changes nothing. | Level 0 | Pass |
| SUB_PREFERENCE_UTILS_0900 | testPreferenceUtils0009 | List stored keys in insertion order and confirm the returned array is a copy. | Level 1 | Pass |
| SUB_PREFERENCE_UTILS_1000 | testPreferenceUtils0010 | Track the store size while adding, overwriting and removing entries. | Level 1 | Pass |
| SUB_PREFERENCE_UTILS_1100 | testPreferenceUtils0011 | Clear one store while a second store keeps all of its entries. | Level 1 | Pass |
| SUB_PREFERENCE_UTILS_1200 | testPreferenceUtils0012 | Keep three stores independent for writes, removals and key listings. | Level 1 | Pass |
| SUB_PREFERENCE_UTILS_1300 | testPreferenceUtils0013 | Use the default store through the single argument accessors and restore its size. | Level 0 | Pass |
| SUB_PREFERENCE_UTILS_1400 | testPreferenceUtils0014 | Repeat initialization of an existing store without discarding its content. | Level 1 | Pass |
| SUB_PREFERENCE_UTILS_1500 | testPreferenceUtils0015 | Notify the registered listener for every string, number and boolean write. | Level 0 | Pass |
| SUB_PREFERENCE_UTILS_1600 | testPreferenceUtils0016 | Stop notifications after removing the listener and ignore unknown listeners. | Level 1 | Pass |
| SUB_PREFERENCE_UTILS_1700 | testPreferenceUtils0017 | Keep notifying the remaining listeners when one listener throws. | Level 1 | Pass |
| SUB_PREFERENCE_UTILS_1800 | testPreferenceUtils0018 | Emit no change notification for reads, removals and store clear operations. | Level 1 | Pass |

## 内存缓存工具 XTS 用例

套件 `StorageUtilsTest`，测试文件：`entry/src/ohosTest/ets/test/Device/StorageUtils.test.ets`，共 15 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_STORAGE_UTILS_0100 | testStorageUtils0001 | Clear the cache and confirm the empty baseline of every read accessor. | Level 0 | Pass |
| SUB_STORAGE_UTILS_0200 | testStorageUtils0002 | Clear an already empty cache and keep the baseline untouched. | Level 1 | Pass |
| SUB_STORAGE_UTILS_0300 | testStorageUtils0003 | Store string, number and boolean payloads and read them back unchanged. | Level 0 | Pass |
| SUB_STORAGE_UTILS_0400 | testStorageUtils0004 | Keep the very same array instance when reading a cached collection. | Level 1 | Pass |
| SUB_STORAGE_UTILS_0500 | testStorageUtils0005 | Overwrite a cached key without growing the cache and reset its access counter. | Level 1 | Pass |
| SUB_STORAGE_UTILS_0600 | testStorageUtils0006 | Remove one entry and confirm repeated removal is harmless to the remaining data. | Level 0 | Pass |
| SUB_STORAGE_UTILS_0700 | testStorageUtils0007 | Clear a filled cache and refill it afterwards without leftover entries. | Level 0 | Pass |
| SUB_STORAGE_UTILS_0800 | testStorageUtils0008 | List cache keys in insertion order and treat the returned array as a copy. | Level 1 | Pass |
| SUB_STORAGE_UTILS_0900 | testStorageUtils0009 | Expire an entry through its time to live and drop it on the next read. | Level 1 | Pass |
| SUB_STORAGE_UTILS_1000 | testStorageUtils0010 | Clean only the expired entries while the live entries stay addressable. | Level 1 | Pass |
| SUB_STORAGE_UTILS_1100 | testStorageUtils0011 | Keep default lifetime entries readable across repeated accesses. | Level 0 | Pass |
| SUB_STORAGE_UTILS_1200 | testStorageUtils0012 | Aggregate entry and access counters in the statistics snapshot. | Level 1 | Pass |
| SUB_STORAGE_UTILS_1300 | testStorageUtils0013 | Fill the cache to its capacity and evict the least accessed entry on overflow. | Level 1 | Pass |
| SUB_STORAGE_UTILS_1400 | testStorageUtils0014 | Evict one more entry on every write beyond the configured capacity. | Level 1 | Pass |
| SUB_STORAGE_UTILS_1500 | testStorageUtils0015 | Release the whole cache after a capacity run and return to the empty baseline. | Level 0 | Pass |

## 编码与加密工具 XTS 用例

套件 `EncryptionUtilsTest`，测试文件：`entry/src/ohosTest/ets/test/Network/EncryptionUtils.test.ets`，共 20 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_ENCRYPTION_UTILS_0100 | testEncryptionUtils0001 | Encode empty and short one to three byte inputs into padded Base64 groups. | Level 0 | Pass |
| SUB_ENCRYPTION_UTILS_0200 | testEncryptionUtils0002 | Apply the padding rule for inputs whose length leaves one or two tail bytes. | Level 1 | Pass |
| SUB_ENCRYPTION_UTILS_0300 | testEncryptionUtils0003 | Encode longer printable sentences and match the published reference vectors. | Level 0 | Pass |
| SUB_ENCRYPTION_UTILS_0400 | testEncryptionUtils0004 | Restrict the encoder output to the Base64 alphabet for control and space inputs. | Level 1 | Pass |
| SUB_ENCRYPTION_UTILS_0500 | testEncryptionUtils0005 | Decode complete Base64 groups back into their original ASCII text. | Level 0 | Pass |
| SUB_ENCRYPTION_UTILS_0600 | testEncryptionUtils0006 | Round trip byte aligned strings through the encoder and the decoder. | Level 0 | Pass |
| SUB_ENCRYPTION_UTILS_0700 | testEncryptionUtils0007 | Ignore padding characters while decoding and map unknown symbols to raw bytes. | Level 1 | Pass |
| SUB_ENCRYPTION_UTILS_0800 | testEncryptionUtils0008 | Mix each character with the repeating key and verify the raw byte results. | Level 0 | Pass |
| SUB_ENCRYPTION_UTILS_0900 | testEncryptionUtils0009 | Recover the plain text for messages longer and shorter than the key. | Level 0 | Pass |
| SUB_ENCRYPTION_UTILS_1000 | testEncryptionUtils0010 | Return an empty cipher when either the plain text or the key is missing. | Level 1 | Pass |
| SUB_ENCRYPTION_UTILS_1100 | testEncryptionUtils0011 | Hash known inputs to their fixed eight digit hexadecimal digests. | Level 0 | Pass |
| SUB_ENCRYPTION_UTILS_1200 | testEncryptionUtils0012 | Keep the digest stable, uniform in length and sensitive to small changes. | Level 1 | Pass |
| SUB_ENCRYPTION_UTILS_1300 | testEncryptionUtils0013 | Generate a version four identifier and verify its fixed layout and alphabet. | Level 0 | Pass |
| SUB_ENCRYPTION_UTILS_1400 | testEncryptionUtils0014 | Produce a batch of identifiers and confirm they are all hexadecimal and unique. | Level 1 | Pass |
| SUB_ENCRYPTION_UTILS_1500 | testEncryptionUtils0015 | Convert hexadecimal strings into byte arrays and report malformed input. | Level 0 | Pass |
| SUB_ENCRYPTION_UTILS_1600 | testEncryptionUtils0016 | Render byte arrays as lower case hex pairs and keep the conversion reversible. | Level 0 | Pass |
| SUB_ENCRYPTION_UTILS_1700 | testEncryptionUtils0017 | Generate keys for the requested lengths using only the alphanumeric alphabet. | Level 0 | Pass |
| SUB_ENCRYPTION_UTILS_1800 | testEncryptionUtils0018 | Draw successive keys and confirm the generator does not repeat its output. | Level 1 | Pass |
| SUB_ENCRYPTION_UTILS_1900 | testEncryptionUtils0019 | Mask a sensitive value while keeping only the requested tail characters. | Level 0 | Pass |
| SUB_ENCRYPTION_UTILS_2000 | testEncryptionUtils0020 | Preserve the masked length, hide the head characters and expose the exact tail. | Level 1 | Pass |

## HTTP 请求工具 XTS 用例

套件 `HttpUtilsTest`，测试文件：`entry/src/ohosTest/ets/test/Network/HttpUtils.test.ets`，共 18 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_HTTP_UTILS_0100 | testHttpUtils0001 | Build query strings from empty, single and multiple parameter records. | Level 0 | Pass |
| SUB_HTTP_UTILS_0200 | testHttpUtils0002 | Escape reserved characters in both parameter names and parameter values. | Level 1 | Pass |
| SUB_HTTP_UTILS_0300 | testHttpUtils0003 | Parse an empty string, a bare marker and pairs without a value separator. | Level 1 | Pass |
| SUB_HTTP_UTILS_0400 | testHttpUtils0004 | Handle a leading question mark, empty values, duplicate keys and extra separators. | Level 1 | Pass |
| SUB_HTTP_UTILS_0500 | testHttpUtils0005 | Round trip parameter records through the builder and the parser unchanged. | Level 0 | Pass |
| SUB_HTTP_UTILS_0600 | testHttpUtils0006 | Join the base address with a path and insert the missing separator only once. | Level 0 | Pass |
| SUB_HTTP_UTILS_0700 | testHttpUtils0007 | Append query parameters to a built URL and reuse an existing question mark. | Level 1 | Pass |
| SUB_HTTP_UTILS_0800 | testHttpUtils0008 | Create a request configuration with the default method, headers and timeout. | Level 0 | Pass |
| SUB_HTTP_UTILS_0900 | testHttpUtils0009 | Create configurations for every supported HTTP method and request body. | Level 0 | Pass |
| SUB_HTTP_UTILS_1000 | testHttpUtils0010 | Expose the five HTTP method constants with their standard upper case names. | Level 1 | Pass |
| SUB_HTTP_UTILS_1100 | testHttpUtils0011 | Accept only the two hundreds range as a successful response status. | Level 0 | Pass |
| SUB_HTTP_UTILS_1200 | testHttpUtils0012 | Recognize the three hundreds range as a redirection response. | Level 0 | Pass |
| SUB_HTTP_UTILS_1300 | testHttpUtils0013 | Recognize the four hundreds range as a client error response. | Level 0 | Pass |
| SUB_HTTP_UTILS_1400 | testHttpUtils0014 | Treat every status at or above the five hundreds start as a server error. | Level 0 | Pass |
| SUB_HTTP_UTILS_1500 | testHttpUtils0015 | Keep the four status classifiers mutually exclusive for sampled codes. | Level 1 | Pass |
| SUB_HTTP_UTILS_1600 | testHttpUtils0016 | Resolve the description text of the fifteen catalogued status codes. | Level 0 | Pass |
| SUB_HTTP_UTILS_1700 | testHttpUtils0017 | Continue the status catalogue and fall back for codes outside the table. | Level 1 | Pass |
| SUB_HTTP_UTILS_1800 | testHttpUtils0018 | Register request and response interceptors and clear them without side effects. | Level 1 | Pass |

## 网络状态工具 XTS 用例

套件 `NetworkUtilsTest`，测试文件：`entry/src/ohosTest/ets/test/Network/NetworkUtils.test.ets`，共 14 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_NETWORK_UTILS_0100 | testNetworkUtils0001 | Reset the network helper and read the unknown disconnected baseline. | Level 0 | Pass |
| SUB_NETWORK_UTILS_0200 | testNetworkUtils0002 | Switch through every supported network type and read it back. | Level 0 | Pass |
| SUB_NETWORK_UTILS_0300 | testNetworkUtils0003 | Drive the three capability flags from the selected network type. | Level 0 | Pass |
| SUB_NETWORK_UTILS_0400 | testNetworkUtils0004 | Publish the availability flag only for the connected network state. | Level 0 | Pass |
| SUB_NETWORK_UTILS_0500 | testNetworkUtils0005 | Change the network type and the network state without cross contamination. | Level 1 | Pass |
| SUB_NETWORK_UTILS_0600 | testNetworkUtils0006 | Deliver the current network type to the callback when the connection comes up. | Level 0 | Pass |
| SUB_NETWORK_UTILS_0700 | testNetworkUtils0007 | Report a lost connection for every state below the connected state. | Level 0 | Pass |
| SUB_NETWORK_UTILS_0800 | testNetworkUtils0008 | Skip the notification when the requested state equals the current state. | Level 1 | Pass |
| SUB_NETWORK_UTILS_0900 | testNetworkUtils0009 | Emit no callback at all while only the network type is being changed. | Level 1 | Pass |
| SUB_NETWORK_UTILS_1000 | testNetworkUtils0010 | Stop the delivery after removing a callback and ignore unknown callbacks. | Level 1 | Pass |
| SUB_NETWORK_UTILS_1100 | testNetworkUtils0011 | Isolate a failing callback so the remaining subscribers are still notified. | Level 1 | Pass |
| SUB_NETWORK_UTILS_1200 | testNetworkUtils0012 | Label every network type with its display name. | Level 0 | Pass |
| SUB_NETWORK_UTILS_1300 | testNetworkUtils0013 | Label every network state with its display name. | Level 0 | Pass |
| SUB_NETWORK_UTILS_1400 | testNetworkUtils0014 | Reset the helper so the type, the state and the subscribers all return to idle. | Level 1 | Pass |

## 权限检查工具 XTS 用例

套件 `PermissionUtilsTest`，测试文件：`entry/src/ohosTest/ets/test/Network/PermissionUtils.test.ets`，共 15 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_PERMISSION_UTILS_0100 | testPermissionUtils0001 | Clear every recorded grant and read the empty permission baseline. | Level 0 | Pass |
| SUB_PERMISSION_UTILS_0200 | testPermissionUtils0002 | Grant a permission, confirm the check and revoke it again. | Level 0 | Pass |
| SUB_PERMISSION_UTILS_0300 | testPermissionUtils0003 | Grant the same permission twice and keep a single entry in the granted set. | Level 1 | Pass |
| SUB_PERMISSION_UTILS_0400 | testPermissionUtils0004 | List granted permissions in grant order and treat the returned array as a copy. | Level 1 | Pass |
| SUB_PERMISSION_UTILS_0500 | testPermissionUtils0005 | Revoke an unknown permission without damaging the existing grants. | Level 1 | Pass |
| SUB_PERMISSION_UTILS_0600 | testPermissionUtils0006 | Bind the convenience checks to their own permission names only. | Level 0 | Pass |
| SUB_PERMISSION_UTILS_0700 | testPermissionUtils0007 | Request a mixed batch and receive one result entry per requested permission. | Level 0 | Pass |
| SUB_PERMISSION_UTILS_0800 | testPermissionUtils0008 | Request an empty batch and still deliver an empty result map to the caller. | Level 1 | Pass |
| SUB_PERMISSION_UTILS_0900 | testPermissionUtils0009 | Collapse duplicated names in one request into a single result entry. | Level 1 | Pass |
| SUB_PERMISSION_UTILS_1000 | testPermissionUtils0010 | Report the granted and denied outcome of every change to the registered observer. | Level 0 | Pass |
| SUB_PERMISSION_UTILS_1100 | testPermissionUtils0011 | Stop the notifications after removal and accept the removal of unknown observers. | Level 1 | Pass |
| SUB_PERMISSION_UTILS_1200 | testPermissionUtils0012 | Keep notifying the healthy observers when one observer raises an error. | Level 1 | Pass |
| SUB_PERMISSION_UTILS_1300 | testPermissionUtils0013 | Request permissions while an observer is registered and emit no result event. | Level 1 | Pass |
| SUB_PERMISSION_UTILS_1400 | testPermissionUtils0014 | Describe each permission status with its display label. | Level 0 | Pass |
| SUB_PERMISSION_UTILS_1500 | testPermissionUtils0015 | Clear both the granted permissions and the registered observers in one call. | Level 1 | Pass |

## 通用工具 XTS 用例

套件 `CommonUtilsTest`，测试文件：`entry/src/ohosTest/ets/test/Utils/CommonUtils.test.ets`，共 30 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_COMMON_UTILS_0100 | testCommonUtils0001 | Resolve delay after the requested milliseconds. | Level 0 | Pass |
| SUB_COMMON_UTILS_0200 | testCommonUtils0002 | Resolve withTimeout when the inner promise finishes first. | Level 0 | Pass |
| SUB_COMMON_UTILS_0300 | testCommonUtils0003 | Reject withTimeout when the inner promise exceeds the timeout. | Level 1 | Pass |
| SUB_COMMON_UTILS_0400 | testCommonUtils0004 | Generate a base36 timestamp and random part joined by a hyphen. | Level 0 | Pass |
| SUB_COMMON_UTILS_0500 | testCommonUtils0005 | Keep the timestamp prefix not later than the current moment. | Level 1 | Pass |
| SUB_COMMON_UTILS_0600 | testCommonUtils0006 | Serialize plain objects and arrays into JSON text. | Level 0 | Pass |
| SUB_COMMON_UTILS_0700 | testCommonUtils0007 | Serialize a device-like record and keep the field order. | Level 0 | Pass |
| SUB_COMMON_UTILS_0800 | testCommonUtils0008 | Fall back to an empty object text for unserializable input. | Level 1 | Pass |
| SUB_COMMON_UTILS_0900 | testCommonUtils0009 | Parse valid JSON and return null for malformed JSON text. | Level 0 | Pass |
| SUB_COMMON_UTILS_1000 | testCommonUtils0010 | Run the debounced callback once after rapid repeated calls. | Level 0 | Pass |
| SUB_COMMON_UTILS_1100 | testCommonUtils0011 | Restart the debounce window when calls are spaced beyond the delay. | Level 1 | Pass |
| SUB_COMMON_UTILS_1200 | testCommonUtils0012 | Run the throttled callback at most once per interval. | Level 0 | Pass |
| SUB_COMMON_UTILS_1300 | testCommonUtils0013 | Retry a failing task until it succeeds within the limit. | Level 0 | Pass |
| SUB_COMMON_UTILS_1400 | testCommonUtils0014 | Throw the last error after exhausting the retry budget. | Level 1 | Pass |
| SUB_COMMON_UTILS_1500 | testCommonUtils0015 | Remove duplicate numbers while keeping the first occurrence order. | Level 0 | Pass |
| SUB_COMMON_UTILS_1600 | testCommonUtils0016 | Deduplicate objects by their JSON shape and keep an empty array empty. | Level 1 | Pass |
| SUB_COMMON_UTILS_1700 | testCommonUtils0017 | Split a list into fixed size blocks with a shorter tail block. | Level 0 | Pass |
| SUB_COMMON_UTILS_1800 | testCommonUtils0018 | Chunk a list whose size exceeds its length into one single block. | Level 1 | Pass |
| SUB_COMMON_UTILS_1900 | testCommonUtils0019 | Flatten a two level list preserving element order. | Level 0 | Pass |
| SUB_COMMON_UTILS_2000 | testCommonUtils0020 | Group items by a key function into a map of lists. | Level 0 | Pass |
| SUB_COMMON_UTILS_2100 | testCommonUtils0021 | Group an empty list into an empty map. | Level 1 | Pass |
| SUB_COMMON_UTILS_2200 | testCommonUtils0022 | Sort into a new list without mutating the source list. | Level 0 | Pass |
| SUB_COMMON_UTILS_2300 | testCommonUtils0023 | Sort text items in descending order by string comparison. | Level 1 | Pass |
| SUB_COMMON_UTILS_2400 | testCommonUtils0024 | Report membership for present and absent values. | Level 0 | Pass |
| SUB_COMMON_UTILS_2500 | testCommonUtils0025 | Return undefined for the first and last item of an empty list. | Level 1 | Pass |
| SUB_COMMON_UTILS_2600 | testCommonUtils0026 | Take the boundary elements of a single item list. | Level 1 | Pass |
| SUB_COMMON_UTILS_2700 | testCommonUtils0027 | Keep unique and chunk results independent of the input instance. | Level 1 | Pass |
| SUB_COMMON_UTILS_2800 | testCommonUtils0028 | Repeat calls with the same input and get equivalent results. | Level 1 | Pass |
| SUB_COMMON_UTILS_2900 | testCommonUtils0029 | Round trip a list through stringify and parse. | Level 0 | Pass |
| SUB_COMMON_UTILS_3000 | testCommonUtils0030 | Handle boundary numeric inputs of delay and withTimeout. | Level 1 | Pass |

## 应用级全局常量 XTS 用例

套件 `ConstantsTest`，测试文件：`entry/src/ohosTest/ets/test/Utils/Constants.test.ets`，共 18 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_CONSTANTS_0100 | testConstants0001 | Read the published application version constants. | Level 0 | Pass |
| SUB_CONSTANTS_0200 | testConstants0002 | Build the aggregated version object and match every field with its constant. | Level 0 | Pass |
| SUB_CONSTANTS_0300 | testConstants0003 | Request the version object twice and keep the values stable across calls. | Level 1 | Pass |
| SUB_CONSTANTS_0400 | testConstants0004 | Verify the default paging, timeout, retry and cache parameters. | Level 0 | Pass |
| SUB_CONSTANTS_0500 | testConstants0005 | Verify the default layout constants used by the sample screens. | Level 1 | Pass |
| SUB_CONSTANTS_0600 | testConstants0006 | Keep the millisecond constants consistent across the whole time scale. | Level 0 | Pass |
| SUB_CONSTANTS_0700 | testConstants0007 | Keep the second based and byte based constants on the same scale. | Level 1 | Pass |
| SUB_CONSTANTS_0800 | testConstants0008 | Expose the literal whitespace and empty text constants. | Level 1 | Pass |
| SUB_CONSTANTS_0900 | testConstants0009 | Accept the well formed electronic mail addresses. | Level 0 | Pass |
| SUB_CONSTANTS_1000 | testConstants0010 | Reject malformed electronic mail addresses. | Level 1 | Pass |
| SUB_CONSTANTS_1100 | testConstants0011 | Accept six colon separated hexadecimal byte pairs in any letter case. | Level 0 | Pass |
| SUB_CONSTANTS_1200 | testConstants0012 | Reject truncated, extended, dash separated and non hexadecimal device addresses. | Level 1 | Pass |
| SUB_CONSTANTS_1300 | testConstants0013 | Compare the two address patterns exposed for the Bluetooth and generic formats. | Level 1 | Pass |
| SUB_CONSTANTS_1400 | testConstants0014 | Validate the phone and URL patterns shipped with the constant table. | Level 1 | Pass |
| SUB_CONSTANTS_1500 | testConstants0015 | Accept canonical lower case universally unique identifiers. | Level 0 | Pass |
| SUB_CONSTANTS_1600 | testConstants0016 | Reject upper case, unseparated and wrongly sized identifier strings. | Level 1 | Pass |
| SUB_CONSTANTS_1700 | testConstants0017 | Validate a batch of generated identifiers against the published pattern. | Level 1 | Pass |
| SUB_CONSTANTS_1800 | testConstants0018 | Initialize the constant holder repeatedly without changing any published value. | Level 1 | Pass |

## 日期时间工具 XTS 用例

套件 `DateUtilsTest`，测试文件：`entry/src/ohosTest/ets/test/Utils/DateUtils.test.ets`，共 30 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_DATE_UTILS_0100 | testDateUtils0001 | Format a timestamp with the default date and time pattern. | Level 0 | Pass |
| SUB_DATE_UTILS_0200 | testDateUtils0002 | Format a timestamp with a caller supplied pattern. | Level 0 | Pass |
| SUB_DATE_UTILS_0300 | testDateUtils0003 | Pad single digit month, day, hour and minute fields. | Level 1 | Pass |
| SUB_DATE_UTILS_0400 | testDateUtils0004 | Format the epoch timestamp and a negative timestamp. | Level 1 | Pass |
| SUB_DATE_UTILS_0500 | testDateUtils0005 | Return the current time close to the system clock. | Level 0 | Pass |
| SUB_DATE_UTILS_0600 | testDateUtils0006 | Measure the absolute distance between two timestamps. | Level 0 | Pass |
| SUB_DATE_UTILS_0700 | testDateUtils0007 | Keep diff monotonic for large timestamp distances. | Level 1 | Pass |
| SUB_DATE_UTILS_0800 | testDateUtils0008 | Format durations below one minute as whole seconds. | Level 0 | Pass |
| SUB_DATE_UTILS_0900 | testDateUtils0009 | Format durations of minutes with the remaining seconds. | Level 0 | Pass |
| SUB_DATE_UTILS_1000 | testDateUtils0010 | Format durations of hours and days with the reduced fields. | Level 1 | Pass |
| SUB_DATE_UTILS_1100 | testDateUtils0011 | Clamp a negative duration to the zero second text. | Level 1 | Pass |
| SUB_DATE_UTILS_1200 | testDateUtils0012 | Resolve month names for the first and last valid index. | Level 0 | Pass |
| SUB_DATE_UTILS_1300 | testDateUtils0013 | Return Unknown for month indexes outside the range. | Level 1 | Pass |
| SUB_DATE_UTILS_1400 | testDateUtils0014 | Resolve day names by index and reject out of range indexes. | Level 0 | Pass |
| SUB_DATE_UTILS_1500 | testDateUtils0015 | Recognize the current moment as today and not as yesterday. | Level 0 | Pass |
| SUB_DATE_UTILS_1600 | testDateUtils0016 | Recognize the previous calendar day as yesterday. | Level 0 | Pass |
| SUB_DATE_UTILS_1700 | testDateUtils0017 | Reject future timestamps and the epoch day for today checks. | Level 1 | Pass |
| SUB_DATE_UTILS_1800 | testDateUtils0018 | Describe a recent timestamp as just now. | Level 0 | Pass |
| SUB_DATE_UTILS_1900 | testDateUtils0019 | Describe minute and hour offsets with the rounded unit count. | Level 0 | Pass |
| SUB_DATE_UTILS_2000 | testDateUtils0020 | Describe day offsets and fall back to a date for old timestamps. | Level 1 | Pass |
| SUB_DATE_UTILS_2100 | testDateUtils0021 | Detect leap years by the four hundred year rule. | Level 0 | Pass |
| SUB_DATE_UTILS_2200 | testDateUtils0022 | Return the days of February for leap and common years. | Level 0 | Pass |
| SUB_DATE_UTILS_2300 | testDateUtils0023 | Return the calendar length of each other month. | Level 1 | Pass |
| SUB_DATE_UTILS_2400 | testDateUtils0024 | Add days without mutating the source date. | Level 0 | Pass |
| SUB_DATE_UTILS_2500 | testDateUtils0025 | Roll the month and year boundary when adding days. | Level 1 | Pass |
| SUB_DATE_UTILS_2600 | testDateUtils0026 | Subtract days and hours to move a date backwards. | Level 1 | Pass |
| SUB_DATE_UTILS_2700 | testDateUtils0027 | Add hours across the day boundary keeping minutes untouched. | Level 0 | Pass |
| SUB_DATE_UTILS_2800 | testDateUtils0028 | Add minutes across the hour boundary and a zero shift. | Level 0 | Pass |
| SUB_DATE_UTILS_2900 | testDateUtils0029 | Cut the day start at midnight and the day end at the last millisecond. | Level 0 | Pass |
| SUB_DATE_UTILS_3000 | testDateUtils0030 | Keep the day span length and leave the source date unchanged. | Level 1 | Pass |

## 格式化工具 XTS 用例

套件 `FormatUtilsTest`，测试文件：`entry/src/ohosTest/ets/test/Utils/FormatUtils.test.ets`，共 24 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_FORMAT_UTILS_0100 | testFormatUtils0001 | Format zero and single byte sizes with two decimals. | Level 0 | Pass |
| SUB_FORMAT_UTILS_0200 | testFormatUtils0002 | Scale byte sizes up to the kilobyte unit. | Level 0 | Pass |
| SUB_FORMAT_UTILS_0300 | testFormatUtils0003 | Scale byte sizes through megabyte, gigabyte and terabyte units. | Level 1 | Pass |
| SUB_FORMAT_UTILS_0400 | testFormatUtils0004 | Switch the bit rate unit at the thousand boundaries. | Level 0 | Pass |
| SUB_FORMAT_UTILS_0500 | testFormatUtils0005 | Group a plain MAC address into colon separated octets. | Level 0 | Pass |
| SUB_FORMAT_UTILS_0600 | testFormatUtils0006 | Strip existing hyphen and colon separators before grouping. | Level 0 | Pass |
| SUB_FORMAT_UTILS_0700 | testFormatUtils0007 | Return short MAC text unchanged and group an over long one. | Level 1 | Pass |
| SUB_FORMAT_UTILS_0800 | testFormatUtils0008 | Label the strongest RSSI band as Excellent. | Level 0 | Pass |
| SUB_FORMAT_UTILS_0900 | testFormatUtils0009 | Walk the RSSI thresholds down to the weakest band. | Level 1 | Pass |
| SUB_FORMAT_UTILS_1000 | testFormatUtils0010 | Compute the rounded percentage of a value over a total. | Level 0 | Pass |
| SUB_FORMAT_UTILS_1100 | testFormatUtils0011 | Guard a zero total and a value above the total. | Level 1 | Pass |
| SUB_FORMAT_UTILS_1200 | testFormatUtils0012 | Insert thousands separators for various digit counts. | Level 0 | Pass |
| SUB_FORMAT_UTILS_1300 | testFormatUtils0013 | Split an eleven digit phone number into three groups. | Level 0 | Pass |
| SUB_FORMAT_UTILS_1400 | testFormatUtils0014 | Return phone numbers whose length is not eleven unchanged. | Level 1 | Pass |
| SUB_FORMAT_UTILS_1500 | testFormatUtils0015 | Rebuild the canonical UUID layout from a plain hex string. | Level 0 | Pass |
| SUB_FORMAT_UTILS_1600 | testFormatUtils0016 | Normalize separators and case and keep invalid UUIDs untouched. | Level 1 | Pass |
| SUB_FORMAT_UTILS_1700 | testFormatUtils0017 | Truncate a long device name with the default ellipsis suffix. | Level 0 | Pass |
| SUB_FORMAT_UTILS_1800 | testFormatUtils0018 | Keep a text that already fits the maximum length. | Level 0 | Pass |
| SUB_FORMAT_UTILS_1900 | testFormatUtils0019 | Honor a custom suffix and the shortest allowed maximum length. | Level 1 | Pass |
| SUB_FORMAT_UTILS_2000 | testFormatUtils0020 | Render sub hour durations as minutes and seconds. | Level 0 | Pass |
| SUB_FORMAT_UTILS_2100 | testFormatUtils0021 | Render hour spanning durations with the three field layout. | Level 1 | Pass |
| SUB_FORMAT_UTILS_2200 | testFormatUtils0022 | Resolve the major device class bits of a class value. | Level 0 | Pass |
| SUB_FORMAT_UTILS_2300 | testFormatUtils0023 | Cover the remaining major classes and the unknown fallback. | Level 1 | Pass |
| SUB_FORMAT_UTILS_2400 | testFormatUtils0024 | Pretty print an object with two space indentation. | Level 0 | Pass |

## 日志工具 XTS 用例

套件 `LoggerTest`，测试文件：`entry/src/ohosTest/ets/test/Utils/Logger.test.ets`，共 26 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_LOGGER_0100 | testLogger0001 | Store every level while the threshold stays at DEBUG. | Level 0 | Pass |
| SUB_LOGGER_0200 | testLogger0002 | Drop entries below the WARN threshold. | Level 0 | Pass |
| SUB_LOGGER_0300 | testLogger0003 | Keep only fatal entries when the threshold is FATAL. | Level 1 | Pass |
| SUB_LOGGER_0400 | testLogger0004 | Recheck the level threshold while the history is preserved. | Level 1 | Pass |
| SUB_LOGGER_0500 | testLogger0005 | Fall back to the sample tag when no tag is supplied. | Level 0 | Pass |
| SUB_LOGGER_0600 | testLogger0006 | Override the tag with the caller supplied value. | Level 0 | Pass |
| SUB_LOGGER_0700 | testLogger0007 | Record empty and long messages without altering the text. | Level 1 | Pass |
| SUB_LOGGER_0800 | testLogger0008 | Filter the history by each individual level. | Level 0 | Pass |
| SUB_LOGGER_0900 | testLogger0009 | Return an empty selection for a level never logged. | Level 1 | Pass |
| SUB_LOGGER_1000 | testLogger0010 | Grow the ring buffer one entry at a time below its capacity. | Level 0 | Pass |
| SUB_LOGGER_1100 | testLogger0011 | Cap the stored entries at the thousand entry limit. | Level 1 | Pass |
| SUB_LOGGER_1200 | testLogger0012 | Hand back a copy so the history cannot be mutated in place. | Level 1 | Pass |
| SUB_LOGGER_1300 | testLogger0013 | Drop all buffered entries when the buffer is cleared. | Level 0 | Pass |
| SUB_LOGGER_1400 | testLogger0014 | Detach listeners and restart the buffer position on clear. | Level 1 | Pass |
| SUB_LOGGER_1500 | testLogger0015 | Keep the level threshold after the buffer has been cleared. | Level 1 | Pass |
| SUB_LOGGER_1600 | testLogger0016 | Notify a registered listener with the recorded entry. | Level 0 | Pass |
| SUB_LOGGER_1700 | testLogger0017 | Ignore a duplicated listener registration. | Level 1 | Pass |
| SUB_LOGGER_1800 | testLogger0018 | Notify several listeners in registration order. | Level 1 | Pass |
| SUB_LOGGER_1900 | testLogger0019 | Swallow a throwing listener and keep logging afterwards. | Level 1 | Pass |
| SUB_LOGGER_2000 | testLogger0020 | Skip entries filtered by the level without notifying listeners. | Level 1 | Pass |
| SUB_LOGGER_2100 | testLogger0021 | Map every level to its uppercase label. | Level 0 | Pass |
| SUB_LOGGER_2200 | testLogger0022 | Format an entry as timestamp, level, tag and message fields. | Level 0 | Pass |
| SUB_LOGGER_2300 | testLogger0023 | Build the padded timestamp of a hand crafted entry. | Level 1 | Pass |
| SUB_LOGGER_2400 | testLogger0024 | Format a fatal entry and keep its level label. | Level 1 | Pass |
| SUB_LOGGER_2500 | testLogger0025 | Start and finish a named trace without touching the buffer. | Level 0 | Pass |
| SUB_LOGGER_2600 | testLogger0026 | Accept a trace with an explicit instance identifier. | Level 1 | Pass |

## 数学工具 XTS 用例

套件 `MathUtilsTest`，测试文件：`entry/src/ohosTest/ets/test/Utils/MathUtils.test.ets`，共 26 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_MATH_UTILS_0100 | testMathUtils0001 | Clamp values below, inside and above the accepted range. | Level 0 | Pass |
| SUB_MATH_UTILS_0200 | testMathUtils0002 | Clamp every input to the single value of a collapsed range. | Level 1 | Pass |
| SUB_MATH_UTILS_0300 | testMathUtils0003 | Interpolate between two bounds at the ends and at the middle. | Level 0 | Pass |
| SUB_MATH_UTILS_0400 | testMathUtils0004 | Keep interpolation inside the bounds for out of range factors. | Level 1 | Pass |
| SUB_MATH_UTILS_0500 | testMathUtils0005 | Average positive, fractional and signed data sets. | Level 0 | Pass |
| SUB_MATH_UTILS_0600 | testMathUtils0006 | Return zero as the average of an empty data set. | Level 1 | Pass |
| SUB_MATH_UTILS_0700 | testMathUtils0007 | Pick the middle element of odd length data sets. | Level 0 | Pass |
| SUB_MATH_UTILS_0800 | testMathUtils0008 | Mean the two central elements of even length data sets. | Level 0 | Pass |
| SUB_MATH_UTILS_0900 | testMathUtils0009 | Return zero for an empty set and keep the input order intact. | Level 1 | Pass |
| SUB_MATH_UTILS_1000 | testMathUtils0010 | Report zero deviation when every sample equals the mean. | Level 1 | Pass |
| SUB_MATH_UTILS_1100 | testMathUtils0011 | Compute the population deviation of known sample sets. | Level 0 | Pass |
| SUB_MATH_UTILS_1200 | testMathUtils0012 | Round ratios to integer percentages within zero and one hundred. | Level 0 | Pass |
| SUB_MATH_UTILS_1300 | testMathUtils0013 | Clamp negative and overflowing ratios away from the percent range. | Level 1 | Pass |
| SUB_MATH_UTILS_1400 | testMathUtils0014 | Estimate one metre at the reference power and reject unknown signal. | Level 0 | Pass |
| SUB_MATH_UTILS_1500 | testMathUtils0015 | Apply the custom transmit power and path loss exponent. | Level 1 | Pass |
| SUB_MATH_UTILS_1600 | testMathUtils0016 | Saturate signal quality at both ends of the RSSI scale. | Level 0 | Pass |
| SUB_MATH_UTILS_1700 | testMathUtils0017 | Scale quality linearly between the saturation thresholds. | Level 1 | Pass |
| SUB_MATH_UTILS_1800 | testMathUtils0018 | Measure point distance for the 3-4-5 triangle and negative legs. | Level 0 | Pass |
| SUB_MATH_UTILS_1900 | testMathUtils0019 | Draw integers only inside the inclusive bounds. | Level 1 | Pass |
| SUB_MATH_UTILS_2000 | testMathUtils0020 | Spread random draws and freeze the value of a zero width range. | Level 1 | Pass |
| SUB_MATH_UTILS_2100 | testMathUtils0021 | Round a value to the requested number of digits. | Level 0 | Pass |
| SUB_MATH_UTILS_2200 | testMathUtils0022 | Accept both bounds and reject values outside the interval. | Level 0 | Pass |
| SUB_MATH_UTILS_2300 | testMathUtils0023 | Divide the greatest common divisor of ordinary number pairs. | Level 0 | Pass |
| SUB_MATH_UTILS_2400 | testMathUtils0024 | Ignore sign and zero when searching for the common divisor. | Level 1 | Pass |
| SUB_MATH_UTILS_2500 | testMathUtils0025 | Multiply the least common multiple of coprime and shared pairs. | Level 0 | Pass |
| SUB_MATH_UTILS_2600 | testMathUtils0026 | Collapse the multiple to zero or to the operand itself. | Level 1 | Pass |

## 字符串工具 XTS 用例

套件 `StringUtilsTest`，测试文件：`entry/src/ohosTest/ets/test/Utils/StringUtils.test.ets`，共 27 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_STRING_UTILS_0100 | testStringUtils0001 | Capitalize the first character and keep the tail untouched. | Level 0 | Pass |
| SUB_STRING_UTILS_0200 | testStringUtils0002 | Uncapitalize an upper case head and pass empty text through. | Level 0 | Pass |
| SUB_STRING_UTILS_0300 | testStringUtils0003 | Convert snake and kebab sources into camel case. | Level 0 | Pass |
| SUB_STRING_UTILS_0400 | testStringUtils0004 | Split Pascal boundaries into lower case snake identifiers. | Level 0 | Pass |
| SUB_STRING_UTILS_0500 | testStringUtils0005 | Join separated words with a single hyphen in kebab case. | Level 0 | Pass |
| SUB_STRING_UTILS_0600 | testStringUtils0006 | Return the source unchanged for empty and blank conversions. | Level 1 | Pass |
| SUB_STRING_UTILS_0700 | testStringUtils0007 | Repeat separators and mixed boundaries into stable words. | Level 1 | Pass |
| SUB_STRING_UTILS_0800 | testStringUtils0008 | Detect a substring at the head, middle, tail and absence. | Level 0 | Pass |
| SUB_STRING_UTILS_0900 | testStringUtils0009 | Match only prefixes anchored at the first character. | Level 0 | Pass |
| SUB_STRING_UTILS_1000 | testStringUtils0010 | Match suffixes anchored at the last character. | Level 0 | Pass |
| SUB_STRING_UTILS_1100 | testStringUtils0011 | Count overlapping and separated occurrences of a needle. | Level 0 | Pass |
| SUB_STRING_UTILS_1200 | testStringUtils0012 | Repeat a fragment a positive number of times. | Level 0 | Pass |
| SUB_STRING_UTILS_1300 | testStringUtils0013 | Yield empty text for non positive or blank repeat requests. | Level 1 | Pass |
| SUB_STRING_UTILS_1400 | testStringUtils0014 | Reverse ordinary, single character and symmetric text. | Level 0 | Pass |
| SUB_STRING_UTILS_1500 | testStringUtils0015 | Strip spaces, tabs and line breaks out of mixed text. | Level 0 | Pass |
| SUB_STRING_UTILS_1600 | testStringUtils0016 | Produce an alphanumeric token of the requested length. | Level 0 | Pass |
| SUB_STRING_UTILS_1700 | testStringUtils0017 | Draw different tokens from the generator on repeated calls. | Level 1 | Pass |
| SUB_STRING_UTILS_1800 | testStringUtils0018 | Restrict hexadecimal output to lower case hex digits. | Level 0 | Pass |
| SUB_STRING_UTILS_1900 | testStringUtils0019 | Hash identical texts to the same non negative integer. | Level 0 | Pass |
| SUB_STRING_UTILS_2000 | testStringUtils0020 | Separate neighbouring texts and report zero for empty input. | Level 1 | Pass |
| SUB_STRING_UTILS_2100 | testStringUtils0021 | Treat null, undefined and whitespace as blank content. | Level 0 | Pass |
| SUB_STRING_UTILS_2200 | testStringUtils0022 | Require at least one visible character for a non blank text. | Level 0 | Pass |
| SUB_STRING_UTILS_2300 | testStringUtils0023 | Read the length without throwing on absent values. | Level 1 | Pass |
| SUB_STRING_UTILS_2400 | testStringUtils0024 | Truncate long text to the limit and keep short text intact. | Level 0 | Pass |
| SUB_STRING_UTILS_2500 | testStringUtils0025 | Honour a custom suffix when cutting the tail off. | Level 1 | Pass |
| SUB_STRING_UTILS_2600 | testStringUtils0026 | Pad on the left with spaces up to the target width. | Level 0 | Pass |
| SUB_STRING_UTILS_2700 | testStringUtils0027 | Pad on the right with a chosen filler character. | Level 1 | Pass |

## 类型判断工具 XTS 用例

套件 `TypeUtilsTest`，测试文件：`entry/src/ohosTest/ets/test/Utils/TypeUtils.test.ets`，共 26 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_TYPE_UTILS_0100 | testTypeUtils0001 | Recognise string values and reject other primitives. | Level 0 | Pass |
| SUB_TYPE_UTILS_0200 | testTypeUtils0002 | Reject text and NaN while accepting every finite number. | Level 0 | Pass |
| SUB_TYPE_UTILS_0300 | testTypeUtils0003 | Distinguish real booleans from their textual counterparts. | Level 0 | Pass |
| SUB_TYPE_UTILS_0400 | testTypeUtils0004 | Identify arrays including the empty array. | Level 0 | Pass |
| SUB_TYPE_UTILS_0500 | testTypeUtils0005 | Exclude null and arrays from the object classification. | Level 1 | Pass |
| SUB_TYPE_UTILS_0600 | testTypeUtils0006 | Detect callable values and treat null as non callable. | Level 1 | Pass |
| SUB_TYPE_UTILS_0700 | testTypeUtils0007 | Flag only null and undefined as absent references. | Level 0 | Pass |
| SUB_TYPE_UTILS_0800 | testTypeUtils0008 | Treat empty text as empty but keep zero as content. | Level 0 | Pass |
| SUB_TYPE_UTILS_0900 | testTypeUtils0009 | Report emptiness for empty collections and filled ones otherwise. | Level 1 | Pass |
| SUB_TYPE_UTILS_1000 | testTypeUtils0010 | Convert numeric text including decimals and surrounding spaces. | Level 0 | Pass |
| SUB_TYPE_UTILS_1100 | testTypeUtils0011 | Fall back to the requested default for unparsable text. | Level 1 | Pass |
| SUB_TYPE_UTILS_1200 | testTypeUtils0012 | Accept true, one and yes in any letter case as positive. | Level 0 | Pass |
| SUB_TYPE_UTILS_1300 | testTypeUtils0013 | Reject other text, zero and non scalar values as negative. | Level 1 | Pass |
| SUB_TYPE_UTILS_1400 | testTypeUtils0014 | Pass strings through and stringify scalars without changes. | Level 0 | Pass |
| SUB_TYPE_UTILS_1500 | testTypeUtils0015 | Substitute the default when the value is absent. | Level 1 | Pass |
| SUB_TYPE_UTILS_1600 | testTypeUtils0016 | Return scalar and null inputs from the clone untouched. | Level 0 | Pass |
| SUB_TYPE_UTILS_1700 | testTypeUtils0017 | Detach the cloned record from later writes to the original. | Level 0 | Pass |
| SUB_TYPE_UTILS_1800 | testTypeUtils0018 | Copy nested arrays into independent inner containers. | Level 1 | Pass |
| SUB_TYPE_UTILS_1900 | testTypeUtils0019 | Compare primitives by identity and reject type mismatches. | Level 0 | Pass |
| SUB_TYPE_UTILS_2000 | testTypeUtils0020 | Match objects that carry identical keys and values. | Level 0 | Pass |
| SUB_TYPE_UTILS_2100 | testTypeUtils0021 | Reject records that differ only by an extra key. | Level 1 | Pass |
| SUB_TYPE_UTILS_2200 | testTypeUtils0022 | Walk nested arrays and objects while comparing values. | Level 1 | Pass |
| SUB_TYPE_UTILS_2300 | testTypeUtils0023 | Name the nullish values and arrays distinctly from objects. | Level 0 | Pass |
| SUB_TYPE_UTILS_2400 | testTypeUtils0024 | Report the JavaScript type name of every scalar value. | Level 0 | Pass |
| SUB_TYPE_UTILS_2500 | testTypeUtils0025 | Parse object and array payloads into their typed shapes. | Level 0 | Pass |
| SUB_TYPE_UTILS_2600 | testTypeUtils0026 | Keep the default value when the payload cannot be parsed. | Level 1 | Pass |

## 剪贴板工具 XTS 用例

套件 `ClipboardUtilsTest`，测试文件：`entry/src/ohosTest/ets/test/Validation/ClipboardUtils.test.ets`，共 17 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_CLIPBOARD_UTILS_0100 | testClipboardUtils0001 | Reset the clipboard to empty content of unknown type. | Level 0 | Pass |
| SUB_CLIPBOARD_UTILS_0200 | testClipboardUtils0002 | Store plain text and read back the identical payload. | Level 0 | Pass |
| SUB_CLIPBOARD_UTILS_0300 | testClipboardUtils0003 | Keep the text type even when the stored content looks like a link. | Level 1 | Pass |
| SUB_CLIPBOARD_UTILS_0400 | testClipboardUtils0004 | Accept an empty write and mark the clipboard as text. | Level 1 | Pass |
| SUB_CLIPBOARD_UTILS_0500 | testClipboardUtils0005 | Detect absolute web addresses as clipboard URI content. | Level 0 | Pass |
| SUB_CLIPBOARD_UTILS_0600 | testClipboardUtils0006 | Recognise markup only when it opens and closes a tag. | Level 0 | Pass |
| SUB_CLIPBOARD_UTILS_0700 | testClipboardUtils0007 | Fall back to text for words and to unknown for absent input. | Level 1 | Pass |
| SUB_CLIPBOARD_UTILS_0800 | testClipboardUtils0008 | Copy a device name and its address as a two line note. | Level 0 | Pass |
| SUB_CLIPBOARD_UTILS_0900 | testClipboardUtils0009 | Join connection log lines into one clipboard payload. | Level 0 | Pass |
| SUB_CLIPBOARD_UTILS_1000 | testClipboardUtils0010 | Copy a single log line and an empty log collection. | Level 1 | Pass |
| SUB_CLIPBOARD_UTILS_1100 | testClipboardUtils0011 | Notify the registered listener with text and its content. | Level 0 | Pass |
| SUB_CLIPBOARD_UTILS_1200 | testClipboardUtils0012 | Notify listeners for device info and log copy helpers. | Level 0 | Pass |
| SUB_CLIPBOARD_UTILS_1300 | testClipboardUtils0013 | Stop notifications once the listener has been removed. | Level 0 | Pass |
| SUB_CLIPBOARD_UTILS_1400 | testClipboardUtils0014 | Reach every registered listener with the same clipboard event. | Level 1 | Pass |
| SUB_CLIPBOARD_UTILS_1500 | testClipboardUtils0015 | Ignore a removal request for a listener that was never added. | Level 1 | Pass |
| SUB_CLIPBOARD_UTILS_1600 | testClipboardUtils0016 | Keep notifying later listeners when one handler throws. | Level 1 | Pass |
| SUB_CLIPBOARD_UTILS_1700 | testClipboardUtils0017 | Leave listeners idle while the clipboard is only cleared. | Level 1 | Pass |

## 表单校验器 XTS 用例

套件 `FormValidatorTest`，测试文件：`entry/src/ohosTest/ets/test/Validation/FormValidator.test.ets`，共 20 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_FORM_VALIDATOR_0100 | testFormValidator0001 | Pass an empty form when no rule has been registered. | Level 0 | Pass |
| SUB_FORM_VALIDATOR_0200 | testFormValidator0002 | Count and look up rules after they are registered. | Level 0 | Pass |
| SUB_FORM_VALIDATOR_0300 | testFormValidator0003 | Keep both rules when the same field is registered twice. | Level 1 | Pass |
| SUB_FORM_VALIDATOR_0400 | testFormValidator0004 | Drop every rule that points at the removed field name. | Level 0 | Pass |
| SUB_FORM_VALIDATOR_0500 | testFormValidator0005 | Reset the rule list to the initial empty state. | Level 1 | Pass |
| SUB_FORM_VALIDATOR_0600 | testFormValidator0006 | Remove an unknown field name without touching other rules. | Level 1 | Pass |
| SUB_FORM_VALIDATOR_0700 | testFormValidator0007 | Report the required error when the field is absent. | Level 0 | Pass |
| SUB_FORM_VALIDATOR_0800 | testFormValidator0008 | Treat whitespace only input as a missing required value. | Level 1 | Pass |
| SUB_FORM_VALIDATOR_0900 | testFormValidator0009 | Apply the length bound to an absent optional field. | Level 0 | Pass |
| SUB_FORM_VALIDATOR_1000 | testFormValidator0010 | Enforce the lower length bound at its exact boundary. | Level 0 | Pass |
| SUB_FORM_VALIDATOR_1100 | testFormValidator0011 | Enforce the upper length bound and prefer the short error. | Level 1 | Pass |
| SUB_FORM_VALIDATOR_1200 | testFormValidator0012 | Apply a digit pattern and report the format error text. | Level 0 | Pass |
| SUB_FORM_VALIDATOR_1300 | testFormValidator0013 | Route a custom validator failure into the field error map. | Level 0 | Pass |
| SUB_FORM_VALIDATOR_1400 | testFormValidator0014 | Skip the custom validator while the field stays empty. | Level 1 | Pass |
| SUB_FORM_VALIDATOR_1500 | testFormValidator0015 | Accumulate one error per failing field in a single pass. | Level 0 | Pass |
| SUB_FORM_VALIDATOR_1600 | testFormValidator0016 | Keep error text out of the map for a fully valid form. | Level 1 | Pass |
| SUB_FORM_VALIDATOR_1700 | testFormValidator0017 | Verify the preset device form rejects missing name and MAC. | Level 0 | Pass |
| SUB_FORM_VALIDATOR_1800 | testFormValidator0018 | Accept a complete device form and reject a malformed MAC. | Level 1 | Pass |
| SUB_FORM_VALIDATOR_1900 | testFormValidator0019 | Validate the preset connection configuration timeout field. | Level 0 | Pass |
| SUB_FORM_VALIDATOR_2000 | testFormValidator0020 | Reject negative or unparsable timeouts in the preset form. | Level 1 | Pass |

## 随机数据生成工具 XTS 用例

套件 `RandomUtilsTest`，测试文件：`entry/src/ohosTest/ets/test/Validation/RandomUtils.test.ets`，共 22 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_RANDOM_UTILS_0100 | testRandomUtils0001 | Draw MAC addresses that satisfy the MAC format validator. | Level 0 | Pass |
| SUB_RANDOM_UTILS_0200 | testRandomUtils0002 | Spread drawn MAC addresses over distinct values. | Level 1 | Pass |
| SUB_RANDOM_UTILS_0300 | testRandomUtils0003 | Draw UUIDs with the canonical grouping and hex characters. | Level 0 | Pass |
| SUB_RANDOM_UTILS_0400 | testRandomUtils0004 | Keep drawn UUIDs distinct across repeated generator calls. | Level 1 | Pass |
| SUB_RANDOM_UTILS_0500 | testRandomUtils0005 | Prefix drawn device names and finish them with a digit block. | Level 0 | Pass |
| SUB_RANDOM_UTILS_0600 | testRandomUtils0006 | Draw device names from a bounded pool of category prefixes. | Level 1 | Pass |
| SUB_RANDOM_UTILS_0700 | testRandomUtils0007 | Reuse manufacturers from a small fixed catalogue. | Level 1 | Pass |
| SUB_RANDOM_UTILS_0800 | testRandomUtils0008 | Draw integer RSSI readings inside the default signal window. | Level 0 | Pass |
| SUB_RANDOM_UTILS_0900 | testRandomUtils0009 | Respect explicit bounds and collapse a zero width interval. | Level 1 | Pass |
| SUB_RANDOM_UTILS_1000 | testRandomUtils0010 | Stay within the accepted signal range for an inverted interval. | Level 1 | Pass |
| SUB_RANDOM_UTILS_1100 | testRandomUtils0011 | Build device identifiers from a fixed head and two tokens. | Level 0 | Pass |
| SUB_RANDOM_UTILS_1200 | testRandomUtils0012 | Grow the timestamp token so identifiers never collide. | Level 1 | Pass |
| SUB_RANDOM_UTILS_1300 | testRandomUtils0013 | Draw eleven digit phone numbers that pass the phone validator. | Level 0 | Pass |
| SUB_RANDOM_UTILS_1400 | testRandomUtils0014 | Join a first and a last name with exactly one separator space. | Level 0 | Pass |
| SUB_RANDOM_UTILS_1500 | testRandomUtils0015 | Keep heart rate and blood oxygen inside their clinical bands. | Level 0 | Pass |
| SUB_RANDOM_UTILS_1600 | testRandomUtils0016 | Draw blood pressure pairs with the systolic value on top. | Level 0 | Pass |
| SUB_RANDOM_UTILS_1700 | testRandomUtils0017 | Round temperature and weight samples to one decimal place. | Level 1 | Pass |
| SUB_RANDOM_UTILS_1800 | testRandomUtils0018 | Choose only members of the supplied pool of profile names. | Level 0 | Pass |
| SUB_RANDOM_UTILS_1900 | testRandomUtils0019 | Return an absent element when the choice pool holds nothing. | Level 1 | Pass |
| SUB_RANDOM_UTILS_2000 | testRandomUtils0020 | Force the boolean outcome with zero and one probabilities. | Level 1 | Pass |
| SUB_RANDOM_UTILS_2100 | testRandomUtils0021 | Assemble four part IPv4 addresses with usable edge octets. | Level 0 | Pass |
| SUB_RANDOM_UTILS_2200 | testRandomUtils0022 | Keep middle IPv4 octets across the full byte span. | Level 1 | Pass |

## 通用校验工具 XTS 用例

套件 `ValidationUtilsTest`，测试文件：`entry/src/ohosTest/ets/test/Validation/ValidationUtils.test.ets`，共 20 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_VALIDATION_UTILS_0100 | testValidationUtils0001 | Accept a colon separated MAC address of mixed letter case. | Level 0 | Pass |
| SUB_VALIDATION_UTILS_0200 | testValidationUtils0002 | Accept the hyphen separated MAC spelling as well. | Level 0 | Pass |
| SUB_VALIDATION_UTILS_0300 | testValidationUtils0003 | Reject malformed MAC text with the format error code. | Level 1 | Pass |
| SUB_VALIDATION_UTILS_0400 | testValidationUtils0004 | Report the empty error before any format check for MAC. | Level 1 | Pass |
| SUB_VALIDATION_UTILS_0500 | testValidationUtils0005 | Accept a canonical hyphenated UUID in lower case. | Level 0 | Pass |
| SUB_VALIDATION_UTILS_0600 | testValidationUtils0006 | Accept upper case UUID characters without normalising them. | Level 0 | Pass |
| SUB_VALIDATION_UTILS_0700 | testValidationUtils0007 | Reject truncated or unparsable UUID payloads. | Level 1 | Pass |
| SUB_VALIDATION_UTILS_0800 | testValidationUtils0008 | Flag an absent UUID with the dedicated empty error code. | Level 1 | Pass |
| SUB_VALIDATION_UTILS_0900 | testValidationUtils0009 | Approve ordinary and single character device names. | Level 0 | Pass |
| SUB_VALIDATION_UTILS_1000 | testValidationUtils0010 | Enforce the maximum device name length constant. | Level 1 | Pass |
| SUB_VALIDATION_UTILS_1100 | testValidationUtils0011 | Accept RSSI values inside the supported signal window. | Level 0 | Pass |
| SUB_VALIDATION_UTILS_1200 | testValidationUtils0012 | Reject RSSI readings beyond both ends of the window. | Level 1 | Pass |
| SUB_VALIDATION_UTILS_1300 | testValidationUtils0013 | Validate volume against the implicit hundred step scale. | Level 0 | Pass |
| SUB_VALIDATION_UTILS_1400 | testValidationUtils0014 | Honour a custom ceiling when validating the volume level. | Level 1 | Pass |
| SUB_VALIDATION_UTILS_1500 | testValidationUtils0015 | Accept plain, prefixed and bracketed phone spellings. | Level 0 | Pass |
| SUB_VALIDATION_UTILS_1600 | testValidationUtils0016 | Reject letters and too short digit runs as phone numbers. | Level 1 | Pass |
| SUB_VALIDATION_UTILS_1700 | testValidationUtils0017 | Distinguish empty phone input from malformed phone input. | Level 1 | Pass |
| SUB_VALIDATION_UTILS_1800 | testValidationUtils0018 | Check IPv4 octets and reject values above the byte ceiling. | Level 0 | Pass |
| SUB_VALIDATION_UTILS_1900 | testValidationUtils0019 | Require visible characters and name the offending field. | Level 0 | Pass |
| SUB_VALIDATION_UTILS_2000 | testValidationUtils0020 | Bound numeric ranges and string lengths with field messages. | Level 1 | Pass |

## 蓝牙领域常量 XTS 用例

套件 `BluetoothConstantsTest`，测试文件：`entry/src/ohosTest/ets/test/Constants/BluetoothConstants.test.ets`，共 12 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_BT_CONST_0100 | testBluetoothConstants0001 | Verify the application identity and log tag constants exposed to every Bluetooth module. | Level 0 | Pass |
| SUB_BT_CONST_0200 | testBluetoothConstants0002 | Verify every declared Bluetooth error code and the spacing between adjacent codes. | Level 0 | Pass |
| SUB_BT_CONST_0300 | testBluetoothConstants0003 | Query the message text of every defined error code and confirm all texts are distinct. | Level 0 | Pass |
| SUB_BT_CONST_0400 | testBluetoothConstants0004 | Verify undefined error codes fall back to the generated unknown error text. | Level 1 | Pass |
| SUB_BT_CONST_0500 | testBluetoothConstants0005 | Classify every defined error code as recoverable and confirm only retryable failures qualify. | Level 1 | Pass |
| SUB_BT_CONST_0600 | testBluetoothConstants0006 | Classify permanent failures and confirm the permanent and recoverable sets never overlap. | Level 1 | Pass |
| SUB_BT_CONST_0700 | testBluetoothConstants0007 | Verify global limit and timing constants and confirm repeated initialization keeps them stable. | Level 0 | Pass |
| SUB_BT_CONST_0800 | testBluetoothConstants0008 | Verify profile specific capacity, payload and sampling constants and their size relationships. | Level 0 | Pass |
| SUB_BT_CONST_0900 | testBluetoothConstants0009 | Verify service UUID constants satisfy the declared UUID length and both shipped UUID validators. | Level 0 | Pass |
| SUB_BT_CONST_1000 | testBluetoothConstants0010 | Verify device name and MAC address length limits against the validators that consume them. | Level 1 | Pass |
| SUB_BT_CONST_1100 | testBluetoothConstants0011 | Verify audio codec and volume constants against the limits actually applied by the profile services. | Level 1 | Pass |
| SUB_BT_CONST_1200 | testBluetoothConstants0012 | Verify profile, state and category enumeration values that are exchanged with the user interface layer. | Level 0 | Pass |

## 异常与错误处理 XTS 用例

套件 `ErrorHandlingTest`，测试文件：`entry/src/ohosTest/ets/test/Integration/ErrorHandling.test.ets`，共 22 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_ERROR_HANDLING_0100 | testErrorHandling0001 | Verify that a connect on an uninitialized manager is refused and recorded as not ready. | Level 1 | Pass |
| SUB_ERROR_HANDLING_0200 | testErrorHandling0002 | Verify that a repeated initialization is refused and leaves the manager operational. | Level 1 | Pass |
| SUB_ERROR_HANDLING_0300 | testErrorHandling0003 | Verify that every manager entry point is refused after the manager is destroyed. | Level 1 | Pass |
| SUB_ERROR_HANDLING_0400 | testErrorHandling0004 | Verify that re-initializing a destroyed manager restores a clean state and connectivity. | Level 0 | Pass |
| SUB_ERROR_HANDLING_0500 | testErrorHandling0005 | Verify that an empty device identifier fails through both manager and service layers. | Level 1 | Pass |
| SUB_ERROR_HANDLING_0600 | testErrorHandling0006 | Verify that a blank identifier is accepted because only empty identifiers are rejected. | Level 1 | Pass |
| SUB_ERROR_HANDLING_0700 | testErrorHandling0007 | Verify that an oversized device identifier is managed without any length validation. | Level 1 | Pass |
| SUB_ERROR_HANDLING_0800 | testErrorHandling0008 | Verify that reconnecting an already managed device is idempotent and untracked. | Level 1 | Pass |
| SUB_ERROR_HANDLING_0900 | testErrorHandling0009 | Verify that disconnecting an unmanaged device is refused without reaching the service. | Level 1 | Pass |
| SUB_ERROR_HANDLING_1000 | testErrorHandling0010 | Verify that the managed device limit blocks further connections with a max devices record. | Level 1 | Pass |
| SUB_ERROR_HANDLING_1100 | testErrorHandling0011 | Verify that two simultaneous connections of one device create duplicate managed entries. | Level 1 | Pass |
| SUB_ERROR_HANDLING_1200 | testErrorHandling0012 | Verify that a throwing state callback is contained and removed callbacks stop receiving events. | Level 1 | Pass |
| SUB_ERROR_HANDLING_1300 | testErrorHandling0013 | Verify that statistics, records and device lists are returned as independent copies. | Level 1 | Pass |
| SUB_ERROR_HANDLING_1400 | testErrorHandling0014 | Verify the identifier, timing and message fields of failed operation records. | Level 1 | Pass |
| SUB_ERROR_HANDLING_1500 | testErrorHandling0015 | Verify that a reset clears the record list while the connection counters are retained. | Level 1 | Pass |
| SUB_ERROR_HANDLING_1600 | testErrorHandling0016 | Verify that the operation record list keeps only the most recent five hundred entries. | Level 1 | Pass |
| SUB_ERROR_HANDLING_1700 | testErrorHandling0017 | Verify connection counters and the healthy score across repeated connect and disconnect cycles. | Level 0 | Pass |
| SUB_ERROR_HANDLING_1800 | testErrorHandling0018 | Verify that the configuration is returned as a copy and unvalidated values are accepted. | Level 1 | Pass |
| SUB_ERROR_HANDLING_1900 | testErrorHandling0019 | Verify the health score degradation and recovery steps after a failed and a valid connection. | Level 1 | Pass |
| SUB_ERROR_HANDLING_2000 | testErrorHandling0020 | Verify that the health status view agrees with the statistics after an error appears. | Level 1 | Pass |
| SUB_ERROR_HANDLING_2100 | testErrorHandling0021 | Verify that failures raised by one manager instance do not affect a second instance. | Level 1 | Pass |
| SUB_ERROR_HANDLING_2200 | testErrorHandling0022 | Verify that a manager returns to normal work after a failure followed by a reset. | Level 1 | Pass |

## 多 Profile 集成场景 XTS 用例

套件 `MultiProfileIntegrationTest`，测试文件：`entry/src/ohosTest/ets/test/Integration/MultiProfileIntegration.test.ets`，共 20 条用例。

| 用例编号 | 用例名称 | 场景说明 | 级别 | 结果 |
| --- | --- | --- | --- | --- |
| SUB_MULTI_PROFILE_0100 | testMultiProfile0001 | Verify that all eight profile managers initialize on their own and expose their profile type. | Level 0 | Pass |
| SUB_MULTI_PROFILE_0200 | testMultiProfile0002 | Verify that one device can be connected through audio and voice profiles at the same time. | Level 0 | Pass |
| SUB_MULTI_PROFILE_0300 | testMultiProfile0003 | Verify that cascading disconnections keep the remaining profiles connected. | Level 0 | Pass |
| SUB_MULTI_PROFILE_0400 | testMultiProfile0004 | Verify that four profiles connect and disconnect one device without cross interference. | Level 0 | Pass |
| SUB_MULTI_PROFILE_0500 | testMultiProfile0005 | Verify that two profiles manage the same pair of devices with independent device lists. | Level 0 | Pass |
| SUB_MULTI_PROFILE_0600 | testMultiProfile0006 | Verify that a connection failure of one profile leaves the other profiles healthy. | Level 1 | Pass |
| SUB_MULTI_PROFILE_0700 | testMultiProfile0007 | Compare the health scores of a degraded, a connected and an idle profile manager. | Level 1 | Pass |
| SUB_MULTI_PROFILE_0800 | testMultiProfile0008 | Verify that a profile configuration change is applied only to the changed profile. | Level 1 | Pass |
| SUB_MULTI_PROFILE_0900 | testMultiProfile0009 | Verify that resetting one profile keeps the connections of the other profiles. | Level 0 | Pass |
| SUB_MULTI_PROFILE_1000 | testMultiProfile0010 | Verify that destroyed audio profile still refuses work while the voice profile keeps serving. | Level 1 | Pass |
| SUB_MULTI_PROFILE_1100 | testMultiProfile0011 | Verify that uninitialized managers of four profiles refuse connect and disconnect alike. | Level 1 | Pass |
| SUB_MULTI_PROFILE_1200 | testMultiProfile0012 | Verify that an empty device identifier is refused by every initialized profile manager. | Level 1 | Pass |
| SUB_MULTI_PROFILE_1300 | testMultiProfile0013 | Verify that disconnecting an unmanaged device is refused without calling the services. | Level 1 | Pass |
| SUB_MULTI_PROFILE_1400 | testMultiProfile0014 | Verify that a repeated initialization is refused for every profile manager involved. | Level 1 | Pass |
| SUB_MULTI_PROFILE_1500 | testMultiProfile0015 | Verify that non audio profiles reach the connected service state for one shared device. | Level 0 | Pass |
| SUB_MULTI_PROFILE_1600 | testMultiProfile0016 | Verify that profile models stay independent while both profiles are active. | Level 0 | Pass |
| SUB_MULTI_PROFILE_1700 | testMultiProfile0017 | Verify that a statistics snapshot of one profile is not rewritten by another profile. | Level 1 | Pass |
| SUB_MULTI_PROFILE_1800 | testMultiProfile0018 | Verify that a reset of three profiles clears their records while their counters are kept. | Level 1 | Pass |
| SUB_MULTI_PROFILE_1900 | testMultiProfile0019 | Verify that operation records of each profile grow only with the operations of that profile. | Level 1 | Pass |
| SUB_MULTI_PROFILE_2000 | testMultiProfile0020 | Walk one audio and one voice profile through initialization, reset, destruction and recovery. | Level 0 | Pass |

## 已知实现观察（仅记录，未修改业务代码）

以下行为由用例真实观测并锁定，属于 `library` 侧实现特点或缺陷，本次整改不在测试范围内修改：

1. `EncryptionUtils.base64Encode/base64Decode` 以 `charCodeAt` 逐字符处理：非 ASCII 输入与长度不是 3 的倍数的输入无法无损往返，解码长度不是 4 的倍数的字符串时会在有效尾部之后追加垃圾字节。
2. `PreferenceUtils.getBoolean` 走 `Boolean(value)`，字符串 'false' 依然返回 `true`。
3. `FileUtils.formatFileSize` 对负数字节数返回 `NaN undefined`（`Math.log` 结果为 NaN，单位数组越界）。
4. `HttpUtils` 的请求/响应拦截器只有注册与清理入口，没有任何请求管线会调用它们（注册后 `onRequest`/`onResponse` 恒不执行）。
5. `Constants.isValidMacAddress` 实际使用蓝牙冒号式正则 `BLUETOOTH_ADDRESS_REGEX`，短横分隔与混用分隔均返回 false，与方法名和 `MAC_ADDRESS_REGEX` 语义不一致。
6. `DeviceUtils.getMemoryInfo` 因内部 `totalMem = 0` 恒返回 `Unknown`；`getStorageInfo` 恒返回 `Available`；`supportsBluetooth`/`supportsBle` 恒返回 true。
7. `StorageUtils` 的容量淘汰按插入顺序选取第一个访问计数最小项，不是严格 LRU；`getStats` 返回的对象类型未在 `library/Index.ets` 导出。
8. `HttpUtils`、`EncryptionUtils`、`PermissionUtils`、`PreferenceUtils`、`StorageUtils`、`DeviceUtils` 的多个返回类型接口（`HttpRequestConfig`、`PreferenceChangeListener`、`NetworkCallback`、`DeviceInfo`、`CacheStats` 等）未从 `library/Index.ets` 导出，测试侧只能使用类型推断或结构性兼容写法。
9. `FormatUtils.truncate` 与 `StringUtils.truncate` 在后缀长度超过 `maxLen` 时直接返回后缀本身（`truncate('ab', 1)` 返回 `...`），结果长度反而大于请求的最大长度。
10. `FormValidator.validate` 对 `required: false` 的字段在值为空时跳过 `customValidator`，因此缺省可选字段不会产生任何错误项（`errors.size` 只统计实际填写的非法值）。
