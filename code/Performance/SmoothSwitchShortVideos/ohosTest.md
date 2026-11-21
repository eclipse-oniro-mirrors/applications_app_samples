# SmoothSwitchShortVideos 测试用例归档

归档日期：2026-11-21。本文按本工程当前源码与实际设备执行结果整理，结构参考 SendableColorSpace 的测试归档文档。

## 验证范围

1. 已使用本机 DevEco Studio2 的 hvigor 工具链编译并签名主应用与 ohosTest 测试模块；本次 IDE 全量运行包含重新构建、安装双 HAP 和启动测试。
2. 已在设备 `450100445634303332014fea6c381c00` 上直接运行 IDE 的 **All Tests in 'test (entry)'** 配置。2026-11-21 15:04 开始，15:09 完成，IDE 显示 **5,590 条全部通过**；同期 Hypium 汇总为 `Tests run: 5590, Failure: 0, Error: 0, Pass: 5590, Ignore: 0`。
3. IDE 原配置包含 79 个套件，未包含定义在 `SharedDriver.ets` 中的 `ShortVideoDriverClock`。该套件已在同一测试包上单独补跑，**52/52 通过**。两部分合计 **80 套、5,642 条**；没有将补跑的 52 条计入 IDE 单次全量结果。
4. UI 与系统媒体用例依赖主 HAP 和测试 HAP 同时安装。真实播放还依赖六个 MP4 素材、本地视频服务和 USB 反向端口映射。
5. 本次修复保留全部测试及断言。下列 Pass 来自实际自动化执行，替换原文件中重复的人工操作简表。本次文档更新仅整理已有记录，没有重新执行测试。

设备日志中的日期未与电脑校准；本归档采用电脑日期与 Asia/Shanghai 时区。工程使用 API 20 SDK，已验证设备为 API 26；不能直接将不同工程的系统版本、设备编号或构建结果套用到本工程。

## 测试套件总览

当前统计以实际注册的 Hypium 套件和用例为准：

- **测试文件数**：77 个 `.test.ets`，另有入口 `List.test.ets`；`Shared/SharedDriver.ets` 还注册 1 个驱动契约套件。
- **注册函数数**：78；其中 `VideoUi.test.ets` 的一个注册函数包含 3 个套件，因此共 80 个套件。
- **测试用例数**：5,642。导航套件的 `completeLoopForward`、`completeLoopBackward` 由循环动态注册，不能只统计单引号形式的 `it('...')`。
- **设备结果**：Pass 5,642 / Failure 0 / Error 0 / Ignore 0，覆盖全部 80 套。
- **代码规模**：`entry/src` 下 ETS 共 49,379 行，其中 main 9 个文件、945 行；ohosTest 84 个文件、48,434 行。物理行包含注释和空行，不含 JS、类型声明、构建产物及备份。

### 分类合计

| 测试类别 | 套件数 | 用例数 |
| --- | ---: | ---: |
| 应用、目录与系统媒体 | 5 | 14 |
| 测试驱动时钟契约 | 1 | 52 |
| 时间格式化 | 4 | 395 |
| 时间文本解析矩阵 | 2 | 120 |
| 播放策略与状态守卫 | 7 | 75 |
| 播放定位 | 9 | 789 |
| 进度换算 | 8 | 728 |
| 视频目录与快照隔离 | 14 | 920 |
| 视频画面布局 | 14 | 857 |
| 数据通知与监听器 | 16 | 1692 |
| **合计** | **80** | **5,642** |

以下清单覆盖全部 80 个套件。套件名称链接指向真实源码；编号范围表示该文件内的独立用例，单例可用 `套件名#用例名` 选择运行。

### 应用、目录与系统媒体（5 个套件，14 条）

真实 Ability 启动、目录顺序、手势循环、播放与系统媒体接口。

| 套件名称 | 对应文件 | 用例数 | 用例名称或编号范围 |
| --- | --- | ---: | --- |
| [ShortVideoAbility](entry/src/ohosTest/ets/test/Ability.test.ets) | Ability.test.ets | 2 | 见下方逐例说明 |
| [ShortVideoPlayerRuntime](entry/src/ohosTest/ets/test/PlayerRuntime.test.ets) | PlayerRuntime.test.ets | 4 | 见下方逐例说明 |
| [ShortVideoCatalog](entry/src/ohosTest/ets/test/VideoUi.test.ets) | VideoUi.test.ets | 1 | 见下方逐例说明 |
| [ShortVideoNavigation](entry/src/ohosTest/ets/test/VideoUi.test.ets) | VideoUi.test.ets | 3 | 见下方逐例说明 |
| [ShortVideoStreaming](entry/src/ohosTest/ets/test/VideoUi.test.ets) | VideoUi.test.ets | 4 | 见下方逐例说明 |
| **小计** | | **14** | |

### 测试驱动时钟契约（1 个套件，52 条）

parsePlaybackClock 的合法与非法时间文本。

| 套件名称 | 对应文件 | 用例数 | 用例名称或编号范围 |
| --- | --- | ---: | --- |
| [ShortVideoDriverClock](entry/src/ohosTest/ets/test/Shared/SharedDriver.ets) | SharedDriver.ets | 52 | `clockOracle_001` ～ `clockOracle_052` |
| **小计** | | **52** | |

### 时间格式化（4 个套件，395 条）

secondToTime 的格式化与解析回读。

