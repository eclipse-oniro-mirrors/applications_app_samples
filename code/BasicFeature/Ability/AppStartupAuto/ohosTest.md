# AppStartupAuto 测试说明

[中文介绍](<README_zh.md>) | [English overview](<README.md>)

## 基本功能人工用例

以下沿用 M01–M14 的原编号，按实际应用操作编排。使用专用测试数据，执行时记录交付版本、工具环境、设备和系统/API、语言、主题、字号及时间。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| M01 第一次启动与查询 | 已安装并签名，第一次运行且无历史 | 启动应用，查看首页，展开调用详情和查询记录 | 设备能力与本应用状态分开显示，实际结果、来源和时间可见 | 否（人工） | 待执行 |
| M02 刷新与前后台返回 | 位于首页，可发起查询 | 点击刷新，在查询中再次点击刷新，离开后返回并查看记录 | 重复操作按忙状态处理，来源和回访关联正确 | 否（人工） | 待执行 |
| M04 手动设置回访 | 已有十分钟内成功查询样本 | 开始回访，离开应用，再返回查看关联查询；系统设置由执行人手动操作 | 记录回访、查询关联及离开和返回时间 | 否（人工） | 待执行 |
| M05 回访取消与过期 | 可开始回访，有足够时间完成过期场景 | 开始一轮后取消；另开始一轮，离开超过十分钟后返回 | 分别显示取消、过期和比较资格提示 | 否（人工） | 待执行 |
| M06 历史筛选与比较 | 已有多条历史，至少两条可比较样本 | 按来源、结果和时间筛选，查看详情并选择比较样本 | 列表、统计、最新样本、详情和比较对应当前范围，样本不足时有提示 | 否（人工） | 待执行 |
| M07 历史脱敏导出 | 当前筛选范围与全量范围不同 | 分别导出当前范围和全量历史，检查两份文本 | 范围对应所选入口，敏感文本和平台错误正文完成脱敏 | 否（人工） | 待执行 |
| M08 归档保存与恢复 | 有可保存的查询结果和专用测试归档 | 手动保存，确认成功后关闭并重新进入应用，查看归档详情 | 已提交记录恢复，归档 ID 和原查询 ID 可区分 | 否（人工） | 待执行 |
| M09 自动归档确认与启停 | 自动归档关闭，已有可核对的测试记录 | 阅读隐私说明，尝试启用后取消，再确认启用；产生查询后确认停用 | 取消保持原状态，启用后按规则采集，停用保留已有记录 | 否（人工） | 待执行 |
| M10 归档清理预览与确认 | 专用测试归档中有可清理记录 | 预览后取消并核对记录；重新预览后确认，检查剩余记录 | 取消保留记录，确认按有效预览清理，保护最近有效样本和未知时间记录 | 否（人工） | 待执行 |
| M12 中英文页面与弹层 | 可切换英文和 zh_CN，保留同一组测试历史 | 切换语言并重开首页、回访、历史、诊断、参考和归档页面，查看详情及确认弹层 | 文本使用当前资源，按钮可达，历史来源标识和存储字段稳定 | 否（人工） | 待执行 |
| M13 主题、字号与短屏 | 可切换主题和字号，可观察短屏布局 | 切换深浅主题和字号，滚动各页面，打开详情及确认弹层 | 文字可读、内容可滚动，主要操作和弹层按钮可达 | 否（人工） | 待执行 |

## 隔离补充场景

