# InputMethodExtension

演示 IME Kit 的**输入法扩展**能力，工程围绕三条真实链路组织三个演示页：

- **扩展信息**：ArkUI 编辑框拉起输入法时通过 `EditorAttribute.extraConfig` 携带 `InputMethodExtraConfig`
  （`customSettings` 只接受 number/string/boolean，总长 ≤ 32KB）。UIAbility 拿不到"被拉起"那一刻，
  因此用与 `EditorAttribute` 结构相同的打桩对象复现读取路径，额度校验（32768 / 32769）按 UTF-8 实测字节数断言。
- **输入法列表**：系统声明式组件 `InputMethodListDialog`，调用方只提供 `PatternOptions`（图标 + 回调），
  列表内容由系统按已安装输入法填充。
- **面板与模式**：`PanelType` / `PanelFlag` 枚举、`getInputMethodAbility().createPanel()` 的真实返回、
  `destroyPanel()`，以及一个不依赖系统面板的软键盘预览（同一套 `KeyboardModel` 纯函数驱动）。

工程同时注册了一个 `type: "inputMethod"` 的扩展（`InputMethodService`），实现
`InputMethodExtensionAbility` 的 `on('inputStart')` / `on('inputStop')`：前者把 `InputClient` 交给
`KeyboardBridge` 并 `createPanel → resize → setUiContent(KeyboardPage)`，后者销毁面板。
这条链路只有在本应用被启用为输入法、且真实编辑框聚焦时才会被系统拉起。

## 演示入口与覆盖接口

| 演示页 | 覆盖接口 | 演示内容 |
| --- | --- | --- |
| 扩展信息 | `InputMethodExtraConfig`、`customSettings`、`CustomValueType`、`EditorAttribute.extraConfig` | 构造 4 个键（string/number/boolean）并量出 125 字节；压线 32768 与越界 32769（401）；JSON 往返；打桩对象读回排序结果；空扩展读回 0 项 |
| 输入法列表 | `InputMethodListDialog`、`PatternOptions`、`Pattern` | 两个模式项（中文/英文）装配进对话框，记录对话框打开与 `action` 回调的真实行为 |
| 面板与模式 | `PanelType`、`PanelFlag`、`getInputMethodAbility`、`createPanel`、`destroyPanel` | 枚举对照、扩展注册检查、四种类型×状态组合逐一调 `createPanel` 并立即销毁、软键盘预览与候选 |

扩展侧（编译进包、由系统在启用后拉起）：

| 文件 | 内容 |
| --- | --- |
| `inputmethodextensionability/InputMethodService.ets` | `InputMethodExtensionAbility`：`onCreate` 注册 `inputStart`/`inputStop`，`inputStart` 建面板，`inputStop` 销毁 |
| `inputmethodextensionability/pages/KeyboardPage.ets` | 面板页：按键经 `applyKey` 改本地缓冲，有 `InputClient` 时走 `insertText` / `deleteBackward` |
| `utils/KeyboardBridge.ets` | `InputClient` 持有与上屏封装（`insertText`、`deleteBackward`） |
| `utils/PanelController.ets` | `createPanel → resize → setUiContent('inputmethodextensionability/pages/KeyboardPage')` 与 `destroyPanel` |

**未覆盖的接口**：

- `InputMethodExtensionAbility` 的**真实输入链路**：需要本应用先在「设置 → 输入法」里启用，并聚焦真实编辑框，
  系统才会拉起扩展；示例不自动改系统输入法设置。
- `inputMethodEngine` 的输入回调（`insertText`、`deleteBackward` 作用于真实编辑框）：同上，
  自动化环境拿不到真实 `InputClient` 连接，页面只做本地缓冲的键盘预览。

## 目录结构

