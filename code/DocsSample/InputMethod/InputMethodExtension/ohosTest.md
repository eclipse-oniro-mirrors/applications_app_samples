# InputMethodExtension 测试说明

本工程 `entry/src/ohosTest` 共 **411 条**用例（23 个测试文件 / 28 个 `describe` 套件），编号前缀
`SUB_INPUT_METHOD_`。用例按“真实代码路径 + 维度矩阵 + 设备真调用 + 空状态 + 页面冒烟”分层，
全部 `import` `main/ets` 下的正式函数，不在用例里重写业务规则。

## 测试环境

| 项 | 取值 |
| --- | --- |
| 设备 | dayu200（RK3568）真机 |
| 系统 | OpenHarmony 7.1.0.22 |
| SDK | `compatibleSdkVersion` / `targetSdkVersion` 均为 `26.0.0` |
| 测试框架 | `@ohos/hypium` + `OpenHarmonyTestRunner`（模块名 `entry_test`） |
| 签名 | DevEco 自动签名（debugKey），安装包与测试包同一套证书 |
| 权限 | 不申请任何权限 |

## 测试步骤

### 1. 构建测试包

在 DevEco Studio 里 `Build → Build Hap(s)/APP(s) → Build Hap(s)`；命令行等价写法：

```bash
hvigorw --mode module -p module=entry@default -p product=default assembleHap
hvigorw --mode module -p module=entry@ohosTest -p product=default assembleHap
```

判定成功看输出里的 `BUILD SUCCESSFUL`，不看 exit code（签名 WARN 走 stderr）。

### 2. 安装主包与测试包

两个包都必须装：`InputMethodFrameworkDeviceTest`、`InputMethodExtraConfigDeviceTest` 与
`InputMethodUiSmokeTest` 会在主包里启动 Ability，只装测试包会全部报 `startAbility failed`。

```bash
hdc install -r entry/build/default/outputs/default/entry-default-signed.hap
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
```

### 3. 运行

IDE 方式：右键 `entry/src/ohosTest` → Run，即执行 `testsuite()` 里登记的全部 411 条；只跑某个套件时，
在对应测试文件的 `describe` 旁点运行。**不要勾选「安装选项 → 仅测试包」**，原因见
[README](README.md) 「已知问题与注意点」第 2 条。

命令行方式（单设备，`-w` 为总等待上限）：

```bash
hdc shell aa test -b com.example.inputmethodextension -m entry_test \
  -s unittest OpenHarmonyTestRunner -w 1800000
```

结果看这两行：

```text
OHOS_REPORT_RESULT: stream=Tests run: 411, Failure: 0, Error: 0, Pass: 411, Ignore: 0
TestFinished-ResultMsg: your test finished!!!
```

失败时堆栈在 `OHOS_REPORT_STATUS: stack=` 与 `stream=Error in testXxxx, expect A equals B` 里。

### 4. 判定口径

单一用例必须跑在真机上（`createPanel`、`InputMethodListDialog`、UI 冒烟都依赖真实系统服务与渲染），
连续两轮 `Failure: 0` 才算通过；非 `0` 时先看是否为环境噪声（设备锁屏、输入法弹窗遮挡）。

## 用例规范

用例名统一 `test<Area><NNNN>`：`Area` 由文件名派生（`InputMethodValueMatrix.test.ets` →
`testValueMatrix0001`），`NNNN` 在套件内递增，`@tc.name` 与 `it()` 名称逐字一致。每条用例带六项元数据：

```ets
/**
 * @tc.number    SUB_INPUT_METHOD_VALUE_0100
 * @tc.name      testValueMatrix0001
 * @tc.desc      Verify the UTF-8 byte count of an ASCII key against the 32KB budget.
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 2
 */
```

`List.test.ets` 的 `testsuite()` 里按顺序逐个**直接调用**各文件的注册函数。这里必须写成 `xxxTest();`
这种直接调用语句——DevEco 运行测试前会静态扫描该文件，表驱动写法（数组 + `forEach`）会被判成
“未注册任何函数”，报 00502002 / 00502004。

断言口径是“硬断言”：每条用例至少 3 处 `expect(`，不写 `typeof x === 'function'`、不只判非空、
不复述 arrange；`catch` 分支内必有断言；会写共享状态的套件用 `beforeEach` / `afterEach` 清场。

