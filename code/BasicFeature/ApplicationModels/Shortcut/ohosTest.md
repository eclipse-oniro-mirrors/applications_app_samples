# Shortcut ohosTest 场景与用例索引

[中文说明](<README_zh.md>) · [English](<README.md>)

## 测试范围与环境

前部为功能用例表与验证结果，S01–S12 说明技术场景，末尾为现有用例的原编号、名称、运行名和源码索引。

1. 使用 OpenHarmony 标准系统设备、SDK `26.0.0` 及兼容的 DevEco Studio/构建工具链。`compileSdkVersion`、`targetSdkVersion`、`compatibleSdkVersion` 为 SDK 配置，`modelVersion` 为工程/构建模型版本，本工程两者均配置为 `26.0.0`。
2. 应用身份为 `com.samples.shortcut`，工程仅注册 `entry`，系统接口、服务、模型、业务与资源端口均在该模块中；隔离测试 feature 模块为 `entry_test`，测试依赖为 `@ohos/hypium` `1.0.25`。在本机配置开发签名，使用可丢弃测试数据。
3. 桌面查询、显隐和三个桌面入口要求 `SystemCapability.BundleManager.BundleFramework.Launcher` 和支持快捷方式的桌面。桌面不支持时，应用内便签、待办、收藏仍可使用。
4. 设备测试需屏幕已解锁且可交互。每个桌面入口分别在应用进程未运行（冷启动）和仍在后台运行（热启动）时点击验证，记录准备方法。日期、跨日及回收保留期测试前先核对设备时间。

## 功能验收用例表

U01–U29 由人工从正式应用或桌面执行，自动化套件另列于 A01–A05。各项验证结果见下表。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| U01 普通入口启动与首页 | 已安装签名匹配的 `entry`，设备解锁 | 从普通应用图标打开；返回首页 | 首页可用，支持状态与业务入口可见，无异常退出 | 否（人工全链路） | 待执行（按实际结果填写） |
| U02 能力检测、列表、详情和调用记录 | 已打开首页；桌面具备 Launcher 能力且支持快捷方式 | 重新检测、刷新；逐项打开详情和调用记录 | 能力和接口结果可区分；展示本应用三个静态入口，详情和记录对应实际操作 | 否（人工全链路） | 待执行（按实际结果填写） |
| U03 不支持桌面的业务可用性 | 可确认不支持快捷方式的设备/桌面 | 普通启动并重新检测；进入便签、待办、收藏 | 明确提示桌面能力不支持；本地业务可进入和使用，不整体禁用 | 否（人工全链路） | 待执行（按实际结果填写） |
| U04 新建便签桌面冷启动 | 支持的桌面；该入口可见；应用进程未运行 | 长按图标，点击“新建便签” | 冷启动进入便签新建场景，输入可用 | 否（人工全链路） | 待执行（按实际结果填写） |
| U05 今日待办桌面冷启动 | 支持的桌面；该入口可见；应用进程未运行 | 长按图标，点击“今日待办” | 冷启动进入今日待办上下文，不误用历史日期 | 否（人工全链路） | 待执行（按实际结果填写） |
| U06 收藏资料桌面冷启动 | 支持的桌面；该入口可见；应用进程未运行 | 长按图标，点击“收藏资料” | 冷启动进入收藏资料场景，按入口配置呈现筛选上下文 | 否（人工全链路） | 待执行（按实际结果填写） |
| U07 新建便签桌面热启动 | 支持的桌面；入口可见；应用仍在后台运行 | 长按图标，点击“新建便签” | 回到便签场景，不产生错误页面或重复跳转 | 否（人工全链路） | 待执行（按实际结果填写） |
| U08 今日待办桌面热启动 | 支持的桌面；入口可见；应用从历史待办页退到后台 | 长按图标，点击“今日待办” | 恢复应用并进入今日待办，不沿用旧历史日期 | 否（人工全链路） | 待执行（按实际结果填写） |
| U09 收藏资料桌面热启动 | 支持的桌面；入口可见；应用从其余页退到后台 | 长按图标，点击“收藏资料” | 恢复应用并进入配置的收藏资料上下文 | 否（人工全链路） | 待执行（按实际结果填写） |
| U10 编辑保护与重复入口 | 支持的桌面；便签有未保存编辑；应用仍在运行 | 重访便签入口；再通过另一桌面入口离开，分别选择继续编辑、保存/保留后离开、放弃 | 重访不丢编辑；取消不离开，保存/保留后按选择跳转，放弃不误保存 | 否（人工全链路） | 待执行（按实际结果填写） |
| U11 单项隐藏与恢复显示 | 支持的桌面；记录三个入口原显隐 | 在首页隐藏一个入口，检查桌面；再显示并刷新 | 仅目标显隐变化，桌面与刷新结果一致，其余入口不变；结束恢复原态 | 否（人工全链路） | 待执行（按实际结果填写） |
| U12 显隐批次预览与取消 | 支持的桌面；记录原态；未有设置在途 | 多选入口和目标显隐，预览后取消 | 预览列出真实目标、原态和可执行性；未确认不修改桌面 | 否（人工全链路） | 待执行（按实际结果填写） |
| U13 显隐批次确认与历史 | 支持的桌面；有效预览；记录原态 | 确认批次，刷新并核对桌面；重开查看批次 | 逐项结果与回读/桌面相符，分别展示已确认、已核对失败、未知和未执行，历史可查看 | 否（人工全链路） | 待执行（按实际结果填写） |
| U14 批次核对、重试与补偿 | 支持的桌面；存在可复现的未知/失败批次或可补偿历史 | 先核对，审查重试/补偿预览；遇外部变化明确选择保留或覆盖 | 不盲目重放；补偿仅按已知原态，不强制全显；条件不足记受阻并说明 | 否（人工全链路） | 待执行（按实际结果填写） |
| U15 便签新建、草稿和重开 | 工作区就绪；可丢弃测试数据 | 输入测试标题与多行正文，保留草稿、重开、保存、再重开 | 草稿可恢复，保存后正文一致，无重复或截断 | 否（人工全链路） | 待执行（按实际结果填写） |
| U16 便签修订、差异和恢复 | 已有测试便签及至少两次修订 | 编辑保存，查看历史/行级差异，恢复选定历史并重开 | 历史与差异对应所选版本，恢复结果正确，其余便签不变 | 否（人工全链路） | 待执行（按实际结果填写） |
| U17 未保存编辑离开选择 | 新草稿与已有便签分别有未保存编辑 | 分别返回并选择继续编辑、保存/保留后离开、放弃；重新进入 | 每种选择符合提示语义，不静默丢失编辑或覆盖独立草稿 | 否（人工全链路） | 待执行（按实际结果填写） |
| U18 便签移入回收与恢复 | 有测试便签、正文和修订；处于保留期内 | 删除进入回收站，查看并恢复，再重开便签 | 活跃/回收列表对应变化；正文及保留历史恢复，其余数据不变 | 否（人工全链路） | 待执行（按实际结果填写） |
| U19 永久删除及取消 | 回收站有可丢弃测试项 | 先取消永久删除，再确认永久删除 | 取消保留原项；确认后仅目标及其关联历史移除，不能恢复 | 否（人工全链路） | 待执行（按实际结果填写） |
| U20 回收站批量预览与提交 | 多个测试回收项；有恢复容量 | 多选恢复或永久删除，核对预览；分别取消和确认 | 预览不改列表，取消保留选择；有效确认整批一致；过期或容量不足不部分恢复 | 否（人工全链路） | 待执行（按实际结果填写） |
| U21 回收站空态、期限与容量提示 | 分别准备空站、到期项和容量不足数据；记录时间基线 | 打开、刷新回收站，尝试恢复/清理 | 空态和按钮状态正确；严格超过30天不可恢复，清理只针对到期项；容量不足明确提示 | 否（人工全链路） | 待执行（按实际结果填写） |
| U22 待办编辑与完成筛选 | 工作区就绪；选中今日 | 新建、编辑、完成/撤销、筛选并重开 | 标题与完成状态按操作保存，筛选结果一致，重开后数据保留 | 否（人工全链路） | 待执行（按实际结果填写） |
| U23 待办日期与历史 | 有今日及历史日期测试任务 | 切换日期、查看历史，在所选历史日修改后重开 | 只改变所属日期任务，不误改今日；历史展示与保存结果一致 | 否（人工全链路） | 待执行（按实际结果填写） |
| U24 收藏搜索、分类及持久化 | 本地示例资料可用 | 输入关键词，组合分类与收藏筛选；切换收藏并重开 | 条件组合结果正确，收藏标记持久保存，无命中时展示空态 | 否（人工全链路） | 待执行（按实际结果填写） |
| U25 规则中心与页面返回 | 普通启动，首页可用 | 打开规则中心，切换规则说明，返回及再次进入各业务页 | 规则说明与入口可用，切换内容及返回目标正确 | 否（人工全链路） | 待执行（按实际结果填写） |
| U26 中英文界面 | 可切换系统语言；已保存测试正文 | 分别使用中文和英文，重新进入首页、详情、业务页、弹框 | 文案随语言更新，已有用户内容和协议值不被改写 | 否（人工全链路） | 待执行（按实际结果填写） |
| U27 深浅色、长文本和显示 | 目标设备可切换主题/字体；含长标题、多行正文 | 切换深浅主题与可用字体大小，滚动列表、编辑区、预览和弹框 | 文字可读、关键信息和操作可达，无关键遮挡；记录实际屏幕/字体条件 | 否（人工全链路） | 待执行（按实际结果填写） |
| U28 应用内入口与桌面入口独立 | 支持的桌面；先记录原显隐 | 隐藏一个桌面入口，再从普通图标进入对应业务；最后恢复原态 | 隐藏只影响桌面入口，对应应用内业务仍可进入 | 否（人工全链路） | 待执行（按实际结果填写） |
| U29 返回与持久化回归 | 已完成便签、待办、收藏测试数据准备 | 各业务页返回首页；退出并重开应用，再检查数据和入口 | 导航无异常，已提交业务内容保留；不自动重放旧显隐批次 | 否（人工全链路） | 待执行（按实际结果填写） |

## 自动化分层与执行入口

在 DevEco Studio 打开工程并同步依赖，配置本地签名，通过 IDE 的 `ohosTest` 运行入口选择设备和套件。[List.test.ets](<entry/src/ohosTest/ets/test/List.test.ets>) 注册套件，[OpenHarmonyTestRunner.ets](<entry/src/ohosTest/ets/testrunner/OpenHarmonyTestRunner.ets>) 为 Runner 入口。按末尾索引选择规范运行名，将实际选择器、timeout、flags 和运行范围写入执行记录并保存原始报告。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| A01 规则、工作区、导航与显隐受控测试（S01–S09） | 测试环境可运行；独立内存存储、固定时钟和可控端口 | 运行对应受控套件及故障输入 | 状态、规则、存档和故障处理符合各技术场景预期 | 是（受控逻辑层） | 待执行（按实际结果填写） |
| A02 真实快捷方式接口（S10-A） | 已安装应用；设备具备 Launcher 能力且支持接口 | 运行原生支持/配置查询及不存在 ID 用例 | 查询真实三个入口并校验配置；无效 ID 保持原入口显隐 | 是（原生 API 层） | 待执行（按实际结果填写） |
| A03 真实 Preferences（S10-B） | 匹配 SDK 的设备与 ApplicationContext；隔离命名空间 | 运行缓存重开、文档往返及故障测试 | 真实 flush 与重开保留值/类型；受控确认故障经重读处理 | 是（原生存储层） | 待执行（按实际结果填写） |
| A04 隔离回收站 UI（S10-C） | 解锁可交互；自身测试 Ability、白名单页面和受控存储 | 运行回收站 UI 套件 | 生产组件的按钮、列表和提示与 BusinessStore 状态一致 | 是（隔离组件 UI 层） | 待执行（按实际结果填写） |
| A05 生命周期及 Runner 参数（S11–S12） | 受控正文/清理函数与普通参数对象 | 运行清理失败、超时及精确选择器用例 | 主异常保留、清理完整、选择范围与参数正确 | 是（测试基础设施层） | 待执行（按实际结果填写） |

真实 Preferences 测试使用独立命名空间；[RecycleNativeQaSupport.ets](<entry/src/ohosTest/ets/support/RecycleNativeQaSupport.ets>) 限定 `sc_recycle_native_qa_` 加数字的隔离空间。隔离 UI 启动自己持有的 [FeatureQaAbility.ets](<entry/src/ohosTest/ets/testability/FeatureQaAbility.ets>)，清理范围为本测试的实例、缓存、存储空间和 Ability。

## 验证结果

单 entry 结构的执行结果待实际验证后填写。请记录应用版本、设备及系统完整版本、时间、用例范围、选择器与证据编号；结构回迁和静态引用核对不代表功能执行通过。具体场景见 U01–U29、A01–A05，完整编号与运行名见末尾索引。

## 用例身份、日志与清理

- 运行名采用 `com.samples.shortcut_<功能>_<序号>`，保留原 `@tc.name` 末4位序号；原始编号、名称与运行名的映射见完整索引，不重新编号，也不改变 flags、输入、分支或预期。
- [TestCase.ets](<entry/src/ohosTest/ets/support/TestCase.ets>) 统一注册与断言日志，[CaseLifecycle.ets](<entry/src/ohosTest/ets/support/CaseLifecycle.ets>) 记录 `begin`、`failure`、`end`，Domain 为 `0xF811`，Tag 为 `[Sample_Shortcut]`。每条断言前记录实际/预期脱敏摘要，绑定明确用例 owner；不输出便签正文、Want、存档文档或用户输入。断言仍比较原始值，摘要不替代断言。
- [CaseScope.ets](<entry/src/ohosTest/ets/support/CaseScope.ets>) 提供默认10秒 watchdog 并逆序释放资源。正文失败仍尝试全部清理；正文与清理同时失败保留正文主异常，仅清理失败也必须报告失败。清理结果随执行记录保存。
- 17条回收站UI用例通过 [UiTestRuntime.ets](<entry/src/ohosTest/ets/support/UiTestRuntime.ets>) 的独占会话注册。selector为纯JS描述，native调用逐个等待真实完成；超时调用隔离到真实settle，不借afterEach保证清理。Want、ready/root均绑定会话nonce，精确owned Context在onDestroy逐项清理fixture与资源后ack；初始化或清理失败保留具名phase，原始业务断言继续执行真实UI读取。

## 技术场景说明（S01–S12）

以下说明受控规则、原生 API 与隔离 UI 的前置条件和断言边界，与前部人工全链路表分别记录结果。

### S01. 工作区初始化与存储边界

**前置条件**. 分别准备空存储、有效旧文档、损坏 JSON、无效类型、重复 ID、长度/数量超限文档和待完成读写。使用独立存储及固定时钟，记录已提交文档作为比对基线。

**操作**.
1. 初始化工作区并重复调用初始化，读取有效边界值和各类非法文档。
2. 在未就绪、加载中和提交中尝试修改或发起第二次提交；注入读取拒绝与写入失败，再显式重试读取。
3. 在读写完成前释放实例或重新初始化，随后放行旧异步结果；修改快照和订阅关系，检查是否影响内部状态。

**预期**. 无效文档整体拒绝且原文不被自动覆盖；有效数据无额外写入。未就绪和忙状态阻止冲突修改；一次提交不并发产生第二次写入。失败解除可重试状态但不丢失已提交基线；旧实例的回调不污染新实例。快照为独立副本，取消订阅和释放后不再通知旧监听者。容量和 UTF-8 字节预算均按整体文档判断。

### S02. 便签草稿、修订、保存与差异

**前置条件**. 准备新建草稿、已有便签、已保留的独立草稿、编辑基线以及本地/存档修订不同的组合。历史输入覆盖相同文本、插入、删除、替换、空行、换行及长度边界。

**操作**.
1. 输入标题和正文，保留或放弃草稿，保存后重开实例；在同一时钟值连续保存并校验 ID 唯一性。
2. 编辑已有便签，在离开时选择保存、保留或放弃，注入提交失败与提交挂起，再重新打开。
3. 根据基线、本地修订和存档修订组合选择安全保存、确认、分支或阻止；查看和恢复历史并生成行级差异。
4. 在编辑期间执行收藏、待办或删除另一条便签等独立业务提交；对恢复历史和清除编辑记录分别注入失败。

**预期**. 独立新草稿与已有便签编辑恢复信息互不覆盖。未确认成功的提交不替换正式正文和历史；保存失败阻止导航并保留可重试缓冲。修订冲突不静默覆盖存档；分支保存保留原记录。相同时间保存仍生成唯一 ID；历史与差异保留准确顺序、内容和边界，恢复失败不清除原编辑上下文。

### S03. 回收生命周期与批量预览

**前置条件**. 准备活跃便签、30天内回收项、到期项、同 ID 冲突、容量已满、历史关联、空选择和混合选择。对每次操作记录活跃列表、回收列表、历史及根文档写次数。

**操作**.
1. 删除、恢复、永久删除和按保留期清理；覆盖正在编辑的目标与非目标便签。
2. 对恢复和永久删除生成预览，检查真实目标、历史数、容量和拒绝原因；覆盖重复标识、缺失项、超过50项、过期项及总容量不足。
3. 取消预览、替换预览、重复使用令牌，或在预览后改变工作区、时间和编辑状态再确认。
4. 注入普通写失败、写结果不确定、已落盘但确认丢失、重读失败和提交期间释放实例；重开核对。

**预期**. 预览不修改盘面或活跃列表；非法或失效选择整批拒绝，不隐式截断或部分执行。令牌只能用于所属实例与当前有效预览。恢复保留正确历史，永久删除不可恢复，过期项不可恢复。一次批量确认只提交一个根文档，活动项、回收项、草稿和历史共同一致。不确定结果先重读，不盲目重复提交；损坏或冲突数据不被自动重置。

### S04. 待办日期、状态、到期与重复规则

**前置条件**. 固定本地时间，准备今天与历史日期任务、不同完成状态和优先级，以及跨午夜、闰日、月末、年末和周末组合。

**操作**.
1. 切换日期、编辑、完成或撤销任务，检查重复设置同值、缺失 ID 和非法状态流转。
2. 在午夜后提交旧日期任务，分别测试刷新、重置和存储失败。
3. 计算无截止、逾期、即将到期与未来任务，进行延期、按优先级排序、每日/工作日/每周重复和例外日期跳过。

**预期**. 日期键和历史归属稳定，跨日不会误改旧任务；同值操作幂等，非法流转无副作用。失败保留已提交状态。到期桶、逾期天数、排序和下次有效日期符合各自边界；无重复不生成额外日期，工作日重复跳过周末，例外日期不会被选为下一次发生时间。

### S05. 收藏、标签、检索与筛选链

**前置条件**. 准备分类、收藏标记、标签同义词、重复标签、大小写混合、中文及英文文本、无命中和同分资料。保留连续重复字符的非重叠匹配输入。

**操作**.
1. 规范化标签并建立反向索引，按关键词检索，分别检查标题、标签和正文命中。
2. 组合分类、收藏和查询条件，检查空条件、非法条件、顺序、结果限制和同分排序。
3. 生成摘要与高亮，检查长度、边界截断、未知时间戳和近期加分；对连续重复字符执行非重叠计数。

**预期**. 标签去重保留规定顺序，同义词和长度/数量限制一致；索引不因重复添加丢失记录。空查询不返回全量资料，排序和限制稳定，标题/标签/正文权重符合规则。摘要围绕有效命中，高亮不丢失原文。连续重复字符按非重叠匹配得到2次，而不是采用重叠计数时的3次，覆盖相邻匹配边界。

### S06. 快捷方式能力、查询与单项显隐

**前置条件**. 使用支持、不支持、能力检测抛错和查询失败等受控平台端口；准备显式可见、隐藏、缺少 `visible` 字段及未知 ID 的入口。

**操作**.
1. 初始化、重新检测能力并查询入口，重复刷新和订阅状态。
2. 单独显示/隐藏入口，在调用中再次操作，并注入系统拒绝、查询失败及迟到结果。
3. 在释放和重新初始化前后完成旧回调；检查调用记录、错误分类和模型副本。

**预期**. 能力不支持与接口失败明确区分，接口失败保留对应错误响应。单项设置仅影响目标；未知 ID 和忙状态受保护。缺少 `visible` 时，界面使用显示回退，平台原态保留为未知。旧回调不提交到新实例，调用记录有界且脱敏。

### S07. 显隐批次、核对、重试与补偿

**前置条件**. 准备混合原态、原态未知、未执行和已中断批次、失败项、权限终止项、外部修改、损坏存档及接近次数/序号上限的批次。使用可控查询、系统写入、存档和遥测端口。

**操作**.
1. 选择入口生成预览，取消或替换预览，确认后重复使用令牌；在预览后删除入口或改变显隐。
2. 分别在预览存档、调用前标记、系统设置和回读阶段注入失败或超时，检查存档与系统调用的先后顺序。
3. 对未知结果核对，对核对失败项生成重试；对已执行且原态已知项生成补偿，并明确选择保留或覆盖外部改动。
4. 挂起原始调用后尝试重试，重开服务，放行旧回调；触发历史容量、尝试次数、序号上限和遥测失败。

**预期**. 预览不设置系统入口，确认令牌单次有效；确认前状态变化会使计划失效。系统设置前先持久化未知标记，拒绝但实际已生效的设置可由回读确认为已达目标。未知结果不自动重放，在途调用不重叠重试；终止权限错误不形成循环。补偿按各项已知原态执行，原态或当前态未知时先核对。重开不恢复旧预览执行权，旧回调不改新存档。存档失败停止盲写，遥测失败不改变业务结果；成功开始的追踪仍应结束。

### S08. Want 校验与页面导航

**前置条件**. 准备冷/热启动、已存在页面、工作区加载/提交中、未保存编辑和可延迟的对话框/路由端口。输入覆盖允许的动作、版本和筛选组合，以及缺失、类型错误、未知动作和不匹配参数。

**操作**.
1. 在初始化前后接收入口 Want，重复接收相同请求，切换待办/收藏上下文及带 ID 的详情。
2. 在离开编辑时取消、保存或放弃，注入保存失败、路由失败和返回尚未完成时的新激活。
3. 释放或重新初始化导航器后放行旧对话框和旧路由，随后再发起新请求。

**预期**. 未就绪时安全等待，重复待处理请求不产生重复跳转，详情目标 ID 不丢失。非法输入不触发业务写入或错误页面跳转。取消和保存失败不离开，路由失败恢复原筛选上下文；已经成功保存的正文不因跳转失败而撤销。旧会话回调不会清除新请求或调用旧页面处理器，返回后的下一次真实路由仍可执行。

### S09. 国际化与展示模型

**前置条件**. 提供默认英文和中文资源夹具，分别在模块导入前后绑定资源；业务样例包含中文检索数据和已保存的用户内容。

**操作**. 切换解析器并读取静态场景目录、规则说明、提示和带占位符文案，创建模型快照；重新进入页面检查延迟解析。

**预期**. 展示文本使用当前资源解析器，模块加载不会永久锁定旧语言；占位参数与文案一致。固定协议值、中文搜索输入和已保存内容不被翻译或重写。页面长文本、深色主题和无障碍布局按 U26–U27 在设备上检查。

### S10. 真实快捷方式、真实 Preferences 与隔离回收站 UI

本场景分为系统快捷方式接口、Preferences 存储和回收站组件 UI 三层。

#### S10-A. 真实快捷方式接口层

**前置条件**. 在匹配 SDK 的真实设备上安装本应用，具备 Launcher 系统能力且桌面支持快捷方式；已记录真实入口原态。相关用例见 [NativeCoverage.test.ets](<entry/src/ohosTest/ets/test/NativeCoverage.test.ets>)。

**操作**. 调用原生支持检测，查询已安装本应用的三个静态入口，核对 bundle、module 和目标 Ability；对不存在的 ID 调用显隐接口，前后查询真实入口。

**预期**. 查询反映真实安装配置；无效 ID 返回对应错误并保持原入口显隐。桌面菜单、三个入口冷/热启动、有效 ID 显隐和批次操作见 U02、U04–U14。

#### S10-B. 真实 Preferences 存储层

**前置条件**. 在匹配 SDK 的设备上取得 ApplicationContext；使用白名单独立命名空间，不操作生产数据。相关用例见 [NativeCoverage.test.ets](<entry/src/ohosTest/ets/test/NativeCoverage.test.ets>) 和 [RecycleNativeQa.test.ets](<entry/src/ohosTest/ets/test/RecycleNativeQa.test.ets>)。

**操作**.
1. 写入中文、多行文本、布尔和零值，真实 `flush()` 后移除缓存并重开；验证便签、历史与回收整份文档往返。
2. 覆盖真实存储拒绝及受控的提交后确认丢失、原文回退/不匹配等故障，逐项注明是 SDK 实际返回还是应用侧注入；核对重读、容量、隔离命名空间和释放后重开的行为。
3. 完成或失败后释放本用例实例与缓存，清理自身测试命名空间，保留所需脱敏报告。

**预期**. 缓存重开后值、类型、正文和历史一致；失败保留非目标数据，不确定结果先重读。确认丢失用例在真实 flush 后注入应用侧故障，再检查候选文档的重读恢复。

#### S10-C. 隔离回收站组件 UI 层

**前置条件**. 设备屏幕已解锁且可交互；只启动自身持有的 [FeatureQaAbility.ets](<entry/src/ohosTest/ets/testability/FeatureQaAbility.ets>) 和白名单回收页面，使用生产回收站组件、真实 BusinessStore 与受控存储。相关用例见 [RecycleUiQa.test.ets](<entry/src/ohosTest/ets/test/RecycleUiQa.test.ets>)。

**操作**. 按稳定组件 ID 操作空态、恢复、永久删除及取消、过期项、容量不足、忙状态、写失败、重读和批量预览；记录列表、按钮、提示与模型状态。完成或失败后释放异步门和实例，等待自身 Ability 销毁。

**预期**. 在受控存储下，组件交互与 BusinessStore 状态一致，确认、取消、失败和批量操作均保持完整提交；清理自身异步门、实例和测试 Ability。

### S11. 失败优先级与清理故障

**前置条件**. 使用可控的用例正文和多项清理函数，分别让正文成功/失败、某项清理失败或多项清理失败；让首项失败后仍能观察后续清理。

**操作**. 执行统一生命周期，记录各清理调用顺序、对外抛出的异常和 `begin/failure/end` 阶段；覆盖异步清理、重复释放和 watchdog 超时，并分别注入 `Error`、`undefined` 与 `null` 失败值。

**预期**. 全部已注册清理均被尝试，适用的资源按逆序释放。正文主异常不被清理次异常覆盖；仅清理失败仍向上报告失败，`undefined` 或 `null` 不能被误作没有异常。超时仍释放订阅，超时与清理同时失败时保留超时主异常，结束阶段不吞异常。

### S12. Runner 筛选兼容与参数保真

**前置条件**. 准备已知原用例叶名、套件限定、逗号列表、空白、规范新名称、未知或相似名称与异常分隔组合。使用普通参数对象，不取得 delegator 或运行原生能力。

**操作**. 对选择器执行精确叶名映射，再对包含 `class`、`testCaseNames`、timeout、flags、应用及 Runner 标识的参数对象执行规范化。

**预期**. 只改变白名单中完整叶名，保留套件、分隔符及外围空白。未知和非法输入不被扩大为全量测试；timeout、flags、应用和 Runner 标识不变，不引入旧包名兼容。初始化错误不暴露抛出值的消息或路径。

## 完整用例索引

现有归档包含43个用例文件、729条用例：原41个文件713条，加上 CaseLifecycle 的12条与 RunnerFilter 的4条。下表保留原编号、原名称、规范运行名、源码链接和覆盖点；验证结论见前部“验证结果”。

### [AppNavigation.test.ets](<entry/src/ohosTest/ets/test/AppNavigation.test.ets>) — 8条

对应场景：S08。原名称保留注释映射，运行名遵循统一身份规则。