| 套件名称 | 对应文件 | 用例数 | 用例名称或编号范围 |
| --- | --- | ---: | --- |
| [IntegrationClock05](entry/src/ohosTest/ets/test/Integration/IntegrationClock05.test.ets) | IntegrationClock05.test.ets | 96 | `IntegrationClock05_001` ～ `IntegrationClock05_096` |
| [MatrixTime001](entry/src/ohosTest/ets/test/Matrix/MatrixTime001.test.ets) | MatrixTime001.test.ets | 100 | `MatrixTime001_0001` ～ `MatrixTime001_0100` |
| [MatrixTime002](entry/src/ohosTest/ets/test/Matrix/MatrixTime002.test.ets) | MatrixTime002.test.ets | 80 | `MatrixTime002_0001` ～ `MatrixTime002_0080` |
| [ValidationClock09](entry/src/ohosTest/ets/test/Validation/ValidationClock09.test.ets) | ValidationClock09.test.ets | 119 | `ValidationClock09_001` ～ `ValidationClock09_119` |
| **小计** | | **395** | |

### 时间文本解析矩阵（2 个套件，120 条）

parsePlaybackClock 的字段格式、范围及非法输入。

| 套件名称 | 对应文件 | 用例数 | 用例名称或编号范围 |
| --- | --- | ---: | --- |
| [MatrixParser001](entry/src/ohosTest/ets/test/Matrix/MatrixParser001.test.ets) | MatrixParser001.test.ets | 100 | `MatrixParser001_0001` ～ `MatrixParser001_0100` |
| [MatrixParser002](entry/src/ohosTest/ets/test/Matrix/MatrixParser002.test.ets) | MatrixParser002.test.ets | 20 | `MatrixParser002_0001` ～ `MatrixParser002_0020` |
| **小计** | | **120** | |

### 播放策略与状态守卫（7 个套件，75 条）

PlaybackPolicy 的播放/定位状态、首条自动播放、选中项与缓存策略。

| 套件名称 | 对应文件 | 用例数 | 用例名称或编号范围 |
| --- | --- | ---: | --- |
| [IntegrationPolicy01](entry/src/ohosTest/ets/test/Integration/IntegrationPolicy01.test.ets) | IntegrationPolicy01.test.ets | 16 | `IntegrationPolicy01_001` ～ `IntegrationPolicy01_016` |
| [IntegrationPolicy04](entry/src/ohosTest/ets/test/Integration/IntegrationPolicy04.test.ets) | IntegrationPolicy04.test.ets | 22 | `IntegrationPolicy04_001` ～ `IntegrationPolicy04_022` |
| [IntegrationPolicy07](entry/src/ohosTest/ets/test/Integration/IntegrationPolicy07.test.ets) | IntegrationPolicy07.test.ets | 24 | `IntegrationPolicy07_001` ～ `IntegrationPolicy07_024` |
| [InteractionPolicy02](entry/src/ohosTest/ets/test/Interaction/InteractionPolicy02.test.ets) | InteractionPolicy02.test.ets | 8 | `InteractionPolicy02_001` ～ `InteractionPolicy02_008` |
| [InteractionPolicy08](entry/src/ohosTest/ets/test/Interaction/InteractionPolicy08.test.ets) | InteractionPolicy08.test.ets | 3 | `InteractionPolicy08_001` ～ `InteractionPolicy08_003` |
| [InteractionPolicy10](entry/src/ohosTest/ets/test/Interaction/InteractionPolicy10.test.ets) | InteractionPolicy10.test.ets | 1 | `InteractionPolicy10_001` |
| [LifecycleStatePolicy02](entry/src/ohosTest/ets/test/LifecycleState/LifecycleStatePolicy02.test.ets) | LifecycleStatePolicy02.test.ets | 1 | `LifecycleStatePolicy02_001` |
| **小计** | | **75** | |

### 播放定位（9 个套件，789 条）

seekPosition 的比例换算及合法范围约束。

| 套件名称 | 对应文件 | 用例数 | 用例名称或编号范围 |
| --- | --- | ---: | --- |
| [IntegrationSeek06](entry/src/ohosTest/ets/test/Integration/IntegrationSeek06.test.ets) | IntegrationSeek06.test.ets | 13 | `IntegrationSeek06_001` ～ `IntegrationSeek06_013` |
| [InteractionSeek12](entry/src/ohosTest/ets/test/Interaction/InteractionSeek12.test.ets) | InteractionSeek12.test.ets | 131 | `InteractionSeek12_001` ～ `InteractionSeek12_131` |
| [MatrixSeek001](entry/src/ohosTest/ets/test/Matrix/MatrixSeek001.test.ets) | MatrixSeek001.test.ets | 100 | `MatrixSeek001_0001` ～ `MatrixSeek001_0100` |
| [MatrixSeek002](entry/src/ohosTest/ets/test/Matrix/MatrixSeek002.test.ets) | MatrixSeek002.test.ets | 100 | `MatrixSeek002_0001` ～ `MatrixSeek002_0100` |
| [MatrixSeek003](entry/src/ohosTest/ets/test/Matrix/MatrixSeek003.test.ets) | MatrixSeek003.test.ets | 40 | `MatrixSeek003_0001` ～ `MatrixSeek003_0040` |
| [PowerDialogSeek09](entry/src/ohosTest/ets/test/PowerDialog/PowerDialogSeek09.test.ets) | PowerDialogSeek09.test.ets | 88 | `PowerDialogSeek09_001` ～ `PowerDialogSeek09_088` |
| [PowerValidationSeek07](entry/src/ohosTest/ets/test/PowerValidation/PowerValidationSeek07.test.ets) | PowerValidationSeek07.test.ets | 124 | `PowerValidationSeek07_001` ～ `PowerValidationSeek07_124` |
| [ValidationSeek02](entry/src/ohosTest/ets/test/Validation/ValidationSeek02.test.ets) | ValidationSeek02.test.ets | 98 | `ValidationSeek02_001` ～ `ValidationSeek02_098` |
| [ValidationSeek07](entry/src/ohosTest/ets/test/Validation/ValidationSeek07.test.ets) | ValidationSeek07.test.ets | 95 | `ValidationSeek07_001` ～ `ValidationSeek07_095` |
| **小计** | | **789** | |

