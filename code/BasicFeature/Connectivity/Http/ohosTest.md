# Http 测试用例归档

## 用例表

|测试功能|预置条件|输入|预期输出|测试结果|
|----------|-----------|-----------------|----------------|----------------|
|拉起应用|安装sample|		|成功拉起应用|Pass|
|检测首页UI|进入首页| |首页UI显示正常|Pass|
|增加key、value键值对|“增加”按钮显示正常|点击两次“增加”按钮|key、value的键值对出现3对|Pass|
|减少ley、value键值对|“减少”按钮显示正常|点击“减少”按钮|key、value的键值对仅剩2对|Pass|
|重置键值对|“重置”按钮显示正常|点击“重置”按钮|key、value的键值对仅剩1对|Pass|
|发送正确的请求|首页GET栏显示正常，“确认”按钮显示正常|输入正确的网址，点击“确认”按钮|返回结果符合预期|Pass|
|返回首页|结果页面显示正常|点击“返回”按钮|返回到首页|Pass|
|发送错误的请求|GET栏显示正常|不输入http地址，点击“确认”按钮|返回结果符合预期|Pass|