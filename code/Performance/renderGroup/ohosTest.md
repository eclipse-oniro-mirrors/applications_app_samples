# RenderGroup 测试用例归档

## 测试套件总览

| 分类 | 套件 | 用例数 | 主要覆盖与预期 |
|---|---|---:|---|
| 应用入口 | `RenderGroupAbility` | 15 | 菜单暴露 RenderGroup 路由，入口 Ability 进入前台，首页可返回，热启动保留当前路由与开关状态。 |
| 交互 | `RenderGroupInteraction` | 20 | 正反例入口、开关及返回支持相应的点击或坐标触摸，网格触摸保持当前开关状态。 |
| 网格布局 | `RenderGroupGrid` | 18 | 可见标签按行列排列、唯一且在有效范围内，切换和重建后内容正确，离开场景后标签消失。 |
| 生命周期 | `RenderGroupSceneLifecycle` | 13 | 前后台往返保留页面和开关状态，退出再进入时场景状态重置，正反例互不串扰。 |
| 稳定性 | `RenderGroupStability` | 6 | 反复导航和切换后网格、开关仍可用，UI 流程按队列顺序执行，前序失败后可继续导航。 |
| 资源校验 | `RenderGroupResources` | 29 | 安装包中的字符串、颜色、SVG 和布局关系符合预期，缺失资源按预期报错。 |
| 驱动队列 | `RenderGroupDriverQueue` | 5 | 串行队列保留返回值和错误，待处理任务按顺序推进，异常后仍可处理后续任务。 |
| 路由集成 | `RenderGroupRouteWorkflow` | 12 | 组合工具栏返回和系统返回，验证正反例切换、恢复前台和重新进入。 |
| 手势 | `RenderGroupGestures` | 16 | 正反例各覆盖开关两种状态，在网格执行长按、双击、横向或纵向滑动后，开关状态保持不变。 |
| 组合矩阵 | `RenderGroupMatrix01` | 32 | 组合场景、开关初态以及恢复、点击、触摸等动作，检查操作前后的场景、开关及网格内容。 |
| 组合矩阵 | `RenderGroupMatrix02` | 32 | 覆盖第二组操作组合，检查连续动作后的页面与网格状态。 |
| 绘制校验 | `RenderGroupPaint` | 32 | 正反例 × 开关两种初态 × 8 种流程，检查操作前后可见网格文字的实际绘制。 |
| 数值资源 | `RenderGroupNumbers` | 30 | 逐项比较安装包数值资源与布局期望值。 |
| **合计** | **13 个套件** | **260** | |

| 源码统计范围 | 文件数 | 物理行 | 去除空行和注释后 |
|---|---:|---:|---:|
| `.test.ets` 文件，含 `List.test.ets` | 14 | 3,361 | 3,071 |
| `ohosTest` 下所有 `.ets` 和 `.ts` 文件，含辅助代码与 Runner | 22 | 4,082 | 3,653 |

## 测试工程结构

```text
product/phone/entry/src/ohosTest/
├── module.json5
├── resources/
└── ets/
    ├── testability/
    ├── testrunner/OpenHarmonyTestRunner.ts
    ├── util/Logger.ets
    └── test/
        ├── List.test.ets
        ├── Ability.test.ets
        ├── Generated/              # 两个组合矩阵测试分片及生成索引
        ├── Integration/            # 路由联动测试与矩阵动作辅助代码
        ├── Interaction/            # 开关交互、网格、手势
        ├── LifecycleState/         # 场景与应用生命周期
        ├── PerformanceStability/   # 重复操作和队列稳定性
        ├── Shared/                 # UI 驱动封装及队列测试
        └── Validation/             # 资源、布局数值及绘制探测
```

### 套件注册

测试运行器通过 `List.test.ets` 注册 13 个套件。套件名取自 `describe()`，用例名取自 `it()`。完整清单按真机 `dryRun` 输出展开循环生成的名称。组合矩阵的两个分片由注册入口直接调用。[注册入口](product/phone/entry/src/ohosTest/ets/test/List.test.ets) · [测试运行器](product/phone/entry/src/ohosTest/ets/testrunner/OpenHarmonyTestRunner.ts)

### 测试辅助代码

