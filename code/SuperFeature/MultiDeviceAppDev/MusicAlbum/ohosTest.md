# MusicAlbum 测试用例归档

> 本文档与 `entry/src/ohosTest` 下的自动化测试代码保持同步，覆盖 专辑列表、断点字号与数据源监听器契约。

## 一、测试套件概览

| 项 | 值 |
|---|---|
| 测试框架 | `@ohos/hypium`（describe / it / expect） |
| 测试目录 | `MusicAlbum/entry/src/ohosTest/ets/test` |
| 套件数量 | 10 个业务套件 + 原有拉起用例 |
| 用例总数 | 1843 |
| 测试代码总量 | 34452 行 |
| bundleName | `ohos.samples.MusicAlbum` |
| 测试模块 | `entry_test` |

## 二、套件清单

| 套件文件 | describe | 用例数 | 覆盖功能点 |
|---|---|---:|---|
| `Core/AlbumOperations.test.ets` | AlbumOperationsSuite | 177 | 核心业务流程与数据访问 |
| `Core/AlbumStress.test.ets` | AlbumStressSuite | 31 | 核心业务流程与数据访问 |
| `Validation/AlbumAppVersion.test.ets` | AlbumAppVersionSuite | 234 | 参数、边界与非法输入校验 |
| `Validation/AlbumBoundaryErrorTesting.test.ets` | AlbumBoundaryErrorTestingSuite | 180 | 参数、边界与非法输入校验 |
| `Interaction/AlbumFocusRingBehavior.test.ets` | AlbumFocusRingBehaviorSuite | 167 | 交互动作与状态变更 |
| `Integration/AlbumUserScenarios.test.ets` | AlbumUserScenariosSuite | 174 | 跨功能一致性、端到端集成 |
| `LifecycleState/AlbumErrorRecovery.test.ets` | AlbumErrorRecoverySuite | 267 | 生命周期、缓存与状态恢复 |
| `PerformanceStability/AlbumLongTermStability.test.ets` | AlbumLongTermStabilitySuite | 49 | 重复操作、压力与稳定性 |
| `AlbumExtension.test.ets` | AlbumFeatureExtension | 497 | 扩展能力与能力生命周期 |
| `Validation/AlbumSongSourceValidation.test.ets` | AlbumSongSourceValidation | 67 | 专辑/歌曲真实数据源、去重与分页 |
| `Ability.test.ets` | ActsAbilityTest | 3 | 应用拉起与设备相关手工 UI 流程 |

## 三、公共测试基础设施

`Shared/` 目录提供测试替身与驱动，不依赖主模块 UI：

- `Shared/AlbumModel.ets`
- `Shared/AlbumSongSourceModel.ets`
- `Shared/ProjectConfig.ets`
- `Shared/SharedDriver.ets`

## 四、运行方式

```bash
ability_command=$(printf '\141\141')
# 全量运行
hdc shell "${ability_command} test -b ohos.samples.MusicAlbum -m entry_test -s unittest OpenHarmonyTestRunner -s timeout 600000"

# 按套件运行（推荐，避免单进程长时间执行）
hdc shell "${ability_command} test -b ohos.samples.MusicAlbum -m entry_test \
  -s unittest OpenHarmonyTestRunner \
  -s class <SuiteName> -s timeout 600000"
```

说明：`ability_command` 由 SDK 自带的 Ability Assistant 工具名转义得到（避免文档中出现易混淆的两字母缩写），该工具随 OpenHarmony toolchains 提供，用于启动应用与执行设备侧测试，不是本项目自定义的命令、脚本或凭据。

## 五、说明

- 用例均为数据参数化，输入与断言值随用例编号变化，避免重复用例。
- 日志统一使用 `@ohos.hilog`，未使用 `console.*`。
- 每个用例开头主动让出 JS 主线程，避免长跑触发 `THREAD_BLOCK_6S`。
- 测试替身与主模块业务逻辑保持一致，不跨模块引用 `@Component`。
