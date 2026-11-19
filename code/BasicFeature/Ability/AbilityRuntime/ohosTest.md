# AbilityRuntime 测试用例

## 自动化用例

用例位于 `entry/src/ohosTest/ets/test`，由 `test/List.test.ets` 统一注册，共 51 个套件文件 2740 条，RK3568 真机实测 `Tests run: 2740, Failure: 0, Error: 0`。

用例写法与元数据约定如下：

- `@tc.number SUB_ABILITY_RUNTIME_<主题>_NNNN`、`@tc.name testXxxNNNN`、`@tc.desc`、`@tc.type FUNCTION`、`@tc.size SMALLTEST|MEDIUMTEST`、`@tc.level LEVEL0~2`；
- `it(name, TestType.FUNCTION | Size.XXX | Level.LEVELn, fn)`，每条用例首尾各打一行 `hilog` begin/end；
- 每条 `expect` 前打一行 `hilog` 打印本次校验的实际值，带调用的表达式先提升成 `const actualN`；日志统一 `DOMAIN = 0xF811`、`TAG = '[Sample_AbilityRuntime]'`，可用 `hilog -x -D 0xF811` 过滤；
- 单文件不超过 2000 行、单行不超过 120 列，大主题按 Core / Extended / Tail 拆分，`describe` 套件名写字符串字面量；
- 期望值全部写成真机实测得到的字面量，每条至少 3 个断言，不改业务代码，直接调用 `entry/src/main` 用到的系统接口并拉起真实的 Ability 与页面。

用例按主题拆成多个套件文件，每条用例独立拉起真实 Ability 并自行复位，不依赖前一条用例的执行结果。

