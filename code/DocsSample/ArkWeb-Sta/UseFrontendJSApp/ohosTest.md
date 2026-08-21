# 应用侧与前端页面的交互 测试用例归档

## 用例表

### entry

|测试功能|预置条件|输入|预期输出|是否自动|测试结果|
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
|应用侧调用前端页面函数|设备运转正常|应用启动成功，点击runJavaScript按钮|文本字体变绿|是|Pass|
|runJavaScriptCodePassed|设备运转正常|点击runJavaScriptCodePassed按钮|向前端传递自定义JavaScript代码|是|Pass|
|callArkTS|设备运转正常|点击Click Me!按钮|文本字体变红|是|Pass|

### JavaScriptProxy

|测试功能|预置条件|输入|预期输出|是否自动|测试结果|
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
|前端页面调用应用侧函数|设备运转正常|应用启动成功，点击deleteJavaScriptRegister按钮|从Web端删除已注册对象|是|Pass|
|触发callArkTS函数|设备运转正常|点击Click Me!按钮|界面显示ArkTS Hello world|是|Pass|

### RegisterJavaScriptProxy

|测试功能|预置条件|输入|预期输出|是否自动|测试结果|
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
|前端页面调用应用侧函数|设备运转正常|应用启动成功，点击refresh按钮|刷新网页|是|Pass|
|注册testObj|设备运转正常|点击Register JavaScript To Window按钮|将testObj注册到前端|是|Pass|
|删除testObjName|注册testObjName对象|点击deleteJavaScriptRegister按钮|删除Web端注册的testObjName对象|是|Pass|
|callArkTS|testObj注册到前端|点击Click Me!按钮|触发callArkTS函数|是|Pass|

### RegisterJavaScriptProxyOne

|测试功能|预置条件|输入|预期输出|是否自动|测试结果|
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
|触发callArkTS函数|设备运转正常|点击Click Me!按钮|触发callArkTS函数|是|Pass|
|删除testObjName|注册testObjName对象|点击deleteJavaScriptRegister按钮|删除Web端注册的testObjName对象|是|Pass|
|callArkTS|testObj注册到前端|点击Click Me!按钮|不触发callArkTS函数|是|Pass|

### RegisterJavaScriptProxyTwo

|测试功能|预置条件|输入|预期输出|是否自动|测试结果|
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
|触发callArkTS函数|testObj注册到前端|点击Click Me!按钮|触发callArkTS函数|是|Pass|
|删除testObjName|注册testObjName对象|点击deleteJavaScriptRegister按钮|删除Web端注册的testObjName对象|是|Pass|
|触发callArkTS函数|testObj注册到前端|点击Click Me!按钮|不触发callArkTS函数|是|Pass|

### UsageOfComplexTypes_one

|测试功能|预置条件|输入|预期输出|是否自动|测试结果|
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
|前端页面调用应用侧函数|设备运转正常|应用启动成功，点击refresh按钮|刷新网页|是|Pass|
|注册testObj|设备运转正常|点击Register JavaScript To Window按钮|将testObj注册到前端|是|Pass|
|删除testObjName|注册testObjName对象|点击deleteJavaScriptRegister按钮|删除Web端注册的testObjName对象|是|Pass|
|callArkTS|testObj注册到前端|点击Click Me!按钮|触发callArkTS函数|是|Pass|

### UsageOfComplexTypes_two

|测试功能|预置条件|输入|预期输出|是否自动|测试结果|
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
|前端页面调用应用侧函数|设备运转正常|应用启动成功，点击refresh按钮|刷新网页|是|Pass|
|注册testObj|设备运转正常|点击Register JavaScript To Window按钮|将testObj注册到前端|是|Pass|
|删除testObjName|注册testObjName对象|点击deleteJavaScriptRegister按钮|删除Web端注册的testObjName对象|是|Pass|
|callArkTS|testObj注册到前端|点击Click Me!按钮|触发callArkTS函数|是|Pass|

### UsageOfComplexTypes_three

|测试功能|预置条件|输入|预期输出|是否自动|测试结果|
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
|前端页面调用应用侧函数|设备运转正常|应用启动成功，点击refresh按钮|刷新网页|是|Pass|
|注册testObj|设备运转正常|点击Register JavaScript To Window按钮|将testObj注册到前端|是|Pass|
|删除testObjName|注册testObjName对象|点击deleteJavaScriptRegister按钮|删除Web端注册的testObjName对象|是|Pass|
|callArkTS|testObj注册到前端|点击Click Me!按钮|触发callArkTS函数|是|Pass|

### UsageOfComplexTypes_four

