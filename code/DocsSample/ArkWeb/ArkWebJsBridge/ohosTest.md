### entry:

| 测试功能                     | 预置条件     | 输入                                              | 预期输出                                                | 是否自动 | 测试结果 |
| ---------------------------- | ------------ | ------------------------------------------------- | ------------------------------------------------------- | -------- | -------- |
| 创建特殊端口                 | 设备运转正常 | 应用启动成功，点击 createNoControllerTagPort 按钮 | 调用 testNapi.createWebMessagePorts                     | Yes      | Pass     |
| 建立通信通道                 | 设备运转正常 | 点击createPort按钮                                | 调用 testNapi.createWebMessagePorts                     | Yes      | Pass     |
| 注册消息处理的回调           | 成功创建端口 | 点击setHandler按钮                                | 调用 testNapi.setMessageEventHandler                    | Yes      | Pass     |
| 注册消息处理的回调（多线程） | 设备运转正常 | 点击setHandlerThread按钮                          | 调用 testNapi.setMessageEventHandlerThread              | Yes      | Pass     |
| 发送消息                     | 回调注册成功 | 点击SendString按钮                                | TextArea 中显示 H5 recv result: send string from native | Yes      | Pass     |