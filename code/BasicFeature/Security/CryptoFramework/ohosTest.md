# CryptoFramework 测试用例归档

## 测试环境

| 项 | 值 |
|---|---|
| 测试框架 | @ohos/hypium 1.0.6 |
| 测试模块 | entry（src/ohosTest） |
| 测试运行器 | /ets/TestRunner/OpenHarmonyTestRunner |
| 构建 SDK | 26.0.0（hvigor modelVersion 26.0.0） |
| 设备类型 | phone / tablet |

## 测试套件与用例数

| 套件（describe） | 文件 | 类型 | 用例数 |
|---|---|---|---|
| AesKeyCore | AesKeyCore.test.ets | 逻辑 | 22 |
| AesCipherCore | AesCipherCore.test.ets | 逻辑 | 30 |
| RsaKeyCore | RsaKeyCore.test.ets | 逻辑 | 20 |
| RsaSignVerifyCore | RsaSignVerifyCore.test.ets | 逻辑 | 26 |
| TextFileCore | TextFileCore.test.ets | 逻辑 | 16 |
| AesKeySeq | AesKeySeqVolume01.test.ets | 逻辑 | 51 |
| AesChr | AesChrVolume01.test.ets | 逻辑 | 31 |
| AesSeq | AesSeqVolume01.test.ets | 逻辑 | 26 |
| AesSeq2 | AesSeqVolume02.test.ets | 逻辑 | 25 |
| AesState | AesStateVolume01.test.ets | 逻辑 | 41 |
| RsaKeySeq | RsaKeySeqVolume01.test.ets | 逻辑 | 41 |
| RsaSeq | RsaSeqVolume01.test.ets | 逻辑 | 26 |
| RsaSeq2 | RsaSeqVolume02.test.ets | 逻辑 | 25 |
| RsaTamp | RsaTampVolume01.test.ets | 逻辑 | 31 |
| RsaState | RsaStateVolume01.test.ets | 逻辑 | 33 |
| AesChain | AESCHAINVolume01.test.ets | 逻辑 | 40 |
| AesCtTamp1 | AESCTAM1Volume01.test.ets | 逻辑 | 48 |
| AesCtTamp2 | AESCTAM2Volume01.test.ets | 逻辑 | 48 |
| AesGChr | AESGCHRVolume01.test.ets | 逻辑 | 40 |
| AesGen | AESGENVolume01.test.ets | 逻辑 | 20 |
| AesGlen1 | AESGLEN1Volume01.test.ets | 逻辑 | 48 |
| AesGlen2 | AESGLEN2Volume01.test.ets | 逻辑 | 48 |
| AesGlen3 | AESGLEN3Volume01.test.ets | 逻辑 | 48 |
| AesGlen4 | AESGLEN4Volume01.test.ets | 逻辑 | 48 |
| AesGlen5 | AESGLEN5Volume01.test.ets | 逻辑 | 48 |
| AesJsonVolume01 | AESJSNVolume01.test.ets | 逻辑 | 51 |
| AesKeyChr1 | AESKCHR1Volume01.test.ets | 逻辑 | 49 |
| AesKeyChr2 | AESKCHR2Volume01.test.ets | 逻辑 | 41 |
| AesKeyLen | AESKLENVolume01.test.ets | 逻辑 | 50 |
| AesTagTamp1 | AESTGTM1Volume01.test.ets | 逻辑 | 48 |
| AesTagTamp2 | AESTGTM2Volume01.test.ets | 逻辑 | 48 |
| RsaChain | RSACHAINVolume01.test.ets | 逻辑 | 40 |
| RsaGen | RSAGENVolume01.test.ets | 逻辑 | 20 |
| RsaKeyChr | RSAKCHRVolume01.test.ets | 逻辑 | 49 |
| RsaKeyLen | RSAKLENVolume01.test.ets | 逻辑 | 48 |
| RsaMsgTamp | RSAMSGTMVolume01.test.ets | 逻辑 | 48 |
| RsaSgChr | RSASGCHRVolume01.test.ets | 逻辑 | 40 |
| RsaSgLen1 | RSASGLN1Volume01.test.ets | 逻辑 | 48 |
| RsaSgLen2 | RSASGLN2Volume01.test.ets | 逻辑 | 48 |
| RsaSgLen3 | RSASGLN3Volume01.test.ets | 逻辑 | 48 |
| RsaSgLen4 | RSASGLN4Volume01.test.ets | 逻辑 | 48 |
| RsaSgTamp | RSASGTAMVolume01.test.ets | 逻辑 | 48 |
| TxtChr | TXTCHRVolume01.test.ets | 逻辑 | 40 |
| TxtLen1 | TXTLEN1Volume01.test.ets | 逻辑 | 50 |
| TxtLen2 | TXTLEN2Volume01.test.ets | 逻辑 | 48 |
| AesKeyReal2 | AesKeyReal02.test.ets | 逻辑 | 18 |
| AesCipherReal2 | AesCipherReal02.test.ets | 逻辑 | 18 |
| AesGenReal1 | AesGenReal01.test.ets | 逻辑 | 16 |
| RsaKeyReal2 | RsaKeyReal02.test.ets | 逻辑 | 18 |
| RsaSignReal2 | RsaSignReal02.test.ets | 逻辑 | 18 |
| RsaGenReal1 | RsaGenReal01.test.ets | 逻辑 | 16 |
| TextFileReal2 | TextFileReal02.test.ets | 逻辑 | 18 |
| CryptoUi | CryptoUi.test.ets | UI | 18 |
| UiSeq | UiSeqVolume01.test.ets | UI | 29 |

合计：54 个测试套件，1959 条用例（与 List.test.ets 注册一致）。

## 执行结果

| 项 | 值 |
|---|---|
| 执行时间 | 2026-11-20（基线 13 批 + 修复后增量复跑 6 轮） |
| 执行设备 | 真机 phone（hdc 目标 d629034339413535311095d600002b00） |
| 测试产物 | entry-ohosTest-signed.hap（BUILD SUCCESSFUL）与分批运行日志 |
| 执行方式 | 基线全量按 describe 分 13 批执行；71 例失败归因后仅修复测试侧，增量复跑受影响用例 6 轮（每批校验用例数大于 0 且框架结果为 0） |
| 测试套件 | 54 |
| 用例总数 | 1959 |
| 通过 | 1959 |
| 失败 | 0 |
| 错误 | 0 |
| 跳过 | 0 |
| 通过率 | 100.0% |
| 总体结论 | 全部通过 |