| 文件 | 职责 |
|---|---|
| `Shared/SharedDriver.ets` | 复用 UI 驱动，串行组织页面操作，封装应用启动、页面定位、坐标触摸、开关状态、网格标签和前后台往返。 |
| `Integration/RenderGroupMatrixActions.ets` | 复用坐标切换、工具栏或系统返回后重进、跨场景往返和经入口页重新进入等操作。 |
| `Validation/RenderGroupPaintProbe.ets` | 定位可见标签区域并截屏，检查浅灰单元中深色文字像素是否达到阈值。 |

## 用例设计与覆盖

- 正例（`Profit`）和反例（`NonProfit`）在交互、手势、路由和绘制套件中分别测试。重建场景时检查开关复位，前后台往返时检查原状态保留。
- 网格用例检查可访问的标签、位置和可见范围。绘制用例通过截图像素判断可见网格中的文字是否实际绘制。
- 稳定性套件检查反复操作后的页面与控件行为。帧率、GPU 负载、缓存命中率和功耗需要单独采集性能数据。

## 构建与执行

在项目根目录运行以下命令。先在 DevEco Studio 配置与设备匹配的 SDK 和签名。运行 UI 用例时，设备需处于亮屏、解锁状态，主 HAP 与测试 HAP 需同时安装。

```powershell
hvigorw --mode module -p module=entry@default -p product=default assembleHap --no-daemon
hvigorw --mode module -p module=entry@ohosTest -p product=default assembleHap --no-daemon

hdc list targets
hdc install -r product/phone/entry/build/default/outputs/default/entry-default-signed.hap
hdc install -r product/phone/entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
```

在 DevEco Studio 中使用 `entry@ohosTest` 测试配置。核对真机注册清单时，在测试运行参数中指定：

```text
-s dryRun true
```

按套件执行时移除 `dryRun` 参数，使用 `-s class` 选择套件。以下参数选择驱动队列与资源套件，单例超时为 60 秒，命令等待上限为 1,800 秒：

```text
-s class RenderGroupDriverQueue,RenderGroupResources -s timeout 60000 -w 1800
```

替换 `-s class` 的值可运行指定套件，省略该选项可运行全量。运行结束后核对 `Tests run`、`Pass`、`Failure`、`Error` 和 `Ignore`。

## 完整用例清单

编号对应套件内的注册顺序。

### RenderGroupAbility（15 条）

[测试源码](product/phone/entry/src/ohosTest/ets/test/Ability.test.ets)

| 序号 | 用例名 |
|---:|---|
| 1 | `menuModelExposesRenderGroupRoute` |
| 2 | `entryAbilityStartsInForeground` |
| 3 | `indexRendersMenuModelLabel` |
| 4 | `warmLaunchPreservesHomeRoute` |
| 5 | `ProfitWarmLaunchPreservesDisabledScene` |
| 6 | `ProfitWarmLaunchPreservesEnabledScene` |
| 7 | `NonProfitWarmLaunchPreservesDisabledScene` |
| 8 | `NonProfitWarmLaunchPreservesEnabledScene` |
| 9 | `homeCanReturnToIndexWithToolbarBack` |
| 10 | `indexMenuCanOpenHomeByCoordinateTouch` |
| 11 | `homeToolbarCanReturnToIndexByCoordinateTouch` |
| 12 | `homeCanReturnToIndexWithSystemBack` |
| 13 | `bothSceneLinksRemainUsableAfterReturning` |
| 14 | `homeSceneLinksExposeDistinctLabelsAndTouchTargets` |
| 15 | `sceneHomeCanBeOpenedAgainAfterSystemBack` |

### RenderGroupInteraction（20 条）

[测试源码](product/phone/entry/src/ohosTest/ets/test/Interaction/RenderGroupInteraction.test.ets)

