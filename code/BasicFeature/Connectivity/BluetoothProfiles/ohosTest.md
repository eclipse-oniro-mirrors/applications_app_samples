# BluetoothProfiles 测试说明

本工程 `entry/src/ohosTest` 共 **1784 条**用例（43 个用例文件 / 54 个 `describe` 套件），编号前缀
`SUB_BLUETOOTH_`。用例按「既有场景 + 维度矩阵 + 交叉组合 + 设备真调用」分层，全部 `import`
`main/ets` 下的正式导出，不在用例里重写业务规则。

## 测试环境

| 项 | 取值 |
| --- | --- |
| 设备 | 调试真机（`hdc list targets` 单设备） |
| 系统 | OpenHarmony 7.1.0.22 / API 26 |
| SDK | `compatibleSdkVersion` / `targetSdkVersion` / `compileSdkVersion` 均为 `26.0.0`，`runtimeOS` 为 `OpenHarmony` |
| 测试框架 | `@ohos/hypium` + `OpenHarmonyTestRunner`（模块名 `entry_test`） |
| 签名 | DevEco 自动签名（debugKey），主包与测试包同一套证书 |
| 权限 | 仅 `ohos.permission.ACCESS_BLUETOOTH`（user_grant，`when: inuse`） |

## 测试步骤

### 1. 构建主包与测试包

在 DevEco Studio 里 `Build → Build Hap(s)/APP(s)`；命令行等价写法：

```powershell
# 先让 hvigor 找到 OpenHarmony SDK：local.properties 的 sdk.dir，或设 OHOS_BASE_SDK_HOME
& "<DevEco Studio>/tools/hvigor/bin/hvigorw.bat" --mode module `
  -p module=entry@default -p product=default assembleHap --no-daemon

& "<DevEco Studio>/tools/hvigor/bin/hvigorw.bat" --mode module `
  -p module=entry@ohosTest -p product=default assembleHap --no-daemon
```

判定成功看输出里的 `BUILD SUCCESSFUL`，不看 exit code（签名 WARN 走 stderr，PowerShell 会把退出码置 1）。

### 2. 安装两个包

主包与测试包都必须装：真实设备用例会在主包里创建 AG 实例，只装测试包会报 `startAbility failed`。

```powershell
hdc install -r entry/build/default/outputs/default/entry-default-signed.hap
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
```

未配置签名时产物是 `entry-default-unsigned.hap` 与 `entry-ohosTest-unsigned.hap`，unsigned 包无法安装，
需先在 `build-profile.json5` 里配好 `signingConfigs` 与产品侧的 `"signingConfig": "default"`。

### 3. 运行

IDE 方式：右键 `entry/src/ohosTest/ets/test/List.test.ets` → Run，执行 `testsuite()` 里登记的全部
42 个注册函数；**不要勾选「安装选项 → 仅测试包」**。

命令行方式（单设备，`-w` 为总等待上限，不加 `-s class` 即跑全部套件）：

```powershell
hdc shell <test-subcommand> -b com.example.bluetoothprofiles -m entry_test `
  -s unittest OpenHarmonyTestRunner -w 1800000
```

`<test-subcommand>` 换成设备镜像自带的应用自动化测试子命令，可在 `hdc shell` 里执行 `help`
查看当前系统实际支持的命令名。

结果看这一行：

```text
OHOS_REPORT_RESULT: stream=Tests run: 1784, Failure: 0, Error: 0, Pass: 1784, Ignore: 0
```

失败时堆栈在 `OHOS_REPORT_STATUS: stream=Error in <用例名>, expect A equals B` 里，按用例名回查文件即可。

### 4. 判定口径

连续两轮 `Failure: 0` 才算通过。非 `0` 时先排除三类环境噪声：锁屏、`ACCESS_BLUETOOTH` 未授予、
测试包与主包签名不一致。

## 用例规范

用例名统一 `test<Area><NNNN>` / `device<Area><NNNN>`，`@tc.number` 全局唯一，`@tc.name` 与 `it()`
名称逐字一致，每条用例带 `@tc.desc`（英文）、`@tc.size`、`@tc.type`、`@tc.level` 元数据：

```ets
/**
 * @tc.number SUB_BLUETOOTH_DEVICE_REAL_0001
 * @tc.name deviceReal0001
 * @tc.desc Verify the production factory returns an object shaped like the session contract.
 */
