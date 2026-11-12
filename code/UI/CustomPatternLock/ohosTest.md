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

`List.test.ets` 共注册 **25 个套件、1,537 条用例**。

### 基础用例（1 套件 / 1 条）

| 套件 | 用例数 | 职责 |
|---|---:|---|
| `ActsAbilityTest` | 1 | 模板断言冒烟 |

### 图案锁控制器与数据模型矩阵（24 套件 / 1,536 条）

| 分组 | 套件 | 用例数 | 验证点 |
|---|---|---:|---|
| 重置回调 | `ControllerReset{Core,Extended,Advanced,Tail}` | 256 | 注册/未注册 reset 回调时，`reset()` 调用次数与回调次数一致 |
| 验证结果回调 | `ControllerResult{Core,Extended,Advanced,Tail}` | 256 | CORRECT/WRONG 结果透传、重复调用次数、未注册时无回调 |
| 结果枚举 | `ChallengeResultEnum{Core,Extended,Advanced,Tail}` | 256 | `CORRECT=1`、`WRONG=2`、类型/互异/大小关系 |
| 圆点样式 | `CircleStyleOptions{Core,Extended,Advanced,Tail}` | 256 | color/radius 可选值、wave/foreground 开关、实例独立性 |
| 多控制器隔离 | `ControllerIsolation{Core,Extended,Advanced,Tail}` | 256 | 两个控制器回调互不影响；重复注册会替换旧回调 |
| 控制器生命周期 | `ControllerLifecycle{Core,Extended,Advanced,Tail}` | 256 | 按位组合执行 reset/setChallengeResult，校验调用次数与最后一次结果 |

- 每个套件 64 条用例，`Core/Extended/Advanced/Tail` 各覆盖一段参数区间。
- 所有用例引用 `CustomPatternLock.ets` 导出的 `CustomPatternLockController`、`CustomPatternLockChallengeResult`、`CustomCircleStyleOptions`，并通过 `hilog`（DOMAIN `0xF811`、TAG `[Sample_PatternLock_*]`）输出 begin/end 日志，带完整 `@tc.number/@tc.name/@tc.desc` 元数据。
- 本次已补齐 `entry/src/ohosTest` 的 `module.json5`、`TestAbility`、`OpenHarmonyTestRunner`、页面与资源。

## 验证记录

- `assembleHap`：`BUILD SUCCESSFUL`（`entry@ohosTest`）。
- 真机运行需在 DevEco Studio 中打开工程并使用自动签名生成 signed HAP；本仓库 `build-profile.json5` 的 `signingConfigs` 为空，命令行构建仅产出 unsigned HAP。