审计脚本（命名 / 编号 / 元数据问题必须清零）：

```powershell
node <本示例目录>\ohos-testcase-supplement\scripts\audit_cases.js entry\src\ohosTest\ets\test
```

当前输出：

```text
total=411
duplicate names=[]
duplicate @tc.number=[]
metadata issues=[]
```

`cases under 3 static expects` 只是提示项，本工程剩 4 条（`testDevice0006`–`0009`）：四条 `createPanel`
用例共用 `assertPanelOutcome()` 入口，失败分支跑 5 个断言、成功分支跑 3 个，只是不落在用例体里，
静态扫描按 `expect(` 出现次数统计才误报，这 4 条已人工确认。

## 覆盖矩阵

每个维度取“下界/界内/上界/越界”各成一条，一条只测一个点：

| 维度 | 取值 | 落到的实现 |
| --- | --- | --- |
| 字节分支 | ASCII(1B) / 拉丁(2B) / CJK(3B) / emoji(4B) / 孤立代理 | `utf8Bytes` |
| 值类型 | number(0/负数/32 位边界) / string(空/CJK/emoji/引号/换行) / boolean | `ConfigEntry`、`settingsOf`、`configJson` |
| 额度 | 基线以下 / 32767 / 32768 / 32769 | `paddedEntries`、`configByteLength` |
| JSON 形状 | 空 / 非法 / 缺字段 / null / 数组 / 空对象 / 往返 | `configFromJson` |
| 缓冲 | 0 / 限-1 / 限 / 限+1（含 emoji 计 1、代理对整删） | `appendChar`、`deleteLast`、`applyKey` |
| 下标 | -1 / 0 / 末位 / =count / 空列表 | `clampSelected`、`specAt`、`actionText` |
| 错误码 | 0 / 401 / 501 / 801 / 12800004 / 12800013 / -1 / -2 / -3 / 未登记 | `classifyErrorCode`、`codeOfThrown` |
| 时长 | <1s / 秒 / 59999ms / 分钟 / 负数 | `formatDuration` |
| 日志 | source / level / keyword 大小写 / limit 0 与正数 / 容量裁剪 | `appendLog`、`queryLogs` |
| 长稳 | 20 次构造 / 250 次追加 / 64 次按键 / 10 次定长补齐 | 上述函数的循环调用 |
| 时间格式 | 补零 0/9/10/99/100/负数、午夜 `00:00:00`、末秒 `23:59:59`、跨年与单数字月日 | `pad2`、`formatTime`、`formatDateTime` |
| 时长分桶 | 0/1/998/999/1000/1234/59999/60000/整点/负数 | `formatDuration` |
| 截断预算 | 3/4/5/6/7/超长/CJK/代理对（奇偶预算的 head-tail 分配） | `truncateMiddle` |
| 日志容量 | 默认 / 0 / 负数 / 大于长度 / 裁剪后的首尾条目 | `appendLog` |
| 日志组合过滤 | source + minLevel + keyword 三条件、keyword 命中 tag、tag 大小写 | `queryLogs` |
| 按键序列 | 连打 / 模式往返 / 删除到空 / emoji 整删 / 满缓冲 / 未知 action | `applyKey`、`buildRows` |
| 常量与实现 | 32KB、容量 200、limit 20·30、缓冲 64、域值 tag：常量 ↔ 真函数成对断言 | 全部常量与对应实现 |
| AppStorage 通道 | `Logger.record` 写入 → `queryLogs` 读回，205 次写入后仍为 200 条 | `Logger`、`StorageKeys` |
| 数值特殊值 | NaN / Infinity / -0 / 0.5 / 1.5 / 4.5 / 59999.9 | `pad2`、`formatDuration`、`truncateMiddle`、`appendLog`、`queryLogs` |
| 码点分界 | 0x7F/0x80、0x7FF/0x800、0xFFFF/U+10000、孤立高代理 / 孤立低代理 | `utf8Bytes`、`charCount`、`deleteLast` |
| JSON / 额度异常 | `null` 字面量、重复 key、null 值、空 key、目标 ≤0 / NaN / 小数 | `configFromJson`、`paddedEntries`、`describeEntries` |## 用例分布

