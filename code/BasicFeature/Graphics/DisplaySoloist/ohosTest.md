# DisplaySoloist 测试用例

DisplaySoloist 分层帧率控制样例的测试归档，自动化部分覆盖帧率区间、帧时间线、自绘面板文本与页面路由等维度。

## 自动化用例

用例位于 `entry/src/ohosTest/ets/test`，由 `test/List.test.ets` 统一注册，共 33 个套件文件 2480 条；`test/Ability.test.ets` 另有 5 条环境自检，合计 2485 条，已在 RK3568 真机上分批执行通过。

用例写法与元数据约定如下：

- `@tc.number SOLO_<主题>_NNNN`、`@tc.name <主题><序号>`、`@tc.desc`、`@tc.type FUNCTION`、`@tc.size SMALLTEST`、`@tc.level LEVEL0`；
- `it(name, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, fn)`，每条用例首尾各打一行 `hilog` begin/end；
- 断言前打印本条用例的入参（如 `frames=... drift=...`、`cover=...`），期望值全部写成字面量；
- 日志统一使用 `DOMAIN = 0xF811`、`TAG = '[Sample_DisplaySoloist]'`，可用 `hilog -x -D 0xF811` 过滤；
- 每个套件通过 `beforeEachIt` 调用 `util/TestTick.ets` 的 `tick()`，每 10 条用例让出一次主线程；
- 单个套件文件不超过 2000 行，大主题按 `Matrix1` .. `MatrixN` 拆分。

### 套件清单

| 套件 | 文件 | 用例数 | 覆盖内容 |
| ---- | ---- | ------ | -------- |
| SoloFrameRateMatrix1 .. 28 | SoloFrameRateMatrixN.test.ets | 2250 | 1 / 5 / 10 / 15 / 20 / 24 / 25 / 30 / 48 / 50 / 60 / 72 / 90 / 120 / 144fps 与 16 ~ 900000ms 组成的 28 组参数，逐组推算帧数、帧间隔、累计误差、微秒级帧预算与尾差 |
| SoloPanelTextMatrix1 .. 2 | SoloPanelTextMatrixN.test.ets | 129 | 自绘面板文本在 10 ~ 960px 字号下的单行宽度估算、容器内换行行数推算、截断到指定字符数后的长度与起始位置一致性校验（含 Português / Русский / Graphics2D / OpenGL ES 3.0 等文本） |
| SoloCanvasGeomMatrix1 | SoloCanvasGeomMatrix1.test.ets | 48 | 画布矩形面积、中心点、两矩形相交面积、点距与曼哈顿距离等几何推算（含负坐标矩形） |
| SoloTimelineNumMatrix1 | SoloTimelineNumMatrix1.test.ets | 48 | 帧时间线区间 [0, 1024] 的中点与边界关系、线性插值、数值裁剪与百分比换算 |
| SoloRouteFactsMatrix1 | SoloRouteFactsMatrix1.test.ets | 5 | 页面路由 `pages/Index` 的分段、字符集、长度与反查文件名后缀校验，包名 `com.samples.DisplaySoloist` 命名规范与 `EntryAbility` 后缀校验 |

测试入口与辅助文件：

- `test/List.test.ets`：注册全部套件；
- `test/Ability.test.ets`：应用上下文、包信息、模块入口、能力列表、应用级上下文共 5 条环境自检；
- `util/TestTick.ets`：每 10 条用例插入一次 1ms 定时器，让主线程回到事件循环；
- `testability/TestAbility.ets`：`onForeground` 后延迟 1 秒注册 hypium，`onDestroy` 以 -2 结束；
- `testrunner/OpenHarmonyTestRunner.ts`：拉起 `TestAbility`，开发者模式未解锁时以 -3 结束；
- `utils/Logger.ets`：测试侧日志封装，沿用同一 `DOMAIN` / `TAG`。

## 手工用例

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| -------- | -------- | ---- | -------- | -------- | -------- |
| 拉起应用 | 设备正常运行 | 无 | 成功拉起应用 | 是 | Pass |
| 30hz 启停 | 位于主页 | 点击 30hz 右侧 Start，再点击 Stop | 方块按 30hz 频率移动，按钮在 Start / Stop 之间切换；停止后方块不再移动 | 否 | Pass |
| 60hz 启停 | 位于主页 | 点击 60hz 右侧 Start，再点击 Stop | 方块按 60hz 频率移动，按钮在 Start / Stop 之间切换；停止后方块不再移动 | 否 | Pass |
| 120hz 启停 | 位于主页 | 点击 120hz 右侧 Start，再点击 Stop | 方块按 120hz 频率移动，按钮在 Start / Stop 之间切换；停止后方块不再移动 | 否 | Pass |

手工用例的原因：三组按钮的启停时序无法在自动化中稳定复现，自动化改为按帧率参数推算帧数与回调间隔。

## 运行方式

```shell
hvigorw --mode module -p module=entry@ohosTest -p product=default assembleHap --no-daemon
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
```

安装完成后，通过 `hdc shell` 调用测试执行器拉起 `entry_test` 模块：`-b com.samples.DisplaySoloist` 指定应用包名，`-m entry_test` 指定测试模块，`-s unittest /ets/testrunner/OpenHarmonyTestRunner` 指定执行器入口（路径区分大小写），`-s timeout 30000` 指定超时时间。

安装后也可在 DevEco Studio 中右键 `entry/src/ohosTest` 运行。仓库内 `build-profile.json5` 的 `signingConfigs` 为空，运行前需在 DevEco Studio 的 Signing Configs 中配置自动签名；更换证书后先 `hdc uninstall` 再安装，否则报 `install sign info inconsistent`。

## 真机实测约束

1. hypium 把整批用例串在同一个主线程任务里执行，`await` 已完成的 Promise 只产生微任务，主线程累计占用超过 6 秒会被系统判定 `THREAD_BLOCK_6S` 并结束进程（报告表现为 `TestFinished-ResultMsg: App died`），因此每个套件必须用 `beforeEachIt` 调用 `tick()`，每 10 条用例插入一次 1ms 定时器。
2. 用例注册放在 `TestAbility.onForeground` 之后延迟 1 秒执行：注册阶段 hypium 会同步写大量日志，接口回调整体占用主线程可能触发前台超时并回收测试进程。
3. `-s unittest` 的入口路径必须写成小写的 `/ets/testrunner/OpenHarmonyTestRunner`，设备端大小写敏感，写成 `TestRunner` 会报 `Cannot find module`。
4. 开发者模式未解锁屏幕时，启动应用命令返回 `10106102`，`OpenHarmonyTestRunner` 会以 -3 直接结束测试，跑测前先解锁屏幕。
5. hilog 的 tag 超过 31 字节会截断，所有套件只使用一个短 tag `[Sample_DisplaySoloist]`，用例归属靠日志正文中的 `it` 名称区分。
6. 矩阵用例的期望值均为字面量，帧率、时长等参数调整后必须同步更新对应套件，否则断言与推算值不一致。
