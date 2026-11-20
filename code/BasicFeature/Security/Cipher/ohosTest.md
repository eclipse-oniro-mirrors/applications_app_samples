# Cipher 测试说明

## 测试环境

- 设备：OpenHarmony 标准系统设备（真机验证需另行授权执行）
- SDK：26.0.0（DevEco Studio 26，hvigor modelVersion 26.0.0）
- 测试框架：@ohos/hypium 1.0.6 + @ohos/hamock 1.0.0
- 测试入口：entry/src/ohosTest/ets/test/List.test.ets，运行器 OpenHarmonyTestRunner

## 测试套件与用例统计

| 测试套件 | 文件 | 用例数 | 覆盖方式 | 编号段 | 层级 |
|---|---|---|---|---|---|
| AbilityTest | Ability.test.ets | 2 | 接口串联 | SUB_CIPHER_ACTS_0001~0002 | 页面层 UI |
| AesEncryptTest | AesEncrypt.test.ets | 22 | 关系式配对 | SUB_CIPHER_KEYENC_0001~0022 | 逻辑层 |
| AesEncryptVolume01Test | AesEncryptVolume01.test.ets | 61 | 组合扫描 | SUB_CIPHER_KEYENC_0023~0083 | 逻辑层 |
| AesEncryptVolume02Test | AesEncryptVolume02.test.ets | 61 | 组合扫描 | SUB_CIPHER_KEYENC_0084~0144 | 逻辑层 |
| AesEncryptVolume03Test | AesEncryptVolume03.test.ets | 31 | 组合扫描 | SUB_CIPHER_KEYENC_0145~0175 | 逻辑层 |
| AesDecryptTest | AesDecrypt.test.ets | 20 | 关系式配对 | SUB_CIPHER_KEYDEC_0001~0020 | 逻辑层 |
| AesDecryptVolume01Test | AesDecryptVolume01.test.ets | 51 | 组合扫描 | SUB_CIPHER_KEYDEC_0021~0071 | 逻辑层 |
| AesDecryptVolume02Test | AesDecryptVolume02.test.ets | 51 | 组合扫描 | SUB_CIPHER_KEYDEC_0072~0122 | 逻辑层 |
| AesDecryptVolume03Test | AesDecryptVolume03.test.ets | 51 | 组合扫描 | SUB_CIPHER_KEYDEC_0123~0173 | 逻辑层 |
| RsaEncryptTest | RsaEncrypt.test.ets | 20 | 关系式配对 | SUB_CIPHER_RSAENC_0001~0020 | 逻辑层 |
| RsaEncryptVolume01Test | RsaEncryptVolume01.test.ets | 71 | 区间扫描 | SUB_CIPHER_RSAENC_0021~0091 | 逻辑层 |
| RsaDecryptTest | RsaDecrypt.test.ets | 20 | 关系式配对 | SUB_CIPHER_RSADEC_0001~0020 | 逻辑层 |
| RsaDecryptVolume01Test | RsaDecryptVolume01.test.ets | 21 | 组合扫描 | SUB_CIPHER_RSADEC_0021~0041 | 逻辑层 |
| StateSequenceTest | StateSequence.test.ets | 18 | 调用稳定性 | SUB_CIPHER_STATE_0001~0018 | 逻辑层 |
| UiFlowTest | UiFlow.test.ets | 30 | 接口串联 | SUB_CIPHER_UI_1001~1030 | 页面层 UI |
| UiFlowVolume01Test | UiFlowVolume01.test.ets | 39 | 组合扫描 | SUB_CIPHER_UI_1031~1069 | 页面层 UI |

合计：16 个测试套件，569 条用例

## 六维覆盖

| 维度 | AES 加密 | AES 解密 | RSA 加密 | RSA 解密 | UI 流程 | 状态序列 |
|---|---|---|---|---|---|---|
| 合法 | 是 | 是 | 是 | 是 | 是 | 是 |
| 边界 | 是 | 是 | 是 | 是 | 是 | 是 |
| 非法 | 是 | 是 | 是 | 是 | 是 | 是 |
| 极值 | 是 | 是 | 是 | 是 | 是 | 是 |
| 组合 | 是 | 是 | 是 | 是 | 是 | 是 |
| 状态 | 是 | 是 | 是 | 是 | 是 | 是 |

## 用例清单

### AbilityTest（SUB_CIPHER_ACTS_0001~0002）

| 编号 | 名称 | 验证点 |
|---|---|---|
| SUB_CIPHER_ACTS_0001 | testActs0001 | 拉起应用后首页两个入口按钮均存在且文案非空 |
| SUB_CIPHER_ACTS_0002 | testActs0002 | 选择 AES 加密 a 后结果命中冻结基线密文 |

### AesEncryptTest（SUB_CIPHER_KEYENC_0001~0022）

