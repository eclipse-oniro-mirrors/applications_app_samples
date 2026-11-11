# AppPerformance 测试说明

[中文说明](README_zh.md) · [English](README.md)

## 本轮状态与范围

**当前修改状态：未编译、未构建、未运行；下列用例结果全部待验证。** 用户最新指令禁止继续编译、构建检查、类型检查、转译、应用测试及真机操作。本文件依据源码整理操作和预期，不是执行报告，也不代表本会话更早时点没有工具链探查；不提供伪造 PASS、截图或设备测量值。

测试模块为 `entry_test`，主包名为 `com.example.appperformance`；默认测试 Runner 是 [OpenHarmonyTestRunner.ets](entry/src/ohosTest/ets/testrunner/OpenHarmonyTestRunner.ets)，平铺套件入口为 [List.test.ets](entry/src/ohosTest/ets/test/List.test.ets)。待恢复授权、配置 SDK26/签名并准备目标设备后，再通过 DevEco 的 ohosTest 入口执行相应套件。

### 环境与安全前置条件

- 记录设备型号、系统版本、API/SDK、应用版本、构建来源、语言、前后台与安装目标。
- 设备已由操作者解锁；测试不会输入密码/PIN。UI 驱动仅在识别到确定的系统滑动锁时尝试既有单次滑动；失败后由操作者处理，不猜测凭据。
- 原生 Runner 可能开关 HyperSnap、请求重建、请求文件页回收或创建私有校准文件；仅在确认这些副作用符合测试目的后单独执行。
- 不以模拟平台的调用次数证明系统回收效果；不以资源读取、Preferences 或 UI 测试通过证明 `appMemoryOptimizer` 可用。
- 旧数据兼容验证应先备份自己的测试数据，不能直接清理真实业务数据来规避失败。

## 测试封装与证据解释

- [BoundedCase.ets](entry/src/ohosTest/ets/support/BoundedCase.ets) 保留 10,000 ms 本地 case 超时；默认 Runner timeout 为 12,000 ms。共享入口记录 begin/failure/end，失败仍抛回 Hypium。`Promise.race` 超时不会停止已发出的 SDK 工作。
- [UiTestSupport.ets](entry/src/ohosTest/ets/support/UiTestSupport.ets) 在 body 内清理，保留原始断言失败；仅终止自己持有的 TestAbility 并等待 onDestroy，不关闭别的 Ability。节点等待等原有超时保留。
- 入口在每个 leaf case 前 `setTimeout(0)` 让出事件循环。既有测试名字、稳定 UI ID、故障注入、timeout 和 cleanup 不全量机械重命名。
- `app-performance-test-report.json` 来自 `caseResults()`，仅统计走 BoundedCase 的用例。部分用例直接导入 Hypium `it`，不能用该 JSON 的 passed/total 宣称整套通过。需同时保存 Hypium 完整汇总、失败堆栈及独立 Runner 输出。
- Runner 的“初始化成功/已调度”日志不表示测试结束；原生请求成功也不表示实际回收量已得到可信测量。

## 已有核心自动化用例（源码编号保留）

来源：[Core.test.ets](entry/src/ohosTest/ets/test/Core.test.ets)。这些使用 FakePlatform/MemoryStore，验证生产服务逻辑，而非真实系统 API 效果。

