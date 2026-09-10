# Distributed Data Transmission

### Introduction

This sample is implemented in C based on the OpenHarmony Distributed SoftBus (DSoftBus) transport interfaces. It runs in a command-line terminal and simulates a video-streaming scenario where one end casts the screen and multiple ends display it, demonstrating the complete usage of the external interfaces of the SoftBus transport module.

The main interfaces used are:

- Transport interfaces in [socket.h](https://gitcode.com/openharmony/communication_dsoftbus/blob/master/interfaces/kits/transport/socket.h): `Socket()`, `Listen()`, `Bind()`, `SendMessage()`, `SendBytes()`, `SendStream()`, and `Shutdown()`.
- Networking interfaces in [softbus_bus_center.h](https://gitcode.com/openharmony/communication_dsoftbus/blob/master/interfaces/kits/bus_center/softbus_bus_center.h): `GetLocalNodeDeviceInfo()`, `GetAllNodeDeviceInfo()`, `GetNodeKeyInfo()`, and `FreeNodeInfo()`.

Features:

1. Select the Bind end (sender) or the Listen end (receiver) role.
2. Enumerate online devices on the network. Device names are anonymized with a masked UUID, such as `DEV#ab**cd`, so the full device identifier is not exposed.
3. The Bind end can cast to up to eight devices at the same time, supporting three data types: MESSAGE, BYTES, and RAW_STREAM.
4. The Listen end can accept or reject a cast request in the negotiation callback, and it can also send data back to the Bind end after the connection is established.
5. The sender generates simulated frames at a fixed frame rate (4 fps produced, 2 fps sent) and records per-device send statistics.

### Effect Preview

This is a command-line program without a graphical interface. The terminal output below is captured on two devices. Device names are displayed as masked UUIDs, and the actual values depend on the devices.

List online devices:

```text
--- 设备列表 ---
本机: DEV#1a2b**3c4d
对端设备:
  [0] DEV#5e6f**7a8b
```

On the Bind end (sender), start a cast and keep sending:

```text
===== 投屏菜单 (本机: DEV#1a2b**3c4d) =====
  0 - 投屏到新设备
  1 - 断开投屏
  2 - 查看投屏列表
  3 - 查看在线设备
  4 - 退出投屏
================================
>>>Socket() create succ, socket = 1
>>>Bind ret=0
>>>投屏成功: socket=1, 类型=BYTES
>>>[SEND-BYTES] 本机=DEV#1a2b**3c4d -> 对端=DEV#5e6f**7a8b, socket=1, seq=0, len=64, ret=0, data=frame#000:1a2b**3c4d
>>>[SEND-BYTES] 本机=DEV#1a2b**3c4d -> 对端=DEV#5e6f**7a8b, socket=1, seq=1, len=64, ret=0, data=frame#001:1a2b**3c4d
```

On the Listen end (receiver), accept the request and receive data:

```text
选择传输方式:
  1 - 消息 (MESSAGE, 低延迟小包)
  2 - 字节流 (BYTES, 通用)
  3 - 视频流 (RAW_STREAM, 持续帧)
>>>Socket() create succ, socket = 1
>>>监听 socket=1, 等待投屏请求...
>>>[Listen] 收到投屏请求: socket=1, 设备=DEV#1a2b**3c4d, pkgName=com.sample.tool
==>是否接受？(1=接受, 0=拒绝):1
>>>OnBind socket=1, dataType=2
>>>[RECV-BYTES] 本机=DEV#5e6f**7a8b <- 对端=DEV#1a2b**3c4d, socket=1, total=1, len=64, data=frame#000:1a2b**3c4d
```

Usage

1. Connect two devices to the same distributed network so that they are online with each other, and deploy the built executable to both devices.
2. On the receiving device, run the program and enter `1` to choose "Receive". Select a data type, and the program starts listening and waits for a cast request.
3. On the sending device, run the program and enter `0` to choose "Cast". Select the online device index and a data type as prompted. After `Bind()` succeeds, simulated frames are sent automatically at the fixed frame rate.
4. When the receiver prompts for the cast request, enter `1` to accept it or `0` to reject it. After the connection is established, the receiver can send data back or view the connection status from its menu.
5. On the sender, enter `2` to view the data type, sent frame count, and successful frame count of each connected device. Enter `1` to disconnect a specific cast, or enter `4` to exit.

### Project Directory

```text
DistributedDataTrans/
├── BUILD.gn                          # Build configuration; target name: video_stream_sample
├── main.c                            # Program entry and role selection menu
├── include/
│   ├── video_sample_common.h         # Common constants, types, and utility declarations
│   ├── video_sample_internal.h       # Shared internals: state machine, listener builders, send API
│   ├── video_sample_bind.h           # Bind-end entry declaration
│   ├── video_sample_listen.h         # Listen-end entry declaration
│   └── video_frame_producer.h        # Frame producer interface declaration
└── src/
    ├── video_sample.c                # Receive callbacks, Listen state machine, send dispatch
    ├── video_sample_common.c         # Logging, input, device enumeration, and UUID masking
    ├── video_sample_bind.c           # Bind end: three-thread model and multi-device management
    ├── video_sample_listen.c         # Listen end: two-thread four-state state machine
    └── video_frame_producer.c        # Ring buffer and producer thread
```

### Implementation Details

- Send dispatch is encapsulated in `VsSendFrame()` in [video_sample.c](src/video_sample.c). According to `SocketInfo.dataType`, it calls `SendMessage()`, `SendBytes()`, or `SendStream()`. For `SendStream()`, `StreamFrameInfo` carries the frame sequence number, timestamp, and a simulated I/P frame flag (one I frame every 30 frames).
- The Bind end is implemented in [video_sample_bind.c](src/video_sample_bind.c) with a three-thread model. The main thread handles the menu. The Producer thread generates simulated frames at 4 fps and writes them into a 32-slot ring buffer. The Consumer thread takes frames at 2 fps and sends them to every connected device. Each cast target is described by a `NetworkContext` containing the networkId, socket, data type, and send statistics.
- The Listen end is implemented in [video_sample_listen.c](src/video_sample_listen.c) with a two-thread four-state state machine:

```text
START --Socket/Listen ok--> LISTENING --OnBind--> CONNECTED --Shutdown/OnShutdown--> FINISHED
```

- The negotiation and shutdown callbacks are in [video_sample.c](src/video_sample.c). The `OnNegotiate` callback lets the user accept or reject a cast request, while the `OnShutdown` callback clears the connection context and notifies the state machine to exit.
- Device enumeration and anonymization are in [video_sample_common.c](src/video_sample_common.c). `GetAllNodeDeviceInfo()` obtains the online devices, and `GetNodeKeyInfo()` obtains the device UUID, which is masked as `DEV#xxxx**xxxx` before being displayed.
- Simulated frame generation is in [video_frame_producer.c](src/video_frame_producer.c). A frame is a 64-byte text string in the format `frame#<seq>:<local masked UUID>`. No real video capture or encoding is involved.

SoftBus interface semantics:

- `Listen()` only registers the local listener and callbacks and returns immediately without blocking.
- `Bind()` is synchronous and blocking. It returns after the underlying channel is established or times out (about 30 seconds). It succeeds only after the peer has called `Listen()` and accepts the request.
- `dataType` is set in `Socket()` and determines the underlying channel and the available send API:

| dataType | Send API | Underlying channel | Reliability |
|----------|----------|--------------------|-------------|
| `DATA_TYPE_MESSAGE` | `SendMessage()` | TCP / Proxy | Forced ACK; suitable for low-latency small packets |
| `DATA_TYPE_BYTES` | `SendBytes()` | TCP / Proxy | Reliable byte stream; the ACK policy is determined by channel negotiation |
| `DATA_TYPE_RAW_STREAM` | `SendStream()` | UDP | No ACK; packet loss recovery is the application's responsibility; suitable for continuous audio/video frames |

Common causes of connection failures: the peer has not called `Listen()`, the peer rejects the request during negotiation, the devices are not networked, permission verification fails, or `Bind()` times out. The most common cause is a missing permission rule for the sample's sessionName in the SoftBus transmission permission configuration file.

### Permissions

This sample is a native executable and does not request application permissions. SoftBus verifies transmission permissions by matching `SESSION_NAME` against regular expressions in the transmission permission configuration file [softbus_trans_permission.json](https://gitcode.com/openharmony/communication_dsoftbus/blob/master/core/common/security/permission/softbus_trans_permission.json).

The package name and session name used by this sample are:

- `pkgName`: `com.sample.tool` (`VS_PKG_NAME`).
- `sessionName`: `com.sample.video_stream_sample` (`VS_SESSION_NAME`).

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

1. Copy this directory to `foundation/communication/dsoftbus/tests/video_stream_sample`.
2. Register the build target in `foundation/communication/dsoftbus/tests/BUILD.gn`:

```gn
group("video_stream_sample") {
  testonly = true
  deps = [
    "video_stream_sample:video_stream_sample",
  ]
}
```

3. Append the transmission permission rule of this sample to the JSON array in `softbus_trans_permission.json` (see the rule in the "Permissions" section above).
4. Build from the OpenHarmony source root:

```sh
./build.sh --product-name <product_name> --build-target video_stream_sample --ccache
```

5. Deploy the built executable to the target devices and run it on two networked devices.

On a real device, you can also replace `/etc/softbus_trans_permission.json` with the modified file. If the system partition has insufficient space, place the new file elsewhere and run `mount --bind <new_file_path> /etc/softbus_trans_permission.json`, then kill the SoftBus process, such as `softbus_server`, so that the configuration is reloaded.

### Constraints and Limitations

1. This sample supports the standard system and small systems (liteos_a), but does not support mini systems (liteos_m).
2. This is a command-line native C sample rather than an ArkTS application. It does not contain an ohosTest UI automation module; the archived manual test cases are in [ohosTest.md](ohosTest.md).
3. Two devices connected to the same distributed network and online with each other are required. The Bind end can connect to at most eight Listen ends at the same time.
4. Video frames in this sample are simulated text frames. The I/P flags only demonstrate how to fill `StreamFrameInfo`; no real video capture or encoding is involved.
5. This sample does not support file transfer, and `OnFile` is an empty implementation.

### Download

To download only this project, run:

```text
git init
git config core.sparsecheckout true
echo code/SystemFeature/DistributedAppDev/DistributedDataTrans/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
