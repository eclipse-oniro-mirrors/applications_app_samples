# AppStartupAuto 测试说明

[中文介绍](README_zh.md) | [English overview](README.md)

## 当前验证状态

**这批修改未编译、未构建、未运行测试。** 用户已明确禁止继续执行编译/构建检查与应用测试，因此这里只说明真实存在的用例、执行方式与预期，不记录 PASS，不提供未拍摄的截图。此前针对隔离备份的工具链探测不属于本批修改的验证结果。

完成项仅包括文件与版权头、JSON 格式、资源键与引用、测试注册入口、稳定 ID/历史兼容路径的文本检查。真机 API 支持、原生 RDB、UiTest、语言切换和视觉布局均待后续授权验证。

## 测试环境与入口

- SDK 配置：`26.0.0`；保留工程现有 `modelVersion`，不凭空改成参考工程版本。
- 主包：`com.example.appstartupauto`；主模块 `entry`；测试模块 `entry_test`。
- 主 Ability：`EntryAbility`；UI 测试 Ability：`FeatureQaAbility`。
- Hypium 入口：[OpenHarmonyTestRunner.ets](entry/src/ohosTest/ets/testrunner/OpenHarmonyTestRunner.ets)。测试列表：[List.test.ets](entry/src/ohosTest/ets/test/List.test.ets)。独立 [Mate80ApiProbeRunner.ets](entry/src/ohosTest/ets/testrunner/Mate80ApiProbeRunner.ets) 是设备探针，不是本次执行结果。
- 使用支持 SDK 26 的 DevEco Studio，安装工程声明的测试依赖，配置自己的签名并连接测试设备。后续获得运行授权后，通过 IDE 的 `ohosTest` 配置选择上述 runner/suite；保留调用方原有 class filters 与超时参数。
- 不提供通用 `hdc` 命令中的伪造 HAP 文件名：构建产物名、设备序列号、签名配置和测试过滤参数应取自实际部署环境。

## 自动化用例（实际源文件）

以下各组均已由测试列表注册。原有 case 名、`@tc.number`、flags、受控时钟、清理和 native wrapper 保持原契约；共享日志入口在 case 执行前写 `begin`，异常写 `failure` 并重新抛出，`finally` 写 `end`。`end` 不是 PASS。

