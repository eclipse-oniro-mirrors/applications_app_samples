# DisplaySync 测试用例

DisplaySync 分层帧率控制样例的测试归档，自动化部分直接调用 `@kit.ArkGraphics2D` 的 `displaySync` 接口，覆盖帧率区间、调用序列、非法参数与页面配置事实。

## 自动化用例

用例位于 `entry/src/ohosTest/ets/test`，由 `test/List.test.ets` 统一注册，共 34 个套件文件 2058 条；`test/Ability.test.ets` 另有 3 条环境自检，合计 2061 条，已在 RK3568 真机上分批执行通过。

用例写法与元数据约定如下：

- `@tc.number DS_<主题>_NNNN`、`@tc.name <主题><序号>`、`@tc.desc`、`@tc.type FUNCTION`、`@tc.size SMALLTEST`、`@tc.level LEVEL0`；
- `it(name, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, fn)`，每条用例首尾各打一行 `hilog` begin/end；
- 断言前打印本条用例的入参或待校验值，期望值全部写成字面量；
- 日志统一使用 `DOMAIN = 0xF811`、`TAG = '[Sample_DisplaySync]'`，可用 `hilog -x -D 0xF811` 过滤；
- 每个套件通过 `beforeEachIt` 调用 `util/TestTick.ets` 的 `tick()`，每 10 条用例让出一次主线程；
- 单个套件文件不超过 2000 行，大主题按 `Matrix1` .. `MatrixN` 拆分。

### 套件清单

| 套件 | 文件 | 用例数 | 覆盖内容 |
| ---- | ---- | ------ | -------- |
| DsSequenceMatrix1 .. 21 | DsSequenceMatrixN.test.ets | 1365 | `startThenSet`、`setTwiceAlternating`、`startStopCycle` 三种调用序列与 21 组合法帧率区间（min 1 ~ 90、expected 1 ~ 120、max 20 ~ 144）的组合，校验区间可设置且实例可用 |
| DsFrameRateMatrix1 .. 7 | DsFrameRateMatrixN.test.ets | 455 | 7 组合法帧率区间（含 min=1 expected=1 max=1 与 min=60 expected=60 max=120）的 `setExpectedFrameRateRange` 设置与回调触发 |
| DsApiMatrix1 | DsApiMatrix1.test.ets | 48 | `displaySync.create`、`on`、`off`、`start`、`stop` 的多轮契约检查 |
| DsNativeMatrix1 | DsNativeMatrix1.test.ets | 40 | 1 / 5 / 10fps 持续 1000 ~ 4000ms 的帧间隔与帧数推算，前四帧时间戳单调递增且首帧为 0 |
| DsInvalidMatrix1 | DsInvalidMatrix1.test.ets | 40 | 非法帧率区间（min=-1、expected 小于 min、max=0 等）不破坏实例，且之后仍可设置合法区间 |
| DsConfigMatrix1 | DsConfigMatrix1.test.ets | 30 | `bundleName`、`mainElement`、`deviceTypes` 等配置事实与清单常量一致（`com.samples.displaySync`、`EntryAbility`、`tablet`） |
| DsPageMatrix1 | DsPageMatrix1.test.ets | 40 | `pages/Index`、`pages/CustomDraw`、`pages/PropertyAnimation`、`pages/XComponent`、`pages/AnimatorDisplaySync` 的路径结构检查 |
| DsTextMatrix1 | DsTextMatrix1.test.ets | 40 | 各页面文案字符串检查（DisplaySync、CustomDraw、Animator 等标题与按钮文案） |

测试入口与辅助文件：

- `test/List.test.ets`：注册全部套件；
- `test/Ability.test.ets`：应用上下文、包信息、模块入口共 3 条环境自检；
- `util/TestTick.ets`：每 10 条用例插入一次 1ms 定时器，让主线程回到事件循环；
- `testability/TestAbility.ets`：`onForeground` 后延迟 1 秒注册 hypium，`onDestroy` 以 -2 结束；
- `testrunner/OpenHarmonyTestRunner.ts`：拉起 `TestAbility`，开发者模式未解锁时以 -3 结束；
- `utils/Logger.ets`：测试侧日志封装，沿用同一 `DOMAIN` / `TAG`。

