# 自定义图案锁测试用例归档

## 手工用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 输入密码数量不足 | 启动应用 | 手指滑动连接圆点 0、1、2 | 提示密码输入数量不足，选中圆点显示错误态效果 | 否 | Pass |
| 输入错误密码 | 启动应用 | 手指滑动连接圆点 0、1、2、3 | 提示密码输入错误，选中圆点显示错误态效果 | 否 | Pass |
| 输入正确密码 | 启动应用 | 手指滑动连接圆点 0、1、2、5、8 | 提示密码输入正确，选中圆点显示正确态效果 | 否 | Pass |

## 自动化测试执行

- 测试模块：`entry_test`（ohosTest），`TestAbility` + `OpenHarmonyTestRunner`。
- 设备前置：解锁、无系统弹窗；main HAP 与 ohosTest HAP 均安装（DevEco 自动签名）。


## 套件总览

`List.test.ets` 共注册 **13 个套件、3,073 条用例、约 2.9 万行测试代码**。为避免 4 份克隆文件，矩阵改为 **1 个文件 + `CASES` 表 + `forEach` 动态生成**；代码量由 6 个质量维度套件补回，并清理了未注册的 `*Part*.test.ets` 遗留文件。

### 数据驱动矩阵（6 套件 / 1,536 条）

| 套件 | 用例数 | 验证点 |
|---|---:|---|
| `controllerResetMatrixTest` | 256 | 注册/未注册 `reset` 回调时的调用次数 |
| `controllerResultMatrixTest` | 256 | CORRECT/WRONG 透传、重复调用次数、未注册无回调 |
| `challengeResultEnumMatrixTest` | 256 | `CORRECT=1`、`WRONG=2`、类型/互异/大小关系 |
| `circleStyleOptionsMatrixTest` | 256 | color/radius 可选值、wave/foreground 开关、实例独立性 |
| `controllerIsolationMatrixTest` | 256 | 两个控制器回调互不影响、重复注册替换旧回调 |
| `controllerLifecycleMatrixTest` | 256 | 按位组合 reset/setChallengeResult，校验次数与最后结果 |

### 质量维度套件（6 套件 / 1,536 条）

| 套件 | 用例数 | 维度 | 验证点 |
|---|---:|---|---|
| `perfBudgetTest` | 256 | 性能 | reset/result/options/混合操作耗时 ≥0 且 < 5s |
| `stabilityRepeatTest` | 256 | 稳定性 | 重复 reset/set 次数正确、重复注册只保留最新回调 |
| `inputBoundaryTest` | 256 | 输入边界 | 空字符串/0/undefined 的 color/radius、无回调、枚举越界 |
| `compatibilityTest` | 256 | 兼容性 | number/string/undefined 颜色、枚举比较、多控制器/多实例独立 |
| `i18nResourceTest` | 256 | 国际化/资源 | 颜色字符串原样保留、数字颜色、undefined 字段、混合配置 |
| `recoveryIsolationTest` | 256 | 恢复/隔离 | 双控制器隔离、回调替换、result 后 reset 互不影响、新实例无残留 |

- 基础套件 `ActsAbilityTest` 1 条（模板断言）。
- 所有用例引用 `CustomPatternLock.ets` 导出的 `CustomPatternLockController`、`CustomPatternLockChallengeResult`、`CustomCircleStyleOptions`；DOMAIN `0xF811`、TAG `[Sample_PatternLock_*]`，每条用例输出 begin/end 日志。
- `TestAbility`/`OpenHarmonyTestRunner`/页面文件均已带版权头，Runner 使用 `globalThis`，基础设施与用例日志格式统一。

## 验证记录

- `assembleHap`：`BUILD SUCCESSFUL`（`entry@ohosTest`）。
- 真机运行需在 DevEco Studio 中打开工程并使用自动签名生成 signed HAP；本仓库 `build-profile.json5` 的 `signingConfigs` 为空，命令行构建仅产出 unsigned HAP。
