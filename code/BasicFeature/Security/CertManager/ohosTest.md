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

## 执行结果

| 项 | 结果 |
|---|---|
| 执行时间 | 【代填】 |
| 执行设备 | 【代填：真机 <serial>】 |
| 测试产物 | `entry_test-ohosTest.hap`（【代填】 B），配套主 HAP `entry-default.hap`（【代填】 B） |
| 执行方式 | 真机上先安装主 HAP 与测试 HAP，再按「运行方式」中的应用包名与运行器路径启动测试运行器，单次全量执行 |
| 测试套件 | 【代填】 |
| 用例总数 | 【代填】 |
| 通过 | 【代填】 |
| 失败 | 【代填】 |
| 错误 | 【代填】 |
| 跳过 | 【代填】 |
| 通过率 | 【代填】 |
| 总体结论 | 真机验证未执行（未授权） |
