# 应用上下文测试说明

> 本说明面向 `ApplicationContextDemo`（OpenHarmony 示例工程，包名 `com.samples.applicationcontext`），用于说明 ohosTest 自动化测试的设计思路、覆盖维度与充分性依据。沿用前文已确认的 `HandletabsSample/ohosTest.md` 模板结构，与 `AgentExtensionAbility/ohosTest.md` 保持一致；运行方式见附录 C。

## 1. 文档目标

本文档说明应用上下文测试的对象、共享探针、参数矩阵、运行方式和实测边界，用于测试评审、版本回归和后续扩展。统计以当前测试代码和注册入口为准；构建、抽样及修复后复测分别记录，不将局部通过写为全量通过。

测试围绕真实 ApplicationContext、应用沙箱文件、模块资源、EventHub、EL1/EL2 目录及已注册的 `EntryAbility` 首页展开。源码中未注册的示例页面和 Ability，不作为已验证的设备集成能力。

## 2. 测试设计原则

### 2.1 分层设计

测试采用 Hypium + UiTest，入口为 `entry/src/ohosTest/ets/test/List.test.ets`，运行器为 `OpenHarmonyTestRunner`，承载模块为 `entry_test`，测试 Ability 为 `TestAbility`。

- 共享驱动层：`Shared/SharedDriver.ets` 提供 Driver 单例、Promise 串行队列、文本等待、组件查询和通用上下文工具。
- 设备探针层：`Shared/ContextProbe.ets` 直接访问真实 ApplicationContext、文件 API、EventHub、模块资源和 Index 页面，返回可断言的观测结果。
- 就绪等待层：`Shared/EntryReadiness.ets` 不依赖 UiTest，以默认 10 秒 deadline 查询目标包、Ability 名称和 `FOREGROUND` 状态；轮询每次异步让出 50 毫秒。
- 基础契约层：`Ability.test.ets` 的 4 条用例验证真实首页、点击状态、应用身份、版本和沙箱目录。
- 场景矩阵层：其余 78 个套件、1,946 条用例组合文件、资源、区域、事件、页面及生命周期操作。

测试未用 Mock 替代 Context API，也不以测试自建业务模型代替实际设备行为。设备接口失败会向上传递，由 Hypium 判定结果。

### 2.2 高复用设计

- 统一注册：`testsuite()` 顺序注册全部 79 个套件，便于核对遗漏和套件过滤条件。
- 统一获取上下文：`requireContext()` 从 Delegator 获取真实应用上下文，缺失时明确失败。
- 统一文件探针：`probeFile` 负责创建、追加、截断、读取、字节数、文件大小和删除观测，`finally` 关闭句柄并清理残留文件。
- 统一事件探针：`probeEvents` 记录顺序、无关事件和注销后回调数，最终注销所有测试监听。
- 统一页面探针：`probeIndex` 等待前台和内容就绪，再进行点击、方向键与可选前后台切换。
- 统一区域恢复：`switchArea` 在 `finally` 恢复原始 area，避免后续用例进入错误目录。
- UI 排队：所有直接 UiTest 操作进入 `runSerializedUiOperation`，生命周期等待放在队列外，避免阻塞恢复所需的操作。
- 日志和断言：使用 `@ohos.hilog` 英文日志；值用 `assertEqual`，布尔状态用 `assertTrue/assertFalse`。

### 2.3 矩阵化设计

`MATRIX_COVERAGE.json` 记录按实际行为组合去重后的矩阵。不同目录可复用同一功能族，因此功能族统计与目录统计属于两种视角，不能相加。

| 功能族 | 用例数 | 组合维度 |
| --- | --- | --- |
| file | 774 | files/cache、创建/追加/截断、UTF-8 输入、重复次数及清理结果 |
| resource | 235 | 应用与 entry 模块资源、版本信息、资源文本文件往返 |
| configuration | 120 | EL1/EL2 目录观测、原区域恢复及恢复后的文件操作 |
| lifecycle | 409 | 点击、真实后台/前台切换、页面状态及上下文恢复 |
| ui | 276 | 点击次数、四方向键序列、文本与组件数量 |
| event | 132 | 事件数量、载荷、顺序、无关事件和注销后发送次数 |
| **矩阵合计** | **1,946** | 加 4 条基础用例，共 1,950 条 |

