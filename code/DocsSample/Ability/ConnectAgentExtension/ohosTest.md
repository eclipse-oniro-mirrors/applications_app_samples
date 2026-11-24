# ConnectAgentExtension 测试用例归档

## 概述

本工程为「AgentExtensionAbility 智能体管理」示例，ohosTest 共 **3104 条**自动化用例：UI 自动化 2 条、纯逻辑模型 52 条、逻辑方法 3050 条。

由于单次全量执行会在约 910 条处被系统杀死（`TestFinished-ResultMsg: App died`），用例在 `List.test.ets` 中通过 `-s batch <0..3> -s batches 4` 分 **四批**注册执行，每次只执行一批。

## 用例清单

### 1. 功能/UI 自动化用例（ActsAbilityTest，2 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 基础断言自检 | 设备正常运行 | 校验字符串包含关系与自相等 | `assertContain`、`assertEqual` 断言通过 | 是 | Pass |
| 启动 EntryAbility | 设备正常运行，应用已安装 | 通过 abilityDelegator 以 bundleName `com.sample.connectagentextension`、abilityName `EntryAbility` 启动应用 | `startAbility` 调用成功，能力正常拉起 | 是 | Pass |

### 2. 纯逻辑模型用例（Model，52 条）

| 测试套 | 测试功能 | 覆盖内容 | 用例数 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| ConnectAgentExtensionModelTestValidation | 参数校验 | bundleName、abilityName、agentId、payload 合法/非法输入校验 | 4 | 是 | Pass |
| ConnectAgentExtensionModelTestBoundary | 边界值 | agentId 长度 0/63、payload 长度 4097、长度计数边界 | 4 | 是 | Pass |
| ConnectAgentExtensionModelTestErrorCatalog | 错误码目录 | 成功码与 401/16000011/16000012/16000013 错误码及消息映射 | 2 | 是 | Pass |
| ConnectAgentExtensionModelTestStateMachine | 状态机 | IDLE/CONNECTING/CONNECTED/DISCONNECTED 状态名、可连接/可发送/已连接判定 | 4 | 是 | Pass |
| ConnectAgentExtensionModelTestBuilder | 对象构建 | `buildWant` 字段、`isValidWant`、`makeEvent` 事件接受标记 | 5 | 是 | Pass |
| ConnectAgentExtensionModelTestIntegration | 集成校验 | connect→connected→send/authorize→disconnect 连接序列合法性 | 4 | 是 | Pass |
| ConnectAgentExtensionModelTestSecurity | 安全约束 | `- . / @ # $ 空格` 等非法字符注入的 agentId 拒绝校验 | 6 | 是 | Pass |
| ConnectAgentExtensionModelTestMessages | 消息映射 | 成功/失败消息与错误码一致性 | 3 | 是 | Pass |
| ConnectAgentExtensionModelTestPathRules | 标识规则 | agentId 字符集规则及生成标识的合法性 | 3 | 是 | Pass |
| ConnectAgentExtensionModelTestWorkflow | 连接工作流 | 连接、发送、鉴权、断连、重连、事件接受等完整流程 | 17 | 是 | Pass |
| **合计** | | | **52** | | Pass |

### 3. 逻辑方法用例（logic，3050 条）

被测逻辑统一由 `Shared/AgentFixtures.ets` 中的 `AgentModel` 提供，每个方法按 Core/Edge/Matrix/Stress/Extended/Boundary 变体各 50 条覆盖。

| 被测方法 | Core | Edge | Matrix | Stress | Extended | Boundary | 小计 |
|---|---|---|---|---|---|---|---|
| isValidBundleName | 50 | 50 | 50 | 50 | 50 | 50 | 300 |
| isValidAbilityName | 50 | 50 | 50 | 50 | 50 | 50 | 300 |
| isValidAgentId | 50 | 50 | 50 | 50 | 50 | 50 | 300 |
| isValidPayload | 50 | 50 | 50 | 50 | 50 | 50 | 300 |
| stateName | 50 | 50 | 50 | 50 | - | - | 200 |
| canConnect | 50 | 50 | 50 | - | - | - | 150 |
| canSend | 50 | 50 | 50 | - | - | - | 150 |
| canAuthorize | 50 | 50 | 50 | - | - | - | 150 |
| canDisconnect | 50 | 50 | 50 | - | - | - | 150 |
| isConnected | 50 | 50 | 50 | - | - | - | 150 |
| eventName | 50 | 50 | 50 | 50 | - | - | 200 |
| errorMessage | 50 | 50 | 50 | 50 | - | - | 200 |
| isSuccessCode | 50 | 50 | 50 | - | - | - | 150 |
| normalizePayload | 50 | 50 | 50 | - | - | - | 150 |
| agentIdLength | 50 | 50 | 50 | 50 | - | - | 200 |
| **合计** | | | | | | | **3050** |

> 变体说明：Core 为常规功能，Edge 为边界/异常，Matrix 为参数组合矩阵，Stress 为批量/重复压力，Extended 为扩展场景，Boundary 为边界值。

## 用例分组与批量执行

| 批次 | 用例数 | 覆盖内容 |
|---|---|---|
| batch 0 | 452 | Model 全部 52 条 + isValidBundleName（Core/Edge/Matrix/Stress/Extended/Boundary）+ isValidAbilityName（Core/Edge） |
| batch 1 | 900 | isValidAbilityName（Matrix/Stress/Extended/Boundary）+ isValidAgentId（全部 6 变体）+ isValidPayload（全部 6 变体）+ stateName（Core/Edge） |
| batch 2 | 900 | stateName（Matrix/Stress）+ canConnect + canSend + canAuthorize + canDisconnect + isConnected（各 Core/Edge/Matrix）+ eventName（Core） |
| batch 3 | 852 | eventName（Edge/Matrix/Stress）+ errorMessage（全部 4 变体）+ isSuccessCode + normalizePayload（各 Core/Edge/Matrix）+ agentIdLength（全部 4 变体）+ ActsAbilityTest |
| **合计** | **3104** | |

执行方式（hdc shell 形式，需先安装应用与 ohosTest 测试包）：

通过 OpenHarmony Ability assistant（Ability 助手）的 `test` 命令按批次执行，公共参数为 `-b com.sample.connectagentextension -m entry_test -s unittest OpenHarmonyTestRunner -s timeout 900000 -s batches 4`，`-s batch` 依次取 `0`、`1`、`2`、`3`。

DevEco Studio 的「Run all」不传 `-s batch`，默认执行全量（会触发进程被杀），全量请按上述公共参数逐批执行。

## 自动化测试范围

- `Ability.test.ets`：验证 EntryAbility 可被 abilityDelegator 正常拉起。
- `Model/*.test.ets`：不依赖 UI 的纯逻辑模型（参数校验、边界值、错误码、状态机、对象构建、集成与安全工作流）。
- `logic/*.test.ets`：对 `AgentModel` 的 15 个逻辑方法做 Core/Edge/Matrix/Stress/Extended/Boundary 多维度覆盖。

## 设备限制说明

实测本设备（OpenHarmony 7.1.0.23，API 26）单次测试命令在 3104 条全量执行时于第 910 条左右发生 `App died`，因此采用四批拆分；每批均显式指定 `-s timeout 900000`，四批合计 3104 条全部 Pass。