| 序号 | 用例名 |
|---:|---|
| 1 | `ProfitHomeLinkCanBeOpenedByCoordinateTouch` |
| 2 | `ProfitShowsEnabledSwitchAndBackTarget` |
| 3 | `ProfitSwitchCanBeEnabledByTouch` |
| 4 | `ProfitSwitchCanBeDisabledByComponentClick` |
| 5 | `ProfitSwitchCanBeDisabledByTouch` |
| 6 | `ProfitGridTouchPreservesDisabledState` |
| 7 | `ProfitGridTouchPreservesEnabledState` |
| 8 | `ProfitSwitchLabelChangePreservesTouchTarget` |
| 9 | `ProfitTouchBackLeavesEnabledScene` |
| 10 | `ProfitSystemBackLeavesDisabledScene` |
| 11 | `NonProfitHomeLinkCanBeOpenedByCoordinateTouch` |
| 12 | `NonProfitShowsEnabledSwitchAndBackTarget` |
| 13 | `NonProfitSwitchCanBeEnabledByTouch` |
| 14 | `NonProfitSwitchCanBeDisabledByComponentClick` |
| 15 | `NonProfitSwitchCanBeDisabledByTouch` |
| 16 | `NonProfitGridTouchPreservesDisabledState` |
| 17 | `NonProfitGridTouchPreservesEnabledState` |
| 18 | `NonProfitSwitchLabelChangePreservesTouchTarget` |
| 19 | `NonProfitTouchBackLeavesEnabledScene` |
| 20 | `NonProfitSystemBackLeavesDisabledScene` |

### RenderGroupGrid（18 条）

[测试源码](product/phone/entry/src/ohosTest/ets/test/Interaction/RenderGroupGrid.test.ets)

| 序号 | 用例名 |
|---:|---|
| 1 | `ProfitDisplaysFirstResourceCycle` |
| 2 | `ProfitFirstItemsAreInAscendingColumnOrder` |
| 3 | `ProfitContinuesItemLabelsOnSecondRow` |
| 4 | `ProfitDoesNotRenderZeroBasedItem` |
| 5 | `ProfitTogglePreservesFirstRowContent` |
| 6 | `ProfitRecreationDoesNotDuplicateVisibleLabels` |
| 7 | `ProfitExposedGridLabelsStayUniqueAndInRangeAcrossToggle` |
| 8 | `ProfitReturningHomeRemovesAllExposedGridLabels` |
| 9 | `ProfitSwitchAndGridRemainSeparatedAfterToggle` |
| 10 | `NonProfitDisplaysFirstResourceCycle` |
| 11 | `NonProfitFirstItemsAreInAscendingColumnOrder` |
| 12 | `NonProfitContinuesItemLabelsOnSecondRow` |
| 13 | `NonProfitDoesNotRenderZeroBasedItem` |
| 14 | `NonProfitTogglePreservesFirstRowContent` |
| 15 | `NonProfitRecreationDoesNotDuplicateVisibleLabels` |
| 16 | `NonProfitExposedGridLabelsStayUniqueAndInRangeAcrossToggle` |
| 17 | `NonProfitReturningHomeRemovesAllExposedGridLabels` |
| 18 | `NonProfitSwitchAndGridRemainSeparatedAfterToggle` |

### RenderGroupSceneLifecycle（13 条）

[测试源码](product/phone/entry/src/ohosTest/ets/test/LifecycleState/RenderGroupSceneLifecycle.test.ets)

| 序号 | 用例名 |
|---:|---|
| 1 | `profitStateDoesNotLeakIntoNonProfit` |
| 2 | `nonProfitStateDoesNotLeakIntoProfit` |
| 3 | `ProfitSystemBackResetsEnabledStateOnReentry` |
| 4 | `ProfitNewRouteAfterReturningToIndexStartsDisabled` |
| 5 | `ProfitForegroundRestoresActiveSceneAndFlag` |
| 6 | `ProfitForegroundPreservesDisabledScene` |
| 7 | `NonProfitSystemBackResetsEnabledStateOnReentry` |
| 8 | `NonProfitNewRouteAfterReturningToIndexStartsDisabled` |
| 9 | `NonProfitForegroundRestoresActiveSceneAndFlag` |
| 10 | `NonProfitForegroundPreservesDisabledScene` |
| 11 | `homeRouteSurvivesBackgroundRoundTrip` |
| 12 | `indexRouteSurvivesBackgroundRoundTrip` |
| 13 | `bothScenesCanBeRevisitedThroughACompleteHomeRoundTrip` |

### RenderGroupStability（6 条）

[测试源码](product/phone/entry/src/ohosTest/ets/test/PerformanceStability/RenderGroupStability.test.ets)

| 序号 | 用例名 |
|---:|---|
| 1 | `ProfitRepeatedTogglesPreserveGridAndSingleSwitch` |
| 2 | `ProfitRepeatedNavigationDoesNotAccumulateState` |
| 3 | `NonProfitRepeatedTogglesPreserveGridAndSingleSwitch` |
| 4 | `NonProfitRepeatedNavigationDoesNotAccumulateState` |
| 5 | `queuedWorkflowsOperateOnSeparateScenesInOrder` |
| 6 | `rejectedQueueWorkDoesNotBlockRealNavigation` |

