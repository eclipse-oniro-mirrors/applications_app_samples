# Sensor 测试用例归档

## 文档说明

| 项目 | 内容 |
| --- | --- |
| 工程模块 | `Capi` |
| 测试用例目录 | `entry/src/ohosTest/ets/test` |
| 测试框架 | Hypium，使用 `describe`、`it` 和 `expect` 组织测试 |
| 测试入口 | `List.test.ets` 汇总并注册 Compass Pipeline、Compass Behavior、Native Sensor 和 Ability 测试套件 |
| 测试辅助 | `Shared/SharedDriver.ets` 提供 UI 查询、应用重启、设备旋转、传感器回放、布局回放和订阅生命周期辅助能力 |
| 测试文件数量 | 83 个 ETS 文件，包括 81 个测试套件文件、1 个测试聚合文件和 1 个共享辅助文件 |
| 测试用例数量 | 1307 个 `it()` 用例，其中 Compass Pipeline 1283 个、Compass Behavior 16 个、Ability 6 个、Native Sensor 2 个 |
| 测试结果 | 待执行；本文件记录代码覆盖范围，执行结果以设备测试报告为准 |

## 本次提交范围与运行前置条件

本次仅提交 `entry/src/ohosTest` 中的测试源码及本文档。工程配置、测试模块配置和 `src/main` 业务代码改动需单独准备。`Shared/SharedDriver.ets` 与 `Native/NativeSensor.test.ets` 引用 `entry/src/main/ets/moudle/CompassController.ts`，运行前必须提供该控制器及与测试约定一致的页面实现，并在本地完成测试 HAP 的模块、权限、资源和构建配置。仅检出本次测试提交不足以独立编译运行。

本次提交检查完成红线扫描、用例编号及源码结构校验，未重新执行设备测试；下文“待执行”状态保持不变。

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
| --- | --- | --- | --- | --- |
| 拉起应用并检查指南针页面 | 设备正常运行，测试 HAP 已安装 | 启动 `SensorAbility` | `directionMy`、`compassPointing` 和 `tiltAngle` 三个组件可见 | 待执行 |
| 检查指南针方向资源 | 应用位于主页 | 查询 `directionMy` 组件 | 显示本工程使用的北向资源 | 待执行 |
| 检查指南针图标组件 | 应用位于主页 | 查询 `compassPointing` 组件 | 组件类型为 `Image`，随方向状态更新 | 待执行 |
| 检查指南针角度文本 | 应用位于主页，传感器状态可用 | 查询 `tiltAngle` 文本 | 显示规范化的整数角度和度数文本 | 待执行 |
| 检查应用后台恢复 | 应用已启动并显示指南针页面 | 将应用切入后台后恢复 | 指南针页面和必要组件恢复可见 | 待执行 |
| 检查显示旋转恢复 | 应用已启动并显示指南针页面 | 执行显示方向旋转 | 指南针组件继续可见，状态保持有效 | 待执行 |
| CompassController 基础行为 | 使用测试替身创建 CompassController | 初始状态、启动、停止和重启 | 默认状态正确，订阅和取消订阅生命周期平衡 | 待执行 |
| CompassController 异常处理 | 使用可注入错误的传感器和布局测试替身 | 订阅或取消订阅返回错误 | 错误按约定抛出，布局监听器和传感器订阅得到清理 | 待执行 |
| CompassController 异步处理 | 使用可回放的异步传感器事件 | 延迟、连续和并发事件 | 按投递顺序处理事件，状态结果稳定 | 待执行 |
| CompassController 边界行为 | 使用边界角度和布局事件 | 北向跨界、360 度、横竖屏切换等输入 | 角度归一化正确，布局状态与最后一次事件一致 | 待执行 |
| Compass Pipeline 分区用例 | 使用 `CompassFixture`、传感器替身和布局替身 | `CompassPipelinePart01~78` 中的分区角度和姿态数据 | `onSensor` 的航向取整、`onLayout` 的布局状态和角度文本符合预期 | 待执行 |
| Native 传感器枚举 | 设备支持传感器 C API | 查询系统传感器元数据 | Native 传感器信息与系统 API 结果保持一致 | 待执行 |
| Native 传感器回调 | 设备具备方向传感器或加速度传感器 | 注册订阅并接收真实传感器事件 | 成功收到有效回调，完成订阅清理 | 待执行 |