## 手工用例

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| -------- | -------- | ---- | -------- | -------- | -------- |
| 拉起应用 | 设备正常运行 | 无 | 成功拉起应用 | 是 | Pass |
| 主页展示 | 设备正常运行 | 无 | 展示 CustomDraw、PropertyAnimation、XComponent、Animator 按钮 | 否 | Pass |
| 主页按钮点击 | 位于主页 | 点击 CustomDraw | 跳转自绘制页面 | 否 | Pass |
| 自绘制开始 | 位于自绘制页面 | 点击 Start | 数字 30、60 分别按 30hz、60hz 频率放大缩小 | 否 | Pass |
| 自绘制停止 | 位于自绘制页面 | 点击 Stop | 数字 30、60 变化停止 | 否 | Pass |
| 自绘制返回主页 | 位于自绘制页面 | 点击 Back | 回到主页 | 否 | Pass |
| 主页按钮点击 | 位于主页 | 点击 PropertyAnimation | 跳转属性动画页面 | 否 | Pass |
| 属性动画开始 | 位于属性动画页面 | 点击 Start | 三个方块分别按 30hz、40hz、60hz 频率来回移动 | 否 | Pass |
| 属性动画返回主页 | 位于属性动画页面 | 点击 Back | 回到主页 | 否 | Pass |
| 主页按钮点击 | 位于主页 | 点击 XComponent | 跳转 XComponent 页面 | 否 | Pass |
| XComponent 开始 | 位于 XComponent 页面 | 点击 Start | 两个方块分别按 30hz、120hz 频率来回移动 | 否 | Pass |
| XComponent 停止 | 位于 XComponent 页面 | 点击 Stop | 两个方块移动停止 | 否 | Pass |
| XComponent 返回主页 | 位于 XComponent 页面 | 点击 Back | 回到主页 | 否 | Pass |
| 主页按钮点击 | 位于主页 | 点击 Animator | 跳转 Animator 动画页面 | 否 | Pass |
| Animator 动画开始 | 位于 Animator 页面 | 先点击 Create 再点击 Play | 三个方块分别按 10hz、30hz、60hz 频率放大 | 否 | Pass |
| Animator 返回主页 | 位于 Animator 页面 | 点击 Back | 回到主页 | 否 | Pass |

手工用例的原因：页面跳转与帧率动画的观感无法用断言表达，自动化改为对 `displaySync` 的接口契约、帧率区间和调用序列做参数化校验。

## 运行方式

```shell
hvigorw --mode module -p module=entry@ohosTest -p product=default assembleHap --no-daemon
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
hdc shell aa test -b com.samples.displaySync -m entry_test -s unittest /ets/testrunner/OpenHarmonyTestRunner -s timeout 30000
```

安装后也可在 DevEco Studio 中右键 `entry/src/ohosTest` 运行。仓库内 `build-profile.json5` 的 `signingConfigs` 为空，运行前需在 DevEco Studio 的 Signing Configs 中配置自动签名；更换证书后先 `hdc uninstall` 再安装，否则报 `install sign info inconsistent`。

## 真机实测约束

1. hypium 把整批用例串在同一个主线程任务里执行，主线程累计占用超过 6 秒会被系统判定 `THREAD_BLOCK_6S` 并结束进程（报告表现为 `TestFinished-ResultMsg: App died`），因此每个套件必须用 `beforeEachIt` 调用 `tick()`，每 10 条用例插入一次 1ms 定时器。
2. 用例注册放在 `TestAbility.onForeground` 之后延迟 1 秒执行，避免注册阶段同步写日志导致前台超时并回收测试进程。
3. `-s unittest` 的入口路径必须写成小写的 `/ets/testrunner/OpenHarmonyTestRunner`，设备端大小写敏感，写成 `TestRunner` 会报 `Cannot find module`。
4. 开发者模式未解锁屏幕时 `aa start` 返回 `10106102`，`OpenHarmonyTestRunner` 会以 -3 直接结束测试，跑测前先解锁屏幕。
5. `displaySync` 实例必须在用例内创建并成对 `off` / `stop`，否则同一进程内连续创建会残留回调，后续套件的帧率断言会受上一套件影响。
6. hilog 的 tag 超过 31 字节会截断，所有套件只使用一个短 tag `[Sample_DisplaySync]`，用例归属靠日志正文中的 `it` 名称区分。
