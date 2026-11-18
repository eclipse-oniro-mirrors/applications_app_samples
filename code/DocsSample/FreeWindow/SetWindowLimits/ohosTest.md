# SetWindowLimits 测试用例归档

## 用例表（手工）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|------|------|------|------|------|------|
| 拉起应用显示主页 | 位于只有一个应用的空白页 | 1、打开应用，进入示例主页 | 应用启动成功，主页正常显示"setWindowLimits."文字 | 是 | Pass |
| 窗口尺寸约束生效 | 位于只有一个应用的空白页 | 1、打开应用，应用启动时完成 setWindowLimits 调用<br/>2、在自由窗口状态下拖拽调整窗口大小 | 窗口宽度、高度保持在 setWindowLimits 配置的范围内（宽度 600px~1500px，高度 500px~1000px） | 是 | Pass |

### 使用说明

自由窗口尺寸约束相关用例仅在支持自由窗口的设备（如 2in1、平板）上通过，普通手机仅通过页面展示类用例；在不支持窗口尺寸限制的设备上，API 用例断言返回 801 等预期错误。

## 自动化用例统计

| 测试文件 | 用例数 | 说明 |
|---|---:|---|
| `Ability.test.ets` | 2 | 启动应用、窗口尺寸约束（UiTest） |
| `WindowLimitsUi.test.ets` | 341 | 标题/布局/窗口 bounds、顶层 Ability、重启与重复启动、292 组缩放场景矩阵（含边界值、等价类、极端宽高比、扫描、两步缩放、偏移边界）、49 组缩放时序与序列 |
| `WindowLimitsApi.test.ets` | 530 | 基础 47 条（含异步/并发/时序/字段组合/回读）、483 组参数矩阵（边界值/等价类/特殊数值/精度/倒置/偏移边界）、恢复 |
| **ohosTest 合计** | **873** | |
| `entry/src/test/LocalUnit.test.ets` | 100 | 本地单元测试：字段构造、缺省/显式 undefined、边界值、特殊数值、大整数/精度、倒置与快照 |

## 一、Ability.test.ets（2 条）

| 用例编号 | 用例名 | 测试点 | 预期输出 | 测试结果 |
|---|---|---|---|---|
| SUB_WINDOW_SET_WINDOW_LIMITS_0100 | testSetWindowLimitsStartAbility0001 | 启动应用，顶层 Ability 为 EntryAbility，主页显示 "setWindowLimits." | 断言通过 | Pass |
| SUB_WINDOW_SET_WINDOW_LIMITS_0200 | testSetWindowLimitsBounds0001 | 拖拽放大/缩小窗口，窗口尺寸受 setWindowLimits 限制 | 放大后宽高小于 20000，缩小后宽高大于 100；不支持缩放时命中预期错误 | Pass |

## 二、WindowLimitsUi.test.ets（326 条）

### 页面与窗口基础校验（1001-1008）

| 用例编号 | 用例名 | 测试点 | 预期输出 | 测试结果 |
|---|---|---|---|---|
| 1001 | testMainPageTitle1001 | 按 id `messageText` 获取标题文本 | 文本等于 "setWindowLimits." | Pass |
| 1002 | testTitleComponent1002 | 标题组件存在且文本非空 | 组件非空、文本长度大于 0 | Pass |
| 1003 | testTitleLayoutBounds1003 | 标题组件布局宽高 | 宽、高均大于 0 | Pass |
| 1004 | testAppWindowBounds1004 | 应用窗口 bounds | 宽、高均大于 0 | Pass |
| 1005 | testTopAbility1005 | 当前顶层 Ability | 名称为 EntryAbility | Pass |
| 1006 | testRestartShowTitle1006 | 连续拉起应用后标题 | 标题正常显示 | Pass |
| 1007 | testRepeatedLaunch1007 | 连续 3 次拉起应用 | 每次标题正常显示 | Pass |
| 1008 | testTitleAfterResize1008 | 缩放窗口后标题 | 标题仍正常显示 | Pass |

### 缩放时序用例（1030-1070）