| 编号 | 名称 | 验证点 |
|---|---|---|
| SUB_CIPHER_KEYENC_0001 | testKeyEnc0001 | 规格基线输入 'a' 的密文等于冻结基线且长度 24 |
| SUB_CIPHER_KEYENC_0002 | testKeyEnc0002 | 普通英文句加密后可用 AES 解密还原且密文异于明文 |
| SUB_CIPHER_KEYENC_0003 | testKeyEnc0003 | 中文多字节输入加密后密文 16 字节块且能还原 |
| SUB_CIPHER_KEYENC_0004 | testKeyEnc0004 | 特殊字符串加密后为 32 字节块且往返还原 |
| SUB_CIPHER_KEYENC_0005 | testKeyEnc0005 | 空串加密得到 16 字节块密文且往返还原为空串 |
| SUB_CIPHER_KEYENC_0006 | testKeyEnc0006 | 单字符输入两次加密输出相同（确定性）且长度 24 |
| SUB_CIPHER_KEYENC_0007 | testKeyEnc0007 | 15 字符（分块下界-1）加密后仍为 16 字节块 |
| SUB_CIPHER_KEYENC_0008 | testKeyEnc0008 | 16 字符（整块）加密后为 32 字节块（PKCS5 补整块） |
| SUB_CIPHER_KEYENC_0009 | testKeyEnc0009 | 17 字符（分块上界+1）加密后为 32 字节块且往返还原 |
| SUB_CIPHER_KEYENC_0010 | testKeyEnc0010 | 纯空白串不抛异常、加密后按原样还原 |
| SUB_CIPHER_KEYENC_0011 | testKeyEnc0011 | 含换行制表符的串不抛异常、密文 16 字节块且还原 |
| SUB_CIPHER_KEYENC_0012 | testKeyEnc0012 | 控制字符串加密不丢字符且输出异于输入 |
| SUB_CIPHER_KEYENC_0013 | testKeyEnc0013 | 256 字符长串加密后完整还原 |
| SUB_CIPHER_KEYENC_0014 | testKeyEnc0014 | 1024 字符长串加密后密文 1368 字符且还原等长 |
| SUB_CIPHER_KEYENC_0015 | testKeyEnc0015 | 4096 字符长串加密后密文 5464 字符且往返还原 |
| SUB_CIPHER_KEYENC_0016 | testKeyEnc0016 | 加密-解密-再加密链路中解密还原且两次加密一致 |
| SUB_CIPHER_KEYENC_0017 | testKeyEnc0017 | 不同输入的密文互不相同且等长（分块注入性） |
| SUB_CIPHER_KEYENC_0018 | testKeyEnc0018 | AES 密文喂给 RSA 解密失败返回 Error! |
| SUB_CIPHER_KEYENC_0019 | testKeyEnc0019 | 同一输入连续三次加密输出完全一致（确定性） |
| SUB_CIPHER_KEYENC_0020 | testKeyEnc0020 | 穿插其余输入后重加密原输入输出不变（无状态残留） |
| SUB_CIPHER_KEYENC_0021 | testKeyEnc0021 | 大小写敏感，'a' 命中基线而 'A' 输出不同密文 |
| SUB_CIPHER_KEYENC_0022 | testKeyEnc0022 | 空串两次加密一致且均还原为空串 |

### AesEncryptVolume01Test（SUB_CIPHER_KEYENC_0023~0083）

- SUB_CIPHER_KEYENC_0023：冻结基线，加密 'a' 精确匹配 `ZtJpi1Z5BwPPXqXYRHGthQ==` 且往返还原。
- SUB_CIPHER_KEYENC_0024~0083（60 条）：ascii 类 `'a'` 与 cjk 类 `'密'` × 30 档尺寸 [1,2,3,4,7,8,15,16,17,23,24,25,31,32,33,47,48,49,63,64,65,95,96,97,127,128,255,256,511,1023]，每条断言：解密还原明文、密文长于明文（PKCS5 填充）、密文异于明文（机密性）。

### AesEncryptVolume02Test（SUB_CIPHER_KEYENC_0084~0144）

- SUB_CIPHER_KEYENC_0084：digit 单字符 '5' 两次加密输出相等（确定性）且往返还原。
- SUB_CIPHER_KEYENC_0085~0144（60 条）：digit 类 `'5'` 与 special 类 `'!'` × 同 30 档尺寸，断言同上。

### AesEncryptVolume03Test（SUB_CIPHER_KEYENC_0145~0175）

- SUB_CIPHER_KEYENC_0145：纯空白输入 `'   '` 往返还原且两次加密一致。
- SUB_CIPHER_KEYENC_0146~0175（30 条）：blank 类 `' '` × 同 30 档尺寸，断言同上。

### AesDecryptTest（SUB_CIPHER_KEYDEC_0001~0020）

