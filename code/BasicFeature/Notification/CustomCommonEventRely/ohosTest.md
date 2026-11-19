# CustomCommonEventRely 测试用例归档

## 测试环境

| 项 | 值 |
|---|---|
| 被测工程 | `CustomCommonEventRely`（bundleName：`com.samples.customcommoneventrely`） |
| 测试模块 | `entry/src/ohosTest`（moduleName：`entry_test`） |
| 测试框架 | Hypium 1.0.6（`@ohos/hypium`）、Hamock（`@ohos/hamock`） |
| 运行器 | `OpenHarmonyTestRunner`（`./ets/testrunner/OpenHarmonyTestRunner.ets`），已透传 `-s class/-s it/-s level/-s size/-s timeout` 等过滤参数 |
| SDK | API 26（`compileSdkVersion` / `compatibleSdkVersion` 均为 26） |
| 设备类型 | `default`、`tablet` |
| 构建结果 | `devecocli build --modules entry@ohosTest` → `BUILD SUCCESSFUL` |
| 真机结果 | 已执行（2026-11-18，用户授权）：分 6 批执行 1537 条用例，全部通过，失败 0、错误 0，详见下文“真机验证结果” |

分层约定：逻辑层套件直接 import `entry/src/main/ets` 的导出（核心与组合流程套件声明 `Size.SMALLTEST`，其余声明 `Size.MEDIUMTEST`），页面套件通过 `@ohos.UiTest` 的 `Driver` 与组件 `id` 操作首页（`Size.MEDIUMTEST`），逻辑层套件排在页面套件之前。

## 用例概览（套件 → 用例数）

| 套件（describe） | 文件 | 用例编号前缀 | 用例数 | 覆盖范围 |
|---|---|---|---|---|
| ConstantsCoreTest | ConstantsCore.test.ets | SUB_CCER_CONST_0001 ~ 0014 | 14 | 事件契约、来源码、布局常量 |
| EventRecordCoreTest | EventRecordCore.test.ets | SUB_CCER_RECORD_0001 ~ 0016 | 16 | 记录新增、容量淘汰、时间格式化 |
| PublisherCoreTest | PublisherCore.test.ets | SUB_CCER_PUBLISH_0001 ~ 0014 | 14 | 发布数据构建、真实事件发布与接收 |
| FormServiceCoreTest | FormServiceCore.test.ets | SUB_CCER_FORM_0001 ~ 0016 | 16 | 卡片绑定数据、卡片消息解析与发布 |
| ResolveNameVolume01Test | ResolveNameVolume01.test.ets | SUB_CCER_RESOLVE_0001 ~ 0049 | 49 | 来源码 → 来源名映射 |
| DataLengthVolume01Test | DataLengthVolume01.test.ets | SUB_CCER_DLEN_0001 ~ 0041 | 41 | 事件数据长度上限 |
| FormatTimeVolume01Test | FormatTimeVolume01.test.ets | SUB_CCER_FTIME_0001 ~ 0045 | 45 | 本地时间补零格式化 |
| RecordCapacityVolume01Test | RecordCapacityVolume01.test.ets | SUB_CCER_CAP_0001 ~ 0041 | 41 | 记录容量与淘汰 |
| ParseEventDataVolume01Test | ParseEventDataVolume01.test.ets | SUB_CCER_PARSE_0001 ~ 0051 | 51 | 卡片消息解析 |
| BindingDataVolume01Test | BindingDataVolume01.test.ets | SUB_CCER_BIND_0001 ~ 0031 | 31 | 卡片绑定数据 |
| PublishDataVolume01Test | PublishDataVolume01.test.ets | SUB_CCER_PUBDATA_0001 ~ 0031 | 31 | 发布数据构建 |
| SupportedDataVolume01Test | SupportedDataVolume01.test.ets | SUB_CCER_SUPDATA_0001 ~ 0031 | 31 | 受支持数据判定 |
| TryAddVolume01Test | TryAddVolume01.test.ets | SUB_CCER_TRYADD_01_0001 ~ 0061 | 61 | 入库校验：空/超长数据与非整数来源码 |
| ClockVolume01Test | ClockVolume01.test.ets | SUB_CCER_CLOCK_01_0001 ~ 0031 | 31 | 注入时钟提供的接收时间 |
| SourceLabelVolume01Test | SourceLabelVolume01.test.ets | SUB_CCER_SRCKEY_01_0001 ~ 0031 | 31 | 来源码到资源键的映射 |
| LogSinkVolume01Test | LogSinkVolume01.test.ets | SUB_CCER_LOGSINK_01_0001 ~ 0026 | 26 | 日志级别与拼接后的消息 |
| HomeStateVolume01Test | HomeStateVolume01.test.ets | SUB_CCER_HSTATUS_01_0001 ~ 0060 | 60 | 首页状态机迁移与快照 |
| HomeStateVolume02Test | HomeStateVolume02.test.ets | SUB_CCER_HSTATUS_02_0001 ~ 0043 | 43 | 非法事件拒绝与记录容量 |
| ParseMessageVolume01Test | ParseMessageVolume01.test.ets | SUB_CCER_PARSEFMT_01_0001 ~ 0046 | 46 | 结构化解析结果的三元组 |
| ParseMessageVolume02Test | ParseMessageVolume02.test.ets | SUB_CCER_PARSEFMT_02_0001 ~ 0045 | 45 | 非法消息回落 OutApp |
| PublishValidateVolume01Test | PublishValidateVolume01.test.ets | SUB_CCER_PVALID_01_0001 ~ 0046 | 46 | 发布请求前置校验 |
| BindingCountVolume01Test | BindingCountVolume01.test.ets | SUB_CCER_BINDCHK_01_0001 ~ 0041 | 41 | 发布计数合法性校验 |
| FormCounterVolume01Test | FormCounterVolume01.test.ets | SUB_CCER_FCOUNTER_01_0001 ~ 0061 | 61 | 卡片计数增删与封顶 |
| FormRefreshVolume01Test | FormRefreshVolume01.test.ets | SUB_CCER_FREFRESH_01_0001 ~ 0031 | 31 | 卡片刷新载荷装配 |
| LogPageVolume01Test | LogPageVolume01.test.ets | SUB_CCER_LOGPAGE_01_0001 ~ 0031 | 31 | 页面生命周期与事件日志格式 |
| RecordPersistVolume01Test | RecordPersistVolume01.test.ets | SUB_CCER_PERSIST_01_0001 ~ 0031 | 31 | 记录存量序列化落盘 |
| RecordRestoreVolume01Test | RecordRestoreVolume01.test.ets | SUB_CCER_RSTREC_01_0001 ~ 0031 | 31 | 落盘文本回放与非法条目跳过 |
| RecordPersistVolume02Test | RecordPersistVolume02.test.ets | SUB_CCER_PERSIST_02_0001 ~ 0040 | 40 | 序列化文本内容域 |
| RecordRestoreVolume02Test | RecordRestoreVolume02.test.ets | SUB_CCER_RSTREC_02_0001 ~ 0040 | 40 | 非法条目分类学与 JSON 语义 |
| RecordCapacityVolume02Test | RecordCapacityVolume02.test.ets | SUB_CCER_CAP_02_0001 ~ 0045 | 45 | 容量 × 存量回放网格 |
| FormCounterVolume02Test | FormCounterVolume02.test.ets | SUB_CCER_FCOUNTER_02_0001 ~ 0045 | 45 | 多卡片上限计数网格 |
| ParseMessageVolume03Test | ParseMessageVolume03.test.ets | SUB_CCER_PARSEFMT_03_0001 ~ 0035 | 35 | 消息内容域 |
| PublishValidateVolume02Test | PublishValidateVolume02.test.ets | SUB_CCER_PVALID_02_0001 ~ 0030 | 30 | 事件名空白与长度内容域 |
| LogPageVolume02Test | LogPageVolume02.test.ets | SUB_CCER_LOGPAGE_02_0001 ~ 0030 | 30 | 事件 detail 内容域 |
| StatusLabelVolume01Test | StatusLabelVolume01.test.ets | SUB_CCER_STKEY_01_0001 ~ 0031 | 31 | 状态码到资源键映射 |
| PublishOptionsVolume01Test | PublishOptionsVolume01.test.ets | SUB_CCER_PUBOPT_01_0001 ~ 0051 | 51 | 参数化发布请求组装 |
| SubscriptionManagerVolume01Test | SubscriptionManagerVolume01.test.ets | SUB_CCER_SUBMGR_01_0001 ~ 0041 | 41 | 订阅迁移守卫与注入工厂 |
| FormPublisherVolume01Test | FormPublisherVolume01.test.ets | SUB_CCER_FORMPUB_01_0001 ~ 0026 | 26 | 注入发布器捕获 |
| RecordReal01Test | RecordReal01.test.ets | SUB_CCER_RECREAL_0001 ~ 0010 | 10 | 记录容量、序号与来源组合流程 |
| PublisherReal01Test | PublisherReal01.test.ets | SUB_CCER_PUBREAL_0001 ~ 0010 | 10 | 发布数据与真实事件投递流程 |
| FormReal01Test | FormReal01.test.ets | SUB_CCER_FORMREAL_0001 ~ 0010 | 10 | 卡片消息 → 发布 → 订阅全链路 |
| HomeModelReal01Test | HomeModelReal01.test.ets | SUB_CCER_HMREAL_0001 ~ 0010 | 10 | 首页状态机真实发布、并发守卫与拒绝分支 |
| ParseReal01Test | ParseReal01.test.ets | SUB_CCER_PREAL_0001 ~ 0010 | 10 | 卡片消息解析与真实投递链路 |
| FormCounterReal01Test | FormCounterReal01.test.ets | SUB_CCER_FCREAL_0001 ~ 0010 | 10 | 卡片计数与真实绑定数据联动 |
| RecordStoreReal01Test | RecordStoreReal01.test.ets | SUB_CCER_STORREAL_0001 ~ 0010 | 10 | 记录保存、回放与模型级持久化流程 |
| StatusLabelReal01Test | StatusLabelReal01.test.ets | SUB_CCER_STKEYREAL_0001 ~ 0006 | 6 | 状态键生命周期巡回与镜像常量 |
| PublishOptionsReal01Test | PublishOptionsReal01.test.ets | SUB_CCER_PUBOPTREAL_0001 ~ 0010 | 10 | 参数化发布真链路含拒绝与重试 |
| SubscriptionManagerReal01Test | SubscriptionManagerReal01.test.ets | SUB_CCER_SUBMGRREAL_0001 ~ 0010 | 10 | 订阅管理 await 面与工厂异常传播 |
| FormPublisherReal01Test | FormPublisherReal01.test.ets | SUB_CCER_FORMPUBREAL_0001 ~ 0008 | 8 | 发布器注入往返与默认链路恢复 |
| HomeUiTest | HomeUi.test.ets | SUB_CCER_UI_0001 ~ 0012 | 12 | 首页订阅、发布、清空、记录列表 |
| HomeUiExtTest | HomeUiExt.test.ets | SUB_CCER_UI_0013 ~ 0024 | 12 | 首页来源标签、订阅边界与条目序号补强 |