- `..._DATA_0100`–`2000`（20 条，`InputMethodData.test.ets`）：纯逻辑用例，覆盖键值类型与类型名、UTF-8 字节数（含 emoji 代理对）、
  32768/32769 边界、JSON 往返与非法输入、打桩读取与缺失读取、描述截断、键盘行列与功能键、`applyKey`
  的插入/删除/模式切换/缓冲上限、候选、模式项与下标收敛、错误码分类、异常取码、会话结果、目录与路由一致性；
- `..._BOUND_0100`–`1200`（12 条，`InputMethodBoundary.test.ets`）：边界矩阵——UTF-8 的 2/3 字节分界与孤立代理、
  `paddedEntries` 低于基线时无法压缩、`describeEntries` 的 `limit=0/1/全长`、同键覆盖、JSON 形状（数组/null/纯字符串）、
  缓冲 63/64/65 与 emoji 计 1 个、空格/回车/未知 action、代理对整删、`clampSelected` 与 `actionText` 越界；
- `..._UNI_0100`–`1600`（16 条，`InputMethodUnicodeEdge.test.ets`）：码点分界——UTF-8 三档分界各取左右一码点
  （0x7F/0x80、0x7FF/0x800、0xFFFF/U+10000）、孤立低代理记 3 字节而孤立高代理记 4 字节并吞掉后一个 code unit
  （`高代理+'a'` 与 `'a'+高代理` 字符数相同、字节数差 1）、`charCount` 对两种孤立代理的计数不对称、
  `deleteLast` 遇孤立低代理会连坐删掉前一个真实字符、`appendChar` 只看当前额度不看追加长度
  （空缓冲一次塞 6 个字符可越过 limit=2）、额度 NaN/Infinity 永不拦截、单空格缓冲仍有 3 个候选；
  最后一条把截断预算压到奇数，`truncateMiddle` 的 tail 只取 1 个 code unit，正好切在 emoji 的低代理上，
  预览里会留下半个字符（按码点计仍是 3），这是“预算 4 + 全 emoji”组合才会出现的形态；
- `..._NUM_0100`–`1700`（17 条，`InputMethodNumericEdge.test.ets`）：数值特殊值——`pad2` 的 -0/9.5/NaN/Infinity、
  `formatDuration` 的 NaN/Infinity/1.5ms/59999.9→`60.0 s` 与 60000→`1 min 0 s` 的分界、`-0` 与 `-0.1` 同落 `0 ms`、
  `truncateMiddle` 的 NaN/Infinity/小数预算、`describeStatusWithCode` 的 `-0` 与 NaN、
  `appendLog` 容量 0.5（比 0 更糟：0 会兜底 200，0.5 却把列表清空）、NaN 兜底、Infinity 不裁剪、1.5 只留 1 条、
  `queryLogs` 的 limit 0 与 0.5 语义相反、NaN 不裁剪；
- `..._CFG_0100`–`1300`（13 条，`InputMethodConfigEdge.test.ets`）：JSON 与额度异常——`null` 字面量与空串被拒而
  `{"customSettings":{}}` 合法、重复 key 只留最后一个、null 值被标成 string（`typeof null`）、空 key 原样保留、
  目标 ≤0/NaN 时补丁为空串且字节数与 -1 相同、小数目标因 `repeat` 截断不会超预算、
  `describeEntries` 的 NaN limit 只剩 `；…共 4 项`、1.5 只显示 1 项但尾巴仍数 4 项、-1 丢掉末项、键按码元排序（`B` 在 `a` 前）、
  8 个条目不传 limit 时取默认 6（前几条用例的条目数都不超过 6，这个默认值一直是空跑的）；
- `..._UTIL_0100`–`1200`（12 条，`InputMethodUtil.test.ets`）：工具层——未知码归入 `INTERNAL`、状态名与处理建议全枚举、
  `formatError`/`codeOfThrown`/`messageOfThrown`、四个 `CallOutcome` 工厂与 `describe`、`withTimeout` 超时、
  `pad2/formatTime/formatDuration/truncateMiddle`、`LogStore` 容量与过滤、`featureById/uncoveredSummary`；