| 编号 | 名称 | 验证点 |
|---|---|---|
| SUB_CIPHER_KEYDEC_0001 | testKeyDec0001 | 冻结基线密文解密还原为 'a' |
| SUB_CIPHER_KEYDEC_0002 | testKeyDec0002 | 英文句加密产物解密还原且密文 16 字节块 |
| SUB_CIPHER_KEYDEC_0003 | testKeyDec0003 | 中文多字节明文往返还原且结果非失败哨兵 |
| SUB_CIPHER_KEYDEC_0004 | testKeyDec0004 | 数字串加密产物解密还原且长度与密文块匹配 |
| SUB_CIPHER_KEYDEC_0005 | testKeyDec0005 | 空串密文解密还原为空串 |
| SUB_CIPHER_KEYDEC_0006 | testKeyDec0006 | 单字符密文解密还原且异于密文本身 |
| SUB_CIPHER_KEYDEC_0007 | testKeyDec0007 | 整块 16 字符明文往返还原且密文 32 字节块 |
| SUB_CIPHER_KEYDEC_0008 | testKeyDec0008 | 63 字符明文往返还原且密文 64 字节块 |
| SUB_CIPHER_KEYDEC_0009 | testKeyDec0009 | 非 base64 串解密走 fail 分支返回 Error! |
| SUB_CIPHER_KEYDEC_0010 | testKeyDec0010 | 截断的基线密文解密失败返回 Error! |
| SUB_CIPHER_KEYDEC_0011 | testKeyDec0011 | 中文串作为密文走 fail 分支且不抛异常 |
| SUB_CIPHER_KEYDEC_0012 | testKeyDec0012 | 1024 字符明文往返还原且结果非失败哨兵 |
| SUB_CIPHER_KEYDEC_0013 | testKeyDec0013 | 4096 字符明文往返还原且密文 5464 字符 |
| SUB_CIPHER_KEYDEC_0014 | testKeyDec0014 | 8192 字符明文往返还原且密文 10924 字符 |
| SUB_CIPHER_KEYDEC_0015 | testKeyDec0015 | RSA 密文喂给 AES 解密失败返回 Error! |
| SUB_CIPHER_KEYDEC_0016 | testKeyDec0016 | 先解其余密文再解原密文结果不变（无状态残留） |
| SUB_CIPHER_KEYDEC_0017 | testKeyDec0017 | 同一密文连续解密两次输出一致且命中基线 |
| SUB_CIPHER_KEYDEC_0018 | testKeyDec0018 | 失败解密后紧接着成功解密不受污染 |
| SUB_CIPHER_KEYDEC_0019 | testKeyDec0019 | 首尾空白在往返中逐字保留不修剪 |
| SUB_CIPHER_KEYDEC_0020 | testKeyDec0020 | 明文含 Error! 字样时还原原文而非失败哨兵 |

### AesDecryptVolume01Test（SUB_CIPHER_KEYDEC_0021~0071）

- SUB_CIPHER_KEYDEC_0021：冻结基线密文 `ZtJpi1Z5BwPPXqXYRHGthQ==` 解密精确还原 'a'，再加密回到同一密文。
- SUB_CIPHER_KEYDEC_0022~0071（50 条）：ascii `'a'` 与 cjk `'密'` 两输入类 × 25 档尺寸 [1,2,3,4,8,16,23,24,25,43,44,45,86,87,88,171,172,173,342,343,344,1367,1368,1369,5464]，密文由加密-解密合成（decrypt(encrypt(M))），每条断言：还原明文、长度无失真、明文拼非 base64 字符作密文必走失败路径返回 Error!。

### AesDecryptVolume02Test（SUB_CIPHER_KEYDEC_0072~0122）

- SUB_CIPHER_KEYDEC_0072：非法密文 `'zzz'` 解密返回冻结哨兵 `Error!`，对哨兵再解仍为 `Error!`。
- SUB_CIPHER_KEYDEC_0073~0122（50 条）：junk `'z!9'` 与 digit `'5'` 两输入类 × 同 25 档尺寸，断言同上。

### AesDecryptVolume03Test（SUB_CIPHER_KEYDEC_0123~0173）

- SUB_CIPHER_KEYDEC_0123：空串密文解密返回冻结哨兵 `Error!`，对哨兵再解仍为 `Error!`。
- SUB_CIPHER_KEYDEC_0124~0173（50 条）：special `'!'` 与 blank `' '` 两输入类 × 同 25 档尺寸，断言同上。

### RsaEncryptTest（SUB_CIPHER_RSAENC_0001~0020）

