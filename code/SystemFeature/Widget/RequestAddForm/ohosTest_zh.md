# 主动添加卡片到桌面测试用例归档

## 用例表

|测试功能|预置条件|输入|预期输出|是否自动|测试结果|
|:------------------------------:|:------------------------------:|:------------------------------:|:------------------------------:|:------------------------------:|:------------------------------:|
|在应用中发布数据代理卡片到桌面| 安装数据代理卡片应用AppStore | 点击应用图标，点击"添加ArkTs卡片到桌面"按钮 | 成功添加一张ArkTs卡片到桌面 |是|Pass|
|在应用中发布数据代理卡片到桌面| 安装数据代理卡片应用AppStore | 点击应用图标，点击"添加Js卡片到桌面"按钮 | 成功添加一张Js卡片到桌面 |是|Pass|

## ohosTest 自动化测试套件

除上述归档用例外，`entry/src/ohosTest/ets/test/` 下按 hypium 规范补充了以下自动化套件（全部 L0，含 `@tc.number/@tc.name/@tc.desc/@tc.type/@tc.size` 五项元数据）：

|套件文件|主题|规模|编号段|用例数|
|:------------------------------:|:------------------------------:|:------------------------------:|:------------------------------:|:------------------------------:|
|FormDimensionMappingCore.test.ets|FormDimension 维度枚举映射|SMALLTEST|0001-0025|25|
|WantParamsModelCore.test.ets|requestPublishForm 发布请求参数模型|SMALLTEST|0101-0140|40|
|FormBindingDataModelCore.test.ets|FormBindingData/ProxyData 数据模型|SMALLTEST|0201-0250|50|
|LoggerUtilityCore.test.ets|Logger 日志工具类|SMALLTEST|0301-0320|20|
|IndexPageUiState.test.ets|Index 页面按钮 UI 核心路径|MEDIUMTEST|1001-1012|12|

说明：
- 卡片发布（requestPublishForm）依赖系统能力，逻辑层用例只覆盖可独立运行的纯逻辑（枚举、Want 参数模型、绑定数据模型、日志工具），不直接触发发布。
- UI 层用例仅使用 `ON.id('addArkTsCard')` / `ON.id('addJsCard')` 定位组件。
- 套件已在 `List.test.ets` 注册，通过 `TestAbility` 加载运行：`aa test -b com.ohos.hag.famanager -m entry_test -s unittest OpenHarmonyTestRunner -s class <套件名> -s timeout 15000`。
- 编译验证：`hvigorw --no-daemon -p module=entry@ohosTest assembleHap`。