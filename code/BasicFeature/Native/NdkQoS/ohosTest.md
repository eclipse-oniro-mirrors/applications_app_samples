# NdkQoS 测试用例归档

共 **23 个套件 / 340 条用例**，全部为 Hypium 自动化用例，源码位于 `entry/src/ohosTest/ets/test/`（23 个套件文件合计 10,779 行，另有只做注册的 `List.test.ets` 66 行）。

用例按基础层（三组）与页面层覆盖：

| 层 | 用例数 | 套件构成 |
|---|---|---|
| 基础层·契约与参数 | 92 | ArgTypes 24 + ResourceModel 22 + Invariant 16 + LevelArgs 16 + NapiContract 6 + Capability 5 + QosEffect 3 |
| 基础层·计算与系统 | 78 | Topology 20 + Concurrent 18 + Benchmark 14 + Summary 14 + Compare 12 |
| 基础层·记录文件 | 61 | RecordFile 26 + RecordParse 21 + RecordFileExt 14 |
| 页面层·页面与导航 | 109 | LevelPageUI 22 + BenchmarkPage 17 + ConcurrencyPage 16 + HistoryPage 15 + DevicePage 13 + QoSAbility 10 + Navigation 8 + Dialog 8 |

`@tc.size` 分布：SMALLTEST 106 / MEDIUMTEST 234；`@tc.level` 分布：LEVEL0 285 / LEVEL1 52 / LEVEL2 3。

## 用例文件与规模

| 套件文件 | 域名 | 用例数 | 行数 | `@tc.size` |
|---|---|---|---|---|
| `NdkQosArgTypes.test.ets` | ARGTYPE | 24 | 617 | MEDIUMTEST |
| `NdkQosResourceModel.test.ets` | RESMODEL | 22 | 564 | SMALLTEST |
| `NdkQosInvariant.test.ets` | INVARIANT | 16 | 430 | MEDIUMTEST |
| `NdkQosLevelArgs.test.ets` | ARGS | 16 | 376 | SMALLTEST |
| `NdkQosNapiContract.test.ets` | NAPI | 6 | 194 | SMALLTEST |
| `NdkQosCapability.test.ets` | CAPABILITY | 5 | 163 | SMALLTEST |
| `NdkQosQosEffect.test.ets` | EFFECT | 3 | 158 | SMALLTEST |
| `NdkQosTopology.test.ets` | TOPOLOGY | 20 | 483 | SMALLTEST |
| `NdkQosConcurrent.test.ets` | CONCURRENT | 18 | 421 | MEDIUMTEST |
| `NdkQosBenchmark.test.ets` | BENCH | 14 | 408 | MEDIUMTEST |
| `NdkQosSummary.test.ets` | SUMMARY | 14 | 364 | SMALLTEST 13 / MEDIUMTEST 1 |
| `NdkQosCompare.test.ets` | COMPARE | 12 | 311 | MEDIUMTEST |
| `NdkQosRecordFile.test.ets` | FILE | 26 | 613 | MEDIUMTEST |
| `NdkQosRecordParse.test.ets` | PARSE | 21 | 441 | SMALLTEST |
| `NdkQosRecordFileExt.test.ets` | FILEEXT | 14 | 395 | MEDIUMTEST |
| `NdkQosLevelPageUI.test.ets` | PAGE_LEVEL | 22 | 760 | MEDIUMTEST |
| `NdkQosBenchmarkPage.test.ets` | PAGE_BENCH | 17 | 731 | MEDIUMTEST |
| `NdkQosConcurrencyPage.test.ets` | PAGE_CONC | 16 | 692 | MEDIUMTEST |
| `NdkQosHistoryPage.test.ets` | PAGE_HISTORY | 15 | 692 | MEDIUMTEST |
| `NdkQosDevicePage.test.ets` | PAGE_DEVICE | 13 | 641 | MEDIUMTEST |
| `QoSAbility.test.ets` | ABILITY | 10 | 466 | MEDIUMTEST |
| `NdkQosNavigation.test.ets` | PAGE_NAV | 8 | 397 | MEDIUMTEST |
| `NdkQosDialog.test.ets` | DIALOG | 8 | 462 | MEDIUMTEST |
| **合计** | - | **340** | **10,779** | - |

> 基础层套件预置条件统一为「已安装测试 HAP，`libentry.so` 可加载」；页面层套件统一为「已安装测试 HAP，应用已启动并停在首页」。下表只写与单个用例相关的额外前置。
>
> 各套件用例表一例一行，行数与该套件用例数、上表逐行可核。

## ArgTypes 套件（`NdkQosArgTypes.test.ets`，24 条）

验证 19 个 NAPI 导出对非数值实参、缺参与多余参数的处理：同步接口以返回值 401 或 -1 报错，异步接口以 Promise reject 报错，且失败不污染已有状态。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 数值字符串等级 | - | `useQos('5')` | 返回 -1，不被强制转换为等级 5 | 是 | 通过 |
| 布尔等级 | - | `useQos(true)` | 返回 -1，运行信息不变 | 是 | 通过 |
| null 等级 | - | `useQos(null)` | 返回 -1，上一次成功的运行信息保持不变 | 是 | 通过 |
| 数组与普通对象等级 | - | `useQos([5])`、`useQos({ level: 5 })` | 返回 -1，不读取首元素或属性当作等级 | 是 | 通过 |
| 缺失等级实参 | - | `useQos()` | 返回 -1，不落到默认等级 | 是 | 通过 |
| 尾部多余实参 | - | `useQos(5, 'extra')` | 多余实参被忽略，仍按等级 5 执行并返回正耗时 | 是 | 通过 |
| 异步数值字符串等级 | - | `useQosAsync('5')` | reject，不调度任何 QoS 工作 | 是 | 通过 |
| 异步缺失等级 | - | `useQosAsync()` 后紧跟 `useQosAsync(0)` | 前者 reject，后者仍 resolve | 是 | 通过 |
| 基准轮次类型 | - | `runLevelBenchmarkAsync('3')` | reject，不产生任何轮次 | 是 | 通过 |
| 并发三参数类型 | - | `runConcurrentAsync('5',1,1)`、`(5,'1',1)`、`(5,1,'1')` | 三次都 reject，不启动工作线程 | 是 | 通过 |
| 并发缺失轮次 | - | `runConcurrentAsync(5,1)` | reject | 是 | 通过 |
| 对比缺失等级 | - | `compareLevels(5)` | `code=401`，`levelA/levelB/fasterLevel=-1` | 是 | 通过 |
| 对比字符串等级 | - | `compareLevels('0',5)`、`(0,'5')` | `code=401`，`durationA/ratio` 保持 -1 | 是 | 通过 |
| 记录写入非字符串目录 | - | `appendRunRecord(1024, …)` | `code=401`，`count=0`、`capacity` 未被改写 | 是 | 通过 |
| 记录写入字符串等级 | - | `appendRunRecord(dir, '5', …)` | `code=401`、`dropped=0`，文件无新增记录 | 是 | 通过 |
| 记录读取字符串 limit | - | `readRunRecords(dir, '10')` | `code=401`，`total/returned=0`，`records` 为空 | 是 | 通过 |
| 记录清空非字符串目录 | - | `clearRunRecords(null)` | `code=401`，`removed=0` | 是 | 通过 |
| 记录统计缺失目录 | - | `getRecordStats(2048)` | `code=401`、`total=0`、`avgDuration=-1`、`levelCounts` 长度 6 | 是 | 通过 |
| 单行解析非字符串 | - | `parseRunRecordLine` 传数字、布尔、`null` | 三次 `code=401`，六字段全为 -1 | 是 | 通过 |
| 单行解析合法行 | - | `'0,12.500,0,0,0,0'` | `code=0`，六个字段无损回读 | 是 | 通过 |
| 绑核字符串索引 | - | `bindCurrentThread('0')` | `code=401`、`cpu=-1`、`affinityCpus` 为空 | 是 | 通过 |
| 重置亲和多余参数 | - | `resetThreadAffinity(多余参数)` | 被接受，恢复全部在线核 | 是 | 通过 |
| 快捷入口多余参数 | - | `useHighQos(多余)`、`useLowQos(多余)` | 均返回合法耗时，不影响后续回读 | 是 | 通过 |
| 查询多余参数 | - | `getLevelRange(多余)`、`getCpuTopology(多余)` | 等级区间 0~5 共 6 档，拓扑数据自洽 | 是 | 通过 |

