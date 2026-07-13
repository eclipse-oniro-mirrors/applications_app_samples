# 增强路由设备选择测试用例归档

## 用例表

| 测试功能                             | 预置条件       | 输入                                 | 预期输出                         | 是否自动 |
|----------------------------------|--------------|------------------------------------|------------------------------|---------|
| 拉起应用                             | 设备正常运行     | -                                  | 成功拉起应用，进入首页                | 是      |
| 进入增强路由设备选择页                   | 位于主页       | 点击“增强路由设备选择页面”               | 进入增强路由设备选择页面              | 是      |
| 查询增强路由支持                        | 增强路由设备页面    | 点击“查询增强路由支持”                      | 调用`audioDeviceEnhanceManager.isEnhancedRoutingSupported`，日志信息显示是否支持增强路由功能 | 是      |
| 创建AudioRenderer                 | 增强路由设备页面    | 点击“创建AudioRenderer”               | 成功创建AudioRenderer实例        | 是      |
| 创建AudioCapturer                 | 增强路由设备页面    | 点击“创建AudioCapturer”               | 请求麦克风权限后成功创建AudioCapturer实例  | 是      |
| 为应用选择输出                          | 增强路由设备页面    | 点击“为应用选择输出”，在弹出列表中选择设备           | 弹出可选输出设备列表，选中后调用`audioDeviceEnhanceManager.selectOutputDevice`为应用选择输出设备 | 是      |
| 为应用选择输入                          | 增强路由设备页面    | 点击“为应用选择输入”，在弹出列表中选择设备           | 弹出可选输入设备列表，选中后调用`audioDeviceEnhanceManager.selectInputDevice`为应用选择输入设备 | 是      |
| 为Renderer选择输出                    | 增强路由设备页面，已创建Renderer | 点击“为Renderer选择输出”            | 弹出可选输出设备列表，选中后调用`audioDeviceEnhanceManager.selectOutputDeviceForAudioRenderer`为播放流选择输出设备。未创建AudioRenderer时提示错误 | 是      |
| 为Capturer选择输入                    | 增强路由设备页面，已创建Capturer | 点击“为Capturer选择输入”            | 弹出可选输入设备列表，选中后调用`audioDeviceEnhanceManager.selectInputDeviceForAudioCapturer`为录制流选择输入设备。未创建AudioCapturer时提示错误 | 是      |