### RenderGroupResources（29 条）

[测试源码](product/phone/entry/src/ohosTest/ets/test/Validation/RenderGroupResources.test.ets)

| 序号 | 用例名 |
|---:|---|
| 1 | `packagedHomeTitleFitsItsLineAndToolbar` |
| 2 | `packagedSceneTitleFitsItsLineAndToolbar` |
| 3 | `packagedCircularItemRadiusMatchesBothDimensions` |
| 4 | `RenderGroupHomePage_titleResolvesFromEntry` |
| 5 | `RenderGroup_profit_scene_button_titleResolvesFromEntry` |
| 6 | `RenderGroup_nonProfit_scene_button_titleResolvesFromEntry` |
| 7 | `RenderGroup_profit_scene_titleResolvesFromEntry` |
| 8 | `RenderGroup_nonProfit_scene_titleResolvesFromEntry` |
| 9 | `RenderGroup_button_onResolvesFromEntry` |
| 10 | `RenderGroup_button_offResolvesFromEntry` |
| 11 | `layout_100_percentResolvesFromEntry` |
| 12 | `layout_17_percentResolvesFromEntry` |
| 13 | `RenderGroup_item_text_fontColorResolvesToExpectedArgb` |
| 14 | `RenderGroup_item_backgroundColorResolvesToExpectedArgb` |
| 15 | `RenderGroup_scene_button_backgroundColorResolvesToExpectedArgb` |
| 16 | `missingColorDoesNotFallBackToGridBackground` |
| 17 | `missingStringDoesNotFallBackToSwitchLabel` |
| 18 | `missingNumberDoesNotFallBackToGridCellHeight` |
| 19 | `missingMediaRejectsWithoutInvalidatingPackagedBackIcon` |
| 20 | `backSvgDecodesToExpectedDimensions` |
| 21 | `albumSvgDecodesToExpectedDimensions` |
| 22 | `appletSvgDecodesToExpectedDimensions` |
| 23 | `cardsSvgDecodesToExpectedDimensions` |
| 24 | `nearbySvgDecodesToExpectedDimensions` |
| 25 | `scanSvgDecodesToExpectedDimensions` |
| 26 | `shopSvgDecodesToExpectedDimensions` |
| 27 | `packagedGridCellFitsIconContent` |
| 28 | `packagedToolbarFitsSwitchAndBackImage` |
| 29 | `packagedIconWidthFitsItemAndText` |

### RenderGroupDriverQueue（5 条）

[测试源码](product/phone/entry/src/ohosTest/ets/test/Shared/RenderGroupDriverQueue.test.ets)

| 序号 | 用例名 |
|---:|---|
| 1 | `queueReturnsWorkflowResultUnchanged` |
| 2 | `queueWaitsForPendingWorkflowBeforeStartingNext` |
| 3 | `queuePropagatesOriginalFailureAndRunsFollowingWorkflow` |
| 4 | `queueRecoversAfterSynchronousActionThrows` |
| 5 | `queueRunsWorkEnqueuedInsideAnActionAfterExistingWaiters` |

### RenderGroupRouteWorkflow（12 条）

[测试源码](product/phone/entry/src/ohosTest/ets/test/Integration/RenderGroupRouteWorkflow.test.ets)

| 序号 | 用例名 |
|---:|---|
| 1 | `ProfitReturnsViaToolbarThenToolbarAndReopensBothRoutes` |
| 2 | `ProfitReturnsViaToolbarThenSystemAndReopensBothRoutes` |
| 3 | `ProfitReturnsViaSystemThenToolbarAndReopensBothRoutes` |
| 4 | `ProfitReturnsViaSystemThenSystemAndReopensBothRoutes` |
| 5 | `ProfitBackgroundedAfterCoordinateToggleCanStillReturnByTouch` |
| 6 | `ProfitRestoresHomeAfterVisitingOtherSceneAndReopensOriginalRoute` |
| 7 | `NonProfitReturnsViaToolbarThenToolbarAndReopensBothRoutes` |
| 8 | `NonProfitReturnsViaToolbarThenSystemAndReopensBothRoutes` |
| 9 | `NonProfitReturnsViaSystemThenToolbarAndReopensBothRoutes` |
| 10 | `NonProfitReturnsViaSystemThenSystemAndReopensBothRoutes` |
| 11 | `NonProfitBackgroundedAfterCoordinateToggleCanStillReturnByTouch` |
| 12 | `NonProfitRestoresHomeAfterVisitingOtherSceneAndReopensOriginalRoute` |

