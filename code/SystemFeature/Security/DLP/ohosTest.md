# 数据防泄漏测试用例归档

## 用例表

| 测试功能   | 预置条件        | 输入                   | 预期输出                          | 是否自动                |测试结果|
|--------|-------------|----------------------|-------------------------------|--------------------------------|--------------------------------|
| 拉起应用   | 	设备正常运行     | 		                   | 成功拉起应用                        | 是                 |Pass|
| 新增普通文件 | 页面显示正常      | 点击新增按钮，输入文件名称，点击确定		 | 拉起picker页面，文件命名成功，DLP页面显示新增文件 | 是            |Pass|
| 加密授权   | 	长按点击加密按钮   |                      | 	弹出提示框                        | 	是                 |Pass|
| 验证编辑文件 | 	文件已设置编辑权限  | 点击加密文件               | 成功跳转编辑应用                      | 是 |  Pass|
| 编辑数据保存 | 	编辑页面       | 输入文本数据               | 数据保存成功                        | 是 |  Pass|
| 验证只读权限 | 	 文件已设置只读权限 | 点击文件                 | 跳转编辑页面，页面置灰                   | 是 |  Pass|