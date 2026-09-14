# TrafficFilter_Packet_case（包过滤）

### 介绍

本示例依照指南 系统->网络->Network Kit（网络服务）->[包过滤](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/network/net-trafficfilter-packet.md)进行编写。包过滤提供基于网络报文的过滤与复制能力，支持创建包过滤器、配置过滤规则、注册报文回调等功能。本项目展示了一个包过滤的示例应用，它实现了创建/销毁包过滤器、添加/清空过滤规则、注册/取消报文回调的功能，使用了网络子系统的 TrafficFilter NAPI 接口。

### 效果预览

本示例为 Tab 页形式，包含以下功能页：

- 创建页：配置并创建包过滤器，同时提供销毁已有过滤器的入口，展示存活过滤器列表。
- 规则页：为指定过滤器添加或清空包过滤规则。
- 回调页：注册/取消报文回调，展示收到的报文信息。

调用日志通过 `PacketFilterApi` 记录并保存到 AppStorage；工程内已定义 `LogPage.ets`，可作为日志展示页扩展使用。

使用说明

1. 进入“创建”页，输入 group_id、priority、packetCopyLen、nfqueueMaxlen 等参数，点击“调用 createController”按钮创建包过滤器。
2. 在同一页的“销毁”区域选择或输入已有 controller id，点击“调用 destroyController”销毁包过滤器。
3. 在“规则”页选择已创建的过滤器，配置源/目的 IP、端口、协议、hookPoint 等规则字段，点击“addRule”添加规则，或点击“clearRule”清空规则。
4. 在“回调”页选择过滤器并输入 user_data，点击“注册回调”接收匹配的报文，点击“取消回调”停止接收。

### 工程目录

```
entry/src/main/ets/
|---api
|   |---PacketFilterApi.ets            // 封装 TrafficFilter NAPI 调用
|---components
|   |---InterfaceMatchEditor.ets       // 接口匹配编辑器
|   |---IpMatchEditor.ets              // IP 匹配编辑器
|   |---PortMatchEditor.ets            // 端口匹配编辑器
|---entryability
|   │---EntryAbility.ets
|---model
|   │---RuleFormModel.ets              // 规则表单数据模型
|---pages
│   |---CreatePacketControllerPage.ets // 创建包过滤器页
│   |---DestroyPacketControllerPage.ets// 销毁包过滤器组件
│   |---IndexPage.ets                  // 主页（Tab 容器）
│   |---LogPage.ets                    // 调用日志页
│   |---PacketCallbackPage.ets         // 报文回调页
│   |---RulesPage.ets                  // 规则管理页
|---types
│   |---packetFilter.ets               // 类型定义与构造工具
```

### 具体实现

1. 包过滤器管理：

- 使用 `libentry.so` 提供的 `createPacketController` 创建包过滤器，并维护本地 controller 映射。
- 使用 `destroyPacketController` 销毁指定 id 的包过滤器，释放系统资源。

2. 过滤规则配置：

- 通过 `addPacketRule` 向指定过滤器添加过滤规则，规则包括 priority、hookPoint、protocol、源/目的 IP、源/目的端口、入/出接口、uid 范围、MAC 匹配、TCP 标志匹配、连接跟踪匹配等字段。
- 通过 `clearPacketRule` 清空指定过滤器的全部规则。

3. 报文回调：

- 使用 `registerPacketCallback` 注册报文回调，当匹配规则的报文经过时，回调会收到 packetId、protocol、源/目的 IP 与端口、packetLen、user_data 等信息。
- 使用 `unregisterPacketCallback` 取消已注册的回调。

4. 日志记录：

- `PacketFilterApi` 会记录每次调用的接口名、参数、返回值及错误码，并通过 AppStorage 在 `LogPage` 中展示。

### 相关权限

[ohos.permission.INTERNET](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/security/AccessToken/permissions-for-all.md#ohospermissioninternet)

[ohos.permission.GET_NETWORK_INFO](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/security/AccessToken/permissions-for-all.md#ohospermissionget_network_info)

[ohos.permission.kernel.TRAFFIC_FILTER](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/security/AccessToken/permissions-for-all.md#ohospermissionkerneltraffic_filter)

### 依赖

不涉及。

### 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：RK3568。
2. 本示例为 Stage 模型，支持 API14 版本 SDK，版本号：5.0.2。
3. 本示例需要使用 DevEco Studio Release（5.0.5.306）及以上版本才可编译运行。
4. 本示例需要设备具备网络环境，并需要系统授予 `ohos.permission.kernel.TRAFFIC_FILTER` 权限。
5. 包过滤功能涉及内核网络子系统，实际拦截效果受系统策略与网络环境影响。

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/NetWork_Kit/NetWorkKit_NetManager/TrafficFilter_Packet_case/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