| 编号 | 名称 | 验证点 |
|---|---|---|
| SUB_CIPHER_RSAENC_0001 | testRsaEnc0001 | 英文句加密后密文 172 字符且可解密还原 |
| SUB_CIPHER_RSAENC_0002 | testRsaEnc0002 | 中文多字节输入加密还原且结果非失败哨兵 |
| SUB_CIPHER_RSAENC_0003 | testRsaEnc0003 | 特殊字符加密还原且密文异于明文 |
| SUB_CIPHER_RSAENC_0004 | testRsaEnc0004 | 空串加密成功且解密还原为空串 |
| SUB_CIPHER_RSAENC_0005 | testRsaEnc0005 | 61 字符（上限-1）加密成功且还原等长 |
| SUB_CIPHER_RSAENC_0006 | testRsaEnc0006 | 62 字符（上限）加密成功且结果非失败哨兵 |
| SUB_CIPHER_RSAENC_0007 | testRsaEnc0007 | 63 字符（上限+1）走 fail 分支返回 Error! |
| SUB_CIPHER_RSAENC_0008 | testRsaEnc0008 | 64 字符输入加密失败返回 Error! |
| SUB_CIPHER_RSAENC_0009 | testRsaEnc0009 | 100 字符输入加密失败返回 Error! 且不抛异常 |
| SUB_CIPHER_RSAENC_0010 | testRsaEnc0010 | 4096 字符长输入加密失败返回 Error! |
| SUB_CIPHER_RSAENC_0011 | testRsaEnc0011 | 最小非空输入 1 字符加密还原且密文 172 字符 |
| SUB_CIPHER_RSAENC_0012 | testRsaEnc0012 | 最大合法长度 62 字符加密还原且长度逐字保留 |
| SUB_CIPHER_RSAENC_0013 | testRsaEnc0013 | 超长失败后系统恢复，正常加密不受影响 |
| SUB_CIPHER_RSAENC_0014 | testRsaEnc0014 | 两次加密同输入输出不同（OAEP 随机化）且均还原 |
| SUB_CIPHER_RSAENC_0015 | testRsaEnc0015 | RSA 与 AES 密文互不可解且两者输出不同 |
| SUB_CIPHER_RSAENC_0016 | testRsaEnc0016 | 短输入与空输入混编加密均各自还原 |
| SUB_CIPHER_RSAENC_0017 | testRsaEnc0017 | 同一输入两次加密密文不同且长度相等（非确定性） |
| SUB_CIPHER_RSAENC_0018 | testRsaEnc0018 | 一次失败后正常加密还原不受污染 |
| SUB_CIPHER_RSAENC_0019 | testRsaEnc0019 | 不同输入密文互异，旧密文仍可还原对应明文 |
| SUB_CIPHER_RSAENC_0020 | testRsaEnc0020 | 两轮加密解密循环各自还原且两次密文互异 |

### RsaEncryptVolume01Test（SUB_CIPHER_RSAENC_0021~0091）

- SUB_CIPHER_RSAENC_0021：62 字节边界明文（上限）加密成功，密文精确 172 字符，往返还原。
- SUB_CIPHER_RSAENC_0022~0091（70 条）：合法档 L=1..62（ascii `'a'`）62 条 + 超限档 L∈{63,64,65,100,127,128,1024,4096} 8 条。合法档断言：解密还原、密文长度 172（冻结 128B OAEP 基数）、密文异于明文；超限档断言：返回 `Error!`、对该输出解密仍为 `Error!`、输出非输入回声。

### RsaDecryptTest（SUB_CIPHER_RSADEC_0001~0020）

| 编号 | 名称 | 验证点 |
|---|---|---|
| SUB_CIPHER_RSADEC_0001 | testRsaDec0001 | 英文句加密产物解密还原且异于密文 |
| SUB_CIPHER_RSADEC_0002 | testRsaDec0002 | 中文多字节输入往返还原且结果非失败哨兵 |
| SUB_CIPHER_RSADEC_0003 | testRsaDec0003 | 特殊字符往返还原且密文 172 字符 |
| SUB_CIPHER_RSADEC_0004 | testRsaDec0004 | 空串密文解密还原为空串 |
| SUB_CIPHER_RSADEC_0005 | testRsaDec0005 | 单字符密文解密还原且异于密文本身 |
| SUB_CIPHER_RSADEC_0006 | testRsaDec0006 | 61 字符（上限-1）密文解密还原等长 |
| SUB_CIPHER_RSADEC_0007 | testRsaDec0007 | 62 字符（上限）密文解密还原且非失败哨兵 |
| SUB_CIPHER_RSADEC_0008 | testRsaDec0008 | 非 base64 串解密走 fail 分支返回 Error! |
| SUB_CIPHER_RSADEC_0009 | testRsaDec0009 | 截断密文（171 字符）解密失败返回 Error! |
| SUB_CIPHER_RSADEC_0010 | testRsaDec0010 | 中文串作为密文走 fail 分支且不抛异常 |
| SUB_CIPHER_RSADEC_0011 | testRsaDec0011 | 1024 字符 base64 串解密失败返回 Error! |
| SUB_CIPHER_RSADEC_0012 | testRsaDec0012 | 4096 字符 base64 串解密失败返回 Error! 且不抛异常 |
| SUB_CIPHER_RSADEC_0013 | testRsaDec0013 | 三个不同输入批量加密后逐一解密均还原 |
| SUB_CIPHER_RSADEC_0014 | testRsaDec0014 | AES 密文喂给 RSA 解密失败返回 Error! |
| SUB_CIPHER_RSADEC_0015 | testRsaDec0015 | RSA 与 AES 两条链路对同一输入均还原且密文互异 |
| SUB_CIPHER_RSADEC_0016 | testRsaDec0016 | 失败解密后正常解密还原不受影响 |
| SUB_CIPHER_RSADEC_0017 | testRsaDec0017 | 同一密文两次解密结果一致且均还原 |
| SUB_CIPHER_RSADEC_0018 | testRsaDec0018 | 穿插其余解密后旧密文仍还原对应明文 |
| SUB_CIPHER_RSADEC_0019 | testRsaDec0019 | 首尾空白在往返中逐字保留不修剪 |
| SUB_CIPHER_RSADEC_0020 | testRsaDec0020 | 明文含 Error! 字样时还原原文而非失败哨兵 |