```
InputMethodExtension
├── AppScope
├── entry/src/main
│   ├── ets
│   │   ├── common
│   │   │   ├── AppConstants.ets         32KB 额度、键名、日志 domain/tag、超时
│   │   │   └── Theme.ets                颜色、间距、圆角、字号常量
│   │   ├── model
│   │   │   ├── ExtraConfigModel.ets     ConfigEntry / customSettings 构造 / UTF-8 字节数 / 打桩 EditorAttribute
│   │   │   ├── KeyboardModel.ets        键盘行列、功能键、applyKey、码点计数与代理对删除、候选（纯函数）
│   │   │   ├── CallOutcome.ets          调用结果三态与 401/501/801/12800004/12800013 分类
│   │   │   ├── FeatureCatalog.ets       首页目录、搜索过滤、未覆盖接口清单
│   │   │   └── LogStore.ets             日志条目、容量裁剪、过滤、计数（纯函数）
│   │   ├── utils
│   │   │   ├── ExtraConfigSession.ets   默认键值、压线、越界、JSON 往返的本地会话
│   │   │   ├── InputMethodListSession.ets  模式项规格、下标收敛、越界判定、回调文案
│   │   │   ├── PanelProbe.ets           createPanel 负向/实测封装（含超时与立即销毁）
│   │   │   ├── PanelController.ets      扩展进程内的面板生命周期
│   │   │   ├── KeyboardBridge.ets       InputClient 持有与上屏
│   │   │   ├── AsyncUtil.ets            带超时的 Promise 竞速
│   │   │   ├── ErrorUtil.ets            错误码分类提示、异常对象取码
│   │   │   ├── FormatUtil.ets           时长/文本格式化
│   │   │   └── Logger.ets               hilog 封装 + AppStorage 共享日志
│   │   ├── components                   三个演示页、KeyboardPanel、ResultList、LogPanel、CommonWidgets
│   │   ├── pages/Index.ets              Navigation 外壳与首页
│   │   ├── pages/demos                  ExtraConfigDemo / InputMethodListDemo / PanelDemo
│   │   ├── inputmethodextensionability  InputMethodService + pages/KeyboardPage
│   │   ├── entryability                 EntryAbility
│   │   └── entrybackupability           EntryBackupAbility
│   └── resources/base/profile/main_pages.json   含 inputmethodextensionability/pages/KeyboardPage
├── entry/src/ohosTest/ets/test          23 个测试文件（28 个 describe 套件 / 411 条用例）+ List.test.ets 注册表
└── README.md
```

## 构建与运行

```powershell
$env:DEVECO_SDK_HOME = "D:\devecoStudio-7.0\DevEco Studio\sdk"
cd D:\appSamples1028\InputMethodExtension

# 主包
& "D:\devecoStudio-7.0\DevEco Studio\tools\hvigor\bin\hvigorw.bat" --mode module `
  -p module=entry@default -p product=default assembleHap --no-daemon

# 测试包
& "D:\devecoStudio-7.0\DevEco Studio\tools\hvigor\bin\hvigorw.bat" --mode module `
  -p module=entry@ohosTest -p product=default assembleHap --no-daemon
```

- 判定构建成功看输出里的 `BUILD SUCCESSFUL`，不看 exit code（签名 WARN 走 stderr）。
- 签名已配好：`build-profile.json5` 的 `signingConfigs` 有一条 `name: "default"`（DevEco Studio
  `File → Project Structure → Signing Configs → Automatically generate signature` 生成，bundleName
  `com.example.inputmethodextension`，material 在 `~/.ohos/config/`），并且 `products[0].signingConfig`
  已指向它，所以 `assembleHap` 会直接产出 `entry-default-signed.hap` / `entry-ohosTest-signed.hap`。
- 两个容易踩的点：
  1. **IDE 只写 `signingConfigs`，不会自动加到 `products[0]`**。缺 `"signingConfig": "default"` 时
     hvigor 照常 `BUILD SUCCESSFUL`、只打一条 `WARN: No signingConfig found for product default`，
     产物仍是 `-unsigned.hap`（`SignHap` 任务 43 ms 跳过），很容易误以为已经签了。
  2. **换签名后不能直接 `install -r`**：设备上旧包是另一套证书（例如先前用 SDK 自带
     `OpenHarmony.p12` 本地签的），会报 `9568332 install sign info inconsistent`，需先
     `hdc uninstall com.example.inputmethodextension` 再装。
