# Custom Data for Distributed Device Discovery

### Introduction

This sample is implemented in C based on the OpenHarmony Distributed SoftBus (DSoftBus) discovery and transport interfaces. It runs in a command-line terminal and demonstrates the complete usage of the COAP discovery extension **custData** (`DSOFTBUS_FEATURE_DISC_COAP_CUSTDATA`): the publish end carries a custom identifier in `capabilityData`, the refresh end filters devices by `custData` and maintains a communication whitelist, and then exchanges data with the devices in the whitelist through the SoftBus transport interfaces.

The main interfaces used are:

- Discovery interfaces in [softbus_bus_center.h](https://gitcode.com/openharmony/communication_dsoftbus/blob/master/interfaces/kits/bus_center/softbus_bus_center.h): `PublishLNN()`, `StopPublishLNN()`, `RefreshLNN()`, and `StopRefreshLNN()`.
- Networking interfaces in [softbus_bus_center.h](https://gitcode.com/openharmony/communication_dsoftbus/blob/master/interfaces/kits/bus_center/softbus_bus_center.h): `GetLocalNodeDeviceInfo()`, `GetAllNodeDeviceInfo()`, `GetNodeKeyInfo()`, and `FreeNodeInfo()`.
- Transport interfaces in [socket.h](https://gitcode.com/openharmony/communication_dsoftbus/blob/master/interfaces/kits/transport/socket.h): `Socket()`, `Listen()`, `Bind()`, `SendBytes()`, and `Shutdown()`.

Features:

1. Select the publish end (waiting to be discovered) or the refresh end (discovering nearby devices) role.
2. The publish end calls `PublishLNN()` with a custom identifier (payload). When a device is reported, the refresh end performs exact matching on `custData` in the `OnDeviceFound` callback, and only matching devices enter the discovered list.
3. The discovered list is the communication whitelist. Only devices in the list can be bound with `Bind()` and receive data, and at most eight devices are maintained.
4. The refresh end resolves `devId` to a `networkId` by matching the IP carried in the discovery packet against the IPs of online nodes, then actively calls `Bind()` and sends messages through `SendBytes()`.
5. Device names are anonymized with a masked UDID, such as `DEV#ab**cd`, so the full device identifier is not exposed.
6. The publish payload and the expected payload can be changed at runtime. After the expected payload is changed, the old discovered list is cleared automatically. Stopping publishing or discovery closes all established connections.

### Effect Preview

This is a command-line program without a graphical interface. The terminal output below is captured on two devices. Device names are displayed as masked UDIDs, and the actual values depend on the devices.

On the publish end, publish the device and wait for a connection:

```text
===== 等待被发现 (本机: DEV#1a2b**3c4d) =====
  0 - 发布设备（允许被发现）
  1 - 停止发布
  2 - 设置标识信息
  3 - 查看当前状态
  4 - 退出
=======================================
==>请选择:0
>>>PublishLNN payloadLen=41 payload=[dsoftbus_custdata_sample_0123456789abcdef]
>>>Listen thread: 正在监听, socket=1, 等待发现端 Bind...
>>>[PUB-LISTEN-BIND] 本机=DEV#1a2b**3c4d, socket=1, 对端=DEV#5e6f**7a8b, dataType=2
>>>[PUB-LISTEN-RECV] 本机=DEV#1a2b**3c4d <- 对端=DEV#5e6f**7a8b, socket=1, len=69, data=[hello,第0条消息(特征:dsoftbus_custdata_sample_0123456789abcdef)]
```

On the refresh end, discover the device, establish a connection, and send a message:

```text
===== 发现附近的设备 (本机: DEV#5e6f**7a8b) =====
  0 - 开始寻找设备
  1 - 停止寻找
  2 - 设置要找的设备特征
  3 - 连接所有找到的设备
  4 - 给已连接的设备发消息
  5 - 查看当前状态
  6 - 退出
=======================================
==>请选择:0
>>>RefreshLNN start, capability=[ddmpCapability]
>>>OnDeviceFound devName=OpenHarmony devType=0 devId=a1b2**c3d4 custData=[dsoftbus_custdata_sample_0123456789abcdef]
>>>custData match expected payload, add to discovered list
>>>resolved networkId for discovered[0]
==>请选择:3
>>>Bind 成功: discovered[0], socket=1
>>>[REF-BIND-OK] socket=1, 对端=DEV#1a2b**3c4d
==>请选择:4
>>>[SEND] 本机=DEV#5e6f**7a8b -> 对端=DEV#1a2b**3c4d, socket=1, len=69, ret=0, data=[hello,第0条消息(特征:dsoftbus_custdata_sample_0123456789abcdef)]
>>>Send 到 1 个已绑定设备, 成功 1
```

View the current status on the refresh end:

```text
==>请选择:5
>>>寻找状态: active=YES, 要找的特征=[dsoftbus_custdata_sample_0123456789abcdef]
  [0] 设备=DEV#1a2b**3c4d IP=192.168.1.10 状态=已连接 已发消息=1 成功=1
```

Usage

1. Connect two devices to the same distributed network so that they are online with each other, deploy the built executable to both devices, and ensure the `DSOFTBUS_FEATURE_DISC_COAP_CUSTDATA` feature is enabled in DSoftBus on both sides.
2. On one device, run the program, enter `0` to choose "Publish end (waiting to be discovered)", and then enter `0` to publish. After publishing succeeds, the program listens automatically and waits for the refresh end to connect.
3. On the other device, run the program, enter `1` to choose "Refresh end (discovering nearby devices)", and then enter `0` to start discovery. The refresh end keeps only devices whose `custData` matches the expected identifier.
4. Enter `3` to connect all discovered devices. After the connection succeeds, enter `4` to send a message to the connected device. The publish end prints the received message.
5. On either end, enter `2` to change the identifier or expected feature, enter `3` or `5` to view the current status, and enter `1` to stop publishing or stop discovery.

### Project Directory

```text
DistributedPublishCustdata/
├── BUILD.gn                          # Build configuration; target name: disc_coap_custdata_sample
├── main.c                            # Program entry and role selection menu
├── include/
│   ├── custdata_sample_common.h      # Common constants, input/log and device utility declarations
│   ├── custdata_sample_publish.h     # Publish-end entry declaration
│   ├── custdata_sample_refresh.h     # Refresh-end entry declaration
│   └── custdata_sample_trans.h       # networkId resolution and Socket wrapper declarations
└── src/
    ├── custdata_sample_common.c      # Logging, input, UDID masking, and device name building
    ├── custdata_sample_publish.c     # Publish end: PublishLNN and a dedicated Listen thread
    ├── custdata_sample_refresh.c     # Refresh end: custData whitelist, binding, and sending
    └── custdata_sample_trans.c       # devId-to-networkId resolution and Socket wrappers
```

### Implementation Details

- The publish end is implemented in [custdata_sample_publish.c](src/custdata_sample_publish.c) with a two-thread model. The main thread handles the menu and calls `PublishLNN()` or `StopPublishLNN()`. After publishing succeeds, a dedicated Listen thread calls `Socket(NULL)` and `Listen()` to wait for a connection, records the peer in `OnBind`, and prints received data in `OnBytes`. When publishing stops, the Listen thread exits first and calls `Shutdown()` on both the listening socket and the established client socket, so that the peer receives `OnShutdown` and cleans up the device information.
- The refresh end is implemented in [custdata_sample_refresh.c](src/custdata_sample_refresh.c). In the `OnDeviceFound` callback, `device->custData` is compared with the expected payload: on match the device is added to the discovered-device table, and on mismatch it is removed. The discovered-device table is the communication whitelist. `BindAllDiscovered()` binds only devices in the table, and `SendToAllBound()` sends only to bound devices in the table. After the expected payload is changed, old devices no longer match, so the entire table is cleared.
- The custom identifier is carried in `PublishInfo.capabilityData`, delivered through the COAP `bData` channel with the discovery response, and read by the refresh end from `DeviceInfo.custData`. The refresh end does not put the expected value into `SubscribeInfo.capabilityData`; filtering is fully performed by the application in the `OnDeviceFound` callback. The identifier must not exceed 284 bytes (`CD_BDATA_MAX_LEN`, the COAP `bData` channel limit), otherwise `PublishLNN()` fails.
- The devId-to-networkId resolution is in `CdResolveNetworkId()` in [custdata_sample_trans.c](src/custdata_sample_trans.c). The `DeviceInfo.devId` reported by discovery is the hash of the remote UDID and cannot be used for transport directly. The IP carried in the discovery packet is compared with the IP (`NODE_KEY_IP_ADDRESS`) of each online node returned by `GetAllNodeDeviceInfo()`, and the matching node provides the peer `networkId`. This requires the peer to be an online networked node; otherwise `SOFTBUS_NOT_FIND` is returned.
- Transport wrappers are in [custdata_sample_trans.c](src/custdata_sample_trans.c): `CdSocketCreate()`, `CdSocketListen()`, `CdSocketBind()`, and `CdSocketSendBytes()` are thin wrappers over `Socket()`, `Listen()`, `Bind()`, and `SendBytes()`. The QoS is a maximum latency of 50 ms, and `dataType` is fixed to `DATA_TYPE_BYTES`.
- Concurrency: the discovered-device table is protected by a mutex. Potentially blocking or callback-reentrant operations, such as `Shutdown()`, IPC calls for IP resolution, `Bind()`, and `SendBytes()`, copy data under the lock and run after the lock is released. When closing connections, sockets are collected first and shut down after unlocking to avoid deadlock with the DSoftBus callback threads.
- Device name anonymization is in [custdata_sample_common.c](src/custdata_sample_common.c): the device UDID is obtained through `GetNodeKeyInfo(NODE_KEY_UDID)` and masked as `DEV#xxxx**xxxx` before being displayed.

The connection sequence is as follows:

```text
Publish end: PublishLNN(payload) -> Socket()+Listen() and wait for a connection
Refresh end: RefreshLNN() -> OnDeviceFound (custData match) -> add to the whitelist
Refresh end: resolve networkId by IP matching -> Socket(peerNetworkId)+Bind()
After connected: Refresh end SendBytes() -> Publish end receives in OnBytes
Either end Shutdown() -> peer receives OnShutdown -> refresh end removes the device from the whitelist
```

Common causes of connection failures: the `capability` is different on the two sides; `DSOFTBUS_FEATURE_DISC_COAP_CUSTDATA` is not enabled on at least one side, so `custData` is empty; the peer is not networked online, so the `networkId` resolution fails; the peer has not called `Listen()`; or transmission permission verification fails.

### Permissions

This sample is a native executable and does not request application permissions. SoftBus verifies transmission permissions by matching `SESSION_NAME` against regular expressions in the transmission permission configuration file [softbus_trans_permission.json](https://gitcode.com/openharmony/communication_dsoftbus/blob/master/core/common/security/permission/softbus_trans_permission.json).

The package name and session name used by this sample are:

- `pkgName`: `com.sample.tool` (`CD_PKG_NAME`).
- `sessionName`: `com.sample.custdata.trans` (`CD_SESSION_NAME`).

The current configuration file does **not** contain a permission rule for this sample. Before running the sample, manually append the following element to the JSON array in the file. Otherwise, `Bind()` fails because the permission verification fails.

```json
{
  "SESSION_NAME": "^com.sample.*",
  "REGEXP": "true",
  "DEVID": "NETWORKID",
  "SEC_LEVEL": "public",
  "APP_INFO": [
    {
      "PKG_NAME": "com.sample.tool",
      "TYPE": "native_app",
      "ACTIONS": "create,open"
    }
  ]
}
```

After the modification, rebuild SoftBus, or replace the configuration file on a real device (see the "Dependencies" section below) and restart the SoftBus process for the permission to take effect. If you change the package name or session name of this sample, update `SESSION_NAME` and `PKG_NAME` in the rule accordingly.

### Dependencies

This sample depends on the OpenHarmony SoftBus source tree (`//foundation/communication/dsoftbus`). It must be built inside the SoftBus source tree and does not depend on other samples. Integration steps:

1. Create a `custdata_sample` directory under `foundation/communication/dsoftbus/tests/`, and copy all the contents of this directory (`DistributedPublishCustdata`), including `BUILD.gn`, `main.c`, `include/`, and `src/`, but not the directory itself, into it so that the build file is located at `tests/custdata_sample/BUILD.gn`.
2. Register the build target in `foundation/communication/dsoftbus/tests/BUILD.gn`:

```gn
group("custdata_sample") {
  testonly = true
  deps = [
    "custdata_sample:disc_coap_custdata_sample",
  ]
}
```

3. Append the transmission permission rule of this sample to the JSON array in `softbus_trans_permission.json` (see the rule in the "Permissions" section above).
4. Enable the `DSOFTBUS_FEATURE_DISC_COAP_CUSTDATA` feature macro in `foundation/communication/dsoftbus/dsoftbus.gni`. Both the publish end and the refresh end must be built with this macro, otherwise the peer's reported `custData` is empty.
5. Build from the OpenHarmony source root:

```sh
./build.sh --product-name <product_name> --build-target custdata_sample --ccache
```

For a small system, the executable is generated at `out/hispark_taurus/ipcamera_hispark_taurus_linux/bin/disc_coap_custdata_sample` (example path; the actual directory depends on the product name).

6. Deploy the built executable to the target devices and run it on two networked devices.

On a real device, you can also replace `/etc/softbus_trans_permission.json` with the modified file. If the system partition has insufficient space, place the new file elsewhere and run `mount --bind <new_file_path> /etc/softbus_trans_permission.json`, then kill the SoftBus process, such as `softbus_server`, so that the configuration is reloaded.

### Constraints and Limitations

1. This sample supports the standard system and small systems (liteos_a), but does not support mini systems (liteos_m).
2. This is a command-line native C sample rather than an ArkTS application. It does not contain an ohosTest UI automation module; the archived manual test cases are in [ohosTest.md](ohosTest.md).
3. Two devices connected to the same distributed network and online with each other are required, and the discovered list maintains at most eight devices.
4. The custom identifier must not exceed 284 bytes (the COAP `bData` channel limit); a longer identifier makes publishing fail.
5. `DeviceInfo.devId` is the hash of the remote UDID. The peer must be an online networked node for the `networkId` to be resolved by IP matching, otherwise the connection cannot be established.
6. The publish end and the refresh end must use the same `capability` (`ddmpCapability` in this sample), and the `DSOFTBUS_FEATURE_DISC_COAP_CUSTDATA` feature must be enabled in DSoftBus on both sides.

### Download

To download only this project, run:

```text
git init
git config core.sparsecheckout true
echo code/SystemFeature/DistributedAppDev/DistributedPublishCustdata/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
