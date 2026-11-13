# 基础能力增强测试用例

## 自动化用例

用例位于 `entry/src/ohosTest/ets/test`，由 `test/List.test.ets` 统一注册，共 20 个套件文件 864 条，RK3568 真机连续两轮 `Tests run: 864, Failure: 0, Error: 0`。

用例写法与元数据对齐 applications_app_samples PR 11983：

- `@tc.number SUB_ABILITY_FEATURE_<主题>_NNNN`、`@tc.name testXxxNNNN`、`@tc.desc`、`@tc.type FUNCTION`、`@tc.size SMALLTEST|MEDIUMTEST`、`@tc.level LEVEL0~2`；
- `it(name, TestType.FUNCTION | Size.XXX | Level.LEVELn, fn)`，每条生成用例首尾各打一行 `hilog` begin/end；
- 单文件不超过 2000 行，大主题按 Core / Extended / Advanced / Tail 拆分；
- 矩阵类用例由 `scripts/gen/gen.js` 生成，期望值全部写成字面量，每条至少 3 个断言，直接调用 `entry/src/main` 的真实代码。

### 存量场景套件

| 套件 | 文件 | 用例数 | 覆盖内容 |
| ---- | ---- | ------ | -------- |
| AbilityFeatureStoragePathTest | StoragePath.test.ets | 14 | 路径拼接（空文件名/前导斜杠/中间斜杠/空目录/空格）、五类沙箱目录映射、路径记录形状、`listStoragePaths` 默认名与自定义名、`countExisting`/`countMissing`、`STORAGE_AREAS` 常量 |
| AbilityFeatureLaunchIntentTest | LaunchIntent.test.ets | 15 | 隐式 Want 的 action/uri/type/parameters、`FLAG_START_WITHOUT_TIPS` 取值与位运算、无 flags 字段、NewAbility Want、StartOptions 默认值与动画开关、`formatStartOptions`、两次构造的 Want 互不影响 |
| AbilityFeatureStorageDataTest | StorageData.test.ets | 12 | 五份文件落盘与计数、重复创建幂等、单文件创建、缺失目录补建、全部/部分删除、自定义文件名隔离、文件名不带前导斜杠、结果一致性、缺失列表、preferences 与 database 目录可写 |
| AbilityFeatureCharacterOperationTest | CharacterOperation.test.ets | 10 | `generateStorageFiles` 返回 5 条路径、自定义名、`createStorageData` 成功、`checkStorageData` 真/假分支、文件不齐时 `clearStorageData` 被拦下、重复创建、生成路径与落盘一致、与模型层路径完全一致 |
| AbilityFeatureConfigTest | AbilityConfig.test.ets | 9 | 切中文/英文后资源文案、中英往返、深色/浅色 `colorMode`、深浅色往返、同一资源随语言变化、配置对象可重复读取、收尾还原中文浅色 |
| AbilityFeatureImplicitLaunchTest | ImplicitLaunch.test.ets | 8 | 隐式 Want 带静默 flag、无匹配返回 16000019、失败后栈顶不变、无效 Ability/包名返回 16000001、失败可重复、显式启动首页成功、重复显式启动 |
| AbilityFeatureStartOptionsTest | StartOptions.test.ets | 8 | 带/不带动效启动 NewAbility、栈顶与 abilityInfo 校验、`terminateSelf` 返回首页、重复启动、返回后再启动、StartOptions 字段、Want 与包名匹配 |
| AbilityFeatureUiSmokeTest | AbilityUiSmoke.test.ets | 11 | 首页三组菜单 id 与标题、动效开关文案切换、语言切换后文案、深浅色切换、界面创建/检查数据的 Toast 与落盘、打开 New 页面、返回首页、隐式静默失败停留在首页 |

### 矩阵套件（生成）