| 套件 | 文件 | 用例数 | 覆盖内容 |
| ---- | ---- | ------ | -------- |
| AbilityRuntimeBundleConfigMatrixTest | BundleConfigMatrix.test.ets | 61 | bundleManager 读到的 BundleInfo / ApplicationInfo / HapModuleInfo / AbilityInfo 与 app.json5、module.json5 一致：包名、厂商、版本、目标 API 26、应用分身 appClone 与 maxCount 5、三方应用属性、安装路径、EntryAbility / AbilityLifecycleAbility / EntryBackupAbility 配置、读取不存在的 profile 抛 17700024 |
| AbilityRuntimeResourceLocaleMatrixCoreTest | ResourceLocaleMatrixCore.test.ets | 95 | entry 模块字符串资源在中文与英文（前半）下的同步与异步读取 |
| AbilityRuntimeResourceLocaleMatrixExtendedTest | ResourceLocaleMatrixExtended.test.ets | 95 | 续上：英文（后半）与日语（无 ja 目录，回落 base）下的字符串资源 |
| AbilityRuntimeResourceLocaleMatrixTailTest | ResourceLocaleMatrixTail.test.ets | 78 | 日语回落 base 的其余字符串；3 个颜色资源 × 浅色 / 深色（无 dark 目录，回落 base）；6 个媒体资源字节数；不存在的字符串 / 颜色 / 媒体按名称读取抛 9001003；rawfile 下 `font/Roboto-Regular.ttf` 的内容与目录列表 |
| AbilityRuntimeDataUriUtilsMatrixTest | DataUriUtilsMatrix.test.ets | 43 | `dataUriUtils` 的 getId / attachId / deleteId / updateId：不同 scheme、多级路径、0、int32 最大值、2^53-1、中文路径、连续 deleteId；不含分隔符、末段为空或不是纯数字、带 query 或 fragment、反斜杠路径、空串时抛 401 `Invalid input parameter.` |
| AbilityRuntimeWantAgentMatrixTest | WantAgentMatrix.test.ets | 41 | `wantAgent.getWantAgent`：START_ABILITY / START_ABILITIES / SEND_COMMON_EVENT × 4 种 flag × requestCode，getBundleName / getUid / getOperationType 与入参一致；页面同款的 callback / promise 调用；equal 在 requestCode、目标 Ability、操作类型不同时为 false；cancel 后重新获取仍可查询；SEND_COMMON_EVENT 被 trigger 后本应用订阅者收到事件与 code；页面 trigger 拉起 EntryAbility |
| AbilityRuntimeAppManagerMatrixTest | AppManagerMatrix.test.ets | 16 | `appManager` 的 isRunningInStabilityTest（自动化测试下为 false）、isRamConstrainedDevice（false）、getAppMemorySize（正整数且多次调用稳定）、getRunningProcessInformation（只看到本应用进程，状态 STATE_ACTIVE，uid 与包名一致），callback 与 promise 两种形式结果一致 |
| AbilityRuntimeApplicationContextMatrixTest | ApplicationContextMatrix.test.ets | 51 | ApplicationContext 的 getCurrentAppCloneIndex 为 0、getRunningProcessInformation、默认 EL2 下各沙箱目录、area 切到 EL1 / EL3 / EL4 后各目录取值再切回 EL2 还原、eventHub 的 on / emit 多参数 / off、on('environment') 每次返回不同 id |
| AbilityRuntimeErrorManagerMatrixTest | ErrorManagerMatrix.test.ets | 20 | `errorManager` 的 on / off('error')、重复注销或注销未注册的 id 以 401 拒绝、loopObserver 注册覆盖与注销、主线程阻塞超阈值时回调超时时长、unhandledRejection 回调原样带回 reason、已 catch 的 reject 不回调 |
| AbilityRuntimeBundleManagerFlagMatrixTest | BundleManagerFlagMatrix.test.ets | 33 | BMS BundleFlag 的 32 种组合：getBundleInfoForSelfSync 返回的应用 / 模块 / Ability / skill / 扩展信息随 flag 变化，异步与同步结果一致 |
| AbilityRuntimeCanOpenLinkMatrixTest | CanOpenLinkMatrix.test.ets | 26 | 多种 scheme / domain / path / query / fragment / 大小写 / 空串 / 非法串调用 canOpenLink，因本应用未声明 querySchemes 统一抛 17700056 |
| AbilityRuntimeResourceLocaleExtendedCore/Extended/TailTest | ResourceLocaleExtendedCore/Extended/Tail.test.ets | 248 | 4 个 locale 做大规模字符串资源 × LIGHT/DARK × sync/async 回落矩阵 |
| AbilityRuntimeApplicationContextExtendedTest | ApplicationContextExtended.test.ets | 33 | ApplicationContext 的 area 目录、eventHub 多参数、environment 订阅 id 等更多边界 |
| AbilityRuntimeDataUriUtilsExtendedTest | DataUriUtilsExtended.test.ets | 64 | dataUriUtils 的更多 scheme、连续 attachId / deleteId / updateId、中文路径、query / fragment、边界 id |
| AbilityRuntimeWantAgentExtendedCore/TailTest | WantAgentExtendedCore/Tail.test.ets | 100 | WantAgent 的更多 operationType / flag / requestCode 组合、equal / cancel / getBundleName / getUid 边界 |
| AbilityRuntimeErrorManagerExtendedTest | ErrorManagerExtended.test.ets | 7 | errorManager 的 loopObserver / freezeObserver / unhandledRejection 更多触发与注销场景 |
| AbilityRuntimeResourceLocaleHugeMatrixATest | ResourceLocaleHugeMatrixA Core/Extended/Advanced/Tail.test.ets | 256 | 超大规模资源字符串矩阵：8 个 locale × key 集合 A × LIGHT/DARK × sync/async |
| AbilityRuntimeResourceLocaleHugeMatrixBTest | ResourceLocaleHugeMatrixB Core/Extended/Advanced/Tail.test.ets | 256 | 同上：key 集合 B |
| AbilityRuntimeResourceLocaleHugeMatrixCTest | ResourceLocaleHugeMatrixC Core/Extended/Tail.test.ets | 240 | 同上：key 集合 C |
| AbilityRuntimeResourceLocaleHugeMatrixDTest | ResourceLocaleHugeMatrixD Core/Extended/Tail.test.ets | 240 | 同上：key 集合 D |
| AbilityRuntimeResourceLocaleMoreMatrixATest | ResourceLocaleMoreMatrixA Core/Extended/Tail.test.ets | 168 | 4 个额外 locale × key 集合 A/B 的大规模 LIGHT/DARK × sync/async 资源回落矩阵 |
| AbilityRuntimeResourceLocaleMoreMatrixBTest | ResourceLocaleMoreMatrixB Core/Extended/Tail.test.ets | 168 | 同上：key 集合 B |
| AbilityRuntimeResourceLocaleMoreMatrixCTest | ResourceLocaleMoreMatrixC Core/Tail.test.ets | 160 | 同上：key 集合 C |
| AbilityRuntimeBundleInfoExtendedMatrixTest | BundleInfoExtendedMatrixCore/Extended/Tail.test.ets | 192 | 32 种 BundleFlag 组合下包名 / 版本 / 厂商 / 目标 API / 应用信息 / 模块信息 / installTime / updateTime / uid / releaseType / removable 等扩展字段断言 |
| AbilityRuntimeAbilityLifecycleTest | AbilityLifecycle.test.ets | 23 | 显式拉起 AbilityLifecycleAbility（单实例）、AbilityMonitor 与 ApplicationContext 的 abilityLifecycle 回调顺序、再次拉起走 onNewWant、doAbilityBackground / Foreground、moveAbilityToBackground、后台实例复用、terminateSelf 后重新 create、off('abilityLifecycle') 后不再回调、launchWant 带 isDelegatorCall；首页 UIAbilityContext 入口与页面上 moveAbilityToBackground / terminateSelf 按钮 |
| AbilityRuntimeUiSmokeTest | UiSmoke.test.ets | 26 | 首页标题与 6 个入口的文案、顺序与对齐；逐页进入 appManager / dataUriUtils / WantAgent / ApplicationContext / errorManager 页核对按钮文案与布局并依次点击，页面不跳转、栈顶仍为 EntryAbility；WantAgent 页滚到底部点 trigger；setFont 后页面仍正常显示；errorManager 页注册 / 注销 UnhandledRejectionObserver 时按钮切换并出现模拟按钮；各页按返回键回到首页 |