## ResourceModel 套件（`NdkQosResourceModel.test.ets`，22 条）

只 import `main/ets/model/QosLevelModel.ets`，验证 `buildQosLevelOptions()` 的结构、顺序、资源标识与不可变性。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 选项总量与类型 | - | 调用 `buildQosLevelOptions()` | 返回 6 项，每项均为 `QosLevelOption` 实例 | 是 | 通过 |
| 等级升序 | - | 同上 | `level` 依次为 0、1、2、3、4、5 | 是 | 通过 |
| 无缺口无重复 | - | 同上 | 相邻项差为 1，无重复等级 | 是 | 通过 |
| 首末项与区间一致 | - | 同上 + `getLevelRange()` | 首项等于 `minLevel`、末项等于 `maxLevel` | 是 | 通过 |
| 等级落在合法窗口 | - | 同上 | 每一项 `level` 都在 `[minLevel, maxLevel]` 内 | 是 | 通过 |
| 项数等于等级数 | - | 同上 | 数组长度等于 `levelCount`（6） | 是 | 通过 |
| 标签资源为正 | - | 同上 | 每项 `label` 都是资源对象且 id 大于 0 | 是 | 通过 |
| 六个标签互不相同 | - | 同上 | 6 个 label id 两两不同 | 是 | 通过 |
| 最低等级资源 | - | 同上 | 等级 0 指向 background 字符串资源 | 是 | 通过 |
| 最高等级资源 | - | 同上 | 等级 5 指向 user_interactive 字符串资源 | 是 | 通过 |
| default 与 utility 资源 | - | 同上 | 等级 2 指向 default、等级 1 指向 utility | 是 | 通过 |
| user_initiated 与 deadline 资源 | - | 同上 | 等级 3 指向 user_initiated、等级 4 指向 deadline | 是 | 通过 |
| 资源 id 落在应用窗口 | - | 同上 | 6 个 id 都在应用资源 id 区间内 | 是 | 通过 |
| 构建确定性（等级） | - | 连续两次构建 | 两次等级序列完全一致 | 是 | 通过 |
| 构建确定性（标签） | - | 同上 | 每个等级映射到的 label id 相同 | 是 | 通过 |
| 两次构建不共享元素 | - | 同上 | 两份数组的元素不是同一对象 | 是 | 通过 |
| 截断不污染下次构建 | - | 构建后截断第一次的数组，再构建一次 | 第二次仍返回完整 6 项 | 是 | 通过 |
| 重复构建不累积 | - | 连续三次构建 | 始终 6 项，等级序列不变 | 是 | 通过 |
| 构造函数保留入参 | - | 直接 `new QosLevelOption(3, label)` | `level` 与 `label` 原样保留 | 是 | 通过 |
| 同参实例隔离 | - | 用相同参数构造两个选项 | 两个不同对象但字段相等 | 是 | 通过 |
| 不同等级选项 | - | 构造两个不同等级的选项 | 各自保留自己的等级与对应标签 | 是 | 通过 |
| 模型驱动 native | - | 取最高等级选项的 `level` 交给 `useQos` | `getLastQosInfo().queryLevel` 等于该等级 | 是 | 通过 |

## Invariant 套件（`NdkQosInvariant.test.ets`，16 条）

跨接口互证：`getRunSummary` ↔ `runLevelBenchmarkAsync` ↔ `compareLevels` ↔ `runConcurrentAsync` ↔ 记录文件统计之间必须自洽。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 计数与分等级求和 | - | 混合执行 `useQos`、`useHighQos`、`compareLevels` 后读 summary | `runCount` 等于 `levelCounts` 之和 | 是 | 通过 |
| 清零后信息快照 | - | `resetRunSummary()` 后读 `getLastQosInfo()` | `runCount=0`、各分等级计数为 0，最近一次运行信息仍可读 | 是 | 通过 |
| 三轮基准计数 | - | `runLevelBenchmarkAsync(3)` | 共 18 次实验，每等级计数为 3，`totalRuns=18` | 是 | 通过 |
| 对比计数 | - | `compareLevels(a,b)` | 两个被比较等级各 +1 次，其它等级不变 | 是 | 通过 |
| 并发计数 | - | `runConcurrentAsync(默认等级,2,1)` | 仅该等级 +2 次 | 是 | 通过 |
| 基准明细自洽 | - | 一轮基准 | 每个样本 `successCount+failCount` 等于轮次，6 个样本之和等于 `totalRuns` | 是 | 通过 |
| 样本区间与哨兵 | - | 一轮基准 | 成功样本 `min ≤ avg ≤ max`；无成功样本时三值均为 -1 | 是 | 通过 |
| 耗时最短/最长等级 | - | 一轮基准 | `fastestLevel` 的平均耗时不大于 `slowestLevel` 的平均耗时 | 是 | 通过 |
| 全局区间包住均值 | - | 对比一次 + 单次运行后读 summary | `minDuration ≤ avgDuration ≤ maxDuration` | 是 | 通过 |
| 记录文件与计数互证 | - | 运行若干次并逐条写入记录 | 记录 `total` 等于 summary 的 `runCount`，分等级计数一致 | 是 | 通过 |
| 失败记录只进失败计数 | - | 写入一条 `setResult != 0` 的记录 | `failureCount` +1，`avg/min/maxDuration` 仍为 -1 | 是 | 通过 |
| 清零 summary 不动记录 | - | `resetRunSummary()` 后读记录 | 记录条数与分等级计数都不变 | 是 | 通过 |
| 清空记录不动 summary | - | `clearRunRecords(dir)` 后读 summary | `runCount`、`lastLevel` 与三个耗时都不变 | 是 | 通过 |
| 最近一次运行信息 | - | 对比一次后读 summary 与 `getLastQosInfo()` | `lastLevel` 与 `queryLevel` 都等于第二个被比较等级 | 是 | 通过 |
| 并发后的最近等级 | - | `runConcurrentAsync(3,2,1)` | `lastLevel=3`，记录/统计的等级同为 3 | 是 | 通过 |
| 只读幂等 | - | 连续两次 `getRunSummary()`（中间不运行） | 两次的 `runCount`、`lastLevel`、三个耗时字段完全相同 | 是 | 通过 |

## LevelArgs 套件（`NdkQosLevelArgs.test.ets`，16 条）

