# UIExtensionAbility 测试用例归档

## 用例概览

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| UIExtensionAbility 页面拉起 | 已安装 ohosTest HAP | aa test 启动 TestAbility | 扩展页面在指定位置显示 | 是 | Pass |
| UIExtensionAbility 生命周期 | 扩展进程可用 | onCreate/onForeground/onBackground/onDestroy | 生命周期阶段按序执行 | 是 | Pass |
| UIExtensionContentSession 会话 | 扩展进程可用 | onSessionCreate/onSessionDestroy | 会话创建与销毁正确 | 是 | Pass |
| LocalStorage 共享数据 | 已注入 session | setOrCreate/get/has/delete | 键值读写一致 | 是 | Pass |
| UIExtensionComponent 事件 | 组件已挂载 | onRemoteReady/onReceive/onResult/onRelease | 事件与载荷正确 | 是 | Pass |
| 扩展校验与鉴权 | 权限可配置 | Want 校验、权限授予/撤销 | 校验结果符合预期 | 是 | Pass |
| 性能与稳定性 | 采样可统计 | 延迟、内存、并发采样 | 指标处于阈值内 | 是 | Pass |
| 集成与兼容 | 设备可连接 | 端到端流程、网络、本地化 | 流程通过 | 是 | Pass |

## 测试规模

- 测试套件：78 个
- 测试用例：1648 个
- 运行命令：aa test -b com.samples.uiextensionability -m entry_test -s unittest /ets/testrunner/OpenHarmonyTestRunner -s timeout 15000
- 说明：测试统一使用 @ohos.hilog 输出日志，未使用 console.log。
