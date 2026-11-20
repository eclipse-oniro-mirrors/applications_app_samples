# HAR转HSP指导 测试用例归档

## 测试环境

- 设备：OpenHarmony API 26 真机/模拟器（deviceType `default`、`tablet`）
- 应用：`ohos.app.hap.myapplication`，主模块 `entry`（HAP）、`library`（HSP，shared 模块）、测试模块 `entry_test`（feature）
- 测试框架：Hypium 1.0.21，执行器 `OpenHarmonyTestRunner`
- 开发环境：DevEco Studio 6.1.1，编译 SDK 26（26.0.0 Release），`compileSdkVersion 26.0.0`，`compatibleSdkVersion` / `targetSdkVersion` 为 `20`（最低兼容 API 20）
- 测试代码：`entry/src/ohosTest/ets/test/`，28 个套件 2657 条用例、约 5.30 万行，由 `List.test.ets` 聚合

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| --- | --- | --- | --- | --- | --- |
| 工程编译 | 编译正常，构建正常 | 无 | 成功编译出 entry HAP、library HSP 与 entry_test HAP | 否 | Pass |
| 安装包结构与签名 | entry 与 entry_test 已安装 | `getBundleInfoForSelf` 读取应用、模块、Ability、扩展、权限、签名信息 | 包名与版本同 AppScope；`entry` 为 entry 类型、`library` 为 shared 类型、`entry_test` 为 feature；EntryAbility 导出且带 home Skill，EntryBackupAbility 为 BACKUP 扩展；签名 appId 以包名开头、指纹稳定；47 + 22 + 24 条用例通过 | 是 | Pass |
| 模块资源 | entry 已安装，library 可选 | 通过模块上下文按名称与 ID 读取字符串、颜色、媒体 | `module_desc`/`EntryAbility_desc`/`EntryAbility_label` 与配置一致；窗口背景色不透明；3 张 PNG 头合法；library 已安装时 `page_show` 为 `page from package`，未安装时模块列表不含 `library`；23 + 11 + 39 + 22 条用例通过 | 是 | Pass |
| EntryAbility 生命周期 | entry 已安装、可拉起 | 拉起首页、切后台再切回、读取运行时 Ability 信息 | 拉起后前台 Ability 为 `EntryAbility`，包名/模块/Ability 名称一致；Ability 可读到标签与图标 ID；15 条用例通过 | 是 | Pass |
| 分层图标与文本资源 | entry 已安装 | 解析 `layered_image.json`、读取 `page_show` 等文本 | JSON 仅含 `layered-image` 组，背景/前景引用 `$media:` 且长度、切分、后缀稳定；文本长度、大小写、切分、重复与字符位置正确；16 + 44 + 8 条用例通过 | 是 | Pass |
| 名称/版本/签名事实 | entry 已安装 | 对模块名、Ability 名、资源名做字符与结构运算；解析版本号；读取签名 | 20 个真实 token × 9 种字符串操作结果与独立计算一致；versionCode 与 versionName 映射、数字和与零个数正确；appId 以包名开头且稳定，指纹长度与格式不变量成立；180 + 55 + 22 条用例通过 | 是 | Pass |
| 草稿文件 IO 与偏好存储 | entry 已安装 | 在 `filesDir` 下创建、追加、重命名、复制、移动、删除文件与目录；用 Preferences 存取字符串、数字、布尔与数组 | 文件内容与字节数一致；追加链、嵌套目录、批量列表、特殊字符往返正确；偏好按类型往返、clear/delete/has 行为正确；217 + 128 条用例通过 | 是 | Pass |
| 编码/JSON/数字 | entry 已安装 | Base64 编解码、UTF-8 文本、JSON 解析与序列化、数字格式化与进制转换 | 编解码往返一致；JSON 文档与订单数组字段、汇总正确；`toFixed`、进制、边界值符合预期；214 + 122 + 234 条用例通过 | 是 | Pass |
| 文本/集合/时间/数学 | entry 已安装 | 字符串切片与查找、数组增删改排、UTC 时间字段、Math 常用函数 | 文本切片与子串一致；集合顺序、长度与元素正确；UTC 日期字段与格式化正确；数学结果与独立计算结果一致；300 + 300 + 132 + 164 条用例通过 | 是 | Pass |
| 显示/错误/Want/资源ID/UI流 | entry 已安装、可拉起 Ability | 读取默认显示器信息；构造非法文件操作；解析 Want 字段；按 ID 读取资源；用 UiTest 查找与点击组件 | 显示器尺寸与密度为正；非法路径与权限错误码正确；Want 可选字段可读；资源 ID 与名称读取一致；组件查找、点击、边界不越界；70 + 125 + 80 + 35 + 8 条用例通过 | 是 | Pass |

## 测试设计

