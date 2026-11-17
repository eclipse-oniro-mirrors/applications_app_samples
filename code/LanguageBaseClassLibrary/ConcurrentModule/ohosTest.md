# ConcurrentModule 测试用例归档

## 验证范围

测试代码位于 `entry/src/ohosTest/ets/test`，由 [List.test.ets](entry/src/ohosTest/ets/test/List.test.ets) 注册全部自动化套件。`List.test.ets` 与 `Shared/SharedDriver.ets` 不含独立 `it()` 用例，`Ability.test.ets` 未在入口注册，均不计入用例总数。

已完成 entry 应用 HAP 与 entry_test 测试 HAP 的编译，并在真机（OpenHarmony API 23，ArkTS 1.1）执行全量自动化测试：

- **测试文件：** 14 个分类、80 个场景套件文件（不含 List/SharedDriver/Ability）
- **测试套件：** 80
- **测试用例：** 2322
- **执行结果：** Pass 2322、Failure 0、Error 0、Ignore 0（约 68 分 20 秒）
- **执行日志：** [test-run-full.log](test-run-full.log)；汇总见 [TEST_RUN_REPORT.md](TEST_RUN_REPORT.md)

## 测试套件总览

| 分类 | 覆盖对象 | 套件数 | 用例数 |
|---|---|---:|---:|
| Workflow | 多步骤生产流程 | 1 | 10 |
| Worker | Worker 线程 | 7 | 202 |
| Task | TaskPool 任务 | 6 | 176 |
| Function | 任务函数 | 6 | 177 |
| Group | TaskGroup 任务组 | 6 | 175 |
| Sendable | Sendable 对象传递 | 6 | 137 |
| Count | 计数与结果校验 | 6 | 179 |
| Encoding | UTF-8 编解码 | 6 | 146 |
| LegacyEncoding | 传统编码与转义 | 6 | 174 |
| UiWorker | UI 与 Worker 联动 | 6 | 220 |
| UiTask | UI 与 TaskPool 联动 | 6 | 186 |
| UiFunction | UI 功能 | 6 | 231 |
| Copy | 文件拷贝 | 6 | 152 |
| MyFile | 文件列表与文件操作 | 6 | 157 |
| **合计** | | **80** | **2322** |

## 功能覆盖矩阵

按用例名称中的被测 API 标记统计（同一用例可能覆盖多个 API，因此分行计数之和大于用例总数）。

| 被测 API | 涉及用例数 | 覆盖状态 |
|---|---:|---|
| Group | 426 | ✅ Pass |
| Sendable | 283 | ✅ Pass |
| Copy | 249 | ✅ Pass |
| UiFunction | 168 | ✅ Pass |
| UiWorker | 160 | ✅ Pass |
| Worker | 149 | ✅ Pass |
| UiTask | 136 | ✅ Pass |
| Count | 133 | ✅ Pass |
| Function | 131 | ✅ Pass |
| Task | 130 | ✅ Pass |
| LegacyEncoding | 126 | ✅ Pass |
| MyFile | 115 | ✅ Pass |
| Encoding | 106 | ✅ Pass |
| Workflow 专项（10 个流程步骤） | 10 | ✅ Pass |
| **合计（API 标记累计，含重叠）** | **2322** | |

## 用例表

结果列口径：`Pass` 表示该用例在真机全量执行中通过（Hypium 汇总 `Failure: 0`）。场景套件内部为同一业务场景的多组输入/状态矩阵，本表按套件汇总为一行，不逐条展开。

### Workflow（多步骤生产流程，1 个套件，10 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| ProductionWorkflow | entry 应用与 entry_test HAP 已安装 | 执行 `Workflow/ProductionWorkflow.test.ets` 的 10 条用例（覆盖：EditInvalidatesResult 1、FileNavigation 1、LockOrdering 1、DelayedSort 1、CompletedCancellation 1、ClearAndResort 1、TabIsolation 1、EmptyAdd 1、TaskGroup 1、EmptyCancellation 1） | 10 条用例断言全部通过，Failure: 0 | 是 | Pass |

