# Weather 测试用例归档

## 用例表

|测试功能|预置条件|输入|预期输出|测试结果|
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
|拉起应用| 设备正常运行 | | 成功拉起应用 |Pass|
|侧边栏隐藏和显示| 位于首页、侧边栏显示状态 | 1、判断当前断点是lg<br>2、点击**侧边栏控制按钮**隐藏侧边栏<br>3、点击**侧边栏控制按钮**显示侧边栏 |1、是lg开始执行侧边栏下面的用例，否则用例结束<br>2、侧边栏隐藏<br>3、侧边栏显示|Pass|
|侧边栏点击切换当前城市| 位于首页、侧边栏显示状态 | 1、侧边栏中点击城市切换城市<br/>2、点击侧边栏中控制按钮隐藏侧边栏 |1、切换城市成功<br>2、侧边栏隐藏|Pass|
| 主页切换城市 | 位于首页 | 1、注入左右滑动事件，左右滑动界面 | 1、滑动成功切换当前城市信息<br> |Pass|
| 主页上下滑动 | 位于首页 | 1、主页下滑到顶部<br>2、上滑到顶部 | 1、上下滑动后显示正常，可以查询到底部和顶部组件 |N/A（无对应自动化用例）|
| 更新间隔弹窗 | 位于首页 | 1、点击左上角**更多**按钮<br>2、点击**更新间隔**<br/>3、点击**取消** | 1、弹出菜单<br/>2、弹出更新间隔弹窗<br/>3、弹窗消失 |Pass|
|城市管理| 位于首页 | 1、点击左上角**更多**按钮<br/>2、点击**城市管理** | 1、弹出菜单<br>2、进入城市管理页面，显示默认的两个城市 |Pass|
| 添加城市 | 位于城市管理页面 | 1、点击**添加城市**<br/>2、点击**武汉** | 1、进入添加城市页面<br/>2、返回城市管理页面，武汉添加成功 |Pass|

## 自动化套件归档（ohosTest）

测试模块：`entry_test`（`product/default/src/ohosTest`），基于 Hypium 框架，
注册表 `ets/test/List.test.ets` 共装配 **60 个套件 / 2445 条用例**。
main 源码在 2026-11 完成硬编码整改：用户可见文案与颜色改为资源引用、尺寸与业务参数收敛为常量令牌、
mock 数据中的中文字面量改为 Unicode 转义（值保持不变）。所有断言仍基于同一 Mock 冻结基线
（`common` 模块 `Mock.ts` / `CityInfo.ts` / `FormDate.ts` 等导出），基线值未发生变化。

### 套件构成

| 层级 | 套件数 | 用例数 | 说明 |
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
| L1 真实行为（手写） | 14 | 289 | 1 个 Ability 冒烟套件 + 13 个手写业务套件（Logger / FormDate ×2 / RequestData ×2 / Model / Style / BasicDataSource ×2 / Mock / CityInfo / SunCanvas ×2） |
| L1 规格回归（模板批量，文件头带 `@volume` 标记） | 41 | 2128 | spec 生成器产出，逐条锚定 Mock 冻结基线值；单文件 ≤2000 行 / ≤90 例 |
| L2 UI 探针（`@kit.TestKit` 保守快照） | 5 | 28 | UiHome / UiTitleBar / UiCityList / UiAddCity / UiWindow，经 `UiTestHelper` 探针断言组件存在性与窗口信息 |

### 用例号段（@tc.number 主题内连续唯一，前缀 SUB_WEATHER_&lt;DOM&gt;_NNNN）

| 主题 | 号段 | 主题 | 号段 |
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
| LOGGER | 0001..0012 | MOCK | 0001..0235 |
| FDATE | 0001..0927 | CITY | 0001..0174 |
| REQ | 0001..0445 | CANVAS | 0001..0142 |
| MODEL | 0001..0232 | UI (L2) | 9001..9028 |
| STYLE | 0001..0056 | DS | 0001..0187 |
| ABILITY | 0001..0007 | - | - |

