# 测试用例归档

## 2026-11-21 Task70 直接注册构建记录（后续源码已变化）

### 规模与组成

- 测试源码共 74,690 个物理行、60,422 个非空非注释代码行、54,034 个排除纯结构标记后的有效行；约 7 万行目标按物理测试源码达成，不将空行、注释、生成器、文档、备份或构建产物计入。
- 共注册 1,786 条用例：1,763 条逻辑矩阵、10 条 ohosTest 基线逻辑、6 条 LocalUnit 逻辑、3 条真实 SDK、4 条 UI。2026-11-21 删除本设备失败的 4 条 UI 与 1 条真实 SDK 后为 1,781 条（1,763 矩阵、10 基线、6 LocalUnit、2 真实 SDK），删除范围见“失败用例处置（2026-11-21 按要求删除）”。
- Host 执行 1,779 条逻辑用例，7,036 次真实 Hypium 断言及其紧邻日志全部通过；每个断言点均单独注入失败，7,036 条失败路径均传播原哨兵错误并执行一次结束日志。
- 逻辑用例实际调用生产 `importDownloadFiles` 1,805 次、`writeDownloadMessage` 226 次。Host 验证未调用真实 SDK。
- 15 个仅在内存应用的生产变异全部被捕获，包括输入/输出快照、完整名称验证、六类非法名称、目录项过滤、关闭优先级、写入目标，以及“同一路径验证结果被错误缓存”回归；生产文件未被写回。
- 页面三个真实辅助操作完成 12 条 Host 检查；EntryAbility、BackupAbility 和 Logger 完成 7 条生命周期/日志检查。这些检查使用真实转译源码和注入 Kit，不代表 ArkUI 或设备验证。

该次直接注册证据（2026-11-21，保留原回执，不代表后续改动源码）：

- [_task70/environment-direct-list-final-20261121.json](_task70/environment-direct-list-final-20261121.json)：76 个套件直接注册、74 个矩阵模块及全部字面量用例名称进入实际 HAP，包含初次中断、重试构建和外部配置变化记录。
- [_task70/environment-validation-direct-list-20261121.json](_task70/environment-validation-direct-list-20261121.json)：1,786 注册、1,779 通过、0 失败、0 规范违规，3 SDK 与 4 UI 未运行。
- [_task70/environment-mutations-direct-list-20261121.json](_task70/environment-mutations-direct-list-20261121.json)：15/15 生产变异被捕获。
- [_task70/environment-matrix-check-direct-list-20261121.json](_task70/environment-matrix-check-direct-list-20261121.json)：1,763 条矩阵字节一致、AST 和 Host 校验通过。
- [_task70/environment-page-direct-list-20261121.json](_task70/environment-page-direct-list-20261121.json)：12/12 页面辅助逻辑通过。
- [_task70/environment-lifecycle-direct-list-20261121.json](_task70/environment-lifecycle-direct-list-20261121.json)：7/7 生命周期及 Logger Host 检查通过。

### 矩阵场景目录

序号是 `EnvironmentSample_` 后缀中的矩阵序号。每条用例均含唯一 `@tc.number`、字面量 `@tc.name`、英文 `@tc.desc`、直接生产调用、固定 expected、断言前实际/预期日志，以及外层 `finally` 结束日志。完整输入、步骤和 expected 位于 `entry/src/ohosTest/ets/test/DownloadMatrix001.test.ets` 至 `DownloadMatrix074.test.ets`，与 `Ability.test.ets`、`DownloadFiles.test.ets` 一起，由 `entry/src/ohosTest/ets/test/List.test.ets` 直接导入并调用一次，顺序为 Ability、DownloadFiles、矩阵 001–074，共 76 个测试文件；不使用中间注册文件。原中间注册文件已移至 `_task70/direct-list-before-20261121/` 留档。

