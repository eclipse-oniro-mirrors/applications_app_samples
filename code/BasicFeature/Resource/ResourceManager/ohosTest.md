|测试功能|预置条件|输入|预期输出|测试结果|
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
|拉起应用|	设备正常运行|不涉及|成功拉起应用|Pass|
|进入主页|	拉起资源API示例页面|不涉及|页面正常展示字符串文本|Pass|
|进入主页|	拉起资源API示例页面|不涉及|页面正常展示字符串数组文本|Pass|
|进入主页|	拉起资源API示例页面|不涉及|页面正常展示单复数字符串文本|Pass|
|进入主页|	拉起资源API示例页面|不涉及|页面正常展示设备状态文本|Pass|
|进入主页|	拉起资源API示例页面|不涉及|页面正常展示设备支持能力文本|Pass|
|进入主页|	拉起资源API示例页面|不涉及|页面正常展示图片字节数文本|Pass|
|进入主页|	拉起资源API示例页面|不涉及|页面正常展示图片编码长度文本|Pass|
|进入主页|	拉起资源API示例页面|不涉及|页面正常展示格式化字符串文本|Pass|
|进入主页|	拉起资源API示例页面|不涉及|页面正常显示指定屏幕分辨率图片|Pass|
|进入主页|	拉起资源API示例页面|不涉及|页面正常显示仅系统查询图片|Pass|
|进入主页|	拉起Overlay示例页面，根据静态overlay脚本安装共享hsp包|不涉及|页面正常展示静态overlay的字符串和图片|Pass|
|进入主页|	拉起Overlay示例页面|点击disable去使能，重启应用|页面正常展示entry应用的字符串和图片|Pass|
|进入主页|	拉起Overlay示例页面|点击enable使能，重启应用|页面正常展示静态overlay的字符串和图片|Pass|
|进入主页|	拉起Overlay示例页面，根据运行时overlay脚本安装共享hsp包|点击addResource进行资源加载|页面正常展示运行时overlay的字符串和图片|Pass|
|进入主页|	拉起Overlay示例页面，根据运行时overlay脚本安装共享hsp包|点击removeResource进行资源移除|页面正常展示运行时overlay覆盖前的字符串和图片|Pass|
|进入主页|	拉起Overlay示例页面，根据运行时overlay脚本安装共享hsp包|点击addResource进行资源加载，杀掉进程。重启应用|运行时overlay失效，页面正常展示运行时overlay覆盖前的字符串和图片|Pass|

## 自动化用例（entry/src/ohosTest）

测试环境：OpenHarmony API 26，hvigor 构建 debug 版 ohosTest HAP，Hypium 1.0.6，
运行入口为 DevEco Studio 的 `entry@ohosTest` 运行配置，参数清单：包名 `ohos.samples.resourcemanager`（`-b`）、测试模块 `entry_test`（`-m`）、运行器路径 `/ets/TestRunner/OpenHarmonyTestRunner`（`-s unittest`）、超时 `-s timeout 600000`，并按 `describe` 追加 `-s class <Describe>`。

| 测试套件 | 用例数 |
|--------------------------------|--------|
| ResourceUtilsDensityTest（utils/ResourceUtilsDensityVolume01） | 91 |
| ResourceUtilsScaleTest（utils/ResourceUtilsScaleVolume02） | 91 |
| ResourceUtilsBytesTest（utils/ResourceUtilsBytesVolume03） | 91 |
| ResourceUtilsB64Test（utils/ResourceUtilsB64Volume04） | 86 |
| ResourceUtilsPluralTest（utils/ResourceUtilsPluralVolume05） | 91 |
| ResourceUtilsSanitizeTest（utils/ResourceUtilsSanitizeVolume06） | 61 |
| ResourceUtilsKeyTest（utils/ResourceUtilsKeyVolume07） | 61 |
| ResourceUtilsBytesB08/B09/B10Test（utils/ResourceUtilsBytesVolume08~10） | 288 |
| ResourceUtilsB64B11/B12/B13Test（utils/ResourceUtilsB64Volume11~13） | 288 |
| ResourceUtilsPluralB14/B15Test（utils/ResourceUtilsPluralVolume14~15） | 192 |
| ResourceUtilsSanitizeB16/B17Test（utils/ResourceUtilsSanitizeVolume16~17） | 192 |
| ResourceUtilsDensityB18/B19Test（utils/ResourceUtilsDensityVolume18~19） | 192 |
| ResourceUtilsKeyB20/B21Test（utils/ResourceUtilsKeyVolume20~21） | 192 |
| ResourceUtilsBytesV22Test（utils/ResourceUtilsBytesVolume22） | 96 |
| ResourceUtilsB64V23Test（utils/ResourceUtilsB64Volume23） | 93 |
| ResourceUtilsSanitizeV24Test（utils/ResourceUtilsSanitizeVolume24） | 96 |
| ResourceUtilsKeyV25Test（utils/ResourceUtilsKeyVolume25） | 96 |
| ResourceUtilsDensityV26Test（utils/ResourceUtilsDensityVolume26） | 96 |
| ResourceUtilsSameResTest（utils/ResourceUtilsSameResVolume27，资源同一性矩阵） | 73 |
| ResourceUtilsSanitizeUnicodeTest（utils/ResourceUtilsSanitizeUnicodeVolume28，Unicode 边界） | 81 |
| ResourceUtilsReal01/02/03/04Test（utils/ResourceUtilsReal01~04） | 75 |
| RouteTablePageTest（utils/RouteTablePageVolume01） | 52 |
| RouteTablePageB02/B03Test（utils/RouteTablePageVolume02~03） | 192 |
| RouteTableCrossTest（utils/RouteTableCrossVolume04，路由方法交叉校验） | 64 |
| RouteTableReal01/02/03Test（utils/RouteTableReal01~03） | 40 |
| OverlayCtrlSwitchTest（service/OverlayCtrlSwitchVolume01） | 57 |
| OverlayCtrlResTest（service/OverlayCtrlResVolume02） | 45 |
| OverlayCtrlMsgB03Test（service/OverlayCtrlMsgVolume03） | 96 |
| OverlayCtrlParseB04Test（service/OverlayCtrlParseVolume04） | 96 |
| OverlayCtrlStateSeqTest（service/OverlayCtrlStateSeqVolume05，状态序列） | 86 |
| OverlayCtrlReal01/02/03Test（service/OverlayCtrlReal01~03） | 61 |
| AccessServiceReal01Test（service/AccessServiceReal01） | 18 |
| AppResAccessReal01Test（appres/AppResAccessReal01，字符串/数组/复数资源读取） | 34 |
| AppResAccessReal02Test（appres/AppResAccessReal02，图片与设备信息读取） | 26 |
| IndexUiReal01Test（ui/IndexUiReal01，首页 UI） | 14 |
| BasicResourcesUiReal01Test（ui/BasicResourcesUiReal01，资源页 UI） | 22 |
| OverlayUiReal01Test（ui/OverlayUiReal01，Overlay 页 UI） | 22 |
| UiFlowReal02Test（ui/UiFlowReal02，跨页往返与状态序列 UI） | 30 |
| UiFlowReal03Test（ui/UiFlowReal03，重复导航与点击序列 UI） | 40 |
| ActsResMgrTest（Ability.test，既有 UI 用例） | 11 |

