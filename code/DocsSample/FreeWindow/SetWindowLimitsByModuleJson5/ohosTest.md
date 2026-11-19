# SetWindowLimitsByModuleJson5 测试用例归档

## 用例表（手工）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|------|------|------|------|------|------|
| 拉起应用显示主页 | 位于只有一个应用的空白页 | 1、打开应用，进入示例主页 | 应用启动成功，主页显示"Top layout area, do not hide the title bar."文字及两个按钮 | 是 | Pass |
| 隐藏标题栏并避让按钮 | 位于只有一个应用的空白页 | 1、打开应用<br/>2、点击"hide the title bar and avoid the three buttons."按钮 | 标题栏隐藏，顶部内容自动避开标题栏三键区域，页面文字切换为"Top layout area, hide the title bar and avoid the three buttons." | 是 | Pass |
| 恢复显示标题栏 | 位于只有一个应用的空白页 | 1、打开应用<br/>2、点击隐藏按钮<br/>3、点击"do not hide the title bar."按钮 | 标题栏恢复显示，顶部区域恢复为全宽显示，文字恢复为"Top layout area, do not hide the title bar." | 是 | Pass |
| 窗口尺寸约束生效 | 位于只有一个应用的空白页 | 1、打开应用，应用启动时由 module.json5 静态配置窗口尺寸限制<br/>2、在自由窗口状态下拖拽调整窗口大小 | 窗口宽度、高度保持在 module.json5 配置范围内（宽度 400px~2560px，高度 200px~1300px） | 是 | Pass |
| 窗口宽高比约束生效 | 位于只有一个应用的空白页 | 1、打开应用<br/>2、在自由窗口状态下拖拽改变窗口宽高比 | 窗口宽高比保持在 module.json5 配置的 0.5~3.5 范围内 | 是 | Pass |

### 使用说明

自由窗口尺寸/宽高比约束相关用例仅在支持自由窗口的设备（如 2in1、平板）上通过，普通手机仅通过页面展示类用例；在不支持窗口尺寸限制的设备上，API 用例断言返回 801 等预期错误码。

## 自动化用例统计

| 测试文件 | 用例数 | 说明 |
|---|---:|---|
| `Ability.test.ets` | 4 | 启动应用、隐藏/显示标题栏、窗口尺寸限制（UiTest） |
| `WindowLimitsModuleJsonApi.test.ets` | 793 | 基础 155 条（含并发/时序/宽高比边界/回读）、618 组参数矩阵（范围网格/字段组合/边界值/特殊数值/倒置/混合比例/偏移网格/批量） |
| `WindowLimitsModuleJsonUi.test.ets` | 595 | 标题栏显隐 145 条（含时序/重复操作/缩放联动）、430 组缩放矩阵（范围网格/宽高比/边界值/扫描/隐藏态/显隐联动/混合扫描/批量） |
| **ohosTest 合计** | **1392** | |
| `entry/src/test/LocalUnit.test.ets` | 360 | 本地单元测试：配置字段、上下限、边界值、宽高比、派生范围/面积/中点/比例校验 |

## 一、Ability.test.ets（4 条）

| 用例编号 | 用例名 | 测试点 | 预期输出 | 测试结果 |
|---|---|---|---|---|
| SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_0100 | testSetWindowLimitsByModuleJson5StartAbility0001 | 启动应用，顶层 Ability 为 EntryAbility，主页文字及两个按钮存在 | 断言通过 | Pass |
| SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_0200 | testSetWindowLimitsByModuleJson5HideTitleBar0001 | 点击隐藏按钮，标题栏隐藏并避让三键 | 隐藏后提示文字存在 | Pass |
| SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_0300 | testSetWindowLimitsByModuleJson5ShowTitleBar0001 | 隐藏后点击显示按钮 | 标题栏恢复显示 | Pass |
| SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_0400 | testSetWindowLimitsByModuleJson5WindowLimits0001 | 拖拽放大/缩小窗口，窗口尺寸受 module.json5 限制 | 放大后尺寸受限、缩小后尺寸受限；不支持缩放时命中预期错误 | Pass |