### Worker（Worker 线程，7 个套件，202 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| WorkerScenario01 | entry 应用与 entry_test HAP 已安装 | 执行 `Worker/WorkerScenario01.test.ets` 的 24 条用例（覆盖：Worker 18、Group 3、Sendable 2、Copy 1） | 24 条用例断言全部通过，Failure: 0 | 是 | Pass |
| WorkerScenario14 | entry 应用与 entry_test HAP 已安装 | 执行 `Worker/WorkerScenario14.test.ets` 的 24 条用例（覆盖：Worker 18、Group 3、Sendable 2、Copy 1） | 24 条用例断言全部通过，Failure: 0 | 是 | Pass |
| WorkerScenario27 | entry 应用与 entry_test HAP 已安装 | 执行 `Worker/WorkerScenario27.test.ets` 的 37 条用例（覆盖：Worker 27、Group 5、Sendable 3、Copy 2） | 37 条用例断言全部通过，Failure: 0 | 是 | Pass |
| WorkerScenario40 | entry 应用与 entry_test HAP 已安装 | 执行 `Worker/WorkerScenario40.test.ets` 的 30 条用例（覆盖：Worker 22、Group 4、Sendable 2、Copy 2） | 30 条用例断言全部通过，Failure: 0 | 是 | Pass |
| WorkerScenario53 | entry 应用与 entry_test HAP 已安装 | 执行 `Worker/WorkerScenario53.test.ets` 的 39 条用例（覆盖：Worker 28、Group 5、Copy 3、Sendable 3） | 39 条用例断言全部通过，Failure: 0 | 是 | Pass |
| WorkerScenario66 | entry 应用与 entry_test HAP 已安装 | 执行 `Worker/WorkerScenario66.test.ets` 的 24 条用例（覆盖：Worker 18、Group 3、Sendable 2、Copy 1） | 24 条用例断言全部通过，Failure: 0 | 是 | Pass |
| WorkerScenario79 | entry 应用与 entry_test HAP 已安装 | 执行 `Worker/WorkerScenario79.test.ets` 的 24 条用例（覆盖：Worker 18、Group 3、Sendable 2、Copy 1） | 24 条用例断言全部通过，Failure: 0 | 是 | Pass |

### Task（TaskPool 任务，6 个套件，176 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| TaskScenario02 | entry 应用与 entry_test HAP 已安装 | 执行 `Task/TaskScenario02.test.ets` 的 24 条用例（覆盖：Task 18、Group 3、Sendable 2、Copy 1） | 24 条用例断言全部通过，Failure: 0 | 是 | Pass |
| TaskScenario15 | entry 应用与 entry_test HAP 已安装 | 执行 `Task/TaskScenario15.test.ets` 的 24 条用例（覆盖：Task 18、Group 3、Sendable 2、Copy 1） | 24 条用例断言全部通过，Failure: 0 | 是 | Pass |
| TaskScenario28 | entry 应用与 entry_test HAP 已安装 | 执行 `Task/TaskScenario28.test.ets` 的 38 条用例（覆盖：Task 28、Group 5、Sendable 3、Copy 2） | 38 条用例断言全部通过，Failure: 0 | 是 | Pass |
| TaskScenario41 | entry 应用与 entry_test HAP 已安装 | 执行 `Task/TaskScenario41.test.ets` 的 28 条用例（覆盖：Task 20、Group 4、Sendable 2、Copy 2） | 28 条用例断言全部通过，Failure: 0 | 是 | Pass |
| TaskScenario54 | entry 应用与 entry_test HAP 已安装 | 执行 `Task/TaskScenario54.test.ets` 的 38 条用例（覆盖：Task 28、Group 5、Sendable 3、Copy 2） | 38 条用例断言全部通过，Failure: 0 | 是 | Pass |
| TaskScenario67 | entry 应用与 entry_test HAP 已安装 | 执行 `Task/TaskScenario67.test.ets` 的 24 条用例（覆盖：Task 18、Group 3、Sendable 2、Copy 1） | 24 条用例断言全部通过，Failure: 0 | 是 | Pass |

