# AppStartup 测试用例

## 自动化用例

用例位于 `entry/src/ohosTest/ets/test`，由 `test/List.test.ets` 统一注册，共 27 个套件文件 1376 条，RK3568 真机实测 `Tests run: 1376, Failure: 0, Error: 0`。

用例写法与元数据约定如下：

- `@tc.number SUB_APP_STARTUP_<主题>_NNNN`、`@tc.name testXxxNNNN`、`@tc.desc`、`@tc.type FUNCTION`、`@tc.size SMALLTEST|MEDIUMTEST`、`@tc.level LEVEL0~2`；
- `it(name, TestType.FUNCTION | Size.XXX | Level.LEVELn, fn)`，每条用例首尾各打一行 `hilog` begin/end；
- 每条 `expect` 前打一行 `hilog` 打印本次校验的实际值，带调用的表达式先提升成 `const actualN`；日志统一 `DOMAIN = 0xF811`、`TAG = '[Sample_AppStartup]'`，可用 `hilog -x -D 0xF811` 过滤；
- 单文件不超过 2000 行、单行不超过 120 列，大主题按 Core / Tail 拆分，`describe` 套件名写字符串字面量；
- 期望值全部写成真机实测得到的字面量，每条至少 3 个断言，不改业务代码，直接调用 `startupManager` 驱动 `entry/src/main/ets/startup` 下的真实启动任务，并读取任务落盘 / 入库的业务数据。

用例按主题拆成多个套件文件，每条用例独立拉起真实 Ability 并自行复位，不依赖前一条用例的执行结果。

注册顺序即执行顺序：ColdStart 必须第一个跑，它断言 EntryAbility 拉起前 entry 的启动配置尚未加载；随后依次是配置与资源矩阵、startupManager 接口矩阵、业务数据，最后点击页面做 UI 冒烟。

