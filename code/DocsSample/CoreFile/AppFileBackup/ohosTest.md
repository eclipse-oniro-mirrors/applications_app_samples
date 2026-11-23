# 测试用例归档

## 本轮范围与状态（2026-11-20）

- 按XTS编码规范扩充实际文件传输逻辑测试，保留完整Hypium引导；完成初次编译后调用`pr-review_origin`正式检视，修正后重新编译。
- 测试目录共54,637物理行、46,642含token行。物理行包含注释与空行，含token行也不是纯业务有效行，不宣称新增五万行纯业务代码。
- 设备注册781例：779逻辑、2真实FileIo；另有1本地逻辑用例，共782个独立编号。768个矩阵用例分布在45个分片，每片不超过18例。
- 最终主包构建010成功，测试包构建009成功；两者使用不同API26 SDK安装，**不等于同一SDK下双目标完整验收**。
- 严格XTS静态检查通过，运行器25项契约检查通过；最终主机逻辑回归780/780通过，实际执行16,467次断言。782条源码绑定逐例目录已生成，其中780条标为主机通过、2条标为设备未运行。
- 本轮未执行真实FileIo、备份服务或UI设备用例。`hdc list targets`本轮查询发现1个连接目标；未安装/运行HAP，未验证系统签名、权限生效及配套FileBackupExtension应用，连接设备不等于用例通过。

## 场景与执行步骤

| 场景族 | 例数 | 操作步骤与关键预期 | 验证方式 |
| --- | ---: | --- | --- |
| Sequence | 512 | 从8种操作中执行完整三步组合；逐步核对复制方向、路径、原始fd关闭、错误对象、输入保全，并核对完整轨迹与后续恢复 | 实际生产函数＋记录端口 |
| Cleanup | 64 | 每种首步操作叠加close失败，再执行8种后续操作；核对finally错误覆盖语义、原句柄关闭尝试及后续操作隔离 | 实际生产函数＋记录端口 |
| Validation | 96 | 10种非法bundle与14种非法URI，分别进行备份/恢复、关闭成功/失败；核对路径拒绝、零复制和fd=0关闭 | 实际生产函数＋记录端口 |
| Mutation | 48 | 两个方向、access/mkdir/copy/close四阶段、六种输入变更；核对原路径与原fd已固定，恢复不调用access/mkdir | 实际生产函数＋记录端口 |
| Path | 48 | 12种合法路径形式、两方向、两目录状态；核对完整路径、fd=0、方向、目录和输入保全 | 实际生产函数＋记录端口 |
| Transfer | 11 | 保留原基础逻辑场景，验证备份/恢复方向、目录/复制失败、非法路径和原始描述符隔离 | 实际生产函数＋独立探针 |
| Local | 1 | 用独立本地探针执行备份及恢复，断言完整操作轨迹及两份输入保持不变 | 实际生产函数＋独立探针 |
| TransferSdk | 2 | 使用真实FileIo复制实际字节，比较来源/归档/恢复结果；在任何后续open前检查原fd确已关闭 | 已编译，设备未执行 |

八种矩阵操作：备份目录不存在、备份目录已存在、恢复、access失败、mkdir失败、已存在目录备份copy失败、恢复copy失败、不存在目录备份copy失败。每次复制记录是尝试，不是实际文件复制成功证明。

合法路径中的`%2e%2e`、`%2F`按字面文件名验证；生产代码不做URI解码，测试不将其解释成遍历路径。关闭失败覆盖先前错误是既有finally语义，不是本轮新增的业务策略。

## 编码与注册检查

- 每个用例包含六项`@tc`元数据，英文描述，编号按族以0100递增，实际`it`名称与元数据一致，全局无重复编号或名称。
- 使用`TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0`；变量、函数和回调显式类型，类型依赖使用`import type`。
- 用例有start日志和finally中的end日志；expect包装器先记录实际值再调用Hypium断言。断言不只放在catch中，不使用字面值自比较占位测试。
- 保留TestAbility、OpenHarmonyTestRunner及主/本地List注册。矩阵由静态导入注册，SDK和UI独立注册，不通过主机模拟它们。
- 静态检查覆盖版权头、120列限制、元数据、类型、注册、实际操作及断言，禁止`any`、`unknown`、`Function`回调类型、`console.log`和debugger。
- 静态断言点不等于实际运行次数；实际次数以完整主机报告为准。

## 编译记录与环境边界

原工程保持`runtimeOS=OpenHarmony`、三处SDK版本字段为字符串`26.0.0`、`local.properties`指向`E:/sdk`；未修改共享SDK、签名、包名或权限。

