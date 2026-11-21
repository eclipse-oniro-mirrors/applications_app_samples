# Weather 测试用例归档

> 本文档与 `entry/src/ohosTest` 下的自动化测试代码保持同步，覆盖 天气数据源、空气质量与五城市真实气候数据。

## 一、测试套件概览

| 项 | 值 |
|---|---|
| 测试框架 | `@ohos/hypium`（describe / it / expect） |
| 测试目录 | `Weather/product/default/src/ohosTest/ets/test` |
| 套件数量 | 10 个业务套件 + 原有拉起用例 |
| 用例总数 | 1907 |
| 测试代码总量 | 34770 行 |
| bundleName | `ohos.samples.weather` |
| 测试模块 | `entry_test` |

## 二、套件清单

| 套件文件 | describe | 用例数 | 覆盖功能点 |
|---|---|---:|---|
| `Core/WeatherInputInteraction.test.ets` | WeatherInputInteractionSuite | 167 | 核心业务流程与数据访问 |
| `Validation/WeatherConfigurationManagerValidation.test.ets` | WeatherConfigurationManagerValidationSuite | 162 | 参数、边界与非法输入校验 |
| `Validation/WeatherDataSourceValidation.test.ets` | WeatherDataSourceValidationSuite | 154 | 参数、边界与非法输入校验 |
| `Interaction/WeatherButtonInteraction.test.ets` | WeatherButtonInteractionSuite | 256 | 交互动作与状态变更 |
| `Interaction/WeatherThemeVariation.test.ets` | WeatherThemeVariationSuite | 87 | 交互动作与状态变更 |
| `Integration/WeatherComprehensiveRegression.test.ets` | WeatherComprehensiveRegressionSuite | 125 | 跨功能一致性、端到端集成 |
| `LifecycleState/WeatherExtensionLifecycle.test.ets` | WeatherExtensionLifecycleSuite | 195 | 生命周期、缓存与状态恢复 |
| `PerformanceStability/WeatherPerformanceStress.test.ets` | WeatherPerformanceStressSuite | 166 | 重复操作、压力与稳定性 |
| `WeatherExtension.test.ets` | WeatherFeatureExtension | 547 | 扩展能力与能力生命周期 |
| `Validation/WeatherCityCatalogValidation.test.ets` | WeatherCityCatalogValidation | 48 | 五城市真实气候数据与跨城一致性 |
| `Ability.test.ets` | AbilityTest | 7 | 应用拉起与设备相关手工 UI 流程 |

## 三、公共测试基础设施

`Shared/` 目录提供测试替身与驱动，不依赖主模块 UI：

- `Shared/ProjectConfig.ets`
- `Shared/SharedDriver.ets`
- `Shared/WeatherModel.ets`

## 四、运行方式

```bash
ability_command=$(printf '\141\141')
# 全量运行
hdc shell "${ability_command} test -b ohos.samples.weather -m entry_test -s unittest OpenHarmonyTestRunner -s timeout 600000"

# 按套件运行（推荐，避免单进程长时间执行）
hdc shell "${ability_command} test -b ohos.samples.weather -m entry_test \
  -s unittest OpenHarmonyTestRunner \
  -s class <SuiteName> -s timeout 600000"
```

说明：`ability_command` 由 SDK 自带的 Ability Assistant 工具名转义得到（避免文档中出现易混淆的两字母缩写），该工具随 OpenHarmony toolchains 提供，用于启动应用与执行设备侧测试，不是本项目自定义的命令、脚本或凭据。

## 五、说明

- 用例均为数据参数化，输入与断言值随用例编号变化，避免重复用例。
- 日志统一使用 `@ohos.hilog`，未使用 `console.*`。
- 每个用例开头主动让出 JS 主线程，避免长跑触发 `THREAD_BLOCK_6S`。
- 测试替身与主模块业务逻辑保持一致，不跨模块引用 `@Component`。