### Function（任务函数，6 个套件，177 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| FunctionScenario03 | entry 应用与 entry_test HAP 已安装 | 执行 `Function/FunctionScenario03.test.ets` 的 24 条用例（覆盖：Function 18、Group 3、Sendable 2、Copy 1） | 24 条用例断言全部通过，Failure: 0 | 是 | Pass |
| FunctionScenario16 | entry 应用与 entry_test HAP 已安装 | 执行 `Function/FunctionScenario16.test.ets` 的 32 条用例（覆盖：Function 24、Group 4、Copy 2、Sendable 2） | 32 条用例断言全部通过，Failure: 0 | 是 | Pass |
| FunctionScenario29 | entry 应用与 entry_test HAP 已安装 | 执行 `Function/FunctionScenario29.test.ets` 的 37 条用例（覆盖：Function 27、Group 5、Sendable 3、Copy 2） | 37 条用例断言全部通过，Failure: 0 | 是 | Pass |
| FunctionScenario42 | entry 应用与 entry_test HAP 已安装 | 执行 `Function/FunctionScenario42.test.ets` 的 24 条用例（覆盖：Function 18、Group 3、Sendable 2、Copy 1） | 24 条用例断言全部通过，Failure: 0 | 是 | Pass |
| FunctionScenario55 | entry 应用与 entry_test HAP 已安装 | 执行 `Function/FunctionScenario55.test.ets` 的 36 条用例（覆盖：Function 26、Group 5、Sendable 3、Copy 2） | 36 条用例断言全部通过，Failure: 0 | 是 | Pass |
| FunctionScenario68 | entry 应用与 entry_test HAP 已安装 | 执行 `Function/FunctionScenario68.test.ets` 的 24 条用例（覆盖：Function 18、Group 3、Sendable 2、Copy 1） | 24 条用例断言全部通过，Failure: 0 | 是 | Pass |

### Group（TaskGroup 任务组，6 个套件，175 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| GroupScenario04 | entry 应用与 entry_test HAP 已安装 | 执行 `Group/GroupScenario04.test.ets` 的 24 条用例（覆盖：Group 21、Sendable 2、Copy 1） | 24 条用例断言全部通过，Failure: 0 | 是 | Pass |
| GroupScenario17 | entry 应用与 entry_test HAP 已安装 | 执行 `Group/GroupScenario17.test.ets` 的 30 条用例（覆盖：Group 26、Copy 2、Sendable 2） | 30 条用例断言全部通过，Failure: 0 | 是 | Pass |
| GroupScenario30 | entry 应用与 entry_test HAP 已安装 | 执行 `Group/GroupScenario30.test.ets` 的 25 条用例（覆盖：Group 22、Sendable 2、Copy 1） | 25 条用例断言全部通过，Failure: 0 | 是 | Pass |
| GroupScenario43 | entry 应用与 entry_test HAP 已安装 | 执行 `Group/GroupScenario43.test.ets` 的 24 条用例（覆盖：Group 21、Sendable 2、Copy 1） | 24 条用例断言全部通过，Failure: 0 | 是 | Pass |
| GroupScenario56 | entry 应用与 entry_test HAP 已安装 | 执行 `Group/GroupScenario56.test.ets` 的 25 条用例（覆盖：Group 22、Sendable 2、Copy 1） | 25 条用例断言全部通过，Failure: 0 | 是 | Pass |
| GroupScenario69 | entry 应用与 entry_test HAP 已安装 | 执行 `Group/GroupScenario69.test.ets` 的 47 条用例（覆盖：Group 40、Sendable 4、Copy 3） | 47 条用例断言全部通过，Failure: 0 | 是 | Pass |

### Sendable（Sendable 对象传递，6 个套件，137 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| SendableScenario05 | entry 应用与 entry_test HAP 已安装 | 执行 `Sendable/SendableScenario05.test.ets` 的 20 条用例（覆盖：Sendable 17、Group 2、Copy 1） | 20 条用例断言全部通过，Failure: 0 | 是 | Pass |
| SendableScenario18 | entry 应用与 entry_test HAP 已安装 | 执行 `Sendable/SendableScenario18.test.ets` 的 36 条用例（覆盖：Sendable 29、Group 5、Copy 2） | 36 条用例断言全部通过，Failure: 0 | 是 | Pass |
| SendableScenario31 | entry 应用与 entry_test HAP 已安装 | 执行 `Sendable/SendableScenario31.test.ets` 的 20 条用例（覆盖：Sendable 17、Group 2、Copy 1） | 20 条用例断言全部通过，Failure: 0 | 是 | Pass |
| SendableScenario44 | entry 应用与 entry_test HAP 已安装 | 执行 `Sendable/SendableScenario44.test.ets` 的 20 条用例（覆盖：Sendable 17、Group 2、Copy 1） | 20 条用例断言全部通过，Failure: 0 | 是 | Pass |
| SendableScenario57 | entry 应用与 entry_test HAP 已安装 | 执行 `Sendable/SendableScenario57.test.ets` 的 20 条用例（覆盖：Sendable 17、Group 2、Copy 1） | 20 条用例断言全部通过，Failure: 0 | 是 | Pass |
| SendableScenario70 | entry 应用与 entry_test HAP 已安装 | 执行 `Sendable/SendableScenario70.test.ets` 的 21 条用例（覆盖：Sendable 17、Group 3、Copy 1） | 21 条用例断言全部通过，Failure: 0 | 是 | Pass |