使用既有受控 API、专用夹具或隔离数据库执行对应套件，再核对日志和结果。编号继续对应原人工场景。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| M03 慢请求、异常与迟到结果 | 可运行受控模型 | 运行 AutoStartup、AutoStartupAdditional 和 StartupNativeCoordinationWaveOne 中的慢请求、异常和完成分支 | 失败、不支持和超时分类准确，终止记录稳定，正常查询和诊断共享原生请求位置 | 否（人工复核，模型自动化辅助） | 待执行 |
| M10 过期清理预览 | 隔离归档允许在预览后改变仓库状态 | 运行 StartupArchiveRepository，生成预览后变更归档并提交旧预览，再执行有效预览 | 拒绝旧预览，保留新状态；有效清理遵守样本豁免 | 否（人工复核，模型自动化辅助） | 待执行 |
| M11 读取失败与恢复 | 专用隔离数据库和可控读写失败条件 | 执行 ArchiveNativeQa、StartupRecoveryB2 对应失败与恢复场景，核对数据和写入状态 | 读取失败时暂停写入，恢复成功后继续；测试清理限于专用库 | 否（人工复核，模型/RDB 自动化辅助） | 待执行 |
| M14 历史中文来源兼容 | 专用 schema-1 夹具 | 执行 RefreshSourceCompatibility，分别恢复 history、archive、revisit 并序列化 | 四类历史中文来源可解码、筛选和显示，写回稳定 code，其余字段语义保持 | 否（人工复核，模型自动化辅助） | 待执行 |

## 环境与运行入口

- 应用包名：`com.samples.appstartupauto`；工程仅包含 `entry` 应用模块，平台与存储实现在同一模块内；`entry_test` 为 entry 的 ohosTest 测试目标。
- 使用 OpenHarmony SDK `26.0.0`、支持该 SDK 的 DevEco Studio 和本机调试签名。
- 框架：`@ohos/hypium` `1.0.25`、`@kit.TestKit`；主 Ability 为 `EntryAbility`，隔离 UI 宿主为 `FeatureQaAbility`。
- 在 IDE 中选择 `ohosTest` 配置、设备、[OpenHarmonyTestRunner](<entry/src/ohosTest/ets/testrunner/OpenHarmonyTestRunner.ets>)和套件/用例过滤器后执行，保存 Hypium 报告。Runner 在 delegator 注册后延迟加载[测试列表](<entry/src/ohosTest/ets/test/List.test.ets>)并初始化 UiTest 导出器。
- [Mate80ApiProbeRunner](<entry/src/ohosTest/ets/testrunner/Mate80ApiProbeRunner.ets>)为独立 API 观测入口，记录能力检测和自身状态查询。

## 测试分层与技术口径

| 层级 | 入口或套件 | 检查内容 |
|---|---|---|
| 受控模型 | AutoStartup 及历史、回访、规则、归档套件 | 查询编排、超时、筛选、隐私、清理和兼容性 |
| 原生 RDB | ArchiveNativeQa；StartupArchiveServiceIntegration 使用真实私有 RDB 和受控查询 API | 事务、持久化、关闭、冲突和恢复 |
| 隔离 UI | ArchiveUiQa 在 FeatureQaAbility 中运行 StartupArchivePanel | 归档组件保存、筛选、复制、分页和确认提示 |
| 人工应用操作 | 本文基本场景 | 实际设备上的页面、查询结果和操作反馈 |

1. 查询超时后原生请求继续执行，共享请求位置保持到请求结束；归档读取失败暂停写入，恢复使用已提交记录。
2. 回访记录生命周期和查询关联。设置变更由执行人核对；重启拉起专项先记录设置和查询结果，再重启，并在手动打开应用前保存系统拉起证据。

## 用例编号、运行名与日志

现有索引包含 28 个套件，文档登记 624 条用例。`test功能0001` 与运行名 `com.samples.appstartupauto_功能_0001` 保持映射，`@tc.number`、`@tc.name` 和 flags 沿用原值。Runner 支持既有名称过滤器，套件名、超时和 watchdog 参数保持原设置。

[TestLog](<entry/src/ohosTest/ets/support/TestLog.ets>)使用 `0xF811` 和 `[Sample_AppStartupAuto]`，记录完整用例名、开始/失败/结束和静态断言位置。begin/end 标记主体边界，断言结论读取 Hypium 报告。日志保留原 matcher 和参数求值语义，并对字符串、对象及非公开数值脱敏。

