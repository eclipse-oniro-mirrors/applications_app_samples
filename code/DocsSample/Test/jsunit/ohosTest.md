# jsunit 测试用例

## 测试环境

| 项目 | 说明 |
|------|------|
| 设备类型 | default、tablet |
| 系统能力 | API 20（compatibleSdkVersion） |
| SDK 版本 | 26.0.0（compileSdkVersion） |
| 运行环境 | runtimeOS：OpenHarmony |
| 编译工具 | DevEco Studio，hvigor |
| 测试框架 | Hypium 1.0.29（entry_test 模块，OpenHarmonyTestRunner） |
| 被测应用 | com.samples.test.jsunit（entry 模块） |

## 一、用例总览

`entry/src/ohosTest` 下共 63 个 describe（测试套件）、176 条有效用例（另有 1 个原 `xit`）。测试代码（`ets/test`）合计 49807 行，整个 ohosTest 为 49929 行。

| 测试功能 | 输入/操作 | 用例数 | 测试结果 |
|----------|-----------|--------|----------|
| Hypium 断言补全矩阵 | 数值、字符串、数组 matcher 的接受与预期拒绝组合 | 132 | 通过 |
| 断言 API（AssertExample） | 包含、标量、深比较、Promise 等断言正负场景 | 11 | 通过 |
| 生命周期与执行顺序 | before/after 顺序、指定 hook、跳过体、父子嵌套继承 | 7 | 通过 |
| 参数注入与数据驱动 | 形参注入、data.json 数据行、Ability 主题注册 | 3 | 通过 |
| 覆盖率与嵌套作用域 | beforeAll/beforeEach trace、outer/inner 状态 | 2 | 通过 |
| 回调示例 | 回调注册与触发 | 1 | 通过 |
| 自定义断言与示例 | 自定义断言注册与恢复、自定义函数 | 3 | 通过 |
| Mock 能力 | 参数匹配、返回值/异常、清理/忽略、静态/私有/属性、Promise、调用验证 | 15 | 通过 |
| 生命周期序列（EntryAbility） | main EntryAbility 的创建、前后台、销毁及参数 | 1 | 通过 |
| 资源引用 | 测试模块资源文件读取与内容校验 | 1 | 通过 |
| 合计 | 断言、生命周期、Mock 与资源逻辑 | 176 | 通过 |

## 二、测试套件清单

### 断言补全矩阵（33 个文件，132 例）

| 套件文件 | 用例数 | 覆盖内容 |
|----------|--------|----------|
| CompletionNumericEqualityBoundary.test.ets | 4 | 数值相等与近似边界 |
| CompletionStrictOrderingBoundary.test.ets | 4 | 严格大小比较边界 |
| CompletionInclusiveOrderingBoundary.test.ets | 4 | 包含等号的大小比较边界 |
| CompletionInverseOrderingBoundary.test.ets | 4 | 反向大小比较与否定 |
| CompletionStringWhitespaceBoundary.test.ets | 4 | 字符串空白差异比较 |
| CompletionStringUnicodeBoundary.test.ets | 4 | 字符串 Unicode 字符比较 |
| CompletionStringControlBoundary.test.ets | 4 | 字符串控制字符比较 |
| CompletionStringInverseBoundary.test.ets | 4 | 字符串反向/否定比较 |
| CompletionArrayAscending*Boundary.test.ets（Integer/Quarter/Wide） | 12 | 递增数组在不同步长下的深比较 |
| CompletionArrayDescending*Boundary.test.ets（Integer/Quarter/Wide） | 12 | 递减数组深比较 |
| CompletionArrayAlternating*Boundary.test.ets（Integer/Quarter/Wide） | 12 | 交替数组深比较 |
| CompletionArrayPlateau*Boundary.test.ets（Integer/Quarter/Wide） | 12 | 平台段数组深比较 |
| CompletionArraySymmetric*Boundary.test.ets（Integer/Quarter/Wide） | 12 | 对称数组深比较 |
| CompletionArrayImpulse*Boundary.test.ets（Integer/Quarter/Wide） | 12 | 冲激数组深比较 |
| CompletionArrayBinaryPowers*Boundary.test.ets（Integer/Quarter/Wide） | 12 | 2 的幂数组深比较 |
| CompletionArraySawTooth*Boundary.test.ets（Integer/Quarter/Wide） | 12 | 锯齿数组深比较 |
| CompletionSmallArrayBoundary.test.ets | 4 | 空数组、单元素与正负零数组 |