- `..._DEVICE_0100`–`2000`（20 条，`InputMethodDevice.test.ets`）：真调用用例，覆盖 syscap、`PanelType`/`PanelFlag`（含 `FLG_` 与 `FLAG_`
  命名差异）、`getInputMethodAbility`/`getKeyboardDelegate` 实例、四种组合的 `createPanel`、12800004 分类、
  两次调用结果一致性、扩展注册/名称/exported/bundleName/模块读取、`extraConfig` 打桩读取与额度边界；
- `..._VALUE_0100`–`2700`（27 条，`InputMethodValueMatrix.test.ets`）：扩展信息的值与字节矩阵——UTF-8 四分支与孤立代理、
  三种 `CustomValueType` 的边界取值、JSON 字面量形状（含 `customSettings` 为数组时按索引键读取）、
  32768/32769 的精确字节数、读取排序（ASCII 与 CJK）、`describeEntries` 的 limit 0/负数/全长/超长；
- `..._KEY_0100`–`2500`（25 条，`InputMethodKeyboardMatrix.test.ets`）：键盘矩阵——两种模式的行宽与第三行删除键、功能键标签互换、
  码点计数（ASCII/CJK/emoji/孤立高代理连写）、缓冲 0/限-1/限、删除在空与代理对上的行为、模式键不改文本、候选后缀；
- `..._LISTM_0100`–`2200`（22 条，`InputMethodListMatrix.test.ets`）：列表与会话矩阵——模式项 0/1/2/超出/负数、
  下标 -1/0/末位/越界、回调文案、目录条目数与接口总数、路由前缀、搜索（空/标题/大小写/接口名/无命中）、未覆盖清单不含“不支持”；
- `..._ERR_0100`–`3600`（36 条，`InputMethodOutcomeMatrix.test.ets`）：错误与工具矩阵——九个错误码的分类、结果对象三态、
  异常取码（字段/文本/位数不足/缺失/0）、`describeThrown` 三类提示、时长四个分桶、截断预算 0/3/4/5/6/7、
  日志 source/level/keyword 大小写/limit、容量裁剪与不修改入参、异步立即返回，以及 20/250/64/10 次循环的长稳点；
- `..._FMT_0100`–`2500`（25 条，`InputMethodFormatMatrix.test.ets`）：格式化矩阵——`pad2` 的 0/9/10/99/100 与负数、
  `formatTime` 的午夜与末秒、日期的跨年与单数字月日、`formatDuration` 的 0/999/1000/59999/60000/整点/负数、
  `truncateMiddle` 预算 3/4/5/6/7 的奇偶分配、CJK 与代理对、`describeStatusWithCode` 的 0/负数/空文本；
- `..._LOG_0100`–`2500`（25 条，`InputMethodLogMatrix.test.ets`）：日志矩阵——`LogItem` 的自增 id 与默认值、
  `appendLog` 的默认/0/负数容量兜底与“新在前”、不修改入参且返回新数组、`queryLogs` 的空库/limit 越界/
  负数不裁剪/三条件组合/keyword 命中 tag/仅 ERROR/CJK 与空白关键字/tag 大小写敏感、`clearLogs` 返回新数组；
  第二个套件把 `Logger.record` 真写进 AppStorage 再用 `queryLogs` 读回，验证按 tag 计数、四级都落库、
  清空，以及 205 次写入后仍为 200 条；
- `..._FLOW_0100`–`2300`（23 条，`InputMethodKeyboardFlow.test.ets`）：键盘状态机——每次按键都先按 label 在
  `buildRows`/`buildFunctionRow` 里真实查找再交给 `applyKey`，覆盖连打、数字模式查键、空格/回车、模式往返、
  删除链到空、删除保留模式、emoji 与混排整删、额度精确封顶与额度 0、emoji 计 1、满缓冲忽略回车与空格、
  未知 action 落 label、删后继续输入、候选跟随缓冲、64 打 + 64 删的长稳、每次按键返回独立 `KeyEdit`；