### 进度换算（8 个套件，728 条）

sliderPosition 的进度换算与边界处理。

| 套件名称 | 对应文件 | 用例数 | 用例名称或编号范围 |
| --- | --- | ---: | --- |
| [IntegrationProgress08](entry/src/ohosTest/ets/test/Integration/IntegrationProgress08.test.ets) | IntegrationProgress08.test.ets | 51 | `IntegrationProgress08_001` ～ `IntegrationProgress08_051` |
| [InteractionProgress04](entry/src/ohosTest/ets/test/Interaction/InteractionProgress04.test.ets) | InteractionProgress04.test.ets | 56 | `InteractionProgress04_001` ～ `InteractionProgress04_056` |
| [InteractionProgress13](entry/src/ohosTest/ets/test/Interaction/InteractionProgress13.test.ets) | InteractionProgress13.test.ets | 106 | `InteractionProgress13_001` ～ `InteractionProgress13_106` |
| [MatrixProgress001](entry/src/ohosTest/ets/test/Matrix/MatrixProgress001.test.ets) | MatrixProgress001.test.ets | 100 | `MatrixProgress001_0001` ～ `MatrixProgress001_0100` |
| [MatrixProgress002](entry/src/ohosTest/ets/test/Matrix/MatrixProgress002.test.ets) | MatrixProgress002.test.ets | 100 | `MatrixProgress002_0001` ～ `MatrixProgress002_0100` |
| [MatrixProgress003](entry/src/ohosTest/ets/test/Matrix/MatrixProgress003.test.ets) | MatrixProgress003.test.ets | 40 | `MatrixProgress003_0001` ～ `MatrixProgress003_0040` |
| [PerformanceStabilityProgress07](entry/src/ohosTest/ets/test/PerformanceStability/PerformanceStabilityProgress07.test.ets) | PerformanceStabilityProgress07.test.ets | 111 | `PerformanceStabilityProgress07_001` ～ `PerformanceStabilityProgress07_111` |
| [ValidationProgress10](entry/src/ohosTest/ets/test/Validation/ValidationProgress10.test.ets) | ValidationProgress10.test.ets | 164 | `ValidationProgress10_001` ～ `ValidationProgress10_164` |
| **小计** | | **728** | |

### 视频目录与快照隔离（14 个套件，920 条）

AVDataSource 的数量、顺序、读取及输入/输出快照隔离。

| 套件名称 | 对应文件 | 用例数 | 用例名称或编号范围 |
| --- | --- | ---: | --- |
| [IntegrationSource09](entry/src/ohosTest/ets/test/Integration/IntegrationSource09.test.ets) | IntegrationSource09.test.ets | 61 | `IntegrationSource09_001` ～ `IntegrationSource09_061` |
| [InteractionSource01](entry/src/ohosTest/ets/test/Interaction/InteractionSource01.test.ets) | InteractionSource01.test.ets | 75 | `InteractionSource01_001` ～ `InteractionSource01_075` |
| [MatrixCatalog001](entry/src/ohosTest/ets/test/Matrix/MatrixCatalog001.test.ets) | MatrixCatalog001.test.ets | 100 | `MatrixCatalog001_0001` ～ `MatrixCatalog001_0100` |
| [MatrixCatalog002](entry/src/ohosTest/ets/test/Matrix/MatrixCatalog002.test.ets) | MatrixCatalog002.test.ets | 50 | `MatrixCatalog002_0001` ～ `MatrixCatalog002_0050` |
| [PerformanceStabilitySource05](entry/src/ohosTest/ets/test/PerformanceStability/PerformanceStabilitySource05.test.ets) | PerformanceStabilitySource05.test.ets | 48 | `PerformanceStabilitySource05_001` ～ `PerformanceStabilitySource05_048` |
| [PowerDialogSource10](entry/src/ohosTest/ets/test/PowerDialog/PowerDialogSource10.test.ets) | PowerDialogSource10.test.ets | 78 | `PowerDialogSource10_001` ～ `PowerDialogSource10_078` |
| [PowerDialogSource11](entry/src/ohosTest/ets/test/PowerDialog/PowerDialogSource11.test.ets) | PowerDialogSource11.test.ets | 77 | `PowerDialogSource11_001` ～ `PowerDialogSource11_077` |
| [PowerDialogSource12](entry/src/ohosTest/ets/test/PowerDialog/PowerDialogSource12.test.ets) | PowerDialogSource12.test.ets | 88 | `PowerDialogSource12_001` ～ `PowerDialogSource12_088` |
| [PowerDialogSource13](entry/src/ohosTest/ets/test/PowerDialog/PowerDialogSource13.test.ets) | PowerDialogSource13.test.ets | 86 | `PowerDialogSource13_001` ～ `PowerDialogSource13_086` |
| [PowerValidationSource01](entry/src/ohosTest/ets/test/PowerValidation/PowerValidationSource01.test.ets) | PowerValidationSource01.test.ets | 75 | `PowerValidationSource01_001` ～ `PowerValidationSource01_075` |
| [PowerValidationSource03](entry/src/ohosTest/ets/test/PowerValidation/PowerValidationSource03.test.ets) | PowerValidationSource03.test.ets | 43 | `PowerValidationSource03_001` ～ `PowerValidationSource03_043` |
| [SecuritySource01](entry/src/ohosTest/ets/test/Security/SecuritySource01.test.ets) | SecuritySource01.test.ets | 51 | `SecuritySource01_001` ～ `SecuritySource01_051` |
| [ValidationSource04](entry/src/ohosTest/ets/test/Validation/ValidationSource04.test.ets) | ValidationSource04.test.ets | 46 | `ValidationSource04_001` ～ `ValidationSource04_046` |
| [ValidationSource11](entry/src/ohosTest/ets/test/Validation/ValidationSource11.test.ets) | ValidationSource11.test.ets | 42 | `ValidationSource11_001` ～ `ValidationSource11_042` |
| **小计** | | **920** | |