### 其他套件（28 个文件，44 例）

| 套件文件 | 用例数 | 覆盖内容 |
|----------|--------|----------|
| AssertExample.test.ets | 11 | Assert API：包含、标量、深比较、Promise 等 |
| BasicExample.test.ets | 1 | 基础 Ability 用例 |
| ExecuteOrder1.test.ets | 1 | before/after 执行顺序 |
| ExecuteOrder2.test.ets | 2 | 指定 hook 按当前用例分发 A/B |
| ExecuteOrder3.test.ets | 1 | skipped body 未执行与用例身份（另含 1 个原 xit） |
| ExecuteOrder4.test.ets | 2 | 父子 beforeEach 继承差异 |
| paramExample.test.ets | 3 | 形参注入与 Ability 主题用例 |
| coverExample.test.ets | 2 | beforeAll/beforeEach trace 与嵌套作用域 |
| callBackExample.test.ets | 1 | 回调注册与触发 |
| customAssert.test.ets | 2 | 自定义断言注册、校验与恢复 |
| customExample.test.ets | 1 | 自定义函数示例 |
| dataDriver/DataDriver.test.ets | 0 | 注册 data.json 注入的 AbilityTest 数据行 |
| EntryAbilitySequence.test.ets | 1 | main EntryAbility 的创建、前后台、销毁及参数 |
| resourceReference.test.ets | 1 | 测试模块资源文件名、字节数与内容 |
| mock/AfterReturn.test.ets | 1 | after 阶段返回值 |
| mock/AfterThrow.test.ets | 1 | after 阶段抛异常 |
| mock/ArgumentMatchersForAny.test.ets | 1 | any 参数匹配 |
| mock/ArgumentMatchersForRegex.test.ets | 1 | 正则参数匹配 |
| mock/ArgumentMatchersForString.test.ets | 1 | 字符串参数匹配 |
| mock/ClearMock.test.ets | 1 | 整体清理与恢复 |
| mock/IgnoreMock.test.ets | 1 | 选择性忽略与恢复 |
| mock/IsMocked.test.ets | 2 | mock 状态查询 |
| mock/MockPrivateFunc.test.ets | 1 | 私有函数 mock |
| mock/MockProperty.test.ets | 1 | 属性 mock |
| mock/MockStatic.test.ets | 1 | 静态方法 mock |
| mock/ReturnPromise.test.ets | 1 | Promise 返回值 mock |
| mock/Vertify.test.ets | 1 | 调用参数与次数验证 |
| mock/VertifyTimes.test.ets | 1 | 指定次数验证 |

## 三、执行方式

1. 使用 DevEco Studio 自动签名，编译并安装主 HAP 与测试 HAP。
2. 在 DevEco Studio 中选择 entry 模块的 ohosTest 执行全量用例。

## 四、测试结果

- 静态统计：63 个 describe、176 条有效 `it`、1 个原 `xit`；176 个 `@tc.number` 全局唯一，无重复。
- 新建用例均为 `ets/test` 下的断言、生命周期、Mock 与资源逻辑，不依赖界面坐标与设备硬件。
- 编译：主 HAP 与测试 HAP 均编译通过。
- 运行：已在 API 20 及以上真机全量执行，176 条用例全部通过，失败 0 条，错误 0 条。