### RenderGroupGestures（16 条）

[测试源码](product/phone/entry/src/ohosTest/ets/test/Interaction/RenderGroupGestures.test.ets)

| 序号 | 用例名 |
|---:|---|
| 1 | `ProfitGridLongPressPreservesDisabledState` |
| 2 | `ProfitGridDoubleTapPreservesDisabledState` |
| 3 | `ProfitGridHorizontalSwipePreservesDisabledState` |
| 4 | `ProfitGridVerticalSwipePreservesDisabledState` |
| 5 | `ProfitGridLongPressPreservesEnabledState` |
| 6 | `ProfitGridDoubleTapPreservesEnabledState` |
| 7 | `ProfitGridHorizontalSwipePreservesEnabledState` |
| 8 | `ProfitGridVerticalSwipePreservesEnabledState` |
| 9 | `NonProfitGridLongPressPreservesDisabledState` |
| 10 | `NonProfitGridDoubleTapPreservesDisabledState` |
| 11 | `NonProfitGridHorizontalSwipePreservesDisabledState` |
| 12 | `NonProfitGridVerticalSwipePreservesDisabledState` |
| 13 | `NonProfitGridLongPressPreservesEnabledState` |
| 14 | `NonProfitGridDoubleTapPreservesEnabledState` |
| 15 | `NonProfitGridHorizontalSwipePreservesEnabledState` |
| 16 | `NonProfitGridVerticalSwipePreservesEnabledState` |

### RenderGroupMatrix01（32 条）

[测试源码](product/phone/entry/src/ohosTest/ets/test/Generated/RenderGroupMatrix01.test.ets)

| 序号 | 用例名 |
|---:|---|
| 1 | `MatrixProfitOff_Click_Resume_Click` |
| 2 | `MatrixProfitOff_Touch_Resume_Touch` |
| 3 | `MatrixProfitOff_Click_Grid_Touch` |
| 4 | `MatrixProfitOff_Touch_Grid_Click` |
| 5 | `MatrixProfitOff_Resume_Click_Resume` |
| 6 | `MatrixProfitOff_Resume_Touch_Resume` |
| 7 | `MatrixProfitOff_Grid_Click_Grid` |
| 8 | `MatrixProfitOff_Grid_Touch_Grid` |
| 9 | `MatrixProfitOff_Toolbar_Click_Resume` |
| 10 | `MatrixProfitOff_Back_Touch_Resume` |
| 11 | `MatrixProfitOff_Cross_Click_Resume` |
| 12 | `MatrixProfitOff_Index_Touch_Resume` |
| 13 | `MatrixProfitOff_Click_Toolbar_Touch` |
| 14 | `MatrixProfitOff_Touch_Back_Click` |
| 15 | `MatrixProfitOff_Click_Cross_Touch` |
| 16 | `MatrixProfitOff_Touch_Index_Click` |
| 17 | `MatrixProfitOn_Click_Resume_Click` |
| 18 | `MatrixProfitOn_Touch_Resume_Touch` |
| 19 | `MatrixProfitOn_Click_Grid_Touch` |
| 20 | `MatrixProfitOn_Touch_Grid_Click` |
| 21 | `MatrixProfitOn_Resume_Click_Resume` |
| 22 | `MatrixProfitOn_Resume_Touch_Resume` |
| 23 | `MatrixProfitOn_Grid_Click_Grid` |
| 24 | `MatrixProfitOn_Grid_Touch_Grid` |
| 25 | `MatrixProfitOn_Toolbar_Click_Resume` |
| 26 | `MatrixProfitOn_Back_Touch_Resume` |
| 27 | `MatrixProfitOn_Cross_Click_Resume` |
| 28 | `MatrixProfitOn_Index_Touch_Resume` |
| 29 | `MatrixProfitOn_Click_Toolbar_Touch` |
| 30 | `MatrixProfitOn_Touch_Back_Click` |
| 31 | `MatrixProfitOn_Click_Cross_Touch` |
| 32 | `MatrixProfitOn_Touch_Index_Click` |