## 二、WindowLimitsModuleJsonApi.test.ets（793 条）

### 基础与异步/并发用例（0001-0009、0080-0086、0090、0441-0444、0450-0453、0460-0469、0480-0494）

| 用例编号 | 用例名 | 测试点 | 预期输出 | 测试结果 |
|---|---|---|---|---|
| 0001-0009 | testModuleJsonGetLimits0001 等 | 获取、按 module.json5 范围设置回读、窄范围设置、仅 max 设置、递增/递减序列、合法/非法交替、仅 max 回读、空对象 | 成功时返回有效限制；失败时命中预期错误码 | Pass |
| 0080-0081 | testModuleJsonPromise0080 / testModuleJsonForciblePromise0081 | Promise / forcible Promise 重载 | 请求被处理 | Pass |
| 0082 | testModuleJsonConcurrent0082 | 2 个请求并发 | 两个请求均被处理 | Pass |
| 0083 | testModuleJsonInterleavedGet0083 | 设置与回读逐步交替（3 步） | 每一步回读有效或设备不支持 | Pass |
| 0084 | testModuleJsonRapidRepeat0084 | 相同限制快速设置 5 次 | 结果稳定一致 | Pass |
| 0085 | testModuleJsonGetLimitsTwice0085 | 连续读取两次 | 两次结果一致 | Pass |
| 0086 | testModuleJsonNonMonotonic0086 | 非单调限制序列 | 每一步均被接受 | Pass |
| 0441-0442 | testModuleJsonConcurrentThree0441 / Five0442 | 3 路/5 路并发 | 所有请求均被处理 | Pass |
| 0443 | testModuleJsonInterleavedFive0443 | set/get 交替 5 步 | 每一步回读有效或设备不支持 | Pass |
| 0444 | testModuleJsonForcibleAfterInvalid0444 | 非法后 forcible 合法设置 | 两次请求均被处理 | Pass |
| 0450-0451 | testModuleJsonRatioWide0450 / Tall0451 | 宽/高极端宽高比限制 | 请求被处理 | Pass |
| 0452-0453 | testModuleJsonRatioMaxBoundary0452 / MinBoundary0453 | 宽高比 3.5 / 0.5 边界 | 请求被处理 | Pass |
| 0090 | testModuleJsonRestore0090 | 恢复测试前限制 | 请求被接受或设备不支持 | Pass |
| 0460 | testModuleJsonPresenceSubsets0460 | 15 种非空字段组合逐项设置 | 每一步均被处理 | Pass |
| 0461 | testModuleJsonFullRamp0461 | 放大到 module.json5 上限再缩小回原值（5 步） | 每一步均被处理 | Pass |
| 0462 | testModuleJsonRapidTen0462 | 快速设置 10 种不同限制 | 每一步均被处理、末尾回读有效 | Pass |
| 0463 | testModuleJsonConcurrentTen0463 | 10 路并发设置 | 10 个请求均被处理 | Pass |
| 0464 | testModuleJsonInterleavedTen0464 | set/get 交替 10 步 | 每一步回读有效或设备不支持 | Pass |
| 0465 | testModuleJsonInvalidThenValid0465 | 非法/合法限制循环 5 轮 | 每一步均被处理 | Pass |
| 0466 | testModuleJsonForcibleRepeat0466 | 相同 forcible 限制连续 3 次 | 结果稳定一致 | Pass |
| 0467 | testModuleJsonRestoreModuleBounds0467 | forcible 恢复 module.json5 声明边界 | 请求被处理 | Pass |
| 0468 | testModuleJsonGetAfterEachSet0468 | 10 种限制逐项设置并回读 | 每次回读均有效或设备不支持 | Pass |
| 0469 | testModuleJsonRestoreOriginalForcible0469 | forcible 恢复测试前原始限制 | 请求被处理 | Pass |
| 0480 | testModuleJsonPresenceLoop0480 | 15 种字段组合再次逐项设置 | 每一步均被处理 | Pass |
| 0481 | testModuleJsonRampSeven0481 | 7 步放大再缩小 | 每一步均被处理 | Pass |
| 0482 | testModuleJsonConcurrentTwenty0482 | 20 路并发设置 | 20 个请求均被处理 | Pass |
| 0483 | testModuleJsonInterleavedTwenty0483 | set/get 交替 20 步 | 每一步回读有效或设备不支持 | Pass |
| 0484 | testModuleJsonForcibleMixed0484 | forcible 合法/非法交替 3 轮 | 每一步均被处理 | Pass |
| 0485 | testModuleJsonReadbackTwenty0485 | 20 种限制逐项设置并回读 | 每次回读均有效或设备不支持 | Pass |
| 0486 | testModuleJsonExtremeLoop0486 | 5 种极端限制组合 | 每一步均被处理 | Pass |
| 0487 | testModuleJsonForcibleAlternate0487 | forcible/非 forcible 交替 4 次 | 每一步均被处理 | Pass |
| 0488 | testModuleJsonEmptyLoop0488 | 空对象连续设置 5 次 | 每一步均被处理 | Pass |
| 0489 | testModuleJsonRestoreModuleThrice0489 | module 边界限制连续 3 次 | 每一步均被处理 | Pass |
| 0490 | testModuleJsonReadbackLoop0490 | 10 种限制逐项设置并回读 | 每次回读均有效或设备不支持 | Pass |
| 0491 | testModuleJsonEqualBounds0491 | 等值上下限 1200x800 | 请求被处理 | Pass |
| 0492 | testModuleJsonSequentialFive0492 | 5 次顺序尺寸变化 | 每一步均被处理 | Pass |
| 0493 | testModuleJsonHeightOnly0493 | 仅高度字段 | 请求被处理 | Pass |
| 0494 | testModuleJsonRestoreAfterSweeps0494 | 扫描后恢复原始限制 | 请求被处理 | Pass |
| 0495-0499 | testModuleJsonCornerLoop0495 等 | 四角/居中/等值/宽高扫描 | 每一步均被处理 | Pass |

