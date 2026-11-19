# AppPerformance 测试用例归档

[中文说明](<README_zh.md>) · [English](<README.md>)

## 归档范围与结果边界

本文说明当前单 entry 工程的 444 个带编号 leaf case、2301 处源码断言及原编号映射；这些是源码覆盖口径，不是执行数或通过数。结果栏用于当前迁移版本的后续执行记录，由执行人记录环境、操作和证据后填写。迁移前的归档不提供当前版本的总体通过结论；实际注册、执行数量及断言结果以对应环境的 Hypium 框架报告为准。

功能边界不随目录迁回改变：受控夹具不能替代真实回收、实际 HyperSnap 启动或 Native 文件页观测；设备语言、短屏和大字号仍需专项检查。保留原安全日志、国际化契约、随包资源和独立 Runner 的副作用与清理要求。

## 基本功能人工用例

基本流程先做目标发现、资源校验和无回收对照（control）。下表沿用 AP-DEVICE 专项编号，使用专用测试数据。执行时记录应用版本、设备和系统/API、语言、主题、字号及时间。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| AP-DEVICE-01 页面与目标发现 | 应用已安装并可启动 | 启动应用，查看五个页签，进入实验台；在内存优化页刷新文件和模块目标 | 页面可达，列出本应用实际发现的文件和模块 | 否（人工） | 待执行（实际填写） |
| AP-DEVICE-01 输入边界 | 位于内存优化页，无正在执行任务 | 提交空值、目录形式和非法后缀，再选择合法文件或模块；本步骤仅检查输入和选择 | 非法输入被本地阻止，合法目标可选 | 否（人工） | 待执行（实际填写） |
| AP-DEVICE-01 基线与完整性 | 随包资源可读取，尚无该资源基线 | 先尝试校验，再读取资源建立基线，重新校验同一资源 | 无基线时提示先读取；读取后显示资源身份、字节数和校验结果 | 否（人工） | 待执行（实际填写） |
| AP-DEVICE-01 文本 control | 选择“示例文本”和“无回收对照”，无未结束任务 | 点击“运行一次实验”，查看阶段和回读结果 | 完成目标发现、配置校验、负载读取、对照、同资源重读和配置回读，显示完整性结果 | 否（人工） | 待执行（实际填写） |
| AP-DEVICE-01 笔记列表 control | 选择笔记列表和无回收对照，无未结束任务 | 运行一次，查看负载、阶段和回读结果 | 显示笔记列表资源、各阶段状态及同资源校验结果 | 否（人工） | 待执行（实际填写） |
| AP-DEVICE-01 图片索引 control | 选择图片索引和无回收对照，无未结束任务 | 运行一次，查看负载、阶段和回读结果 | 显示图片索引资源、各阶段状态及同资源校验结果 | 否（人工） | 待执行（实际填写） |
| AP-DEVICE-01 表单草稿 control | 选择表单草稿和无回收对照，无未结束任务 | 运行一次，查看负载、阶段和回读结果 | 显示表单草稿资源、各阶段状态及同资源校验结果 | 否（人工） | 待执行（实际填写） |
| AP-DEVICE-01 系列与停止后续 | control 模式，可在执行中操作 | 检查默认 3 次和 1–10 次边界，开始系列，选择“本次完成后停止” | 运行中配置冻结，当前次结束后停止；计数按实际执行次数更新 | 否（人工） | 待执行（实际填写） |
| AP-DEVICE-01 取消等待 | control 模式，有可观察的 pending 操作 | 在等待中取消，查看任务状态和后续操作按钮 | 结束本地等待；底层工作完成前保持隔离，结束后恢复可操作状态 | 否（人工） | 待执行（实际填写） |
| AP-DEVICE-01 历史与报告 | 已保存测试系列，执行人同意复制会改写剪贴板 | 选择一个系列，查看计划/开始/完成数、引用和缺口；复制 Markdown、CSV 和脱敏账本 | 报告使用所选系列的有效引用，显示分组统计和缺失项；导出内容完成脱敏 | 否（人工） | 待执行（实际填写） |
| AP-DEVICE-02 重开恢复 | 已保存测试记录，记下记录和系列 ID | 退出后重新进入应用，对照记录数、系列引用和完整性 | 已提交记录、ID 和系列引用恢复 | 否（人工） | 待执行（实际填写） |
| AP-DEVICE-05 语言与布局 | 可切换英文/zh_CN、主题和字号，可观察短屏布局 | 切换后重开应用，检查五个页签、实验台、状态、对话框、历史和报告，滚动至底部 | 文本和参数使用当前资源，关键按钮可达，持久化内容保持稳定 | 否（人工） | 待执行（实际填写） |

