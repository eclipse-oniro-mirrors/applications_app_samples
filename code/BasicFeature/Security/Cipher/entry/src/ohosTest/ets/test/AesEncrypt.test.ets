/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// AES 加密主题（逻辑层）：固定密钥 AES/CBC/PKCS5Padding，iv 取自密钥（确定性输出）。
// 期望值来源：spec 常量（冻结基线 'a' -> ZtJpi1Z5BwPPXqXYRHGthQ==）+ 状态推演（往返/确定性/长度）。
import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import Logger from '../../../main/ets/model/Logger';
import { CipherModel } from '../../../main/ets/model/CipherModel';
import { aesEncryptAsync, aesDecryptAsync, rsaDecryptAsync, CipherText } from '../utils/CipherAsync';

const TAG: string = '[Sample_Cipher]';
const AES_BASELINE: string = 'ZtJpi1Z5BwPPXqXYRHGthQ==';

export default function aesEncryptTest() {
  describe('AesEncryptTest', () => {
    let subject: CipherModel = new CipherModel();

    beforeEach(() => {
      subject = new CipherModel();
    });

    afterEach(() => {
      subject = new CipherModel();
    });

    /**
     * @tc.number SUB_CIPHER_KEYENC_0001
     * @tc.name testKeyEnc0001
     * @tc.desc 合法值：规格基线输入 'a' 的密文等于冻结基线且长度 24
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testKeyEnc0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      Logger.info(TAG, 'testKeyEnc0001 begin');
      const input: string = 'a';
      const cipherText: CipherText = await aesEncryptAsync(subject, input);
      Logger.info(TAG, `cipherText=${cipherText.text}`);
      expect(cipherText.text).assertEqual(AES_BASELINE);
      expect(cipherText.text.length).assertEqual(24);
      expect(cipherText.text === input).assertFalse();
      Logger.info(TAG, 'testKeyEnc0001 end');
    });

    /**
     * @tc.number SUB_CIPHER_KEYENC_0002
     * @tc.name testKeyEnc0002
     * @tc.desc 合法值：普通英文句加密后可用 AES 解密还原且密文异于明文
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testKeyEnc0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      Logger.info(TAG, 'testKeyEnc0002 begin');
      const message: string = 'hello world';
      const encrypted: CipherText = await aesEncryptAsync(subject, message);
      const restored: CipherText = await aesDecryptAsync(subject, encrypted.text);
      expect(restored.text).assertEqual(message);
      expect(restored.text.length).assertEqual(message.length);
      expect(encrypted.text === message).assertFalse();
      Logger.info(TAG, 'testKeyEnc0002 end');
    });

    /**
     * @tc.number SUB_CIPHER_KEYENC_0003
     * @tc.name testKeyEnc0003
     * @tc.desc 合法值：中文多字节输入加密后密文 16 字节块且能还原
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testKeyEnc0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      Logger.info(TAG, 'testKeyEnc0003 begin');
      const plain: string = '中文内容';
      const encoded: CipherText = await aesEncryptAsync(subject, plain);
      const decoded: CipherText = await aesDecryptAsync(subject, encoded.text);
      expect(decoded.text).assertEqual(plain);
      expect(encoded.text.length).assertEqual(24);
      expect(decoded.text !== 'Error!').assertTrue();
      Logger.info(TAG, 'testKeyEnc0003 end');
    });

    /**
     * @tc.number SUB_CIPHER_KEYENC_0004
     * @tc.name testKeyEnc0004
     * @tc.desc 合法值：特殊字符串加密后为 32 字节块且往返还原
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testKeyEnc0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      Logger.info(TAG, 'testKeyEnc0004 begin');
      const raw: string = '!@#$%^&*()_+={}[]|:;"<>,.?';
      const sealed: CipherText = await aesEncryptAsync(subject, raw);
      const opened: CipherText = await aesDecryptAsync(subject, sealed.text);
      expect(opened.text).assertEqual(raw);
      expect(sealed.text !== raw).assertTrue();
      expect(sealed.text.length).assertEqual(44);
      Logger.info(TAG, 'testKeyEnc0004 end');
    });

    /**
     * @tc.number SUB_CIPHER_KEYENC_0005
     * @tc.name testKeyEnc0005
     * @tc.desc 边界值：空串加密走 fail 分支返回 Error! 且解密结果一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyEnc0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      Logger.info(TAG, 'testKeyEnc0005 begin');
      const emptyInput: string = '';
      const emptyCipher: CipherText = await aesEncryptAsync(subject, emptyInput);
      const emptyRestore: CipherText = await aesDecryptAsync(subject, emptyCipher.text);
      expect(emptyCipher.text).assertEqual('Error!');
      expect(emptyCipher.text.length).assertEqual(6);
      expect(emptyRestore.text).assertEqual('Error!');
      Logger.info(TAG, 'testKeyEnc0005 end');
    });

    /**
     * @tc.number SUB_CIPHER_KEYENC_0006
     * @tc.name testKeyEnc0006
     * @tc.desc 边界值：单字符输入两次加密输出相同（确定性）且长度 24
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyEnc0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      Logger.info(TAG, 'testKeyEnc0006 begin');
      const single: string = 'A';
      const singleCipher: CipherText = await aesEncryptAsync(subject, single);
      const twiceCipher: CipherText = await aesEncryptAsync(subject, single);
      expect(singleCipher.text).assertEqual(twiceCipher.text);
      expect(singleCipher.text.length).assertEqual(24);
      expect(singleCipher.text === single).assertFalse();
      Logger.info(TAG, 'testKeyEnc0006 end');
    });

    /**
     * @tc.number SUB_CIPHER_KEYENC_0007
     * @tc.name testKeyEnc0007
     * @tc.desc 边界值：15 字符（分块下界-1）加密后仍为 16 字节块
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyEnc0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      Logger.info(TAG, 'testKeyEnc0007 begin');
      const belowBlock: string = 'abcdefghijklmno';
      const packed: CipherText = await aesEncryptAsync(subject, belowBlock);
      expect(packed.text.length).assertEqual(24);
      const unpacked: CipherText = await aesDecryptAsync(subject, packed.text);
      expect(unpacked.text).assertEqual(belowBlock);
      expect(packed.text !== belowBlock).assertTrue();
      Logger.info(TAG, 'testKeyEnc0007 end');
    });

    /**
     * @tc.number SUB_CIPHER_KEYENC_0008
     * @tc.name testKeyEnc0008
     * @tc.desc 边界值：16 字符（整块）加密为 24 字符密文（设备无补块）且解密返回 Error!
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyEnc0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      Logger.info(TAG, 'testKeyEnc0008 begin');
      const exactBlock: string = 'abcdefghijklmnop';
      const blockCipher: CipherText = await aesEncryptAsync(subject, exactBlock);
      expect(blockCipher.text.length).assertEqual(24);
      expect(blockCipher.text === exactBlock).assertFalse();
      const blockPlain: CipherText = await aesDecryptAsync(subject, blockCipher.text);
      expect(blockPlain.text).assertEqual('Error!');
      Logger.info(TAG, 'testKeyEnc0008 end');
    });

    /**
     * @tc.number SUB_CIPHER_KEYENC_0009
     * @tc.name testKeyEnc0009
     * @tc.desc 边界值：17 字符（分块上界+1）加密后为 32 字节块且往返还原
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyEnc0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      Logger.info(TAG, 'testKeyEnc0009 begin');
      const aboveBlock: string = 'abcdefghijklmnopq';
      const padded: CipherText = await aesEncryptAsync(subject, aboveBlock);
      const depadded: CipherText = await aesDecryptAsync(subject, padded.text);
      expect(depadded.text).assertEqual(aboveBlock);
      expect(depadded.text.length).assertEqual(17);
      expect(padded.text.length).assertEqual(44);
      Logger.info(TAG, 'testKeyEnc0009 end');
    });

    /**
     * @tc.number SUB_CIPHER_KEYENC_0010
     * @tc.name testKeyEnc0010
     * @tc.desc 非法值：纯空白串不抛异常、加密后按原样还原
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyEnc0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      Logger.info(TAG, 'testKeyEnc0010 begin');
      const blanks: string = '   ';
      const blankCipher: CipherText = await aesEncryptAsync(subject, blanks);
      const blankPlain: CipherText = await aesDecryptAsync(subject, blankCipher.text);
      expect(blankPlain.text).assertEqual(blanks);
      expect(blankPlain.text.length).assertEqual(3);
      expect(blankCipher.text !== blanks).assertTrue();
      Logger.info(TAG, 'testKeyEnc0010 end');
    });

    /**
     * @tc.number SUB_CIPHER_KEYENC_0011
     * @tc.name testKeyEnc0011
     * @tc.desc 非法值：含换行制表符的串不抛异常、密文 16 字节块且还原
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyEnc0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      Logger.info(TAG, 'testKeyEnc0011 begin');
      const multiLine: string = 'line1\nline2\tend';
      const lineCipher: CipherText = await aesEncryptAsync(subject, multiLine);
      const linePlain: CipherText = await aesDecryptAsync(subject, lineCipher.text);
      expect(linePlain.text).assertEqual(multiLine);
      expect(lineCipher.text.length).assertEqual(24);
      expect(linePlain.text === 'Error!').assertFalse();
      Logger.info(TAG, 'testKeyEnc0011 end');
    });

    /**
     * @tc.number SUB_CIPHER_KEYENC_0012
     * @tc.name testKeyEnc0012
     * @tc.desc 非法值：控制字符串加密走 fail 分支返回 Error!
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyEnc0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      Logger.info(TAG, 'testKeyEnc0012 begin');
      const controls: string = '\u0000\u0001\u0002\u0003';
      const ctrlCipher: CipherText = await aesEncryptAsync(subject, controls);
      const ctrlPlain: CipherText = await aesDecryptAsync(subject, ctrlCipher.text);
      expect(ctrlCipher.text).assertEqual('Error!');
      expect(ctrlCipher.text.length).assertEqual(6);
      expect(ctrlPlain.text).assertEqual('Error!');
      Logger.info(TAG, 'testKeyEnc0012 end');
    });

    /**
     * @tc.number SUB_CIPHER_KEYENC_0013
     * @tc.name testKeyEnc0013
     * @tc.desc 极值：256 字符加密为 344 字符密文（设备无补块）且解密返回 Error!
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyEnc0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testKeyEnc0013 begin');
      const longPlain: string = 'x'.repeat(256);
      const longCipher: CipherText = await aesEncryptAsync(subject, longPlain);
      const longRestore: CipherText = await aesDecryptAsync(subject, longCipher.text);
      expect(longCipher.text.length).assertEqual(344);
      expect(longCipher.text === longPlain).assertFalse();
      expect(longRestore.text).assertEqual('Error!');
      Logger.info(TAG, 'testKeyEnc0013 end');
    });

    /**
     * @tc.number SUB_CIPHER_KEYENC_0014
     * @tc.name testKeyEnc0014
     * @tc.desc 极值：1024 字符加密后密文 1368 字符且解密返回 Error!
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyEnc0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testKeyEnc0014 begin');
      let kiloPlain: string = '';
      for (let i: number = 0; i < 1024; i++) {
        kiloPlain += 'q';
      }
      const kiloCipher: CipherText = await aesEncryptAsync(subject, kiloPlain);
      const kiloRestore: CipherText = await aesDecryptAsync(subject, kiloCipher.text);
      expect(kiloRestore.text).assertEqual('Error!');
      expect(kiloRestore.text.length).assertEqual(6);
      expect(kiloCipher.text.length).assertEqual(1368);
      Logger.info(TAG, 'testKeyEnc0014 end');
    });

    /**
     * @tc.number SUB_CIPHER_KEYENC_0015
     * @tc.name testKeyEnc0015
     * @tc.desc 极值：4096 字符加密后密文 5464 字符且解密返回 Error!
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyEnc0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testKeyEnc0015 begin');
      let bigPlain: string = '';
      for (let i: number = 0; i < 4096; i++) {
        bigPlain += 'z';
      }
      const bigCipher: CipherText = await aesEncryptAsync(subject, bigPlain);
      const bigRestore: CipherText = await aesDecryptAsync(subject, bigCipher.text);
      expect(bigRestore.text).assertEqual('Error!');
      expect(bigRestore.text.length).assertEqual(6);
      expect(bigCipher.text.length).assertEqual(5464);
      Logger.info(TAG, 'testKeyEnc0015 end');
    });

    /**
     * @tc.number SUB_CIPHER_KEYENC_0016
     * @tc.name testKeyEnc0016
     * @tc.desc 组合值：加密-解密-再加密链路中解密还原且两次加密一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyEnc0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testKeyEnc0016 begin');
      const origin: string = 'chain';
      const firstPass: CipherText = await aesEncryptAsync(subject, origin);
      const middle: CipherText = await aesDecryptAsync(subject, firstPass.text);
      const secondPass: CipherText = await aesEncryptAsync(subject, origin);
      expect(middle.text).assertEqual(origin);
      expect(firstPass.text).assertEqual(secondPass.text);
      expect(firstPass.text.length).assertEqual(24);
      Logger.info(TAG, 'testKeyEnc0016 end');
    });

    /**
     * @tc.number SUB_CIPHER_KEYENC_0017
     * @tc.name testKeyEnc0017
     * @tc.desc 组合值：不同输入的密文互不相同且等长（分块注入性）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyEnc0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testKeyEnc0017 begin');
      const alpha: CipherText = await aesEncryptAsync(subject, 'alpha');
      const beta: CipherText = await aesEncryptAsync(subject, 'beta');
      expect(alpha.text === beta.text).assertFalse();
      expect(alpha.text.length).assertEqual(beta.text.length);
      expect(alpha.text !== 'alpha').assertTrue();
      Logger.info(TAG, 'testKeyEnc0017 end');
    });

    /**
     * @tc.number SUB_CIPHER_KEYENC_0018
     * @tc.name testKeyEnc0018
     * @tc.desc 组合值：AES 密文喂给 RSA 解密失败返回 Error!
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyEnc0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testKeyEnc0018 begin');
      const crossPlain: string = 'cross';
      const aesOutput: CipherText = await aesEncryptAsync(subject, crossPlain);
      const rsaView: CipherText = await rsaDecryptAsync(subject, aesOutput.text);
      expect(rsaView.text).assertEqual('Error!');
      expect(rsaView.text.length).assertEqual(6);
      expect(rsaView.text === aesOutput.text).assertFalse();
      Logger.info(TAG, 'testKeyEnc0018 end');
    });

    /**
     * @tc.number SUB_CIPHER_KEYENC_0019
     * @tc.name testKeyEnc0019
     * @tc.desc 状态：同一输入连续三次加密输出完全一致（确定性）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyEnc0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testKeyEnc0019 begin');
      const stable: CipherText = await aesEncryptAsync(subject, 'stable');
      const rerun: CipherText = await aesEncryptAsync(subject, 'stable');
      const thirdRun: CipherText = await aesEncryptAsync(subject, 'stable');
      expect(rerun.text).assertEqual(stable.text);
      expect(thirdRun.text).assertEqual(stable.text);
      expect(stable.text !== 'stable').assertTrue();
      Logger.info(TAG, 'testKeyEnc0019 end');
    });

    /**
     * @tc.number SUB_CIPHER_KEYENC_0020
     * @tc.name testKeyEnc0020
     * @tc.desc 状态：穿插其余输入后重加密原输入输出不变（无状态残留）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyEnc0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testKeyEnc0020 begin');
      const anchor: CipherText = await aesEncryptAsync(subject, 'anchor');
      const noise: CipherText = await aesEncryptAsync(subject, 'noise');
      const anchorAgain: CipherText = await aesEncryptAsync(subject, 'anchor');
      expect(anchorAgain.text).assertEqual(anchor.text);
      expect(anchorAgain.text === noise.text).assertFalse();
      expect(anchorAgain.text.length).assertEqual(24);
      Logger.info(TAG, 'testKeyEnc0020 end');
    });

    /**
     * @tc.number SUB_CIPHER_KEYENC_0021
     * @tc.name testKeyEnc0021
     * @tc.desc 状态：大小写敏感，'a' 命中基线而 'A' 输出不同密文
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyEnc0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testKeyEnc0021 begin');
      const lower: CipherText = await aesEncryptAsync(subject, 'a');
      const upper: CipherText = await aesEncryptAsync(subject, 'A');
      expect(lower.text).assertEqual(AES_BASELINE);
      expect(lower.text === upper.text).assertFalse();
      expect(upper.text.length).assertEqual(24);
      Logger.info(TAG, 'testKeyEnc0021 end');
    });

    /**
     * @tc.number SUB_CIPHER_KEYENC_0022
     * @tc.name testKeyEnc0022
     * @tc.desc 状态：空串两次加密均返回 Error! 且解密一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyEnc0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testKeyEnc0022 begin');
      const firstEmpty: CipherText = await aesEncryptAsync(subject, '');
      const secondEmpty: CipherText = await aesEncryptAsync(subject, '');
      const emptyRestored: CipherText = await aesDecryptAsync(subject, firstEmpty.text);
      expect(secondEmpty.text).assertEqual('Error!');
      expect(secondEmpty.text).assertEqual(firstEmpty.text);
      expect(emptyRestored.text).assertEqual('Error!');
      Logger.info(TAG, 'testKeyEnc0022 end');
    });
  });
}