验证等级取值区间、哨兵值与非整数 / 越界等级的拒绝路径。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 区间查询 | - | `getLevelRange()` | `minLevel=0`、`maxLevel=5`、`levelCount=6` | 是 | 通过 |
| 哨兵值 | - | `getLevelRange()` | `invalidResult=-1`、`invalidDuration=-1` | 是 | 通过 |
| 最低等级执行 | - | `useQos(0)` | 返回正耗时，`queryLevel` 回读为 0 | 是 | 通过 |
| 最高等级执行 | - | `useQos(5)` | 返回正耗时，`queryLevel` 回读为 5 | 是 | 通过 |
| 小数等级拒绝 | - | `useQos(2.5)` | 返回 -1，上一次运行信息不变 | 是 | 通过 |
| NaN 等级拒绝 | - | `useQos(NaN)` | 返回 -1 | 是 | 通过 |
| 无穷等级拒绝 | - | `useQos(Infinity)` | 返回 -1 | 是 | 通过 |
| 高于上界拒绝 | - | `useQos(6)` | 返回 -1 | 是 | 通过 |
| 低于下界拒绝 | - | `useQos(-1)` | 返回 -1 | 是 | 通过 |
| 异步小数等级 | - | `useQosAsync(2.5)` | reject | 是 | 通过 |
| 异步 NaN 等级 | - | `useQosAsync(NaN)` | reject | 是 | 通过 |
| 异步越界后恢复 | - | `useQosAsync(6)` 后紧跟 `useQosAsync(0)` | 前者 reject，后者仍 resolve | 是 | 通过 |
| 运行信息随等级变化 | - | 依次执行 0~5 | 每次 `queryLevel` 与 `setResult` 跟随当次等级 | 是 | 通过 |
| 快捷入口语义 | - | `useHighQos()`、`useLowQos()` | 分别等价于等级 5 与等级 0，回读等级对应 | 是 | 通过 |
| 拒绝不改写历史 | - | 先成功执行一次，再执行非法等级 | 失败后 `getLastQosInfo()` 仍为上一次成功的等级与耗时 | 是 | 通过 |
| 各等级结果码 | - | 逐个执行 0~5 后读 `getLastQosInfo()` | `resetResult` 与 `bindResult` 始终为 0 | 是 | 通过 |

## NapiContract / Capability / QosEffect 套件（6 + 5 + 3，14 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| `useHighQos` 契约 | - | 调用一次 | 返回正有限数、非 NaN，`toString()` 可回读为同一数值 | 是 | 通过 |
| `useLowQos` 契约 | - | 调用一次 | 同上 | 是 | 通过 |
| 连续两次高 QoS | - | 连续调用 `useHighQos()` 两次 | 两次都返回合法时长 | 是 | 通过 |
| 连续两次低 QoS | - | 连续调用 `useLowQos()` 两次 | 两次都返回合法时长 | 是 | 通过 |
| 高低交替调用 | - | `useHighQos()`、`useLowQos()`、`useHighQos()` 交替 | 每次调用都返回合法时长，无累积异常 | 是 | 通过 |
| 导出入口可调用 | - | 遍历 `useHighQos`、`useLowQos` 并实调 | 两个入口都可调用并返回合法时长 | 是 | 通过 |
| 等级回读 | - | `useQos(2)` 后读 `getLastQosInfo()` | `queryLevel=2`、`duration` 为正 | 是 | 通过 |
| 越界等级不调度 | - | `useQos(6)`、`useQos(-1)` | 返回 -1，不产生运行信息 | 是 | 通过 |
| 异步与信息一致 | - | `useQosAsync(3)` 的 resolve 值与 `getLastQosInfo().duration` | 两者相等 | 是 | 通过 |
| 异步拒绝后恢复 | - | `useQosAsync(9)` 后紧跟 `useQosAsync(0)` | 前者 reject，后者 resolve | 是 | 通过 |
| 边界等级 | - | 依次 `useQos(0)`、`useQos(5)` | 都完成，`queryLevel` 回读为最后一次的 5 | 是 | 通过 |
| 高 QoS 采样稳定性 | - | 连续三次 `useHighQos()` | 三次都合法，极差不超过 10 倍 | 是 | 通过 |
| 低 QoS 采样稳定性 | - | 连续三次 `useLowQos()` | 同上 | 是 | 通过 |
| 高低相对关系 | - | 高、低各采样三次 | 高 QoS 最小耗时不超过低 QoS 最小耗时的 1.5 倍 | 是 | 通过 |

## Benchmark 套件（`NdkQosBenchmark.test.ets`，14 条）

验证 `runLevelBenchmarkAsync(rounds)` 的明细结构、聚合口径与轮次边界。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 单轮明细结构 | - | `runLevelBenchmarkAsync(1)` | 6 个样本按等级升序，`rounds=1`、`totalRuns=6` | 是 | 通过 |
| 每样本尝试次数 | - | 同上 | 每个样本 `successCount+failCount` 等于 1 | 是 | 通过 |
| 成功样本耗时与失败哨兵 | - | 同上 | 成功样本 `avgDuration>0`；无成功样本时 `avg/min/max` 均为 -1 | 是 | 通过 |
| 耗时最短与最长等级 | - | 同上 | 两者都来自 6 个样本，且 `fastestLevel` 的平均耗时不大于 `slowestLevel` | 是 | 通过 |
| 样本内区间有序 | - | 同上 | 成功样本 `minDuration ≤ avgDuration ≤ maxDuration` | 是 | 通过 |
| 结果码回写 | - | 同上 | 每个样本记录最后一次的 `setResult/queryLevel/resetResult/bindResult`，`queryLevel` 等于该样本等级 | 是 | 通过 |
| 两轮翻倍 | - | `runLevelBenchmarkAsync(2)` | 每样本尝试次数为 2，`totalRuns=12` | 是 | 通过 |
| 轮次上限 | - | `runLevelBenchmarkAsync(3)` | 接受，每等级 3 次，`totalRuns=18` | 是 | 通过 |
| 轮次为 0 | - | `runLevelBenchmarkAsync(0)` | reject，未开始计算 | 是 | 通过 |
| 轮次超上限 | - | `runLevelBenchmarkAsync(4)` | reject | 是 | 通过 |
| 小数轮次 | - | `runLevelBenchmarkAsync(1.5)` | reject | 是 | 通过 |
| 计入累计统计 | - | 清零 summary 后跑一轮 | `runCount` 增加 6 | 是 | 通过 |
| 分等级计数 | - | 同上 | 6 个等级各记 1 次 | 是 | 通过 |
| 最近一次运行信息 | - | 一轮基准后读 `getLastQosInfo()` | `queryLevel` 等于最高等级 5 | 是 | 通过 |

## Concurrent 套件（`NdkQosConcurrent.test.ets`，18 条）