| 套件 | 文件 | 用例数 | 覆盖内容 |
| ---- | ---- | ------ | -------- |
| AppStartupColdStartTest | ColdStart.test.ets | 30 | EntryAbility 拉起前：6 个任务与未登记的名字查询初始化状态、取结果、移除结果都抛 401；run 单个 / 全部任务、不存在的任务返回 28800001（`startup task or its dependency not found.`）；run 空列表返回 16000050；带 timeoutMs 或 startupListener 时同样失败且不回调；removeAll 不抛错；拉起 EntryAbility 后五个自动任务完成初始化、ImageKnifeTask 仍未初始化 |
| AppStartupBundleConfigMatrixTest | BundleConfigMatrix.test.ets | 84 | bundleManager 读到的 BundleInfo / ApplicationInfo / HapModuleInfo / AbilityInfo 与 app.json5、module.json5 一致：包名、版本、目标 API 26、安装与 native 库路径、签名信息、uid；entry 模块 1 个 UIAbility 加 6 个启动任务与 1 个 StartupConfig 共 7 个 embeddedUI 扩展（按字典序返回、类型 21、对外可见、无 skill 与权限、读 profile 抛 17700024）；entry_test 模块；不同 BundleFlag 组合下返回的字段 |
| AppStartupResourceLocaleMatrixTest | ResourceLocaleMatrix.test.ets | 44 | entry 模块 5 个字符串资源 × 中文 / 英文 / 法语 / 日语 / 德语 / 韩语（无对应目录时回落 base），`Manual_mode` 只在 base 定义；颜色资源 × 浅色 / 深色；3 个媒体资源字节数；不存在的字符串 / 颜色 / 媒体（含大小写不同、带尾随空格、只存在于 entry_test 模块）按名称读取抛 9001003 |
| AppStartupStartupManagerMatrixCoreTest | StartupManagerMatrixCore.test.ets | 96 | 基线状态（只有 ImageKnifeTask 未初始化）与各任务结果类型；逐个移除、重复移除抛 401（`Failed to remove result.`）、单独 run 恢复、已初始化再 run 不变、列表内重复任务；timeoutMs=1 / 100 / 10000 × 任务；带 startupListener 的 run 回调一次成功；22 种未登记的任务名（大小写、空格、扩展名、路径、中文、通配符等）查询 / 取结果 / 移除都抛 401，混入 run 列表时整体返回 28800001 |
| AppStartupStartupManagerMatrixTailTest | StartupManagerMatrixTail.test.ets | 33 | 续上：其余未登记任务名混入 run；失败时不回调 listener 也不连带执行；KVStoreTask 依赖 KvManagerUtilTask 时连带初始化；KvManagerUtilTask 与 ImageKnifeTask 的结果是同一个单例；一次 run 多个任务；run 空列表返回 16000050；removeAllStartupTaskResults 后全部未初始化再按需恢复；带 Context 的 run 重载 |
| AppStartupStartupDataMatrixTest | StartupDataMatrix.test.ets | 73 | FileTask 写出的 test.txt 与 destFile.txt：位置、36 字节固定内容、按偏移读取、重跑不变长；EntryAbility 各沙箱目录；KVStoreTask 写入的业务键值、各种近似键返回 15100004、测试自有键的 string / number / boolean / bytes 读写删、删掉或改掉业务键后重跑的写回规则；RdbStoreTask 的 EMPLOYEE 表结构、Lisa 行内容、ID 自增、重跑只多插一行；ResourceManagerTask 旋转后的位图为 204x204 RGBA |
| AppStartupBundleManagerFlagMatrixTest | BundleManagerFlagMatrix.test.ets | 33 | BMS BundleFlag 的 32 种组合：getBundleInfoForSelfSync 返回的应用 / 模块 / Ability / skill / 扩展信息随 flag 变化，异步与同步结果一致 |
| AppStartupStartupRunSubsetMatrixTest | StartupRunSubsetMatrix.test.ets | 63 | 6 个启动任务的全部 63 个非空子集：run 任意子集成功，最终 ImageKnifeTask 初始化当且仅当子集包含它，其余自动任务保持已初始化 |
| AppStartupStartupInvalidNameMatrixTest | StartupInvalidNameMatrix.test.ets | 35 | run 时混入超长 / 含空格 / 含特殊字符 / 含中文等非法任务名，整体返回 28800001 |
| AppStartupStartupListenerMatrixTest | StartupListenerMatrix.test.ets | 7 | startupListener.onCompleted 在成功 / 失败 / 超时 / 取消等场景下的回调状态与次数 |
| AppStartupResourceLocaleExtendedTest | ResourceLocaleExtended.test.ets | 30 | 深色模式下 6 个 locale 字符串资源按业务规则回落 base 或 locale 目录 |
| AppStartupStartupDataExtendedTest | StartupDataExtended.test.ets | 11 | 应用级与 EntryAbility Context 的 nativeLibraryPath、RDB 表数据、KV 边界键、文件大小与内容 |
| AppStartupResourceLocaleHugeMatrixTest | ResourceLocaleHugeMatrix.test.ets | 80 | 超大规模资源字符串矩阵：8 个 locale × 全部 base key × LIGHT/DARK × sync/async |
| AppStartupResourceLocaleMoreMatrixTest | ResourceLocaleMoreMatrix.test.ets | 40 | 4 个额外 locale 做同样的大规模 LIGHT/DARK × sync/async 资源回落矩阵 |
| AppStartupBundleInfoExtendedMatrixTest | BundleInfoExtendedMatrixCore/Extended/Tail.test.ets | 192 | 32 种 BundleFlag 组合下包名 / 版本 / 厂商 / 目标 API / 应用信息 / 模块信息 / installTime / updateTime / uid / releaseType / removable 等扩展字段断言 |
| AppStartupStartupRunPermutationMatrixTest | StartupRunPermutationMatrixCore/Extended/Advanced/Tail/Extra/More/Final.test.ets | 510 | 2~4 个任务的全部排列顺序：按任意顺序 run 都能成功，最终六个任务全部初始化 |
| AppStartupUiSmokeTest | UiSmoke.test.ets | 15 | 首页显示文件内容、键值与 Lisa 行（与库里末行一致）；唯一按钮“手动模式”；ImageKnifeTask 未初始化时点击先 run 再跳到 ImageKnife 页，已初始化时不跳转；返回首页数据不变；移除结果后可再次跳转；重新拉起 EntryAbility 后启动任务不重跑、RdbStoreTask 不多插行、ImageKnifeTask 状态保留 |

测试入口与辅助文件：