| 测试源文件 | 真实覆盖范围 | 状态 |
|---|---|---|
| [AutoStartup.test.ets](entry/src/ohosTest/ets/test/AutoStartup.test.ets) | 支持/不支持、启用/关闭、探测异常、查询失败、超时与清理 | 未运行 |
| [AutoStartupAdditional.test.ets](entry/src/ohosTest/ets/test/AutoStartupAdditional.test.ets) | 空拒绝载荷、超时后的迟到结果、显示标签和生命周期补充分支 | 未运行 |
| [HistoryCoverage.test.ets](entry/src/ohosTest/ets/test/HistoryCoverage.test.ets) | 私有历史恢复、保存失败、读写顺序与内存结果 | 未运行 |
| [HistoryArchiveMatrix.test.ets](entry/src/ohosTest/ets/test/HistoryArchiveMatrix.test.ets) | 历史编解码、限制、过滤、汇总、比较和脱敏 | 未运行 |
| [StartupHistoryViewWaveTwo.test.ets](entry/src/ohosTest/ets/test/StartupHistoryViewWaveTwo.test.ets) | 当前范围、时间边界、指定比较、明细和导出预览 | 未运行 |
| [StartupNativeCoordinationWaveOne.test.ets](entry/src/ohosTest/ets/test/StartupNativeCoordinationWaveOne.test.ets) | 正常查询与独立诊断的原生单飞、超时和迟到结果 | 未运行 |
| [StartupRecoveryB2.test.ets](entry/src/ohosTest/ets/test/StartupRecoveryB2.test.ets) | 私有历史读写恢复、失败保护、已分配 ID 和重新挂接 | 未运行 |
| [ServiceFlows.test.ets](entry/src/ohosTest/ets/test/ServiceFlows.test.ets) | 服务级回访关联、重试、前后台和持久化流程 | 未运行 |
| [RulesMatrix.test.ets](entry/src/ohosTest/ets/test/RulesMatrix.test.ets) | 能力/错误/回访规则矩阵 | 未运行 |
| [CapabilityMatrixCases.test.ets](entry/src/ohosTest/ets/test/CapabilityMatrixCases.test.ets) | API/设备/发行版与权限边界的受控模型 | 未运行 |
| [RuleEngineCases.test.ets](entry/src/ohosTest/ets/test/RuleEngineCases.test.ets) | 错误目录、未知码、重试和用户操作建议 | 未运行 |
| [DiagnosticCoverage.test.ets](entry/src/ohosTest/ets/test/DiagnosticCoverage.test.ets) | 独立探针、结论分类、指引选择 | 未运行 |
| [OnboardingCases.test.ets](entry/src/ohosTest/ets/test/OnboardingCases.test.ets) | 权限申请策略模型，不实际授权 | 未运行 |
| [ReminderTextCases.test.ets](entry/src/ohosTest/ets/test/ReminderTextCases.test.ets) | 提醒频控、静默时段、文案/模板审计，不实际发送通知 | 未运行 |
| [HistoryInsightMatrixCases.test.ets](entry/src/ohosTest/ets/test/HistoryInsightMatrixCases.test.ets) | 保留档位、时间/结果组合 | 未运行 |
| [RevisitFlowMatrixCases.test.ets](entry/src/ohosTest/ets/test/RevisitFlowMatrixCases.test.ets) | 回访阶段、比较资格、超时/取消、恢复和有界尝试 | 未运行 |
| [ArchiveIndexCases.test.ets](entry/src/ohosTest/ets/test/ArchiveIndexCases.test.ets) | 字段校验、日期索引、来源统计、趋势与索引限额 | 未运行 |
| [CoordinatorJournalCases.test.ets](entry/src/ohosTest/ets/test/CoordinatorJournalCases.test.ets) | 遥测隔离、受控计时与日志事件约束 | 未运行 |
| [RetentionPolicyCases.test.ets](entry/src/ohosTest/ets/test/RetentionPolicyCases.test.ets) | 天数/条数清理、失败样本额外保留、最近有效样本豁免 | 未运行 |
| [FaultArchiveCases.test.ets](entry/src/ohosTest/ets/test/FaultArchiveCases.test.ets) | 故障目录、责任归属、处置顺序与归档策略 | 未运行 |
| [EvidenceOnboardingCases.test.ets](entry/src/ohosTest/ets/test/EvidenceOnboardingCases.test.ets) | 证据链完整性、引导依赖、必做/跳过 | 未运行 |
| [StartupArchiveCodec.test.ets](entry/src/ohosTest/ets/test/StartupArchiveCodec.test.ets) | 归档 schema、记录校验、UTF-8 容量与脱敏字段 | 未运行 |
| [StartupArchiveRepository.test.ets](entry/src/ohosTest/ets/test/StartupArchiveRepository.test.ets) | 已提交视图、分页过滤、失败重试、清理和复制 | 未运行 |
| [StartupArchiveCapture.test.ets](entry/src/ohosTest/ets/test/StartupArchiveCapture.test.ets) | 实际终止查询采集、限额、排队、自动归档开关 | 未运行 |
| [StartupArchiveServiceIntegration.test.ets](entry/src/ohosTest/ets/test/StartupArchiveServiceIntegration.test.ets) | 真实私有 RDB + 受控查询 API 的服务集成；保留 withServiceArchiveIntegration 清理 | 未运行；需设备 |
| [ArchiveNativeQa.test.ets](entry/src/ohosTest/ets/test/ArchiveNativeQa.test.ets) | 真实 RDB 打开/读写/修复、原生失败和生命周期；保留 withArchiveNativeQa 清理 | 未运行；需设备 |
| [ArchiveUiQa.test.ets](entry/src/ohosTest/ets/test/ArchiveUiQa.test.ets) | 正式 StartupArchivePanel 的保存/筛选/复制/确认/分页，独立宿主与 UiTest | 未运行；需设备 |
| [RefreshSourceCompatibility.test.ets](entry/src/ohosTest/ets/test/RefreshSourceCompatibility.test.ets) | 本次新增的历史中文来源迁移与稳定英文 ID 回归 | 未运行 |

## 新增来源兼容用例步骤与预期

