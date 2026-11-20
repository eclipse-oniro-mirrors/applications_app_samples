# FormExtAbility 测试用例归档

## 用例表

|测试功能|预置条件|输入|预期输出|是否自动|测试结果|
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
|关闭应用|应用正常启动|根据坐标点击屏幕上的返回按钮|应用返回到桌面|是|Pass|
|打开服务列表|桌面存在app|长按app|应用弹出服务列表，其中存在服务卡片选项|是|Pass|
|打开卡片列表|服务列表正常显示|点击服务卡片选项|进入卡片列表页面，底部存在“添加到桌面”按钮|是|Pass|
|添加卡片|进入卡片列表页面|点击“添加到桌面”|页面中存在名为eTSFormExtAbility的卡片|是|Pass|
|在仿桌面应用里添加卡片| 安装Launcher与卡片应用 | 长按卡片应用图标，在弹出菜单中点击“服务卡片”，点击“添加卡片到桌面“ | 成功添加一张ArkTs卡片到仿桌面 |是|Pass|
|在仿桌面应用里添加卡片| 安装Launcher与卡片应用 | 长按卡片应用图标，在弹出菜单中点击“服务卡片”，向左滑动打开第二张服务卡片添加页面，点击“添加卡片到桌面“ | 成功添加一张Js卡片到仿桌面 |是|Pass|
|在仿桌面应用里添加卡片| 安装Launcher与FormProvider应用 | 长按FormProvider应用图标，在弹出菜单中点击“服务卡片”，点击“添加卡片到桌面“ | 成功添加一张ArkTs卡片到仿桌面 |是|Pass|
|在仿桌面应用里添加卡片| 安装Launcher与FormProvider应用 | 长按FormProvider应用图标，在弹出菜单中点击“服务卡片”，向左滑动打开第二张服务卡片添加页面，点击“添加卡片到桌面“ | 成功添加一张Js卡片到仿桌面 |是|Pass|
|在仿桌面应用里删除卡片| 安装Launcher与卡片应用 | 长按已添加在桌面的ArkTs卡片，在弹出菜单中选择”移除“，在弹出的弹窗中选择”移除” | 一张应用的ArkTs卡片从仿桌面移除 |是|Pass|
|在仿桌面应用里删除卡片| 安装Launcher与卡片应用 | 长按已添加在桌面的Js卡片，在弹出菜单中选择”移除“，在弹出的弹窗中选择”移除” | 一张应用的Js卡片从仿桌面移除 |是|Pass|
|在仿桌面应用里删除卡片| 安装Launcher与FormProvider应用 | 长按已添加在桌面的ArkTs卡片，在弹出菜单中选择”移除“，在弹出的弹窗中选择”移除” | 一张应用的ArkTs卡片从仿桌面移除 |是|Pass|
|在仿桌面应用里删除卡片| 安装Launcher与FormProvider应用 | 长按已添加在桌面的Js卡片，在弹出菜单中选择”移除“，在弹出的弹窗中选择”移除” | 一张应用的Js卡片从仿桌面移除 |是|Pass|
|通过push更新卡片| 仿桌面上已有一张卡片应用的Js卡片 | 点击卡片应用图标，点击“修改发布数据”按钮，点击温度输入框，删除原有数据，并输入‘0’，点击“发布数据”按钮，点击Home键 |数据发布页面下方卡片使用方信息正确，launcher桌面上的卡片内容刷新，温度从-30°C显示为0°C|否|Pass|
|通过push更新卡片| 安装Launcher与卡片应用 | 点击卡片应用图标，点击“修改发布数据”按钮，点击温度输入框，删除原有数据，并输入‘0’，点击“发布数据”按钮，点击Home键 |数据发布页面下方卡片使用方信息正确，launcher桌面上的卡片内容刷新，温度从-30°C显示为0°C|否|Pass|
|在仿桌面应用里刷新卡片 | 仿桌面上已有一张卡片应用的Js卡片 | 点击卡片应用图标，点击“修改发布数据”按钮，点击输入框修改温度数据，如0°C，点击“发布数据”，立刻在控制台执行命令“aa dump -a”，点击Home键返回桌面 | Js卡片中温度数据更新为0°C，Js卡片提供方应用没有被拉起 |否|Pass|
|在仿桌面应用里刷新卡片 | 仿桌面上已有一张卡片应用的ArkTs卡片 | 点击卡片应用图标，点击“修改发布数据”按钮，点击输入框修改温度数据，如9°C，点击“发布数据”，立刻在控制台执行命令“aa dump -a”，点击Home键返回桌面 | ArkTs卡片中温度数据更新为9°C，ArkTs卡片提供方应用没有被拉起 |否|Pass|
|在仿桌面应用里刷新卡片 | 仿桌面上已有一张FormProvider应用的Js卡片 | 点击FormProvider应用图标，点击“修改发布数据”按钮，点击输入框修改温度数据，如0°C，点击“发布数据”，立刻在控制台执行命令“aa dump -a”，点击Home键返回桌面 | Js卡片中温度数据更新为0°C，Js卡片提供方应用没有被拉起 |否|Pass|
|在仿桌面应用里刷新卡片 | 仿桌面上已有一张FormProvider应用的ArkTs卡片 | 点击FormProvider应用图标，点击“修改发布数据”按钮，点击输入框修改温度数据，如9°C，点击“发布数据”，立刻在控制台执行命令“aa dump -a”，点击Home键返回桌面 | ArkTs卡片中温度数据更新为9°C，ArkTs卡片提供方应用没有被拉起 |否|Pass|
|在应用中设置订阅条件 | 仿桌面上已有一张卡片应用的Js卡片 | 点击卡片应用图标，点击"修改订阅条件"，选择城市”杭州“，点击Back键返回；点击“修改发布数据”按钮，选择城市”杭州“，点击“发布数据”，点击Home键返回桌面 | Js卡片中城市信息从”沈阳“更新为”杭州“ |否|Pass|
|在应用中设置订阅条件 | 仿桌面上已有一张卡片应用的ArkTs卡片 | 点击卡片应用图标，点击"修改订阅条件"，选择城市”杭州“，点击Back键返回；点击“修改发布数据”按钮，选择城市”杭州“，点击“发布数据”，点击Home键返回桌面 | ArkTs卡片中城市信息从”沈阳“更新为”杭州“ |否|Pass|
|在应用中设置订阅条件 | 仿桌面上已有一张FormProvider应用的Js卡片 | 点击FormProvider应用图标，点击"修改订阅条件"，选择城市”杭州“，点击Back键返回；点击“修改发布数据”按钮，选择城市”杭州“，点击“发布数据”，点击Home键返回桌面 | Js卡片中城市信息从”沈阳“更新为”杭州“ |否|Pass|
|在应用中设置订阅条件 | 仿桌面上已有一张FormProvider应用的ArkTs卡片 | 点击FormProvider应用图标，点击"修改订阅条件"，选择城市”杭州“，点击Back键返回；点击“修改发布数据”按钮，选择城市”杭州“，点击“发布数据”，点击Home键返回桌面 | ArkTs卡片中城市信息从”沈阳“更新为”杭州“ |否|Pass|