| 原编号 / 源码定位 | 原名称 / 规范运行名 | 覆盖点 |
|---|---|---|
| [SUB_SHORTCUT_PRODUCTIONAPPNAVIGATION_0100](<entry/src/ohosTest/ets/test/AppNavigation.test.ets#L69>) | `testProductionAppNavigation0001`<br>`com.samples.shortcut_ProductionAppNavigation_0001` | cold want waits for store and applies today open |
| [SUB_SHORTCUT_PRODUCTIONAPPNAVIGATION_0200](<entry/src/ohosTest/ets/test/AppNavigation.test.ets>)（源码第100行） | `testProductionAppNavigation0002`<br>`com.samples.shortcut_ProductionAppNavigation_0002` | duplicate pending and same page want uses production store |
| [SUB_SHORTCUT_PRODUCTIONAPPNAVIGATION_0300](<entry/src/ohosTest/ets/test/AppNavigation.test.ets>)（源码第141行） | `testProductionAppNavigation0003`<br>`com.samples.shortcut_ProductionAppNavigation_0003` | leave cancel and save failure never navigate or apply context |
| [SUB_SHORTCUT_PRODUCTIONAPPNAVIGATION_0400](<entry/src/ohosTest/ets/test/AppNavigation.test.ets>)（源码第182行） | `testProductionAppNavigation0004`<br>`com.samples.shortcut_ProductionAppNavigation_0004` | route failure rolls back filter and successful leave save remains saved |
| [SUB_SHORTCUT_PRODUCTIONAPPNAVIGATION_0500](<entry/src/ohosTest/ets/test/AppNavigation.test.ets#L219>) | `testProductionAppNavigation0005`<br>`com.samples.shortcut_ProductionAppNavigation_0005` | late dialog and canceled pending do not run after dispose |
| [SUB_SHORTCUT_PRODUCTIONAPPNAVIGATION_0600](<entry/src/ohosTest/ets/test/AppNavigation.test.ets#L254>) | `testProductionAppNavigation0006`<br>`com.samples.shortcut_ProductionAppNavigation_0006` | pending detail retains id when cold or busy |
| [SUB_SHORTCUT_PRODUCTIONAPPNAVIGATION_0700](<entry/src/ohosTest/ets/test/AppNavigation.test.ets#L289>) | `testProductionAppNavigation0007`<br>`com.samples.shortcut_ProductionAppNavigation_0007` | old dialog cannot clear reinitialized session pending |
| [SUB_SHORTCUT_PRODUCTIONAPPNAVIGATION_0800](<entry/src/ohosTest/ets/test/AppNavigation.test.ets#L334>) | `testProductionAppNavigation0008`<br>`com.samples.shortcut_ProductionAppNavigation_0008` | A home activation before back resolves keeps its handler and permits the next real route. |

### [BusinessCoverage.test.ets](<entry/src/ohosTest/ets/test/BusinessCoverage.test.ets>) — 20条

对应场景：S01、S02、S04。原名称保留注释映射，运行名遵循统一身份规则。

| 原编号 / 源码定位 | 原名称 / 规范运行名 | 覆盖点 |
|---|---|---|
| [SUB_SHORTCUT_BUSINESSCOVERAGE_0100](<entry/src/ohosTest/ets/test/BusinessCoverage.test.ets#L28>) | `testBusinessCoverage0001`<br>`com.samples.shortcut_BusinessCoverage_0001` | empty initialize idempotent and retry without context |
| [SUB_SHORTCUT_BUSINESSCOVERAGE_0200](<entry/src/ohosTest/ets/test/BusinessCoverage.test.ets#L57>) | `testBusinessCoverage0002`<br>`com.samples.shortcut_BusinessCoverage_0002` | read rejection and invalid json can retry without overwrite |
| [SUB_SHORTCUT_BUSINESSCOVERAGE_0300](<entry/src/ohosTest/ets/test/BusinessCoverage.test.ets>)（源码第100行） | `testBusinessCoverage0003`<br>`com.samples.shortcut_BusinessCoverage_0003` | invalid note schema duplicates and limits reject atomically |
| [SUB_SHORTCUT_BUSINESSCOVERAGE_0400](<entry/src/ohosTest/ets/test/BusinessCoverage.test.ets>)（源码第146行） | `testBusinessCoverage0004`<br>`com.samples.shortcut_BusinessCoverage_0004` | invalid todo schema dates ids count and boolean reject |
| [SUB_SHORTCUT_BUSINESSCOVERAGE_0500](<entry/src/ohosTest/ets/test/BusinessCoverage.test.ets>)（源码第186行） | `testBusinessCoverage0005`<br>`com.samples.shortcut_BusinessCoverage_0005` | valid maximum lengths and fifty notes load without write |
| [SUB_SHORTCUT_BUSINESSCOVERAGE_0600](<entry/src/ohosTest/ets/test/BusinessCoverage.test.ets#L213>) | `testBusinessCoverage0006`<br>`com.samples.shortcut_BusinessCoverage_0006` | draft truncation reverting to saved value clears dirty |
| [SUB_SHORTCUT_BUSINESSCOVERAGE_0700](<entry/src/ohosTest/ets/test/BusinessCoverage.test.ets#L243>) | `testBusinessCoverage0007`<br>`com.samples.shortcut_BusinessCoverage_0007` | body only title fallback trims and same tick ids are unique |
| [SUB_SHORTCUT_BUSINESSCOVERAGE_0800](<entry/src/ohosTest/ets/test/BusinessCoverage.test.ets#L273>) | `testBusinessCoverage0008`<br>`com.samples.shortcut_BusinessCoverage_0008` | note capacity rejects without write and delete reopens slot |
| [SUB_SHORTCUT_BUSINESSCOVERAGE_0900](<entry/src/ohosTest/ets/test/BusinessCoverage.test.ets#L302>) | `testBusinessCoverage0009`<br>`com.samples.shortcut_BusinessCoverage_0009` | snapshot notes todos and collections are deep copies |
| [SUB_SHORTCUT_BUSINESSCOVERAGE_1000](<entry/src/ohosTest/ets/test/BusinessCoverage.test.ets#L333>) | `testBusinessCoverage0010`<br>`com.samples.shortcut_BusinessCoverage_0010` | duplicate subscription unsubscribe and dispose clear listeners |
| [SUB_SHORTCUT_BUSINESSCOVERAGE_1100](<entry/src/ohosTest/ets/test/BusinessCoverage.test.ets#L361>) | `testBusinessCoverage0011`<br>`com.samples.shortcut_BusinessCoverage_0011` | not ready and loading gate blocks mutations and double read |
| [SUB_SHORTCUT_BUSINESSCOVERAGE_1200](<entry/src/ohosTest/ets/test/BusinessCoverage.test.ets#L393>) | `testBusinessCoverage0012`<br>`com.samples.shortcut_BusinessCoverage_0012` | pending write blocks second commit and editor changes |
| [SUB_SHORTCUT_BUSINESSCOVERAGE_1300](<entry/src/ohosTest/ets/test/BusinessCoverage.test.ets#L425>) | `testBusinessCoverage0013`<br>`com.samples.shortcut_BusinessCoverage_0013` | dispose during write ignores late success and late error |
| [SUB_SHORTCUT_BUSINESSCOVERAGE_1400](<entry/src/ohosTest/ets/test/BusinessCoverage.test.ets#L459>) | `testBusinessCoverage0014`<br>`com.samples.shortcut_BusinessCoverage_0014` | old load cannot overwrite reinitialized store |
| [SUB_SHORTCUT_BUSINESSCOVERAGE_1500](<entry/src/ohosTest/ets/test/BusinessCoverage.test.ets#L493>) | `testBusinessCoverage0015`<br>`com.samples.shortcut_BusinessCoverage_0015` | midnight stale todo refreshes but never marks old id |
| [SUB_SHORTCUT_BUSINESSCOVERAGE_1600](<entry/src/ohosTest/ets/test/BusinessCoverage.test.ets#L518>) | `testBusinessCoverage0016`<br>`com.samples.shortcut_BusinessCoverage_0016` | same todo value is idempotent and missing id never writes |
| [SUB_SHORTCUT_BUSINESSCOVERAGE_1700](<entry/src/ohosTest/ets/test/BusinessCoverage.test.ets#L542>) | `testBusinessCoverage0017`<br>`com.samples.shortcut_BusinessCoverage_0017` | date refresh and reset write failure preserve committed state |
| [SUB_SHORTCUT_BUSINESSCOVERAGE_1800](<entry/src/ohosTest/ets/test/BusinessCoverage.test.ets#L573>) | `testBusinessCoverage0018`<br>`com.samples.shortcut_BusinessCoverage_0018` | local date key handles leap day month year and single digits |
| [SUB_SHORTCUT_BUSINESSCOVERAGE_1900](<entry/src/ohosTest/ets/test/BusinessCoverage.test.ets#L590>) | `testBusinessCoverage0019`<br>`com.samples.shortcut_BusinessCoverage_0019` | reopened same timestamp never creates duplicate note ids |
| [SUB_SHORTCUT_BUSINESSCOVERAGE_2000](<entry/src/ohosTest/ets/test/BusinessCoverage.test.ets#L621>) | `testBusinessCoverage0020`<br>`com.samples.shortcut_BusinessCoverage_0020` | restored ids with sequence gaps are never overwritten |

### [BusinessDeepCases.test.ets](<entry/src/ohosTest/ets/test/BusinessDeepCases.test.ets>) — 30条

对应场景：S02、S03、S04、S05。原名称保留注释映射，运行名遵循统一身份规则。

| 原编号 / 源码定位 | 原名称 / 规范运行名 | 覆盖点 |
|---|---|---|
| [SUB_SHORTCUT_NOTETRASHCASES_0100](<entry/src/ohosTest/ets/test/BusinessDeepCases.test.ets#L44>) | `testNoteTrashCases0001`<br>`com.samples.shortcut_NoteTrashCases_0001` | save rule table has ten entries |
| [SUB_SHORTCUT_NOTETRASHCASES_0200](<entry/src/ohosTest/ets/test/BusinessDeepCases.test.ets#L59>) | `testNoteTrashCases0002`<br>`com.samples.shortcut_NoteTrashCases_0002` | clean forward save is safe |
| [SUB_SHORTCUT_NOTETRASHCASES_0300](<entry/src/ohosTest/ets/test/BusinessDeepCases.test.ets#L76>) | `testNoteTrashCases0003`<br>`com.samples.shortcut_NoteTrashCases_0003` | identical triple needs no change |
| [SUB_SHORTCUT_NOTETRASHCASES_0400](<entry/src/ohosTest/ets/test/BusinessDeepCases.test.ets#L93>) | `testNoteTrashCases0004`<br>`com.samples.shortcut_NoteTrashCases_0004` | remote ahead asks for confirm |
| [SUB_SHORTCUT_NOTETRASHCASES_0500](<entry/src/ohosTest/ets/test/BusinessDeepCases.test.ets>)（源码第109行） | `testNoteTrashCases0005`<br>`com.samples.shortcut_NoteTrashCases_0005` | both ahead branches the save |
| [SUB_SHORTCUT_NOTETRASHCASES_0600](<entry/src/ohosTest/ets/test/BusinessDeepCases.test.ets>)（源码第125行） | `testNoteTrashCases0006`<br>`com.samples.shortcut_NoteTrashCases_0006` | converged revisions are safe |
| [SUB_SHORTCUT_NOTETRASHCASES_0700](<entry/src/ohosTest/ets/test/BusinessDeepCases.test.ets>)（源码第142行） | `testNoteTrashCases0007`<br>`com.samples.shortcut_NoteTrashCases_0007` | rollback and guards block writing |
| [SUB_SHORTCUT_NOTETRASHCASES_0800](<entry/src/ohosTest/ets/test/BusinessDeepCases.test.ets>)（源码第162行） | `testNoteTrashCases0008`<br>`com.samples.shortcut_NoteTrashCases_0008` | missing revision and uncertain write are handled |
| [SUB_SHORTCUT_NOTETRASHCASES_0900](<entry/src/ohosTest/ets/test/BusinessDeepCases.test.ets>)（源码第179行） | `testNoteTrashCases0009`<br>`com.samples.shortcut_NoteTrashCases_0009` | trash bin keeps recent items |
| [SUB_SHORTCUT_NOTETRASHCASES_1000](<entry/src/ohosTest/ets/test/BusinessDeepCases.test.ets>)（源码第199行） | `testNoteTrashCases0010`<br>`com.samples.shortcut_NoteTrashCases_0010` | expired items cannot be restored |
| [SUB_SHORTCUT_DUEPOLICYCASES_0100](<entry/src/ohosTest/ets/test/BusinessDeepCases.test.ets#L221>) | `testDuePolicyCases0001`<br>`com.samples.shortcut_DuePolicyCases_0001` | rule table has ten entries |
| [SUB_SHORTCUT_DUEPOLICYCASES_0200](<entry/src/ohosTest/ets/test/BusinessDeepCases.test.ets#L236>) | `testDuePolicyCases0002`<br>`com.samples.shortcut_DuePolicyCases_0002` | state covers all branches |
| [SUB_SHORTCUT_DUEPOLICYCASES_0300](<entry/src/ohosTest/ets/test/BusinessDeepCases.test.ets#L256>) | `testDuePolicyCases0003`<br>`com.samples.shortcut_DuePolicyCases_0003` | overdue days rounds down |
| [SUB_SHORTCUT_DUEPOLICYCASES_0400](<entry/src/ohosTest/ets/test/BusinessDeepCases.test.ets#L272>) | `testDuePolicyCases0004`<br>`com.samples.shortcut_DuePolicyCases_0004` | defer moves deadline only |
| [SUB_SHORTCUT_DUEPOLICYCASES_0500](<entry/src/ohosTest/ets/test/BusinessDeepCases.test.ets#L292>) | `testDuePolicyCases0005`<br>`com.samples.shortcut_DuePolicyCases_0005` | priority weights are ordered |
| [SUB_SHORTCUT_DUEPOLICYCASES_0600](<entry/src/ohosTest/ets/test/BusinessDeepCases.test.ets#L307>) | `testDuePolicyCases0006`<br>`com.samples.shortcut_DuePolicyCases_0006` | buckets split items by state |
| [SUB_SHORTCUT_DUEPOLICYCASES_0700](<entry/src/ohosTest/ets/test/BusinessDeepCases.test.ets#L329>) | `testDuePolicyCases0007`<br>`com.samples.shortcut_DuePolicyCases_0007` | daily repeat advances one day |
| [SUB_SHORTCUT_DUEPOLICYCASES_0800](<entry/src/ohosTest/ets/test/BusinessDeepCases.test.ets#L348>) | `testDuePolicyCases0008`<br>`com.samples.shortcut_DuePolicyCases_0008` | weekday repeat skips weekend |
| [SUB_SHORTCUT_DUEPOLICYCASES_0900](<entry/src/ohosTest/ets/test/BusinessDeepCases.test.ets#L368>) | `testDuePolicyCases0009`<br>`com.samples.shortcut_DuePolicyCases_0009` | exceptions push to next valid day |
| [SUB_SHORTCUT_DUEPOLICYCASES_1000](<entry/src/ohosTest/ets/test/BusinessDeepCases.test.ets#L386>) | `testDuePolicyCases0010`<br>`com.samples.shortcut_DuePolicyCases_0010` | repeat text explains next date |
| [SUB_SHORTCUT_TAGINDEXCASES_0100](<entry/src/ohosTest/ets/test/BusinessDeepCases.test.ets#L407>) | `testTagIndexCases0001`<br>`com.samples.shortcut_TagIndexCases_0001` | rule table has ten entries |
| [SUB_SHORTCUT_TAGINDEXCASES_0200](<entry/src/ohosTest/ets/test/BusinessDeepCases.test.ets#L423>) | `testTagIndexCases0002`<br>`com.samples.shortcut_TagIndexCases_0002` | normalize trims and lowercases |
| [SUB_SHORTCUT_TAGINDEXCASES_0300](<entry/src/ohosTest/ets/test/BusinessDeepCases.test.ets#L440>) | `testTagIndexCases0003`<br>`com.samples.shortcut_TagIndexCases_0003` | long tag is truncated |
| [SUB_SHORTCUT_TAGINDEXCASES_0400](<entry/src/ohosTest/ets/test/BusinessDeepCases.test.ets#L456>) | `testTagIndexCases0004`<br>`com.samples.shortcut_TagIndexCases_0004` | normalize tags deduplicates |
| [SUB_SHORTCUT_TAGINDEXCASES_0500](<entry/src/ohosTest/ets/test/BusinessDeepCases.test.ets#L472>) | `testTagIndexCases0005`<br>`com.samples.shortcut_TagIndexCases_0005` | normalize tags respects limit |
| [SUB_SHORTCUT_TAGINDEXCASES_0600](<entry/src/ohosTest/ets/test/BusinessDeepCases.test.ets#L491>) | `testTagIndexCases0006`<br>`com.samples.shortcut_TagIndexCases_0006` | tokenize splits on punctuation |
| [SUB_SHORTCUT_TAGINDEXCASES_0700](<entry/src/ohosTest/ets/test/BusinessDeepCases.test.ets#L508>) | `testTagIndexCases0007`<br>`com.samples.shortcut_TagIndexCases_0007` | search ranks title above tag |
| [SUB_SHORTCUT_TAGINDEXCASES_0800](<entry/src/ohosTest/ets/test/BusinessDeepCases.test.ets#L529>) | `testTagIndexCases0008`<br>`com.samples.shortcut_TagIndexCases_0008` | search returns empty for blank query |
| [SUB_SHORTCUT_TAGINDEXCASES_0900](<entry/src/ohosTest/ets/test/BusinessDeepCases.test.ets#L545>) | `testTagIndexCases0009`<br>`com.samples.shortcut_TagIndexCases_0009` | tag index builds reverse map |
| [SUB_SHORTCUT_TAGINDEXCASES_1000](<entry/src/ohosTest/ets/test/BusinessDeepCases.test.ets#L567>) | `testTagIndexCases0010`<br>`com.samples.shortcut_TagIndexCases_0010` | tag index keeps first occurrence |

### [BusinessGapCases.test.ets](<entry/src/ohosTest/ets/test/BusinessGapCases.test.ets>) — 8条

对应场景：S07。原名称保留注释映射，运行名遵循统一身份规则。

| 原编号 / 源码定位 | 原名称 / 规范运行名 | 覆盖点 |
|---|---|---|
| [SUB_SHORTCUT_BATCHCOPYCASES_0100](<entry/src/ohosTest/ets/test/BusinessGapCases.test.ets#L69>) | `testBatchCopyCases0001`<br>`com.samples.shortcut_BatchCopyCases_0001` | batch item defaults |
| [SUB_SHORTCUT_BATCHCOPYCASES_0200](<entry/src/ohosTest/ets/test/BusinessGapCases.test.ets#L90>) | `testBatchCopyCases0002`<br>`com.samples.shortcut_BatchCopyCases_0002` | batch journal defaults |
| [SUB_SHORTCUT_BATCHCOPYCASES_0300](<entry/src/ohosTest/ets/test/BusinessGapCases.test.ets>)（源码第106行） | `testBatchCopyCases0003`<br>`com.samples.shortcut_BatchCopyCases_0003` | batch preview item defaults |
| [SUB_SHORTCUT_BATCHCOPYCASES_0400](<entry/src/ohosTest/ets/test/BusinessGapCases.test.ets>)（源码第125行） | `testBatchCopyCases0004`<br>`com.samples.shortcut_BatchCopyCases_0004` | batch result text covers all outcomes |
| [SUB_SHORTCUT_BATCHCOPYCASES_0500](<entry/src/ohosTest/ets/test/BusinessGapCases.test.ets>)（源码第141行） | `testBatchCopyCases0005`<br>`com.samples.shortcut_BatchCopyCases_0005` | copy batch is deep |
| [SUB_SHORTCUT_BATCHCOPYCASES_0600](<entry/src/ohosTest/ets/test/BusinessGapCases.test.ets>)（源码第166行） | `testBatchCopyCases0006`<br>`com.samples.shortcut_BatchCopyCases_0006` | copy batch handles empty items |
| [SUB_SHORTCUT_BATCHCOPYCASES_0700](<entry/src/ohosTest/ets/test/BusinessGapCases.test.ets>)（源码第184行） | `testBatchCopyCases0007`<br>`com.samples.shortcut_BatchCopyCases_0007` | copy journal copies plans |
| [SUB_SHORTCUT_BATCHCOPYCASES_0800](<entry/src/ohosTest/ets/test/BusinessGapCases.test.ets#L206>) | `testBatchCopyCases0008`<br>`com.samples.shortcut_BatchCopyCases_0008` | copy preview copies items |

### [BusinessRecoveryB2.test.ets](<entry/src/ohosTest/ets/test/BusinessRecoveryB2.test.ets>) — 14条

对应场景：S02、S03。原名称保留注释映射，运行名遵循统一身份规则。

| 原编号 / 源码定位 | 原名称 / 规范运行名 | 覆盖点 |
|---|---|---|
| [SUB_SHORTCUT_BUSINESSRECOVERYB2_0100](<entry/src/ohosTest/ets/test/BusinessRecoveryB2.test.ets#L28>) | `testBusinessRecoveryBatchTwo0001`<br>`com.samples.shortcut_BusinessRecoveryBatchTwo_0001` | 放弃编辑时写失败应阻止离开并保留可重试缓冲 |
| [SUB_SHORTCUT_BUSINESSRECOVERYB2_0200](<entry/src/ohosTest/ets/test/BusinessRecoveryB2.test.ets#L64>) | `testBusinessRecoveryBatchTwo0002`<br>`com.samples.shortcut_BusinessRecoveryBatchTwo_0002` | 放弃编辑等待磁盘完成期间保持编辑上下文 |
| [SUB_SHORTCUT_BUSINESSRECOVERYB2_0300](<entry/src/ohosTest/ets/test/BusinessRecoveryB2.test.ets>)（源码第102行） | `testBusinessRecoveryBatchTwo0003`<br>`com.samples.shortcut_BusinessRecoveryBatchTwo_0003` | 放弃已保留编辑后重开恢复独立草稿而非被放弃编辑 |
| [SUB_SHORTCUT_BUSINESSRECOVERYB2_0400](<entry/src/ohosTest/ets/test/BusinessRecoveryB2.test.ets>)（源码第138行） | `testBusinessRecoveryBatchTwo0004`<br>`com.samples.shortcut_BusinessRecoveryBatchTwo_0004` | 第二次保留失败后重开只恢复上次成功编辑草稿 |
| [SUB_SHORTCUT_BUSINESSRECOVERYB2_0500](<entry/src/ohosTest/ets/test/BusinessRecoveryB2.test.ets>)（源码第176行） | `testBusinessRecoveryBatchTwo0005`<br>`com.samples.shortcut_BusinessRecoveryBatchTwo_0005` | 收藏提交不丢失已保留编辑与独立新草稿 |
| [SUB_SHORTCUT_BUSINESSRECOVERYB2_0600](<entry/src/ohosTest/ets/test/BusinessRecoveryB2.test.ets#L213>) | `testBusinessRecoveryBatchTwo0006`<br>`com.samples.shortcut_BusinessRecoveryBatchTwo_0006` | 待办提交后重开保留编辑基线且正式正文不变 |
| [SUB_SHORTCUT_BUSINESSRECOVERYB2_0700](<entry/src/ohosTest/ets/test/BusinessRecoveryB2.test.ets#L250>) | `testBusinessRecoveryBatchTwo0007`<br>`com.samples.shortcut_BusinessRecoveryBatchTwo_0007` | 删除另一条便签不会清除当前编辑恢复信息 |
| [SUB_SHORTCUT_BUSINESSRECOVERYB2_0800](<entry/src/ohosTest/ets/test/BusinessRecoveryB2.test.ets#L286>) | `testBusinessRecoveryBatchTwo0008`<br>`com.samples.shortcut_BusinessRecoveryBatchTwo_0008` | 删除当前编辑目标同时清除持久编辑但保留独立草稿 |
| [SUB_SHORTCUT_BUSINESSRECOVERYB2_0900](<entry/src/ohosTest/ets/test/BusinessRecoveryB2.test.ets#L322>) | `testBusinessRecoveryBatchTwo0009`<br>`com.samples.shortcut_BusinessRecoveryBatchTwo_0009` | 删除目标写失败后重开仍能恢复编辑与历史 |
| [SUB_SHORTCUT_BUSINESSRECOVERYB2_1000](<entry/src/ohosTest/ets/test/BusinessRecoveryB2.test.ets#L359>) | `testBusinessRecoveryBatchTwo0010`<br>`com.samples.shortcut_BusinessRecoveryBatchTwo_0010` | 恢复历史写失败不替换已保留编辑及正式正文 |
| [SUB_SHORTCUT_BUSINESSRECOVERYB2_1100](<entry/src/ohosTest/ets/test/BusinessRecoveryB2.test.ets#L395>) | `testBusinessRecoveryBatchTwo0011`<br>`com.samples.shortcut_BusinessRecoveryBatchTwo_0011` | 写入期间释放实例不应用旧编辑回调但成功存档可恢复 |
| [SUB_SHORTCUT_BUSINESSRECOVERYB2_1200](<entry/src/ohosTest/ets/test/BusinessRecoveryB2.test.ets#L436>) | `testBusinessRecoveryBatchTwo0012`<br>`com.samples.shortcut_BusinessRecoveryBatchTwo_0012` | 保留编辑失败解除忙状态后可重试并恢复最新内容 |
| [SUB_SHORTCUT_BUSINESSRECOVERYB2_1300](<entry/src/ohosTest/ets/test/BusinessRecoveryB2.test.ets#L477>) | `testBusinessRecoveryBatchTwo0013`<br>`com.samples.shortcut_BusinessRecoveryBatchTwo_0013` | 页面取消编辑清盘失败后保留编辑上下文并可重试 |
| [SUB_SHORTCUT_BUSINESSRECOVERYB2_1400](<entry/src/ohosTest/ets/test/BusinessRecoveryB2.test.ets#L512>) | `testBusinessRecoveryBatchTwo0014`<br>`com.samples.shortcut_BusinessRecoveryBatchTwo_0014` | 页面取消编辑等待磁盘完成后才清除缓冲且重启不复活 |

### [BusinessRuleMatrix.test.ets](<entry/src/ohosTest/ets/test/BusinessRuleMatrix.test.ets>) — 11条

对应场景：S04、S05、S08。原名称保留注释映射，运行名遵循统一身份规则。

| 原编号 / 源码定位 | 原名称 / 规范运行名 | 覆盖点 |
|---|---|---|
| [SUB_SHORTCUT_ENTRYROUTEMATRIX_0100](<entry/src/ohosTest/ets/test/BusinessRuleMatrix.test.ets#L70>) | `testEntryRouteMatrix0001`<br>`com.samples.shortcut_EntryRouteMatrix_0001` | route table is consistent |
| [SUB_SHORTCUT_ENTRYROUTEMATRIX_0200](<entry/src/ohosTest/ets/test/BusinessRuleMatrix.test.ets>)（源码第102行） | `testEntryRouteMatrix0002`<br>`com.samples.shortcut_EntryRouteMatrix_0002` | resolve route handles guards |
| [SUB_SHORTCUT_ENTRYROUTEMATRIX_0300](<entry/src/ohosTest/ets/test/BusinessRuleMatrix.test.ets>)（源码第144行） | `testEntryRouteMatrix0003`<br>`com.samples.shortcut_EntryRouteMatrix_0003` | page reverse lookup |
| [SUB_SHORTCUT_TODORULESMATRIX_0100](<entry/src/ohosTest/ets/test/BusinessRuleMatrix.test.ets>)（源码第172行） | `testTodoRulesMatrix0001`<br>`com.samples.shortcut_TodoRulesMatrix_0001` | transition table is consistent |
| [SUB_SHORTCUT_TODORULESMATRIX_0200](<entry/src/ohosTest/ets/test/BusinessRuleMatrix.test.ets#L203>) | `testTodoRulesMatrix0002`<br>`com.samples.shortcut_TodoRulesMatrix_0002` | rejects illegal transitions |
| [SUB_SHORTCUT_TODORULESMATRIX_0300](<entry/src/ohosTest/ets/test/BusinessRuleMatrix.test.ets#L226>) | `testTodoRulesMatrix0003`<br>`com.samples.shortcut_TodoRulesMatrix_0003` | scoring and sorting |
| [SUB_SHORTCUT_TODORULESMATRIX_0400](<entry/src/ohosTest/ets/test/BusinessRuleMatrix.test.ets#L259>) | `testTodoRulesMatrix0004`<br>`com.samples.shortcut_TodoRulesMatrix_0004` | summary covers buckets and states |
| [SUB_SHORTCUT_SEARCHINDEXMATRIX_0100](<entry/src/ohosTest/ets/test/BusinessRuleMatrix.test.ets#L287>) | `testSearchIndexMatrix0001`<br>`com.samples.shortcut_SearchIndexMatrix_0001` | tokenize handles latin and cjk |
| [SUB_SHORTCUT_SEARCHINDEXMATRIX_0200](<entry/src/ohosTest/ets/test/BusinessRuleMatrix.test.ets#L312>) | `testSearchIndexMatrix0002`<br>`com.samples.shortcut_SearchIndexMatrix_0002` | score and snippet |
| [SUB_SHORTCUT_SEARCHINDEXMATRIX_0300](<entry/src/ohosTest/ets/test/BusinessRuleMatrix.test.ets#L340>) | `testSearchIndexMatrix0003`<br>`com.samples.shortcut_SearchIndexMatrix_0003` | search ranks and limits |
| [SUB_SHORTCUT_SEARCHINDEXMATRIX_0400](<entry/src/ohosTest/ets/test/BusinessRuleMatrix.test.ets#L369>) | `testSearchIndexMatrix0004`<br>`com.samples.shortcut_SearchIndexMatrix_0004` | highlight and audit |

### [BusinessStore.test.ets](<entry/src/ohosTest/ets/test/BusinessStore.test.ets>) — 2条

对应场景：S01、S02、S04、S05。原名称保留注释映射，运行名遵循统一身份规则。

| 原编号 / 源码定位 | 原名称 / 规范运行名 | 覆盖点 |
|---|---|---|
| [SUB_SHORTCUT_BUSINESSSTORE_0100](<entry/src/ohosTest/ets/test/BusinessStore.test.ets#L25>) | `testBusinessStore0001`<br>`com.samples.shortcut_BusinessStore_0001` | 便签草稿恢复保存删除与写失败保护 |
| [SUB_SHORTCUT_BUSINESSSTORE_0200](<entry/src/ohosTest/ets/test/BusinessStore.test.ets>)（源码第115行） | `testBusinessStore0002`<br>`com.samples.shortcut_BusinessStore_0002` | 待办完成恢复与本地日期隔离 |

### [CollectionFilterCases.test.ets](<entry/src/ohosTest/ets/test/CollectionFilterCases.test.ets>) — 12条

对应场景：S05。原名称保留注释映射，运行名遵循统一身份规则。

| 原编号 / 源码定位 | 原名称 / 规范运行名 | 覆盖点 |
|---|---|---|
| [SUB_SHORTCUT_COLLECTIONRULECASES_0100](<entry/src/ohosTest/ets/test/CollectionFilterCases.test.ets#L61>) | `testCollectionRuleCases0001`<br>`com.samples.shortcut_CollectionRuleCases_0001` | rule table is consistent |
| [SUB_SHORTCUT_COLLECTIONRULECASES_0200](<entry/src/ohosTest/ets/test/CollectionFilterCases.test.ets#L86>) | `testCollectionRuleCases0002`<br>`com.samples.shortcut_CollectionRuleCases_0002` | kind distribution covers every bucket |
| [SUB_SHORTCUT_COLLECTIONRULECASES_0300](<entry/src/ohosTest/ets/test/CollectionFilterCases.test.ets>)（源码第110行） | `testCollectionRuleCases0003`<br>`com.samples.shortcut_CollectionRuleCases_0003` | judge item covers validity rules |
| [SUB_SHORTCUT_COLLECTIONRULECASES_0400](<entry/src/ohosTest/ets/test/CollectionFilterCases.test.ets>)（源码第135行） | `testCollectionRuleCases0004`<br>`com.samples.shortcut_CollectionRuleCases_0004` | judge item covers tag and age rules |
| [SUB_SHORTCUT_COLLECTIONRULECASES_0500](<entry/src/ohosTest/ets/test/CollectionFilterCases.test.ets>)（源码第161行） | `testCollectionRuleCases0005`<br>`com.samples.shortcut_CollectionRuleCases_0005` | govern plans every item |
| [SUB_SHORTCUT_COLLECTIONRULECASES_0600](<entry/src/ohosTest/ets/test/CollectionFilterCases.test.ets>)（源码第187行） | `testCollectionRuleCases0006`<br>`com.samples.shortcut_CollectionRuleCases_0006` | duplicate ids are dropped first |
| [SUB_SHORTCUT_COLLECTIONRULECASES_0700](<entry/src/ohosTest/ets/test/CollectionFilterCases.test.ets#L213>) | `testCollectionRuleCases0007`<br>`com.samples.shortcut_CollectionRuleCases_0007` | pin quota keeps newest |
| [SUB_SHORTCUT_FILTERCHAINCASES_0100](<entry/src/ohosTest/ets/test/CollectionFilterCases.test.ets#L240>) | `testFilterChainCases0001`<br>`com.samples.shortcut_FilterChainCases_0001` | chain table is consistent |
| [SUB_SHORTCUT_FILTERCHAINCASES_0200](<entry/src/ohosTest/ets/test/CollectionFilterCases.test.ets#L267>) | `testFilterChainCases0002`<br>`com.samples.shortcut_FilterChainCases_0002` | labels match enums |
| [SUB_SHORTCUT_FILTERCHAINCASES_0300](<entry/src/ohosTest/ets/test/CollectionFilterCases.test.ets#L290>) | `testFilterChainCases0003`<br>`com.samples.shortcut_FilterChainCases_0003` | match node covers every operator |
| [SUB_SHORTCUT_FILTERCHAINCASES_0400](<entry/src/ohosTest/ets/test/CollectionFilterCases.test.ets#L325>) | `testFilterChainCases0004`<br>`com.samples.shortcut_FilterChainCases_0004` | chain evaluation and counts |
| [SUB_SHORTCUT_FILTERCHAINCASES_0500](<entry/src/ohosTest/ets/test/CollectionFilterCases.test.ets#L355>) | `testFilterChainCases0005`<br>`com.samples.shortcut_FilterChainCases_0005` | merge and negate chains |

### [DiffCases.test.ets](<entry/src/ohosTest/ets/test/DiffCases.test.ets>) — 5条

对应场景：S02。原名称保留注释映射，运行名遵循统一身份规则。

| 原编号 / 源码定位 | 原名称 / 规范运行名 | 覆盖点 |
|---|---|---|
| [SUB_SHORTCUT_TEXTDIFF_0100](<entry/src/ohosTest/ets/test/DiffCases.test.ets#L25>) | `testTextDiff0001`<br>`com.samples.shortcut_TextDiff_0001` | identical text reports no change |
| [SUB_SHORTCUT_TEXTDIFF_0200](<entry/src/ohosTest/ets/test/DiffCases.test.ets#L45>) | `testTextDiff0002`<br>`com.samples.shortcut_TextDiff_0002` | replaced line is removed then added |
| [SUB_SHORTCUT_TEXTDIFF_0300](<entry/src/ohosTest/ets/test/DiffCases.test.ets#L68>) | `testTextDiff0003`<br>`com.samples.shortcut_TextDiff_0003` | inserted line keeps common lines |
| [SUB_SHORTCUT_TEXTDIFF_0400](<entry/src/ohosTest/ets/test/DiffCases.test.ets#L89>) | `testTextDiff0004`<br>`com.samples.shortcut_TextDiff_0004` | character diff reports changes |
| [SUB_SHORTCUT_TEXTDIFF_0500](<entry/src/ohosTest/ets/test/DiffCases.test.ets>)（源码第107行） | `testTextDiff0005`<br>`com.samples.shortcut_TextDiff_0005` | oversized input is explicitly truncated |

### [DueRepeatMatrixCases.test.ets](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets>) — 61条

对应场景：S04。原名称保留注释映射，运行名遵循统一身份规则。

| 原编号 / 源码定位 | 原名称 / 规范运行名 | 覆盖点 |
|---|---|---|
| [SUB_SHORTCUT_DUERULECASES_0100](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets#L38>) | `testDueRuleCases0001`<br>`com.samples.shortcut_DueRuleCases_0001` | rule table has ten entries |
| [SUB_SHORTCUT_DUERULECASES_0200](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets#L56>) | `testDueRuleCases0002`<br>`com.samples.shortcut_DueRuleCases_0002` | rule describe joins facts |
| [SUB_SHORTCUT_DUERULECASES_0300](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets#L73>) | `testDueRuleCases0003`<br>`com.samples.shortcut_DueRuleCases_0003` | due state enum is closed |
| [SUB_SHORTCUT_DUERULECASES_0400](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets#L90>) | `testDueRuleCases0004`<br>`com.samples.shortcut_DueRuleCases_0004` | priority enum is ordered |
| [SUB_SHORTCUT_DUERULECASES_0500](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets>)（源码第106行） | `testDueRuleCases0005`<br>`com.samples.shortcut_DueRuleCases_0005` | repeat enum covers five kinds |
| [SUB_SHORTCUT_DUERULECASES_0600](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets>)（源码第123行） | `testDueRuleCases0006`<br>`com.samples.shortcut_DueRuleCases_0006` | due soon window is one day |
| [SUB_SHORTCUT_DUERULECASES_0700](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets>)（源码第139行） | `testDueRuleCases0007`<br>`com.samples.shortcut_DueRuleCases_0007` | due lines match table |
| [SUB_SHORTCUT_DUERULECASES_0800](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets>)（源码第155行） | `testDueRuleCases0008`<br>`com.samples.shortcut_DueRuleCases_0008` | every rule carries note |
| [SUB_SHORTCUT_TODODUECASES_0100](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets>)（源码第174行） | `testTodoDueCases0001`<br>`com.samples.shortcut_TodoDueCases_0001` | todo defaults are undated |
| [SUB_SHORTCUT_TODODUECASES_0200](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets>)（源码第194行） | `testTodoDueCases0002`<br>`com.samples.shortcut_TodoDueCases_0002` | undated covers zero and negative |
| [SUB_SHORTCUT_TODODUECASES_0300](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets#L209>) | `testTodoDueCases0003`<br>`com.samples.shortcut_TodoDueCases_0003` | date key pads month and day |
| [SUB_SHORTCUT_TODODUECASES_0400](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets#L224>) | `testTodoDueCases0004`<br>`com.samples.shortcut_TodoDueCases_0004` | date key ignores time of day |
| [SUB_SHORTCUT_TODODUECASES_0500](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets#L242>) | `testTodoDueCases0005`<br>`com.samples.shortcut_TodoDueCases_0005` | date key splits days |
| [SUB_SHORTCUT_TODODUECASES_0600](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets#L260>) | `testTodoDueCases0006`<br>`com.samples.shortcut_TodoDueCases_0006` | done wins everything |
| [SUB_SHORTCUT_TODODUECASES_0700](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets#L277>) | `testTodoDueCases0007`<br>`com.samples.shortcut_TodoDueCases_0007` | undated is not overdue |
| [SUB_SHORTCUT_TODODUECASES_0800](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets#L294>) | `testTodoDueCases0008`<br>`com.samples.shortcut_TodoDueCases_0008` | exceptions default empty |
| [SUB_SHORTCUT_DUESTATECASES_0100](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets#L314>) | `testDueStateCases0001`<br>`com.samples.shortcut_DueStateCases_0001` | far future is future |
| [SUB_SHORTCUT_DUESTATECASES_0200](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets#L331>) | `testDueStateCases0002`<br>`com.samples.shortcut_DueStateCases_0002` | window boundary counts as soon |
| [SUB_SHORTCUT_DUESTATECASES_0300](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets#L348>) | `testDueStateCases0003`<br>`com.samples.shortcut_DueStateCases_0003` | zero remain is soon |
| [SUB_SHORTCUT_DUESTATECASES_0400](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets#L364>) | `testDueStateCases0004`<br>`com.samples.shortcut_DueStateCases_0004` | past by one millisecond is overdue |
| [SUB_SHORTCUT_DUESTATECASES_0500](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets#L381>) | `testDueStateCases0005`<br>`com.samples.shortcut_DueStateCases_0005` | overdue days floor |
| [SUB_SHORTCUT_DUESTATECASES_0600](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets#L397>) | `testDueStateCases0006`<br>`com.samples.shortcut_DueStateCases_0006` | overdue days only for overdue |
| [SUB_SHORTCUT_DUESTATECASES_0700](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets#L414>) | `testDueStateCases0007`<br>`com.samples.shortcut_DueStateCases_0007` | high priority does not change state |
| [SUB_SHORTCUT_DEFERCASES_0100](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets#L434>) | `testDeferCases0001`<br>`com.samples.shortcut_DeferCases_0001` | defer moves due date |
| [SUB_SHORTCUT_DEFERCASES_0200](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets#L450>) | `testDeferCases0002`<br>`com.samples.shortcut_DeferCases_0002` | defer rejects non positive days |
| [SUB_SHORTCUT_DEFERCASES_0300](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets#L467>) | `testDeferCases0003`<br>`com.samples.shortcut_DeferCases_0003` | defer rejects undated |
| [SUB_SHORTCUT_DEFERCASES_0400](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets#L483>) | `testDeferCases0004`<br>`com.samples.shortcut_DeferCases_0004` | defer keeps priority |
| [SUB_SHORTCUT_DEFERCASES_0500](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets#L501>) | `testDeferCases0005`<br>`com.samples.shortcut_DeferCases_0005` | defer may leave task overdue |
| [SUB_SHORTCUT_DEFERCASES_0600](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets#L518>) | `testDeferCases0006`<br>`com.samples.shortcut_DeferCases_0006` | defer can make task future |
| [SUB_SHORTCUT_DEFERCASES_0700](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets#L536>) | `testDeferCases0007`<br>`com.samples.shortcut_DeferCases_0007` | repeated defer accumulates |
| [SUB_SHORTCUT_PRIORITYCASES_0200](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets#L558>) | `testPriorityCases0002`<br>`com.samples.shortcut_PriorityCases_0002` | weights are distinct |
| [SUB_SHORTCUT_PRIORITYCASES_0300](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets#L578>) | `testPriorityCases0003`<br>`com.samples.shortcut_PriorityCases_0003` | weights stay in range |
| [SUB_SHORTCUT_NEXTOCCURRENCECASES_0100](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets#L600>) | `testNextOccurrenceCases0001`<br>`com.samples.shortcut_NextOccurrenceCases_0001` | no repeat has no next |
| [SUB_SHORTCUT_NEXTOCCURRENCECASES_0200](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets#L617>) | `testNextOccurrenceCases0002`<br>`com.samples.shortcut_NextOccurrenceCases_0002` | daily advances one day |
| [SUB_SHORTCUT_NEXTOCCURRENCECASES_0300](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets#L636>) | `testNextOccurrenceCases0003`<br>`com.samples.shortcut_NextOccurrenceCases_0003` | weekly advances seven days |
| [SUB_SHORTCUT_NEXTOCCURRENCECASES_0400](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets#L653>) | `testNextOccurrenceCases0004`<br>`com.samples.shortcut_NextOccurrenceCases_0004` | monthly keeps day of month |
| [SUB_SHORTCUT_NEXTOCCURRENCECASES_0500](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets#L670>) | `testNextOccurrenceCases0005`<br>`com.samples.shortcut_NextOccurrenceCases_0005` | monthly overflows short month |
| [SUB_SHORTCUT_NEXTOCCURRENCECASES_0600](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets#L688>) | `testNextOccurrenceCases0006`<br>`com.samples.shortcut_NextOccurrenceCases_0006` | weekday skips weekend |
| [SUB_SHORTCUT_NEXTOCCURRENCECASES_0700](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets#L705>) | `testNextOccurrenceCases0007`<br>`com.samples.shortcut_NextOccurrenceCases_0007` | weekday from monday stays weekday |
| [SUB_SHORTCUT_NEXTOCCURRENCECASES_0800](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets#L723>) | `testNextOccurrenceCases0008`<br>`com.samples.shortcut_NextOccurrenceCases_0008` | weekday from saturday jumps to monday |
| [SUB_SHORTCUT_NEXTOCCURRENCECASES_0900](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets#L741>) | `testNextOccurrenceCases0009`<br>`com.samples.shortcut_NextOccurrenceCases_0009` | exception skips one day |
| [SUB_SHORTCUT_NEXTOCCURRENCECASES_1000](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets#L759>) | `testNextOccurrenceCases0010`<br>`com.samples.shortcut_NextOccurrenceCases_0010` | multiple exceptions chain |
| [SUB_SHORTCUT_NEXTOCCURRENCECASES_1100](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets#L779>) | `testNextOccurrenceCases0011`<br>`com.samples.shortcut_NextOccurrenceCases_0011` | exception on other date is ignored |
| [SUB_SHORTCUT_NEXTOCCURRENCECASES_1200](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets#L797>) | `testNextOccurrenceCases0012`<br>`com.samples.shortcut_NextOccurrenceCases_0012` | weekday exception skips to next workday |
| [SUB_SHORTCUT_NEXTOCCURRENCECASES_1300](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets#L815>) | `testNextOccurrenceCases0013`<br>`com.samples.shortcut_NextOccurrenceCases_0013` | saturated exceptions return zero |
| [SUB_SHORTCUT_NEXTOCCURRENCECASES_1400](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets#L835>) | `testNextOccurrenceCases0014`<br>`com.samples.shortcut_NextOccurrenceCases_0014` | next occurrence starts from given moment |
| [SUB_SHORTCUT_NEXTOCCURRENCECASES_1500](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets#L853>) | `testNextOccurrenceCases0015`<br>`com.samples.shortcut_NextOccurrenceCases_0015` | next occurrence does not mutate |
| [SUB_SHORTCUT_NEXTOCCURRENCECASES_1600](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets#L871>) | `testNextOccurrenceCases0016`<br>`com.samples.shortcut_NextOccurrenceCases_0016` | repeat text for none |
| [SUB_SHORTCUT_NEXTOCCURRENCECASES_1700](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets#L887>) | `testNextOccurrenceCases0017`<br>`com.samples.shortcut_NextOccurrenceCases_0017` | repeat text shows next date |
| [SUB_SHORTCUT_NEXTOCCURRENCECASES_1800](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets#L904>) | `testNextOccurrenceCases0018`<br>`com.samples.shortcut_NextOccurrenceCases_0018` | repeat text handles undecided next |
| [SUB_SHORTCUT_NEXTOCCURRENCECASES_1900](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets#L920>) | `testNextOccurrenceCases0019`<br>`com.samples.shortcut_NextOccurrenceCases_0019` | repeat text for weekly |
| [SUB_SHORTCUT_BUCKETCASES_0100](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets#L939>) | `testBucketCases0001`<br>`com.samples.shortcut_BucketCases_0001` | empty buckets |
| [SUB_SHORTCUT_BUCKETCASES_0200](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets#L955>) | `testBucketCases0002`<br>`com.samples.shortcut_BucketCases_0002` | buckets sort by state |
| [SUB_SHORTCUT_BUCKETCASES_0300](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets#L983>) | `testBucketCases0003`<br>`com.samples.shortcut_BucketCases_0003` | bucket describe counts all |
| [SUB_SHORTCUT_BUCKETCASES_0400](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets>)（源码第1002行） | `testBucketCases0004`<br>`com.samples.shortcut_BucketCases_0004` | done entry goes to done bucket |
| [SUB_SHORTCUT_BUCKETCASES_0500](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets>)（源码第1021行） | `testBucketCases0005`<br>`com.samples.shortcut_BucketCases_0005` | undated goes to undated bucket |
| [SUB_SHORTCUT_BUCKETCASES_0600](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets>)（源码第1037行） | `testBucketCases0006`<br>`com.samples.shortcut_BucketCases_0006` | bucket keeps input order |
| [SUB_SHORTCUT_BUCKETCASES_0700](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets>)（源码第1056行） | `testBucketCases0007`<br>`com.samples.shortcut_BucketCases_0007` | summary of empty list |
| [SUB_SHORTCUT_BUCKETCASES_0800](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets>)（源码第1071行） | `testBucketCases0008`<br>`com.samples.shortcut_BucketCases_0008` | summary matches buckets |
| [SUB_SHORTCUT_BUCKETCASES_0900](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets>)（源码第1090行） | `testBucketCases0009`<br>`com.samples.shortcut_BucketCases_0009` | priority does not affect bucketing |
| [SUB_SHORTCUT_BUCKETCASES_1000](<entry/src/ohosTest/ets/test/DueRepeatMatrixCases.test.ets>)（源码第1110行） | `testBucketCases0010`<br>`com.samples.shortcut_BucketCases_0010` | deferred item rebuckets |

### [EntryIntentMatrixCases.test.ets](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets>) — 84条

对应场景：S08。原名称保留注释映射，运行名遵循统一身份规则。

| 原编号 / 源码定位 | 原名称 / 规范运行名 | 覆盖点 |
|---|---|---|
| [SUB_SHORTCUT_ROUTEPARAMCASES_0100](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets#L46>) | `testRouteParamCases0001`<br>`com.samples.shortcut_RouteParamCases_0001` | optional param accepts empty |
| [SUB_SHORTCUT_ROUTEPARAMCASES_0200](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets#L62>) | `testRouteParamCases0002`<br>`com.samples.shortcut_RouteParamCases_0002` | required param rejects empty |
| [SUB_SHORTCUT_ROUTEPARAMCASES_0300](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets#L78>) | `testRouteParamCases0003`<br>`com.samples.shortcut_RouteParamCases_0003` | number kind only accepts integer text |
| [SUB_SHORTCUT_ROUTEPARAMCASES_0400](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets#L95>) | `testRouteParamCases0004`<br>`com.samples.shortcut_RouteParamCases_0004` | boolean kind only accepts two literals |
| [SUB_SHORTCUT_ROUTEPARAMCASES_0500](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets>)（源码第112行） | `testRouteParamCases0005`<br>`com.samples.shortcut_RouteParamCases_0005` | id kind rejects separators outside allow list |
| [SUB_SHORTCUT_ROUTEPARAMCASES_0600](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets>)（源码第129行） | `testRouteParamCases0006`<br>`com.samples.shortcut_RouteParamCases_0006` | text kind accepts any non empty value |
| [SUB_SHORTCUT_ROUTEPARAMCASES_0700](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets>)（源码第146行） | `testRouteParamCases0007`<br>`com.samples.shortcut_RouteParamCases_0007` | coerce keeps legal value |
| [SUB_SHORTCUT_ROUTEPARAMCASES_0800](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets>)（源码第163行） | `testRouteParamCases0008`<br>`com.samples.shortcut_RouteParamCases_0008` | coerce falls back on illegal value |
| [SUB_SHORTCUT_ROUTEPARAMCASES_0900](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets>)（源码第179行） | `testRouteParamCases0009`<br>`com.samples.shortcut_RouteParamCases_0009` | empty value is not replaced by fallback |
| [SUB_SHORTCUT_ROUTEPARAMCASES_1000](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets>)（源码第196行） | `testRouteParamCases0010`<br>`com.samples.shortcut_RouteParamCases_0010` | param text marks optional |
| [SUB_SHORTCUT_ROUTEENTRYCASES_0100](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets#L215>) | `testRouteEntryCases0001`<br>`com.samples.shortcut_RouteEntryCases_0001` | param of finds declared parameter |
| [SUB_SHORTCUT_ROUTEENTRYCASES_0200](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets#L233>) | `testRouteEntryCases0002`<br>`com.samples.shortcut_RouteEntryCases_0002` | param of miss returns undefined |
| [SUB_SHORTCUT_ROUTEENTRYCASES_0300](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets#L249>) | `testRouteEntryCases0003`<br>`com.samples.shortcut_RouteEntryCases_0003` | entry text lists params |
| [SUB_SHORTCUT_ROUTEENTRYCASES_0400](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets#L267>) | `testRouteEntryCases0004`<br>`com.samples.shortcut_RouteEntryCases_0004` | entry text marks parameterless route |
| [SUB_SHORTCUT_ROUTEENTRYCASES_0500](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets#L284>) | `testRouteEntryCases0005`<br>`com.samples.shortcut_RouteEntryCases_0005` | entry text marks login requirement |
| [SUB_SHORTCUT_ROUTEENTRYCASES_0600](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets#L300>) | `testRouteEntryCases0006`<br>`com.samples.shortcut_RouteEntryCases_0006` | route table is unique and complete |
| [SUB_SHORTCUT_ROUTEENTRYCASES_0700](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets#L318>) | `testRouteEntryCases0007`<br>`com.samples.shortcut_RouteEntryCases_0007` | route ids cover declared shortcuts |
| [SUB_SHORTCUT_ROUTEENTRYCASES_0800](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets#L335>) | `testRouteEntryCases0008`<br>`com.samples.shortcut_RouteEntryCases_0008` | page of unknown falls back home |
| [SUB_SHORTCUT_ROUTEENTRYCASES_0900](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets#L351>) | `testRouteEntryCases0009`<br>`com.samples.shortcut_RouteEntryCases_0009` | routes of page groups targets |
| [SUB_SHORTCUT_ROUTEENTRYCASES_1000](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets#L368>) | `testRouteEntryCases0010`<br>`com.samples.shortcut_RouteEntryCases_0010` | detail routes are two |
| [SUB_SHORTCUT_RESOLVEROUTECASES_0100](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets#L387>) | `testResolveRouteCases0001`<br>`com.samples.shortcut_ResolveRouteCases_0001` | unknown route is reported |
| [SUB_SHORTCUT_RESOLVEROUTECASES_0200](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets#L404>) | `testResolveRouteCases0002`<br>`com.samples.shortcut_ResolveRouteCases_0002` | optional params resolve empty |
| [SUB_SHORTCUT_RESOLVEROUTECASES_0300](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets#L422>) | `testResolveRouteCases0003`<br>`com.samples.shortcut_ResolveRouteCases_0003` | parameterless route resolves clean |
| [SUB_SHORTCUT_RESOLVEROUTECASES_0400](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets#L439>) | `testResolveRouteCases0004`<br>`com.samples.shortcut_ResolveRouteCases_0004` | missing required param blocks entry |
| [SUB_SHORTCUT_RESOLVEROUTECASES_0500](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets#L458>) | `testResolveRouteCases0005`<br>`com.samples.shortcut_ResolveRouteCases_0005` | login gate stops before params |
| [SUB_SHORTCUT_RESOLVEROUTECASES_0600](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets#L475>) | `testResolveRouteCases0006`<br>`com.samples.shortcut_ResolveRouteCases_0006` | logged in detail resolves |
| [SUB_SHORTCUT_RESOLVEROUTECASES_0700](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets#L495>) | `testResolveRouteCases0007`<br>`com.samples.shortcut_ResolveRouteCases_0007` | illegal value is reported and coerced |
| [SUB_SHORTCUT_RESOLVEROUTECASES_0800](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets#L515>) | `testResolveRouteCases0008`<br>`com.samples.shortcut_ResolveRouteCases_0008` | illegal boolean falls back to default |
| [SUB_SHORTCUT_RESOLVEROUTECASES_0900](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets#L534>) | `testResolveRouteCases0009`<br>`com.samples.shortcut_ResolveRouteCases_0009` | unknown param is ignored without blocking |
| [SUB_SHORTCUT_RESOLVEROUTECASES_1000](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets#L553>) | `testResolveRouteCases0010`<br>`com.samples.shortcut_ResolveRouteCases_0010` | multiple unknown params are all listed |
| [SUB_SHORTCUT_RESOLVEROUTECASES_1100](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets#L572>) | `testResolveRouteCases0011`<br>`com.samples.shortcut_ResolveRouteCases_0011` | resolution text explains success |
| [SUB_SHORTCUT_RESOLVEROUTECASES_1200](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets#L589>) | `testResolveRouteCases0012`<br>`com.samples.shortcut_ResolveRouteCases_0012` | resolution text explains failure |
| [SUB_SHORTCUT_RESOLVEROUTECASES_1300](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets#L605>) | `testResolveRouteCases0013`<br>`com.samples.shortcut_ResolveRouteCases_0013` | stale entry is marked expired |
| [SUB_SHORTCUT_RESOLVEROUTECASES_1400](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets#L623>) | `testResolveRouteCases0014`<br>`com.samples.shortcut_ResolveRouteCases_0014` | fresh entry is not expired |
| [SUB_SHORTCUT_RESOLVEROUTECASES_1500](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets#L641>) | `testResolveRouteCases0015`<br>`com.samples.shortcut_ResolveRouteCases_0015` | zero timestamp skips expiry check |
| [SUB_SHORTCUT_RESOLVEROUTECASES_1600](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets#L660>) | `testResolveRouteCases0016`<br>`com.samples.shortcut_ResolveRouteCases_0016` | request put overwrites in place |
| [SUB_SHORTCUT_RESOLVEROUTECASES_1700](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets#L678>) | `testResolveRouteCases0017`<br>`com.samples.shortcut_ResolveRouteCases_0017` | request text joins pairs |
| [SUB_SHORTCUT_ROUTEAUDITCASES_0100](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets#L699>) | `testRouteAuditCases0001`<br>`com.samples.shortcut_RouteAuditCases_0001` | route table is self consistent |
| [SUB_SHORTCUT_ROUTEAUDITCASES_0200](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets#L715>) | `testRouteAuditCases0002`<br>`com.samples.shortcut_RouteAuditCases_0002` | route lines match table |
| [SUB_SHORTCUT_ROUTEAUDITCASES_0300](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets#L731>) | `testRouteAuditCases0003`<br>`com.samples.shortcut_RouteAuditCases_0003` | every route has description |
| [SUB_SHORTCUT_ROUTEAUDITCASES_0400](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets#L749>) | `testRouteAuditCases0004`<br>`com.samples.shortcut_RouteAuditCases_0004` | required params carry no usable fallback |
| [SUB_SHORTCUT_ENTRYRULECASES_0100](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets#L776>) | `testEntryRuleCases0001`<br>`com.samples.shortcut_EntryRuleCases_0001` | source labels are distinct |
| [SUB_SHORTCUT_ENTRYRULECASES_0200](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets#L799>) | `testEntryRuleCases0002`<br>`com.samples.shortcut_EntryRuleCases_0002` | empty prefix matches every uri |
| [SUB_SHORTCUT_ENTRYRULECASES_0300](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets#L816>) | `testEntryRuleCases0003`<br>`com.samples.shortcut_EntryRuleCases_0003` | prefix match is anchored |
| [SUB_SHORTCUT_ENTRYRULECASES_0400](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets#L833>) | `testEntryRuleCases0004`<br>`com.samples.shortcut_EntryRuleCases_0004` | rule text shows priority |
| [SUB_SHORTCUT_ENTRYRULECASES_0500](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets#L851>) | `testEntryRuleCases0005`<br>`com.samples.shortcut_EntryRuleCases_0005` | rule ids are sequential |
| [SUB_SHORTCUT_ENTRYRULECASES_0600](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets#L869>) | `testEntryRuleCases0006`<br>`com.samples.shortcut_EntryRuleCases_0006` | rule of miss returns undefined |
| [SUB_SHORTCUT_ENTRYRULECASES_0700](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets#L884>) | `testEntryRuleCases0007`<br>`com.samples.shortcut_EntryRuleCases_0007` | shortcut source has five rules |
| [SUB_SHORTCUT_ENTRYRULECASES_0800](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets#L901>) | `testEntryRuleCases0008`<br>`com.samples.shortcut_EntryRuleCases_0008` | deeplink source has six rules |
| [SUB_SHORTCUT_ENTRYRULECASES_0900](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets#L918>) | `testEntryRuleCases0009`<br>`com.samples.shortcut_EntryRuleCases_0009` | other sources have expected counts |
| [SUB_SHORTCUT_ENTRYRULECASES_1000](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets#L934>) | `testEntryRuleCases0010`<br>`com.samples.shortcut_EntryRuleCases_0010` | rule lines match rule table |
| [SUB_SHORTCUT_ENTRYRULECASES_1100](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets#L950>) | `testEntryRuleCases0011`<br>`com.samples.shortcut_EntryRuleCases_0011` | source counts are ordered |
| [SUB_SHORTCUT_PARSEURICASES_0100](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets#L971>) | `testParseUriCases0001`<br>`com.samples.shortcut_ParseUriCases_0001` | uri without query keeps whole text |
| [SUB_SHORTCUT_PARSEURICASES_0200](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets#L987>) | `testParseUriCases0002`<br>`com.samples.shortcut_ParseUriCases_0002` | uri splits into pairs |
| [SUB_SHORTCUT_PARSEURICASES_0300](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets>)（源码第1004行） | `testParseUriCases0003`<br>`com.samples.shortcut_ParseUriCases_0003` | empty pairs are skipped |
| [SUB_SHORTCUT_PARSEURICASES_0400](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets>)（源码第1020行） | `testParseUriCases0004`<br>`com.samples.shortcut_ParseUriCases_0004` | pairs without key are skipped |
| [SUB_SHORTCUT_PARSEURICASES_0500](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets>)（源码第1036行） | `testParseUriCases0005`<br>`com.samples.shortcut_ParseUriCases_0005` | values are decoded |
| [SUB_SHORTCUT_PARSEURICASES_0600](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets>)（源码第1053行） | `testParseUriCases0006`<br>`com.samples.shortcut_ParseUriCases_0006` | value may contain equals |
| [SUB_SHORTCUT_PARSEURICASES_0700](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets>)（源码第1069行） | `testParseUriCases0007`<br>`com.samples.shortcut_ParseUriCases_0007` | launch request text joins pairs |
| [SUB_SHORTCUT_RESOLVEENTRYCASES_0100](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets>)（源码第1089行） | `testResolveEntryCases0001`<br>`com.samples.shortcut_ResolveEntryCases_0001` | shortcut uri hits exact rule |
| [SUB_SHORTCUT_RESOLVEENTRYCASES_0200](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets>)（源码第1106行） | `testResolveEntryCases0002`<br>`com.samples.shortcut_ResolveEntryCases_0002` | unknown shortcut falls back to rule center |
| [SUB_SHORTCUT_RESOLVEENTRYCASES_0300](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets>)（源码第1123行） | `testResolveEntryCases0003`<br>`com.samples.shortcut_ResolveEntryCases_0003` | deeplink hits todo rule |
| [SUB_SHORTCUT_RESOLVEENTRYCASES_0400](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets>)（源码第1139行） | `testResolveEntryCases0004`<br>`com.samples.shortcut_ResolveEntryCases_0004` | unknown deeplink falls back to call log |
| [SUB_SHORTCUT_RESOLVEENTRYCASES_0500](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets>)（源码第1155行） | `testResolveEntryCases0005`<br>`com.samples.shortcut_ResolveEntryCases_0005` | unknown source uses last resort |
| [SUB_SHORTCUT_RESOLVEENTRYCASES_0600](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets>)（源码第1172行） | `testResolveEntryCases0006`<br>`com.samples.shortcut_ResolveEntryCases_0006` | widget uri hits note rule |
| [SUB_SHORTCUT_RESOLVEENTRYCASES_0700](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets>)（源码第1188行） | `testResolveEntryCases0007`<br>`com.samples.shortcut_ResolveEntryCases_0007` | resume without draft is blocked |
| [SUB_SHORTCUT_RESOLVEENTRYCASES_0800](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets>)（源码第1205行） | `testResolveEntryCases0008`<br>`com.samples.shortcut_ResolveEntryCases_0008` | resume with draft passes |
| [SUB_SHORTCUT_RESOLVEENTRYCASES_0900](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets>)（源码第1223行） | `testResolveEntryCases0009`<br>`com.samples.shortcut_ResolveEntryCases_0009` | notification without todo is blocked |
| [SUB_SHORTCUT_RESOLVEENTRYCASES_1000](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets>)（源码第1242行） | `testResolveEntryCases0010`<br>`com.samples.shortcut_ResolveEntryCases_0010` | notification requires login |
| [SUB_SHORTCUT_RESOLVEENTRYCASES_1100](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets>)（源码第1260行） | `testResolveEntryCases0011`<br>`com.samples.shortcut_ResolveEntryCases_0011` | notification with login and todo passes |
| [SUB_SHORTCUT_RESOLVEENTRYCASES_1200](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets>)（源码第1279行） | `testResolveEntryCases0012`<br>`com.samples.shortcut_ResolveEntryCases_0012` | extra keys are reported for parameterless rule |
| [SUB_SHORTCUT_RESOLVEENTRYCASES_1300](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets>)（源码第1297行） | `testResolveEntryCases0013`<br>`com.samples.shortcut_ResolveEntryCases_0013` | extra keys are tolerated when rule has required keys |
| [SUB_SHORTCUT_RESOLVEENTRYCASES_1400](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets>)（源码第1317行） | `testResolveEntryCases0014`<br>`com.samples.shortcut_ResolveEntryCases_0014` | fallback flag uses priority threshold |
| [SUB_SHORTCUT_RESOLVEENTRYCASES_1500](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets>)（源码第1334行） | `testResolveEntryCases0015`<br>`com.samples.shortcut_ResolveEntryCases_0015` | plan text explains ready state |
| [SUB_SHORTCUT_RESOLVEENTRYCASES_1600](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets>)（源码第1351行） | `testResolveEntryCases0016`<br>`com.samples.shortcut_ResolveEntryCases_0016` | plan text explains pending state |
| [SUB_SHORTCUT_RESOLVEENTRYCASES_1700](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets>)（源码第1368行） | `testResolveEntryCases0017`<br>`com.samples.shortcut_ResolveEntryCases_0017` | plan text explains unresolved state |
| [SUB_SHORTCUT_RESOLVEENTRYCASES_1800](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets>)（源码第1386行） | `testResolveEntryCases0018`<br>`com.samples.shortcut_ResolveEntryCases_0018` | plan ok requires all three facts |
| [SUB_SHORTCUT_RESOLVEENTRYCASES_1900](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets>)（源码第1407行） | `testResolveEntryCases0019`<br>`com.samples.shortcut_ResolveEntryCases_0019` | matched rule is stable for repeated parse |
| [SUB_SHORTCUT_ENTRYAUDITCASES_0100](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets>)（源码第1426行） | `testEntryAuditCases0001`<br>`com.samples.shortcut_EntryAuditCases_0001` | launch table is self consistent |
| [SUB_SHORTCUT_ENTRYAUDITCASES_0200](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets>)（源码第1442行） | `testEntryAuditCases0002`<br>`com.samples.shortcut_EntryAuditCases_0002` | every rule has route and description |
| [SUB_SHORTCUT_ENTRYAUDITCASES_0300](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets>)（源码第1460行） | `testEntryAuditCases0003`<br>`com.samples.shortcut_EntryAuditCases_0003` | fallback rules carry no required keys |
| [SUB_SHORTCUT_ENTRYAUDITCASES_0400](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets>)（源码第1478行） | `testEntryAuditCases0004`<br>`com.samples.shortcut_EntryAuditCases_0004` | every source has at least one rule |
| [SUB_SHORTCUT_ENTRYAUDITCASES_0500](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets>)（源码第1494行） | `testEntryAuditCases0005`<br>`com.samples.shortcut_EntryAuditCases_0005` | source lines match counts |
| [SUB_SHORTCUT_ENTRYAUDITCASES_0600](<entry/src/ohosTest/ets/test/EntryIntentMatrixCases.test.ets>)（源码第1511行） | `testEntryAuditCases0006`<br>`com.samples.shortcut_EntryAuditCases_0006` | rule targets exist in route table |

### [FilterCollectionDiffCases.test.ets](<entry/src/ohosTest/ets/test/FilterCollectionDiffCases.test.ets>) — 30条

对应场景：S02、S05。原名称保留注释映射，运行名遵循统一身份规则。

| 原编号 / 源码定位 | 原名称 / 规范运行名 | 覆盖点 |
|---|---|---|
| [SUB_SHORTCUT_FILTERCHAINMATRIXCASES_0100](<entry/src/ohosTest/ets/test/FilterCollectionDiffCases.test.ets#L65>) | `testFilterChainMatrixCases0001`<br>`com.samples.shortcut_FilterChainMatrixCases_0001` | empty chain matches everything |
| [SUB_SHORTCUT_FILTERCHAINMATRIXCASES_0200](<entry/src/ohosTest/ets/test/FilterCollectionDiffCases.test.ets#L81>) | `testFilterChainMatrixCases0002`<br>`com.samples.shortcut_FilterChainMatrixCases_0002` | contains matches substring |
| [SUB_SHORTCUT_FILTERCHAINMATRIXCASES_0300](<entry/src/ohosTest/ets/test/FilterCollectionDiffCases.test.ets#L97>) | `testFilterChainMatrixCases0003`<br>`com.samples.shortcut_FilterChainMatrixCases_0003` | negate inverts result |
| [SUB_SHORTCUT_FILTERCHAINMATRIXCASES_0400](<entry/src/ohosTest/ets/test/FilterCollectionDiffCases.test.ets>)（源码第115行） | `testFilterChainMatrixCases0004`<br>`com.samples.shortcut_FilterChainMatrixCases_0004` | multiple nodes narrow the result |
| [SUB_SHORTCUT_FILTERCHAINMATRIXCASES_0500](<entry/src/ohosTest/ets/test/FilterCollectionDiffCases.test.ets>)（源码第138行） | `testFilterChainMatrixCases0005`<br>`com.samples.shortcut_FilterChainMatrixCases_0005` | apply chain filters list |
| [SUB_SHORTCUT_FILTERCHAINMATRIXCASES_0600](<entry/src/ohosTest/ets/test/FilterCollectionDiffCases.test.ets>)（源码第160行） | `testFilterChainMatrixCases0006`<br>`com.samples.shortcut_FilterChainMatrixCases_0006` | apply chain keeps order |
| [SUB_SHORTCUT_FILTERCHAINMATRIXCASES_0700](<entry/src/ohosTest/ets/test/FilterCollectionDiffCases.test.ets>)（源码第179行） | `testFilterChainMatrixCases0007`<br>`com.samples.shortcut_FilterChainMatrixCases_0007` | equality operator is exact |
| [SUB_SHORTCUT_FILTERCHAINMATRIXCASES_0800](<entry/src/ohosTest/ets/test/FilterCollectionDiffCases.test.ets>)（源码第197行） | `testFilterChainMatrixCases0008`<br>`com.samples.shortcut_FilterChainMatrixCases_0008` | operator labels are distinct |
| [SUB_SHORTCUT_FILTERCHAINMATRIXCASES_0900](<entry/src/ohosTest/ets/test/FilterCollectionDiffCases.test.ets#L216>) | `testFilterChainMatrixCases0009`<br>`com.samples.shortcut_FilterChainMatrixCases_0009` | field labels are distinct |
| [SUB_SHORTCUT_FILTERCHAINMATRIXCASES_1100](<entry/src/ohosTest/ets/test/FilterCollectionDiffCases.test.ets#L234>) | `testFilterChainMatrixCases0011`<br>`com.samples.shortcut_FilterChainMatrixCases_0011` | tag filter matches exact tag |
| [SUB_SHORTCUT_FILTERCHAINMATRIXCASES_1200](<entry/src/ohosTest/ets/test/FilterCollectionDiffCases.test.ets#L251>) | `testFilterChainMatrixCases0012`<br>`com.samples.shortcut_FilterChainMatrixCases_0012` | chain with negated node excludes matches |
| [SUB_SHORTCUT_COLLECTIONGOVERNANCECASES_0100](<entry/src/ohosTest/ets/test/FilterCollectionDiffCases.test.ets#L274>) | `testCollectionGovernanceCases0001`<br>`com.samples.shortcut_CollectionGovernanceCases_0001` | rule table is well formed |
| [SUB_SHORTCUT_COLLECTIONGOVERNANCECASES_0200](<entry/src/ohosTest/ets/test/FilterCollectionDiffCases.test.ets#L291>) | `testCollectionGovernanceCases0002`<br>`com.samples.shortcut_CollectionGovernanceCases_0002` | every rule is reachable |
| [SUB_SHORTCUT_COLLECTIONGOVERNANCECASES_0300](<entry/src/ohosTest/ets/test/FilterCollectionDiffCases.test.ets#L314>) | `testCollectionGovernanceCases0003`<br>`com.samples.shortcut_CollectionGovernanceCases_0003` | kind partition covers table |
| [SUB_SHORTCUT_COLLECTIONGOVERNANCECASES_0500](<entry/src/ohosTest/ets/test/FilterCollectionDiffCases.test.ets#L336>) | `testCollectionGovernanceCases0005`<br>`com.samples.shortcut_CollectionGovernanceCases_0005` | action labels are distinct |
| [SUB_SHORTCUT_COLLECTIONGOVERNANCECASES_0600](<entry/src/ohosTest/ets/test/FilterCollectionDiffCases.test.ets#L361>) | `testCollectionGovernanceCases0006`<br>`com.samples.shortcut_CollectionGovernanceCases_0006` | destructive actions require confirmation |
| [SUB_SHORTCUT_COLLECTIONGOVERNANCECASES_0700](<entry/src/ohosTest/ets/test/FilterCollectionDiffCases.test.ets#L380>) | `testCollectionGovernanceCases0007`<br>`com.samples.shortcut_CollectionGovernanceCases_0007` | non destructive actions need no confirmation |
| [SUB_SHORTCUT_COLLECTIONGOVERNANCECASES_0800](<entry/src/ohosTest/ets/test/FilterCollectionDiffCases.test.ets#L396>) | `testCollectionGovernanceCases0008`<br>`com.samples.shortcut_CollectionGovernanceCases_0008` | severity levels are ordered by presence |
| [SUB_SHORTCUT_COLLECTIONGOVERNANCECASES_0900](<entry/src/ohosTest/ets/test/FilterCollectionDiffCases.test.ets#L414>) | `testCollectionGovernanceCases0009`<br>`com.samples.shortcut_CollectionGovernanceCases_0009` | thresholds are non negative |
| [SUB_SHORTCUT_COLLECTIONGOVERNANCECASES_1000](<entry/src/ohosTest/ets/test/FilterCollectionDiffCases.test.ets#L431>) | `testCollectionGovernanceCases0010`<br>`com.samples.shortcut_CollectionGovernanceCases_0010` | collection item defaults are valid |
| [SUB_SHORTCUT_TEXTDIFFMATRIXCASES_0100](<entry/src/ohosTest/ets/test/FilterCollectionDiffCases.test.ets#L451>) | `testTextDiffMatrixCases0001`<br>`com.samples.shortcut_TextDiffMatrixCases_0001` | identical text has no changes |
| [SUB_SHORTCUT_TEXTDIFFMATRIXCASES_0200](<entry/src/ohosTest/ets/test/FilterCollectionDiffCases.test.ets#L468>) | `testTextDiffMatrixCases0002`<br>`com.samples.shortcut_TextDiffMatrixCases_0002` | added line is counted |
| [SUB_SHORTCUT_TEXTDIFFMATRIXCASES_0300](<entry/src/ohosTest/ets/test/FilterCollectionDiffCases.test.ets#L485>) | `testTextDiffMatrixCases0003`<br>`com.samples.shortcut_TextDiffMatrixCases_0003` | removed line is counted |
| [SUB_SHORTCUT_TEXTDIFFMATRIXCASES_0400](<entry/src/ohosTest/ets/test/FilterCollectionDiffCases.test.ets#L502>) | `testTextDiffMatrixCases0004`<br>`com.samples.shortcut_TextDiffMatrixCases_0004` | replacement counts both sides |
| [SUB_SHORTCUT_TEXTDIFFMATRIXCASES_0500](<entry/src/ohosTest/ets/test/FilterCollectionDiffCases.test.ets#L519>) | `testTextDiffMatrixCases0005`<br>`com.samples.shortcut_TextDiffMatrixCases_0005` | empty to content counts additions |
| [SUB_SHORTCUT_TEXTDIFFMATRIXCASES_0600](<entry/src/ohosTest/ets/test/FilterCollectionDiffCases.test.ets#L536>) | `testTextDiffMatrixCases0006`<br>`com.samples.shortcut_TextDiffMatrixCases_0006` | content to empty counts removals |
| [SUB_SHORTCUT_TEXTDIFFMATRIXCASES_0700](<entry/src/ohosTest/ets/test/FilterCollectionDiffCases.test.ets#L553>) | `testTextDiffMatrixCases0007`<br>`com.samples.shortcut_TextDiffMatrixCases_0007` | both empty are identical |
| [SUB_SHORTCUT_TEXTDIFFMATRIXCASES_0800](<entry/src/ohosTest/ets/test/FilterCollectionDiffCases.test.ets#L570>) | `testTextDiffMatrixCases0008`<br>`com.samples.shortcut_TextDiffMatrixCases_0008` | line numbers follow content |
| [SUB_SHORTCUT_TEXTDIFFMATRIXCASES_1100](<entry/src/ohosTest/ets/test/FilterCollectionDiffCases.test.ets#L596>) | `testTextDiffMatrixCases0011`<br>`com.samples.shortcut_TextDiffMatrixCases_0011` | badge reflects summary |
| [SUB_SHORTCUT_TEXTDIFFMATRIXCASES_1200](<entry/src/ohosTest/ets/test/FilterCollectionDiffCases.test.ets#L616>) | `testTextDiffMatrixCases0012`<br>`com.samples.shortcut_TextDiffMatrixCases_0012` | summary totals match line count |

### [LaunchCoverage.test.ets](<entry/src/ohosTest/ets/test/LaunchCoverage.test.ets>) — 5条

对应场景：S08。原名称保留注释映射，运行名遵循统一身份规则。

| 原编号 / 源码定位 | 原名称 / 规范运行名 | 覆盖点 |
|---|---|---|
| [SUB_SHORTCUT_LAUNCHCOVERAGE_0100](<entry/src/ohosTest/ets/test/LaunchCoverage.test.ets#L26>) | `testLaunchCoverage0001`<br>`com.samples.shortcut_LaunchCoverage_0001` | unrelated parameters are normal but orphan filter rejects |
| [SUB_SHORTCUT_LAUNCHCOVERAGE_0200](<entry/src/ohosTest/ets/test/LaunchCoverage.test.ets#L52>) | `testLaunchCoverage0002`<br>`com.samples.shortcut_LaunchCoverage_0002` | partial protocol fields reject with exact error category |
| [SUB_SHORTCUT_LAUNCHCOVERAGE_0300](<entry/src/ohosTest/ets/test/LaunchCoverage.test.ets#L70>) | `testLaunchCoverage0003`<br>`com.samples.shortcut_LaunchCoverage_0003` | protocol does not trim or ignore case |
| [SUB_SHORTCUT_LAUNCHCOVERAGE_0400](<entry/src/ohosTest/ets/test/LaunchCoverage.test.ets#L96>) | `testLaunchCoverage0004`<br>`com.samples.shortcut_LaunchCoverage_0004` | wrong runtime types and long unknown action never route |
| [SUB_SHORTCUT_LAUNCHCOVERAGE_0500](<entry/src/ohosTest/ets/test/LaunchCoverage.test.ets>)（源码第123行） | `testLaunchCoverage0005`<br>`com.samples.shortcut_LaunchCoverage_0005` | parsing is pure and each result is independent |

### [LaunchIntentCases.test.ets](<entry/src/ohosTest/ets/test/LaunchIntentCases.test.ets>) — 6条

对应场景：S08。原名称保留注释映射，运行名遵循统一身份规则。

| 原编号 / 源码定位 | 原名称 / 规范运行名 | 覆盖点 |
|---|---|---|
| [SUB_SHORTCUT_LAUNCHENTRYCASES_0100](<entry/src/ohosTest/ets/test/LaunchIntentCases.test.ets#L27>) | `testLaunchEntryCases0001`<br>`com.samples.shortcut_LaunchEntryCases_0001` | rule table is consistent |
| [SUB_SHORTCUT_LAUNCHENTRYCASES_0200](<entry/src/ohosTest/ets/test/LaunchIntentCases.test.ets#L52>) | `testLaunchEntryCases0002`<br>`com.samples.shortcut_LaunchEntryCases_0002` | source distribution |
| [SUB_SHORTCUT_LAUNCHENTRYCASES_0300](<entry/src/ohosTest/ets/test/LaunchIntentCases.test.ets#L75>) | `testLaunchEntryCases0003`<br>`com.samples.shortcut_LaunchEntryCases_0003` | parse uri extracts query |
| [SUB_SHORTCUT_LAUNCHENTRYCASES_0400](<entry/src/ohosTest/ets/test/LaunchIntentCases.test.ets>)（源码第101行） | `testLaunchEntryCases0004`<br>`com.samples.shortcut_LaunchEntryCases_0004` | shortcut resolution |
| [SUB_SHORTCUT_LAUNCHENTRYCASES_0500](<entry/src/ohosTest/ets/test/LaunchIntentCases.test.ets>)（源码第124行） | `testLaunchEntryCases0005`<br>`com.samples.shortcut_LaunchEntryCases_0005` | missing params and login are reported |
| [SUB_SHORTCUT_LAUNCHENTRYCASES_0600](<entry/src/ohosTest/ets/test/LaunchIntentCases.test.ets>)（源码第149行） | `testLaunchEntryCases0006`<br>`com.samples.shortcut_LaunchEntryCases_0006` | deeplink and unknown source |

### [LaunchRequest.test.ets](<entry/src/ohosTest/ets/test/LaunchRequest.test.ets>) — 1条

对应场景：S08。原名称保留注释映射，运行名遵循统一身份规则。

| 原编号 / 源码定位 | 原名称 / 规范运行名 | 覆盖点 |
|---|---|---|
| [SUB_SHORTCUT_LAUNCHREQUEST_0100](<entry/src/ohosTest/ets/test/LaunchRequest.test.ets#L30>) | `testLaunchRequest0001`<br>`com.samples.shortcut_LaunchRequest_0001` | launch parameters select pages and reject invalid values |

### [Localization.test.ets](<entry/src/ohosTest/ets/test/Localization.test.ets>) — 3条

对应场景：S09。原名称保留注释映射，运行名遵循统一身份规则。

| 原编号 / 源码定位 | 原名称 / 规范运行名 | 覆盖点 |
|---|---|---|
| [SUB_SHORTCUT_LOCALIZATION_0100](<entry/src/ohosTest/ets/test/Localization.test.ets#L26>) | `testShortcutLocalization0001`<br>`com.samples.shortcut_ShortcutLocalization_0001` | Without a resource provider, existing string APIs receive the English base text. |
| [SUB_SHORTCUT_LOCALIZATION_0200](<entry/src/ohosTest/ets/test/Localization.test.ets#L45>) | `testShortcutLocalization0002`<br>`com.samples.shortcut_ShortcutLocalization_0002` | A user argument containing placeholder syntax is substituted exactly once and preserved. |
| [SUB_SHORTCUT_LOCALIZATION_0300](<entry/src/ohosTest/ets/test/Localization.test.ets#L64>) | `testShortcutLocalization0003`<br>`com.samples.shortcut_ShortcutLocalization_0003` | Module-level feature titles resolve lazily; provider failure falls back without changing feature IDs. |

### [NativeCoverage.test.ets](<entry/src/ohosTest/ets/test/NativeCoverage.test.ets>) — 4条

对应场景：S06、S10。原名称保留注释映射，运行名遵循统一身份规则。

| 原编号 / 源码定位 | 原名称 / 规范运行名 | 覆盖点 |
|---|---|---|
| [SUB_SHORTCUT_SHORTCUTNATIVECOVERAGE_0100](<entry/src/ohosTest/ets/test/NativeCoverage.test.ets#L30>) | `testShortcutNativeCoverage0001`<br>`com.samples.shortcut_ShortcutNativeCoverage_0001` | native support and installed shortcut manifest are consistent |
| [SUB_SHORTCUT_SHORTCUTNATIVECOVERAGE_0200](<entry/src/ohosTest/ets/test/NativeCoverage.test.ets#L57>) | `testShortcutNativeCoverage0002`<br>`com.samples.shortcut_ShortcutNativeCoverage_0002` | native nonexistent id is rejected without changing real shortcuts |
| [SUB_SHORTCUT_SHORTCUTNATIVECOVERAGE_0300](<entry/src/ohosTest/ets/test/NativeCoverage.test.ets#L88>) | `testShortcutNativeCoverage0003`<br>`com.samples.shortcut_ShortcutNativeCoverage_0003` | production preferences adapter rejects write before read |
| [SUB_SHORTCUT_SHORTCUTNATIVECOVERAGE_0400](<entry/src/ohosTest/ets/test/NativeCoverage.test.ets>)（源码第115行） | `testShortcutNativeCoverage0004`<br>`com.samples.shortcut_ShortcutNativeCoverage_0004` | native preferences flush cache reload preserves test data |

### [NoteHistory.test.ets](<entry/src/ohosTest/ets/test/NoteHistory.test.ets>) — 14条

对应场景：S02。原名称保留注释映射，运行名遵循统一身份规则。

| 原编号 / 源码定位 | 原名称 / 规范运行名 | 覆盖点 |
|---|---|---|
| [SUB_SHORTCUT_NOTEEDITINGANDHISTORY_0100](<entry/src/ohosTest/ets/test/NoteHistory.test.ets#L26>) | `testNoteEditingAndHistory0001`<br>`com.samples.shortcut_NoteEditingAndHistory_0001` | edit saves revision and restores older version across reopen |
| [SUB_SHORTCUT_NOTEEDITINGANDHISTORY_0200](<entry/src/ohosTest/ets/test/NoteHistory.test.ets#L82>) | `testNoteEditingAndHistory0002`<br>`com.samples.shortcut_NoteEditingAndHistory_0002` | search filters notes and collections without touching storage |
| [SUB_SHORTCUT_NOTEEDITINGANDHISTORY_0300](<entry/src/ohosTest/ets/test/NoteHistory.test.ets>)（源码第129行） | `testNoteEditingAndHistory0003`<br>`com.samples.shortcut_NoteEditingAndHistory_0003` | editing guards dirty draft unchanged save and cancel |
| [SUB_SHORTCUT_NOTEEDITINGANDHISTORY_0400](<entry/src/ohosTest/ets/test/NoteHistory.test.ets>)（源码第173行） | `testNoteEditingAndHistory0004`<br>`com.samples.shortcut_NoteEditingAndHistory_0004` | invalid history rejects archive and delete removes revisions |
| [SUB_SHORTCUT_NOTEEDITINGANDHISTORY_0500](<entry/src/ohosTest/ets/test/NoteHistory.test.ets#L209>) | `testNoteEditingAndHistory0005`<br>`com.samples.shortcut_NoteEditingAndHistory_0005` | legacy archive migrates and history is bounded to one hundred |
| [SUB_SHORTCUT_NOTEEDITINGANDHISTORY_0600](<entry/src/ohosTest/ets/test/NoteHistory.test.ets#L250>) | `testNoteEditingAndHistory0006`<br>`com.samples.shortcut_NoteEditingAndHistory_0006` | leave confirmation saves existing note keeps draft and discards edits |
| [SUB_SHORTCUT_NOTEEDITINGANDHISTORY_0700](<entry/src/ohosTest/ets/test/NoteHistory.test.ets#L291>) | `testNoteEditingAndHistory0007`<br>`com.samples.shortcut_NoteEditingAndHistory_0007` | todo crud and filters respect daily limits |
| [SUB_SHORTCUT_NOTEEDITINGANDHISTORY_0800](<entry/src/ohosTest/ets/test/NoteHistory.test.ets#L334>) | `testNoteEditingAndHistory0008`<br>`com.samples.shortcut_NoteEditingAndHistory_0008` | favorites persist and compose with category search |
| [SUB_SHORTCUT_NOTEEDITINGANDHISTORY_0900](<entry/src/ohosTest/ets/test/NoteHistory.test.ets#L373>) | `testNoteEditingAndHistory0009`<br>`com.samples.shortcut_NoteEditingAndHistory_0009` | edit dirty uses original note and save protects independent draft |
| [SUB_SHORTCUT_NOTEEDITINGANDHISTORY_1000](<entry/src/ohosTest/ets/test/NoteHistory.test.ets#L412>) | `testNoteEditingAndHistory0010`<br>`com.samples.shortcut_NoteEditingAndHistory_0010` | clearing existing note editor preserves independent draft across reopen |
| [SUB_SHORTCUT_NOTEEDITINGANDHISTORY_1100](<entry/src/ohosTest/ets/test/NoteHistory.test.ets#L447>) | `testNoteEditingAndHistory0011`<br>`com.samples.shortcut_NoteEditingAndHistory_0011` | leave save failure keeps editing state for retry |
| [SUB_SHORTCUT_NOTEEDITINGANDHISTORY_1200](<entry/src/ohosTest/ets/test/NoteHistory.test.ets#L474>) | `testNoteEditingAndHistory0012`<br>`com.samples.shortcut_NoteEditingAndHistory_0012` | edit draft survives reopen |
| [SUB_SHORTCUT_NOTEEDITINGANDHISTORY_1300](<entry/src/ohosTest/ets/test/NoteHistory.test.ets#L509>) | `testNoteEditingAndHistory0013`<br>`com.samples.shortcut_NoteEditingAndHistory_0013` | edit draft keeps independent new draft |
| [SUB_SHORTCUT_NOTEEDITINGANDHISTORY_1400](<entry/src/ohosTest/ets/test/NoteHistory.test.ets#L545>) | `testNoteEditingAndHistory0014`<br>`com.samples.shortcut_NoteEditingAndHistory_0014` | cancel clears persisted edit draft |

### [NoteSaveTrashCases.test.ets](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets>) — 67条

对应场景：S02、S03。原名称保留注释映射，运行名遵循统一身份规则。

| 原编号 / 源码定位 | 原名称 / 规范运行名 | 覆盖点 |
|---|---|---|
| [SUB_SHORTCUT_SAVERULECASES_0100](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L38>) | `testSaveRuleCases0001`<br>`com.samples.shortcut_SaveRuleCases_0001` | rule table has ten entries |
| [SUB_SHORTCUT_SAVERULECASES_0200](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L56>) | `testSaveRuleCases0002`<br>`com.samples.shortcut_SaveRuleCases_0002` | rule describe joins facts |
| [SUB_SHORTCUT_SAVERULECASES_0300](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L76>) | `testSaveRuleCases0003`<br>`com.samples.shortcut_SaveRuleCases_0003` | outcome enum is closed |
| [SUB_SHORTCUT_SAVERULECASES_0400](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L92>) | `testSaveRuleCases0004`<br>`com.samples.shortcut_SaveRuleCases_0004` | every rule carries note |
| [SUB_SHORTCUT_SAVERULECASES_0500](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets>)（源码第109行） | `testSaveRuleCases0005`<br>`com.samples.shortcut_SaveRuleCases_0005` | blocking rules are listed |
| [SUB_SHORTCUT_SAVERULECASES_0600](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets>)（源码第129行） | `testSaveRuleCases0006`<br>`com.samples.shortcut_SaveRuleCases_0006` | outcome distribution is stable |
| [SUB_SHORTCUT_SAVERULECASES_0700](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets>)（源码第151行） | `testSaveRuleCases0007`<br>`com.samples.shortcut_SaveRuleCases_0007` | save lines match table |
| [SUB_SHORTCUT_SAVERULECASES_0800](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets>)（源码第167行） | `testSaveRuleCases0008`<br>`com.samples.shortcut_SaveRuleCases_0008` | save input defaults to no facts |
| [SUB_SHORTCUT_SAVEDECISIONCASES_0100](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets>)（源码第188行） | `testSaveDecisionCases0001`<br>`com.samples.shortcut_SaveDecisionCases_0001` | decision defaults are safe |
| [SUB_SHORTCUT_SAVEDECISIONCASES_0200](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L205>) | `testSaveDecisionCases0002`<br>`com.samples.shortcut_SaveDecisionCases_0002` | writable only for safe |
| [SUB_SHORTCUT_SAVEDECISIONCASES_0300](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L221>) | `testSaveDecisionCases0003`<br>`com.samples.shortcut_SaveDecisionCases_0003` | decision describe joins facts |
| [SUB_SHORTCUT_SAVEDECISIONCASES_0400](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L239>) | `testSaveDecisionCases0004`<br>`com.samples.shortcut_SaveDecisionCases_0004` | identical revisions are safe |
| [SUB_SHORTCUT_SAVEDECISIONCASES_0500](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L256>) | `testSaveDecisionCases0005`<br>`com.samples.shortcut_SaveDecisionCases_0005` | local ahead is safe |
| [SUB_SHORTCUT_SAVEDECISIONCASES_0600](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L273>) | `testSaveDecisionCases0006`<br>`com.samples.shortcut_SaveDecisionCases_0006` | remote ahead needs confirmation |
| [SUB_SHORTCUT_SAVEDECISIONCASES_0700](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L290>) | `testSaveDecisionCases0007`<br>`com.samples.shortcut_SaveDecisionCases_0007` | converged revisions are safe |
| [SUB_SHORTCUT_SAVEDECISIONCASES_0800](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L306>) | `testSaveDecisionCases0008`<br>`com.samples.shortcut_SaveDecisionCases_0008` | diverged revisions branch |
| [SUB_SHORTCUT_SAVEDECISIONCASES_0900](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L323>) | `testSaveDecisionCases0009`<br>`com.samples.shortcut_SaveDecisionCases_0009` | remote below baseline needs confirm |
| [SUB_SHORTCUT_SAVEDECISIONCASES_1000](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L339>) | `testSaveDecisionCases0010`<br>`com.samples.shortcut_SaveDecisionCases_0010` | missing local revision blocks |
| [SUB_SHORTCUT_SAVEDECISIONCASES_1100](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L357>) | `testSaveDecisionCases0011`<br>`com.samples.shortcut_SaveDecisionCases_0011` | active recovery blocks |
| [SUB_SHORTCUT_SAVEDECISIONCASES_1200](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L375>) | `testSaveDecisionCases0012`<br>`com.samples.shortcut_SaveDecisionCases_0012` | trashed note blocks |
| [SUB_SHORTCUT_SAVEDECISIONCASES_1300](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L393>) | `testSaveDecisionCases0013`<br>`com.samples.shortcut_SaveDecisionCases_0013` | uncertain write needs confirm |
| [SUB_SHORTCUT_SAVEDECISIONCASES_1400](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L411>) | `testSaveDecisionCases0014`<br>`com.samples.shortcut_SaveDecisionCases_0014` | recovery beats every other block |
| [SUB_SHORTCUT_SAVEDECISIONCASES_1500](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L430>) | `testSaveDecisionCases0015`<br>`com.samples.shortcut_SaveDecisionCases_0015` | trash beats missing revision |
| [SUB_SHORTCUT_SAVEDECISIONCASES_1600](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L448>) | `testSaveDecisionCases0016`<br>`com.samples.shortcut_SaveDecisionCases_0016` | missing revision beats uncertain write |
| [SUB_SHORTCUT_SAVEDECISIONCASES_1700](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L465>) | `testSaveDecisionCases0017`<br>`com.samples.shortcut_SaveDecisionCases_0017` | uncertain write beats divergence |
| [SUB_SHORTCUT_SAVEDECISIONCASES_1800](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L484>) | `testSaveDecisionCases0018`<br>`com.samples.shortcut_SaveDecisionCases_0018` | rollback beats no change |
| [SUB_SHORTCUT_SAVEDECISIONCASES_1900](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L500>) | `testSaveDecisionCases0019`<br>`com.samples.shortcut_SaveDecisionCases_0019` | rollback beats divergence |
| [SUB_SHORTCUT_SAVEDECISIONCASES_2000](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L516>) | `testSaveDecisionCases0020`<br>`com.samples.shortcut_SaveDecisionCases_0020` | local rollback is not special |
| [SUB_SHORTCUT_SAVEDECISIONCASES_2100](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L532>) | `testSaveDecisionCases0021`<br>`com.samples.shortcut_SaveDecisionCases_0021` | zero baseline with local only is safe |
| [SUB_SHORTCUT_SAVEDECISIONCASES_2200](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L548>) | `testSaveDecisionCases0022`<br>`com.samples.shortcut_SaveDecisionCases_0022` | zero baseline cannot show remote only |
| [SUB_SHORTCUT_SAVEDECISIONCASES_2300](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L564>) | `testSaveDecisionCases0023`<br>`com.samples.shortcut_SaveDecisionCases_0023` | revisions are decision only |
| [SUB_SHORTCUT_SAVEDECISIONCASES_2400](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L581>) | `testSaveDecisionCases0024`<br>`com.samples.shortcut_SaveDecisionCases_0024` | advice for safe decision |
| [SUB_SHORTCUT_SAVEDECISIONCASES_2500](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L598>) | `testSaveDecisionCases0025`<br>`com.samples.shortcut_SaveDecisionCases_0025` | advice for branch prefers new note |
| [SUB_SHORTCUT_SAVEDECISIONCASES_2600](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L614>) | `testSaveDecisionCases0026`<br>`com.samples.shortcut_SaveDecisionCases_0026` | advice for confirm reuses message |
| [SUB_SHORTCUT_SAVEDECISIONCASES_2700](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L630>) | `testSaveDecisionCases0027`<br>`com.samples.shortcut_SaveDecisionCases_0027` | advice for blocked reuses message |
| [SUB_SHORTCUT_SAVEDECISIONCASES_2800](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L648>) | `testSaveDecisionCases0028`<br>`com.samples.shortcut_SaveDecisionCases_0028` | advice never empty |
| [SUB_SHORTCUT_TRASHENTRYCASES_0100](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L669>) | `testTrashEntryCases0001`<br>`com.samples.shortcut_TrashEntryCases_0001` | entry defaults to trashed |
| [SUB_SHORTCUT_TRASHENTRYCASES_0200](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L688>) | `testTrashEntryCases0002`<br>`com.samples.shortcut_TrashEntryCases_0002` | entry describe marks unrecorded origin |
| [SUB_SHORTCUT_TRASHENTRYCASES_0300](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L707>) | `testTrashEntryCases0003`<br>`com.samples.shortcut_TrashEntryCases_0003` | entry describe shows origin |
| [SUB_SHORTCUT_TRASHENTRYCASES_0400](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L726>) | `testTrashEntryCases0004`<br>`com.samples.shortcut_TrashEntryCases_0004` | restorable within retention |
| [SUB_SHORTCUT_TRASHENTRYCASES_0500](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L744>) | `testTrashEntryCases0005`<br>`com.samples.shortcut_TrashEntryCases_0005` | restorable rejects expired |
| [SUB_SHORTCUT_TRASHENTRYCASES_0600](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L761>) | `testTrashEntryCases0006`<br>`com.samples.shortcut_TrashEntryCases_0006` | restorable rejects non trashed |
| [SUB_SHORTCUT_TRASHENTRYCASES_0700](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L780>) | `testTrashEntryCases0007`<br>`com.samples.shortcut_TrashEntryCases_0007` | state enum is closed |
| [SUB_SHORTCUT_TRASHENTRYCASES_0800](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L795>) | `testTrashEntryCases0008`<br>`com.samples.shortcut_TrashEntryCases_0008` | retention is thirty days |
| [SUB_SHORTCUT_TRASHBINCASES_0100](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L813>) | `testTrashBinCases0001`<br>`com.samples.shortcut_TrashBinCases_0001` | trash adds entry |
| [SUB_SHORTCUT_TRASHBINCASES_0200](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L830>) | `testTrashBinCases0002`<br>`com.samples.shortcut_TrashBinCases_0002` | trash rejects empty id |
| [SUB_SHORTCUT_TRASHBINCASES_0300](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L847>) | `testTrashBinCases0003`<br>`com.samples.shortcut_TrashBinCases_0003` | trash updates existing entry |
| [SUB_SHORTCUT_TRASHBINCASES_0400](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L867>) | `testTrashBinCases0004`<br>`com.samples.shortcut_TrashBinCases_0004` | entry of miss returns undefined |
| [SUB_SHORTCUT_TRASHBINCASES_0500](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L884>) | `testTrashBinCases0005`<br>`com.samples.shortcut_TrashBinCases_0005` | trashed lists only trashed |
| [SUB_SHORTCUT_TRASHBINCASES_0600](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L904>) | `testTrashBinCases0006`<br>`com.samples.shortcut_TrashBinCases_0006` | restore within retention |
| [SUB_SHORTCUT_TRASHBINCASES_0700](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L922>) | `testTrashBinCases0007`<br>`com.samples.shortcut_TrashBinCases_0007` | restore after retention fails |
| [SUB_SHORTCUT_TRASHBINCASES_0800](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L939>) | `testTrashBinCases0008`<br>`com.samples.shortcut_TrashBinCases_0008` | restore rejects unknown id |
| [SUB_SHORTCUT_TRASHBINCASES_0900](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L956>) | `testTrashBinCases0009`<br>`com.samples.shortcut_TrashBinCases_0009` | restore rejects already active |
| [SUB_SHORTCUT_TRASHBINCASES_1000](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L975>) | `testTrashBinCases0010`<br>`com.samples.shortcut_TrashBinCases_0010` | purge removes only expired |
| [SUB_SHORTCUT_TRASHBINCASES_1100](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets#L995>) | `testTrashBinCases0011`<br>`com.samples.shortcut_TrashBinCases_0011` | purge keeps boundary entry |
| [SUB_SHORTCUT_TRASHBINCASES_1200](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets>)（源码第1012行） | `testTrashBinCases0012`<br>`com.samples.shortcut_TrashBinCases_0012` | purge skips active entries |
| [SUB_SHORTCUT_TRASHBINCASES_1300](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets>)（源码第1031行） | `testTrashBinCases0013`<br>`com.samples.shortcut_TrashBinCases_0013` | purged entry cannot be restored |
| [SUB_SHORTCUT_TRASHBINCASES_1400](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets>)（源码第1049行） | `testTrashBinCases0014`<br>`com.samples.shortcut_TrashBinCases_0014` | size counts purged entries |
| [SUB_SHORTCUT_TRASHBINCASES_1500](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets>)（源码第1069行） | `testTrashBinCases0015`<br>`com.samples.shortcut_TrashBinCases_0015` | retrash after restore works |
| [SUB_SHORTCUT_TRASHBINCASES_1600](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets>)（源码第1088行） | `testTrashBinCases0016`<br>`com.samples.shortcut_TrashBinCases_0016` | empty bin reports nothing |
| [SUB_SHORTCUT_TRASHLINESCASES_0100](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets>)（源码第1107行） | `testTrashLinesCases0001`<br>`com.samples.shortcut_TrashLinesCases_0001` | empty bin line |
| [SUB_SHORTCUT_TRASHLINESCASES_0200](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets>)（源码第1124行） | `testTrashLinesCases0002`<br>`com.samples.shortcut_TrashLinesCases_0002` | headline counts items |
| [SUB_SHORTCUT_TRASHLINESCASES_0300](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets>)（源码第1144行） | `testTrashLinesCases0003`<br>`com.samples.shortcut_TrashLinesCases_0003` | line shows restorable state |
| [SUB_SHORTCUT_TRASHLINESCASES_0400](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets>)（源码第1163行） | `testTrashLinesCases0004`<br>`com.samples.shortcut_TrashLinesCases_0004` | line marks expired entry |
| [SUB_SHORTCUT_TRASHLINESCASES_0500](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets>)（源码第1182行） | `testTrashLinesCases0005`<br>`com.samples.shortcut_TrashLinesCases_0005` | days are floored |
| [SUB_SHORTCUT_TRASHLINESCASES_0600](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets>)（源码第1199行） | `testTrashLinesCases0006`<br>`com.samples.shortcut_TrashLinesCases_0006` | lines skip restored entries |
| [SUB_SHORTCUT_TRASHLINESCASES_0700](<entry/src/ohosTest/ets/test/NoteSaveTrashCases.test.ets>)（源码第1219行） | `testTrashLinesCases0007`<br>`com.samples.shortcut_TrashLinesCases_0007` | lines skip purged entries |

### [RecycleBatchPreview.test.ets](<entry/src/ohosTest/ets/test/RecycleBatchPreview.test.ets>) — 17条

对应场景：S03。原名称保留注释映射，运行名遵循统一身份规则。

| 原编号 / 源码定位 | 原名称 / 规范运行名 | 覆盖点 |
|---|---|---|
| [SUB_SHORTCUT_RECYCLEBATCHPREVIEW_0100](<entry/src/ohosTest/ets/test/RecycleBatchPreview.test.ets#L31>) | `testShortcutRecycleBatchPreview0001`<br>`com.samples.shortcut_ShortcutRecycleBatchPreview_0001` | 预览给出真实目标历史与容量且不改盘面或活动列表 |
| [SUB_SHORTCUT_RECYCLEBATCHPREVIEW_0200](<entry/src/ohosTest/ets/test/RecycleBatchPreview.test.ets#L57>) | `testShortcutRecycleBatchPreview0002`<br>`com.samples.shortcut_ShortcutRecycleBatchPreview_0002` | 空选择及超过五十项选择整体无效不隐式截取目标 |
| [SUB_SHORTCUT_RECYCLEBATCHPREVIEW_0300](<entry/src/ohosTest/ets/test/RecycleBatchPreview.test.ets#L82>) | `testShortcutRecycleBatchPreview0003`<br>`com.samples.shortcut_ShortcutRecycleBatchPreview_0003` | 重复标识不会被静默去重后执行部分选择 |
| [SUB_SHORTCUT_RECYCLEBATCHPREVIEW_0400](<entry/src/ohosTest/ets/test/RecycleBatchPreview.test.ets>)（源码第104行） | `testShortcutRecycleBatchPreview0004`<br>`com.samples.shortcut_ShortcutRecycleBatchPreview_0004` | 有效项与缺失项混选时审查显示缺口且全体拒绝 |
| [SUB_SHORTCUT_RECYCLEBATCHPREVIEW_0500](<entry/src/ohosTest/ets/test/RecycleBatchPreview.test.ets>)（源码第125行） | `testShortcutRecycleBatchPreview0005`<br>`com.samples.shortcut_ShortcutRecycleBatchPreview_0005` | 已过期项阻止整批恢复但不阻止明确永久删除的预览 |
| [SUB_SHORTCUT_RECYCLEBATCHPREVIEW_0600](<entry/src/ohosTest/ets/test/RecycleBatchPreview.test.ets>)（源码第151行） | `testShortcutRecycleBatchPreview0006`<br>`com.samples.shortcut_ShortcutRecycleBatchPreview_0006` | 每项单独可恢复但总名额不足时整批不部分恢复 |
| [SUB_SHORTCUT_RECYCLEBATCHPREVIEW_0700](<entry/src/ohosTest/ets/test/RecycleBatchPreview.test.ets>)（源码第173行） | `testShortcutRecycleBatchPreview0007`<br>`com.samples.shortcut_ShortcutRecycleBatchPreview_0007` | 活动容量已满不影响批量永久删除回收项预览 |
| [SUB_SHORTCUT_RECYCLEBATCHPREVIEW_0800](<entry/src/ohosTest/ets/test/RecycleBatchPreview.test.ets>)（源码第195行） | `testShortcutRecycleBatchPreview0008`<br>`com.samples.shortcut_ShortcutRecycleBatchPreview_0008` | 修改调用者选择数组或返回预览不能改变私有确认目标 |
| [SUB_SHORTCUT_RECYCLEBATCHPREVIEW_0900](<entry/src/ohosTest/ets/test/RecycleBatchPreview.test.ets#L224>) | `testShortcutRecycleBatchPreview0009`<br>`com.samples.shortcut_ShortcutRecycleBatchPreview_0009` | 未加载和写入在途时预览不会授予可执行令牌 |
| [SUB_SHORTCUT_RECYCLEBATCHPREVIEW_1000](<entry/src/ohosTest/ets/test/RecycleBatchPreview.test.ets#L250>) | `testShortcutRecycleBatchPreview0010`<br>`com.samples.shortcut_ShortcutRecycleBatchPreview_0010` | 取消只销毁会话令牌不执行任何回收变更 |
| [SUB_SHORTCUT_RECYCLEBATCHPREVIEW_1100](<entry/src/ohosTest/ets/test/RecycleBatchPreview.test.ets#L271>) | `testShortcutRecycleBatchPreview0011`<br>`com.samples.shortcut_ShortcutRecycleBatchPreview_0011` | 新预览替换旧令牌且旧确认不能取消或执行新选择 |
| [SUB_SHORTCUT_RECYCLEBATCHPREVIEW_1200](<entry/src/ohosTest/ets/test/RecycleBatchPreview.test.ets#L294>) | `testShortcutRecycleBatchPreview0012`<br>`com.samples.shortcut_ShortcutRecycleBatchPreview_0012` | 收藏等独立根文档提交后，旧回收预览必须重新审查 |
| [SUB_SHORTCUT_RECYCLEBATCHPREVIEW_1300](<entry/src/ohosTest/ets/test/RecycleBatchPreview.test.ets#L317>) | `testShortcutRecycleBatchPreview0013`<br>`com.samples.shortcut_ShortcutRecycleBatchPreview_0013` | 未落盘但真实root新增今日分区时完整root绑定仍拒绝旧预览 |
| [SUB_SHORTCUT_RECYCLEBATCHPREVIEW_1400](<entry/src/ohosTest/ets/test/RecycleBatchPreview.test.ets#L341>) | `testShortcutRecycleBatchPreview0014`<br>`com.samples.shortcut_ShortcutRecycleBatchPreview_0014` | 相同盘面重新初始化也不能恢复上一会话预览令牌 |
| [SUB_SHORTCUT_RECYCLEBATCHPREVIEW_1500](<entry/src/ohosTest/ets/test/RecycleBatchPreview.test.ets#L364>) | `testShortcutRecycleBatchPreview0015`<br>`com.samples.shortcut_ShortcutRecycleBatchPreview_0015` | 另一隔离实例的令牌不能碰巧命中本实例相同root预览 |
| [SUB_SHORTCUT_RECYCLEBATCHPREVIEW_1600](<entry/src/ohosTest/ets/test/RecycleBatchPreview.test.ets#L389>) | `testShortcutRecycleBatchPreview0016`<br>`com.samples.shortcut_ShortcutRecycleBatchPreview_0016` | 已知写失败仍消费一次性令牌重试必须新预览 |
| [SUB_SHORTCUT_RECYCLEBATCHPREVIEW_1700](<entry/src/ohosTest/ets/test/RecycleBatchPreview.test.ets#L412>) | `testShortcutRecycleBatchPreview0017`<br>`com.samples.shortcut_ShortcutRecycleBatchPreview_0017` | 预览后跨过保留期即使root未变也需全体拒绝恢复 |

### [RecycleLifecycle.test.ets](<entry/src/ohosTest/ets/test/RecycleLifecycle.test.ets>) — 24条

对应场景：S03。原名称保留注释映射，运行名遵循统一身份规则。

| 原编号 / 源码定位 | 原名称 / 规范运行名 | 覆盖点 |
|---|---|---|
| [SUB_SHORTCUT_RECYCLELIFECYCLE_0100](<entry/src/ohosTest/ets/test/RecycleLifecycle.test.ets#L30>) | `testShortcutRecycleLifecycle0001`<br>`com.samples.shortcut_ShortcutRecycleLifecycle_0001` | 兼容删除入口真实软删除正文历史并在重开后恢复 |
| [SUB_SHORTCUT_RECYCLELIFECYCLE_0200](<entry/src/ohosTest/ets/test/RecycleLifecycle.test.ets#L59>) | `testShortcutRecycleLifecycle0002`<br>`com.samples.shortcut_ShortcutRecycleLifecycle_0002` | 当前目标有未处理编辑时默认删除拒绝且不触碰存储 |
| [SUB_SHORTCUT_RECYCLELIFECYCLE_0300](<entry/src/ohosTest/ets/test/RecycleLifecycle.test.ets#L80>) | `testShortcutRecycleLifecycle0003`<br>`com.samples.shortcut_ShortcutRecycleLifecycle_0003` | 保留修改并移入在一个存档里保留新正文和修改前版本 |
| [SUB_SHORTCUT_RECYCLELIFECYCLE_0400](<entry/src/ohosTest/ets/test/RecycleLifecycle.test.ets>)（源码第105行） | `testShortcutRecycleLifecycle0004`<br>`com.samples.shortcut_ShortcutRecycleLifecycle_0004` | 放弃目标编辑只回收正式正文而不删除独立新草稿 |
| [SUB_SHORTCUT_RECYCLELIFECYCLE_0500](<entry/src/ohosTest/ets/test/RecycleLifecycle.test.ets>)（源码第127行） | `testShortcutRecycleLifecycle0005`<br>`com.samples.shortcut_ShortcutRecycleLifecycle_0005` | 已保留且dirty为假的编辑仍需要明确处理选择 |
| [SUB_SHORTCUT_RECYCLELIFECYCLE_0600](<entry/src/ohosTest/ets/test/RecycleLifecycle.test.ets>)（源码第151行） | `testShortcutRecycleLifecycle0006`<br>`com.samples.shortcut_ShortcutRecycleLifecycle_0006` | 取消目标删除保留当前编辑和已保存历史不产生写入 |
| [SUB_SHORTCUT_RECYCLELIFECYCLE_0700](<entry/src/ohosTest/ets/test/RecycleLifecycle.test.ets>)（源码第172行） | `testShortcutRecycleLifecycle0007`<br>`com.samples.shortcut_ShortcutRecycleLifecycle_0007` | 删除非编辑目标便签不改变当前编辑的内存缓冲或持久草稿 |
| [SUB_SHORTCUT_RECYCLELIFECYCLE_0800](<entry/src/ohosTest/ets/test/RecycleLifecycle.test.ets>)（源码第196行） | `testShortcutRecycleLifecycle0008`<br>`com.samples.shortcut_ShortcutRecycleLifecycle_0008` | 保留空白编辑不能先移除正式便签或清除独立草稿 |
| [SUB_SHORTCUT_RECYCLELIFECYCLE_0900](<entry/src/ohosTest/ets/test/RecycleLifecycle.test.ets#L217>) | `testShortcutRecycleLifecycle0009`<br>`com.samples.shortcut_ShortcutRecycleLifecycle_0009` | 回收站已满时不自动淘汰未过期旧项且保留活动目标 |
| [SUB_SHORTCUT_RECYCLELIFECYCLE_1000](<entry/src/ohosTest/ets/test/RecycleLifecycle.test.ets#L240>) | `testShortcutRecycleLifecycle0010`<br>`com.samples.shortcut_ShortcutRecycleLifecycle_0010` | 活动便签满额时恢复失败保留回收项并可释放名额再恢复 |
| [SUB_SHORTCUT_RECYCLELIFECYCLE_1100](<entry/src/ohosTest/ets/test/RecycleLifecycle.test.ets#L263>) | `testShortcutRecycleLifecycle0011`<br>`com.samples.shortcut_ShortcutRecycleLifecycle_0011` | 恢复再删除生成新标识使旧永久删除确认不能命中新回收项 |
| [SUB_SHORTCUT_RECYCLELIFECYCLE_1200](<entry/src/ohosTest/ets/test/RecycleLifecycle.test.ets#L285>) | `testShortcutRecycleLifecycle0012`<br>`com.samples.shortcut_ShortcutRecycleLifecycle_0012` | 永久删除仅移除选定回收项和关联历史，保留剩余业务 |
| [SUB_SHORTCUT_RECYCLELIFECYCLE_1300](<entry/src/ohosTest/ets/test/RecycleLifecycle.test.ets#L309>) | `testShortcutRecycleLifecycle0013`<br>`com.samples.shortcut_ShortcutRecycleLifecycle_0013` | 保留期恰好三十天仍可恢复严格超过才禁止 |
| [SUB_SHORTCUT_RECYCLELIFECYCLE_1400](<entry/src/ohosTest/ets/test/RecycleLifecycle.test.ets#L333>) | `testShortcutRecycleLifecycle0014`<br>`com.samples.shortcut_ShortcutRecycleLifecycle_0014` | 设备时钟回拨不使未来删除时间的条目被误清理 |
| [SUB_SHORTCUT_RECYCLELIFECYCLE_1500](<entry/src/ohosTest/ets/test/RecycleLifecycle.test.ets#L356>) | `testShortcutRecycleLifecycle0015`<br>`com.samples.shortcut_ShortcutRecycleLifecycle_0015` | 显式清理只清过期集合且报告实际数量 |
| [SUB_SHORTCUT_RECYCLELIFECYCLE_1600](<entry/src/ohosTest/ets/test/RecycleLifecycle.test.ets#L382>) | `testShortcutRecycleLifecycle0016`<br>`com.samples.shortcut_ShortcutRecycleLifecycle_0016` | 新建便签不复用回收区仍占用的同一时钟标识 |
| [SUB_SHORTCUT_RECYCLELIFECYCLE_1700](<entry/src/ohosTest/ets/test/RecycleLifecycle.test.ets#L408>) | `testShortcutRecycleLifecycle0017`<br>`com.samples.shortcut_ShortcutRecycleLifecycle_0017` | 回收编号达到安全整数上限时保留当前数据而非重复旧标识 |
| [SUB_SHORTCUT_RECYCLELIFECYCLE_1800](<entry/src/ohosTest/ets/test/RecycleLifecycle.test.ets#L428>) | `testShortcutRecycleLifecycle0018`<br>`com.samples.shortcut_ShortcutRecycleLifecycle_0018` | 全局一百条历史淘汰最早修订但不删除回收正文 |
| [SUB_SHORTCUT_RECYCLELIFECYCLE_1900](<entry/src/ohosTest/ets/test/RecycleLifecycle.test.ets#L455>) | `testShortcutRecycleLifecycle0019`<br>`com.samples.shortcut_ShortcutRecycleLifecycle_0019` | 保留编辑的空标题按正文首行生成回收标题而保留完整多行正文 |
| [SUB_SHORTCUT_RECYCLELIFECYCLE_2000](<entry/src/ohosTest/ets/test/RecycleLifecycle.test.ets#L476>) | `testShortcutRecycleLifecycle0020`<br>`com.samples.shortcut_ShortcutRecycleLifecycle_0020` | 目标仅有持久编辑而当前编辑另一篇时保留正确目标缓冲 |
| [SUB_SHORTCUT_RECYCLELIFECYCLE_2100](<entry/src/ohosTest/ets/test/RecycleLifecycle.test.ets#L498>) | `testShortcutRecycleLifecycle0021`<br>`com.samples.shortcut_ShortcutRecycleLifecycle_0021` | 恢复回收项不覆盖当前未保存的新便签输入 |
| [SUB_SHORTCUT_RECYCLELIFECYCLE_2200](<entry/src/ohosTest/ets/test/RecycleLifecycle.test.ets#L520>) | `testShortcutRecycleLifecycle0022`<br>`com.samples.shortcut_ShortcutRecycleLifecycle_0022` | 新修订编号同时避开回收历史中仍保留的相同时间标识 |
| [SUB_SHORTCUT_RECYCLELIFECYCLE_2300](<entry/src/ohosTest/ets/test/RecycleLifecycle.test.ets#L544>) | `testShortcutRecycleLifecycle0023`<br>`com.samples.shortcut_ShortcutRecycleLifecycle_0023` | 不存在的目标和活动标识不能被当成回收操作令牌 |
| [SUB_SHORTCUT_RECYCLELIFECYCLE_2400](<entry/src/ohosTest/ets/test/RecycleLifecycle.test.ets#L566>) | `testShortcutRecycleLifecycle0024`<br>`com.samples.shortcut_ShortcutRecycleLifecycle_0024` | 初始读取失败时回收写入口全部安全拒绝不覆盖不可读原文 |

### [RecycleNativeQa.test.ets](<entry/src/ohosTest/ets/test/RecycleNativeQa.test.ets>) — 23条

对应场景：S03、S10。原名称保留注释映射，运行名遵循统一身份规则。

| 原编号 / 源码定位 | 原名称 / 规范运行名 | 覆盖点 |
|---|---|---|
| [SUB_SHORTCUT_RECYCLE_NATIVE_QA_0100](<entry/src/ohosTest/ets/test/RecycleNativeQa.test.ets#L32>) | `testRecycleNativeQa0001`<br>`com.samples.shortcut_RecycleNativeQa_0001` | 回收移动真实flush后重新打开同时保留另一便签与原便签修订 |
| [SUB_SHORTCUT_RECYCLE_NATIVE_QA_0200](<entry/src/ohosTest/ets/test/RecycleNativeQa.test.ets#L58>) | `testRecycleNativeQa0002`<br>`com.samples.shortcut_RecycleNativeQa_0002` | 回收后重开恢复正文及编辑历史并将恢复结果再次持久化 |
| [SUB_SHORTCUT_RECYCLE_NATIVE_QA_0300](<entry/src/ohosTest/ets/test/RecycleNativeQa.test.ets#L90>) | `testRecycleNativeQa0003`<br>`com.samples.shortcut_RecycleNativeQa_0003` | 永久删除仅清除指定回收项不删除另一回收项与收藏待办 |
| [SUB_SHORTCUT_RECYCLE_NATIVE_QA_0400](<entry/src/ohosTest/ets/test/RecycleNativeQa.test.ets>)（源码第119行） | `testRecycleNativeQa0004`<br>`com.samples.shortcut_RecycleNativeQa_0004` | 显式过期清理只删除超过期限的项且清理提交在重开后可见 |
| [SUB_SHORTCUT_RECYCLE_NATIVE_QA_0500](<entry/src/ohosTest/ets/test/RecycleNativeQa.test.ets>)（源码第150行） | `testRecycleNativeQa0005`<br>`com.samples.shortcut_RecycleNativeQa_0005` | 期限恰好相等仍可恢复并且时钟回退不会把新回收项判过期 |
| [SUB_SHORTCUT_RECYCLE_NATIVE_QA_0600](<entry/src/ohosTest/ets/test/RecycleNativeQa.test.ets>)（源码第179行） | `testRecycleNativeQa0006`<br>`com.samples.shortcut_RecycleNativeQa_0006` | 编辑便签选择保留修改再回收会落盘编辑内容并清除恢复编辑指针 |
| [SUB_SHORTCUT_RECYCLE_NATIVE_QA_0700](<entry/src/ohosTest/ets/test/RecycleNativeQa.test.ets#L206>) | `testRecycleNativeQa0007`<br>`com.samples.shortcut_RecycleNativeQa_0007` | 放弃编辑回收保留旧正文且重开不会复活已保留的编辑草稿 |
| [SUB_SHORTCUT_RECYCLE_NATIVE_QA_0800](<entry/src/ohosTest/ets/test/RecycleNativeQa.test.ets#L235>) | `testRecycleNativeQa0008`<br>`com.samples.shortcut_RecycleNativeQa_0008` | 取消回收不改变真实存档且未保存的编辑仍可继续保存 |
| [SUB_SHORTCUT_RECYCLE_NATIVE_QA_0900](<entry/src/ohosTest/ets/test/RecycleNativeQa.test.ets#L261>) | `testRecycleNativeQa0009`<br>`com.samples.shortcut_RecycleNativeQa_0009` | 合法旧版本读取不重写；无回收记录时执行回收原子写入完整新版本 |
| [SUB_SHORTCUT_RECYCLE_NATIVE_QA_1000](<entry/src/ohosTest/ets/test/RecycleNativeQa.test.ets#L290>) | `testRecycleNativeQa0010`<br>`com.samples.shortcut_RecycleNativeQa_0010` | 未来schema拒绝初始化和写入并原样保留直到合法存档被显式恢复 |
| [SUB_SHORTCUT_RECYCLE_NATIVE_QA_1100](<entry/src/ohosTest/ets/test/RecycleNativeQa.test.ets#L319>) | `testRecycleNativeQa0011`<br>`com.samples.shortcut_RecycleNativeQa_0011` | 原生workspace类型异常保留原值与同命名空间旁路键不静默重置 |
| [SUB_SHORTCUT_RECYCLE_NATIVE_QA_1200](<entry/src/ohosTest/ets/test/RecycleNativeQa.test.ets#L343>) | `testRecycleNativeQa0012`<br>`com.samples.shortcut_RecycleNativeQa_0012` | 活跃容量已满时恢复不丢回收项释放槽位后可真正恢复并重开 |
| [SUB_SHORTCUT_RECYCLE_NATIVE_QA_1300](<entry/src/ohosTest/ets/test/RecycleNativeQa.test.ets#L374>) | `testRecycleNativeQa0013`<br>`com.samples.shortcut_RecycleNativeQa_0013` | 回收容量满时移动不挤出旧项清理一个后可继续且token不复用 |
| [SUB_SHORTCUT_RECYCLE_NATIVE_QA_1400](<entry/src/ohosTest/ets/test/RecycleNativeQa.test.ets#L407>) | `testRecycleNativeQa0014`<br>`com.samples.shortcut_RecycleNativeQa_0014` | 两个专用命名空间回收清理互不影响且一方删除不影响另一方重开 |
| [SUB_SHORTCUT_RECYCLE_NATIVE_QA_1500](<entry/src/ohosTest/ets/test/RecycleNativeQa.test.ets#L436>) | `testRecycleNativeQa0015`<br>`com.samples.shortcut_RecycleNativeQa_0015` | reload重新绑定真实缓存实例后继续写入并保留同空间无关键 |
| [SUB_SHORTCUT_RECYCLE_NATIVE_QA_1600](<entry/src/ohosTest/ets/test/RecycleNativeQa.test.ets#L462>) | `testRecycleNativeQa0016`<br>`com.samples.shortcut_RecycleNativeQa_0016` | SDK真实拒绝超长值后正式adapter标记不确定且reload可继续有效写入 |
| [SUB_SHORTCUT_RECYCLE_NATIVE_QA_1700](<entry/src/ohosTest/ets/test/RecycleNativeQa.test.ets#L488>) | `testRecycleNativeQa0017`<br>`com.samples.shortcut_RecycleNativeQa_0017` | 超预算原文的新版本只读拒绝旧版本可读且实际回收后压实升级不丢正文 |
| [SUB_SHORTCUT_RECYCLE_NATIVE_QA_1800](<entry/src/ohosTest/ets/test/RecycleNativeQa.test.ets#L531>) | `testRecycleNativeQa0018`<br>`com.samples.shortcut_RecycleNativeQa_0018` | 活跃加回收历史共用容量实际编辑仅淘汰最老回收修订并持久保留全部便签 |
| [SUB_SHORTCUT_RECYCLE_NATIVE_QA_1900](<entry/src/ohosTest/ets/test/RecycleNativeQa.test.ets#L568>) | `testRecycleNativeQa0019`<br>`com.samples.shortcut_RecycleNativeQa_0019` | dispose不发布旧代次保存结果但实际原生写结算后新实例能恢复已提交正文 |
| [SUB_SHORTCUT_RECYCLE_NATIVE_QA_2000](<entry/src/ohosTest/ets/test/RecycleNativeQa.test.ets#L598>) | `testRecycleNativeQa0020`<br>`com.samples.shortcut_RecycleNativeQa_0020` | 真实 flush 后注入确认故障，只重读确认回收候选一次，不盲目重放或污染非目标业务 |
| [SUB_SHORTCUT_RECYCLE_NATIVE_QA_2100](<entry/src/ohosTest/ets/test/RecycleNativeQa.test.ets#L633>) | `testRecycleNativeQa0021`<br>`com.samples.shortcut_RecycleNativeQa_0021` | 提交后注入故障，遇不匹配的有效或损坏文档保持隔离，仅精确候选重现才恢复 |
| [SUB_SHORTCUT_RECYCLE_NATIVE_QA_2200](<entry/src/ohosTest/ets/test/RecycleNativeQa.test.ets#L681>) | `testRecycleNativeQa0022`<br>`com.samples.shortcut_RecycleNativeQa_0022` | 提交后故障与专用原文回退注入核对旧版本仅解除隔离保留草稿待显式重试 |
| [SUB_SHORTCUT_RECYCLE_NATIVE_QA_2300](<entry/src/ohosTest/ets/test/RecycleNativeQa.test.ets#L717>) | `testRecycleNativeQa0023`<br>`com.samples.shortcut_RecycleNativeQa_0023` | 活跃与回收项标识冲突的损坏存档整体拒绝不自作主张丢弃任意一方 |

### [RecycleRecovery.test.ets](<entry/src/ohosTest/ets/test/RecycleRecovery.test.ets>) — 16条

对应场景：S01、S03。原名称保留注释映射，运行名遵循统一身份规则。

| 原编号 / 源码定位 | 原名称 / 规范运行名 | 覆盖点 |
|---|---|---|
| [SUB_SHORTCUT_RECYCLERECOVERY_0100](<entry/src/ohosTest/ets/test/RecycleRecovery.test.ets#L32>) | `testShortcutRecycleRecovery0001`<br>`com.samples.shortcut_ShortcutRecycleRecovery_0001` | 已知写前失败不会移走目标正文或编辑缓冲 |
| [SUB_SHORTCUT_RECYCLERECOVERY_0200](<entry/src/ohosTest/ets/test/RecycleRecovery.test.ets#L55>) | `testShortcutRecycleRecovery0002`<br>`com.samples.shortcut_ShortcutRecycleRecovery_0002` | 写入未完成时不先清编辑成功后才整体移入 |
| [SUB_SHORTCUT_RECYCLERECOVERY_0300](<entry/src/ohosTest/ets/test/RecycleRecovery.test.ets#L81>) | `testShortcutRecycleRecovery0003`<br>`com.samples.shortcut_ShortcutRecycleRecovery_0003` | 恢复写前失败不从回收站移除且不创建活动副本 |
| [SUB_SHORTCUT_RECYCLERECOVERY_0400](<entry/src/ohosTest/ets/test/RecycleRecovery.test.ets>)（源码第102行） | `testShortcutRecycleRecovery0004`<br>`com.samples.shortcut_ShortcutRecycleRecovery_0004` | 永久删除写前失败保留原回收项及剩余历史 |
| [SUB_SHORTCUT_RECYCLERECOVERY_0500](<entry/src/ohosTest/ets/test/RecycleRecovery.test.ets>)（源码第123行） | `testShortcutRecycleRecovery0005`<br>`com.samples.shortcut_ShortcutRecycleRecovery_0005` | 过期清理写前失败不能报告已清数量且可显式重试 |
| [SUB_SHORTCUT_RECYCLERECOVERY_0600](<entry/src/ohosTest/ets/test/RecycleRecovery.test.ets>)（源码第149行） | `testShortcutRecycleRecovery0006`<br>`com.samples.shortcut_ShortcutRecycleRecovery_0006` | 写入已产生效果但响应失败时隔离内存并禁止盲目重放 |
| [SUB_SHORTCUT_RECYCLERECOVERY_0700](<entry/src/ohosTest/ets/test/RecycleRecovery.test.ets>)（源码第171行） | `testShortcutRecycleRecovery0007`<br>`com.samples.shortcut_ShortcutRecycleRecovery_0007` | 重新读取精确候选后才应用已确认的编辑移入 |
| [SUB_SHORTCUT_RECYCLERECOVERY_0800](<entry/src/ohosTest/ets/test/RecycleRecovery.test.ets>)（源码第197行） | `testShortcutRecycleRecovery0008`<br>`com.samples.shortcut_ShortcutRecycleRecovery_0008` | 核对确认写入未生效时保留原编辑并允许用户重新操作 |
| [SUB_SHORTCUT_RECYCLERECOVERY_0900](<entry/src/ohosTest/ets/test/RecycleRecovery.test.ets#L223>) | `testShortcutRecycleRecovery0009`<br>`com.samples.shortcut_ShortcutRecycleRecovery_0009` | 核对得到损坏原文仍保持隔离且不覆盖当前编辑 |
| [SUB_SHORTCUT_RECYCLERECOVERY_1000](<entry/src/ohosTest/ets/test/RecycleRecovery.test.ets#L245>) | `testShortcutRecycleRecovery0010`<br>`com.samples.shortcut_ShortcutRecycleRecovery_0010` | 核对第三方有效文档不能擅自认作当前提交候选或覆盖磁盘 |
| [SUB_SHORTCUT_RECYCLERECOVERY_1100](<entry/src/ohosTest/ets/test/RecycleRecovery.test.ets#L269>) | `testShortcutRecycleRecovery0011`<br>`com.samples.shortcut_ShortcutRecycleRecovery_0011` | 核对读取失败后可再读精确候选而不再次执行写操作 |
| [SUB_SHORTCUT_RECYCLERECOVERY_1200](<entry/src/ohosTest/ets/test/RecycleRecovery.test.ets#L292>) | `testShortcutRecycleRecovery0012`<br>`com.samples.shortcut_ShortcutRecycleRecovery_0012` | 同实例重初始化须等待旧物理写结束后再读取完整回收存档 |
| [SUB_SHORTCUT_RECYCLERECOVERY_1300](<entry/src/ohosTest/ets/test/RecycleRecovery.test.ets#L318>) | `testShortcutRecycleRecovery0013`<br>`com.samples.shortcut_ShortcutRecycleRecovery_0013` | 写操作在途时新的删除和恢复不会重复提交 |
| [SUB_SHORTCUT_RECYCLERECOVERY_1400](<entry/src/ohosTest/ets/test/RecycleRecovery.test.ets#L341>) | `testShortcutRecycleRecovery0014`<br>`com.samples.shortcut_ShortcutRecycleRecovery_0014` | 回收快照的嵌套正文和历史可修改但不能污染实际恢复数据 |
| [SUB_SHORTCUT_RECYCLERECOVERY_1500](<entry/src/ohosTest/ets/test/RecycleRecovery.test.ets#L365>) | `testShortcutRecycleRecovery0015`<br>`com.samples.shortcut_ShortcutRecycleRecovery_0015` | 收藏待办和独立草稿提交不能漏拷回收区且重开两侧均可用 |
| [SUB_SHORTCUT_RECYCLERECOVERY_1600](<entry/src/ohosTest/ets/test/RecycleRecovery.test.ets#L390>) | `testShortcutRecycleRecovery0016`<br>`com.samples.shortcut_ShortcutRecycleRecovery_0016` | 旧代次响应未知但已落盘时新代次从真实盘面恢复而不套用旧回调 |

### [RecycleSchema.test.ets](<entry/src/ohosTest/ets/test/RecycleSchema.test.ets>) — 12条

对应场景：S01、S03。原名称保留注释映射，运行名遵循统一身份规则。

| 原编号 / 源码定位 | 原名称 / 规范运行名 | 覆盖点 |
|---|---|---|
| [SUB_SHORTCUT_RECYCLESCHEMA_0100](<entry/src/ohosTest/ets/test/RecycleSchema.test.ets#L29>) | `testShortcutRecycleSchema0001`<br>`com.samples.shortcut_ShortcutRecycleSchema_0001` | 合法旧版读取不写盘，尚未更新的文档在实际修改时完整写入第二版 |
| [SUB_SHORTCUT_RECYCLESCHEMA_0200](<entry/src/ohosTest/ets/test/RecycleSchema.test.ets#L55>) | `testShortcutRecycleSchema0002`<br>`com.samples.shortcut_ShortcutRecycleSchema_0002` | 旧版含未知非空回收区时拒绝迁移而不静默丢弃 |
| [SUB_SHORTCUT_RECYCLESCHEMA_0300](<entry/src/ohosTest/ets/test/RecycleSchema.test.ets#L76>) | `testShortcutRecycleSchema0003`<br>`com.samples.shortcut_ShortcutRecycleSchema_0003` | 旧版缺省可选字段和空回收区仍以无回收项加载 |
| [SUB_SHORTCUT_RECYCLESCHEMA_0400](<entry/src/ohosTest/ets/test/RecycleSchema.test.ets#L97>) | `testShortcutRecycleSchema0004`<br>`com.samples.shortcut_ShortcutRecycleSchema_0004` | 第二版同时恢复活动编辑基线和独立回收历史 |
| [SUB_SHORTCUT_RECYCLESCHEMA_0500](<entry/src/ohosTest/ets/test/RecycleSchema.test.ets>)（源码第121行） | `testShortcutRecycleSchema0005`<br>`com.samples.shortcut_ShortcutRecycleSchema_0005` | 第二版缺少回收区或序号非法时不得当成合法旧版读取 |
| [SUB_SHORTCUT_RECYCLESCHEMA_0600](<entry/src/ohosTest/ets/test/RecycleSchema.test.ets>)（源码第146行） | `testShortcutRecycleSchema0006`<br>`com.samples.shortcut_ShortcutRecycleSchema_0006` | 活动回收联合便签标识及回收操作标识必须唯一 |
| [SUB_SHORTCUT_RECYCLESCHEMA_0700](<entry/src/ohosTest/ets/test/RecycleSchema.test.ets>)（源码第175行） | `testShortcutRecycleSchema0007`<br>`com.samples.shortcut_ShortcutRecycleSchema_0007` | 回收历史不能指向非所属便签或复用活动修订编号 |
| [SUB_SHORTCUT_RECYCLESCHEMA_0800](<entry/src/ohosTest/ets/test/RecycleSchema.test.ets#L202>) | `testShortcutRecycleSchema0008`<br>`com.samples.shortcut_ShortcutRecycleSchema_0008` | 合法五十回收项可读第五十一项则整体拒绝不截断 |
| [SUB_SHORTCUT_RECYCLESCHEMA_0900](<entry/src/ohosTest/ets/test/RecycleSchema.test.ets#L226>) | `testShortcutRecycleSchema0009`<br>`com.samples.shortcut_ShortcutRecycleSchema_0009` | 回收与活动历史合计超过一百条不能以分区各自未满绕过 |
| [SUB_SHORTCUT_RECYCLESCHEMA_1000](<entry/src/ohosTest/ets/test/RecycleSchema.test.ets#L250>) | `testShortcutRecycleSchema0010`<br>`com.samples.shortcut_ShortcutRecycleSchema_0010` | 回收标识不能越过持久序号或使用歧义前导零 |
| [SUB_SHORTCUT_RECYCLESCHEMA_1100](<entry/src/ohosTest/ets/test/RecycleSchema.test.ets#L272>) | `testShortcutRecycleSchema0011`<br>`com.samples.shortcut_ShortcutRecycleSchema_0011` | 合法旧版超新预算仍可只读而后续写入失败不删除原文 |
| [SUB_SHORTCUT_RECYCLESCHEMA_1200](<entry/src/ohosTest/ets/test/RecycleSchema.test.ets#L298>) | `testShortcutRecycleSchema0012`<br>`com.samples.shortcut_ShortcutRecycleSchema_0012` | 第二版超预算原文受保护且字节预算正确识别中文和表情 |

### [RecycleUiQa.test.ets](<entry/src/ohosTest/ets/test/RecycleUiQa.test.ets>) — 17条

对应场景：S03、S10。原名称保留注释映射，运行名遵循统一身份规则。

| 原编号 / 源码定位 | 原名称 / 规范运行名 | 覆盖点 |
|---|---|---|
| [SUB_SHORTCUT_RECYCLEUIQA_0100](<entry/src/ohosTest/ets/test/RecycleUiQa.test.ets#L30>) | `testRecycleUiQa0001`<br>`com.samples.shortcut_RecycleUiQa_0001` | The actual empty recycle panel reports its scope and keeps expired cleanup disabled without a write. |
| [SUB_SHORTCUT_RECYCLEUIQA_0200](<entry/src/ohosTest/ets/test/RecycleUiQa.test.ets#L47>) | `testRecycleUiQa0002`<br>`com.samples.shortcut_RecycleUiQa_0002` | The real restore button returns both the original note and its retained production revision history. |
| [SUB_SHORTCUT_RECYCLEUIQA_0300](<entry/src/ohosTest/ets/test/RecycleUiQa.test.ets#L68>) | `testRecycleUiQa0003`<br>`com.samples.shortcut_RecycleUiQa_0003` | Cancelling the real permanent-delete alert leaves its target and history recoverable |
| [SUB_SHORTCUT_RECYCLEUIQA_0400](<entry/src/ohosTest/ets/test/RecycleUiQa.test.ets#L89>) | `testRecycleUiQa0004`<br>`com.samples.shortcut_RecycleUiQa_0004` | Confirmed permanent deletion removes the actual recycled payload and history |
| [SUB_SHORTCUT_RECYCLEUIQA_0500](<entry/src/ohosTest/ets/test/RecycleUiQa.test.ets>)（源码第112行） | `testRecycleUiQa0005`<br>`com.samples.shortcut_RecycleUiQa_0005` | Mixed-expiry scope disables only the expired restore and actual cleanup retains the unexpired item. |
| [SUB_SHORTCUT_RECYCLEUIQA_0600](<entry/src/ohosTest/ets/test/RecycleUiQa.test.ets>)（源码第135行） | `testRecycleUiQa0006`<br>`com.samples.shortcut_RecycleUiQa_0006` | A suspended restore displays pending feedback and gates conflicting writes |
| [SUB_SHORTCUT_RECYCLEUIQA_0700](<entry/src/ohosTest/ets/test/RecycleUiQa.test.ets>)（源码第159行） | `testRecycleUiQa0007`<br>`com.samples.shortcut_RecycleUiQa_0007` | A known-before-effect write failure retains the real recycle card |
| [SUB_SHORTCUT_RECYCLEUIQA_0800](<entry/src/ohosTest/ets/test/RecycleUiQa.test.ets>)（源码第183行） | `testRecycleUiQa0008`<br>`com.samples.shortcut_RecycleUiQa_0008` | An uncertain applied restore requires the actual reread entry and never blindly repeats the write. |
| [SUB_SHORTCUT_RECYCLEUIQA_0900](<entry/src/ohosTest/ets/test/RecycleUiQa.test.ets#L208>) | `testRecycleUiQa0009`<br>`com.samples.shortcut_RecycleUiQa_0009` | A permanent-delete dialog whose item was independently restored is stale |
| [SUB_SHORTCUT_RECYCLEUIQA_1000](<entry/src/ohosTest/ets/test/RecycleUiQa.test.ets#L231>) | `testRecycleUiQa0010`<br>`com.samples.shortcut_RecycleUiQa_0010` | A failed initial read renders its retry view and recovers through that real entry |
| [SUB_SHORTCUT_RECYCLEUIQA_1100](<entry/src/ohosTest/ets/test/RecycleUiQa.test.ets#L255>) | `testRecycleUiQa0011`<br>`com.samples.shortcut_RecycleUiQa_0011` | The production close action invokes its supplied callback and unmounts the panel |
| [SUB_SHORTCUT_RECYCLEUIQA_1200](<entry/src/ohosTest/ets/test/RecycleUiQa.test.ets#L276>) | `testRecycleUiQa0012`<br>`com.samples.shortcut_RecycleUiQa_0012` | Actual active-note capacity gates restore, while releasing one genuine note slot |
| [SUB_SHORTCUT_RECYCLEUIQA_1300](<entry/src/ohosTest/ets/test/RecycleUiQa.test.ets#L303>) | `testRecycleUiQa0013`<br>`com.samples.shortcut_RecycleUiQa_0013` | Refresh observes a newly elapsed retention window and changes real restore/cleanup gates |
| [SUB_SHORTCUT_RECYCLEUIQA_1400](<entry/src/ohosTest/ets/test/RecycleUiQa.test.ets#L325>) | `testRecycleUiQa0014`<br>`com.samples.shortcut_RecycleUiQa_0014` | Actual multiselect creates a zero-I/O three-target restore preview |
| [SUB_SHORTCUT_RECYCLEUIQA_1500](<entry/src/ohosTest/ets/test/RecycleUiQa.test.ets#L352>) | `testRecycleUiQa0015`<br>`com.samples.shortcut_RecycleUiQa_0015` | Cancelling the real confirmation returns the original selection for review, |
| [SUB_SHORTCUT_RECYCLEUIQA_1600](<entry/src/ohosTest/ets/test/RecycleUiQa.test.ets#L383>) | `testRecycleUiQa0016`<br>`com.samples.shortcut_RecycleUiQa_0016` | Selecting expired and live rows rejects the whole restore; |
| [SUB_SHORTCUT_RECYCLEUIQA_1700](<entry/src/ohosTest/ets/test/RecycleUiQa.test.ets#L414>) | `testRecycleUiQa0017`<br>`com.samples.shortcut_RecycleUiQa_0017` | The production batch preview reports aggregate slot shortage |

### [RouteTodoMatrixCases.test.ets](<entry/src/ohosTest/ets/test/RouteTodoMatrixCases.test.ets>) — 25条

对应场景：S04、S08。原名称保留注释映射，运行名遵循统一身份规则。

| 原编号 / 源码定位 | 原名称 / 规范运行名 | 覆盖点 |
|---|---|---|
| [SUB_SHORTCUT_ENTRYROUTEMATRIXCASES_0100](<entry/src/ohosTest/ets/test/RouteTodoMatrixCases.test.ets#L51>) | `testEntryRouteMatrixCases0001`<br>`com.samples.shortcut_EntryRouteMatrixCases_0001` | route table is well formed |
| [SUB_SHORTCUT_ENTRYROUTEMATRIXCASES_0200](<entry/src/ohosTest/ets/test/RouteTodoMatrixCases.test.ets#L71>) | `testEntryRouteMatrixCases0002`<br>`com.samples.shortcut_EntryRouteMatrixCases_0002` | every route is reachable |
| [SUB_SHORTCUT_ENTRYROUTEMATRIXCASES_0300](<entry/src/ohosTest/ets/test/RouteTodoMatrixCases.test.ets#L94>) | `testEntryRouteMatrixCases0003`<br>`com.samples.shortcut_EntryRouteMatrixCases_0003` | page lookup is defined for known routes |
| [SUB_SHORTCUT_ENTRYROUTEMATRIXCASES_0400](<entry/src/ohosTest/ets/test/RouteTodoMatrixCases.test.ets>)（源码第113行） | `testEntryRouteMatrixCases0004`<br>`com.samples.shortcut_EntryRouteMatrixCases_0004` | unknown route is not in table |
| [SUB_SHORTCUT_ENTRYROUTEMATRIXCASES_0500](<entry/src/ohosTest/ets/test/RouteTodoMatrixCases.test.ets>)（源码第129行） | `testEntryRouteMatrixCases0005`<br>`com.samples.shortcut_EntryRouteMatrixCases_0005` | param names are unique within route |
| [SUB_SHORTCUT_ENTRYROUTEMATRIXCASES_0600](<entry/src/ohosTest/ets/test/RouteTodoMatrixCases.test.ets>)（源码第148行） | `testEntryRouteMatrixCases0006`<br>`com.samples.shortcut_EntryRouteMatrixCases_0006` | required params have fallback or are enforced |
| [SUB_SHORTCUT_ENTRYROUTEMATRIXCASES_0700](<entry/src/ohosTest/ets/test/RouteTodoMatrixCases.test.ets>)（源码第168行） | `testEntryRouteMatrixCases0007`<br>`com.samples.shortcut_EntryRouteMatrixCases_0007` | complete request resolves |
| [SUB_SHORTCUT_ENTRYROUTEMATRIXCASES_0800](<entry/src/ohosTest/ets/test/RouteTodoMatrixCases.test.ets>)（源码第190行） | `testEntryRouteMatrixCases0008`<br>`com.samples.shortcut_EntryRouteMatrixCases_0008` | unknown route request is rejected |
| [SUB_SHORTCUT_ENTRYROUTEMATRIXCASES_0900](<entry/src/ohosTest/ets/test/RouteTodoMatrixCases.test.ets#L211>) | `testEntryRouteMatrixCases0009`<br>`com.samples.shortcut_EntryRouteMatrixCases_0009` | missing required param is rejected |
| [SUB_SHORTCUT_ENTRYROUTEMATRIXCASES_1000](<entry/src/ohosTest/ets/test/RouteTodoMatrixCases.test.ets#L234>) | `testEntryRouteMatrixCases0010`<br>`com.samples.shortcut_EntryRouteMatrixCases_0010` | login requirement is enforced |
| [SUB_SHORTCUT_ENTRYROUTEMATRIXCASES_1100](<entry/src/ohosTest/ets/test/RouteTodoMatrixCases.test.ets#L255>) | `testEntryRouteMatrixCases0011`<br>`com.samples.shortcut_EntryRouteMatrixCases_0011` | open routes need no login |
| [SUB_SHORTCUT_ENTRYROUTEMATRIXCASES_1200](<entry/src/ohosTest/ets/test/RouteTodoMatrixCases.test.ets#L275>) | `testEntryRouteMatrixCases0012`<br>`com.samples.shortcut_EntryRouteMatrixCases_0012` | route descriptions are present |
| [SUB_SHORTCUT_TODORULESMATRIXCASES_0100](<entry/src/ohosTest/ets/test/RouteTodoMatrixCases.test.ets#L294>) | `testTodoRulesMatrixCases0001`<br>`com.samples.shortcut_TodoRulesMatrixCases_0001` | transition table is well formed |
| [SUB_SHORTCUT_TODORULESMATRIXCASES_0200](<entry/src/ohosTest/ets/test/RouteTodoMatrixCases.test.ets#L311>) | `testTodoRulesMatrixCases0002`<br>`com.samples.shortcut_TodoRulesMatrixCases_0002` | every transition has distinct state and event |
| [SUB_SHORTCUT_TODORULESMATRIXCASES_0300](<entry/src/ohosTest/ets/test/RouteTodoMatrixCases.test.ets#L329>) | `testTodoRulesMatrixCases0003`<br>`com.samples.shortcut_TodoRulesMatrixCases_0003` | table is deterministic |
| [SUB_SHORTCUT_TODORULESMATRIXCASES_0400](<entry/src/ohosTest/ets/test/RouteTodoMatrixCases.test.ets#L351>) | `testTodoRulesMatrixCases0004`<br>`com.samples.shortcut_TodoRulesMatrixCases_0004` | rule lookup returns same rule |
| [SUB_SHORTCUT_TODORULESMATRIXCASES_0600](<entry/src/ohosTest/ets/test/RouteTodoMatrixCases.test.ets#L373>) | `testTodoRulesMatrixCases0006`<br>`com.samples.shortcut_TodoRulesMatrixCases_0006` | events per state are non empty where defined |
| [SUB_SHORTCUT_TODORULESMATRIXCASES_0700](<entry/src/ohosTest/ets/test/RouteTodoMatrixCases.test.ets#L397>) | `testTodoRulesMatrixCases0007`<br>`com.samples.shortcut_TodoRulesMatrixCases_0007` | closed states are recognised |
| [SUB_SHORTCUT_TODORULESMATRIXCASES_0800](<entry/src/ohosTest/ets/test/RouteTodoMatrixCases.test.ets#L420>) | `testTodoRulesMatrixCases0008`<br>`com.samples.shortcut_TodoRulesMatrixCases_0008` | state labels are distinct |
| [SUB_SHORTCUT_TODORULESMATRIXCASES_0900](<entry/src/ohosTest/ets/test/RouteTodoMatrixCases.test.ets#L447>) | `testTodoRulesMatrixCases0009`<br>`com.samples.shortcut_TodoRulesMatrixCases_0009` | event labels are distinct |
| [SUB_SHORTCUT_TODORULESMATRIXCASES_1000](<entry/src/ohosTest/ets/test/RouteTodoMatrixCases.test.ets#L471>) | `testTodoRulesMatrixCases0010`<br>`com.samples.shortcut_TodoRulesMatrixCases_0010` | todo item defaults are valid |
| [SUB_SHORTCUT_TODORULESMATRIXCASES_1100](<entry/src/ohosTest/ets/test/RouteTodoMatrixCases.test.ets#L489>) | `testTodoRulesMatrixCases0011`<br>`com.samples.shortcut_TodoRulesMatrixCases_0011` | transition from closed state is limited |
| [SUB_SHORTCUT_TODORULESMATRIXCASES_1200](<entry/src/ohosTest/ets/test/RouteTodoMatrixCases.test.ets#L514>) | `testTodoRulesMatrixCases0012`<br>`com.samples.shortcut_TodoRulesMatrixCases_0012` | every target state has an inbound rule |
| [SUB_SHORTCUT_TODORULESMATRIXCASES_1300](<entry/src/ohosTest/ets/test/RouteTodoMatrixCases.test.ets#L543>) | `testTodoRulesMatrixCases0013`<br>`com.samples.shortcut_TodoRulesMatrixCases_0013` | event order is stable across calls |
| [SUB_SHORTCUT_TODORULESMATRIXCASES_1400](<entry/src/ohosTest/ets/test/RouteTodoMatrixCases.test.ets#L561>) | `testTodoRulesMatrixCases0014`<br>`com.samples.shortcut_TodoRulesMatrixCases_0014` | next state is pure |

### [SearchIndexDeep.test.ets](<entry/src/ohosTest/ets/test/SearchIndexDeep.test.ets>) — 20条

对应场景：S05。原名称保留注释映射，运行名遵循统一身份规则。

| 原编号 / 源码定位 | 原名称 / 规范运行名 | 覆盖点 |
|---|---|---|
| [SUB_SHORTCUT_SEARCHINDEXDEEP_0100](<entry/src/ohosTest/ets/test/SearchIndexDeep.test.ets#L36>) | `testSearchIndexDeep0001`<br>`com.samples.shortcut_SearchIndexDeep_0001` | Latin words split on punctuation and are lowercased |
| [SUB_SHORTCUT_SEARCHINDEXDEEP_0200](<entry/src/ohosTest/ets/test/SearchIndexDeep.test.ets#L51>) | `testSearchIndexDeep0002`<br>`com.samples.shortcut_SearchIndexDeep_0002` | CJK characters are tokenized one by one and mixed text keeps both kinds |
| [SUB_SHORTCUT_SEARCHINDEXDEEP_0300](<entry/src/ohosTest/ets/test/SearchIndexDeep.test.ets#L68>) | `testSearchIndexDeep0003`<br>`com.samples.shortcut_SearchIndexDeep_0003` | uniqueTokens keeps first-appearance order and removes duplicates |
| [SUB_SHORTCUT_SEARCHINDEXDEEP_0400](<entry/src/ohosTest/ets/test/SearchIndexDeep.test.ets#L84>) | `testSearchIndexDeep0004`<br>`com.samples.shortcut_SearchIndexDeep_0004` | 大小写不敏感的出现次数计算；连续重复字符按非重叠匹配计数，保留重叠边界覆盖 |
| [SUB_SHORTCUT_SEARCHINDEXDEEP_0500](<entry/src/ohosTest/ets/test/SearchIndexDeep.test.ets#L99>) | `testSearchIndexDeep0005`<br>`com.samples.shortcut_SearchIndexDeep_0005` | scoring weights title above tag above body |
| [SUB_SHORTCUT_SEARCHINDEXDEEP_0600](<entry/src/ohosTest/ets/test/SearchIndexDeep.test.ets>)（源码第118行） | `testSearchIndexDeep0006`<br>`com.samples.shortcut_SearchIndexDeep_0006` | empty token list and non-matching documents score zero |
| [SUB_SHORTCUT_SEARCHINDEXDEEP_0700](<entry/src/ohosTest/ets/test/SearchIndexDeep.test.ets>)（源码第132行） | `testSearchIndexDeep0007`<br>`com.samples.shortcut_SearchIndexDeep_0007` | recency bonus applies within one day and within one week only |
| [SUB_SHORTCUT_SEARCHINDEXDEEP_0800](<entry/src/ohosTest/ets/test/SearchIndexDeep.test.ets>)（源码第150行） | `testSearchIndexDeep0008`<br>`com.samples.shortcut_SearchIndexDeep_0008` | recency bonus is skipped when timestamps are unknown |
| [SUB_SHORTCUT_SEARCHINDEXDEEP_0900](<entry/src/ohosTest/ets/test/SearchIndexDeep.test.ets>)（源码第166行） | `testSearchIndexDeep0009`<br>`com.samples.shortcut_SearchIndexDeep_0009` | snippet returns empty for empty body and truncates without a hit |
| [SUB_SHORTCUT_SEARCHINDEXDEEP_1000](<entry/src/ohosTest/ets/test/SearchIndexDeep.test.ets>)（源码第183行） | `testSearchIndexDeep0010`<br>`com.samples.shortcut_SearchIndexDeep_0010` | snippet centres on the first hit and marks both truncation sides |
| [SUB_SHORTCUT_SEARCHINDEXDEEP_1100](<entry/src/ohosTest/ets/test/SearchIndexDeep.test.ets#L202>) | `testSearchIndexDeep0011`<br>`com.samples.shortcut_SearchIndexDeep_0011` | snippet width is never below the documented floor |
| [SUB_SHORTCUT_SEARCHINDEXDEEP_1200](<entry/src/ohosTest/ets/test/SearchIndexDeep.test.ets#L217>) | `testSearchIndexDeep0012`<br>`com.samples.shortcut_SearchIndexDeep_0012` | an empty query returns no hits instead of all documents |
| [SUB_SHORTCUT_SEARCHINDEXDEEP_1300](<entry/src/ohosTest/ets/test/SearchIndexDeep.test.ets#L232>) | `testSearchIndexDeep0013`<br>`com.samples.shortcut_SearchIndexDeep_0013` | search drops non-matching documents and orders by score then id |
| [SUB_SHORTCUT_SEARCHINDEXDEEP_1400](<entry/src/ohosTest/ets/test/SearchIndexDeep.test.ets#L255>) | `testSearchIndexDeep0014`<br>`com.samples.shortcut_SearchIndexDeep_0014` | the result limit truncates the ordered list |
| [SUB_SHORTCUT_SEARCHINDEXDEEP_1500](<entry/src/ohosTest/ets/test/SearchIndexDeep.test.ets#L272>) | `testSearchIndexDeep0015`<br>`com.samples.shortcut_SearchIndexDeep_0015` | hits carry title, score and snippet text |
| [SUB_SHORTCUT_SEARCHINDEXDEEP_1600](<entry/src/ohosTest/ets/test/SearchIndexDeep.test.ets#L290>) | `testSearchIndexDeep0016`<br>`com.samples.shortcut_SearchIndexDeep_0016` | highlight wraps every case-insensitive occurrence |
| [SUB_SHORTCUT_SEARCHINDEXDEEP_1700](<entry/src/ohosTest/ets/test/SearchIndexDeep.test.ets#L305>) | `testSearchIndexDeep0017`<br>`com.samples.shortcut_SearchIndexDeep_0017` | token summary reports the unique word list or an empty notice |
| [SUB_SHORTCUT_SEARCHINDEXDEEP_1800](<entry/src/ohosTest/ets/test/SearchIndexDeep.test.ets#L319>) | `testSearchIndexDeep0018`<br>`com.samples.shortcut_SearchIndexDeep_0018` | document audit flags empty ids, duplicates and title limits |
| [SUB_SHORTCUT_SEARCHINDEXDEEP_1900](<entry/src/ohosTest/ets/test/SearchIndexDeep.test.ets#L337>) | `testSearchIndexDeep0019`<br>`com.samples.shortcut_SearchIndexDeep_0019` | document audit rejects an overlong title |
| [SUB_SHORTCUT_SEARCHINDEXDEEP_2000](<entry/src/ohosTest/ets/test/SearchIndexDeep.test.ets#L352>) | `testSearchIndexDeep0020`<br>`com.samples.shortcut_SearchIndexDeep_0020` | document text and sample queries expose the documented summary |

### [ShortcutBatchWaveOne.test.ets](<entry/src/ohosTest/ets/test/ShortcutBatchWaveOne.test.ets>) — 20条

对应场景：S07。原名称保留注释映射，运行名遵循统一身份规则。

| 原编号 / 源码定位 | 原名称 / 规范运行名 | 覆盖点 |
|---|---|---|
| [SUB_SHORTCUT_BATCHWAVEONE_0100](<entry/src/ohosTest/ets/test/ShortcutBatchWaveOne.test.ets#L26>) | `testShortcutBatchWaveOne0001`<br>`com.samples.shortcut_ShortcutBatchWaveOne_0001` | 非法批量选择在读取和存档前拒绝 |
| [SUB_SHORTCUT_BATCHWAVEONE_0200](<entry/src/ohosTest/ets/test/ShortcutBatchWaveOne.test.ets#L50>) | `testShortcutBatchWaveOne0002`<br>`com.samples.shortcut_ShortcutBatchWaveOne_0002` | 预览重新查询发现选择入口消失时不保存半份计划 |
| [SUB_SHORTCUT_BATCHWAVEONE_0300](<entry/src/ohosTest/ets/test/ShortcutBatchWaveOne.test.ets#L70>) | `testShortcutBatchWaveOne0003`<br>`com.samples.shortcut_ShortcutBatchWaveOne_0003` | 批次编号到安全整数上限时不产生重复编号 |
| [SUB_SHORTCUT_BATCHWAVEONE_0400](<entry/src/ohosTest/ets/test/ShortcutBatchWaveOne.test.ets#L94>) | `testShortcutBatchWaveOne0004`<br>`com.samples.shortcut_ShortcutBatchWaveOne_0004` | 无已有预览时存档失败关闭执行能力且不触发系统修改 |
| [SUB_SHORTCUT_BATCHWAVEONE_0500](<entry/src/ohosTest/ets/test/ShortcutBatchWaveOne.test.ets>)（源码第116行） | `testShortcutBatchWaveOne0005`<br>`com.samples.shortcut_ShortcutBatchWaveOne_0005` | 取消预览撤销会话令牌但保留未执行历史 |
| [SUB_SHORTCUT_BATCHWAVEONE_0600](<entry/src/ohosTest/ets/test/ShortcutBatchWaveOne.test.ets>)（源码第139行） | `testShortcutBatchWaveOne0006`<br>`com.samples.shortcut_ShortcutBatchWaveOne_0006` | 新预览替换旧令牌且只执行新选择的目标 |
| [SUB_SHORTCUT_BATCHWAVEONE_0700](<entry/src/ohosTest/ets/test/ShortcutBatchWaveOne.test.ets>)（源码第164行） | `testShortcutBatchWaveOne0007`<br>`com.samples.shortcut_ShortcutBatchWaveOne_0007` | 预览新查询失败不改写已有批次历史 |
| [SUB_SHORTCUT_BATCHWAVEONE_0800](<entry/src/ohosTest/ets/test/ShortcutBatchWaveOne.test.ets>)（源码第186行） | `testShortcutBatchWaveOne0008`<br>`com.samples.shortcut_ShortcutBatchWaveOne_0008` | 批次读取失败可显式重读恢复而不自动重放系统设置 |
| [SUB_SHORTCUT_BATCHWAVEONE_0900](<entry/src/ohosTest/ets/test/ShortcutBatchWaveOne.test.ets#L212>) | `testShortcutBatchWaveOne0009`<br>`com.samples.shortcut_ShortcutBatchWaveOne_0009` | 旧会话批次读取迟到不覆盖重新初始化后的存档 |
| [SUB_SHORTCUT_BATCHWAVEONE_1000](<entry/src/ohosTest/ets/test/ShortcutBatchWaveOne.test.ets#L242>) | `testShortcutBatchWaveOne0010`<br>`com.samples.shortcut_ShortcutBatchWaveOne_0010` | 确认前核对失败消费令牌但不增加尝试次数 |
| [SUB_SHORTCUT_BATCHWAVEONE_1100](<entry/src/ohosTest/ets/test/ShortcutBatchWaveOne.test.ets#L265>) | `testShortcutBatchWaveOne0011`<br>`com.samples.shortcut_ShortcutBatchWaveOne_0011` | 确认后入口被删除时拒绝使用旧列表执行 |
| [SUB_SHORTCUT_BATCHWAVEONE_1200](<entry/src/ohosTest/ets/test/ShortcutBatchWaveOne.test.ets#L287>) | `testShortcutBatchWaveOne0012`<br>`com.samples.shortcut_ShortcutBatchWaveOne_0012` | 失败项已被外部改到目标时重试预览只核对不重写 |
| [SUB_SHORTCUT_BATCHWAVEONE_1300](<entry/src/ohosTest/ets/test/ShortcutBatchWaveOne.test.ets#L309>) | `testShortcutBatchWaveOne0013`<br>`com.samples.shortcut_ShortcutBatchWaveOne_0013` | 重试预览入口缺失时降为未知而不是盲目重放 |
| [SUB_SHORTCUT_BATCHWAVEONE_1400](<entry/src/ohosTest/ets/test/ShortcutBatchWaveOne.test.ets#L331>) | `testShortcutBatchWaveOne0014`<br>`com.samples.shortcut_ShortcutBatchWaveOne_0014` | 已保存但从未执行的计划不能发起补偿写入 |
| [SUB_SHORTCUT_BATCHWAVEONE_1500](<entry/src/ohosTest/ets/test/ShortcutBatchWaveOne.test.ets#L353>) | `testShortcutBatchWaveOne0015`<br>`com.samples.shortcut_ShortcutBatchWaveOne_0015` | 当前可见性未知时即使原态已知也不执行补偿 |
| [SUB_SHORTCUT_BATCHWAVEONE_1600](<entry/src/ohosTest/ets/test/ShortcutBatchWaveOne.test.ets#L376>) | `testShortcutBatchWaveOne0016`<br>`com.samples.shortcut_ShortcutBatchWaveOne_0016` | 重试已达一百次时不会增加尝试或写入系统 |
| [SUB_SHORTCUT_BATCHWAVEONE_1700](<entry/src/ohosTest/ets/test/ShortcutBatchWaveOne.test.ets#L401>) | `testShortcutBatchWaveOne0017`<br>`com.samples.shortcut_ShortcutBatchWaveOne_0017` | 补偿已达一百次时不会突破存档允许的次数上限 |
| [SUB_SHORTCUT_BATCHWAVEONE_1800](<entry/src/ohosTest/ets/test/ShortcutBatchWaveOne.test.ets#L427>) | `testShortcutBatchWaveOne0018`<br>`com.samples.shortcut_ShortcutBatchWaveOne_0018` | 核对时入口消失同时使正向和补偿的旧结果失去确认 |
| [SUB_SHORTCUT_BATCHWAVEONE_1900](<entry/src/ohosTest/ets/test/ShortcutBatchWaveOne.test.ets#L453>) | `testShortcutBatchWaveOne0019`<br>`com.samples.shortcut_ShortcutBatchWaveOne_0019` | 补偿失败后的核对识别外部恢复原态而不重写 |
| [SUB_SHORTCUT_BATCHWAVEONE_2000](<entry/src/ohosTest/ets/test/ShortcutBatchWaveOne.test.ets#L478>) | `testShortcutBatchWaveOne0020`<br>`com.samples.shortcut_ShortcutBatchWaveOne_0020` | 系统设置调用之前未知标记已持久化完成 |

### [ShortcutBatchWaveTwo.test.ets](<entry/src/ohosTest/ets/test/ShortcutBatchWaveTwo.test.ets>) — 6条

对应场景：S07。原名称保留注释映射，运行名遵循统一身份规则。

| 原编号 / 源码定位 | 原名称 / 规范运行名 | 覆盖点 |
|---|---|---|
| [SUB_SHORTCUT_BATCHWAVETWO_0100](<entry/src/ohosTest/ets/test/ShortcutBatchWaveTwo.test.ets#L47>) | `testShortcutBatchWaveTwo0001`<br>`com.samples.shortcut_ShortcutBatchWaveTwo_0001` | 批次存档写入期间同实例重新初始化不永久卡在旧设置忙状态 |
| [SUB_SHORTCUT_BATCHWAVETWO_0200](<entry/src/ohosTest/ets/test/ShortcutBatchWaveTwo.test.ets>)（源码第109行） | `testShortcutBatchWaveTwo0002`<br>`com.samples.shortcut_ShortcutBatchWaveTwo_0002` | 权限能力错误封闭的计划不能通过补偿入口绕开限制 |
| [SUB_SHORTCUT_BATCHWAVETWO_0300](<entry/src/ohosTest/ets/test/ShortcutBatchWaveTwo.test.ets>)（源码第137行） | `testShortcutBatchWaveTwo0003`<br>`com.samples.shortcut_ShortcutBatchWaveTwo_0003` | 补偿写超时尚在途时不能重放且完成后可通过核对确认原态 |
| [SUB_SHORTCUT_BATCHWAVETWO_0400](<entry/src/ohosTest/ets/test/ShortcutBatchWaveTwo.test.ets>)（源码第172行） | `testShortcutBatchWaveTwo0004`<br>`com.samples.shortcut_ShortcutBatchWaveTwo_0004` | 批次文档结构或标识重复不能部分载入或自动覆盖 |
| [SUB_SHORTCUT_BATCHWAVETWO_0500](<entry/src/ohosTest/ets/test/ShortcutBatchWaveTwo.test.ets#L203>) | `testShortcutBatchWaveTwo0005`<br>`com.samples.shortcut_ShortcutBatchWaveTwo_0005` | 超过一百次或零尝试却记结果的存档不会获得执行能力 |
| [SUB_SHORTCUT_BATCHWAVETWO_0600](<entry/src/ohosTest/ets/test/ShortcutBatchWaveTwo.test.ets#L235>) | `testShortcutBatchWaveTwo0006`<br>`com.samples.shortcut_ShortcutBatchWaveTwo_0006` | 原始可见性未知却存在补偿尝试的存档拒绝读取且可修正重读 |

### [ShortcutCoverage.test.ets](<entry/src/ohosTest/ets/test/ShortcutCoverage.test.ets>) — 11条

对应场景：S06、S07。原名称保留注释映射，运行名遵循统一身份规则。

| 原编号 / 源码定位 | 原名称 / 规范运行名 | 覆盖点 |
|---|---|---|
| [SUB_SHORTCUT_SHORTCUTCOVERAGE_0100](<entry/src/ohosTest/ets/test/ShortcutCoverage.test.ets#L27>) | `testShortcutCoverage0001`<br>`com.samples.shortcut_ShortcutCoverage_0001` | support recovery clears error then refresh is available |
| [SUB_SHORTCUT_SHORTCUTCOVERAGE_0200](<entry/src/ohosTest/ets/test/ShortcutCoverage.test.ets#L61>) | `testShortcutCoverage0002`<br>`com.samples.shortcut_ShortcutCoverage_0002` | restore stops at first readback mismatch |
| [SUB_SHORTCUT_SHORTCUTCOVERAGE_0300](<entry/src/ohosTest/ets/test/ShortcutCoverage.test.ets#L84>) | `testShortcutCoverage0003`<br>`com.samples.shortcut_ShortcutCoverage_0003` | restore stops on pending readback without writing next item |
| [SUB_SHORTCUT_SHORTCUTCOVERAGE_0400](<entry/src/ohosTest/ets/test/ShortcutCoverage.test.ets>)（源码第115行） | `testShortcutCoverage0004`<br>`com.samples.shortcut_ShortcutCoverage_0004` | listener exception isolated and snapshot observes new state |
| [SUB_SHORTCUT_SHORTCUTCOVERAGE_0500](<entry/src/ohosTest/ets/test/ShortcutCoverage.test.ets>)（源码第138行） | `testShortcutCoverage0005`<br>`com.samples.shortcut_ShortcutCoverage_0005` | dispose inside notification cancels remaining callbacks |
| [SUB_SHORTCUT_SHORTCUTCOVERAGE_0600](<entry/src/ohosTest/ets/test/ShortcutCoverage.test.ets>)（源码第162行） | `testShortcutCoverage0006`<br>`com.samples.shortcut_ShortcutCoverage_0006` | reinitialize during write discards old rejection and reloads |
| [SUB_SHORTCUT_SHORTCUTCOVERAGE_0700](<entry/src/ohosTest/ets/test/ShortcutCoverage.test.ets>)（源码第191行） | `testShortcutCoverage0007`<br>`com.samples.shortcut_ShortcutCoverage_0007` | dispose during write readback never leaks old items to new generation |
| [SUB_SHORTCUT_SHORTCUTCOVERAGE_0800](<entry/src/ohosTest/ets/test/ShortcutCoverage.test.ets#L219>) | `testShortcutCoverage0008`<br>`com.samples.shortcut_ShortcutCoverage_0008` | resource name prefixes resolve real test module resources |
| [SUB_SHORTCUT_SHORTCUTCOVERAGE_0900](<entry/src/ohosTest/ets/test/ShortcutCoverage.test.ets#L248>) | `testShortcutCoverage0009`<br>`com.samples.shortcut_ShortcutCoverage_0009` | missing module and resource fallback keep query usable |
| [SUB_SHORTCUT_SHORTCUTCOVERAGE_1000](<entry/src/ohosTest/ets/test/ShortcutCoverage.test.ets#L284>) | `testShortcutCoverage0010`<br>`com.samples.shortcut_ShortcutCoverage_0010` | unknown query error preserves message and can retry empty result |
| [SUB_SHORTCUT_SHORTCUTCOVERAGE_1100](<entry/src/ohosTest/ets/test/ShortcutCoverage.test.ets#L310>) | `testShortcutCoverage0011`<br>`com.samples.shortcut_ShortcutCoverage_0011` | disposed operations and unknown unsubscribe are noops |

### [ShortcutNavigationWaveOne.test.ets](<entry/src/ohosTest/ets/test/ShortcutNavigationWaveOne.test.ets>) — 12条

对应场景：S02、S08。原名称保留注释映射，运行名遵循统一身份规则。

| 原编号 / 源码定位 | 原名称 / 规范运行名 | 覆盖点 |
|---|---|---|
| [SUB_SHORTCUT_NAVIGATIONWAVEONE_0100](<entry/src/ohosTest/ets/test/ShortcutNavigationWaveOne.test.ets#L65>) | `testShortcutNavigationWaveOne0001`<br>`com.samples.shortcut_ShortcutNavigationWaveOne_0001` | 页面尚未激活时只交付最后一个不同的桌面请求 |
| [SUB_SHORTCUT_NAVIGATIONWAVEONE_0200](<entry/src/ohosTest/ets/test/ShortcutNavigationWaveOne.test.ets#L88>) | `testShortcutNavigationWaveOne0002`<br>`com.samples.shortcut_ShortcutNavigationWaveOne_0002` | 非法启动参数单独记录失败但不挤掉已排队的合法入口 |
| [SUB_SHORTCUT_NAVIGATIONWAVEONE_0300](<entry/src/ohosTest/ets/test/ShortcutNavigationWaveOne.test.ets>)（源码第110行） | `testShortcutNavigationWaveOne0003`<br>`com.samples.shortcut_ShortcutNavigationWaveOne_0003` | 只有当前页的失活通知暂停交付并在再次激活后排空 |
| [SUB_SHORTCUT_NAVIGATIONWAVEONE_0400](<entry/src/ohosTest/ets/test/ShortcutNavigationWaveOne.test.ets>)（源码第138行） | `testShortcutNavigationWaveOne0004`<br>`com.samples.shortcut_ShortcutNavigationWaveOne_0004` | 已在便签页时重复桌面入口保留未保存正文并执行重访回调 |
| [SUB_SHORTCUT_NAVIGATIONWAVEONE_0500](<entry/src/ohosTest/ets/test/ShortcutNavigationWaveOne.test.ets>)（源码第163行） | `testShortcutNavigationWaveOne0005`<br>`com.samples.shortcut_ShortcutNavigationWaveOne_0005` | 详情页再次打开不同入口时替换路由并保留各自标识 |
| [SUB_SHORTCUT_NAVIGATIONWAVEONE_0600](<entry/src/ohosTest/ets/test/ShortcutNavigationWaveOne.test.ets>)（源码第186行） | `testShortcutNavigationWaveOne0006`<br>`com.samples.shortcut_ShortcutNavigationWaveOne_0006` | 单页栈返回替换首页并等待首页生命周期后交付新入口 |
| [SUB_SHORTCUT_NAVIGATIONWAVEONE_0700](<entry/src/ohosTest/ets/test/ShortcutNavigationWaveOne.test.ets#L211>) | `testShortcutNavigationWaveOne0007`<br>`com.samples.shortcut_ShortcutNavigationWaveOne_0007` | 多页栈返回中的请求不能继续按旧页面身份导航 |
| [SUB_SHORTCUT_NAVIGATIONWAVEONE_0800](<entry/src/ohosTest/ets/test/ShortcutNavigationWaveOne.test.ets#L238>) | `testShortcutNavigationWaveOne0008`<br>`com.samples.shortcut_ShortcutNavigationWaveOne_0008` | 返回时选择继续编辑会清除期间排队的新快捷方式 |
| [SUB_SHORTCUT_NAVIGATIONWAVEONE_0900](<entry/src/ohosTest/ets/test/ShortcutNavigationWaveOne.test.ets#L266>) | `testShortcutNavigationWaveOne0009`<br>`com.samples.shortcut_ShortcutNavigationWaveOne_0009` | 返回路由失败报告安全提示且解除导航忙状态以便重试 |
| [SUB_SHORTCUT_NAVIGATIONWAVEONE_1000](<entry/src/ohosTest/ets/test/ShortcutNavigationWaveOne.test.ets#L289>) | `testShortcutNavigationWaveOne0010`<br>`com.samples.shortcut_ShortcutNavigationWaveOne_0010` | 离开对话框拒绝时不保存不导航并保留编辑工作 |
| [SUB_SHORTCUT_NAVIGATIONWAVEONE_1100](<entry/src/ohosTest/ets/test/ShortcutNavigationWaveOne.test.ets#L312>) | `testShortcutNavigationWaveOne0011`<br>`com.samples.shortcut_ShortcutNavigationWaveOne_0011` | 跳转失败恢复原日期跟随模式与收藏查询分类 |
| [SUB_SHORTCUT_NAVIGATIONWAVEONE_1200](<entry/src/ohosTest/ets/test/ShortcutNavigationWaveOne.test.ets#L340>) | `testShortcutNavigationWaveOne0012`<br>`com.samples.shortcut_ShortcutNavigationWaveOne_0012` | 从历史日期点击今日未完成入口后跨日写入必须先刷新今天 |

### [ShortcutNavigationWaveTwo.test.ets](<entry/src/ohosTest/ets/test/ShortcutNavigationWaveTwo.test.ets>) — 1条

对应场景：S08。原名称保留注释映射，运行名遵循统一身份规则。

| 原编号 / 源码定位 | 原名称 / 规范运行名 | 覆盖点 |
|---|---|---|
| [SUB_SHORTCUT_NAVIGATIONWAVETWO_0100](<entry/src/ohosTest/ets/test/ShortcutNavigationWaveTwo.test.ets#L30>) | `testShortcutNavigationWaveTwo0001`<br>`com.samples.shortcut_ShortcutNavigationWaveTwo_0001` | 明确返回首页走指定首页回退并等首页激活后再交付待办请求 |

### [ShortcutPersistenceWaveOne.test.ets](<entry/src/ohosTest/ets/test/ShortcutPersistenceWaveOne.test.ets>) — 8条

对应场景：S01、S02。原名称保留注释映射，运行名遵循统一身份规则。

| 原编号 / 源码定位 | 原名称 / 规范运行名 | 覆盖点 |
|---|---|---|
| [SUB_SHORTCUT_PERSISTENCEWAVEONE_0100](<entry/src/ohosTest/ets/test/ShortcutPersistenceWaveOne.test.ets#L35>) | `testShortcutPersistenceWaveOne0001`<br>`com.samples.shortcut_ShortcutPersistenceWaveOne_0001` | 编辑检查点恢复目标便签时同步恢复该目标的基线修订 |
| [SUB_SHORTCUT_PERSISTENCEWAVEONE_0200](<entry/src/ohosTest/ets/test/ShortcutPersistenceWaveOne.test.ets#L66>) | `testShortcutPersistenceWaveOne0002`<br>`com.samples.shortcut_ShortcutPersistenceWaveOne_0002` | 编辑存档指向不存在便签时保留原文并允许修正后重读 |
| [SUB_SHORTCUT_PERSISTENCEWAVEONE_0300](<entry/src/ohosTest/ets/test/ShortcutPersistenceWaveOne.test.ets#L92>) | `testShortcutPersistenceWaveOne0003`<br>`com.samples.shortcut_ShortcutPersistenceWaveOne_0003` | 编辑正文类型错误不部分导入便签且修复后恢复编辑缓冲 |
| [SUB_SHORTCUT_PERSISTENCEWAVEONE_0400](<entry/src/ohosTest/ets/test/ShortcutPersistenceWaveOne.test.ets>)（源码第117行） | `testShortcutPersistenceWaveOne0004`<br>`com.samples.shortcut_ShortcutPersistenceWaveOne_0004` | 修订编号重复的历史存档被整体拒绝而不是覆盖较早版本 |
| [SUB_SHORTCUT_PERSISTENCEWAVEONE_0500](<entry/src/ohosTest/ets/test/ShortcutPersistenceWaveOne.test.ets>)（源码第142行） | `testShortcutPersistenceWaveOne0005`<br>`com.samples.shortcut_ShortcutPersistenceWaveOne_0005` | 未知历史动作不被当成有效编辑记录加载 |
| [SUB_SHORTCUT_PERSISTENCEWAVEONE_0600](<entry/src/ohosTest/ets/test/ShortcutPersistenceWaveOne.test.ets>)（源码第167行） | `testShortcutPersistenceWaveOne0006`<br>`com.samples.shortcut_ShortcutPersistenceWaveOne_0006` | 重复或不存在的收藏标识拒绝加载且不覆盖原存档 |
| [SUB_SHORTCUT_PERSISTENCEWAVEONE_0700](<entry/src/ohosTest/ets/test/ShortcutPersistenceWaveOne.test.ets>)（源码第195行） | `testShortcutPersistenceWaveOne0007`<br>`com.samples.shortcut_ShortcutPersistenceWaveOne_0007` | 修改返回的历史快照不能污染后续恢复及重新打开后的历史 |
| [SUB_SHORTCUT_PERSISTENCEWAVEONE_0800](<entry/src/ohosTest/ets/test/ShortcutPersistenceWaveOne.test.ets#L224>) | `testShortcutPersistenceWaveOne0008`<br>`com.samples.shortcut_ShortcutPersistenceWaveOne_0008` | 不能将另一便签的有效修订编号用于当前便签恢复 |

### [ShortcutRecoveryWaveTwo.test.ets](<entry/src/ohosTest/ets/test/ShortcutRecoveryWaveTwo.test.ets>) — 5条

对应场景：S02。原名称保留注释映射，运行名遵循统一身份规则。

| 原编号 / 源码定位 | 原名称 / 规范运行名 | 覆盖点 |
|---|---|---|
| [SUB_SHORTCUT_RECOVERYWAVETWO_0100](<entry/src/ohosTest/ets/test/ShortcutRecoveryWaveTwo.test.ets#L27>) | `testShortcutRecoveryWaveTwo0001`<br>`com.samples.shortcut_ShortcutRecoveryWaveTwo_0001` | 已保留编辑回到正式原文后再次保留不能在重启时复活旧修改 |
| [SUB_SHORTCUT_RECOVERYWAVETWO_0200](<entry/src/ohosTest/ets/test/ShortcutRecoveryWaveTwo.test.ets#L56>) | `testShortcutRecoveryWaveTwo0002`<br>`com.samples.shortcut_ShortcutRecoveryWaveTwo_0002` | 恢复历史成功后重启不能用旧持久编辑覆盖已恢复的正文 |
| [SUB_SHORTCUT_RECOVERYWAVETWO_0300](<entry/src/ohosTest/ets/test/ShortcutRecoveryWaveTwo.test.ets#L85>) | `testShortcutRecoveryWaveTwo0003`<br>`com.samples.shortcut_ShortcutRecoveryWaveTwo_0003` | 保存仅有首尾空白差异的编辑会解除脏状态且不创建重复版本 |
| [SUB_SHORTCUT_RECOVERYWAVETWO_0400](<entry/src/ohosTest/ets/test/ShortcutRecoveryWaveTwo.test.ets>)（源码第111行） | `testShortcutRecoveryWaveTwo0004`<br>`com.samples.shortcut_ShortcutRecoveryWaveTwo_0004` | 同一业务实例重新初始化后不继承历史浏览筛选和旧编辑基线 |
| [SUB_SHORTCUT_RECOVERYWAVETWO_0500](<entry/src/ohosTest/ets/test/ShortcutRecoveryWaveTwo.test.ets>)（源码第144行） | `testShortcutRecoveryWaveTwo0005`<br>`com.samples.shortcut_ShortcutRecoveryWaveTwo_0005` | 存档中格式正确但日历不存在的待办日期被原子拒绝 |

### [ShortcutResidualSafety.test.ets](<entry/src/ohosTest/ets/test/ShortcutResidualSafety.test.ets>) — 3条

对应场景：S01、S02、S07。原名称保留注释映射，运行名遵循统一身份规则。

| 原编号 / 源码定位 | 原名称 / 规范运行名 | 覆盖点 |
|---|---|---|
| [SUB_SHORTCUT_RESIDUALSAFETY_0100](<entry/src/ohosTest/ets/test/ShortcutResidualSafety.test.ets#L33>) | `testShortcutResidualSafety0001`<br>`com.samples.shortcut_ShortcutResidualSafety_0001` | 选择已是当前内容的历史版本不隐式丢弃已保留编辑 |
| [SUB_SHORTCUT_RESIDUALSAFETY_0200](<entry/src/ohosTest/ets/test/ShortcutResidualSafety.test.ets#L61>) | `testShortcutResidualSafety0002`<br>`com.samples.shortcut_ShortcutResidualSafety_0002` | 清除旧持久编辑写前失败时保留缓冲和可重试原文 |
| [SUB_SHORTCUT_RESIDUALSAFETY_0300](<entry/src/ohosTest/ets/test/ShortcutResidualSafety.test.ets#L98>) | `testShortcutResidualSafety0003`<br>`com.samples.shortcut_ShortcutResidualSafety_0003` | 旧批次存档写失败后同实例重新初始化从旧盘面恢复而不重放 |

### [ShortcutRuleCases.test.ets](<entry/src/ohosTest/ets/test/ShortcutRuleCases.test.ets>) — 22条

对应场景：S07。原名称保留注释映射，运行名遵循统一身份规则。

| 原编号 / 源码定位 | 原名称 / 规范运行名 | 覆盖点 |
|---|---|---|
| [SUB_SHORTCUT_ENTRYROUTECASES_0100](<entry/src/ohosTest/ets/test/ShortcutRuleCases.test.ets#L60>) | `testEntryRouteCases0001`<br>`com.samples.shortcut_EntryRouteCases_0001` | note new route |
| [SUB_SHORTCUT_ENTRYROUTECASES_0200](<entry/src/ohosTest/ets/test/ShortcutRuleCases.test.ets#L79>) | `testEntryRouteCases0002`<br>`com.samples.shortcut_EntryRouteCases_0002` | todo today route |
| [SUB_SHORTCUT_ENTRYROUTECASES_0300](<entry/src/ohosTest/ets/test/ShortcutRuleCases.test.ets#L97>) | `testEntryRouteCases0003`<br>`com.samples.shortcut_EntryRouteCases_0003` | collection route |
| [SUB_SHORTCUT_ENTRYROUTECASES_0400](<entry/src/ohosTest/ets/test/ShortcutRuleCases.test.ets>)（源码第114行） | `testEntryRouteCases0004`<br>`com.samples.shortcut_EntryRouteCases_0004` | detail route requires login |
| [SUB_SHORTCUT_ENTRYROUTECASES_0500](<entry/src/ohosTest/ets/test/ShortcutRuleCases.test.ets>)（源码第133行） | `testEntryRouteCases0005`<br>`com.samples.shortcut_EntryRouteCases_0005` | call log route |
| [SUB_SHORTCUT_ENTRYROUTECASES_0600](<entry/src/ohosTest/ets/test/ShortcutRuleCases.test.ets>)（源码第150行） | `testEntryRouteCases0006`<br>`com.samples.shortcut_EntryRouteCases_0006` | rule center route |
| [SUB_SHORTCUT_ENTRYROUTECASES_0700](<entry/src/ohosTest/ets/test/ShortcutRuleCases.test.ets>)（源码第167行） | `testEntryRouteCases0007`<br>`com.samples.shortcut_EntryRouteCases_0007` | resume route expires |
| [SUB_SHORTCUT_ENTRYROUTECASES_0800](<entry/src/ohosTest/ets/test/ShortcutRuleCases.test.ets>)（源码第192行） | `testEntryRouteCases0008`<br>`com.samples.shortcut_EntryRouteCases_0008` | todo detail route |
| [SUB_SHORTCUT_ENTRYROUTECASES_0900](<entry/src/ohosTest/ets/test/ShortcutRuleCases.test.ets#L218>) | `testEntryRouteCases0009`<br>`com.samples.shortcut_EntryRouteCases_0009` | table is consistent |
| [SUB_SHORTCUT_TODOTRANSITIONCASES_0100](<entry/src/ohosTest/ets/test/ShortcutRuleCases.test.ets#L241>) | `testTodoTransitionCases0001`<br>`com.samples.shortcut_TodoTransitionCases_0001` | open state has five exits |
| [SUB_SHORTCUT_TODOTRANSITIONCASES_0200](<entry/src/ohosTest/ets/test/ShortcutRuleCases.test.ets#L260>) | `testTodoTransitionCases0002`<br>`com.samples.shortcut_TodoTransitionCases_0002` | doing state transitions |
| [SUB_SHORTCUT_TODOTRANSITIONCASES_0300](<entry/src/ohosTest/ets/test/ShortcutRuleCases.test.ets#L277>) | `testTodoTransitionCases0003`<br>`com.samples.shortcut_TodoTransitionCases_0003` | deferred state transitions |
| [SUB_SHORTCUT_TODOTRANSITIONCASES_0400](<entry/src/ohosTest/ets/test/ShortcutRuleCases.test.ets#L294>) | `testTodoTransitionCases0004`<br>`com.samples.shortcut_TodoTransitionCases_0004` | closed states only reopen |
| [SUB_SHORTCUT_TODOTRANSITIONCASES_0500](<entry/src/ohosTest/ets/test/ShortcutRuleCases.test.ets#L312>) | `testTodoTransitionCases0005`<br>`com.samples.shortcut_TodoTransitionCases_0005` | every rule is reachable |
| [SUB_SHORTCUT_TODOTRANSITIONCASES_0600](<entry/src/ohosTest/ets/test/ShortcutRuleCases.test.ets#L332>) | `testTodoTransitionCases0006`<br>`com.samples.shortcut_TodoTransitionCases_0006` | score weights are ordered |
| [SUB_SHORTCUT_TODOTRANSITIONCASES_0700](<entry/src/ohosTest/ets/test/ShortcutRuleCases.test.ets#L352>) | `testTodoTransitionCases0007`<br>`com.samples.shortcut_TodoTransitionCases_0007` | due buckets cover ranges |
| [SUB_SHORTCUT_SEARCHENGINECASES_0100](<entry/src/ohosTest/ets/test/ShortcutRuleCases.test.ets#L377>) | `testSearchEngineCases0001`<br>`com.samples.shortcut_SearchEngineCases_0001` | tokenizer splits latin and cjk |
| [SUB_SHORTCUT_SEARCHENGINECASES_0200](<entry/src/ohosTest/ets/test/ShortcutRuleCases.test.ets#L394>) | `testSearchEngineCases0002`<br>`com.samples.shortcut_SearchEngineCases_0002` | title outranks body |
| [SUB_SHORTCUT_SEARCHENGINECASES_0300](<entry/src/ohosTest/ets/test/ShortcutRuleCases.test.ets#L412>) | `testSearchEngineCases0003`<br>`com.samples.shortcut_SearchEngineCases_0003` | ranked search order |
| [SUB_SHORTCUT_SEARCHENGINECASES_0400](<entry/src/ohosTest/ets/test/ShortcutRuleCases.test.ets#L431>) | `testSearchEngineCases0004`<br>`com.samples.shortcut_SearchEngineCases_0004` | limit is respected |
| [SUB_SHORTCUT_SEARCHENGINECASES_0500](<entry/src/ohosTest/ets/test/ShortcutRuleCases.test.ets#L448>) | `testSearchEngineCases0005`<br>`com.samples.shortcut_SearchEngineCases_0005` | snippet and highlight |
| [SUB_SHORTCUT_SEARCHENGINECASES_0600](<entry/src/ohosTest/ets/test/ShortcutRuleCases.test.ets#L466>) | `testSearchEngineCases0006`<br>`com.samples.shortcut_SearchEngineCases_0006` | broken docs are reported |

### [ShortcutService.test.ets](<entry/src/ohosTest/ets/test/ShortcutService.test.ets>) — 7条

对应场景：S06。原名称保留注释映射，运行名遵循统一身份规则。

| 原编号 / 源码定位 | 原名称 / 规范运行名 | 覆盖点 |
|---|---|---|
| [SUB_SHORTCUT_SHORTCUTSERVICE_0100](<entry/src/ohosTest/ets/test/ShortcutService.test.ets#L31>) | `testShortcutService0001`<br>`com.samples.shortcut_ShortcutService_0001` | support result error and gate |
| [SUB_SHORTCUT_SHORTCUTSERVICE_0200](<entry/src/ohosTest/ets/test/ShortcutService.test.ets#L75>) | `testShortcutService0002`<br>`com.samples.shortcut_ShortcutService_0002` | complete mapping defaults resources and snapshot isolation |
| [SUB_SHORTCUT_SHORTCUTSERVICE_0300](<entry/src/ohosTest/ets/test/ShortcutService.test.ets>)（源码第158行） | `testShortcutService0003`<br>`com.samples.shortcut_ShortcutService_0003` | query failure preserves items and raw code |
| [SUB_SHORTCUT_SHORTCUTSERVICE_0400](<entry/src/ohosTest/ets/test/ShortcutService.test.ets>)（源码第189行） | `testShortcutService0004`<br>`com.samples.shortcut_ShortcutService_0004` | hide show parameters and single readback |
| [SUB_SHORTCUT_SHORTCUTSERVICE_0500](<entry/src/ohosTest/ets/test/ShortcutService.test.ets#L228>) | `testShortcutService0005`<br>`com.samples.shortcut_ShortcutService_0005` | set error mismatch and pending readback |
| [SUB_SHORTCUT_SHORTCUTSERVICE_0600](<entry/src/ohosTest/ets/test/ShortcutService.test.ets#L293>) | `testShortcutService0006`<br>`com.samples.shortcut_ShortcutService_0006` | restore skips visible orders writes and stops on failure |
| [SUB_SHORTCUT_SHORTCUTSERVICE_0700](<entry/src/ohosTest/ets/test/ShortcutService.test.ets#L348>) | `testShortcutService0007`<br>`com.samples.shortcut_ShortcutService_0007` | busy gate dispose late results and subscriptions |

### [ShortcutTodoWaveTwo.test.ets](<entry/src/ohosTest/ets/test/ShortcutTodoWaveTwo.test.ets>) — 5条

对应场景：S04。原名称保留注释映射，运行名遵循统一身份规则。

| 原编号 / 源码定位 | 原名称 / 规范运行名 | 覆盖点 |
|---|---|---|
| [SUB_SHORTCUT_TODOWAVETWO_0100](<entry/src/ohosTest/ets/test/ShortcutTodoWaveTwo.test.ets#L26>) | `testShortcutTodoWaveTwo0001`<br>`com.samples.shortcut_ShortcutTodoWaveTwo_0001` | 更新待办拒绝空和超长输入且接受六十字边界 |
| [SUB_SHORTCUT_TODOWAVETWO_0200](<entry/src/ohosTest/ets/test/ShortcutTodoWaveTwo.test.ets#L51>) | `testShortcutTodoWaveTwo0002`<br>`com.samples.shortcut_ShortcutTodoWaveTwo_0002` | 待办标题去空白后未变化时不写盘且保留完成状态 |
| [SUB_SHORTCUT_TODOWAVETWO_0300](<entry/src/ohosTest/ets/test/ShortcutTodoWaveTwo.test.ets#L75>) | `testShortcutTodoWaveTwo0003`<br>`com.samples.shortcut_ShortcutTodoWaveTwo_0003` | 当前日不能更新不存在或归属不同日期的待办标识 |
| [SUB_SHORTCUT_TODOWAVETWO_0400](<entry/src/ohosTest/ets/test/ShortcutTodoWaveTwo.test.ets>)（源码第104行） | `testShortcutTodoWaveTwo0004`<br>`com.samples.shortcut_ShortcutTodoWaveTwo_0004` | 完成项改标题失败可重试且重开保留标题与完成状态组合 |
| [SUB_SHORTCUT_TODOWAVETWO_0500](<entry/src/ohosTest/ets/test/ShortcutTodoWaveTwo.test.ets>)（源码第134行） | `testShortcutTodoWaveTwo0005`<br>`com.samples.shortcut_ShortcutTodoWaveTwo_0005` | 达到二十项后拒绝新增并在删除释放名额后正确持久化新项 |

### [TagSearchMatrixCases.test.ets](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets>) — 52条

对应场景：S05。原名称保留注释映射，运行名遵循统一身份规则。

| 原编号 / 源码定位 | 原名称 / 规范运行名 | 覆盖点 |
|---|---|---|
| [SUB_SHORTCUT_TAGRULECASES_0100](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets#L35>) | `testTagRuleCases0001`<br>`com.samples.shortcut_TagRuleCases_0001` | rule table has ten entries |
| [SUB_SHORTCUT_TAGRULECASES_0200](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets#L53>) | `testTagRuleCases0002`<br>`com.samples.shortcut_TagRuleCases_0002` | rule describe joins facts |
| [SUB_SHORTCUT_TAGRULECASES_0300](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets#L70>) | `testTagRuleCases0003`<br>`com.samples.shortcut_TagRuleCases_0003` | tag lines match table |
| [SUB_SHORTCUT_TAGRULECASES_0400](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets#L86>) | `testTagRuleCases0004`<br>`com.samples.shortcut_TagRuleCases_0004` | tag limits are fixed |
| [SUB_SHORTCUT_TAGRULECASES_0500](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets>)（源码第101行） | `testTagRuleCases0005`<br>`com.samples.shortcut_TagRuleCases_0005` | synonym table has four pairs |
| [SUB_SHORTCUT_TAGRULECASES_0600](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets>)（源码第117行） | `testTagRuleCases0006`<br>`com.samples.shortcut_TagRuleCases_0006` | synonym describe shows aliases |
| [SUB_SHORTCUT_NORMALIZECASES_0100](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets>)（源码第135行） | `testNormalizeCases0001`<br>`com.samples.shortcut_NormalizeCases_0001` | trims whitespace |
| [SUB_SHORTCUT_NORMALIZECASES_0200](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets>)（源码第151行） | `testNormalizeCases0002`<br>`com.samples.shortcut_NormalizeCases_0002` | strips hash prefix |
| [SUB_SHORTCUT_NORMALIZECASES_0300](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets>)（源码第166行） | `testNormalizeCases0003`<br>`com.samples.shortcut_NormalizeCases_0003` | folds chinese comma |
| [SUB_SHORTCUT_NORMALIZECASES_0400](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets>)（源码第182行） | `testNormalizeCases0004`<br>`com.samples.shortcut_NormalizeCases_0004` | collapses repeated separators |
| [SUB_SHORTCUT_NORMALIZECASES_0500](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets>)（源码第197行） | `testNormalizeCases0005`<br>`com.samples.shortcut_NormalizeCases_0005` | blank tags become empty |
| [SUB_SHORTCUT_NORMALIZECASES_0600](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets#L213>) | `testNormalizeCases0006`<br>`com.samples.shortcut_NormalizeCases_0006` | long tags are truncated |
| [SUB_SHORTCUT_NORMALIZECASES_0700](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets#L230>) | `testNormalizeCases0007`<br>`com.samples.shortcut_NormalizeCases_0007` | case is folded |
| [SUB_SHORTCUT_NORMALIZECASES_0800](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets#L245>) | `testNormalizeCases0008`<br>`com.samples.shortcut_NormalizeCases_0008` | synonyms merge to canonical |
| [SUB_SHORTCUT_NORMALIZECASES_0900](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets#L261>) | `testNormalizeCases0009`<br>`com.samples.shortcut_NormalizeCases_0009` | synonym match is case insensitive |
| [SUB_SHORTCUT_NORMALIZECASES_1000](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets#L276>) | `testNormalizeCases0010`<br>`com.samples.shortcut_NormalizeCases_0010` | unknown words are kept |
| [SUB_SHORTCUT_NORMALIZECASES_1100](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets#L291>) | `testNormalizeCases0011`<br>`com.samples.shortcut_NormalizeCases_0011` | numeric tags stay as is |
| [SUB_SHORTCUT_NORMALIZECASES_1200](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets#L306>) | `testNormalizeCases0012`<br>`com.samples.shortcut_NormalizeCases_0012` | normalize tags drops duplicates |
| [SUB_SHORTCUT_NORMALIZECASES_1300](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets#L322>) | `testNormalizeCases0013`<br>`com.samples.shortcut_NormalizeCases_0013` | normalize tags drops blanks |
| [SUB_SHORTCUT_NORMALIZECASES_1400](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets#L339>) | `testNormalizeCases0014`<br>`com.samples.shortcut_NormalizeCases_0014` | normalize tags caps at limit |
| [SUB_SHORTCUT_NORMALIZECASES_1500](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets#L359>) | `testNormalizeCases0015`<br>`com.samples.shortcut_NormalizeCases_0015` | normalize tags merges synonyms before dedup |
| [SUB_SHORTCUT_NORMALIZECASES_1600](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets#L376>) | `testNormalizeCases0016`<br>`com.samples.shortcut_NormalizeCases_0016` | normalize tags keeps input order |
| [SUB_SHORTCUT_NORMALIZECASES_1700](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets#L393>) | `testNormalizeCases0017`<br>`com.samples.shortcut_NormalizeCases_0017` | normalize empty list is empty |
| [SUB_SHORTCUT_TOKENIZECASES_0100](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets#L411>) | `testTokenizeCases0001`<br>`com.samples.shortcut_TokenizeCases_0001` | splits on whitespace |
| [SUB_SHORTCUT_TOKENIZECASES_0200](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets#L427>) | `testTokenizeCases0002`<br>`com.samples.shortcut_TokenizeCases_0002` | splits on punctuation |
| [SUB_SHORTCUT_TOKENIZECASES_0300](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets#L443>) | `testTokenizeCases0003`<br>`com.samples.shortcut_TokenizeCases_0003` | tokenize lowercases |
| [SUB_SHORTCUT_TOKENIZECASES_0400](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets#L458>) | `testTokenizeCases0004`<br>`com.samples.shortcut_TokenizeCases_0004` | tokenize skips empty parts |
| [SUB_SHORTCUT_TOKENIZECASES_0500](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets#L473>) | `testTokenizeCases0005`<br>`com.samples.shortcut_TokenizeCases_0005` | tokenize handles brackets |
| [SUB_SHORTCUT_SEARCHCASES_0100](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets#L491>) | `testSearchCases0001`<br>`com.samples.shortcut_SearchCases_0001` | empty query returns nothing |
| [SUB_SHORTCUT_SEARCHCASES_0200](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets#L508>) | `testSearchCases0002`<br>`com.samples.shortcut_SearchCases_0002` | id match scores highest |
| [SUB_SHORTCUT_SEARCHCASES_0300](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets#L525>) | `testSearchCases0003`<br>`com.samples.shortcut_SearchCases_0003` | title match scores five |
| [SUB_SHORTCUT_SEARCHCASES_0400](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets#L541>) | `testSearchCases0004`<br>`com.samples.shortcut_SearchCases_0004` | tag match scores three |
| [SUB_SHORTCUT_SEARCHCASES_0500](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets#L558>) | `testSearchCases0005`<br>`com.samples.shortcut_SearchCases_0005` | body match scores one |
| [SUB_SHORTCUT_SEARCHCASES_0600](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets#L575>) | `testSearchCases0006`<br>`com.samples.shortcut_SearchCases_0006` | highest source wins per doc |
| [SUB_SHORTCUT_SEARCHCASES_0700](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets#L592>) | `testSearchCases0007`<br>`com.samples.shortcut_SearchCases_0007` | results sort by score descending |
| [SUB_SHORTCUT_SEARCHCASES_0800](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets#L612>) | `testSearchCases0008`<br>`com.samples.shortcut_SearchCases_0008` | ties sort by id ascending |
| [SUB_SHORTCUT_SEARCHCASES_0900](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets#L631>) | `testSearchCases0009`<br>`com.samples.shortcut_SearchCases_0009` | no match returns empty |
| [SUB_SHORTCUT_SEARCHCASES_1000](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets#L648>) | `testSearchCases0010`<br>`com.samples.shortcut_SearchCases_0010` | matching is substring |
| [SUB_SHORTCUT_SEARCHCASES_1100](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets#L665>) | `testSearchCases0011`<br>`com.samples.shortcut_SearchCases_0011` | multiple tokens keep best |
| [SUB_SHORTCUT_SEARCHCASES_1200](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets#L682>) | `testSearchCases0012`<br>`com.samples.shortcut_SearchCases_0012` | hit describe joins facts |
| [SUB_SHORTCUT_SEARCHCASES_1300](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets#L700>) | `testSearchCases0013`<br>`com.samples.shortcut_SearchCases_0013` | search lines headline |
| [SUB_SHORTCUT_SEARCHCASES_1400](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets#L718>) | `testSearchCases0014`<br>`com.samples.shortcut_SearchCases_0014` | empty docs yield no hits |
| [SUB_SHORTCUT_TAGINDEXCASESB_0100](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets#L736>) | `testTagIndexCasesB0001`<br>`com.samples.shortcut_TagIndexCasesB_0001` | build indexes all tags |
| [SUB_SHORTCUT_TAGINDEXCASESB_0200](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets#L753>) | `testTagIndexCasesB0002`<br>`com.samples.shortcut_TagIndexCasesB_0002` | docs of unknown is empty |
| [SUB_SHORTCUT_TAGINDEXCASESB_0300](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets#L771>) | `testTagIndexCasesB0003`<br>`com.samples.shortcut_TagIndexCasesB_0003` | add deduplicates doc ids |
| [SUB_SHORTCUT_TAGINDEXCASESB_0400](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets#L792>) | `testTagIndexCasesB0004`<br>`com.samples.shortcut_TagIndexCasesB_0004` | build replaces previous index |
| [SUB_SHORTCUT_TAGINDEXCASESB_0500](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets#L810>) | `testTagIndexCasesB0005`<br>`com.samples.shortcut_TagIndexCasesB_0005` | top tags sorts by doc count |
| [SUB_SHORTCUT_TAGINDEXCASESB_0600](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets#L830>) | `testTagIndexCasesB0006`<br>`com.samples.shortcut_TagIndexCasesB_0006` | top tags break ties by name |
| [SUB_SHORTCUT_TAGINDEXCASESB_0700](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets#L847>) | `testTagIndexCasesB0007`<br>`com.samples.shortcut_TagIndexCasesB_0007` | docs of returns copy |
| [SUB_SHORTCUT_TAGINDEXCASESB_0800](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets#L867>) | `testTagIndexCasesB0008`<br>`com.samples.shortcut_TagIndexCasesB_0008` | empty index reports nothing |
| [SUB_SHORTCUT_TAGINDEXCASESB_0900](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets#L885>) | `testTagIndexCasesB0009`<br>`com.samples.shortcut_TagIndexCasesB_0009` | index with multiple docs per tag |
| [SUB_SHORTCUT_TAGINDEXCASESB_1000](<entry/src/ohosTest/ets/test/TagSearchMatrixCases.test.ets#L903>) | `testTagIndexCasesB0010`<br>`com.samples.shortcut_TagIndexCasesB_0010` | search and index agree |

### [TodoDateCases.test.ets](<entry/src/ohosTest/ets/test/TodoDateCases.test.ets>) — 6条

对应场景：S04。原名称保留注释映射，运行名遵循统一身份规则。

| 原编号 / 源码定位 | 原名称 / 规范运行名 | 覆盖点 |
|---|---|---|
| [SUB_SHORTCUT_TODODATEHISTORY_0100](<entry/src/ohosTest/ets/test/TodoDateCases.test.ets#L33>) | `testTodoDateHistory0001`<br>`com.samples.shortcut_TodoDateHistory_0001` | past date writes stay on selected day |
| [SUB_SHORTCUT_TODODATEHISTORY_0200](<entry/src/ohosTest/ets/test/TodoDateCases.test.ets#L71>) | `testTodoDateHistory0002`<br>`com.samples.shortcut_TodoDateHistory_0002` | invalid and future dates are rejected |
| [SUB_SHORTCUT_TODODATEHISTORY_0300](<entry/src/ohosTest/ets/test/TodoDateCases.test.ets#L99>) | `testTodoDateHistory0003`<br>`com.samples.shortcut_TodoDateHistory_0003` | date shift stops at today |
| [SUB_SHORTCUT_TODODATEHISTORY_0400](<entry/src/ohosTest/ets/test/TodoDateCases.test.ets>)（源码第126行） | `testTodoDateHistory0004`<br>`com.samples.shortcut_TodoDateHistory_0004` | historical selection survives midnight |
| [SUB_SHORTCUT_TODODATEHISTORY_0500](<entry/src/ohosTest/ets/test/TodoDateCases.test.ets>)（源码第157行） | `testTodoDateHistory0005`<br>`com.samples.shortcut_TodoDateHistory_0005` | summaries are descending and counted |
| [SUB_SHORTCUT_TODODATEHISTORY_0600](<entry/src/ohosTest/ets/test/TodoDateCases.test.ets>)（源码第187行） | `testTodoDateHistory0006`<br>`com.samples.shortcut_TodoDateHistory_0006` | historical write persists across reopen |

### [VisibilityBatch.test.ets](<entry/src/ohosTest/ets/test/VisibilityBatch.test.ets>) — 16条

对应场景：S07。原名称保留注释映射，运行名遵循统一身份规则。

| 原编号 / 源码定位 | 原名称 / 规范运行名 | 覆盖点 |
|---|---|---|
| [SUB_SHORTCUT_VISIBILITYBATCHPRODUCTIONSERVICE_0100](<entry/src/ohosTest/ets/test/VisibilityBatch.test.ets>)（源码第115行） | `testVisibilityBatchProductionService0001`<br>`com.samples.shortcut_VisibilityBatchProductionService_0001` | preview has no sdk writes and confirmation token is single use |
| [SUB_SHORTCUT_VISIBILITYBATCHPRODUCTIONSERVICE_0200](<entry/src/ohosTest/ets/test/VisibilityBatch.test.ets>)（源码第144行） | `testVisibilityBatchProductionService0002`<br>`com.samples.shortcut_VisibilityBatchProductionService_0002` | rejected write that already applied is confirmed by readback |
| [SUB_SHORTCUT_VISIBILITYBATCHPRODUCTIONSERVICE_0300](<entry/src/ohosTest/ets/test/VisibilityBatch.test.ets>)（源码第166行） | `testVisibilityBatchProductionService0003`<br>`com.samples.shortcut_VisibilityBatchProductionService_0003` | second item failure retries only failed item |
| [SUB_SHORTCUT_VISIBILITYBATCHPRODUCTIONSERVICE_0400](<entry/src/ohosTest/ets/test/VisibilityBatch.test.ets>)（源码第193行） | `testVisibilityBatchProductionService0004`<br>`com.samples.shortcut_VisibilityBatchProductionService_0004` | missing visible remains unknown until explicit reconcile |
| [SUB_SHORTCUT_VISIBILITYBATCHPRODUCTIONSERVICE_0500](<entry/src/ohosTest/ets/test/VisibilityBatch.test.ets#L217>) | `testVisibilityBatchProductionService0005`<br>`com.samples.shortcut_VisibilityBatchProductionService_0005` | compensation restores mixed original state not all visible |
| [SUB_SHORTCUT_VISIBILITYBATCHPRODUCTIONSERVICE_0600](<entry/src/ohosTest/ets/test/VisibilityBatch.test.ets#L243>) | `testVisibilityBatchProductionService0006`<br>`com.samples.shortcut_VisibilityBatchProductionService_0006` | failed compensation remains partial and can be previewed again |
| [SUB_SHORTCUT_VISIBILITYBATCHPRODUCTIONSERVICE_0700](<entry/src/ohosTest/ets/test/VisibilityBatch.test.ets#L269>) | `testVisibilityBatchProductionService0007`<br>`com.samples.shortcut_VisibilityBatchProductionService_0007` | unknown original never compensates to assumed default |
| [SUB_SHORTCUT_VISIBILITYBATCHPRODUCTIONSERVICE_0800](<entry/src/ohosTest/ets/test/VisibilityBatch.test.ets#L292>) | `testVisibilityBatchProductionService0008`<br>`com.samples.shortcut_VisibilityBatchProductionService_0008` | external change requires choice and post confirm change invalidates preview |
| [SUB_SHORTCUT_VISIBILITYBATCHPRODUCTIONSERVICE_0900](<entry/src/ohosTest/ets/test/VisibilityBatch.test.ets#L322>) | `testVisibilityBatchProductionService0009`<br>`com.samples.shortcut_VisibilityBatchProductionService_0009` | reopen never replays and sequence cannot reuse stored id |
| [SUB_SHORTCUT_VISIBILITYBATCHPRODUCTIONSERVICE_1000](<entry/src/ohosTest/ets/test/VisibilityBatch.test.ets#L352>) | `testVisibilityBatchProductionService0010`<br>`com.samples.shortcut_VisibilityBatchProductionService_0010` | storage failure stops before sdk or leaves durable unknown marker |
| [SUB_SHORTCUT_VISIBILITYBATCHPRODUCTIONSERVICE_1100](<entry/src/ohosTest/ets/test/VisibilityBatch.test.ets#L380>) | `testVisibilityBatchProductionService0011`<br>`com.samples.shortcut_VisibilityBatchProductionService_0011` | old generation write cannot commit results into reopened service |
| [SUB_SHORTCUT_VISIBILITYBATCHPRODUCTIONSERVICE_1200](<entry/src/ohosTest/ets/test/VisibilityBatch.test.ets#L410>) | `testVisibilityBatchProductionService0012`<br>`com.samples.shortcut_VisibilityBatchProductionService_0012` | readback timeout is unknown and late result does not overwrite |
| [SUB_SHORTCUT_VISIBILITYBATCHPRODUCTIONSERVICE_1300](<entry/src/ohosTest/ets/test/VisibilityBatch.test.ets#L434>) | `testVisibilityBatchProductionService0013`<br>`com.samples.shortcut_VisibilityBatchProductionService_0013` | terminal permission failure cannot loop in failed retry |
| [SUB_SHORTCUT_VISIBILITYBATCHPRODUCTIONSERVICE_1400](<entry/src/ohosTest/ets/test/VisibilityBatch.test.ets#L457>) | `testVisibilityBatchProductionService0014`<br>`com.samples.shortcut_VisibilityBatchProductionService_0014` | corrupt journal preserved and history bounded |
| [SUB_SHORTCUT_VISIBILITYBATCHPRODUCTIONSERVICE_1500](<entry/src/ohosTest/ets/test/VisibilityBatch.test.ets#L481>) | `testVisibilityBatchProductionService0015`<br>`com.samples.shortcut_VisibilityBatchProductionService_0015` | write timeout never retries while original call is still in flight |
| [SUB_SHORTCUT_VISIBILITYBATCHPRODUCTIONSERVICE_1600](<entry/src/ohosTest/ets/test/VisibilityBatch.test.ets#L510>) | `testVisibilityBatchProductionService0016`<br>`com.samples.shortcut_VisibilityBatchProductionService_0016` | telemetry failure does not change business and successful begins are finished |

### [CaseLifecycle.test.ets](<entry/src/ohosTest/ets/test/CaseLifecycle.test.ets>) — 12条

对应场景：S11。新增失败优先级、超时和清理故障覆盖，不替换原713条用例。

| 编号 / 源码定位 | 原名称 / 规范运行名 | 覆盖点 |
|---|---|---|
| [SUB_SHORTCUT_CASELIFECYCLE_0100](<entry/src/ohosTest/ets/test/CaseLifecycle.test.ets#L37>) | `testCaseLifecycle0001`<br>`com.samples.shortcut_CaseLifecycle_0001` | Successful body completes every cleanup in the declared order. |
| [SUB_SHORTCUT_CASELIFECYCLE_0200](<entry/src/ohosTest/ets/test/CaseLifecycle.test.ets#L48>) | `testCaseLifecycle0002`<br>`com.samples.shortcut_CaseLifecycle_0002` | A body error is rethrown unchanged after successful cleanup. |
| [SUB_SHORTCUT_CASELIFECYCLE_0300](<entry/src/ohosTest/ets/test/CaseLifecycle.test.ets#L64>) | `testCaseLifecycle0003`<br>`com.samples.shortcut_CaseLifecycle_0003` | Cleanup-only failure propagates and cannot skip a later cleanup. |
| [SUB_SHORTCUT_CASELIFECYCLE_0400](<entry/src/ohosTest/ets/test/CaseLifecycle.test.ets#L80>) | `testCaseLifecycle0004`<br>`com.samples.shortcut_CaseLifecycle_0004` | Dual failure preserves the original assertion rather than replacing it with cleanup. |
| [SUB_SHORTCUT_CASELIFECYCLE_0500](<entry/src/ohosTest/ets/test/CaseLifecycle.test.ets#L96>) | `testCaseLifecycle0005`<br>`com.samples.shortcut_CaseLifecycle_0005` | An asynchronous cleanup rejection is awaited before remaining cleanup and rethrow. |
| [SUB_SHORTCUT_CASELIFECYCLE_0600](<entry/src/ohosTest/ets/test/CaseLifecycle.test.ets>)（源码第112行） | `testCaseLifecycle0006`<br>`com.samples.shortcut_CaseLifecycle_0006` | Throwing undefined is a real body failure, not the no-error sentinel. |
| [SUB_SHORTCUT_CASELIFECYCLE_0700](<entry/src/ohosTest/ets/test/CaseLifecycle.test.ets>)（源码第127行） | `testCaseLifecycle0007`<br>`com.samples.shortcut_CaseLifecycle_0007` | Throwing null from cleanup is also propagated rather than swallowed. |
| [SUB_SHORTCUT_CASELIFECYCLE_0800](<entry/src/ohosTest/ets/test/CaseLifecycle.test.ets>)（源码第140行） | `testCaseLifecycle0008`<br>`com.samples.shortcut_CaseLifecycle_0008` | Scope cleanup remains reverse-ordered and idempotent after completion. |
| [SUB_SHORTCUT_CASELIFECYCLE_0900](<entry/src/ohosTest/ets/test/CaseLifecycle.test.ets>)（源码第155行） | `testCaseLifecycle0009`<br>`com.samples.shortcut_CaseLifecycle_0009` | runCase preserves body error while all reverse-ordered failing cleanup actions run. |
| [SUB_SHORTCUT_CASELIFECYCLE_1000](<entry/src/ohosTest/ets/test/CaseLifecycle.test.ets>)（源码第173行） | `testCaseLifecycle0010`<br>`com.samples.shortcut_CaseLifecycle_0010` | Watchdog timeout releases subscriptions and propagates a failure after cleanup. |
| [SUB_SHORTCUT_CASELIFECYCLE_1100](<entry/src/ohosTest/ets/test/CaseLifecycle.test.ets>)（源码第191行） | `testCaseLifecycle0011`<br>`com.samples.shortcut_CaseLifecycle_0011` | Scope cleanup-only failure propagates unchanged after all remaining actions. |
| [SUB_SHORTCUT_CASELIFECYCLE_1200](<entry/src/ohosTest/ets/test/CaseLifecycle.test.ets#L209>) | `testCaseLifecycle0012`<br>`com.samples.shortcut_CaseLifecycle_0012` | Timeout remains primary when subscription cleanup also fails. |

### [RunnerFilter.test.ets](<entry/src/ohosTest/ets/test/RunnerFilter.test.ets>) — 4条

对应场景：S12。纯参数辅助器用例不调用原生能力，不改变测试应用身份。

| 原编号 / 源码定位 | 原名称 / 规范运行名 | 覆盖点 |
|---|---|---|
| [SUB_SHORTCUT_RUNNERFILTER_0100](<entry/src/ohosTest/ets/test/RunnerFilter.test.ets#L23>) | `testRunnerFilter0001`<br>`com.samples.shortcut_RunnerFilter_0001` | 精确旧叶名映射且保留套件限定。 |
| [SUB_SHORTCUT_RUNNERFILTER_0200](<entry/src/ohosTest/ets/test/RunnerFilter.test.ets#L32>) | `testRunnerFilter0002`<br>`com.samples.shortcut_RunnerFilter_0002` | 逗号列表、无套件叶名及外围空白。 |
| [SUB_SHORTCUT_RUNNERFILTER_0300](<entry/src/ohosTest/ets/test/RunnerFilter.test.ets#L44>) | `testRunnerFilter0003`<br>`com.samples.shortcut_RunnerFilter_0003` | 未知、相似、规范名称、原型键及非法分隔组合不扩大筛选。 |
| [SUB_SHORTCUT_RUNNERFILTER_0400](<entry/src/ohosTest/ets/test/RunnerFilter.test.ets#L57>) | `testRunnerFilter0004`<br>`com.samples.shortcut_RunnerFilter_0004` | class/testCaseNames映射，timeout、flags、应用与Runner标识保真。 |