合计：51 个测试套件，1537 条用例。

## 输入域覆盖说明

各套件按被测方法的可观测输入域展开，不做复制 body、不拆断言；每个输入域另含 1 条边界或非法输入的补充用例，编号接在主体用例之后连续。

| 输入域 | 套件 | 展开规则（期望值来源） | 用例数 | 边界用例 |
|---|---|---|---|---|
| RESOLVE | ResolveNameVolume01Test | 来源码 1001 → `form`、1002 → `page`、其余 → `external`（spec） | 49 | 越界码与契约码同例校验 |
| DLEN | DataLengthVolume01Test | 长度 ≤ 65536 为有效，65537 起无效（main 冻结） | 41 | 64 KiB 两侧 + 多字节口径 |
| FTIME | FormatTimeVolume01Test | 本地 HH:mm:ss 逐位补零（main 冻结） | 45 | 闰日、跨日不渗日期 |
| CAP | RecordCapacityVolume01Test | 容量 C 写 N 条保留 min(N, C) 条，序号不回退（状态推演） | 41 | 非法容量回落 + 序号连续性 |
| PARSE | ParseEventDataVolume01Test | JSON 中非空 `data` 字段原样返回，否则 `OutApp`（main 冻结） | 51 | null、数组、原始值、单空格 |
| BIND | BindingDataVolume01Test | `publishCount` 原值透传，结果为 `{"data":{"publishCount":N}}`（main 冻结） | 31 | 安全整数上界 + 32 位下界 |
| PUBDATA | PublishDataVolume01Test | `data`/`code`/`isOrdered` 原样写入，字段序 code → data → isOrdered（main 冻结） | 31 | 省略有序参数取默认值 |
| SUPDATA | SupportedDataVolume01Test | 仅 `InApp`、`OutApp` 判定为受支持，大小写与空白敏感（spec） | 31 | 大小写、内部空格全否 |
| TRYADD | TryAddVolume01Test | 空数据、超 64 KiB 数据与非整数来源码被拒绝并给出原因，合法输入入库且序号递增（main 冻结） | 61 | 合法数据入库后记录数与序号可读 |
| CLOCK | ClockVolume01Test | 未显式传入时间戳时取注入时钟值，显式时间戳优先（main 冻结） | 31 | 显式时间戳优先于注入时钟 |
| SRCKEY | SourceLabelVolume01Test | 来源码 1001 → `source_form`、1002 → `source_page`、其余 → `source_external`（main 冻结） | 31 | 表单来源键与常量一致 |
| LOGSINK | LogSinkVolume01Test | 未设置 sink 时不投递，设置后按写入顺序保存级别与 `, ` 拼接消息（main 冻结） | 26 | 多条日志按写入顺序保存 |
| HSTATUS | HomeStateVolume01Test | 订阅、发布、接收、清空的状态迁移与快照字段（main 冻结） | 60 | 订阅后连续接收两条事件 |
| HSTATUS2 | HomeStateVolume02Test | 空数据、超长数据与非整数来源码被拒绝，记录列表按容量淘汰（main 冻结） | 43 | 容量 2 时最旧记录被移除 |
| PARSEFMT | ParseMessageVolume01Test | 解析结果的三元组（数据、有效标记、原因）随消息内容变化（main 冻结） | 46 | 点击消息携带 OutApp 时解析成功 |
| PARSEFMT2 | ParseMessageVolume02Test | 空消息、缺字段、非字符串与非法 JSON 回落 `OutApp` 并给出原因（main 冻结） | 45 | 64 KB 载荷解析成功且与便捷方法一致 |
| PVALID | PublishValidateVolume01Test | 空事件名、首尾空格与超 64 KiB 数据被拒绝，合法请求放行（main 冻结） | 46 | 64 KB 事件数据通过长度校验 |
| BINDCHK | BindingCountVolume01Test | 仅非负安全整数计数可用，负数、小数、NaN、Infinity 与越界值被拒（main 冻结） | 41 | 合法计数可直接用于绑定数据 |
| FCOUNTER | FormCounterVolume01Test | 每张卡片独立计数、上限封顶、移除与清空归零（main 冻结） | 61 | 两张卡片各自计数互不干扰 |
| FREFRESH | FormRefreshVolume01Test | 刷新载荷的 `publishCount` 等于该卡片当前计数（main 冻结） | 31 | 刷新载荷携带累加后的计数与卡片标识 |
| LOGPAGE | LogPageVolume01Test | enter/leave/show/hide/event 按页面名展开，消息为 `[页] 动作` 固定前缀（main 冻结） | 31 | 生命周期与事件日志按调用顺序保存 |
| PERSIST | RecordPersistVolume01Test | 存量 N 条保存后存储文本回读条数一致，文本仅含 data/sourceCode/receivedTime（main 冻结） | 31 | 保存后可反序列化并保持末条序号 |
| RSTREC | RecordRestoreVolume01Test | 合法条目回放重排序号，缺字段与非法类型条目被跳过（main 冻结） | 31 | 容量 3 回放 5 条时仅留最新 3 条且末序号保持 5 |
| PERSIST2 | RecordPersistVolume02Test | 特殊内容（反斜杠、控制字符、超长）序列化后保持到达顺序（main 冻结） | 40 | 三条特殊内容保持到达顺序 |
| RSTREC2 | RecordRestoreVolume02Test | 非法条目分类学：缺字段、类型错、`1e999` 被拦、`1e3`/`-0`/`9007199254740992` 保留、重复键后值生效（main 冻结 + JSON 语义） | 40 | 五条混合保两条序号连续 |
| CAP2 | RecordCapacityVolume02Test | 容量 C ∈ {1,2,3,5,20,30} × 存量 N 回放裁剪最新且序号原值（状态推演） | 45 | 容量 4 回放 9 条保最新 4 条且序号原值 |
| FCOUNTER2 | FormCounterVolume02Test | 上限 ∈ {4,6,7,8,9,10} 的多卡片计数互不影响（main 冻结） | 45 | 上限 5 三卡计数互不影响 |
| PARSEFMT3 | ParseMessageVolume03Test | 引号、反斜杠、换行、中文、emoji 消息内容域原样解析（main 冻结） | 35 | 引号内容与结构化消息独立解析 |
| PVALID2 | PublishValidateVolume02Test | 事件名内部空白放行、首尾空白被拒（trim 仅删 WhiteSpace：U+00A0/U+3000 拦、U+200B 过），事件名空格错误优先于数据超长（spec） | 30 | 同一份数据下带空格名称被拒而零宽字符名称通过 |
| LOGPAGE2 | LogPageVolume02Test | event detail 内容域按页名 × 级别展开（main 冻结） | 30 | enter+event 按调用顺序写入 sink |
| STKEY | StatusLabelVolume01Test | 状态码 0~8 → `status_` 前缀唯一资源键，未知值回退 READY（main 冻结） | 31 | 状态生命周期五键依次取出 |
| PUBOPT | PublishOptionsVolume01Test | `buildRequest` 四字段装配：默认事件名与 ordered 回落、空名/空格名透传、来源码与数据网格（main 冻结） | 51 | 四字段齐备逐项组装 |
| SUBMGR | SubscriptionManagerVolume01Test | 注入工厂 reject/throw 双模式下的调用计数、`[EVENT_NAME]` 契约与 `isSubscribed` 守卫（main 冻结） | 41 | 启动失败停止忽略再启动序列 |
| FORMPUB | FormPublisherVolume01Test | 注入发布器捕获 data 透传、固定来源码 1001 与调用计数（main 冻结） | 26 | 注入发布器按序收到两条数据 |

