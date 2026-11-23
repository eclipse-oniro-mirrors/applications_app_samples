# TabContentTouchHotZone 测试用例归档

## 用例表

|测试功能|预置条件|输入|预期输出|测试结果|
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
|应用拉起|应用已安装|点击桌面图标|应用正常启动并显示主页|Pass|
|应用拉起与权限（Ability，1 条用例）|应用已启动|执行 Ability 测试套|1 条用例通过|Pass|
|Tab 溢出配置（TabOverflowConfigCore，18 条用例）|位于测试应用|传入不同溢出配置|18 条用例全部通过|Pass|
|Tab 溢出字符串（TabOverflowStringCore，55 条用例）|位于测试应用|传入不同字符串参数|55 条用例全部通过|Pass|
|主页 UI 状态（TabOverflowIndexUiState，10 条用例）|位于测试应用|切换主页状态|10 条用例全部通过|Pass|
|侧边栏 UI 状态（TabOverflowSideUiState，10 条用例）|位于测试应用|切换侧边栏状态|10 条用例全部通过|Pass|
|Tab 切换 UI 状态（TabOverflowTabSwitchUiState，8 条用例）|位于测试应用|切换 Tab|8 条用例全部通过|Pass|
|顶部视图 UI 状态（TabOverflowTopViewUiState，8 条用例）|位于测试应用|切换顶部视图|8 条用例全部通过|Pass|
|视频 UI 状态（TabOverflowVideoUiState，3 条用例）|位于测试应用|切换视频区域状态|3 条用例全部通过|Pass|
|工具函数（TabOverflowUtilsCore，8 条用例）|位于测试应用|调用工具函数|8 条用例全部通过|Pass|
|日志工具（TabOverflowLoggerCore，10 条用例）|位于测试应用|调用日志接口|10 条用例全部通过|Pass|

合计 131 条用例，全部通过。

## 逻辑用例（数据驱动）

以下 2203 条用例位于 `entry/src/ohosTest/ets/test/logic`，每条用例记录 begin/end 日志，断言前打印入参与实际值；
期望值由被测逻辑在对应输入下的确定性结果给出，覆盖典型值、边界值与非法值。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| -------- | -------- | ---- | -------- | -------- | -------- |
| trackWidthOf（函数） | 无 | 120 组输入（TabContentTouchHotZone_TrackWidthOf_0001~0120） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| offsetForTimeOf（函数） | 无 | 206 组输入（TabContentTouchHotZone_OffsetForTimeOf_0001~0206） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| clampedOffsetOf（函数） | 无 | 205 组输入（TabContentTouchHotZone_ClampedOffsetOf_0001~0205） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| playSecondsOf（函数） | 无 | 205 组输入（TabContentTouchHotZone_PlaySecondsOf_0001~0205） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| playTimeTextOf（函数） | 无 | 120 组输入（TabContentTouchHotZone_PlayTimeTextOf_0001~0120） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| seekTimeOf（函数） | 无 | 205 组输入（TabContentTouchHotZone_SeekTimeOf_0001~0205） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| seeksOnEnd（函数） | 无 | 50 组输入（TabContentTouchHotZone_SeeksOnEnd_0001~0050） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| nextPlayState（函数） | 无 | 2 组输入（TabContentTouchHotZone_NextPlayState_0001~0002） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| nextCountOf（函数） | 无 | 60 组输入（TabContentTouchHotZone_NextCountOf_0001~0060） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| tabImageOf（函数） | 无 | 205 组输入（TabContentTouchHotZone_TabImageOf_0001~0205） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| tabTitleOf（函数） | 无 | 120 组输入（TabContentTouchHotZone_TabTitleOf_0001~0120） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| new ProgressBarState（构造） | 无 | 129 组输入（TabContentTouchHotZone_ProgressBarStateCtor_0001~0129） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ProgressBarState.update（实例方法） | 无 | 75 组输入（TabContentTouchHotZone_ProgressBarStateUpdate_0001~0075） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ProgressBarState.startDrag（实例方法） | 无 | 1 组输入（TabContentTouchHotZone_ProgressBarStateStartDrag_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ProgressBarState.drag（实例方法） | 无 | 75 组输入（TabContentTouchHotZone_ProgressBarStateDrag_0001~0075） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ProgressBarState.endDrag（实例方法） | 无 | 1 组输入（TabContentTouchHotZone_ProgressBarStateEndDrag_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ProgressBarState.togglePlay（实例方法） | 无 | 1 组输入（TabContentTouchHotZone_ProgressBarStateTogglePlay_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ProgressBarState flow（调用序列） | 无 | 205 组输入（TabContentTouchHotZone_ProgressBarStateFlow_0001~0205） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| new SideBarState（构造） | 无 | 1 组输入（TabContentTouchHotZone_SideBarStateCtor_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| SideBarState.toggleLike（实例方法） | 无 | 1 组输入（TabContentTouchHotZone_SideBarStateToggleLike_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| SideBarState.toggleFavorite（实例方法） | 无 | 1 组输入（TabContentTouchHotZone_SideBarStateToggleFavorite_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| SideBarState.toggleFocus（实例方法） | 无 | 1 组输入（TabContentTouchHotZone_SideBarStateToggleFocus_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| SideBarState flow（调用序列） | 无 | 205 组输入（TabContentTouchHotZone_SideBarStateFlow_0001~0205） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| TabContentLogic（常量契约） | 无 | 9 组输入（TabContentTouchHotZone_TabContentLogicConstants_0001~0009） | 返回值与状态逐条符合预期 | 是 | 待执行 |
