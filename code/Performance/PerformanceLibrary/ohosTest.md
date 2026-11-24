# PerformanceLibrary 测试用例归档

## 验证范围

1. 本文依据当前工程源码、`List.test.ets` 注册清单及 2026-11-21 已归档的构建、设备测试结果整理，覆盖 PerformanceLibrary 的入口、导航、渲染、状态管理、数据源、共享内存、像素算法与任务池传输。
2. 当前有效测试为 **73 个套件、3216 条用例**。已有同进程全量结果为 `Tests run: 3216, Failure: 0, Error: 0, Pass: 3216`，超时和忽略均为 0；总耗时 377.47 秒，单用例报告的最长耗时 11239 毫秒。
3. 已归档最终测试 HAP 的编译、签名及安装成功记录。构建日志包含 `BUILD SUCCESSFUL`，用例执行清单与源码逐项核对一致，无重复、遗漏或额外执行。
4. UI 场景需要同时安装主 HAP 和测试 HAP，应用包名为 `com.samples.performancelibrary`，主模块为 `entry`，测试模块为 `entry_test`。工程当前产品配置的 compile/compatible/target SDK 均为 12。
5. 本次仅更新测试归档文档，没有重新构建或运行设备测试。文中的 Pass 引用已有归档结果，具体证据见下文“构建与设备验证”。

## 测试套件总览

- **测试文件数**：73 个包含用例的 `.test.ets`，另有注册入口 `List.test.ets`。
- **基础与场景套件**：20 个、306 条用例。
- **组合回归套件**：53 个、2910 条用例，其中 WaterFlow 2401 条、Trace 5 条、RGBA 504 条。
- **用例元数据等级**：3216 条均标记为 `@tc.level LEVEL2`。
- **最近归档全量结果**：Pass 3216 / Failure 0 / Error 0 / Timeout 0 / Ignore 0。

### 基础与场景（20 个套件，306 条用例）

| 套件名称 | 对应文件 | 分类 | 用例数 | 说明 |
|---|---|---|---:|---|
| ActsAbilityTest | [Ability.test.ets](product/phone/entry/src/ohosTest/ets/test/Ability.test.ets) | 首页与原生回调 | 5 | 首页入口、短时任务初始状态、线程安全与 libuv 三次回调、传输配置控件 |
| PerformanceDeviceLayout | [DeviceLayout.test.ets](product/phone/entry/src/ohosTest/ets/test/DeviceLayout.test.ets) | 布局 | 3 | 常规/优化 Web 控件边界与后台任务入口点击区域 |
| PerformanceDfxStateManagement | [DfxStateManagement.test.ets](product/phone/entry/src/ohosTest/ets/test/DfxStateManagement.test.ets) | 状态管理 | 6 | 优化前后 Move/Scale 行为及页面重入状态恢复 |
| PerformanceDriverQueue | [DriverQueue.test.ets](product/phone/entry/src/ohosTest/ets/test/DriverQueue.test.ets) | 驱动队列 | 9 | 串行执行、异常恢复、结果与异常对象身份、恰好执行一次 |
| PerformanceFeatureCatalog | [FeatureCatalog.test.ets](product/phone/entry/src/ohosTest/ets/test/FeatureCatalog.test.ets) | 入口数据 | 3 | 16 个入口名称、目标路径唯一性和页面映射 |
| PerformanceImportDataModels | [ImportDataModels.test.ets](product/phone/entry/src/ohosTest/ets/test/ImportDataModels.test.ets) | 导入模型 | 48 | 静态/动态导入的模型字段、实例隔离、响应与记录容器 |
| PerformanceImportNavigation | [ImportNavigation.test.ets](product/phone/entry/src/ohosTest/ets/test/ImportNavigation.test.ets) | 导入导航 | 2 | 静态导入双目标与动态导入重入 |
| PerformanceLockBuffer | [LockBuffer.test.ets](product/phone/entry/src/ohosTest/ets/test/LockBuffer.test.ets) | 共享内存 | 6 | 锁别名、竞争标志、相邻载荷与所有权传递 |
| PerformanceMemoryShared | [MemoryShared.test.ets](product/phone/entry/src/ohosTest/ets/test/MemoryShared.test.ets) | 共享内存 | 10 | 不可重入锁、共享标志、多实例互斥及原子/非原子计数 |
| PerformancePixelColorTransform | [PixelColorTransform.test.ets](product/phone/entry/src/ohosTest/ets/test/PixelColorTransform.test.ets) | 像素算法 | 51 | 12 色饱和度、暗色/中性色、RGBA 步长及缓冲区语义 |
| PerformancePixelContract | [PixelContract.test.ets](product/phone/entry/src/ohosTest/ets/test/PixelContract.test.ets) | 像素契约 | 14 | Alpha 全字节、滑块步长、比例合成、分片等价和独立历史 |
| PerformanceQueueLifecycle | [QueueLifecycle.test.ets](product/phone/entry/src/ohosTest/ets/test/QueueLifecycle.test.ets) | 驱动队列 | 12 | 异步排队、嵌套入队、清理等待、观察者与拒绝值 |
| PerformanceRendering | [Rendering.test.ets](product/phone/entry/src/ohosTest/ets/test/Rendering.test.ets) | 渲染交互 | 12 | 显隐/条件渲染、HiDumper、Grid 定位和编辑器图片 |
| PerformanceRgbaOwnership | [RgbaOwnership.test.ets](product/phone/entry/src/ohosTest/ets/test/RgbaOwnership.test.ets) | 分片所有权 | 10 | 存储隔离、二次分片、错误后恢复及大偏移 |
| PerformanceRgbaShards | [RgbaShards.test.ets](product/phone/entry/src/ohosTest/ets/test/RgbaShards.test.ets) | 分片边界 | 8 | 尾像素、过量任务、空输入、非法任务与四字节对齐 |
| PerformanceStateInteraction | [StateInteraction.test.ets](product/phone/entry/src/ohosTest/ets/test/StateInteraction.test.ets) | 状态管理 | 8 | 优化前后 Move/Scale 互不干扰和循环恢复 |
| PerformanceThreadDataTransfer | [ThreadDataTransfer.test.ets](product/phone/entry/src/ohosTest/ets/test/ThreadDataTransfer.test.ets) | 任务池传输 | 24 | PixelMap 的克隆/转移、顺序、透明度、并发和失败重试 |
| PerformanceTraceDataSource | [TraceDataSource.test.ets](product/phone/entry/src/ohosTest/ets/test/TraceDataSource.test.ets) | Trace 数据源 | 28 | 五类通知的参数、顺序、去重、退订和实例隔离 |
| PerformanceWaterFlowDataSource | [WaterFlowDataSource.test.ets](product/phone/entry/src/ohosTest/ets/test/WaterFlowDataSource.test.ets) | WaterFlow 数据源 | 36 | 增删重载、边界、清空恢复、通知与监听器生命周期 |
| PerformanceWaterFlowMutationSequence | [WaterFlowMutationSequence.test.ets](product/phone/entry/src/ohosTest/ets/test/WaterFlowMutationSequence.test.ets) | WaterFlow 组合 | 11 | 已提交状态、重订阅、预取以及七类操作组合 |
| **小计** | | | **306** | |

### WaterFlow 组合回归（43 个套件，2401 条用例）

七种数据编辑操作的四步有序组合，逐步检查完整数据及监听回调。