合计：56 个测试套件，3628 条用例（`List.test.ets` 注册条数与各测试文件 `it(` 计数一致）。
其中 `ui/` 下五个套件共 128 条为 UiTest 驱动的真机 UI 用例（API 26 设备），
与既有的 11 条 `Ability.test` UI 用例共同构成界面层覆盖。
`appres/` 下两个套件共 60 条通过 `TestAbility` 注入的 `UIAbilityContext` 读取被测模块的真实资源，
断言值来自 `string.json`、`strarray.json`、`plural.json` 与 `media/` 的既有内容及其编码关系。

### 测试工程结构

```
entry/src/ohosTest/ets/
|---TestRunner/OpenHarmonyTestRunner.ts   // 测试入口
|---testability/TestAbility.ets           // 注入 UIAbilityContext 的测试 Ability
|---testability/pages/Index.ets           // 测试 Ability 页面
|---test/List.test.ets                    // 56 个套件的注册表
|---test/TestContextHolder.ets            // 测试上下文持有者
|---test/utils/                           // ResourceUtils、RouteTable 相关套件
|---test/service/                         // ResourceAccessService、OverlayController 相关套件
|---test/appres/                          // 资源读取套件
|---test/ui/UiSupport.ets                 // UiTest 封装
|---test/ui/                              // 五个 UI 套件
```

### UiSupport 封装说明

| 方法 | 用途 |
|--------------------------------|--------------------------------|
| `startApp(driver)` | 拉起 `ohos.samples.resourcemanager` 的 `EntryAbility` 并等待首页标题 |
| `backToIndex(driver)` | 回到首页，保证用例不依赖执行顺序 |
| `openResources(driver)` / `openOverlay(driver)` | 从首页进入资源页 / overlay 页 |
| `clickOverlayAction(driver, id)` | 点击 overlay 动作按钮并等待提示稳定 |
| `waitId(driver, id, timeoutMs)` | 以 500 ms 步长轮询节点是否挂载 |
| `textOf` / `idOf` / `typeOf` / `clickableOf` | 节点挂载后读取文本、id、类型、可点击性 |
| `scrollDown` / `scrollUp` | 上滑 / 下滑一屏 |
| `revealId(driver, id)` | 滚动并等待挂载，最多两次 |

页面切换和滑动都会重建节点树，`findComponent` 可能返回 `null`，因此取值统一走先 `waitId` 再取节点的封装，
用例中不直接调用 `findComponent().click()` 或 `findComponent().getText()`。

### 构建与安装

```
$env:DEVECO_SDK_HOME="<sdk 路径>"
hvigorw.bat --mode module -p module=entry@ohosTest -p product=default -p buildMode=debug assembleHap --no-daemon
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
```

测试产物为 `entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap`，包内测试模块名为 `entry_test`。

### 执行说明

单次全量执行会在中后段用例上出现 `TestFinished-ResultCode: -1` 并伴随进程退出，因此按 `describe` 分批执行：每次传入上文参数清单（包名、模块名、运行器路径、超时）并追加 `-s class <Describe>`。

判定标准：`OHOS_REPORT_RESULT: stream=` 中 `Failure: 0, Error: 0`，且 `TestFinished-ResultCode: 0`。
真机实跑记录：56 批 / 3628 例通过；其中 `ui/` 五个套件共 128 例连续两轮全通过。

### 用例设计说明

- 编号：`@tc.number` 全局唯一，按模块分段（UTILS / ROUTE / OVERLAY / ACCESS / APP_RES / UI）；`@tc.name` 与 `it()` 名称逐字一致，格式为 `test<主题><4 位序号>`。
- 维度：每个主题按合法值、边界值、非法值、极值、组合、状态迁移六个维度展开；纯函数套件只引用规格常量，UI 套件只引用已存在的资源与页面节点。
- 日志：模块使用 `hilog.info`，DOMAIN 与 TAG 和主工程一致，不使用 `console.log`。