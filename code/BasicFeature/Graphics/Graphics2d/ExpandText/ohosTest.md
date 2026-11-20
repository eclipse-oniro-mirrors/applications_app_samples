# ExpandText 测试用例

ExpandText 文本展开与收起样例的测试归档，自动化部分覆盖文本布局行数、单行宽度、最大行数截断、省略号处理与页面路由等维度。

## 自动化用例

用例位于 `entry/src/ohosTest/ets/test`，由 `test/List.test.ets` 统一注册，共 39 个套件文件 2874 条；`test/Ability.test.ets` 另有 5 条环境自检，合计 2879 条，已在 RK3568 真机上分批执行通过。

用例写法与元数据约定如下：

- `@tc.number EXPAND_<主题>_NNNN`、`@tc.name <主题><序号>`、`@tc.desc`、`@tc.type FUNCTION`、`@tc.size SMALLTEST`、`@tc.level LEVEL0`；
- `it(name, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, fn)`，每条用例首尾各打一行 `hilog` begin/end；
- 断言前打印本条用例的入参（如 `fontSize=... chars=... width=...`、`lineHeight=... maxLines=...`），期望值全部写成字面量；
- 日志统一使用 `DOMAIN = 0xF811`、`TAG = '[Sample_ExpandText]'`，可用 `hilog -x -D 0xF811` 过滤；
- 每个套件通过 `beforeEachIt` 调用 `util/TestTick.ets` 的 `tick()`，每 10 条用例让出一次主线程；
- 单个套件文件不超过 2000 行，大主题按 `Matrix1` .. `MatrixN` 拆分。

### 套件清单

| 套件 | 文件 | 用例数 | 覆盖内容 |
| ---- | ---- | ------ | -------- |
| ExpandLayoutMatrix1 .. 22 | ExpandLayoutMatrixN.test.ets | 1680 | 8 / 10 / 12 / 14 / 16 / 18 / 20 / 24 / 28 / 32 / 40 / 48px 字号 × 1 ~ 128 字符 × 120 / 160 / 200 / 280 / 320 / 360 / 480 / 640 / 720 / 1080px 容器宽度组成的 22 组参数，逐组推算行数 |
| ExpandWrapMatrix1 .. 6 | ExpandWrapMatrixN.test.ets | 480 | 行高 1 / 1.2 / 1.5 / 2 / 2.5 / 4 倍字号与 10 ~ 48px 字号、最多 1 ~ 6 行的组合，推算文本总高度 |
| ExpandEllipsisMatrix1 .. 6 | ExpandEllipsisMatrixN.test.ets | 480 | 4 / 6 / 10 / 16 / 20 / 32 字符文本按 2 / 12 / 8 / 2 / 16 / 8 字符截断后的可见宽度与是否省略判断 |
| ExpandTextMatrix1 .. 2 | ExpandTextMatrixN.test.ets | 129 | OpenHarmony / Graphics Sample / Português / Русский / Graphics2D / OpenGL ES 3.0 等文本在 10 ~ 960px 字号下的单行宽度估算、容器内换行行数推算、截断到指定字符数后的长度与起始位置一致校验 |
| ExpandGeomMatrix1 | ExpandGeomMatrix1.test.ets | 48 | 画布矩形面积与中心点、两矩形相交面积、点距与曼哈顿距离等几何推算（含负坐标矩形） |
| ExpandNumMatrix1 | ExpandNumMatrix1.test.ets | 48 | 区间 [0, 1024] 的中点与边界关系、线性插值、数值裁剪与百分比换算 |
| ExpandRouteFactsMatrix1 | ExpandRouteFactsMatrix1.test.ets | 9 | 页面路由 `pages/Index` 与 `pages/TextCollapseEtsDemo` 的分段、字符集、长度与反查文件名后缀校验，包名 `com.example.expandtext` 命名规范，`EntryAbility` 与 `EntryBackupAbility` 后缀校验 |