| 用例编号 | 用例名 | 测试点 | 预期输出 | 测试结果 |
|---|---|---|---|---|
| 1030 | testTitleAfterTwoResizes1030 | 连续两次缩放后标题 | 标题正常显示 | Pass |
| 1031 | testTopAbilityAfterResize1031 | 缩放后顶层 Ability | 仍为 EntryAbility | Pass |
| 1032 | testWindowBoundsAfterResize1032 | 缩放后窗口 bounds | 宽、高均大于 0 | Pass |
| 1033 | testResizeSameSize1033 | 相同尺寸连续缩放两次 | 页面稳定、标题正常 | Pass |
| 1034 | testGrowThenShrink1034 | 先放大到 max 再缩小到 min | 页面稳定、标题正常 | Pass |
| 1035 | testShrinkThenGrow1035 | 先缩小到 min 再放大到 max | 页面稳定、标题正常 | Pass |
| 1036 | testGrowThreeSteps1036 | 分 3 步放大到 max | 标题正常 | Pass |
| 1037 | testShrinkThreeSteps1037 | 分 3 步缩小到 min | 标题正常 | Pass |
| 1038 | testGrowMaxThenMin1038 | 放到最大再缩到最小 | 页面稳定 | Pass |
| 1039 | testFiveAlternatingResizes1039 | 5 次交替缩放 | 页面稳定 | Pass |
| 1040 | testSameSizeTwice1040 | 相同尺寸连续两次 | 页面稳定 | Pass |
| 1041 | testRestartAfterResize1041 | 缩放后重启应用 | 标题正常 | Pass |
| 1042 | testTopAbilityAfterTwoResizes1042 | 两次缩放后顶层 Ability | 仍为 EntryAbility | Pass |
| 1043 | testTitleAfterResizeMin1043 | 缩到最小后标题 | 标题正常 | Pass |
| 1044 | testTitleAfterResizeMax1044 | 放到最大后标题 | 标题正常 | Pass |
| 1045 | testWindowBoundsAfterFiveResizes1045 | 连续 5 次缩放后 bounds | 宽、高均大于 0 | Pass |
| 1046 | testResizeSmallSteps1046 | 下限附近小步缩放 4 次 | 标题正常 | Pass |
| 1047 | testResizeLargeSteps1047 | 上限附近小步缩放 4 次 | 标题正常 | Pass |
| 1048 | testResizeTriangle1048 | 三角形路径缩放 4 步 | 页面稳定 | Pass |
| 1049 | testResizeDiagonal1049 | 对角线路径缩放 5 步 | 标题正常 | Pass |
| 1050 | testResizeAmplitude1050 | 最大/最小交替 5 次 | 页面稳定 | Pass |
| 1051 | testResizeWidthOnly1051 | 仅改变宽度 5 次 | 标题正常 | Pass |
| 1052 | testResizeHeightOnly1052 | 仅改变高度 5 次 | 标题正常 | Pass |
| 1053 | testResizeReverseDiagonal1053 | 反斜对角线缩放 5 步 | 标题正常 | Pass |
| 1054 | testResizeAndLaunch1054 | 缩放后再次拉起应用 3 轮 | 标题正常 | Pass |
| 1055 | testResizeBoundsCheck1055 | 连续缩放 10 次后 bounds | 宽高在限制内 | Pass |
| 1056-1057 | testResizeStepUp1056 等 | 5 步放大/5 步缩小 | 标题正常 | Pass |
| 1058-1059 | testResizeZigZag1058 等 | Z 字形/3x3 网格缩放 | 页面稳定 | Pass |
| 1060-1061 | testResizeBoundaryWalk1060 等 | 宽/高边界遍历 | 标题正常 | Pass |
| 1062-1063 | testResizeThenRestartTwice1062 等 | 缩放后重启两次/5 次缩放后顶层 Ability | 标题与 Ability 正确 | Pass |
| 1064-1065 | testResizeButtonBounds1064 等 | 缩放后组件 bounds/10 次缩放后标题 | bounds 正常、标题正常 | Pass |
| 1066-1067 | testResizeCornersLoop1066 等 | 四角缩放/居中尺寸 | 标题正常 | Pass |
| 1068-1069 | testResizeWidthSweepFour1068 等 | 宽/高扫描各 4 次 | 标题正常 | Pass |
| 1070 | testResizeRestoreState1070 | 缩放后恢复初始尺寸 | 标题正常 | Pass |

### 窗口缩放场景矩阵（1010-1021、1040-1069、1070-1099、1100-1119、1120-1319，共 292 条）