| 场景 | 序号范围 | 数量 | 步骤和预期 |
|------|----------|------|------------|
| 源快照与返回别名 | 0000–1151 | 1152 | 四位置文件/目录分类、每个可达 stat/copy 边界、六种源结构变化及两种 sandbox 所有权；导入顺序固定，返回数组双向隔离；两条代表用例额外验证合法调用后同路径非法列表仍必须重新验证且不得进入 stat |
| stat/copy 失败前缀 | 1152–1361 | 210 | 逐位置注入同一错误对象，仅保留已完成复制，后续 stat/copy 和 sandbox list 不执行 |
| 最终 sandbox list 失败 | 1362–1473 | 112 | 全部复制后最终列表抛错，传播原错误，已完成复制不回滚 |
| 初始 list 失败 | 1474 | 1 | 初次列表抛错，不进入 stat/copy 或最终列表 |
| 整单非法名称 | 1475–1564 | 90 | 空、dot、dotdot、slash、backslash、NUL 位于早晚位置；整单预验证无副作用，修复输入后重试成功 |
| 目录参数保护 | 1565–1567 | 3 | 空源、空目标、源目标相同均在文件 API 调用前失败 |
| 合法名称与空列表 | 1568–1600 | 33 | dot 子串、隐藏名、空白、Unicode、换行/tab、大小写和组合字符不过度拒绝 |
| write/close 优先级 | 1601–1684 | 84 | 三类 fd、七类内容和四类成功/失败组合；固定 temp.txt，成功 open 后 close 恰一次，两错时传播 finally 的 close 错误 |
| open/空写目录失败 | 1685–1686 | 2 | 未成功 open 时不 write/close，空目录不触碰 API |
| 独立 API 写入重入 | 1687–1734 | 48 | 外层 stat 中使用独立 API 写入，内层 fd 和错误不泄漏 |
| 独立 API 导入重入 | 1735–1750 | 16 | 内外目录、分类、数组、事件和返回值所有权独立 |
| Promise 排程隔离 | 1751–1762 | 12 | 两调用、两排程顺序、路径/API/错误隔离；仅验证同步业务的 Promise 排程，不声称线程并发 |

### 编译结果

使用 DevEco Studio 26.0.0.24（构建号 261.23567.38.36.260024）、bundled JBR、Hvigor 和 API26 Release SDK（ETS 26.0.0.38）串行执行：

```text
module=entry@default   product=default buildMode=debug assembleHap --no-daemon
module=entry@ohosTest  product=default buildMode=debug assembleHap --no-daemon
```

直接注册重试构建的两个目标均返回 0 且包含 `BUILD SUCCESSFUL`，HAP 修改时间均晚于该目标构建开始时间，构建前后受保护源码无变化：

| 目标 | 结果 | 未签名 HAP 字节数 | ABC 字节数 | HAP SHA-256 |
|------|------|-------------------|------------|-------------|
| default | PASS | 228,580 | 25,080 | 见 `_task70/environment-build-direct-list-retry-20261121.json` |
| ohosTest | PASS | 7,965,778 | 3,614,260 | 见 `_task70/environment-build-direct-list-retry-20261121.json` |

证据为 [_task70/environment-build-direct-list-retry-20261121.json](_task70/environment-build-direct-list-retry-20261121.json)、`environment-default-direct-list-retry-20261121.log` 和 `environment-ohosTest-direct-list-retry-20261121.log`。

初次 ohosTest 构建受到并行外部清理/构建干扰而中断，退出码为 4294967295；初次日志与回执 `_task70/environment-build-direct-list-20261121.json` 保留，不计为通过证据。随后按 default、ohosTest 串行重试通过，无需修改测试源码。

初始快照后、初次构建前检测到 `build-profile.json5` 外部签名配置变化；该配置在两次构建期间保持稳定。未修改或恢复该配置，也未新增证书、依赖或权限。不能声称配置与任务开始快照完全一致。

历史阶段的 `_task70/environment-build-review-cache-closed.json`、`environment-*-review-cache-closed.json` 与 `environment-*-review-final.json` 仍保留；旧 HAP 大小与哈希仅属于当时构建，不代表当前直接注册产物。

### 当前设备执行状态

| 测试功能 | 预置条件 | 当前结果 |
|----------|----------|----------|
| 拉起应用并检查主页元素 | PC/2in1 设备、可安装测试包 | NOT RUN |
| 获取公共目录路径 | PC/2in1 设备 | NOT RUN |
| 导入 Download 普通文件 | 授予 READ_WRITE_DOWNLOAD_DIRECTORY，准备专用 Download 数据 | NOT RUN |
| 写入 Download/temp.txt | 授权并备份同名文件 | NOT RUN |
| 真实 SDK 沙箱导入 | API26 设备测试环境 | NOT RUN |
| 真实 SDK 覆盖写及截断 | API26 设备测试环境 | NOT RUN |
| Environment 路径契约 | API26 PC/2in1 设备 | NOT RUN |

