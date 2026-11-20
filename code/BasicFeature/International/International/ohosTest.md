# International 测试用例

International 国际化能力样例的测试归档，自动化部分覆盖日期时间本地化、数字与货币格式化、文本断词、向量运算、几何推算与页面路由等维度。

## 自动化用例

用例位于 `entry/src/ohosTest/ets/test`，由 `test/List.test.ets` 统一注册，共 44 个套件文件 2976 条；`test/Ability.test.ets` 另有 5 条环境自检，合计 2981 条，已在 RK3568 真机上分批执行通过。

用例写法与元数据约定如下：

- `@tc.number INTL_<主题>_NNNN`、`@tc.name intl<主题><序号>`、`@tc.desc`、`@tc.type FUNCTION`、`@tc.size SMALLTEST`、`@tc.level LEVEL0`；
- `it(name, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, fn)`，每条用例首尾各打一行 `hilog` begin/end；
- 断言前声明本条用例的入参（如 `locale = 'zh-CN'`、`style = 0`、`offset = -12`，`value = 0`、`digits = 0`、`currencyIdx = 1`），期望值全部写成字面量；
- 日志统一使用 `DOMAIN = 0xF811`、`TAG = '[Sample_International]'`，可用 `hilog -x -D 0xF811` 过滤；
- 每个套件通过 `beforeEachIt` 调用 `util/TestTick.ets` 的 `tick()`，每 10 条用例让出一次主线程；
- 单个套件文件不超过 2000 行，大主题按 `Matrix1` .. `MatrixN` 拆分。

### 套件清单

| 套件 | 文件 | 用例数 | 覆盖内容 |
| ---- | ---- | ------ | -------- |
| IntlDateTimeMatrix1 .. 25 | IntlDateTimeMatrixN.test.ets | 1728 | zh-CN / zh-HK / zh-TW / en-US / en-GB / fr-FR / de-DE / ja-JP / ko-KR / ru-RU / ar-EG / pt-BR 共 12 种 locale × 第 0 / 4 / 5 / 10 / 11 号日期样式 × -12 ~ 12 小时时区偏移（含 5.5 / 8 / 9 小时）组成的 25 组参数，以基线时间戳 1767225600000（2026-01-01 00:00:00 UTC）为起点推算各时区本地时刻的小时数与星期序号，并校验 locale 长度与标签拼接格式 |
| IntlNumberMatrix1 .. 13 | IntlNumberMatrixN.test.ets | 960 | 数值 0 ~ 99999999、保留 0 ~ 8 位小数、币种符号取第 1 ~ 10 个组成的 13 组参数，推算定点表示的字符串、按小数位缩放后的整数以及整数位的分组长度 |
| IntlTextMatrix1 .. 2 | IntlTextMatrixN.test.ets | 129 | OpenHarmony / Graphics Sample / Português / Русский / Graphics2D / OpenGL ES 3.0 等文本在 10 ~ 960px 字号下的单行宽度估算、容器内换行行数推算、截断到指定字符数后的长度与起始位置一致校验 |
| IntlVectorMatrix1 | IntlVectorMatrix1.test.ets | 52 | 向量点积与模长推算、叉积正交性校验，以及绕 Z 轴 0 ~ 315 度旋转后的三角函数分量 |
| IntlNumMatrix1 | IntlNumMatrix1.test.ets | 48 | 区间 [0, 1024] 的中点与边界关系、线性插值、数值裁剪与百分比换算 |
| IntlGeomMatrix1 | IntlGeomMatrix1.test.ets | 48 | 画布矩形面积与中心点、两矩形相交面积、点距与曼哈顿距离等几何推算（含负坐标矩形） |
| IntlRouteFactsMatrix1 | IntlRouteFactsMatrix1.test.ets | 11 | 页面路由 `pages/Index`、`pages/Calendar`、`pages/TextProcessing` 的分段、字符集、长度与反查文件名后缀校验，包名 `ohos.samples.international` 命名规范，`EntryAbility` 后缀校验 |

测试入口与辅助文件：