输入覆盖空串、ASCII、多字节字符、emoji、空白、换行及不同重复次数。UTF-8 字节数通过 `buffer.from(content).length` 校验，不将字符数直接等同于文件字节数。矩阵为已选择组合，不声称覆盖完整笛卡尔积。

## 3. 测试对象拆解

### 3.1 主流程

- 真实首页：`entry/src/main/ets/pages/Index.ets` 展示 `HelloWorld` 文本组件，初始 `Hello World`，点击变为 `Welcome`。
- 页面注册：`main_pages.json` 仅注册 `pages/Index`；测试只围绕该真实页面操作。
- 模块声明：`entry/src/main/module.json5` 注册主 `EntryAbility` 和非导出的备份扩展 `EntryBackupAbility`，不据此宣称备份流程已通过测试。
- 应用上下文：从 Delegator 上下文获取 ApplicationContext，校验包名、`filesDir`、`cacheDir` 及操作前后的一致性。
- 文件 API：使用 `@kit.CoreFileKit` 的 `fileIo` 执行真实读写、stat、访问检查、关闭和删除。
- 模块和资源：通过 `application.createModuleContext(context, 'entry')` 获取模块上下文，对照应用资源读取结果。
- 版本信息：通过 `bundleManager.getBundleInfoForSelfSync` 获取 BundleInfo，校验版本 `1.0.0` 与版本码 `1000000`。
- 事件机制：使用真实 `context.eventHub.on/emit/off`，验证载荷顺序、事件名称隔离及注销效果。
- 测试启动：运行器注册监视器并启动 `TestAbility`；测试窗口加载成功后拉起 `EntryAbility`，等待真实前台状态，再仅执行一次 Hypium；失败以 `finishTest(..., -1)` 结束。

### 3.2 关键风险点

- 设备灭屏或锁屏引起 `00508013`，测试尚未开始即超时。
- 主 Ability 尚未到达前台或首页尚未渲染，组件查找过早失败。
- 仅调用生命周期回调而没有真实前后台切换，产生错误的集成通过结论。
- 切后台后未恢复目标 Ability，导致后续用例操作桌面或其他窗口。
- 文件句柄、残留文件或事件监听未清理，使下一条用例被污染。
- 追加、截断及多字节文件内容的字节数、尺寸和文本不一致。
- 修改上下文区域后未恢复原区域，导致沙箱路径变化。
- 页面已显示 `Welcome`，后续读取却错误地要求首次启动文案。
- 将旧套件名称中的网络、动画、内存或无障碍字样直接作为专项覆盖证据。

## 4. 覆盖维度设计

### 4.1 功能正确性

- 应用身份：Delegator 目标包与 ApplicationInfo 名称均为 `com.samples.applicationcontext`。
- 目录契约：files/cache 路径后缀符合预期且彼此不同，操作后上下文目录不变。
- 文件闭环：写入、读取、尺寸和 UTF-8 字节数精确一致，删除后不存在。
- 追加与截断：追加保留 `prefix:`，截断移除旧内容，避免仅验证最后一段数据。
- 事件闭环：逐条核对收到的载荷顺序，无关事件不触发，注销后不再接收。
- 模块资源：应用与模块读取同名资源一致，文件往返后资源仍可读取。
- 区域恢复：EL1/EL2 的目录标识正确，退出探针后原 area 和路径恢复。
- 页面交互：组件数量为 1，点击后显示 `Welcome`，前台应用身份正确。

### 4.2 异常流与恢复

文件访问检查只将明确的“不存在”错误码 `13900002` 视为不存在，其他访问错误向上传递。文件、事件和区域探针通过 `finally` 清理，避免用异常吞错掩盖测试失败。

首页探针缺少组件、内容未就绪或生命周期等待超时时明确失败。启动初始化异常不会继续假装执行成功，而是报告测试失败。