|测试功能|预置条件|输入|预期输出|是否自动|测试结果|
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
|前端页面调用应用侧函数|设备运转正常|应用启动成功，点击refresh按钮|刷新网页|是|Pass|
|注册testObj|设备运转正常|点击Register JavaScript To Window按钮|将testObj注册到前端|是|Pass|
|删除testObjName|注册testObjName对象|点击deleteJavaScriptRegister按钮|删除Web端注册的testObjName对象|是|Pass|
|callArkTS|testObj注册到前端|点击Click Me!按钮|触发callArkTS函数|是|Pass|

### UsageOfComplexTypes_five

|测试功能|预置条件|输入|预期输出|是否自动|测试结果|
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
|前端页面调用应用侧函数|设备运转正常|应用启动成功，点击refresh按钮|刷新网页|是|Pass|
|注册testObj|设备运转正常|点击Register JavaScript To Window按钮|将testObj注册到前端|是|Pass|
|删除testObjName|注册testObjName对象|点击deleteJavaScriptRegister按钮|删除Web端注册的testObjName对象|是|Pass|
|callArkTS|testObj注册到前端|点击Click Me!按钮|触发callArkTS函数|是|Pass|

### Promise_one

|测试功能|预置条件|输入|预期输出|是否自动|测试结果|
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
|前端页面调用应用侧函数|设备运转正常|应用启动成功，点击refresh按钮|刷新网页|是|Pass|
|注册testObj|设备运转正常|点击Register JavaScript To Window按钮|将testObj注册到前端|是|Pass|
|删除testObjName|注册testObjName对象|点击deleteJavaScriptRegister按钮|删除Web端注册的testObjName对象|是|Pass|
|触发callArkTS函数|testObj注册到前端|点击Click Me!按钮|控制台在10s左右打印fail|是|Pass|

### Promise_two

|测试功能|预置条件|输入|预期输出|是否自动|测试结果|
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
|前端页面调用应用侧函数|设备运转正常|应用启动成功，点击refresh按钮|刷新网页|是|Pass|
|注册testObj|设备运转正常|点击Register JavaScript To Window按钮|将testObj注册到前端|是|Pass|
|删除testObjName|注册testObjName对象|点击deleteJavaScriptRegister按钮|删除Web端注册的testObjName对象|是|Pass|
|callArkTS|testObj注册到前端|点击Click Me!按钮|触发callArkTS函数|是|Pass|

### entry3

|测试功能|预置条件|输入|预期输出|是否自动|测试结果|
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
|建立应用侧与前端页面数据通道|设备运转正常|应用启动成功，点击postMessage按钮|初始化消息端口|是|Pass|
|SendDataToHTML|设备运转正常，初始化消息端口|点击SendDataToHTML按钮|从ETS向HTML发送消息|是|Pass|
|SendToEts|设备运转正常，初始化消息端口，输入框有消息|点击SendToEts按钮|从HTML向ETS发送消息|是|Pass|

### entry4

|测试功能|预置条件|输入|预期输出|是否自动|测试结果|
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
|应用侧与前端页面的相互调用(C/C++)|设备运转正常|应用启动成功，点击runJS hello按钮|调用testNapi.runJavaScript|是|Pass|
|testNdkProxyObjMethod1|设备运转正常|点击test Native Development Kit method1!按钮|调用testNdkProxyObjMethod1|是|Pass|

### entry5

|测试功能|预置条件|输入|预期输出|是否自动|测试结果|
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
|创建特殊端口|设备运转正常|应用启动成功，点击createNoControllerTagPort按钮|调用testNapi.createWebMessagePorts|是|Pass|
|建立通信通道|设备运转正常|点击createPort按钮|调用testNapi.createWebMessagePorts|是|Pass|
|注册消息处理的回调|成功创建端口|点击setHandler按钮|调用testNapi.setMessageEventHandler|是|Pass|
|注册消息处理的回调（多线程）|设备运转正常|点击setHandlerThread按钮|调用testNapi.setMessageEventHandlerThread|是|Pass|
|发送消息|回调注册成功|点击SendString按钮|TextArea中显示H5 recv result: send string from native|是|Pass|

### entry6

|测试功能|预置条件|输入|预期输出|是否自动|测试结果|
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
|应用侧与前端页面的相互调用(C/C++)|设备运转正常|应用启动成功，点击runJS hello按钮|调用testNapi.runJavaScript|是|Pass|
|testNdkProxyObjMethod1|设备运转正常|点击test Native Development Kit method1!按钮|调用testNdkProxyObjMethod1|是|Pass|
