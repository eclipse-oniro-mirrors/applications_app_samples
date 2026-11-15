# ArkTSFullLanguageGuide 测试用例归档

## ohosTest 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 拉起应用 | 设备正常运行 | | 成功拉起应用 | 是 | Pass |
| 应用信息校验 | 应用已安装 | `-s class ActsAbilityTest` | Tests run: 1, Failure: 0 | 是 | 待验证 |
| 入口页与四个页签 | 应用前台 | `-s class ArkTSFullLanguageGuideTest` | Tests run: 5, Failure: 0 | 是 | 待验证 |
| 公共服务（UserService/ProductService/UserRepository/User 模块） | 应用已安装 | `-s class ArkTSCommonServicesTest` | Tests run: 22, Failure: 0 | 是 | 待验证 |
| 公共模块（Math/Config/Feature/Report/Logger） | 应用已安装 | `-s class ArkTSCommonModulesTest` | Tests run: 20, Failure: 0 | 是 | 待验证 |
| ModuleSystem 命名导出/导出列表/重命名导出 | 应用已安装 | `-s class ArkTSModuleSystemTest` | Tests run: 26, Failure: 0 | 是 | 待验证 |
| ModuleSystem 模块私有状态与导出常量 | 应用已安装 | `-s class ArkTSModuleStateTest` | Tests run: 10, Failure: 0 | 是 | 待验证 |
| Barrel 再导出与 UseModuleNotNamespace | 应用已安装 | `-s class ArkTSBarrelModulesTest` | Tests run: 18, Failure: 0 | 是 | 待验证 |
| 共享类型使用（getProfileName/canRead） | 应用已安装 | `-s class ArkTSSharedTypesTest` | Tests run: 10, Failure: 0 | 是 | 待验证 |
| 片段模块运行时加载与冒烟 | 应用已安装 | `-s class ArkTSSnippetRuntimeTest` | Tests run: 14, Failure: 0 | 是 | 待验证 |
| 四个内容页日志正文精确断言 | 应用前台 | `-s class ArkTSUiLogBodyTest` | Tests run: 18, Failure: 0 | 是 | 待验证 |
| 状态文本（未初始化 / *完成） | 应用前台 | `-s class ArkTSUiStatusTextTest` | Tests run: 14, Failure: 0 | 是 | 待验证 |
| 页面导航与返回 Index | 应用前台 | `-s class ArkTSUiNavigationTest` | Tests run: 11, Failure: 0 | 是 | 待验证 |
| UI 健壮性（锁屏恢复/连点/循环） | 应用前台 | `-s class ArkTSUiRobustnessTest` | Tests run: 6, Failure: 0 | 是 | 待验证 |
| UserService.findById 取值矩阵（数据驱动，原 Core/Extended/Advanced） | 应用已安装 | `-s class UserServiceFindMatrixTest` | Tests run: 321, Failure: 0 | 是 | 待验证 |
| buildUrl 拼接矩阵（10×10） | 应用已安装 | `-s class BuildUrlMatrixTest` | Tests run: 100, Failure: 0 | 是 | 待验证 |
| Math.add/multiply 恒等矩阵（数据驱动） | 应用已安装 | `-s class MathIdentityMatrixTest` | Tests run: 201, Failure: 0 | 是 | 待验证 |
| getProfileName/canRead 取值矩阵（数据驱动） | 应用已安装 | `-s class SharedTypesMatrixTest` | Tests run: 161, Failure: 0 | 是 | 待验证 |
| createProduct/ProductService.getName 名称矩阵 | 应用已安装 | `-s class ProductNameMatrixTest` | Tests run: 12, Failure: 0 | 是 | 待验证 |
| createUser/UserRepository 存取矩阵 | 应用已安装 | `-s class UserRepositoryMatrixTest` | Tests run: 50, Failure: 0 | 是 | 待验证 |
| add/multiply 全组合矩阵（16×16，数据驱动） | 应用已安装 | `-s class MathMatrixTest` | Tests run: 256, Failure: 0 | 是 | 待验证 |
| RequestTracker 状态迁移矩阵（4×4） | 应用已安装 | `-s class RequestTrackerMatrixTest` | Tests run: 16, Failure: 0 | 是 | 待验证 |
| Config 常量/标签函数/ReportBuilder | 应用已安装 | `-s class ConfigReportMatrixTest` | Tests run: 10, Failure: 0 | 是 | 待验证 |

## 扩展套件（维度扩量）

在既有功能/UI/矩阵套件基础上新增 12 组维度套件（共 1,257 条），全部使用互异输入，与既有矩阵输入域不重叠：

| 套件 | 用例数 | 维度 |
|---|---:|---|
| `UserServiceLookupMatrixPart1..2` | 150 | Validation：id -1000..-61 / 261..400 |
| `UserRepositoryBulkMatrixPart1..2` | 150 | Validation：批量 save/list 1..5 条 |
| `CreateUserMatrixPart1..2` | 150 | Validation：createUser 字段 |
| `ProductFactoryMatrixPart1..2` | 150 | Validation：createProduct/ProductService |
| `BuildUrlCompositionMatrixPart1..2` | 150 | Validation：不同 base/path 拼接 |
| `MathArithmeticMatrixPart1..2` | 150 | Validation：新操作数 add/multiply |
| `UserServiceBoundaryPart1..2` | 100 | Security：负数/0/浮点/极大 id |
| `SharedTypesBoundaryPart1..2` | 100 | Security：getProfileName/canRead 边界 |
| `RequestTrackerSequencePart1..2` | 80 | Lifecycle：2–3 步状态序列 |
| `AflgPerfPart1` | 7 | Performance：100k 调用预算 |
| `AflgStabilityPart1` | 20 | Stability：50 次重复稳定 |
| `AflgIntegrationPart1` | 50 | Integration：createUser→Repository、createProduct→Service |

当前 `List.test.ets` 共 **43 个套件、1,624 条用例、约 30,600 行**。

## 说明

- 所有套件由 `entry/src/ohosTest/ets/test/List.test.ets` 统一注册，`DOMAIN = 0xF815`，`TAG` 统一为 `[Sample_ARKTS_GUIDE_*]`。
- 原 `MathMatrix`、`MathIdentityMatrix`、`SharedTypesMatrix`、`UserServiceFindCore/Extended/Advanced` 的模板克隆文件已重构为 **4 个数据驱动套件**（`VALUES/LEFT/RIGHT/IDS` + `forEach` 生成用例），用例数与输入集合保持不变，代码量由约 2.2 万行降至约 320 行。
- `it` 名称由 `pad4(index)` 生成，如 `testMathMatrix0001`；每个套件保留一个 `@tc.number/@tc.name/@tc.desc` 注解，避免动态用例重复静态元数据。