每条用例固定 3 条断言（值 / 结构 / 性质），至少一条断言落在被测方法返回值上，并用 `hilog` 打印 `actual=/expected=` 便于失败定位。

## 被测代码的测试接缝改造

为了把可观测行为拆到可断言的粒度，对 `entry/src/main/ets` 做了不改变既有行为的接缝改造，全部用例在新实现下编译通过：

| 编号 | 改造点 | 文件 | 对外可见的测试接缝 |
|---|---|---|---|
| R1 | 时钟注入 | EventRecordManager.ets | `ClockProvider`、`SystemClock`、`add()` 可选时间戳 |
| R2 | 首页状态机抽取 | HomeStateModel.ets（新增）、Index.ets | `HomeStatus`、`EventPublisherLike`、`HomeSnapshot`、`snapshot()` |
| R3 | 来源标签纯函数 | Constants.ets | `SourceLabel.NONE_KEY/PREFIX/FORM_KEY/PAGE_KEY/EXTERNAL_KEY/of()` |
| R4 | 日志 sink | Logger.ets | `LogSink`、`setSink()` |
| R5 | 发布请求校验 | CommonEventPublisher.ets | `validatePublishRequest()` |
| R6 | 入库校验与返回契约 | EventRecordManager.ets | `tryAdd()`、`AddResult`、`validateData()`、`validateSourceCode()` |
| R7 | 消息结构化解析 | FormEventService.ets | `parseMessage()`、`ParseResult` |
| R8 | 发布计数校验 | FormEventService.ets | `isValidPublishCount()` |
| R9 | 卡片计数与刷新注入 | FormPublishCounter.ets（新增）、EntryFormAbility.ets | `FormPublishCounter`、`FormUpdater`、`setFormUpdater()`、`getPublishCount()` |
| R10 | 刷新目标抽象 | EntryFormAbility.ets | `FormUpdater`（测试用 fake 替掉 `formProvider`） |
| R11 | 记录持久化 | EventRecordStore.ets（新增）、EventRecordManager.ets、HomeStateModel.ets、Index.ets | `RecordStorage`、`EventRecordStore.create/serialize/deserialize/save/loadInto`、`manager.restore()`、`model.setStore/persist/restore` |
| E1 | 状态文案映射 | Constants.ets、Index.ets | `StatusLabel.of()`、九个 KEY 常量与镜像数字常量、`statusResource()` 改 key → $r 静态映射 |
| R12 | 参数化发布 | CommonEventPublisher.ets | `PublishOptions`、`PublishRequest`、`buildRequest(options)`、`publishWith(options)` |
| R13 | 订阅管理器 | SubscriptionManager.ets（新增）、Index.ets | `SubscriberFactory` 注入接口、`start()/stop()/isSubscribed()` 状态迁移 |
| E3' | 发布器注入 | FormEventService.ets | `FormEventPublisher` 接口、`setPublisher()`、`publishFromForm` 经注入器发布 |

兼容性口径：`add()` 仍不拒绝输入（校验只在 `tryAdd()` 中生效），`parseEventData()` 委托 `parseMessage().data`，`createBindingData()` 不做合法性拦截，`publishFromForm()` 的行为不变；因此“空事件名被拒”“`{"data":null}` 回落 OutApp”“计数 -1 原值透传”等旧预期全部保持不变。

## 用例表

### 常量、记录、发布与卡片核心套件（60 条）