| case | 步骤 | 预期 |
|---|---|---|
| `testRefreshSourceCompatibility0001` | 对四个历史中文值及四个英文值调用解析器；再输入未知值 | 对应 `initial/manual/foreground/settings`；未知值拒绝，不自动归到某来源 |
| `testRefreshSourceCompatibility0002` | 将历史值放入旧数组与 schema-1 history，再恢复和序列化 | 记录不丢失，写回 source 为英文；schema、记录 ID 和其它字段语义不变 |
| `testRefreshSourceCompatibility0003` | 构造含旧来源的 RDB document JSON，解码再编码 | archiveId、revision、schema 保留，record.source 规范化，输出不再写旧来源 |
| `testRefreshSourceCompatibility0004` | 回访保存旧来源的 before 证据，再新建 tracker 恢复 | before.source 转英文，sessionId 保留，不恢复不存在的原生进行中请求 |

## 手动端到端检查（待后续授权）

每项开始前记录系统版本、SDK/API、设备形态、应用版本、语言与时间。需要系统支持的情形，如果设备不支持应记录“不适用/实际错误码”，不得伪造成功路径。

| ID | 操作步骤 | 预期结果 | 状态 |
|---|---|---|---|
| M01 | 首次启动；展开调用详情 | 能力/状态分开显示，真实返回值和时间可见；无成功证据时不显示已开启 | 未运行 |
| M02 | 连续点击刷新；查询中反复前后台切换 | 不创建并发原生状态请求；相同回访返回事件不重复关联查询 | 未运行 |
| M03 | 用获准的故障注入环境制造慢请求/异常 | 超时不伪造取消；迟到结果不覆盖已终止样本；失败/不支持/超时区分 | 未运行 |
| M04 | 成功查询后开始手动回访，离开应用再返回 | 记录明确离开/返回时间和关联 query ID，比较同轮证据，不声称设置已修改 | 未运行 |
| M05 | 回访后取消；另一次超过 10 分钟再返回 | 取消/过期有明确说明，不拿无效样本得出开启/关闭结论 | 未运行 |
| M06 | 历史页选择来源/结果/时间，指定前后样本 | 列表、计数、详情、比较与当前范围一致；范围外选择提示重选 | 未运行 |
| M07 | 当前范围/全量导出；检查剪贴板 | 两个入口范围明确；邮件、长号码等被掩码；长归档不含原始错误说明 | 未运行 |
| M08 | 保存当前范围、重启、查看已保存归档 | 仅成功提交的记录可恢复；archiveId 与原查询 ID 区分 | 未运行 |
| M09 | 启停自动归档并取消一次确认 | 开关需确认；取消不改变原存档；停用不删除既有证据 | 未运行 |
| M10 | 清理预览后改变存档再确认；另一次正常确认 | 过期预览不能错误删除新状态；正常清理遵守最近有效样本豁免 | 未运行 |
| M11 | 在隔离测试库制造读失败，重试读取/保存 | 读失败时不覆盖未知旧库；恢复后才允许写入，不虚报已保存 | 未运行 |
| M12 | 英文和 `zh_CN` 各重启应用一次，检查全部页面/弹层/提示/旧历史 | 默认英文、中文资源正确；筛选与持久化标识不随语言改变；长英文不遮挡按钮 | 未运行 |
| M13 | 深色/浅色、字号调整、短屏滚动 | 对比度可读，按钮/弹层可操作，无关键内容不可达 | 未运行 |
| M14 | 使用历史中文 source 的 schema-1 数据启动，筛选与导出 | 四类来源可恢复、筛选和显示；后续写回英文标识，不更改其它稳定 ID | 未运行 |

## 清理与结果记录

- 保留测试现有 `afterEach`、`try/finally`、RDB close/delete 与 UI 宿主停止清理；不要为日志去掉这些封装。
- 原生/RDB 失败实验只能使用测试夹具创建的隔离数据库，不手工删除用户生产数据库来“修复”测试。
- 每次后续执行应保存 runner/class filters、超时配置、设备信息、失败 case 和日志。只有实际执行并获得结果后才能填写 PASS/FAIL。
- 截图仅能来自真实设备/模拟器执行，须写明环境与时间；本次没有截图。