### 视频画面布局（14 个套件，857 条）

fitSurface 的尺寸适配、比例、旋转与边界。

| 套件名称 | 对应文件 | 用例数 | 用例名称或编号范围 |
| --- | --- | ---: | --- |
| [IntegrationSurface03](entry/src/ohosTest/ets/test/Integration/IntegrationSurface03.test.ets) | IntegrationSurface03.test.ets | 8 | `IntegrationSurface03_001` ～ `IntegrationSurface03_008` |
| [InteractionSurface03](entry/src/ohosTest/ets/test/Interaction/InteractionSurface03.test.ets) | InteractionSurface03.test.ets | 32 | `InteractionSurface03_001` ～ `InteractionSurface03_032` |
| [InteractionSurface05](entry/src/ohosTest/ets/test/Interaction/InteractionSurface05.test.ets) | InteractionSurface05.test.ets | 30 | `InteractionSurface05_001` ～ `InteractionSurface05_030` |
| [InteractionSurface09](entry/src/ohosTest/ets/test/Interaction/InteractionSurface09.test.ets) | InteractionSurface09.test.ets | 74 | `InteractionSurface09_001` ～ `InteractionSurface09_074` |
| [InteractionSurface11](entry/src/ohosTest/ets/test/Interaction/InteractionSurface11.test.ets) | InteractionSurface11.test.ets | 31 | `InteractionSurface11_001` ～ `InteractionSurface11_031` |
| [InteractionSurface14](entry/src/ohosTest/ets/test/Interaction/InteractionSurface14.test.ets) | InteractionSurface14.test.ets | 72 | `InteractionSurface14_001` ～ `InteractionSurface14_072` |
| [LifecycleStateSurface01](entry/src/ohosTest/ets/test/LifecycleState/LifecycleStateSurface01.test.ets) | LifecycleStateSurface01.test.ets | 43 | `LifecycleStateSurface01_001` ～ `LifecycleStateSurface01_043` |
| [MatrixSurface001](entry/src/ohosTest/ets/test/Matrix/MatrixSurface001.test.ets) | MatrixSurface001.test.ets | 100 | `MatrixSurface001_0001` ～ `MatrixSurface001_0100` |
| [MatrixSurface002](entry/src/ohosTest/ets/test/Matrix/MatrixSurface002.test.ets) | MatrixSurface002.test.ets | 100 | `MatrixSurface002_0001` ～ `MatrixSurface002_0100` |
| [MatrixSurface003](entry/src/ohosTest/ets/test/Matrix/MatrixSurface003.test.ets) | MatrixSurface003.test.ets | 40 | `MatrixSurface003_0001` ～ `MatrixSurface003_0040` |
| [PerformanceStabilitySurface01](entry/src/ohosTest/ets/test/PerformanceStability/PerformanceStabilitySurface01.test.ets) | PerformanceStabilitySurface01.test.ets | 92 | `PerformanceStabilitySurface01_001` ～ `PerformanceStabilitySurface01_092` |
| [PowerDialogSurface08](entry/src/ohosTest/ets/test/PowerDialog/PowerDialogSurface08.test.ets) | PowerDialogSurface08.test.ets | 53 | `PowerDialogSurface08_001` ～ `PowerDialogSurface08_053` |
| [SecuritySurface02](entry/src/ohosTest/ets/test/Security/SecuritySurface02.test.ets) | SecuritySurface02.test.ets | 39 | `SecuritySurface02_001` ～ `SecuritySurface02_039` |
| [ValidationSurface01](entry/src/ohosTest/ets/test/Validation/ValidationSurface01.test.ets) | ValidationSurface01.test.ets | 143 | `ValidationSurface01_001` ～ `ValidationSurface01_143` |
| **小计** | | **857** | |

### 数据通知与监听器（16 个套件，1692 条）

AVDataSource 的监听器注册、去重、注销及通知顺序。

