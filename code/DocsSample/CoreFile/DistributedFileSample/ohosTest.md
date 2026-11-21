# 测试用例归档

## 2026-11-20 续作：约七万行逻辑测试

- 测试目录 ETS 共 **73,570 物理行 / 66,647 含 token 行**。物理行包含注释和空行；token 行不是纯业务有效代码行，不声称达到七万有效业务行。
- 新增 658 个逻辑用例：Sequence 512、Descriptor 81、Validation 40、Snapshot 25。全部调用实际 `copyFromDistributed` 或 `writeTextFile`，使用独立记录 API 验证参数、调用顺序、错误对象身份、释放次数及下一次操作恢复，没有新增 UI 场景。
- 设备测试定义共 688 个：676 逻辑、1 个真实 FileIo 配合连接替身、11 个原 UI；另有 1 个 LocalUnit 写入与复制组合用例。共 689 个定义，主机可执行逻辑 677 个。
- 保留 `OpenHarmonyTestRunner -> TestAbility -> Hypium -> List -> 既有套件与新增矩阵` 完整引导；原 UI 的启动断言由错误的 TestAbility 修正为实际 EntryAbility。
- 全量静态规范检查通过：六项 XTS 元数据、唯一编号/名称、顺序编号、英文说明、MediumTest/Function/Level 0、显式类型、TAG 起止与 finally、断言前实际值日志、有效生产调用、120 列及版权头。

## 已完成验证与最终状态

| 验证层次 | 结果与边界 |
| --- | --- |
| 基线编译 | 001 主包 / 002 ohosTest，同原 API 26 SDK，均成功 |
| 扩充后初次编译 | 003 主包 / 004 ohosTest，均成功；之后正式调用 pr-review_origin |
| 初次全量主机逻辑回归 | 677/677 通过，0 失败，27,837 次断言；执行前后 entry/src 哈希一致 |
| 主机运行器契约 | 32 项通过，覆盖同步/异步及 falsy 异常、初始化/清理失败、超时、进程隔离、无断言失败、晚到拒绝诊断，新增冷启动与主体计时分离、同步主体/初始化/清理超时及整个进程限时验证 |
| 断言敏感性 | 4 项通过；仅在可丢弃副本中移除释放、路径规范化或请求快照，实际测试能以 AssertionError 发现偏差，真实源码未修改 |
| 页面修正契约 | 14 项通过；实际页面函数与生产 model 配合记录 SDK 替身，覆盖读失败仍关闭、写/关闭/打开失败不继续复制、URI 失败、正常复制、目录及授权日志脱敏、缺失/空 peer 时不调用建链或断链 |
| 修复后复验中的问题 | 005 主包发现 SDK 类型约束，已按顶层 ReadOptions 与可空 networkId 修正；旧运行器外层 2 秒限时包含冷启动/转译，host 两次在执行断言前超时（147 例中 146 通过、420 例中 419 通过），均保留失败记录；已分离计时并验证同步/异步超时仍失败 |
| 修复后最终验证 | 006 主包 / 007 ohosTest，同原 E:/sdk API 26 SDK，均成功；最终主机 677/677 通过、0 失败、27,837 次断言，67 个 entry/src 文件与构建快照及回归哈希一致，8 项受保护配置未变 |
| 设备 FileIo / UI / 双设备 DFS | 本轮未执行；不据 host 或编译结果宣称通过 |

主机 `host-regression.cjs` 每例启动独立子进程：注册后的用例主体及 beforeEach/afterEach 合计限时 2000ms，等待中的 watchdog 与同步执行后耗时检查均能判定超时；整个子进程（含 Node 冷启动、转译和注册）外层限时 10000ms。遇到任一失败即停止并返回非零，不重试失败用例、不把超时记为通过。FileIo、URI、设备 delegator 和授权 SDK 访问被禁止，真实 FileIo 套件在主机注册阶段排除。记录 API、转译、日志替身和断言替身不等同真实 SDK、设备、网络、权限或 Hypium 运行时；实际 TaskSignal 取消未验证。

## 正式检视与修正

按 pr-style、pr-security、pr-logging、pr-typescript、pr-basic 五份规则检视生产代码、文档、原有用例、完整引导与主机脚本；完整抽样四个新 01 分片，其余同构用例由全量 AST 规范检查与主机执行覆盖，不宣称逐行人工检视全部七万行。

1. 公共目录读取改用 finally 关闭文件描述符，读异常不再遗漏关闭。
2. 沙箱源文件准备复用已测试的 `writeTextFile`；打开、写入或关闭失败立即结束，避免复制历史 `src.txt`，URI 准备也纳入错误边界。
3. 页面不再公开文件内容、完整 URI、目录或文件名，错误仅打印状态码，文件读取/列举和授权日志只打印必要计数。
4. 页面及 EntryAbility 补充类型导入与显式变量/回调/异步返回类型，保留全部七个页面按钮和实际业务入口，生产 DistributedCopy model 未修改。
5. README 下载源迁移 GitCode，目录拼写与 model 结构同步，SDK 说明改为实际 26.0.0；删除“创建入口设置文件安全等级”的错误描述。