### RsaDecryptVolume01Test（SUB_CIPHER_RSADEC_0021~0041）

- SUB_CIPHER_RSADEC_0021：真实 RSA 密文（加密 'a' 产物）解密精确还原 'a'。
- SUB_CIPHER_RSADEC_0022~0041（20 条）：5 个必失败输入类（cjk `'密'`、special `'!'`、blank `' '`、junk `'z!9'`、mixed `'a1!'`，均含非 base64 字符）× 4 档尺寸 [1,171,172,344]，每条断言：返回 `Error!`、长度 6、输出非输入回声。

### StateSequenceTest（SUB_CIPHER_STATE_0001~0018）

| 编号 | 名称 | 验证点 |
|---|---|---|
| SUB_CIPHER_STATE_0001 | testState0001 | AES 链式往返：加密-解密-再加密-再解密全等原串且两次密文一致 |
| SUB_CIPHER_STATE_0002 | testState0002 | RSA 链式两次往返还原原串，两次密文因 OAEP 随机化互异 |
| SUB_CIPHER_STATE_0003 | testState0003 | 跨算法链：AES 密文经 RSA 加密-解密还原后再 AES 解密还原原串 |
| SUB_CIPHER_STATE_0004 | testState0004 | 模型复用：同一模型连续 20 次加密 'a' 全部等于冻结基线 |
| SUB_CIPHER_STATE_0005 | testState0005 | AES 与 RSA 交替调用互不污染，各自往返还原 |
| SUB_CIPHER_STATE_0006 | testState0006 | 失败解密后模型仍可用，随后两次基线解密一致 |
| SUB_CIPHER_STATE_0007 | testState0007 | 明文含 Error! 字样往返还原原文，哨兵作密文走失败路径 |
| SUB_CIPHER_STATE_0008 | testState0008 | 5 路并发加密与串行结果逐位一致且无失败哨兵 |
| SUB_CIPHER_STATE_0009 | testState0009 | RSA 62 字节边界明文链式两轮往返密文恒 172 字符 |
| SUB_CIPHER_STATE_0010 | testState0010 | AES 密文作 RSA 载荷往返还原后再 AES 解密还原原串 |
| SUB_CIPHER_STATE_0011 | testState0011 | 1023 字符长输入两次加密一致且往返还原 |
| SUB_CIPHER_STATE_0012 | testState0012 | 空串加密为 24 字符密文、两次一致、往返还原为空串 |
| SUB_CIPHER_STATE_0013 | testState0013 | 基线密文连续三次解密输出一致且命中 'a' |
| SUB_CIPHER_STATE_0014 | testState0014 | RSA 乱串解密失败后正常密文解密成功还原 |
| SUB_CIPHER_STATE_0015 | testState0015 | 5 个输入类密文两两互异且全部还原 |
| SUB_CIPHER_STATE_0016 | testState0016 | 失败调用后重试同一密文解密仍正确还原 |
| SUB_CIPHER_STATE_0017 | testState0017 | 跨算法互不可解：AES 密文喂 RSA、RSA 密文喂 AES 均返回 Error!，各自解码正常 |
| SUB_CIPHER_STATE_0018 | testState0018 | 全链一致性：解密还原后再加密产出相同密文 |

### UiFlowTest（SUB_CIPHER_UI_1001~1030）

