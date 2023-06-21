# 设备管理合集测试用例归档

## 用例表

| 测试功能         | 预置条件        | 输入                                | 预期输出                  | 是否自动 | 测试结果 |
|--------------|-------------|-----------------------------------|-----------------------|------|------|
| 拉起应用         | 	设备正常运行     | 	无	                               | 成功拉起应用                | 是    | Pass |
| 查看应用菜单显示     | 	成功拉起应用     | 	无	                               | 显示内容正常                | 是    | Pass |
| 耗电统计         | 成功拉起应用，位于首页 | 	点击首页菜单中**耗电统计**	                 | 进入耗电统计界面，内容显示正常       | 是    | Pass |
| 屏幕亮度         | 成功拉起应用，位于首页 | 	点击首页菜单中**屏幕亮度**	                 | 进入屏幕亮度界面，内容显示正常       | 是    | Pass |
| 设置屏幕亮度       | 位于屏幕亮度页面    | 	拖动屏幕亮度页面中的拖动条	                   | 屏幕亮度跟着拖动条变化           | 是    | Pass |
| 电源管理         | 成功拉起应用，位于首页 | 	点击首页菜单中**系统电源管理**	               | 进入电源管理界面，内容显示正常       | 是    | Pass |
| 休眠           | 位于电源管理页面    | 	点击**休眠**	                        | 设备进入休眠状态，屏幕锁屏         | 是    | Pass |
| 关机           | 位于电源管理页面    | 	点击**关机**，弹窗确认框，点击是	              | 设备关机                  | 是    | Pass |
| 重启           | 位于电源管理页面    | 	点击**重启**，弹窗确认框，点击是		             | 设备重启                  | 是    | Pass |
| 设置电源模式       | 位于电源管理页面    | 	点击**设置电源模式**，显示电源模式列表弹窗，选择一个模式		 | 界面显示框中显示设置结果，当前设备电源模式 | 是    | Pass |
| 设置数据项名称      | 成功拉起应用，位于首页 | 	点击**设置数据项名称**	                   | 进入设置数据项名称界面，内容显示正常    | 是    | Pass |
| 设置数据项        | 位于设置数据项名称页面 | 	点击**设置数据项**		                    | 界面显示框中显示设置结果          | 是    | Pass |
| 系统能力         | 成功拉起应用，位于首页 | 	点击**系统能力**	                      | 进入系统能力界面，内容显示正常       | 是    | Pass |
| 获取系统能力集合的字符串 | 位于系统能力页面    | 	点击**获取系统能力集合的字符串**		             | 界面显示框中显查询结果           | 是    | Pass |
| 系统参数         | 成功拉起应用，位于首页 | 	点击**系统参数**	                      | 进入系统参数界面，内容显示正常       | 是    | Pass |
| 设置系统参数       | 位于系统参数页面    | 	点击**设置系统参数**		                   | 界面显示框中显设置结果           | 是    | Pass |
| 查询系统参数       | 位于系统参数页面    | 	点击**查询系统参数**		                   | 界面显示框中显查询结果           | 是    | Pass |