| 用例范围 | 覆盖维度 | 预期输出 |
|---|---|---|
| 1010-1021 | 范围内、超上限/下限、单边超限 | 宽高被限制或设备不支持缩放 |
| 1040-1069 | 范围内/边界/单边超限/超下限（共 30 组） | 同上 |
| 1070-1099 | 600x600 ~ 1800x1800（30 组） | 同上 |
| 1100-1105 | **宽度边界值**：599、600、601、1499、1500、1501 | 599 归入下限、1501 归入上限，或设备不支持缩放 |
| 1106-1111 | **高度边界值**：499、500、501、999、1000、1001 | 499 归入下限、1001 归入上限，或设备不支持缩放 |
| 1112-1119 | **四角边界组合** | 按对应边界限制，或设备不支持缩放 |
| 1120-1127 | **极端宽高比**：1x1000、1000x1、1x20000、20000x1、100x2000、2000x100、300x1500、1500x300 | 按对应边界限制或设备不支持缩放 |
| 1128-1131 | **极小尺寸**：1x1、2x2、10x500、500x10 | 宽高被限制或设备不支持缩放 |
| 1132-1134 | **超大尺寸**：5000x5000、10000x10000、20000x10000 | 宽高被限制或设备不支持缩放 |
| 1135-1149 | **等价类混合**：700x700 ~ 1500x1200 共 15 组 | 按尺寸限制或设备不支持缩放 |
| 1150-1159 | **宽度扫描**：620~1430，步长 90（高度固定 750） | 按尺寸限制或设备不支持缩放 |
| 1160-1169 | **高度扫描**：520~970，步长 50（宽度固定 1000） | 按尺寸限制或设备不支持缩放 |
| 1170-1179 | **正方形扫描**：620~1340，步长 80 | 超高度上限时按上限限制，或设备不支持缩放 |
| 1180-1189 | **边界/中心组合**：600x500、1500x1000、601x501、1499x999 等 10 组 | 按对应边界限制，或设备不支持缩放 |
| 1190-1199 | **两步缩放**：中间尺寸→目标尺寸 10 组 | 最终尺寸受限，或设备不支持缩放 |
| 1200-1214 | **宽度扫描 2**：610~1380，步长 55（高度固定 750） | 按尺寸限制或设备不支持缩放 |
| 1215-1229 | **高度扫描 2**：510~972，步长 33（宽度固定 1000） | 按尺寸限制或设备不支持缩放 |
| 1230-1244 | **正方形扫描 2**：610~1380，步长 55 | 超高度上限时按上限限制，或设备不支持缩放 |
| 1245-1259 | **偏移边界**：598/599/601/602、1498/1502 组合 15 组 | 按对应边界限制，或设备不支持缩放 |
| 1260-1274 | **宽度扫描 3**：615~1441，步长 59（高度固定 750） | 按尺寸限制或设备不支持缩放 |
| 1275-1289 | **高度扫描 3**：510~986，步长 34（宽度固定 1000） | 按尺寸限制或设备不支持缩放 |
| 1290-1309 | **正方形扫描 3**：605~1175，步长 30 | 超高度上限时按上限限制，或设备不支持缩放 |
| 1310-1319 | **四角/中心组合**：四角、±1、中心共 10 组 | 按对应边界限制，或设备不支持缩放 |

## 三、WindowLimitsApi.test.ets（530 条）

### 基础与异步/并发用例（0001-0009、0072-0079、0080-0086、0090、0091-0095、0096-0103、0441-0444）

