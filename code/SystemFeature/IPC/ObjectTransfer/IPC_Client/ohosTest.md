# IPC_Client 测试用例归档

## 用例表

|测试功能|预置条件| 输入       |预期输出|测试结果|
|----------|-----------|----------|----------------|----------------|
|拉起应用|安装sample| 无        |成功拉起应用|Pass|
|检测首页UI|进入首页| 无        |首页UI显示正常|Pass|
|获取服务端代理|“获取服务端代理”按钮显示正常| 点击“获取服务端代理”按钮 |因无服务端，故弹出弹窗“error 16000001”，符合预期|Pass|
|在Parcelable输入框中输入字符串并点击发送|“Parcelable”按钮及输入框显示正常| 输入字符串    |字符串存在输入框|Pass|
|在ArrayBuffer输入框中输入字符串并点击发送|“ArrayBuffer”按钮及输入框显示正常| 输入字符串    |字符串存在输入框|Pass|
|断开连接|“IPC断开通信”按钮显示正常| 点击“IPC断开通信”按钮 |断开通信|Pass|