### 参数矩阵（0100-0199、0200-0299、0300-0317、0320-0329、0330-0335、0340-0417、0470-0675，共 518 条）

| 用例范围 | 覆盖维度 | 预期输出 |
|---|---|---|
| 0100-0199 | 宽度网格：minWidth 400/500/600/700/800/900/1000/1200/1500/2000 × maxWidth 2560/2400/2200/2000/1800/1600/1500/1300/1200/1000 | 成功时返回有效限制；失败时错误码属于 401/801/1300002/1300003/1300004 |
| 0200-0299 | 高度网格：minHeight 200/250/300/350/400/500/600/700/800/900 × maxHeight 1300/1200/1150/1100/1050/1000/950/900/850/800 | 同上 |
| 0300-0308 | **宽度边界值**：minWidth 399/400/401 × maxWidth 2559/2560/2561 | 同上 |
| 0309-0317 | **高度边界值**：minHeight 199/200/201 × maxHeight 1299/1300/1301 | 同上 |
| 0320-0329 | 特殊数值：0、-1、0.5、1e6、1e9、MAX_SAFE_INTEGER、POSITIVE_INFINITY、NEGATIVE_INFINITY、NaN、-0 | 同上 |
| 0330-0335 | forcible 组合：module.json5 边界、全 0、min>max、负值、极端宽高比、极端纵向 | 同上 |
| 0340-0354 | **字段存在性组合**：4 字段的全部 15 种非空子集 | 同上 |
| 0355-0374 | **宽高比约束组合**：横向/纵向/临界共 20 组（含 2560x200、400x1300） | 同上 |
| 0375-0384 | **精度**：2560.5、2560.999、2559.5、0.1、0.5、0.999、0.001、1e-6、1280.25、2560.0001 | 同上 |
| 0385-0392 | **超大值**：min/max 1e9、MAX_SAFE_INTEGER、Infinity、1e12 | 同上 |
| 0393-0399 | **上下限倒置**：2560>400、1300>200、双向倒置、越界倒置 | 同上 |
| 0400-0408 | **双下限边界**：minWidth 399/400/401 × minHeight 199/200/201（max 固定 2560/1300） | 同上 |
| 0409-0417 | **双上限边界**：maxWidth 2559/2560/2561 × maxHeight 1299/1300/1301（min 固定 400/200） | 同上 |
| 0470-0499 | **宽高比网格**：minWidth 400/600/800/1000/1200 × minHeight 200/400/600/800/1000/1200（30 组） | 同上 |
| 0500-0529 | **混合比例矩阵**：30 组宽高组合（含极端横向/纵向、等宽/等高） | 同上 |
| 0530-0549 | **混合小数**：20 组整数/小数混用的上下限组合 | 同上 |
| 0550-0564 | **等值与四角**：min=max、module 四角、越界角、中心组合（15 组） | 同上 |
| 0565-0589 | **偏移网格**：minWidth 450/650/850/1050/1250 × maxWidth 2500/2300/2100/1900/1700（25 组） | 同上 |
| 0590-0604 | **小数补充**：15 组整数/小数混用组合 | 同上 |
| 0605-0615 | **偏移角**：等值、四角、越界角、中轴组合（11 组） | 同上 |
| 0616-0625 | **minWindowWidth 扫描**：400/401/599/600/900/1200/2000/2559/2560/MAX_SAFE_INTEGER | 同上 |
| 0626-0635 | **maxWindowWidth 扫描**：400/500/1000/1499/1500/2000/2559/2560/2561/100000 | 同上 |
| 0636-0645 | **minWindowHeight 扫描**：200/201/399/400/600/900/1200/1299/1300/2000 | 同上 |
| 0646-0655 | **maxWindowHeight 扫描**：200/300/500/999/1000/1200/1299/1300/1301/10000 | 同上 |
| 0656-0675 | **等值/四角网格**：四角、等值、中轴、边界倒置等 20 组 | 同上 |

