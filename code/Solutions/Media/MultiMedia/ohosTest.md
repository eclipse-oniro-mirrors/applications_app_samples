# MultiMedia 测试用例归档

## 本轮范围与真实结果

验证日期：2026-11-19.

- 新增 22 个确定性逻辑套件、958 条逻辑用例，保留原有 7 条可选 UI 用例.
- 主 HAP 和 ohosTest HAP 均实际编译通过：OpenHarmony API 26、SDK 26.0.0.38，使用 `--no-daemon`. 仍有旧 SDK 接口和 Hypium 依赖告警，编译通过不表示零告警.
- 主机回归：958/958 Pass，0 Failure，12,454 条断言，0 意外真实文件系统、媒体库或录音器调用.
- 设备逻辑回归：22 个套件、958/958 Pass，0 Failure/Error/Ignore，运行器 OHOS_REPORT_CODE 为 0；958 个唯一用例的开始和通过记录与源码编号逐一一致.
- 默认测试入口的 9 种 class 选择检查全部通过；这只是注册路由检查，不是 UI 功能验证.
- 前次附加主机检查为 16/16 Pass；本次重跑在权限清单检查失败，未完成其余检查. 该失败源于 [module.json5](entry/src/main/module.json5#L53) 曾被外部改为只声明 CAMERA、MICROPHONE，而 MainAbility 请求五项权限. 本次检视修复已恢复 MEDIA_LOCATION、READ_IMAGEVIDEO、WRITE_IMAGEVIDEO 声明，五项请求与声明重新一致；恢复后的附加检查与安装验收尚未重跑.
- 本次仅更新设备 entry_test 测试模块，安装成功；未部署重新构建的主包，未新增或删除权限、未更改签名凭据、未卸载应用或清除设备数据，未提交或推送代码.
- 原 UI、真实相机、视频和麦克风功能未验证；当前权限清单不一致仍是完整功能验收的未解决项.

主机和设备逻辑 Pass 都不等于真实硬件或界面功能已通过. 原文档中的 ReminderAgentManager 标题、闹钟场景及未经本轮验证的 UI Pass 已移除.

## 1196–1199 设备失败修复

四条用例分别覆盖图片、视频创建时关闭查询结果失败的两个变体. 修复前设备定点运行结果为 4 Failure；断言前日志均为 `Fetch finally close attempts expected=1 actual=2`，不是类型映射或期望值错误.

[MediaUtils.getAssetByUri](entry/src/main/ets/model/MediaUtils.ts#L287)原先在 try 内 return，finally 中 close 抛错时，设备实际执行了两次关闭. 将成功 return 移到 try/finally 之后，保留空结果验证、获取失败也关闭、关闭错误向调用方传播，以及关闭成功后才读取句柄元数据的行为. 未修改用例编号、断言、替身或生成器，也未将关闭次数放宽为 2.

修复后重新编译主包和测试包，仅更新设备测试模块：四条定点用例 4/4 Pass；随后默认 958 条逻辑用例全部通过. 主机 958 条逻辑回归及 12,454 条断言通过，0 意外原生调用. 默认入口未注册 UI 删除用例.

## 权限部署历史与当前风险

此前 unsigned HAP 安装因 9568320/no signature file 失败；配置签名后，14:04 的 signed HAP 安装因 9568289/READ_AUDIO 失败. [音频业务](entry/src/main/ets/model/MediaUtils.ts#L278)只访问应用沙箱，已移除不需要的 READ_AUDIO、WRITE_AUDIO. 当时主包保留五项功能权限，主机附加检查 16/16 通过. API 26 的 READ_IMAGEVIDEO、WRITE_IMAGEVIDEO 支持 provision 授权，完整媒体库功能需合法的签名 profile 授权，不能用运行时弹窗解决安装阶段的权限授权失败.

本次四条失败修复期间发现，[module.json5](entry/src/main/module.json5#L53)已经被外部改为只声明 CAMERA、MICROPHONE，而 [MainAbility](entry/src/main/ets/MainAbility/MainAbility.ts#L22)仍申请 MEDIA_LOCATION、READ_IMAGEVIDEO、WRITE_IMAGEVIDEO 等五项权限. 本次检视修复已恢复这三项声明，使声明与运行时请求一致；未通过降低检查强度掩盖问题. 安装阶段仍需合法的签名 profile 才能使用媒体库能力；保留功能需单独验收真实图片、视频操作.

## 测试结构与编号

入口：[List.test.ets](entry/src/ohosTest/ets/test/List.test.ets).

每条逻辑用例包含唯一的 `@tc.number`、用例名称、场景描述、FUNCTION/MEDIUMTEST/LEVEL0 元数据，输入日志和断言前日志. 完整的单条用例输入、步骤及具体期望值在下面链接的源文件中，可按编号检索.

编号空间：

- `SUB_SYS_MULTIMEDIA_CORE_`：622 条数据源、日期、时间、补零和时长用例.
- `SUB_SYS_MULTIMEDIA_MEDIA_1000` 至 `1219`：220 条媒体操作用例.
- `SUB_SYS_MULTIMEDIA_RECORD_1000` 至 `1115`：116 条录音用例；保留原 105 个编号，追加 11 条并发回归.
- `SUB_SYS_MULTIMEDIA_UI_`：原 7 条 UI 用例，不计入本轮 958 条逻辑结果.

## 逻辑套件目录

以下结果均为 **主机业务逻辑回归**，不是设备测试结果.

| 套件/源文件 | 数量 | 输入与步骤 | 预期结果 | 主机结果 |
| --- | ---: | --- | --- | --- |
| [CalendarDate1Logic](entry/src/ohosTest/ets/test/CalendarDate1Logic.test.ets) | 60 | 不同年份、月份及月底日期值调用真实日期格式化 | 与独立构造的矩阵期望值一致 | 60 Pass |
| [CalendarDate2Logic](entry/src/ohosTest/ets/test/CalendarDate2Logic.test.ets) | 12 | 闰年、跨月和日期组件组合 | 日期组件及补零正确，不污染后续调用 | 12 Pass |
| [ClockTime1Logic](entry/src/ohosTest/ets/test/ClockTime1Logic.test.ets) | 64 | 小时、分钟、秒矩阵 | 六位时分秒字符串与期望一致 | 64 Pass |
| [ClockTime2Logic](entry/src/ohosTest/ets/test/ClockTime2Logic.test.ets) | 32 | 特殊时间组件和重复调用 | 组件顺序、补零及调用隔离符合既有契约 | 32 Pass |
| [DataSourceDeletion1Logic](entry/src/ohosTest/ets/test/DataSourceDeletion1Logic.test.ets) | 65 | 空数组、正负索引和删除数量矩阵 | splice 结果、剩余顺序及引用符合独立预期 | 65 Pass |
| [DataSourceDeletion2Logic](entry/src/ohosTest/ets/test/DataSourceDeletion2Logic.test.ets) | 65 | 越界索引、边界数量和对象数组 | 删除范围、长度和保留条目一致 | 65 Pass |
| [DataSourceDeletion3Logic](entry/src/ohosTest/ets/test/DataSourceDeletion3Logic.test.ets) | 38 | 连续删除、特殊数值及别名观察 | 每步数据变化和引用关系正确 | 38 Pass |
| [DataSourceInsertionLogic](entry/src/ohosTest/ets/test/DataSourceInsertionLogic.test.ets) | 56 | 不同位置插入、追加及边界索引 | 插入顺序、长度和通知索引符合契约 | 56 Pass |
| [DataSourceListenerLogic](entry/src/ohosTest/ets/test/DataSourceListenerLogic.test.ets) | 48 | 注册、去重、解除及各类通知 | 回调对象、次数、参数和顺序正确 | 48 Pass |
| [DataSourceStorageLogic](entry/src/ohosTest/ets/test/DataSourceStorageLogic.test.ets) | 32 | 设置/读取数组和条目，修改外部别名 | 保留既有引用语义，不自动发送未约定通知 | 32 Pass |
| [DataSourceWorkflowLogic](entry/src/ohosTest/ets/test/DataSourceWorkflowLogic.test.ets) | 40 | 多实例、增删改和监听器组合 | 数据隔离、别名及通知序列正确 | 40 Pass |
| [DurationBoundaryLogic](entry/src/ohosTest/ets/test/DurationBoundaryLogic.test.ets) | 79 | 毫秒、秒/分/时边界、负数和非有限值 | 正常格式和既有特殊值行为符合独立期望 | 79 Pass |
| [MediaDescriptorsDeletionLogic](entry/src/ohosTest/ets/test/MediaDescriptorsDeletionLogic.test.ets) | 44 | 文件句柄开关、媒体/沙箱删除及故障注入 | fd、模式、后端、调用序列与异常契约正确 | 44 Pass |
| [MediaFailureWorkflowsLogic](entry/src/ohosTest/ets/test/MediaFailureWorkflowsLogic.test.ets) | 36 | 创建、获取、枚举、提交、关闭等边界拒绝 | 返回/抛错符合契约，查询结果释放及实例隔离正确 | 36 Pass |
| [MediaListingAlbumsLogic](entry/src/ohosTest/ets/test/MediaListingAlbumsLogic.test.ets) | 48 | 混合文件后缀、媒体类型、元数据和相册集合 | 筛选、映射、相册顺序与计数正确 | 48 Pass |
| [MediaMappingCreationLogic](entry/src/ohosTest/ets/test/MediaMappingCreationLogic.test.ets) | 48 | 类型、日期、上下文、原生返回值及非法类型 | 后端、名称、fd、精确 URI 等值查询及锁重载行为正确 | 48 Pass |
| [MediaRenameMetadataLogic](entry/src/ohosTest/ets/test/MediaRenameMetadataLogic.test.ets) | 44 | 扩展名、路径分隔符、控制字符及提交/重命名拒绝 | 合法名称正确更新，非法输入拒绝，失败不提前修改状态 | 44 Pass |
| [NumericPaddingLogic](entry/src/ohosTest/ets/test/NumericPaddingLogic.test.ets) | 30 | 数值边界、小数、NaN 和无穷大 | 两种补零函数的既有行为正确且不相互混淆 | 30 Pass |
| [RecorderConfigLogic](entry/src/ohosTest/ets/test/RecorderConfigLogic.test.ets) | 35 | fd、配置修改和多实例准备 | 配置值、fd URL 及每次调用的配置对象隔离正确 | 35 Pass |
| [RecorderLifecycleLogic](entry/src/ohosTest/ets/test/RecorderLifecycleLogic.test.ets) | 46 | 空闲/活动状态、故障、阻塞工厂、重复清理及重新初始化 | 非活动状态直接释放，活动状态 stop/reset/release；取消过期初始化、共享清理、晚到事件无效 | 46 Pass |
| [RecorderStateLogic](entry/src/ohosTest/ets/test/RecorderStateLogic.test.ets) | 35 | 真实模型接收准备、开始、暂停、错误及旧实例事件 | 命令/回调次数、路由及旧实例隔离正确 | 35 Pass |
| [SystemClockLogic](entry/src/ohosTest/ets/test/SystemClockLogic.test.ets) | 1 | 调用前后系统时钟取样 | 输出位宽、数字组成及时间范围正确，跨秒/跨午夜可接受 | 1 Pass |
| **合计** | **958** | | | **958 Pass / 0 Failure** |

## 依赖边界与测试方法

- 日期、时间、数据源、MediaUtils 和 RecordModel 调用真实生产源码，而不是在 fake 内复制业务算法.
- 文件系统、媒体库及录音器在原生边界注入类型化替身；故障和阻塞由显式配置控制，不调用真实媒体库、录音器或文件删除接口.
- URI 查询用观察型 predicates 检查精确字段和 URI，而非仅检查谓词存在. 文件描述符实现 SDK File 接口，包含 Promise 和两种 callback 锁重载，不使用 any/unknown 强制转换绕过编译.
- 录音状态注入替身用于事件矩阵；生命周期契约替身对非法 stop/reset 状态报错，避免空闲状态结束被宽松替身掩盖.
- 每个套件在 beforeEach 让出一次事件循环，随后逐用例执行断言. 主机执行器对未知断言、重复用例、无断言用例和意外原生 API 调用直接失败.
- 负数、NaN、Infinity 等时长/补零用例是对既有行为的表征，不表示这些值是录音页面的正常业务输入.

## 编译与设备执行步骤

1. 准备支持 API 26 的 DevEco Studio、SDK 和 `@ohos/hypium` 1.0.6 依赖.
2. 在本机已忽略的 local.properties 配置 SDK 根目录；当前工作站使用 `sdk.dir=E:/sdk`.
3. 在工程根目录编译主包和测试包：

```bash
hvigorw --mode module -p module=entry@default -p product=default -p buildMode=debug assembleHap --no-daemon
hvigorw --mode module -p module=entry@ohosTest -p product=default -p buildMode=debug assembleHap --no-daemon
```

4. **设备执行前**，在 IDE 配置合法的 OpenHarmony 签名，重新生成可安装的主包和测试包. 不要提交签名密钥、证书口令或本机 SDK 路径.
5. 使用 IDE 安装同一次构建的 entry 主模块和 entry_test 测试模块；不需要为逻辑测试安装外部相机或播放器. 不通过卸载/清数据绕过签名不匹配.
6. 签名和安装成功后，在 DevEco Studio 中选择 `entry_test` 测试配置并运行全部用例，测试框架参数为 `-s unittest /ets/testrunner/OpenHarmonyTestRunner`.

该配置已在四条关闭异常用例修复后实际执行：22 个套件、958 Pass，0 Failure/Error/Ignore，OHOS_REPORT_CODE 为 0；开始和通过记录与源码编号逐一核对一致. Hvigor 实际生成的 runner 为 OpenHarmonyTestRunner，模块名为 entry_test. 不传 class 时注册 22 个逻辑套件，排除原 UI 套件；IDE “运行全部”的混合 class 选择也排除 UI.

7. 设备结果需独立核对实际用例名称、22 个套件、958 条结束记录、Failure/Error/Ignore 数量及运行器最终状态. 未取得设备报告前不得写为设备 Pass.

## 原有 UI 套件的安全边界

- 只有 class 选择全部属于 `MultiMediaUiTest` 时才注册原套件. 默认和混合选择不注册 UI.
- 原套件保留 7 条用例，包含文档创建、重命名和删除. 新增 beforeAll 严格检查沙箱中没有既有 `.txt` 文件；存在文档或枚举失败会阻止执行，避免删除用户原有文档.
- 仅使用可丢弃的隔离测试安装，不与用户同时编辑文件，也不要用卸载/清数据自动满足前置条件.
- 单独选择依赖先前创建文件的 UI 用例可能缺少预置数据. 本轮没有宣称这些旧 UI 场景具备独立可运行性.
- 真实相机、录像、麦克风、外部 CameraPage/VideoPlayer 应用及权限弹窗需要独立设备验证；本轮均未执行. 主机提取页面方法的检查不能替代触摸交互或硬件检查.

## pr-review_origin 检视与修复记录

实现并编译通过后，执行 pr-review_origin 的各检视子技能及其适用的 PR 分支检查，并独立检查录音生命周期及测试期望. 下列为本轮确认并已修复的问题；链接指向当前源码.

| 等级 | 问题与原因 | 修复与复验 |
| --- | --- | --- |
| 必须修改 | [RecordModel 初始化](entry/src/main/ets/model/RecordModel.ts#L94)在工厂等待期间被释放后仍安装过期对象；倒序完成也可能覆盖新对象 | 初始化世代检查，释放过期结果；阻塞工厂/取消/倒序完成回归通过 |
| 必须修改 | [RecordModel 清理](entry/src/main/ets/model/RecordModel.ts#L156)重复 finish 导致重复 stop/reset/release，重新初始化可能早于释放完成 | 立即移除活动对象，共享清理 Promise，调用方等待同一工作；并发及故障回归通过 |
| 必须修改 | [RecordModel finish](entry/src/main/ets/model/RecordModel.ts#L226)空闲状态也调用 stop，宽松 fake 掩盖原生状态约束；清理期间回调仍生效 | 按已观察状态选择清理序列，晚到 prepared/started/paused 不再启动或回调；契约 fake 验证通过 |
| 必须修改 | [RecordPage 清理](entry/src/main/ets/pages/RecordPage.ets#L71)未等待录音结束就关闭 fd，页面退出可能重复关闭或留下计时器 | 结束后 finally 关闭一次，清除计时器，捕捉异步错误；实际方法主机检查通过，设备交互未测 |
| 必须修改 | [Logger 格式](entry/src/main/ets/model/Logger.ts#L20)把参数数组作为一个格式参数，且公开打印包含媒体路径的消息 | 使用两个 string 参数分别传递，消息标记 private，去除 any；四级日志检查通过 |
| 必须修改 | [AlbumPage](entry/src/main/ets/pages/AlbumPage.ets#L59)删除未完成就移除列表，Documents 列表和计数筛选不一致，含 console.log | 删除后重新查询真实列表，按 FILE 后缀过滤，移除调试输出；编译通过，设备交互未测 |
| 必须修改 | [DocumentPage 保存](entry/src/main/ets/pages/DocumentPage.ets#L29)写入失败漏关 fd，异步错误未处理 | finally 关闭，写入成功后才返回，调用点捕捉错误；成功/失败/无文件主机检查通过 |
| 必须修改 | [精确 URI 查询](entry/src/main/ets/model/MediaUtils.ts#L287)的测试只判断 predicates 存在，不能发现漏掉 URI 条件 | 注入观察型查询构造器，检查 URI 字段、值和谓词对象身份；媒体用例通过 |
| 必须修改 | [File 替身](entry/src/ohosTest/ets/utils/MediaFakes.ets#L82)与 SDK File.lock 重载不兼容 | 完整实现 File 接口，去除 descriptor cast；Promise/callback 分支回归及 ETS 编译通过 |
| 必须修改 | 测试归档错误地描述其余工程并标记未验证的 UI Pass | 重写本文件，区分主机、编译、设备和 UI 结果 |

逻辑扩展阶段确认的 10 类必须修改问题均已修复并复验；本次另修复关闭异常时重复清理，设备逻辑回归 958/958 通过. 权限声明已恢复为与 MainAbility 请求一致的五项，恢复后的安装与真机媒体功能仍待单独验收. 版权、逻辑用例编号唯一性、元数据数量、120 列行宽、断言前日志和入口选择均完成检查. README 已同步工程用途、权限、构建、下载路径及签名限制. 本轮未提供 PR 链接，PR 提交格式、远端目标分支及远端合入门禁不适用；未执行远端操作.

既有相机/录像硬件实现和旧接口未在本轮迁移，也未做全工程 UI 重构. 这份记录不是对全部旧代码、真实硬件或设备安装的完整验收.

## 改动量口径

工程目录不是 Git 仓库，统计依据修改前的 SHA256/文本行数清单，不是 git diff. 排除依赖、构建、缓存及 IDE 目录后，逻辑补充完成时（本次权限修复及用户配置签名前）的源码与文档文本净增 **56,324 行**，其中逻辑套件 **55,183 行**. 用例执行日志、断言日志和完整测试元数据计入源码行数，不以空行、自比较断言或复制业务算法充数.
