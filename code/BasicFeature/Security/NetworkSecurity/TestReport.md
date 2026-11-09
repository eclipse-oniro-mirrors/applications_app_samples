# 网络安全校验与网络策略测试报告

## 测试环境

| 项目 | 信息 |
| --- | --- |
| 设备型号 | 待补充 |
| 系统版本 | 待补充 |
| IDE 版本 | 待补充 |
| API 版本 | 待补充 |
| SDK 版本 | 26.0.0（compileSdkVersion） |
| 应用包名 | com.samples.networksecurity |
| 测试类型 | ohosTest UI 自动化，手工验证 |

> 前置条件：工程需替换 Full SDK 后才能编译，安装包需使用 system_basic 级别签名（ohos.permission.MANAGE_NET_STRATEGY）。非系统签名设备上，除 getNetAccessPolicy() 与 showAppNetPolicySettings() 外的策略接口会返回 202 或 201，相关用例按降级提示判定。

## UI 自动化用例

用例文件：`entry/src/ohosTest/ets/test/NetworkSecurity.test.ets`，已在 `entry/src/ohosTest/ets/test/List.test.ets` 中注册。手机端使用底部页签，平板端使用左侧导航，用例会按设备实际存在的入口切换页面。

| 序号 | 用例名称 | 测试场景 | 操作步骤 | 预期结果 | 实际结果 |
| --- | --- | --- | --- | --- | --- |
| 1 | NetworkSecurity_LaunchPage_001 | 应用启动 | 启动应用，等待首页加载完成 | 首页容器 `id_main_page` 与标题 `id_main_title` 存在，标题文本非空 | 待执行 |
| 2 | NetworkSecurity_TabSwitch_002 | 页签切换 | 依次点击“网络策略”和“安全校验”入口 | 网络策略页 `id_policy_page` 与安全校验页 `id_security_page` 均可正常展示 | 待执行 |
| 3 | NetworkSecurity_CertVerify_003 | 证书校验 | 在安全校验页点击“同步校验”按钮 | 证书卡片 `id_security_cert_card` 与日志面板 `id_security_log_panel` 存在，校验流程产生日志 | 待执行 |
| 4 | NetworkSecurity_CleartextQuery_004 | 明文策略查询 | 滚动到全局明文策略的“查询”按钮并点击 | 查询结果行 `id_security_cleartext_value` 存在，结果以设备实际生效的网络安全配置为准 | 待执行 |
| 5 | NetworkSecurity_PolicyAccessQuery_005 | 应用网络访问策略读取 | 进入网络策略页，点击应用网络访问策略卡片的“刷新” | Wi-Fi 行 `id_policy_access_wifi_value` 存在，页面不崩溃；接口不可用时显示读取失败提示 | 待执行 |

## 手工验证建议

| 序号 | 验证项 | 操作步骤 | 预期结果 | 实际结果 |
| --- | --- | --- | --- | --- |
| 1 | 自签名证书校验 | 选择自签名证书，分别点击“同步校验”与“异步校验” | 返回非 0 错误码，结果说明提示校验失败，日志记录 CertSync 或 CertAsync 失败信息 | 待执行 |
| 2 | 过期证书校验 | 选择过期证书，点击“同步校验”或“链校验” | 返回非 0 错误码，错误码解读卡片显示证书有效期相关说明 | 待执行 |
| 3 | 禁止域名 HTTP 探测 | 在 HTTP 探测卡片点击“探测禁止域名” | 返回 2300997，结果说明为明文流量被网络安全策略拦截，日志记录 HttpProbe 失败 | 待执行 |
| 4 | 允许域名 HTTP 探测 | 在 HTTP 探测卡片点击“探测允许域名” | 有网络时返回 HTTP 状态码与耗时；无网络时返回连接类错误码，属于预期结果 | 待执行 |
| 5 | 非系统签名设备策略接口 | 在非系统签名的设备上进入网络策略页，依次点击“刷新”、后台策略“查询”、UID 策略“查询”、配额“查询” | 返回 202 或 201，状态显示“当前设备不具备系统权限，操作已跳过”，日志记录受限原因，页面不崩溃 | 待执行 |
| 6 | 系统网络访问设置跳转 | 在网络策略页点击“打开系统设置” | 跳转系统网络访问设置页；不支持时记录错误码日志，页面不崩溃 | 待执行 |
| 7 | 策略事件监听 | 在系统签名设备上点击“开始监听”，切换页面后返回 | 事件按钮切换为“停止监听”，页面销毁后监听被注销，无残留订阅 | 待执行 |

## 测试结论

待执行后填写。