- 备选（不需要登录，本次调试阶段用过）：用 SDK 自带 `sdk/default/openharmony/toolchains/lib/` 下的
  `OpenHarmony.p12`（口令 `123456`）、`OpenHarmonyProfileDebug.pem`、`UnsgnedDebugProfileTemplate.json`
  与 `hap-sign-tool.jar`，改模板的 `bundle-name` / `device-ids`（`hdc shell bm get -u`）/ `validity` 后
  `sign-profile` 出 p7b，再用 `development-certificate` 与 p12 里的 `openharmony application ca`、
  `... root ca` 拼证书链 `sign-app` 出包。

真机命令（单设备）：

```powershell
D:\hdc.exe install -r "entry\build\default\outputs\default\entry-default-signed.hap"
D:\hdc.exe install -r "entry\build\default\outputs\ohosTest\entry-ohosTest-signed.hap"

# 全部用例：一条命令跑完 411 条（连跑两轮均 411/411，见「实测记录」）
# -s unittest 传运行器在包内的路径。本工程目录名是小写 testrunner，所以是
# /ets/testrunner/OpenHarmonyTestRunner；传类名 OpenHarmonyTestRunner 也能拉起，两种写法都实测过
# 不加 -s class 就是跑 testsuite() 里登记的全部套件
D:\hdc.exe shell aa test -b com.example.inputmethodextension -m entry_test `
  -s unittest /ets/testrunner/OpenHarmonyTestRunner -w 900000

# 只想跑 UI 冒烟（或某个套件）时，用 -s class 过滤，套件名可用逗号分隔
D:\hdc.exe shell aa test -b com.example.inputmethodextension -m entry_test `
  -s unittest /ets/testrunner/OpenHarmonyTestRunner -s class InputMethodUiSmokeTest -w 400000

# 启动 UI
D:\hdc.exe shell aa start -a EntryAbility -b com.example.inputmethodextension

# 日志（domain 0x0C23，tag InputMethodExt）
D:\hdc.exe shell hilog -x -T InputMethodExt
```

权限：本示例不申请任何权限。系统能力依赖 `SystemCapability.MiscServices.InputMethodFramework`。

## 测试用例

`entry/src/ohosTest` 共 411 条用例（23 个测试文件 / 28 个 `describe` 套件），编号前缀 `SUB_INPUT_METHOD_`。
按“真实代码路径 + 维度矩阵 + 设备真调用 + 空状态”分层；`List.test.ets` 的 `testsuite()` 里按顺序
逐个直接调用各文件的注册函数。这里**必须写成 `xxxTest();` 这种直接调用语句**——DevEco 运行测试前会
静态扫描该文件，表驱动写法（数组 + `forEach`）会被判成“未注册任何函数”，报 00502002 / 00502004。

用例名统一 `test<Area><NNNN>`：`Area` 由文件名派生（`InputMethodValueMatrix.test.ets` → `testValueMatrix0001`），
`NNNN` 在套件内递增，`@tc.name` 与 `it()` 名称逐字一致。每条用例带六项元数据：

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

本轮整改只动 `entry/src/ohosTest/**`，`entry/src/main/**` 没有逻辑改动（上一轮为全部 `.ets` 补 Apache License
头，属注释变更，未变行为）。

全部用例都 `import` `main/ets` 的正式函数，每个维度取“下界/界内/上界/越界”各成一条，一条只测一个点：

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
| JSON / 额度异常 | `null` 字面量、重复 key、null 值、空 key、目标 ≤0 / NaN / 小数 | `configFromJson`、`paddedEntries`、`describeEntries` |

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
  三位码/末尾码/首个长串优先/数字粘连字母/四位与八位整取、两位数字被丢弃、裸对象与空 message 兜底为
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

