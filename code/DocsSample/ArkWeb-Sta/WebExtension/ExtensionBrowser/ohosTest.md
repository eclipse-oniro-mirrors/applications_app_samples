| 测试功能          | 预置条件     | 输入         | 预期输出         | 是否自动 | 测试结果 |
| ----------------- | ------------ | ------------ | ---------------- | -------- | -------- |
| 获取extension配置 | 设备运转正常，目标应用已安装 | 点击"getManifestData"按钮 | 成功获取并解析extension配置信息，日志输出"NativeMessage allowed_origins match ok" | Yes      | Pass     |
| 连接WebNativeMessagingExtensionAbility | 设备运转正常，目标应用已安装 | 点击"connect"按钮 | 成功连接，触发onConnect回调，日志输出连接ID | Yes      | Pass     |
| 断开NativeMessaging连接 | 已建立连接 | 点击"disconnect"按钮 | 成功断开连接，触发onDisconnect回调 | Yes      | Pass     |
