# 测试用例归档

## 2026-11-20 Task70 当前结果

### 规模与组成

- 测试源码共 74,709 个物理行、60,426 个非空非注释代码行、54,037 个排除纯结构标记后的有效行；约 7 万行目标按物理测试源码达成，不将空行、注释、生成器、文档、备份或构建产物计入。
- 共注册 1,786 条用例：1,763 条逻辑矩阵、10 条 ohosTest 基线逻辑、6 条 LocalUnit 逻辑、3 条真实 SDK、4 条 UI。
- Host 执行 1,779 条逻辑用例，7,036 次真实 Hypium 断言及其紧邻日志全部通过；每个断言点均单独注入失败，7,036 条失败路径均传播原哨兵错误并执行一次结束日志。
- 逻辑用例实际调用生产 `importDownloadFiles` 1,805 次、`writeDownloadMessage` 226 次。Host 验证未调用真实 SDK。
- 15 个仅在内存应用的生产变异全部被捕获，包括输入/输出快照、完整名称验证、六类非法名称、目录项过滤、关闭优先级、写入目标，以及“同一路径验证结果被错误缓存”回归；生产文件未被写回。
- 页面三个真实辅助操作完成 12 条 Host 检查；EntryAbility、BackupAbility 和 Logger 完成 7 条生命周期/日志检查。这些检查使用真实转译源码和注入 Kit，不代表 ArkUI 或设备验证。

最终证据：

- `_task70/environment-validation-review-cache-closed.json`：1,786 注册、1,779 通过、0 失败、0 规范违规，3 SDK 与 4 UI 未运行。
- `_task70/environment-mutations-review-cache-closed.json`：15/15 生产变异被捕获。
- `_task70/environment-matrix-check-review-cache-closed.json`：1,763 条矩阵字节一致、AST 和 Host 校验通过。
- `_task70/environment-page-review-final.json`：12/12 页面辅助逻辑通过。
- `_task70/environment-lifecycle-review-final.json`：7/7 生命周期及 Logger Host 检查通过。

### 矩阵场景目录

序号是 `EnvironmentSample_` 后缀中的矩阵序号。每条用例均含唯一 `@tc.number`、字面量 `@tc.name`、英文 `@tc.desc`、直接生产调用、固定 expected、断言前实际/预期日志，以及外层 `finally` 结束日志。完整输入、步骤和 expected 位于 `entry/src/ohosTest/ets/test/DownloadMatrix001.test.ets` 至 `DownloadMatrix074.test.ets`，由 `DownloadMatrixList.test.ets` 注册。

| 场景 | 序号范围 | 数量 | 步骤和预期 |
|------|----------|------|------------|
| 源快照与返回别名 | 0000–1151 | 1152 | 四位置文件/目录分类、每个可达 stat/copy 边界、六种源结构变化及两种 sandbox 所有权；导入顺序固定，返回数组双向隔离；两条代表用例额外验证合法调用后同路径非法列表仍必须重新验证且不得进入 stat |
| stat/copy 失败前缀 | 1152–1361 | 210 | 逐位置注入同一错误对象，仅保留已完成复制，后续 stat/copy 和 sandbox list 不执行 |
| 最终 sandbox list 失败 | 1362–1473 | 112 | 全部复制后最终列表抛错，传播原错误，已完成复制不回滚 |
| 初始 list 失败 | 1474 | 1 | 初始列表抛错，不进入 stat/copy 或最终列表 |
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

两个目标均返回 0 且包含 `BUILD SUCCESSFUL`，构建前后受保护源码无变化：

| 目标 | 结果 | 未签名 HAP 字节数 | SHA-256 |
|------|------|-------------------|---------|
| default | PASS | 225,755 | `60e52d09e00bec9ca6679047da5c9116350f30bac3272b7529b5b3105e77d8a6` |
| ohosTest | PASS | 7,964,025 | `8b528943f0a8e53abf8322e5951353c2c2b61e9056556152be79afc397d61f31` |

证据为 `_task70/environment-build-review-cache-closed.json`、`environment-default-review-cache-closed.log` 和 `environment-ohosTest-review-cache-closed.log`。未添加签名配置、证书、依赖或权限。

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

## pr-review_origin 检视结论

完成 style、security、logging、typescript 和 Sample 基础检视后，已修复：真实操作失败却显示 SUCCESS、公共路径日志、UI 可复用旧 SUCCESS 文本误通过、颜色模式调用时机、Logger 丢失布尔返回、隐式 Promise 返回类型，以及合法调用后非法列表的验证缓存覆盖缺口。代码无 `console.log`、无签名或敏感信息新增，最终 AST 规范违规为 0。

仍有合入边界：仓库规范要求 `README.md`，当前工程仅有 `README_zh.md`；设备类型未包含 default/tablet；权限 usedScene 与实际 EntryAbility 不一致；没有 PR 元数据和目标分支信息；3 条 SDK 与 4 条 UI 未设备执行。因此当前结论是“代码、Host 回归和双目标编译通过”，不是“设备集成或 PR 合入通过”。

## Task26 历史记录

此前 Task26 的 30,269 次 Host 断言、14 个变异及旧构建日志属于历史阶段，已被以上 Task70 结果取代；历史证据仍保存在 `_task26` 和 `_task70/*-before-review.json`，不得作为本轮设备/UI 通过证明。
