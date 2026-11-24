# ohosTest 测试归档

## 测试环境

| 项 | 值 |
|---|---|
| 测试设备 | 真机 d629034339413535311095d600002b00 |
| 测试 HAP | entry-ohosTest-signed.hap（3,681,800 B） |
| 配套主 HAP | entry-default-signed.hap（449,853 B） |
| 执行时间 | 2026-11-20 |

## 运行方式

使用 DevEco Studio 的 `entry@ohosTest` 运行配置在真机上执行，参数清单如下：

| 参数 | 取值 | 说明 |
|---|---|---|
| `-b` | ohos.samples.etsappaccountmanager | 被测应用包名 |
| `-m` | entry_test | 测试模块名 |
| `-s unittest` | OpenHarmonyTestRunner | 测试运行器路径 |
| `-s timeout` | 15000 | 用例超时时间（毫秒） |
| `-s class` | <测试套件名> | 追加该参数按套件过滤执行；省略时执行全部套件 |

## 测试套件与用例数

| # | 测试套件（describe） | 用例文件 | 用例数 | 真机结果 |
|---|---|---|---|---|
| 1 | KeyBuildTest | KeyBuildVolume01.test.ets | 50 | Pass |
| 2 | ErrorCodeTest | ErrorCodeVolume01.test.ets | 40 | Pass |
| 3 | StructureTest | StructureVolume01.test.ets | 50 | Pass |
| 4 | MetadataTest | MetadataReal01.test.ets | 30 | Pass |
| 5 | CatalogIndexTest | CatalogIndex01.test.ets | 8 | Pass |
| 6 | DataSourceSeqTest | DataSourceSeq01.test.ets | 20 | Pass |
| 7 | AccountDataTest | AccountDataVolume01.test.ets | 30 | Pass |
| 8 | StoreIsolationTest | StoreIsolation01.test.ets | 15 | Pass |
| 9 | AccountModelTest | AccountModelVolume01.test.ets | 30 | Pass |
| 10 | ServiceRealTest | ServiceReal01.test.ets | 20 | Pass |
| 11 | ServiceBoundaryTest | ServiceBoundary01.test.ets | 10 | Pass |
| 12 | EmailTest01 | EmailVolume01.test.ets | 60 | Pass |
| 13 | EmailTest02 | EmailVolume02.test.ets | 60 | Pass |
| 14 | EmailTest03 | EmailVolume03.test.ets | 56 | Pass |
| 15 | PasswordTest01 | PasswordVolume01.test.ets | 40 | Pass |
| 16 | PasswordTest02 | PasswordVolume02.test.ets | 36 | Pass |
| 17 | RegisterValidateTest01 | RegisterValidateVolume01.test.ets | 50 | Pass |
| 18 | RegisterValidateTest02 | RegisterValidateVolume02.test.ets | 50 | Pass |
| 19 | RegisterValidateTest03 | RegisterValidateVolume03.test.ets | 48 | Pass |
| 20 | ModifyValidateTest01 | ModifyValidateVolume01.test.ets | 44 | Pass |
| 21 | ModifyValidateTest02 | ModifyValidateVolume02.test.ets | 44 | Pass |
| 22 | RegisterPriority01Test | RegisterPriority01.test.ets | 63 | Pass |
| 23 | ModifyPriority01Test | ModifyPriority01.test.ets | 47 | Pass |
| 24 | LoginMatrix01Test | LoginMatrix01.test.ets | 43 | Pass |
| 25 | ValidateRealTest | ValidateReal01.test.ets | 40 | Pass |
| 26 | FlowValidateRealTest | FlowValidateReal01.test.ets | 40 | Pass |
| 27 | AccountUiFlowTest | AccountUiFlow01.test.ets | 30 | Pass |
| 28 | AccountUiWideTest | AccountUiWide01.test.ets | 14 | Pass |
| 29 | UiStateTest | UiState01.test.ets | 3 | Pass |
| 30 | appTest | App.test.ets | 5 | Pass |
| 合计 | 30 个测试套件 | — | 1076 | Pass |

## 执行结果

| 项 | 结果 |
|---|---|
| 测试套件 | 30 |
| 用例总数 | 1076 |
| 通过 | 1076 |
| 失败 | 0 |
| 错误 | 0 |
| 跳过 | 0 |
| 通过率 | 100% |
| 总体结论 | 全部通过 |

## 说明

- 用例总数以 `List.test.ets` 的注册调用条数与各测试文件中 `it()` 声明数为准，上表逐项相加与合计一致。
- 本批在真机执行的套件为 CatalogIndexTest、DataSourceSeqTest、StoreIsolationTest、ServiceBoundaryTest、RegisterPriority01Test、ModifyPriority01Test、LoginMatrix01Test、UiStateTest 共 8 个套件 209 条用例，其余 22 个套件的结果沿用历史执行记录。
- 每条用例的名称、编号与覆盖说明见对应测试文件内的 `@tc` 元数据注释。