- `..._ERRE_0100`–`1600`（16 条，`InputMethodErrorEdge.test.ets`）：取码边界——`code=0` 仍算成功、文本里的
  三位码/末尾码/最靠前的长串优先/数字粘连字母/四位与八位整取、两位数字被丢弃、裸对象与空 message 兜底为
  `-1` 与 `[object Object]`、`formatError` 的负码与空文案、`describeThrown` 的未知码/`-3`/`801` 三类提示、
  六条状态提示两两不同、相邻码必须落 `INTERNAL`；
- `..._SESS_0100`–`1000`、`..._RUNTIME_0100`–`0700`（17 条，`InputMethodSessionDeep.test.ets`）：会话与运行时——
  六个演示结果的 summary 必须由模型字节数推出、detail 列出四个键与类型、打桩读取按 key 排序、无扩展信息报 0 项、
  压线恰为 32768、超 1 字节走 401 与“不传递”、JSON 往返的 detail 截断在 84 字符内、页序/状态/耗时；
  运行时侧验证面板控制器初始态、无面板时销毁是幂等、两个实例互不影响、`KEYBOARD_PAGE_PATH` 的形状，
  以及 `KeyboardBridge` 无客户端时 `insertText`/`deleteBackward` 返回 `false` 且不改状态文案；
- `..._APPLIMIT_0100`–`1400`（14 条，`InputMethodAppLimit.test.ets`）：常量与实现一致——每个常量都与使用它的真函数
  成对断言（32KB ↔ `paddedEntries`、200 ↔ `appendLog` 默认容量、20/30 ↔ `queryLogs`、64 ↔ `appendChar`/`applyKey`、
  160 ↔ `truncateMiddle`、2 ↔ `patternSpecs()`、`StorageKeys` 互异、`HILOG_DOMAIN`/`HILOG_TAG`），再校验键盘几何
  常量、默认键名顺序、目录路由前缀不重复，以及 `declaredApiCount() === 11`。

## 套件清单

顺序即 `testsuite()` 里 23 条调用语句的顺序，与执行顺序一致：先纯逻辑与矩阵，再设备真调用，
然后空状态 / 展示绑定，最后页面冒烟——冒烟会把界面停在各页，所以放末尾。