停止或取消的操作窗口过短时，可使用 SeriesUiQa 的 pending 夹具继续检查。

## 快启与系统专项

这些操作单独执行。运行前确认目标和设置原状态；快启设置、回收请求及独立 Runner 均有实际副作用。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| AP-DEVICE-03 快启设置与重建 | 已同意改变设置，设备提供对应 API，已记录原状态 | 开启或关闭快启，按需请求重建并检查冷却，记录最终状态 | 显示请求结果、错误码和冷却状态 | 否（人工专项） | 待执行（实际填写） |
| AP-DEVICE-03 实际快启启动 | 设备具备快启路径，已同意系统启动操作 | 记录真实系统启动，核对 onLaunchFromHyperSnap 回调、启动 ID 和 trace | 启动路径、回调和 trace 对应同一次启动 | 否（人工专项） | 待执行（实际填写） |
| AP-DEVICE-04 回收请求与观测 | 已同意副作用，目标与内核/文件访问条件满足 | 分别运行 NativeApiRunner 或 FilePageRunner，保存返回值和诊断 | 记录请求结果、私有文件校准、持有映射和采样时刻；不可观测项为 null | 独立 Runner | 待执行（实际填写） |
| AP-DEVICE-06 失败与清理 | 专用隔离夹具或命名空间 | 分别执行主体失败、清理失败、双失败和超时场景，检查日志及资源释放 | 双失败保留主体错误，清理测试所有者资源并释放 timer | 隔离自动化与人工复核 | 待执行（实际填写） |

### 独立 Runner

| Runner | 入口参数与行为 | 运行注意事项 |
|---|---|---|
| [NativeApiRunner.ets](<entry/src/ohosTest/ets/testrunner/NativeApiRunner.ets>) | 无额外控制参数；执行真实文件/模块回收、关闭再开启快启、请求重建 | 逐项等待 10 秒，超时记为 timeout-unsettled 并停止剩余派发；中止时可能保留中间设置状态，需人工核对和恢复 |
| [HyperSnapControlRunner.ets](<entry/src/ohosTest/ets/testrunner/HyperSnapControlRunner.ets>) | `enabled=true\|false`，可选 `rebuild=true\|false`；重建要求 enabled=true | 设置或重建前核对参数；非法参数在本地结束 |
| [FilePageRunner.ets](<entry/src/ohosTest/ets/testrunner/FilePageRunner.ets>) | `mode=all\|control\|file\|module`，`rounds=1..3`；默认 all / 1 | 执行私有文件校准、持有映射、被动采样、完整性回读和 trace；超时或映射释放失败时停止诊断 |

独立 Runner 与默认逻辑套件分别运行。公共日志记录参数摘要、状态、计数和错误码，完整诊断保存在应用私有目录。分享前对设备信息、inode 和本地路径脱敏；主体和清理同时失败时保留主体错误。

## 单 entry 实现与测试路径

