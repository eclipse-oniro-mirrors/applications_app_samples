# ArkTS 按路径导入 HAR 测试用例归档

## 手工用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 拉起应用 | 设备正常运行 | | 成功拉起应用，主界面（EntryAbility）为当前栈顶能力 | 是 | Pass |
| 页面初始文本显示 | 成功拉起应用 | | 页面显示 "Hello World" 文本 | 是 | Pass |
| 点击文本切换 | 成功拉起应用 | 点击 "Hello World" 文本 | 文本切换为 "Welcome" | 是 | Pass |

## 自动化测试执行

- 测试模块：`entry_test`（ohosTest），`TestAbility` + `OpenHarmonyTestRunner`。
- 设备前置：解锁、无系统弹窗；main HAP 与 ohosTest HAP 均安装（DevEco 自动签名）。

## 套件总览

`List.test.ets` 共注册 **25 个套件、1,642 条用例、约 2.9 万行测试代码**。

### 基础与契约套件（5 套件 / 22 条）

| 套件 | 用例数 | 验证点 |
|---|---:|---|
| `ActsAbilityTest` | 3 | 应用拉起、页面初始文本、点击后文本切换 |
| `harExportContractTest` | 5 | 6 个导出均已定义；字符串值/类型/长度/字符码；导出名唯一；`MainPage` 两种导出 |
| `harAggregationContractTest` | 5 | 包入口与深路径 `NumberString`/`Utils`/`OtherModule1/3/4` 一致性 |
| `harBoundaryContractTest` | 6 | 非空/无空白；`Number`/`parseInt`；名称索引映射；字符串相等性 |
| `harStabilityContractTest` | 3 | 1000 次读取、1000 轮聚合、100 轮导出一致 |

### 批量专题套件（20 套件 / 1,620 条）

按 PR 12056 的写法，每个文件固定 **81 条显式用例**，文件内自定义 `it()` / `expect()` 包装器（统一 begin/end 与 `actual:` 日志）：

| 套件 | 验证点 |
|---|---|
| `harExportValueCore` / `harExportTypeCore` / `harExportShapeCore` / `harExportNameCore` | 导出值、类型、长度/字符码、名称映射 |
| `harAggregationPackageCore` / `harAggregationDeepCore` / `harAggregationChainCore` / `harAggregationValueCore` | 包入口、深路径、Utils 再导出链、聚合值 |
| `harStringBoundaryCore` / `harNumberBoundaryCore` / `harNameBoundaryCore` | 空白字符、数值转换、名称字符集 |
| `harConstantsCore` / `harConstantsBoundary` | 5 个字符串常量值与互等性 |
| `harStabilityReadCore` / `harStabilityAggregateCore` / `harImmutabilityCore` | 重复读取、聚合计数、引用相等性 |
| `harPerformanceReadCore` / `harPerformanceAggregateCore` | 1000 次读取/聚合耗时 < 5s |
| `harComponentCore` / `harComponentBoundaryCore` | `MainPage` 组件导出与名称映射 |

- 每条用例带 `@tc.number/@tc.name/@tc.desc` 元数据，逐条展开（非循环生成），引用真实的 `expandPathHar` 包入口与深路径导出。
- 所有用例使用 `hilog`（DOMAIN `0xF811`、TAG `[Sample_harXxxCore]`）输出 begin/end 日志。

## 验证记录

- 测试代码编译通过
- 真机运行需在 DevEco Studio 中打开工程并使用自动签名生成 signed HAP 后执行上述命令。