### RenderGroupMatrix02（32 条）

[测试源码](product/phone/entry/src/ohosTest/ets/test/Generated/RenderGroupMatrix02.test.ets)

| 序号 | 用例名 |
|---:|---|
| 1 | `MatrixNonProfitOff_Click_Resume_Click` |
| 2 | `MatrixNonProfitOff_Touch_Resume_Touch` |
| 3 | `MatrixNonProfitOff_Click_Grid_Touch` |
| 4 | `MatrixNonProfitOff_Touch_Grid_Click` |
| 5 | `MatrixNonProfitOff_Resume_Click_Resume` |
| 6 | `MatrixNonProfitOff_Resume_Touch_Resume` |
| 7 | `MatrixNonProfitOff_Grid_Click_Grid` |
| 8 | `MatrixNonProfitOff_Grid_Touch_Grid` |
| 9 | `MatrixNonProfitOff_Toolbar_Click_Resume` |
| 10 | `MatrixNonProfitOff_Back_Touch_Resume` |
| 11 | `MatrixNonProfitOff_Cross_Click_Resume` |
| 12 | `MatrixNonProfitOff_Index_Touch_Resume` |
| 13 | `MatrixNonProfitOff_Click_Toolbar_Touch` |
| 14 | `MatrixNonProfitOff_Touch_Back_Click` |
| 15 | `MatrixNonProfitOff_Click_Cross_Touch` |
| 16 | `MatrixNonProfitOff_Touch_Index_Click` |
| 17 | `MatrixNonProfitOn_Click_Resume_Click` |
| 18 | `MatrixNonProfitOn_Touch_Resume_Touch` |
| 19 | `MatrixNonProfitOn_Click_Grid_Touch` |
| 20 | `MatrixNonProfitOn_Touch_Grid_Click` |
| 21 | `MatrixNonProfitOn_Resume_Click_Resume` |
| 22 | `MatrixNonProfitOn_Resume_Touch_Resume` |
| 23 | `MatrixNonProfitOn_Grid_Click_Grid` |
| 24 | `MatrixNonProfitOn_Grid_Touch_Grid` |
| 25 | `MatrixNonProfitOn_Toolbar_Click_Resume` |
| 26 | `MatrixNonProfitOn_Back_Touch_Resume` |
| 27 | `MatrixNonProfitOn_Cross_Click_Resume` |
| 28 | `MatrixNonProfitOn_Index_Touch_Resume` |
| 29 | `MatrixNonProfitOn_Click_Toolbar_Touch` |
| 30 | `MatrixNonProfitOn_Touch_Back_Click` |
| 31 | `MatrixNonProfitOn_Click_Cross_Touch` |
| 32 | `MatrixNonProfitOn_Touch_Index_Click` |

### RenderGroupPaint（32 条）

[测试源码](product/phone/entry/src/ohosTest/ets/test/Validation/RenderGroupPaint.test.ets)

| 序号 | 用例名 |
|---:|---|
| 1 | `ProfitPaintInitialFromDisabled` |
| 2 | `ProfitPaintComponentToggleFromDisabled` |
| 3 | `ProfitPaintCoordinateToggleFromDisabled` |
| 4 | `ProfitPaintForegroundRestoreFromDisabled` |
| 5 | `ProfitPaintToolbarRecreateFromDisabled` |
| 6 | `ProfitPaintSystemRecreateFromDisabled` |
| 7 | `ProfitPaintCrossSceneFromDisabled` |
| 8 | `ProfitPaintIndexRecreateFromDisabled` |
| 9 | `ProfitPaintInitialFromEnabled` |
| 10 | `ProfitPaintComponentToggleFromEnabled` |
| 11 | `ProfitPaintCoordinateToggleFromEnabled` |
| 12 | `ProfitPaintForegroundRestoreFromEnabled` |
| 13 | `ProfitPaintToolbarRecreateFromEnabled` |
| 14 | `ProfitPaintSystemRecreateFromEnabled` |
| 15 | `ProfitPaintCrossSceneFromEnabled` |
| 16 | `ProfitPaintIndexRecreateFromEnabled` |
| 17 | `NonProfitPaintInitialFromDisabled` |
| 18 | `NonProfitPaintComponentToggleFromDisabled` |
| 19 | `NonProfitPaintCoordinateToggleFromDisabled` |
| 20 | `NonProfitPaintForegroundRestoreFromDisabled` |
| 21 | `NonProfitPaintToolbarRecreateFromDisabled` |
| 22 | `NonProfitPaintSystemRecreateFromDisabled` |
| 23 | `NonProfitPaintCrossSceneFromDisabled` |
| 24 | `NonProfitPaintIndexRecreateFromDisabled` |
| 25 | `NonProfitPaintInitialFromEnabled` |
| 26 | `NonProfitPaintComponentToggleFromEnabled` |
| 27 | `NonProfitPaintCoordinateToggleFromEnabled` |
| 28 | `NonProfitPaintForegroundRestoreFromEnabled` |
| 29 | `NonProfitPaintToolbarRecreateFromEnabled` |
| 30 | `NonProfitPaintSystemRecreateFromEnabled` |
| 31 | `NonProfitPaintCrossSceneFromEnabled` |
| 32 | `NonProfitPaintIndexRecreateFromEnabled` |

