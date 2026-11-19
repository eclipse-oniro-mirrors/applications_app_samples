# SetWindowLimitsByStartOptions 测试用例归档

## 用例表（手工）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|------|------|------|------|------|------|
| 拉起应用显示主页 | 位于只有一个应用的空白页 | 1、打开应用，进入示例主页 | 应用启动成功，主页显示"启动测试窗口"按钮 | 是 | Pass |
| 通过 StartOptions 启动目标窗口 | 位于只有一个应用的空白页 | 1、打开应用，显示主页<br/>2、点击"启动测试窗口"按钮 | 通过 StartOptions 启动 WindowTestAbility，当前顶层 Ability 切换为 WindowTestAbility | 是 | Pass |
| 窗口尺寸约束生效 | 位于只有一个应用的空白页 | 1、打开应用，点击"启动测试窗口"按钮<br/>2、在自由窗口状态下拖拽调整窗口大小 | 窗口宽度、高度保持在 StartOptions 配置的最小值与最大值范围内（宽度 600vp~1500vp，高度 500vp~1000vp） | 是 | Pass |

### 使用说明

自由窗口尺寸约束相关用例仅在支持自由窗口的设备（如 2in1、平板）上通过，普通手机仅通过页面展示类与 Ability 启动类用例。

## 自动化用例统计

| 测试文件 | 用例数 | 说明 |
|---|---:|---|
| `Ability.test.ets` | 2 | 启动应用、点击按钮启动 WindowTestAbility |
| `StartOptionsWindowLimits.test.ets` | 556 | 基础 166 条（全字段/仅 min/仅 max/非法值/NaN/Infinity/连续启动）、370 组 StartOptions 参数矩阵（边界值/字段组合/宽高比/特殊数值/displayId/批量） |
| `StartOptionsWindowLimitsUi.test.ets` | 532 | 页面与 Ability 启动 149 条（按钮/顶层 Ability/窗口 bounds/重启/缩放时序）、363 组目标窗口缩放矩阵（范围内网格/越界/边界值/扫描/两步/批量） |
| **ohosTest 合计** | **1090** | |
| `entry/src/test/LocalUnit.test.ets` | 350 | 本地单元测试：StartOptions 字段构造、边界值、特殊数值、displayId、派生校验 |

## 一、Ability.test.ets（2 条）

| 用例编号 | 用例名 | 测试点 | 预期输出 | 测试结果 |
|---|---|---|---|---|
| SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0100 | testSetWindowLimitsByStartOptions0001 | 启动应用，顶层 Ability 为 EntryAbility，"启动测试窗口"按钮存在 | 断言通过 | Pass |
| SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0200 | testSetWindowLimitsByStartOptions0002 | 点击按钮后顶层 Ability 为 WindowTestAbility | 断言通过 | Pass |

## 二、StartOptionsWindowLimits.test.ets（556 条）

### 基础用例（0300-0310）