| 用例编号 / 名称 | 步骤 | 预期结果 | 本轮结果 |
|---|---|---|---|
| SUB_PERFORMANCE_APPPERFORMANCECORE_0100 / testAppPerformanceCore0001 | 输入带空格/重复的 `.so/.hap/.hsp`；再输入空值、非法后缀、路径、控制字符和 33 个目标 | trim/去重后一次调用；非法输入本地 blocked，不调平台且 busy 清除 | 待验证 |
| SUB_PERFORMANCE_APPPERFORMANCECORE_0200 / testAppPerformanceCore0002 | 暂停文件回收 Promise，推进虚拟时钟并释放；再注入拒绝码及 SDK 不可用 | pending→success，保留37ms；拒绝码与消息原样记录；不可用时不发请求 | 待验证 |
| SUB_PERFORMANCE_APPPERFORMANCECORE_0300 / testAppPerformanceCore0003 | 提供重复真实模块/文件；读取有效、结构错误、语法错误配置；请求不存在模块并注入拒绝码 | 目标去重；配置诊断区分错误；不存在模块被拦截；合法模块请求保留真实拒绝码 | 待验证 |
| SUB_PERFORMANCE_APPPERFORMANCECORE_0400 / testAppPerformanceCore0004 | 未建 baseline 先校验；读取后校验相同字节、改变字节；注入读取错误 | 未建 baseline 不读平台；一致/不一致准确区分；错误保留且资源 busy 清除 | 待验证 |
| SUB_PERFORMANCE_APPPERFORMANCECORE_0500 / testAppPerformanceCore0005 | 开启再关闭快启；注入下一次设置失败；落盘后使用新服务实例恢复 | 失败保留上次成功设置/时间；恢复不重复调用 SDK；旧“启用/禁用”值仍有效 | 待验证 |
| SUB_PERFORMANCE_APPPERFORMANCECORE_0600 / testAppPerformanceCore0006 | 重建成功后立即重复，注入存储失败；推进虚拟10秒再调用并注入SDK失败 | 冷却不可因存储失败绕过；冷却后可调用；SDK失败保留原始码与上次成功时间 | 待验证 |
| SUB_PERFORMANCE_APPPERFORMANCECORE_0700 / testAppPerformanceCore0007 | 暂停请求至10秒超时；尝试第二次；释放原请求两次并检查订阅/快照 | 超时仍持锁；第二次 blocked；迟到结果更新同ID且不重复记录；timer清理，旧快照不被改写 | 待验证 |

## 已有 UI 自动化用例

来源：[ReactiveUi.test.ets](entry/src/ohosTest/ets/test/ReactiveUi.test.ets)、[SeriesUiQa.test.ets](entry/src/ohosTest/ets/test/SeriesUiQa.test.ets)。系列 UI Harness 使用正式组件及生产服务，I/O 为可控夹具。

| 用例编号 / 名称 | 步骤 | 预期结果 | 本轮结果 |
|---|---|---|---|
| SUB_PERFORMANCE_APPPERFORMANCEUI_0100 / testAppPerformanceUI0001 | 打开测试页，点击更新，切换内存/日志卡片并重复更新 | Prop/State更新，禁用按钮变为可用，日志状态与30ms耗时正确；资源化状态按当前语言解析 | 待验证 |
| SUB_PERFORMANCE_SERIESUIQA_0100 / testSeriesUiQa0001 | 打开 empty 系列页面，不点击开始 | 未开始且无样本；开始可用、停止/复制不可用；资源读取数为0 | 待验证 |
| SUB_PERFORMANCE_SERIESUIQA_0200 / testSeriesUiQa0002 | 减次数至1，再增至10 | 最小/最大边界按钮禁用；计数文案来自当前语言资源；未开始时不读取负载 | 待验证 |
| SUB_PERFORMANCE_SERIESUIQA_0300 / testSeriesUiQa0003 | 启动 pending 夹具并悬停真实资源Promise | 开始和次数按钮冻结；停止/取消可用；读取1次且无伪造记录 | 待验证 |
| SUB_PERFORMANCE_SERIESUIQA_0400 / testSeriesUiQa0004 | 运行期间请求本次完成后停止，再释放读取 | 当前次结束后停止，只产生1条记录，不执行余下2次 | 待验证 |
| SUB_PERFORMANCE_SERIESUIQA_0500 / testSeriesUiQa0005 | complete夹具启动默认3次并等服务保存 | 实际完成3条完整记录，引用可用3/3且无缺失，可复制报告 | 待验证 |
| SUB_PERFORMANCE_SERIESUIQA_0600 / testSeriesUiQa0006 | 启动resourceFailure夹具 | 一次读取失败后终止，不重试、无有效样本，开始可再次使用 | 待验证 |
| SUB_PERFORMANCE_SERIESUIQA_0700 / testSeriesUiQa0007 | pending时取消等待；先不释放SDK，再释放 | 本地取消后仍隔离且开始禁用；原Promise结束后解除隔离，不制造成功样本 | 待验证 |
| SUB_PERFORMANCE_SERIESUIQA_0800 / testSeriesUiQa0008 | 注入初始计划落盘失败再开始 | 标注保存失败，实际负载读取0次，无报告可复制；未捏造落盘成功 | 待验证 |
| SUB_PERFORMANCE_SERIESUIQA_0900 / testSeriesUiQa0009 | 第二次实验中更换资源内容，再释放暂停读取 | 条件变化后停止，只有2条实际记录；第三次不执行 | 待验证 |
| SUB_PERFORMANCE_SERIESUIQA_1000 / testSeriesUiQa0010 | 完成系列，点击正式复制按钮 | 调用生产导出器到隔离剪贴板；报告只含本系列，账本ID不变 | 待验证 |