| 构建 | 目标 / SDK | 结果与处理 |
| --- | --- | --- |
| 001 | main / 原公共API26 | 失败：CoreFileKit没有原业务需要的backup系统API导出；不删除功能、不补丁化SDK |
| 002 | main / 完整系统API26隔离副本 | 失败：构建副本漏复制AppScope图片；修正副本工具，不修改应用资源 |
| 003 | main / 完整系统API26隔离副本 | 失败：SDK backup.File不能按结构类型直接传给自有传输接口；修正两处回调边界对象 |
| 004 | main / 完整系统API26隔离副本 | 成功，随后进行正式检视 |
| 005 | ohosTest / 完整系统API26隔离副本 | 失败：缺少run_declgen_standalone.js互操作生成工具，尚未进入ETS用例编译；不修改共享SDK |
| 006 | ohosTest / 原公共API26 | 成功，随后进行正式检视 |
| 007 | main / 完整系统API26隔离副本 | 检视修正后成功 |
| 008 | ohosTest / 原公共API26 | 失败：新句柄检查辅助函数直接throw BusinessError，不符合arkts-limited-throw；修正为以Error类型重抛原对象 |
| 009 | ohosTest / 原公共API26 | 最终成功，退出码0 |
| 010 | main / 完整系统API26隔离副本 | 最终成功，退出码0；源码与009及最终主机回归绑定 |

完整系统SDK位于`E:/sdk/ohfull/26.0.0`，含backup系统API声明；主包使用`.validation/build-copies/010`中源码相同的副本，仅该临时副本local.properties指向完整系统SDK。原工程和共享SDK未改动。公共SDK能编译本次传输测试，但不能编译依赖backup系统API的原主包；完整系统SDK能编译主包，但测试构建工具链不完整。

最终日志：`.validation/build-010-default-full-sdk.log`、`.validation/build-009-ohosTest.log`；完整构建历史与源码保护记录在`.validation/audit.json`。成功包含构建前后无源码缺失、改变或新增，系统SDK副本资源与源码哈希也一致。构建仍有SDK弃用/异常声明等警告，不描述为零警告。

最终产物为未签名HAP：

- 主包：`entry-default-unsigned.hap`，来自完整系统SDK隔离副本（本地构建目录不随仓库提交）。
- 测试包：`entry-ohosTest-unsigned.hap`，来自原公共SDK工程（本地构建产物不随仓库提交）。

工程未配置签名，HAP编译成功不等于可安装。仍需补齐同一完整系统SDK测试工具链、有效系统应用签名、目标权限及配套应用，才能做同环境双目标构建和真实服务/UI验收。本轮没有这些验收结果。

本次修复后复测：main 与 ohosTest 均可使用当前 API 26 SDK 编译通过，`signingConfigs` 为空。

## pr-review_origin检视与修正

正式检视在004主包、006测试包成功后调用，读取style/security/logging/typescript/basic参考；检视对象为本轮测试及生产差异，修正后再次构建和检查。

| 文件与位置 | 问题 | 修正与验证 |
| --- | --- | --- |
| `entry/src/main/ets/backuprestore/BackupRestore.ets:86,182` | SDK File与自有接口结构赋值不能通过当前ArkTS编译 | 在回调边界显式构造fd/bundleName/uri对象，继续调用真实生产传输函数；最终主包通过 |
| `entry/src/main/ets/backuprestore/BackupRestore.ets:61` | 能力文件内容直接输出日志 | 改为记录读取字节数，不打印文件内容；保留原读取行为 |
| `entry/src/main/ets/backuprestore/BackupRestore.ets` | 类型导入、局部变量及异步返回类型不完整，buffer仍使用旧模块入口 | 补显式类型、import type、分号和函数说明，buffer迁移@kit.ArkTS；不重写业务服务状态 |
| `entry/src/ohosTest/ets/test/BackupFileTransferSdk.test.ets:65,137,183` | 仅比较字节不能发现默认FileIo适配器漏关句柄 | 在后续任何open前stat原fd，只接受13900008作为已关闭，并无条件断言；失败路径安全清理自有句柄 |
| `entry/src/ohosTest/ets/test/BackupFileTransferSdk.test.ets:74` | 修正辅助函数引入的throw类型编译错误 | 保留BusinessError错误码检查，以Error类型重抛原对象；009测试包通过 |
| 测试分片、基础/本地/SDK用例及注册 | 元数据、断言日志、显式类型和注册说明需统一 | 严格XTS检查无问题，25项运行器契约检查通过 |
| `README_zh.md`、`.gitignore` | 下载入口及验证边界需更新，临时报告和本地配置备份不应入库 | 下载仓库改为GitCode，明确不同SDK边界，忽略.validation、_task26及本地锁文件 |

本轮必须修正项已处理；没有统一重构存量Logger/Ability日志domain等建议项，没有重写系统服务会话、恢复计数或publish异步流程，不将本次传输测试表述为服务回调完整测试。保留原权限usedScene配置，本轮未验证其设备生效；没有通过修改权限绕过运行前提。

## 主机回归、逐例证据与源码保护

运行命令：

```sh
node host-regression.cjs
```