| 套件名称 | 对应文件 | 用例数 | 用例名称或编号范围 |
| --- | --- | ---: | --- |
| [IntegrationNotifications02](entry/src/ohosTest/ets/test/Integration/IntegrationNotifications02.test.ets) | IntegrationNotifications02.test.ets | 94 | `IntegrationNotifications02_001` ～ `IntegrationNotifications02_094` |
| [InteractionNotifications06](entry/src/ohosTest/ets/test/Interaction/InteractionNotifications06.test.ets) | InteractionNotifications06.test.ets | 170 | `InteractionNotifications06_001` ～ `InteractionNotifications06_170` |
| [InteractionNotifications07](entry/src/ohosTest/ets/test/Interaction/InteractionNotifications07.test.ets) | InteractionNotifications07.test.ets | 160 | `InteractionNotifications07_001` ～ `InteractionNotifications07_160` |
| [LifecycleStateNotifications06](entry/src/ohosTest/ets/test/LifecycleState/LifecycleStateNotifications06.test.ets) | LifecycleStateNotifications06.test.ets | 132 | `LifecycleStateNotifications06_001` ～ `LifecycleStateNotifications06_132` |
| [LifecycleStateNotifications07](entry/src/ohosTest/ets/test/LifecycleState/LifecycleStateNotifications07.test.ets) | LifecycleStateNotifications07.test.ets | 67 | `LifecycleStateNotifications07_001` ～ `LifecycleStateNotifications07_067` |
| [LifecycleStateNotifications08](entry/src/ohosTest/ets/test/LifecycleState/LifecycleStateNotifications08.test.ets) | LifecycleStateNotifications08.test.ets | 72 | `LifecycleStateNotifications08_001` ～ `LifecycleStateNotifications08_072` |
| [LifecycleStateNotifications09](entry/src/ohosTest/ets/test/LifecycleState/LifecycleStateNotifications09.test.ets) | LifecycleStateNotifications09.test.ets | 52 | `LifecycleStateNotifications09_001` ～ `LifecycleStateNotifications09_052` |
| [MatrixNotifications001](entry/src/ohosTest/ets/test/Matrix/MatrixNotifications001.test.ets) | MatrixNotifications001.test.ets | 100 | `MatrixNotifications001_0001` ～ `MatrixNotifications001_0100` |
| [MatrixNotifications002](entry/src/ohosTest/ets/test/Matrix/MatrixNotifications002.test.ets) | MatrixNotifications002.test.ets | 80 | `MatrixNotifications002_0001` ～ `MatrixNotifications002_0080` |
| [PerformanceStabilityNotifications02](entry/src/ohosTest/ets/test/PerformanceStability/PerformanceStabilityNotifications02.test.ets) | PerformanceStabilityNotifications02.test.ets | 29 | `PerformanceStabilityNotifications02_001` ～ `PerformanceStabilityNotifications02_029` |
| [PerformanceStabilityNotifications04](entry/src/ohosTest/ets/test/PerformanceStability/PerformanceStabilityNotifications04.test.ets) | PerformanceStabilityNotifications04.test.ets | 38 | `PerformanceStabilityNotifications04_001` ～ `PerformanceStabilityNotifications04_038` |
| [PowerDialogNotifications01](entry/src/ohosTest/ets/test/PowerDialog/PowerDialogNotifications01.test.ets) | PowerDialogNotifications01.test.ets | 98 | `PowerDialogNotifications01_001` ～ `PowerDialogNotifications01_098` |
| [PowerValidationNotifications04](entry/src/ohosTest/ets/test/PowerValidation/PowerValidationNotifications04.test.ets) | PowerValidationNotifications04.test.ets | 96 | `PowerValidationNotifications04_001` ～ `PowerValidationNotifications04_096` |
| [PowerValidationNotifications06](entry/src/ohosTest/ets/test/PowerValidation/PowerValidationNotifications06.test.ets) | PowerValidationNotifications06.test.ets | 168 | `PowerValidationNotifications06_001` ～ `PowerValidationNotifications06_168` |
| [PowerValidationNotifications08](entry/src/ohosTest/ets/test/PowerValidation/PowerValidationNotifications08.test.ets) | PowerValidationNotifications08.test.ets | 108 | `PowerValidationNotifications08_001` ～ `PowerValidationNotifications08_108` |
| [ValidationNotifications03](entry/src/ohosTest/ets/test/Validation/ValidationNotifications03.test.ets) | ValidationNotifications03.test.ets | 228 | `ValidationNotifications03_001` ～ `ValidationNotifications03_228` |
| **小计** | | **1692** | |

## 测试工程结构

~~~text
entry/src/ohosTest/
├── module.json5                         # entry_test 模块与 TestAbility 声明
└── ets/
    ├── testability/TestAbility.ets       # 测试页面、前台生命周期与运行入口
    ├── testrunner/OpenHarmonyTestRunner.ets
    └── test/
        ├── List.test.ets                # 78 个注册函数，合计 80 个套件
        ├── Ability.test.ets             # Ability 启动及 Home 后重入
        ├── VideoUi.test.ets             # 目录、导航与真实播放三个套件
        ├── PlayerRuntime.test.ets       # 真实 AVPlayer 与公共操作函数
        ├── Integration/                 # 9 套，385 条
        ├── Interaction/                 # 14 套，949 条
        ├── LifecycleState/              # 6 套，367 条
        ├── PerformanceStability/        # 5 套，318 条
        ├── PowerDialog/                 # 7 套，568 条
        ├── PowerValidation/             # 6 套，614 条
        ├── Security/                    # 2 套，90 条
        ├── Validation/                  # 8 套，935 条
        ├── Matrix/                      # 17 套，1,350 条
        └── Shared/
            ├── SharedDriver.ets         # UI 驱动、时钟解析与 52 条契约用例
            ├── ModelFixture.ets         # 数据构造与监听器通知校验
            ├── MatrixFixture.ets        # 向量类型及生产方法断言
            ├── HypiumSession.js         # Hypium 初始化与异步批次调度
            └── HypiumSession.d.ts       # 适配层类型声明
~~~

