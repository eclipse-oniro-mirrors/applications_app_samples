# UniversalLink 测试用例

## 自动化用例

用例位于 `entry/src/ohosTest/ets/test`，由 `test/List.test.ets` 统一注册，共 22 个套件文件 951 条，RK3568 真机实测 `Tests run: 951, Failure: 0, Error: 0`。

用例写法与元数据约定如下：

- `@tc.number SUB_UNIVERSAL_LINK_<主题>_NNNN`、`@tc.name testXxxNNNN`、`@tc.desc`、`@tc.type FUNCTION`、`@tc.size SMALLTEST|MEDIUMTEST`、`@tc.level LEVEL0~2`；
- `it(name, TestType.FUNCTION | Size.XXX | Level.LEVELn, fn)`，每条用例首尾各打一行 `hilog` begin/end；
- 每条 `expect` 前打一行 `hilog` 打印本次校验的实际值，带调用的表达式先提升成 `const actualN`；日志统一 `DOMAIN = 0xF811`、`TAG = '[Sample_UniversalLink]'`，可用 `hilog -x -D 0xF811` 过滤；
- 单文件不超过 2000 行、单行不超过 120 列，`describe` 套件名写字符串字面量；
- 期望值全部写成真机实测得到的字面量，每条至少 3 个断言，不改业务代码，直接拉起 `entry/src/main` 的真实 Ability 与页面。

用例按主题拆成多个套件文件，每条用例独立拉起真实 Ability 并自行复位，不依赖前一条用例的执行结果。