- 应用实现统一位于 entry。[AppService.ets](<entry/src/main/ets/core/AppService.ets>) 直接使用 [SafeExecutor.ets](<entry/src/main/ets/core/SafeExecutor.ets>)、[ExperimentLedger.ets](<entry/src/main/ets/core/ExperimentLedger.ets>) 和 [ReportExport.ets](<entry/src/main/ets/core/report/ReportExport.ets>) 的 `exportReport`；模型文件为真实实现，不再经转发桥或特性 facade。报告辅助实现保留在 core 的 report 子目录。
- [AppPlatform.ets](<entry/src/main/ets/core/AppPlatform.ets>) 同时包含 I/O 端口和 SDK、资源、存储适配；模型测试仍可注入 FakePlatform、MemoryStore 和虚拟时钟。[TextMessages.ets](<entry/src/main/ets/core/TextMessages.ets>) 合并 formatter、文本端口和 Context 资源适配，[MessageCatalog.ets](<entry/src/main/ets/core/MessageCatalog.ets>) 位于同一 core 目录。
- [WorkloadLabPage.ets](<entry/src/main/ets/workload/pages/WorkloadLabPage.ets>) 场景及 [Index.ets](<entry/src/main/ets/pages/Index.ets>) 路由保持不变；测试入口继续位于 entry 的 ohosTest 源集，无额外公共导出模块。
- [pageprobe.cpp](<entry/src/main/cpp/pageprobe.cpp>)、[CMakeLists.txt](<entry/src/main/cpp/CMakeLists.txt>) 和本地 [libpageprobe.so 类型声明](<entry/src/main/cpp/types/libpageprobe/index.d.ts>) 原样保留，属于 entry 的 Native 依赖；独立 Runner 与真实设备专项仍有效。

## 测试入口

- 应用包名：`com.samples.appperformance`。单一应用模块：entry；测试模块：`entry_test`。隔离 UI Ability：`TestAbility`。
- 默认入口：[OpenHarmonyTestRunner.ets](<entry/src/ohosTest/ets/testrunner/OpenHarmonyTestRunner.ets>)；套件注册：[List.test.ets](<entry/src/ohosTest/ets/test/List.test.ets>)。在 DevEco Studio 的 ohosTest 配置中选择设备、套件或用例后运行。
- 使用 SDK `26.0.0`、配套工具链、本机调试签名和已解锁设备。
- `@tc.number` 和 `@tc.name` 保留原编号映射。运行名为 `com.samples.appperformance_<功能>_<原四位序号>`，如 `testAppPerformanceCore0001` 对应 `com.samples.appperformance_AppPerformanceCore_0001`。Runner 对 `class`、`notClass`、`itName` 中的旧 leaf 名称按此规则映射，套件名和 Hypium flags 保持原值。

## 测试分层与结果口径

| 层级 | 测试输入或入口 | 检查内容 |
|---|---|---|
| 受控模型 | FakePlatform、MemoryStore、虚拟时钟 | 参数、编排、完整性、保存、系列引用、报告和故障处理 |
| 正式组件隔离 UI | TestAbility、UiTest、正式组件与服务、可控 I/O | State/Prop、按钮、系列状态和复制契约 |
| 原生资源与隔离存储 | TargetDiscovery、SeriesNativeQa | 安装目标、随包资源、uptime 和 Preferences 恢复；回收操作使用夹具 |
| 真实系统专项 | 独立 Runner、设备启动操作 | API 返回、文件页观测、启动回调和 trace |
| 人工应用流程 | 本文基本用例 | 页面操作、状态、历史和报告 |

统一按以下技术口径记录结果：

1. 回收 API 的返回表示请求结果；实际回收量需要独立测量，私有文件校准和 PRESENT 变化各按自身范围记录。实际 HyperSnap 启动以系统回调取证，内容加载耗时和首帧耗时分别测量。
2. 超时或取消结束本地等待，底层 SDK Promise 继续执行。完成前维持隔离，迟到结果归原请求 ID；后续请求等待隔离解除。
3. 自动化结论使用 Hypium 全量汇总、失败期望、异常堆栈和 Runner 输出。`app-performance-test-report.json` 来自 `caseResults()`，仅记录 BoundedCase 主体；`body-returned` 表示主体返回，Hypium 仍可能记录失败期望。直接 `loggedIt` 用例另见框架报告，`scope`、`verdictSource` 和主体计数用于说明遥测范围。

## 既有自动化覆盖表

