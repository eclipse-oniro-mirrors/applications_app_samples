# UTDType 测试用例归档

## 用例表

|测试功能|预置条件|输入|预期输出|是否自动|测试结果|
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
|拉起应用|	设备正常运行|		|成功拉起应用|是|Pass|
|选择媒体类型主页面|	成功拉起应用| 点击“Please select a media file” |进入选择媒体类型主页面|是|Pass|
|选择其它媒体类型，显示满足条件的文件| 进入选择媒体类型主页面 | 选择媒体类型下拉列表并选择Videos |下面列表中显示所有属于video的文件名|是|Pass|
|选择一个video文件，跳转到媒体文件信息页面| 进入选择媒体类型页面并选择了一个媒体类型 | 点击文件列表中其中一个文件 |跳转到媒体文件信息页面，并在列表中显示图标和文件名|是|Pass|
|返回选择媒体类型页面| 进入媒体文件信息页面 | 点击返回图标 |返回选择媒体类型主页面|是|Pass|