验证 `runConcurrentAsync(level, threads, rounds)` 的线程/轮次语义、尝试次数守恒与参数拒绝。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 单线程单轮 | - | `runConcurrentAsync(5,1,1)` | `code=0`、`level=5`、`threads=1`、`rounds=1`，尝试次数 1 | 是 | 通过 |
| 参数回显 | - | `runConcurrentAsync(3,3,2)` | `level/threads/rounds` 原样回显，尝试次数 6 | 是 | 通过 |
| 两线程 | - | `runConcurrentAsync(0,2,1)` | 尝试次数 2 | 是 | 通过 |
| 四线程 | - | `runConcurrentAsync(2,4,1)` | `threads=4`，尝试次数 4 | 是 | 通过 |
| 线程上限 | - | `runConcurrentAsync(5,8,1)` | 接受，`threads=8`，尝试次数 8 | 是 | 通过 |
| 轮次上限 | - | `runConcurrentAsync(1,1,5)` | 接受，尝试次数 5 | 是 | 通过 |
| 平均耗时区间 | - | `runConcurrentAsync(5,4,2)` | 有成功样本时 `min ≤ avg ≤ max`；全失败时三值为 -1 | 是 | 通过 |
| 多线程区间 | - | `runConcurrentAsync` 多线程配置 | `minDuration ≤ maxDuration` 始终成立 | 是 | 通过 |
| 全等级可驱动 | - | 依次用 0~5 各跑一次 | 每次 `code=0` 且回显对应等级 | 是 | 通过 |
| 等级越上界 | - | `runConcurrentAsync(6,1,1)` | reject，未启动线程 | 是 | 通过 |
| 等级为负 | - | `runConcurrentAsync(-1,1,1)` | reject，未启动线程 | 是 | 通过 |
| 线程为 0 | - | `runConcurrentAsync(0,0,1)` | reject | 是 | 通过 |
| 线程超上限 | - | `runConcurrentAsync(0,9,1)`、`(0,32,1)` | 都 reject；`(0,8,1)` 接受 | 是 | 通过 |
| 轮次为 0 / 负数 | - | `runConcurrentAsync(0,1,0)`、`(0,2,-1)` | 都 reject；`(0,2,1)` 接受 | 是 | 通过 |
| 轮次超上限 | - | `runConcurrentAsync(0,1,6)`、`(0,1,10)` | 都 reject；`(0,1,5)` 接受 | 是 | 通过 |
| 小数线程数 | - | 依次传 1.5、2.5、7.5 | 全部 reject；`threads=3` 的合法请求回显 3 且尝试次数 3 | 是 | 通过 |
| 小数轮次 | - | `rounds` 传 2.5、0.5 | 都 reject；`rounds=2` 的合法请求回显 2 且尝试次数 2 | 是 | 通过 |
| 连续两次运行 | - | `(1,2,2)` 后 `(4,3,1)` | 两次各自保留 `threads` 与尝试次数（4 与 3），第二次等级为 4 | 是 | 通过 |

## Compare 套件（`NdkQosCompare.test.ets`，12 条）

验证 `compareLevels(levelA, levelB)` 的双腿执行、比值与更快等级判定。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 双腿回显 | - | `compareLevels(0,5)` | `code=0`、`levelA=0`、`levelB=5`，两个耗时均为正有限值 | 是 | 通过 |
| 比值定义 | - | 同上 | `ratio` 等于 `durationA / durationB`（误差 ≤ 1e-6），且为正 | 是 | 通过 |
| 更快等级判定 | - | 同上 | `fasterLevel` 取两个等级之一，且其耗时等于两者的较小值 | 是 | 通过 |
| 同等级自比 | - | `compareLevels(3,3)` | `code=0`，`fasterLevel=3`，比值在同一等级的合理区间内 | 是 | 通过 |
| 第一等级越上界 | - | `compareLevels(6,0)` | `code=401`，`levelA/levelB/fasterLevel=-1`，`durationA/ratio=-1` | 是 | 通过 |
| 第二等级为负 | - | `compareLevels(0,-1)` | `code=401`，`durationB/ratio=-1`，`fasterLevel=-1` | 是 | 通过 |
| 小数等级 | - | `compareLevels(2.5,5)`、`(0,0.5)` | 都 `code=401` | 是 | 通过 |
| 交换两等级 | - | `(0,5)` 与 `(5,0)` 各一次 | 每次 `levelA/levelB` 与入参一致，耗时跟随各自等级 | 是 | 通过 |
| 计入累计统计 | - | 清零后 `compareLevels(1,4)` | `runCount=2`，`lastLevel=4` | 是 | 通过 |
| 同等级计数 | - | 清零后 `compareLevels(2,2)` | `levelCounts[2]=2`，总和 2 | 是 | 通过 |
| 最近一次运行信息 | - | `compareLevels(0,5)` 后读 `getLastQosInfo()` | `queryLevel=5`、`setResult=0` | 是 | 通过 |
| 累计区间覆盖双腿 | - | 对比一次后读 summary | `minDuration` 与 `maxDuration` 覆盖两次耗时 | 是 | 通过 |

## Summary 套件（`NdkQosSummary.test.ets`，14 条）

验证 `getRunSummary()` / `resetRunSummary()` 的计数、哨兵与幂等。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 清零返回 | - | `resetRunSummary()` | `code=0`、`runCount=0` | 是 | 通过 |
| 清零后哨兵 | - | 清零后读 summary | `lastLevel`、`avgDuration`、`minDuration`、`maxDuration` 均为 -1 | 是 | 通过 |
| 清零后分等级计数 | - | 同上 | `levelCounts` 长度 6 且全为 0 | 是 | 通过 |
| 单次实验 | - | `useQos(4)` 后读 summary | `runCount=1`、`lastLevel=4`、`levelCounts[4]=1` | 是 | 通过 |
| 单次实验区间 | - | 同上 | `min=avg=max` 等于该次耗时 | 是 | 通过 |
| 两次实验 | - | 连续两次不同等级 | `runCount=2`，`lastLevel` 为第二次等级 | 是 | 通过 |
| 分等级求和 | - | 同一等级执行两次 | `levelCounts` 之和等于 `runCount` | 是 | 通过 |
| 区间有序 | - | 多次不同耗时实验 | `minDuration ≤ avgDuration ≤ maxDuration` | 是 | 通过 |
| 快捷入口计数 | - | `useHighQos()`、`useLowQos()` | 计数分别落在 5 与 0 | 是 | 通过 |
| 异步计数 | - | `useQosAsync(2)` | 只 +1 次，且落在等级 2 | 是 | 通过 |
| 重复清零幂等 | - | 连续两次 `resetRunSummary()` | 第二次仍返回 0，之前累计的计数被丢弃 | 是 | 通过 |
| 基准计入 | - | 跑一轮基准 | 每等级 +1，`runCount=6` | 是 | 通过 |
| 拒绝不计入 | - | `useQos(9)` | summary 完全不变 | 是 | 通过 |
| 运行信息保留 | - | 成功一次后读 summary 与 `getLastQosInfo()` | 两者的等级与耗时一致 | 是 | 通过 |

## Topology 套件（`NdkQosTopology.test.ets`，20 条）