|用例编号|测试功能|预置条件|输入|预期输出|是否自动|测试结果|
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
|SUB_CCER_CONST_0001|自定义公共事件名称|工程编译通过|无|事件名称取值为 Acts_CommonEvent_Test|是|通过|
|SUB_CCER_CONST_0002|事件数据常量|工程编译通过|无|InApp 与 OutApp 取值固定且互不相同|是|通过|
|SUB_CCER_CONST_0003|包名常量|工程编译通过|无|本应用与宿主应用包名固定且互不相同|是|通过|
|SUB_CCER_CONST_0004|Ability 与卡片名称|工程编译通过|无|Ability、卡片提供方、卡片与模块名称与工程配置一致|是|通过|
|SUB_CCER_CONST_0005|卡片绑定数据键|工程编译通过|无|publishCount 与 message 两个键固定且互不相同|是|通过|
|SUB_CCER_CONST_0006|记录容量上限|工程编译通过|无|记录容量上限为 20|是|通过|
|SUB_CCER_CONST_0007|事件数据长度上限|工程编译通过|无|数据长度上限为 65536 字节|是|通过|
|SUB_CCER_CONST_0008|空值常量|工程编译通过|无|空值常量为长度为 0 的字符串|是|通过|
|SUB_CCER_CONST_0009|事件来源码|工程编译通过|无|未知、卡片、页面来源码分别为 0、1001、1002|是|通过|
|SUB_CCER_CONST_0010|来源名称解析|工程编译通过|卡片来源码与页面来源码|解析结果为 form 与 page|是|通过|
|SUB_CCER_CONST_0011|来源名称解析边界|工程编译通过|0、-1、999、1003、99999|解析结果均为 external|是|通过|
|SUB_CCER_CONST_0012|来源名称字面值|工程编译通过|无|form、page、external 三个名称固定且互不相同|是|通过|
|SUB_CCER_CONST_0013|布局尺寸与字号层级|工程编译通过|无|尺寸为正数且标题字号大于正文大于说明|是|通过|
|SUB_CCER_CONST_0014|布局宽度与百分比|工程编译通过|无|宽高百分比为 100% 且内容最大宽度不小于 320|是|通过|
|SUB_CCER_RECORD_0001|空记录管理器|工程编译通过|无|记录数为 0 且没有最新记录|是|通过|
|SUB_CCER_RECORD_0002|新增卡片来源记录|工程编译通过|OutApp 与卡片来源码、固定时间戳|序号为 1，来源名称为 form，时间为 08:09:10|是|通过|
|SUB_CCER_RECORD_0003|新增页面来源记录|工程编译通过|InApp 与页面来源码|来源码为 1002，来源名称为 page|是|通过|
|SUB_CCER_RECORD_0004|未知来源记录|工程编译通过|未知来源码与越界来源码|来源名称均为 external|是|通过|
|SUB_CCER_RECORD_0005|记录序号递增|工程编译通过|连续新增三条记录|序号依次为 1、2、3|是|通过|
|SUB_CCER_RECORD_0006|记录到达顺序|工程编译通过|依次新增 First、Second、Third|记录列表顺序与新增顺序一致|是|通过|
|SUB_CCER_RECORD_0007|记录副本隔离|工程编译通过|取记录后修改副本|管理器内记录数与最新记录不受影响|是|通过|
|SUB_CCER_RECORD_0008|默认容量淘汰|工程编译通过|连续新增 25 条记录|记录数为 20，首条序号为 6，末条数据为 Data_25|是|通过|
|SUB_CCER_RECORD_0009|自定义容量淘汰|工程编译通过|容量为 3 时新增 4 条记录|记录数为 3，保留 Data_2 至 Data_4|是|通过|
|SUB_CCER_RECORD_0010|容量为 0 回退|工程编译通过|容量为 0 时新增 21 条记录|记录数为 20，首条序号为 2|是|通过|
|SUB_CCER_RECORD_0011|容量为负数回退|工程编译通过|容量为 -5 时新增 20 条记录|记录数为 20，首条数据为 Data_1|是|通过|
|SUB_CCER_RECORD_0012|最新记录|工程编译通过|连续新增 First 与 Second|最新记录数据为 Second，序号为 2|是|通过|
|SUB_CCER_RECORD_0013|清空与序号重启|工程编译通过|新增两条记录后清空并再新增|清空后记录数为 0，再次新增序号为 1|是|通过|
|SUB_CCER_RECORD_0014|时间格式化补零|工程编译通过|05:06:07 对应时间戳|格式化结果为 05:06:07 且长度为 8|是|通过|
|SUB_CCER_RECORD_0015|时间格式化两位数|工程编译通过|12:34:56 与 00:00:00 对应时间戳|格式化结果与输入时间一致|是|通过|
|SUB_CCER_RECORD_0016|默认时间戳|工程编译通过|不传入时间戳新增记录|接收时间为当前时间且长度为 8|是|通过|
|SUB_CCER_PUBLISH_0001|构建发布数据|工程编译通过|OutApp 与页面来源码|数据为 OutApp，来源码为 1002，非有序事件|是|通过|
|SUB_CCER_PUBLISH_0002|构建有序发布数据|工程编译通过|InApp、卡片来源码与有序标记|发布数据携带有序标记与卡片来源码|是|通过|
|SUB_CCER_PUBLISH_0003|受支持事件数据|工程编译通过|InApp 与 OutApp|均判定为受支持|是|通过|
|SUB_CCER_PUBLISH_0004|非受支持事件数据|工程编译通过|空串、大小写不一致与带空格的数据|全部判定为不受支持|是|通过|
|SUB_CCER_PUBLISH_0005|数据长度边界|工程编译通过|长度为 65536 与长度为 0 的数据|长度校验均通过|是|通过|
|SUB_CCER_PUBLISH_0006|数据超长|工程编译通过|长度为 65537 的数据|长度校验不通过|是|通过|
|SUB_CCER_PUBLISH_0007|空事件名拒绝|工程编译通过|事件名为空|发布操作返回失败|是|通过|
|SUB_CCER_PUBLISH_0008|发布页面来源事件|应用已安装且测试订阅者已启动|OutApp 与页面来源码|订阅者收到事件，事件名为 Acts_CommonEvent_Test，来源码为 1002|是|通过|
|SUB_CCER_PUBLISH_0009|发布卡片来源事件|应用已安装且测试订阅者已启动|OutApp 与卡片来源码|订阅者收到事件，来源码为 1001|是|通过|
|SUB_CCER_PUBLISH_0010|发布外部来源事件|应用已安装且测试订阅者已启动|InApp 与未知来源码|订阅者收到事件，数据为 InApp|是|通过|
|SUB_CCER_PUBLISH_0011|有序事件发布|应用已安装且测试订阅者已启动|有序发布 OutApp|订阅者收到事件与卡片来源码|是|通过|
|SUB_CCER_PUBLISH_0012|连续两次发布顺序|应用已安装且测试订阅者已启动|先发布 InApp 再发布 OutApp|订阅者按顺序收到两个事件|是|通过|
|SUB_CCER_PUBLISH_0013|连续五次发布|应用已安装且测试订阅者已启动|连续发布五次 OutApp|订阅者收到五个事件且数据均为 OutApp|是|通过|
|SUB_CCER_PUBLISH_0014|事件名保持一致|应用已安装且测试订阅者已启动|先后发布两种来源的事件|收到的事件名均为 Acts_CommonEvent_Test|是|通过|
|SUB_CCER_FORM_0001|卡片绑定数据初始值|工程编译通过|发布次数 0|绑定数据包含 publishCount 且取值为 0|是|通过|
|SUB_CCER_FORM_0002|卡片绑定数据计数|工程编译通过|发布次数 3|绑定数据中 publishCount 取值为 3|是|通过|
|SUB_CCER_FORM_0003|卡片绑定数据大数值|工程编译通过|发布次数 2048|绑定数据中 publishCount 取值为 2048|是|通过|
|SUB_CCER_FORM_0004|卡片绑定数据负值|工程编译通过|发布次数 -1|绑定数据中 publishCount 取值为 -1|是|通过|
|SUB_CCER_FORM_0005|空卡片消息|工程编译通过|空字符串|解析结果为 OutApp|是|通过|
|SUB_CCER_FORM_0006|空对象卡片消息|工程编译通过|{} 与仅含 message 的 JSON|解析结果均为 OutApp|是|通过|
|SUB_CCER_FORM_0007|InApp 卡片消息|工程编译通过|{"data":"InApp"}|解析结果为 InApp|是|通过|
|SUB_CCER_FORM_0008|数据为空串|工程编译通过|{"data":""}|解析结果为 OutApp|是|通过|
|SUB_CCER_FORM_0009|非 JSON 消息|工程编译通过|click、{data:InApp}、{"data":、null|解析结果均为 OutApp|是|通过|
|SUB_CCER_FORM_0010|自定义数据与多余字段|工程编译通过|含 message、data 与 code 字段的 JSON 以及带首尾空格的 JSON|解析结果为消息中的数据|是|通过|
|SUB_CCER_FORM_0011|JSON 基本类型消息|工程编译通过|123、"InApp"、true、[]|解析结果均为 OutApp|是|通过|
|SUB_CCER_FORM_0012|空消息触发发布|应用已安装且测试订阅者已启动|空字符串|发布 OutApp 且来源码为 1001|是|通过|
|SUB_CCER_FORM_0013|携带数据触发发布|应用已安装且测试订阅者已启动|{"data":"InApp"}|发布 InApp 且来源码为 1001|是|通过|
|SUB_CCER_FORM_0014|非法消息触发发布|应用已安装且测试订阅者已启动|click|发布 OutApp 且事件名为 Acts_CommonEvent_Test|是|通过|
|SUB_CCER_FORM_0015|连续两次卡片发布|应用已安装且测试订阅者已启动|先后发送 OutApp 与 InApp 消息|订阅者按顺序收到两个事件|是|通过|
|SUB_CCER_FORM_0016|解析结果有效性|工程编译通过|六种合法与非法消息|解析结果非空且首尾无空格|是|通过|

### 记录与发布组合流程套件（30 条）

|用例编号|测试功能|预置条件|输入|预期输出|是否自动|测试结果|
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
|SUB_CCER_RECREAL_0001|容量淘汰流程|工程编译通过|容量 3 依次写入 Data_1 ~ Data_5|记录数为 3，首条为 Data_3 且序号为 3，末条为 Data_5|是|通过|
|SUB_CCER_RECREAL_0002|三种来源解析|工程编译通过|卡片码、页面码与 -1|来源名分别为 form、page、external，原始码保留|是|通过|
|SUB_CCER_RECREAL_0003|清空与重启|工程编译通过|新增两条后清空再新增|记录数为 0 且无最新记录，重新新增序号为 1|是|通过|
|SUB_CCER_RECREAL_0004|记录副本隔离|工程编译通过|取副本后向副本追加伪记录|副本长度为 2，管理器仍为 1 条|是|通过|
|SUB_CCER_RECREAL_0005|时间戳与格式化一致|工程编译通过|07:05:09 对应时间戳|记录时间为 07:05:09 且与 formatTime 结果一致|是|通过|
|SUB_CCER_RECREAL_0006|容量 5 保序|工程编译通过|容量 5 写入 5 条|首条 Data_1、末条 Data_5、第 3 条序号为 3|是|通过|
|SUB_CCER_RECREAL_0007|容量 1 只留最新|工程编译通过|容量 1 写入两条|记录数为 1，数据为 Second_Value 且序号为 2|是|通过|
|SUB_CCER_RECREAL_0008|默认容量淘汰|工程编译通过|默认容量写入 25 条|记录数为 20|是|通过|
|SUB_CCER_RECREAL_0009|未知来源码|工程编译通过|来源码 0|来源名为 external 且码值为 0|是|通过|
|SUB_CCER_RECREAL_0010|写满 100 条|工程编译通过|容量 20 写入 100 条|首条序号为 81、末条序号为 100|是|通过|
|SUB_CCER_PUBREAL_0001|64 KiB 边界|工程编译通过|长度 65536、65535、65537 的数据|前两者校验通过，65537 不通过；InApp 与 OutApp 均受支持|是|通过|
|SUB_CCER_PUBREAL_0002|有序发布数据|工程编译通过|InApp、卡片码与有序标记|数据为 InApp、来源码为 1001、有序标记为真|是|通过|
|SUB_CCER_PUBREAL_0003|省略有序参数|工程编译通过|OutApp 与页面码|有序标记为假、来源码为 1002、数据为 OutApp|是|通过|
|SUB_CCER_PUBREAL_0004|非受支持数据集合|工程编译通过|inapp、OUTAPP、OutApp 后带空格、前带空格、Custom、空串、Outapp|全部判定为假，OutApp 判定为真|是|通过|
|SUB_CCER_PUBREAL_0005|空事件名拒绝|工程编译通过|事件名为空|发布被拒绝且失败原因非空，空数据仍符合长度限制|是|通过|
|SUB_CCER_PUBREAL_0006|卡片来源发布|应用已安装且订阅者已启动|发布 OutApp 与卡片码|订阅者收到且事件名为 Acts_CommonEvent_Test|是|通过|
|SUB_CCER_PUBREAL_0007|连续两次发布|应用已安装且订阅者已启动|InApp/未知码后接 OutApp/页面码|按顺序收到两条，第二条来源码为 1002|是|通过|
|SUB_CCER_PUBREAL_0008|有序事件投递|应用已安装且订阅者已启动|有序发布 InApp 与页面码|订阅者收到且来源码保持 1002|是|通过|
|SUB_CCER_PUBREAL_0009|收发事件名一致|应用已安装且订阅者已启动|发布一次卡片来源事件|收到事件名为约定常量且以 Acts_ 开头|是|通过|
|SUB_CCER_PUBREAL_0010|四组组合构建|工程编译通过|四组数据与来源码|每组数据、来源码一一匹配且有序标记为假|是|通过|
|SUB_CCER_FORMREAL_0001|卡片消息全链路|应用已安装且订阅者已启动|{"message":"click","data":"InApp"}|解析为 InApp，订阅者收到 InApp 且来源码为 1001|是|通过|
|SUB_CCER_FORMREAL_0002|空消息回落|工程编译通过|空字符串|解析为 OutApp，长度一致且被判定为受支持|是|通过|
|SUB_CCER_FORMREAL_0003|合法卡片发布|应用已安装且订阅者已启动|{"data":"InApp"}|订阅者收到 InApp 且事件名一致|是|通过|
|SUB_CCER_FORMREAL_0004|非法消息发布|应用已安装且订阅者已启动|{"data":|解析为 OutApp 后仍以卡片来源码发布|是|通过|
|SUB_CCER_FORMREAL_0005|绑定数据三档|工程编译通过|发布次数 0、1、20|结果依次为 {"data":{"publishCount":N}}|是|通过|
|SUB_CCER_FORMREAL_0006|计数与解析互不影响|工程编译通过|计数 7 与合法消息|绑定串保留 publishCount 为 7，解析结果为 InApp|是|通过|
|SUB_CCER_FORMREAL_0007|前后空格保留|工程编译通过|{"data":"  Value  "}|结果为 9 字符原样串且不被判定为受支持|是|通过|
|SUB_CCER_FORMREAL_0008|连续两次卡片发布|应用已安装且订阅者已启动|先后发布 InApp 与 OutApp 消息|按顺序收到两条事件|是|通过|
|SUB_CCER_FORMREAL_0009|绑定字段常量|工程编译通过|计数 3|publishCount 与 message 键名与常量一致且绑定串包含该键|是|通过|
|SUB_CCER_FORMREAL_0010|键名大小写敏感|工程编译通过|{"Data":"InApp"}、{" data":"InApp"}、{"data":"OutApp"}|前两者回落为 OutApp，第三者解析为 OutApp 且受支持|是|通过|

### 首页状态机、卡片解析与计数补强套件（30 条）

|用例编号|测试功能|预置条件|输入|预期输出|是否自动|测试结果|
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
|SUB_CCER_HMREAL_0001|初始快照|工程编译通过|无|状态为 READY，计数 0，末次来源 -1，首末序号均为 -1|是|通过|
|SUB_CCER_HMREAL_0002|真实发布成功|应用已安装|OutApp 与页面来源码|返回真，状态为发布成功，发布中标记已释放，计数不变|是|通过|
|SUB_CCER_HMREAL_0003|发布失败分支|工程编译通过|注入失败发布器，InApp 与卡片来源码|返回假，状态为发布失败，发布器被调用 1 次|是|通过|
|SUB_CCER_HMREAL_0004|并发发布守卫|工程编译通过|不等待第一次发布即发起第二次|第二次返回假，第一次成功，发布器仅被调用 1 次|是|通过|
|SUB_CCER_HMREAL_0005|接收事件快照|工程编译通过|OutApp 与页面来源码|计数 1，末次数据 OutApp，末次来源 1002，状态为已接收|是|通过|
|SUB_CCER_HMREAL_0006|容量 2 淘汰|工程编译通过|容量 2 依次写入三条数据|计数 2，首序号 2，末序号 3，末次数据 Data_03|是|通过|
|SUB_CCER_HMREAL_0007|清空后序号重启|工程编译通过|写入两条后清空再写入一条|状态为已清空，计数 0，新记录序号为 1|是|通过|
|SUB_CCER_HMREAL_0008|空数据拒绝|工程编译通过|空串与卡片来源码|返回空记录，状态与计数均不变|是|通过|
|SUB_CCER_HMREAL_0009|非整数来源码拒绝|工程编译通过|数据与来源码 1.5|返回空记录，状态不变|是|通过|
|SUB_CCER_HMREAL_0010|订阅与事件状态互不覆盖|工程编译通过|先标记订阅再接收事件|订阅标记为真且状态为已接收|是|通过|
|SUB_CCER_PREAL_0001|点击消息解析|工程编译通过|{"message":"click","data":"OutApp"}|解析有效，数据为 OutApp，原因为空|是|通过|
|SUB_CCER_PREAL_0002|点击消息真实投递|应用已安装且订阅者已启动|点击消息|订阅者收到 OutApp，来源码 1001，事件名一致|是|通过|
|SUB_CCER_PREAL_0003|非法消息投递|应用已安装且订阅者已启动|单个左花括号的非法 JSON|订阅者仍收到 OutApp，来源码 1001|是|通过|
|SUB_CCER_PREAL_0004|两条解析入口一致|工程编译通过|合法消息、空对象与非法 JSON|结构化与便捷方法数据一致，缺失字段原因为 missing-data|是|通过|
|SUB_CCER_PREAL_0005|缺少 data 字段|工程编译通过|{"message":"click"}|原因为 missing-data，数据回落 OutApp|是|通过|
|SUB_CCER_PREAL_0006|data 非字符串|工程编译通过|{"data":123} 与 {"data":null}|原因为 non-string-data，数据回落 OutApp|是|通过|
|SUB_CCER_PREAL_0007|64 KB 载荷解析|工程编译通过|65536 字节载荷|解析有效，长度 65536，原因为空|是|通过|
|SUB_CCER_PREAL_0008|超长载荷发布|应用已安装|65537 字节载荷|解析有效但发布被拒且原因非空|是|通过|
|SUB_CCER_PREAL_0009|中文与空格载荷|工程编译通过|中文载荷与带首尾空格的载荷|原样解析且长度不变|是|通过|
|SUB_CCER_PREAL_0010|两次点击顺序|应用已安装且订阅者已启动|连续两次点击消息|订阅者按顺序收到两条事件|是|通过|
|SUB_CCER_FCREAL_0001|初始计数与绑定|工程编译通过|未发布过的卡片|计数 0，绑定数据 publishCount 为 0 且判定为合法|是|通过|
|SUB_CCER_FCREAL_0002|连续递增联动|工程编译通过|同一卡片递增两次|计数为 2，绑定数据 publishCount 为 2，计数器条目 1 个|是|通过|
|SUB_CCER_FCREAL_0003|移除后归零|工程编译通过|递增两次后移除|移除返回真，计数与绑定数据均归零，条目 0 个|是|通过|
|SUB_CCER_FCREAL_0004|清空后归零|工程编译通过|两张卡片计数后清空|清空前条目 2 个，清空后 0 个，绑定数据 publishCount 为 0|是|通过|
|SUB_CCER_FCREAL_0005|多卡片隔离|工程编译通过|卡片 f1 递增三次、f2 递增一次|f1 为 3、f2 为 1，绑定数据分别携带 3 与 1|是|通过|
|SUB_CCER_FCREAL_0006|计数上限封顶|工程编译通过|上限 2 时递增三次|依次为 1、2、2，绑定数据 publishCount 为 2|是|通过|
|SUB_CCER_FCREAL_0007|刷新载荷装配|工程编译通过|卡片 f7 计数 2 后刷新|刷新目标被调用 1 次，卡片标识为 f7，载荷包含 publishCount:2|是|通过|
|SUB_CCER_FCREAL_0008|刷新失败不回退计数|工程编译通过|注入失败刷新目标，卡片计数 1|刷新被拒绝且原因非空，计数保持 1，目标仅被调用 1 次|是|通过|
|SUB_CCER_FCREAL_0009|重复移除|工程编译通过|同一卡片连续移除两次|第一次返回真，第二次返回假，计数归零|是|通过|
|SUB_CCER_FCREAL_0010|最大安全整数计数|工程编译通过|上限为 MAX_SAFE_INTEGER 的计数器与同值绑定|递增结果为 2，绑定数据 publishCount 为 MAX_SAFE_INTEGER 且判定为合法|是|通过|

### 记录持久化套件（10 条）

|用例编号|测试功能|预置条件|输入|预期输出|是否自动|测试结果|
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
|SUB_CCER_STORREAL_0001|保存回放全链路|工程编译通过|容量 10 写入 3 条后保存并回放|保存与回放均返回 3，末条数据 Data_3 且序号 3|是|通过|
|SUB_CCER_STORREAL_0002|来源名重解析|工程编译通过|form、page 与 999 三条记录保存后回放|来源名依次为 form、page、external 且原始码与顺序保留|是|通过|
|SUB_CCER_STORREAL_0003|空管理器保存|工程编译通过|空管理器保存后回放|保存返回 0，落盘文本为 []，回放后记录数为 0|是|通过|
|SUB_CCER_STORREAL_0004|清空与回放语义分离|工程编译通过|保存两条后清空、新增、回放、再新增|清空后新序号 1，回放后 2 条，再新增序号 3|是|通过|
|SUB_CCER_STORREAL_0005|回放端容量裁剪|工程编译通过|保存 5 条后回放到容量 3 的管理器|回放 3 条且首条 Data_3，末条序号 5，续增序号 6|是|通过|
|SUB_CCER_STORREAL_0006|序列化往返幂等|工程编译通过|3 条记录序列化-回放-再序列化|两次文本一致，条数 3，文本不含 sequence 与 sourceName|是|通过|
|SUB_CCER_STORREAL_0007|损坏文本自愈|工程编译通过|预置非 JSON 文本后回放并重新保存|回放 0 条，新记录序号 1，再保存后可回放出 1 条|是|通过|
|SUB_CCER_STORREAL_0008|模型级恢复|工程编译通过|模型接收 3 条后持久化，新模型回放|计数 3，末条数据与来源恢复，状态保持 READY|是|通过|
|SUB_CCER_STORREAL_0009|恢复后继续接收|工程编译通过|回放两条后继续接收一条|计数 3，末条为最新数据，快照末序号 3|是|通过|
|SUB_CCER_STORREAL_0010|未注入存储空操作|工程编译通过|未注入存储时持久化与回放|计数与记录保持 1 条，状态保持已接收|是|通过|

### 测试接缝补充套件（34 条）

|用例编号|测试功能|预置条件|输入|预期输出|是否自动|测试结果|
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
|SUB_CCER_STKEYREAL_0001|模型驱动状态键巡回|工程编译通过|HomeStateModel 依次订阅、失败、取消、发布成功、接收、清空，再用失败发布器发布|每步 `StatusLabel.of` 均返回对应的唯一状态键，失败发布后键为发布失败|是|通过|
|SUB_CCER_STKEYREAL_0002|枚举与镜像常量对照|工程编译通过|HomeStatus 九枚举值与 StatusLabel 镜像数字常量|九组逐一相等且就绪/已清空键查询正确|是|通过|
|SUB_CCER_STKEYREAL_0003|非法状态回退|工程编译通过|-1、9、100、-100、1.5、NaN、Infinity|全部回退就绪键且不抛异常|是|通过|
|SUB_CCER_STKEYREAL_0004|状态键与来源键前缀互斥|工程编译通过|status_ 与 source_ 两族键|两族前缀不同且互不包含|是|通过|
|SUB_CCER_STKEYREAL_0005|状态键资源形态|工程编译通过|九个状态键|均为前缀加小写下划线词形态|是|通过|
|SUB_CCER_STKEYREAL_0006|状态键互异与幂等|工程编译通过|状态码 0~8 全部查询|九键两两互异且重复查询幂等|是|通过|
|SUB_CCER_PUBOPTREAL_0001|四字段请求真发布|应用已安装|data、来源码、事件名、有序标记齐备的自定义请求|四字段组装正确、校验通过且经真实框架发布成功|是|通过|
|SUB_CCER_PUBOPTREAL_0002|默认值真发布|应用已安装|省略事件名与有序参数的请求|事件名与有序标记取默认值且真发布成功|是|通过|
|SUB_CCER_PUBOPTREAL_0003|空事件名异步拒绝|工程编译通过|事件名为空的请求|发布被拒且原因串与校验器一致|是|通过|
|SUB_CCER_PUBOPTREAL_0004|首尾空格名拒绝|工程编译通过|首尾带空格的事件名|发布被拒且原因串为空格规则文案|是|通过|
|SUB_CCER_PUBOPTREAL_0005|超长数据拒绝|工程编译通过|65537 字节数据|发布被拒且原因串为长度规则文案，65536 字节边界通过校验|是|通过|
|SUB_CCER_PUBOPTREAL_0006|显式有序真发布|应用已安装|有序标记与卡片来源码|有序标记为真且真发布成功|是|通过|
|SUB_CCER_PUBOPTREAL_0007|拒绝后重试成功|工程已安装|先空名后合法请求|第一次被拒后重试组装与校验均正常无失败残留|是|通过|
|SUB_CCER_PUBOPTREAL_0008|省略与显式等价|工程编译通过|省略事件名与显式默认事件名两次组装|两次结果逐字段等价|是|通过|
|SUB_CCER_PUBOPTREAL_0009|解析后组装发布|应用已安装|卡片消息 {"data":"OutApp"} 解析后经参数化入口发布|解析数据原样进入请求且真发布成功|是|通过|
|SUB_CCER_PUBOPTREAL_0010|同一请求双发|应用已安装|同一合法请求连续两次发布|两次均成功且请求字段保持不变|是|通过|
|SUB_CCER_SUBMGRREAL_0001|拒绝工厂巡回|工程编译通过|注入拒绝工厂后启动、停止、再启动、再停止|全部返回假且订阅状态始终为假，工厂调用 2 次|是|通过|
|SUB_CCER_SUBMGRREAL_0002|拒绝启动与事件契约|工程编译通过|拒绝工厂下等待启动|返回假且工厂收到的订阅事件列表与约定常量一致|是|通过|
|SUB_CCER_SUBMGRREAL_0003|throw 工厂异常传播|工程编译通过|同步抛错的工厂|异常消息原样传播且状态保持未订阅|是|通过|
|SUB_CCER_SUBMGRREAL_0004|未激活停止守卫|工程编译通过|未启动时等待停止|返回假且工厂未被触达|是|通过|
|SUB_CCER_SUBMGRREAL_0005|连续失败启动计数|工程编译通过|连续三次启动|每次返回假且工厂计数递增至 3|是|通过|
|SUB_CCER_SUBMGRREAL_0006|throw 二连传播|工程编译通过|抛错工厂两次启动|两次异常消息逐次原样传播且互不吞并|是|通过|
|SUB_CCER_SUBMGRREAL_0007|失败启动组合序列|工程编译通过|启动、停止守卫、再启动|全部返回假且工厂调用 2 次保持可重试|是|通过|
|SUB_CCER_SUBMGRREAL_0008|不同错误码一致拒绝|工程编译通过|错误码 999 与 7 两个拒绝工厂|两个管理器均返回假且互不串台|是|通过|
|SUB_CCER_SUBMGRREAL_0009|双管理器隔离|工程编译通过|两个管理器各配独立工厂分别启动|调用计数与订阅事件互不干扰|是|通过|
|SUB_CCER_SUBMGRREAL_0010|真实 Promise 面|工程编译通过|启动调用返回值|返回值为真实 Promise 且等待后落定为假|是|通过|
|SUB_CCER_FORMPUBREAL_0001|注入恢复往返|工程编译通过|注入捕获、恢复默认、再注入|两次注入各自捕获到对应数据与卡片来源码且先注入的发布器不再被调用|是|通过|
|SUB_CCER_FORMPUBREAL_0002|注入拒绝传播|工程编译通过|注入拒绝型发布器后发布卡片消息|异常原样传播且调用已计数、解析数据已记录|是|通过|
|SUB_CCER_FORMPUBREAL_0003|合法消息注入捕获|工程编译通过|{"data":"InApp"} 经注入发布器|捕获到 InApp 与来源码 1001 且调用 1 次|是|通过|
|SUB_CCER_FORMPUBREAL_0004|非法消息回退后发布|工程编译通过|非 JSON 与空消息|均回退 OutApp 且每次都经注入发布器发布|是|通过|
|SUB_CCER_FORMPUBREAL_0005|多次发布末次正确|工程编译通过|连续三次卡片消息|调用 3 次且末次数据正确、来源码稳定|是|通过|
|SUB_CCER_FORMPUBREAL_0006|默认链路真发布|应用已安装|恢复默认发布器后发布 InApp 消息|入口返回真实 Promise 且真框架发布成功、解析有效|是|通过|
|SUB_CCER_FORMPUBREAL_0007|拒绝后恢复无残留|应用已安装|注入拒绝后再恢复默认发布|恢复后真发布成功且失败发布器不再被调用|是|通过|
|SUB_CCER_FORMPUBREAL_0008|发布入口 Promise 面|工程编译通过|注入后调用卡片发布入口|返回值为真实 Promise 且等待后正常落定并捕获数据|是|通过|

### 首页 UI 套件（12 条）

|用例编号|测试功能|预置条件|输入|预期输出|是否自动|测试结果|
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
|SUB_CCER_UI_0001|首页事件契约展示|应用已安装|启动首页|事件名、发布方、卡片名与所需权限文本与契约一致|是|通过|
|SUB_CCER_UI_0002|首页操作入口|应用已安装|启动首页|订阅、发布、清空按钮与状态文本均存在|是|通过|
|SUB_CCER_UI_0003|自动订阅|应用已安装|启动首页后发布一次事件|接收数量由 0 变为 1|是|通过|
|SUB_CCER_UI_0004|发布按钮|应用已安装|清空记录后点击发布按钮|接收数量变为 1，最近数据为 OutApp，最近来源发生变化|是|通过|
|SUB_CCER_UI_0005|记录列表新增|应用已安装|清空记录后点击发布按钮|空记录提示消失且出现第 1 条记录|是|通过|
|SUB_CCER_UI_0006|清空记录|应用已安装|发布一次后点击清空按钮|接收数量归零并重新显示空记录提示|是|通过|
|SUB_CCER_UI_0007|订阅状态切换|应用已安装|连续点击订阅按钮两次|按钮文本先变化后还原，订阅状态文本非空|是|通过|
|SUB_CCER_UI_0008|发布后状态提示|应用已安装|清空记录后点击发布按钮|状态提示文本发生变化且非空|是|通过|
|SUB_CCER_UI_0009|连续两次发布|应用已安装|清空记录后连续点击发布按钮两次|接收数量变为 2 且出现第 2 条记录|是|通过|
|SUB_CCER_UI_0010|外部事件展示|应用已安装|发布一次 InApp 事件|接收数量变为 1，最近数据为 InApp|是|通过|
|SUB_CCER_UI_0011|页面发布投递|应用已安装且测试订阅者已启动|点击发布按钮|独立订阅者收到 OutApp 且来源码为 1002|是|通过|
|SUB_CCER_UI_0012|清空后序号重启|应用已安装|发布后清空记录再发布|第 1 条记录先消失后重新出现|是|通过|

### 首页 UI 补强套件（12 条）

|用例编号|测试功能|预置条件|输入|预期输出|是否自动|测试结果|
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
|SUB_CCER_UI_0013|卡片来源事件|应用已安装|清空后外部发布卡片来源事件|计数 1，末条来源文本变化且非空，首条条目出现|是|通过|
|SUB_CCER_UI_0014|取消订阅期间拒收|应用已安装|取消订阅后外部发布，重新订阅后再发布|取消期间计数保持 0，恢复订阅后计数 1，按钮文本往返一致|是|通过|
|SUB_CCER_UI_0015|末条数据随最新更新|应用已安装|连续两条外部不同数据事件|计数 2，末条数据由 InApp 更新为 OutApp|是|通过|
|SUB_CCER_UI_0016|清空后占位复原|应用已安装|接收一条后点击清空|末条数据与来源文本回到初始占位文本|是|通过|
|SUB_CCER_UI_0017|状态随操作变化|应用已安装|点击发布后点击清空|状态文本随发布变化、随清空再变化且始终非空|是|通过|
|SUB_CCER_UI_0018|三条条目依序生成|应用已安装|连续三条外部事件（含未知来源）|计数 3，event_item_1/2/3 依序出现|是|通过|
|SUB_CCER_UI_0019|来源标签区分|应用已安装|卡片来源与 999 来源各一条|两个来源文本互不相同且均异于占位文本|是|通过|
|SUB_CCER_UI_0020|末条来源随最新切换|应用已安装|页面自发布后外部卡片事件|计数 2，末条来源切换且非空|是|通过|
|SUB_CCER_UI_0021|订阅状态文字往返|应用已安装|连续点击订阅按钮两次|状态文字先变化后复原为初始文本|是|通过|
|SUB_CCER_UI_0022|清空后条目序号复位|应用已安装|两条后清空再发布一条|计数 1，首条条目重新出现且第 2 条条目不存在|是|通过|
|SUB_CCER_UI_0023|空数据事件拒收|应用已安装|发布空数据事件|计数保持 0，空记录提示仍在且无条目|是|通过|
|SUB_CCER_UI_0024|重拉起首页不丢失|应用已安装|接收两条后再次拉起首页|计数保持 2，末条数据不变，第 2 条条目仍在|是|通过|

## 真机验证结果

执行依据与设备：2026-11-18 经用户授权，在 API 26 真机上执行；安装包为本次构建产出的 `entry-default-signed.hap` 与 `entry-ohosTest-signed.hap`。

执行方式：用 `hdc file send` 推送两个 HAP 后 `bm install -p` 安装；因全量超 1500 条用例，首轮全量执行在 #1416 处触发设备侧 `THREAD_BLOCK_6S`（非用例断言失败），改为按 `-s class` 分批、每批独立进程执行，UI 套件置于最后一批，多批拼成同一轮基线。

| 批 | 套件数 | 执行用例数 | 通过 | 失败 | 错误 | `TestFinished-ResultCode` |
|---|---|---|---|---|---|---|
| B1 | 9 | 384 | 384 | 0 | 0 | 0 |
| B2 | 9 | 366 | 366 | 0 | 0 | 0 |
| B3 | 9 | 245 | 245 | 0 | 0 | 0 |
| B4 | 9 | 347 | 347 | 0 | 0 | 0 |
| B5 | 9 | 137 | 137 | 0 | 0 | 0 |
| B6 | 6 | 58 | 58 | 0 | 0 | 0 |
| 合计 | 51 | 1537 | 1537 | 0 | 0 | 全部 0 |

判定依据：6 批 `OHOS_REPORT_RESULT` 均为 `Failure: 0, Error: 0`，每批 `Tests run` 均大于 0（避免过滤条件未生效造成的假通过），日志中无 `App died`，设备 `faultlog/faultlogger` 无新增条目。上表“用例表”中各条用例的测试结果已回填为通过。

验证中发现并修复的问题：

1. main 1 处：`EventRecordStore.deserialize` 遇到 `[null]` 条目时抛 `Cannot load property of null or undefined`，已补充跳过 `null` 条目的逻辑（对应用例 SUB_CCER_RSTREC_02 系列）。
2. 测试侧 48 处：卡片绑定数据断言形状（38 条）、数字与字符串比较（3 条）、期望值误算（2 条）、异常后不可达（1 条）、组件存在性判定（4 条）。其中组件存在性判定的根因是真机 `Driver.findComponent` 在组件缺失时 resolve 为 `null` 而不是抛异常，`TestHelper` 相关函数已改为显式判空。

回归口径：修复后重新构建并安装同一份 HAP，先对 4 个受影响套件增量复跑（44/44 通过），再分 6 批执行全量，结果如上表。

## 执行方法

前置条件：

1. 设备已通过 `hdc list targets` 识别；
2. 主工程与测试工程均已编译并生成签名 HAP：
   - `entry/build/default/outputs/default/entry-default-signed.hap`
   - `entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap`

安装命令：

```
hdc install -r entry/build/default/outputs/default/entry-default-signed.hap
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
```

安装完成后在 DevEco Studio 中选择 `entry@ohosTest` 运行配置执行，参数取值如下：

| 参数 | 取值 | 对应选项 |
|---|---|---|
| 应用包名 | `com.samples.customcommoneventrely` | `-b` |
| 测试模块名 | `entry_test` | `-m` |
| 运行器路径 | `/ets/testrunner/OpenHarmonyTestRunner` | `-s unittest` |
| 单次超时 | `900000`（毫秒） | `-s timeout` |

套件过滤：追加 `-s class <套件名>` 只执行指定套件，追加 `-s class "<套件名>#<用例名>"` 只执行指定用例。
运行器会把 `-s class`、`-s suite`、`-s it`、`-s level`、`-s size`、`-s timeout` 原样透传给测试入口，
因此可以精确到套件或用例复跑。

结果判定：先看 `OHOS_REPORT_RESULT` 中的 `result=0`，同时确认 `Tests run: N` 的 N 大于 0（N 为 0 说明过滤条件没生效，不能当作通过）。用例超过 500 条或单次执行超时时，按 `-s class` 分批执行，多批拼成同一轮基线。

## 计划与进度

| 阶段 | 内容 | 状态 | 证据 |
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
| 功能实现 | 公共层、Ability、首页、服务卡片与资源改造为 API 26 现代化实现 | 已完成 | entry/src/main/ets 下 Constants.ets、Logger.ets、CommonEventPublisher.ets、EventRecordManager.ets、FormEventService.ets、EntryAbility.ets、EntryFormAbility.ets、Index.ets、PublishCard.ets |
| 测试工程 | ohosTest 模块配置、测试 Ability、TestRunner、测试资源与测试工具 | 已完成 | entry/src/ohosTest 下 module.json5、testability、testrunner（已透传 `-s` 过滤参数）、util/TestHelper.ets |
| 测试用例 | 51 个套件共 1537 条用例，`List.test.ets` 按「核心契约 → 输入域展开 → 组合流程 → 页面」顺序注册 | 已完成 | entry/src/ohosTest/ets/test 下 51 个套件与 List.test.ets |
| 静态审计 | 命名、编号、`@tc` 元数据、断言密度、重复体、注册与文档一致性 | 已完成 | 审计脚本 `errors=0`；告警为聚合重复体与 `repeat()` 载荷断言，已在本文件“输入域覆盖说明”中说明 |
| 构建验证 | 主工程与测试工程编译并生成签名 HAP | 已完成 | `devecocli build --modules entry` 与 `devecocli build --modules entry@ohosTest` 均构建成功，ArkTS 告警仅来自 hypium 依赖 |
| 真机执行 | 安装两个 HAP 并分批执行用例 | 已完成 | 按 `-s class` 分 6 批执行，合计 1537 条用例全部通过（失败 0、错误 0），6 批均 `TestFinished-ResultCode: 0`，详见“真机验证结果” |
| 截图归档 | 真机首页与服务卡片截图 | 未执行 | 本轮未采集截图，功能结论以自动化用例执行结果为准 |

说明：构建成功与静态审计通过不代表真机功能验证成功。“真机执行”已于 2026-11-18 经授权完成并全部通过，“截图归档”仍未执行，需采集真机截图后补充，不得在无截图的情况下标记为通过。