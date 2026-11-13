# AppContinuation 测试说明

快速导航：[执行记录](<#执行记录>) · [功能用例表](<#用例表>) · [完整用例索引](<#完整用例索引>)。

## 用例表

下表列出功能操作和预期结果。“是否自动”注明对应测试层次，结果由执行者在[执行记录](<#执行记录>)中按版本和实际覆盖范围填写。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 工作台：真实环境与权限入口 | 正常安装并启动正式应用；记录权限初态 | 在工作台主动检查环境、申请权限，注册监听后注销；打开记录/调用详情 | 系统授权/错误与应用反馈可核对，同步受理、异步通知和超时分别显示 | 否（真实系统入口人工检查） | 执行后填写 |
| 工作台：监听与权限门控 | Controller/ContinueClient 注入原生接口、权限与手动时钟 | 用[Controller 场景套件](<entry/src/ohosTest/ets/test/ContinuationScenarios.test.ets>)注入授权成功/失败、注册状态、7999/8000 毫秒注销边界、迟到回调与销毁 | 普通初始化不主动查询/申请；同步与异步分开，未知状态不算成功，旧代次与已释放实例隔离 | 是（受控组合） | 执行后填写 |
| 文本：输入与保存控件 | FormalSceneUiQaAbility 的 text harness；私有内存存储 | 运行[正式场景 UI smoke](<entry/src/ohosTest/ets/test/FormalSceneUiSmoke.test.ets>)文本例，Driver 输入虚构短文本并点击保存 | 实际编辑器/保存值与解码正文、身份及 r1 对应；文本 flush 一次，不写场景库 | 是（隔离 UI） | 执行后填写 |
| 文本：选区、身份与冲突 | 独立 Controller、受控存储与文本 v1/v2 候选 | 运行[文本边界](<entry/src/ohosTest/ets/test/ContinuationAdditional.test.ets>)、[版本](<entry/src/ohosTest/ets/test/ContinuationVersioning.test.ets>)及[身份事务](<entry/src/ohosTest/ets/test/ContinuationTransactions.test.ets>)套件；输入 emoji 选区、同/异身份和旧/新修订，分别保留/接受，注入写入失败再重试 | 非法输入不写入；冲突明确选择，失败保留原身份/草稿，成功修订与保存基线符合对应分支 | 是（受控组合） | 执行后填写 |
| 笔记：标题/正文保存控件 | FormalSceneUiQaAbility 的 note harness | 运行[正式场景 UI smoke](<entry/src/ohosTest/ets/test/FormalSceneUiSmoke.test.ets>)笔记例，Driver 修改虚构标题/正文并保存 | 控件值与保存基线一致，修订更新、dirty 解除，仅写本场景库 | 是（隔离 UI） | 执行后填写 |
| 笔记：放弃与历史范围 | 笔记保存 A 后编辑 B，准备交错的阅读/笔记历史 | 运行[日常编辑套件](<entry/src/ohosTest/ets/test/ContinuationWorkbenchWaveOne.test.ets>)和[历史范围套件](<entry/src/ohosTest/ets/test/ContinuationHistoryScopeWaveTwo.test.ets>)；放弃后恢复笔记第 0 项，再从持久值重开 | 放弃恢复完整基线；笔记历史不误选阅读项，恢复形成新修订，阅读的当前位置、身份和历史保持 | 是（受控组合） | 执行后填写 |
| 阅读：章节与书签控件 | FormalSceneUiQaAbility 的 reading harness；随包章节 | 运行[正式场景 UI smoke](<entry/src/ohosTest/ets/test/FormalSceneUiSmoke.test.ets>)阅读例，Driver 到第二章首段添加书签，转第三章后点击书签 | 实际段落与 chapter/anchor 一起回到书签位置；未点保存不 flush | 是（隔离 UI） | 执行后填写 |
| 表单：校验与草稿控件 | FormalSceneUiQaAbility 的 form harness | 运行[正式场景 UI smoke](<entry/src/ohosTest/ets/test/FormalSceneUiSmoke.test.ets>)表单例，空必填点下一步，再填虚构姓名/格式有效号码，进入地址步骤填写并保存草稿 | 空输入停第一步并提示；实际步骤与 step/savedStep 一致，confirmed=false、dirty 解除，不写文本库 | 是（隔离 UI） | 执行后填写 |
| 表单：保存、确认与修改 | 三步业务表单及独立存储；虚构资料 | 运行[三业务联动](<entry/src/ohosTest/ets/test/ContinuationScenes.test.ets>)和[日常编辑套件](<entry/src/ohosTest/ets/test/ContinuationWorkbenchWaveOne.test.ets>)；半填保存重开，补齐手机号/地址/同意后确认，再修改字段 | 草稿基线和步骤可恢复；完整有效资料才本地确认，合法修改取消确认；不向服务端提交 | 是（受控组合） | 执行后填写 |
| 备份：预览、取消与选择性恢复控件 | FeatureQaAbility、中文对话框、受控存储/复制端口；专用测试环境 | 运行[备份 UiQa](<entry/src/ohosTest/ets/test/WorkspaceBackupUiQa.test.ets>)；展开、输入完整合成备份、预览，先取消再仅选 note 确认；另测改输入/范围及失败分支 | 无有效预览不能确认；取消/过期/失败保留原值，仅选 note 不覆盖 reading/form 草稿与基线；确认成功才提交 | 是（隔离 UI） | 执行后填写 |
| 备份：正式复制隐私确认 | 正式应用中生成虚构工作区副本 | 点击复制，先取消隐私对话框，再确认复制并在受控位置检查完整内容；自行妥善清理副本 | 取消不复制；确认后复制完整备份，分享范围为 LOCALDEVICE | 否（真实系统剪贴板功能人工检查） | 执行后填写 |
| 备份：真实 Preferences 持久化 | ApplicationContext、正式适配器与自有 scene/text 库；其它端口受控 | 运行[NativeQa](<entry/src/ohosTest/ets/test/WorkspaceBackupNativeQa.test.ets>)；保存三业务并 flush，移除 SDK 缓存重开，导入专用备份并检查补偿/库隔离 | 重开读取完整 root；无关 key、另一专用库及文本保持；补偿失败冻结旧内存，重开读取实际持久值 | 是（真实 Preferences） | 执行后填写 |
| 协议、准入、合并与恢复指南 | 纯模型、固定输入/时刻与独立实例 | 按[载荷规则](<entry/src/ohosTest/ets/test/PayloadRuleCases.test.ets>)、[合并矩阵](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets>)及[工作区模型](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets>)构造边界、dirty 和恢复条件 | 字段校验、pending 状态和决策与对应规则一致 | 是（纯模型） | 执行后填写 |
| 普通接续：信号汇合与位置门控 | 正式 Controller/页面会话，注入数据 D、窗口 W 和位置回执 | 在[Controller 场景](<entry/src/ohosTest/ets/test/ContinuationScenarios.test.ets>)及[页面会话套件](<entry/src/ohosTest/ets/test/ContinuationPageWaveOne.test.ets>)分别注入 DW/WD、错误位置/旧 request，再给准确回执 | 普通路径不注册快速监听；完整信号与匹配业务位置齐备后一次提交；旧/错回执不提交 | 是（受控组合） | 执行后填写 |
| 快速拉起：结果/数据/窗口顺序 | 正式 Controller、受控快速结果 R、数据 D、窗口 W | 在[Controller 场景套件](<entry/src/ohosTest/ets/test/ContinuationScenarios.test.ets>)枚举六种 R/D/W 顺序、重复事件和超时；[三业务联动](<entry/src/ohosTest/ets/test/ContinuationScenes.test.ets>)补齐准确位置回执 | 到齐才提交；重复不延长阶段或重复写入，失败/未知/超时保护原内容 | 是（受控组合） | 执行后填写 |
| 普通接续：真实双设备 | 两台兼容互信设备，同版本/身份/continueType，系统普通接续入口可用 | 源端分别准备文本/笔记/阅读/表单并记录位置，从普通系统入口选择目标；目标核对数据、窗口、实际位置、冲突选择及最终保存 | 目标内容、身份/修订、选区/段落/步骤与源端一致，最终保存可读回 | 否（真实双设备人工检查） | 执行后填写 |
| 快速拉起：真实双设备 | 上述双设备条件且系统快速路径可用；目标冷/热条件分别记录 | 源端准备活动场景并通过快速系统入口发起；目标记录实际启动原因、快速结果、数据、窗口、位置及提交；覆盖冲突/失败分支 | 所需信号和位置齐备后完成提交；失败或超时显示对应阶段 | 否（真实双设备人工检查） | 执行后填写 |
| 语言、显示与重新进入 | 正式应用已保存专用数据，记录身份/修订；可切换语言/字号 | 退出再进入并检查保存值；英语/zh_CN 分别重开 Ability，检查大字号、短屏、入口、范围、预览、历史和对话框 | 保存内容可读取，入口、提示和对话框可读可达 | 否（正式界面人工检查） | 执行后填写 |

## 测试分层

工程采用单一 entry 生产模块，测试仍组织在 entry 的 ohosTest 中。受控组合直接引用 [ContinueClient](<entry/src/main/ets/learning/ContinueClient.ets>) 和 [LearningPorts](<entry/src/main/ets/learning/LearningPorts.ets>)；[ContinuationText](<entry/src/main/ets/common/ContinuationText.ets>)保留与现有资源适配器连接的客户端文本接口。

本说明包括 27 组场景说明和按测试文件分组的 441 编号索引。同一用例内的数据枚举归为该用例的检查分支。

自动化入口为 [List.test.ets](<entry/src/ohosTest/ets/test/List.test.ets>)。运行名采用 `com.samples.appcontinuation_功能_四位序号`，例如 `com.samples.appcontinuation_ContinuationAdditional_0001`。末尾完整索引保留原编号、历史名称、规范运行名与源码链接，供 Runner 筛选及历史记录关联。

| 层次 | 检查内容 | 测试环境 |
|---|---|---|
| 纯模型 | 字段、编码、准入、合并、重试和恢复规则 | 内存计算；设备分类为教学规则 |
| 受控组合 | Controller、客户端、工作台的冲突、信号汇合、位置门控和事务 | 注入时钟、存储、原生回调及位置回执 |
| 真实 Preferences（NativeQa） | 保存、flush、补偿和库隔离 | 专用真实库，接续端口受控；重开指清除 SDK 缓存后重开适配器，不含进程重启 |
| 隔离备份 UI（UiQa） | 正式备份组件的输入、范围选择和对话框 | FeatureQaAbility + Driver；存储和业务复制端口受控，输入助手使用系统剪贴板 |
| 隔离场景 UI smoke | 正式文本、笔记、阅读和表单组件的输入、点击及位置 | FormalSceneUiQaAbility + Driver；私有内存存储，使用 Component.inputText |
| 真实双设备 | 普通系统接续、快速拉起、冲突和最终保存 | 两台设备、实际系统入口；记录两端事件、页面位置和持久化结果 |

## 环境与准备

1. 使用 SDK `26.0.0` 对应的 DevEco Studio、SDK/Hvigor 和兼容标准系统设备，配置执行者自己的调试签名。应用身份为 `com.samples.appcontinuation`；双设备使用相同应用身份和对应 `continueType`，按系统要求准备网络、账号或互信，并确认普通/快速入口各自可用。
2. 从 IDE 的 ohosTest 入口选择 [List.test.ets](<entry/src/ohosTest/ets/test/List.test.ets>)，按套件或索引中的规范运行名运行。记录应用交付版本、设备型号、系统完整版本、实际 API、工具版本、语言、字号、时间、执行者及实际 Runner 参数。
3. 模型和组合用例为每个分支建立独立对象、存储和手动时钟，使用对应套件指定的整数、Unicode、身份、修订和状态边界，不用任意输入替代。套件入口配置模型断言所需的 `zh_CN` 文本；UiQa 中文对话框条件与英语/zh_CN 正式界面检查分开记录。
4. NativeQa 需要 ApplicationContext 和可用 Preferences。UiQa 需要 UiTest Driver、可启动的 FeatureQaAbility / FormalSceneUiQaAbility 及可操作的前台测试页，串行执行并在每条结束释放页面和夹具。
5. **剪贴板**：备份 UiQa 的业务复制使用隔离 `BackupQaClipboard` 端口；输入助手则会把合成备份写入系统剪贴板再粘贴到 TextArea，覆盖原有剪贴板且结束后不恢复。请在专用测试环境中运行。正式场景 UI smoke 使用 `Component.inputText`。
6. 使用虚构笔记、姓名、号码和地址。备份是未加密文本；公开证据只保留字段类别、长度、阶段、错误码和脱敏摘要，完整备份自行妥善保管/清理。

## 技术附录：场景说明（按测试文件分组）

以下各组按测试文件说明输入、操作和预期，使用前述测试环境与隔离设置。

### 01 原文本与接续边界补充（26 例）

源码：[ContinuationAdditional.test.ets](<entry/src/ohosTest/ets/test/ContinuationAdditional.test.ets>)。

- **范围与前置**：使用独立 LearningFixture/ClientFixture、受控缓存与持久值、手动时钟；预置原文和选区，分别准备空库及已有文档。
- **操作**：将有效 JSON 补空格到 26000 字符，再增加一个字符；以换行、制表、引号、反斜线、NUL 和 emoji 正文进行发送、接收、存储重开。缩短正文后尝试非法 Unicode 和越界选区；比较正常启动、普通接续和快速准备路径。
- **操作**：重复准备/重复候选、撤回窗口再就绪、15 秒阶段到期、提交后页面失败、新旧监听交接；接收 49 个标签检查 48 项 FIFO 去重界限。分别注入 put、flush、补偿 put/delete 故障；在 flush 回调内读取 UI 状态。
- **操作**：修改返回的记录/环境副本、权限失败后重试、订阅者抛错、回调内重入注册/注销、在途销毁及迟到回调；让平台结果先于正文到达以检查再次脱敏。
- **预期**：精确上限接受、超限拒绝且原文不变；重复事件不延长期限或重复提交；持久化完成后一次发布新正文/选区。补偿失败冻结后续写入但保留内存编辑；记录和订阅彼此独立，迟到事件不写盘；平台错误优先于状态，非有限状态保持未知，业务正文和私有路径不进入诊断摘要。
- **日志与隔离**：关注 RESTORE/SAVE/PERMISSION、阶段耗时、写入次数和回调代次；每个故障分支使用新夹具，销毁后计时器归零。

### 02 场景存档兼容与关联（10 例）

源码：[ContinuationArchiveWaveOne.test.ets](<entry/src/ohosTest/ets/test/ContinuationArchiveWaveOne.test.ets>)。

- **范围与前置**：构造笔记/阅读/表单文档的序列化工作区，使用 WaveSceneStore；兼容样本只省略源码声明为可缺省的保存元数据。
- **操作**：读取缺少保存标题/选区的笔记并放弃草稿、保存重开；读取缺少 savedStep/confirmed 的表单后后退并保存。分别输入保存选区切开 emoji、同场景双文档头、孤立历史、外来 documentId 历史、同号或未来历史、单场景五/六条历史、非法表单保存元数据和不同书籍版本。
- **预期**：合法旧结构恢复保存基线并可继续修订；历史属于同场景同身份且早于当前修订，五条历史可恢复，六条拒绝。非法整档保留原始存储并冻结写入，合法空工作区可新建保存；仅当前打包书籍版本可加载进度。
- **日志与隔离**：记录输入类别、修订与历史数量、冻结状态、put/flush 计数；异常档和合法对照分别建库。

### 03 笔记历史的场景范围（2 例）

源码：[ContinuationHistoryScopeWaveTwo.test.ets](<entry/src/ohosTest/ets/test/ContinuationHistoryScopeWaveTwo.test.ets>)。

- **范围与前置**：准备阅读历史在前、笔记历史在后的交错存档，并绑定笔记 ScenePageSession。
- **操作**：分别读取笔记范围和全工作区历史；在笔记页恢复第 0 项，构造下一次业务接续参数，再从持久值重开。
- **预期**：笔记第 0 项对应笔记旧正文，不误选阅读历史；恢复笔记生成其新修订，阅读当前位置、身份和历史保持；发出的候选携带恢复后的笔记。
- **日志与隔离**：关联场景、索引和修订，核对读取不写库；结束解除页面绑定。

### 04 原文本与业务模式切换（4 例）

源码：[ContinuationModeBoundaryWaveTwo.test.ets](<entry/src/ohosTest/ets/test/ContinuationModeBoundaryWaveTwo.test.ets>)。

- **范围与前置**：原文本和 scene 分别有保存基线与草稿，使用同一 Controller 的独立存储键；准备步骤为 1 的合法表单候选。
- **操作**：从业务笔记切回原文本并复用参数容器；原文本 dirty 时接收阅读候选并选择保留本机；业务 dirty 时接收原文本并接受。表单定位先回报错误步骤，再发送旧请求和新请求的正确步骤。
- **预期**：活动模式决定发送命名空间，另一载荷清空而外部参数保留；冲突明确选择后才切换。接受原文本仅写文本存储，原业务草稿仍在；表单以步骤匹配定位，第二坐标不参与步骤判定，旧 request 无效。
- **日志与隔离**：并列记录文本/业务身份、写入和 request；分别核对两份持久值及未选模式草稿。

### 05 页面会话与位置回执（8 例）

源码：[ContinuationPageWaveOne.test.ets](<entry/src/ohosTest/ets/test/ContinuationPageWaveOne.test.ets>)。

- **范围与前置**：表单、阅读、笔记 ScenePageSession 与独立新旧 Controller；笔记候选使用 `A😀BC`、选区 1..3。
- **操作**：先绑定空 Controller，再绑定实际对象、换绑、退订/重绑和隐藏页面；读取并外部修改目标副本。提交错误场景、身份、修订、位置和旧 request 的回执，重试后发送当前请求的准确回执。
- **预期**：未绑定状态明确，旧对象不再通知新页面；候选预览不改当前工作区。离页使该页旧请求失效，旧页不撤销新页请求；临时 detach 保留在途请求。位置不匹配即使带成功标记也不提交，完整匹配后一次持久化。
- **日志与隔离**：核对通知次数、request 变化、目标页和写入计数；页面在 finally 中 detach。

### 06 原文本 Controller 完整流程（10 例）

源码：[ContinuationScenarios.test.ets](<entry/src/ohosTest/ets/test/ContinuationScenarios.test.ets>)。

- **范围与前置**：正式 Controller/ContinueClient 配合注入环境、原生接口、存储和手动时钟；准备 `A🌱B` 及选区 1..3。
- **操作**：枚举空/中文/emoji/4096 字符正文与 4097 字符、孤立代理项；选区检查负数、越界、逆序、小数、NaN、Infinity 和代理对中点。载荷检查数值、空串、破损 JSON、非对象、缺字段、错误版本/页面/标签/类型及 26001 字符原串。
- **操作**：注册通知状态 0、1、99、NaN、缺少结果和错误对象；注销检查 7999/8000 毫秒观察界限、失败与重试。普通路径枚举 DW/WD，快速路径枚举六种 R/D/W 顺序；重复事件、旧监听交接、阶段超时、停止、重试、页面失败及存储读取/保存/清空/补偿分别检查。
- **操作**：检查环境主动查询、异步权限门控、上下文发布、记录限额/副本、订阅异常和诊断脱敏。
- **预期**：非法输入不改原文，完整信号汇合后单次提交；普通路径不注册快速监听。同步受理和异步结果分别记录，未知状态不视作成功；旧代次回调隔离，超时后仍保护原文。补偿恢复旧存档，无法确认持久值时冻结写入；环境与权限请求不在普通初始化时自动发起。
- **日志与隔离**：记录 ON/OFF/RESTORE/SAVE 等阶段、原始状态码、期限和回调代次；每个枚举分支新建并释放夹具。

### 07 三业务与 Controller 联动（10 例）

源码：[ContinuationScenes.test.ets](<entry/src/ohosTest/ets/test/ContinuationScenes.test.ets>)。

- **范围与前置**：正式 SceneWorkbench、Controller 与 ScenePageSession，注入独立缓存/磁盘和回执；表单使用虚构姓名、`13800000000` 与测试地址。
- **操作**：笔记保存 A、编辑 B，注入 put/flush 故障后重试并重开；放弃标题/正文/选区；补偿失败。保存半填表单再重开，补足手机、地址和同意信息后确认。note/reading/form 分别发送候选，按快速结果、窗口、实际位置回执逐项到齐后继续编辑和再次发送。
- **操作**：定位失败后重试并发送旧回执；冲突接受后再触发 flush 失败；页面重绑、脱敏、错误命名空间、损坏工作区及笔记历史恢复。
- **预期**：保存和恢复以完整事务提交，失败不改变修订、历史或保存基线；三业务仅在准确位置回执与其它信号到齐后提交。接受冲突不绕过其它条件；历史恢复读取真实内容并形成新修订；文本与业务载荷分开校验。
- **日志与隔离**：核对事务 put/flush、目标页、request、身份和修订；受控回执表示模型位置确认，实际控件位置由界面补充场景检查。

### 08 原文本身份事务（6 例）

源码：[ContinuationTransactions.test.ets](<entry/src/ohosTest/ets/test/ContinuationTransactions.test.ets>)。

- **范围与前置**：准备文本 v1 兼容数据与 v2 文档，修订取 2、3、5、900 和 1000000000，单独保留 dirty 草稿。
- **操作**：向已有 v2 文档接收 v1；向 dirty 本机接收较新同文档或 v1 并拒绝；切换到独立文档后接受；订阅最终状态；同正文不同身份时拒绝，再收较新同文档。修订到上限后另存新文档，先注入 flush 失败再重试。
- **预期**：v1 接收清除旧 v2 身份；dirty 始终要求选择。同身份续修和不同身份续修分别计算，不携带无关文档的上限号；结束通知释放会话且恢复编辑。另存失败保持原身份/草稿，成功后新身份从 r1 开始并可重开。
- **日志与隔离**：记录冲突类型、前后身份/修订和最终可编辑状态，不以正文相等代替身份一致。

### 09 文本载荷版本与冲突（12 例）

源码：[ContinuationVersioning.test.ets](<entry/src/ohosTest/ets/test/ContinuationVersioning.test.ets>)。

- **范围与前置**：准备 v1 未保存文本、v2 有身份文本和本机保存基线；包含相同/不同 documentId、旧/同/新 revision 和修订上限。
- **操作**：v2 正文/选区恢复；输入 v3、空 documentId、负 revision；同文档旧修订接受/保留本机；保存后发送到另一实例继续编辑；未保存源发送 v1。冲突等待中重复窗口事件，快速路径先接受再补齐结果与窗口，并注入冲突写入故障。
- **预期**：合法 v1/v2 各保留其身份语义；非法版本不写库。接受旧/同号冲突生成更高修订，保留本机不写库；干净不同文档采用远端修订，dirty 切换明确确认。修订上限阻止加一，失败保持身份/修订和正文。
- **日志与隔离**：关注 version、冲突选择、写入次数和会话结束；源、目标及重开实例各自释放。

### 10 笔记、阅读、表单日常编辑（22 例）

源码：[ContinuationWorkbenchWaveOne.test.ets](<entry/src/ohosTest/ets/test/ContinuationWorkbenchWaveOne.test.ets>)。

- **范围与前置**：独立 WaveSceneStore，保存基线及未保存版本；阅读使用打包章节/段落，表单使用三步合法资料。
- **操作**：只改选区、只改标题、超长标题/孤立代理项/切开 emoji、未知场景；阅读首尾移动、重复书签、删除中间书签和非法索引，回到保存位置。已确认表单改字段/撤销同意、返回首步修复必填项、非法步骤/字段/超限值；检查历史索引、副本、远端候选预览和同身份版本提交。
- **预期**：dirty 门控包含标题和选区；放弃恢复完整保存基线，非法输入无部分覆盖。阅读不隐式跨章，书签次序保持；表单合法更改取消确认，非法更改不破坏确认状态。快照深拷贝；相同状态不造历史，旧修订需选择，新修订保留远端号，换身份仅清本场景历史，修订上限后仍保留编辑。
- **日志与隔离**：并列核对当前值、保存值、dirty、历史和存储计数；每条重开对象只读取本条持久值。

### 11 文档槽位与分支表单流程（40 例）

源码：[DocumentFormFlowCases.test.ets](<entry/src/ohosTest/ets/test/DocumentFormFlowCases.test.ets>)。

- **范围与前置**：纯 DocumentWorkspace/FormSession 模型。槽位有 id、kind、ownerApp、revision；表单字段含 kind、amount、invoiceNo、budget、remark，按规则设置必填和长度。
- **操作**：空工作区、note/reading 共存、单活动 form、归档后新建 form、恢复归档槽位、关闭、同 id 更新、空 id 与隔离不匹配。表单把 kind 从空改为“报销”“采购”及未知类型；填写金额/预算、添加空/有值明细、删指定行，执行 review/confirm/reopen/archive、快照应用与摘要检查。
- **预期**：form 的单槽限制作用于活动槽位；归档后可打开新 form，原归档槽位仍可按工作区规则恢复。类型、来源和修订不匹配分别反馈；报销显示金额/发票字段，采购显示预算且需要非空明细，未知类型不额外展开。可见必填项和长度错误影响提交；确认锁定编辑，已归档表单会话不重开；应用快照恢复值但重新进入编辑态。
- **日志与隔离**：记录槽位数、活动 id、字段可见性/状态/进度和阶段。

### 12 三方字段合并矩阵（50 例）

源码：[MergeRecoveryMatrixCases.test.ets](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets>)。

- **范围与前置**：纯 MergePlan 模型，输入共同基线、本机和对端三份字段；混合样例包含 title、body、tags、pinned、group。
- **操作**：分别构造未改、仅本机改、仅对端改、双方同改、双方异改、空基线和本机删除。比较有/无共同基线的计划，按 LOCAL/REMOTE/BASE 选择，尝试 MANUAL 和未知 key；应用部分/完整计划、批量解决及重复解决，读取预览和统计。
- **预期**：单侧修改自动选对应侧，双方一致选本机，真正冲突保留手动决策；无共同基线的差异保留确认。未决定字段留在 pending，明确选择后可完成；输入次序、key/value 对齐、冲突标记和统计保持。该组的 `resolveAll(BASE)` 使用本机值。
- **日志与隔离**：按字段类别、choice、pending 和数量定位差异；合并只在内存生成结果，不写回任一设备。

### 13 载荷模型综合矩阵（15 例）

源码：[PayloadMatrix.test.ets](<entry/src/ohosTest/ets/test/PayloadMatrix.test.ets>)。

- **范围与前置**：纯 PayloadSchema/Codec、ConflictPolicy 与 ContinuationRules 模型；这是 `v=...&doc=...` 演示编码，与 Controller 的文本 JSON v1/v2 分开。
- **操作**：核对 12 字段、模型版本 3、v1/v2/v3 字段集合与迁移链；对 `&`、`=`、`%`、换行、制表、中文和空串做转义往返。编码/解码有效和非法帧，长正文压入 500 字符预算，摘要封签后改正文，计算差异与 UTF-8 长度。枚举 28 条冲突规则的 dirty 组合、应用保留/合并/追加策略，并检查 12 条准入规则及设备映射。
- **预期**：迁移、转义和字段值对应；非法版本/缺身份拒绝，未知冲突标记产生告警并归一为 none。裁剪后的模型载荷仍可解码且选区合法；内容改变使摘要不匹配。规则计算给出相应决策、权限/容量降级和未知分类。
- **日志与隔离**：记录模型字段数、长度/字节数、变更字段及规则号；摘要用于内容一致性检查。

### 14 载荷字段、准入与冲突规则（36 例）

源码：[PayloadRuleCases.test.ets](<entry/src/ohosTest/ets/test/PayloadRuleCases.test.ets>)。

- **范围与前置**：纯字段/规则模型，准备 doc、rev、title、body、cs/ce、dev、at、app 和 ck；本机/对端分别可为有内容、空内容、旧/新修订及 dirty。
- **操作**：检查必填标识、整数字符串、标题 64/65、正文上限 4096、冲突枚举与转义。准入输入覆盖低 API、9..11、12..13、14..17、18..26、未来 API、未知设备及 phone/tablet/PC/TV/wearable，权限有/无。冲突输入覆盖相同、单侧有内容、远端较新、本机较新、两端改动和未知文档，并逐行合并 `a\nb` 与 `b\nc`。
- **预期**：字段校验、默认值和迁移一致；相同规则号对应相同计算分支，权限和载荷预算改变模型准入；未列 API/设备返回未知。冲突策略按 dirty 选择保留、采用、合并或询问，合并正文为 `a\nb\nc`。
- **日志与隔离**：关联 CR/CF 规则号、分类和 resolution。

### 15 场景上下文引用（5 例）

源码：[RestoreSceneCases.test.ets](<entry/src/ohosTest/ets/test/RestoreSceneCases.test.ets>)。

- **范围与前置**：SceneContext 的模块级引用，使用仅带标记的测试对象。
- **操作**：清空、重复清空、发布、读取、发布第二对象覆盖，再读取两次并比较引用。
- **预期**：清空后 undefined，发布后返回同一对象，第二次发布替换第一对象，重复读取共享同一模块引用。
- **日志与隔离**：记录存在性和引用等同性；每条清空测试引用，不把占位对象用于实际业务调用。

### 16 重试策略与字段字典（10 例）

源码：[RetryDictionaryCases.test.ets](<entry/src/ohosTest/ets/test/RetryDictionaryCases.test.ets>)。

- **范围与前置**：纯 RetryPolicy/FieldDictionary 模型，固定时刻 1700000000000；正文含两个 `#` 标签，ck 为 bothChanged。
- **操作**：检查 20 条重试规则和 NETWORK/TIMEOUT/PERMISSION/VERSION/DEVICE_BUSY/STORAGE/PAYLOAD/UNKNOWN 八类；按尝试次数计算指数、线性和固定退避，模拟第 3 次成功及耗尽。读取 20 项字典的角色、可见性、直接值、正文长度、选区长度、标签数及未知字段说明。
- **预期**：网络等待为 200/400/800 毫秒、总计 1400；超时规则为 300/600、总计 900；繁忙规则固定 800。权限/版本类等待为零且要求用户动作；模拟成功后停止。字典覆盖 schema，直接值与派生值一致，未记录时间/未知字段有明确文本。
- **日志与隔离**：记录 reason、backoff、attempt、wait 和字典 key；模拟只计算轨迹，不等待真实时间或发起网络重试。

### 17 场景目录与载荷校验（12 例）

源码：[ScenarioValidatorCases.test.ets](<entry/src/ohosTest/ets/test/ScenarioValidatorCases.test.ets>)。

- **范围与前置**：24 项学习场景目录和 PayloadValidator；使用固定时刻和已封签合法模型载荷。
- **操作**：核对目录形态、风险（6 高/10 中/8 低）、51 步、设备方向与五种 payload shape；检查 16 条字段规则和 9 条交叉规则。输入空文档、负修订、非法设备/ck、负/逆序/越界选区、2000/5000 正文、80 字标题、未来时间及缺失/错误摘要；逐项调用规则并读取汇总。
- **预期**：目录筛选/汇总与已有条目一致；2000 字正文触发告警，5000 字正文触发长度错误；关系错误对应交叉规则。错误与告警分别统计，合法封签数据无违规；目录中媒体/清单条目表示学习说明，不扩展成文件传送功能。
- **日志与隔离**：用规则号、字段类别、违规级别和数量追踪。

### 18 业务备份复制端口（10 例）

源码：[SceneBackupClipboardCases.test.ets](<entry/src/ohosTest/ets/test/SceneBackupClipboardCases.test.ets>)。

- **范围与前置**：正式 SceneBackupClipboard 和受控 BackupClipboardPort，可延迟、成功、拒绝或同步抛错；备份包含完整合法 root。
- **操作**：复制长正文备份，等待时再发起复制；分别完成成功、异步失败、同步失败、释放后迟到成功/失败。输入残缺备份、新实例重试、生成后编辑及复制等待期间编辑；对冻结工作区导出内存救援副本再复制。
- **预期**：端口完成才报告成功，写入完整备份而非 512 字符预览；BUSY 不重复写入。失败释放门控且反馈脱敏；旧实例释放后拒绝新复制，已完成复制保留 copied 事实。过期副本不复制，复制中状态变化明确提示快照差异；救援复制不解冻或修复磁盘。
- **日志与隔离**：关联 copy code、copied、写入次数和 epoch；本套件端口不访问系统剪贴板。

### 19 备份预览生命周期（11 例）

源码：[SceneBackupLifecycleCases.test.ets](<entry/src/ohosTest/ets/test/SceneBackupLifecycleCases.test.ets>)。

- **范围与前置**：正式工作台/Controller 与 BackupStore；准备本机文本和业务独立身份、dirty 草稿及新旧备份。
- **操作**：连续预览两份、修改返回预览对象、预览后编辑、显式取消、跨实例使用 token、系统接续开始/停止、销毁后确认以及最终通知中重入确认；分别在活动业务/文本模式恢复业务备份，检查冻结 scene 与文本独立保存。
- **预期**：只有当前实例当前状态的有效 token 可一次消费；编辑、取消、接续开始与销毁撤销旧授权，外部副本不能改内部计划。恢复 scene 时保留原文本 dirty/身份和系统接续状态；scene 冻结时文本存储仍可独立使用，内存内容可导出救援副本。
- **日志与隔离**：记录 epoch/token 状态码、会话活动状态和两类存储计数，日志只表示令牌状态，不输出令牌或备份正文。

### 20 备份生成、校验与计划（9 例）

源码：[SceneBackupPlanningCases.test.ets](<entry/src/ohosTest/ets/test/SceneBackupPlanningCases.test.ets>)。

- **范围与前置**：备份中含当前编辑与保存基线，使用独立 BackupStore；准备同身份较新本机、损坏原档、非法历史和合法边界原串。
- **操作**：编辑三业务后生成、损坏磁盘时生成救援副本、预览差异、计算恢复修订、再输入非法文本；把原串补空格到 SCENE_WORKSPACE_LIMIT 后再加 1 字符；输入保存选区切开代理对和外来身份历史，外部修改解码副本。
- **预期**：导出包含 dirty 与保存基线但不写库、不消耗修订；预览仅展示字段类别/修订而不展示私密值。不合法输入撤销旧 token；容量超限完整拒绝，合法边界可预览；正式场景校验与历史归属校验一致。冻结状态保留，导出副本修改不污染原工作区。
- **日志与隔离**：记录容量、revision 计划、changed/dirty/frozen 和问题路径，省略输入原串。

### 21 业务备份恢复事务（14 例）

源码：[SceneBackupTransactionCases.test.ets](<entry/src/ohosTest/ets/test/SceneBackupTransactionCases.test.ets>)。

- **范围与前置**：合法完整/缺场景 root、同/不同身份、不同修订和历史；受控 put/flush/delete 与 flush 内观察点。
- **操作**：预览后确认完整 root；同身份恢复旧/新备份、不同身份恢复、只改历史、仅传输标签/排列不同的相同 root、备份缺少 reading/form、dirty 替换未确认/确认、恢复未保存笔记后放弃。分别注入缓存变更后 put 失败、flush 失败、无旧 key 失败及补偿失败；任一同身份修订到上限时预览。
- **预期**：一次 put/flush 提交整份 root，flush 返回前仍见旧内存；同身份变更以两端较大修订加一，不同身份不借用旧号；历史采用备份来源而不混合本机历史。相同业务 root 不写库，token 仍一次消费；缺场景明确清空。dirty 需确认，保存基线仍可放弃；失败补偿旧原串/删除新 key，失败计划不消耗修订，补偿失败冻结且保留内存救援；上限使整个计划停止。
- **日志与隔离**：记录 code、changed、计划修订和 put/flush/delete 次数；区分缓存、持久值和当前内存三种观测。

### 22 业务模型与工作区编码（24 例）

源码：[SceneModelMatrix.test.ets](<entry/src/ohosTest/ets/test/SceneModelMatrix.test.ets>)。

- **范围与前置**：纯 SceneModel；note/reading/form 文档及打包章节，三步表单和独立文档身份。
- **操作**：Unicode/选区边界，阅读首尾位置，三步表单必填/长度/同意；笔记、阅读（含书签次序）、表单编码解码。输入空/破损/超限原串、错误协议/版本/身份/修订/场景、逆序/代理对中点选区、重复/21 项书签、带校验问题的已确认表单；工作区连续生成 r1..r8、替换身份和往返序列化。
- **预期**：边界与字段约束一致，非法输入不产生有效文档；标题/姓名、地址、备注分别检查其上限，确认表单须完整有效。副本深拷贝，历史最多保留五条旧修订，换身份清本场景历史；工作区 active 必须匹配有效文档。
- **日志与隔离**：记录种类、边界数值、解码存在性、历史数和修订，不使用真实用户资料。

### 23 工作区故障与跨场景隔离（12 例）

源码：[SceneRecoveryB2.test.ets](<entry/src/ohosTest/ets/test/SceneRecoveryB2.test.ets>)。

- **范围与前置**：正式 SceneWorkbench，RecoveryStore 区分 cache/disk，可注入读取异常、非字符串及第一次 flush 失败。
- **操作**：锁定后编辑/保存/切页，解锁保存；释放后提交/重置；订阅者抛错和退订；未知磁盘时编辑并导出、第一次保存失败后重试、完整重置与失败重置。保存或接纳 reading、恢复 note 历史时另保留 note/form/reading 的未保存编辑；在上限修订保存和冲突接纳。
- **预期**：锁定保护原草稿，释放后无通知/写入；未知磁盘冻结但内存内容可保留。第一次保存失败时补偿删除缓存且重试不造伪历史；重置成功生成新身份，失败保留持久值和草稿。单场景保存、接纳和历史恢复不顺带落盘其它场景 dirty，修订上限不触存储。
- **日志与隔离**：比较当前内存与重开持久值、puts/deletes、dirty 和冻结状态；故障与正常分支各自建工作台。

### 24 真实 Preferences 备份持久化（12 例）

源码：[WorkspaceBackupNativeQa.test.ets](<entry/src/ohosTest/ets/test/WorkspaceBackupNativeQa.test.ets>)。

- **范围与前置**：ApplicationContext、正式 PreferencesSceneStore/PlatformLearningStore 和自有 scene/text 库；接续和环境端口仍受控。
- **操作**：保存三业务、移除 SDK 缓存并重开；Controller 导入另一专用库生成的备份，核对独立文本；导出未保存笔记后在重开实例恢复并放弃。比较相同 root、同身份旧备份、缺场景和同库无关键；实际 flush 完成后注入确认故障，再注入补偿 put 故障。写入未来版本/超预算合法 JSON、预览后真实保存、双库同键隔离和右库 reset/清理。
- **预期**：重开读取完整真实 root；导出不隐式保存，恢复可保留 dirty 和基线。相同 root 无多余写入，旧 token 不跨实例；补偿成功把旧 root 重新 flush，补偿失败旧内存冻结，而移除 SDK 缓存后重开反映实际磁盘候选。非法档保留原值、冻结且不自动重置；旁路 key、另一专用库和独立文本保持。
- **日志与隔离**：关联库用途（非私有完整路径）、阶段、缓存失效和重开结果；清理仅移除本夹具创建的两库。

### 25 业务备份真实控件交互（19 例）

源码：[WorkspaceBackupUiQa.test.ets](<entry/src/ohosTest/ets/test/WorkspaceBackupUiQa.test.ets>)。

- **范围与前置**：FeatureQaAbility、UiTest Driver、正式备份面板、中文对话框；夹具模式为 empty、dirty、writeFailure、frozen、copyPending、copyFailure、scopePreserve，存储/复制受控。
- **操作**：展开默认收起入口；输入破损备份并预览；生成 dirty 导出，输入合法备份并取消预览/取消确认/确认恢复。确认期间改变业务、注入 flush 失败、冻结时生成救援副本、有效预览后改输入、收起再展开；复制隐私对话框先取消，再确认并延迟/失败完成。
- **操作**：取消三个范围复选框、恢复只选 note、预览后改 scope、选中场景在备份中缺失，以及选择性恢复失败。通过 `ACBackupPanelToggle`、`ACBackupImportText`、`ACBackupPreview`、`ACBackupApply`、`ACBackupScopeNote/Reading/Form` 等稳定 ID 定位实际控件。
- **预期**：未生成/未预览时按钮正确门控；生成仅显示 512 字符预览，复制发送完整导出。取消、过期和失败保留本机内容与磁盘，成功确认才提交；复制等待时输入/生成门控，失败后可重试且反馈脱敏。全不选仅限制导入；note-only 保留未选 reading/form 的内存 dirty 及各自保存值，缺失的已选场景明确清空，失败补偿整个保存 root。收起清敏感输入/导出缓冲但保留工作区。
- **日志与隔离**：同时检查控件 enabled/checked、状态文本、正式 Controller 值与夹具持久值；输入动作按前述剪贴板约束安排，afterEach 关闭该测试会话。

### 26 文档、表单、合并与恢复模型组合（48 例）

源码：[WorkspaceCases.test.ets](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets>)。

- **范围与前置**：纯 DocumentWorkspace、FormSession、MergePlan、RecoveryPlan 四组模型，各自新建实例。
- **操作**：文档打开/切换/归档/恢复、单槽及类型/来源/修订隔离；分支字段、明细、进度和表单确认/归档/快照；有/无共同基线合并、逐项及批量选择、空计划。恢复输入覆盖 TARGET_MISSING、VERSION_CHANGED、WRITE_UNCERTAIN、STALE_RECEIPT、NONE，组合 cache、dirty、rereadOk、retried、remoteNewer、receiptHigher。
- **预期**：工作区与表单保持身份、阶段、字段和行对应；合并未确认字段保持 pending。目标缺失有缓存回退，无缓存先重试、耗尽后给导出再重置建议；版本变化按是否 dirty/已重试/远端较新区分保留、询问或重读。写入不确定先重读、必要时询问/导出；旧回执默认忽略，高版本回执需选择。风险与 action/规则号一致。
- **日志与隔离**：记录 DocKind、FormStage、FieldChoice、RecoveryCase/Action 及计数；核对恢复模型的决策输出。

### 27 正式场景共享组件与 Driver（4 例）

源码：[FormalSceneUiSmoke.test.ets](<entry/src/ohosTest/ets/test/FormalSceneUiSmoke.test.ets>)。

- **范围与前置**：FormalSceneUiQaAbility 只加载固定 harness，`ownscene` 仅允许 text/note/reading/form。每例创建独立 Controller，显式注入私有文本与场景存储；harness 向同一生产组件传入该 Controller，不覆盖普通 Ability 的全局引用。
- **文本操作与预期**：Driver 在正式 TextEditorPanel 输入虚构短文本并点击保存；核对实际编辑器和保存值 Text，私有存档通过正式 decoder 解码后正文、身份和 r1 一致，文本存储 flush 一次，不写场景存储。
- **笔记操作与预期**：Driver 编辑正式 NoteScene 标题/正文并保存；实际控件保持输入，状态提示对应新修订，title/savedTitle、body/savedBody 成为同一保存基线，dirty 解除，仅写本场景库。
- **阅读操作与预期**：Driver 切至第二章首段、添加书签、转至第三章，再点击该书签；实际段落与业务 chapter/anchor 一起回到书签位置，未点保存时不 flush。
- **表单操作与预期**：空必填点击下一步仍停第一步并显示问题；Driver 填虚构姓名和格式有效号码后进入地址步骤，输入虚构地址并保存草稿；实际步骤与持久化 step/savedStep 一致，confirmed=false，dirty 解除，不写文本库。
- **日志与隔离**：字段内容通过布尔对照或受控类型摘要记录。输入只调用 `Component.inputText`，点击只调用真实控件；结束仅 terminate 本例保存的 Ability context 并释放自有 fixture，不触任意前台 Ability、用户 Preferences 或系统剪贴板。

## 真实双设备与正式界面补充

以下场景人工执行。开始前记录两端应用版本、型号、系统版本、API、应用身份、continueType、网络/互信条件及目标冷/热状态。

### 普通接续

1. **源端**：正常启动，分别安排文本、笔记、阅读和表单。文本/笔记使用虚构正文及含 emoji 的合法选区；阅读记录章节/段落；表单记录虚构字段和当前步骤。记录每次活动场景的身份、修订和是否已保存，按需主动检查权限及注册监听。
2. **目标端**：安装相同版本并确认可启动；先安排无本机冲突的基本流程，另行记录有未保存内容的冲突分支。
3. **源端**：从设备的**普通系统接续入口**选择目标，记录发起动作和系统反馈。
4. **目标端**：检查收到的数据、窗口、实际选区/段落/步骤及业务位置回执。
5. **目标端**：分别尝试保留本机和接受接续，核对最终身份、修订及保存值；继续编辑并保存，记录两端日志和页面。
6. **结束**：按需注销，记录完成通知、超时和迟到事件。

### 快速拉起接续

1. **两端**：确认系统快速入口可用，应用身份和 continueType 匹配；`_ContinueQuickStart` 后缀保持平台约定。分别安排目标冷/热启动条件。
2. **源端**：分别准备文本、笔记、阅读和表单的活动场景，记录虚构输入、身份、修订及选区/章节段落/步骤；需要时主动申请权限并注册准备监听。
3. **目标端**：记录本机草稿和冲突初态。**源端**通过系统**快速拉起接续入口**选择目标，记录操作和系统反馈。
4. **目标端**：按到达顺序记录启动原因、原生快速结果 R、数据 D、窗口 W、业务位置和最终提交。
5. **目标端**：有冲突时分别尝试保留和接受，核对信号汇合、业务定位及持久化结果；继续编辑并保存。失败或超时时检查原内容和阶段记录。
6. **归档**：分别记录冷/热启动及各分支结果，关联两端日志和页面。

### 其它人工检查

| 场景 | 前置与操作 | 预期与证据 |
|---|---|---|
| 冲突选择 | 目标保留未保存本机内容，分别接收相同文档旧修订和不同文档候选，检查保留本机与接受接续 | 保留本机不写入；接受仍等待所需信号与定位，保存失败保留原文/草稿，身份与修订符合选择 |
| 本地备份范围与真实复制 | 生成并明确确认复制虚构备份；修改笔记及其它业务；粘贴完整备份，先预览取消，再只选笔记确认 | 复制需隐私确认且为完整文本；预览/取消不写入，确认仅影响选择范围；未选场景 dirty 与保存基线分别保持。只归档范围、修订及脱敏对照，备份全文自行保管 |
| 重新进入与显示 | 记录已保存身份/修订和实际退出方式后重新进入；英语/zh_CN 分别重开 Ability，检查大字号、短屏、动态提示和对话框 | 保存内容可读取；未提交编辑按各场景约定处理。入口、按钮、范围、预览、历史和失败提示可读可达 |

## 技术补充：日志、时限与隔离

- 日志使用 Hilog 域 `0xF811`、标签 `[Sample_AppContinuation]` 和包名 `com.samples.appcontinuation`，按规范运行名关联 `begin/end/failure`、断言位置和 Hypium 结果。保留原始异常及 Runner 的 `timeout/class` 参数。
- 断言参数采用脱敏摘要：字符串记录长度，布尔值及 Math.abs 运算结果不超过 65535 的有限数值按受控范围记录，其余数值脱敏，对象/数组记录类型。正文、备份、个人字段、令牌和私有路径留在私有测试状态中。共享夹具单独标记。
- [BoundedCase](<entry/src/ohosTest/ets/support/BoundedCase.ets>)为 `scenario` 提供 10 秒看门狗。业务 15 秒阶段期限和 8 秒注销观察期限使用手动时钟，与 Runner 超时分别记录；到期后保留未确认状态，结果未知的调用由人工检查。
- 受控组合中 D=数据、W=窗口、R=快速结果。普通检查 DW/WD，快速检查 RDW/RWD/DRW/DWR/WRD/WDR；业务位置还需匹配场景、documentId、revision 和 request。
- 每例释放自有 Controller、工作台、订阅者、页面会话、计时器及测试引用。UiQa 串行运行，结束时关闭本例会话。
- NativeQa 使用 `ac_workspace_native_qa_<时间>_<序号>_scene` 与 `_text` 专用库，缓存移除和清理限于自建库，并检查同库无关 key 的保留情况。

## 执行记录

单 entry 版本的场景结果按实际执行填写；当前记录默认为待执行，不以源码迁移或静态核对代替运行结果。未覆盖的场景保留为未覆盖，不预填通过或失败。

| 应用版本/交付标识 | 设备/系统/API | SDK/工具/Runner参数 | 语言/显示条件 | 用例或人工场景 | 实际操作与结果 | 证据 | 执行人/时间 |
|---|---|---|---|---|---|---|---|
| 执行时填写 | 执行时填写 | 执行时填写 | 执行时填写 | 实际覆盖编号或场景 | 执行后填写 | 脱敏日志或实际画面 | 执行时填写 |

## 完整用例索引

索引按测试文件分组，保留既有 441 个编号及每个 `@tc.number` 的独立行。编号链接指向其源码注释；旧名为历史查找名称，规范运行名用于筛选。步骤、必要输入、状态枚举和预期见上方对应场景说明，单例的全部分支与断言见编号链接。

### [ContinuationAdditional.test.ets](<entry/src/ohosTest/ets/test/ContinuationAdditional.test.ets>)（26 例）

| 用例编号（源码） | 旧名 | 规范运行名 |
|---|---|---|
| [SUB_CONTINUATION_CONTINUATIONADDITIONAL_0100](<entry/src/ohosTest/ets/test/ContinuationAdditional.test.ets#L70>) | `testContinuationAdditional0001` | `com.samples.appcontinuation_ContinuationAdditional_0001` |
| [SUB_CONTINUATION_CONTINUATIONADDITIONAL_0200](<entry/src/ohosTest/ets/test/ContinuationAdditional.test.ets#L104>) | `testContinuationAdditional0002` | `com.samples.appcontinuation_ContinuationAdditional_0002` |
| [SUB_CONTINUATION_CONTINUATIONADDITIONAL_0300](<entry/src/ohosTest/ets/test/ContinuationAdditional.test.ets#L138>) | `testContinuationAdditional0003` | `com.samples.appcontinuation_ContinuationAdditional_0003` |
| [SUB_CONTINUATION_CONTINUATIONADDITIONAL_0400](<entry/src/ohosTest/ets/test/ContinuationAdditional.test.ets#L168>) | `testContinuationAdditional0004` | `com.samples.appcontinuation_ContinuationAdditional_0004` |
| [SUB_CONTINUATION_CONTINUATIONADDITIONAL_0500](<entry/src/ohosTest/ets/test/ContinuationAdditional.test.ets#L198>) | `testContinuationAdditional0005` | `com.samples.appcontinuation_ContinuationAdditional_0005` |
| [SUB_CONTINUATION_CONTINUATIONADDITIONAL_0600](<entry/src/ohosTest/ets/test/ContinuationAdditional.test.ets#L232>) | `testContinuationAdditional0006` | `com.samples.appcontinuation_ContinuationAdditional_0006` |
| [SUB_CONTINUATION_CONTINUATIONADDITIONAL_0700](<entry/src/ohosTest/ets/test/ContinuationAdditional.test.ets#L264>) | `testContinuationAdditional0007` | `com.samples.appcontinuation_ContinuationAdditional_0007` |
| [SUB_CONTINUATION_CONTINUATIONADDITIONAL_0800](<entry/src/ohosTest/ets/test/ContinuationAdditional.test.ets#L297>) | `testContinuationAdditional0008` | `com.samples.appcontinuation_ContinuationAdditional_0008` |
| [SUB_CONTINUATION_CONTINUATIONADDITIONAL_0900](<entry/src/ohosTest/ets/test/ContinuationAdditional.test.ets#L326>) | `testContinuationAdditional0009` | `com.samples.appcontinuation_ContinuationAdditional_0009` |
| [SUB_CONTINUATION_CONTINUATIONADDITIONAL_1000](<entry/src/ohosTest/ets/test/ContinuationAdditional.test.ets#L355>) | `testContinuationAdditional0010` | `com.samples.appcontinuation_ContinuationAdditional_0010` |
| [SUB_CONTINUATION_CONTINUATIONADDITIONAL_1100](<entry/src/ohosTest/ets/test/ContinuationAdditional.test.ets#L392>) | `testContinuationAdditional0011` | `com.samples.appcontinuation_ContinuationAdditional_0011` |
| [SUB_CONTINUATION_CONTINUATIONADDITIONAL_1200](<entry/src/ohosTest/ets/test/ContinuationAdditional.test.ets#L421>) | `testContinuationAdditional0012` | `com.samples.appcontinuation_ContinuationAdditional_0012` |
| [SUB_CONTINUATION_CONTINUATIONADDITIONAL_1300](<entry/src/ohosTest/ets/test/ContinuationAdditional.test.ets#L448>) | `testContinuationAdditional0013` | `com.samples.appcontinuation_ContinuationAdditional_0013` |
| [SUB_CONTINUATION_CONTINUATIONADDITIONAL_1400](<entry/src/ohosTest/ets/test/ContinuationAdditional.test.ets#L481>) | `testContinuationAdditional0014` | `com.samples.appcontinuation_ContinuationAdditional_0014` |
| [SUB_CONTINUATION_CONTINUATIONADDITIONAL_1500](<entry/src/ohosTest/ets/test/ContinuationAdditional.test.ets#L514>) | `testContinuationAdditional0015` | `com.samples.appcontinuation_ContinuationAdditional_0015` |
| [SUB_CONTINUATION_CONTINUATIONADDITIONAL_1600](<entry/src/ohosTest/ets/test/ContinuationAdditional.test.ets#L546>) | `testContinuationAdditional0016` | `com.samples.appcontinuation_ContinuationAdditional_0016` |
| [SUB_CONTINUATION_CONTINUATIONADDITIONAL_1700](<entry/src/ohosTest/ets/test/ContinuationAdditional.test.ets#L582>) | `testContinuationAdditional0017` | `com.samples.appcontinuation_ContinuationAdditional_0017` |
| [SUB_CONTINUATION_CONTINUATIONADDITIONAL_1800](<entry/src/ohosTest/ets/test/ContinuationAdditional.test.ets#L617>) | `testContinuationAdditional0018` | `com.samples.appcontinuation_ContinuationAdditional_0018` |
| [SUB_CONTINUATION_CONTINUATIONADDITIONAL_1900](<entry/src/ohosTest/ets/test/ContinuationAdditional.test.ets#L648>) | `testContinuationAdditional0019` | `com.samples.appcontinuation_ContinuationAdditional_0019` |
| [SUB_CONTINUATION_CONTINUATIONADDITIONAL_2000](<entry/src/ohosTest/ets/test/ContinuationAdditional.test.ets#L685>) | `testContinuationAdditional0020` | `com.samples.appcontinuation_ContinuationAdditional_0020` |
| [SUB_CONTINUATION_CONTINUATIONADDITIONAL_2100](<entry/src/ohosTest/ets/test/ContinuationAdditional.test.ets#L749>) | `testContinuationAdditional0021` | `com.samples.appcontinuation_ContinuationAdditional_0021` |
| [SUB_CONTINUATION_CONTINUATIONADDITIONAL_2200](<entry/src/ohosTest/ets/test/ContinuationAdditional.test.ets#L790>) | `testContinuationAdditional0022` | `com.samples.appcontinuation_ContinuationAdditional_0022` |
| [SUB_CONTINUATION_CONTINUATIONADDITIONAL_2300](<entry/src/ohosTest/ets/test/ContinuationAdditional.test.ets#L818>) | `testContinuationAdditional0023` | `com.samples.appcontinuation_ContinuationAdditional_0023` |
| [SUB_CONTINUATION_CONTINUATIONADDITIONAL_2400](<entry/src/ohosTest/ets/test/ContinuationAdditional.test.ets#L856>) | `testContinuationAdditional0024` | `com.samples.appcontinuation_ContinuationAdditional_0024` |
| [SUB_CONTINUATION_CONTINUATIONADDITIONAL_2500](<entry/src/ohosTest/ets/test/ContinuationAdditional.test.ets#L893>) | `testContinuationAdditional0025` | `com.samples.appcontinuation_ContinuationAdditional_0025` |
| [SUB_CONTINUATION_CONTINUATIONADDITIONAL_2600](<entry/src/ohosTest/ets/test/ContinuationAdditional.test.ets#L935>) | `testContinuationAdditional0026` | `com.samples.appcontinuation_ContinuationAdditional_0026` |

### [ContinuationArchiveWaveOne.test.ets](<entry/src/ohosTest/ets/test/ContinuationArchiveWaveOne.test.ets>)（10 例）

| 用例编号（源码） | 旧名 | 规范运行名 |
|---|---|---|
| [SUB_CONTINUATION_ARCHIVEWAVEONE_0100](<entry/src/ohosTest/ets/test/ContinuationArchiveWaveOne.test.ets#L47>) | `testContinuationArchiveWaveOne0001` | `com.samples.appcontinuation_ContinuationArchiveWaveOne_0001` |
| [SUB_CONTINUATION_ARCHIVEWAVEONE_0200](<entry/src/ohosTest/ets/test/ContinuationArchiveWaveOne.test.ets#L73>) | `testContinuationArchiveWaveOne0002` | `com.samples.appcontinuation_ContinuationArchiveWaveOne_0002` |
| [SUB_CONTINUATION_ARCHIVEWAVEONE_0300](<entry/src/ohosTest/ets/test/ContinuationArchiveWaveOne.test.ets#L96>) | `testContinuationArchiveWaveOne0003` | `com.samples.appcontinuation_ContinuationArchiveWaveOne_0003` |
| [SUB_CONTINUATION_ARCHIVEWAVEONE_0400](<entry/src/ohosTest/ets/test/ContinuationArchiveWaveOne.test.ets#L122>) | `testContinuationArchiveWaveOne0004` | `com.samples.appcontinuation_ContinuationArchiveWaveOne_0004` |
| [SUB_CONTINUATION_ARCHIVEWAVEONE_0500](<entry/src/ohosTest/ets/test/ContinuationArchiveWaveOne.test.ets#L138>) | `testContinuationArchiveWaveOne0005` | `com.samples.appcontinuation_ContinuationArchiveWaveOne_0005` |
| [SUB_CONTINUATION_ARCHIVEWAVEONE_0600](<entry/src/ohosTest/ets/test/ContinuationArchiveWaveOne.test.ets#L160>) | `testContinuationArchiveWaveOne0006` | `com.samples.appcontinuation_ContinuationArchiveWaveOne_0006` |
| [SUB_CONTINUATION_ARCHIVEWAVEONE_0700](<entry/src/ohosTest/ets/test/ContinuationArchiveWaveOne.test.ets#L187>) | `testContinuationArchiveWaveOne0007` | `com.samples.appcontinuation_ContinuationArchiveWaveOne_0007` |
| [SUB_CONTINUATION_ARCHIVEWAVEONE_0800](<entry/src/ohosTest/ets/test/ContinuationArchiveWaveOne.test.ets#L206>) | `testContinuationArchiveWaveOne0008` | `com.samples.appcontinuation_ContinuationArchiveWaveOne_0008` |
| [SUB_CONTINUATION_ARCHIVEWAVEONE_0900](<entry/src/ohosTest/ets/test/ContinuationArchiveWaveOne.test.ets#L229>) | `testContinuationArchiveWaveOne0009` | `com.samples.appcontinuation_ContinuationArchiveWaveOne_0009` |
| [SUB_CONTINUATION_ARCHIVEWAVEONE_1000](<entry/src/ohosTest/ets/test/ContinuationArchiveWaveOne.test.ets#L253>) | `testContinuationArchiveWaveOne0010` | `com.samples.appcontinuation_ContinuationArchiveWaveOne_0010` |

### [ContinuationHistoryScopeWaveTwo.test.ets](<entry/src/ohosTest/ets/test/ContinuationHistoryScopeWaveTwo.test.ets>)（2 例）

| 用例编号（源码） | 旧名 | 规范运行名 |
|---|---|---|
| [SUB_CONTINUATION_HISTORYSCOPEWAVETWO_0100](<entry/src/ohosTest/ets/test/ContinuationHistoryScopeWaveTwo.test.ets#L38>) | `testContinuationHistoryScopeWaveTwo0001` | `com.samples.appcontinuation_ContinuationHistoryScopeWaveTwo_0001` |
| [SUB_CONTINUATION_HISTORYSCOPEWAVETWO_0200](<entry/src/ohosTest/ets/test/ContinuationHistoryScopeWaveTwo.test.ets#L56>) | `testContinuationHistoryScopeWaveTwo0002` | `com.samples.appcontinuation_ContinuationHistoryScopeWaveTwo_0002` |

### [ContinuationModeBoundaryWaveTwo.test.ets](<entry/src/ohosTest/ets/test/ContinuationModeBoundaryWaveTwo.test.ets>)（4 例）

| 用例编号（源码） | 旧名 | 规范运行名 |
|---|---|---|
| [SUB_CONTINUATION_MODEBOUNDARYWAVETWO_0100](<entry/src/ohosTest/ets/test/ContinuationModeBoundaryWaveTwo.test.ets#L34>) | `testContinuationModeBoundaryWaveTwo0001` | `com.samples.appcontinuation_ContinuationModeBoundaryWaveTwo_0001` |
| [SUB_CONTINUATION_MODEBOUNDARYWAVETWO_0200](<entry/src/ohosTest/ets/test/ContinuationModeBoundaryWaveTwo.test.ets#L67>) | `testContinuationModeBoundaryWaveTwo0002` | `com.samples.appcontinuation_ContinuationModeBoundaryWaveTwo_0002` |
| [SUB_CONTINUATION_MODEBOUNDARYWAVETWO_0300](<entry/src/ohosTest/ets/test/ContinuationModeBoundaryWaveTwo.test.ets#L94>) | `testContinuationModeBoundaryWaveTwo0003` | `com.samples.appcontinuation_ContinuationModeBoundaryWaveTwo_0003` |
| [SUB_CONTINUATION_MODEBOUNDARYWAVETWO_0400](<entry/src/ohosTest/ets/test/ContinuationModeBoundaryWaveTwo.test.ets#L125>) | `testContinuationModeBoundaryWaveTwo0004` | `com.samples.appcontinuation_ContinuationModeBoundaryWaveTwo_0004` |

### [ContinuationPageWaveOne.test.ets](<entry/src/ohosTest/ets/test/ContinuationPageWaveOne.test.ets>)（8 例）

| 用例编号（源码） | 旧名 | 规范运行名 |
|---|---|---|
| [SUB_CONTINUATION_PAGEWAVEONE_0100](<entry/src/ohosTest/ets/test/ContinuationPageWaveOne.test.ets#L26>) | `testContinuationPageWaveOne0001` | `com.samples.appcontinuation_ContinuationPageWaveOne_0001` |
| [SUB_CONTINUATION_PAGEWAVEONE_0200](<entry/src/ohosTest/ets/test/ContinuationPageWaveOne.test.ets#L48>) | `testContinuationPageWaveOne0002` | `com.samples.appcontinuation_ContinuationPageWaveOne_0002` |
| [SUB_CONTINUATION_PAGEWAVEONE_0300](<entry/src/ohosTest/ets/test/ContinuationPageWaveOne.test.ets#L75>) | `testContinuationPageWaveOne0003` | `com.samples.appcontinuation_ContinuationPageWaveOne_0003` |
| [SUB_CONTINUATION_PAGEWAVEONE_0400](<entry/src/ohosTest/ets/test/ContinuationPageWaveOne.test.ets#L99>) | `testContinuationPageWaveOne0004` | `com.samples.appcontinuation_ContinuationPageWaveOne_0004` |
| [SUB_CONTINUATION_PAGEWAVEONE_0500](<entry/src/ohosTest/ets/test/ContinuationPageWaveOne.test.ets#L126>) | `testContinuationPageWaveOne0005` | `com.samples.appcontinuation_ContinuationPageWaveOne_0005` |
| [SUB_CONTINUATION_PAGEWAVEONE_0600](<entry/src/ohosTest/ets/test/ContinuationPageWaveOne.test.ets#L155>) | `testContinuationPageWaveOne0006` | `com.samples.appcontinuation_ContinuationPageWaveOne_0006` |
| [SUB_CONTINUATION_PAGEWAVEONE_0700](<entry/src/ohosTest/ets/test/ContinuationPageWaveOne.test.ets#L182>) | `testContinuationPageWaveOne0007` | `com.samples.appcontinuation_ContinuationPageWaveOne_0007` |
| [SUB_CONTINUATION_PAGEWAVEONE_0800](<entry/src/ohosTest/ets/test/ContinuationPageWaveOne.test.ets#L209>) | `testContinuationPageWaveOne0008` | `com.samples.appcontinuation_ContinuationPageWaveOne_0008` |

### [ContinuationScenarios.test.ets](<entry/src/ohosTest/ets/test/ContinuationScenarios.test.ets>)（10 例）

| 用例编号（源码） | 旧名 | 规范运行名 |
|---|---|---|
| [SUB_CONTINUATION_CONTINUATIONSCENARIOS_0100](<entry/src/ohosTest/ets/test/ContinuationScenarios.test.ets#L84>) | `testContinuationScenarios0001` | `com.samples.appcontinuation_ContinuationScenarios_0001` |
| [SUB_CONTINUATION_CONTINUATIONSCENARIOS_0200](<entry/src/ohosTest/ets/test/ContinuationScenarios.test.ets#L142>) | `testContinuationScenarios0002` | `com.samples.appcontinuation_ContinuationScenarios_0002` |
| [SUB_CONTINUATION_CONTINUATIONSCENARIOS_0300](<entry/src/ohosTest/ets/test/ContinuationScenarios.test.ets#L239>) | `testContinuationScenarios0003` | `com.samples.appcontinuation_ContinuationScenarios_0003` |
| [SUB_CONTINUATION_CONTINUATIONSCENARIOS_0400](<entry/src/ohosTest/ets/test/ContinuationScenarios.test.ets#L316>) | `testContinuationScenarios0004` | `com.samples.appcontinuation_ContinuationScenarios_0004` |
| [SUB_CONTINUATION_CONTINUATIONSCENARIOS_0500](<entry/src/ohosTest/ets/test/ContinuationScenarios.test.ets#L500>) | `testContinuationScenarios0005` | `com.samples.appcontinuation_ContinuationScenarios_0005` |
| [SUB_CONTINUATION_CONTINUATIONSCENARIOS_0600](<entry/src/ohosTest/ets/test/ContinuationScenarios.test.ets#L564>) | `testContinuationScenarios0006` | `com.samples.appcontinuation_ContinuationScenarios_0006` |
| [SUB_CONTINUATION_CONTINUATIONSCENARIOS_0700](<entry/src/ohosTest/ets/test/ContinuationScenarios.test.ets#L707>) | `testContinuationScenarios0007` | `com.samples.appcontinuation_ContinuationScenarios_0007` |
| [SUB_CONTINUATION_CONTINUATIONSCENARIOS_0800](<entry/src/ohosTest/ets/test/ContinuationScenarios.test.ets#L886>) | `testContinuationScenarios0008` | `com.samples.appcontinuation_ContinuationScenarios_0008` |
| [SUB_CONTINUATION_CONTINUATIONSCENARIOS_0900](<entry/src/ohosTest/ets/test/ContinuationScenarios.test.ets#L973>) | `testContinuationScenarios0009` | `com.samples.appcontinuation_ContinuationScenarios_0009` |
| [SUB_CONTINUATION_CONTINUATIONSCENARIOS_1000](<entry/src/ohosTest/ets/test/ContinuationScenarios.test.ets#L1117>) | `testContinuationScenarios0010` | `com.samples.appcontinuation_ContinuationScenarios_0010` |

### [ContinuationScenes.test.ets](<entry/src/ohosTest/ets/test/ContinuationScenes.test.ets>)（10 例）

| 用例编号（源码） | 旧名 | 规范运行名 |
|---|---|---|
| [SUB_CONTINUATION_CONTINUATIONSCENES_0100](<entry/src/ohosTest/ets/test/ContinuationScenes.test.ets#L105>) | `testContinuationScenes0001` | `com.samples.appcontinuation_ContinuationScenes_0001` |
| [SUB_CONTINUATION_CONTINUATIONSCENES_0200](<entry/src/ohosTest/ets/test/ContinuationScenes.test.ets#L139>) | `testContinuationScenes0002` | `com.samples.appcontinuation_ContinuationScenes_0002` |
| [SUB_CONTINUATION_CONTINUATIONSCENES_0300](<entry/src/ohosTest/ets/test/ContinuationScenes.test.ets#L159>) | `testContinuationScenes0003` | `com.samples.appcontinuation_ContinuationScenes_0003` |
| [SUB_CONTINUATION_CONTINUATIONSCENES_0400](<entry/src/ohosTest/ets/test/ContinuationScenes.test.ets#L178>) | `testContinuationScenes0004` | `com.samples.appcontinuation_ContinuationScenes_0004` |
| [SUB_CONTINUATION_CONTINUATIONSCENES_0500](<entry/src/ohosTest/ets/test/ContinuationScenes.test.ets#L206>) | `testContinuationScenes0005` | `com.samples.appcontinuation_ContinuationScenes_0005` |
| [SUB_CONTINUATION_CONTINUATIONSCENES_0600](<entry/src/ohosTest/ets/test/ContinuationScenes.test.ets#L265>) | `testContinuationScenes0006` | `com.samples.appcontinuation_ContinuationScenes_0006` |
| [SUB_CONTINUATION_CONTINUATIONSCENES_0700](<entry/src/ohosTest/ets/test/ContinuationScenes.test.ets#L292>) | `testContinuationScenes0007` | `com.samples.appcontinuation_ContinuationScenes_0007` |
| [SUB_CONTINUATION_CONTINUATIONSCENES_0800](<entry/src/ohosTest/ets/test/ContinuationScenes.test.ets#L324>) | `testContinuationScenes0008` | `com.samples.appcontinuation_ContinuationScenes_0008` |
| [SUB_CONTINUATION_CONTINUATIONSCENES_0900](<entry/src/ohosTest/ets/test/ContinuationScenes.test.ets#L357>) | `testContinuationScenes0009` | `com.samples.appcontinuation_ContinuationScenes_0009` |
| [SUB_CONTINUATION_CONTINUATIONSCENES_1000](<entry/src/ohosTest/ets/test/ContinuationScenes.test.ets#L385>) | `testContinuationScenes0010` | `com.samples.appcontinuation_ContinuationScenes_0010` |

### [ContinuationTransactions.test.ets](<entry/src/ohosTest/ets/test/ContinuationTransactions.test.ets>)（6 例）

| 用例编号（源码） | 旧名 | 规范运行名 |
|---|---|---|
| [SUB_CONTINUATION_CONTINUATIONTRANSACTIONS_0100](<entry/src/ohosTest/ets/test/ContinuationTransactions.test.ets#L33>) | `testContinuationTransactions0001` | `com.samples.appcontinuation_ContinuationTransactions_0001` |
| [SUB_CONTINUATION_CONTINUATIONTRANSACTIONS_0200](<entry/src/ohosTest/ets/test/ContinuationTransactions.test.ets#L59>) | `testContinuationTransactions0002` | `com.samples.appcontinuation_ContinuationTransactions_0002` |
| [SUB_CONTINUATION_CONTINUATIONTRANSACTIONS_0300](<entry/src/ohosTest/ets/test/ContinuationTransactions.test.ets#L86>) | `testContinuationTransactions0003` | `com.samples.appcontinuation_ContinuationTransactions_0003` |
| [SUB_CONTINUATION_CONTINUATIONTRANSACTIONS_0400](<entry/src/ohosTest/ets/test/ContinuationTransactions.test.ets#L111>) | `testContinuationTransactions0004` | `com.samples.appcontinuation_ContinuationTransactions_0004` |
| [SUB_CONTINUATION_CONTINUATIONTRANSACTIONS_0500](<entry/src/ohosTest/ets/test/ContinuationTransactions.test.ets#L145>) | `testContinuationTransactions0005` | `com.samples.appcontinuation_ContinuationTransactions_0005` |
| [SUB_CONTINUATION_CONTINUATIONTRANSACTIONS_0600](<entry/src/ohosTest/ets/test/ContinuationTransactions.test.ets#L175>) | `testContinuationTransactions0006` | `com.samples.appcontinuation_ContinuationTransactions_0006` |

### [ContinuationVersioning.test.ets](<entry/src/ohosTest/ets/test/ContinuationVersioning.test.ets>)（12 例）

| 用例编号（源码） | 旧名 | 规范运行名 |
|---|---|---|
| [SUB_CONTINUATION_CONTINUATIONVERSIONING_0100](<entry/src/ohosTest/ets/test/ContinuationVersioning.test.ets#L40>) | `testContinuationVersioning0001` | `com.samples.appcontinuation_ContinuationVersioning_0001` |
| [SUB_CONTINUATION_CONTINUATIONVERSIONING_0200](<entry/src/ohosTest/ets/test/ContinuationVersioning.test.ets#L65>) | `testContinuationVersioning0002` | `com.samples.appcontinuation_ContinuationVersioning_0002` |
| [SUB_CONTINUATION_CONTINUATIONVERSIONING_0300](<entry/src/ohosTest/ets/test/ContinuationVersioning.test.ets#L97>) | `testContinuationVersioning0003` | `com.samples.appcontinuation_ContinuationVersioning_0003` |
| [SUB_CONTINUATION_CONTINUATIONVERSIONING_0400](<entry/src/ohosTest/ets/test/ContinuationVersioning.test.ets#L135>) | `testContinuationVersioning0004` | `com.samples.appcontinuation_ContinuationVersioning_0004` |
| [SUB_CONTINUATION_CONTINUATIONVERSIONING_0500](<entry/src/ohosTest/ets/test/ContinuationVersioning.test.ets#L169>) | `testContinuationVersioning0005` | `com.samples.appcontinuation_ContinuationVersioning_0005` |
| [SUB_CONTINUATION_CONTINUATIONVERSIONING_0600](<entry/src/ohosTest/ets/test/ContinuationVersioning.test.ets#L205>) | `testContinuationVersioning0006` | `com.samples.appcontinuation_ContinuationVersioning_0006` |
| [SUB_CONTINUATION_CONTINUATIONVERSIONING_0700](<entry/src/ohosTest/ets/test/ContinuationVersioning.test.ets#L234>) | `testContinuationVersioning0007` | `com.samples.appcontinuation_ContinuationVersioning_0007` |
| [SUB_CONTINUATION_CONTINUATIONVERSIONING_0800](<entry/src/ohosTest/ets/test/ContinuationVersioning.test.ets#L261>) | `testContinuationVersioning0008` | `com.samples.appcontinuation_ContinuationVersioning_0008` |
| [SUB_CONTINUATION_CONTINUATIONVERSIONING_0900](<entry/src/ohosTest/ets/test/ContinuationVersioning.test.ets#L295>) | `testContinuationVersioning0009` | `com.samples.appcontinuation_ContinuationVersioning_0009` |
| [SUB_CONTINUATION_CONTINUATIONVERSIONING_1000](<entry/src/ohosTest/ets/test/ContinuationVersioning.test.ets#L323>) | `testContinuationVersioning0010` | `com.samples.appcontinuation_ContinuationVersioning_0010` |
| [SUB_CONTINUATION_CONTINUATIONVERSIONING_1100](<entry/src/ohosTest/ets/test/ContinuationVersioning.test.ets#L351>) | `testContinuationVersioning0011` | `com.samples.appcontinuation_ContinuationVersioning_0011` |
| [SUB_CONTINUATION_CONTINUATIONVERSIONING_1200](<entry/src/ohosTest/ets/test/ContinuationVersioning.test.ets#L375>) | `testContinuationVersioning0012` | `com.samples.appcontinuation_ContinuationVersioning_0012` |

### [ContinuationWorkbenchWaveOne.test.ets](<entry/src/ohosTest/ets/test/ContinuationWorkbenchWaveOne.test.ets>)（22 例）

| 用例编号（源码） | 旧名 | 规范运行名 |
|---|---|---|
| [SUB_CONTINUATION_WORKBENCHWAVEONE_0100](<entry/src/ohosTest/ets/test/ContinuationWorkbenchWaveOne.test.ets#L31>) | `testContinuationWorkbenchWaveOne0001` | `com.samples.appcontinuation_ContinuationWorkbenchWaveOne_0001` |
| [SUB_CONTINUATION_WORKBENCHWAVEONE_0200](<entry/src/ohosTest/ets/test/ContinuationWorkbenchWaveOne.test.ets#L51>) | `testContinuationWorkbenchWaveOne0002` | `com.samples.appcontinuation_ContinuationWorkbenchWaveOne_0002` |
| [SUB_CONTINUATION_WORKBENCHWAVEONE_0300](<entry/src/ohosTest/ets/test/ContinuationWorkbenchWaveOne.test.ets#L71>) | `testContinuationWorkbenchWaveOne0003` | `com.samples.appcontinuation_ContinuationWorkbenchWaveOne_0003` |
| [SUB_CONTINUATION_WORKBENCHWAVEONE_0400](<entry/src/ohosTest/ets/test/ContinuationWorkbenchWaveOne.test.ets#L91>) | `testContinuationWorkbenchWaveOne0004` | `com.samples.appcontinuation_ContinuationWorkbenchWaveOne_0004` |
| [SUB_CONTINUATION_WORKBENCHWAVEONE_0500](<entry/src/ohosTest/ets/test/ContinuationWorkbenchWaveOne.test.ets#L107>) | `testContinuationWorkbenchWaveOne0005` | `com.samples.appcontinuation_ContinuationWorkbenchWaveOne_0005` |
| [SUB_CONTINUATION_WORKBENCHWAVEONE_0600](<entry/src/ohosTest/ets/test/ContinuationWorkbenchWaveOne.test.ets#L125>) | `testContinuationWorkbenchWaveOne0006` | `com.samples.appcontinuation_ContinuationWorkbenchWaveOne_0006` |
| [SUB_CONTINUATION_WORKBENCHWAVEONE_0700](<entry/src/ohosTest/ets/test/ContinuationWorkbenchWaveOne.test.ets#L142>) | `testContinuationWorkbenchWaveOne0007` | `com.samples.appcontinuation_ContinuationWorkbenchWaveOne_0007` |
| [SUB_CONTINUATION_WORKBENCHWAVEONE_0800](<entry/src/ohosTest/ets/test/ContinuationWorkbenchWaveOne.test.ets#L167>) | `testContinuationWorkbenchWaveOne0008` | `com.samples.appcontinuation_ContinuationWorkbenchWaveOne_0008` |
| [SUB_CONTINUATION_WORKBENCHWAVEONE_0900](<entry/src/ohosTest/ets/test/ContinuationWorkbenchWaveOne.test.ets#L187>) | `testContinuationWorkbenchWaveOne0009` | `com.samples.appcontinuation_ContinuationWorkbenchWaveOne_0009` |
| [SUB_CONTINUATION_WORKBENCHWAVEONE_1000](<entry/src/ohosTest/ets/test/ContinuationWorkbenchWaveOne.test.ets#L203>) | `testContinuationWorkbenchWaveOne0010` | `com.samples.appcontinuation_ContinuationWorkbenchWaveOne_0010` |
| [SUB_CONTINUATION_WORKBENCHWAVEONE_1100](<entry/src/ohosTest/ets/test/ContinuationWorkbenchWaveOne.test.ets#L225>) | `testContinuationWorkbenchWaveOne0011` | `com.samples.appcontinuation_ContinuationWorkbenchWaveOne_0011` |
| [SUB_CONTINUATION_WORKBENCHWAVEONE_1200](<entry/src/ohosTest/ets/test/ContinuationWorkbenchWaveOne.test.ets#L246>) | `testContinuationWorkbenchWaveOne0012` | `com.samples.appcontinuation_ContinuationWorkbenchWaveOne_0012` |
| [SUB_CONTINUATION_WORKBENCHWAVEONE_1300](<entry/src/ohosTest/ets/test/ContinuationWorkbenchWaveOne.test.ets#L271>) | `testContinuationWorkbenchWaveOne0013` | `com.samples.appcontinuation_ContinuationWorkbenchWaveOne_0013` |
| [SUB_CONTINUATION_WORKBENCHWAVEONE_1400](<entry/src/ohosTest/ets/test/ContinuationWorkbenchWaveOne.test.ets#L294>) | `testContinuationWorkbenchWaveOne0014` | `com.samples.appcontinuation_ContinuationWorkbenchWaveOne_0014` |
| [SUB_CONTINUATION_WORKBENCHWAVEONE_1500](<entry/src/ohosTest/ets/test/ContinuationWorkbenchWaveOne.test.ets#L316>) | `testContinuationWorkbenchWaveOne0015` | `com.samples.appcontinuation_ContinuationWorkbenchWaveOne_0015` |
| [SUB_CONTINUATION_WORKBENCHWAVEONE_1600](<entry/src/ohosTest/ets/test/ContinuationWorkbenchWaveOne.test.ets#L336>) | `testContinuationWorkbenchWaveOne0016` | `com.samples.appcontinuation_ContinuationWorkbenchWaveOne_0016` |
| [SUB_CONTINUATION_WORKBENCHWAVEONE_1700](<entry/src/ohosTest/ets/test/ContinuationWorkbenchWaveOne.test.ets#L356>) | `testContinuationWorkbenchWaveOne0017` | `com.samples.appcontinuation_ContinuationWorkbenchWaveOne_0017` |
| [SUB_CONTINUATION_WORKBENCHWAVEONE_1800](<entry/src/ohosTest/ets/test/ContinuationWorkbenchWaveOne.test.ets#L379>) | `testContinuationWorkbenchWaveOne0018` | `com.samples.appcontinuation_ContinuationWorkbenchWaveOne_0018` |
| [SUB_CONTINUATION_WORKBENCHWAVEONE_1900](<entry/src/ohosTest/ets/test/ContinuationWorkbenchWaveOne.test.ets#L402>) | `testContinuationWorkbenchWaveOne0019` | `com.samples.appcontinuation_ContinuationWorkbenchWaveOne_0019` |
| [SUB_CONTINUATION_WORKBENCHWAVEONE_2000](<entry/src/ohosTest/ets/test/ContinuationWorkbenchWaveOne.test.ets#L421>) | `testContinuationWorkbenchWaveOne0020` | `com.samples.appcontinuation_ContinuationWorkbenchWaveOne_0020` |
| [SUB_CONTINUATION_WORKBENCHWAVEONE_2100](<entry/src/ohosTest/ets/test/ContinuationWorkbenchWaveOne.test.ets#L444>) | `testContinuationWorkbenchWaveOne0021` | `com.samples.appcontinuation_ContinuationWorkbenchWaveOne_0021` |
| [SUB_CONTINUATION_WORKBENCHWAVEONE_2200](<entry/src/ohosTest/ets/test/ContinuationWorkbenchWaveOne.test.ets#L468>) | `testContinuationWorkbenchWaveOne0022` | `com.samples.appcontinuation_ContinuationWorkbenchWaveOne_0022` |

### [DocumentFormFlowCases.test.ets](<entry/src/ohosTest/ets/test/DocumentFormFlowCases.test.ets>)（40 例）

| 用例编号（源码） | 旧名 | 规范运行名 |
|---|---|---|
| [SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_0100](<entry/src/ohosTest/ets/test/DocumentFormFlowCases.test.ets#L61>) | `testDocumentFormFlowCases0001` | `com.samples.appcontinuation_DocumentFormFlowCases_0001` |
| [SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_0200](<entry/src/ohosTest/ets/test/DocumentFormFlowCases.test.ets#L80>) | `testDocumentFormFlowCases0002` | `com.samples.appcontinuation_DocumentFormFlowCases_0002` |
| [SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_0300](<entry/src/ohosTest/ets/test/DocumentFormFlowCases.test.ets#L99>) | `testDocumentFormFlowCases0003` | `com.samples.appcontinuation_DocumentFormFlowCases_0003` |
| [SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_0400](<entry/src/ohosTest/ets/test/DocumentFormFlowCases.test.ets#L118>) | `testDocumentFormFlowCases0004` | `com.samples.appcontinuation_DocumentFormFlowCases_0004` |
| [SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_0500](<entry/src/ohosTest/ets/test/DocumentFormFlowCases.test.ets#L137>) | `testDocumentFormFlowCases0005` | `com.samples.appcontinuation_DocumentFormFlowCases_0005` |
| [SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_0600](<entry/src/ohosTest/ets/test/DocumentFormFlowCases.test.ets#L156>) | `testDocumentFormFlowCases0006` | `com.samples.appcontinuation_DocumentFormFlowCases_0006` |
| [SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_0700](<entry/src/ohosTest/ets/test/DocumentFormFlowCases.test.ets#L175>) | `testDocumentFormFlowCases0007` | `com.samples.appcontinuation_DocumentFormFlowCases_0007` |
| [SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_0800](<entry/src/ohosTest/ets/test/DocumentFormFlowCases.test.ets#L194>) | `testDocumentFormFlowCases0008` | `com.samples.appcontinuation_DocumentFormFlowCases_0008` |
| [SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_0900](<entry/src/ohosTest/ets/test/DocumentFormFlowCases.test.ets#L215>) | `testDocumentFormFlowCases0009` | `com.samples.appcontinuation_DocumentFormFlowCases_0009` |
| [SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_1000](<entry/src/ohosTest/ets/test/DocumentFormFlowCases.test.ets#L235>) | `testDocumentFormFlowCases0010` | `com.samples.appcontinuation_DocumentFormFlowCases_0010` |
| [SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_1100](<entry/src/ohosTest/ets/test/DocumentFormFlowCases.test.ets#L252>) | `testDocumentFormFlowCases0011` | `com.samples.appcontinuation_DocumentFormFlowCases_0011` |
| [SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_1200](<entry/src/ohosTest/ets/test/DocumentFormFlowCases.test.ets#L271>) | `testDocumentFormFlowCases0012` | `com.samples.appcontinuation_DocumentFormFlowCases_0012` |
| [SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_1300](<entry/src/ohosTest/ets/test/DocumentFormFlowCases.test.ets#L291>) | `testDocumentFormFlowCases0013` | `com.samples.appcontinuation_DocumentFormFlowCases_0013` |
| [SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_1400](<entry/src/ohosTest/ets/test/DocumentFormFlowCases.test.ets#L308>) | `testDocumentFormFlowCases0014` | `com.samples.appcontinuation_DocumentFormFlowCases_0014` |
| [SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_1500](<entry/src/ohosTest/ets/test/DocumentFormFlowCases.test.ets#L327>) | `testDocumentFormFlowCases0015` | `com.samples.appcontinuation_DocumentFormFlowCases_0015` |
| [SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_1600](<entry/src/ohosTest/ets/test/DocumentFormFlowCases.test.ets#L345>) | `testDocumentFormFlowCases0016` | `com.samples.appcontinuation_DocumentFormFlowCases_0016` |
| [SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_1700](<entry/src/ohosTest/ets/test/DocumentFormFlowCases.test.ets#L363>) | `testDocumentFormFlowCases0017` | `com.samples.appcontinuation_DocumentFormFlowCases_0017` |
| [SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_1800](<entry/src/ohosTest/ets/test/DocumentFormFlowCases.test.ets#L382>) | `testDocumentFormFlowCases0018` | `com.samples.appcontinuation_DocumentFormFlowCases_0018` |
| [SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_1900](<entry/src/ohosTest/ets/test/DocumentFormFlowCases.test.ets#L401>) | `testDocumentFormFlowCases0019` | `com.samples.appcontinuation_DocumentFormFlowCases_0019` |
| [SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_2000](<entry/src/ohosTest/ets/test/DocumentFormFlowCases.test.ets#L421>) | `testDocumentFormFlowCases0020` | `com.samples.appcontinuation_DocumentFormFlowCases_0020` |
| [SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_2100](<entry/src/ohosTest/ets/test/DocumentFormFlowCases.test.ets#L444>) | `testDocumentFormFlowCases0021` | `com.samples.appcontinuation_DocumentFormFlowCases_0021` |
| [SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_2200](<entry/src/ohosTest/ets/test/DocumentFormFlowCases.test.ets#L463>) | `testDocumentFormFlowCases0022` | `com.samples.appcontinuation_DocumentFormFlowCases_0022` |
| [SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_2300](<entry/src/ohosTest/ets/test/DocumentFormFlowCases.test.ets#L483>) | `testDocumentFormFlowCases0023` | `com.samples.appcontinuation_DocumentFormFlowCases_0023` |
| [SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_2400](<entry/src/ohosTest/ets/test/DocumentFormFlowCases.test.ets#L502>) | `testDocumentFormFlowCases0024` | `com.samples.appcontinuation_DocumentFormFlowCases_0024` |
| [SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_2500](<entry/src/ohosTest/ets/test/DocumentFormFlowCases.test.ets#L525>) | `testDocumentFormFlowCases0025` | `com.samples.appcontinuation_DocumentFormFlowCases_0025` |
| [SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_2600](<entry/src/ohosTest/ets/test/DocumentFormFlowCases.test.ets#L547>) | `testDocumentFormFlowCases0026` | `com.samples.appcontinuation_DocumentFormFlowCases_0026` |
| [SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_2700](<entry/src/ohosTest/ets/test/DocumentFormFlowCases.test.ets#L572>) | `testDocumentFormFlowCases0027` | `com.samples.appcontinuation_DocumentFormFlowCases_0027` |
| [SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_2800](<entry/src/ohosTest/ets/test/DocumentFormFlowCases.test.ets#L592>) | `testDocumentFormFlowCases0028` | `com.samples.appcontinuation_DocumentFormFlowCases_0028` |
| [SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_2900](<entry/src/ohosTest/ets/test/DocumentFormFlowCases.test.ets#L615>) | `testDocumentFormFlowCases0029` | `com.samples.appcontinuation_DocumentFormFlowCases_0029` |
| [SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_3000](<entry/src/ohosTest/ets/test/DocumentFormFlowCases.test.ets#L633>) | `testDocumentFormFlowCases0030` | `com.samples.appcontinuation_DocumentFormFlowCases_0030` |
| [SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_3100](<entry/src/ohosTest/ets/test/DocumentFormFlowCases.test.ets#L653>) | `testDocumentFormFlowCases0031` | `com.samples.appcontinuation_DocumentFormFlowCases_0031` |
| [SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_3200](<entry/src/ohosTest/ets/test/DocumentFormFlowCases.test.ets#L677>) | `testDocumentFormFlowCases0032` | `com.samples.appcontinuation_DocumentFormFlowCases_0032` |
| [SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_3300](<entry/src/ohosTest/ets/test/DocumentFormFlowCases.test.ets#L700>) | `testDocumentFormFlowCases0033` | `com.samples.appcontinuation_DocumentFormFlowCases_0033` |
| [SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_3400](<entry/src/ohosTest/ets/test/DocumentFormFlowCases.test.ets#L722>) | `testDocumentFormFlowCases0034` | `com.samples.appcontinuation_DocumentFormFlowCases_0034` |
| [SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_3500](<entry/src/ohosTest/ets/test/DocumentFormFlowCases.test.ets#L744>) | `testDocumentFormFlowCases0035` | `com.samples.appcontinuation_DocumentFormFlowCases_0035` |
| [SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_3600](<entry/src/ohosTest/ets/test/DocumentFormFlowCases.test.ets#L768>) | `testDocumentFormFlowCases0036` | `com.samples.appcontinuation_DocumentFormFlowCases_0036` |
| [SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_3700](<entry/src/ohosTest/ets/test/DocumentFormFlowCases.test.ets#L788>) | `testDocumentFormFlowCases0037` | `com.samples.appcontinuation_DocumentFormFlowCases_0037` |
| [SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_3800](<entry/src/ohosTest/ets/test/DocumentFormFlowCases.test.ets#L809>) | `testDocumentFormFlowCases0038` | `com.samples.appcontinuation_DocumentFormFlowCases_0038` |
| [SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_3900](<entry/src/ohosTest/ets/test/DocumentFormFlowCases.test.ets#L829>) | `testDocumentFormFlowCases0039` | `com.samples.appcontinuation_DocumentFormFlowCases_0039` |
| [SUB_CONTINUATION_DOCUMENTFORMFLOWCASES_4000](<entry/src/ohosTest/ets/test/DocumentFormFlowCases.test.ets#L852>) | `testDocumentFormFlowCases0040` | `com.samples.appcontinuation_DocumentFormFlowCases_0040` |

### [MergeRecoveryMatrixCases.test.ets](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets>)（50 例）

| 用例编号（源码） | 旧名 | 规范运行名 |
|---|---|---|
| [SUB_CONTINUATION_FIELDTRIPLECASES_0100](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L49>) | `testFieldTripleCases0001` | `com.samples.appcontinuation_FieldTripleCases_0001` |
| [SUB_CONTINUATION_FIELDTRIPLECASES_0200](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L67>) | `testFieldTripleCases0002` | `com.samples.appcontinuation_FieldTripleCases_0002` |
| [SUB_CONTINUATION_FIELDTRIPLECASES_0300](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L84>) | `testFieldTripleCases0003` | `com.samples.appcontinuation_FieldTripleCases_0003` |
| [SUB_CONTINUATION_FIELDTRIPLECASES_0400](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L100>) | `testFieldTripleCases0004` | `com.samples.appcontinuation_FieldTripleCases_0004` |
| [SUB_CONTINUATION_FIELDTRIPLECASES_0500](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L118>) | `testFieldTripleCases0005` | `com.samples.appcontinuation_FieldTripleCases_0005` |
| [SUB_CONTINUATION_FIELDTRIPLECASES_0600](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L134>) | `testFieldTripleCases0006` | `com.samples.appcontinuation_FieldTripleCases_0006` |
| [SUB_CONTINUATION_FIELDTRIPLECASES_0700](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L150>) | `testFieldTripleCases0007` | `com.samples.appcontinuation_FieldTripleCases_0007` |
| [SUB_CONTINUATION_FIELDTRIPLECASES_0800](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L168>) | `testFieldTripleCases0008` | `com.samples.appcontinuation_FieldTripleCases_0008` |
| [SUB_CONTINUATION_FIELDTRIPLECASES_0900](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L184>) | `testFieldTripleCases0009` | `com.samples.appcontinuation_FieldTripleCases_0009` |
| [SUB_CONTINUATION_FIELDTRIPLECASES_1000](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L201>) | `testFieldTripleCases0010` | `com.samples.appcontinuation_FieldTripleCases_0010` |
| [SUB_CONTINUATION_FIELDTRIPLECASES_1100](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L218>) | `testFieldTripleCases0011` | `com.samples.appcontinuation_FieldTripleCases_0011` |
| [SUB_CONTINUATION_FIELDDECISIONCASES_0100](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L237>) | `testFieldDecisionCases0001` | `com.samples.appcontinuation_FieldDecisionCases_0001` |
| [SUB_CONTINUATION_FIELDDECISIONCASES_0200](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L254>) | `testFieldDecisionCases0002` | `com.samples.appcontinuation_FieldDecisionCases_0002` |
| [SUB_CONTINUATION_FIELDDECISIONCASES_0300](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L272>) | `testFieldDecisionCases0003` | `com.samples.appcontinuation_FieldDecisionCases_0003` |
| [SUB_CONTINUATION_FIELDDECISIONCASES_0400](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L293>) | `testFieldDecisionCases0004` | `com.samples.appcontinuation_FieldDecisionCases_0004` |
| [SUB_CONTINUATION_PLANMERGECASES_0100](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L313>) | `testPlanMergeCases0001` | `com.samples.appcontinuation_PlanMergeCases_0001` |
| [SUB_CONTINUATION_PLANMERGECASES_0200](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L330>) | `testPlanMergeCases0002` | `com.samples.appcontinuation_PlanMergeCases_0002` |
| [SUB_CONTINUATION_PLANMERGECASES_0300](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L347>) | `testPlanMergeCases0003` | `com.samples.appcontinuation_PlanMergeCases_0003` |
| [SUB_CONTINUATION_PLANMERGECASES_0400](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L363>) | `testPlanMergeCases0004` | `com.samples.appcontinuation_PlanMergeCases_0004` |
| [SUB_CONTINUATION_PLANMERGECASES_0500](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L380>) | `testPlanMergeCases0005` | `com.samples.appcontinuation_PlanMergeCases_0005` |
| [SUB_CONTINUATION_PLANMERGECASES_0600](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L397>) | `testPlanMergeCases0006` | `com.samples.appcontinuation_PlanMergeCases_0006` |
| [SUB_CONTINUATION_PLANMERGECASES_0700](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L413>) | `testPlanMergeCases0007` | `com.samples.appcontinuation_PlanMergeCases_0007` |
| [SUB_CONTINUATION_PLANMERGECASES_0800](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L431>) | `testPlanMergeCases0008` | `com.samples.appcontinuation_PlanMergeCases_0008` |
| [SUB_CONTINUATION_PLANMERGECASES_0900](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L448>) | `testPlanMergeCases0009` | `com.samples.appcontinuation_PlanMergeCases_0009` |
| [SUB_CONTINUATION_PLANMERGECASES_1000](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L466>) | `testPlanMergeCases0010` | `com.samples.appcontinuation_PlanMergeCases_0010` |
| [SUB_CONTINUATION_APPLYMERGECASES_0100](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L484>) | `testApplyMergeCases0001` | `com.samples.appcontinuation_ApplyMergeCases_0001` |
| [SUB_CONTINUATION_APPLYMERGECASES_0200](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L502>) | `testApplyMergeCases0002` | `com.samples.appcontinuation_ApplyMergeCases_0002` |
| [SUB_CONTINUATION_APPLYMERGECASES_0300](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L520>) | `testApplyMergeCases0003` | `com.samples.appcontinuation_ApplyMergeCases_0003` |
| [SUB_CONTINUATION_APPLYMERGECASES_0400](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L538>) | `testApplyMergeCases0004` | `com.samples.appcontinuation_ApplyMergeCases_0004` |
| [SUB_CONTINUATION_APPLYMERGECASES_0500](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L556>) | `testApplyMergeCases0005` | `com.samples.appcontinuation_ApplyMergeCases_0005` |
| [SUB_CONTINUATION_APPLYMERGECASES_0600](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L573>) | `testApplyMergeCases0006` | `com.samples.appcontinuation_ApplyMergeCases_0006` |
| [SUB_CONTINUATION_APPLYMERGECASES_0700](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L591>) | `testApplyMergeCases0007` | `com.samples.appcontinuation_ApplyMergeCases_0007` |
| [SUB_CONTINUATION_APPLYMERGECASES_0800](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L607>) | `testApplyMergeCases0008` | `com.samples.appcontinuation_ApplyMergeCases_0008` |
| [SUB_CONTINUATION_APPLYMERGECASES_0900](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L623>) | `testApplyMergeCases0009` | `com.samples.appcontinuation_ApplyMergeCases_0009` |
| [SUB_CONTINUATION_RESOLVEALLCASES_0100](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L642>) | `testResolveAllCases0001` | `com.samples.appcontinuation_ResolveAllCases_0001` |
| [SUB_CONTINUATION_RESOLVEALLCASES_0200](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L660>) | `testResolveAllCases0002` | `com.samples.appcontinuation_ResolveAllCases_0002` |
| [SUB_CONTINUATION_RESOLVEALLCASES_0300](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L678>) | `testResolveAllCases0003` | `com.samples.appcontinuation_ResolveAllCases_0003` |
| [SUB_CONTINUATION_RESOLVEALLCASES_0400](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L696>) | `testResolveAllCases0004` | `com.samples.appcontinuation_ResolveAllCases_0004` |
| [SUB_CONTINUATION_RESOLVEALLCASES_0500](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L713>) | `testResolveAllCases0005` | `com.samples.appcontinuation_ResolveAllCases_0005` |
| [SUB_CONTINUATION_RESOLVEALLCASES_0600](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L729>) | `testResolveAllCases0006` | `com.samples.appcontinuation_ResolveAllCases_0006` |
| [SUB_CONTINUATION_PREVIEWCASES_0100](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L750>) | `testPreviewCases0001` | `com.samples.appcontinuation_PreviewCases_0001` |
| [SUB_CONTINUATION_PREVIEWCASES_0200](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L767>) | `testPreviewCases0002` | `com.samples.appcontinuation_PreviewCases_0002` |
| [SUB_CONTINUATION_PREVIEWCASES_0300](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L784>) | `testPreviewCases0003` | `com.samples.appcontinuation_PreviewCases_0003` |
| [SUB_CONTINUATION_PREVIEWCASES_0400](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L801>) | `testPreviewCases0004` | `com.samples.appcontinuation_PreviewCases_0004` |
| [SUB_CONTINUATION_PREVIEWCASES_0500](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L817>) | `testPreviewCases0005` | `com.samples.appcontinuation_PreviewCases_0005` |
| [SUB_CONTINUATION_TRIPLESTATSCASES_0100](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L836>) | `testTripleStatsCases0001` | `com.samples.appcontinuation_TripleStatsCases_0001` |
| [SUB_CONTINUATION_TRIPLESTATSCASES_0200](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L852>) | `testTripleStatsCases0002` | `com.samples.appcontinuation_TripleStatsCases_0002` |
| [SUB_CONTINUATION_TRIPLESTATSCASES_0300](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L868>) | `testTripleStatsCases0003` | `com.samples.appcontinuation_TripleStatsCases_0003` |
| [SUB_CONTINUATION_TRIPLESTATSCASES_0400](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L887>) | `testTripleStatsCases0004` | `com.samples.appcontinuation_TripleStatsCases_0004` |
| [SUB_CONTINUATION_TRIPLESTATSCASES_0500](<entry/src/ohosTest/ets/test/MergeRecoveryMatrixCases.test.ets#L903>) | `testTripleStatsCases0005` | `com.samples.appcontinuation_TripleStatsCases_0005` |

### [PayloadMatrix.test.ets](<entry/src/ohosTest/ets/test/PayloadMatrix.test.ets>)（15 例）

| 用例编号（源码） | 旧名 | 规范运行名 |
|---|---|---|
| [SUB_CONTINUATION_PAYLOADSCHEMAMATRIX_0100](<entry/src/ohosTest/ets/test/PayloadMatrix.test.ets#L54>) | `testPayloadSchemaMatrix0001` | `com.samples.appcontinuation_PayloadSchemaMatrix_0001` |
| [SUB_CONTINUATION_PAYLOADSCHEMAMATRIX_0200](<entry/src/ohosTest/ets/test/PayloadMatrix.test.ets#L87>) | `testPayloadSchemaMatrix0002` | `com.samples.appcontinuation_PayloadSchemaMatrix_0002` |
| [SUB_CONTINUATION_PAYLOADSCHEMAMATRIX_0300](<entry/src/ohosTest/ets/test/PayloadMatrix.test.ets#L109>) | `testPayloadSchemaMatrix0003` | `com.samples.appcontinuation_PayloadSchemaMatrix_0003` |
| [SUB_CONTINUATION_PAYLOADCODECMATRIX_0100](<entry/src/ohosTest/ets/test/PayloadMatrix.test.ets#L133>) | `testPayloadCodecMatrix0001` | `com.samples.appcontinuation_PayloadCodecMatrix_0001` |
| [SUB_CONTINUATION_PAYLOADCODECMATRIX_0200](<entry/src/ohosTest/ets/test/PayloadMatrix.test.ets#L164>) | `testPayloadCodecMatrix0002` | `com.samples.appcontinuation_PayloadCodecMatrix_0002` |
| [SUB_CONTINUATION_PAYLOADCODECMATRIX_0300](<entry/src/ohosTest/ets/test/PayloadMatrix.test.ets#L195>) | `testPayloadCodecMatrix0003` | `com.samples.appcontinuation_PayloadCodecMatrix_0003` |
| [SUB_CONTINUATION_PAYLOADCODECMATRIX_0400](<entry/src/ohosTest/ets/test/PayloadMatrix.test.ets#L224>) | `testPayloadCodecMatrix0004` | `com.samples.appcontinuation_PayloadCodecMatrix_0004` |
| [SUB_CONTINUATION_PAYLOADCODECMATRIX_0500](<entry/src/ohosTest/ets/test/PayloadMatrix.test.ets#L247>) | `testPayloadCodecMatrix0005` | `com.samples.appcontinuation_PayloadCodecMatrix_0005` |
| [SUB_CONTINUATION_CONFLICTPOLICYMATRIX_0100](<entry/src/ohosTest/ets/test/PayloadMatrix.test.ets#L284>) | `testConflictPolicyMatrix0001` | `com.samples.appcontinuation_ConflictPolicyMatrix_0001` |
| [SUB_CONTINUATION_CONFLICTPOLICYMATRIX_0200](<entry/src/ohosTest/ets/test/PayloadMatrix.test.ets#L311>) | `testConflictPolicyMatrix0002` | `com.samples.appcontinuation_ConflictPolicyMatrix_0002` |
| [SUB_CONTINUATION_CONFLICTPOLICYMATRIX_0300](<entry/src/ohosTest/ets/test/PayloadMatrix.test.ets#L343>) | `testConflictPolicyMatrix0003` | `com.samples.appcontinuation_ConflictPolicyMatrix_0003` |
| [SUB_CONTINUATION_CONFLICTPOLICYMATRIX_0400](<entry/src/ohosTest/ets/test/PayloadMatrix.test.ets#L379>) | `testConflictPolicyMatrix0004` | `com.samples.appcontinuation_ConflictPolicyMatrix_0004` |
| [SUB_CONTINUATION_CONTINUATIONRULESMATRIX_0100](<entry/src/ohosTest/ets/test/PayloadMatrix.test.ets#L413>) | `testContinuationRulesMatrix0001` | `com.samples.appcontinuation_ContinuationRulesMatrix_0001` |
| [SUB_CONTINUATION_CONTINUATIONRULESMATRIX_0200](<entry/src/ohosTest/ets/test/PayloadMatrix.test.ets#L439>) | `testContinuationRulesMatrix0002` | `com.samples.appcontinuation_ContinuationRulesMatrix_0002` |
| [SUB_CONTINUATION_CONTINUATIONRULESMATRIX_0300](<entry/src/ohosTest/ets/test/PayloadMatrix.test.ets#L476>) | `testContinuationRulesMatrix0003` | `com.samples.appcontinuation_ContinuationRulesMatrix_0003` |

### [PayloadRuleCases.test.ets](<entry/src/ohosTest/ets/test/PayloadRuleCases.test.ets>)（36 例）

| 用例编号（源码） | 旧名 | 规范运行名 |
|---|---|---|
| [SUB_CONTINUATION_PAYLOADFIELDCASES_0100](<entry/src/ohosTest/ets/test/PayloadRuleCases.test.ets#L111>) | `testPayloadFieldCases0001` | `com.samples.appcontinuation_PayloadFieldCases_0001` |
| [SUB_CONTINUATION_PAYLOADFIELDCASES_0200](<entry/src/ohosTest/ets/test/PayloadRuleCases.test.ets#L133>) | `testPayloadFieldCases0002` | `com.samples.appcontinuation_PayloadFieldCases_0002` |
| [SUB_CONTINUATION_PAYLOADFIELDCASES_0300](<entry/src/ohosTest/ets/test/PayloadRuleCases.test.ets#L155>) | `testPayloadFieldCases0003` | `com.samples.appcontinuation_PayloadFieldCases_0003` |
| [SUB_CONTINUATION_PAYLOADFIELDCASES_0400](<entry/src/ohosTest/ets/test/PayloadRuleCases.test.ets#L178>) | `testPayloadFieldCases0004` | `com.samples.appcontinuation_PayloadFieldCases_0004` |
| [SUB_CONTINUATION_PAYLOADFIELDCASES_0500](<entry/src/ohosTest/ets/test/PayloadRuleCases.test.ets#L200>) | `testPayloadFieldCases0005` | `com.samples.appcontinuation_PayloadFieldCases_0005` |
| [SUB_CONTINUATION_PAYLOADFIELDCASES_0600](<entry/src/ohosTest/ets/test/PayloadRuleCases.test.ets#L220>) | `testPayloadFieldCases0006` | `com.samples.appcontinuation_PayloadFieldCases_0006` |
| [SUB_CONTINUATION_PAYLOADFIELDCASES_0700](<entry/src/ohosTest/ets/test/PayloadRuleCases.test.ets#L239>) | `testPayloadFieldCases0007` | `com.samples.appcontinuation_PayloadFieldCases_0007` |
| [SUB_CONTINUATION_PAYLOADFIELDCASES_0800](<entry/src/ohosTest/ets/test/PayloadRuleCases.test.ets#L262>) | `testPayloadFieldCases0008` | `com.samples.appcontinuation_PayloadFieldCases_0008` |
| [SUB_CONTINUATION_READINESSRULECASES_0100](<entry/src/ohosTest/ets/test/PayloadRuleCases.test.ets#L284>) | `testReadinessRuleCases0001` | `com.samples.appcontinuation_ReadinessRuleCases_0001` |
| [SUB_CONTINUATION_READINESSRULECASES_0200](<entry/src/ohosTest/ets/test/PayloadRuleCases.test.ets#L302>) | `testReadinessRuleCases0002` | `com.samples.appcontinuation_ReadinessRuleCases_0002` |
| [SUB_CONTINUATION_READINESSRULECASES_0300](<entry/src/ohosTest/ets/test/PayloadRuleCases.test.ets#L319>) | `testReadinessRuleCases0003` | `com.samples.appcontinuation_ReadinessRuleCases_0003` |
| [SUB_CONTINUATION_READINESSRULECASES_0400](<entry/src/ohosTest/ets/test/PayloadRuleCases.test.ets#L336>) | `testReadinessRuleCases0004` | `com.samples.appcontinuation_ReadinessRuleCases_0004` |
| [SUB_CONTINUATION_READINESSRULECASES_0500](<entry/src/ohosTest/ets/test/PayloadRuleCases.test.ets#L356>) | `testReadinessRuleCases0005` | `com.samples.appcontinuation_ReadinessRuleCases_0005` |
| [SUB_CONTINUATION_READINESSRULECASES_0600](<entry/src/ohosTest/ets/test/PayloadRuleCases.test.ets#L372>) | `testReadinessRuleCases0006` | `com.samples.appcontinuation_ReadinessRuleCases_0006` |
| [SUB_CONTINUATION_READINESSRULECASES_0700](<entry/src/ohosTest/ets/test/PayloadRuleCases.test.ets#L391>) | `testReadinessRuleCases0007` | `com.samples.appcontinuation_ReadinessRuleCases_0007` |
| [SUB_CONTINUATION_READINESSRULECASES_0800](<entry/src/ohosTest/ets/test/PayloadRuleCases.test.ets#L408>) | `testReadinessRuleCases0008` | `com.samples.appcontinuation_ReadinessRuleCases_0008` |
| [SUB_CONTINUATION_READINESSRULECASES_0900](<entry/src/ohosTest/ets/test/PayloadRuleCases.test.ets#L424>) | `testReadinessRuleCases0009` | `com.samples.appcontinuation_ReadinessRuleCases_0009` |
| [SUB_CONTINUATION_READINESSRULECASES_1000](<entry/src/ohosTest/ets/test/PayloadRuleCases.test.ets#L442>) | `testReadinessRuleCases0010` | `com.samples.appcontinuation_ReadinessRuleCases_0010` |
| [SUB_CONTINUATION_READINESSRULECASES_1100](<entry/src/ohosTest/ets/test/PayloadRuleCases.test.ets#L461>) | `testReadinessRuleCases0011` | `com.samples.appcontinuation_ReadinessRuleCases_0011` |
| [SUB_CONTINUATION_READINESSRULECASES_1200](<entry/src/ohosTest/ets/test/PayloadRuleCases.test.ets#L478>) | `testReadinessRuleCases0012` | `com.samples.appcontinuation_ReadinessRuleCases_0012` |
| [SUB_CONTINUATION_CONFLICTRULECASES_0100](<entry/src/ohosTest/ets/test/PayloadRuleCases.test.ets#L498>) | `testConflictRuleCases0001` | `com.samples.appcontinuation_ConflictRuleCases_0001` |
| [SUB_CONTINUATION_CONFLICTRULECASES_0200](<entry/src/ohosTest/ets/test/PayloadRuleCases.test.ets#L517>) | `testConflictRuleCases0002` | `com.samples.appcontinuation_ConflictRuleCases_0002` |
| [SUB_CONTINUATION_CONFLICTRULECASES_0300](<entry/src/ohosTest/ets/test/PayloadRuleCases.test.ets#L534>) | `testConflictRuleCases0003` | `com.samples.appcontinuation_ConflictRuleCases_0003` |
| [SUB_CONTINUATION_CONFLICTRULECASES_0400](<entry/src/ohosTest/ets/test/PayloadRuleCases.test.ets#L551>) | `testConflictRuleCases0004` | `com.samples.appcontinuation_ConflictRuleCases_0004` |
| [SUB_CONTINUATION_CONFLICTRULECASES_0500](<entry/src/ohosTest/ets/test/PayloadRuleCases.test.ets#L570>) | `testConflictRuleCases0005` | `com.samples.appcontinuation_ConflictRuleCases_0005` |
| [SUB_CONTINUATION_CONFLICTRULECASES_0600](<entry/src/ohosTest/ets/test/PayloadRuleCases.test.ets#L588>) | `testConflictRuleCases0006` | `com.samples.appcontinuation_ConflictRuleCases_0006` |
| [SUB_CONTINUATION_CONFLICTRULECASES_0700](<entry/src/ohosTest/ets/test/PayloadRuleCases.test.ets#L604>) | `testConflictRuleCases0007` | `com.samples.appcontinuation_ConflictRuleCases_0007` |
| [SUB_CONTINUATION_CONFLICTRULECASES_0800](<entry/src/ohosTest/ets/test/PayloadRuleCases.test.ets#L622>) | `testConflictRuleCases0008` | `com.samples.appcontinuation_ConflictRuleCases_0008` |
| [SUB_CONTINUATION_CONFLICTRULECASES_0900](<entry/src/ohosTest/ets/test/PayloadRuleCases.test.ets#L638>) | `testConflictRuleCases0009` | `com.samples.appcontinuation_ConflictRuleCases_0009` |
| [SUB_CONTINUATION_CONFLICTRULECASES_1000](<entry/src/ohosTest/ets/test/PayloadRuleCases.test.ets#L656>) | `testConflictRuleCases0010` | `com.samples.appcontinuation_ConflictRuleCases_0010` |
| [SUB_CONTINUATION_CONFLICTRULECASES_1100](<entry/src/ohosTest/ets/test/PayloadRuleCases.test.ets#L675>) | `testConflictRuleCases0011` | `com.samples.appcontinuation_ConflictRuleCases_0011` |
| [SUB_CONTINUATION_CONFLICTRULECASES_1200](<entry/src/ohosTest/ets/test/PayloadRuleCases.test.ets#L693>) | `testConflictRuleCases0012` | `com.samples.appcontinuation_ConflictRuleCases_0012` |
| [SUB_CONTINUATION_CONFLICTRULECASES_1300](<entry/src/ohosTest/ets/test/PayloadRuleCases.test.ets#L709>) | `testConflictRuleCases0013` | `com.samples.appcontinuation_ConflictRuleCases_0013` |
| [SUB_CONTINUATION_CONFLICTRULECASES_1400](<entry/src/ohosTest/ets/test/PayloadRuleCases.test.ets#L728>) | `testConflictRuleCases0014` | `com.samples.appcontinuation_ConflictRuleCases_0014` |
| [SUB_CONTINUATION_CONFLICTRULECASES_1500](<entry/src/ohosTest/ets/test/PayloadRuleCases.test.ets#L744>) | `testConflictRuleCases0015` | `com.samples.appcontinuation_ConflictRuleCases_0015` |
| [SUB_CONTINUATION_CONFLICTRULECASES_1600](<entry/src/ohosTest/ets/test/PayloadRuleCases.test.ets#L767>) | `testConflictRuleCases0016` | `com.samples.appcontinuation_ConflictRuleCases_0016` |

### [RestoreSceneCases.test.ets](<entry/src/ohosTest/ets/test/RestoreSceneCases.test.ets>)（5 例）

| 用例编号（源码） | 旧名 | 规范运行名 |
|---|---|---|
| [SUB_CONTINUATION_SCENECONTEXTCASES_0100](<entry/src/ohosTest/ets/test/RestoreSceneCases.test.ets#L37>) | `testSceneContextCases0001` | `com.samples.appcontinuation_SceneContextCases_0001` |
| [SUB_CONTINUATION_SCENECONTEXTCASES_0200](<entry/src/ohosTest/ets/test/RestoreSceneCases.test.ets#L57>) | `testSceneContextCases0002` | `com.samples.appcontinuation_SceneContextCases_0002` |
| [SUB_CONTINUATION_SCENECONTEXTCASES_0300](<entry/src/ohosTest/ets/test/RestoreSceneCases.test.ets#L76>) | `testSceneContextCases0003` | `com.samples.appcontinuation_SceneContextCases_0003` |
| [SUB_CONTINUATION_SCENECONTEXTCASES_0400](<entry/src/ohosTest/ets/test/RestoreSceneCases.test.ets#L97>) | `testSceneContextCases0004` | `com.samples.appcontinuation_SceneContextCases_0004` |
| [SUB_CONTINUATION_SCENECONTEXTCASES_0500](<entry/src/ohosTest/ets/test/RestoreSceneCases.test.ets#L114>) | `testSceneContextCases0005` | `com.samples.appcontinuation_SceneContextCases_0005` |

### [RetryDictionaryCases.test.ets](<entry/src/ohosTest/ets/test/RetryDictionaryCases.test.ets>)（10 例）

| 用例编号（源码） | 旧名 | 规范运行名 |
|---|---|---|
| [SUB_CONTINUATION_RETRYPOLICYCASESB_0100](<entry/src/ohosTest/ets/test/RetryDictionaryCases.test.ets#L47>) | `testRetryPolicyCasesB0001` | `com.samples.appcontinuation_RetryPolicyCasesB_0001` |
| [SUB_CONTINUATION_RETRYPOLICYCASESB_0200](<entry/src/ohosTest/ets/test/RetryDictionaryCases.test.ets#L73>) | `testRetryPolicyCasesB0002` | `com.samples.appcontinuation_RetryPolicyCasesB_0002` |
| [SUB_CONTINUATION_RETRYPOLICYCASESB_0300](<entry/src/ohosTest/ets/test/RetryDictionaryCases.test.ets#L97>) | `testRetryPolicyCasesB0003` | `com.samples.appcontinuation_RetryPolicyCasesB_0003` |
| [SUB_CONTINUATION_RETRYPOLICYCASESB_0400](<entry/src/ohosTest/ets/test/RetryDictionaryCases.test.ets#L128>) | `testRetryPolicyCasesB0004` | `com.samples.appcontinuation_RetryPolicyCasesB_0004` |
| [SUB_CONTINUATION_RETRYPOLICYCASESB_0500](<entry/src/ohosTest/ets/test/RetryDictionaryCases.test.ets#L152>) | `testRetryPolicyCasesB0005` | `com.samples.appcontinuation_RetryPolicyCasesB_0005` |
| [SUB_CONTINUATION_FIELDDICTIONARYCASES_0100](<entry/src/ohosTest/ets/test/RetryDictionaryCases.test.ets#L186>) | `testFieldDictionaryCases0001` | `com.samples.appcontinuation_FieldDictionaryCases_0001` |
| [SUB_CONTINUATION_FIELDDICTIONARYCASES_0200](<entry/src/ohosTest/ets/test/RetryDictionaryCases.test.ets#L212>) | `testFieldDictionaryCases0002` | `com.samples.appcontinuation_FieldDictionaryCases_0002` |
| [SUB_CONTINUATION_FIELDDICTIONARYCASES_0300](<entry/src/ohosTest/ets/test/RetryDictionaryCases.test.ets#L236>) | `testFieldDictionaryCases0003` | `com.samples.appcontinuation_FieldDictionaryCases_0003` |
| [SUB_CONTINUATION_FIELDDICTIONARYCASES_0400](<entry/src/ohosTest/ets/test/RetryDictionaryCases.test.ets#L262>) | `testFieldDictionaryCases0004` | `com.samples.appcontinuation_FieldDictionaryCases_0004` |
| [SUB_CONTINUATION_FIELDDICTIONARYCASES_0500](<entry/src/ohosTest/ets/test/RetryDictionaryCases.test.ets#L288>) | `testFieldDictionaryCases0005` | `com.samples.appcontinuation_FieldDictionaryCases_0005` |

### [ScenarioValidatorCases.test.ets](<entry/src/ohosTest/ets/test/ScenarioValidatorCases.test.ets>)（12 例）

| 用例编号（源码） | 旧名 | 规范运行名 |
|---|---|---|
| [SUB_CONTINUATION_SCENARIOCATALOGCASES_0100](<entry/src/ohosTest/ets/test/ScenarioValidatorCases.test.ets#L50>) | `testScenarioCatalogCases0001` | `com.samples.appcontinuation_ScenarioCatalogCases_0001` |
| [SUB_CONTINUATION_SCENARIOCATALOGCASES_0200](<entry/src/ohosTest/ets/test/ScenarioValidatorCases.test.ets#L77>) | `testScenarioCatalogCases0002` | `com.samples.appcontinuation_ScenarioCatalogCases_0002` |
| [SUB_CONTINUATION_SCENARIOCATALOGCASES_0300](<entry/src/ohosTest/ets/test/ScenarioValidatorCases.test.ets#L101>) | `testScenarioCatalogCases0003` | `com.samples.appcontinuation_ScenarioCatalogCases_0003` |
| [SUB_CONTINUATION_SCENARIOCATALOGCASES_0400](<entry/src/ohosTest/ets/test/ScenarioValidatorCases.test.ets#L122>) | `testScenarioCatalogCases0004` | `com.samples.appcontinuation_ScenarioCatalogCases_0004` |
| [SUB_CONTINUATION_SCENARIOCATALOGCASES_0500](<entry/src/ohosTest/ets/test/ScenarioValidatorCases.test.ets#L142>) | `testScenarioCatalogCases0005` | `com.samples.appcontinuation_ScenarioCatalogCases_0005` |
| [SUB_CONTINUATION_PAYLOADVALIDATORCASES_0100](<entry/src/ohosTest/ets/test/ScenarioValidatorCases.test.ets#L167>) | `testPayloadValidatorCases0001` | `com.samples.appcontinuation_PayloadValidatorCases_0001` |
| [SUB_CONTINUATION_PAYLOADVALIDATORCASES_0200](<entry/src/ohosTest/ets/test/ScenarioValidatorCases.test.ets#L191>) | `testPayloadValidatorCases0002` | `com.samples.appcontinuation_PayloadValidatorCases_0002` |
| [SUB_CONTINUATION_PAYLOADVALIDATORCASES_0300](<entry/src/ohosTest/ets/test/ScenarioValidatorCases.test.ets#L214>) | `testPayloadValidatorCases0003` | `com.samples.appcontinuation_PayloadValidatorCases_0003` |
| [SUB_CONTINUATION_PAYLOADVALIDATORCASES_0400](<entry/src/ohosTest/ets/test/ScenarioValidatorCases.test.ets#L242>) | `testPayloadValidatorCases0004` | `com.samples.appcontinuation_PayloadValidatorCases_0004` |
| [SUB_CONTINUATION_PAYLOADVALIDATORCASES_0500](<entry/src/ohosTest/ets/test/ScenarioValidatorCases.test.ets#L271>) | `testPayloadValidatorCases0005` | `com.samples.appcontinuation_PayloadValidatorCases_0005` |
| [SUB_CONTINUATION_PAYLOADVALIDATORCASES_0600](<entry/src/ohosTest/ets/test/ScenarioValidatorCases.test.ets#L306>) | `testPayloadValidatorCases0006` | `com.samples.appcontinuation_PayloadValidatorCases_0006` |
| [SUB_CONTINUATION_PAYLOADVALIDATORCASES_0700](<entry/src/ohosTest/ets/test/ScenarioValidatorCases.test.ets#L332>) | `testPayloadValidatorCases0007` | `com.samples.appcontinuation_PayloadValidatorCases_0007` |

### [SceneBackupClipboardCases.test.ets](<entry/src/ohosTest/ets/test/SceneBackupClipboardCases.test.ets>)（10 例）

| 用例编号（源码） | 旧名 | 规范运行名 |
|---|---|---|
| [SUB_CONTINUATION_BACKUPCLIPBOARD_0100](<entry/src/ohosTest/ets/test/SceneBackupClipboardCases.test.ets#L28>) | `testContinuationBackupClipboard0001` | `com.samples.appcontinuation_ContinuationBackupClipboard_0001` |
| [SUB_CONTINUATION_BACKUPCLIPBOARD_0200](<entry/src/ohosTest/ets/test/SceneBackupClipboardCases.test.ets#L53>) | `testContinuationBackupClipboard0002` | `com.samples.appcontinuation_ContinuationBackupClipboard_0002` |
| [SUB_CONTINUATION_BACKUPCLIPBOARD_0300](<entry/src/ohosTest/ets/test/SceneBackupClipboardCases.test.ets#L76>) | `testContinuationBackupClipboard0003` | `com.samples.appcontinuation_ContinuationBackupClipboard_0003` |
| [SUB_CONTINUATION_BACKUPCLIPBOARD_0400](<entry/src/ohosTest/ets/test/SceneBackupClipboardCases.test.ets#L101>) | `testContinuationBackupClipboard0004` | `com.samples.appcontinuation_ContinuationBackupClipboard_0004` |
| [SUB_CONTINUATION_BACKUPCLIPBOARD_0500](<entry/src/ohosTest/ets/test/SceneBackupClipboardCases.test.ets#L121>) | `testContinuationBackupClipboard0005` | `com.samples.appcontinuation_ContinuationBackupClipboard_0005` |
| [SUB_CONTINUATION_BACKUPCLIPBOARD_0600](<entry/src/ohosTest/ets/test/SceneBackupClipboardCases.test.ets#L141>) | `testContinuationBackupClipboard0006` | `com.samples.appcontinuation_ContinuationBackupClipboard_0006` |
| [SUB_CONTINUATION_BACKUPCLIPBOARD_0700](<entry/src/ohosTest/ets/test/SceneBackupClipboardCases.test.ets#L165>) | `testContinuationBackupClipboard0007` | `com.samples.appcontinuation_ContinuationBackupClipboard_0007` |
| [SUB_CONTINUATION_BACKUPCLIPBOARD_0800](<entry/src/ohosTest/ets/test/SceneBackupClipboardCases.test.ets#L188>) | `testContinuationBackupClipboard0008` | `com.samples.appcontinuation_ContinuationBackupClipboard_0008` |
| [SUB_CONTINUATION_BACKUPCLIPBOARD_0900](<entry/src/ohosTest/ets/test/SceneBackupClipboardCases.test.ets#L212>) | `testContinuationBackupClipboard0009` | `com.samples.appcontinuation_ContinuationBackupClipboard_0009` |
| [SUB_CONTINUATION_BACKUPCLIPBOARD_1000](<entry/src/ohosTest/ets/test/SceneBackupClipboardCases.test.ets#L237>) | `testContinuationBackupClipboard0010` | `com.samples.appcontinuation_ContinuationBackupClipboard_0010` |

### [SceneBackupLifecycleCases.test.ets](<entry/src/ohosTest/ets/test/SceneBackupLifecycleCases.test.ets>)（11 例）

| 用例编号（源码） | 旧名 | 规范运行名 |
|---|---|---|
| [SUB_CONTINUATION_BACKUPLIFECYCLE_0100](<entry/src/ohosTest/ets/test/SceneBackupLifecycleCases.test.ets#L30>) | `testContinuationBackupLifecycle0001` | `com.samples.appcontinuation_ContinuationBackupLifecycle_0001` |
| [SUB_CONTINUATION_BACKUPLIFECYCLE_0200](<entry/src/ohosTest/ets/test/SceneBackupLifecycleCases.test.ets#L49>) | `testContinuationBackupLifecycle0002` | `com.samples.appcontinuation_ContinuationBackupLifecycle_0002` |
| [SUB_CONTINUATION_BACKUPLIFECYCLE_0300](<entry/src/ohosTest/ets/test/SceneBackupLifecycleCases.test.ets#L71>) | `testContinuationBackupLifecycle0003` | `com.samples.appcontinuation_ContinuationBackupLifecycle_0003` |
| [SUB_CONTINUATION_BACKUPLIFECYCLE_0400](<entry/src/ohosTest/ets/test/SceneBackupLifecycleCases.test.ets#L91>) | `testContinuationBackupLifecycle0004` | `com.samples.appcontinuation_ContinuationBackupLifecycle_0004` |
| [SUB_CONTINUATION_BACKUPLIFECYCLE_0500](<entry/src/ohosTest/ets/test/SceneBackupLifecycleCases.test.ets#L114>) | `testContinuationBackupLifecycle0005` | `com.samples.appcontinuation_ContinuationBackupLifecycle_0005` |
| [SUB_CONTINUATION_BACKUPLIFECYCLE_0600](<entry/src/ohosTest/ets/test/SceneBackupLifecycleCases.test.ets#L136>) | `testContinuationBackupLifecycle0006` | `com.samples.appcontinuation_ContinuationBackupLifecycle_0006` |
| [SUB_CONTINUATION_BACKUPLIFECYCLE_0700](<entry/src/ohosTest/ets/test/SceneBackupLifecycleCases.test.ets#L160>) | `testContinuationBackupLifecycle0007` | `com.samples.appcontinuation_ContinuationBackupLifecycle_0007` |
| [SUB_CONTINUATION_BACKUPLIFECYCLE_0800](<entry/src/ohosTest/ets/test/SceneBackupLifecycleCases.test.ets#L186>) | `testContinuationBackupLifecycle0008` | `com.samples.appcontinuation_ContinuationBackupLifecycle_0008` |
| [SUB_CONTINUATION_BACKUPLIFECYCLE_0900](<entry/src/ohosTest/ets/test/SceneBackupLifecycleCases.test.ets#L217>) | `testContinuationBackupLifecycle0009` | `com.samples.appcontinuation_ContinuationBackupLifecycle_0009` |
| [SUB_CONTINUATION_BACKUPLIFECYCLE_1000](<entry/src/ohosTest/ets/test/SceneBackupLifecycleCases.test.ets#L247>) | `testContinuationBackupLifecycle0010` | `com.samples.appcontinuation_ContinuationBackupLifecycle_0010` |
| [SUB_CONTINUATION_BACKUPLIFECYCLE_1100](<entry/src/ohosTest/ets/test/SceneBackupLifecycleCases.test.ets#L273>) | `testContinuationBackupLifecycle0011` | `com.samples.appcontinuation_ContinuationBackupLifecycle_0011` |

### [SceneBackupPlanningCases.test.ets](<entry/src/ohosTest/ets/test/SceneBackupPlanningCases.test.ets>)（9 例）

| 用例编号（源码） | 旧名 | 规范运行名 |
|---|---|---|
| [SUB_CONTINUATION_BACKUPPLAN_0100](<entry/src/ohosTest/ets/test/SceneBackupPlanningCases.test.ets#L37>) | `testContinuationBackupPlan0001` | `com.samples.appcontinuation_ContinuationBackupPlan_0001` |
| [SUB_CONTINUATION_BACKUPPLAN_0200](<entry/src/ohosTest/ets/test/SceneBackupPlanningCases.test.ets#L63>) | `testContinuationBackupPlan0002` | `com.samples.appcontinuation_ContinuationBackupPlan_0002` |
| [SUB_CONTINUATION_BACKUPPLAN_0300](<entry/src/ohosTest/ets/test/SceneBackupPlanningCases.test.ets#L87>) | `testContinuationBackupPlan0003` | `com.samples.appcontinuation_ContinuationBackupPlan_0003` |
| [SUB_CONTINUATION_BACKUPPLAN_0400](<entry/src/ohosTest/ets/test/SceneBackupPlanningCases.test.ets#L109>) | `testContinuationBackupPlan0004` | `com.samples.appcontinuation_ContinuationBackupPlan_0004` |
| [SUB_CONTINUATION_BACKUPPLAN_0500](<entry/src/ohosTest/ets/test/SceneBackupPlanningCases.test.ets#L130>) | `testContinuationBackupPlan0005` | `com.samples.appcontinuation_ContinuationBackupPlan_0005` |
| [SUB_CONTINUATION_BACKUPPLAN_0600](<entry/src/ohosTest/ets/test/SceneBackupPlanningCases.test.ets#L151>) | `testContinuationBackupPlan0006` | `com.samples.appcontinuation_ContinuationBackupPlan_0006` |
| [SUB_CONTINUATION_BACKUPPLAN_0700](<entry/src/ohosTest/ets/test/SceneBackupPlanningCases.test.ets#L172>) | `testContinuationBackupPlan0007` | `com.samples.appcontinuation_ContinuationBackupPlan_0007` |
| [SUB_CONTINUATION_BACKUPPLAN_0800](<entry/src/ohosTest/ets/test/SceneBackupPlanningCases.test.ets#L196>) | `testContinuationBackupPlan0008` | `com.samples.appcontinuation_ContinuationBackupPlan_0008` |
| [SUB_CONTINUATION_BACKUPPLAN_0900](<entry/src/ohosTest/ets/test/SceneBackupPlanningCases.test.ets#L213>) | `testContinuationBackupPlan0009` | `com.samples.appcontinuation_ContinuationBackupPlan_0009` |

### [SceneBackupTransactionCases.test.ets](<entry/src/ohosTest/ets/test/SceneBackupTransactionCases.test.ets>)（14 例）

| 用例编号（源码） | 旧名 | 规范运行名 |
|---|---|---|
| [SUB_CONTINUATION_BACKUPTRANSACTION_0100](<entry/src/ohosTest/ets/test/SceneBackupTransactionCases.test.ets#L37>) | `testContinuationBackupTransaction0001` | `com.samples.appcontinuation_ContinuationBackupTransaction_0001` |
| [SUB_CONTINUATION_BACKUPTRANSACTION_0200](<entry/src/ohosTest/ets/test/SceneBackupTransactionCases.test.ets#L68>) | `testContinuationBackupTransaction0002` | `com.samples.appcontinuation_ContinuationBackupTransaction_0002` |
| [SUB_CONTINUATION_BACKUPTRANSACTION_0300](<entry/src/ohosTest/ets/test/SceneBackupTransactionCases.test.ets#L91>) | `testContinuationBackupTransaction0003` | `com.samples.appcontinuation_ContinuationBackupTransaction_0003` |
| [SUB_CONTINUATION_BACKUPTRANSACTION_0400](<entry/src/ohosTest/ets/test/SceneBackupTransactionCases.test.ets#L114>) | `testContinuationBackupTransaction0004` | `com.samples.appcontinuation_ContinuationBackupTransaction_0004` |
| [SUB_CONTINUATION_BACKUPTRANSACTION_0500](<entry/src/ohosTest/ets/test/SceneBackupTransactionCases.test.ets#L144>) | `testContinuationBackupTransaction0005` | `com.samples.appcontinuation_ContinuationBackupTransaction_0005` |
| [SUB_CONTINUATION_BACKUPTRANSACTION_0600](<entry/src/ohosTest/ets/test/SceneBackupTransactionCases.test.ets#L166>) | `testContinuationBackupTransaction0006` | `com.samples.appcontinuation_ContinuationBackupTransaction_0006` |
| [SUB_CONTINUATION_BACKUPTRANSACTION_0700](<entry/src/ohosTest/ets/test/SceneBackupTransactionCases.test.ets#L193>) | `testContinuationBackupTransaction0007` | `com.samples.appcontinuation_ContinuationBackupTransaction_0007` |
| [SUB_CONTINUATION_BACKUPTRANSACTION_0800](<entry/src/ohosTest/ets/test/SceneBackupTransactionCases.test.ets#L217>) | `testContinuationBackupTransaction0008` | `com.samples.appcontinuation_ContinuationBackupTransaction_0008` |
| [SUB_CONTINUATION_BACKUPTRANSACTION_0900](<entry/src/ohosTest/ets/test/SceneBackupTransactionCases.test.ets#L239>) | `testContinuationBackupTransaction0009` | `com.samples.appcontinuation_ContinuationBackupTransaction_0009` |
| [SUB_CONTINUATION_BACKUPTRANSACTION_1000](<entry/src/ohosTest/ets/test/SceneBackupTransactionCases.test.ets#L265>) | `testContinuationBackupTransaction0010` | `com.samples.appcontinuation_ContinuationBackupTransaction_0010` |
| [SUB_CONTINUATION_BACKUPTRANSACTION_1100](<entry/src/ohosTest/ets/test/SceneBackupTransactionCases.test.ets#L290>) | `testContinuationBackupTransaction0011` | `com.samples.appcontinuation_ContinuationBackupTransaction_0011` |
| [SUB_CONTINUATION_BACKUPTRANSACTION_1200](<entry/src/ohosTest/ets/test/SceneBackupTransactionCases.test.ets#L315>) | `testContinuationBackupTransaction0012` | `com.samples.appcontinuation_ContinuationBackupTransaction_0012` |
| [SUB_CONTINUATION_BACKUPTRANSACTION_1300](<entry/src/ohosTest/ets/test/SceneBackupTransactionCases.test.ets#L336>) | `testContinuationBackupTransaction0013` | `com.samples.appcontinuation_ContinuationBackupTransaction_0013` |
| [SUB_CONTINUATION_BACKUPTRANSACTION_1400](<entry/src/ohosTest/ets/test/SceneBackupTransactionCases.test.ets#L363>) | `testContinuationBackupTransaction0014` | `com.samples.appcontinuation_ContinuationBackupTransaction_0014` |

### [SceneModelMatrix.test.ets](<entry/src/ohosTest/ets/test/SceneModelMatrix.test.ets>)（24 例）

| 用例编号（源码） | 旧名 | 规范运行名 |
|---|---|---|
| [SUB_CONTINUATION_SCENEMODELMATRIX_0100](<entry/src/ohosTest/ets/test/SceneModelMatrix.test.ets#L63>) | `testSceneModelMatrix0001` | `com.samples.appcontinuation_SceneModelMatrix_0001` |
| [SUB_CONTINUATION_SCENEMODELMATRIX_0200](<entry/src/ohosTest/ets/test/SceneModelMatrix.test.ets#L79>) | `testSceneModelMatrix0002` | `com.samples.appcontinuation_SceneModelMatrix_0002` |
| [SUB_CONTINUATION_SCENEMODELMATRIX_0300](<entry/src/ohosTest/ets/test/SceneModelMatrix.test.ets#L98>) | `testSceneModelMatrix0003` | `com.samples.appcontinuation_SceneModelMatrix_0003` |
| [SUB_CONTINUATION_SCENEMODELMATRIX_0400](<entry/src/ohosTest/ets/test/SceneModelMatrix.test.ets#L115>) | `testSceneModelMatrix0004` | `com.samples.appcontinuation_SceneModelMatrix_0004` |
| [SUB_CONTINUATION_SCENEMODELMATRIX_0500](<entry/src/ohosTest/ets/test/SceneModelMatrix.test.ets#L132>) | `testSceneModelMatrix0005` | `com.samples.appcontinuation_SceneModelMatrix_0005` |
| [SUB_CONTINUATION_SCENEMODELMATRIX_0600](<entry/src/ohosTest/ets/test/SceneModelMatrix.test.ets#L148>) | `testSceneModelMatrix0006` | `com.samples.appcontinuation_SceneModelMatrix_0006` |
| [SUB_CONTINUATION_SCENEMODELMATRIX_0700](<entry/src/ohosTest/ets/test/SceneModelMatrix.test.ets#L169>) | `testSceneModelMatrix0007` | `com.samples.appcontinuation_SceneModelMatrix_0007` |
| [SUB_CONTINUATION_SCENEMODELMATRIX_0800](<entry/src/ohosTest/ets/test/SceneModelMatrix.test.ets#L186>) | `testSceneModelMatrix0008` | `com.samples.appcontinuation_SceneModelMatrix_0008` |
| [SUB_CONTINUATION_SCENEMODELMATRIX_0900](<entry/src/ohosTest/ets/test/SceneModelMatrix.test.ets#L204>) | `testSceneModelMatrix0009` | `com.samples.appcontinuation_SceneModelMatrix_0009` |
| [SUB_CONTINUATION_SCENEMODELMATRIX_1000](<entry/src/ohosTest/ets/test/SceneModelMatrix.test.ets#L221>) | `testSceneModelMatrix0010` | `com.samples.appcontinuation_SceneModelMatrix_0010` |
| [SUB_CONTINUATION_SCENEMODELMATRIX_1100](<entry/src/ohosTest/ets/test/SceneModelMatrix.test.ets#L236>) | `testSceneModelMatrix0011` | `com.samples.appcontinuation_SceneModelMatrix_0011` |
| [SUB_CONTINUATION_SCENEMODELMATRIX_1200](<entry/src/ohosTest/ets/test/SceneModelMatrix.test.ets#L253>) | `testSceneModelMatrix0012` | `com.samples.appcontinuation_SceneModelMatrix_0012` |
| [SUB_CONTINUATION_SCENEMODELMATRIX_1300](<entry/src/ohosTest/ets/test/SceneModelMatrix.test.ets#L270>) | `testSceneModelMatrix0013` | `com.samples.appcontinuation_SceneModelMatrix_0013` |
| [SUB_CONTINUATION_SCENEMODELMATRIX_1400](<entry/src/ohosTest/ets/test/SceneModelMatrix.test.ets#L289>) | `testSceneModelMatrix0014` | `com.samples.appcontinuation_SceneModelMatrix_0014` |
| [SUB_CONTINUATION_SCENEMODELMATRIX_1500](<entry/src/ohosTest/ets/test/SceneModelMatrix.test.ets#L304>) | `testSceneModelMatrix0015` | `com.samples.appcontinuation_SceneModelMatrix_0015` |
| [SUB_CONTINUATION_SCENEMODELMATRIX_1600](<entry/src/ohosTest/ets/test/SceneModelMatrix.test.ets#L323>) | `testSceneModelMatrix0016` | `com.samples.appcontinuation_SceneModelMatrix_0016` |
| [SUB_CONTINUATION_SCENEMODELMATRIX_1700](<entry/src/ohosTest/ets/test/SceneModelMatrix.test.ets#L339>) | `testSceneModelMatrix0017` | `com.samples.appcontinuation_SceneModelMatrix_0017` |
| [SUB_CONTINUATION_SCENEMODELMATRIX_1800](<entry/src/ohosTest/ets/test/SceneModelMatrix.test.ets#L361>) | `testSceneModelMatrix0018` | `com.samples.appcontinuation_SceneModelMatrix_0018` |
| [SUB_CONTINUATION_SCENEMODELMATRIX_1900](<entry/src/ohosTest/ets/test/SceneModelMatrix.test.ets#L384>) | `testSceneModelMatrix0019` | `com.samples.appcontinuation_SceneModelMatrix_0019` |
| [SUB_CONTINUATION_SCENEMODELMATRIX_2000](<entry/src/ohosTest/ets/test/SceneModelMatrix.test.ets#L405>) | `testSceneModelMatrix0020` | `com.samples.appcontinuation_SceneModelMatrix_0020` |
| [SUB_CONTINUATION_SCENEMODELMATRIX_2100](<entry/src/ohosTest/ets/test/SceneModelMatrix.test.ets#L425>) | `testSceneModelMatrix0021` | `com.samples.appcontinuation_SceneModelMatrix_0021` |
| [SUB_CONTINUATION_SCENEMODELMATRIX_2200](<entry/src/ohosTest/ets/test/SceneModelMatrix.test.ets#L448>) | `testSceneModelMatrix0022` | `com.samples.appcontinuation_SceneModelMatrix_0022` |
| [SUB_CONTINUATION_SCENEMODELMATRIX_2300](<entry/src/ohosTest/ets/test/SceneModelMatrix.test.ets#L469>) | `testSceneModelMatrix0023` | `com.samples.appcontinuation_SceneModelMatrix_0023` |
| [SUB_CONTINUATION_SCENEMODELMATRIX_2400](<entry/src/ohosTest/ets/test/SceneModelMatrix.test.ets#L490>) | `testSceneModelMatrix0024` | `com.samples.appcontinuation_SceneModelMatrix_0024` |

### [SceneRecoveryB2.test.ets](<entry/src/ohosTest/ets/test/SceneRecoveryB2.test.ets>)（12 例）

| 用例编号（源码） | 旧名 | 规范运行名 |
|---|---|---|
| [SUB_CONTINUATION_SCENERECOVERYB2_0100](<entry/src/ohosTest/ets/test/SceneRecoveryB2.test.ets#L49>) | `testSceneRecoveryBatchTwo0001` | `com.samples.appcontinuation_SceneRecoveryBatchTwo_0001` |
| [SUB_CONTINUATION_SCENERECOVERYB2_0200](<entry/src/ohosTest/ets/test/SceneRecoveryB2.test.ets#L69>) | `testSceneRecoveryBatchTwo0002` | `com.samples.appcontinuation_SceneRecoveryBatchTwo_0002` |
| [SUB_CONTINUATION_SCENERECOVERYB2_0300](<entry/src/ohosTest/ets/test/SceneRecoveryB2.test.ets#L88>) | `testSceneRecoveryBatchTwo0003` | `com.samples.appcontinuation_SceneRecoveryBatchTwo_0003` |
| [SUB_CONTINUATION_SCENERECOVERYB2_0400](<entry/src/ohosTest/ets/test/SceneRecoveryB2.test.ets#L107>) | `testSceneRecoveryBatchTwo0004` | `com.samples.appcontinuation_SceneRecoveryBatchTwo_0004` |
| [SUB_CONTINUATION_SCENERECOVERYB2_0500](<entry/src/ohosTest/ets/test/SceneRecoveryB2.test.ets#L124>) | `testSceneRecoveryBatchTwo0005` | `com.samples.appcontinuation_SceneRecoveryBatchTwo_0005` |
| [SUB_CONTINUATION_SCENERECOVERYB2_0600](<entry/src/ohosTest/ets/test/SceneRecoveryB2.test.ets#L144>) | `testSceneRecoveryBatchTwo0006` | `com.samples.appcontinuation_SceneRecoveryBatchTwo_0006` |
| [SUB_CONTINUATION_SCENERECOVERYB2_0700](<entry/src/ohosTest/ets/test/SceneRecoveryB2.test.ets#L164>) | `testSceneRecoveryBatchTwo0007` | `com.samples.appcontinuation_SceneRecoveryBatchTwo_0007` |
| [SUB_CONTINUATION_SCENERECOVERYB2_0800](<entry/src/ohosTest/ets/test/SceneRecoveryB2.test.ets#L185>) | `testSceneRecoveryBatchTwo0008` | `com.samples.appcontinuation_SceneRecoveryBatchTwo_0008` |
| [SUB_CONTINUATION_SCENERECOVERYB2_0900](<entry/src/ohosTest/ets/test/SceneRecoveryB2.test.ets#L205>) | `testSceneRecoveryBatchTwo0009` | `com.samples.appcontinuation_SceneRecoveryBatchTwo_0009` |
| [SUB_CONTINUATION_SCENERECOVERYB2_1000](<entry/src/ohosTest/ets/test/SceneRecoveryB2.test.ets#L227>) | `testSceneRecoveryBatchTwo0010` | `com.samples.appcontinuation_SceneRecoveryBatchTwo_0010` |
| [SUB_CONTINUATION_SCENERECOVERYB2_1100](<entry/src/ohosTest/ets/test/SceneRecoveryB2.test.ets#L251>) | `testSceneRecoveryBatchTwo0011` | `com.samples.appcontinuation_SceneRecoveryBatchTwo_0011` |
| [SUB_CONTINUATION_SCENERECOVERYB2_1200](<entry/src/ohosTest/ets/test/SceneRecoveryB2.test.ets#L275>) | `testSceneRecoveryBatchTwo0012` | `com.samples.appcontinuation_SceneRecoveryBatchTwo_0012` |

### [WorkspaceBackupNativeQa.test.ets](<entry/src/ohosTest/ets/test/WorkspaceBackupNativeQa.test.ets>)（12 例）

| 用例编号（源码） | 旧名 | 规范运行名 |
|---|---|---|
| [SUB_CONTINUATION_WORKSPACE_NATIVE_QA_0100](<entry/src/ohosTest/ets/test/WorkspaceBackupNativeQa.test.ets#L34>) | `testWorkspaceBackupNativeQa0001` | `com.samples.appcontinuation_WorkspaceBackupNativeQa_0001` |
| [SUB_CONTINUATION_WORKSPACE_NATIVE_QA_0200](<entry/src/ohosTest/ets/test/WorkspaceBackupNativeQa.test.ets#L56>) | `testWorkspaceBackupNativeQa0002` | `com.samples.appcontinuation_WorkspaceBackupNativeQa_0002` |
| [SUB_CONTINUATION_WORKSPACE_NATIVE_QA_0300](<entry/src/ohosTest/ets/test/WorkspaceBackupNativeQa.test.ets#L84>) | `testWorkspaceBackupNativeQa0003` | `com.samples.appcontinuation_WorkspaceBackupNativeQa_0003` |
| [SUB_CONTINUATION_WORKSPACE_NATIVE_QA_0400](<entry/src/ohosTest/ets/test/WorkspaceBackupNativeQa.test.ets#L117>) | `testWorkspaceBackupNativeQa0004` | `com.samples.appcontinuation_WorkspaceBackupNativeQa_0004` |
| [SUB_CONTINUATION_WORKSPACE_NATIVE_QA_0500](<entry/src/ohosTest/ets/test/WorkspaceBackupNativeQa.test.ets#L144>) | `testWorkspaceBackupNativeQa0005` | `com.samples.appcontinuation_WorkspaceBackupNativeQa_0005` |
| [SUB_CONTINUATION_WORKSPACE_NATIVE_QA_0600](<entry/src/ohosTest/ets/test/WorkspaceBackupNativeQa.test.ets#L174>) | `testWorkspaceBackupNativeQa0006` | `com.samples.appcontinuation_WorkspaceBackupNativeQa_0006` |
| [SUB_CONTINUATION_WORKSPACE_NATIVE_QA_0700](<entry/src/ohosTest/ets/test/WorkspaceBackupNativeQa.test.ets#L203>) | `testWorkspaceBackupNativeQa0007` | `com.samples.appcontinuation_WorkspaceBackupNativeQa_0007` |
| [SUB_CONTINUATION_WORKSPACE_NATIVE_QA_0800](<entry/src/ohosTest/ets/test/WorkspaceBackupNativeQa.test.ets#L232>) | `testWorkspaceBackupNativeQa0008` | `com.samples.appcontinuation_WorkspaceBackupNativeQa_0008` |
| [SUB_CONTINUATION_WORKSPACE_NATIVE_QA_0900](<entry/src/ohosTest/ets/test/WorkspaceBackupNativeQa.test.ets#L263>) | `testWorkspaceBackupNativeQa0009` | `com.samples.appcontinuation_WorkspaceBackupNativeQa_0009` |
| [SUB_CONTINUATION_WORKSPACE_NATIVE_QA_1000](<entry/src/ohosTest/ets/test/WorkspaceBackupNativeQa.test.ets#L292>) | `testWorkspaceBackupNativeQa0010` | `com.samples.appcontinuation_WorkspaceBackupNativeQa_0010` |
| [SUB_CONTINUATION_WORKSPACE_NATIVE_QA_1100](<entry/src/ohosTest/ets/test/WorkspaceBackupNativeQa.test.ets#L322>) | `testWorkspaceBackupNativeQa0011` | `com.samples.appcontinuation_WorkspaceBackupNativeQa_0011` |
| [SUB_CONTINUATION_WORKSPACE_NATIVE_QA_1200](<entry/src/ohosTest/ets/test/WorkspaceBackupNativeQa.test.ets#L348>) | `testWorkspaceBackupNativeQa0012` | `com.samples.appcontinuation_WorkspaceBackupNativeQa_0012` |

### [WorkspaceBackupUiQa.test.ets](<entry/src/ohosTest/ets/test/WorkspaceBackupUiQa.test.ets>)（19 例）

| 用例编号（源码） | 旧名 | 规范运行名 |
|---|---|---|
| [SUB_CONTINUATION_WORKSPACEBACKUPUIQA_0100](<entry/src/ohosTest/ets/test/WorkspaceBackupUiQa.test.ets#L38>) | `testWorkspaceBackupUiQa0001` | `com.samples.appcontinuation_WorkspaceBackupUiQa_0001` |
| [SUB_CONTINUATION_WORKSPACEBACKUPUIQA_0200](<entry/src/ohosTest/ets/test/WorkspaceBackupUiQa.test.ets#L58>) | `testWorkspaceBackupUiQa0002` | `com.samples.appcontinuation_WorkspaceBackupUiQa_0002` |
| [SUB_CONTINUATION_WORKSPACEBACKUPUIQA_0300](<entry/src/ohosTest/ets/test/WorkspaceBackupUiQa.test.ets#L79>) | `testWorkspaceBackupUiQa0003` | `com.samples.appcontinuation_WorkspaceBackupUiQa_0003` |
| [SUB_CONTINUATION_WORKSPACEBACKUPUIQA_0400](<entry/src/ohosTest/ets/test/WorkspaceBackupUiQa.test.ets#L101>) | `testWorkspaceBackupUiQa0004` | `com.samples.appcontinuation_WorkspaceBackupUiQa_0004` |
| [SUB_CONTINUATION_WORKSPACEBACKUPUIQA_0500](<entry/src/ohosTest/ets/test/WorkspaceBackupUiQa.test.ets#L128>) | `testWorkspaceBackupUiQa0005` | `com.samples.appcontinuation_WorkspaceBackupUiQa_0005` |
| [SUB_CONTINUATION_WORKSPACEBACKUPUIQA_0600](<entry/src/ohosTest/ets/test/WorkspaceBackupUiQa.test.ets#L151>) | `testWorkspaceBackupUiQa0006` | `com.samples.appcontinuation_WorkspaceBackupUiQa_0006` |
| [SUB_CONTINUATION_WORKSPACEBACKUPUIQA_0700](<entry/src/ohosTest/ets/test/WorkspaceBackupUiQa.test.ets#L184>) | `testWorkspaceBackupUiQa0007` | `com.samples.appcontinuation_WorkspaceBackupUiQa_0007` |
| [SUB_CONTINUATION_WORKSPACEBACKUPUIQA_0800](<entry/src/ohosTest/ets/test/WorkspaceBackupUiQa.test.ets#L208>) | `testWorkspaceBackupUiQa0008` | `com.samples.appcontinuation_WorkspaceBackupUiQa_0008` |
| [SUB_CONTINUATION_WORKSPACEBACKUPUIQA_0900](<entry/src/ohosTest/ets/test/WorkspaceBackupUiQa.test.ets#L232>) | `testWorkspaceBackupUiQa0009` | `com.samples.appcontinuation_WorkspaceBackupUiQa_0009` |
| [SUB_CONTINUATION_WORKSPACEBACKUPUIQA_1000](<entry/src/ohosTest/ets/test/WorkspaceBackupUiQa.test.ets#L252>) | `testWorkspaceBackupUiQa0010` | `com.samples.appcontinuation_WorkspaceBackupUiQa_0010` |
| [SUB_CONTINUATION_WORKSPACEBACKUPUIQA_1100](<entry/src/ohosTest/ets/test/WorkspaceBackupUiQa.test.ets#L273>) | `testWorkspaceBackupUiQa0011` | `com.samples.appcontinuation_WorkspaceBackupUiQa_0011` |
| [SUB_CONTINUATION_WORKSPACEBACKUPUIQA_1200](<entry/src/ohosTest/ets/test/WorkspaceBackupUiQa.test.ets#L297>) | `testWorkspaceBackupUiQa0012` | `com.samples.appcontinuation_WorkspaceBackupUiQa_0012` |
| [SUB_CONTINUATION_WORKSPACEBACKUPUIQA_1300](<entry/src/ohosTest/ets/test/WorkspaceBackupUiQa.test.ets#L319>) | `testWorkspaceBackupUiQa0013` | `com.samples.appcontinuation_WorkspaceBackupUiQa_0013` |
| [SUB_CONTINUATION_WORKSPACEBACKUPUIQA_1400](<entry/src/ohosTest/ets/test/WorkspaceBackupUiQa.test.ets#L349>) | `testWorkspaceBackupUiQa0014` | `com.samples.appcontinuation_WorkspaceBackupUiQa_0014` |
| [SUB_CONTINUATION_WORKSPACEBACKUPUIQA_1500](<entry/src/ohosTest/ets/test/WorkspaceBackupUiQa.test.ets#L376>) | `testWorkspaceBackupUiQa0015` | `com.samples.appcontinuation_WorkspaceBackupUiQa_0015` |
| [SUB_CONTINUATION_WORKSPACEBACKUPUIQA_1600](<entry/src/ohosTest/ets/test/WorkspaceBackupUiQa.test.ets#L401>) | `testWorkspaceBackupUiQa0016` | `com.samples.appcontinuation_WorkspaceBackupUiQa_0016` |
| [SUB_CONTINUATION_WORKSPACEBACKUPUIQA_1700](<entry/src/ohosTest/ets/test/WorkspaceBackupUiQa.test.ets#L448>) | `testWorkspaceBackupUiQa0017` | `com.samples.appcontinuation_WorkspaceBackupUiQa_0017` |
| [SUB_CONTINUATION_WORKSPACEBACKUPUIQA_1800](<entry/src/ohosTest/ets/test/WorkspaceBackupUiQa.test.ets#L470>) | `testWorkspaceBackupUiQa0018` | `com.samples.appcontinuation_WorkspaceBackupUiQa_0018` |
| [SUB_CONTINUATION_WORKSPACEBACKUPUIQA_1900](<entry/src/ohosTest/ets/test/WorkspaceBackupUiQa.test.ets#L505>) | `testWorkspaceBackupUiQa0019` | `com.samples.appcontinuation_WorkspaceBackupUiQa_0019` |

### [WorkspaceCases.test.ets](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets>)（48 例）

| 用例编号（源码） | 旧名 | 规范运行名 |
|---|---|---|
| [SUB_CONTINUATION_DOCUMENTWORKSPACECASES_0100](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets#L64>) | `testDocumentWorkspaceCases0001` | `com.samples.appcontinuation_DocumentWorkspaceCases_0001` |
| [SUB_CONTINUATION_DOCUMENTWORKSPACECASES_0200](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets#L83>) | `testDocumentWorkspaceCases0002` | `com.samples.appcontinuation_DocumentWorkspaceCases_0002` |
| [SUB_CONTINUATION_DOCUMENTWORKSPACECASES_0300](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets#L102>) | `testDocumentWorkspaceCases0003` | `com.samples.appcontinuation_DocumentWorkspaceCases_0003` |
| [SUB_CONTINUATION_DOCUMENTWORKSPACECASES_0400](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets#L119>) | `testDocumentWorkspaceCases0004` | `com.samples.appcontinuation_DocumentWorkspaceCases_0004` |
| [SUB_CONTINUATION_DOCUMENTWORKSPACECASES_0500](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets#L136>) | `testDocumentWorkspaceCases0005` | `com.samples.appcontinuation_DocumentWorkspaceCases_0005` |
| [SUB_CONTINUATION_DOCUMENTWORKSPACECASES_0600](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets#L154>) | `testDocumentWorkspaceCases0006` | `com.samples.appcontinuation_DocumentWorkspaceCases_0006` |
| [SUB_CONTINUATION_DOCUMENTWORKSPACECASES_0700](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets#L173>) | `testDocumentWorkspaceCases0007` | `com.samples.appcontinuation_DocumentWorkspaceCases_0007` |
| [SUB_CONTINUATION_DOCUMENTWORKSPACECASES_0800](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets#L194>) | `testDocumentWorkspaceCases0008` | `com.samples.appcontinuation_DocumentWorkspaceCases_0008` |
| [SUB_CONTINUATION_DOCUMENTWORKSPACECASES_0900](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets#L211>) | `testDocumentWorkspaceCases0009` | `com.samples.appcontinuation_DocumentWorkspaceCases_0009` |
| [SUB_CONTINUATION_DOCUMENTWORKSPACECASES_1000](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets#L230>) | `testDocumentWorkspaceCases0010` | `com.samples.appcontinuation_DocumentWorkspaceCases_0010` |
| [SUB_CONTINUATION_DOCUMENTWORKSPACECASES_1100](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets#L253>) | `testDocumentWorkspaceCases0011` | `com.samples.appcontinuation_DocumentWorkspaceCases_0011` |
| [SUB_CONTINUATION_DOCUMENTWORKSPACECASES_1200](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets#L272>) | `testDocumentWorkspaceCases0012` | `com.samples.appcontinuation_DocumentWorkspaceCases_0012` |
| [SUB_CONTINUATION_FORMSESSIONCASES_0100](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets#L295>) | `testFormSessionCases0001` | `com.samples.appcontinuation_FormSessionCases_0001` |
| [SUB_CONTINUATION_FORMSESSIONCASES_0200](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets#L312>) | `testFormSessionCases0002` | `com.samples.appcontinuation_FormSessionCases_0002` |
| [SUB_CONTINUATION_FORMSESSIONCASES_0300](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets#L333>) | `testFormSessionCases0003` | `com.samples.appcontinuation_FormSessionCases_0003` |
| [SUB_CONTINUATION_FORMSESSIONCASES_0400](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets#L352>) | `testFormSessionCases0004` | `com.samples.appcontinuation_FormSessionCases_0004` |
| [SUB_CONTINUATION_FORMSESSIONCASES_0500](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets#L377>) | `testFormSessionCases0005` | `com.samples.appcontinuation_FormSessionCases_0005` |
| [SUB_CONTINUATION_FORMSESSIONCASES_0600](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets#L399>) | `testFormSessionCases0006` | `com.samples.appcontinuation_FormSessionCases_0006` |
| [SUB_CONTINUATION_FORMSESSIONCASES_0700](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets#L421>) | `testFormSessionCases0007` | `com.samples.appcontinuation_FormSessionCases_0007` |
| [SUB_CONTINUATION_FORMSESSIONCASES_0800](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets#L443>) | `testFormSessionCases0008` | `com.samples.appcontinuation_FormSessionCases_0008` |
| [SUB_CONTINUATION_FORMSESSIONCASES_0900](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets#L462>) | `testFormSessionCases0009` | `com.samples.appcontinuation_FormSessionCases_0009` |
| [SUB_CONTINUATION_FORMSESSIONCASES_1000](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets#L483>) | `testFormSessionCases0010` | `com.samples.appcontinuation_FormSessionCases_0010` |
| [SUB_CONTINUATION_FORMSESSIONCASES_1100](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets#L509>) | `testFormSessionCases0011` | `com.samples.appcontinuation_FormSessionCases_0011` |
| [SUB_CONTINUATION_FORMSESSIONCASES_1200](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets#L531>) | `testFormSessionCases0012` | `com.samples.appcontinuation_FormSessionCases_0012` |
| [SUB_CONTINUATION_FORMSESSIONCASES_1300](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets#L548>) | `testFormSessionCases0013` | `com.samples.appcontinuation_FormSessionCases_0013` |
| [SUB_CONTINUATION_MERGEPLANCASES_0100](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets#L573>) | `testMergePlanCases0001` | `com.samples.appcontinuation_MergePlanCases_0001` |
| [SUB_CONTINUATION_MERGEPLANCASES_0200](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets#L593>) | `testMergePlanCases0002` | `com.samples.appcontinuation_MergePlanCases_0002` |
| [SUB_CONTINUATION_MERGEPLANCASES_0300](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets#L609>) | `testMergePlanCases0003` | `com.samples.appcontinuation_MergePlanCases_0003` |
| [SUB_CONTINUATION_MERGEPLANCASES_0400](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets#L625>) | `testMergePlanCases0004` | `com.samples.appcontinuation_MergePlanCases_0004` |
| [SUB_CONTINUATION_MERGEPLANCASES_0500](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets#L648>) | `testMergePlanCases0005` | `com.samples.appcontinuation_MergePlanCases_0005` |
| [SUB_CONTINUATION_MERGEPLANCASES_0600](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets#L667>) | `testMergePlanCases0006` | `com.samples.appcontinuation_MergePlanCases_0006` |
| [SUB_CONTINUATION_MERGEPLANCASES_0700](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets#L685>) | `testMergePlanCases0007` | `com.samples.appcontinuation_MergePlanCases_0007` |
| [SUB_CONTINUATION_MERGEPLANCASES_0800](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets#L702>) | `testMergePlanCases0008` | `com.samples.appcontinuation_MergePlanCases_0008` |
| [SUB_CONTINUATION_MERGEPLANCASES_0900](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets#L720>) | `testMergePlanCases0009` | `com.samples.appcontinuation_MergePlanCases_0009` |
| [SUB_CONTINUATION_MERGEPLANCASES_1000](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets#L739>) | `testMergePlanCases0010` | `com.samples.appcontinuation_MergePlanCases_0010` |
| [SUB_CONTINUATION_MERGEPLANCASES_1100](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets#L765>) | `testMergePlanCases0011` | `com.samples.appcontinuation_MergePlanCases_0011` |
| [SUB_CONTINUATION_RECOVERYPLANCASES_0100](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets#L783>) | `testRecoveryPlanCases0001` | `com.samples.appcontinuation_RecoveryPlanCases_0001` |
| [SUB_CONTINUATION_RECOVERYPLANCASES_0200](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets#L800>) | `testRecoveryPlanCases0002` | `com.samples.appcontinuation_RecoveryPlanCases_0002` |
| [SUB_CONTINUATION_RECOVERYPLANCASES_0300](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets#L817>) | `testRecoveryPlanCases0003` | `com.samples.appcontinuation_RecoveryPlanCases_0003` |
| [SUB_CONTINUATION_RECOVERYPLANCASES_0400](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets#L838>) | `testRecoveryPlanCases0004` | `com.samples.appcontinuation_RecoveryPlanCases_0004` |
| [SUB_CONTINUATION_RECOVERYPLANCASES_0500](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets#L856>) | `testRecoveryPlanCases0005` | `com.samples.appcontinuation_RecoveryPlanCases_0005` |
| [SUB_CONTINUATION_RECOVERYPLANCASES_0600](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets#L874>) | `testRecoveryPlanCases0006` | `com.samples.appcontinuation_RecoveryPlanCases_0006` |
| [SUB_CONTINUATION_RECOVERYPLANCASES_0700](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets#L890>) | `testRecoveryPlanCases0007` | `com.samples.appcontinuation_RecoveryPlanCases_0007` |
| [SUB_CONTINUATION_RECOVERYPLANCASES_0800](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets#L906>) | `testRecoveryPlanCases0008` | `com.samples.appcontinuation_RecoveryPlanCases_0008` |
| [SUB_CONTINUATION_RECOVERYPLANCASES_0900](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets#L922>) | `testRecoveryPlanCases0009` | `com.samples.appcontinuation_RecoveryPlanCases_0009` |
| [SUB_CONTINUATION_RECOVERYPLANCASES_1000](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets#L938>) | `testRecoveryPlanCases0010` | `com.samples.appcontinuation_RecoveryPlanCases_0010` |
| [SUB_CONTINUATION_RECOVERYPLANCASES_1100](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets#L958>) | `testRecoveryPlanCases0011` | `com.samples.appcontinuation_RecoveryPlanCases_0011` |
| [SUB_CONTINUATION_RECOVERYPLANCASES_1200](<entry/src/ohosTest/ets/test/WorkspaceCases.test.ets#L974>) | `testRecoveryPlanCases0012` | `com.samples.appcontinuation_RecoveryPlanCases_0012` |

### [FormalSceneUiSmoke.test.ets](<entry/src/ohosTest/ets/test/FormalSceneUiSmoke.test.ets>)（4 例）

| 编号 | 历史名称 | 规范运行名 |
|---|---|---|
| [SUB_CONTINUATION_FORMALSCENEUI_0100](<entry/src/ohosTest/ets/test/FormalSceneUiSmoke.test.ets#L40>) | 新增独立用例 | `com.samples.appcontinuation_FormalSceneUiSmoke_0001` |
| [SUB_CONTINUATION_FORMALSCENEUI_0200](<entry/src/ohosTest/ets/test/FormalSceneUiSmoke.test.ets#L81>) | 新增独立用例 | `com.samples.appcontinuation_FormalSceneUiSmoke_0002` |
| [SUB_CONTINUATION_FORMALSCENEUI_0300](<entry/src/ohosTest/ets/test/FormalSceneUiSmoke.test.ets#L126>) | 新增独立用例 | `com.samples.appcontinuation_FormalSceneUiSmoke_0003` |
| [SUB_CONTINUATION_FORMALSCENEUI_0400](<entry/src/ohosTest/ets/test/FormalSceneUiSmoke.test.ets#L171>) | 新增独立用例 | `com.samples.appcontinuation_FormalSceneUiSmoke_0004` |