验证 `getCpuTopology()` / `bindCurrentThread(cpu)` / `resetThreadAffinity()` 的拓扑一致性与核编号边界。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 拓扑基本字段 | - | `getCpuTopology()` | `code=0`、`cpuCount ≥ 1`、`selectedCpu` 落在 `[0, cpuCount)` | 是 | 通过 |
| 亲和性与计数一致 | - | 同上 | `affinityCount` 等于 `affinityCpus` 长度且不超过 `cpuCount` | 是 | 通过 |
| 亲和性升序 | - | 同上 | `affinityCpus` 严格升序 | 是 | 通过 |
| 两次查询一致 | - | 连续两次 `getCpuTopology()` | `cpuCount` 与 `selectedCpu` 相同 | 是 | 通过 |
| 解除绑定恢复全核 | - | `resetThreadAffinity()` | `affinityCount == cpuCount`，列表恢复全部在线核 | 是 | 通过 |
| 绑定 CPU 0 | - | `bindCurrentThread(0)` | `code=0`、`cpu=0`、`affinityCpus=[0]` | 是 | 通过 |
| 绑定最后一个核 | - | `bindCurrentThread(cpuCount-1)` | `code=0`，掩码收敛到该核 | 是 | 通过 |
| 绑定中间核 | - | `bindCurrentThread(1)`（多核设备） | 接受并只保留该核 | 是 | 通过 |
| 连续两次绑定 | - | 先绑 0 再绑末核 | 掩码只保留最后一次绑定的核 | 是 | 通过 |
| 绑定后回读拓扑 | - | 绑定后 `getCpuTopology()` | `affinityCount=1`，`affinityCpus` 为该核 | 是 | 通过 |
| 负核编号 | - | `bindCurrentThread(-1)` | `code=401`、`cpu=-1` | 是 | 通过 |
| 等于核数的编号 | - | `bindCurrentThread(cpuCount)` | `code=401`，不被夹取为合法核 | 是 | 通过 |
| 远越界编号 | - | `bindCurrentThread(cpuCount+16)` | `code=401`，错误字段稳定 | 是 | 通过 |
| 小数核编号 | - | `bindCurrentThread(1.5)` | `code=401` | 是 | 通过 |
| 大负数编号 | - | `bindCurrentThread(-8)` | `code=401`，原亲和性掩码不变 | 是 | 通过 |
| 拒绝不改掩码 | - | 绑定失败后 `getCpuTopology()` | `affinityCount` 与失败前相同 | 是 | 通过 |
| 重复解绑 | - | 连续两次 `resetThreadAffinity()` | 两次都成功，`affinityCount == cpuCount` | 是 | 通过 |
| 计数上界 | - | 各状态下读拓扑 | `affinityCount ≤ cpuCount` 恒成立 | 是 | 通过 |
| 逐核绑定与释放 | - | 对每个在线核绑一次再解绑 | 每次绑定成功、解绑后回到全核掩码 | 是 | 通过 |
| 默认核稳定性 | - | 多次 `getCpuTopology()` | `selectedCpu` 始终落在 `[0, cpuCount)` | 是 | 通过 |

## RecordFile 套件（`NdkQosRecordFile.test.ets`，26 条）

验证 `appendRunRecord` / `readRunRecords` / `clearRunRecords` / `getRecordStats` 的读写、容量与统计口径。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 空文件清空 | 已清空记录文件 | `clearRunRecords(dir)` | `code=0`、`removed=0` | 是 | 通过 |
| 追加一条记录 | 已清空 | `appendRunRecord(dir, …)` | `count=1`、`capacity=200`、`dropped=0` | 是 | 通过 |
| 读回字段 | 已写入 1 条 | `readRunRecords(dir, 10)` | 等级、耗时与四个结果码与写入值一致 | 是 | 通过 |
| 读取返回最新记录 | 已写入多条 | 小 limit 读取 | 返回最近的记录而非最早的 | 是 | 通过 |
| limit 等于条数 | 已写入多条 | `limit` = 记录数 | 按写入顺序返回全部记录 | 是 | 通过 |
| limit 为 0 | 已写入多条 | `readRunRecords(dir, 0)` | `code=401`、`returned=0` | 是 | 通过 |
| limit 超容量 | - | `readRunRecords(dir, 201)` | `code=401` | 是 | 通过 |
| 小数 limit | - | `readRunRecords(dir, 2.5)` | `code=401` | 是 | 通过 |
| 非法等级记录 | 已清空 | `appendRunRecord(dir, 6, …)`、`(dir, -1, …)` | `code=401`、`count=0`，文件无新增 | 是 | 通过 |
| 负耗时记录 | 已清空 | `appendRunRecord(dir, 2, -5, …)` | `code=401`，统计不受影响 | 是 | 通过 |
| 空目录路径 | - | `appendRunRecord('', …)` | `code=401`，未打开文件 | 是 | 通过 |
| 目录不存在 | - | 追加到不存在的目录 | `code=402`（写文件失败） | 是 | 通过 |
| 无文件读取 | 目录无可读文件 | `readRunRecords(dir, 10)` | `code=0`、`total=0`、`returned=0` | 是 | 通过 |
| 无文件统计 | 同上 | `getRecordStats(dir)` | `total=0`、`successCount=0`、`avgDuration=-1` | 是 | 通过 |
| 空文件统计 | 已清空 | `getRecordStats(dir)` | 三个耗时均为 -1，`levelCounts` 全 0 | 是 | 通过 |
| 成功记录统计 | 写入多条成功记录 | `getRecordStats(dir)` | `avg/min/max` 与手算一致 | 是 | 通过 |
| 失败记录分离 | 写入 `setResult≠0` 记录 | `getRecordStats(dir)` | 只计入 `failureCount`，不参与耗时统计 | 是 | 通过 |
| 分等级计数 | 写入多个等级记录 | `getRecordStats(dir)` | `levelCounts` 按实际等级累加 | 是 | 通过 |
| 清空移除计数 | 已写入多条 | `clearRunRecords(dir)` | `removed` 等于删除条数 | 是 | 通过 |
| 重复清空 | 已清空 | `clearRunRecords(dir)` | `removed=0` | 是 | 通过 |
| 连续追加 | 已清空 | 连续追加两条 | `count` 依次为 1、2，旧记录保留 | 是 | 通过 |
| 尾斜杠路径 | - | 带尾斜杠的目录 | 解析到同一记录文件，读写结果一致 | 是 | 通过 |
| 容量上限 | 已写满容量 | 继续追加 | `count` 停在 200，`dropped=1` | 是 | 通过 |
| 丢弃最旧记录 | 已写满容量 | 追加一条后读取 | 最早那条消失，其余顺序不变 | 是 | 通过 |
| 清空后统计回哨兵 | 清空后 | `getRecordStats(dir)` | 三个耗时回到 -1 | 是 | 通过 |
| 失败记录码保留 | 写入失败记录 | 读回该记录 | `setResult/queryLevel/resetResult/bindResult` 保持原负值 | 是 | 通过 |

## RecordFileExt 套件（`NdkQosRecordFileExt.test.ets`，14 条）

补齐容量精确边界、溢出滚动、路径异常与耗时极值。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 目录指向记录文件-追加 | - | 把记录文件路径当目录传入后追加 | `code=402`，原文件内容未被改写 | 是 | 通过 |
| 目录指向记录文件-读取 | - | 同上后调用 `readRunRecords` | 返回空列表，`total=0` | 是 | 通过 |
| 目录指向记录文件-统计 | - | 同上后调用 `getRecordStats` | `total=0`，三个耗时为 -1 | 是 | 通过 |
| 超长路径 | 已清空 | 超长目录路径追加 | 该次失败，随后的正常追加仍成功 | 是 | 通过 |
| 零耗时记录 | 已清空 | `duration=0` 写入 | `code=0`，统计三个耗时都为 0 | 是 | 通过 |
| 三位小数 | 已清空 | 写入第四位有值的耗时 | 存盘按三位小数四舍五入 | 是 | 通过 |
| 极小耗时 | 已清空 | 写入极小的正耗时 | 接受，落盘为 0 毫秒 | 是 | 通过 |
| 失败记录只计失败 | 已清空 | `setResult≠0` + 正耗时 | `failureCount=1`，三个耗时仍为 -1 | 是 | 通过 |
| 失败记录读回 | 同上 | 读回该记录 | 等级与四个结果码保持写入值（含负值） | 是 | 通过 |
| 第 200 条 | 已写入 199 条 | 追加第 200 条 | `count=200`、`dropped=0` | 是 | 通过 |
| 每次溢出丢 1 条 | 已写满 200 条 | 连续再追加 3 条 | 每次 `dropped=1`，`count` 恒为 200 | 是 | 通过 |
| limit 为 1 | 已写入多条 | `readRunRecords(dir, 1)` | `returned=1` 且是最新记录，`total` 仍为完整条数 | 是 | 通过 |
| 清空不存在文件 | 目录无记录文件 | `clearRunRecords(dir)` | `removed=0`，其它目录的记录不受影响 | 是 | 通过 |
| 溢出后 index 重排 | 已溢出一次 | 读取全部记录 | `index` 表示文件内位置，从 0 重新连续编号 | 是 | 通过 |