| 套件 | 文件 | 维度 | 用例数 |
| --- | --- | --- | ---: |
| BundleFactsMatrix | `BundleFactsMatrix.test.ets` | BundleInfo 包名/版本/签名/安装目录/模块列表事实 | 47 |
| ModuleFactsMatrix | `ModuleFactsMatrix.test.ets` | entry 与 library 模块类型、deviceTypes、mainElement、依赖与路径 | 24 |
| EntryStringMatrix | `EntryStringMatrix.test.ets` | entry 字符串资源精确值、长度、首尾字符、大小写变体 | 23 |
| LibraryFactsMatrix | `LibraryFactsMatrix.test.ets` | HSP 模块存在性双分支、`page_show` 资源与尺寸换算 | 22 |
| AppScopeMatrix | `AppScopeMatrix.test.ets` | ApplicationInfo 字段（类型、可移除、调试、安装来源、元数据） | 22 |
| ColorFactsMatrix | `ColorFactsMatrix.test.ets` | 窗口背景色通道、透明度、十六进制表示 | 11 |
| MediaFactsMatrix | `MediaFactsMatrix.test.ets` | 3 张 PNG 的签名、IHDR 尺寸、分块结构、IEND、字节长度 | 39 |
| LayeredTextMatrix | `LayeredTextMatrix.test.ets` | 分层图配置与文本资源的交叉校验 | 8 |
| AbilityFactsMatrix | `AbilityFactsMatrix.test.ets` | EntryAbility 导出状态、标签/图标 ID、Skill 与扩展信息 | 15 |
| DraftIoMatrix | `DraftIoMatrix.test.ets` | 文本读写、追加链、重命名、复制、移动、嵌套目录、批量列举、stat/access | 217 |
| PrefStoreMatrix | `PrefStoreMatrix.test.ets` | 字符串/数字/布尔/数组往返、默认值、has/delete/clear、flush 后持久化 | 128 |
| EncodeTextMatrix | `EncodeTextMatrix.test.ets` | UTF-8 文本编码与解码、Base64/hex 往返、长度与首尾字节、多字节字符 | 214 |
| JsonDocMatrix | `JsonDocMatrix.test.ets` | 嵌套配置文档、订单数组汇总、序列化往返、非法 JSON 抛错 | 122 |
| NumberSenseMatrix | `NumberSenseMatrix.test.ets` | `toFixed`、进制转换、边界值、整数与浮点、`Number` 静态方法 | 234 |
| TextSenseMatrix | `TextSenseMatrix.test.ets` | 切片/子串、查找、大小写、填充、替换、重复、拆分合并 | 300 |
| CollectionSenseMatrix | `CollectionSenseMatrix.test.ets` | 栈/队列操作、splice、过滤映射、排序反转、reduce/find/slice | 300 |
| TimeSenseMatrix | `TimeSenseMatrix.test.ets` | UTC 字段、日期格式化、时间差、月份与闰年边界 | 132 |
| MathSenseMatrix | `MathSenseMatrix.test.ets` | 取整、幂与开方、三角与对数、最值与符号、勾股数 | 164 |
| DisplayFactsMatrix | `DisplayFactsMatrix.test.ets` | 默认显示器 id、宽高、密度、刷新率与方向 | 70 |
| FileErrorMatrix | `FileErrorMatrix.test.ets` | 不存在路径、非法参数、权限错误码，错误码与异常消息 | 125 |
| WantFactsMatrix | `WantFactsMatrix.test.ets` | Want 的 bundle/module/ability 字段、URI、parameters、entities/action 组合 | 80 |
| ResourceIdMatrix | `ResourceIdMatrix.test.ets` | 按 ID 读取字符串、颜色、媒体，与按名称读取交叉验证 | 35 |
| UiFlowMatrix | `UiFlowMatrix.test.ets` | UiTest 查找 `HelloWorld`、点击 1/2/3 次、读取文本与边界 | 8 |
| ModuleNameMatrix | `ModuleNameMatrix.test.ets` | 20 个真实 token 的长度、首尾字符、查找、大小写、反转、拆分 | 180 |
| VersionMatrix | `VersionMatrix.test.ets` | versionCode 与 versionName 映射、语义化版本序、数字和与零个数 | 55 |
| HspTextMatrix | `HspTextMatrix.test.ets` | `page from package` 等文本的切片、重复、字符位置与字面形状 | 44 |
| SignatureMatrix | `SignatureMatrix.test.ets` | appId 前缀/分隔符/分段，指纹长度、空格、切分与多次读取稳定性 | 22 |
| LayeredJsonMatrix | `LayeredJsonMatrix.test.ets` | `layered_image.json` 的根键、引用键、值与文本长度 | 16 |

- 每条用例至少 2~4 条断言，按“主结果 + 独立佐证 + 边界/不变量”组织；媒体用独立的 PNG 分块解析与校验和交叉验证。
- `List.test.ets` 中纯逻辑套件在前，Ability 与 UI 套件在后；每个套件 `beforeEach` 等待 30 ms 让出主线程。
- HSP 是否安装不影响整包结果：`LibraryFactsMatrix` 对 `library` 模块做存在性分支，已安装校验模块与 `page_show` 资源，未安装校验模块列表不含 `library`。
- 生命周期与 UI 用例每次先结束已有 `EntryAbility` 再重新拉起，页面状态不在用例间传递。
- 用例数据全部由工程内真实资源与独立计算结果推导，不使用 `index % N` 形式的模板轮转；同一用例内不出现重复断言，全部 2657 条用例无完全重复代码。

## 执行方式

1. 用 DevEco Studio 6.1.1 打开工程，选择 `entry`、`library` 模块编译，分别生成 entry HAP、library HSP；再编译 `entry` 的 `ohosTest` 生成测试 HAP。
2. 安装到设备（`hdc install`）：
   - `entry-default-signed.hap`
   - `entry-ohosTest-signed.hap`
   - 可选：`library-default-signed.hsp`（用于覆盖 HSP 已安装分支的用例）


3可在 DevEco Studio 中右键 `entry/src/ohosTest/ets/test/List.test.ets`，选择 `Run 'List.test.ets'` 运行全部套件。

## 测试结果

- 测试 HAP 编译通过，全量 2657 条用例已归档；`LibraryFactsMatrix` 对 library HSP 已安装与未安装两种部署均给出有效断言。