## Ability 测试用例

文件：`entry/src/ohosTest/ets/test/Ability.test.ets`，共 6 个用例。

| 用例名称 | 覆盖内容 | 预期输出 |
| --- | --- | --- |
| `testSensorAbilityLaunchTest0001` | EntryAbility 页面初始化 | 三个指南针相关组件完成渲染 |
| `testSensorAbilityDirectionTest0002` | 北向资源检查 | `directionMy` 使用本工程指定资源 |
| `testSensorAbilityCompassImageTest0003` | 指南针图标组件类型 | `compassPointing` 为 Image 组件 |
| `testSensorAbilityAngleLabelTest0004` | 角度文本格式 | `tiltAngle` 包含规范化整数角度 |
| `testSensorAbilityBackgroundRestoreTest0005` | 后台恢复 | 应用恢复后指南针页面仍可用 |
| `testSensorAbilityRotationRestoreTest0006` | 显示旋转恢复 | 旋转后指南针组件仍保持可见 |

## Compass Behavior 测试用例

文件：`entry/src/ohosTest/ets/test/Compass/CompassBehavior.test.ets`，共 16 个用例。

| 用例名称 | 覆盖内容 |
| --- | --- |
| `testCompassInitialStateTest0001` | 控制器构造后的默认视图状态 |
| `testCompassSubscriptionResultTest0002` | 启动时透传订阅返回值 |
| `testCompassCallbackIdentityTest0003` | 启停过程使用相同的布局回调引用 |
| `testCompassStopFailureTest0004` | 取消订阅异常时仍移除布局监听 |
| `testCompassStartFailureTest0005` | 订阅异常传播和布局监听释放 |
| `testCompassRestartTest0006` | 多次启停后的航向和回调恢复 |
| `testCompassMultipleViewsTest0007` | 多个状态实例之间相互隔离 |
| `testCompassNorthCrossingTest0008` | 顺时针和逆时针跨北向边界 |
| `testCompassExactFullTurnTest0009` | 360 度航向归一化为 0 度 |
| `testCompassImmutableSnapshotTest0010` | 不保留或修改输入事件数组 |
| `testCompassLandscapeSequenceTest0011` | 布局事件跟随最后状态且不重置航向 |
| `testCompassDeferredEventTest0012` | 延迟异步传感器事件处理 |
| `testCompassAsyncSequenceTest0013` | 异步回放结果保持时间顺序 |
| `testCompassConcurrentDeliveryTest0014` | 并发事件按派发顺序处理 |
| `testCompassMetadataTest0015` | 忽略精度和时间戳对航向投影的干扰 |
| `testCompassSubscriptionCyclesTest0016` | 二十次页面生命周期中的订阅平衡 |

## Compass Pipeline 分区测试

`CompassPipelinePart01.test.ets` 至 `CompassPipelinePart78.test.ets` 将大量边界输入拆分为 78 个文件，便于单独执行和定位失败。每个文件均使用 `describe`、`it` 和 `expect`，通过 `CompassFixture` 驱动传感器事件和布局事件，覆盖航向取整、角度归一化、横竖屏状态、事件顺序以及状态输出。

