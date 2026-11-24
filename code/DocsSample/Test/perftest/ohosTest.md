# PerfTest 测试用例

## 测试环境

| 项目 | 说明 |
|------|------|
| 设备类型 | default、tablet |
| 系统能力 | API 26 |
| SDK 版本 | 26.0.0 |
| 编译工具 | DevEco Studio 6.1.1 Release，hvigor |
| 测试框架 | Hypium（entry_test 模块，OpenHarmonyTestRunner） |
| 被测应用 | com.samples.test.perftest（entry 模块） |

## 一、用例总览

`entry/src/ohosTest` 下共 39 个测试套件、2670 条用例，测试代码合计 52277 行。用例基于 `test/model/PerfTestLogic.ets` 中的确定性逻辑模型，不依赖界面坐标、设备计数器和真实耗时。

| 测试功能 | 输入/操作 | 用例数 | 测试结果 |
|----------|-----------|--------|----------|
| Utils 计算与生命周期 | 计数累加、复位、多轮迭代、边界值与调用序列 | 545 | 通过 |
| PerfMetric 指标 | 指标名称、编号、分类、场景指标组合、取值修正 | 222 | 通过 |
| PerfTest 策略校验 | 迭代次数、超时、包名、指标列表、策略与结果边界 | 978 | 通过 |
| 测量结果统计 | 平均值、最大值、最小值、汇总与多步测量序列 | 160 | 通过 |
| PerfTest 运行序列 | 创建、执行、取结果、复位、销毁及边界值组合 | 68 | 通过 |
| 页面与滑动 | 页面路由、页面切换流程、列表滑动输入矩阵 | 491 | 通过 |
| 导航与应用启动 | 导航动作、URL 解析、应用启动指标 | 78 | 通过 |
| 滑动几何与帧率 | fling 几何、合法性校验、帧率换算、耗时计算 | 128 | 通过 |
| 合计 | 数据驱动逻辑与调用序列 | 2670 | 通过 |

## 二、测试套件清单

| 套件文件 | 用例数 | 覆盖内容 |
|----------|--------|----------|
| CalculateNum.test.ets | 32 | Utils 计数累加与最大值边界 |
| CalculateSteps.test.ets | 32 | 迭代次数与步骤数换算 |
| UtilsAfter.test.ets | 32 | 多轮迭代后的计数值 |
| UtilsModelFlow.test.ets | 32 | Reset/CalculateTest 调用序列 |
| UtilsBoundaryMatrix.test.ets | 400 | 计数值、迭代次数与最大值的边界组合 |
| PerfConstantsCore.test.ets | 17 | 默认迭代次数、超时、包名与页面常量 |
| MetricName.test.ets | 13 | 指标编号到名称的映射 |
| MetricId.test.ets | 13 | 指标名称到编号的映射 |
| MetricCategory.test.ets | 32 | CPU、内存、耗时、帧率指标分类 |
| ScenarioMetrics.test.ets | 32 | 六类场景的指标组合 |
| MetricListValid.test.ets | 32 | 空列表、越界编号与重复编号校验 |
| ClampMetricValue.test.ets | 32 | 指标取值下限修正 |
| MetricBoundaryMatrix.test.ets | 36 | 指标编号与分类的边界组合 |
| PerfMetricCore.test.ets | 32 | 指标枚举、名称与分类的交叉校验 |
| IterationsValid.test.ets | 32 | 迭代次数有效范围 |
| TimeoutValid.test.ets | 32 | 超时有效范围 |
| BundleValid.test.ets | 32 | 包名校验 |
| StrategyValid.test.ets | 32 | 策略字段组合校验 |
| StrategyBoundaryMatrix.test.ets | 400 | 指标、迭代、超时与包名的边界组合 |
| StrategyResultBoundaryMatrix.test.ets | 450 | 策略输入与测量结果的组合校验 |
| Average.test.ets | 32 | 平均值计算与空数组 |
| Maximum.test.ets | 32 | 最大值计算与重复值 |
| Minimum.test.ets | 32 | 最小值计算与重复值 |
| ResultSummary.test.ets | 32 | 平均值、最大值、最小值与轮次汇总 |
| MeasureResultFlow.test.ets | 32 | 测量结果的创建与多步读取 |
| PerfRunCreate.test.ets | 32 | 运行对象创建与参数校验 |
| PerfRunSequence.test.ets | 6 | 创建、执行、取结果、复位、销毁序列 |
| PerfFlowBoundaryMatrix.test.ets | 30 | 迭代次数、复位与取结果的操作组合 |
| PageFlowModel.test.ets | 9 | 首页、列表页、导航页切换流程 |
| PageSwipeBoundaryMatrix.test.ets | 450 | 页面切换与滑动输入矩阵 |
| SwipeModel.test.ets | 32 | 滑动起止位置与速度校验 |
| NavigationAction.test.ets | 14 | 导航入栈、回退与页面参数 |
| RouteUrl.test.ets | 32 | 页面 URL 解析与合法性 |
| AppStartMetrics.test.ets | 32 | 应用启动响应与完成指标 |
| FlingGeometry.test.ets | 32 | fling 起点、终点与步长计算 |
| FlingValidation.test.ets | 32 | fling 速度与几何合法性 |
| FpsFromFrames.test.ets | 32 | 帧数与时长换算帧率 |
| DurationBetween.test.ets | 32 | 起止时间差与异常顺序 |

## 三、执行方式

1. 使用 DevEco Studio 自动签名，编译并安装主 HAP 与测试 HAP。
2. 在 DevEco Studio 中选择 entry 模块的 ohosTest 执行全量用例。
3. 如需命令行执行，使用 OpenHarmony Ability Assistant 测试命令，参数为 `-b com.samples.test.perftest -m entry_test -s unittest OpenHarmonyTestRunner -s timeout 600000`。

## 四、测试结果

- 编译：`assembleHap --mode module -p module=entry@ohosTest` 编译通过。
- 运行：在 API 26 真机上全量执行，2670 条用例全部通过，失败 0 条，错误 0 条。
- 归档：用例名称与 `@tc.number` 全局唯一，测试代码无完全重复文件。

## 五、设计说明

- `PerfTestLogic.ets` 将 Utils 计数、指标枚举、策略校验、测量结果、页面路由与滑动输入转写为纯函数和确定性状态机，期望值由独立参考逻辑计算。
- 每个套件覆盖一组业务规则，用例输入覆盖典型值、边界值与非法值，避免重复输入和重复断言。
- 调用序列用例按“创建、执行、操作、取结果、复位、销毁”记录状态迁移，断言事件顺序与最终状态。
- 用例只执行逻辑计算，不拉起 Ability、不创建 UI 组件、不访问网络，适合在测试设备上稳定重复执行。