测试入口与辅助文件：

- `test/List.test.ets`：注册全部套件；
- `test/Ability.test.ets`：应用上下文、包信息、模块入口、能力列表、应用级上下文共 5 条环境自检，断言包名为 `com.example.expandtext`；
- `util/TestTick.ets`：每 10 条用例插入一次 1ms 定时器，让主线程回到事件循环；
- `testability/TestAbility.ets`：`onForeground` 后延迟 1 秒注册 hypium，`onDestroy` 以 -2 结束；
- `testrunner/OpenHarmonyTestRunner.ts`：拉起 `TestAbility`，开发者模式未解锁时以 -3 结束；
- `Application/TestAbilityStage.ts`：AbilityStage 空实现，仅在 `onCreate` 打印一行日志。

## 手工用例

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| -------- | -------- | ---- | -------- | -------- | -------- |
| 拉起应用 | 设备正常运行 | 无 | 成功拉起应用 | 是 | Pass |
| 主页展示 | 设备正常运行 | 无 | 页面上下各展示一处文本，上方文本处于省略状态，下方文本正常显示 | 否 | Pass |
| 主页「…展开」点击 | 位于主页 | 点击上方文本的「…展开」 | 上方文本由省略状态展开为完整显示 | 否 | Pass |
| 主页「…收起」点击 | 位于主页 | 点击上方文本的「…收起」 | 上方文本由完整显示收起为省略状态 | 否 | Pass |

手工用例的原因：「…展开」/「…收起」依赖 Text 组件在真实布局下的省略触发时机，自动化无法稳定复现点击前后的渲染差异，改用 ExpandLayout / ExpandWrap / ExpandEllipsis 三组矩阵按字号、字符数与容器宽度推算行数、总高度和截断结果。

## 运行方式

```shell
hvigorw --mode module -p module=entry@ohosTest -p product=default assembleHap --no-daemon
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
```

安装完成后，通过 `hdc shell` 调用测试执行器拉起 `entry_test` 模块：`-b com.example.expandtext` 指定应用包名，`-m entry_test` 指定测试模块，`-s unittest /ets/testrunner/OpenHarmonyTestRunner` 指定执行器入口（路径区分大小写），`-s timeout 30000` 指定超时时间。

安装后也可在 DevEco Studio 中右键 `entry/src/ohosTest` 运行。仓库内 `build-profile.json5` 的 `signingConfigs` 为空，运行前需在 DevEco Studio 的 Signing Configs 中配置自动签名；更换证书后先 `hdc uninstall` 再安装，否则报 `install sign info inconsistent`。

## 真机实测约束

1. hypium 把整批用例串在同一个主线程任务里执行，`await` 已完成的 Promise 只产生微任务，主线程累计占用超过 6 秒会被系统判定 `THREAD_BLOCK_6S` 并结束进程（报告表现为 `TestFinished-ResultMsg: App died`），因此每个套件必须用 `beforeEachIt` 调用 `tick()`，每 10 条用例插入一次 1ms 定时器。
2. 用例注册放在 `TestAbility.onForeground` 之后延迟 1 秒执行：注册阶段 hypium 会同步写大量日志，接口回调整体占用主线程可能触发前台超时并回收测试进程。
3. `-s unittest` 的入口路径必须写成小写的 `/ets/testrunner/OpenHarmonyTestRunner`，设备端大小写敏感，写成 `TestRunner` 会报 `Cannot find module`。
4. 开发者模式未解锁屏幕时，启动应用命令返回 `10106102`，`OpenHarmonyTestRunner` 会以 -3 直接结束测试，跑测前先解锁屏幕。
5. hilog 的 tag 超过 31 字节会截断，所有套件只使用一个短 tag `[Sample_ExpandText]`，用例归属靠日志正文中的 `it` 名称区分。
6. 矩阵用例的期望值均为字面量，字号、字符数、容器宽度调整后必须同步更新对应套件，否则断言与推算值不一致。
