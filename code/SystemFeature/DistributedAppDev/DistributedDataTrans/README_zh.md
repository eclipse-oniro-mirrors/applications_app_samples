# 分布式数据传输

### 介绍

本示例基于 OpenHarmony 分布式软总线（DSoftBus）传输接口，使用 C 语言实现，在命令行终端中模拟"一端投屏，多端显示"的视频流传输场景，演示软总线传输模块对外接口的完整使用流程。

主要使用的接口如下：

- 传输接口 [socket.h](https://gitcode.com/openharmony/communication_dsoftbus/blob/master/interfaces/kits/transport/socket.h)：`Socket()`，`Listen()`，`Bind()`，`SendMessage()`，`SendBytes()`，`SendStream()`，`Shutdown()`。
- 组网接口 [softbus_bus_center.h](https://gitcode.com/openharmony/communication_dsoftbus/blob/master/interfaces/kits/bus_center/softbus_bus_center.h)：`GetLocalNodeDeviceInfo()`，`GetAllNodeDeviceInfo()`，`GetNodeKeyInfo()`，`FreeNodeInfo()`。

实现的功能：

1. 选择 Bind 端（发送端）或 Listen 端（接收端）角色。
2. 枚举组网在线设备，设备名通过 UUID 掩码显示（如 `DEV#ab**cd`），不暴露完整设备标识。
3. Bind 端可同时投屏到最多 8 台设备，支持消息（MESSAGE），字节流（BYTES），视频流（RAW_STREAM）三种数据类型。
4. Listen 端可在协商回调中接受或拒绝投屏请求，连接建立后也可主动向 Bind 端发送数据。
5. 发送端以固定帧率生成模拟帧（生成 4fps，发送 2fps）并统计每台设备的发送结果。

### 效果预览

本示例为命令行程序，无图形界面。以下为两台设备上的实际终端输出（设备名以掩码后的 UUID 表示，具体值以实际设备为准）。

查看在线设备：

```text
--- 设备列表 ---
本机: DEV#1a2b**3c4d
对端设备:
  [0] DEV#5e6f**7a8b
```

Bind 端（发送端）发起投屏并持续发送：

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

Listen 端（接收端）接受请求并接收数据：

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

使用说明

1. 两台设备已完成分布式组网并相互在线，将编译生成的可执行文件分别部署到两台设备。
2. 在接收设备上运行程序，输入 `1` 选择"接收"，选择传输方式后进入监听，等待发送端发起投屏。
3. 在发送设备上运行程序，输入 `0` 选择"投屏"，根据提示选择在线设备编号和传输方式。`Bind()` 成功后自动开始按固定帧率发送模拟帧。
4. 接收端弹出投屏请求时输入 `1` 接受，或输入 `0` 拒绝。连接建立后，接收端可通过菜单主动发送数据或查看连接状态。
5. 发送端菜单输入 `2` 可查看每台设备的类型，已发帧数和成功帧数，输入 `1` 可断开指定投屏，输入 `4` 退出投屏。

### 工程目录

```text
DistributedDataTrans/
├── BUILD.gn                          # 构建配置，目标名 video_stream_sample
├── main.c                            # 程序入口，角色选择菜单
├── include/
│   ├── video_sample_common.h         # 公共常量，类型与工具函数声明
│   ├── video_sample_internal.h       # 内部共享接口，状态机与回调构建，发送接口
│   ├── video_sample_bind.h           # Bind 端入口声明
│   ├── video_sample_listen.h         # Listen 端入口声明
│   └── video_frame_producer.h        # 帧生产者接口声明
└── src/
    ├── video_sample.c                # 收发回调，Listen 端状态机，发送分发
    ├── video_sample_common.c         # 日志，输入，设备枚举与 UUID 掩码
    ├── video_sample_bind.c           # Bind 端：三线程模型与多设备管理
    ├── video_sample_listen.c         # Listen 端：双线程四态状态机
    └── video_frame_producer.c        # ring buffer 与生产者线程
```

### 具体实现

- 发送分发封装在 [video_sample.c](src/video_sample.c) 的 `VsSendFrame()` 中：根据 `SocketInfo.dataType` 分别调用 `SendMessage()`，`SendBytes()`，`SendStream()`；使用 `SendStream()` 时通过 `StreamFrameInfo` 携带帧序号，时间戳和模拟的 I/P 帧标记（每 30 帧一个 I 帧）。
- Bind 端逻辑在 [video_sample_bind.c](src/video_sample_bind.c)，采用三线程模型。主线程负责菜单交互，Producer 线程按 4fps 生成模拟帧并写入 32 槽位的 ring buffer，Consumer 线程按 2fps 取帧并向所有已连接设备发送。每个投屏对象由一个 `NetworkContext` 记录 networkId，socket，数据类型和收发统计。
- Listen 端逻辑在 [video_sample_listen.c](src/video_sample_listen.c)，采用双线程四态状态机：

```text
START --Socket/Listen 成功--> LISTENING --OnBind--> CONNECTED --Shutdown/OnShutdown--> FINISHED
```

- 协商与断链回调在 [video_sample.c](src/video_sample.c)：`OnNegotiate` 回调中由用户决定接受或拒绝投屏请求，`OnShutdown` 回调中清理连接上下文并通知状态机退出。
- 设备枚举与匿名化在 [video_sample_common.c](src/video_sample_common.c)：通过 `GetAllNodeDeviceInfo()` 获取在线设备，通过 `GetNodeKeyInfo()` 获取设备 UUID 并掩码为 `DEV#xxxx**xxxx` 后显示。
- 模拟帧生成在 [video_frame_producer.c](src/video_frame_producer.c)，帧内容为 64 字节文本，格式为 `frame#<序号>:<本机掩码UUID>`，不涉及真实视频编码。

软总线接口语义说明：

- `Listen()` 仅注册本端监听和回调，调用后立即返回，不阻塞。
- `Bind()` 同步阻塞，等待底层通道建立完成，成功或超时（约 30s）后返回。必须由对端先调用 `Listen()` 且协商接受后才能成功。
- `dataType` 在 `Socket()` 时设定，决定底层通道和可用的发送接口，对应关系如下：

| dataType | 发送接口 | 底层通道 | 可靠性说明 |
|----------|----------|----------|------------|
| `DATA_TYPE_MESSAGE` | `SendMessage()` | TCP / Proxy | 强制 ACK 确认，适合低延迟小包 |
| `DATA_TYPE_BYTES` | `SendBytes()` | TCP / Proxy | 可靠字节流，ACK 策略由通道协商决定 |
| `DATA_TYPE_RAW_STREAM` | `SendStream()` | UDP | 无 ACK，丢包恢复由应用负责，适合持续音视频帧 |

连接失败常见原因：对端未调用 `Listen()`，对端协商时拒绝，设备未组网或权限校验失败，`Bind()` 超时。其中最常见的原因是软总线传输权限配置文件中没有本示例 sessionName 对应的权限规则。

### 相关权限

本示例为 native 可执行程序，不涉及应用权限申请。软总线通过传输权限配置文件 [softbus_trans_permission.json](https://gitcode.com/openharmony/communication_dsoftbus/blob/master/core/common/security/permission/softbus_trans_permission.json) 中的正则表达式匹配 `SESSION_NAME` 做传输权限校验。

本示例使用的包名和会话名为：

- `pkgName`：`com.sample.tool`（`VS_PKG_NAME`）。
- `sessionName`：`com.sample.video_stream_sample`（`VS_SESSION_NAME`）。

当前配置文件中**没有**本示例对应的权限规则，运行前需要手动在该文件的 JSON 数组中追加如下元素，否则 `Bind()` 会因权限校验失败而失败：

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

修改后需要重新编译软总线，或在真机上替换配置文件（见下文"依赖"章节）后重启软总线进程，权限才会生效。若修改了本示例的包名或会话名，需要相应调整规则中的 `SESSION_NAME` 与 `PKG_NAME`。

### 依赖

本示例依赖 OpenHarmony 软总线源码树（`//foundation/communication/dsoftbus`），需要放入软总线源码中编译，无额外 sample 依赖。接入步骤如下。

1. 将本目录整体拷贝到 `foundation/communication/dsoftbus/tests/video_stream_sample`。
2. 在 `foundation/communication/dsoftbus/tests/BUILD.gn` 中注册构建目标：

```gn
group("video_stream_sample") {
  testonly = true
  deps = [
    "video_stream_sample:video_stream_sample",
  ]
}
```

3. 在 `softbus_trans_permission.json` 的 JSON 数组中追加本示例的传输权限规则（规则内容见上文"相关权限"章节）。
4. 在 OpenHarmony 源码根目录执行编译：

```sh
./build.sh --product-name <产品名> --build-target video_stream_sample --ccache
```

5. 将编译出的可执行文件部署到目标设备，并在两台已组网设备上分别运行。

真机部署时也可以直接用修改后的 `softbus_trans_permission.json` 替换设备上的 `/etc/softbus_trans_permission.json`。若系统分区空间不足，可将新文件放到有剩余空间的目录后通过 `mount --bind <新文件路径> /etc/softbus_trans_permission.json` 挂载覆盖，随后 kill 软总线进程（如 `softbus_server`）使其重新加载配置。

### 约束与限制

1. 本示例支持标准系统和小型系统（liteos_a），不支持轻量系统（liteos_m）。
2. 本示例为命令行 native C 示例，不是 ArkTS 应用，不包含 ohosTest UI 自动化模块，测试用例归档见 [ohosTest.md](ohosTest.md)。
3. 运行本示例需要两台已完成分布式组网并相互在线的设备，Bind 端最多同时连接 8 台 Listen 端。
4. 示例中的视频帧为模拟文本帧，I/P 帧标记仅用于演示 `StreamFrameInfo` 字段填充，不涉及真实视频采集与编码。
5. 本示例不包含文件传输能力，`OnFile` 为空实现。

### 下载

如需单独下载本工程，执行如下命令：

```text
git init
git config core.sparsecheckout true
echo code/SystemFeature/DistributedAppDev/DistributedDataTrans/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
