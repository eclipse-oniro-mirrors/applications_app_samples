# DynamicIsolationProcess测试用例归档

## 概述

本工程为「动态指定进程拉起隔离 Ability」示例，`ohosTest` 共 **3105 条**自动化用例：

- UI 交互 **2 条**（`ActsAbilityTest`）
- 纯逻辑模型 **53 条**（`Model`，10 个测试类）
- 逻辑方法 **3050 条**（`logic`，61 个测试文件，每个被测方法 50 条 × 1~6 个变体）

由于单次全量执行时主线程连续运行超过 6 秒，会触发系统看门狗 `THREAD_BLOCK_6S` 并终止进程，用例通过 `List.test.ets` 的 `batch` / `batches` 参数分批执行（推荐四批）。

## 用例清单

### 1. 功能性 UI 自动化用例（ActsAbilityTest，2 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 通过文本定位点击主页面，触发动态指定进程拉起 EntryAbility1 | entry 模块 EntryAbility 已启动并显示主页面 | 1、通过 `ON.text('start EntryAbility1')` 定位文本组件<br/>2、点击该文本组件<br/>3、等待 1000ms | 触发 startAbility 拉起配置了 `isolationProcess` 的 EntryAbility1，系统回调 `onNewProcessRequest` 分配独立进程 | 是 | Pass |
| 通过 id 定位点击主页面，触发动态指定进程拉起 EntryAbility1 并返回 | entry 模块 EntryAbility 已启动并显示主页面 | 1、通过 `ON.id('HelloWorld')` 定位文本组件<br/>2、点击该文本组件<br/>3、等待 1000ms<br/>4、按返回键 | 触发 startAbility 拉起 EntryAbility1，并成功返回主页面 | 是 | Pass |

### 2. 纯逻辑模型用例（Model，53 条）

| 测试类 | 测试功能 | 覆盖内容 | 用例数 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| DynamicIsolationProcessModelTestValidation | 参数校验 | bundleName、abilityName、isolationKey 合法性校验 | 4 | 是 | Pass |
| DynamicIsolationProcessModelTestBoundary | 边界值测试 | isolationKey 长度 0/63、bundleName 长度 129、context 数量 8 | 4 | 是 | Pass |
| DynamicIsolationProcessModelTestErrorCatalog | 错误码目录 | errorMessage(0)、isSuccessCode(16000022) 错误码映射 | 2 | 是 | Pass |
| DynamicIsolationProcessModelTestStateMachine | 状态机 | stateName、canStart、abilityLifecycleIndex 状态迁移 | 3 | 是 | Pass |
| DynamicIsolationProcessModelTestBuilder | Want 构造 | buildWant 字段构造、isValidWant 校验 | 3 | 是 | Pass |
| DynamicIsolationProcessModelTestIntegration | 集成校验 | 隔离 Ability 生命周期序列集成校验 | 4 | 是 | Pass |
| DynamicIsolationProcessModelTestSecurity | 安全约束 | 非法 isolationKey、非法 moduleName 拒绝 | 8 | 是 | Pass |
| DynamicIsolationProcessModelTestMessages | 消息映射 | 隔离失败错误消息与错误码映射 | 3 | 是 | Pass |
| DynamicIsolationProcessModelTestPathRules | 路径/进程名规则 | module/ability 路径规则、`bundleName:key` 进程名、moduleName 生成 | 5 | 是 | Pass |
| DynamicIsolationProcessModelTestWorkflow | 启动工作流 | 进程名组合、`onNewProcessRequest`、want 目标、生命周期迁移、非法参数拒绝、GlobalThis context 存取 | 17 | 是 | Pass |
| **合计** | | | **53** | | Pass |

### 3. 逻辑方法用例（logic，3050 条）

