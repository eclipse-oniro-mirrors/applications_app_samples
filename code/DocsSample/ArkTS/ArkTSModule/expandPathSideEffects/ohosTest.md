# ArkTS 按路径导入与模块副作用 测试设计

## 一、设计原则

1. **只测真实实现**：所有用例直接 `import` `servicemanagerhar` 的真实模块（`ServiceManager` / `OpServiceManager` / 入口 `Index`），不在测试内复抄常量或校验器。
2. **断言可失败**：断言只针对可观测事实——`inited` 状态迁移、模块单例引用相等性、方法引用/元数、`print()` 是否抛异常、UI 文本与组件 id。
3. **初始状态可复现**：用「模块加载时快照」常量记录初始状态；entry 侧不导入 HAR 入口，避免入口副作用提前初始化 `ServiceManager`；入口副作用放到 `serviceManagerHar` 自己的 ohosTest 中验证。
4. **维度而非单功能**：逻辑、契约、隔离、身份、稳定性、性能、UI 分套件，每个维度用矩阵/循环扩用例，但不做模板镜像复制。

## 二、被测对象

| 对象 | 路径 | 关键行为 |
|---|---|---|
| `ServiceManager` | `servicemanagerhar/src/main/ets/ServiceManager.ets` | 导出单例，`inited=false`；`init()` 置 true；`print()` 分支输出 |
| `OpServiceManager` | `servicemanagerhar/src/main/ets/OpServiceManager.ets` | 导出单例并在**文件内部**调用 `init()` |
| HAR 入口 | `servicemanagerhar/Index.ets` | 导入 `ServiceManager` 并调用 `init()` 后 re-export（入口副作用） |
| 首页 | `entry/src/main/ets/pages/Index.ets` | 按路径导入 `OpServiceManager`；`Hello World` ↔ `Welcome` 文本切换 |

## 三、覆盖维度

| 维度 | 说明 |
|---|---|
| 模块副作用 | 入口导入 vs 按路径导入的初始化差异 |
| 状态机 | `inited` 的 false→true、幂等、print 不改变状态 |
| 单例隔离 | 两个模块各自导出独立单例 |
| 身份/缓存 | 同 specifier 重复导入同一实例；入口与路径实例一致 |
| API 契约 | 方法存在性、参数个数、方法引用同一性 |
| 稳定性 | 多轮 init/print 循环状态不回退 |
| 性能 | 批量 init/print 的宽松时间预算 |
| UI 交互 | 启动/置顶、文本切换、id 定位、未知文本/未知 id 的缺失断言、重启保持 |

## 四、套件职责（entry）

| 套件 | 用例 | 维度 | 说明 |
|---|---:|---|---|
| `ServiceManagerPathTest` | 9 | 副作用/状态机 | 路径导入未初始化；init 置位、幂等；print 不触发 init |
| `OpServiceManagerPathTest` | 5 | 副作用/状态机 | 文件内 init 生效；实时态与快照一致；幂等 |
| `ImportIsolationTest` | 6 | 隔离/缓存 | 两实例不相等；同 specifier 同一实例；加载快照 false/true 对照 |
| `ApiContractTest` | 8 | API 契约 | init/print 为函数、无参、同模块方法引用相同、跨模块不同 |
| `StabilityLoopTest` | 4 | 稳定性 | 20/50 轮 init/print 与交替调用状态不回退 |
| `PerfBudgetTest` | 4 | 性能 | 10k init、200 print 宽松上界；均值 <1ms；批量后状态保持 |
| `ActsAbilityTest` | 8 | UI 交互 | 启动/置顶、初始文本、组件 id、点击切换、精确文本、旧文本消失、二次点击 |
| `UiStateMatrixTest` | 5 | UI 状态 | 未知文本/未知 id 不存在、id 文本值、重启保持 Welcome、重启后置顶 |
| `StateTransitionTest` | 11 | 状态机 | false/true 两前置态 × init/print 序列矩阵；手动复位后 init 恢复；重复复位-初始化循环 |
| `OpStateParityTest` | 4 | 行为一致性 | 两份 ServiceManager 类副本在相同操作下状态迁移一致；两实例状态互不影响 |
| `StateSequenceMatrixPart01..15` | 1020 | 状态序列枚举 | 2 前置态 × `init/print` 长度 1–8 全序列（PR 11995 风格），逐条显式 `@tc` 与期望状态 |
| `PerfThroughputTest` | 3 | 吞吐 | 50k/100k init 上界；混合流量后状态保持 |
| `StabilityExtendedTest` | 3 | 稳定性（扩展） | 200 轮交替调用、100 轮 init/print、负载下实例隔离 |
| `PerfScalingTest` | 3 | 性能（规模） | 1k/5k/20k init 的宽松上界与状态保持 |

## 五、套件职责（serviceManagerHar）

| 套件 | 用例 | 维度 | 说明 |
|---|---:|---|---|
| `HarEntrySideEffectTest` | 7 | 入口副作用/状态 | 入口导入执行 init；入口与路径同实例；重复导入缓存；幂等/print |
| `HarIdentityTest` | 9 | 身份矩阵 | 三来源（入口/ServiceManager/OpServiceManager）实例与方法引用相等性矩阵 |
| `HarStateMatrixTest` | 3 | 共享状态 | 入口复位后 init 恢复；入口与路径共享状态；Op 实例独立 |


## 六、充分性与边界

- **充分性**：已覆盖三种导入路径的全部可观测差异、两状态单例的状态迁移与幂等、模块缓存/身份、API 契约、稳定性与性能宽松预算、首页交互与状态保持。
- **已知边界**：`ServiceManager` 只有 `inited` 一个可观测字段且无 reset API，因此「状态复位矩阵」不可测；UI 用例依赖真机界面与语言，纯逻辑套件可在本机等价执行。
- **数量说明**：当前共 **1,112 条**用例（entry 1,093 + HAR 19），其中 **1,020 条**为 PR 11995 风格的公式化状态序列枚举（15 个 Part 文件，`2 前置态 × init/print 长度 1–8`）。该部分同构度较高、运行时间明显增加，建议按需分组执行；其余 92 条为真实维度用例。

## 七、手工用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 拉起应用 | 设备正常运行 | 启动 EntryAbility | 应用成功拉起，EntryAbility 为栈顶 | 否 | Pass |
| 首页文本切换 | 成功拉起应用 | 点击 "Hello World" | 文本切换为 "Welcome" | 否 | Pass |
| 按路径导入对比 | 成功拉起应用 | 分别进入 Index/opIndex/sideEffectIndex | 前两者输出已初始化，sideEffectIndex 输出未初始化 | 否 | Pass |