### Count（计数与结果校验，6 个套件，179 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| CountScenario06 | entry 应用与 entry_test HAP 已安装 | 执行 `Count/CountScenario06.test.ets` 的 25 条用例（覆盖：Count 19、Group 3、Sendable 2、Copy 1） | 25 条用例断言全部通过，Failure: 0 | 是 | Pass |
| CountScenario19 | entry 应用与 entry_test HAP 已安装 | 执行 `Count/CountScenario19.test.ets` 的 25 条用例（覆盖：Count 19、Group 3、Sendable 2、Copy 1） | 25 条用例断言全部通过，Failure: 0 | 是 | Pass |
| CountScenario32 | entry 应用与 entry_test HAP 已安装 | 执行 `Count/CountScenario32.test.ets` 的 25 条用例（覆盖：Count 19、Group 3、Sendable 2、Copy 1） | 25 条用例断言全部通过，Failure: 0 | 是 | Pass |
| CountScenario45 | entry 应用与 entry_test HAP 已安装 | 执行 `Count/CountScenario45.test.ets` 的 25 条用例（覆盖：Count 19、Group 3、Sendable 2、Copy 1） | 25 条用例断言全部通过，Failure: 0 | 是 | Pass |
| CountScenario58 | entry 应用与 entry_test HAP 已安装 | 执行 `Count/CountScenario58.test.ets` 的 34 条用例（覆盖：Count 25、Group 4、Sendable 3、Copy 2） | 34 条用例断言全部通过，Failure: 0 | 是 | Pass |
| CountScenario71 | entry 应用与 entry_test HAP 已安装 | 执行 `Count/CountScenario71.test.ets` 的 45 条用例（覆盖：Count 32、Group 6、Sendable 4、Copy 3） | 45 条用例断言全部通过，Failure: 0 | 是 | Pass |

### Encoding（UTF-8 编解码，6 个套件，146 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| EncodingScenario07 | entry 应用与 entry_test HAP 已安装 | 执行 `Encoding/EncodingScenario07.test.ets` 的 22 条用例（覆盖：Encoding 16、Group 3、Sendable 2、Copy 1） | 22 条用例断言全部通过，Failure: 0 | 是 | Pass |
| EncodingScenario20 | entry 应用与 entry_test HAP 已安装 | 执行 `Encoding/EncodingScenario20.test.ets` 的 29 条用例（覆盖：Encoding 21、Group 4、Sendable 2、Copy 2） | 29 条用例断言全部通过，Failure: 0 | 是 | Pass |
| EncodingScenario33 | entry 应用与 entry_test HAP 已安装 | 执行 `Encoding/EncodingScenario33.test.ets` 的 22 条用例（覆盖：Encoding 16、Group 3、Sendable 2、Copy 1） | 22 条用例断言全部通过，Failure: 0 | 是 | Pass |
| EncodingScenario46 | entry 应用与 entry_test HAP 已安装 | 执行 `Encoding/EncodingScenario46.test.ets` 的 22 条用例（覆盖：Encoding 16、Group 3、Sendable 2、Copy 1） | 22 条用例断言全部通过，Failure: 0 | 是 | Pass |
| EncodingScenario59 | entry 应用与 entry_test HAP 已安装 | 执行 `Encoding/EncodingScenario59.test.ets` 的 29 条用例（覆盖：Encoding 21、Group 4、Sendable 2、Copy 2） | 29 条用例断言全部通过，Failure: 0 | 是 | Pass |
| EncodingScenario72 | entry 应用与 entry_test HAP 已安装 | 执行 `Encoding/EncodingScenario72.test.ets` 的 22 条用例（覆盖：Encoding 16、Group 3、Sendable 2、Copy 1） | 22 条用例断言全部通过，Failure: 0 | 是 | Pass |