| 套件 | 分类 | 覆盖点 | 用例数 | 自动化 |
| --- | --- | --- | ---: | --- |
| `InputMethodExtraConfigDataTest` | 数据/边界 | 扩展信息的构造、额度、JSON 往返、打桩读取 | 9 | 是 |
| `InputMethodKeyboardDataTest` | 数据/状态机 | 键盘行列、功能键、缓冲编辑、模式切换、候选 | 5 | 是 |
| `InputMethodListAndFoundationTest` | 数据/基础设施 | 模式项、下标收敛、错误码分类、会话结果、目录 | 6 | 是 |
| `InputMethodBoundaryMatrixTest` | 边界矩阵 | UTF-8/额度/JSON形状/缓冲/代理对/下标越界 | 12 | 是 |
| `InputMethodUnicodeEdgeTest` | 码点分界 | UTF-8 三档分界码点、孤立代理的字节数/计数/删除、额度异常、单空格候选、截断切在代理对中间 | 16 | 是 |
| `InputMethodNumericEdgeTest` | 数值特殊值 | NaN/Infinity/-0/小数在格式化、截断、日志容量与过滤上的静默走偏 | 17 | 是 |
| `InputMethodConfigEdgeTest` | JSON/额度异常 | null 字面量与 null 值、重复 key、空 key、目标 ≤0/NaN/小数、描述 limit 异常与默认值 | 13 | 是 |
| `InputMethodUtilTest` | 工具层 | 结果对象、错误翻译、异步超时、格式化、日志、目录 | 12 | 是 |
| `InputMethodFrameworkDeviceTest` | 设备真调用 | syscap、枚举、实例、`createPanel` 四组合、扩展注册 | 16 | 是（真机） |
| `InputMethodExtraConfigDeviceTest` | 设备真调用 | 打桩读取、32KB 双边界、JSON 往返 | 4 | 是（真机） |
| `InputMethodValueMatrixTest` | 值/字节矩阵 | UTF-8 四分支、三种值类型、JSON 形状、32768/32769、读取排序、描述截断 | 27 | 是 |
| `InputMethodKeyboardMatrixTest` | 布局/状态机矩阵 | 两模式行宽、删除键位、码点计数、缓冲边界、删除/空格/回车/模式 | 25 | 是 |
| `InputMethodListMatrixTest` | 列表/目录矩阵 | 模式项数量与下标、回调文案、目录条目/接口数/路由、搜索过滤 | 22 | 是 |
| `InputMethodOutcomeMatrixTest` | 错误/工具矩阵 | 九个错误码、异常取码、时长分桶、截断预算、日志过滤、长稳循环 | 36 | 是 |
| `InputMethodFormatMatrixTest` | 格式化矩阵 | 补零、时间/日期边界、时长四分桶、截断奇偶预算与代理对 | 25 | 是 |
| `InputMethodLogStoreMatrixTest` | 日志矩阵 | id 自增、默认值、容量兜底与裁剪、三条件组合查询、tag 大小写 | 20 | 是 |
| `InputMethodLoggerStorageTest` | 运行时日志通道 | `Logger.record` 写入 AppStorage、按 tag 计数、200 条封顶（`beforeEach`/`afterEach` 清场） | 5 | 是 |
| `InputMethodKeyboardFlowTest` | 键盘状态机 | 连打、模式往返、删除链、emoji 整删、满缓冲、未知 action、64 打 64 删长稳 | 23 | 是 |
| `InputMethodErrorEdgeTest` | 错误取码边界 | 字段/文本取码、两位丢弃、最靠前的长串优先、空 message 兜底、六条提示互异 | 16 | 是 |
| `InputMethodSessionDeepTest` | 会话结果 | 六个演示结果的 summary/detail 文案、页序、状态与耗时 | 10 | 是 |
| `InputMethodRuntimeStateTest` | 运行时空状态 | 面板控制器初始态与幂等销毁、页面路径、键盘通道无客户端不伪造成功 | 7 | 是 |
| `InputMethodAppLimitTest` | 常量与实现 | 常量与使用它的真函数成对断言、键盘几何、默认键名、路由前缀、接口总数 | 14 | 是 |
| `InputMethodAsyncEdgeTest` | 异步等待边界 | 超时标签与重复触发、`withTimeout` 不吞业务错误、等待前后的状态一致 | 12 | 是 |
| `InputMethodThemeTest` | 视觉常量 | 20 色 / 9 间距 / 5 圆角 / 8 字号 / 4 尺寸的形状、十六进制格式、深浅可读性 | 11 | 是 |
| `InputMethodViewBindingTest` | 展示层绑定 | tone → 文字/底色、映射色必须落在 Theme 集合、`outcomeTone` 六状态、`rowOf` 只出绿红 | 10 | 是 |
| `InputMethodChainScenarioTest` | 跨模块编排 | 会话结果到页面文案、按键到缓冲再到候选的整链、错误码到提示语 | 15 | 是 |
| `InputMethodBridgeTest` | 键盘通道 | 无客户端不伪造成功、解绑幂等与日志、面板控制器空态与安全销毁、页面路径形状 | 10 | 是 |
| `InputMethodUiSmokeTest` | 页面冒烟（真机） | 首页渲染与搜索过滤/空态、三条演示页导航、扩展注册、按钮出结果、首页日志闭环 | 13 | 是（真机） |

手工验收项（未进自动化）：输入法列表弹窗的真实渲染与模式项、在设置中启用后的扩展真实上屏，
原因见 [README](README.md) 「约束与限制 · 功能边界」。三个演示页的**导航与按钮产出**已由
`InputMethodUiSmokeTest` 覆盖，冒烟摘录里仍属手工的只剩“系统弹窗里具体点了什么”这一类。

`createPanel` 与 `InputMethodListDialog` 这类“结果依赖进程身份与系统实现”的点写成双分支：成功则校验产物
（含立即销毁），失败则断言错误码属于已登记范围（`12800004`、`801`、`12800013`、`12800014`、`12800008`、`-1`、`-3`），
两边都有硬断言。

## 测试结果

实测环境：dayu200（RK3568）真机，OpenHarmony 7.1.0.22；签名走 DevEco 自动签名（debugKey，
material 在 `~/.ohos/config/`）。下表 411 条的命令行、IDE 一键运行与页面冒烟都在该设备上完成。