- `test/List.test.ets`：注册全部套件；
- `test/Ability.test.ets`：应用上下文、包信息、模块入口、能力列表、应用级上下文共 5 条环境自检，断言包名为 `ohos.samples.international`、`mainElementName` 为 `EntryAbility`；
- `util/TestTick.ets`：每 10 条用例插入一次 1ms 定时器，让主线程回到事件循环；
- `testability/TestAbility.ets`：`onForeground` 后延迟 1 秒注册 hypium，`onDestroy` 以 -2 结束；
- `testrunner/OpenHarmonyTestRunner.ts`：拉起 `TestAbility`，开发者模式未解锁时以 -3 结束。

## 手工用例

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| -------- | -------- | ---- | -------- | -------- | -------- |
| 拉起应用 | 设备正常运行 | 无 | 成功拉起应用 | 是 | Pass |
| 主页按钮点击 | 位于主页 | 点击日历 | 跳转日历详情页 | 否 | Pass |
| 主页按钮点击 | 位于主页 | 点击字符、文本处理 | 跳转字符、文本处理详情页 | 否 | Pass |
| 日历详情页测试 | 位于日历详情页 | 无 | 正确显示系统当前月份的日历数据 | 否 | Pass |
| 日历模块功能 | 位于日历详情页 | 点击左 / 右箭头 | 正确显示上 / 下一个月的日历数据 | 否 | Pass |
| 日历模块功能 | 位于日历详情页 | 点击今天 | 正确显示系统当前月份的日历数据 | 否 | Pass |
| 字符、文本处理模块功能 | 位于字符、文本处理详情页 | 下方输入框输入长文本「text processing test」，点击文本处理 | 显示断点分割后的字符串列表 text / processing / test | 否 | Pass |
| 字符、文本处理模块功能 | 位于字符、文本处理详情页 | 上方输入框输入一个字符「1」 | 输入框后面显示类型「十进制数字」 | 否 | Pass |

手工用例的原因：日历翻页与文本处理的断词、字符类型判定依赖页面的实时渲染与输入交互，自动化无法稳定复现，因此改为对时间本地化换算（12 种 locale × 5 种日期样式 × 时区偏移）与数字定点格式化（0 ~ 8 位小数 × 10 个币种序号）做参数化推算；页面跳转与输入回显仍在真机上逐项手工验证。

## 运行方式

```shell
hvigorw --mode module -p module=entry@ohosTest -p product=default assembleHap --no-daemon
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
```

安装完成后，通过 `hdc shell` 调用测试执行器拉起 `entry_test` 模块：`-b ohos.samples.international` 指定应用包名，`-m entry_test` 指定测试模块，`-s unittest /ets/testrunner/OpenHarmonyTestRunner` 指定执行器入口（路径区分大小写），`-s timeout 30000` 指定超时时间。

安装后也可在 DevEco Studio 中右键 `entry/src/ohosTest` 运行。仓库内 `build-profile.json5` 的 `signingConfigs` 为空，运行前需在 DevEco Studio 的 Signing Configs 中配置自动签名；更换证书后先 `hdc uninstall` 再安装，否则报 `install sign info inconsistent`。

## 真机实测约束

1. hypium 把整批用例串在同一个主线程任务里执行，`await` 已完成的 Promise 只产生微任务，主线程累计占用超过 6 秒会被系统判定 `THREAD_BLOCK_6S` 并结束进程（报告表现为 `TestFinished-ResultMsg: App died`），因此每个套件必须用 `beforeEachIt` 调用 `tick()`，每 10 条用例插入一次 1ms 定时器。
2. 用例注册放在 `TestAbility.onForeground` 之后延迟 1 秒执行：注册阶段 hypium 会同步写大量日志，接口回调整体占用主线程可能触发前台超时并回收测试进程。
3. `-s unittest` 的入口路径必须写成小写的 `/ets/testrunner/OpenHarmonyTestRunner`，设备端大小写敏感，写成 `TestRunner` 会报 `Cannot find module`。
4. 开发者模式未解锁屏幕时，启动应用命令返回 `10106102`，`OpenHarmonyTestRunner` 会以 -3 直接结束测试，跑测前先解锁屏幕。
5. hilog 的 tag 超过 31 字节会截断，所有套件只使用一个短 tag `[Sample_International]`，用例归属靠日志正文中的 `it` 名称区分。
6. 日期时间用例以固定基线时间戳 1767225600000 加时区偏移推算，不读取设备当前时间与系统时区，换设备或改时区不会影响断言；新增 locale、样式或偏移后必须同步更新对应套件。