### 构建与运行

构建（模块级 ohosTest HAP）。`build-profile.json5` 的 `compileSdkVersion` / `compatibleSdkVersion` 为字符串
`"26.0.0"`（API 26 起 hvigor 强制要求字符串形态），`signingConfigs` 留空、`products[0].signingConfig` 指向
`default`，属 Sample 仓库惯例（由 IDE 或 `hap-sign-tool` 在构建后补签名），因此 CLI 直接产出的产物为 unsigned。

方式一：IDE 构建。在 IDE 中执行 `Build > Build Hap(s)/APP(s) > Build Hap(s)`，构建目标选择 module `default` 的
`ohosTest`。

方式二：`devecocli`（CI 与脚本化场景，本工程实测方式，使用 DevEco Studio 内置 hvigor，无需联网拉取依赖）：

```shell
devecocli build --modules default@ohosTest
```

方式三：工程根目录自带的 `hvigorw` / `hvigorw.bat`（wrapper 首次运行会先安装 hvigor，需可访问 npm 源）：

```shell
# Windows
hvigorw.bat --mode module -p module=default@ohosTest assembleHap --no-daemon
# Linux / macOS
./hvigorw --mode module -p module=default@ohosTest assembleHap --no-daemon
```

```text
# 产物：product/default/build/default/outputs/ohosTest/default-ohosTest-unsigned.hap
```

真机只能安装签名后的 HAP（直接安装 unsigned 产物会报 `code:9568320 error: no signature file`）：

- 在 IDE 中 `File > Project Structure > Signing Configs` 勾选自动签名，构建即产出已签名 HAP；
- 或在 CI 中用 SDK 自带材料手工签名：`toolchains/lib` 下的 `hap-sign-tool.jar` + `OpenHarmony.p12`、
  `OpenHarmonyProfileRelease.pem`、`UnsgnedReleasedProfileTemplate.json`，依次执行 `generate-app-cert`
  （生成 `app-cert-chain.cer`）、`sign-profile`（生成 `.p7b`）、`sign-app -inForm zip`（产出
  `default-ohosTest-signed.hap`）。注意 profile 的 `bundle-name` 必须是 `ohos.samples.weather`；
  若设备上已装过其它签名的同包名应用，需先 `hdc uninstall ohos.samples.weather` 再安装。

```shell
hdc install product/default/build/default/outputs/ohosTest/default-ohosTest-signed.hap
```

真机安装后全量运行：

```shell
hdc shell aa test -b ohos.samples.weather -m entry_test -s unittest OpenHarmonyTestRunner
```

按套件分批运行（`-s class` 指定套件的 describe 名）：

```shell
hdc shell aa test -b ohos.samples.weather -m entry_test -s unittest OpenHarmonyTestRunner -s class AbilityTest
```

单进程整跑 2445 条用例会触发 App died，按下表分 9 批执行（每批 ≤8 个套件 / ≤350 条用例）：

| 批次 | `-s class` 套件清单 | 套件数 | 用例数 |
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
| 1 | AbilityTest、CanvasMoon0001、CanvasReal01、CanvasReal02、CanvasRound0001、CanvasSun0001、CityAdd0001、CityList0001 | 8 | 235 |
| 2 | CityRaw0001、CityReal01、DsLoop0001、DsReal01、DsReal02、DsSnap0001、DsSnap0002、FdateFill0002 | 8 | 311 |
| 3 | FdateFill0001、FdateMday0001、FdateMday0002、FdateMday0003 | 4 | 340 |
| 4 | FdateMday0004、FdateMday0005、FdateMday0006、FdateMday0007 | 4 | 340 |
| 5 | FdateMday0008、FdateMday0009、FdateReal01、FdateReal02、FdateSlot0001、LoggerReal01、MockAqi0001、MockDay0001 | 8 | 263 |
| 6 | MockHour0001、MockHour0002、MockIndex0001、MockReal01、MockTop0001、ModelReal01、ModelSnap0001 | 7 | 312 |
| 7 | ModelSnap0002、ModelSnap0003、ReqAir0001、ReqBg0001、ReqHeader0001、ReqHours0001 | 6 | 320 |
| 8 | ReqHours0002、ReqLife0001、ReqReal01、ReqReal02、ReqSide0001、ReqWeek0001、StyleCat0001、StyleReal01 | 8 | 272 |
| 9 | StyleRel0001、StyleVal0001、UiAddCity0001、UiCityList0001、UiHome0001、UiTitleBar0001、UiWindow0001 | 7 | 52 |