原 SDK 三版本、runtimeOS、签名、包名、权限及模块配置保持不变。原 main module 中系统级 definePermissions 和 `FormAbility` usedScene 映射保留，不能将其认定为已修复或已验证有效；涉及系统权限的设备验收需另行确认。沿用已有 README_zh.md，不创建额外 README 文件。未提交、推送、安装或发布。

## 最终源码与产物绑定

最终源码清单覆盖 67 个 entry/src 文件，SHA-256：

```text
25714e0c6a722802b78d4c18fbb83c00c355ef2521ea102836359905953176c4
```

| 构建 | 未签名产物 | 字节数 |
| --- | --- | --- |
| 006 default | [entry-default-unsigned.hap](entry/build/default/outputs/default/entry-default-unsigned.hap) | 215,351 |
| 007 ohosTest | [entry-ohosTest-unsigned.hap](entry/build/default/outputs/ohosTest/entry-ohosTest-unsigned.hap) | 11,072,816 |

两个构建均使用原 E:/sdk API 26 SDK，源码与最终回归清单逐文件哈希一致。原生产 DistributedCopy model、Hypium 引导及七个按钮的标识和顺序保持不变；源码清单哈希不包含本文档与主机脚本，后者的独立哈希保存在逐例目录中。产物未安装，设备执行结论仍为未验证。产物完整 SHA-256 及构建审计见 [.validation/audit.json](.validation/audit.json) 本地证据。

## 本地证据

- [矩阵及 XTS 规范检查](.validation/matrix-format-check.json)
- [新增用例定义](.validation/matrix-manifest.json)
- [主机逻辑回归](.validation/host-regression.json)
- [运行器契约](.validation/continuation-runner-contract.json)
- [受控变异检测](.validation/assertion-sensitivity.json)
- [页面修正契约](.validation/page-review-contract.json)
- [逐例目录与最终源码/产物绑定](.validation/case-catalog.json)
- [构建审计](.validation/audit.json)
- [初始启动超时记录](.validation/host-review-timeout-attempt.json)
- [串行复验启动超时记录](.validation/host-serial-timeout-attempt.json)

这些是忽略目录中的本地验证证据，安全快照可能含本机配置，不应发布；历史 `_task26` 保留不覆盖。

## Task26 历史验证边界（不代表当前结果）

- 当时仅部分完成：相对只读原仓，业务源码净新增 377 有效行 / 529 物理行，含测试基础设施为 399 / 589，未达到当时约 50000 有效行目标；历史“有效行”排除注释、空行和纯结构行，不与本轮物理行口径混用。
- 当时 DistributedCopy.test.ets 有 19 用例、41 静态断言点；18 个 host 逻辑用例通过、39 次断言，1 个真实 FileIo 用例跳过，0 次真实 SDK 调用。
- 当时 API 26 主包和 ohosTest 编译成功，日志保存在 `_task26/*-group2-coverage-build-1.log` 及 `*-group2-review-build-1.log`，每次均保存源码快照和前后哈希。
- 下表的 pass 为原历史归档，**本轮未重跑，不代表当前设备验收**。

### 历史文件准备用例表

| 测试功能 | 预置条件 | 预期输出 | 是否自动 | 历史记录 / 本轮 |
| --- | --- | --- | --- | --- |
| 拉起应用 | 设备正常运行 | 应用被拉起 | 是 | pass / 未执行 |
| 权限申请 | 应用被拉起 | 拉起权限申请弹窗 | 是 | pass / 未执行 |
| 允许多设备协同权限 | 拉起权限申请弹窗 | 选择允许 | 是 | pass / 未执行 |
| 创建文件 | 应用被拉起 | 完成文件创建；安全等级不由当前入口设置 | 是 | pass / 未执行 |
| 将文件从沙箱拷贝到分布式目录 | 设备正常运行 | 文件成功拷贝 | 是 | pass / 未执行 |

### 历史跨设备文件访问和拷贝用例表

| 测试功能 | 预置条件 | 预期输出 | 是否自动 | 历史记录 / 本轮 |
| --- | --- | --- | --- | --- |
| 拉起应用 | 设备正常运行 | 应用被拉起 | 是 | pass / 未执行 |
| 权限申请 | 应用被拉起 | 拉起权限申请弹窗 | 是 | pass / 未执行 |
| 允许多设备协同权限 | 拉起权限申请弹窗 | 选择允许 | 是 | pass / 未执行 |
| 多设备建链并访问文件 | 两台设备已经完成可信组网 | 成功建链并读取另一台设备文件 | 是 | pass / 未执行 |
| 跨设备拷贝 | A 设备已将文件拷贝到分布式目录 | B 设备成功从分布式目录拷贝到沙箱 | 是 | pass / 未执行 |