全部用例均 `import` `main/ets` 下的正式模型与工具（不在测试里重写业务规则），`catch` 分支内必有断言；
会写共享状态的套件用 `beforeEach`/`afterEach` 清场。断言口径是“硬断言”：不写 `typeof x === 'function'`、
不只判非空、不复述 arrange；拿不到具体值时至少断言业务上的不变量（如“分类结果必须与错误码一一对应”）。

审计脚本（命名 / 编号 / 元数据问题必须清零）：

```powershell
node D:\appSamples1028\ohos-testcase-supplement\scripts\audit_cases.js entry\src\ohosTest\ets\test
```

当前输出：

```text
total=411
duplicate names=[]
duplicate @tc.number=[]
metadata issues=[]
```

`cases under 3 static expects` 只是提示项，本工程剩 4 条（`testDevice0006`–`0009`）：四条 `createPanel` 用例
共用 `assertPanelOutcome()` 入口，失败分支跑 5 个断言、成功分支跑 3 个，只是不落在用例体里，
静态扫描按 `expect(` 出现次数统计才误报，这 4 条已人工确认。

套件清单（顺序即 `testsuite()` 里 23 条调用语句的顺序，与执行顺序一致：
先纯逻辑与矩阵，再设备真调用，然后空状态 / 展示绑定，最后页面冒烟——冒烟会把界面停在各页，所以放末尾）：

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
| `InputMethodErrorEdgeTest` | 错误取码边界 | 字段/文本取码、两位丢弃、首个长串优先、空 message 兜底、六条提示互异 | 16 | 是 |
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
原因见下方「已知限制」第 4–5 条。三个演示页的**导航与按钮产出**已由 `InputMethodUiSmokeTest` 覆盖，
下表冒烟摘录里仍属手工的只剩“系统弹窗里具体点了什么”这一类。

`createPanel` 与 `InputMethodListDialog` 这类"结果依赖进程身份与系统实现"的点写成双分支：成功则校验产物
（含立即销毁），失败则断言错误码属于已登记范围（`12800004`、`801`、`12800013`、`12800014`、`12800008`、`-1`、`-3`），
两边都有硬断言。

## 实测记录

实测环境：dayu200（RK3568）真机，OpenHarmony 7.1.0.22；签名走 DevEco 自动签名（debugKey，
material 在 `~/.ohos/config/`）。下方 411 条命令行、IDE 一键运行与页面冒烟都在该设备上完成；

| 项 | 结果 |
| --- | --- |
| 构建 | `entry@default` 与 `entry@ohosTest` 均 `BUILD SUCCESSFUL`，产物为 `-signed.hap` |
| 安装 | `hdc install -r` / `bm install` 主包与测试包均 `install bundle successfully` |
| 扩展注册 | `bm dump` 可见 `InputMethodService`：`extensionTypeName=inputMethod`、`enabled=true`、进程 `com.example.inputmethodextension:inputMethod` |
| aa test（一条命令跑全部） | 不加 `-s class`：`Tests run: 411, Failure: 0, Error: 0, Pass: 411, Ignore: 0`，`TestFinished-ResultMsg: your test finished!!!` |
| 第 2 轮（同一产物连跑，不重装） | 再次 `Tests run: 411, Failure: 0, Error: 0, Pass: 411`，无 `App died`、无 `THREAD_BLOCK_6S` |
| IDE 一键运行 | DevEco 运行配置里取消「安装选项 → 仅测试包」后点运行：`411 测试已通过`，46 秒 250 毫秒 |
| 合计 | 411 条连续两轮全绿；此前“必须拆两条命令”的结论是 `List.test.ets` 注册写法错误引发的误判，见「已知限制」第 12 条 |
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

## 已知限制与注意点

1. **本机 `createPanel` 未校验调用身份（实测）**：文档写的是"只能在 `InputMethodExtensionAbility` 内调用，
   否则抛 12800004"，但在 OpenHarmony 7.1.0.22 上，UIAbility 进程里四种组合都能创建成功。
   页面与用例按双分支写：成功则立即 `destroyPanel` 并如实显示「意外创建成功（销毁成功）」，
   失败则显示 12800004 与处理建议。换设备/版本时以实测为准，不把文档结论写成断言。