| 套件文件 | 用例数 | 覆盖内容 |
| -------- | ------ | -------- |
| JoinPathMatrixCore / Extended / Advanced / Tail.test.ets | 91 / 91 / 91 / 27 | `joinStoragePath`：12 种目录（五类沙箱目录、应用级/el1 目录、根目录、空串、相对路径、带空格）× 25 种文件名（多重前导斜杠、空名、嵌套、隐藏文件、中文、emoji、`..`/`.`、超长名） |
| WantFlagMatrix.test.ets | 69 | `hasStartWithoutTipsFlag`：第 0~31 位逐位、`wantConstant.Flags` 6 个命名值及两两组合、负数/超 32 位/小数/NaN/无穷等特殊值，分别套在裸 Want、隐式 Want、NewAbility Want 上 |
| StartOptionsFormat.test.ets | 75 | `formatStartOptions` / `buildStartOptions`：4 种 displayId × 3 种动效 × 6 组窗口参数、空 options、动效开/关 |
| AppConstantMatrix.test.ets | 44 | `buildNewAbilityWant` 16 种包名、首页菜单 id 与 `PAGE_ID_NEW_BACK`、`AppConstants` 常量 |
| ResourceLocaleMatrix.test.ets | 97 | entry 模块 29 个字符串资源 × zh_Hans_CN / en_Latn_US / fr_Latn_FR（回落 base），5 个颜色资源 × 浅色/深色；走 `getOverrideResourceManager`，不改应用全局配置 |
| StorageAreaRecordCore / Tail.test.ets | 70 / 10 | `recordStoragePath` + `createStorageFile`：应用级 Context 与 entry 模块 Context × 5 个目录 × 8 种文件名，创建前不存在、创建后存在、删除后不存在 |
| StorageAreaSubset.test.ets | 64 | 五个目录的 32 种落盘子集：`countExisting` / `countMissing` / `listStoragePaths` 状态位、`createStorageFiles` 补齐、`removeStorageFiles` 返回值 |
| OperationSubset.test.ets | 48 | `CharacterOperation`：32 种落盘子集下 `checkStorageData` 真/假与 `clearStorageData` 被拦下（五个都在时只检查不清理），16 种文件名下 `generateStorageFiles` 的路径顺序 |

测试入口与辅助文件：

- `test/TestHelper.ets`：取 AbilityDelegator、应用 Context、entry 模块 Context、按语言/深浅色覆盖的 ResourceManager、栈顶 Ability、EntryAbility 的 UIAbilityContext、资源配置与文件存在性/清理。
- `testrunner/OpenHarmonyTestRunner.ets`：`TestRunner` 实现，转发到 `AbilityFeatureTestRunner`。
- `testrunner/AbilityFeatureTestRunner.ets`：启动 `TestAbility` 并处理解锁失败（-3）。
- `testability/TestAbility.ets`：`onForeground` 后注册 Hypium，`onDestroy` 时以 -2 结束。

## 手工用例

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| -------- | -------- | ---- | -------- | -------- | -------- |
| 应用清理自己的数据 | 设备正常运行 | 1. 启动应用，点击'创建数据'<br />2. 点击'检查数据'<br />3. 点击'清除数据'<br />4. 重新点击应用图标<br />5. 点击'检查数据' | 1. Toast 提示创建缓存文件成功<br />2. Toast 提示查询到缓存文件<br />3. 应用清理数据后退出<br />4. 应用重新启动<br />5. Toast 提示未找到缓存文件 | No | Pass |
| 隐式启动弹窗 | 设备正常运行 | 启动应用，点击'隐式启动弹窗' | 弹出系统弹窗，标题为'未找到文件' | No | Pass |
| 应用切换语言 | 设备正常运行 | 启动应用，分别点击'切换英文语言'、'切换中文语言' | 首页标题与列表文案在'基础能力增强'与'Basic capabilities are enhanced'之间切换 | No | Pass |
| 应用切换颜色模式 | 设备正常运行 | 启动应用，分别点击'切换深色模式'、'切换浅色模式' | 页面背景在深色/浅色之间切换，并弹出切换成功 Toast | No | Pass |
| 设置启动参数启动 Ability | 设备正常运行 | 1. 点击'启动动画'的 Toggle 使其变为'关闭'<br />2. 点击'StartOptions配置' | 1. Toggle 文案切换<br />2. 启动 NewAbility，按 StartOptions 指定的位置/大小/动效展示 | No | Pass |