## 人工/集成待验证场景

以下 `AP-MAN-*` 是本文的人工场景编号，不冒充源码中已有自动化 `it`。

| 编号 | 名称与步骤 | 预期结果 | 本轮结果 |
|---|---|---|---|
| AP-MAN-001 | 分别设置英文/简体中文，重启应用，逐一进入五个页签、实验台、对话框及展开区 | 已资源化控件使用对应语言，无资源缺失/格式占位符残留；记录剩余中文模型消息，不把混合语言记为全部通过 | 待验证 |
| AP-MAN-002 | 两种语言切换前后保留含“启用/禁用/初始”与中文阶段状态的旧测试存档并重新进入 | 分组、恢复、完整性判定、ID和记录数不因显示语言变化；界面显示值不写回历史key | 待验证 |
| AP-MAN-003 | 在真实支持设备发现目标，分别发起文件/模块回收；同时记录不支持或拒绝场景 | 成功/错误如实显示，拒绝码可追溯；成功不被写成已回收具体字节 | 待验证 |
| AP-MAN-004 | 对每个打包负载先运行control，再以相同条件运行files/modules | 资源同身份重读、字节/校验值一致；条件不齐则不可比，不把缺失当0 | 待验证 |
| AP-MAN-005 | 运行中取消、离开页面，再返回；观察原请求延迟结束 | 页面释放自身订阅/所有权；原SDK未settle前不允许新实验，不自动重发 | 待验证 |
| AP-MAN-006 | 选择不同历史系列及基线，复制Markdown/CSV；淘汰元信息后重新选择 | 仅使用对应引用；不可比较/缺失显式提示；报告脱敏，不借用别的系列记录 | 待验证 |
| AP-MAN-007 | 用户明确同意后开关HyperSnap并请求重建，等待冷却；对真实启动记录AbilityStage事件 | 设置/请求结果真实；只有系统实际回调才记录HyperSnap确认，内容加载不等同首帧 | 待验证 |
| AP-MAN-008 | 诱发可控路由错误或图片释放失败，观察hilog | 0xF811 / [Sample_AppPerformance]下有英文诊断；图片另一资源仍继续清理，原错误不被清理异常覆盖 | 待验证 |
| AP-MAN-009 | 用户同意后运行独立FilePageRunner，保存校准、目标身份、pagemap/mincore可信性与trace | 观测不足必须明确不可量化；私有校准不提升HAP权限，不把原始mincore计数直接当回收量 | 待验证 |
| AP-MAN-010 | 观察BoundedCase与UI共享包装的正常/断言失败/cleanup失败日志 | 有begin/failure/end；保留原始失败；超时清理与所有权边界不被日志修改破坏 | 待验证 |