| 套件 | 文件 | 用例数 | 覆盖内容 |
| ---- | ---- | ------ | -------- |
| UniversalLinkBundleConfigMatrixTest | BundleConfigMatrix.test.ets | 60 | bundleManager 读到的 BundleInfo / ApplicationInfo / HapModuleInfo / AbilityInfo / skills 与 app.json5、module.json5 一致：包名、版本、权限、两个模块、Ability 的 launchType / exported / skills、uri 未配置 linkFeature、读取不存在的 profile 抛 17700024 |
| UniversalLinkResourceLocaleMatrixTest | ResourceLocaleMatrix.test.ets | 50 | entry 模块字符串资源 × 中文 / 英文 / 法语 / 日语（回落 base）的同步与异步读取，颜色资源 × 浅色 / 深色，媒体资源字节数，不存在的字符串 / 颜色 / 媒体按名称读取抛 9001003 |
| UniversalLinkSkillMatchUriTest | SkillMatchUri.test.ets | 40 | 隐式 Want 的 uri 匹配：域名根地址、多级路径、端口加路径、查询参数、fragment、大小写混合匹配到 OpenLinkAbility 且 uri 不变；https / mailto / 自定义 scheme、缺顶级域、其他子域等不匹配分支返回 16000019 并弹系统提示 |
| UniversalLinkSkillMatchActionEntityTest | SkillMatchActionEntity.test.ets | 55 | 隐式 Want 的 action（不带 / viewData / sendData / search / 自定义）× entities（不带 / browsable / home+browsable 等）× type × bundleName 组合，匹配时 OpenLinkAbility 原样收到 Want，不匹配时返回 16000019 |
| UniversalLinkParamPassthroughTest | ParamPassthrough.test.ets | 30 | startAbility 隐式拉起与 openLink 的 `OpenLinkOptions.parameters` 中字符串、空串、中文、长串、整数、零、负数、int32 最大值、小数、布尔、字符串 / 数字 / 布尔数组 14 种参数原样透传到 OpenLinkAbility，以及一次携带多个参数 |
| UniversalLinkOpenLinkMatrixTest | OpenLinkMatrix.test.ets | 80 | openLink：16 种链接 × 5 种 OpenLinkOptions（不传、空 options、appLinkingOnly=false/true、带 parameters），覆盖拉起成功且 uri 不变、无匹配 16000019 弹提示、appLinkingOnly=true 直接 16000019 不弹提示、空串参数校验 401 |
| UniversalLinkOpenLinkCallbackTest | OpenLinkCallback.test.ets | 31 | 带 AbilityResult 回调的 openLink：OpenLinkAbility 以多种 resultCode（0/1/7/-1/-100/2147483647 等）× 不带参数 / 字符串 / 字符串加数字参数结束，回调原样收到；terminateSelf 结束时回调收到的默认 resultCode、空 options 拉起，appLinkingOnly=true 时直接抛 16000019 且回调不被调用 |
| UniversalLinkBundleManagerFlagMatrixTest | BundleManagerFlagMatrix.test.ets | 33 | BMS BundleFlag 的 32 种组合：getBundleInfoForSelfSync 返回的应用 / 模块 / Ability / skill / 扩展信息随 flag 变化，异步与同步结果一致 |
| UniversalLinkCanOpenLinkMatrixTest | CanOpenLinkMatrix.test.ets | 31 | 多种 scheme / domain / path / query / fragment / 大小写 / 空串 / 非法串调用 canOpenLink，因本应用未声明 querySchemes 统一抛 17700056 |
| UniversalLinkCanOpenLinkMoreMatrixTest | CanOpenLinkMoreMatrix.test.ets | 42 | 续上：更多 scheme、IP / IPv6、端口、用户信息、路径、查询参数、fragment、中文与 URL 编码、域名边界与非法格式 |
| UniversalLinkSkillMatchUriExtendedTest | SkillMatchUriExtended.test.ets | 41 | 续 SkillMatchUri：多级路径、查询参数、fragment、编码、大小写、端口等更多 uri 的匹配与不匹配分支 |
| UniversalLinkOpenLinkErrorMatrixTest | OpenLinkErrorMatrix.test.ets | 10 | openLink 非法参数：空串 / 非字符串 / 非对象 options 等直接抛 401 |
| UniversalLinkResourceLocaleExtendedTest | ResourceLocaleExtended.test.ets | 32 | 深色模式下 6 个 locale 字符串资源按业务规则回落 base 或 locale 目录 |
| UniversalLinkResourceLocaleHugeMatrixTest | ResourceLocaleHugeMatrixCore/Tail.test.ets | 128 | 超大规模资源字符串矩阵：8 个 locale × 全部 base key × LIGHT/DARK × sync/async |
| UniversalLinkResourceLocaleMoreMatrixTest | ResourceLocaleMoreMatrix.test.ets | 64 | 4 个额外 locale 做同样的大规模 LIGHT/DARK × sync/async 资源回落矩阵 |
| UniversalLinkBundleInfoExtendedMatrixTest | BundleInfoExtendedMatrixCore/Extended/Tail.test.ets | 192 | 32 种 BundleFlag 组合下包名 / 版本 / 厂商 / 目标 API / 应用信息 / 模块信息 / installTime / updateTime / uid / releaseType / removable 等扩展字段断言 |
| UniversalLinkAbilityLifecycleTest | AbilityLifecycle.test.ets | 18 | 显式拉起未 exported 的 OpenLinkAbility、拉起备份扩展返回 16000002、模块名或 Ability 名写错返回 16000001；两个 Ability 的 context 信息与 module.json5 一致；onAbilityCreate / onWindowStageCreate / onAbilityForeground 等生命周期回调顺序 |
| UniversalLinkUiSmokeTest | UniversalLinkUiSmoke.test.ets | 14 | 首页标题与两个按钮的文案、布局；点 promise / callback 按钮拉起 OpenLinkAbility 并核对收到的链接与选项；按返回键只退到后台并复用同一实例；带结果结束后回到首页；系统“无法打开此文件”对话框点“知道了”后回到首页 |

测试入口与辅助文件：

- `test/TestHelper.ets`：取 AbilityDelegator、应用 Context、entry 模块 Context、按语言 / 深浅色覆盖的 ResourceManager、栈顶 Ability、首页 EntryAbility 的 UIAbilityContext、本应用 BundleInfo。
- `test/LinkHelper.ets`：一次拉起（startAbility / openLink Promise / openLink 回调）的观测结果模型；关闭 OpenLinkAbility、关闭“无法打开此文件”对话框等复位操作。
- `testrunner/OpenHarmonyTestRunner.ets`：框架固定查找的入口，转发到 `UniversalLinkTestRunner`。
- `testrunner/UniversalLinkTestRunner.ets`：挂 monitor 并拉起 `TestAbility`，屏幕未解锁时直接结束并带错误码。
- `testability/TestAbility.ets`：前台完成后再用 `setTimeout` 注册 Hypium 用例。