## 三、WindowLimitsModuleJsonUi.test.ets（595 条）

### 标题栏显隐用例（1001-1065）

| 用例编号 | 用例名 | 测试点 | 预期输出 | 测试结果 |
|---|---|---|---|---|
| 1001-1004 | testModuleJsonVisibleTip1001 等 | 初始提示文字、隐藏按钮、显示按钮、两个按钮同时存在 | 组件均存在 | Pass |
| 1005-1007 | testModuleJsonHideTip1005 等 | 点击隐藏后提示切换、隐藏/显示按钮仍存在 | 隐藏提示存在 | Pass |
| 1008-1011 | testModuleJsonShowAfterHide1008 等 | 隐藏后显示、连续隐藏两次、连续显示两次、未隐藏直接显示 | 状态切换正确且稳定 | Pass |
| 1012-1014 | testModuleJsonHideShowHide1012 等 | 隐藏-显示-隐藏、3 轮切换、5 次快速切换 | 最终状态正确、页面稳定 | Pass |
| 1015-1017 | testModuleJsonTipBounds1015 等 | 提示文字组件、隐藏按钮、应用窗口 bounds | 宽、高均大于 0 | Pass |
| 1018-1020 | testModuleJsonTopAbility1018 等 | 顶层 Ability、重启应用、连续 3 次拉起 | Ability 为 EntryAbility、提示正常 | Pass |
| 1021-1023 | testModuleJsonGrowSteps1021 等 | 分 3 步放大、分 3 步缩小、放到最大再缩到最小 | 页面稳定、提示正常 | Pass |
| 1024-1025 | testModuleJsonHideResizeShow1024 等 | 隐藏后缩放再显示、缩放-隐藏-缩放-显示 | 状态切换正确 | Pass |
| 1026 | testModuleJsonToggleTen1026 | 连续 10 次显隐切换 | 最终为显示态、页面稳定 | Pass |
| 1027-1028 | testModuleJsonResizeMinThenHide1027 等 | 缩到最小后隐藏、放到最大后显示 | 状态正确 | Pass |
| 1029-1030 | testModuleJsonFiveResizes1029 等 | 5 次交替缩放、相同尺寸连续两次 | 页面稳定、提示正常 | Pass |
| 1031-1033 | testModuleJsonGrowThree1031 等 | 3 步放大、3 步缩小、放到最大再缩到最小 | 页面稳定、提示正常 | Pass |
| 1034-1035 | testModuleJsonFiveAlternating1034 等 | 5 次交替缩放、相同尺寸连续两次 | 页面稳定、提示正常 | Pass |
| 1036-1037 | testModuleJsonRestartAfterResize1036 等 | 缩放后重启、两次缩放后顶层 Ability | 标题与 Ability 正确 | Pass |
| 1038-1039 | testModuleJsonTitleAfterResizeMin1038 等 | 缩到最小/放到最大后提示 | 提示正常 | Pass |
| 1040 | testModuleJsonBoundsAfterFiveResizes1040 | 连续 5 次缩放后窗口 bounds | 宽、高均大于 0 | Pass |
| 1041-1042 | testModuleJsonResizeSmallSteps1041 等 | 下限/上限附近小步缩放 4 次 | 提示正常 | Pass |
| 1043-1044 | testModuleJsonResizeTriangle1043 等 | 三角形/对角线路径缩放 | 页面稳定、提示正常 | Pass |
| 1045 | testModuleJsonResizeAmplitude1045 | 最大/最小交替 5 次 | 提示正常 | Pass |
| 1046-1047 | testModuleJsonResizeWidthOnly1046 等 | 仅改变宽度/高度 5 次 | 提示正常 | Pass |
| 1048 | testModuleJsonResizeHideAmplitude1048 | 隐藏态下最大/最小交替 3 次 | 隐藏提示保持、恢复显示 | Pass |
| 1049 | testModuleJsonResizeToggleEach1049 | 3 种尺寸缩放后各显隐一次 | 状态均正确 | Pass |
| 1050 | testModuleJsonResizeBoundsCheck1050 | 连续缩放 10 次后 bounds | 宽高在限制内 | Pass |
| 1051-1052 | testModuleJsonResizeStepUp1051 等 | 5 步放大/5 步缩小 | 提示正常 | Pass |
| 1053-1054 | testModuleJsonResizeZigZag1053 等 | Z 字形/3x3 网格缩放 | 页面稳定 | Pass |
| 1055-1056 | testModuleJsonBoundaryWalk1055 等 | 宽/高边界遍历 | 提示正常 | Pass |
| 1057-1058 | testModuleJsonResizeRestartTwice1057 等 | 缩放后重启两次/5 次缩放后顶层 Ability | 提示与 Ability 正确 | Pass |
| 1059-1060 | testModuleJsonHideAfterResize1059 等 | 缩放后显隐/10 次缩放后提示 | 状态正确、提示正常 | Pass |
| 1061-1065 | testModuleJsonCornerResize1061 等 | 四角/居中/宽高扫描/恢复 | 提示正常 | Pass |