### LegacyEncoding（传统编码与转义，6 个套件，174 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| LegacyEncodingScenario08 | entry 应用与 entry_test HAP 已安装 | 执行 `LegacyEncoding/LegacyEncodingScenario08.test.ets` 的 26 条用例（覆盖：LegacyEncoding 19、Group 3、Copy 2、Sendable 2） | 26 条用例断言全部通过，Failure: 0 | 是 | Pass |
| LegacyEncodingScenario21 | entry 应用与 entry_test HAP 已安装 | 执行 `LegacyEncoding/LegacyEncodingScenario21.test.ets` 的 26 条用例（覆盖：LegacyEncoding 19、Group 3、Copy 2、Sendable 2） | 26 条用例断言全部通过，Failure: 0 | 是 | Pass |
| LegacyEncodingScenario34 | entry 应用与 entry_test HAP 已安装 | 执行 `LegacyEncoding/LegacyEncodingScenario34.test.ets` 的 26 条用例（覆盖：LegacyEncoding 19、Group 3、Sendable 2、Copy 2） | 26 条用例断言全部通过，Failure: 0 | 是 | Pass |
| LegacyEncodingScenario47 | entry 应用与 entry_test HAP 已安装 | 执行 `LegacyEncoding/LegacyEncodingScenario47.test.ets` 的 26 条用例（覆盖：LegacyEncoding 19、Group 3、Copy 2、Sendable 2） | 26 条用例断言全部通过，Failure: 0 | 是 | Pass |
| LegacyEncodingScenario60 | entry 应用与 entry_test HAP 已安装 | 执行 `LegacyEncoding/LegacyEncodingScenario60.test.ets` 的 26 条用例（覆盖：LegacyEncoding 19、Group 3、Copy 2、Sendable 2） | 26 条用例断言全部通过，Failure: 0 | 是 | Pass |
| LegacyEncodingScenario73 | entry 应用与 entry_test HAP 已安装 | 执行 `LegacyEncoding/LegacyEncodingScenario73.test.ets` 的 44 条用例（覆盖：LegacyEncoding 31、Group 6、Sendable 4、Copy 3） | 44 条用例断言全部通过，Failure: 0 | 是 | Pass |

### UiWorker（UI 与 Worker 联动，6 个套件，220 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| UiWorkerScenario09 | entry 应用与 entry_test HAP 已安装 | 执行 `UiWorker/UiWorkerScenario09.test.ets` 的 30 条用例（覆盖：UiWorker 22、Group 4、Sendable 2、Copy 2） | 30 条用例断言全部通过，Failure: 0 | 是 | Pass |
| UiWorkerScenario22 | entry 应用与 entry_test HAP 已安装 | 执行 `UiWorker/UiWorkerScenario22.test.ets` 的 41 条用例（覆盖：UiWorker 30、Group 5、Sendable 3、Copy 3） | 41 条用例断言全部通过，Failure: 0 | 是 | Pass |
| UiWorkerScenario35 | entry 应用与 entry_test HAP 已安装 | 执行 `UiWorker/UiWorkerScenario35.test.ets` 的 37 条用例（覆盖：UiWorker 27、Group 5、Sendable 3、Copy 2） | 37 条用例断言全部通过，Failure: 0 | 是 | Pass |
| UiWorkerScenario48 | entry 应用与 entry_test HAP 已安装 | 执行 `UiWorker/UiWorkerScenario48.test.ets` 的 30 条用例（覆盖：UiWorker 22、Group 4、Sendable 2、Copy 2） | 30 条用例断言全部通过，Failure: 0 | 是 | Pass |
| UiWorkerScenario61 | entry 应用与 entry_test HAP 已安装 | 执行 `UiWorker/UiWorkerScenario61.test.ets` 的 30 条用例（覆盖：UiWorker 22、Group 4、Copy 2、Sendable 2） | 30 条用例断言全部通过，Failure: 0 | 是 | Pass |
| UiWorkerScenario74 | entry 应用与 entry_test HAP 已安装 | 执行 `UiWorker/UiWorkerScenario74.test.ets` 的 52 条用例（覆盖：UiWorker 37、Group 7、Sendable 4、Copy 4） | 52 条用例断言全部通过，Failure: 0 | 是 | Pass |