| 套件名称 | 对应文件 | 用例数 | 编号范围 |
|---|---|---:|---|
| PerformanceWaterFlowRegression01 | [WaterFlowRegression01.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/WaterFlowRegression01.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_WATERFLOW_0001` ~ `SUB_PERFORMANCE_MATRIX_WATERFLOW_0056` |
| PerformanceWaterFlowRegression02 | [WaterFlowRegression02.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/WaterFlowRegression02.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_WATERFLOW_0057` ~ `SUB_PERFORMANCE_MATRIX_WATERFLOW_0112` |
| PerformanceWaterFlowRegression03 | [WaterFlowRegression03.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/WaterFlowRegression03.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_WATERFLOW_0113` ~ `SUB_PERFORMANCE_MATRIX_WATERFLOW_0168` |
| PerformanceWaterFlowRegression04 | [WaterFlowRegression04.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/WaterFlowRegression04.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_WATERFLOW_0169` ~ `SUB_PERFORMANCE_MATRIX_WATERFLOW_0224` |
| PerformanceWaterFlowRegression05 | [WaterFlowRegression05.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/WaterFlowRegression05.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_WATERFLOW_0225` ~ `SUB_PERFORMANCE_MATRIX_WATERFLOW_0280` |
| PerformanceWaterFlowRegression06 | [WaterFlowRegression06.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/WaterFlowRegression06.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_WATERFLOW_0281` ~ `SUB_PERFORMANCE_MATRIX_WATERFLOW_0336` |
| PerformanceWaterFlowRegression07 | [WaterFlowRegression07.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/WaterFlowRegression07.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_WATERFLOW_0337` ~ `SUB_PERFORMANCE_MATRIX_WATERFLOW_0392` |
| PerformanceWaterFlowRegression08 | [WaterFlowRegression08.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/WaterFlowRegression08.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_WATERFLOW_0393` ~ `SUB_PERFORMANCE_MATRIX_WATERFLOW_0448` |
| PerformanceWaterFlowRegression09 | [WaterFlowRegression09.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/WaterFlowRegression09.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_WATERFLOW_0449` ~ `SUB_PERFORMANCE_MATRIX_WATERFLOW_0504` |
| PerformanceWaterFlowRegression10 | [WaterFlowRegression10.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/WaterFlowRegression10.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_WATERFLOW_0505` ~ `SUB_PERFORMANCE_MATRIX_WATERFLOW_0560` |
| PerformanceWaterFlowRegression11 | [WaterFlowRegression11.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/WaterFlowRegression11.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_WATERFLOW_0561` ~ `SUB_PERFORMANCE_MATRIX_WATERFLOW_0616` |
| PerformanceWaterFlowRegression12 | [WaterFlowRegression12.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/WaterFlowRegression12.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_WATERFLOW_0617` ~ `SUB_PERFORMANCE_MATRIX_WATERFLOW_0672` |
| PerformanceWaterFlowRegression13 | [WaterFlowRegression13.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/WaterFlowRegression13.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_WATERFLOW_0673` ~ `SUB_PERFORMANCE_MATRIX_WATERFLOW_0728` |
| PerformanceWaterFlowRegression14 | [WaterFlowRegression14.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/WaterFlowRegression14.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_WATERFLOW_0729` ~ `SUB_PERFORMANCE_MATRIX_WATERFLOW_0784` |
| PerformanceWaterFlowRegression15 | [WaterFlowRegression15.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/WaterFlowRegression15.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_WATERFLOW_0785` ~ `SUB_PERFORMANCE_MATRIX_WATERFLOW_0840` |
| PerformanceWaterFlowRegression16 | [WaterFlowRegression16.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/WaterFlowRegression16.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_WATERFLOW_0841` ~ `SUB_PERFORMANCE_MATRIX_WATERFLOW_0896` |
| PerformanceWaterFlowRegression17 | [WaterFlowRegression17.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/WaterFlowRegression17.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_WATERFLOW_0897` ~ `SUB_PERFORMANCE_MATRIX_WATERFLOW_0952` |
| PerformanceWaterFlowRegression18 | [WaterFlowRegression18.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/WaterFlowRegression18.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_WATERFLOW_0953` ~ `SUB_PERFORMANCE_MATRIX_WATERFLOW_1008` |
| PerformanceWaterFlowRegression19 | [WaterFlowRegression19.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/WaterFlowRegression19.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_WATERFLOW_1009` ~ `SUB_PERFORMANCE_MATRIX_WATERFLOW_1064` |
| PerformanceWaterFlowRegression20 | [WaterFlowRegression20.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/WaterFlowRegression20.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_WATERFLOW_1065` ~ `SUB_PERFORMANCE_MATRIX_WATERFLOW_1120` |
| PerformanceWaterFlowRegression21 | [WaterFlowRegression21.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/WaterFlowRegression21.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_WATERFLOW_1121` ~ `SUB_PERFORMANCE_MATRIX_WATERFLOW_1176` |
| PerformanceWaterFlowRegression22 | [WaterFlowRegression22.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/WaterFlowRegression22.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_WATERFLOW_1177` ~ `SUB_PERFORMANCE_MATRIX_WATERFLOW_1232` |
| PerformanceWaterFlowRegression23 | [WaterFlowRegression23.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/WaterFlowRegression23.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_WATERFLOW_1233` ~ `SUB_PERFORMANCE_MATRIX_WATERFLOW_1288` |
| PerformanceWaterFlowRegression24 | [WaterFlowRegression24.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/WaterFlowRegression24.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_WATERFLOW_1289` ~ `SUB_PERFORMANCE_MATRIX_WATERFLOW_1344` |
| PerformanceWaterFlowRegression25 | [WaterFlowRegression25.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/WaterFlowRegression25.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_WATERFLOW_1345` ~ `SUB_PERFORMANCE_MATRIX_WATERFLOW_1400` |
| PerformanceWaterFlowRegression26 | [WaterFlowRegression26.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/WaterFlowRegression26.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_WATERFLOW_1401` ~ `SUB_PERFORMANCE_MATRIX_WATERFLOW_1456` |
| PerformanceWaterFlowRegression27 | [WaterFlowRegression27.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/WaterFlowRegression27.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_WATERFLOW_1457` ~ `SUB_PERFORMANCE_MATRIX_WATERFLOW_1512` |
| PerformanceWaterFlowRegression28 | [WaterFlowRegression28.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/WaterFlowRegression28.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_WATERFLOW_1513` ~ `SUB_PERFORMANCE_MATRIX_WATERFLOW_1568` |
| PerformanceWaterFlowRegression29 | [WaterFlowRegression29.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/WaterFlowRegression29.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_WATERFLOW_1569` ~ `SUB_PERFORMANCE_MATRIX_WATERFLOW_1624` |
| PerformanceWaterFlowRegression30 | [WaterFlowRegression30.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/WaterFlowRegression30.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_WATERFLOW_1625` ~ `SUB_PERFORMANCE_MATRIX_WATERFLOW_1680` |
| PerformanceWaterFlowRegression31 | [WaterFlowRegression31.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/WaterFlowRegression31.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_WATERFLOW_1681` ~ `SUB_PERFORMANCE_MATRIX_WATERFLOW_1736` |
| PerformanceWaterFlowRegression32 | [WaterFlowRegression32.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/WaterFlowRegression32.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_WATERFLOW_1737` ~ `SUB_PERFORMANCE_MATRIX_WATERFLOW_1792` |
| PerformanceWaterFlowRegression33 | [WaterFlowRegression33.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/WaterFlowRegression33.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_WATERFLOW_1793` ~ `SUB_PERFORMANCE_MATRIX_WATERFLOW_1848` |
| PerformanceWaterFlowRegression34 | [WaterFlowRegression34.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/WaterFlowRegression34.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_WATERFLOW_1849` ~ `SUB_PERFORMANCE_MATRIX_WATERFLOW_1904` |
| PerformanceWaterFlowRegression35 | [WaterFlowRegression35.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/WaterFlowRegression35.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_WATERFLOW_1905` ~ `SUB_PERFORMANCE_MATRIX_WATERFLOW_1960` |
| PerformanceWaterFlowRegression36 | [WaterFlowRegression36.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/WaterFlowRegression36.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_WATERFLOW_1961` ~ `SUB_PERFORMANCE_MATRIX_WATERFLOW_2016` |
| PerformanceWaterFlowRegression37 | [WaterFlowRegression37.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/WaterFlowRegression37.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_WATERFLOW_2017` ~ `SUB_PERFORMANCE_MATRIX_WATERFLOW_2072` |
| PerformanceWaterFlowRegression38 | [WaterFlowRegression38.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/WaterFlowRegression38.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_WATERFLOW_2073` ~ `SUB_PERFORMANCE_MATRIX_WATERFLOW_2128` |
| PerformanceWaterFlowRegression39 | [WaterFlowRegression39.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/WaterFlowRegression39.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_WATERFLOW_2129` ~ `SUB_PERFORMANCE_MATRIX_WATERFLOW_2184` |
| PerformanceWaterFlowRegression40 | [WaterFlowRegression40.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/WaterFlowRegression40.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_WATERFLOW_2185` ~ `SUB_PERFORMANCE_MATRIX_WATERFLOW_2240` |
| PerformanceWaterFlowRegression41 | [WaterFlowRegression41.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/WaterFlowRegression41.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_WATERFLOW_2241` ~ `SUB_PERFORMANCE_MATRIX_WATERFLOW_2296` |
| PerformanceWaterFlowRegression42 | [WaterFlowRegression42.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/WaterFlowRegression42.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_WATERFLOW_2297` ~ `SUB_PERFORMANCE_MATRIX_WATERFLOW_2352` |
| PerformanceWaterFlowRegression43 | [WaterFlowRegression43.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/WaterFlowRegression43.test.ets) | 49 | `SUB_PERFORMANCE_MATRIX_WATERFLOW_2353` ~ `SUB_PERFORMANCE_MATRIX_WATERFLOW_2401` |
| **小计** | | **2401** | |

### Trace 监听回归（1 个套件，5 条用例）

五种通知各自连续触发，穿插监听器退出、加入与重复注册。

| 套件名称 | 对应文件 | 用例数 | 编号范围 |
|---|---|---:|---|
| PerformanceTraceRegression01 | [TraceRegression01.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/TraceRegression01.test.ets) | 5 | `SUB_PERFORMANCE_MATRIX_TRACE_0001` ~ `SUB_PERFORMANCE_MATRIX_TRACE_0005` |
| **小计** | | **5** | |

### RGBA 流水线回归（9 个套件，504 条用例）

不同像素数与任务数的分片、饱和度转换、输出顺序及源存储保护。

| 套件名称 | 对应文件 | 用例数 | 编号范围 |
|---|---|---:|---|
| PerformanceRgbaRegression01 | [RgbaRegression01.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/RgbaRegression01.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_RGBA_0001` ~ `SUB_PERFORMANCE_MATRIX_RGBA_0056` |
| PerformanceRgbaRegression02 | [RgbaRegression02.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/RgbaRegression02.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_RGBA_0057` ~ `SUB_PERFORMANCE_MATRIX_RGBA_0112` |
| PerformanceRgbaRegression03 | [RgbaRegression03.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/RgbaRegression03.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_RGBA_0113` ~ `SUB_PERFORMANCE_MATRIX_RGBA_0168` |
| PerformanceRgbaRegression04 | [RgbaRegression04.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/RgbaRegression04.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_RGBA_0169` ~ `SUB_PERFORMANCE_MATRIX_RGBA_0224` |
| PerformanceRgbaRegression05 | [RgbaRegression05.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/RgbaRegression05.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_RGBA_0225` ~ `SUB_PERFORMANCE_MATRIX_RGBA_0280` |
| PerformanceRgbaRegression06 | [RgbaRegression06.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/RgbaRegression06.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_RGBA_0281` ~ `SUB_PERFORMANCE_MATRIX_RGBA_0336` |
| PerformanceRgbaRegression07 | [RgbaRegression07.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/RgbaRegression07.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_RGBA_0337` ~ `SUB_PERFORMANCE_MATRIX_RGBA_0392` |
| PerformanceRgbaRegression08 | [RgbaRegression08.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/RgbaRegression08.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_RGBA_0393` ~ `SUB_PERFORMANCE_MATRIX_RGBA_0448` |
| PerformanceRgbaRegression09 | [RgbaRegression09.test.ets](product/phone/entry/src/ohosTest/ets/test/Matrix/RgbaRegression09.test.ets) | 56 | `SUB_PERFORMANCE_MATRIX_RGBA_0449` ~ `SUB_PERFORMANCE_MATRIX_RGBA_0504` |
| **小计** | | **504** | |

### 合计

| 分类 | 套件数 | 用例数 |
|---|---:|---:|
| 基础与场景 | 20 | 306 |
| WaterFlow 组合回归 | 43 | 2401 |
| Trace 监听回归 | 1 | 5 |
| RGBA 流水线回归 | 9 | 504 |
| **合计** | **73** | **3216** |

## 测试工程结构

```text
PerformanceLibrary/
├── AppScope/app.json5                         # 应用包名
├── build-profile.json5                        # 产品与 SDK 配置
├── product/phone/entry/
│   ├── src/main/                              # 主应用、入口与页面
│   ├── src/ohosTest/
│   │   ├── module.json5                       # entry_test 模块
│   │   └── ets/
│   │       ├── test/
│   │       │   ├── List.test.ets              # 73 个套件的导入与注册
│   │       │   ├── *.test.ets                 # 20 个基础与场景套件
│   │       │   ├── Matrix/                    # 53 个组合回归套件
│   │       │   └── Shared/
│   │       │       ├── PerformanceDriver.ets
│   │       │       └── RegressionMatrixSupport.ets
│   │       ├── testability/TestAbility.ets    # 启动 Hypium、超时及事件循环适配
│   │       ├── testrunner/OpenHarmonyTestRunner.ts
│   │       └── util/Logger.ets
│   └── build/default/outputs/
│       ├── default/entry-default-signed.hap
│       └── ohosTest/entry-ohosTest-signed.hap
├── feature/                                  # 被测功能模块
├── tools/run_device_tests.py                  # 设备执行与单轮结果归档
├── tools/summarize_device_tests.py            # 历史轮次覆盖汇总
└── docs/test-runs/                            # 构建、运行及交叉验证证据
```

## 套件入口与元数据管理

`product/phone/entry/src/ohosTest/ets/test/List.test.ets` 统一导入并注册 73 个套件：20 个基础与场景套件，以及 43 个 WaterFlow、1 个 Trace、9 个 RGBA 回归套件。`Shared/` 下两个辅助文件与历史 `.bak_*` 备份不计入测试套件或用例数量。

运行入口为 `/ets/testrunner/OpenHarmonyTestRunner`。运行器启动 `entry_test` 中的 `TestAbility`，由后者调用 `Hypium.hypiumTest` 并注册 `testsuite()`。`TestAbility` 兼容读取 `timeout` 和 `-s timeout`，缺省超时为 15000 毫秒；每个用例报告完成后通过 10 毫秒定时器交还事件循环。

用例注释使用 `@tc.number`、`@tc.name`、`@tc.desc`、`@tc.size`、`@tc.type`、`@tc.level`。下表的编号直接取自源码，不为文档重新编号；注释中的 `LEVEL2` 与 `it()` 第二参数的原始数值分别保留其源码含义。

## 用例表（按场景分组）

为便于阅读，同一套件内具有相同测试目的的一组实际用例合并为一行；编号范围按源码注册顺序列出，不表示中间所有整数编号都存在。每组的“条数”来自当前 `it()` 数量，完整用例名、具体输入与断言可由上方文件链接追溯。基础场景合计 306 条，矩阵场景合计 2910 条，覆盖当前全部 3216 条有效用例。

预置条件：“测试就绪”指主/测试 HAP 已安装、测试框架可正常启动且被测模块可导入；“UI 就绪”另要求屏幕可交互且应用窗口可访问，由 `withHome` 负责首页准备与场景清理。表中各行均为自动用例，Pass 为 2026-11-21 归档全量结果。

### ActsAbilityTest（5 条）

对应文件：[Ability.test.ets](product/phone/entry/src/ohosTest/ets/test/Ability.test.ets)。预置条件：UI 就绪；套件中直接调用算法或锁的用例仅需测试就绪。

| 编号范围 | 测试功能 | 条数 | 输入/操作 | 预期输出 | 测试结果 |
|---|---|---:|---|---|---|
| `SUB_PERFORMANCE_ABILITY_0100` | 首页入口 | 1 | 启动应用并将首页列表复位 | 首页展示指定功能入口 | Pass |
| `SUB_PERFORMANCE_ABILITY_0600` | 短时任务初始态 | 1 | 进入 BackgroundTask 的短时任务页面 | 显示初始计算状态 | Pass |
| `SUB_PERFORMANCE_ABILITY_0700 ~ SUB_PERFORMANCE_ABILITY_0800` | Native 跨线程回调 | 2 | 分别重复触发 threadSafeTest、libuvTest | 每次调用各收到三项回调结果 | Pass |
| `SUB_PERFORMANCE_ABILITY_1000` | 传输配置 | 1 | 进入 ThreadDataTransfer | 任务数、传参方式和饱和度配置控件存在 | Pass |

### PerformanceDeviceLayout（3 条）

对应文件：[DeviceLayout.test.ets](product/phone/entry/src/ohosTest/ets/test/DeviceLayout.test.ets)。预置条件：UI 就绪；套件中直接调用算法或锁的用例仅需测试就绪。

| 编号范围 | 测试功能 | 条数 | 输入/操作 | 预期输出 | 测试结果 |
|---|---|---:|---|---|---|
| `SUB_PERFORMANCE_DEVICELAYOUT_0100 ~ SUB_PERFORMANCE_DEVICELAYOUT_0200` | Web 控件布局 | 2 | 分别进入常规、优化 Web 页面并读取控件边界 | 进入与返回控件适配当前视口 | Pass |
| `SUB_PERFORMANCE_DEVICELAYOUT_0300` | 后台任务入口布局 | 1 | 读取短时、长时任务入口点击区域 | 两个入口的垂直点击区域不重叠 | Pass |

### PerformanceDfxStateManagement（6 条）

对应文件：[DfxStateManagement.test.ets](product/phone/entry/src/ohosTest/ets/test/DfxStateManagement.test.ets)。预置条件：UI 就绪；套件中直接调用算法或锁的用例仅需测试就绪。

| 编号范围 | 测试功能 | 条数 | 输入/操作 | 预期输出 | 测试结果 |
|---|---|---:|---|---|---|
| `SUB_PERFORMANCE_DFXSTATEMANAGEMENT_0100 ~ SUB_PERFORMANCE_DFXSTATEMANAGEMENT_0400` | 优化前后状态更新 | 4 | 分别执行 Move、Scale | 标签位置、图片宽度按对应操作更新 | Pass |
| `SUB_PERFORMANCE_DFXSTATEMANAGEMENT_0500 ~ SUB_PERFORMANCE_DFXSTATEMANAGEMENT_0600` | 页面重入恢复 | 2 | 修改状态后退出并重新进入两个版本页面 | 位置和宽度恢复初始状态 | Pass |

### PerformanceDriverQueue（9 条）

对应文件：[DriverQueue.test.ets](product/phone/entry/src/ohosTest/ets/test/DriverQueue.test.ets)。预置条件：UI 就绪；套件中直接调用算法或锁的用例仅需测试就绪。

| 编号范围 | 测试功能 | 条数 | 输入/操作 | 预期输出 | 测试结果 |
|---|---|---:|---|---|---|
| `SUB_PERFORMANCE_DRIVERQUEUE_0100` | 串行结果 | 1 | 连续提交多个异步场景 | 场景不重叠且保留各自结果 | Pass |
| `SUB_PERFORMANCE_DRIVERQUEUE_0200 ~ SUB_PERFORMANCE_DRIVERQUEUE_0400` | 失败恢复 | 3 | 提交异步拒绝、同步异常、连续失败及后续成功动作 | 原错误向调用者传播，后续动作仍可执行 | Pass |
| `SUB_PERFORMANCE_DRIVERQUEUE_0500 ~ SUB_PERFORMANCE_DRIVERQUEUE_0700` | 值与对象身份 | 3 | 返回假值、对象以及原始错误对象 | 返回值不被替换，对象身份保持一致 | Pass |
| `SUB_PERFORMANCE_DRIVERQUEUE_0800 ~ SUB_PERFORMANCE_DRIVERQUEUE_0900` | 空闲恢复与执行次数 | 2 | 队列空闲后提交新动作并统计执行次数 | 新任务正常完成，每个动作恰好执行一次 | Pass |

### PerformanceFeatureCatalog（3 条）

对应文件：[FeatureCatalog.test.ets](product/phone/entry/src/ohosTest/ets/test/FeatureCatalog.test.ets)。预置条件：测试就绪。

| 编号范围 | 测试功能 | 条数 | 输入/操作 | 预期输出 | 测试结果 |
|---|---|---:|---|---|---|
| `SUB_PERFORMANCE_FEATURECATALOG_0100` | 目录唯一性 | 1 | 遍历 performanceTypeArray | 16 个名称非空且无首尾空格，名称和本地路由均唯一 | Pass |
| `SUB_PERFORMANCE_FEATURECATALOG_0200 ~ SUB_PERFORMANCE_FEATURECATALOG_0300` | 入口路由映射 | 2 | 分别核对渲染/分析与加载/并发入口 | 每个指定名称唯一对应自身页面 | Pass |

### PerformanceImportDataModels（48 条）

对应文件：[ImportDataModels.test.ets](product/phone/entry/src/ohosTest/ets/test/ImportDataModels.test.ets)。预置条件：测试就绪。

| 编号范围 | 测试功能 | 条数 | 输入/操作 | 预期输出 | 测试结果 |
|---|---|---:|---|---|---|
| `SUB_PERFORMANCE_IMPORTMODELS_0100 ~ SUB_PERFORMANCE_IMPORTMODELS_2000` | 静态模型构造与隔离 | 20 | 分别构造十类模型并修改独立实例 | 构造字段保留，不同实例互不影响 | Pass |
| `SUB_PERFORMANCE_IMPORTMODELS_2100 ~ SUB_PERFORMANCE_IMPORTMODELS_2400` | 静态响应容器 | 4 | 构造默认/失败响应，增删实际记录 | 默认成功空响应、容器隔离、失败信息及记录操作正确 | Pass |
| `SUB_PERFORMANCE_IMPORTMODELS_2500 ~ SUB_PERFORMANCE_IMPORTMODELS_4400` | 动态模型构造与隔离 | 20 | 分别构造十类模型并修改独立实例 | 构造字段保留，不同实例互不影响 | Pass |
| `SUB_PERFORMANCE_IMPORTMODELS_4500 ~ SUB_PERFORMANCE_IMPORTMODELS_4800` | 动态响应容器 | 4 | 构造默认/失败响应，增删实际记录 | 默认成功空响应、容器隔离、失败信息及记录操作正确 | Pass |

### PerformanceImportNavigation（2 条）

对应文件：[ImportNavigation.test.ets](product/phone/entry/src/ohosTest/ets/test/ImportNavigation.test.ets)。预置条件：UI 就绪；套件中直接调用算法或锁的用例仅需测试就绪。

| 编号范围 | 测试功能 | 条数 | 输入/操作 | 预期输出 | 测试结果 |
|---|---|---:|---|---|---|
| `SUB_PERFORMANCE_IMPORTNAVIGATION_0100` | 静态导航 | 1 | 打开两个已注册的静态导入目标 | 两个目标均正常展示 | Pass |
| `SUB_PERFORMANCE_IMPORTNAVIGATION_0200` | 动态重入 | 1 | 打开动态加载目标、返回并重新进入 | 已加载目标可再次正常打开 | Pass |

### PerformanceLockBuffer（6 条）

对应文件：[LockBuffer.test.ets](product/phone/entry/src/ohosTest/ets/test/LockBuffer.test.ets)。预置条件：测试就绪。

| 编号范围 | 测试功能 | 条数 | 输入/操作 | 预期输出 | 测试结果 |
|---|---|---:|---|---|---|
| `SUB_PERFORMANCE_LOCKBUFFER_0001 ~ SUB_PERFORMANCE_LOCKBUFFER_0002` | 持锁/竞争期创建别名 | 2 | 在锁已占用或存在竞争时创建共享缓冲区别名 | 不重置锁标志或唤醒状态 | Pass |
| `SUB_PERFORMANCE_LOCKBUFFER_0003 ~ SUB_PERFORMANCE_LOCKBUFFER_0005` | 相邻载荷保护 | 3 | 在较大共享缓冲区执行 tryLock、阻塞获取和竞争解锁 | 只操作锁标志，不覆盖相邻载荷 | Pass |
| `SUB_PERFORMANCE_LOCKBUFFER_0006` | 载荷可见性 | 1 | 前一所有者写入后创建别名 | 新别名能读取已写入载荷 | Pass |

### PerformanceMemoryShared（10 条）

对应文件：[MemoryShared.test.ets](product/phone/entry/src/ohosTest/ets/test/MemoryShared.test.ets)。预置条件：UI 就绪；套件中直接调用算法或锁的用例仅需测试就绪。

| 编号范围 | 测试功能 | 条数 | 输入/操作 | 预期输出 | 测试结果 |
|---|---|---:|---|---|---|
| `SUB_PERFORMANCE_MEMORYSHARED_0100 ~ SUB_PERFORMANCE_MEMORYSHARED_0800` | 共享锁状态机 | 8 | 执行重入、共享/独立缓冲区、多实例竞争及所有权交接 | 互斥与锁标志状态正确，独立缓冲区互不竞争 | Pass |
| `SUB_PERFORMANCE_MEMORYSHARED_0900` | 原子累加 | 1 | 连续执行原子计数任务 | 每轮结果均等于期望总数 | Pass |
| `SUB_PERFORMANCE_MEMORYSHARED_1000` | 非原子累加 | 1 | 执行非原子计数任务 | 允许丢失更新，结果不超过理论总数 | Pass |

### PerformancePixelColorTransform（51 条）

对应文件：[PixelColorTransform.test.ets](product/phone/entry/src/ohosTest/ets/test/PixelColorTransform.test.ets)。预置条件：测试就绪。

| 编号范围 | 测试功能 | 条数 | 输入/操作 | 预期输出 | 测试结果 |
|---|---|---:|---|---|---|
| `SUB_PERFORMANCE_PIXELCOLOR_0100 ~ SUB_PERFORMANCE_PIXELCOLOR_3600` | 十二色饱和度 | 36 | 红、黄、绿、青、蓝、品红及六种中间色，分别保持/减半/清零饱和度 | 输出逐像素匹配预期颜色 | Pass |
| `SUB_PERFORMANCE_PIXELCOLOR_3700 ~ SUB_PERFORMANCE_PIXELCOLOR_4200` | 暗色亮度 | 6 | 六种暗色降低饱和度 | 保留亮度及正确色彩结果 | Pass |
| `SUB_PERFORMANCE_PIXELCOLOR_4300 ~ SUB_PERFORMANCE_PIXELCOLOR_4500` | 中性色 | 3 | 黑、灰、白降低饱和度 | 保持中性颜色 | Pass |
| `SUB_PERFORMANCE_PIXELCOLOR_4600 ~ SUB_PERFORMANCE_PIXELCOLOR_4800` | 缓冲区边界 | 3 | 空缓冲区、多像素及独立缓冲区 | 不生成额外像素，步长和 Alpha 保留，独立存储互不影响 | Pass |
| `SUB_PERFORMANCE_PIXELCOLOR_4900 ~ SUB_PERFORMANCE_PIXELCOLOR_5100` | 比例恢复与引用 | 3 | 恢复饱和度、比较等价滑块比例、修改返回缓冲区 | 色相/Alpha 正确，等价比例输出相同，返回缓冲区与原缓冲区共享修改 | Pass |

### PerformancePixelContract（14 条）

对应文件：[PixelContract.test.ets](product/phone/entry/src/ohosTest/ets/test/PixelContract.test.ets)。预置条件：测试就绪。

| 编号范围 | 测试功能 | 条数 | 输入/操作 | 预期输出 | 测试结果 |
|---|---|---:|---|---|---|
| `SUB_PERFORMANCE_PIXELCONTRACT_0001 ~ SUB_PERFORMANCE_PIXELCONTRACT_0002` | Alpha 契约 | 2 | 遍历 0~255 Alpha，并比较不同 Alpha 的相同 RGB | Alpha 保持不变且不影响 RGB 转换 | Pass |
| `SUB_PERFORMANCE_PIXELCONTRACT_0003 ~ SUB_PERFORMANCE_PIXELCONTRACT_0007` | 饱和度精度与比例 | 5 | 1%、99%、75%、小数比例及已有部分饱和度输入 | 边缘步长可区分，通道舍入与比例计算正确 | Pass |
| `SUB_PERFORMANCE_PIXELCONTRACT_0008 ~ SUB_PERFORMANCE_PIXELCONTRACT_0012` | 连续调整与色相 | 5 | 增加/连续降低饱和度、恒等调整、中性色和任意色相清零 | 按更新后的历史值组合，不意外恢复已丢失饱和度 | Pass |
| `SUB_PERFORMANCE_PIXELCONTRACT_0013 ~ SUB_PERFORMANCE_PIXELCONTRACT_0014` | 分片与图像隔离 | 2 | 比较整图/不均匀分片转换，交错转换不同图像 | 分片与整图结果一致，不同图像滑块历史互不影响 | Pass |

### PerformanceQueueLifecycle（12 条）

对应文件：[QueueLifecycle.test.ets](product/phone/entry/src/ohosTest/ets/test/QueueLifecycle.test.ets)。预置条件：UI 就绪；套件中直接调用算法或锁的用例仅需测试就绪。

| 编号范围 | 测试功能 | 条数 | 输入/操作 | 预期输出 | 测试结果 |
|---|---|---:|---|---|---|
| `SUB_PERFORMANCE_QUEUELIFECYCLE_0001 ~ SUB_PERFORMANCE_QUEUELIFECYCLE_0003` | 异步启动与释放 | 3 | 提交未完成任务和延迟拒绝任务 | 提交时不立即同步执行，后继等待前序结束，拒绝后可继续 | Pass |
| `SUB_PERFORMANCE_QUEUELIFECYCLE_0004 ~ SUB_PERFORMANCE_QUEUELIFECYCLE_0005` | 嵌套入队顺序 | 2 | 在动作内部入队，或在失败前追加动作 | 遵循先进先出顺序 | Pass |
| `SUB_PERFORMANCE_QUEUELIFECYCLE_0006 ~ SUB_PERFORMANCE_QUEUELIFECYCLE_0007` | 异步清理 | 2 | 成功/失败动作等待 finally 清理 | 清理完成后才开始下一动作 | Pass |
| `SUB_PERFORMANCE_QUEUELIFECYCLE_0008 ~ SUB_PERFORMANCE_QUEUELIFECYCLE_0009` | 观察者隔离 | 2 | 观察者抛错或停止观察 | 底层队列继续执行，已入队动作不被取消 | Pass |
| `SUB_PERFORMANCE_QUEUELIFECYCLE_0010 ~ SUB_PERFORMANCE_QUEUELIFECYCLE_0012` | 结果与拒绝原因 | 3 | 混合成功/失败、假值拒绝与共享对象 | 结果归属正确，原始拒绝值与对象引用保留 | Pass |

### PerformanceRendering（12 条）

对应文件：[Rendering.test.ets](product/phone/entry/src/ohosTest/ets/test/Rendering.test.ets)。预置条件：UI 就绪；套件中直接调用算法或锁的用例仅需测试就绪。

| 编号范围 | 测试功能 | 条数 | 输入/操作 | 预期输出 | 测试结果 |
|---|---|---:|---|---|---|
| `SUB_PERFORMANCE_RENDERING_0100 ~ SUB_PERFORMANCE_RENDERING_0200` | 频繁显隐 | 2 | 分别反复切换 visibility 和条件渲染图片 | 图片子树随开关正确显示/隐藏 | Pass |
| `SUB_PERFORMANCE_RENDERING_0300 ~ SUB_PERFORMANCE_RENDERING_0400` | 启动列表 | 2 | 打开条件渲染及 visibility 示例并显示列表 | 初始缺失/隐藏的列表可显示 | Pass |
| `SUB_PERFORMANCE_RENDERING_0500 ~ SUB_PERFORMANCE_RENDERING_0600` | 局部更新 | 2 | 分别进入带 Stack 与不带 Stack 的示例 | 条件行可恢复 | Pass |
| `SUB_PERFORMANCE_RENDERING_0900 ~ SUB_PERFORMANCE_RENDERING_1200` | HiDumper 组件 | 4 | 进入示例并切换条件渲染、Hidden、None 状态 | Grid 存在，目标行按场景移除、重建或恢复可见 | Pass |
| `SUB_PERFORMANCE_RENDERING_1500` | Grid 定位 | 1 | 指定布局项并执行跳转 | 目标条目可定位 | Pass |
| `SUB_PERFORMANCE_RENDERING_1600` | SmartPerf Editor 图片 | 1 | 执行添加与移除图片操作 | 图片随操作出现与消失 | Pass |

### PerformanceRgbaOwnership（10 条）

对应文件：[RgbaOwnership.test.ets](product/phone/entry/src/ohosTest/ets/test/RgbaOwnership.test.ets)。预置条件：测试就绪。

| 编号范围 | 测试功能 | 条数 | 输入/操作 | 预期输出 | 测试结果 |
|---|---|---:|---|---|---|
| `SUB_PERFORMANCE_RGBAOWNERSHIP_0001 ~ SUB_PERFORMANCE_RGBAOWNERSHIP_0004` | 分片存储隔离 | 4 | 重复分片、修改源/各分片并再次分片 | 各分片存储独立，新的分片反映新的源数据，顺序不变 | Pass |
| `SUB_PERFORMANCE_RGBAOWNERSHIP_0005 ~ SUB_PERFORMANCE_RGBAOWNERSHIP_0008` | 错误与规模保护 | 4 | 失败后继续使用已有分片、空图非法任务、短尾缓冲区和超大任务请求 | 已有结果可用，非法输入拒绝，任务数按像素数封顶 | Pass |
| `SUB_PERFORMANCE_RGBAOWNERSHIP_0009 ~ SUB_PERFORMANCE_RGBAOWNERSHIP_0010` | 数值与大偏移 | 2 | 整数邻近小数任务数及超过 16 位偏移的大图 | 小数不能静默取整，大偏移字节保留 | Pass |

### PerformanceRgbaShards（8 条）

对应文件：[RgbaShards.test.ets](product/phone/entry/src/ohosTest/ets/test/RgbaShards.test.ets)。预置条件：测试就绪。

| 编号范围 | 测试功能 | 条数 | 输入/操作 | 预期输出 | 测试结果 |
|---|---|---:|---|---|---|
| `SUB_PERFORMANCE_RGBASHARDS_0100 ~ SUB_PERFORMANCE_RGBASHARDS_0400` | 分片基础边界 | 4 | 奇数像素、任务过量、空图和分片写入 | 尾像素完整、无空任务、空图不派发、写入互不污染 | Pass |
| `SUB_PERFORMANCE_RGBASHARDS_0500 ~ SUB_PERFORMANCE_RGBASHARDS_0600` | 非法分片输入 | 2 | 非法任务数或不完整 RGBA 尾部 | 分片前拒绝错误输入，不静默丢弃字节 | Pass |
| `SUB_PERFORMANCE_RGBASHARDS_0700 ~ SUB_PERFORMANCE_RGBASHARDS_0800` | 均衡和偏移 | 2 | 遍历支持任务数及跨第一个完整字节范围的图像 | 分片均衡且偏移保持正确 | Pass |

### PerformanceStateInteraction（8 条）

对应文件：[StateInteraction.test.ets](product/phone/entry/src/ohosTest/ets/test/StateInteraction.test.ets)。预置条件：UI 就绪；套件中直接调用算法或锁的用例仅需测试就绪。

| 编号范围 | 测试功能 | 条数 | 输入/操作 | 预期输出 | 测试结果 |
|---|---|---:|---|---|---|
| `SUB_PERFORMANCE_STATEINTERACTION_0001 ~ SUB_PERFORMANCE_STATEINTERACTION_0004` | 优化前交互独立性 | 4 | 单独/重复点击 Move、Scale | 移动不缩放，缩放不平移，第二次 Move 与第四次 Scale 按规则回到声明状态 | Pass |
| `SUB_PERFORMANCE_STATEINTERACTION_0005 ~ SUB_PERFORMANCE_STATEINTERACTION_0008` | 优化后交互独立性 | 4 | 在优化版本执行同一操作集 | 保持相同交互契约及循环恢复 | Pass |

### PerformanceThreadDataTransfer（24 条）

对应文件：[ThreadDataTransfer.test.ets](product/phone/entry/src/ohosTest/ets/test/ThreadDataTransfer.test.ets)。预置条件：测试就绪。

| 编号范围 | 测试功能 | 条数 | 输入/操作 | 预期输出 | 测试结果 |
|---|---|---:|---|---|---|
| `SUB_PERFORMANCE_THREADTRANSFER_0100 ~ SUB_PERFORMANCE_THREADTRANSFER_0700` | 克隆/转移基础 | 7 | 单任务、多任务、最大任务数、非均匀像素及任务过量 | 像素顺序、颜色通道、饱和度比例和像素总量正确 | Pass |
| `SUB_PERFORMANCE_THREADTRANSFER_0800` | 失败重试 | 1 | 对同一 PixelMap 发起失败请求再重试 | 失败后仍可处理 | Pass |
| `SUB_PERFORMANCE_THREADTRANSFER_0900 ~ SUB_PERFORMANCE_THREADTRANSFER_1200` | 二维顺序和透明度 | 4 | 克隆/转移二维图像及透明/半透明像素 | 保持行优先顺序与 Alpha | Pass |
| `SUB_PERFORMANCE_THREADTRANSFER_1300 ~ SUB_PERFORMANCE_THREADTRANSFER_1600` | 任务边界和恒等转换 | 4 | 单转移任务、不均匀克隆、任务过量和恒等克隆 | PixelMap 保持可用，尾像素完整，任务数封顶，恒等像素不变 | Pass |
| `SUB_PERFORMANCE_THREADTRANSFER_1700 ~ SUB_PERFORMANCE_THREADTRANSFER_2000` | 饱和度双向调整 | 4 | 克隆/转移分别执行清零和增加饱和度 | 清零输出中性色，增加饱和度输出正确 | Pass |
| `SUB_PERFORMANCE_THREADTRANSFER_2100 ~ SUB_PERFORMANCE_THREADTRANSFER_2400` | 连续/并发和恢复 | 4 | 同一/不同 PixelMap 连续与并发调用、非法任务后重试 | 回调结果互不串用，各自结果独立，错误后可重试 | Pass |

### PerformanceTraceDataSource（28 条）

对应文件：[TraceDataSource.test.ets](product/phone/entry/src/ohosTest/ets/test/TraceDataSource.test.ets)。预置条件：测试就绪。

| 编号范围 | 测试功能 | 条数 | 输入/操作 | 预期输出 | 测试结果 |
|---|---|---:|---|---|---|
| `SUB_PERFORMANCE_TRACEDATASOURCE_0100 ~ SUB_PERFORMANCE_TRACEDATASOURCE_2000` | 五类事件基础矩阵 | 20 | Reload/Add/Change/Delete/Move 各执行参数、注册顺序、重复注册、退订四类检查 | 参数精确，按注册顺序分发，同一监听器去重，退订后不再接收 | Pass |
| `SUB_PERFORMANCE_TRACEDATASOURCE_2100 ~ SUB_PERFORMANCE_TRACEDATASOURCE_2400` | 监听器生命周期 | 4 | 未知/重复退订、重新订阅以及独立源 | 未退订的监听器不受影响，重订阅追加到尾部，实例互相隔离 | Pass |
| `SUB_PERFORMANCE_TRACEDATASOURCE_2500 ~ SUB_PERFORMANCE_TRACEDATASOURCE_2800` | 事件与数据语义 | 4 | 无订阅通知、混合事件、反向移动和延迟订阅 | 数据不被通知改变，事件顺序与端点正确，旧事件不重播 | Pass |

### PerformanceWaterFlowDataSource（36 条）

对应文件：[WaterFlowDataSource.test.ets](product/phone/entry/src/ohosTest/ets/test/WaterFlowDataSource.test.ets)。预置条件：测试就绪。

| 编号范围 | 测试功能 | 条数 | 输入/操作 | 预期输出 | 测试结果 |
|---|---|---:|---|---|---|
| `SUB_PERFORMANCE_WATERFLOWDATASOURCE_0100 ~ SUB_PERFORMANCE_WATERFLOWDATASOURCE_0800` | 基础增删重载 | 8 | 初始读取、头尾/中间插入、首/第二/尾删除和 Reload | 完整序列、数量和回调索引正确 | Pass |
| `SUB_PERFORMANCE_WATERFLOWDATASOURCE_0900 ~ SUB_PERFORMANCE_WATERFLOWDATASOURCE_1300` | 监听器与实例 | 5 | 重复注册、退订重入、取消单监听器、移动通知和多实例 | 通知无重复，未取消的订阅保留，移动参数及实例隔离正确 | Pass |
| `SUB_PERFORMANCE_WATERFLOWDATASOURCE_1400 ~ SUB_PERFORMANCE_WATERFLOWDATASOURCE_1800` | 插入边界与连续追加 | 5 | 索引 0/数量/尾前插入，连续头插和尾插 | 原序列与边界值保留，索引随当前数量推进 | Pass |
| `SUB_PERFORMANCE_WATERFLOWDATASOURCE_1900 ~ SUB_PERFORMANCE_WATERFLOWDATASOURCE_2700` | 逆操作、清空和恢复 | 9 | 插入后删除、重复删除至空、空源重新插入 | 可恢复原序列，清空结果正确，空源可重新填充 | Pass |
| `SUB_PERFORMANCE_WATERFLOWDATASOURCE_2800 ~ SUB_PERFORMANCE_WATERFLOWDATASOURCE_3000` | 连续重载与混合事件 | 3 | 连续 Reload、混合变更与全部通知类型 | 基于当前数据操作，数据和事件顺序一致 | Pass |
| `SUB_PERFORMANCE_WATERFLOWDATASOURCE_3100 ~ SUB_PERFORMANCE_WATERFLOWDATASOURCE_3600` | 多监听器完整生命周期 | 6 | 双监听器、未知/重复退订、无订阅变更、重订阅和多源 | 相同有序通知，退订不误删，数据仍可变更，旧通知不重播 | Pass |

### PerformanceWaterFlowMutationSequence（11 条）

对应文件：[WaterFlowMutationSequence.test.ets](product/phone/entry/src/ohosTest/ets/test/WaterFlowMutationSequence.test.ets)。预置条件：测试就绪。

| 编号范围 | 测试功能 | 条数 | 输入/操作 | 预期输出 | 测试结果 |
|---|---|---:|---|---|---|
| `SUB_PERFORMANCE_WATERFLOWSEQUENCE_0100 ~ SUB_PERFORMANCE_WATERFLOWSEQUENCE_0400` | 提交时序与组合边界 | 4 | 重载和边界编辑、退订重订阅、头部改变后预取 20 项、尾插/追加比较 | 监听时读取到已提交数据，无旧事件重播，预取顺序及尾插位置一致 | Pass |
| `SUB_PERFORMANCE_WATERFLOWSEQUENCE_0500 ~ SUB_PERFORMANCE_WATERFLOWSEQUENCE_1100` | 七类前置操作与有序编辑对 | 7 | 分别以 Prepend/Append/Insert/DeleteFirst/DeleteSecond/DeleteLast/Reload 开头组合后续操作 | 每一步数据序列与回调保持一致 | Pass |

### WaterFlowRegression01~43（2401 条）

预置条件：测试就绪，可创建真实 `WaterFlowDataSource` 和两个监听器。用例编号为 `SUB_PERFORMANCE_MATRIX_WATERFLOW_0001` ~ `SUB_PERFORMANCE_MATRIX_WATERFLOW_2401`。

| 测试功能 | 输入/操作 | 预期输出 | 条数 | 测试结果 |
|---|---|---|---:|---|
| 四步有序编辑组合 | Prepend、Append、Insert、DeleteFirst、DeleteSecond、DeleteLast、Reload 的四步有序组合；第二步前退订 primary，第三步前重复重订阅 primary | 每步完整数据序列与预置快照一致；回调类型、索引、数量及顺序一致；退订后无回调，重复注册不重复通知 | 2401（7⁴） | Pass |

43 个文件中前 42 个各 56 条，最后一个 49 条。每条都执行实际数据编辑，并在每步核对数据与回调。

### TraceRegression01（5 条）

预置条件：测试就绪，固定初始数据源与 first、second、third 三个监听器。

| 编号 | 测试功能 | 输入/操作 | 预期输出 | 测试结果 |
|---|---|---|---|---|
| `SUB_PERFORMANCE_MATRIX_TRACE_0001` | Reload 监听生命周期 | 连续发布四次 Reload，期间 first 退出、third 加入、first 重复注册后重入 | 参数及监听器顺序正确，无重复通知；底层数据始终不变 | Pass |
| `SUB_PERFORMANCE_MATRIX_TRACE_0002` | Add 监听生命周期 | 连续发布四次 Add，期间 first 退出、third 加入、first 重复注册后重入 | 参数及监听器顺序正确，无重复通知；底层数据始终不变 | Pass |
| `SUB_PERFORMANCE_MATRIX_TRACE_0003` | Change 监听生命周期 | 连续发布四次 Change，期间 first 退出、third 加入、first 重复注册后重入 | 参数及监听器顺序正确，无重复通知；底层数据始终不变 | Pass |
| `SUB_PERFORMANCE_MATRIX_TRACE_0004` | Delete 监听生命周期 | 连续发布四次 Delete，期间 first 退出、third 加入、first 重复注册后重入 | 参数及监听器顺序正确，无重复通知；底层数据始终不变 | Pass |
| `SUB_PERFORMANCE_MATRIX_TRACE_0005` | Move 监听生命周期 | 连续发布四次 Move，期间 first 退出、third 加入、first 重复注册后重入 | 参数及监听器顺序正确，无重复通知；底层数据始终不变 | Pass |

### RgbaRegression01~09（504 条）

预置条件：测试就绪，可调用 `splitRgbaShards` 与 `execColorInfo`。编号为 `SUB_PERFORMANCE_MATRIX_RGBA_0001` ~ `SUB_PERFORMANCE_MATRIX_RGBA_0504`，9 个套件各 56 条。具体像素数、任务数和前后饱和度以各用例字面量为准。

| 测试功能 | 输入/操作 | 预期输出 | 条数 | 测试结果 |
|---|---|---|---:|---|
| 分片到转换的流水线 | 构造多种像素数和任务数；按用例指定比例调整饱和度；对每个分片及拼接结果检查 | 分片非空且四字节对齐，任务数按有效像素封顶；各字节与预期分区一致；RGB、Alpha 及全局像素顺序正确，源缓冲区保持不变 | 504 | Pass |

## 公共驱动与回归辅助类

`Shared/PerformanceDriver.ets` 统一封装 UI 场景：`runSerialized` 串行执行整个场景及清理，失败后队列仍可继续；`eventually` 轮询等待；`requireComponent` 与 `expectPresence` 将查找限定在当前应用窗口；`ensureHome`、`openFeature`、`withHome` 负责启动首页、必要时滚动定位入口、进入页面及返回清理。队列本身由 `PerformanceDriverQueue` 和 `PerformanceQueueLifecycle` 另行验证。

`Shared/RegressionMatrixSupport.ets` 提供三个回归辅助类：`WaterFlowMatrix` 驱动真实数据源并比较完整序列与回调快照；`TraceMatrix` 验证通知分发与数据不变性；`RgbaPipelineMatrix` 执行真实分片、颜色转换、输出和源存储检查。矩阵用例的预期值在源码中显式保存，辅助类负责实际调用与断言。

## 构建与设备验证

以下均为已有归档证据，本次文档整理未重跑：

| 验证项 | 归档结果 | 证据 |
|---|---|---|
| 最终测试 HAP 构建 | assembleHap 成功；完成 PackageHap、SignHap，日志为 BUILD SUCCESSFUL | [hap-result.json](docs/test-runs/final-build-home/compile/hap-result.json)、[原始日志](docs/test-runs/final-build-home/compile/20261121_121059_full.log) |
| 同进程全量设备测试 | 73 套件、3216 用例全通过；失败/错误/超时/忽略均为 0 | [summary.json](docs/test-runs/round9-15000/summary.json)、[执行日志归档](docs/test-runs/round9-15000/) |
| 源码与执行集合交叉核对 | exactCaseSetVerified=true；duplicateExecutions=0 | [final-verification.json](docs/test-runs/final-verification.json) |
| 注册结构 | 3216 条用例直接注册于 describe，无重复选择器或失效本地导入 | [registration-validation.json](docs/test-runs/registration-validation.json) |
| 修复与历史删例说明 | 原始 76 套件、3241 条；删除 25 条后为当前 73 套件、3216 条 | [修复记录](docs/test-runs/20261121-fix-report.md)、[删除清单](docs/test-runs/deleted-cases/manifest.json) |

归档执行日期为 **2026-11-21**，设备序列号为 `450100445634303332014fea6c381c00`。全量耗时 377.47 秒，最长单用例报告耗时 11239 毫秒，固定单例超时为 15000 毫秒。归档最终测试 HAP 的 SHA-256 为：

```text
e936b7a0c7174489eb2f4cb3f995d36ed1c94430cf76910eb4c5f24e7bf86098
```

25 条历史删例中有 24 条超时、1 条组件错误，涉及 ActsAbilityTest、MemoryShared、Rendering、StateInteraction、ThreadCommunication、TransientTaskLifecycle 和 WebNavigation。它们不计入当前用例表或通过率；具体源码、原因及原始失败记录由删除清单保留。

## 用例设计说明

- **数据与监听器**：同时核对完整数据、通知类型、回调索引、先后顺序、重复注册、退订、重订阅以及跨实例隔离。WaterFlow 组合回归覆盖七种编辑操作的四步有序组合。
- **图像与传输**：区分 RGBA 分片、颜色转换和真实 PixelMap/TaskPool 处理；检查四字节对齐、尾像素、任务封顶、Alpha、二维顺序、克隆/转移、对象所有权与失败重试。
- **锁与原子操作**：覆盖同缓冲区竞争、独立缓冲区隔离、不可重入、别名构造、竞争标志与相邻载荷；原子计数要求精确，非原子计数允许丢失更新但不能超出理论总数。
- **页面与状态**：除存在性检查外，还检查组件显隐、布局边界、路由目的地、状态更新、操作互不干扰、循环行为和页面重入恢复。
- **驱动自身**：专门覆盖串行队列的失败恢复、异步清理、嵌套排队、观察者异常、结果引用与拒绝原因，降低公共测试辅助逻辑掩盖问题的可能。

覆盖矩阵：

| 层次 | 覆盖内容 | 对应套件 |
|---|---|---|
| 入口与导航 | 16 个目录项、首页、静态/动态导入、原生回调与传输控件 | FeatureCatalog、ActsAbilityTest、ImportNavigation |
| 模型层 | 静态/动态模型字段、响应默认值、容器和实例隔离 | ImportDataModels |
| UI 与状态层 | Move/Scale、重入、显隐、Grid、编辑器、当前视口边界 | DfxStateManagement、StateInteraction、Rendering、DeviceLayout |
| 数据源层 | 增删重载、完整序列、回调和监听器生命周期 | WaterFlowDataSource、WaterFlowMutationSequence、TraceDataSource、WaterFlowRegression01~43、TraceRegression01 |
| 共享内存层 | 锁标志、原子计数、竞争与载荷保护 | MemoryShared、LockBuffer |
| 像素层 | 色彩、Alpha、滑块比例、分片、存储隔离和流水线 | PixelColorTransform、PixelContract、RgbaShards、RgbaOwnership、RgbaRegression01~09 |
| 任务池层 | PixelMap 克隆/转移、顺序、并发及恢复 | ThreadDataTransfer |
| 测试基础设施 | 队列时序、失败恢复和对象语义 | DriverQueue、QueueLifecycle |

## 执行说明

以下命令在工程根目录的 PowerShell 中执行。`hdc`、Node 和 hvigor 路径使用本工程已有工具位置；更换开发环境时按实际安装位置调整。

1. 确认设备在线：

   ```powershell
   $hdcPath = "D:\OpenHarmony\sdk\12\toolchains\hdc.exe"
   & $hdcPath list targets
   ```

2. 如需重新构建测试 HAP，使用工程配置和可用的本地签名材料执行：

   ```powershell
   $env:DEVECO_SDK_HOME = "D:\OpenHarmony\sdk"
   $env:JAVA_HOME = "D:\DevEco Studio\jbr"
   & "D:\DevEco Studio\tools\node\node.exe" "D:\DevEco Studio\tools\hvigor\bin\hvigorw.js" --mode module -p product=default -p module=entry@ohosTest assembleHap --no-daemon
   ```

   主 HAP 需要更新时，将 `module=entry@ohosTest` 改为 `module=entry@default` 构建。主/测试 HAP 应来自匹配的工程版本。

3. 安装主 HAP 与测试 HAP：

   ```powershell
   & $hdcPath install -r "product/phone/entry/build/default/outputs/default/entry-default-signed.hap"
   & $hdcPath install -r "product/phone/entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap"
   ```

4. 推荐通过现有脚本执行并保存结果：

   ```powershell
   # 同进程全量执行，固定每例超时 15000 毫秒
   python tools/run_device_tests.py --round verify-15000 --all-together --suite-seconds 3600

   # 只执行指定套件
   python tools/run_device_tests.py --round pixel-contract-15000 --select PerformancePixelContract
   ```

   脚本将执行日志和 `summary.json` 保存到 `docs/test-runs/<round>/`。复跑时选择新的轮次名称以保留既有归档；脚本内 `HDC` 常量固定为 SDK 12 的工具路径。`--suite-seconds` 是整批执行的主机看门狗，不改变每例 15000 毫秒的超时。

5. 单例选择器格式为 `Suite#case`，通过脚本的 `--select` 参数指定；套件名使用总览中的 `describe` 名称，例如 `PerformancePixelContract`，与文件名可能不同。`--suite-seconds` 控制主机等待时限，每例超时仍固定为 15000 毫秒。

6. 在另一终端查看日志，运行结束后核对数量、失败、错误、忽略及超时：

   ```powershell
   & $hdcPath shell "hilog -T PerformanceTest,testTag,JSAPP"
   ```

   全量目标输出为 `Tests run: 3216, Failure: 0, Error: 0, Pass: 3216`。更换设备后应以新的运行日志为准。

## 测试覆盖总结

- **规模**：73 个有效测试套件、3216 条自动用例，包含 306 条基础与场景用例、2910 条组合回归用例。
- **已有验证**：2026-11-21 归档同进程全量运行全部通过；固定单例超时 15000 毫秒，执行集合与当前源码一致。
- **覆盖边界**：当前套件验证功能、状态、数据与并发契约；未将帧率、启动耗时、内存峰值或吞吐量作为性能基准指标，也未据此量化优化收益。
- **设备边界**：布局检查针对归档设备当前视口；首页目录检查覆盖 16 个路由映射，并不表示每个功能页面都具备完整端到端验证。完整 ThreadCommunication、短时任务生命周期和 Web 导航等历史删例的流程不计入当前覆盖。
- **复现边界**：UI 用例依赖可交互设备和匹配的双 HAP；当前文档归档的是既有设备结果，跨设备或源码变化后的结果需要按执行说明重新确认。

