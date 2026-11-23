# MobileNetwork ohosTest 测试用例说明

## 测试环境

- 设备：真机 d629034339413535311095d600002b00（2026-11-20 全量基线 + 增量复跑通过）
- SDK：26.0.0 / modelVersion 26.0.0
- 测试框架：@ohos/hypium 1.0.30 + @ohos/hamock 1.0.0
- 测试模块：entry_test，TestRunner 已支持 `-s class/-s it` 分批透传

## 套件与用例

| 测试套件 | 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|---|
| SlotCoreTest（10 例） | getDefaultCellularDataSlotId 类型/值域/契约/状态/组合 | 应用可启动 | 无输入（设备数据卡状态） | number 且 ∈ {-1,0,1}，多次调用一致 | 是 | 通过（基线） |
| DataEnabledCoreTest（10 例） | isCellularDataEnabled 类型/值域/契约/状态/组合 | 应用可启动 | 无输入（设备开关状态） | boolean ∈ {true,false}，多次调用一致 | 是 | 通过（基线） |
| RoamVolume01Test（57 例） | isCellularDataRoamingEnabled 对非法/边界/极值 slotId 的 catch 契约 | 应用可启动 | 57 个非法/边界/极值 slotId（-2147483648~2147483647 及非整数） | 一律 false 且类型为 boolean | 是 | 通过（基线） |
| RoamReal01Test（7 例） | 漫游合法档 {0,1}（设备依赖）与边界补充用例 | 应用可启动 | slotId ∈ {-1,0,1,-2147483648,2147483647} | 非法档 false；合法档 boolean 且多次调用一致 | 是 | 通过（基线） |
| FlowVolume01Test（25 例） | getDataFlowTypeResource 枚举→冻结资源 id 映射 | 应用可启动 | DataFlowType 合法 5 值 + 非法/极值 20 值 | 合法值命中冻结 id；非法值落 default→none(33554455) | 是 | 通过（修复后增量） |
| FlowReal01Test（6 例） | 流量映射的代表性合法值、非法值、重复调用一致性与组合场景 | 应用可启动 | 枚举合法与非法代表值 | 冻结 id（down=33554449 等），两次调用一致 | 是 | 通过（修复后增量） |
| CStateVolume01Test（25 例） | getDataStateResource 枚举→冻结资源 id 映射 | 应用可启动 | DataConnectState 合法 5 值 + 非法/极值 20 值 | 合法值命中冻结 id；非法值落 default→unknown(33554462) | 是 | 通过（修复后增量） |
| CStateReal01Test（6 例） | 连接态映射的代表性合法值、非法值、重复调用一致性与组合场景 | 应用可启动 | 枚举合法与非法代表值 | 冻结 id（connect=33554443 等），两次调用一致 | 是 | 通过（修复后增量） |
| RoamVolume02Test（75 例） | isCellularDataRoamingEnabled 对非法 slotId 的 catch 契约（区间扫描） | 应用可启动 | slotId ∈ [-375,-301] | 一律 false 且类型为 boolean | 是 | 通过（50k 全量基线） |
| RoamVolume03Test（75 例） | isCellularDataRoamingEnabled 对非法 slotId 的 catch 契约（区间扫描） | 应用可启动 | slotId ∈ [-300,-226] | 一律 false 且类型为 boolean | 是 | 通过（50k 全量基线） |
| RoamVolume04Test（75 例） | isCellularDataRoamingEnabled 对非法 slotId 的 catch 契约（区间扫描） | 应用可启动 | slotId ∈ [-225,-151] | 一律 false 且类型为 boolean | 是 | 通过（50k 全量基线） |
| RoamVolume05Test（75 例） | isCellularDataRoamingEnabled 对非法 slotId 的 catch 契约（区间扫描） | 应用可启动 | slotId ∈ [-150,-76] | 一律 false 且类型为 boolean | 是 | 通过（50k 全量基线） |
| RoamVolume06Test（75 例） | isCellularDataRoamingEnabled 对非法 slotId 的 catch 契约（区间扫描） | 应用可启动 | slotId ∈ [-75,-1] | 一律 false 且类型为 boolean | 是 | 通过（50k 全量基线） |
| RoamVolume07Test（75 例） | isCellularDataRoamingEnabled 对非法 slotId 的 catch 契约（区间扫描） | 应用可启动 | slotId ∈ [2,76] | 一律 false 且类型为 boolean | 是 | 通过（50k 全量基线） |
| RoamVolume08Test（75 例） | isCellularDataRoamingEnabled 对非法 slotId 的 catch 契约（区间扫描） | 应用可启动 | slotId ∈ [77,151] | 一律 false 且类型为 boolean | 是 | 通过（50k 全量基线） |
| RoamVolume09Test（75 例） | isCellularDataRoamingEnabled 对非法 slotId 的 catch 契约（区间扫描） | 应用可启动 | slotId ∈ [152,226] | 一律 false 且类型为 boolean | 是 | 通过（50k 全量基线） |
| RoamVolume10Test（75 例） | isCellularDataRoamingEnabled 对非法 slotId 的 catch 契约（区间扫描） | 应用可启动 | slotId ∈ [227,301] | 一律 false 且类型为 boolean | 是 | 通过（50k 全量基线） |
| RoamVolume11Test（75 例） | isCellularDataRoamingEnabled 对非法 slotId 的 catch 契约（区间扫描） | 应用可启动 | slotId ∈ [302,376] | 一律 false 且类型为 boolean | 是 | 通过（50k 全量基线） |
| FlowVolume02Test（75 例） | getDataFlowTypeResource 非法输入区间扫描 | 应用可启动 | dataFlow ∈ [-375,-301] | default→none(33554455) | 是 | 通过（50k 全量基线） |
| FlowVolume03Test（75 例） | getDataFlowTypeResource 非法输入区间扫描 | 应用可启动 | dataFlow ∈ [-300,-226] | default→none(33554455) | 是 | 通过（50k 全量基线） |
| FlowVolume04Test（75 例） | getDataFlowTypeResource 非法输入区间扫描 | 应用可启动 | dataFlow ∈ [-225,-151] | default→none(33554455) | 是 | 通过（50k 全量基线） |
| FlowVolume05Test（75 例） | getDataFlowTypeResource 非法输入区间扫描 | 应用可启动 | dataFlow ∈ [-150,-76] | default→none(33554455) | 是 | 通过（50k 全量基线） |
| FlowVolume06Test（75 例） | getDataFlowTypeResource 非法输入区间扫描 | 应用可启动 | dataFlow ∈ [-75,-1] | default→none(33554455) | 是 | 通过（50k 全量基线） |
| FlowVolume07Test（75 例） | getDataFlowTypeResource 非法输入区间扫描 | 应用可启动 | dataFlow ∈ [5,79] | default→none(33554455) | 是 | 通过（50k 全量基线） |
| FlowVolume08Test（75 例） | getDataFlowTypeResource 非法输入区间扫描 | 应用可启动 | dataFlow ∈ [80,154] | default→none(33554455) | 是 | 通过（50k 全量基线） |
| FlowVolume09Test（75 例） | getDataFlowTypeResource 非法输入区间扫描 | 应用可启动 | dataFlow ∈ [155,229] | default→none(33554455) | 是 | 通过（50k 全量基线） |
| FlowVolume10Test（75 例） | getDataFlowTypeResource 非法输入区间扫描 | 应用可启动 | dataFlow ∈ [230,304] | default→none(33554455) | 是 | 通过（50k 全量基线） |
| FlowVolume11Test（75 例） | getDataFlowTypeResource 非法输入区间扫描 | 应用可启动 | dataFlow ∈ [305,379] | default→none(33554455) | 是 | 通过（50k 全量基线） |
| CStateVolume02Test（75 例） | getDataStateResource 非法输入区间扫描 | 应用可启动 | state ∈ [-375,-301] | default→unknown(33554462) | 是 | 通过（50k 全量基线） |
| CStateVolume03Test（75 例） | getDataStateResource 非法输入区间扫描 | 应用可启动 | state ∈ [-300,-226] | default→unknown(33554462) | 是 | 通过（50k 全量基线） |
| CStateVolume04Test（75 例） | getDataStateResource 非法输入区间扫描 | 应用可启动 | state ∈ [-225,-151] | default→unknown(33554462) | 是 | 通过（50k 全量基线） |
| CStateVolume05Test（75 例） | getDataStateResource 非法输入区间扫描 | 应用可启动 | state ∈ [-150,-76] | default→unknown(33554462) | 是 | 通过（50k 全量基线） |
| CStateVolume06Test（75 例） | getDataStateResource 非法输入区间扫描 | 应用可启动 | state ∈ [-75,-1] | default→unknown(33554462) | 是 | 通过（50k 全量基线） |
| CStateVolume07Test（75 例） | getDataStateResource 非法输入区间扫描 | 应用可启动 | state ∈ [5,79] | default→unknown(33554462) | 是 | 通过（50k 全量基线） |
| CStateVolume08Test（75 例） | getDataStateResource 非法输入区间扫描 | 应用可启动 | state ∈ [80,154] | default→unknown(33554462) | 是 | 通过（50k 全量基线） |
| CStateVolume09Test（75 例） | getDataStateResource 非法输入区间扫描 | 应用可启动 | state ∈ [155,229] | default→unknown(33554462) | 是 | 通过（50k 全量基线） |
| CStateVolume10Test（75 例） | getDataStateResource 非法输入区间扫描 | 应用可启动 | state ∈ [230,304] | default→unknown(33554462) | 是 | 通过（50k 全量基线） |
| CStateVolume11Test（75 例） | getDataStateResource 非法输入区间扫描 | 应用可启动 | state ∈ [305,379] | default→unknown(33554462) | 是 | 通过（50k 全量基线） |
| NetWorkUiTest（7 例） | 首屏 6 个语义控件存在性与文案规格 | 应用已启动至主页 | 无交互输入（纯展示页） | 控件全部可见；文案按设备语言断言（中文文案或英文规格文案两套） | 是 | 通过（修复后增量） |

