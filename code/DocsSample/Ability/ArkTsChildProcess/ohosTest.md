# ArkTsChildProcess测试用例归档

## 概述

本工程为「创建ArkTS子进程」示例，ohosTest 共 **3067 条**自动化用例：UI 交互 4 条、纯逻辑模型 51 条、逻辑方法 3012 条。
由于单次全量测试执行会触发系统 lifecycle/watchdog 超时，用例在 `List.test.ets` 中分为 **六批**注册，通过 `-s batch <1..6>` 选择，每次只执行一批（见 `run_tests_batched.ps1`）。

## 用例表

### 1. 功能与 UI 自动化用例（ActsAbilityTest，4 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 启动EntryAbility | 设备正常运行 | 通过abilityDelegator启动com.sample.arktschildprocess的EntryAbility，并用UiTest查找首页组件 | 成功拉起首页，能定位到首页按钮组件（UiTest不可用时用例断言失败，不静默跳过） | 是 | Pass |
| 使用Promise方式创建无参数ArkTS子进程 | 位于应用主页面 | 1、点击"StartArkChildProcessNoArg_Promise"按钮<br/>2、等待1秒 | 调用childProcessManager.startChildProcess以SELF_FORK模式启动子进程，通过Promise回调返回子进程pid | 是 | Pass |
| 使用Callback方式创建无参数ArkTS子进程 | 位于应用主页面 | 1、点击"StartArkChildProcessNoArg_Callback"按钮<br/>2、等待1秒 | 调用childProcessManager.startChildProcess以SELF_FORK模式启动子进程，通过callback回调返回子进程pid | 是 | Pass |
| 创建带参数的ArkTS子进程 | 位于应用主页面 | 1、点击"StartArkChildProcessWithArg"按钮<br/>2、等待1秒 | 调用childProcessManager.startArkChildProcess，传递entryParams和fd句柄，通过Promise回调返回子进程pid | 是 | Pass |

### 2. 纯逻辑模型用例（Model，51 条）

| 测试类 | 测试功能 | 覆盖内容 | 用例数 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| ArkTsChildProcessModelTestBoundary | 边界值测试 | PID 上下限、参数长度、fd 边界等 | 4 | 是 | Pass |
| ArkTsChildProcessModelTestBuilder | 请求对象构造 | ChildProcessRequest 构造、等价比较、摘要与日志格式化 | 3 | 是 | Pass |
| ArkTsChildProcessModelTestErrorCatalog | 错误码目录 | 成功/401/16000001/16000002/16000003 错误码与描述映射 | 2 | 是 | Pass |
| ArkTsChildProcessModelTestIntegration | 集成校验 | 请求合法性、启动/停止判定与结果描述的集成校验 | 3 | 是 | Pass |
| ArkTsChildProcessModelTestMessages | 消息映射 | 成功/失败消息与错误码一致性 | 3 | 是 | Pass |
| ArkTsChildProcessModelTestPathRules | 进程路径规则 | ArkTS 子进程与 Module 子进程路径格式规则 | 7 | 是 | Pass |
| ArkTsChildProcessModelTestSecurity | 安全约束 | 隔离模式与 SELF_FORK/ATTACH 的安全限制 | 4 | 是 | Pass |
| ArkTsChildProcessModelTestStateMachine | 状态机 | IDLE/RUNNING/EXITED 状态迁移与可启动/可停止判定 | 3 | 是 | Pass |
| ArkTsChildProcessModelTestValidation | 参数校验 | 路径、启动模式、entryParams、fd 计数组合校验 | 7 | 是 | Pass |
| ArkTsChildProcessModelTestWorkflow | 启动工作流 | Promise/Callback/带参子进程启动与参数传递流程 | 15 | 是 | Pass |

### 3. 逻辑方法用例（logic，3012 条）

