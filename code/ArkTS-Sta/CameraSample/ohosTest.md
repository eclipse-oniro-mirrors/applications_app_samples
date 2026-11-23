# CameraSample 测试用例

本文参考 ArkTSStaticSample 的 ohosTest.md 结构，按 2026-11-19 当前源码整理。
当前自动化直接使用生产 Comment / Constants，并在测试侧辅助逻辑中构造输入、状态和组合流程。
执行结果引用同日已有 DevEco 归档；本次仅更新说明，未构建、安装或运行测试。

## 基础功能用例

自动化预置条件：OpenHarmony API 26 静态测试环境，主应用与测试 HAP 已安装。
测试不需要实际拍照或操作相机权限弹窗；下表 Pass 来自当前版本的归档全量报告，功能摘要不重复计数。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| --- | --- | --- | --- | --- | --- |
| Comment 默认值与字段 | 可导入生产 Comment | 构造实例，更新六个公开字段 | 默认值正确，赋值保留，独立实例互不污染 | 是 | Pass（归档全量） |
| 图片数组与文本 | 创建生产 Comment | 增删/替换图片，赋值空白、Unicode、多行内容 | 图片顺序与引用关系符合赋值方式，文本不被额外裁剪 | 是 | Pass（归档全量） |
| 相机常量 | 可导入生产 Constants | 读取 action 与返回键 | 分别为 ohos.want.action.imageCapture 和 resourceUri | 是 | Pass（归档全量） |
| 请求与捕获状态 | 使用测试侧 CameraRequest / CaptureOutcome | 构造成功、取消、错误、缺少参数及空 URI 等输入 | 辅助请求字段正确，捕获状态按辅助逻辑保留或更新路径 | 是，辅助逻辑 | Pass（归档全量） |
| 发布与列表组合 | 使用测试侧 draft 工厂和 journal | 非空/空图片路径、连续发布、查询及重置 | 辅助准入、模型字段、记录顺序和计数符合测试侧契约 | 是，辅助逻辑 | Pass（归档全量） |
| 时间与草稿编码 | 使用测试侧格式函数和 DraftCodec | 传入不同日期、草稿字段和图片列表 | 当前格式拼接及测试侧协议往返满足对应断言 | 是，辅助逻辑 | Pass（归档全量） |
| 实际发布图片文字评论 | 真机进入真实页面 | 输入文字，点击相机完成拍照，再点击发布 | 拉起系统相机、返回本页，列表显示评论、发布人及时间 | 否，需人工验证 | 本次未复验 |

## 自动化测试覆盖

当前 [测试目录](entry/src/ohosTest/ets/test) 共 **60 个套件、2,406 条用例**，
由 [List.test.ets](entry/src/ohosTest/ets/test/List.test.ets) 注册。
共 61 个 `.test.ets` 文件，其中 List 只负责注册；Shared 辅助文件不计为套件。
下表使用真实 `describe` 名称，可用于 `-s class`。数量按源码 `it` 定义统计。
各表按目录组织；套件名中的 Ability、Rendering、Validation、Pipeline 不扩大其实际执行范围。

### 入口相关数据场景：1 个套件，12 条

ActsAbilityTest 没有调用 UI 驱动或启动真实 Ability，当前 12 条检查模型、常量与测试侧流程。

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `ActsAbilityTest` | 生产 Comment / Constants 与测试侧请求、种子数据、捕获和发布辅助流程；没有启动 EntryAbility | 12 |

### Comment 模型与测试侧投影：14 个套件，514 条

生产 Comment 是公开字段模型。复制、快照、集合投影及时间格式函数来自 Shared 辅助实现，不是生产 Comment 的方法。

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `CommentBoundariesTest` | 生产 Comment 的空值、字符串与数字边界保存 | 40 |
| `CommentCollectionsTest` | 真实 Comment 集合的测试侧投影、顺序和查找 | 37 |
| `CommentCopyTest` | 测试侧 cloneComment 复制生产模型的值及图片数组隔离 | 37 |
| `CommentDefaultsTest` | 生产 Comment 的默认字段、空图片数组和实例独立性 | 29 |
| `CommentFeedContractTest` | 真实 Comment 集合的投影及测试侧不可变追加 | 34 |
| `CommentFieldAssignmentTest` | 生产 id/name/avatar/time/comment/images 字段赋值及保留 | 53 |
| `CommentIdentityTest` | 不同生产 Comment 实例的对象身份和字段隔离 | 34 |
| `CommentImagesTest` | 生产 images 数组顺序、增删替换与引用关系 | 42 |
| `CommentLifecycleTest` | 生产 Comment 创建、编辑与测试侧快照/恢复组合 | 37 |
| `CommentMutabilityTest` | 测试侧派生副本修改后生产源实例的保持 | 34 |
| `CommentResourceTest` | 生产 ResourceStr 字段的普通字符串存储；没有解析或渲染资源 | 34 |
| `CommentSnapshotsTest` | 测试侧 snapshotComment 投影的字段值和图片复制 | 37 |
| `CommentTimestampTest` | 时间字段及测试侧日期格式函数的当前拼接行为 | 32 |
| `CommentUnicodeTest` | 生产 Comment 多语言、Emoji、空白和多行字段原样保存 | 34 |

### 生产相机常量：3 个套件，84 条

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `CameraActionTest` | 生产相机 action、返回键及其字符串契约；不同断言形式的常量检查 | 29 |
| `CaptureResultKeyTest` | 生产 action 与 resourceUri 返回键的精确值和字符串关系 | 29 |
| `ConstantsSurfaceTest` | 生产 Constants 两个公开字段、类型与字面值契约 | 26 |

### 测试侧请求、状态与规则：12 个套件，537 条