## 其他已有套件的定位

| 文件/套件 | 主要验证范围 | 说明 |
|---|---|---|
| [Additional.test.ets](entry/src/ohosTest/ets/test/Additional.test.ets)、[MaintenanceFlow.test.ets](entry/src/ohosTest/ets/test/MaintenanceFlow.test.ets)、[TargetDiscovery.test.ets](entry/src/ohosTest/ets/test/TargetDiscovery.test.ets) | 服务边界、六阶段流程、目标发现 | 逐条运行状态未验证 |
| [PlanMatrix.test.ets](entry/src/ohosTest/ets/test/PlanMatrix.test.ets)、[PerformanceRuleCases.test.ets](entry/src/ohosTest/ets/test/PerformanceRuleCases.test.ets)、[FaultThresholdCases.test.ets](entry/src/ohosTest/ets/test/FaultThresholdCases.test.ets) | 计划、规则、故障阈值 | 保留既有真实断言与数据表 |
| [LaunchBudgetCases.test.ets](entry/src/ohosTest/ets/test/LaunchBudgetCases.test.ets)、[ThresholdGateMatrixCases.test.ets](entry/src/ohosTest/ets/test/ThresholdGateMatrixCases.test.ets)、[LoadFaultWorkloadCases.test.ets](entry/src/ohosTest/ets/test/LoadFaultWorkloadCases.test.ets) | 预算/阈值/画像边界 | 不证明设备真实性能 |
| [ReportCases.test.ets](entry/src/ohosTest/ets/test/ReportCases.test.ets)、[ReportDeliveryB2.test.ets](entry/src/ohosTest/ets/test/ReportDeliveryB2.test.ets) | 报告分组、截断、脱敏、交付 | 报告文本继续资源化时须同步校验契约 |
| [SeriesOwnershipFeature.test.ets](entry/src/ohosTest/ets/test/SeriesOwnershipFeature.test.ets)、[SeriesPersistenceFeature.test.ets](entry/src/ohosTest/ets/test/SeriesPersistenceFeature.test.ets)、[SeriesStateFeature.test.ets](entry/src/ohosTest/ets/test/SeriesStateFeature.test.ets) | 所有权、恢复、状态机 | 不因本次本地化重命名编号 |
| [SeriesNativeQa.test.ets](entry/src/ohosTest/ets/test/SeriesNativeQa.test.ets) | 真资源/uptime/Preferences边界 | 其回收接口和部分环境仍为FakePlatform，不等于真实回收API测试 |

其余以 `Performance*WaveOne/WaveTwo`、`Template*`、`WorkloadCatalogMatrix` 命名的套件及完整编号以 [List.test.ets](entry/src/ohosTest/ets/test/List.test.ets) 和各源码注释为准。本表是核验入口与代表性详细场景，不捏造穷尽执行数量。

## 独立 Runner 与后续报告模板

- [NativeApiRunner.ets](entry/src/ohosTest/ets/testrunner/NativeApiRunner.ets)：涉及真实回收和快启调用，有副作用；超时不取消底层调用。
- [HyperSnapControlRunner.ets](entry/src/ohosTest/ets/testrunner/HyperSnapControlRunner.ets)：独立设置/重建控制，不等于观察到了快启启动。
- [FilePageRunner.ets](entry/src/ohosTest/ets/testrunner/FilePageRunner.ets)：文件页、映射、校准与trace观测，不应混入无副作用逻辑用例默认执行。

后续每条结果应填写：`编号 | 设备/系统/应用版本 | 语言 | 实际步骤 | 实际结果 | PASS/FAIL/BLOCKED及原因 | 日志/截图/报告路径`。任何未运行项继续记“待验证”；环境不可用和观测不可信应保留为具体阻塞，而不是修改预期成PASS。