## 手工用例

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| -------- | -------- | ---- | -------- | -------- | -------- |
| 拉起应用 | 设备正常运行 | 点击桌面应用图标 | 显示首页“UniversalLink开发示例”与两个按钮 | Yes（UiSmoke） | Pass |
| openLink(promise) 拉起 Ability | 位于首页 | 点击“openLink(promise)拉起应用”按钮 | 拉起新的 Ability，页面显示“UniversalLink方式拉起Ability成功” | Yes（UiSmoke） | Pass |
| openLink(callback) 拉起 Ability | 位于首页 | 点击“openLink(callback)拉起应用”按钮 | 拉起新的 Ability，页面显示“UniversalLink方式拉起Ability成功” | Yes（UiSmoke） | Pass |
| App Linking 域名校验 | 设备联网，链接域名的服务器上部署 applinking.json，module.json5 的 uri 配置 `linkFeature` 与 `domainVerify` | 以 `appLinkingOnly: true` 调用 openLink 打开已校验的域名链接 | 直接拉起 OpenLinkAbility，不弹选择框 | No | 未执行 |

App Linking 域名校验需要自有域名、服务端校验文件和联网环境，不能在测试工程内自动化。本示例的 skill 只声明了 `http://docs.openharmony.cn`，没有做域名校验，所以自动化只覆盖“`appLinkingOnly: true` 时返回 16000019 且不弹提示”的分支。

## 运行方式

在 DevEco Studio 中构建并安装 `entry@default` 与 `entry@ohosTest` 两个包的 HAP，安装后右键 `entry/src/ohosTest` 运行全部用例；也可用设备命令行方式执行测试，测试模块为 `entry_test`，入口为 `/ets/testrunner/OpenHarmonyTestRunner`。

签名材料只在本地配置，不入库。

## 真机实测约束

以下几点是自动化用例必须遵守的实测结论，改动用例时不要踩回去：

1. skill 只声明了 `http://docs.openharmony.cn`，没有 `linkFeature`，不是 App Linking：openLink 带 `appLinkingOnly: true` 时即使链接能匹配也直接返回 16000019，不弹系统提示，回调形态也不会被回调。
2. 隐式拉起或 openLink 没有匹配的 Ability 时返回 16000019，并弹出系统“无法打开此文件”对话框；对话框不关会挡住后续 UI 点击，用例里统一用 `dismissNoMatchDialog` 点“知道了”并等窗口消失。
3. uri 中的 fragment 只在“域名后直接跟 `#f`”时导致不匹配，带路径时 fragment 不影响匹配；域名大小写不影响匹配，https 与自定义 scheme 不匹配。
4. OpenLinkAbility 是单实例：被复用时 `launchWant` 停在第一次请求，本次请求要读 `lastRequestWant`；每条用例结束都要关掉 OpenLinkAbility 并等栈顶切走。
5. 在 OpenLinkAbility 按返回键只是把它退到后台，再次拉起复用同一实例，而不是重新创建。
6. 连续 `startAbility` 真机会返回 16000017，拉起前先等当前栈顶稳定；拉起备份扩展 EntryBackupAbility 返回 16000002，模块名写错返回 16000001，都不弹提示。
7. openLink 只能从 UIAbilityContext 发起，用例取首页 EntryAbility 的 context，与页面按钮的调用方式一致。
8. 测试 HAP 自带 `module_desc` 等同名资源，校验业务资源必须用 entry 模块 Context；`createModuleContext` 不能直接传 delegator 返回的 Context（报 `must be a context of stageMode`），要先转成 ApplicationContext。
9. Hypium 注册几百条用例会同步写日志，若在 `onForeground` 里直接注册，主线程被占满 5 s 会触发 LIFECYCLE_TIMEOUT，报告表现为 App died；TestAbility 用 `setTimeout` 把注册排到前台完成之后。
10. 测试入口路径必须写成小写的 `/ets/testrunner/OpenHarmonyTestRunner`；`describe` 套件名必须写字符串字面量，否则 IDE “运行全部测试”静态拼接套件清单时会漏掉整个套件。