| 用例编号 | 用例名 | 测试点 | 预期输出 | 测试结果 |
|---|---|---|---|---|
| 0001-0009 | testGetWindowLimits0001 等 | 获取、合法设置回读、重复、forcible、递增/递减序列、合法/非法交替、仅 max 回读、空对象 | 成功时返回有效限制；失败时命中预期错误码 | Pass |
| 0080-0081 | testSetLimitsPromise0080 / testSetLimitsForciblePromise0081 | Promise / forcible Promise 重载 | 请求被处理 | Pass |
| 0082 | testSetLimitsConcurrent0082 | 2 个请求并发 | 两个请求均被处理 | Pass |
| 0083 | testSetLimitsInterleavedGet0083 | 设置与回读逐步交替 | 每一步回读有效或设备不支持 | Pass |
| 0084 | testSetLimitsRapidRepeat0084 | 相同限制快速设置 5 次 | 结果稳定一致 | Pass |
| 0085 | testGetLimitsTwice0085 | 连续读取两次 | 两次结果一致或设备不支持 | Pass |
| 0086 | testSetLimitsNonMonotonic0086 | 非单调限制序列 | 每一步均被接受 | Pass |
| 0441-0442 | testSetLimitsConcurrentThree0441 / Five0442 | 3 路/5 路并发 | 所有请求均被处理 | Pass |
| 0443 | testSetGetInterleavedFive0443 | set/get 交替 5 步 | 每一步回读有效或设备不支持 | Pass |
| 0444 | testForcibleAfterInvalid0444 | 非法后 forcible 合法设置 | 两次请求均被处理 | Pass |
| 0090 | testRestoreOriginalLimits0090 | 恢复测试前限制 | 请求被接受或设备不支持 | Pass |
| 0091 | testSetLimitsPresenceSubsets0091 | 15 种非空字段组合逐项设置 | 每一步均被处理 | Pass |
| 0092 | testSetLimitsFullRamp0092 | 放大到 max 再缩小回原值（5 步） | 每一步均被处理 | Pass |
| 0093 | testSetLimitsRapidTen0093 | 快速设置 10 种限制 | 每一步均被处理、末尾回读有效 | Pass |
| 0094 | testSetLimitsConcurrentTen0094 | 10 路并发设置 | 10 个请求均被处理 | Pass |
| 0095 | testSetGetInterleavedTen0095 | set/get 交替 10 步 | 每一步回读有效或设备不支持 | Pass |
| 0072 | testSetLimitsReadbackEquality0072 | 设置后回读一致性 | 回读有效或设备不支持 | Pass |
| 0073 | testSetLimitsSameTwice0073 | 相同限制设置两次 | 两次结果一致 | Pass |
| 0074 | testSetLimitsForcibleInvalidOnly0074 | 仅非法 forcible 限制 | 请求被处理 | Pass |
| 0075 | testGetLimitsThreeTimes0075 | 连续读取三次 | 三次结果一致或设备不支持 | Pass |
| 0076 | testSetEmptyAfterValid0076 | 合法后设置空对象 | 两次请求均被处理 | Pass |
| 0077 | testSetLimitsZeros0077 | 全 0 限制后恢复 | 请求均被处理 | Pass |
| 0078 | testSetLimitsMaxSafe0078 | MAX_SAFE_INTEGER 后恢复 | 请求均被处理 | Pass |
| 0079 | testRestoreLoop0079 | 恢复原始限制 3 次 | 每次均被处理 | Pass |
| 0096 | testSetLimitsReadbackLoop0096 | 5 种限制逐项设置并回读 | 每次回读有效或设备不支持 | Pass |
| 0097 | testSetLimitsForcibleZeros0097 | forcible 全 0 后恢复 | 请求均被处理 | Pass |
| 0098 | testSetLimitsMaxBounds0098 | 配置最大边界 | 结果有效 | Pass |
| 0099 | testSetLimitsEqualBounds0099 | 等值上下限 900x700 | 请求被处理 | Pass |
| 0100 | testSetLimitsBackToBack0100 | 连续设置 3 次 | 每次均被处理 | Pass |
| 0101 | testSetLimitsMaxHeightOnly0101 | 仅 maxHeight | 请求被处理 | Pass |
| 0102 | testSetLimitsMinHeightOnly0102 | 仅 minHeight | 请求被处理 | Pass |
| 0103 | testRestoreAfterSweeps0103 | 扫描后恢复原始限制 | 请求被处理 | Pass |
| 0104 | testSetLimitsCornerLoop0104 | 四角范围逐项设置 | 每一步均被处理 | Pass |
| 0105 | testSetLimitsCenterRange0105 | 居中范围设置 | 结果有效 | Pass |
| 0106 | testSetLimitsMinEqualsMax0106 | min=max 双向等值 | 请求被处理 | Pass |
| 0107 | testSetLimitsSweepWidths0107 | 宽度扫描 4 次 | 每一步均被处理 | Pass |
| 0108 | testSetLimitsSweepHeights0108 | 高度扫描 4 次 | 每一步均被处理 | Pass |

### 参数矩阵（0010-0071、0200-0244、0300-0399、0400-0440、0500-0739，共 483 条）