| 文件 | 用例数 | 覆盖功能 | 预期输出 | 测试结果 |
| --- | ---: | --- | --- | --- |
| `CompassPipelinePart01.test.ets` | 5 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart02.test.ets` | 12 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart03.test.ets` | 2 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart04.test.ets` | 8 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart05.test.ets` | 17 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart06.test.ets` | 2 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart07.test.ets` | 15 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart08.test.ets` | 9 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart09.test.ets` | 19 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart10.test.ets` | 23 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart11.test.ets` | 22 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart12.test.ets` | 7 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart13.test.ets` | 10 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart14.test.ets` | 7 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart15.test.ets` | 22 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart16.test.ets` | 21 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart17.test.ets` | 30 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart18.test.ets` | 17 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart19.test.ets` | 21 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart20.test.ets` | 7 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart21.test.ets` | 23 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart22.test.ets` | 19 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart23.test.ets` | 17 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart24.test.ets` | 10 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart25.test.ets` | 6 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart26.test.ets` | 25 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart27.test.ets` | 26 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart28.test.ets` | 26 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart29.test.ets` | 17 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart30.test.ets` | 9 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart31.test.ets` | 10 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart32.test.ets` | 7 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart33.test.ets` | 7 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart34.test.ets` | 21 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart35.test.ets` | 4 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart36.test.ets` | 4 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart37.test.ets` | 5 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart38.test.ets` | 15 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart39.test.ets` | 21 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart40.test.ets` | 20 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart41.test.ets` | 13 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart42.test.ets` | 13 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart43.test.ets` | 12 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart44.test.ets` | 14 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart45.test.ets` | 14 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart46.test.ets` | 13 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart47.test.ets` | 3 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart48.test.ets` | 12 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart49.test.ets` | 16 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart50.test.ets` | 24 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart51.test.ets` | 24 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart52.test.ets` | 27 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart53.test.ets` | 26 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart54.test.ets` | 25 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart55.test.ets` | 17 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart56.test.ets` | 16 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart57.test.ets` | 23 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart58.test.ets` | 22 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart59.test.ets` | 13 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart60.test.ets` | 12 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart61.test.ets` | 17 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart62.test.ets` | 23 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart63.test.ets` | 22 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart64.test.ets` | 14 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart65.test.ets` | 16 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart66.test.ets` | 9 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart67.test.ets` | 8 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart68.test.ets` | 33 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart69.test.ets` | 17 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart70.test.ets` | 31 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart71.test.ets` | 14 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart72.test.ets` | 28 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart73.test.ets` | 30 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart74.test.ets` | 17 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart75.test.ets` | 34 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart76.test.ets` | 21 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart77.test.ets` | 29 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |
| `CompassPipelinePart78.test.ets` | 13 | 分区航向数据、传感器事件和布局状态处理 | 航向取整、角度文本和布局状态符合预期 | 待执行 |

**Pipeline 统计：** 78 个文件，1283 个用例。

## Native Sensor 测试用例

文件：`entry/src/ohosTest/ets/test/Native/NativeSensor.test.ets`，共 2 个用例。

| 用例名称 | 覆盖内容 | 预期输出 |
| --- | --- | --- |
| `testNativeSensorEnumerationTest0001` | Native 传感器元数据枚举 | 与系统传感器 API 共享的传感器信息保持一致 |
| `testNativeSensorCallbackTest0002` | Native 传感器真实回调 | 优先使用方向传感器，必要时回退到加速度传感器，并收到有效事件 |

## 测试组织和执行

- `List.test.ets` 负责注册 `CompassPipelinePart01~78`、`CompassBehavior`、`NativeSensor` 和 `abilityTest`，本身不包含独立 `it()` 用例。
- `Shared/SharedDriver.ets` 是测试辅助模块，不作为独立测试套件执行。
- UI 用例依赖设备连接、应用启动和组件查询能力。
- Native 用例依赖设备传感器能力；没有对应硬件时应根据测试报告区分环境失败和实现失败。
- Compass Pipeline 和 Compass Behavior 用例使用内存测试替身，可覆盖异常、边界和异步回放场景。
- 测试结果列统一使用“待执行”，执行完成后根据实际设备报告更新为 `Pass` 或 `Fail`。

## 建议执行方式

在 DevEco Studio 中连接目标设备，选择 entry 的测试运行配置，执行
`entry/src/ohosTest/ets/test/List.test.ets` 中注册的全部套件。测试包安装并启动后，
确认报告包含 `NativeSensor`、`CompassBehavior`、`CompassPipelinePart01` 至
`CompassPipelinePart78` 和 `SensorAbility`。

运行配置使用包名 `com.example.sensor`、测试模块 `entry_test`，
测试运行器为 `/ets/TestRunner/OpenHarmonyTestRunner`。单次用例超时设为 15000 毫秒，
启用覆盖率采集。UI 套件运行期间保持设备可交互。

覆盖率报告以 DevEco Studio 或测试执行工具生成的 `index.html` 为准。
