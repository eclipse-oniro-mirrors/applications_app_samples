# 测试用例归档

## 用例表

| 测试功能                 | 预置条件     | 输入                  | 预期输出                          | 是否自动 | 测试结果 |
| ------------------------ | ------------ | --------------------- | --------------------------------- | -------- | -------- |
| StartVPN按钮点击事件     | 设备正常运行 |                       | 进入StartVPN界面                  | 是       | pass     |
| CreateTunnel按钮点击事件 | 设备正常运行 | vpnServerIp           | 弹出Toast：“CreateTunnel Success” | 是       | pass     |
| Protect按钮点击事件      | 设备正常运行 | vpnServerIp           | 弹出Toast：“vpn Protect Success”  | 是       | pass     |
| SetupVpn 按钮点击事件    | 设备正常运行 | tunIp、blockedAppName | 弹出Toast：“vpn Protect Success”  | 是       | pass     |
| StartVpnExt 按钮点击事件 | 设备正常运行 | tunIp、blockedAppName | 弹出对话框                        | 是       | pass     |
| StopVpn按钮点击事件      | 设备正常运行 |                       | 进入StopVpn界面                   | 是       | pass     |
| StopVpn按钮点击事件      | 设备正常运行 |                       | 弹出Tosat：”Stop Success“         | 是       | pass     |
| StopVPN按钮点击事件      | 设备正常运行 |                       | 弹出Tosat：”Stop Success“         | 是       | pass     |

## 逻辑用例（数据驱动）

以下 2562 条逻辑与调用序列用例位于 `entry/src/ohosTest/ets/test/logic` 与 `entry/src/ohosTest/ets/test/core`，
每条用例记录 begin/end 日志，断言前打印入参与实际值；期望值由被测逻辑在对应输入下的确定性结果给出，覆盖典型值、边界值与非法值。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| -------- | -------- | ---- | -------- | -------- | -------- |
| ComponentIdTest | 无 | 13 组输入（VPN_ComponentId_0001~0013） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| IPv4ValidTest | 无 | 43 组输入（VPN_IPv4Valid_0001~0043） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| PrefixValidTest | 无 | 38 组输入（VPN_PrefixValid_0001~0038） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| MtuPortValidTest | 无 | 16 组输入（VPN_MtuPort_0001~0016） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| FamilyNetworkTest | 无 | 44 组输入（VPN_FamilyNetwork_0001~0044） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ConfigSummaryTest | 无 | 12 组输入（VPN_ConfigSummary_0001~0012） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| RouteSummaryTest | 无 | 12 组输入（VPN_RouteSummary_0001~0012） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ConfigCountsTest | 无 | 12 组输入（VPN_ConfigCounts_0001~0012） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| TunnelPortTest | 无 | 4 组输入（VPN_TunnelPort_0001~0004） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| TunnelCreatedTest | 无 | 44 组输入（VPN_TunnelCreated_0001~0044） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ProtectResultTest | 无 | 2 组输入（VPN_ProtectResult_0001~0002） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| FlowToastsTest | 无 | 2 组输入（VPN_FlowToasts_0001~0002） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| PageRouteTest | 无 | 6 组输入（VPN_PageRoute_0001~0006） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| NotificationIdsTest | 无 | 44 组输入（VPN_NotifIds_0001~0044） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| NotificationTextTest | 无 | 6 组输入（VPN_NotifText_0001~0006） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| WantAgentTest | 无 | 3 组输入（VPN_WantAgent_0001~0003） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| VpnIdDestroyTest | 无 | 12 组输入（VPN_VpnIdDestroy_0001~0012） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| BadgeTest | 无 | 44 组输入（VPN_Badge_0001~0044） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| NotificationCountsTest | 无 | 44 组输入（VPN_NotifCounts_0001~0044） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| LayoutConstantsTest | 无 | 44 组输入（VPN_Layout_0001~0044） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| BoundaryNumbersTest | 无 | 46 组输入（VPN_Boundary_0001~0046） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| VpnFlowStartTest | 无 | 44 组输入（VPN_FlowStart_0001~0044） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| VpnFlowStopTest | 无 | 4 组输入（VPN_FlowStop_0001~0004） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| VpnFlowSequenceTest | 无 | 4 组输入（VPN_FlowSeq_0001~0004） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| VpnExtensionFlowTest | 无 | 44 组输入（VPN_ExtFlow_0001~0044） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| NotificationPublishFlowTest | 无 | 42 组输入（VPN_NotifFlow_0001~0042） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| PageRouteFlowTest | 无 | 6 组输入（VPN_RouteFlow_0001~0006） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| VpnTestFlowTest | 无 | 6 组输入（VPN_TestFlow_0001~0006） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| VpnConfigMatrixTest | 无 | 12 组输入（VPN_ConfigMatrix_0001~0012） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| VpnFlowMatrixTest | 无 | 450 组输入（VPN_FlowMatrix_0001~0450） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| NotificationMatrixTest | 无 | 35 组输入（VPN_NotifMatrix_0001~0035） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| VPNConfigBoundaryMatrixTest | 无 | 450 组输入（VPN_ConfigBoundary_0001~0450） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| VPNNotificationBoundaryMatrixTest | 无 | 450 组输入（VPN_NotifBoundary_0001~0450） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| VPNFlowBoundaryMatrixTest | 无 | 450 组输入（VPN_FlowBoundary_0001~0450） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| VPNConstantsCoreTest | 无 | 26 组输入（VPN_Constants_0001~0026） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| VPNNotificationCoreTest | 无 | 44 组输入（VPN_NotifCore_0001~0044） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| VPNFlowContractCoreTest | 无 | 4 组输入（VPN_FlowCore_0001~0004） | 返回值与状态逐条符合预期 | 是 | 待执行 |