原六列覆盖表如下。“独立 Runner”和“否，专项”行按各自入口执行。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 文件参数与模块发现 | 可控平台夹具 | 空值、空白、重复名、三种合法后缀、路径、控制字符、上限及不存在模块 | 合法输入 trim、去重后调用；非法输入本地 blocked；目标与发现结果对应 | 是 | 待执行（实际填写） |
| 请求状态与原始错误 | 可挂起、拒绝和不支持的平台夹具 | pending 请求、释放、拒绝码、SDK 不可用 | 状态与耗时对应，保留原始错误码，busy 状态正确清除 | 是 | 待执行（实际填写） |
| 资源基线与完整性 | 可控资源内容 | 无基线校验、相同内容、变化内容、空内容及读取失败 | 基线准入、字节与校验值正确，读取失败单独显示 | 是 | 待执行（实际填写） |
| 快启设置、重建与保存 | 隔离存储、虚拟时钟 | 开关、设置失败、重建、冷却、写入失败、重新打开服务 | 失败保留上次成功值，冷却持续生效，恢复已保存状态 | 是 | 待执行（实际填写） |
| 本地超时与未结束任务隔离 | 可挂起 SDK Promise | 超时、二次请求、取消、迟到完成及重复释放 | 隔离持续到请求结束，迟到结果归原 ID，timer 释放 | 是 | 待执行（实际填写） |
| 六阶段维护流程 | 配置与资源夹具 | control、files、modules，各阶段失败或内容/配置变化 | 阶段顺序正确，状态与实际结果对应，失败后显式跳过 | 是 | 待执行（实际填写） |
| 计划、负载、预算与阈值 | 本地数据模型 | 目录审计、依赖图、边界值、缺失指标和退化样本 | 规则自洽，缺失项标为不可评估，按合格样本分组统计 | 是 | 待执行（实际填写） |
| 报告条件、脱敏和交付 | 带条件和故障的实验记录 | 多组条件、路径、凭据、长数字、长度限制、Markdown / CSV | 按组统计、列出缺口，完成脱敏与结构校验后交付 | 是 | 待执行（实际填写） |
| 系列所有权与状态机 | 隔离系列夹具 | 默认/边界次数、停止后续、取消、外部状态修改、条件变化 | 记录实际执行次数和本系列引用，服务状态独立，条件变化时停止后续 | 是 | 待执行（实际填写） |
| 系列持久化与坏数据恢复 | 隔离存储 | 初始/完成保存失败、损坏/重复引用、元信息淘汰 | 提交后更新保存状态，恢复已有结果，明确显示缺失引用 | 是 | 待执行（实际填写） |
| 响应式正式组件 | TestAbility 与 UiTest Driver 可用 | 更新 State / Prop、切换内存与日志卡片 | 可见内容和 enabled 状态更新，结果使用当前语言资源 | 是 | 待执行（实际填写） |
| 系列正式面板 | 正式组件、服务及可控 I/O | empty、pending、complete、resourceFailure、saveFailure、conditionChange | 按状态冻结或开放按钮，复制当前系列，显示失败与隔离状态 | 是 | 待执行（实际填写） |
| 安装目标发现 | 已安装的测试应用 | 读取自身 bundle 元信息与可访问文件 | 列出实际存在的目标 | 是，设备 | 待执行（实际填写） |
| 原生资源与 Preferences 边界 | 隔离测试命名空间 | 随包读取、真实 uptime、落盘、清除缓存后重开 | 已保存记录恢复，清理限于测试命名空间 | 是，设备 | 待执行（实际填写） |
| 真实回收请求与原生调用 | 已同意副作用，系统提供 API | 独立 NativeApiRunner | 记录每项真实返回、错误码和耗时 | 独立 Runner | 待执行（实际填写） |
| 文件页与持有映射观测 | 内核和文件访问条件满足，已同意副作用 | 独立 FilePageRunner，control / file / module，1–3 轮 | 分别记录校准、文件身份、采样时刻、完整性和可信性；不可观测为 null | 独立 Runner | 待执行（实际填写） |
| 实际 HyperSnap 启动 | 已同意改变设置，设备提供快启路径 | 设置、重建、冷却及实际启动 | 取得 onLaunchFromHyperSnap 回调及对应启动记录 | 否，专项 | 待执行（实际填写） |
| 显式中英文显示契约 | 固定显示资源 fixture | 消息参数、指纹、历史恢复、双格式报告、失败颜色和不透明正文 | canonical、schema、checksum 和历史状态稳定，报告保留 BOM 并完成脱敏 | 是，LocaleContracts | 待执行（实际填写） |
| 双语言、短屏与大字号 | 英文或 zh_CN 系统语言 | 重开应用，进入五个页签、实验台、对话框、历史和报告 | 语言和参数正确，按钮可达，历史契约和负载内容稳定 | 否，专项 | 待执行（实际填写） |