| 被测方法 | Core | Edge | Matrix | Stress | Extended | Boundary | 小计 | 测试结果 |
|---|---|---|---|---|---|---|---|---|
| AbilityLifecycleIndex | 50 | 50 | 50 | 50 | - | - | 200 | Pass |
| CanStart | 50 | 50 | 50 | - | - | - | 150 | Pass |
| ComposeProcessName | 50 | 50 | 50 | 50 | - | - | 200 | Pass |
| DescribeError | 50 | 50 | 50 | - | - | - | 150 | Pass |
| DescribeIsolation | 50 | 50 | 50 | 50 | - | - | 200 | Pass |
| ErrorMessage | 50 | 50 | 50 | 50 | 50 | - | 250 | Pass |
| IsSameProcessName | 50 | 50 | 50 | - | - | - | 150 | Pass |
| IsSuccessCode | 50 | 50 | 50 | - | - | - | 150 | Pass |
| IsValidAbilityName | 50 | 50 | 50 | 50 | - | - | 200 | Pass |
| IsValidBundleName | 50 | 50 | 50 | 50 | 50 | 50 | 300 | Pass |
| IsValidContextKey | 50 | 50 | 50 | - | - | - | 150 | Pass |
| IsValidIsolationKey | 50 | 50 | 50 | 50 | 50 | 50 | 300 | Pass |
| IsValidModule | 50 | 50 | 50 | 50 | 50 | - | 250 | Pass |
| NormalizeKey | 50 | 50 | 50 | - | - | - | 150 | Pass |
| StateName | 50 | 50 | 50 | 50 | 50 | - | 250 | Pass |
| **合计** | | | | | | | **3050** | Pass |

> 变体说明：Core 为常规功能，Edge 为边界/异常，Matrix 为参数组合矩阵，Stress 为批量/重复压力，Extended 为扩展场景，Boundary 为边界值补充。

## 测试说明

### 一、分批执行（四批）

`List.test.ets` 将 72 个测试套件放入单一 `suites` 列表，按 `chunk = ceil(72 / batches)` 连续切片，`batch` 从 0 开始。

| 批次 | 用例数 | 覆盖内容 |
|---|---|---|
| Batch 0 | 453 | Model 全部 10 类（53）+ IsValidBundleName 全变体（300）+ IsValidModule Core/Edge（100） |
| Batch 1 | 900 | IsValidModule Matrix/Stress/Extended（150）+ IsValidAbilityName 全变体（200）+ IsValidIsolationKey 全变体（300）+ ComposeProcessName 全变体（200）+ NormalizeKey Core（50） |
| Batch 2 | 900 | NormalizeKey Edge/Matrix（100）+ IsSameProcessName 全变体（150）+ StateName 全变体（250）+ CanStart 全变体（150）+ DescribeError 全变体（150）+ ErrorMessage Core/Edge（100） |
| Batch 3 | 852 | ErrorMessage Matrix/Stress/Extended（150）+ IsSuccessCode 全变体（150）+ IsValidContextKey 全变体（150）+ AbilityLifecycleIndex 全变体（200）+ DescribeIsolation 全变体（200）+ ActsAbilityTest（2） |
| **合计** | **3105** | |

> 若单批仍触发看门狗，可增大 `batches`（如 `-s batches 12`），`batch` 取值范围为 `0 ~ batches-1`。

### 二、执行方式

前置：已安装 `entry-default-signed.hap` 与 `entry-ohosTest-signed.hap`。

四批依次执行：每批先通过 `hdc shell` 停止应用进程，再通过 OpenHarmony Ability assistant（Ability 助手）的 `test` 命令执行，公共参数为 `-b com.sample.dynamicisolationprocess -m entry_test -s unittest /ets/testrunner/OpenHarmonyTestRunner -s timeout 15000 -s batches 4`，`-s batch` 依次取 `0`、`1`、`2`、`3`。

一条命令顺序跑完四批：在 PowerShell 中循环执行上述停止进程与 `test` 命令（`batch` 从 `0` 到 `3`），并过滤 `OHOS_REPORT_RESULT|TestFinished|App died`。

> `hdc` 不在 PATH 时使用全路径：`D:\OpenHarmony\sdk\26.0.0\toolchains\hdc.exe`。
