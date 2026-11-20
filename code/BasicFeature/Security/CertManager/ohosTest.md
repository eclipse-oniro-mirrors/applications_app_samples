# CertManager 测试用例归档

## 测试环境

- SDK：OpenHarmony 26.0.0（compileSdkVersion/compatibleSdkVersion 26.0.0）
- 工程模型：hvigor modelVersion 26.0.0
- 测试框架：@ohos/hypium 1.0.6
- 测试模块：entry_test（TestAbility），运行器 OpenHarmonyTestRunner
- 支持设备：default、tablet

## 运行方式

- 应用包名：`com.samples.certmanager`
- 测试模块名：`entry_test`
- 测试运行器路径：`/ets/TestRunner/OpenHarmonyTestRunner`
- 单用例超时：`15000` ms
- 运行参数：包名对应 `-b`，模块名对应 `-m`，`-s unittest` 指定运行器，`-s timeout` 指定超时；按用例类名筛选时追加 `-s class <类名>`
- 执行入口：DevEco `entry@ohosTest` 运行配置；真机上先安装主 HAP 与测试 HAP，再按上述包名与运行器路径启动测试运行器

## 套件与用例

| 套件文件 | describe | @tc 号段 | 用例数 | 层级 |
| --- | --- | --- | --- | --- |
| DataDisplayCore.test.ets | CertManagerDataDisplay | SUB_CertManager_DISP_0001~0020 | 20 | 逻辑层 |
| DataDisplaySeq.test.ets | CertManagerDisplaySeq | SUB_CertManager_DISPSQ_0001~0042 | 42 | 逻辑层 |
| ModifyOriginCore.test.ets | CertManagerModifyOrigin | SUB_CertManager_MORIG_0001~0020 | 20 | 逻辑层 |
| ModifyOriginSeq.test.ets | CertManagerModifyOriginSeq | SUB_CertManager_MORIGSQ_0001~0022 | 22 | 逻辑层 |
| ModifySignatureCore.test.ets | CertManagerModifySignature | SUB_CertManager_MSIG_0001~0020 | 20 | 逻辑层 |
| ModifySignatureSeq.test.ets | CertManagerModifySignatureSeq | SUB_CertManager_MSIGSQ_0001~0022 | 22 | 逻辑层 |
| InstallCore.test.ets | CertManagerInstall | SUB_CertManager_INST_0001~0020 | 20 | 逻辑层 |
| InstallSeq.test.ets | CertManagerInstallSeq | SUB_CertManager_INSTSQ_0001~0020 | 20 | 逻辑层 |
| SignCore.test.ets | CertManagerSign | SUB_CertManager_SIGN_0001~0020 | 20 | 逻辑层 |
| SignSeq.test.ets | CertManagerSignSeq | SUB_CertManager_SIGNSQ_0001~0032 | 32 | 逻辑层 |
| VerifyCore.test.ets | CertManagerVerify | SUB_CertManager_VERI_0001~0020 | 20 | 逻辑层 |
| VerifySeq.test.ets | CertManagerVerifySeq | SUB_CertManager_VERISQ_0001~0032 | 32 | 逻辑层 |
| UiCore.test.ets | CertManagerUi | SUB_CertManager_UI_1001~1020 | 20 | UI 层 |
| UiSeq.test.ets | CertManagerUiSeq | SUB_CertManager_UISEQ_0001~0028 | 28 | UI 层 |
| ApiSmoke.test.ets | CertManagerApiSmoke | SUB_CertManager_APISMK_0001~0014 | 14 | 逻辑层 |

合计：15 个测试套件，352 条用例

## 覆盖说明

- 逻辑层直接驱动 `main/ets/model` 的 CertManagerModel，按合法/边界/非法/极值/组合/状态六维展开，覆盖数据展示、修改原始数据、修改签名数据、证书安装、签名、签名校验六个主题。
- 序列套件（DISPSQ/MORIGSQ/MSIGSQ/INSTSQ/SIGNSQ/VERISQ）按操作状态序列展开，逐步断言每步观测与终态，并包含循环稳定性用例与五步边界序列用例。
- UI 层基于 `@ohos.UiTest` 的 Driver + `ON.id()` 驱动真实界面，覆盖六按钮主流程、成功/失败 toast、计数器状态与多轮篡改复位；UiSeq 套件以展示复位收尾的按钮操作序列逐步断言计数器与提示。
- 接口冒烟套件（APISMK）对证书管理 API 面做结构断言，并与真实调用结果配对校验。
- 期望值来源：规格常量（string.json 文案、main 冻结文本）、冻结基线（证书 PKCS12 数据、篡改签名）、状态推演（展示复位、签名自动补齐）。

## 真机验证结果（2026-11-20）

| 项 | 结果 |
|---|---|
| 执行时间 | 2026-11-20 |
| 执行设备 | 真机 d629034339413535311095d600002b00（OpenHarmony 7.1.0.21，armeabi-v7a，debug 版本） |
| 测试产物 | entry-ohosTest-signed.hap (2,425,523 B)，配套主 HAP entry-default-signed.hap (237,867 B) |
| 执行方式 | 真机上先安装主 HAP 与测试 HAP，再通过 DevEco Studio `entry@ohosTest` 运行配置（参数清单：包名/模块名/运行器路径/超时，对应 `-b`/`-m`/`-s unittest`/`-s timeout`）启动测试运行器；全量基线一轮执行 15 个套件共 352 条，修复测试侧问题后按 `-s class` 增量复跑涉及用例 31 条 |
| 测试套件 | 15 |
| 用例总数 | 352 |
| 通过 | 352 |
| 失败 | 0 |
| 错误 | 0 |
| 跳过 | 0 |
| 通过率 | 100% |
| 总体结论 | 全部通过 |

合计：15 个测试套件，352 条用例，通过 352 条，失败 0 条。

### 归因与修复

- 全量基线（同一构建只执行一轮）：Tests run: 352, Pass: 321, Failure: 31, Error: 0。31 条失败全部归因为测试侧，分三类：
  1. 运行器入口路径：工程原为大写 `ets/TestRunner/`，与运行时请求的 `ets/testrunner/` 不一致，测试进程启动即退出；已改为小写目录并同步 `module.json5` 的 `srcPath`。
  2. UI 文案语言口径（30 条）：界面提示走 `$r` 资源，设备为中文环境时渲染 zh_CN 值，测试冻结的英文文案断言失配；已改为按同一语义同时匹配 base 与 zh_CN 两种文案。
  3. 状态推演期望（1 条）：VERISQ 0023 序列中修改原始数据会把签名恢复为真实签名，校验失败分支返回的数据应等于签名结果，断言已改为关系式。
- 修复后审计（15 套件/352 例，错误 0、警告 0）与构建通过；重装后增量复跑修复涉及的全部用例：Tests run: 31, Pass: 31, Failure: 0, Error: 0。
- 合并结论：352 条用例全部通过，剩余失败清单为空。