| 项 | 结果 |
| --- | --- |
| 构建 | `entry@default` 与 `entry@ohosTest` 均 `BUILD SUCCESSFUL`，产物为 `-signed.hap` |
| 安装 | `hdc install -r` 主包与测试包均 `install bundle successfully` |
| 扩展注册 | `bm dump` 可见 `InputMethodService`：`extensionTypeName=inputMethod`、`enabled=true`、进程 `com.example.inputmethodextension:inputMethod` |
| 命令行测试（一条命令跑全部） | 不加 `-s class`：`Tests run: 411, Failure: 0, Error: 0, Pass: 411, Ignore: 0`，`TestFinished-ResultMsg: your test finished!!!` |
| 第 2 轮（同一产物连跑，不重装） | 再次 `Tests run: 411, Failure: 0, Error: 0, Pass: 411`，无 `App died`、无 `THREAD_BLOCK_6S` |
| IDE 一键运行 | DevEco 运行配置里取消「安装选项 → 仅测试包」后点运行：`411 测试已通过`，46 秒 250 毫秒 |
| 合计 | 411 条连续两轮全绿；此前“必须拆两条命令”的结论是 `List.test.ets` 注册写法错误引发的误判，见 README「已知问题与注意点」第 3 条 |
| UI 冒烟 | 13 条 `InputMethodUiSmokeTest` 全绿：首页渲染与过滤/空态、三条导航、扩展注册、四种组合出结果、首页日志闭环 |

各演示页冒烟摘录（页面「调用结果」面板原文）：

| 页面 | 动作 | 实测结果 |
| --- | --- | --- |
| 首页 | 系统能力 | `SystemCapability.MiscServices.InputMethodFramework` 已声明；3 个演示入口、共 11 个接口 |
| 扩展信息 | 构造默认配置 | `buildExtraConfig → 成功：4 个键，125 字节` |
| | 压线 32KB | `paddedEntries → 成功：32768 字节，未越界` |
| | 越界 1 字节 | `paddedEntries → 入参无效：超出 1 字节（401）`；401 是本示例按额度在写入前的本地拦截，官方行为是超 32KB 时“超出部分不传递” |
| | JSON 往返 | `configFromJson → 成功：125 字节，内容一致` |
| | 读取空扩展信息 | `readExtraConfig → 成功：0 项（未提供扩展信息）` |
| 输入法列表 | 打开输入法列表 | 对话框弹出的是**系统输入法列表**（`kikaInput` 与本应用的「输入法扩展」），两个模式项未出现，`action` 未回调 |
| 面板与模式 | 扩展注册 | `2 个模块，已注册：InputMethodService` |
| | 四种组合调 `createPanel` | 软键盘·固定 / 状态栏·固定 / 软键盘·悬浮 / 软键盘·候选 **全部返回面板**（`意外创建成功`），随即 `destroyPanel` 均销毁成功 |
| | 键盘预览 | 依次按 q、w、e → 缓冲 `3/64`、文本 `qwe`、候选 `qwe / qwe好 / qwe的` |
| | 切换模式 | 点 `123` → 三行字符键变为 1–0 / 符号 / 符号，功能键变 `abc`，当前模式显示「数字与符号」；再点 `abc` 回到字母，按字键同步写入缓冲 |

## 已知测试限制

- **UiTest 单条用例只有 5000ms 预算**：当前 hypium 的 `it()` 只有三个入参，没有单条超时参数。本机实测
  一次 `inputText` 约 2.2s、一次 `Component.click()` 约 0.7s、一次 `waitForComponent` 命中约 0.4s，
  因此一条用例最多只放“一次输入 + 一次点击 + 一次等待”。软键盘弹着时对卡片 `click()` 会卡到超时
  （要先 `pressBack` 收键盘），`Driver.swipe()` 在本机会直接卡死。
- **签名绑定包名与设备 UDID**：调试 profile 里写死了 `bundle-name` 与 `device-ids`，换包名或换设备都要
  重新出 profile；直接复用别的工程的 `default_*.p7b` 会在安装时报签名校验失败。
- **`entry@ohosTest` 构建有一条 `'start_window_background' conflict` WARN**：`.test` 中间产物与主资源
  重复声明了同名颜色，属噪音，不影响 `BUILD SUCCESSFUL` 与用例执行。