2. **`PanelFlag` 有两套声明，不可混用**：`@kit.IMEKit` 导出的来自 `@ohos.inputMethod.Panel`，
   成员是 `FLAG_FIXED` / `FLAG_FLOATING` / `FLAG_CANDIDATE`；`inputMethodEngine` 命名空间内是
   `FLG_FIXED` / `FLG_FLOATING` / `FLAG_CANDIDATE`。数值相同但类型不同，`createPanel` 必须传后者，
   传前者在编译期就报 `Property 'FLAG_FIXED' does not exist`。

3. **`hapModulesInfo` 需要叠加 `GET_BUNDLE_INFO_WITH_HAP_MODULE`（实测）**：只给
   `GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY` 时 `hapModulesInfo` 为空数组，扩展列表永远查不到。

   `BundleInfo` 本身没有 extension 字段，必须
   `info.hapModulesInfo → module.extensionAbilitiesInfo`，且字段名是 `extensionAbilityType`（不是 `type`）。

4. **`InputMethodListDialog` 弹的是系统输入法列表，不是 `patternOptions`**：本机实测弹出
   `kikaInput` 与本应用的条目，两个模式项没有出现，`action` 回调也未触发。入口文档的限制是
   “本组件仅系统应用和输入法应用可调用，`patternOptions` 参数仅系统预置输入法支持”
   （d.ts 里同义写作 “The caller must be the current inputmethod”），本应用两者都不满足，
   所以只见列表、不见模式项。

5. **扩展的真实输入链路需要手动启用**：`InputMethodService` / `KeyboardPage` 已编译进包并登记在
   `main_pages.json`，但只有本应用在「设置 → 输入法」里启用、并聚焦真实编辑框时，系统才会拉起扩展。
   自动化环境无法保证这一点。

6. **签名绑定包名与设备 UDID**：调试 profile 里写死了 `bundle-name` 与 `device-ids`，换包名或换设备
   都要重新出 profile；直接复用其他工程的 `default_*.p7b` 会在安装时报签名校验失败。

7. **`entry@ohosTest` 构建有一条 `'start_window_background' conflict` WARN**：`.test` 中间产物与主资源
   重复声明了同名颜色，属噪音，不影响 `BUILD SUCCESSFUL` 与用例执行。

8. **错误提示语与状态名是两套文案**：`apiStatusName()` 给出状态名（如「输入法身份不符」），
   `apiStatusHint()` 给出处理建议（如「调用身份不符：createPanel 等接口只能在 … 内调用」），
   页面拼出的是后者，用例断言的也是后者。

9. **键盘缓冲与删除按 Unicode 码点计**：`charCount` / `appendChar` 都走码点计数，`deleteLast` 遇到代理对
   会一次删掉两个 code unit，不会留下半个 emoji（早期版本按 `length` 切，已修正并有 `..._BOUND_1000` 守住）。
   `clampSelected` 会把非法 `defaultSelected` 拉回第 0 项以保弹窗有选中态，而官方文档说“超出范围时不选中任何项”，
   两者语义不同，属本示例的演示取舍；`actionText` 收到越界下标时报“超出范围（共 N 项）”，不冒用第一项。

10. **`ForEach` 的 key 必须带上行内容，不能只用下标**：键盘三行在两种模式下下标都是 0/1/2，早期用
    `row-${index}` 做 key，切到「数字与符号」后 ForEach 认为子组件没变、直接复用旧行，结果模式文案与功能键
    （`123` → `abc`）都更新了、三行字符键却还是字母。现改为按行内 `label` 拼 key，并由
    `..._DATA_1000` 锁住 `buildRows(NUMBER)` 的内容；同类 `ForEach` 在后续扩展时不要退回下标打底。