```

`List.test.ets` 的 `testsuite()` 里按顺序逐个**直接调用**各文件的注册函数。必须写成 `xxxTest();`
这种直接调用语句——DevEco 运行测试前会静态扫描该文件，表驱动写法（数组 + `forEach`）会被判成
「未注册任何函数」，报 00502002 / 00502004。

断言口径是「硬断言」：每条用例至少 3 处 `expect(`，不写恒真条件，`catch` 分支内必有断言，
单行不超过 120 字符，文件名大驼峰无下划线。

### 资源绑定（文案资源化后新增）

模型层只产出 `string.json` 的资源键，用例断言的却是真实文案，因此测试进程必须先拿到资源管理器：

```ets
bindResourceManager(abilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager);
```

绑定语句放在 `BluetoothProfiles.test.ets` 的注册函数开头（`testsuite()` 里第一个注册的套件）。
不能放到 `List.test.ets`：入口文件只允许 `import` `*.test` 模块，否则 DevEco 静态扫描会认作
「未注册」并报 00502002。新增套件只要排在它之后注册，就能取到本地化文本。

## 分层与覆盖

| 层 | 文件 | 用例 |
| --- | --- | --- |
| 既有场景 | `BluetoothProfiles`、`BluetoothProfileData`、`BluetoothProfileDevice` | 61 |
| 纯函数矩阵 | `ProfileState*`、`ProfileAddressMatrix`、`ProfileCatalogMatrix`、`ProfileLogStoreMatrix`、`ProfileFormatMatrix`、`ProfileSnapshotMatrix`、`ProfileViewStateMatrix`、`ProfileErrorUtilMatrix`、`ProfileConstantContract` | 405 |
| 会话状态机 | `Session*`（Create / Device / State / Subscribe / Release / Callback） | 100 |
| 质量轴 | `QualityInvariantMatrix`、`QualityBoundaryMatrix`、`QualitySequenceMatrix`、`QualityFeatureMatrix` | 90 |
| 设备侧 | `DeviceEnumMatrix`、`DeviceAccessMatrix`、`DeviceRealSessionMatrix` | 36 |
| 交叉矩阵 | `CodeCross`、`StateCross`、`AddressCross`、`FormatCross`、`FormatTruncateCross`、`LogCross`、`CatalogCross`、`SnapshotCross`、`ViewCross`、`SessionCross`、`FeatureCross`、`ThrownTextCross` | 795 |
| 调用链与立方 | `SessionChain`、`SnapshotCube`、`ContractGrid`、`AddressGrid` | 297 |
| 合计 | 43 个用例文件 | 1784 |

## 套件清单

顺序即 `testsuite()` 里 43 条调用语句的顺序，与执行顺序一致：先既有场景与纯逻辑，再设备真调用，
最后交叉矩阵与立方。

| # | 文件 | 套件 | 用例 |
| ---: | --- | --- | ---: |
| 1 | `BluetoothProfiles.test.ets` | `BluetoothProfilesCatalogTest` / `BluetoothProfilesStateTest` / `BluetoothProfilesConstantsTest` | 15 |
| 2 | `BluetoothProfileData.test.ets` | `BluetoothProfileAddressTest` / `BluetoothProfileLogTest` / `BluetoothProfileFormatTest` / `BluetoothProfileErrorTest` / `BluetoothProfileSnapshotTest` / `BluetoothProfileThemeTest` | 27 |
| 3 | `BluetoothProfileDevice.test.ets` | `BluetoothProfileEnumAlignmentTest` / `BluetoothProfileAccessTest` / `BluetoothProfileSessionDeviceTest` / `BluetoothProfileFeatureDeviceTest` / `BluetoothProfileLoggerTest` | 19 |
| 4 | `ProfileStateClassify.test.ets` | `BluetoothProfileStateClassifyTest` | 41 |
| 5 | `ProfileStateText.test.ets` | `BluetoothProfileStateTextTest` | 45 |
| 6 | `ProfileStatePredicate.test.ets` | `BluetoothProfileStatePredicateTest` | 25 |
| 7 | `ProfileAddressMatrix.test.ets` | `BluetoothProfileAddressMatrixTest` | 38 |
| 8 | `ProfileCatalogMatrix.test.ets` | `BluetoothProfileCatalogMatrixTest` | 47 |
| 9 | `ProfileLogStoreMatrix.test.ets` | `BluetoothProfileLogStoreMatrixTest` | 62 |
| 10 | `ProfileFormatMatrix.test.ets` | `BluetoothProfileFormatMatrixTest` | 54 |
| 11 | `ProfileSnapshotMatrix.test.ets` | `BluetoothProfileSnapshotMatrixTest` | 22 |
| 12 | `ProfileViewStateMatrix.test.ets` | `BluetoothProfileViewStateMatrixTest` | 17 |
| 13 | `ProfileErrorUtilMatrix.test.ets` | `BluetoothProfileErrorUtilMatrixTest` | 48 |
| 14 | `ProfileConstantContract.test.ets` | `BluetoothProfileConstantContractTest` | 6 |
| 15 | `SessionCreateMatrix.test.ets` | `BluetoothProfileSessionCreateTest` | 16 |
| 16 | `SessionDeviceMatrix.test.ets` | `BluetoothProfileSessionDeviceMatrixTest` | 18 |
| 17 | `SessionStateMatrix.test.ets` | `BluetoothProfileSessionStateTest` | 20 |
| 18 | `SessionSubscribeMatrix.test.ets` | `BluetoothProfileSessionSubscribeTest` | 22 |
| 19 | `SessionReleaseMatrix.test.ets` | `BluetoothProfileSessionReleaseTest` | 8 |
| 20 | `SessionCallbackMatrix.test.ets` | `BluetoothProfileSessionCallbackTest` | 16 |
| 21 | `QualityInvariantMatrix.test.ets` | `BluetoothProfileQualityInvariantTest` | 26 |
| 22 | `QualityBoundaryMatrix.test.ets` | `BluetoothProfileQualityBoundaryTest` | 38 |
| 23 | `QualitySequenceMatrix.test.ets` | `BluetoothProfileQualitySequenceTest` | 9 |
| 24 | `QualityFeatureMatrix.test.ets` | `BluetoothProfileQualityFeatureTest` | 17 |
| 25 | `DeviceEnumMatrix.test.ets` | `BluetoothProfileDeviceEnumTest` | 19 |
| 26 | `DeviceAccessMatrix.test.ets` | `BluetoothProfileDeviceAccessTest` | 9 |
| 27 | `DeviceRealSessionMatrix.test.ets` | `BluetoothProfileDeviceRealTest` | 8 |
| 28 | `CodeCrossMatrix.test.ets` | `BluetoothProfileCodeCrossTest` | 52 |
| 29 | `StateCrossMatrix.test.ets` | `BluetoothProfileStateCrossTest` | 27 |
| 30 | `AddressCrossMatrix.test.ets` | `BluetoothProfileAddressCrossTest` | 96 |
| 31 | `FormatCrossMatrix.test.ets` | `BluetoothProfileFormatCrossTest` | 120 |
| 32 | `FormatTruncateCrossMatrix.test.ets` | `BluetoothProfileFormatTruncateCrossTest` | 112 |
| 33 | `LogCrossMatrix.test.ets` | `BluetoothProfileLogCrossTest` | 84 |
| 34 | `CatalogCrossMatrix.test.ets` | `BluetoothProfileCatalogCrossTest` | 65 |
| 35 | `SnapshotCrossMatrix.test.ets` | `BluetoothProfileSnapshotCrossTest` | 52 |
| 36 | `ViewCrossMatrix.test.ets` | `BluetoothProfileViewCrossTest` | 43 |
| 37 | `SessionCrossMatrix.test.ets` | `BluetoothProfileSessionCrossTest` | 49 |
| 38 | `FeatureCrossMatrix.test.ets` | `BluetoothProfileFeatureCrossTest` | 31 |
| 39 | `ThrownTextCrossMatrix.test.ets` | `BluetoothProfileThrownTextCrossTest` | 64 |
| 40 | `SessionChainMatrix.test.ets` | `BluetoothProfileSessionChainTest` | 57 |
| 41 | `SnapshotCubeMatrix.test.ets` | `BluetoothProfileSnapshotCubeTest` | 114 |
| 42 | `ContractGridMatrix.test.ets` | `BluetoothProfileContractGridTest` | 30 |
| 43 | `AddressGridMatrix.test.ets` | `BluetoothProfileAddressGridTest` | 96 |

## 让出主线程

hypium 把整批用例串在同一个主线程任务里执行，`await` 一个已完成的 Promise 只产生微任务，不会把
控制权交还事件循环；累计占用超过 6 s 时系统判定 `THREAD_BLOCK_6S` 并结束进程，报告里表现为
`App died`。

`util/TestTick.ets` 用 `tick()` 解决：每 10 条用例插入一次 `setTimeout(resolve, 1)`，让主线程回到
事件循环、占用计时归零；定时器延迟必须大于 0，`0 ms` 会被并进同一任务。每个 `describe` 注册一个
`beforeEachIt(async () => { await tick(); })`。

## 测试结果

| 项 | 结果 |
| --- | --- |
| 构建 | `entry@default` 与 `entry@ohosTest` 均 `BUILD SUCCESSFUL`（`runtimeOS: OpenHarmony`，含无签名时的 unsigned 构建） |
| 安装 | `hdc install -r` 主包与测试包均 `install bundle successfully` |
| 第 1 轮（首轮重建） | `Tests run: 1784, Failure: 0, Error: 0, Pass: 1784, Ignore: 0` |
| 第 2 轮（同一产物连跑） | `Tests run: 1784, Failure: 0, Error: 0, Pass: 1784, Ignore: 0` |
| 第 3 轮（资源文案修正后重建） | `Tests run: 1784, Failure: 0, Error: 0, Pass: 1784, Ignore: 0` |
| 第 4 轮（`runtimeOS: OpenHarmony` + domain `0xF811` 重建） | `Tests run: 1784, Failure: 0, Error: 0, Pass: 1784, Ignore: 0` |
| 第 5 轮（同一产物连跑） | `Tests run: 1784, Failure: 0, Error: 0, Pass: 1784, Ignore: 0` |

第 1～3 轮覆盖用例基线与界面文案资源化；第 4～5 轮覆盖本轮配置整改：`runtimeOS` 由
`商用发行版` 改为 `OpenHarmony`（两个 `module.json5` 的 `deviceTypes` 同步去掉 OpenHarmony SDK 里不存在的
`phone`），hilog domain 由 `0x0B5F` 改为 `0xF811`，三处断言域名的常量契约用例同步修正，`Logger.count()`
补上 `source` 过滤并新增一条反例断言。

## 已知测试限制

- **AG 的成功链路依赖真实 HF 端设备**：`getConnectedDevices()` 只有在耳机/车机真的建立了 HFP 链路
  时才非空，手机、平板这类同为 AG 角色的设备即使已配对也不会计入。
- **已配对设备空列表分支未覆盖**：实测设备均有已配对设备，需要一台未配对任何设备的机器才能走到。
- **UI 层无自动化用例**：首页搜索、卡片跳转、权限弹窗、日志面板过滤依赖手工验收。
