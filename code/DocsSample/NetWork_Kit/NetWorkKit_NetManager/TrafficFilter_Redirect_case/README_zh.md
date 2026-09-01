# TrafficFilter_Redirect_case（流量重定向）

### 介绍

本示例依照指南 系统->网络->Network Kit（网络服务）->[流量重定向](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/network/net-trafficfilter-redirect.md)进行编写。流量重定向提供将匹配规则的网络流量重定向到指定代理服务器的能力，支持创建重定向器、添加重定向规则、加载规则模板、查询连接所属进程等功能。本项目展示了一个流量重定向的示例应用，使用了网络子系统的 TrafficFilter NAPI 接口。

### 效果预览

本示例包含以下页面：

- 主页：提供“Redirector Management”与“Query Process Demo”两个入口。
- 重定向管理页：支持基础模式与高级 JSON 模式，配置并添加重定向规则，管理重定向器生命周期。
- 查询进程页：输入连接五元组，查询该连接所属进程的 pid 与 uid。

使用说明

1. 在主页面点击“Redirector Management”进入重定向管理页。
2. 输入 Group ID、Priority、Packet Copy Len、NFQueue MaxLen、NFQueue Flags，点击“Create Redirector”创建重定向器。
3. 在 Basic Mode 下配置规则优先级、Hook Point、源/目的 IP/端口、接口、UID 范围、代理 IP 与端口，点击“Add Redirect Rule”添加规则。
4. 或在 Advanced JSON Mode 下加载 basic/full 模板，编辑 JSON 后点击“Add Redirect Rule (JSON)”添加规则。
5. 点击“Clear All Rules”可清空所有规则，点击“Destroy Redirector”销毁重定向器。
6. 返回主页点击“Query Process Demo”，输入源/目的 IP、端口、协议，点击“Query Process”查询连接所属进程。

### 工程目录

```
entry/src/main/ets/
|---entryability
|   │---FormAbility.ets
|   │---MainAbility.ets
|   │---TestClickActionAbility.ets
|---pages
│   |---MainPage.ets           // 主页
│   |---QueryProcessPage.ets   // 查询进程页
│   |---RedirectorPage.ets     // 重定向管理页
|---main/cpp/types/libentry
│   |---Index.d.ts             // NAPI 接口类型声明
```

### 具体实现

1. 重定向器生命周期管理：

- 使用 `libentry.so` 提供的 `createRedirector` 创建流量重定向器。
- 使用 `destroyRedirector` 销毁当前重定向器。

2. 重定向规则管理：

- 在 Basic Mode 下，页面收集用户输入并构造 JSON 规则，通过 `addRedirectRule` 提交。
- 在 Advanced JSON Mode 下，用户可直接编辑 JSON，调用 `addRedirectRule` 添加规则。
- 通过 `clearRedirectRule` 清空当前重定向器的所有规则。
- 通过 `getRuleTemplate` 加载 basic/full 规则模板。

3. 连接进程查询：

- 使用 `queryProcess` 传入连接五元组（源 IP、源端口、目的 IP、目的端口、协议），查询并返回进程的 pid 与 uid。

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
5. 流量重定向功能涉及内核网络子系统，实际重定向效果受系统策略与网络环境影响。
6. 查询进程功能需要系统中存在匹配的连接记录。

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/NetWork_Kit/NetWorkKit_NetManager/TrafficFilter_Redirect_case/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