| 用例编号 | 用例名 | 测试点 | 预期输出 | 测试结果 |
|---|---|---|---|---|
| 0300 | testStartOptionsAll0300 | 携带 displayId 与全部尺寸字段启动 | 启动成功、顶层为 WindowTestAbility | Pass |
| 0301 | testStartOptionsMinOnly0301 | 仅 minWindowWidth/minWindowHeight | 启动成功 | Pass |
| 0302 | testStartOptionsMaxOnly0302 | 仅 maxWindowWidth/maxWindowHeight | 启动成功 | Pass |
| 0303 | testStartOptionsInverted0303 | minWindowWidth > maxWindowWidth | 请求被处理 | Pass |
| 0304 | testStartOptionsNegative0304 | 负值尺寸 | 请求被处理 | Pass |
| 0305 | testStartOptionsZeros0305 | 全 0 尺寸 | 请求被处理 | Pass |
| 0306 | testStartOptionsNaN0306 | NaN 尺寸 | 请求被处理 | Pass |
| 0307 | testStartOptionsInfinity0307 | Infinity 尺寸 | 请求被处理 | Pass |
| 0308 | testStartOptionsSequential0308 | 连续启动/关闭 3 次 | 每次启动成功 | Pass |
| 0309 | testStartOptionsTinyMax0309 | max 为 1 | 请求被处理 | Pass |
| 0310 | testStartOptionsHugeMax0310 | max 为 1000000 | 请求被处理 | Pass |
| 0311 | testStartOptionsMaxBound0311 | 最大边界启动 | 启动成功 | Pass |
| 0312 | testStartOptionsEqualBounds0312 | min=max=900x700 | 请求被处理 | Pass |
| 0313 | testStartOptionsRepeatFive0313 | 连续启动/关闭 5 次 | 每次启动成功 | Pass |
| 0314 | testStartOptionsRapidWithoutClose0314 | 连续启动 5 次不关闭 | 最后一次请求被处理 | Pass |
| 0315 | testStartOptionsDisplayIdOnly0315 | 仅 displayId | 请求被处理 | Pass |
| 0316 | testStartOptionsModuleOnlyFields0316 | 仅高度字段 | 启动成功 | Pass |
| 0317 | testStartOptionsWidthOnlyFields0317 | 仅宽度字段 | 启动成功 | Pass |
| 0318 | testStartOptionsAlternatingBounds0318 | 宽/窄限制交替 3 轮 | 每次请求被处理 | Pass |
| 0319 | testStartOptionsZeroMin0319 | min=0、max 正常 | 请求被处理 | Pass |
| 0320 | testStartOptionsZeroMax0320 | max=0、min 正常 | 请求被处理 | Pass |
| 0321-0322 | testStartWidthSweepStart0321 等 | 宽度/高度扫描启动 5 次 | 每次请求被处理 | Pass |
| 0323 | testStartBothSweeps0323 | 宽高同时扫描 5 次 | 每次请求被处理 | Pass |
| 0324 | testStartDoubleClose0324 | 启动/关闭两轮 | 每次请求被处理 | Pass |
| 0325 | testStartInvertedHeights0325 | 高度倒置 | 请求被处理 | Pass |
| 0326 | testStartFractionalBounds0326 | 小数边界 | 请求被处理 | Pass |
| 0327-0329 | testStartMinHeightOnly0327 等 | 仅 minHeight/仅 maxWidth/仅 maxHeight | 请求被处理 | Pass |
| 0330 | testStartAllZeroExceptDisplay0330 | displayId + 全 0 尺寸 | 请求被处理 | Pass |
| 0331-0335 | testStartCornerLoop0331 等 | 四角/居中/等值/宽高扫描 | 每一步均被处理 | Pass |

### 参数矩阵（0600-0849，共 240 条）

| 用例范围 | 覆盖维度 | 预期输出 |
|---|---|---|
| 0600-0614 | **宽度矩阵**：minWindowWidth 599/600/601/1499/1500 × maxWindowWidth 600/1000/1500 | 启动成功或命中预期错误码（401/801/16000001/16000009/16000019/16000050） |
| 0615-0639 | **高度矩阵**：minWindowHeight 499/500/501/999/1000 × maxWindowHeight 500/700/1000/1100/1300 | 同上 |
| 0640-0654 | **字段存在性组合**：4 个尺寸字段的全部 15 种非空子集 | 同上 |
| 0655-0664 | **宽高比组合**：横向/纵向/等宽/等高共 10 组 | 同上 |
| 0665-0689 | **特殊数值**：0、负值、小数、倒置、MAX_SAFE_INTEGER、1e6、1、±1 边界、单边极值等 25 组 | 同上 |
| 0700-0709 | **minWindowWidth 扫描**：1/100/300/599/600/601/900/1500/2000/MAX_SAFE_INTEGER | 同上 |
| 0710-0719 | **maxWindowWidth 扫描**：1/100/600/1000/1499/1500/1501/2000/100000/MAX_SAFE_INTEGER | 同上 |
| 0720-0729 | **minWindowHeight 扫描**：1/100/250/499/500/501/750/1000/2000/MAX_SAFE_INTEGER | 同上 |
| 0730-0739 | **maxWindowHeight 扫描**：1/100/500/750/999/1000/1001/1300/100000/MAX_SAFE_INTEGER | 同上 |
| 0740-0759 | **宽高比网格**：20 组横向/纵向/等宽/等高组合 | 同上 |
| 0760-0764 | **displayId**：0/1/2/-1/1000 配合宽度字段 | 同上 |
| 0765-0768 | **三字段组合**：4 组 | 同上 |
| 0769-0778 | **小数**：10 组小数边界与余量组合 | 同上 |
| 0779-0789 | **非法组合**：倒置、±1 越界、负值、0、极端倒置 11 组 | 同上 |
| 0790-0809 | **宽高比网格 2**：20 组横向/纵向/等宽/等高组合 | 同上 |
| 0810-0824 | **非法组合 2**：倒置、越界、负值、0、极端倒置 15 组 | 同上 |
| 0825-0829 | **小数 2**：5 组小数边界组合 | 同上 |
| 0830-0849 | **等值/四角网格**：四角、等值、中轴、边界倒置等 20 组 | 同上 |