真实切后台后，恢复流程在 `finally` 中重新拉起目标 `EntryAbility`，等待前台和页面文本恢复，再重新获取组件。现有测试不声称覆盖进程被杀、跨重启持久化、系统备份恢复或权限撤销等专项异常。

### 4.3 并发与长稳

矩阵覆盖连续文件操作、事件序列、重复页面输入和前后台恢复。共享 UI 队列串行执行设备操作，避免组件竞争；轮询通过 `setTimeout` 让出事件循环。

当前主要按 Hypium 注册顺序执行。`ApplicationContextConcurrency`、`ConcurrencyControl` 等名称不能直接解释为多线程竞争验证；`LongTermStability` 也不是小时级长稳认证。真实并行写入、跨进程访问和长期资源趋势仍需专项设计。

### 4.4 性能与兼容性

性能目录当前执行真实文件操作并检查结果；用例中的 `Date.now() >= started` 仅验证时间先后关系，未设置性能上限，也未构成延迟分位数或吞吐率基线。不得据此宣称功耗、内存泄漏、动画帧率达标。

工程编译、目标和兼容 SDK 当前均为 OpenHarmony API 20，SDK 根目录为 `F:/OpenHarmony/sdk2`。区域矩阵只使用 EL1/EL2，不扩展到依赖设备加密和认证条件的 EL3/EL4/EL5。

离线资源用例验证本地文件和资源，不切换网络。设备型号、语言、主题和字体缩放的组合尚无完整实机报告。

### 4.5 安全与契约

- 沙箱隔离：校验应用自身 files/cache 目录、文件内容及操作后的清理，不代表已验证跨应用访问控制。
- 事件隔离：不同事件名互不触发，注销后回调数量为零。
- 区域契约：检查 EL1/EL2 目录并恢复上下文，不涉及凭据认证与高等级加密策略。
- 身份和版本：使用真实 ApplicationInfo 和 BundleInfo，避免从错误的对象读取版本字段。
- 配置规范：`.json5` 保留首部版权注释；资源 `.json` 使用严格 JSON，避免注释导致资源编译失败。
- 日志规范：使用标准 hilog 输出英文内容，现有用例不等同于完整隐私日志审计。

### 4.6 可达性与易用性

页面矩阵覆盖实际文本组件、点击和四方向键输入，读取允许已有的 `Hello World` 或 `Welcome` 状态；有点击的用例要求最终为 `Welcome`。生命周期用例还会使用 Home 进入真实后台，这与方向键输入矩阵是不同操作。

读屏语义、焦点顺序、手势识别算法、触摸目标尺寸、主题与缩放没有独立专项结论。旧文件名不作为这些能力已验证的证据。

## 5. 充分性说明

### 5.1 为什么认为当前测试具备较强充分性

- 测试关联真实设备：Context、文件、EventHub、资源和页面均调用实际接口。
- 断言细化：除接口完成外，还核对文本、字节数、尺寸、顺序、组件数量、应用身份及清理状态。
- 组合具有差异：矩阵依据真实载荷、目录、模式、事件数量或页面序列去重，不依赖仅改编号增加覆盖。
- 恢复可观察：文件和监听清理、area 恢复、真实后台状态及前台页面恢复都有对应检查。
- 启动有门槛：窗口加载、Ability 前台和页面渲染分别等待，初始化错误明确失败。
- 验证边界清楚：静态注册 1,950 条；已验证抽样及修复后复测见附录 D，尚无修复后的全量通过证据。

上述充分性针对当前接口矩阵，不等同于代码覆盖率、完整异常覆盖或全部设备兼容。后续应先完成修复后全量回归，再建立专项性能和多设备基线。

## 6. 当前测试目录与职责

统计日期为 2026-11-19。`entry/src/ohosTest/ets/test/` 共 **83 个 ArkTS 文件**：79 个用例文件、1 个入口、3 个共享文件，共 **54,165 行**。整个 `entry/src/ohosTest/` 加上运行器、测试 Ability 和测试页面，共 **86 个 ArkTS 文件、54,389 行**。物理行数包含注释及空行，共 **79 个套件、1,950 条用例**。