### UiTask（UI 与 TaskPool 联动，6 个套件，186 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| UiTaskScenario10 | entry 应用与 entry_test HAP 已安装 | 执行 `UiTask/UiTaskScenario10.test.ets` 的 33 条用例（覆盖：UiTask 24、Group 4、Sendable 3、Copy 2） | 33 条用例断言全部通过，Failure: 0 | 是 | Pass |
| UiTaskScenario23 | entry 应用与 entry_test HAP 已安装 | 执行 `UiTask/UiTaskScenario23.test.ets` 的 33 条用例（覆盖：UiTask 24、Group 4、Sendable 3、Copy 2） | 33 条用例断言全部通过，Failure: 0 | 是 | Pass |
| UiTaskScenario36 | entry 应用与 entry_test HAP 已安装 | 执行 `UiTask/UiTaskScenario36.test.ets` 的 30 条用例（覆盖：UiTask 22、Group 4、Copy 2、Sendable 2） | 30 条用例断言全部通过，Failure: 0 | 是 | Pass |
| UiTaskScenario49 | entry 应用与 entry_test HAP 已安装 | 执行 `UiTask/UiTaskScenario49.test.ets` 的 30 条用例（覆盖：UiTask 22、Group 4、Copy 2、Sendable 2） | 30 条用例断言全部通过，Failure: 0 | 是 | Pass |
| UiTaskScenario62 | entry 应用与 entry_test HAP 已安装 | 执行 `UiTask/UiTaskScenario62.test.ets` 的 30 条用例（覆盖：UiTask 22、Group 4、Copy 2、Sendable 2） | 30 条用例断言全部通过，Failure: 0 | 是 | Pass |
| UiTaskScenario75 | entry 应用与 entry_test HAP 已安装 | 执行 `UiTask/UiTaskScenario75.test.ets` 的 30 条用例（覆盖：UiTask 22、Group 4、Sendable 2、Copy 2） | 30 条用例断言全部通过，Failure: 0 | 是 | Pass |

### UiFunction（UI 功能，6 个套件，231 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| UiFunctionScenario11 | entry 应用与 entry_test HAP 已安装 | 执行 `UiFunction/UiFunctionScenario11.test.ets` 的 41 条用例（覆盖：UiFunction 30、Group 5、Sendable 3、Copy 3） | 41 条用例断言全部通过，Failure: 0 | 是 | Pass |
| UiFunctionScenario24 | entry 应用与 entry_test HAP 已安装 | 执行 `UiFunction/UiFunctionScenario24.test.ets` 的 30 条用例（覆盖：UiFunction 22、Group 4、Sendable 2、Copy 2） | 30 条用例断言全部通过，Failure: 0 | 是 | Pass |
| UiFunctionScenario37 | entry 应用与 entry_test HAP 已安装 | 执行 `UiFunction/UiFunctionScenario37.test.ets` 的 30 条用例（覆盖：UiFunction 22、Group 4、Sendable 2、Copy 2） | 30 条用例断言全部通过，Failure: 0 | 是 | Pass |
| UiFunctionScenario50 | entry 应用与 entry_test HAP 已安装 | 执行 `UiFunction/UiFunctionScenario50.test.ets` 的 30 条用例（覆盖：UiFunction 22、Group 4、Sendable 2、Copy 2） | 30 条用例断言全部通过，Failure: 0 | 是 | Pass |
| UiFunctionScenario63 | entry 应用与 entry_test HAP 已安装 | 执行 `UiFunction/UiFunctionScenario63.test.ets` 的 40 条用例（覆盖：UiFunction 29、Group 5、Copy 3、Sendable 3） | 40 条用例断言全部通过，Failure: 0 | 是 | Pass |
| UiFunctionScenario76 | entry 应用与 entry_test HAP 已安装 | 执行 `UiFunction/UiFunctionScenario76.test.ets` 的 60 条用例（覆盖：UiFunction 43、Group 8、Sendable 5、Copy 4） | 60 条用例断言全部通过，Failure: 0 | 是 | Pass |