## RecordParse 套件（`NdkQosRecordParse.test.ets`，21 条）

验证 `parseRunRecordLine(text)` 对六字段记录行的解析、容错与拒绝。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 完整行解析 | - | `'3,120.500,0,3,0,0'` | `code=0`，六个字段逐一还原 | 是 | 通过 |
| 最低等级行 | - | 等级 0 的合法行 | `code=0`，`level=0` 原值回读 | 是 | 通过 |
| 最高等级行 | - | 等级 5 的合法行 | `code=0`，`level=5` 原值回读 | 是 | 通过 |
| 耗时为零 | - | `duration=0.000` | 仍是合法记录 | 是 | 通过 |
| 小数耗时精度 | - | 带三位小数的耗时 | 解析后保持毫秒精度 | 是 | 通过 |
| 失败记录 | - | 四个结果为 -1 的行 | `code=0`，负值原样保留 | 是 | 通过 |
| 等级超上界 | - | `'6,100.000,0,6,0,0'` | `code=401`，`level` 与四个结果码均为 -1 | 是 | 通过 |
| 等级为负 | - | `'-1,100.000,0,-1,0,0'` | `code=401`，`level` 与 `setResult` 为 -1 | 是 | 通过 |
| 负耗时 | - | `'2,-5.000,0,2,0,0'` | `code=401`，`duration` 与 `level` 为 -1 | 是 | 通过 |
| 字段不足 | - | `'5,100.000,0'` | `code=401` | 是 | 通过 |
| 空白行 | - | `'   '` | `code=401`，`duration/queryLevel` 为 -1 | 是 | 通过 |
| 分隔符错误 | - | `'5;100;0;5;0;0'` | `code=401` | 是 | 通过 |
| 耗时字段为空 | - | `'5,,0,5,0,0'` | `code=401`、`duration=-1` | 是 | 通过 |
| 空串 | - | `''` | `code=401`，`level/duration/setResult/bindResult` 均为 -1 | 是 | 通过 |
| 第六字段后多余内容 | - | 行尾追加 `,ignored` | `code=0`，仍按前六字段解析 | 是 | 通过 |
| 前导空格 | - | `'  2,64.000,0,2,0,0'` | `code=0`、`level=2` | 是 | 通过 |
| 行尾换行 | - | 行尾带 `\n` | `code=0`，字段不受影响 | 是 | 通过 |
| 超大耗时 | - | `'0,987654.321,0,0,0,0'` | `code=0`，值为有限数且精度保留 | 是 | 通过 |
| 大结果码 | - | `'3,2000.000,401,3,1201,0'` | `code=0`，`setResult=401`、`resetResult=1201` | 是 | 通过 |
| 等级非数字 | - | `'high,100.000,0,5,0,0'` 后紧跟合法行 | 前者 `code=401`，后者 `code=0` 且字段正确（解析无残留状态） | 是 | 通过 |
| 重复解析幂等 | - | 同一行解析两次 | 两次 `code`、`level`、`duration`、`queryLevel` 完全一致 | 是 | 通过 |

## LevelPageUI 套件（`NdkQosLevelPageUI.test.ets`，22 条）

覆盖等级页从首页进入后的整页交互：六档选择、结果卡、运行状态与返回。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 页面初始结构 | 首页 | 点击等级页入口 | 出现提示语、运行按钮与 idle 状态 | 是 | 通过 |
| 六档等级可选 | 位于等级页 | 统计等级选项 | 0~5 六个选项齐全 | 是 | 通过 |
| 选项不重不漏 | 位于等级页 | 逐项统计每个等级文本 | 每个等级恰出现一次 | 是 | 通过 |
| 结果卡字段 | 位于等级页 | 统计结果卡行 | 包含 set/query/reset 三个结果码与耗时共 5 行 | 是 | 通过 |
| 初始占位值 | 位于等级页 | 读结果卡 | 耗时显示 `-1.00`，结果码显示 -1 | 是 | 通过 |
| 标题与说明唯一 | 位于等级页 | 统计标题、返回与线程作用域说明 | 各出现 1 次 | 是 | 通过 |
| 默认等级运行 | 位于等级页 | 不选等级直接点运行 | 以默认的 interactive（5）运行 | 是 | 通过 |
| 选背景等级运行 | 位于等级页 | 点 0 后运行 | native 回读等级为 0 | 是 | 通过 |
| 选默认等级运行 | 位于等级页 | 点 2 后运行 | native 回读等级为 2 | 是 | 通过 |
| 选 deadline 等级运行 | 位于等级页 | 点 4 后运行 | 运行后回读等级为 4 | 是 | 通过 |
| 运行后耗时更新 | 位于等级页 | 运行一次 | `-1.00` 占位被实测耗时替换 | 是 | 通过 |
| 状态切换 | 位于等级页 | 运行一次 | 状态由 idle 变为 finished，运行按钮仍可用 | 是 | 通过 |
| 运行后仍可换档 | 位于等级页 | 运行后统计等级按钮 | 六个等级选项仍可点 | 是 | 通过 |
| 两次运行计数 | 位于等级页 | 同一档运行两次 | summary 计 2 次，`lastLevel` 相同 | 是 | 通过 |
| 改选覆盖 | 位于等级页 | 先点 1 再点 3 后运行 | 以最后选择的 3 运行 | 是 | 通过 |
| 显式点最高档 | 位于等级页 | 点 5 后运行 | 回读等级为 5 | 是 | 通过 |
| 边界档耗时 | 位于等级页 | 0 与 5 各运行一次 | 两次都显示实测耗时（非 `-1.00`） | 是 | 通过 |
| 布局稳定 | 位于等级页 | 运行后统计提示语与说明 | 仍各为 1 行，不重复 | 是 | 通过 |
| 结果码成功 | 位于等级页 | 运行一次 | set/query/reset 三个结果码均为 0 | 是 | 通过 |
| 返回首页 | 位于等级页 | 点返回 | 回到首页，等级页标记消失 | 是 | 通过 |
| 重进后状态 | 首页 | 再次进入等级页 | 状态回到 idle，重新可运行 | 是 | 通过 |
| 耗时两位小数 | 位于等级页 | 运行后读耗时文本 | 保留两位小数格式 | 是 | 通过 |

## BenchmarkPage 套件（`NdkQosBenchmarkPage.test.ets`，17 条）