本组的行为函数定义在测试目录的 CommentLogic.ets 中，未直接调用生产 UI 组件的同名或对应方法。

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `CameraWantTest` | 测试侧构造 CameraRequest 的 action、supportMultiMode 与 callBundleName | 42 |
| `CaptureResultTest` | 测试侧错误码、结果码、参数存在性与 URI 提取 | 55 |
| `CaptureStateTest` | 测试侧成功/失败捕获后的路径、计数、发布资格和消费 | 42 |
| `DateFormatTest` | 测试侧 formatCommentTime 对年份、零基月份、星期及小时分钟的拼接 | 42 |
| `DraftFactoryTest` | 测试侧草稿到生产 Comment 的字段赋值、图片复制与空结果 | 42 |
| `FeedJournalTest` | 测试侧 journal 的追加、ID 分配、访问与查询 | 50 |
| `IdSequenceTest` | 测试侧递增 ID 的起点、唯一值、读取与重置 | 34 |
| `ImageGridKeysTest` | 测试侧按索引生成图片 key 的数量、顺序与稳定性 | 42 |
| `PublishFlowTest` | 测试侧发布工厂的准入、Comment 字段和图片复制 | 48 |
| `PublishGuardTest` | 测试侧 imagePath 非空规则及 draft 首图的发布资格 | 55 |
| `ResourceUriTest` | 测试侧 URI 原样透传和 file/datashare/media 前缀分类 | 40 |
| `TextInputStateTest` | 测试侧输入原文、更新计数、空值、预览与重置 | 45 |

### 测试侧输入与边界场景：8 个套件，345 条

Validation 表示当前辅助逻辑的条件和输入检查，不代表应用具有额外的文件访问、图片解码或业务校验接口。

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `ContentBoundaryTest` | 生产 Comment 内容边界与辅助构造后的字段保持 | 45 |
| `DraftCodecValidationTest` | 测试侧草稿行协议的分隔符、字段数量和往返行为 | 42 |
| `DraftValidationTest` | 测试侧工厂的草稿准入、输出字段和图片数据 | 45 |
| `GuardMatrixTest` | 测试侧图片路径准入和不同捕获结果的状态组合 | 45 |
| `ImageValidationTest` | 测试侧图片路径非空判断；没有检查文件存在或图片可解码 | 42 |
| `InputTextValidationTest` | 测试侧输入状态的原文、空值、长度与重置 | 42 |
| `PublishEligibilityTest` | 测试侧图片路径与草稿首图决定的发布资格 | 42 |
| `UriValidationTest` | 测试侧 URI 前缀分类和原样透传；没有访问 URI 资源 | 42 |

### 测试侧数据流与模型字段：6 个套件，244 条

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `CaptureFlowTest` | 测试侧 CaptureOutcome / CaptureState 成功、取消、错误及路径状态 | 42 |
| `DraftFlowTest` | 测试侧 draft 工厂创建生产 Comment 时的字段透传与图片复制 | 40 |
| `FeedProjectionTest` | 测试侧集合投影、数量、顺序和索引查找 | 40 |
| `ImageFlowTest` | 生产 Comment 图片数组的保存、顺序、替换和共享引用 | 40 |
| `JournalFlowTest` | 测试侧 CommentJournal 追加顺序、ID、查询与清理 | 42 |
| `SnapshotFlowTest` | 测试侧快照投影、源对象后续修改与复制隔离 | 40 |

### 测试侧组合流程：10 个套件，466 条

组合流程使用真实 Comment 对象及测试侧请求、草稿、journal 和 codec，不是系统相机或页面的端到端集成。

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `CapturePublishPipelineTest` | 测试侧捕获结果到草稿、Comment 和 journal 的组合流程 | 55 |
| `CodecWorkflowTest` | 测试侧 DraftCodec 编码/解码及各字段、图片列表往返 | 45 |
| `ConstantsIntegrationTest` | 测试侧 CameraRequest 使用生产 action、单图标志和调用包名 | 42 |
| `FeedQueryTest` | 测试侧 feed 的索引、名称、图片数量与顺序查询 | 45 |
| `FeedRenderingDataTest` | 测试侧供展示使用的 feed 投影与字段；未渲染 CommentItemView | 48 |
| `JournalWorkflowTest` | 测试侧 journal 多次追加、快照、查询和记录顺序 | 48 |
| `MixedFeedFlowTest` | 测试侧 journal 中混合数据的顺序、ID 与统计 | 48 |
| `MultiPublishFlowTest` | 测试侧多次发布循环后的数量、ID 和名称记录 | 42 |
| `ResultPipelineTest` | 测试侧捕获状态、草稿与 journal 的结果传递 | 48 |
| `StateResetFlowTest` | 测试侧输入状态、捕获状态的更新、消费与重置 | 45 |

### 测试侧批次数据场景：6 个套件，204 条

批次用例检查数据数量、顺序与内容，不提供生产吞吐量、时延或摄像头性能结论。

| 测试套件 | 覆盖点 | 用例数 |
| --- | --- | ---: |
| `CodecWorkloadTest` | 测试侧不同草稿数据的编码、解码与往返 | 34 |
| `FeedWorkloadTest` | 测试侧多次发布后 feed 的数量、ID 与内容核对 | 34 |
| `ImageKeyWorkloadTest` | 测试侧多种图片数量下的索引 key 列表 | 34 |
| `MixedWorkloadTest` | 测试侧发布循环、journal 追加与汇总 | 34 |
| `PublishWorkloadTest` | 测试侧批量发布的计数、ID 和名称核对 | 34 |
| `QueryWorkloadTest` | 测试侧 journal 的批次追加、顺序和查询 | 34 |