Host 结果不替代上述 7 条设备结果，也未读取测试人员的真实 Download 目录。原 `module.json5` 仅包含 `deviceTypes: ["2in1"]`，`usedScene.abilities` 仍为 `FormAbility` 而实际页面为 `EntryAbility`；该配置、授权弹窗文本和真实权限行为需在目标设备确认。本次未获授权修改权限或设备清单。

## 2026-11-21 设备分批执行与停止原因

本节为以上“当前设备执行状态”表格的最新实测结果，设备 d62903433941353531100bb350d3ab00（`const.ohos.apiversion` 26、`const.product.model` ohos，非 2in1），取代其中 7 行 NOT RUN。

### 停止运行的根因

一次 `test` 子命令带入 77 个 suite / 1,780 条用例时，测试进程在启动阶段就被系统终止，控制台停在“开始运行测试”且不输出任何用例结果。设备侧证据：

- `sysfreeze-com.example.environmentsample-20010047-20261121194629439.log`：`Reason:LIFECYCLE_TIMEOUT`，半程 2,500 ms、全程 5,000 ms，主线程栈停在 `JsUIAbility::OnStart` 内的 `Array.map`/`Array.filter`，即 `TestAbility.onCreate` 同步调用 `Hypium.hypiumTest()` 的注册阶段。
- Hypium 1.0.24 在 `service.js` 每注册一个 `it()` 都无条件打印一条 `[Hypium]stress length : 1`，本机实测约 3.5 ms/条，1,780 条约 6.2 s，已超出 5 s 生命周期上限；Ability 框架记录 sysfreeze 后终止进程。
- 启动阶段把用例规模压到阈值内即可通过：仅 2 个 suite（48 条）用时 3.5 s、30 个 suite（720 条）用时 18.5 s 均正常结束，说明 `-s class` 只注册命中的 suite，分批有效。
- 30 个 suite/批在执行阶段仍偶发第二种中断：`appfreeze-com.example.environmentsample-20010047-20261121195808560.log`，`Reason:THREAD_BLOCK_6S`（半程 3 s），本次在第 647/665 条时主线程单任务超过 6 s 被判死，harness 返回 `TestFinished-ResultMsg: App died`。因此批次还需为执行阶段的 6 s 主线程上限留出余量。

### 分批执行方式与结果

`_task70/RunDeviceTestBatches.cjs` 从 `entry/src/ohosTest/ets/test/*.test.ets` 解析 describe 名称，按 `-s class` 分批执行并在无结果时重试（默认 10 个 suite/批、最多 3 次），本次 8 批全部一次通过、无中断，完整输出见 `_task70/device-batches-20261121.log`：

| 批次范围 | 用例 | 通过 | 失败 |
|----------|------|------|------|
| ActsAbilityTest..DownloadMatrix007 | 185 | 180 | 5 |
| DownloadMatrix008..017 / 018..027 / 028..037 / 038..047 / 048..057 / 058..067 | 每批 240 | 每批 240 | 0 |
| DownloadMatrix068..074 | 155 | 155 | 0 |
| 合计 | 1,780 | 1,775 | 5 |

1,763 条矩阵用例与 10 条 DownloadFilesBusiness 基线逻辑全部通过。5 条失败原因互不相同：

- `SUB_CORE_FILE_ENVIRONMENT_UI_001`：`Cannot read property click of null`，本设备 `driver.findComponent` 未命中返回 null 而非 undefined，用例按 undefined 判分支后仍调用 `click()`。
- `SUB_CORE_FILE_ENVIRONMENT_UI_002..004`：`GetStringById failed state`，`abilityDelegator.getAppContext().resourceManager.getStringValue(resource.id)` 在本设备取字符串失败，用例在点击前即中止。
- `SUB_CORE_FILE_ENVIRONMENT_BASELINE_013`：`The device doesn't support this api`，`Environment.getUserDocumentDir()` 需 PC/2in1 能力，本设备非 2in1，属预置条件不满足。

`node _task70/RunDeviceTestBatches.cjs 10` 全程约 5 分钟，退出码 1 由上述 5 条真实失败决定。

### 失败用例处置（2026-11-21 按要求删除）

上述 5 条失败用例已直接删除，不是改成 skip 或放宽预期：