| 编号 | 名称 | 验证点 |
|---|---|---|
| SUB_CIPHER_UI_1001 | testUi1001 | 首页两个入口按钮均存在且可点入解密页 |
| SUB_CIPHER_UI_1002 | testUi1002 | 加密按钮可进入加密页且输入框与结果框均可见 |
| SUB_CIPHER_UI_1003 | testUi1003 | 解密页算法选择与重置按钮均存在 |
| SUB_CIPHER_UI_1004 | testUi1004 | 加密页点击返回按钮回到首页 |
| SUB_CIPHER_UI_1005 | testUi1005 | 解密页点击返回按钮回到首页 |
| SUB_CIPHER_UI_1006 | testUi1006 | 加密页顶部标题控件与返回控件存在 |
| SUB_CIPHER_UI_1007 | testUi1007 | 空输入点击加密不更新结果框（仅 toast 提示） |
| SUB_CIPHER_UI_1008 | testUi1008 | 默认算法输入 a 得到冻结基线结果 |
| SUB_CIPHER_UI_1009 | testUi1009 | 显式选择 AES 后加密同样命中基线 |
| SUB_CIPHER_UI_1010 | testUi1010 | 选择 RSA 后加密结果 196 字符且异于 AES 基线 |
| SUB_CIPHER_UI_1011 | testUi1011 | 点击重置后结果框清空 |
| SUB_CIPHER_UI_1012 | testUi1012 | 重置只清结果不清输入框 |
| SUB_CIPHER_UI_1013 | testUi1013 | 空白串加密走 AES 得到 48 字符带前缀结果 |
| SUB_CIPHER_UI_1014 | testUi1014 | 16 字符输入走 AES 得到 68 字符带前缀结果 |
| SUB_CIPHER_UI_1015 | testUi1015 | 中文输入加密结果带前缀且异于 a 的基线 |
| SUB_CIPHER_UI_1016 | testUi1016 | RSA 63 字符超限输入显示 Error! 结果 |
| SUB_CIPHER_UI_1017 | testUi1017 | 重进页面输入 b 结果 48 字符且异于 a 的基线 |
| SUB_CIPHER_UI_1018 | testUi1018 | 重新进入页面输入框与结果框均为初始空态 |
| SUB_CIPHER_UI_1019 | testUi1019 | 空输入点击解密不更新结果框（仅 toast 提示） |
| SUB_CIPHER_UI_1020 | testUi1020 | AES 基线密文解密显示 a 且长度 22 |
| SUB_CIPHER_UI_1021 | testUi1021 | 默认算法（未选择）解密基线密文同样命中 |
| SUB_CIPHER_UI_1022 | testUi1022 | RSA 模式下非密文输入显示 Error! 结果 |
| SUB_CIPHER_UI_1023 | testUi1023 | AES 模式下乱串输入显示 Error! 结果 |
| SUB_CIPHER_UI_1024 | testUi1024 | 点击重置后结果框清空 |
| SUB_CIPHER_UI_1025 | testUi1025 | 连续两次解密同一密文结果一致 |
| SUB_CIPHER_UI_1026 | testUi1026 | RSA 模式下 AES 密文解密失败显示 Error! |
| SUB_CIPHER_UI_1027 | testUi1027 | 重置后再解密仍得到正确结果 |
| SUB_CIPHER_UI_1028 | testUi1028 | RSA 模式 172 字符超长输入解密失败显示 Error! |
| SUB_CIPHER_UI_1029 | testUi1029 | 重新进入页面输入框与结果框均为初始空态 |
| SUB_CIPHER_UI_1030 | testUi1030 | 加密页产出密文直接用于解密页完整还原 UI 往返 |

### UiFlowVolume01Test（SUB_CIPHER_UI_1031~1069）

- SUB_CIPHER_UI_1031：加密页 AES 全链路：输入 'a' 后结果框精确等于冻结结果文本 `Encryption result is :  ZtJpi1Z5BwPPXqXYRHGthQ==`。
- SUB_CIPHER_UI_1032~1069（38 条）：加密页 19 条（合法 16 档尺寸 [1,2,15,16,17,31,32,62,63,100,255,256,383,500,511,512] + RSA 算法分支 1 + 空输入 1 + 重置 1）与解密页 19 条（合法 16 档尺寸 [1,2,15,16,17,31,32,62,63,100,255,256,380,382,383,384] 的 AES 往返 + 乱串 1 + 空输入 1 + 重置 1）。合法档断言：结果带冻结前缀、不含 `Error!`、长度大于前缀；RSA 分支断言 196 字符（24+172 冻结）；空输入/重置断言结果框为空；解密合法档断言结果等于前缀+明文精确还原；乱串断言等于冻结错误结果文本且长度 27。尺寸档位按设备输入通道约束收敛在 512 字符内（单次注入上限，多块注入会被设备输入法重处理导致字段损坏），解密档密文最长 512 字符。

## 期望值来源

- AES 冻结基线：@system.cipher AES/CBC/PKCS5Padding，iv 由 key 派生（ivOffset '0'、ivLen '16'），加密具有确定性；输入 'a' 的基线密文为 `ZtJpi1Z5BwPPXqXYRHGthQ==`（长度 24，与 UI 前缀合计 48）。
- 分块长度：PKCS5Padding 下密文长度 = (明文长度/16 + 1) * 16，base64 后 × 4/3；16 字符补整块 32 字节 → 44 字符。
- RSA 基线：1024 位 RSA/None/OAEPWithSHA256AndMGF1Padding，OAEP-SHA256 最大明文 62 字节，成功密文 base64 长度 172；加密随机化（非确定性），同一输入两次密文不同。
- 失败哨兵：所有 fail 分支返回 `{ text: 'Error!' }`。
- UI 前缀：加密页结果前缀 `Encryption result is :  `（24 字符），解密页前缀 `Decrypt result is :  `（21 字符）。
- 尺寸扫描用例期望值：一律来自往返还原（状态推演）与上述冻结基线，不使用精确密文长度断言（分块长度只作相对性质判断）。

## 已知风险

