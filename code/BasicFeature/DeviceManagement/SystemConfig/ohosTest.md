# SystemConfig 测试用例报告

## 测试概述

本测试报告覆盖 SystemConfig 示例应用的 ohosTest 自动化测试用例。测试框架基于 [@ohos/hypium](https://gitee.com/openharmony-tpc/hypium)，使用 `@kit.TestKit` 和 `@kit.PerformanceAnalysisKit` 进行用例管理和日志输出。

- **测试模块**：`entry/src/ohosTest`
- **测试套件总数**：54 个（另有 `List.test.ets` 统一注册入口）
- **测试用例总数**：624 条
- **测试分类**：9 个类别（CustomConfig、Device、Integration、IntelligentScene、Network、Service、SettingsLite、Utils、Validation）
- **日志 DOMAIN**：`0xF820`
- **日志 TAG**：`[Sample_SystemConfig]`

## 测试环境

| 项目 | 说明 |
| --- | --- |
| 目标设备 | RK3568 开发板 |
| API 版本 | API 26 |
| 运行时 | OpenHarmony |
| 测试框架 | @ohos/hypium 1.0.25 |
| IDE | DevEco Studio 5.0+（本次验证使用 DevEco Studio 26） |

## 命名与编号规范

全部用例遵循统一的命名与编号规则（详见 `.qoder/skills/ohos-testcase-naming/SKILL.md`）：

| 项目 | 规则 | 示例 |
| --- | --- | --- |
| `it()` / `@tc.name` | `test<Feature><NNNN>`，Feature 与测试文件名对应；后四位从 `0001` 起每条自增 1 | `testUtilsMathUtils0001`、`testUtilsMathUtils0002` |
| `@tc.number` | `SUB_<MODULE>_<SEQ>`，MODULE 为文件名驼峰转大写下划线；后四位从 `0100` 起每条自增 100 | `SUB_UTILS_MATH_UTILS_0100`、`SUB_UTILS_MATH_UTILS_0200` |
| 编号顺序 | 同一文件内按 `it()` 出现顺序连续编号，不跳号、不重复、不回退 | 第 3 条：`SUB_UTILS_MATH_UTILS_0300` + `testUtilsMathUtils0003` |
| `@tc.name` 一致性 | `@tc.name` 的值与 `it()` 第一个参数完全一致 | — |
| `@tc.size` / `@tc.type` / `@tc.level` | 统一 `MediumTest` / `Function` / `Level 0`（核心路径）或 `Level 1`（边界、异常、高级场景） | — |

每个用例前均有完整元数据注释块（`@tc.number` / `@tc.name` / `@tc.desc` / `@tc.size` / `@tc.type` / `@tc.level`），hilog 日志中的用例名与 `it()` 名称一致。

## 测试用例清单

按分类列出全部 54 个套件与用例数。套件名即 `describe()` 名称，用例名可按上述规则由文件名推导。

### 1. CustomConfig 定制配置测试（4 个套件，29 条用例）

**测试文件**：`entry/src/ohosTest/ets/test/CustomConfig/`

| 套件 | 用例数 | 测试内容 |
| --- | --- | --- |
| ChannelConfigModelTest | 10 | 构造默认值、状态标记、序列化、重置、获取次数与时间差 |
| ChannelConfigModelExtendedTest | 10 | 时间边界、循环重置、JSON 往返、连续时间戳、并发标记 |
| CustomConfigGetChannelIdTest | 5 | getChannelId 调用、返回值与模型一致性、重置与未初始化场景 |
| CustomConfigPageUITest | 4 | 定制配置页面初始化、获取渠道号、查看详情与重置的真实 UI 行为 |

### 2. Device 设备与存储测试（4 个套件，44 条用例）

**测试文件**：`entry/src/ohosTest/ets/test/Device/`

| 套件 | 用例数 | 测试内容 |
| --- | --- | --- |
| FileUtilsTest | 11 | 文件扩展名、名称、大小、类型判断与读写 |
| PreferenceUtilsTest | 13 | Preferences 各类型读写、默认值、删除、flush 与重复初始化 |
| StorageUtilsTest | 11 | 存储统计、路径获取、可用空间与目录操作 |
| DeviceUtilsTest | 9 | 设备 ID 生成、平台信息、hash 长度与唯一性 |

### 3. Integration 集成组合测试（4 个套件，24 条用例）

**测试文件**：`entry/src/ohosTest/ets/test/Integration/`

| 套件 | 用例数 | 测试内容 |
| --- | --- | --- |
| ErrorHandlingCombinationTest | 6 | 非法值、边界值、超长输入、特殊字符、极值组合与恢复流程 |
| HomeNavigationUITest | 4 | 首页三个入口可见性与真实点击导航、返回恢复 |
| MultiServiceIntegrationTest | 4 | 三服务独立操作、生命周期协同、并发调用与组合业务流程 |
| IntegrationExtendedTest | 10 | 并发组合、状态隔离、边界组合与多服务协同 |

### 4. IntelligentScene 情景模式测试（4 个套件，26 条用例）

**测试文件**：`entry/src/ohosTest/ets/test/IntelligentScene/`

| 套件 | 用例数 | 测试内容 |
| --- | --- | --- |
| DoNotDisturbModelTest | 10 | 构造默认值、状态标记、序列化、免打扰/通知状态更新 |
| DoNotDisturbModelExtendedTest | 10 | 时间差、循环重置、JSON 往返、时间戳精度与连续调用 |
| IntelligentSceneDndTest | 5 | 免打扰与通知状态查询、多次查询一致性、重置与重新初始化 |
| IntelligentScenePageUITest | 1 | 情景模式页面查询免打扰状态的真实 UI 行为 |

### 5. Network 网络与权限测试（4 个套件，121 条用例）

**测试文件**：`entry/src/ohosTest/ets/test/Network/`

| 套件 | 用例数 | 测试内容 |
| --- | --- | --- |
| EncryptionUtilsTest | 10 | base64 编解码、hash、md5、UUID 格式与唯一性 |
| HttpUtilsTest | 35 | HTTP 请求、状态码、重试、请求头、取消、下载与响应处理 |
| NetworkUtilsTest | 42 | 网络状态、WiFi 信息、信号等级、类型判断与状态回调 |
| PermissionUtilsTest | 34 | 权限检查、申请、授权状态与多权限结果聚合 |

### 6. Service 服务层测试（12 个套件，124 条用例）

**测试文件**：`entry/src/ohosTest/ets/test/Service/`

| 套件 | 用例数 | 测试内容 |
| --- | --- | --- |
| CustomConfigServiceTest | 6 | 初始化、渠道获取、模型状态、状态描述与日志 |
| CustomConfigServiceExtendedTest | 15 | getChannelId 多次调用、状态缓存、边界与异常恢复 |
| EventServiceTest | 6 | 初始化、观察者管理、事件记录与清除 |
| EventServiceExtendedTest | 20 | 事件统计、字段完整性、过滤、回调与按时间清除 |
| HistoryClearTest | 5 | 应用内历史清除与页面日志清理 |
| IntelligentSceneServiceTest | 15 | 免打扰/通知查询、模型状态与历史记录 |
| IntelligentSceneServiceExtendedTest | 5 | 服务生命周期、模型实例替换与状态缓存 |
| SettingsLiteServiceTest | 14 | PIN/NFC/双击模型默认值、类型名称与状态描述 |
| SettingsLiteServiceExtendedTest | 16 | 边界、异常、日志、getAllSettingsDetail 与模型实例一致性 |
| SettingsLiteServiceOperationTest | 7 | 直接调用真实 Service，校验 Want 的 action/uri、异常路径与模型隔离 |
| TraceServiceTest | 5 | 追踪启停、任务绑定与日志 |
| TraceServiceExtendedTest | 10 | 重入、嵌套、异常路径与多任务追踪 |

### 7. SettingsLite 设置信息测试（6 个套件，31 条用例）

**测试文件**：`entry/src/ohosTest/ets/test/SettingsLite/`

| 套件 | 用例数 | 测试内容 |
| --- | --- | --- |
| SettingsItemModelTest | 10 | 构造、状态管理、状态描述、类型名称与序列化 |
| SettingsItemModelExtendedTest | 9 | 状态覆盖、时间差、循环重置与 JSON 往返 |
| SettingsLiteDoubleClickTest | 3 | 双击设置页面打开与双击应用回调 |
| SettingsLiteNfcSettingTest | 3 | NFC 设置页面打开、多次调用与重置 |
| SettingsLitePageUITest | 3 | 设置信息页面三卡片可见性与真实打开、重置行为 |
| SettingsLitePinSettingTest | 3 | PIN 设置页面打开、多次调用与重置 |

### 8. Utils 工具类测试（10 个套件，145 条用例）

**测试文件**：`entry/src/ohosTest/ets/test/Utils/`

| 套件 | 用例数 | 测试内容 |
| --- | --- | --- |
| BoundaryValueTest | 25 | 工具类极值、空值、非法值与边界组合 |
| UtilsCommonUtilsTest | 10 | ID 生成、空判断、深拷贝、JSON 解析与重试 |
| ConstantsTest | 15 | 页面路由常量与系统配置常量取值一致性 |
| UtilsDateUtilsTest | 11 | 时间戳、日期格式化、加减运算与相对时间 |
| UtilsFormatUtilsTest | 11 | 字节/时长/数字/百分比格式化与截断 |
| LoggerTest | 15 | 日志级别、模块标签、过滤、历史、监听器与导出 |
| UtilsMathUtilsTest | 13 | clamp、lerp、round、randomInt、average、sum 等 |
| RandomUtilsTest | 18 | 随机数/串、UUID、随机选取、洗牌、颜色与权重 |
| UtilsStringUtilsTest | 13 | 大小写转换、包含判断、重复、反转与 hash |
| UtilsTypeUtilsTest | 14 | 类型判断、空判断与类型转换 |

### 9. Validation 校验测试（6 个套件，80 条用例）

**测试文件**：`entry/src/ohosTest/ets/test/Validation/`

| 套件 | 用例数 | 测试内容 |
| --- | --- | --- |
| ValidateChannelIdTest | 7 | 渠道号合法值、空值、超长、特殊字符与类型边界 |
| ClipboardUtilsTest | 17 | 剪贴板读写、文本/富文本、空内容与异常路径 |
| ValidateDeviceIdTest | 8 | 设备号格式、长度边界与非法值 |
| FormValidatorTest | 17 | 校验规则、必填/长度/范围/正则与错误收集 |
| ValidationUtilsComprehensiveTest | 15 | 综合边界与校验方法组合 |
| ValidationUtilsMethodsTest | 16 | 各校验方法正向与反向场景 |

## 测试执行

### 构建测试 HAP

```bash
hvigorw --mode module -p module=entry@ohosTest -p product=default assembleHap --no-daemon
```

### 安装并运行全量用例

```bash
# 卸载旧版本后，将主 HAP 与测试 HAP 推送到同一目录并安装
hdc uninstall ohos.samples.systemconfig
hdc shell mkdir data/local/tmp/syscfg_test
hdc file send entry/build/default/outputs/default/entry-default-signed.hap data/local/tmp/syscfg_test
hdc file send entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap data/local/tmp/syscfg_test
hdc shell bm install -p data/local/tmp/syscfg_test
hdc shell rm -rf data/local/tmp/syscfg_test

# 全量执行（unittest 必须为 TestRunner 完整路径）
hdc shell "aa test -b ohos.samples.systemconfig -m entry_test -s unittest /ets/TestRunner/OpenHarmonyTestRunner -s timeout 15000"

# 指定套件 / 单条用例
hdc shell "aa test -b ohos.samples.systemconfig -m entry_test -s unittest /ets/TestRunner/OpenHarmonyTestRunner -s class UtilsMathUtilsTest -s timeout 15000"
hdc shell "aa test -b ohos.samples.systemconfig -m entry_test -s unittest /ets/TestRunner/OpenHarmonyTestRunner -s class UtilsMathUtilsTest#testUtilsMathUtils0001 -s timeout 15000"
```

结果以 `OHOS_REPORT_RESULT` 与 `Tests run` 行为准：状态码 `1` 用例开始、`0` 通过、`-2` 断言失败、`-1` 执行异常；`TestFinished-ResultCode: 0` 仅表示 runner 执行完毕，不代表用例全部通过。

### 用例审计

```bash
node .qoder/skills/ohos-testcase-supplement/scripts/audit_cases.js entry/src/ohosTest/ets/test
```

审计脚本递归扫描全部子目录，检查：重名、重复 `@tc.number`、元数据完整性、命名与编号递增规范、`it()` 总数与注释块一致性、静态断言数提示。任何重名/编号/元数据/命名违规都会以退出码 1 阻断。脚本不校验 `@tc.size` / `@tc.level` / `@tc.type` / `@tc.desc` 的取值合规，需按上表另行核对。

## 测试统计

| 类别 | 套件数 | 用例数 |
| --- | --- | --- |
| CustomConfig | 4 | 29 |
| Device | 4 | 44 |
| Integration | 4 | 24 |
| IntelligentScene | 4 | 26 |
| Network | 4 | 121 |
| Service | 12 | 124 |
| SettingsLite | 6 | 31 |
| Utils | 10 | 145 |
| Validation | 6 | 80 |
| **合计** | **54** | **624** |

### 最新真机验证结果

连续两轮全量运行（每用例超时 15000ms）：

```
Tests run: 624, Failure: 0, Error: 0, Pass: 624, Ignore: 0
Tests run: 624, Failure: 0, Error: 0, Pass: 624, Ignore: 0
```

审计结果：`files=55, total=624`，重名、重复编号、元数据问题、命名编号违规、少于 3 条静态断言的用例均为 0。

最近一次复验为 2026-11-10 16:30 前后，覆盖 `testErrorHandlingCombination0002/0003`（去掉 try/catch，改由框架直接判定异常）与 `testChannelConfigModel0010`（补强 `markSuccess` 效果与时间戳上界）三处断言整改，单例状态码均为 `1` → `0`，耗时 20–32ms。

## 已知环境限制与缺陷记录

以下问题在测试侧已定位但按边界不修改业务源码，仅记录：

1. **免打扰状态查询后端缺失**：`@ohos.intelligentScene` 经 `libintelligentscene.z.so` 依赖通知管理 SA（1190），当前镜像不含该能力，查询恒返回 `35200001`。相关用例改用「成功/失败两分支均确定」的断言方式，不宣称系统返回 SUCCESS。
2. **`ChannelConfigModel.markFailed` 不清空 `channelId`**：与 `isSuccess()` 的语义在失败分支下不一致。
3. **`IntelligentSceneService.initialize()` / `SettingsLiteService.initialize()` 会新建模型实例**：外部持有的旧引用在服务侧已失效，读到的快照不会更新；用例改为通过 `getDoNotDisturbModel()` 取活动实例。
4. **`IntelligentSceneService.isNotifyAllowedInDoNotDisturb()`** 在进入 SUCCESS 前后可能经历 QUERYING 状态，存在二次 `markSuccess` 的冗余写入。
5. **`StorageUtils.isStorageLow` 正向低存储分支疑似不可达**：正数输入下的判定公式使该分支难以命中，未通过硬编码宣称覆盖。
6. **`CustomDialogController` 回调以裸方法传递丢失 `this`**：点击确认弹窗会终止应用，该路径不纳入 UI 用例。
7. **21 条依赖系统设置目标页或特定权限的用例已删除**：换用标准完整镜像后需补回并重新验收。
8. **constants 中存在 11 个全工程无引用的死常量**：`PageConstants` 的 `COLOR_CONNECTED`、`COLOR_DISCONNECTED`、`FONT_SIZE_CAPTION`、`NAV_ITEM_HEIGHT`、`PAGE_INDEX`、`STATUS_BAR_HEIGHT`，以及 `SystemConfigConstants` 的 `ERROR_PERMISSION_DENIED`、`EVENT_DOMAIN`、`EVENT_GROUP`、`MAX_RETRY_COUNT`、`REFRESH_INTERVAL_MS`。已在 main、library、ohosTest 三棵树（128 个源文件）独立检索确认零命中。此类死常量不会导致测试变红或审计报错，只能静态发现；经命名特征排查，非 FAModel 并行开发的回滚残留，属历史遗留。
9. **本工程无 git 内容基线，「main 未改动」无法逐字节证明**：`git ls-files` 在 SystemConfig 下仅返回 2 个 ohosTest 文件，main / library / AppScope 全部未被跟踪，亦无事先导出的哈希清单。2026-11-10 曾出现外部并行改动（新增 FAModel 页面与服务，导致 22 个 ArkTS 编译错误阻塞构建），随后于 16:22 回滚。回滚已确认干净（FAModel 符号残留 0、`main_pages.json` 恢复 4 页、无悬空导出），但 `Index.ets`、`main_pages.json`、`string.json`、`PageConstants.ts`、`SystemConfigConstants.ts` 五个文件的 mtime 被刷新，无法证明与改动前逐字节一致。测试侧的补偿性证据是：整改后的连续两轮全量运行包含全部 4 个 UI 套件且结果一致，说明用例所依赖的页面路由与组件仍然成立。