## 三、StartOptionsWindowLimitsUi.test.ets（532 条）

### 页面与启动用例（1001-1039）

| 用例编号 | 用例名 | 测试点 | 预期输出 | 测试结果 |
|---|---|---|---|---|
| 1001 | testStartButtonExists1001 | 主页按钮存在 | 组件存在 | Pass |
| 1002 | testStartTargetAbility1002 | 点击后顶层 Ability | WindowTestAbility | Pass |
| 1003 | testTargetPageButton1003 | 目标页按钮存在 | 组件存在 | Pass |
| 1004 | testTargetWindowBounds1004 | 目标窗口 bounds | 宽、高大于 0 | Pass |
| 1005 | testTargetWindowWithinMax1005 | 目标窗口尺寸 | 不超过 StartOptions 最大值（容差 100） | Pass |
| 1006 | testStartButtonBounds1006 | 按钮 bounds | 宽、高大于 0 | Pass |
| 1007 | testRelaunchEntry1007 | 连续拉起应用 | 按钮正常显示 | Pass |
| 1008 | testRepeatedLaunch1008 | 连续 3 次拉起 | 每次都正常 | Pass |
| 1009 | testClickTwice1009 | 连续点击两次 | 顶层仍为 WindowTestAbility | Pass |
| 1010 | testTargetRestart1010 | 关闭后重新启动目标 | 顶层为 WindowTestAbility | Pass |
| 1011 | testResizeAfterStart1011 | 启动后缩放到中等尺寸 | 页面稳定、按钮存在 | Pass |
| 1012 | testResizeGrowShrink1012 | 放到最大再缩到最小 | bounds 正常 | Pass |
| 1013 | testResizeSequence1013 | 分 3 步缩放 | 页面稳定 | Pass |
| 1014 | testResizeSameSizeTwice1014 | 相同尺寸缩放两次 | 窗口稳定 | Pass |
| 1015 | testResizeToMax1015 | 缩放到 StartOptions 上限 | bounds 不超过上限 | Pass |
| 1016 | testResizeToMin1016 | 缩放到 StartOptions 下限 | bounds 不低于下限 | Pass |
| 1017 | testStartCloseThree1017 | 启动/关闭 3 轮（每轮重拉 Entry） | 顶层均为 WindowTestAbility | Pass |
| 1018 | testRapidClickFive1018 | 连续点击 5 次 | 顶层为 WindowTestAbility | Pass |
| 1019 | testTopAbilityAfterResizes1019 | 3 次缩放后顶层 Ability | 仍为 WindowTestAbility | Pass |
| 1020 | testRelaunchEntryAfterResize1020 | 缩放后重拉 Entry | 按钮存在 | Pass |
| 1021 | testStartTwiceThenResize1021 | 启动两次后缩放 | 页面稳定、按钮存在 | Pass |
| 1022 | testResizeTenTimes1022 | 连续缩放 10 次 | bounds 在上限内 | Pass |
| 1023 | testButtonAfterManyResizes1023 | 缩放 5 次后按钮 | 按钮仍存在 | Pass |
| 1024 | testTargetRelaunchInPlace1024 | 再次启动目标 Ability | bounds 正常 | Pass |
| 1025-1026 | testResizeStepUp1025 等 | 5 步放大/5 步缩小 | 按钮存在 | Pass |
| 1027-1028 | testResizeZigZag1027 等 | Z 字形/3x3 网格缩放 | 页面稳定 | Pass |
| 1029-1030 | testResizeWidthBoundaryWalk1029 等 | 宽/高边界遍历 | bounds 正常 | Pass |
| 1031-1032 | testResizeRestartTwice1031 等 | 缩放后重启两次/5 次缩放后顶层 Ability | 按钮与 Ability 正确 | Pass |
| 1033-1034 | testResizeTenTimes1033 等 | 10 次缩放后 bounds/启动关闭 5 轮 | bounds 正常、顶层正确 | Pass |
| 1035-1039 | testResizeCornersLoop1035 等 | 四角/居中/宽高扫描/恢复 | 按钮存在、页面稳定 | Pass |