测试入口与辅助文件：

- `test/TestHelper.ets`：取 AbilityDelegator、应用 Context、entry 模块 Context、按语言 / 深浅色覆盖的 ResourceManager、栈顶 Ability、本应用 BundleInfo / HapModuleInfo / AbilityInfo，以及拉起 Ability 并捕获错误码的 `startAndCapture` / `launchAbility`。
- `test/UiHelper.ets`：UiTest Driver 的按文本 / id 查找与点击、进入某个示例页、按返回键或重新拉起回到首页。
- `testrunner/OpenHarmonyTestRunner.ets`：框架固定查找的入口，转发到 `AbilityRuntimeTestRunner`。
- `testrunner/AbilityRuntimeTestRunner.ets`：挂 monitor 并拉起 `TestAbility`，屏幕未解锁时直接结束并带错误码 -3。
- `testability/TestAbility.ets`：前台完成后再用 `setTimeout` 注册 Hypium 用例，`onDestroy` 时以 -2 结束。

## 手工用例

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| -------- | -------- | ---- | -------- | -------- | -------- |
| 拉起应用 | 设备正常运行 | 点击桌面应用图标 | 显示首页标题与 6 个示例入口 | Yes（UiSmoke） | Pass |
| 测试 appManager 中接口 | 位于 appManager 开发示例页面 | 依次点击 isRunningInStabilityTest、isRamConstrainedDevice、getAppMemorySize、getRunningProcessInformation 的 callback / promise 按钮 | 依次弹出 Toast 信息 | Yes（UiSmoke 点击；接口结果由 AppManagerMatrix 断言） | Pass |
| 测试 dataUriUtils 中接口 | 位于 dataUriUtils 开发示例页面 | 依次点击 getId、attachId、deleteId、updateId 按钮 | 依次弹出 Toast 信息 | Yes（UiSmoke 点击；接口结果由 DataUriUtilsMatrix 断言） | Pass |
| 测试 WantAgent 中接口 | 位于 WantAgent 开发示例页面 | 依次点击 getBundleName、getUid、cancel、equal、getOperationType 的 callback / promise 按钮与 trigger 按钮 | 依次弹出 Toast 信息 | Yes（UiSmoke 点击；接口结果由 WantAgentMatrix 断言） | Pass |
| 测试 ApplicationContext 中接口 | 位于 ApplicationContext 开发示例页面 | 依次点击 setFont、getRunningProcessInformation 的 callback / promise、getCurrentAppCloneIndex 按钮 | 依次弹出 Toast 信息 | Yes（UiSmoke 点击；接口结果由 ApplicationContextMatrix 断言） | Pass |
| 测试 errorManager 中接口 | 位于 errorManager 开发示例页面 | 1. 点击注册 LoopObserver<br />2. 点击注册 UnhandledRejectionObserver<br />3. 点击模拟 UnhandledRejection<br />4. 点击注销 UnhandledRejectionObserver | 1. 弹出 Toast<br />2. 出现模拟按钮，注册按钮变为注销按钮<br />3. 弹出 Toast<br />4. 模拟按钮消失，按钮变回注册 | Yes（UiSmoke） | Pass |
| 测试 UIAbilityContext 中接口 | 位于首页 | 1. 点击 UIAbilityContext 开发示例，再点 moveAbilityToBackground<br />2. 再次进入后点击 terminateSelf | 1. Ability 移到后台，显示首页<br />2. Ability 被停止，显示首页 | Yes（AbilityLifecycle） | Pass |
| setFont 的字体效果 | 位于 ApplicationContext 开发示例页面 | 点击 setFont 按钮 | 页面文字切换为注册的 Roboto 字体 | No | Pass |