| 被测方法 | Core | Edge | Matrix | Stress | Extended | 小计 | 测试结果 |
|---|---|---|---|---|---|---|---|
| CanStart | 50 | 50 | 50 | - | - | 150 | Pass |
| CanStop | 50 | 50 | 50 | - | - | 150 | Pass |
| CountValidPids | 6 | 6 | - | - | - | 12 | Pass |
| DescribeResult | 50 | 50 | - | - | - | 100 | Pass |
| ErrorMessage | 50 | 50 | 50 | 50 | - | 200 | Pass |
| IsArkTsProcessPath | 50 | 50 | 50 | 50 | - | 200 | Pass |
| IsModuleProcessPath | 50 | 50 | 50 | 50 | - | 200 | Pass |
| IsolationAllowed | 50 | 50 | 50 | - | - | 150 | Pass |
| IsSameProcess | 50 | 50 | - | - | - | 100 | Pass |
| IsSuccessCode | 50 | 50 | 50 | - | - | 150 | Pass |
| IsValidEntryParams | 50 | 50 | 50 | 50 | - | 200 | Pass |
| IsValidFdValue | 50 | 50 | 50 | - | - | 150 | Pass |
| IsValidPath | 50 | 50 | 50 | 50 | 50 | 250 | Pass |
| IsValidPid | 50 | 50 | 50 | 50 | 50 | 250 | Pass |
| IsValidStartMode | 50 | 50 | 50 | 50 | - | 200 | Pass |
| NormalizeParams | 50 | 50 | 50 | - | - | 150 | Pass |
| RetryDelay | 50 | 50 | 50 | 50 | - | 200 | Pass |
| StateName | 50 | 50 | 50 | 50 | - | 200 | Pass |
| **合计** | | | | | | **3012** | Pass |

> 变体说明：Core 为常规功能，Edge 为边界/异常，Matrix 为参数组合矩阵，Stress 为批量/重复压力，Extended 为扩展场景。

## 测试说明

### 一、分批执行

| 批次 | 用例数 | 覆盖内容 |
|---|---|---|
| Batch 1 | 517 | Model 全部 + CanStart + CanStop + CountValidPids + DescribeResult + ErrorMessage(Core) + UI |
| Batch 2 | 550 | ErrorMessage(Edge/Matrix/Stress) + IsArkTsProcessPath + IsModuleProcessPath |
| Batch 3 | 550 | IsolationAllowed + IsSameProcess + IsSuccessCode + IsValidEntryParams(Core/Edge/Matrix) |
| Batch 4 | 550 | IsValidEntryParams(Stress) + IsValidFdValue + IsValidPath + IsValidPid(Core/Edge) |
| Batch 5 | 550 | IsValidPid(Extended/Matrix/Stress) + IsValidStartMode + NormalizeParams + RetryDelay(Core) |
| Batch 6 | 350 | RetryDelay(Edge/Matrix/Stress) + StateName |
| **合计** | **3067** | |

### 二、执行方式

```powershell
# 单批（N 取 1~6，不传 batch 时默认 Batch 1）：通过测试命令的 -s batch N 指定批次
# 六批依次执行并汇总
powershell -ExecutionPolicy Bypass -File D:\applications_app_samples\code\DocsSample\Ability\ArkTsChildProcess\run_tests_batched.ps1
```

DevEco Studio 的「Run all」只发一条测试命令，不传 `-s batch`，因此默认只执行 Batch 1；全量请在 DevEco 内置 Terminal 运行上述脚本或逐批执行。

### 三、自动化测试范围

- `Ability.test.ets`：UiTest 驱动 EntryAbility 启动与首页三个按钮的点击验证。
- `Model/*.test.ets`：不依赖 UI 的纯逻辑模型（参数校验、路径规则、状态机、错误消息、工作流等）。
- `logic/*.test.ets`：对 18 个逻辑方法的 Core/Edge/Matrix/Stress/Extended 变体覆盖。

### 四、设备限制说明

实测本设备（OpenHarmony 7.1.0.23，API 26）单次测试命令稳定上限约 600 条：605 条稳定，705 条临界，900 条以上进程被杀。故采用六批拆分。
`List.test.ets` 通过 `-s batch` 每次只注册一批；UiTest Driver 采用懒加载，UiTest 不可用时相关 UI 用例以断言失败显式暴露，避免静默通过。