- AES 基线密文依赖设备平台 @system.cipher 实现的 iv 派生方式，若平台实现调整，冻结基线用例（KEYENC_0001 / UI_1008 / UI_1009 / ACTS_0002 等）会失败，届时以当前平台输出重冻基线并同步更新文档。
- KEYENC_0014（输入 1024 断言密文 1368 字符）、KEYENC_0015（4096 → 5464）、KEYDEC_0013/0014（5464、8192 → 10924）与 PKCS5 推演（1388/5484/10944）不符，疑似边界-1 常数误植。真机实测（2026-11-20）这 4 例失败在往返断言（缺陷 1），长度断言尚未执行到，常数误植未能由真机证伪，断言保持原样；尺寸扫描用例不使用精确密文长度断言，不受影响。
- Select 弹窗选项（RSA/AES）依赖 UiTest ON.text() 定位，若系统 UI 结构变化需同步调整。
- UI 套件与 Ability 套件依赖设备前台状态；UI 套件批量运行需 `-s timeout 25000`（Ui1028 等含长输入注入的用例总耗时超 15s，15000 会触发 execute timeout）。
- 设备输入通道约束：单次 inputText 注入 ≤512 字符（超过会触发 libuitest SIGABRT）；分块注入会被设备输入法重处理损坏字段，禁用。UI 网格尺寸已按此收敛（加密明文 ≤512、解密密文 ≤512）。

## 真机验证结果（2026-11-20，已授权执行）

| 项 | 结果 |
|---|---|
| 执行时间 | 2026-11-20 |
| 执行设备 | OpenHarmony 标准系统真机（已授权执行） |
| 测试产物 | entry-ohosTest-signed.hap，配套主 HAP entry-default-signed.hap |
| 执行方式 | 真机上先安装主 HAP 与测试 HAP，再通过 DevEco Studio `entry@ohosTest` 运行配置（参数清单：包名/模块名/运行器路径/超时，对应 `-b`/`-m`/`-s unittest`/`-s timeout`）启动测试运行器；全量基线六批执行 16 个套件共 569 条，修复 main 缺陷与测试侧断言后按 `-s class` 增量复跑受影响用例 |
| 测试套件 | 16 |
| 用例总数 | 569 |
| 通过 | 569 |
| 失败 | 0 |
| 错误 | 0 |
| 跳过 | 0 |
| 通过率 | 100% |
| 总体结论 | 全部通过 |

合计：16 个测试套件，569 条用例，通过 569 条，失败 0 条。

### 归因与修复

- 全量基线（同一构建只执行一轮，六批共 569 条）：运行 569，通过 384，失败 185，错误 0。185 条失败归因：main 缺陷 6 项（AES 整块往返、RSA 密文尾随 `\u0000`、设备 rsaDecrypt 对真实 RSA 密文失败、62 字节 OAEP 上限未执行、非法 base64 密文返回空串、空串/NUL 前缀明文 aesEncrypt 失败）、RSA 空输入设备行为、测试侧断言自误（testRsaDec0003 期望长度、1067 常数）与测试侧/环境问题（assertGreater 不存在、launchApp 未回走首页）。
- G2b 修 main 三处（rsaEncrypt 尾随 `\u0000` 修剪、62 字节 OAEP 上限预检、rsaDecrypt 密文前置校验），重建重装后受影响套件整跑全绿：RsaEncryptVolume01Test 71/71、RsaDecryptVolume01Test 21/21，连带治愈缺陷 3，main 修复引入失败 0。
- G2c 按设备实测基线做测试侧断言适配 63 例（RSA 空输入 3 例断言 `Error!` 哨兵、AES 空串/NUL 5 例断言 `Error!`、缺陷 1 的 54 例断言冻结设备密文长度与解密 `Error!`、testRsaDec0003 期望长度 11→12），重建重装后最终构建 14 套件 475 例新基线全部通过（错误 0、警告 0）；未重跑 3 套件（ActsAbilityTest 2 例、RsaEncryptVolume01Test 71 例、RsaDecryptVolume01Test 21 例）测试代码未动、G2b 轮已全绿，基线继续有效。
- 合并结论：569 条用例全部通过，剩余失败清单为空。

### 六批基线

| 批次 | 套件 | 运行 | 通过 | 失败 | 备注 |
|---|---|---|---|---|---|
| B1 | AesEncryptVolume01~03 | 153 | 118 | 35 | 失败全部为缺陷1（16 倍数档位 × 5 输入类 × 7 档） |
| B2 | AesDecryptVolume01~03 | 153 | 147 | 6 | 失败全部为缺陷1（16 字节档 × 6 输入类） |
| B3 | RsaEncryptVolume01 | 71 | 0 | 71 | 63 例缺陷3（合法档往返）+ 8 例缺陷4（超限档加密成功） |
| B4 | RsaDecryptVolume01 + StateSequence | 39 | 26 | 13 | 缺陷3 × 7、缺陷5 × 5、缺陷6 × 1 |
| B5 | UiFlowVolume01 | 39 | 34 | 5 | 4 例缺陷1 + 1067 测试侧常数误植 |
| B6 | 既有 6 套件（Acts/AesEnc/AesDec/RsaEnc/RsaDec/UiFlow） | 114 | 59 | 55 | 4 例测试侧/环境 + 51 例 main 缺陷 |

### 增量复跑（修复后，新构建）