覆盖基准页的轮次选择、结果表、汇总卡与重置。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 页面初始结构 | 首页 | 进入基准页 | 空态提示与 idle 状态 | 是 | 通过 |
| 标题与返回 | 位于基准页 | 统计标题与返回 | 各 1 个 | 是 | 通过 |
| 轮次与动作按钮 | 位于基准页 | 统计 1/2/3 与动作按钮 | 三个轮次选项与运行按钮齐全 | 是 | 通过 |
| 一轮填表 | 位于基准页 | 选 1 轮后运行 | 结果表出现，状态变为 finished | 是 | 通过 |
| 一轮计数 | 清零 summary 后 | 一轮运行 | 每等级 1 次，共 6 次 | 是 | 通过 |
| 重置 | 已有结果 | 点重置 | 结果表清空、状态回 idle | 是 | 通过 |
| 两轮计数 | 清零后 | 两轮运行 | 共 12 次实验 | 是 | 通过 |
| 刷新不清结果 | 已有结果 | 刷新汇总 | 结果表保留，实验次数不变 | 是 | 通过 |
| 返回首页 | 位于基准页 | 点返回 | 回到首页 | 是 | 通过 |
| 三轮计数 | 清零后 | 三轮运行 | 共 18 次实验 | 是 | 通过 |
| 两次一轮累计 | 清零后 | 连续两次一轮基准 | 累计 12 次 | 是 | 通过 |
| 只选轮次不运行 | 位于基准页 | 点 3 但不运行 | 计数不变，仍为空态与 idle | 是 | 通过 |
| 改选轮次生效 | 位于基准页 | 先点 2 再点 1 后运行 | 以 1 轮运行，共 6 次 | 是 | 通过 |
| 列头齐全 | 运行后 | 统计表头 | Level/Pass/Fail/Avg/Min/Max 六项齐全，空态消失 | 是 | 通过 |
| 重进后空表 | 运行后返回再进入 | 重新进入基准页 | 结果表为空，但 native 汇总保留 6 次 | 是 | 通过 |
| 汇总卡 8 行 | 位于基准页 | 统计汇总字段 | Summary runs/Last level/avg/min/max/Fastest/Slowest/Total 共 8 行，另有 2 个动作入口 | 是 | 通过 |
| 三轮后重置 | 三轮运行后 | 点重置 | Total 与 Summary runs 归 0，空态与 idle 恢复 | 是 | 通过 |

## ConcurrencyPage 套件（`NdkQosConcurrencyPage.test.ets`，16 条）

覆盖并发压测页的等级/线程/轮次选择与结果卡。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 页面初始结构 | 首页 | 进入压测页 | idle 状态与说明文案 | 是 | 通过 |
| 默认等级与标签 | 位于压测页 | 读等级标签 | 默认 interactive，等级与线程标签齐全 | 是 | 通过 |
| 六档可选 | 位于压测页 | 统计等级按钮 | 0~5 全部提供 | 是 | 通过 |
| 八线程运行 | 位于压测页 | 选 8 线程后运行 | 尝试 8 次且各计 1 次 | 是 | 通过 |
| 单线程默认运行 | 位于压测页 | 直接运行 | 计 1 次实验，结果卡列出请求总数 | 是 | 通过 |
| 结果卡字段 | 运行后 | 读结果卡 | Pass/Fail 与三个耗时均有值 | 是 | 通过 |
| 两次运行计数 | 位于压测页 | 运行两次 | 累计 2 次实验 | 是 | 通过 |
| 返回首页 | 位于压测页 | 点返回 | 回到首页 | 是 | 通过 |
| 换背景等级 | 位于压测页 | 点 0 | 等级标签切换为 BACKGROUND，线程选择不变 | 是 | 通过 |
| 背景等级生效 | 位于压测页 | 选 0 后运行 | summary 的 `lastLevel=0` 且 `levelCounts[0]=1` | 是 | 通过 |
| 背景 + 八线程 | 位于压测页 | 选 0、8 线程运行 | `levelCounts[0]=8`，其余等级为 0 | 是 | 通过 |
| 运行后控件可用 | 运行后 | 统计等级、RUN/NOTE/DONE | 六档仍可点，动作与说明齐全 | 是 | 通过 |
| 新页占位 | 新进入 | 统计 `-1.00` | 恰 3 个占位，含 Requested runs 与 Min 行，状态 idle | 是 | 通过 |
| 运行后占位减少 | 运行后 | 再统计占位 | 占位数减少，出现 Pass 标签 | 是 | 通过 |
| 结果卡不叠加 | 运行两次 | 统计 Requested runs 与 Pass | 各仅 1 处，说明是刷新而非新增卡片 | 是 | 通过 |
| 重进恢复默认 | 运行后返回再进入 | 重新进入压测页 | 等级恢复默认、3 个占位、idle | 是 | 通过 |

## HistoryPage 套件（`NdkQosHistoryPage.test.ets`，15 条）

覆盖记录页的写入、读取、统计与清空联动。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 页面初始结构 | 首页 | 进入记录页 | 四个动作、idle 状态与存储说明 | 是 | 通过 |
| 清空空文件 | 位于记录页 | 点清空 | 空态提示出现，文件无记录 | 是 | 通过 |
| 单次运行写入 | 位于记录页 | 运行一次 | 恰好新增 1 条记录，列表替换空态 | 是 | 通过 |
| 读取记录 | 已有记录 | 点读取 | 报告文件状态并渲染记录行 | 是 | 通过 |
| 统计一致 | 已有记录 | 点统计 | 总数与文件内记录数一致 | 是 | 通过 |
| limit 可选 | 位于记录页 | 点更大 limit 读取 | 读取仍正常返回 | 是 | 通过 |
| 重复清空 | 已清空 | 再点清空 | 文件仍空，空态提示恢复 | 是 | 通过 |
| 指定等级记录 | 位于记录页 | 选等级 3 后运行 | native 记录等级为 3，序号 `#0` | 是 | 通过 |
| 记录序号 | 已写入 2 条 | 读列表 | 序号依次为 `#0`、`#1` | 是 | 通过 |
| limit 50 读取 | 已写入记录 | 以 50 读取 | `total/returned=1`，等级 5 | 是 | 通过 |
| 大 limit 读取 | 已写入 2 条 | 以 100 读取 | 返回 2 条，末条 `index=1` | 是 | 通过 |
| 统计分等级 | 写入等级 5 记录 | 点统计 | `levelCounts[5]=1`，界面显示容量 200 与 Capacity 标签 | 是 | 通过 |
| 重进不清文件 | 写入记录后返回再进入 | 重新进入记录页 | 列表为空，但文件 `total=1` | 是 | 通过 |
| 清空后读取 | 已清空 | 点读取 | `total/returned=0`，`records` 为空并显示空态 | 是 | 通过 |
| 同等级累计 | 等级 3 记两次 | 点统计 | `levelCounts[3]=2`、`levelCounts[5]=0`，两条记录等级均为 3 | 是 | 通过 |

## DevicePage 套件（`NdkQosDevicePage.test.ets`，13 条）