### RenderGroupNumbers（30 条）

[测试源码](product/phone/entry/src/ohosTest/ets/test/Validation/RenderGroupNumbers.test.ets)

| 序号 | 用例名 |
|---:|---|
| 1 | `RenderGroup_item_image_heightPackagedNumberMatchesLayoutContract` |
| 2 | `RenderGroup_item_image_widthPackagedNumberMatchesLayoutContract` |
| 3 | `RenderGroup_item_image_marginPackagedNumberMatchesLayoutContract` |
| 4 | `RenderGroup_item_text_fontPackagedNumberMatchesLayoutContract` |
| 5 | `RenderGroup_item_text_margin_topPackagedNumberMatchesLayoutContract` |
| 6 | `RenderGroup_item_text_widthPackagedNumberMatchesLayoutContract` |
| 7 | `RenderGroup_item_widthPackagedNumberMatchesLayoutContract` |
| 8 | `RenderGroup_item_heightPackagedNumberMatchesLayoutContract` |
| 9 | `RenderGroup_item_borderRadiusPackagedNumberMatchesLayoutContract` |
| 10 | `RenderGroup_scene_back_image_sizePackagedNumberMatchesLayoutContract` |
| 11 | `RenderGroup_scene_title_fontPackagedNumberMatchesLayoutContract` |
| 12 | `RenderGroup_scene_title_lineHeightPackagedNumberMatchesLayoutContract` |
| 13 | `RenderGroup_scene_title_margin_leftPackagedNumberMatchesLayoutContract` |
| 14 | `RenderGroup_scene_row_margin_leftPackagedNumberMatchesLayoutContract` |
| 15 | `RenderGroup_scene_button_fontSizePackagedNumberMatchesLayoutContract` |
| 16 | `RenderGroup_scene_button_borderRadiusPackagedNumberMatchesLayoutContract` |
| 17 | `RenderGroup_scene_title_button_widthPackagedNumberMatchesLayoutContract` |
| 18 | `RenderGroup_scene_title_button_heightPackagedNumberMatchesLayoutContract` |
| 19 | `RenderGroup_scene_button_margin_rightPackagedNumberMatchesLayoutContract` |
| 20 | `RenderGroup_scene_title_row_heightPackagedNumberMatchesLayoutContract` |
| 21 | `RenderGroup_scene_GridCol_heightPackagedNumberMatchesLayoutContract` |
| 22 | `RenderGroupHomePage_title_fontPackagedNumberMatchesLayoutContract` |
| 23 | `RenderGroupHomePage_title_lineHeightPackagedNumberMatchesLayoutContract` |
| 24 | `RenderGroupHomePage_title_heightPackagedNumberMatchesLayoutContract` |
| 25 | `RenderGroupHomePage_row_heightPackagedNumberMatchesLayoutContract` |
| 26 | `RenderGroup_scene_button_fontPackagedNumberMatchesLayoutContract` |
| 27 | `RenderGroup_scene_button_widthPackagedNumberMatchesLayoutContract` |
| 28 | `RenderGroup_scene_button_heightPackagedNumberMatchesLayoutContract` |
| 29 | `RenderGroup_scene_button_margin_topPackagedNumberMatchesLayoutContract` |
| 30 | `RenderGroup_scene_row_heightPackagedNumberMatchesLayoutContract` |