## 逻辑用例（数据驱动）

以下 2272 条用例位于 `entry/src/ohosTest/ets/test/logic`，每条用例记录 begin/end 日志，断言前打印入参与实际值；
期望值由被测逻辑在对应输入下的确定性结果给出，覆盖典型值、边界值与非法值。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| -------- | -------- | ---- | -------- | -------- | -------- |
| new FormRecord（构造） | 无 | 90 组输入（FormExtAbility_FormRecordCtor_0001~0090） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| getTemperature（函数） | 无 | 208 组输入（FormExtAbility_GetTemperature_0001~0208） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| temperatureTextOf（函数） | 无 | 208 组输入（FormExtAbility_TemperatureTextOf_0001~0208） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| padZero（函数） | 无 | 120 组输入（FormExtAbility_PadZero_0001~0120） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| formatTime（函数） | 无 | 208 组输入（FormExtAbility_FormatTime_0001~0208） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| storedRecordJsonOf（函数） | 无 | 48 组输入（FormExtAbility_StoredRecordJsonOf_0001~0048） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| temporaryFlagOf（函数） | 无 | 50 组输入（FormExtAbility_TemporaryFlagOf_0001~0050） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| castToNormal（函数） | 无 | 4 组输入（FormExtAbility_CastToNormal_0001~0004） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| nextUpdateCountOf（函数） | 无 | 120 组输入（FormExtAbility_NextUpdateCountOf_0001~0120） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| subscriberIdOf（函数） | 无 | 90 组输入（FormExtAbility_SubscriberIdOf_0001~0090） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| templateSqlOf（函数） | 无 | 90 组输入（FormExtAbility_TemplateSqlOf_0001~0090） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| processProxyKeysOf（函数） | 无 | 1 组输入（FormExtAbility_ProcessProxyKeysOf_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| persistentBindingJsonOf（函数） | 无 | 90 组输入（FormExtAbility_PersistentBindingJsonOf_0001~0090） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| isValidConditionRequest（函数） | 无 | 48 组输入（FormExtAbility_IsValidConditionRequest_0001~0048） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| persistedConditionOf（函数） | 无 | 90 组输入（FormExtAbility_PersistedConditionOf_0001~0090） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| conditionFilePathOf（函数） | 无 | 208 组输入（FormExtAbility_ConditionFilePathOf_0001~0208） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| new FormStoreModel（构造） | 无 | 1 组输入（FormExtAbility_FormStoreModelCtor_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| FormStoreModel.add（实例方法） | 无 | 200 组输入（FormExtAbility_FormStoreModelAdd_0001~0200） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| FormStoreModel.update（实例方法） | 无 | 90 组输入（FormExtAbility_FormStoreModelUpdate_0001~0090） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| FormStoreModel.castToNormal（实例方法） | 无 | 30 组输入（FormExtAbility_FormStoreModelCastToNormal_0001~0030） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| FormStoreModel.remove（实例方法） | 无 | 30 组输入（FormExtAbility_FormStoreModelRemove_0001~0030） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| FormStoreModel.countOf（实例方法） | 无 | 30 组输入（FormExtAbility_FormStoreModelCountOf_0001~0030） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| FormStoreModel flow（调用序列） | 无 | 208 组输入（FormExtAbility_FormStoreModelFlow_0001~0208） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| FormExtLogic（常量契约） | 无 | 10 组输入（FormExtAbility_FormExtLogicConstants_0001~0010） | 返回值与状态逐条符合预期 | 是 | 待执行 |