- 模型用例使用中文资源夹具，历史中文来源用于兼容性测试；ArchiveUiQa 按实际 Context 生成资源文本和 `ON.text` 条件。
- 清理包含 `afterEach`、逆序释放、原生等待、RDB close/delete 和 watchdog 释放，仅终止测试持有的 Ability。
- 故障场景使用虚构数据和专用隔离库；日志故障保持原业务、断言和清理结果。

## 执行记录格式

表格结果栏为待执行占位，迁移后版本的实际结论由执行人根据对应交付版本、环境和证据填写。

| 交付版本与设备/系统 | SDK/工具、语言与时间 | 用例编号及规范运行名 | 实际输入/操作及返回 | 实际结果与清理情况 | 证据及执行者 |
|---|---|---|---|---|---|
| 按实际填写 | 按实际填写 | 按实际填写 | 按实际填写 | 执行后填写 | 按实际填写 |

## 附录：既有套件映射

| 套件源码 | 前置与操作 | 主要预期 |
|---|---|---|
| [AutoStartup](<entry/src/ohosTest/ets/test/AutoStartup.test.ets>) | 使用受控 API 和时钟，分别返回支持、开关状态、异常和慢请求 | 支持与状态分离，失败和超时单独显示，请求及计时器完成清理 |
| [AutoStartupAdditional](<entry/src/ohosTest/ets/test/AutoStartupAdditional.test.ets>) | 输入空拒绝载荷，推进超时时钟，再完成迟到请求 | 异常分类准确，终止样本稳定，显示与阶段一致 |
| [HistoryCoverage](<entry/src/ohosTest/ets/test/HistoryCoverage.test.ets>) | 恢复私有历史，注入读写失败和交错写入 | 失败时保护旧数据，保存顺序和内存结果正确 |
| [HistoryArchiveMatrix](<entry/src/ohosTest/ets/test/HistoryArchiveMatrix.test.ets>) | 对边界历史编解码、过滤、汇总、比较和导出 | 限额和顺序正确，导出脱敏，样本不足时显示提示 |
| [StartupHistoryViewWaveTwo](<entry/src/ohosTest/ets/test/StartupHistoryViewWaveTwo.test.ets>) | 切换范围，选择样本、时间边界和明细 | 列表、计数、比较、最新样本和导出范围一致 |
| [StartupNativeCoordinationWaveOne](<entry/src/ohosTest/ets/test/StartupNativeCoordinationWaveOne.test.ets>) | 受控请求同时进入正常查询和诊断，再超时或完成 | 共享请求位置保持到原生请求结束 |
| [StartupRecoveryB2](<entry/src/ohosTest/ets/test/StartupRecoveryB2.test.ets>) | 模拟历史读取、保存、重新挂接及失败恢复 | ID 单调分配，读失败保护原库，成功后恢复保存 |
| [ServiceFlows](<entry/src/ohosTest/ets/test/ServiceFlows.test.ets>) | 开始回访、离开/返回、重查、重试保存 | session/query 及生命周期记录关联正确 |
| [RulesMatrix](<entry/src/ohosTest/ets/test/RulesMatrix.test.ets>) | 遍历能力、错误和回访参考规则 | 边界和优先级自洽 |
| [CapabilityMatrixCases](<entry/src/ohosTest/ets/test/CapabilityMatrixCases.test.ets>) | 构造 API、设备形态、发行版和权限组合 | 规则匹配和降级字段对应输入 |
| [RuleEngineCases](<entry/src/ohosTest/ets/test/RuleEngineCases.test.ets>) | 输入已知/未知错误码并检查重试建议 | 未知码安全回退，失败和不支持分别分类 |
| [DiagnosticCoverage](<entry/src/ohosTest/ets/test/DiagnosticCoverage.test.ets>) | 分别运行受控能力和状态探针，选择指引 | 探针阶段、结果和结论独立，指引对应输入 |
| [OnboardingCases](<entry/src/ohosTest/ets/test/OnboardingCases.test.ets>) | 构造权限状态和申请次数，计算策略 | 计数、频控和不再询问分支正确 |
| [ReminderTextCases](<entry/src/ohosTest/ets/test/ReminderTextCases.test.ets>) | 输入静默时段、次数和文案模板 | 提醒策略、文本审计和占位符正确 |
| [HistoryInsightMatrixCases](<entry/src/ohosTest/ets/test/HistoryInsightMatrixCases.test.ets>) | 组合保留档位、时间和结果边界 | 分桶、压缩和报告对应输入 |
| [RevisitFlowMatrixCases](<entry/src/ohosTest/ets/test/RevisitFlowMatrixCases.test.ets>) | 模拟回访准入、取消、过期、重查及恢复 | 比较资格明确，尝试有界，恢复状态正确 |
| [ArchiveIndexCases](<entry/src/ohosTest/ets/test/ArchiveIndexCases.test.ets>) | 构造日期、来源、结果和索引容量数据 | 字段、日期索引、分布、趋势和截断正确 |
| [CoordinatorJournalCases](<entry/src/ohosTest/ets/test/CoordinatorJournalCases.test.ets>) | 注入受控计时和失败遥测收集器 | 事件关联正确，收集失败时保留业务结果 |
| [RetentionPolicyCases](<entry/src/ohosTest/ets/test/RetentionPolicyCases.test.ets>) | 预览按天数/条数清理及边界样本 | 失败样本额外保留，最近有效样本豁免，未知时间记录受保护 |
| [FaultArchiveCases](<entry/src/ohosTest/ets/test/FaultArchiveCases.test.ets>) | 遍历故障目录和归档规则，生成处置顺序 | 编号、归属、优先级和策略自检一致 |
| [EvidenceOnboardingCases](<entry/src/ohosTest/ets/test/EvidenceOnboardingCases.test.ets>) | 缺失/补齐证据，执行依赖、必做和跳过分支 | 证据准入、步骤依赖和进度正确 |
| [StartupArchiveCodec](<entry/src/ohosTest/ets/test/StartupArchiveCodec.test.ets>) | 对 schema、隐私字段、非法记录和 UTF-8 容量编解码 | 拒绝无效或超限数据，长期归档错误信息脱敏 |
| [StartupArchiveRepository](<entry/src/ohosTest/ets/test/StartupArchiveRepository.test.ets>) | 受控存储下保存、筛选、分页、复制、清理和失败重试 | 展示已提交视图，拒绝过期预览 |
| [StartupArchiveCapture](<entry/src/ohosTest/ets/test/StartupArchiveCapture.test.ets>) | 终止查询后采集，注入排队和容量压力，启停自动采集 | 默认关闭，队列有界，停用后保留已有记录 |
| [StartupArchiveServiceIntegration](<entry/src/ohosTest/ets/test/StartupArchiveServiceIntegration.test.ets>) | 私有 RDB 加受控查询 API，执行服务集成流程 | 持久化、失败、重新打开和清理符合契约 |
| [ArchiveNativeQa](<entry/src/ohosTest/ets/test/ArchiveNativeQa.test.ets>) | 隔离 RDB 打开、读写、冲突、故障和生命周期 | 事务、版本、关闭和恢复正确，专用库完成清理 |
| [ArchiveUiQa](<entry/src/ohosTest/ets/test/ArchiveUiQa.test.ets>) | UiTest 操作隔离宿主中的正式 StartupArchivePanel | 保存、筛选、复制、确认取消、分页和失败提示符合当前资源 |
| [RefreshSourceCompatibility](<entry/src/ohosTest/ets/test/RefreshSourceCompatibility.test.ets>) | 输入历史中文来源，恢复 history/archive/revisit 并序列化 | 来源规范为稳定英文 code，schema、记录、归档和 session 标识保持 |