- `Ability.test.ets`（`ActsAbilityTest` 整个 suite，含 `SUB_CORE_FILE_ENVIRONMENT_UI_001..004`）移出 `entry/src/ohosTest/ets/test/`，文件保存在 `_task70/removed-failing-20261121/Ability.test.ets`，删除前副本另存 `_task70/before-delete-failing-20261121/`；`List.test.ets` 同步移除其 import 与调用。
- `DownloadFiles.test.ets` 删除 `SUB_CORE_FILE_ENVIRONMENT_BASELINE_013`，并去掉随之不再使用的 `Environment` 导入；`DownloadFilesRealSdk` 保留 BASELINE_011、012 两条。
- 工程根目录不是 git 仓库，故以带时间戳备份代替版本回退；`entry/src/main` 生产源码、权限与设备清单未改动。

删除后注册规模为 75 个测试文件 / 76 个 suite / 1,775 条 ohosTest 用例（删除前 76 个文件 / 77 个 suite / 1,780 条）。default 与 ohosTest 两目标重新编译通过，证据为 `_task70/environment-build-failing-removed.json` 与 `environment-{default,ohosTest}-failing-removed.log`；重装签名包（`_task70/InstallSignedHaps.cjs`，流程同 DevEco 的卸载—暂存—`bm install`—清理）后分批执行 8 批全部一次通过、无中断、无新增 faultlog，完整输出见 `_task70/device-batches-after-delete-20261121.log`：

| 批次范围 | 用例 | 通过 | 失败 |
|----------|------|------|------|
| DownloadFilesBusiness..DownloadMatrix008 | 204 | 204 | 0 |
| DownloadMatrix009..018 / 019..028 / 029..038 / 039..048 / 049..058 / 059..068 | 每批 240 | 每批 240 | 0 |
| DownloadMatrix069..074 | 131 | 131 | 0 |
| 合计 | 1,775 | 1,775 | 0 |

覆盖代价与本节口径说明：上表“当前设备执行状态”中 4 条 UI 行与 Environment 路径契约行对应的用例已删除，其“本设备 FAIL”仅是删除前的实测记录，删除后这些功能退回“未设备验证”；UI 交互（拉起 EntryAbility、按钮点击与结果追加文本）和 `getUserDocumentDir` 路径契约目前无设备用例覆盖。恢复方式应从上述备份取回，并按 null/undefined 判定与资源取值途径修正，而不是继续删用例。

## 2026-11-21 最终注册复核与外部修改边界

最终复核时发现测试源码发生外部修改：`Ability.test.ets` 已不在活动目录，`DownloadFiles.test.ets` 和 `List.test.ets` 已更新。当前目录有 DownloadFiles 与矩阵 001–074，共 75 个测试文件，List 均直接导入；但矩阵 056–074 的 19 个调用随后被外部注释，复核时仅启用 56 个套件，尚不满足“每个实际测试文件直接调用一次”。74 个矩阵与复核前快照一致，无 Catalog/MatrixList 中间注册文件。

以上 76 套件、1,786 注册和双目标构建数据属于修改前阶段，原回执与日志均未覆盖。此次仅复核当前目录的直接注册完整性，没有恢复被删除的文件，也没有重新编译或执行外部修改后的 Environment 源码；不能将旧 HAP 的结果当作当前源码的编译、Host 或设备通过证明。

## pr-review_origin 检视结论

完成 style、security、logging、typescript 和 Sample 基础检视后，已修复：真实操作失败却显示 SUCCESS、公共路径日志、UI 可复用旧 SUCCESS 文本误通过、颜色模式调用时机、Logger 丢失布尔返回、隐式 Promise 返回类型，以及合法调用后非法列表的验证缓存覆盖缺口。代码无 `console.log`、无签名或敏感信息新增，最终 AST 规范违规为 0。

仍有合入边界：仓库规范要求 `README.md`，当前工程仅有 `README_zh.md`；设备类型未包含 default/tablet；权限 usedScene 与实际 EntryAbility 不一致；没有 PR 元数据和目标分支信息。各阶段设备执行与删除失败用例后的结果见上节，不混用旧回执。当前注册复核又发现 19 个矩阵调用被外部注释，此状态未完成全部直接注册，不能据此声称当前源码全量回归或 PR 合入通过。

## Task26 历史记录

此前 Task26 的 30,269 次 Host 断言、14 个变异及旧构建日志属于历史阶段，已被以上 Task70 结果取代；历史证据仍保存在 `_task26` 和 `_task70/*-before-review.json`，不得作为本轮设备/UI 通过证明。