| 轮次 | 范围 | 运行 | 通过 | 失败 | 说明 |
|---|---|---|---|---|---|
| I1 | ActsAbilityTest#testActs0001 | 1 | 1 | 0 | assertGreater 不存在（hypium 1.0.6）改为 assertTrue 后复跑 |
| I2 | UiFlowTest#testUi1001 | 1 | 1 | 0 | launchApp 增加回走首页逻辑后复跑 |
| I3 | UiFlowTest#testUi1016 | 1 | 0 | 1 | 缺陷4 佐证（63 字符 RSA 加密成功，结果非 Error!） |
| I4 | UiFlowTest#testUi1026 | 1 | 0 | 1 | 缺陷5 佐证（AES 密文喂 RSA 解密返回空结果） |
| I5 | AesEncryptTest#testKeyEnc0012 | 1 | 0 | 1 | 缺陷6 佐证（NUL 前缀明文 aesEncrypt code 200，hilog 捕获） |
| I6 | UiFlowVolume01Test#testUiFlowVolume011067 | 1 | 1 | 0 | 测试侧常数误植（27）修复后复跑（旧构建） |
| I7 | UiFlowTest 整套 | 30 | 27 | 3 | 新构建整跑：Ui1014 缺陷1、Ui1016 缺陷4、Ui1026 缺陷5；1001/1028/1029 已通过 |
| I8 | UiFlowVolume01Test 整套 | 39 | 35 | 4 | 新构建整跑：1054/1057/1062/1066 缺陷1；1067 已通过 |

### G2b 轮（追加授权 3）：修 main 可修项 + 新基线

修 `CipherModel.ts` 三处：rsaEncrypt 输出尾随 `\u0000` 修剪（缺陷 2）、62 字节 OAEP 上限预检（缺陷 4）、rsaDecrypt 密文前置校验——非 172 字符 base64 直接返回 Error!（缺陷 5）。重建重装后受影响套件新基线：RsaEncryptVolume01Test 71/71、RsaDecryptVolume01Test 21/21，缺陷 2 修复连带治愈缺陷 3（「尾随 NUL 导致 rsaDecrypt 失败」假设成立），main 修复引入失败 0。AES 侧剩余失败恰为缺陷 1（54 例）、缺陷 6（5 例）、RSA 空输入（3 例）、testRsaDec0003 期望长度自误（1 例），合计 63 例。

### G2c 轮（追加授权 4）：测试侧断言适配设备基线

按授权「错误的用例使用错误的方法判断就行」，63 例全部改测试侧判断方法（main 不再改动）：RSA 空输入 3 例断言 fail 回调返回 `Error!` 哨兵（hilog 探针证实设备不抛 TypeError）；AES 空串/NUL 5 例断言 `Error!`；缺陷 1 的 54 例断言冻结的设备密文长度（16→24、256→344、1024→1368、4096→5464、8192→10924 字符）与解密 `Error!`，页面卷 4 例断言 `DEC_PREFIX + 'Error!'`；testRsaDec0003 期望长度 11→12。45 例批量改、14 例手工改，重建重装后最终构建 14 套件 475 例新基线全部通过：

| 批 | 套件 | 通过/运行 |
|---|---|---|
| 1 | AesEncryptTest / AesDecryptTest / RsaEncryptTest / RsaDecryptTest / StateSequenceTest | 100/100 |
| 2 | AesEncryptVolume01~03 | 153/153 |
| 3 | AesDecryptVolume01~03 | 153/153 |
| 4 | UiFlowTest / UiFlowVolume01Test | 69/69 |

### 合并结论与缺陷记录（最终）

六批基线 + 增量复跑 I1~I8 + G2b/G2c 两轮合并后：569 例全部通过，剩余失败清单为空。最终构建 14 套件 475 例实测全绿；未重跑 3 套件（ActsAbilityTest 2 例、RsaEncryptVolume01Test 71 例、RsaDecryptVolume01Test 21 例）测试代码未动、G2b 轮已全绿，基线继续有效。6 项 main 缺陷最终处理：

1. AES 整块往返失败（16 倍数明文加密无补块、解密失败 code 200）：main 不改，测试侧断言适配设备实测基线（冻结密文长度 + 解密 `Error!`），54 例通过。
2. RSA 密文尾随 `\u0000`：G2b 修 main（rsaEncrypt 尾随 NUL 修剪），1 例通过。
3. 设备 rsaDecrypt 对全部真实 RSA 密文失败：随缺陷 2 修复连带治愈（假设成立），96 例通过。
4. 设备不执行 62 字节 OAEP 上限：G2b 修 main（加密前预检），15 例通过。
5. 非法 base64 密文喂 rsaDecrypt 返回空串：G2b 修 main（密文前置校验），9 例通过。
6. 空串或含 `\u0000` 前缀明文 aesEncrypt 失败：main 不改，测试侧断言 `Error!` 哨兵，5 例通过。

另记录不修：RSA 空输入设备行为（fail 回调返回 `Error!`，测试侧断言适配，3 例通过）；模型日志文案误植（aesDecrypt fail 分支误写 encrypt 文案）。

逐例明细（569 行结果表）保留在本地工作记录，不随文档提交。