11. **UiTest 单条用例只有 5000ms 预算（实测）**：当前 hypium 的 `it()` 只有三个入参，没有单条超时参数。
    本机实测一次 `inputText` 约 2.2s、一次 `Component.click()` 约 0.7s、一次 `waitForComponent` 命中约 0.4s、
    从演示页按返回键回首页约 1.1s，因此一条用例最多只放“一次输入 + 一次点击 + 一次等待”，多放就超时。
    另有三条坑写进了 `InputMethodUiSmoke.test.ets` 的注释：软键盘弹着时对卡片 `click()` 会卡到超时
    （要先 `pressBack` 收键盘）、`Driver.swipe()` 在本机会直接卡死（所以第二/三张卡用搜索框过滤到首位再点）、
    演示页返回后 1s 内找不到首页的 `TextInput`（负向搜索用例因此紧跟另一条输入用例，而不是放末尾）。

12. **`List.test.ets` 必须用直接调用语句注册套件（实测）**：DevEco 运行测试前会静态扫描该文件，只认
    `xxxTest();` 这种直接调用；改成 `SUITE_MANIFEST` 数组 + `forEach` 的表驱动写法后，IDE 里整包跑报
    00502002「在包中未找到任何测试用例」、单文件跑报 00502004「当前文件未在 list 文件中注册任何函数」，
    而同一份产物用命令行 `aa test` 仍然能跑——这正是“命令行能过、IDE 点不过”的根因。现为 23 条直接调用。
    另外历史上记录过 `Driver.create()` 等 uitest 守护进程、同进程串跑时 7.08s 阻塞叠加 `THREAD_BLOCK_6S`
    与 `App died` 的现场，当时据此拆成 `-s class` / `-s notClass` 两条命令；修好注册写法后一条命令连跑两轮
    411/411 均无阻塞或崩溃，拆命令只作为排查手段保留。

13. **IDE 里运行测试不要勾「安装选项 → 仅测试包」**：勾上后 IDE 会先 `hdc uninstall` 主包、部署时只下
    测试包，结果 4 条设备真调用用例与 13 条 UI 冒烟全部因 `startAbility failed`（主包不存在）失败，
    其余 394 条正常。取消勾选后 IDE 同时下发主包与测试包，411 条全绿。

## 参考资料

本示例的两个主体接口以开发者官网在线文档为准，并与本地 SDK 声明逐条对照：

- `@ohos.inputMethod.ExtraConfig`（输入法扩展信息）：
  https://developer.huawei.com/consumer/cn/doc/doccenter-references/api/js-apis-inputmethod-extraconfig
- `@ohos.inputMethodList`（输入法切换列表控件）：
  https://developer.huawei.com/consumer/cn/doc/doccenter-references/api/js-apis-inputmethodlist

配套声明的本地路径（`%DEVECO_SDK_HOME%/default/openharmony/ets/api/`）：
`@ohos.inputMethod.ExtraConfig.d.ts`、`@ohos.inputMethodList.d.ets`、`@ohos.inputMethodEngine.d.ts`、
`@ohos.inputMethod.Panel.d.ts`、`@ohos.InputMethodExtensionAbility.d.ts`、`@ohos.inputMethod.d.ts`。

从在线文档核对出来的三条要点，已落到代码注释、页面文案与用例断言里：

| 要点 | 文档原文 | 本示例的处理 |
| --- | --- | --- |
| 值类型 | `CustomValueType = number \| string \| boolean` | `ExtraConfigModel` 只用这三种类型，其他类型在构造阶段就拒绝 |
| 容量 | “信息总长度不超过 32KB”，超时“超出部分不被传递” | 按 JSON 序列化后的 UTF-8 字节计；`32769` 用例报 401 是**本地**写入前拦截，不等于系统会报错 |
| 调用方限制 | inputMethodList “仅系统应用和输入法应用可调用，`patternOptions` 仅系统预置输入法支持” | 页面如实记录：本应用不满足条件，只弹列表、不渲染模式项 |

版本对照：示例 `compatibleSdkVersion` / `targetSdkVersion` 均为 `26.0.0`；
`InputMethodExtraConfig` 自 API 22 引入，`InputMethodListDialog` 自 API 11 引入（phone 12+），
两者在本示例的 SDK 里均已可用。