| 分组 | 套件数 | 用例数 | 代表套件与职责 |
| --- | --- | --- | --- |
| 基础入口 | 1 | 4 | `ApplicationContextEntryAbility`：首页、身份和版本 |
| ApplicationContext | 16 | 439 | `ApplicationContextBasic`、`ContextConfigurationModel`、`ApplicationContextLifecycle`：文件、区域和前后台 |
| ContextValidation | 8 | 314 | `ContextEventHubValidation`、`ApplicationInfoVersion`：事件、资源和版本；`ContextToastNotification` 当前主要验证文件操作 |
| Integration | 9 | 163 | `IntegrationTesting`、`SystemIntegration`：页面恢复；`NetworkConnectivity` 当前验证本地文件 |
| Interaction | 14 | 267 | `UIComponentRendering`、`EventHandling`：页面输入和真实事件；部分套件验证区域切换 |
| LifecycleState | 10 | 248 | `PageLifecycle`、`ContextSessionManagement`：前后台与状态；其他套件补充文件及资源 |
| PerformanceStability | 7 | 204 | `ContextAccessPerformance`、`ConcurrencyControl`：真实文件结果和清理，不代表性能专项通过 |
| Security | 3 | 77 | `ContextSecurity`、`SecurityValidation`：应用沙箱文件操作和一致性 |
| Validation | 11 | 234 | `CommonEventValidation`、`ResourceManagerValidation`：事件、资源、文件及页面矩阵 |
| **合计** | **79** | **1,950** | 套件职责以当前实现为准 |

各目录文件数与行数明细：

| 目录或文件 | 文件数 | 行数 | 用例数 |
| --- | --- | --- | --- |
| `Ability.test.ets` | 1 | 50 | 4 |
| `ApplicationContext/` | 16 | 11,949 | 439 |
| `ContextValidation/` | 8 | 8,331 | 314 |
| `Integration/` | 9 | 4,529 | 163 |
| `Interaction/` | 14 | 7,109 | 267 |
| `LifecycleState/` | 10 | 6,845 | 248 |
| `PerformanceStability/` | 7 | 5,521 | 204 |
| `Security/` | 3 | 2,095 | 77 |
| `Validation/` | 11 | 6,281 | 234 |
| `Shared/` | 3 | 1,279 | 0 |
| `List.test.ets` | 1 | 176 | 0 |
| **合计** | **83** | **54,165** | **1,950** |

## 7. 结论

当前测试围绕真实应用上下文形成文件、资源、区域、事件、页面与生命周期矩阵，具备可复用探针和明确清理策略。最近修复后的启动与生命周期复测通过；完整 1,950 条的最终结果仍需另行执行并记录。

## 附录 A：测试框架与模式

- 框架：工程声明 `@ohos/hypium` `1.0.24`，使用 `describe` / `it` / `expect`；另声明 `@ohos/hamock`，现有 Context 探针不依靠 Mock 替换系统 API。
- 用例形式：`it(name, 0, async (): Promise<void> => { ... })`，基础身份用例可同步执行，不混用完成回调。
- 元数据：生成矩阵包含 `@tc.number`、`@tc.name`、英文 `@tc.desc`、`@tc.size`、`@tc.type`、`@tc.level`，基础入口 4 条采用直接命名。
- 套件钩子：`beforeAll` 核对目标应用身份，`afterAll` 记录英文完成日志；操作级资源由探针 `finally` 清理。
- UI 驱动：`@ohos.UiTest` 的 `Driver/ON`，经共享 Promise 队列调用；`Driver.create` 返回空值时明确失败。
- 就绪等待：先检查目标 Ability 的真实前台状态，再等待 `HelloWorld` 内容；超时失败，不跳过用例。
- 断言：值用 `expect(actual).assertEqual(expected)`，布尔用 `assertTrue/assertFalse`；不捕获断言错误后继续通过。
- 日志：使用 `@ohos.hilog`，内容为英文。

## 附录 B：手工用例归档

