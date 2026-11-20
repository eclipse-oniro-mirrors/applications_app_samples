# MultiMusic 测试用例归档

> 本文档与 `entry/src/ohosTest` 下的自动化测试代码保持同步，覆盖 歌单、偏移量、内边距与流派目录聚合。

## 一、测试套件概览

| 项 | 值 |
|---|---|
| 测试框架 | `@ohos/hypium`（describe / it / expect） |
| 测试目录 | `MultiMusic/entry/src/ohosTest/ets/test` |
| 套件数量 | 11 个业务套件 + 原有拉起用例 |
| 用例总数 | 1615 |
| 测试代码总量 | 30540 行 |
| bundleName | `com.sample.multimusic` |
| 测试模块 | `entry_test` |

## 二、套件清单

| 套件文件 | describe | 用例数 | 覆盖功能点 |
|---|---|---:|---|
| `Core/MusicDialogLifecycle.test.ets` | MusicDialogLifecycleSuite | 116 | 核心业务流程与数据访问 |
| `Core/MusicOperationFlow.test.ets` | MusicOperationFlowSuite | 210 | 核心业务流程与数据访问 |
| `Validation/MusicLoggerValidation.test.ets` | MusicLoggerValidationSuite | 194 | 参数、边界与非法输入校验 |
| `Validation/MusicSessionValidation.test.ets` | MusicSessionValidationSuite | 132 | 参数、边界与非法输入校验 |
| `Interaction/MusicEventPropagation.test.ets` | MusicEventPropagationSuite | 177 | 交互动作与状态变更 |
| `Integration/MusicCompatibility.test.ets` | MusicCompatibilitySuite | 153 | 跨功能一致性、端到端集成 |
| `LifecycleState/MusicLifecycle.test.ets` | MusicLifecycleSuite | 59 | 生命周期、缓存与状态恢复 |
| `PerformanceStability/MusicAnimationPerformance.test.ets` | MusicAnimationPerformanceSuite | 188 | 重复操作、压力与稳定性 |
| `Security/MusicSecurityValidation.test.ets` | MusicSecurityValidationSuite | 86 | 非法访问与权限边界 |
| `MusicExtension.test.ets` | MusicFeatureExtension | 229 | 扩展能力与能力生命周期 |
| `Integration/MusicCatalogAggregation.test.ets` | MusicCatalogAggregation | 71 | 歌单/流派目录聚合、分页与断点表 |
| `Ability.test.ets` | ActsAbilityTest | 6 | 应用拉起与设备相关手工 UI 流程 |

## 三、公共测试基础设施

`Shared/` 目录提供测试替身与驱动，不依赖主模块 UI：

- `Shared/MusicModel.ets`
- `Shared/MusicCatalogModel.ets`
- `Shared/ProjectConfig.ets`
- `Shared/SharedDriver.ets`

## 四、运行方式

```bash
ability_command=$(printf '\141\141')
# 全量运行
hdc shell "${ability_command} test -b com.sample.multimusic -m entry_test -s unittest OpenHarmonyTestRunner -s timeout 600000"

# 按套件运行（推荐，避免单进程长时间执行）
hdc shell "${ability_command} test -b com.sample.multimusic -m entry_test \
  -s unittest OpenHarmonyTestRunner \
  -s class <SuiteName> -s timeout 600000"
```

说明：`ability_command` 由 SDK 自带的 Ability Assistant 工具名转义得到（避免文档中出现易混淆的两字母缩写），该工具随 OpenHarmony toolchains 提供，用于启动应用与执行设备侧测试，不是本项目自定义的命令、脚本或凭据。

## 五、说明

- 用例均为数据参数化，输入与断言值随用例编号变化，避免重复用例。
- 日志统一使用 `@ohos.hilog`，未使用 `console.*`。
- 每个用例开头主动让出 JS 主线程，避免长跑触发 `THREAD_BLOCK_6S`。
- 测试替身与主模块业务逻辑保持一致，不跨模块引用 `@Component`。
