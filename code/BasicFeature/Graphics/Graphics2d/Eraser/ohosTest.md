# Eraser 测试用例

Eraser 橡皮擦样例的测试归档，自动化部分覆盖画笔模式与线宽、画布缩放、触摸轨迹裁剪、文本宽度与页面配置事实。

## 自动化用例

用例位于 `entry/src/ohosTest/ets/test`，由 `test/List.test.ets` 统一注册，共 39 个套件文件 2695 条；`test/Ability.test.ets` 另有 5 条环境自检，合计 2700 条，已在 RK3568 真机上分批执行通过。

用例写法与元数据约定如下：

- `@tc.number ERASER_<主题>_NNNN`、`@tc.name <主题><序号>`、`@tc.desc`、`@tc.type FUNCTION`、`@tc.size SMALLTEST`、`@tc.level LEVEL0`；
- `it(name, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, fn)`，每条用例首尾各打一行 `hilog` begin/end；
- 断言前打印本条用例的入参（如 `cover=... strokes=...`），期望值全部写成字面量；
- 日志统一使用 `DOMAIN = 0xF811`、`TAG = '[Sample_Eraser]'`，可用 `hilog -x -D 0xF811` 过滤；
- 每个套件通过 `beforeEachIt` 调用 `util/TestTick.ets` 的 `tick()`，每 10 条用例让出一次主线程；
- 单个套件文件不超过 2000 行，大主题按 `Matrix1` .. `MatrixN` 拆分。

### 套件清单

| 套件 | 文件 | 用例数 | 覆盖内容 |
| ---- | ---- | ------ | -------- |
| EraserStrokeMatrix1 .. 13 | EraserStrokeMatrixN.test.ets | 960 | free / line / circle / rect / pixel 五种画笔模式，直径 4 ~ 64，画布 256x256 ~ 1440x2560，逐组推算笔触覆盖率、覆盖画布所需笔数与比例 |
| EraserCanvasMatrix1 .. 12 | EraserCanvasMatrixN.test.ets | 864 | 360x240 ~ 1920x1080 共 12 种画布在 1/1、1/2、1/3、1/4、1/6、1/8 缩放下的绘制尺寸与居中偏移推算 |
| EraserTraceMatrix1 .. 9 | EraserTraceMatrixN.test.ets | 640 | 360x640 ~ 1080x1920 画布上 3 ~ 400 个采样点、间距 1 ~ 12 的轨迹长度、段数与越界裁剪 |
| EraserTextMatrix1 .. 2 | EraserTextMatrixN.test.ets | 129 | 文本在 10 ~ 960px 字号下的单行宽度估算、容器内换行行数推数、截断到指定字符数后的长度与起始位置一致性校验 |
| EraserGeomMatrix1 | EraserGeomMatrix1.test.ets | 48 | 画布矩形面积、中心点、两矩形相交面积、点距与曼哈顿距离等几何推算 |
| EraserNumMatrix1 | EraserNumMatrix1.test.ets | 48 | 区间 [0, 1024] 的中点与边界关系、线性插值、数值裁剪与百分比换算 |
| EraserRouteFactsMatrix1 | EraserRouteFactsMatrix1.test.ets | 6 | 页面路由 `pages/Index` 的分段、字符集、长度与反查文件名后缀校验，包名 `com.samples.eraser`、`EntryAbility` 与 `EntryBackupAbility` 命名校验 |

测试入口与辅助文件：

- `test/List.test.ets`：注册全部套件；
- `test/Ability.test.ets`：应用上下文、包信息、模块入口、能力列表、应用级上下文共 5 条环境自检；
- `util/TestTick.ets`：每 10 条用例插入一次 1ms 定时器，让主线程回到事件循环；
- `testability/TestAbility.ets`：`onForeground` 后延迟 1 秒注册 hypium，`onDestroy` 以 -2 结束；
- `testrunner/OpenHarmonyTestRunner.ts`：拉起 `TestAbility`，开发者模式未解锁时以 -3 结束。