### 目标窗口缩放矩阵（1100-1332，共 233 条）

| 用例范围 | 覆盖维度 | 预期输出 |
|---|---|---|
| 1100-1149 | **范围内网格**：宽度 600~1500 × 高度 500~1200（50 组） | 宽高落在 StartOptions 范围内，或设备不支持缩放 |
| 1150-1174 | **越界组合**：宽度 300~2000 × 高度 200~2000（25 组） | 越界值被限制在 600~1500 / 500~1000，或设备不支持缩放 |
| 1175-1202 | **边界值**：599/600/601、1499/1500/1501、499/500/501、999/1000/1001 及四角/中轴（25 组） | 按对应边界限制，或设备不支持缩放 |
| 1203-1217 | **宽度扫描**：620~1460，步长 60（高度固定 750） | 按尺寸限制或设备不支持缩放 |
| 1218-1232 | **高度扫描**：520~968，步长 32（宽度固定 1000） | 按尺寸限制或设备不支持缩放 |
| 1233-1247 | **正方形扫描**：600~1440，步长 60 | 超高度上限时按上限限制，或设备不支持缩放 |
| 1248-1267 | **边界偏移**：598~602、1498~1502、498~502、998~1002 组合（20 组） | 按对应边界限制，或设备不支持缩放 |
| 1268-1282 | **两步缩放**：中间尺寸→目标尺寸 15 组 | 最终尺寸受限，或设备不支持缩放 |
| 1283-1297 | **宽度扫描 2**：620~1460，步长 60（高度固定 750） | 按尺寸限制或设备不支持缩放 |
| 1298-1312 | **高度扫描 2**：520~968，步长 32（宽度固定 1000） | 按尺寸限制或设备不支持缩放 |
| 1313-1322 | **正方形扫描 2**：600~1140，步长 60 | 超高度上限时按上限限制，或设备不支持缩放 |
| 1323-1332 | **四角/中心组合**：10 组四角与中心尺寸 | 按对应边界限制，或设备不支持缩放 |

## 四、本地单元测试（entry/src/test/LocalUnit.test.ets，60 条）

覆盖 `StartOptions` 字段构造：

- 字段一致性：displayId、minWindowWidth 600、minWindowHeight 500、maxWindowWidth 1500、maxWindowHeight 1000
- 合法性：上下限顺序、等值上下限、缺省/显式 undefined、空对象、displayId 取值
- 边界值：599/600/601、1499/1500/1501、499/500/501、999/1000/1001、±1 偏移
- 特殊数值：0、负值、小数、倒置、MAX_SAFE_INTEGER、2^31、2^53、Infinity、-Infinity、NaN、-0
- 派生校验：和值（2100 / 1500）、差值（900 / 500）、宽高比（2 / 1.5）、快照键数量与值拷贝

## 运行方式

DevEco Studio 中选中 entry 模块右键 `Run 'test'`，或命令行：

```bash
hvigorw --mode module -p module=entry@ohosTest -p product=default test
```
