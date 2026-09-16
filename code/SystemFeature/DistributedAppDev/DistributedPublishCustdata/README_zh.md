# 分布式设备发现自定义数据

### 介绍

本示例基于 OpenHarmony 分布式软总线（DSoftBus）的设备发现接口和传输接口，使用 C 语言实现，在命令行终端中演示 COAP 发现扩展能力 **custData**（`DSOFTBUS_FEATURE_DISC_COAP_CUSTDATA`）的完整使用流程：发布端把自定义标识放入 `capabilityData`，发现端按 `custData` 过滤设备并维护通信白名单，再通过软总线传输接口与白名单内设备收发数据。

主要使用的接口如下：

- 发现接口 [softbus_bus_center.h](https://gitcode.com/openharmony/communication_dsoftbus/blob/master/interfaces/kits/bus_center/softbus_bus_center.h)：`PublishLNN()`，`StopPublishLNN()`，`RefreshLNN()`，`StopRefreshLNN()`。
- 组网接口 [softbus_bus_center.h](https://gitcode.com/openharmony/communication_dsoftbus/blob/master/interfaces/kits/bus_center/softbus_bus_center.h)：`GetLocalNodeDeviceInfo()`，`GetAllNodeDeviceInfo()`，`GetNodeKeyInfo()`，`FreeNodeInfo()`。
- 传输接口 [socket.h](https://gitcode.com/openharmony/communication_dsoftbus/blob/master/interfaces/kits/transport/socket.h)：`Socket()`，`Listen()`，`Bind()`，`SendBytes()`，`Shutdown()`。

实现的功能：

1. 选择发布端（等待被发现）或发现端（发现附近设备）角色。
2. 发布端调用 `PublishLNN()` 携带自定义标识（payload），发现端上报设备时在 `OnDeviceFound` 回调中按 `custData` 精确匹配，只有匹配的设备进入发现列表。
3. 发现列表即通信白名单，只有列表内设备才会被 `Bind()` 并收到数据，最多维护 8 台设备。
4. 发现端按发现报文 IP 与在线节点 IP 匹配，把 `devId` 解析为 `networkId`，再主动 `Bind()` 并通过 `SendBytes()` 发送消息。
5. 设备名通过 UDID 掩码显示（如 `DEV#ab**cd`），不暴露完整设备标识。
6. 支持动态修改发布标识和期望标识，修改期望标识后自动清空旧发现列表；停止发布或发现时关闭全部已建立的连接。

### 效果预览

本示例为命令行程序，无图形界面。以下为两台设备上的终端输出（设备名以掩码后的 UDID 表示，具体值以实际设备为准）。

发布端发布设备并等待连接：

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

发现端发现设备，建立连接并发送消息：

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

查看发现端当前状态：

```text
==>请选择:5
>>>寻找状态: active=YES, 要找的特征=[dsoftbus_custdata_sample_0123456789abcdef]
  [0] 设备=DEV#1a2b**3c4d IP=192.168.1.10 状态=已连接 已发消息=1 成功=1
```

使用说明

1. 两台设备已完成分布式组网并相互在线，将编译生成的可执行文件分别部署到两台设备，并确保两端软总线均开启 `DSOFTBUS_FEATURE_DISC_COAP_CUSTDATA` 特性。
2. 在一台设备上运行程序，输入 `0` 选择"发布端（等待被发现）"，再输入 `0` 发布设备，发布成功后自动进入监听，等待发现端连接。
3. 在另一台设备上运行程序，输入 `1` 选择"发现端（发现附近设备）"，再输入 `0` 开始寻找设备。发现端只保留 `custData` 与期望标识一致的设备。
4. 输入 `3` 连接所有找到的设备，连接成功后输入 `4` 向已连接设备发送消息，发布端会打印收到的消息内容。
5. 两端均可通过菜单输入 `2` 修改标识信息或期望特征，输入 `3` 或 `5` 查看当前状态，输入 `1` 停止发布或停止寻找。

### 工程目录

```text
DistributedPublishCustdata/
├── BUILD.gn                          # 构建配置，目标名 disc_coap_custdata_sample
├── main.c                            # 程序入口，角色选择菜单
├── include/
│   ├── custdata_sample_common.h      # 公共常量，输入/日志与设备工具函数声明
│   ├── custdata_sample_publish.h     # 发布端入口声明
│   ├── custdata_sample_refresh.h     # 发现端入口声明
│   └── custdata_sample_trans.h       # networkId 解析与 Socket 封装声明
└── src/
    ├── custdata_sample_common.c      # 日志，输入，UDID 掩码与设备名构建
    ├── custdata_sample_publish.c     # 发布端：PublishLNN 与独立 Listen 线程
    ├── custdata_sample_refresh.c     # 发现端：custData 白名单，连接与发送
    └── custdata_sample_trans.c       # devId 到 networkId 解析与 Socket 封装
```

### 具体实现

- 发布端逻辑在 [custdata_sample_publish.c](src/custdata_sample_publish.c)，采用双线程模型。主线程负责菜单交互并调用 `PublishLNN()` 或 `StopPublishLNN()`；发布成功后启动独立 Listen 线程，执行 `Socket(NULL)` 与 `Listen()` 等待发现端连接，在 `OnBind` 中记录对端，在 `OnBytes` 中打印收到的数据。停止发布时先结束 Listen 线程，由该线程统一 `Shutdown()` 监听 socket 和已建立的连接 socket，使对端收到 `OnShutdown` 并清理设备信息。
- 发现端逻辑在 [custdata_sample_refresh.c](src/custdata_sample_refresh.c)。`OnDeviceFound` 回调中比较 `device->custData` 与期望标识：匹配则加入发现设备表，不匹配则从表中移除。发现设备表就是通信白名单，`BindAllDiscovered()` 只连接表内设备，`SendToAllBound()` 只向表内已连接设备发送。修改期望标识后旧设备必然不再匹配，因此直接清空整张发现表。
- 自定义标识通过 `PublishInfo.capabilityData` 携带，经 COAP `bData` 通道随发现响应下发，发现端在 `DeviceInfo.custData` 中读取。发现端不把期望值放入 `SubscribeInfo.capabilityData`，过滤完全由应用在 `OnDeviceFound` 回调中完成。标识长度不能超过 284 字节（`CD_BDATA_MAX_LEN`，COAP `bData` 通道限制），超出后 `PublishLNN()` 会失败。
- devId 到 networkId 的解析在 [custdata_sample_trans.c](src/custdata_sample_trans.c) 的 `CdResolveNetworkId()` 中。发现上报的 `DeviceInfo.devId` 是对端 UDID 的哈希，不能直接用于传输，因此用发现报文携带的 IP 与 `GetAllNodeDeviceInfo()` 返回的各在线节点 IP（`NODE_KEY_IP_ADDRESS`）比对，匹配后得到对端 `networkId`。前提是对端已在组网在线节点表中，否则返回 `SOFTBUS_NOT_FIND`。
- 传输封装在 [custdata_sample_trans.c](src/custdata_sample_trans.c)：`CdSocketCreate()`，`CdSocketListen()`，`CdSocketBind()`，`CdSocketSendBytes()` 是对 `Socket()`，`Listen()`，`Bind()`，`SendBytes()` 的薄封装，QoS 为最大时延 50ms，`dataType` 固定为 `DATA_TYPE_BYTES`。
- 并发处理：发现设备表由互斥锁保护。`Shutdown()`，IP 解析等 IPC 调用，`Bind()` 和 `SendBytes()` 等可能阻塞或回调重入的操作，都采用先在锁内拷贝数据再解锁执行的方式，关闭连接时先收集 socket 列表再统一 `Shutdown()`，避免与软总线回调线程互等死锁。
- 设备名匿名化在 [custdata_sample_common.c](src/custdata_sample_common.c)：通过 `GetNodeKeyInfo(NODE_KEY_UDID)` 获取设备 UDID，掩码为 `DEV#xxxx**xxxx` 后显示。

连接建立时序如下：

```text
发布端 PublishLNN(payload) -> Socket()+Listen() 等待连接
发现端 RefreshLNN() -> OnDeviceFound(custData 匹配) -> 加入白名单
发现端 按 IP 匹配解析 networkId -> Socket(peerNetworkId)+Bind()
建链后 发现端 SendBytes() -> 发布端 OnBytes 接收
任一端 Shutdown() -> 对端 OnShutdown -> 发现端从白名单移除设备
```

连接失败常见原因：两端 `capability` 不一致，至少一端未开启 `DSOFTBUS_FEATURE_DISC_COAP_CUSTDATA` 导致 `custData` 为空，对端未组网在线导致 `networkId` 解析失败，对端未调用 `Listen()`，或传输权限校验失败。

### 相关权限

本示例为 native 可执行程序，不涉及应用权限申请。软总线通过传输权限配置文件 [softbus_trans_permission.json](https://gitcode.com/openharmony/communication_dsoftbus/blob/master/core/common/security/permission/softbus_trans_permission.json) 中的正则表达式匹配 `SESSION_NAME` 做传输权限校验。

本示例使用的包名和会话名为：

- `pkgName`：`com.sample.tool`（`CD_PKG_NAME`）。
- `sessionName`：`com.sample.custdata.trans`（`CD_SESSION_NAME`）。

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

1. 在 `foundation/communication/dsoftbus/tests/` 下新建 `custdata_sample` 目录，将本目录（`DistributedPublishCustdata`）内的全部文件（`BUILD.gn`，`main.c`，`include/`，`src/`，不含目录本身）拷入，使构建文件位于 `tests/custdata_sample/BUILD.gn`。
2. 在 `foundation/communication/dsoftbus/tests/BUILD.gn` 中注册构建目标：

```gn
group("custdata_sample") {
  testonly = true
  deps = [
    "custdata_sample:disc_coap_custdata_sample",
  ]
}
```

3. 在 `softbus_trans_permission.json` 的 JSON 数组中追加本示例的传输权限规则（规则内容见上文"相关权限"章节）。
4. 在 `foundation/communication/dsoftbus/dsoftbus.gni` 中开启 `DSOFTBUS_FEATURE_DISC_COAP_CUSTDATA` 特性宏，发布端与发现端都必须带该宏编译，否则对端上报的 `custData` 为空。
5. 在 OpenHarmony 源码根目录执行编译：

```sh
./build.sh --product-name <产品名> --build-target custdata_sample --ccache
```

编译产物路径示例（小型系统）：`out/hispark_taurus/ipcamera_hispark_taurus_linux/bin/disc_coap_custdata_sample`，实际目录取决于编译产品名。

6. 将编译出的可执行文件部署到目标设备，并在两台已组网设备上分别运行。

真机部署时也可以直接用修改后的 `softbus_trans_permission.json` 替换设备上的 `/etc/softbus_trans_permission.json`。若系统分区空间不足，可将新文件放到有剩余空间的目录后通过 `mount --bind <新文件路径> /etc/softbus_trans_permission.json` 挂载覆盖，随后 kill 软总线进程（如 `softbus_server`）使其重新加载配置。

### 约束与限制

1. 本示例支持标准系统和小型系统（liteos_a），不支持轻量系统（liteos_m）。
2. 本示例为命令行 native C 示例，不是 ArkTS 应用，不包含 ohosTest UI 自动化模块，测试用例归档见 [ohosTest.md](ohosTest.md)。
3. 运行本示例需要两台已完成分布式组网并相互在线的设备，发现列表最多维护 8 台设备。
4. 自定义标识长度不能超过 284 字节（COAP `bData` 通道限制），超出后发布失败。
5. `DeviceInfo.devId` 是对端 UDID 的哈希，对端必须是组网在线节点才能按 IP 匹配解析出 `networkId`，否则无法建立连接。
6. 发布端与发现端必须使用相同的 `capability`（本示例为 `ddmpCapability`），且两端软总线均开启 `DSOFTBUS_FEATURE_DISC_COAP_CUSTDATA` 特性。

### 下载

如需单独下载本工程，执行如下命令：

```text
git init
git config core.sparsecheckout true
echo code/SystemFeature/DistributedAppDev/DistributedPublishCustdata/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