生产代码主要位于 `entry/src/main/ets`，覆盖对象包括 `CommonConstants`、`CommonUtils`、`PlaybackPolicy`、`AVDataSource`、`AVPlayerState`、`EntryAbility`、`Index` 和 `VideoPlayView`。

## 套件入口与注册管理

- `List.test.ets` 保留普通的 `export default function testsuite(): Promise<void>`，回调内部显式调用导入的注册函数。异步循环放在 `registerTestBatches()` 中，兼容本机 DevEco Studio 的静态用例发现。
- 本机 IDE 的扫描器无法兼容此前的异步默认入口和独立 `await` 表达式，会返回空列表并报 `00502002`。新增套件时应沿用现有入口结构，并检查 IDE 的 All Tests 配置能实际发现测试。
- `TestAbility` 在页面加载且进入前台后启动会话，保持测试窗口亮屏。适配层在真实初始化完成后输出 `start ability successfully.`，满足 IDE 的启动确认协议；启动确认不代表任何用例通过。
- 注册批次之间和每条用例开始前等待 10 毫秒，让系统事件循环继续处理任务。该延迟不能直接改为 0；此前零延迟版本已在设备上触发 `THREAD_BLOCK_6S`。
- 适配层针对当前锁定的 Hypium 1.0.13 初始化报告与过滤服务，等待注册完成后才执行测试。升级框架时需要重新验证发现、启动和结果上报。
- 单个用例名称以源码注册名为准。多数生成套件使用 `套件名_三位序号`；Matrix 使用四位序号；驱动使用 `clockOracle_三位序号`；UI 与媒体使用英文场景名。现有用例的第二个参数为 `0`，本文不套用参考工程的 Level0/Level1 数量或编号规范。

## 关键用例表

### 应用、目录与系统媒体：14 条逐例说明

这些用例对应原文档中的“拉起应用、上下切换、六个视频播放”等操作，补充了当前实际存在的生命周期、定位和媒体守卫检查。

| 套件 | 用例名称 | 预置条件及输入 | 预期输出 | 结果 |
| --- | --- | --- | --- | --- |
| ShortVideoAbility | `entryAbilityRendersVideoFeed` | 主应用与测试包已安装，启动 EntryAbility | 视频流页面存在，能够识别选中的视频 | Pass |
| ShortVideoAbility | `entryAbilityReturnsToFeedAfterHome` | 记录当前索引，发送 Home，再次启动 | 页面重新可见，选中索引保持一致 | Pass |
| ShortVideoCatalog | `configuredCatalogKeepsTheSixOrderedDemoRoutes` | 读取 VIDEO_SOURCE 并构造 AVDataSource | 总数为 6，按顺序对应 /video1 至 /video6 | Pass |
| ShortVideoNavigation | `completeLoopForward` | 从当前索引连续向后切换六次，手势速度 1600 | 每个索引仅访问一次，遍历六项后回到起始索引 | Pass |
| ShortVideoNavigation | `completeLoopBackward` | 从当前索引连续向前切换六次，手势速度 1600 | 反向完整遍历，最终回到起始索引 | Pass |
| ShortVideoNavigation | `reverseDirectionAtSeveralGestureSpeeds` | 依次以 800、1600、3200 的手势速度切换再反向返回 | 每次正向、反向切换后索引符合预期 | Pass |
| ShortVideoStreaming | `eachVideoAdvancesItsOwnPlaybackClock` | 服务可达，顺序切换六个视频并等待播放 | 每个视频均通过播放进度推进检查，时长大于 0 | Pass |
| ShortVideoStreaming | `tapPausesAndSecondTapContinuesRealPlayback` | 真实视频播放后点击一次，再点击一次 | 暂停标识出现且时钟停止；再次点击后继续播放 | Pass |
| ShortVideoStreaming | `seekWhilePausedMovesTheClockTowardTheRequestedFraction` | 视频时长至少 5 秒，暂停后定位到 20% 或 80% | 进度朝目标方向移动，目标偏差容限为 2 秒，仍保持暂停 | Pass |
| ShortVideoStreaming | `hidePausesActiveVideoAndReturnAllowsResume` | 视频播放后发送 Home，再次进入并点击播放 | 后台隐藏后暂停，返回时保留当前项，点击后恢复播放 | Pass |
| ShortVideoPlayerRuntime | `newPlayerStaysIdleWhenPlaySeekAndStopAreGated` | 创建真实 idle 播放器，调用播放、定位、停止辅助函数 | 状态守卫生效，播放器保持 idle | Pass |
| ShortVideoPlayerRuntime | `pauseInIdleCompletesWithoutChangingState` | 对真实 idle 播放器调用暂停辅助函数 | 调用完成后仍为 idle | Pass |
| ShortVideoPlayerRuntime | `releaseHelperReleasesAnActualMediaPlayer` | 创建真实播放器并调用释放辅助函数 | 等待后进入 released，资源得到释放 | Pass |
| ShortVideoPlayerRuntime | `helpersAcceptMissingPlayerDuringStartupOrDisposal` | 将 undefined 传入播放、暂停、停止、定位、释放辅助函数 | 所有调用完成，无未处理异常或 Promise 拒绝 | Pass |

### 模型与边界用例

74 个模型套件合计 **5,576 条**；上方完整套件清单提供每套的名称、源码和编号范围。以下按实际调用对象概括输入与预期，单例的具体字面量和断言以对应源码为准。