手工用例的原因：`clearUpApplicationData` 会结束应用进程，放在自动化里会打断同一进程中的后续用例；`隐式启动弹窗`分支会弹出系统弹窗并阻塞，自动化只覆盖带 `FLAG_START_WITHOUT_TIPS` 的静默失败分支。

## 运行方式

```shell
hvigorw --mode module -p module=entry@ohosTest -p product=default assembleHap --no-daemon
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
hdc shell aa test -b com.samples.abilityFeature -m entry_test -s unittest /ets/testrunner/OpenHarmonyTestRunner -s timeout 30000
```

也可以用脚本一次完成构建、安装、执行并汇总失败用例（默认 DevEco 路径可用 `DEVECO_HOME` 覆盖）：

```shell
node scripts/gen/gen.js                      # 重新生成矩阵用例与 List.test.ets
node scripts/gen/device-run.js               # 构建 + 安装 + 全量执行
node scripts/gen/device-run.js --no-build --class AbilityFeatureResourceLocaleMatrixTest
```

签名走 `build-profile.json5` 的 `signingConfig: "default"`，`assembleHap` 直接产出 signed hap；换证书后需先 `hdc uninstall` 再装。

## 真机实测约束

以下几点是自动化用例必须遵守的实测结论，改动用例时不要踩回去：

1. 沙箱目录只和取它的那个 Context 自己比较：EntryAbility 的 UIAbilityContext 与 entry 模块 Context 的 `cacheDir` 形如 `/data/storage/el2/base/haps/entry/cache`，而 `AbilityDelegator.getAppContext()` 是应用级 Context，目录少了 `haps/entry` 这一段；`CharacterOperation` 的落盘校验必须用 EntryAbility 的 UIAbilityContext。
2. `clearUpApplicationData` 会结束进程，自动化只跑"文件不齐 → 不清理"的分支。
3. `setLanguage` 之后字符串资源立即切到目标语言，但 `resourceManager.getConfigurationSync().locale` 仍返回系统语言，所以语言是否生效以资源文案为准。
4. 应用刚被拉起、Ability 还在启动流程中时紧接着 `startAbility`，真机返回 16000017；重复启动类用例先等栈顶稳定再执行。
5. 测试入口路径必须写成小写的 `/ets/testrunner/OpenHarmonyTestRunner`，设备端大小写敏感，写成 `TestRunner` 会报 `Cannot find module`。
6. Driver 在页面切走后仍可能查到已销毁页面的节点，判断"是否留在首页"用首页内容仍在 + 栈顶 Ability 校验，不用"某 id 不存在"。
7. IDE 运行报 `no signature file` 时，先看 `build-profile.json5` 的 `products[].signingConfig` 是否指向 `signingConfigs` 里存在的名字；两套证书交叉安装会报 `install sign info inconsistent`，需先卸载。
8. `application.createModuleContext` 不能直接传 `AbilityDelegator.getAppContext()` 的返回值，真机报 `Parse param context failed, must be a context of stageMode`；要先 `.getApplicationContext()` 再传。
9. 测试 HAP 自带同名字符串资源（如 `create_File_Success`）且取值不同，校验业务文案必须用 entry 模块 Context 的 resourceManager。按语言取资源用 `getOverrideResourceManager`，locale 写 `zh_Hans_CN` / `en_Latn_US`，没有对应目录的语言（如 `fr_Latn_FR`）回落 base。
10. `describe` 的套件名必须写字符串字面量：DevEco 的“运行全部测试”会静态扫描 `describe('xxx')` 拼出 `-s class` 列表，写成 `describe(SUITE, ...)` 这种常量形式的套件会被整个漏掉（曾经只跑了 777 条，少了存量的 87 条）。
