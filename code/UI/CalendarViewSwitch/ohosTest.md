# CalendarViewSwitch年视图 测试用例归档

## 用例表

| 测试功能              | 预置条件            | 输入                                   | 预期输出                    | 是否自动 |测试结果|
|-------------------|-----------------|--------------------------------------|-------------------------|------|--------------|
| 拉起应用              | 	设备正常运行         | 		                                   | 成功拉起应用                  | 否   |Pass|
| 打开应用，弹窗“允许label访问日历？” | 成功拉起应用 | 点击“允许”       | 点击后弹窗消失     | 否  | Pass |
| 点击顶部”年“切换到年视图 | 成功拉起应用 | 点击”年“           | 成功切换到年视图 | 否      | Pass |
| 左滑切换下一年       | 成功切换到年视图 | 在年视图页面中左滑一次                   | 成功切换到下一年        | 否  | Pass |
| 右滑切换上一年 | 成功切换到年视图 | 在年视图页面右滑一次               | 成功切换到上一年 | 否      | Pass |
| 点击顶部”月“切换到月视图 | 成功切换到月视图 | 在月视图页面右滑一次               | 成功切换到上一个月 | 否      | Pass |
| 左滑切换下一个月 | 成功切换到月视图 | 在月视图页面左滑一次               | 成功切换到下一个月 | 否      | Pass |
| 右滑切换上一个月 | 成功切换到月视图 | 在月视图页面右滑一次               | 成功切换到上一个月 | 否      | Pass |
| 在月视图上点击日期，查看选中日期功能 | 成功切换到月视图 | 在月视图上点击本月非当日日期 | 点击的日期显示绿色边框选中效果 | 否      | Pass |
| 在月视图上点击日期，查看选中日期功能 | 成功切换到月视图 | 在月视图上点击当日日期   | 点击的日期显示红底白字 | 否      | Pass |
| 在月视图上点击日期，查看选中日期功能 | 成功切换到月视图 | 在月视图上点击非当月日期  | 切换到对应月 | 否      | Pass |
| 点击顶部”周“切换到周视图 | 成功切换到周视图 | 在周视图页面右滑一次               | 成功切换到上一周 | 否      | Pass |
| 左滑切换下一周 | 成功切换到周视图 | 在周视图页面左滑一次              | 成功切换到下一周 | 否      | Pass |
| 右滑切换上一周 | 成功切换到周视图 | 在周视图页面右滑一次              | 成功切换到上一周 | 否      | Pass |
| 在年视图中点击某个月，自动切换并跳转对应月的月视图 | 成功切换到年视图 | 在年视图中点击任意一个月   | 点击后，成功切换并显示对应月的月视图 | 否      | Pass |
| 在月视图中点击选择一个日期，然后切换到周视图，查看显示对应的周视图 | 成功切换到月视图 | 在月视图中点击选择一个日期，然后切换到周视图 | 周视图显示对应选择日期的周 | 否      | Pass |
| 在周视图中点击选择一个日期，然后切换到月视图，查看显示对应的月视图 | 成功切换到周视图 | 在周视图中点击选择一个日期，然后切换到月视图 | 月视图显示对应选择日期的月 | 否      | Pass |
| 在月视图点击选中一个日期，然后切换到年视图，查看显示对应的年视图 | 成功切换到月视图 | 在月视图点击选中一个日期，然后切换到年视图 | 年视图显示对应选择日期的年 | 否      | Pass |
| 在周视图点击选中一个日期，然后切换到年视图，查看显示对应的年视图 | 成功切换到周视图 | 在周视图点击选中一个日期，然后切换到年视图 | 年视图显示对应选择日期的年 | 否      | Pass |

## 逻辑用例（数据驱动）

以下 2524 条用例位于 `entry/src/ohosTest/ets/test/logic`，每条用例记录 begin/end 日志，断言前打印入参与实际值；
期望值由被测逻辑在对应输入下的确定性结果给出，覆盖典型值、边界值与非法值。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| -------- | -------- | ---- | -------- | -------- | -------- |
| TimeUtils.getWeekDay（静态方法） | 无 | 175 组输入（CalendarViewSwitch_TimeUtilsGetWeekDay_0001~0175） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| TimeUtils.getLastDayOfMonth（静态方法） | 无 | 100 组输入（CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0001~0100） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| TimeUtils.getPreviousMonthLastDays（静态方法） | 无 | 189 组输入（CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0001~0189） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| TimeUtils.getCurrentMonthDays（静态方法） | 无 | 100 组输入（CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0001~0100） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| TimeUtils.lunarMonthToChinese（静态方法） | 无 | 120 组输入（CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0001~0120） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| TimeUtils.lunarDayToChinese（静态方法） | 无 | 120 组输入（CalendarViewSwitch_TimeUtilsLunarDayToChinese_0001~0120） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| TimeUtils.getMonthDays（静态方法） | 无 | 125 组输入（CalendarViewSwitch_TimeUtilsGetMonthDays_0001~0125） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| TimeUtils.getLastYearMonth（静态方法） | 无 | 189 组输入（CalendarViewSwitch_TimeUtilsGetLastYearMonth_0001~0189） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| TimeUtils.getNextYearMonth（静态方法） | 无 | 189 组输入（CalendarViewSwitch_TimeUtilsGetNextYearMonth_0001~0189） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| TimeUtils.getLastYear（静态方法） | 无 | 189 组输入（CalendarViewSwitch_TimeUtilsGetLastYear_0001~0189） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| TimeUtils.getLastMonth（静态方法） | 无 | 188 组输入（CalendarViewSwitch_TimeUtilsGetLastMonth_0001~0188） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| TimeUtils.getNextYear（静态方法） | 无 | 188 组输入（CalendarViewSwitch_TimeUtilsGetNextYear_0001~0188） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| TimeUtils.getNextMonth（静态方法） | 无 | 188 组输入（CalendarViewSwitch_TimeUtilsGetNextMonth_0001~0188） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| StyleUtils.getColor（静态方法） | 无 | 150 组输入（CalendarViewSwitch_StyleUtilsGetColor_0001~0150） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| StyleUtils.getLunarDayColor（静态方法） | 无 | 75 组输入（CalendarViewSwitch_StyleUtilsGetLunarDayColor_0001~0075） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| StyleUtils.getBackgroundColor（静态方法） | 无 | 30 组输入（CalendarViewSwitch_StyleUtilsGetBackgroundColor_0001~0030） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| StyleUtils.getBorderWidth（静态方法） | 无 | 50 组输入（CalendarViewSwitch_StyleUtilsGetBorderWidth_0001~0050） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| new DayInfo（构造） | 无 | 109 组输入（CalendarViewSwitch_DayInfoCtor_0001~0109） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| CalendarViewType（常量契约） | 无 | 3 组输入（CalendarViewSwitch_CalendarViewTypeValues_0001~0003） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| DeviceType（常量契约） | 无 | 3 组输入（CalendarViewSwitch_DeviceTypeValues_0001~0003） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| Constants（常量契约） | 无 | 39 组输入（CalendarViewSwitch_ConstantsValues_0001~0014、0018~0042） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| CommonData（常量契约） | 无 | 5 组输入（CalendarViewSwitch_CommonDataValues_0001~0005） | 返回值与状态逐条符合预期 | 是 | 待执行 |