## watchdog、清理与日志

1. [BoundedCase.ets](<entry/src/ohosTest/ets/support/BoundedCase.ets>) 为其模型场景使用 10,000 ms 本地 watchdog；默认 Runner timeout 为 12,000 ms，level/flags 按原值交给 Hypium。真实 UI 用例独立使用 [UiTestRuntime.ets](<entry/src/ohosTest/ets/support/UiTestRuntime.ets>) 的 `uiCase`，从 CLI timeout 保留清理与框架余量，不再嵌套该模型 watchdog。
2. [TestLog.ets](<entry/src/ohosTest/ets/support/TestLog.ets>) 为直接注册用例增加 begin/failure/end，保留原 `expect` 和 matcher。断言参数求值一次，日志记录安全摘要；域为 `0xF811`，标签为 `[Sample_AppPerformance]`，附用例名和静态断言位置。每个 leaf case 前通过 `setTimeout(0)` 让出事件循环。
3. [TestMessageResolver.ets](<entry/src/ohosTest/ets/support/TestMessageResolver.ets>) 为模型用例提供中文 fixture；显式 en/zh_CN 契约使用仅同步的 scope，并在正常、异常和嵌套返回时还原原 provider。UI 使用当前设备资源；严格期待按生产语义消息 ID 和资源名读取，不把“资源暂不可用”当作正确计数。
4. [UiTestRuntime.ets](<entry/src/ohosTest/ets/support/UiTestRuntime.ets>) 用唯一 case session、纯 JS selector 和 native single-flight gate 包装 Driver/Component。节点等待为有限 JS 查找轮询，滚动查找为最多八次 swipe；native idle 单次预算至多 500 ms。原 native Promise 真正 settle 前不释放 busy，watchdog 不等于 native 取消；未排空时拒绝后续 UI 派发和新 Driver。SDK 同步 native 阻塞仍不能靠 JS timer 抢占。
5. [UiTestSupport.ets](<entry/src/ohosTest/ets/support/UiTestSupport.ets>) 与 [TestAbility.ets](<entry/src/ohosTest/ets/testability/TestAbility.ets>) 将 Want、页面 ready 和具体 Context 绑定到同一 session。body 内 finally 退休并清理捕获的 owner，不能依赖 Hypium 在失败后执行 afterEach。onDestroy 先释放准确 fixture、还原保存的 provider，再确认销毁；旧 nonce/迟到回调不能借用后续 case。清理使用单一预算和缓存 promise，主体错误优先，清理错误单独保留。
5. 密码、PIN 和图案由操作者输入。测试仅对已识别的系统滑动锁执行一次既定滑动。

## 执行记录与后续验证

当前迁移版本的结果由执行人填写，不提供无执行证据的总体通过结论。每次记录应用和系统版本、设备、语言、时间、实际操作、Hypium/Hilog 结果、资源清理及专项证据。条件不足只描述当次覆盖范围，不代表功能未实现。

## 附录 A：核心用例步骤与原编号

来源：[Core.test.ets](<entry/src/ohosTest/ets/test/Core.test.ets>)，使用受控平台和时钟。

| 源码编号 | 主要步骤 | 预期检查点 |
|---|---|---|
| SUB_PERFORMANCE_APPPERFORMANCECORE_0100 | 提交带空格/重复的合法目标，再逐个提交非法输入及 33 项目标 | 合法目标去重后一次调用；非法输入本地阻止，busy 清除 |
| SUB_PERFORMANCE_APPPERFORMANCECORE_0200 | 挂起请求，推进虚拟时钟 37 ms，释放；再注入拒绝和不支持 | pending → success，错误码和耗时正确，SDK 不可用时本地结束 |
| SUB_PERFORMANCE_APPPERFORMANCECORE_0300 | 提供重复文件/模块，读取合法、结构错误和语法错误配置；请求不存在模块及拒绝分支 | 发现结果去重，配置失败分类准确；无效模块被拦截，拒绝保留原始码 |
| SUB_PERFORMANCE_APPPERFORMANCECORE_0400 | 无基线先校验，读取后验证相同和变化字节，再注入读取失败 | 基线准入、完整性和读取错误状态正确 |
| SUB_PERFORMANCE_APPPERFORMANCECORE_0500 | 开启、关闭、注入设置失败，保存后新建服务实例 | 失败保留成功设置和时间，恢复已保存状态 |
| SUB_PERFORMANCE_APPPERFORMANCECORE_0600 | 重建成功后立即重复，注入保存失败，再推进虚拟 10 秒并注入 SDK 失败 | 冷却持续生效，失败保留上次成功时间和原始码 |
| SUB_PERFORMANCE_APPPERFORMANCECORE_0700 | 挂起至虚拟超时，尝试第二次请求，再释放原请求两次并检查订阅 | 隔离到原请求结束，迟到结果归原 ID，timer 和订阅清理，旧快照稳定 |