以下沿用模板字段。通过状态以附录 D 的具体记录为准，抽样通过不代表同类全部组合已通过。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| --- | --- | --- | --- | --- | --- |
| 拉起应用 | 已解锁且安装两个 HAP | 运行入口套件 | 真实首页可见，包名和版本正确 | 是 | 2026-11-19：4/4 Pass |
| 首页点击 | `HelloWorld` 可见 | 点击文本 | 显示 `Welcome`，组件数量为 1 | 是 | 包含于入口 4/4 Pass |
| 文件往返 | 上下文可用 | 创建、追加、截断及读取 | 内容、UTF-8 字节数和尺寸一致，删除成功 | 是 | 2026-11-18 抽样通过，非全量 |
| 模块资源 | entry 模块可用 | 读取应用与模块资源 | 文本一致，版本正确 | 是 | 2026-11-18 抽样通过，非全量 |
| EventHub | 上下文可用 | 订阅、发送、注销、再次发送 | 顺序一致，无关事件及注销后接收为零 | 是 | 2026-11-18 抽样通过，非全量 |
| 真实前后台恢复 | 首页在前台 | Home 后恢复 EntryAbility | 观测到后台，恢复前台及页面状态 | 是 | 2026-11-19：生命周期 31/31 Pass |
| EL1/EL2 目录 | 设备支持对应区域 | 切换、读取路径、恢复 | 目录标识正确，原区域和路径恢复 | 是 | 已编译，待完整设备回归 |
| 全量回归 | 同一设备串行运行 | 全部 79 个套件 | 1,950 条全部完成，失败、错误和忽略为零 | 是 | 修复后全量结果待补充 |

## 附录 C：运行方式

> **前置条件（必做）**：设备必须已唤醒并解锁。2026-11-19 的启动排查确认设备处于 `INACTIVE` 灭屏状态，唤醒后同一运行器路径的入口 4 条通过。`00508013 App launch timed out. Make sure the screen is unlocked.` 发生于启动阶段，增大单用例超时不能替代解锁。

```bash
hdc shell power-shell wakeup
hdc shell "uinput -T -m 360 1000 360 200 400"
hdc shell power-shell timeout -o 86400000
```

滑动坐标为模板示例，需按屏幕调整；密码锁需人工解锁。测试后按设备原设置恢复息屏超时。

使用指定的 `C:\Users\23924\Desktop\devecostudio64.exe - 快捷方式.lnk` 打开工程，确认使用本工程的 OpenHarmony API 20 SDK。以下沿用模板的 Bash 换行写法，在工程根目录运行；PowerShell 中将跨行命令合并为一行，使用环境中可用的 Hvigor 启动器。

```bash
# 1. 构建 ohosTest HAP
hvigorw --mode module -p module=entry@ohosTest -p isOhosTest=true \
  -p product=default -p buildMode=test assembleHap \
  --analyze=normal --parallel --incremental --no-daemon

# 2. 构建主应用 HAP
hvigorw --mode module -p module=entry@default -p product=default \
  assembleHap --analyze=normal --parallel --incremental --no-daemon

# 3. 安装两个 HAP
hdc install -r entry/build/default/outputs/default/entry-default-signed.hap
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap

# 4. 执行 Ability assistant 的 test 子命令
# <ability-assistant> 沿用模板占位符，执行前替换为设备工具命令名
hdc shell <ability-assistant> test -b com.samples.applicationcontext -m entry_test \
  -s unittest /ets/testrunner/OpenHarmonyTestRunner -s timeout 15000
```

> **注意**：占位符不能原样执行。`-s timeout 15000` 控制单用例超时，不是全量 15 秒限制；可追加 `-s class ApplicationContextEntryAbility` 只验证启动，或 `-s class ApplicationContextLifecycle` 复测生命周期。同一个包同一时间只运行一个测试会话，避免 DevEco 与命令行相互干扰。

> **产物检查**：修改测试后先重新构建并安装主包和测试包，确认 HAP 时间戳；必要时清理增量产物。也可在指定 DevEco 中运行 `entry/src/ohosTest`，使用 `/ets/testrunner/OpenHarmonyTestRunner`。