- 直接转译当前`BackupFileTransfer.ets`生产源码，仅注入明确的记录端口，不复制或模拟生产传输算法。
- `@kit.CoreFileKit`边界禁止执行实际FileIo；UI、系统服务和Native导入被拒绝。断言与hook由主机适配，不是运行了真实Hypium运行时。
- 每例独立子进程，真实墙钟超时2000ms，任一失败/超时即停止，未执行断言也失败；父进程必须同时检查报告、退出码及超时状态。
- 25项契约检查覆盖同步/异步/清理的falsy抛出、beforeEach阻止正文、零断言、首错停止、主错误保全、进程隔离及真实超时。
- 最终完整回归：780注册、780执行、780通过、0失败，16,467次实际断言，命令退出码0；本轮早先中止的回归不作为通过证据。
- 本地 `host-regression.json` 保存逐例名称、实际断言数、耗时、退出码及运行前后entry/src SHA256；`case-catalog.json` 已生成782个元数据/操作步骤/预期断言/结果条目，780条为host-passed-not-device、2条为device-not-run，真实设备执行数为0。
- 最终74个entry/src文件的运行前、运行后和当前汇总SHA256均为`710e430d974558ec64a8443aaf4c846382b74c60b7916583bc4ac49e00103e9e`；逐文件哈希与最终009/010构建快照一致，目录同时记录两份未签名HAP的SHA256和大小。
- `.validation/continuation-source-protection.json`已核对8个SDK/签名/包名/权限/Hvigor相关文件与本轮基线一致。生产main无缺失或新增文件，只有BackupRestore.ets变化；BackupFileTransfer.ets及其余main文件未变。
- 本轮基线为`.validation/continuation-baseline`；保留历史`_task26`。两者包含本地配置，仅供本地验证，禁止发布其中的配置或凭据。没有提交、推送或安装应用。

## Task26历史记录（非本轮结果）

以下保留原Task26阶段的规模、环境和构建结论；旧“in_progress”与旧设备`[Empty]`仅代表当时状态，不是本轮当前状态。原UI表中的pass也不是本轮设备运行证据。

- 当时仅部分完成：源码净新增240有效行/373物理行，未达到约50000有效行目标。有效行排除注释、空行和纯括号行；只统计entry/src下ets/ts，排除配置、文档、输出及备份。
- 当时新增BackupFileTransfer.test.ets：13用例、23静态断言点，覆盖备份/恢复复制方向、finally关闭句柄、目录/复制错误、路径越界和输入保全。其中2用例使用真实FileIo，其余仅替换文件系统依赖；尚未设备运行。
- 生产BackupRestore回调继续调用提取函数；回调报错时停止文件处理。原全部UI用例未删除，补齐TestAbility、OpenHarmonyTestRunner和Hypium注册。
- SDK三版本字段为字符串26.0.0，local.properties使用E:/sdk。主包失败：当时共享SDK CoreFileKit无原功能需要的backup导出；禁止修改共享SDK，未重复同根因主包编译。
- 测试包修复传输契约对系统backup声明的无必要依赖后成功；调用pr-review_origin并检视新增/生产差异，检视后测试包再次成功。随后补固定原始fd的输入隔离修复及3个用例，隔离修复后及检视后两次构建成功（ohosTest-isolation-build.log、ohosTest-isolation-review-build.log），第二次检视补显式类型及句柄所有权说明。
- 当时主包仍阻塞，双目标验收不完整；测试HAP未配置签名，不代表可安装或设备通过。_task26保全工作源码、原仓基线及日志，基线哈希一致，无缺失源码，未覆盖原仓或新增签名。
- 当时未做UI/备份服务设备验证，hdc list targets返回[Empty]，Task26登记in_progress，余项为系统SDK环境、服务回调完整测试及有效行规模。

### 原UI归档表（历史pass，非本轮重跑）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 历史结果 |
| --- | --- | --- | --- | --- | --- |
| 拉起应用 | 设备正常运行 | 无 | 应用被拉起 | 是 | pass |
| 应用触发数据备份 | FileBackupExtension应用的文件成功创建 | 无 | 日志输出备份流程 | 是 | pass |
| 退出备份恢复服务 | 备份会话已经注册 | 无 | 退出备份恢复服务 | 是 | pass |
| 拉起FileBackupExtension应用 | 应用已安装 | 无 | 成功拉起应用 | 是 | pass |
| 删除数据文件 | FileBackupExtension应用的文件已经创建且备份 | 无 | 文件被删除 | 是 | pass |
| 拉起本应用 | 应用已安装 | 无 | 应用被拉起 | 是 | pass |
| 应用触发数据恢复 | 数据文件完成备份 | 无 | 日志输出恢复流程 | 是 | pass |
| 查看文件是否恢复成功 | FileBackupExtension应用已安装 | 无 | 文件恢复并显示 | 是 | pass |
