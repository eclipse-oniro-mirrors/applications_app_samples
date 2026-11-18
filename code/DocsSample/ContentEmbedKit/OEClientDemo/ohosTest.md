# OEClientDemo 测试用例说明

## 测试模块

- 测试模块路径：`entry/src/ohosTest`
- 测试入口：`entry/src/ohosTest/ets/test/List.test.ets`
- 测试用例文件：`entry/src/ohosTest/ets/test/Ability.test.ets`

## 测试环境

- 设备类型：phone、tablet、2in1（需具备 `SystemCapability.ContentEmbed.ObjectEditor` 系统能力）
- 测试框架：`@ohos/hypium`
- 日志框架：`@kit.PerformanceAnalysisKit`（hilog，DOMAIN=0xF811，TAG=`[Sample_OEClientDemo]`）
- 测试常量：`BUNDLE = 'OEClientDemo_'`、`DOMAIN = 0xF811`、`TAG = '[Sample_OEClientDemo]'`

## 测试用例列表

| 用例编号 | 用例名称 | 测试场景 | 预期结果 |
|---------|---------|---------|---------|
| 1 | `OEClientDemo_ErrorMap_001` | `getCEErrMsg(0, context)` 经 resourceManager 解析 CE_ERR_OK 的本地化消息 | 返回非空字符串（随系统语言本地化） |
| 2 | `OEClientDemo_ErrorMap_002` | `getCEErrMsg(201, context)` 经 resourceManager 解析权限拒绝的本地化消息 | 返回非空字符串（随系统语言本地化） |
| 3 | `OEClientDemo_ErrorMap_003` | `getCEErrMsg(99999)` 对未知错误码回退 | 返回 `'Error: 99999'` |
| 4 | `OEClientDemo_Constants_001` | `tempDirName` 常量值校验 | 等于 `'dest'` |
| 5 | `OEClientDemo_InnerEvent_001` | emitter 事件 ID 稳定性校验 | `formatSelectedEvent.eventId == 10`、`fileSelectedEvent.eventId == 11` |
| 6 | `OEClientDemo_QueryAll_001` | `testNapi.queryAll('zh-cn')` 返回结构校验 | `result.errCode` 为 `number` 类型 |
| 7 | `OEClientDemo_Query_001` | `testNapi.query('nonexistent', 'zh-cn')` 返回结构校验 | `result.errCode` 为 `number` 类型 |
| 8 | `OEClientDemo_CreateDormant_001` | `testNapi.createDormant` 创建休眠代理 | `errCode == 0` 且 `data` 非空，`getName()` 与入参一致 |
| 9 | `OEClientDemo_CreateDormant_002` | 休眠代理 `isAlive()` 返回 false | 创建前后 `isAlive()` 均为 `false` |
| 10 | `OEClientDemo_CreateDormant_003` | 休眠代理元数据 `getPath()` 校验 | `getPath()` 与入参 `sandboxPath` 一致 |

## 测试步骤

1. 在 DevEco Studio 中打开本工程。
2. 连接已开启开发者模式的真机（需具备 Content Embed 系统能力）。
3. 右键 `entry/src/ohosTest` 模块，选择 `Run 'entry_test'` 或执行 `hvigorw assembleHap` 后用 `hdc install` 安装测试 HAP。
4. 在测试结果面板查看用例执行结果，或通过 `hilog` 过滤 `[Sample_OEClientDemo]` 查看日志。

## 测试结果

| 用例编号 | 测试结果 |
|---------|---------|
| OEClientDemo_ErrorMap_001 | Pass |
| OEClientDemo_ErrorMap_002 | Pass |
| OEClientDemo_ErrorMap_003 | Pass |
| OEClientDemo_Constants_001 | Pass |
| OEClientDemo_InnerEvent_001 | Pass |
| OEClientDemo_QueryAll_001 | Pass |
| OEClientDemo_Query_001 | Pass |
| OEClientDemo_CreateDormant_001 | Pass |
| OEClientDemo_CreateDormant_002 | Pass |
| OEClientDemo_CreateDormant_003 | Pass |

## 测试覆盖范围说明

- **错误码映射**（ErrorMap_001~003）：覆盖 `CEErrorMap.getCEErrMsg` 的已知码经 resourceManager 本地化解析（错误码→资源名→字符串全链路，随系统语言）、未知码回退两条路径；解析路径需设备 resourceManager，回退路径可在任意环境执行。
- **常量校验**（Constants_001、InnerEvent_001）：覆盖 `tempDirName` 与子窗口→主页 IPC 的事件 ID 稳定性，确保子窗口 `emitter.emit` 与主页 `emitter.on` 的事件编号一致。
- **NAPI 返回结构**（QueryAll_001、Query_001）：覆盖 `testNapi.queryAll` / `testNapi.query` 的返回结构契约（`errCode` 为 `number`），不依赖 OE 服务端存在，在无 OE Extension 的设备上仍可通过。
- **休眠代理生命周期**（CreateDormant_001~003）：覆盖 `testNapi.createDormant` 的元数据构造与 `getName`/`getPath`/`isAlive` 访问器，不启动活代理（不触发 IPC），可在无 OE 服务端应用时执行。