合计：39 个测试套件，2403 条用例。

## 执行结果

真机执行记录（设备 d629034339413535311095d600002b00，OpenHarmony 7.1.0.21）：

| 轮次 | 日期 | 范围 | Tests run | Failure | Error | Pass | 结论 |
|---|---|---|---|---|---|---|---|
| 全量基线（153 例时代） | 2026-11-20 | 9 套件 | 153 | 65 | 0 | 88 | 失败归因为测试期望值写错，main 无缺陷 |
| 增量复跑（逻辑套件） | 2026-11-20 | FlowVolume01/FlowReal01/CStateVolume01/CStateReal01 | 62 | 0 | 0 | 62 | 通过（期望值改运行时资源 id） |
| 增量复跑 UI | 2026-11-20 | NetWorkUiTest | 7 | 0 | 0 | 7 | 通过（断言按设备语言选规格集） |
| 扩容全量基线 | 2026-11-20 | 39 套件，分 9 批（B1~B9） | 2403 | 0 | 0 | 2403 | 全部通过 |

扩容全量基线分批明细：

| 批 | 套件 | Tests run | Failure | Error | Pass |
|---|---|---|---|---|---|
| B1 | SlotCoreTest, DataEnabledCoreTest | 20 | 0 | 0 | 20 |
| B2 | RoamVolume01, RoamReal01, RoamVolume02, RoamVolume03 | 214 | 0 | 0 | 214 |
| B3 | RoamVolume04~07 | 300 | 0 | 0 | 300 |
| B4 | RoamVolume08~11 | 300 | 0 | 0 | 300 |
| B5 | FlowVolume01, FlowReal01, FlowVolume02~05 | 331 | 0 | 0 | 331 |
| B6 | FlowVolume06~11 | 450 | 0 | 0 | 450 |
| B7 | CStateVolume01, CStateReal01, CStateVolume02~05 | 331 | 0 | 0 | 331 |
| B8 | CStateVolume06~11 | 450 | 0 | 0 | 450 |
| B9 | NetWorkUiTest | 7 | 0 | 0 | 7 |

## 备注

- 2026-11-20 扩容：新增 30 个区间扫描桶（ROAM/FLOW/CSTATE 各 10 桶 × 75 例 = 2250 例），号段续接（ROAM 0065~0814、FLOW 0032~0781、CSTATE 0032~0781），TestAbility 改为 onForeground 延后启动 hypiumTest（注册用例 2403 > 800）。
- 各套件期望值来自冻结资源 id 基线（设备运行时资源索引，0x02 命名空间）与 main 实现契约；早前按编译期 ResourceTable.txt（0x01 命名空间）取值与真机运行时不符，已修正为运行时索引值并经增量复跑验证。
- 真机验证轮次：2026-11-20 全量基线 153 例（88 过 / 65 败）；归因后修复测试期望值，增量复跑 62 例逻辑套件与 7 例 UI 套件全部通过。扩容后 9 批全量基线 2403 例全部通过（2403/2403，result=0）；期间修复 Runner 目录名（ets/testrunner/ 框架约定路径）与 Flow/CState 冻结资源 id 基线（ohosTest 资源表新增 3 个 string 资源致 string 段 id 后移 3，期望值同步 +3）。