| 覆盖对象 | 输入与操作 | 核心预期 | 用例数 |
| --- | --- | --- | ---: |
| 时间格式化 | 秒数、负值、小数和跨小时输入，格式化后解析回读 | 文本与独立预期一致，回读秒数符合格式化结果 | 395 |
| 时间文本解析矩阵 | 两段/三段时间、字段长度、字符与数值范围组合 | 合法文本返回秒数，非法文本返回 -1 | 120 |
| 播放策略 | 播放器状态字符串、首项与可见性标记、当前/选中索引 | 播放和定位守卫、首条启动条件、选中与缓存策略符合预期 | 75 |
| 定位换算 | 目标值、媒体时长、滑块上限及边界组合 | 定位值符合独立预期，合法向量满足上下限约束 | 789 |
| 进度换算 | 当前播放位置、时长与滑块上限组合 | 显示进度符合预期，异常/边界输入按生产逻辑处理 | 728 |
| 目录与快照 | 不同目录长度、URL 文本、重复项、索引及数组修改 | 数量、顺序和读取正确；外部修改不破坏源数据快照 | 920 |
| 画面布局 | 视频宽高、可用区域宽高及旋转组合 | 适配尺寸与预期一致；矩阵检查范围、旋转与重复适配性质 | 857 |
| 通知与监听器 | 监听器注册、重复注册、注销、数据更新/重载计划 | 回调内容、触发次数、顺序及监听器隔离符合预期 | 1,692 |
| **合计** | | | **5,576** |

`ShortVideoDriverClock` 另有 **52 条**驱动契约用例，编号 `clockOracle_001` 至 `clockOracle_052`，覆盖两段/三段合法时间、小时扩展、字段长度、非法字符、数值范围和安全整数检查。它们检验 UI 驱动解析器，不需要播放视频。

## SharedDriver 与公共夹具封装说明

| 封装 | 主要方法 | 作用 |
| --- | --- | --- |
| 应用与串行操作 | `launchShortVideoApp`、`runSerializedUiOperation` | 启动主模块，按完整场景串行执行 UI 操作，避免并发手势干扰 |
| 页面与索引 | `FeedDriver.launch`、`requireComponent`、`activeIndex`、`waitForIndex` | 依据真实组件和选中标识等待页面就绪 |
| 手势与定位 | `swipe`、`tapVideo`、`tapSeek` | 按实际屏幕尺寸操作上下滑动、暂停/播放和进度定位 |
| 时钟与播放 | `readClock`、`waitForPlayback`、`waitForPausedClock`、`waitForSeek` | 校验时间文本、真实时钟推进、暂停稳定和目标定位 |
| 生命周期 | `sendHome`、`waitForFeedHidden` | 验证页面隐藏及重新进入行为 |
| 模型夹具 | `makeSources`、`checkNotificationPlan` | 构造目录数据，核对监听器操作与通知序列 |
| 矩阵夹具 | `verifyClock`、`verifyParser`、`verifySurface`、`verifySeek`、`verifyProgress`、`verifyCatalog`、`verifyNotification` | 将固定输入向量传入生产实现，执行相应断言 |

驱动复用同一个 `Driver`，默认轮询间隔为 100 毫秒；组件等待预算为 5 秒，播放等待预算为 8 秒。UI 套件在注册时获得至少 90 秒的单例预算，覆盖六个视频完整循环等长场景；普通模型用例基础预算仍为 15 秒。

## 构建验证

已验证的本机工具位于 `D:/DevEco Studio2`，设备工具为 `D:/OpenHarmony/sdk/20/toolchains/hdc.exe`。在工程根目录使用现有构建封装：

~~~powershell
python tools/compile_runner.py default ohosTest
~~~

该脚本检查构建退出码、`BUILD SUCCESSFUL` 和签名 HAP 是否存在；两个目标均成功才返回成功。工程需预先配置可用于设备安装的签名。

| 项目 | 值 |
| --- | --- |
| 主 HAP | `entry/build/default/outputs/default/entry-default-signed.hap` |
| 测试 HAP | `entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap` |
| 应用包名 | `com.samples.SmoothSwitchShortVideo` |
| 主模块 / 主 Ability | `entry` / `EntryAbility` |
| 测试模块 / 测试 Ability | `entry_test` / `TestAbility` |
| 测试运行器 | `/ets/testrunner/OpenHarmonyTestRunner` |
| 测试框架 | `@ohos/hypium` 1.0.13 |

## 用例设计说明

- **目录数据**：通过真实 `AVDataSource` 检查顺序、重复项及快照隔离，预期来自输入数据或独立常量。
- **数值和格式**：时间、定位、进度与画面尺寸采用明确预期值；矩阵浮点比较使用固定误差限与相对误差限，不以“结果存在”替代数值判断。
- **真实交互**：依据组件选中项、暂停标识和播放时钟判断结果；导航用例同时核对访问集合与最终索引。
- **状态与资源**：通过真实 `media.createAVPlayer()` 验证 idle 守卫及 released 状态，释放逻辑放在清理路径中。
- **历史分类**：`PowerDialog`、`PowerValidation`、`Security`、`PerformanceStability` 等目录保留历史名称，当前内容主要是模型与数据回归。不能据目录名称宣称已验证系统权限、电源对话框、功耗或性能指标。
- **统计口径**：用例数按实际注册的 `it` 统计；文件数、套件数与注册函数数分别计算。无明确等级标签时不虚构等级分布，也不将日志中的业务错误行直接计为测试失败。

## 执行说明

### 自动构建、安装与全量回归

在项目根目录执行：

~~~powershell
& 'D:/DevEco Studio2/tools/node/node.exe' ./tools/run_device_tests.cjs --build --install
~~~