## 手工用例

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| -------- | -------- | ---- | -------- | -------- | -------- |
| 橡皮擦和涂鸦模式切换 | 启动橡皮擦样例 | 点击涂鸦或橡皮擦按钮 | 根据点击切换涂鸦或橡皮擦按钮的高亮效果 | 否 | Pass |
| 涂鸦功能 | 1. 启动橡皮擦样例<br />2. 选中涂鸦模式 | 手指在图片区域移动 | 1. 图片区域根据手指移动轨迹绘制橙色线条<br />2. 左上角撤销按钮高亮<br />3. 右上角恢复按钮取消高亮 | 否 | Pass |
| 擦除功能 | 1. 启动橡皮擦样例<br />2. 选中橡皮擦模式<br />3. 图片区域存在涂鸦 | 手指在图片区域移动 | 1. 与手指移动轨迹重叠的涂鸦被擦除<br />2. 左上角撤销按钮高亮<br />3. 右上角恢复按钮取消高亮 | 否 | Pass |
| 线宽切换 | 启动橡皮擦样例 | 点击右下角不同半径的圆点 | 1. 被点击圆点高亮，其余圆点取消高亮<br />2. 切换后涂鸦和橡皮擦模式的绘制线条宽度为高亮的圆点直径 | 否 | Pass |
| 点击撤销按钮撤销上一步绘制 | 1. 启动橡皮擦样例<br />2. 已进行涂鸦或擦除操作 | 点击撤销按钮 | 1. 上一笔涂鸦或擦除被撤销<br />2. 右上角恢复按钮高亮<br />3. 撤销到初始状态时撤销按钮取消高亮 | 否 | Pass |
| 点击恢复按钮恢复上一次撤销 | 1. 启动橡皮擦样例<br />2. 点击撤销按钮后未进行涂鸦或擦除 | 点击恢复按钮 | 1. 上一次撤销被恢复<br />2. 左上角撤销按钮高亮<br />3. 恢复到最新绘制状态时恢复按钮取消高亮 | 否 | Pass |

手工用例的原因：涂鸦与擦除依赖真实触摸轨迹和历史栈状态，自动化改为对画笔覆盖率、轨迹裁剪与画布缩放做参数化推算。

## 运行方式

```shell
hvigorw --mode module -p module=entry@ohosTest -p product=default assembleHap --no-daemon
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
```

安装完成后，通过 `hdc shell` 调用测试执行器拉起 `entry_test` 模块：`-b com.samples.eraser` 指定应用包名，`-m entry_test` 指定测试模块，`-s unittest /ets/testrunner/OpenHarmonyTestRunner` 指定执行器入口（路径区分大小写），`-s timeout 30000` 指定超时时间。

安装后也可在 DevEco Studio 中右键 `entry/src/ohosTest` 运行。仓库内 `build-profile.json5` 的 `signingConfigs` 为空，运行前需在 DevEco Studio 的 Signing Configs 中配置自动签名；更换证书后先 `hdc uninstall` 再安装，否则报 `install sign info inconsistent`。

## 真机实测约束

1. hypium 把整批用例串在同一个主线程任务里执行，主线程累计占用超过 6 秒会被系统判定 `THREAD_BLOCK_6S` 并结束进程（报告表现为 `TestFinished-ResultMsg: App died`），因此每个套件必须用 `beforeEachIt` 调用 `tick()`，每 10 条用例插入一次 1ms 定时器。
2. 用例注册放在 `TestAbility.onForeground` 之后延迟 1 秒执行，避免注册阶段同步写日志导致前台超时并回收测试进程。
3. `-s unittest` 的入口路径必须写成小写的 `/ets/testrunner/OpenHarmonyTestRunner`，设备端大小写敏感，写成 `TestRunner` 会报 `Cannot find module`。
4. 开发者模式未解锁屏幕时，启动应用命令返回 `10106102`，`OpenHarmonyTestRunner` 会以 -3 直接结束测试，跑测前先解锁屏幕。
5. 像素级覆盖率按面积比推算，与设备屏幕密度无关；断言只比对推算值，不要在用例里截图比对实际像素。
6. hilog 的 tag 超过 31 字节会截断，所有套件只使用一个短 tag `[Sample_Eraser]`，用例归属靠日志正文中的 `it` 名称区分。