## 附录 B：UI 场景步骤与原编号

来源：[ReactiveUi.test.ets](<entry/src/ohosTest/ets/test/ReactiveUi.test.ets>) 与 [SeriesUiQa.test.ets](<entry/src/ohosTest/ets/test/SeriesUiQa.test.ets>)。系列 Harness 使用正式组件、正式服务和可控 I/O。

| 源码编号 | 操作 | 预期检查点 |
|---|---|---|
| SUB_PERFORMANCE_APPPERFORMANCEUI_0100 | 点击更新，切换内存/日志卡片，再次更新 | Prop/State、按钮可用性和耗时更新，显示当前语言状态 |
| SUB_PERFORMANCE_SERIESUIQA_0100 | 打开 empty 面板 | 无样本，开始可用，停止/复制不可用，读取次数为 0 |
| SUB_PERFORMANCE_SERIESUIQA_0200 | 次数减至 1，再增至 10 | 边界按钮禁用，计数按当前语言显示，读取次数为 0 |
| SUB_PERFORMANCE_SERIESUIQA_0300 | 启动 pending 并挂起资源读取 | 配置冻结，停止/取消可用，记录实际读取 |
| SUB_PERFORMANCE_SERIESUIQA_0400 | pending 时请求本次完成后停止，再释放 | 当前次结束后停止，实际执行一次 |
| SUB_PERFORMANCE_SERIESUIQA_0500 | complete 夹具运行默认三次，等待保存 | 三条完整记录及本系列引用可用，报告复制可用 |
| SUB_PERFORMANCE_SERIESUIQA_0600 | 运行 resourceFailure | 一次读取失败后停止，有效样本为 0 |
| SUB_PERFORMANCE_SERIESUIQA_0700 | pending 时取消等待，先不释放再释放 | 原 Promise 未结束时保持隔离，结束后解除，记录取消状态 |
| SUB_PERFORMANCE_SERIESUIQA_0800 | 注入初始保存失败再开始 | 显示保存失败，负载读取为 0，报告复制不可用 |
| SUB_PERFORMANCE_SERIESUIQA_0900 | 第二次实验时改变资源内容再释放 | 条件变化后停止，保留两条实际记录 |
| SUB_PERFORMANCE_SERIESUIQA_1000 | 完成系列并点击正式复制按钮 | 生产导出器写入隔离剪贴板，内容限于当前系列，账本 ID 稳定 |

## 附录 C：既有套件索引