| 用例范围 | 覆盖维度 | 预期输出 |
|---|---|---|
| 0010-0039 | 全字段/仅 max/仅 min/单字段/等值/余量/大余量/小尺寸/小数/超大/交换 min>max/负值/0/空对象/forcible/位数/宽范围 | 成功时返回有效限制；失败时错误码属于 401/801/1300002/1300003/1300004 |
| 0040-0071 | 混合字段、宽度/高度范围、负 min/max、0 值、小数、1e6/1e9、MAX_SAFE_INTEGER、Infinity、NaN、forcible 组合 | 同上 |
| 0200-0244 | 5×5 min/max 网格、宽度/高度单边网格、forcible 网格 | 同上 |
| 0300-0399 | 10×10 min/max 大网格（1~20000） | 同上 |
| 0400-0408 | **宽度边界值**：minWidth 599/600/601 × maxWidth 1499/1500/1501 | 同上 |
| 0409-0417 | **高度边界值**：minHeight 499/500/501 × maxHeight 999/1000/1001 | 同上 |
| 0418-0426 | **四角边界组合** | 同上 |
| 0427-0430 | 三字段组合（缺 maxWidth/maxHeight/minWidth/minHeight） | 同上 |
| 0431-0436 | 特殊数值：-0、MIN_VALUE、EPSILON、MIN_SAFE_INTEGER、MAX_VALUE、NEGATIVE_INFINITY | 同上 |
| 0437-0440 | forcible + 非法值（min>max、负值、0、NaN） | 同上 |
| 0500-0509 | **宽度等价类**：minWidth 1/100/300/599/600/601/800/1200 × maxWidth 600/1000/1200/1500/1501/2000/20000 | 同上 |
| 0510-0519 | **高度等价类**：minHeight 1/100/300/499/500/501/600/800/1000 × maxHeight 500/800/1000/1200/1500/20000 | 同上 |
| 0520-0529 | **极端宽高比**（1x1000、1000x1、1x20000、20000x1 等 10 组） | 同上 |
| 0530-0539 | **精度/大整数**：0.1、0.333、1e-10、1e10、2^31、2^32、2^53、-2^31、-2^53、MAX_SAFE_INTEGER | 同上 |
| 0540-0559 | 追加宽度/高度等价类组合 | 同上 |
| 0560-0574 | **字段存在性组合**：4 字段的全部 15 种非空子集 | 同上 |
| 0575-0594 | **宽高比约束组合**：横向/纵向/临界共 20 组 | 同上 |
| 0595-0604 | **精度补充**：1500.5、1500.999、1499.5、0.1、0.5、0.999、0.001、1e-6、800.25、1500.0001 | 同上 |
| 0605-0614 | **上下限倒置**：宽度/高度/双向倒置及越界倒置（10 组） | 同上 |
| 0670-0679 | **minWidth 扫描**：1/100/299/301/600/601/1200/1499/1500/2000 | 同上 |
| 0680-0689 | **maxWidth 扫描**：600/601/899/901/1000/1499/1500/1501/2000/20000 | 同上 |
| 0690-0699 | **minHeight 扫描**：1/100/249/251/500/501/800/999/1000/2000 | 同上 |
| 0700-0709 | **maxHeight 扫描**：500/501/749/751/1000/1001/1500/2000/10000/MAX_SAFE_INTEGER | 同上 |
| 0710-0714 | **三字段组合** 5 组 | 同上 |
| 0715-0719 | **小数组合** 5 组 | 同上 |
| 0720-0739 | **等值/四角网格**：四角、等值、中轴、边界倒置等 20 组 | 同上 |
| 0620-0635 | **偏移宽度边界**：minWidth 598/599/601/602 × maxWidth 1498/1499/1501/1502 | 同上 |
| 0636-0655 | **偏移宽高比**：20 组横向/纵向/对角组合 | 同上 |
| 0656-0669 | **等值与偏移角**：min=max、四角、±1 越界角 14 组 | 同上 |

## 四、本地单元测试（entry/src/test/LocalUnit.test.ets，60 条）

覆盖 `WindowLimits` 对象字段构造：全字段、仅 min、仅 max、单字段、三字段组合（4 种）、等值、小数、超大值、大整数（2^31/2^32/2^53）、负边界、0、负值、空对象、显式 undefined、NaN/Infinity、对象引用与值拷贝、极端宽高比、边界值（599/600/601/1499/1500/1501、499/500/501/999/1000/1001）、倒置上下限、全字段 JSON 快照等。

## 运行方式

DevEco Studio 中选中 entry 模块右键 `Run 'test'`，或命令行：

```bash
hvigorw --mode module -p module=entry@ohosTest -p product=default test
```