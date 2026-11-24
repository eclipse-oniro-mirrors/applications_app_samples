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

// AES 解密主题（逻辑层）：固定密钥 AES/CBC/PKCS5Padding 解密；非法输入走 fail 分支返回 'Error!'。
// 期望值来源：spec 常量（冻结基线密文 -> 'a'）+ 状态推演（往返/重复解密/失败隔离）。
import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import Logger from '../../../main/ets/model/Logger';
import { CipherModel } from '../../../main/ets/model/CipherModel';
import { aesEncryptAsync, aesDecryptAsync, rsaEncryptAsync, CipherText } from '../utils/CipherAsync';

const TAG: string = '[Sample_Cipher]';
const AES_BASELINE: string = 'ZtJpi1Z5BwPPXqXYRHGthQ==';

export default function aesDecryptTest() {
  describe('AesDecryptTest', () => {
    let subject: CipherModel = new CipherModel();

    beforeEach(() => {
      subject = new CipherModel();
    });

    afterEach(() => {
      subject = new CipherModel();
    });

    /**
     * @tc.number SUB_CIPHER_KEYDEC_0001
     * @tc.name testKeyDec0001
     * @tc.desc 合法值：冻结基线密文解密还原为 'a'
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testKeyDec0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      Logger.info(TAG, 'testKeyDec0001 begin');
      const cipherText: string = AES_BASELINE;
      const plainText: CipherText = await aesDecryptAsync(subject, cipherText);
      expect(plainText.text).assertEqual('a');
      expect(plainText.text.length).assertEqual(1);
      expect(plainText.text === cipherText).assertFalse();
      Logger.info(TAG, 'testKeyDec0001 end');
    });

    /**
     * @tc.number SUB_CIPHER_KEYDEC_0002
     * @tc.name testKeyDec0002
     * @tc.desc 合法值：英文句加密产物解密还原且密文 16 字节块
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testKeyDec0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      Logger.info(TAG, 'testKeyDec0002 begin');
      const message: string = 'hello world';
      const sealed: CipherText = await aesEncryptAsync(subject, message);
      const opened: CipherText = await aesDecryptAsync(subject, sealed.text);
      expect(opened.text).assertEqual(message);
      expect(opened.text === sealed.text).assertFalse();
      expect(sealed.text.length).assertEqual(24);
      Logger.info(TAG, 'testKeyDec0002 end');
    });

    /**
     * @tc.number SUB_CIPHER_KEYDEC_0003
     * @tc.name testKeyDec0003
     * @tc.desc 合法值：中文多字节明文往返还原且结果非失败哨兵
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testKeyDec0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      Logger.info(TAG, 'testKeyDec0003 begin');
      const plain: string = '中文内容';
      const codeText: CipherText = await aesEncryptAsync(subject, plain);
      const plainBack: CipherText = await aesDecryptAsync(subject, codeText.text);
      expect(plainBack.text).assertEqual(plain);
      expect(plainBack.text !== 'Error!').assertTrue();
      expect(codeText.text.length).assertEqual(24);
      Logger.info(TAG, 'testKeyDec0003 end');
    });

    /**
     * @tc.number SUB_CIPHER_KEYDEC_0004
     * @tc.name testKeyDec0004
     * @tc.desc 合法值：数字串加密产物解密还原且长度与密文块匹配
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testKeyDec0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      Logger.info(TAG, 'testKeyDec0004 begin');
      const numeric: string = '1234567890';
      const numericCipher: CipherText = await aesEncryptAsync(subject, numeric);
      const numericPlain: CipherText = await aesDecryptAsync(subject, numericCipher.text);
      expect(numericPlain.text).assertEqual(numeric);
      expect(numericPlain.text.length).assertEqual(10);
      expect(numericCipher.text.length).assertEqual(24);
      Logger.info(TAG, 'testKeyDec0004 end');
    });

    /**
     * @tc.number SUB_CIPHER_KEYDEC_0005
     * @tc.name testKeyDec0005
     * @tc.desc 边界值：空串加密返回 Error! 解密结果仍为 Error!
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyDec0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      Logger.info(TAG, 'testKeyDec0005 begin');
      const emptyMessage: string = '';
      const emptyCipher: CipherText = await aesEncryptAsync(subject, emptyMessage);
      const emptyPlain: CipherText = await aesDecryptAsync(subject, emptyCipher.text);
      expect(emptyCipher.text).assertEqual('Error!');
      expect(emptyCipher.text.length).assertEqual(6);
      expect(emptyPlain.text).assertEqual('Error!');
      Logger.info(TAG, 'testKeyDec0005 end');
    });

    /**
     * @tc.number SUB_CIPHER_KEYDEC_0006
     * @tc.name testKeyDec0006
     * @tc.desc 边界值：单字符密文解密还原且异于密文本身
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyDec0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      Logger.info(TAG, 'testKeyDec0006 begin');
      const singleChar: string = 'A';
      const singleCipher: CipherText = await aesEncryptAsync(subject, singleChar);
      const singlePlain: CipherText = await aesDecryptAsync(subject, singleCipher.text);
      expect(singlePlain.text).assertEqual(singleChar);
      expect(singlePlain.text === singleCipher.text).assertFalse();
      expect(singlePlain.text.length).assertEqual(1);
      Logger.info(TAG, 'testKeyDec0006 end');
    });

    /**
     * @tc.number SUB_CIPHER_KEYDEC_0007
     * @tc.name testKeyDec0007
     * @tc.desc 边界值：整块 16 字符明文加密为 24 字符密文（设备无补块）且解密返回 Error!
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyDec0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      Logger.info(TAG, 'testKeyDec0007 begin');
      const block16: string = 'abcdefghijklmnop';
      const blockCipher: CipherText = await aesEncryptAsync(subject, block16);
      const blockPlain: CipherText = await aesDecryptAsync(subject, blockCipher.text);
      expect(blockCipher.text.length).assertEqual(24);
      expect(blockPlain.text).assertEqual('Error!');
      expect(blockPlain.text.length).assertEqual(6);
      Logger.info(TAG, 'testKeyDec0007 end');
    });

    /**
     * @tc.number SUB_CIPHER_KEYDEC_0008
     * @tc.name testKeyDec0008
     * @tc.desc 边界值：63 字符明文往返还原且密文 64 字节块
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyDec0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      Logger.info(TAG, 'testKeyDec0008 begin');
      let edge63: string = '';
      for (let i: number = 0; i < 63; i++) {
        edge63 += 'e';
      }
      const edgeCipher: CipherText = await aesEncryptAsync(subject, edge63);
      const edgePlain: CipherText = await aesDecryptAsync(subject, edgeCipher.text);
      expect(edgePlain.text).assertEqual(edge63);
      expect(edgePlain.text.length).assertEqual(63);
      expect(edgeCipher.text.length).assertEqual(88);
      Logger.info(TAG, 'testKeyDec0008 end');
    });

    /**
     * @tc.number SUB_CIPHER_KEYDEC_0009
     * @tc.name testKeyDec0009
     * @tc.desc 非法值：非 base64 串解密走 fail 分支返回 Error!
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyDec0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      Logger.info(TAG, 'testKeyDec0009 begin');
      const garbage: string = 'not@base64!';
      const garbageResult: CipherText = await aesDecryptAsync(subject, garbage);
      expect(garbageResult.text).assertEqual('Error!');
      expect(garbageResult.text.length).assertEqual(6);
      expect(garbageResult.text === garbage).assertFalse();
      Logger.info(TAG, 'testKeyDec0009 end');
    });

    /**
     * @tc.number SUB_CIPHER_KEYDEC_0010
     * @tc.name testKeyDec0010
     * @tc.desc 非法值：截断的基线密文解密失败返回 Error!
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyDec0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      Logger.info(TAG, 'testKeyDec0010 begin');
      const truncated: string = 'ZtJpi1Z5BwPPXqXYRHGthQ';
      const truncatedResult: CipherText = await aesDecryptAsync(subject, truncated);
      expect(truncatedResult.text).assertEqual('Error!');
      expect(truncatedResult.text !== truncated).assertTrue();
      expect(truncatedResult.text.length).assertEqual(6);
      Logger.info(TAG, 'testKeyDec0010 end');
    });

    /**
     * @tc.number SUB_CIPHER_KEYDEC_0011
     * @tc.name testKeyDec0011
     * @tc.desc 非法值：中文串作为密文走 fail 分支且不抛异常
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyDec0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      Logger.info(TAG, 'testKeyDec0011 begin');
      const cjkGarbage: string = '中文密文';
      const cjkResult: CipherText = await aesDecryptAsync(subject, cjkGarbage);
      expect(cjkResult.text).assertEqual('Error!');
      expect(cjkResult.text === cjkGarbage).assertFalse();
      expect(cjkResult.text.length).assertEqual(6);
      Logger.info(TAG, 'testKeyDec0011 end');
    });

    /**
     * @tc.number SUB_CIPHER_KEYDEC_0012
     * @tc.name testKeyDec0012
     * @tc.desc 极值：1024 字符明文解密返回 Error! 且密文 1368 字符
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyDec0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testKeyDec0012 begin');
      let kiloText: string = '';
      for (let i: number = 0; i < 1024; i++) {
        kiloText += 'q';
      }
      const kiloSealed: CipherText = await aesEncryptAsync(subject, kiloText);
      const kiloOpened: CipherText = await aesDecryptAsync(subject, kiloSealed.text);
      expect(kiloOpened.text).assertEqual('Error!');
      expect(kiloOpened.text.length).assertEqual(6);
      expect(kiloSealed.text.length).assertEqual(1368);
      Logger.info(TAG, 'testKeyDec0012 end');
    });

    /**
     * @tc.number SUB_CIPHER_KEYDEC_0013
     * @tc.name testKeyDec0013
     * @tc.desc 极值：4096 字符明文解密返回 Error! 且密文 5464 字符
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyDec0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testKeyDec0013 begin');
      let hugeText: string = '';
      for (let i: number = 0; i < 4096; i++) {
        hugeText += 'h';
      }
      const hugeSealed: CipherText = await aesEncryptAsync(subject, hugeText);
      const hugeOpened: CipherText = await aesDecryptAsync(subject, hugeSealed.text);
      expect(hugeOpened.text).assertEqual('Error!');
      expect(hugeOpened.text.length).assertEqual(6);
      expect(hugeSealed.text.length).assertEqual(5464);
      Logger.info(TAG, 'testKeyDec0013 end');
    });

    /**
     * @tc.number SUB_CIPHER_KEYDEC_0014
     * @tc.name testKeyDec0014
     * @tc.desc 极值：8192 字符明文解密返回 Error! 且密文 10924 字符
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyDec0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testKeyDec0014 begin');
      let maxText: string = '';
      for (let i: number = 0; i < 8192; i++) {
        maxText += 'm';
      }
      const maxSealed: CipherText = await aesEncryptAsync(subject, maxText);
      const maxOpened: CipherText = await aesDecryptAsync(subject, maxSealed.text);
      expect(maxOpened.text).assertEqual('Error!');
      expect(maxOpened.text.length).assertEqual(6);
      expect(maxSealed.text.length).assertEqual(10924);
      Logger.info(TAG, 'testKeyDec0014 end');
    });

    /**
     * @tc.number SUB_CIPHER_KEYDEC_0015
     * @tc.name testKeyDec0015
     * @tc.desc 组合值：RSA 密文喂给 AES 解密失败返回 Error!
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyDec0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testKeyDec0015 begin');
      const rsaSource: string = 'combo';
      const rsaSealed: CipherText = await rsaEncryptAsync(subject, rsaSource);
      const aesView: CipherText = await aesDecryptAsync(subject, rsaSealed.text);
      expect(aesView.text).assertEqual('Error!');
      expect(aesView.text.length).assertEqual(6);
      expect(aesView.text === rsaSealed.text).assertFalse();
      Logger.info(TAG, 'testKeyDec0015 end');
    });

    /**
     * @tc.number SUB_CIPHER_KEYDEC_0016
     * @tc.name testKeyDec0016
     * @tc.desc 组合值：先解其余密文再解原密文结果不变（无状态残留）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyDec0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testKeyDec0016 begin');
      const keepMsg: string = 'keep';
      const keepCipher: CipherText = await aesEncryptAsync(subject, keepMsg);
      const otherMsg: string = 'other';
      const otherCipher: CipherText = await aesEncryptAsync(subject, otherMsg);
      const otherPlain: CipherText = await aesDecryptAsync(subject, otherCipher.text);
      const keepPlain: CipherText = await aesDecryptAsync(subject, keepCipher.text);
      expect(keepPlain.text).assertEqual(keepMsg);
      expect(otherPlain.text).assertEqual(otherMsg);
      expect(keepPlain.text === otherPlain.text).assertFalse();
      Logger.info(TAG, 'testKeyDec0016 end');
    });

    /**
     * @tc.number SUB_CIPHER_KEYDEC_0017
     * @tc.name testKeyDec0017
     * @tc.desc 状态：同一密文连续解密两次输出一致且命中基线
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyDec0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testKeyDec0017 begin');
      const frozenCipher: string = AES_BASELINE;
      const oncePlain: CipherText = await aesDecryptAsync(subject, frozenCipher);
      const twicePlain: CipherText = await aesDecryptAsync(subject, frozenCipher);
      expect(oncePlain.text).assertEqual(twicePlain.text);
      expect(oncePlain.text).assertEqual('a');
      expect(oncePlain.text.length).assertEqual(1);
      Logger.info(TAG, 'testKeyDec0017 end');
    });

    /**
     * @tc.number SUB_CIPHER_KEYDEC_0018
     * @tc.name testKeyDec0018
     * @tc.desc 状态：失败解密后紧接着成功解密不受污染
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyDec0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testKeyDec0018 begin');
      const brokenInput: string = '#####';
      const brokenResult: CipherText = await aesDecryptAsync(subject, brokenInput);
      const goodCipher: string = AES_BASELINE;
      const goodResult: CipherText = await aesDecryptAsync(subject, goodCipher);
      expect(brokenResult.text).assertEqual('Error!');
      expect(goodResult.text).assertEqual('a');
      expect(goodResult.text === brokenResult.text).assertFalse();
      Logger.info(TAG, 'testKeyDec0018 end');
    });

    /**
     * @tc.number SUB_CIPHER_KEYDEC_0019
     * @tc.name testKeyDec0019
     * @tc.desc 状态：首尾空白在往返中逐字保留不修剪
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyDec0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testKeyDec0019 begin');
      const spaced: string = ' x ';
      const spacedCipher: CipherText = await aesEncryptAsync(subject, spaced);
      const spacedPlain: CipherText = await aesDecryptAsync(subject, spacedCipher.text);
      expect(spacedPlain.text).assertEqual(spaced);
      expect(spacedPlain.text.length).assertEqual(3);
      expect(spacedPlain.text === 'x').assertFalse();
      Logger.info(TAG, 'testKeyDec0019 end');
    });

    /**
     * @tc.number SUB_CIPHER_KEYDEC_0020
     * @tc.name testKeyDec0020
     * @tc.desc 状态：明文含 Error! 字样时还原原文而非失败哨兵
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyDec0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testKeyDec0020 begin');
      const sentinelPlain: string = 'Error! embedded';
      const sentinelCipher: CipherText = await aesEncryptAsync(subject, sentinelPlain);
      const sentinelResult: CipherText = await aesDecryptAsync(subject, sentinelCipher.text);
      expect(sentinelResult.text).assertEqual(sentinelPlain);
      expect(sentinelResult.text === 'Error!').assertFalse();
      expect(sentinelResult.text.length).assertEqual(15);
      Logger.info(TAG, 'testKeyDec0020 end');
    });
  });
}