默认逐套独立运行全部 80 套，便于定位失败。脚本唤醒设备、编译并覆盖安装双 HAP，准备视频服务与反向端口映射，保存每套日志和 `summary.json`。单套主机超时默认为 240 秒，另有 120 秒无输出保护。

使用一个进程运行脚本发现的完整套件列表：

~~~powershell
& 'D:/DevEco Studio2/tools/node/node.exe' ./tools/run_device_tests.cjs --combined --build --install --out docs/test-runs/my-combined-run
~~~

`--combined` 的主机保护超时默认为 900 秒，保留 `-s timeout 15000`。该命令选择完整 80 套；本文的 IDE 单进程实测结果对应原 IDE 配置选择的 79 套，其余 52 条单独补验。

### IDE 运行前的视频服务

在 DevEco Studio 打开本工程，选择现有 **All Tests in 'test (entry)'** 和在线设备。直接在 IDE 启动时，应先保持以下视频服务运行：

~~~powershell
& 'D:/DevEco Studio2/tools/node/node.exe' ./tools/serve_videos.cjs
~~~

在另一终端设置映射并唤醒设备：

~~~powershell
hdc list targets
hdc -t 450100445634303332014fea6c381c00 rport tcp:5000 tcp:5000
hdc -t 450100445634303332014fea6c381c00 shell power-shell wakeup
~~~

设备编号需替换为实际目标。已有相同反向映射时无需重复添加。服务提供 `/video1` 至 `/video6`，读取 `server/1.mp4` 至 `server/6.mp4`，支持 HTTP Range；当前 `VIDEO_SOURCE` 使用设备的 `127.0.0.1:5000`。定位测试要求素材时长至少 5 秒，关键帧间隔会影响定位精度。

### 手动安装与定向运行

~~~powershell
hdc install -r entry/build/default/outputs/default/entry-default-signed.hap
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
& 'D:/DevEco Studio2/tools/node/node.exe' ./tools/run_device_tests.cjs --classes ShortVideoStreaming --case-timeout 90000 --out docs/test-runs/my-streaming-run
~~~

脚本也支持单套或单例，并保留独立结果目录：

~~~powershell
& 'D:/DevEco Studio2/tools/node/node.exe' ./tools/run_device_tests.cjs --classes 'ShortVideoStreaming#seekWhilePausedMovesTheClockTowardTheRequestedFraction' --out docs/test-runs/my-seek-run
& 'D:/DevEco Studio2/tools/node/node.exe' ./tools/run_device_tests.cjs --classes ShortVideoDriverClock --out docs/test-runs/my-clock-run
~~~

执行完成后核对最终 `Tests run / Failure / Error / Pass / Ignore` 以及完成码，不能只依据 hdc 退出码认定成功。原 IDE 类列表不包含 `ShortVideoDriverClock`，因此需要该套补跑记录才能覆盖本文的全部 5,642 条。

更多执行参数见 [真机测试说明](docs/device-testing.md)。旧迁移文档中的“未部署”“人工 Pass”等描述对应此前阶段，当前设备结果以本归档和下列证据为准。

## 验证记录与结果证据

本次 IDE 单次全量运行的同期设备汇总：

~~~text
[Hypium]total cases:5590;failure 0,error 0,pass 5590; consuming 283824ms
OHOS_REPORT_RESULT: stream=Tests run: 5590, Failure: 0, Error: 0, Pass: 5590, Ignore: 0
~~~

| 记录 | 范围与用途 |
| --- | --- |
| IDE Run 窗口，2026-11-21 15:04 至 15:09 | 实际点击原 All Tests 配置运行，最终绿色显示 5,590 条通过 |
| [额外时钟套件 summary](docs/test-runs/2026-11-21/ide-discovery-extra-clock/summary.json) | 同一包补验 ShortVideoDriverClock，52/52，失败、错误、忽略均为 0 |
| [源码与 HAP 指纹](docs/test-runs/2026-11-21/ide-discovery-fix/artifacts.json) | 保存本次验证的入口、适配层、运行器及两个签名包 SHA-256；本次文档更新时已核对一致 |
| [注册函数完整性](docs/test-runs/2026-11-21/ide-discovery-fix/registration-check.json) | 原有 78 个注册函数及顺序保持一致 |
| [IDE 运行日志片段](docs/test-runs/2026-11-21/ide-discovery-fix/ide-success-hilog.log) | 运行期间抓取的设备日志，包含后续用例状态；这是片段，不作为全部逐例记录 |
| [历史分套回归](docs/test-runs/2026-11-21/final-pass/summary.json) | 此前 80 套分进程回归记录，不能代替本次 IDE 发现与启动验证 |
| [历史原命令回归](docs/test-runs/2026-11-21/ide-combined-round2/summary.json) | 此前命令行执行原 IDE 类列表的记录，与本次实际 IDE 操作区分 |

## 测试覆盖总结

- **覆盖对象**：短视频页面、六个视频源、播放策略、时间与进度换算、画面适配、数据源与监听器，以及真实 AVPlayer 的状态和释放操作。
- **覆盖层次**：74 个模型套件 5,576 条，1 个驱动契约套件 52 条，5 个应用/目录/媒体套件 14 条，共 80 套、5,642 条。
- **实际结果**：IDE 原配置 5,590 条通过，额外时钟 52 条通过；合计失败 0、错误 0、忽略 0，无删除或弱化用例。
- **适用限制**：播放结论依赖本次素材、服务、设备与平台；模型回归不能替代功耗、权限或性能基准测试。后续变更源码、SDK、Hypium 或设备环境时，需要重新执行相应验证。