### Copy（文件拷贝，6 个套件，152 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| CopyScenario12 | entry 应用与 entry_test HAP 已安装 | 执行 `Copy/CopyScenario12.test.ets` 的 27 条用例（覆盖：Copy 22、Group 3、Sendable 2） | 27 条用例断言全部通过，Failure: 0 | 是 | Pass |
| CopyScenario25 | entry 应用与 entry_test HAP 已安装 | 执行 `Copy/CopyScenario25.test.ets` 的 21 条用例（覆盖：Copy 17、Group 3、Sendable 1） | 21 条用例断言全部通过，Failure: 0 | 是 | Pass |
| CopyScenario38 | entry 应用与 entry_test HAP 已安装 | 执行 `Copy/CopyScenario38.test.ets` 的 21 条用例（覆盖：Copy 17、Group 3、Sendable 1） | 21 条用例断言全部通过，Failure: 0 | 是 | Pass |
| CopyScenario51 | entry 应用与 entry_test HAP 已安装 | 执行 `Copy/CopyScenario51.test.ets` 的 30 条用例（覆盖：Copy 24、Group 4、Sendable 2） | 30 条用例断言全部通过，Failure: 0 | 是 | Pass |
| CopyScenario64 | entry 应用与 entry_test HAP 已安装 | 执行 `Copy/CopyScenario64.test.ets` 的 27 条用例（覆盖：Copy 22、Group 3、Sendable 2） | 27 条用例断言全部通过，Failure: 0 | 是 | Pass |
| CopyScenario77 | entry 应用与 entry_test HAP 已安装 | 执行 `Copy/CopyScenario77.test.ets` 的 26 条用例（覆盖：Copy 21、Group 3、Sendable 2） | 26 条用例断言全部通过，Failure: 0 | 是 | Pass |

### MyFile（文件列表与文件操作，6 个套件，157 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| MyFileScenario13 | entry 应用与 entry_test HAP 已安装 | 执行 `MyFile/MyFileScenario13.test.ets` 的 22 条用例（覆盖：MyFile 16、Group 3、Sendable 2、Copy 1） | 22 条用例断言全部通过，Failure: 0 | 是 | Pass |
| MyFileScenario26 | entry 应用与 entry_test HAP 已安装 | 执行 `MyFile/MyFileScenario26.test.ets` 的 22 条用例（覆盖：MyFile 16、Group 3、Sendable 2、Copy 1） | 22 条用例断言全部通过，Failure: 0 | 是 | Pass |
| MyFileScenario39 | entry 应用与 entry_test HAP 已安装 | 执行 `MyFile/MyFileScenario39.test.ets` 的 22 条用例（覆盖：MyFile 16、Group 3、Sendable 2、Copy 1） | 22 条用例断言全部通过，Failure: 0 | 是 | Pass |
| MyFileScenario52 | entry 应用与 entry_test HAP 已安装 | 执行 `MyFile/MyFileScenario52.test.ets` 的 31 条用例（覆盖：MyFile 23、Group 4、Copy 2、Sendable 2） | 31 条用例断言全部通过，Failure: 0 | 是 | Pass |
| MyFileScenario65 | entry 应用与 entry_test HAP 已安装 | 执行 `MyFile/MyFileScenario65.test.ets` 的 22 条用例（覆盖：MyFile 16、Group 3、Sendable 2、Copy 1） | 22 条用例断言全部通过，Failure: 0 | 是 | Pass |
| MyFileScenario78 | entry 应用与 entry_test HAP 已安装 | 执行 `MyFile/MyFileScenario78.test.ets` 的 38 条用例（覆盖：MyFile 28、Group 5、Sendable 3、Copy 2） | 38 条用例断言全部通过，Failure: 0 | 是 | Pass |

## 测试执行说明

使用 OpenHarmony Ability Assistant（`aa`，系统自带测试命令）执行全量自动化测试：

```sh
# aa = OpenHarmony Ability Assistant
hdc shell aa test -b com.samples.concurrentmodule -m entry_test -s unittest /ets/testrunner/OpenHarmonyTestRunner -s timeout 60000
```

- 设备：OpenHarmony API 23（ArkTS 1.1）。
- 汇总：`Tests run: 2322, Failure: 0, Error: 0, Pass: 2322, Ignore: 0`。
- 全量耗时约 4099959 ms（约 68 分 20 秒）；单用例超时 60000 ms。

## 已知问题

- 全量执行无失败、无错误、无忽略用例。
- `Ability.test.ets` 未在 `List.test.ets` 中注册，因此不参与自动化执行，也不计入 2322 条用例。
- 本结果覆盖已注册的自动化用例，不覆盖未编写的生产路径（例如 MyFile 并发覆盖拷贝等组合场景）。

## 测试覆盖总结

- 已覆盖 80 个场景套件、2322 条自动化用例，覆盖 Worker、TaskPool、TaskGroup、Sendable、文件拷贝、文件列表、编码/解码与 UI 联动等并发场景。
- 每个场景套件包含多组输入、状态与异常路径断言，执行结果均为 Pass。
- 手工回归仍建议保留拉起应用、选择文件、文件拷贝与 Worker/TaskPool/TaskGroup/SendableClass 的目视检查，以补充自动化无法验证的视觉效果与真实文件内容。
