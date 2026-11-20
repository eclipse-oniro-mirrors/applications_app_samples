### entry:

| 测试功能                          | 预置条件     | 输入                               | 预期输出                   | 是否自动 | 测试结果 |
| --------------------------------- | ------------ | ---------------------------------- | -------------------------- | -------- | -------- |
| 应用侧与前端页面的相互调用(C/C++) | 设备运转正常 | 应用启动成功，点击 runJS hello按钮 | 调用testNapi.runJavaScript | Yes      | Pass     |
| testNdkProxyObjMethod1            | 设备运转正常 | 点击test Native Development Kit method1!按钮          | 调用testNdkProxyObjMethod1 | Yes      | Pass     |