- `test/TestHelper.ets`：取 AbilityDelegator、应用 Context、entry 模块 Context、栈顶 Ability；startupManager 的 `runResult` / `errorOf` / `taskStates` / `resultKind`、`ListenerProbe`、回到冷启动后基线的 `resetBaseline`、等待 taskPool 任务登记的 `waitForTask`；读业务文件、业务键值库与关系型库；按语言 / 深浅色覆盖的 ResourceManager；本应用 BundleInfo / HapModuleInfo / AbilityInfo / ExtensionAbilityInfo。
- `test/UiHelper.ets`：UiTest Driver 的按文本查找、收集页面文本与组件数、点击“手动模式”、返回首页、重新拉起 EntryAbility。
- `testrunner/OpenHarmonyTestRunner.ets`：框架固定查找的入口，转发到 `AppStartupTestRunner`。
- `testrunner/AppStartupTestRunner.ets`：挂 monitor 并拉起 `TestAbility`，屏幕未解锁时直接结束并带错误码 -3。
- `testability/TestAbility.ets`：前台完成后再用 `setTimeout` 注册 Hypium 用例，`onDestroy` 时以 -2 结束。

## 手工用例

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| -------- | -------- | ---- | -------- | -------- | -------- |
| 自动模式加载数据 | 设备正常运行 | 点击桌面应用图标 | 首页显示 FileTask 写入的文件内容、KVStoreTask 写入的键值与 RdbStoreTask 插入的数据 | Yes（UiSmoke） | Pass |
| 手动模式加载图片 | 位于首页 | 点击“手动模式”按钮 | 跳转到 ImageKnife 页 | Yes（UiSmoke） | Pass |
| ImageKnife 图片显示效果 | 位于 ImageKnife 页 | 观察页面 | ImageKnifeComponent 正常显示 startIcon 图片 | No | Pass |
| ResourceManagerTask 旋转图片的显示效果 | 位于首页 | 观察首页图片 | 显示旋转 45 度的 startIcon | No | Pass |

图片是画在 Canvas / PixelMap 上的，UiTest 只能拿到组件不能拿到像素，自动化只核对 ImageKnife 页的组件结构、AppStorage 里位图的尺寸与格式，画面效果仍需人工确认。

## 运行方式

在 DevEco Studio 中构建并安装 `entry@default` 与 `entry@ohosTest` 两个包的 HAP，安装后右键 `entry/src/ohosTest` 运行全部用例；也可用设备命令行方式执行测试，测试模块为 `entry_test`，入口为 `/ets/testrunner/OpenHarmonyTestRunner`。ColdStart 断言的是“EntryAbility 尚未拉起”的状态，单独跑其他套件之前不要先手动打开应用。

签名材料只在本地配置，不入库。

## 真机实测约束

以下几点是自动化用例必须遵守的实测结论，改动用例时不要踩回去：

1. 自动化测试只拉起 TestAbility，entry 的 `startup_config` 要等 EntryAbility 拉起后才加载：此前任何任务名查询都抛 401，run 返回 28800001，run 空列表返回 16000050。
2. 拉起 EntryAbility 后的基线是 `ImageKnifeTask` 未初始化（`excludeFromAutoStart: true`），其余五个任务已初始化，状态串为 `false,true,true,true,true,true`；每条改动状态的用例结束前都调用 `resetBaseline` 回到基线。
3. 对未初始化的任务调用 `removeStartupTaskResult` 抛 401 `Parameter error: Failed to remove result.`，基线下的 ImageKnifeTask 和已经移除过的任务都是这样；`removeAllStartupTaskResults` 不抛错。
4. FileTask 在 taskPool 中执行，不论单独 run 还是和其他任务一起 run，都是 run 返回之后才异步登记为已初始化，断言前要用 `waitForTask` 等待。
5. 同一进程内结束并重新拉起 EntryAbility 不会重跑启动任务，RdbStoreTask 也不会多插一行；只有移除结果后再 run 才会重新执行。
6. 键值库读取带尾随空格的键 `key_test_string ` 会命中业务键；前缀、大写、把业务值当键等其他近似键返回 15100004。
7. 应用级 database 目录下是否存在旧的 `RdbTest.db` 与设备历史有关，不做断言；业务库固定在 entry 模块的 `database/entry/rdb` 目录。
8. `nativeLibraryPath` 实测为 `/data/storage/el1/bundle/libs/arm`；entry 模块的 7 个扩展按名字字典序返回，大写字母排在小写之前。
9. UiTest 的 `findComponents` 没有匹配时返回 null 而不是空数组，`UiHelper` 统一转成 `[]`。
10. 测试 HAP 自带同名资源，校验业务资源必须用 entry 模块 Context；Hypium 注册用例放在 `setTimeout` 里避免 LIFECYCLE_TIMEOUT；测试入口路径写小写 `/ets/testrunner/OpenHarmonyTestRunner`；`describe` 套件名写字符串字面量。