setFont 的效果只体现在字形渲染上，UiTest 拿不到字体信息，自动化只核对点击后页面文字仍正常显示，以及 rawfile 中的 `font/Roboto-Regular.ttf` 可读取且是 TrueType 文件。

## 运行方式

在 DevEco Studio 中构建并安装 `entry@default` 与 `entry@ohosTest` 两个包的 HAP，安装后右键 `entry/src/ohosTest` 运行全部用例；也可用设备命令行方式执行测试，测试模块为 `entry_test`，入口为 `/ets/testrunner/OpenHarmonyTestRunner`。

签名材料只在本地配置，不入库。

## 真机实测约束

以下几点是自动化用例必须遵守的实测结论，改动用例时不要踩回去：

1. 应用刚被拉起、Ability 还在启动流程中时紧接着 `startAbility`，真机返回 16000017；拉起前先等当前栈顶稳定。
2. 测试 HAP 自带 `module_desc` 等同名资源，校验业务资源必须用 entry 模块 Context；`createModuleContext` 不能直接传 delegator 返回的 Context（报 `must be a context of stageMode`），要先转成 ApplicationContext。
3. Hypium 注册几百条用例会同步写日志，若在 `onForeground` 里直接注册，主线程被占满 5 s 会触发 LIFECYCLE_TIMEOUT，报告表现为 App died；TestAbility 用 `setTimeout` 把注册排到前台完成之后。
4. 三方应用调用 `getRunningProcessInformation` 只能看到自己的进程；在自动化测试下 `isRunningInStabilityTest` 返回 false。
5. 两个未处理的 reject 同时触发时，unhandledRejection 回调的先后顺序不固定，用例按内容核对而不是按顺序。
6. `dataUriUtils` 的 getId / deleteId / updateId 对不含 `/`、末段为空或无法按 `Number()` 解析、带 query 或 fragment、只用反斜杠分隔、空串的 uri 一律抛 401 `Invalid input parameter.`；不带 id 的 uri 要先 attachId 才能 updateId。
7. WantAgent 的 trigger 会把 EntryAbility 拉到前台，打断其余 Ability 的状态，放在 WantAgent 套件最后执行。
8. WantAgent 页最后两个按钮在 RK3568 上需要滚动到底部才可见，UI 用例点击前先滚动。
9. 修改 ApplicationContext 的 `area` 会改变 `filesDir` / `cacheDir` / `tempDir` / `preferencesDir` / `databaseDir` 的存储区（el1 / el3 / el4），切回 EL2 后恢复为 el2；`distributedFilesDir` 在 EL1 下是 el1 目录，EL2 及以后仍为 el2 目录；`bundleCodeDir` 始终为 `/data/storage/el1/bundle`。area 是实例属性，切换后必须在同一用例内还原为 EL2。
10. 测试入口路径必须写成小写的 `/ets/testrunner/OpenHarmonyTestRunner`；`describe` 套件名必须写字符串字面量，否则 IDE “运行全部测试”静态拼接套件清单时会漏掉整个套件。
11. dataUriUtils 的解析比文档宽：末段按 `Number()` 语义取值（`' 12'` → 12、`'-1'` → -1、`'+1'` → 1、`'1.5'` → 1.5、`'0x10'` → 16、纯空白 → 0），只有末段完全不是数字（字母、query、fragment、换行）才抛 401；`attachId('', 0)` 得到 `'/0'`，`deleteId('/0')` 还原成空串。