逐批命令示例（第 1 批的第 1 个套件）：

```shell
hdc shell aa test -b ohos.samples.weather -m entry_test -s unittest OpenHarmonyTestRunner -s class AbilityTest -s timeout 60000
```

> 执行前置条件：用例通过 `@kit.TestKit` 的 `Driver.create()` 连接 AAMS，执行前需保证设备处于解锁状态、
> 无系统弹窗（如“USB 连接方式”）或其它应用占据顶层窗口；若出现 `Can not connect to AAMS,
> RET_ERR_CONNECTION_EXIST`，重启设备后重跑即可。

> 说明：每条用例均含 ≥3 条有效断言（`expect(...)` 与 `driver.assertComponentExist(...)` 合并计数，实测最少 3 条、
> 合计 7657 条）与完整 @tc 元数据块；@tc.level 注释与实际 `Level.LEVELn` 枚举保持一致。
> 2026-11 完成硬编码整改，并修复 `FormDate.fill()` 的双位数截断缺陷（原实现把 `10` 及以上数字返回为空串），
> 受影响的 288 条断言已按修复后的行为同步重算，并已在真机完成全量复跑（见下文“测试结果”）。

## 测试结果

执行环境：OpenHarmony-7.1.0.21（API 26），设备类型 default，真机 `d629034339413535311028a580d3ab00`，2026-11-19，`ohos.samples.weather` + `entry_test` + `OpenHarmonyTestRunner`。

### 本轮执行记录（2026-11-19，整改后全量复跑）

|项目|数值|
|--------------------------------|--------------------------------|
|测试套件|60|
|用例总数|2445|
|通过|2445|
|失败|0|
|错误|0|

> 执行方式：`devecocli build --modules default@ohosTest` 产出 unsigned HAP，经 `hap-sign-tool` 签名后
> `hdc install` 安装，再按上文 9 批 `aa test -s class` 逐批执行（单进程整跑会触发 App died，分批规避）。
> 9 批 `Tests run` 分别为 235 / 311 / 340 / 340 / 263 / 312 / 320 / 272 / 52，合计 Pass=2445、Failure=0、Error=0。

### 与上一轮基线的差异

上一轮基线同为 2445/2445 通过，但那是 `FormDate.fill()` 修复与硬编码整改之前的执行记录；本轮在整改后的
代码上重新执行，新增/变更的断言（测试模块 Logger 单占位符、FormDate 模板字符串、`@tc.level` 枚举对齐）
全部通过。复跑过程中定位并修复了 3 个导致构建或执行失败的问题：

1. `build-profile.json5` 的 `compileSdkVersion` / `compatibleSdkVersion` 由数字 `26` 改为字符串 `"26.0.0"`
   （API 26 起 hvigor 强制要求字符串形态，否则 `hvigor sync` 直接报 00306042 Specification Limit Violation）；
2. 测试运行器目录 `ets/TestRunner` 改为 `ets/testrunner` 并同步 `module.json5` 的 `testRunner.srcPath`
   （运行期按小写路径解析，大小写不符时报 `Cannot find module ... which is application Entry Point` 崩溃）；
3. `ReqReal02::testReq0048` 的时段断言改为按行内时刻 `00:00` 计算（原实现取设备当前整点，午后执行必然失败）。