| 源码入口 | 范围 |
|---|---|
| [Additional](<entry/src/ohosTest/ets/test/Additional.test.ets>)、[MaintenanceFlow](<entry/src/ohosTest/ets/test/MaintenanceFlow.test.ets>)、[Experiment](<entry/src/ohosTest/ets/test/Experiment.test.ets>) | 服务边界、六阶段流程、实验完整性与账本 |
| [PlanMatrix](<entry/src/ohosTest/ets/test/PlanMatrix.test.ets>)、[PerformanceRuleCases](<entry/src/ohosTest/ets/test/PerformanceRuleCases.test.ets>)、[FaultThresholdCases](<entry/src/ohosTest/ets/test/FaultThresholdCases.test.ets>) | 计划、规则和阈值 |
| [LaunchBudgetCases](<entry/src/ohosTest/ets/test/LaunchBudgetCases.test.ets>)、[ThresholdGateMatrixCases](<entry/src/ohosTest/ets/test/ThresholdGateMatrixCases.test.ets>)、[LoadFaultWorkloadCases](<entry/src/ohosTest/ets/test/LoadFaultWorkloadCases.test.ets>)、[WorkloadCatalogMatrix](<entry/src/ohosTest/ets/test/WorkloadCatalogMatrix.test.ets>) | 预算、边界、缺失指标和四类负载结构 |
| [ReportCases](<entry/src/ohosTest/ets/test/ReportCases.test.ets>)、[ReportDeliveryB2](<entry/src/ohosTest/ets/test/ReportDeliveryB2.test.ets>)、[PerformanceGroupingWaveOne](<entry/src/ohosTest/ets/test/PerformanceGroupingWaveOne.test.ets>)、[PerformanceConditionWaveTwo](<entry/src/ohosTest/ets/test/PerformanceConditionWaveTwo.test.ets>)、[PerformanceExportWaveTwo](<entry/src/ohosTest/ets/test/PerformanceExportWaveTwo.test.ets>) | 分组、条件、脱敏、导出与交付 |
| [PerformanceExecutorWaveOne](<entry/src/ohosTest/ets/test/PerformanceExecutorWaveOne.test.ets>)、[PerformanceRestoreWaveOne](<entry/src/ohosTest/ets/test/PerformanceRestoreWaveOne.test.ets>)、[PerformanceServiceWaveOne](<entry/src/ohosTest/ets/test/PerformanceServiceWaveOne.test.ets>)、[PerformanceInputWaveTwo](<entry/src/ohosTest/ets/test/PerformanceInputWaveTwo.test.ets>)、[PerformanceThresholdWaveTwo](<entry/src/ohosTest/ets/test/PerformanceThresholdWaveTwo.test.ets>) | 执行器、恢复、异常输入及流程阈值 |
| [SeriesOwnershipFeature](<entry/src/ohosTest/ets/test/SeriesOwnershipFeature.test.ets>)、[SeriesPersistenceFeature](<entry/src/ohosTest/ets/test/SeriesPersistenceFeature.test.ets>)、[SeriesStateFeature](<entry/src/ohosTest/ets/test/SeriesStateFeature.test.ets>) | 系列所有权、保存和状态机 |
| [TemplateCoreCases](<entry/src/ohosTest/ets/test/TemplateCoreCases.test.ets>)、[TemplateRunnerCases](<entry/src/ohosTest/ets/test/TemplateRunnerCases.test.ets>) | 执行和 runner 场景的生产服务边界 |
| [TargetDiscovery](<entry/src/ohosTest/ets/test/TargetDiscovery.test.ets>)、[SeriesNativeQa](<entry/src/ohosTest/ets/test/SeriesNativeQa.test.ets>) | 真实目标、资源、uptime 与隔离 Preferences |
| [LocaleContracts](<entry/src/ohosTest/ets/test/LocaleContracts.test.ets>) | 7 条显式中英参数、canonical/恢复、报告及 opaque 正文契约 |

源码覆盖登记为 444 个带编号 leaf case、2301 处源码断言；实际注册、执行数量与断言结果以相应版本的 Hypium 框架报告为准。

## 附录 D：设备专项原索引

| 专项 | 操作与预期 | 最小证据 |
|---|---|---|
| AP-DEVICE-01 基础链路 | 遍历五个页签与实验台，四类负载各运行 control，检查系列与报告 | bundle、设备/系统/应用版本、记录/系列 ID、截图和脱敏报告 |
| AP-DEVICE-02 重开恢复 | 保存测试记录，退出再进入，对照恢复结果 | 前后 ID、计数、引用及完整性 |
| AP-DEVICE-03 实际快启 | 记录设置请求、冷却和真实系统启动 | onLaunchFromHyperSnap 事件、启动 ID、trace |
| AP-DEVICE-04 Native 与真实回收 | 按设备/内核条件保存请求结果、私有校准和持有映射观测 | 目标身份、原始码、采样时刻、映射及 trace 可信性 |
| AP-DEVICE-05 语言与布局 | 英文/zh_CN、短屏、大字号，覆盖动态状态、历史和报告 | 对应语言画面、按钮可达性和文本完整性 |
| AP-DEVICE-06 失败与清理 | 观察主体失败、清理失败、双失败和超时 | begin/failure/end、原始失败、测试所有者清理及 timer 释放 |
