# 应用程序包常见问题 测试用例归档

## 手工用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|
| 工程编译安装 | 无 | 编译 | 成功拉起应用 | Pass |
| IDE 中 Log 过滤 `getBundleInfoForSelf` | 正常安装运行 | 进入应用主页 | 日志打印应用信息字段 | Pass |

## 自动化测试执行

- 测试模块：`entry_test`（ohosTest），`TestAbility` + `OpenHarmonyTestRunner`。
- 设备前置：解锁、无系统弹窗；main HAP 与 ohosTest HAP 均安装。


## 套件总览

`List.test.ets` 共注册 **32 个套件、1,609 条用例**。

### 既有 BMS 用例（8 套件 / 73 条）

| 套件 | 用例数 | 职责 |
|---|---:|---|
| `driverProbeTest` | 1 | UiTest Driver 可用性探测 |
| `probeSmokeTest` | 5 | `getBundleInfoForSelf` 同步/异步入口冒烟 |
| `bundleFlagsMatrixTest` | 12 | BundleFlag 取值与掩码关系 |
| `bundleSignatureContractTest` | 12 | 签名证书、appId、fingerprint 契约 |
| `bundleAppInfoContractTest` | 22 | BundleInfo/ApplicationInfo/HapModuleInfo 字段 |
| `bundleErrorCodeMatrixTest` | 9 | 非法 bundleName/flag 的错误码矩阵 |
| `SignatureInfoTest` | 5 | appId/appIdentifier/fingerprint 基础获取 |
| `CommonProblem01Test` | 7 | 应用拉起、页面与 UI 基础流程 |

### BundleFlag 组合矩阵（24 套件 / 1,536 条）

| 分组 | 套件 | 用例数 | 验证点 |
|---|---|---:|---|
| AppId | `BundleAppId{Core,Extended,Advanced,Tail}` | 256 | `signatureInfo.appId` 以 `<bundleName>_` 开头且非空 |
| AppIdentifier | `BundleAppIdentifier{Core,Extended,Advanced,Tail}` | 256 | `signatureInfo.appIdentifier` 为无空格字符串（debug 签名可能为空串） |
| Fingerprint | `BundleFingerprint{Core,Extended,Advanced,Tail}` | 256 | `signatureInfo.fingerprint` 为 64 位大写十六进制 |
| 应用字段 | `BundleField{Core,Extended,Advanced,Tail}` | 256 | `APPLICATION` 标志下 `appInfo` 的 name/uid/accessTokenId/enabled/codePath |
| 模块与 Ability | `BundleModule{Core,Extended,Advanced,Tail}` | 256 | `HAP_MODULE` 下包含 `entry`；`ABILITY`/`EXTENSION` 下包含 `EntryAbility`/`EntryBackupAbility` |
| 签名一致性 | `BundleSignatureMatrix{Core,Extended,Advanced,Tail}` | 256 | `SIGNATURE` 下 appId 非空、fingerprint 长度 64 |

- 每个套件 64 条用例，`Core/Extended/Advanced/Tail` 各覆盖一段组合区间。
- 8 个 `BundleFlag` 组成 256 种组合；偶数序号走 `getBundleInfoForSelfSync`，奇数序号走 `getBundleInfoForSelf` Promise。
- 所有用例使用 `hilog`（DOMAIN `0xF811`、TAG `[Sample_CommonProblem_*]`）输出 begin/end 日志，并带完整 `@tc.number/@tc.name/@tc.desc` 元数据。

## 验证记录

- `assembleHap`：`BUILD SUCCESSFUL`。
- 真机抽样：`bundleAppId{Core,Tail}`、`bundleAppIdentifier{Advanced,Tail}`、`bundleFingerprint{Core,Tail}`、`bundleField{Core,Tail}`、`bundleModule{Core,Advanced,Tail}`、`bundleSignatureMatrix{Advanced,Tail}` 均 64/64 通过。
- 说明：debug 签名下 `appIdentifier` 实测为空串，因此该组断言为“字符串类型、无空白、与 trim 一致”，不强制非空；`appId` 与 `fingerprint` 仍做非空/64 位大写十六进制强断言。