覆盖设备页的拓扑刷新、绑核与解绑。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 页面初始结构 | 首页 | 进入设备页 | 拓扑标签齐全，提示先刷新 | 是 | 通过 |
| 刷新后可选核 | 位于设备页 | 点刷新 | 每个核提供一个绑核目标，状态提示已刷新 | 是 | 通过 |
| 选项与按钮数量 | 位于设备页 | 统计核选项与动作按钮 | 核选项数等于核数，另有固定动作按钮 | 是 | 通过 |
| 绑定收敛 | 位于设备页 | 选核后绑定 | 亲和性收敛到单核 | 是 | 通过 |
| 解绑恢复 | 位于设备页 | 点解绑 | 恢复全部核 | 是 | 通过 |
| 未刷新占位 | 新进入 | 统计 `-1` | 恰 3 个占位 | 是 | 通过 |
| 返回首页 | 位于设备页 | 点返回 | 回到首页 | 是 | 通过 |
| 绑定后刷新保持 | 已绑定 | 再刷新拓扑 | 仍单核且核编号不变 | 是 | 通过 |
| 解绑后刷新 | 已解绑 | 再刷新 | `affinityCount == cpuCount` | 是 | 通过 |
| 两次刷新一致 | 位于设备页 | 连续两次刷新 | `cpuCount` 与默认核不变，核选项数等于核数 | 是 | 通过 |
| 目标核生效 | 位于设备页 | 选末核后绑定 | `affinityCpus[0]` 等于选中核 | 是 | 通过 |
| 目标核跨刷新 | 位于设备页 | 选核后刷新再绑定 | 仍绑定该核，并出现 Bind result 行 | 是 | 通过 |
| 重进最简态 | 返回再进入 | 重新进入设备页 | `-1` 恰 3 个、按钮恰 4 个、状态 idle | 是 | 通过 |

## QoSAbility 套件（`QoSAbility.test.ets`，10 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 拉起应用 | 设备就绪 | 启动 `EntryAbility` | 首页出现两个 QoS 按钮 | 是 | 通过 |
| 标题唯一 | 位于首页 | 统计标题 | 文案正确且只渲染 1 次 | 是 | 通过 |
| 首页控件 | 位于首页 | 统计按钮与入口 | 2 个 QoS 按钮 + 5 个页面入口 | 是 | 通过 |
| 按钮文案 | 位于首页 | 读两个按钮文本 | 各自文案正确 | 是 | 通过 |
| 按钮顺序 | 位于首页 | 比较高/低按钮位置 | 高 QoS 按钮在低 QoS 按钮上方 | 是 | 通过 |
| 二次启动 | 位于首页 | 再次启动 `EntryAbility` | 页面仍可用，控件不重复 | 是 | 通过 |
| 页面返回入口 | 位于子页 | 点子页「返回」按钮 | 回到首页，子页标记消失 | 是 | 通过 |
| 入口唯一性 | 位于首页 | 逐个统计 5 个入口文案 | 每个恰出现 1 次，快捷按钮各 1 个 | 是 | 通过 |
| 等级页可重进 | 位于首页 | 进入后返回再进入 | 仍能打开且标题唯一 | 是 | 通过 |
| 多次往返 | 位于首页 | 依次进入基准页与记录页并返回 | 首页 7 个按钮与标题仍正常 | 是 | 通过 |

## Navigation 套件（`NdkQosNavigation.test.ets`，8 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 首页入口完整 | 位于首页 | 统计快捷测试与 5 个入口 | 全部可见 | 是 | 通过 |
| 等级页入口 | 位于首页 | 点等级入口 | 等级页标记出现且首页隐藏 | 是 | 通过 |
| 基准页入口 | 位于首页 | 点基准入口 | 基准页标记出现 | 是 | 通过 |
| 并发页入口 | 位于首页 | 点并发入口 | 并发页标记出现 | 是 | 通过 |
| 设备页入口 | 位于首页 | 点设备入口 | 设备页标记出现 | 是 | 通过 |
| 记录页入口 | 位于首页 | 点记录入口 | 记录页标记出现 | 是 | 通过 |
| 连续访问两页 | 位于首页 | 进入一页返回后再进另一页 | 每次返回都回到首页 | 是 | 通过 |
| 子页标题唯一 | 位于等级页 | 统计标题 | 首页入口不可见后标题仍只有 1 个 | 是 | 通过 |

## Dialog 套件（`NdkQosDialog.test.ets`，8 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 高 QoS 弹窗 | 位于首页 | 点高 QoS 按钮 | 弹窗出现，含确认键与消息 | 是 | 通过 |
| 高 QoS 文案 | 位于首页 | 读弹窗消息 | 固定前缀与 ` ms` 单位符合格式 | 是 | 通过 |
| 高 QoS 时长 | 位于首页 | 解析弹窗时长 | 为正、有限、无科学计数法 | 是 | 通过 |
| 关闭弹窗 | 弹窗打开 | 点确认 | 弹窗关闭，回到首页且按钮可用 | 是 | 通过 |
| 低 QoS 弹窗 | 位于首页 | 点低 QoS 按钮 | 文案为低等级措辞 | 是 | 通过 |
| 低 QoS 时长 | 位于首页 | 解析低 QoS 弹窗时长 | 为正、有限且带 ` ms` 单位 | 是 | 通过 |
| 弹窗可重开 | 位于首页 | 关闭后再次点击 | 仍能弹出并给出结果 | 是 | 通过 |
| 高低不串台 | 位于首页 | 一次运行中先后打开两个弹窗 | 两者文案互不混用，时长各自为正 | 是 | 通过 |

## 运行与验证

构建（工程根目录执行）：

```bash
devecocli build --modules entry@ohosTest
```

安装与执行（需设备授权）：

- 方式一（推荐）：在 DevEco Studio 中右键 `entry/src/ohosTest/ets/test/List.test.ets`，选择 **Run 'List.test.ets'**，测试框架会自动安装测试包并拉起 `OpenHarmonyTestRunner`。
- 方式二：先用下列命令把测试包装到设备，再按应用测试框架的 unittest 参数拉起 `OpenHarmonyTestRunner`；单轮用例耗时长，`timeout` 建议不小于 900000 毫秒。

```bash
export MSYS2_ARG_CONV_EXCL='*'
hdc file send 'entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap' /data/local/tmp/entry_test.hap
hdc shell bm install -p /data/local/tmp/entry_test.hap
```

套件执行顺序：基础层（契约 → 计算 → 记录文件）先跑，页面层（页面 → 导航 → 弹窗）后跑，避免同步 NAPI 计算与 UI 交互互相干扰。

## 测试结果

| 检查项 | 结果 |
|---|---|
| 构建 `entry@ohosTest` | `BUILD SUCCESSFUL`（34 tasks） |
| 用例规范审计（`audit_cases.js`） | `files=23 totalCases=340 errors=0 warnings=0` |
| 套件注册 | 23 个套件全部在 `List.test.ets` 中 import 并在 `testsuite()` 内调用 |
| 用例规模 | 340 条，与本文件各套件表格逐行一致（未增未删） |
| 真机运行 | 340 条通过 / 0 条失败 / 0 条错误 |
| 结论 | **340 条用例全部通过** |

设备与执行参数：设备 `d629034339413535311095d600002b00`，系统语言 `zh-Hans-CN`，`bundleName=com.example.qossample`，`testModule=entry_test`，`testRunner=OpenHarmonyTestRunner`。

| 参数 | 取值 | 运行时选项 |
|---|---|---|
| 应用包名 | `com.example.qossample` | `-b` |
| 测试模块名 | `entry_test` | `-m` |
| 测试运行器 | `/ets/testrunner/OpenHarmonyTestRunner` | `-s unittest` |
| 单例超时（毫秒） | `180000` | `-s timeout` |

只跑指定套件时，在上表基础上追加 `-s class <套件名或 Suite#method，逗号分隔>`。