现有 `run-device-tests.ps1` 作为辅助运行资产保留：唤醒设备、临时延长息屏时间、验证 Hypium 计数并在结束后恢复原超时。它不代替安装步骤，也不能自动解开凭据锁屏。本说明的标准执行流程以上述模板为准。

## 附录 D：实测结果（最近一次记录）

| 项目 | 记录与证据 |
| --- | --- |
| 当前静态注册 | 79 个套件、1,950 条用例 |
| 最近测试 HAP 构建 | 2026-11-19，`ApplicationContextDemo_BUILD.log`：`BUILD SUCCESSFUL`，打包签名成功 |
| 修复后生命周期复测 | 2026-11-19，`ApplicationContextLifecycle`：31/31，通过；Failure/Error/Ignore 均为 0 |
| 生命周期执行耗时 | `taskconsuming=167321`，约 167.321 秒，不是启动耗时 |
| 生命周期日志 | 上级目录 `ApplicationContextDemo_DEVICE_20261119_LIFECYCLE_FINAL.log` |
| 修复后启动复测 | 2026-11-19，`ApplicationContextEntryAbility`：4/4，通过；Failure/Error/Ignore 均为 0 |
| 入口执行耗时 | `taskconsuming=3040`，约 3.040 秒，不是启动耗时 |
| 启动日志 | 上级目录 `ApplicationContextDemo_DEVICE_20261119_STARTUP_FINAL.log` |
| 较早设备抽样 | 2026-11-18，页面、文件、模块资源、EventHub 合计 91/91 通过，Failure/Error/Ignore 均为 0 |
| 抽样日志 | 上级目录 `ApplicationContextDemo_DEVICE_READY_VERIFIED.log` |
| 修复后全量结果 | 尚无完整 1,950 条通过记录；早先全量排查中止日志不构成通过证据 |

上述结果来自已有日志，不将不同运行的数量相加为唯一通过用例数，也不把修复前抽样当作修复后全量验证。本次仅重写文档，没有重新构建或运行设备测试。

## 附录 E：已知问题与陷阱（保留记录）

| 问题 | 表现 | 处置 |
| --- | --- | --- |
| 灭屏或锁屏 | 启动报 `00508013`，用例尚未执行 | 唤醒并解锁，按附录 C 保持屏幕可用；不以增加用例超时代替 |
| 页面就绪晚于生命周期 | Ability 已拉起但组件尚未渲染 | 分别等待真实前台状态和页面文本，超时明确失败 |
| 只调用生命周期回调 | 回调完成却未发生真实前后台切换 | 使用 `Driver.pressHome`，等待 `BACKGROUND`，再拉起主 Ability 并等待 `FOREGROUND` 与页面 |
| 生命周期等待占住 UI 队列 | 恢复操作无法推进 | 队列只包裹直接 UiTest 操作，状态轮询和恢复等待放在队列外 |
| 页面状态延续 | 再次读取已是 `Welcome` | 接受已存在状态；有点击时明确要求最终为 `Welcome` |
| 句柄、文件或监听残留 | 后续用例遇到已有文件或重复事件 | 保留探针 `finally` 清理，避免跳过清理或吞掉错误 |
| area 未恢复 | 后续路径落到其他存储区域 | 记录原区域并在 `finally` 恢复，核对原路径 |
| 版本字段取错对象 | ApplicationInfo 上无法得到预期版本 | 从真实 BundleInfo 获取 versionName/versionCode |
| 资源 JSON 带注释 | restool 拒绝解析 | 严格区分 `.json` 与 `.json5`；版权注释放在支持注释的配置文件首部 |
| 套件名造成覆盖误解 | 将网络、动画、泄漏或无障碍名称当作专项结果 | 以实际探针和断言为准，专项能力另行补充 |
| 仅检查工具退出状态 | 忽略零用例、中止或实际失败 | 核对总数、Pass、Failure、Error、Ignore 及完成标识，不能仅看构建或进程退出成功 |