### 缩放矩阵（1100-1159、1160-1189、1190-1207、1208-1257、1300-1471，共 330 条）

| 用例范围 | 覆盖维度 | 预期输出 |
|---|---|---|
| 1100-1159 | 范围内网格：宽度 500~2300 × 高度 300~1200（60 组） | 宽高落在 module.json5 范围内，或设备不支持缩放 |
| 1160-1189 | **宽高比矩阵**：横向 10 组、纵向 10 组、临界 10 组（1x1300、2560x200 等） | 实际宽高比保持在 0.5~3.5，或设备不支持缩放 |
| 1190-1201 | **宽度/高度边界值**：399/400/401、2559/2560/2561、199/200/201、1299/1300/1301 | 越界值被限制，或设备不支持缩放 |
| 1202-1207 | **四角边界组合**：399x199、400x200、2561x1301、2560x1300、399x1301、2561x199 | 按对应边界限制，或设备不支持缩放 |
| 1208-1227 | **宽度扫描**：420~2320，步长 100（高度固定 800） | 宽高落在范围内，或设备不支持缩放 |
| 1228-1237 | **高度扫描**：220~1120，步长 100（宽度固定 1200） | 宽高落在范围内，或设备不支持缩放 |
| 1238-1247 | **正方形扫描**：450~2250，步长 200 | 超高度上限时按上限限制，或设备不支持缩放 |
| 1248-1257 | **边界/中心组合**：400x200、2560x1300、401x201、2559x1299 等 10 组 | 按对应边界限制，或设备不支持缩放 |
| 1300-1311 | **隐藏态缩放**：隐藏标题栏后缩放 12 组尺寸 | 隐藏提示保持、窗口正常，或设备不支持缩放 |
| 1312-1321 | **缩放后显隐**：缩放 10 组尺寸后执行隐藏/显示 | 隐藏与显示提示均正确 |
| 1322-1341 | **隐藏态缩放补充**：20 组递增尺寸 | 隐藏提示保持、窗口正常，或设备不支持缩放 |
| 1342-1361 | **缩放后显隐补充**：20 组递增尺寸 | 隐藏与显示提示均正确 |
| 1362-1371 | **宽度扫描补充**：500~2300，步长 200（高度固定 700） | 宽高受限，或设备不支持缩放 |
| 1422-1441 | **隐藏态缩放 3**：450~2350 递增尺寸 20 组 | 隐藏提示保持、窗口正常，或设备不支持缩放 |
| 1442-1461 | **缩放后显隐 3**：20 组递增尺寸 | 隐藏与显示提示均正确 |
| 1462-1471 | **四角缩放**：10 组四角/中心尺寸 | 窗口正常，或设备不支持缩放 |
| 1372-1386 | **宽度扫描三**：450~2242，步长 128（高度固定 700） | 宽高受限，或设备不支持缩放 |
| 1387-1401 | **高度扫描二**：250~1230，步长 70（宽度固定 1200） | 宽高受限，或设备不支持缩放 |
| 1402-1421 | **正方形扫描二**：420~2415，步长 105 | 超高度上限时按上限限制，或设备不支持缩放 |

## 四、本地单元测试（entry/src/test/LocalUnit.test.ets，130 条）

覆盖 module.json5 中 `abilities` 标签的窗口尺寸字段：

- 配置一致性：minWindowWidth 400、maxWindowWidth 2560、minWindowHeight 200、maxWindowHeight 1300、minWindowRatio 0.5、maxWindowRatio 3.5
- 合法性：上下限顺序、正数性、宽高比区间（0,1] / (1,+∞)、类型为 number、宽高为整数、宽高比有限
- 边界值：min±1、max±1、等值上下限、小数宽高比、0.4/0.49/4/3.51 越界判定
- 宽高比：最小/最大比值计算、等于 0.5 与 3.5、4:3 与 3:4、2560x1000 与 2560x200 场景
- 派生校验：可调范围（宽度 2160、高度 1100）、面积（80000 / 3328000）、中点（1480 / 750）、和值（600 / 3860）、比值跨度（3）、2 倍/10 倍换算、整除与比例约束合取

## 运行方式

DevEco Studio 中选中 entry 模块右键 `Run 'test'`，或命令行：

```bash
hvigorw --mode module -p module=entry@ohosTest -p product=default test
```
