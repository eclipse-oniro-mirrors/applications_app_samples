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

// RSA 解密主题（逻辑层）：1024 位私钥 RSA/None/OAEPWithSHA256AndMGF1Padding 解密。
// 期望值来源：状态推演（往返还原）+ spec 常量（非法输入 fail 分支返回 'Error!'）。
import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import Logger from '../../../main/ets/model/Logger';
import { CipherModel } from '../../../main/ets/model/CipherModel';
import { rsaEncryptAsync, rsaDecryptAsync, aesEncryptAsync, aesDecryptAsync, CipherText } from '../utils/CipherAsync';

const TAG: string = '[Sample_Cipher]';

export default function rsaDecryptTest() {
  describe('RsaDecryptTest', () => {
    let subject: CipherModel = new CipherModel();

    beforeEach(() => {
      subject = new CipherModel();
    });

    afterEach(() => {
      subject = new CipherModel();
    });

    /**
     * @tc.number SUB_CIPHER_RSADEC_0001
     * @tc.name testRsaDec0001
     * @tc.desc 合法值：英文句加密产物解密还原且异于密文
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testRsaDec0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      Logger.info(TAG, 'testRsaDec0001 begin');
      const message: string = 'hello world';
      const sealed: CipherText = await rsaEncryptAsync(subject, message);
      const opened: CipherText = await rsaDecryptAsync(subject, sealed.text);
      expect(opened.text).assertEqual(message);
      expect(opened.text.length).assertEqual(11);
      expect(opened.text === sealed.text).assertFalse();
      Logger.info(TAG, 'testRsaDec0001 end');
    });

    /**
     * @tc.number SUB_CIPHER_RSADEC_0002
     * @tc.name testRsaDec0002
     * @tc.desc 合法值：中文多字节输入往返还原且结果非失败哨兵
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testRsaDec0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      Logger.info(TAG, 'testRsaDec0002 begin');
      const plain: string = '中文内容';
      const encoded: CipherText = await rsaEncryptAsync(subject, plain);
      const decoded: CipherText = await rsaDecryptAsync(subject, encoded.text);
      expect(decoded.text).assertEqual(plain);
      expect(decoded.text !== 'Error!').assertTrue();
      expect(encoded.text.length).assertEqual(172);
      Logger.info(TAG, 'testRsaDec0002 end');
    });

    /**
     * @tc.number SUB_CIPHER_RSADEC_0003
     * @tc.name testRsaDec0003
     * @tc.desc 合法值：特殊字符往返还原且密文 172 字符
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testRsaDec0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      Logger.info(TAG, 'testRsaDec0003 begin');
      const raw: string = '!@#$%^&*()_+';
      const sealed: CipherText = await rsaEncryptAsync(subject, raw);
      const opened: CipherText = await rsaDecryptAsync(subject, sealed.text);
      expect(opened.text).assertEqual(raw);
      expect(opened.text.length).assertEqual(12);
      expect(sealed.text.length).assertEqual(172);
      Logger.info(TAG, 'testRsaDec0003 end');
    });

    /**
     * @tc.number SUB_CIPHER_RSADEC_0004
     * @tc.name testRsaDec0004
     * @tc.desc 边界值：空串加密走 fail 分支返回 Error!
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testRsaDec0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      Logger.info(TAG, 'testRsaDec0004 begin');
      const emptyInput: string = '';
      const emptyCipher: CipherText = await rsaEncryptAsync(subject, emptyInput);
      expect(emptyCipher.text).assertEqual('Error!');
      expect(emptyCipher.text.length).assertEqual(6);
      expect(emptyCipher.text === emptyInput).assertFalse();
      Logger.info(TAG, 'testRsaDec0004 end');
    });

    /**
     * @tc.number SUB_CIPHER_RSADEC_0005
     * @tc.name testRsaDec0005
     * @tc.desc 边界值：单字符密文解密还原且异于密文本身
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testRsaDec0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      Logger.info(TAG, 'testRsaDec0005 begin');
      const singleChar: string = 'A';
      const singleSealed: CipherText = await rsaEncryptAsync(subject, singleChar);
      const singleOpened: CipherText = await rsaDecryptAsync(subject, singleSealed.text);
      expect(singleOpened.text).assertEqual(singleChar);
      expect(singleOpened.text === singleSealed.text).assertFalse();
      expect(singleSealed.text.length).assertEqual(172);
      Logger.info(TAG, 'testRsaDec0005 end');
    });

    /**
     * @tc.number SUB_CIPHER_RSADEC_0006
     * @tc.name testRsaDec0006
     * @tc.desc 边界值：61 字符（上限-1）密文解密还原等长
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testRsaDec0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      Logger.info(TAG, 'testRsaDec0006 begin');
      let nearEdge: string = '';
      for (let i: number = 0; i < 61; i++) {
        nearEdge += 'q';
      }
      const nearSealed: CipherText = await rsaEncryptAsync(subject, nearEdge);
      const nearOpened: CipherText = await rsaDecryptAsync(subject, nearSealed.text);
      expect(nearOpened.text).assertEqual(nearEdge);
      expect(nearOpened.text.length).assertEqual(61);
      expect(nearSealed.text.length).assertEqual(172);
      Logger.info(TAG, 'testRsaDec0006 end');
    });

    /**
     * @tc.number SUB_CIPHER_RSADEC_0007
     * @tc.name testRsaDec0007
     * @tc.desc 边界值：62 字符（上限）密文解密还原且非失败哨兵
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testRsaDec0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      Logger.info(TAG, 'testRsaDec0007 begin');
      let atEdge: string = '';
      for (let i: number = 0; i < 62; i++) {
        atEdge += 'w';
      }
      const edgeSealed: CipherText = await rsaEncryptAsync(subject, atEdge);
      const edgeOpened: CipherText = await rsaDecryptAsync(subject, edgeSealed.text);
      expect(edgeOpened.text).assertEqual(atEdge);
      expect(edgeOpened.text !== 'Error!').assertTrue();
      expect(edgeSealed.text.length).assertEqual(172);
      Logger.info(TAG, 'testRsaDec0007 end');
    });

    /**
     * @tc.number SUB_CIPHER_RSADEC_0008
     * @tc.name testRsaDec0008
     * @tc.desc 非法值：非 base64 串解密走 fail 分支返回 Error!
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testRsaDec0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      Logger.info(TAG, 'testRsaDec0008 begin');
      const junkInput: string = 'not@base64!';
      const junkResult: CipherText = await rsaDecryptAsync(subject, junkInput);
      expect(junkResult.text).assertEqual('Error!');
      expect(junkResult.text.length).assertEqual(6);
      expect(junkResult.text === junkInput).assertFalse();
      Logger.info(TAG, 'testRsaDec0008 end');
    });

    /**
     * @tc.number SUB_CIPHER_RSADEC_0009
     * @tc.name testRsaDec0009
     * @tc.desc 非法值：截断密文（171 字符）解密失败返回 Error!
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testRsaDec0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      Logger.info(TAG, 'testRsaDec0009 begin');
      let truncated171: string = '';
      for (let i: number = 0; i < 171; i++) {
        truncated171 += 'A';
      }
      const truncResult: CipherText = await rsaDecryptAsync(subject, truncated171);
      expect(truncResult.text).assertEqual('Error!');
      expect(truncResult.text !== truncated171).assertTrue();
      expect(truncResult.text.length).assertEqual(6);
      Logger.info(TAG, 'testRsaDec0009 end');
    });

    /**
     * @tc.number SUB_CIPHER_RSADEC_0010
     * @tc.name testRsaDec0010
     * @tc.desc 非法值：中文串作为密文走 fail 分支且不抛异常
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testRsaDec0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      Logger.info(TAG, 'testRsaDec0010 begin');
      const cjkInput: string = '中文密文';
      const cjkResult: CipherText = await rsaDecryptAsync(subject, cjkInput);
      expect(cjkResult.text).assertEqual('Error!');
      expect(cjkResult.text === cjkInput).assertFalse();
      expect(cjkResult.text.length).assertEqual(6);
      Logger.info(TAG, 'testRsaDec0010 end');
    });

    /**
     * @tc.number SUB_CIPHER_RSADEC_0011
     * @tc.name testRsaDec0011
     * @tc.desc 极值：1024 字符 base64 串解密失败返回 Error!
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testRsaDec0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testRsaDec0011 begin');
      let longBase64: string = '';
      for (let i: number = 0; i < 1024; i++) {
        longBase64 += 'A';
      }
      const longResult: CipherText = await rsaDecryptAsync(subject, longBase64);
      expect(longResult.text).assertEqual('Error!');
      expect(longResult.text === longBase64).assertFalse();
      expect(longResult.text.length).assertEqual(6);
      Logger.info(TAG, 'testRsaDec0011 end');
    });

    /**
     * @tc.number SUB_CIPHER_RSADEC_0012
     * @tc.name testRsaDec0012
     * @tc.desc 极值：4096 字符 base64 串解密失败返回 Error! 且不抛异常
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testRsaDec0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testRsaDec0012 begin');
      let hugeBase64: string = '';
      for (let i: number = 0; i < 4096; i++) {
        hugeBase64 += 'B';
      }
      const hugeResult: CipherText = await rsaDecryptAsync(subject, hugeBase64);
      expect(hugeResult.text).assertEqual('Error!');
      expect(hugeResult.text !== hugeBase64).assertTrue();
      expect(hugeResult.text.length).assertEqual(6);
      Logger.info(TAG, 'testRsaDec0012 end');
    });

    /**
     * @tc.number SUB_CIPHER_RSADEC_0013
     * @tc.name testRsaDec0013
     * @tc.desc 极值：三个不同输入批量加密后逐一解密均还原
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testRsaDec0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testRsaDec0013 begin');
      const bulkOne: string = 'bulk one';
      const bulkTwo: string = 'bulk two';
      const bulkThree: string = 'bulk three';
      const sealOne: CipherText = await rsaEncryptAsync(subject, bulkOne);
      const sealTwo: CipherText = await rsaEncryptAsync(subject, bulkTwo);
      const sealThree: CipherText = await rsaEncryptAsync(subject, bulkThree);
      const openOne: CipherText = await rsaDecryptAsync(subject, sealOne.text);
      const openTwo: CipherText = await rsaDecryptAsync(subject, sealTwo.text);
      const openThree: CipherText = await rsaDecryptAsync(subject, sealThree.text);
      expect(openOne.text).assertEqual(bulkOne);
      expect(openTwo.text).assertEqual(bulkTwo);
      expect(openThree.text).assertEqual(bulkThree);
      Logger.info(TAG, 'testRsaDec0013 end');
    });

    /**
     * @tc.number SUB_CIPHER_RSADEC_0014
     * @tc.name testRsaDec0014
     * @tc.desc 组合值：AES 密文喂给 RSA 解密失败返回 Error!
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testRsaDec0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testRsaDec0014 begin');
      const crossPlain: string = 'crossing';
      const aesSealed: CipherText = await aesEncryptAsync(subject, crossPlain);
      const rsaView: CipherText = await rsaDecryptAsync(subject, aesSealed.text);
      expect(rsaView.text).assertEqual('Error!');
      expect(rsaView.text.length).assertEqual(6);
      expect(rsaView.text === aesSealed.text).assertFalse();
      Logger.info(TAG, 'testRsaDec0014 end');
    });

    /**
     * @tc.number SUB_CIPHER_RSADEC_0015
     * @tc.name testRsaDec0015
     * @tc.desc 组合值：RSA 与 AES 两条链路对同一输入均还原且密文互异
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testRsaDec0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testRsaDec0015 begin');
      const comboPlain: string = 'dual path';
      const rsaSealed: CipherText = await rsaEncryptAsync(subject, comboPlain);
      const rsaOpened: CipherText = await rsaDecryptAsync(subject, rsaSealed.text);
      const aesSealed: CipherText = await aesEncryptAsync(subject, comboPlain);
      const aesOpened: CipherText = await aesDecryptAsync(subject, aesSealed.text);
      expect(rsaOpened.text).assertEqual(comboPlain);
      expect(aesOpened.text).assertEqual(comboPlain);
      expect(rsaSealed.text === aesSealed.text).assertFalse();
      Logger.info(TAG, 'testRsaDec0015 end');
    });

    /**
     * @tc.number SUB_CIPHER_RSADEC_0016
     * @tc.name testRsaDec0016
     * @tc.desc 组合值：失败解密后正常解密还原不受影响
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testRsaDec0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testRsaDec0016 begin');
      const failInput: string = '####';
      const failResult: CipherText = await rsaDecryptAsync(subject, failInput);
      const okPlain: string = 'recover';
      const okSealed: CipherText = await rsaEncryptAsync(subject, okPlain);
      const okResult: CipherText = await rsaDecryptAsync(subject, okSealed.text);
      expect(failResult.text).assertEqual('Error!');
      expect(okResult.text).assertEqual(okPlain);
      expect(okResult.text.length).assertEqual(7);
      Logger.info(TAG, 'testRsaDec0016 end');
    });

    /**
     * @tc.number SUB_CIPHER_RSADEC_0017
     * @tc.name testRsaDec0017
     * @tc.desc 状态：同一密文两次解密结果一致且均还原
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testRsaDec0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testRsaDec0017 begin');
      const stablePlain: string = 'stable';
      const stableSealed: CipherText = await rsaEncryptAsync(subject, stablePlain);
      const firstOpen: CipherText = await rsaDecryptAsync(subject, stableSealed.text);
      const secondOpen: CipherText = await rsaDecryptAsync(subject, stableSealed.text);
      expect(firstOpen.text).assertEqual(stablePlain);
      expect(secondOpen.text).assertEqual(stablePlain);
      expect(firstOpen.text === secondOpen.text).assertTrue();
      Logger.info(TAG, 'testRsaDec0017 end');
    });

    /**
     * @tc.number SUB_CIPHER_RSADEC_0018
     * @tc.name testRsaDec0018
     * @tc.desc 状态：穿插其余解密后旧密文仍还原对应明文
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testRsaDec0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testRsaDec0018 begin');
      const keepPlain: string = 'keep';
      const keepSealed: CipherText = await rsaEncryptAsync(subject, keepPlain);
      const otherPlain: string = 'other';
      const otherSealed: CipherText = await rsaEncryptAsync(subject, otherPlain);
      const otherOpened: CipherText = await rsaDecryptAsync(subject, otherSealed.text);
      const keepOpened: CipherText = await rsaDecryptAsync(subject, keepSealed.text);
      expect(keepOpened.text).assertEqual(keepPlain);
      expect(otherOpened.text).assertEqual(otherPlain);
      expect(keepOpened.text === otherOpened.text).assertFalse();
      Logger.info(TAG, 'testRsaDec0018 end');
    });

    /**
     * @tc.number SUB_CIPHER_RSADEC_0019
     * @tc.name testRsaDec0019
     * @tc.desc 状态：首尾空白在往返中逐字保留不修剪
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testRsaDec0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testRsaDec0019 begin');
      const spacedPlain: string = ' x ';
      const spacedSealed: CipherText = await rsaEncryptAsync(subject, spacedPlain);
      const spacedOpened: CipherText = await rsaDecryptAsync(subject, spacedSealed.text);
      expect(spacedOpened.text).assertEqual(spacedPlain);
      expect(spacedOpened.text.length).assertEqual(3);
      expect(spacedOpened.text === 'x').assertFalse();
      Logger.info(TAG, 'testRsaDec0019 end');
    });

    /**
     * @tc.number SUB_CIPHER_RSADEC_0020
     * @tc.name testRsaDec0020
     * @tc.desc 状态：明文含 Error! 字样时还原原文而非失败哨兵
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testRsaDec0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testRsaDec0020 begin');
      const sentinel: string = 'Error! embedded';
      const sentinelSealed: CipherText = await rsaEncryptAsync(subject, sentinel);
      const sentinelOpened: CipherText = await rsaDecryptAsync(subject, sentinelSealed.text);
      expect(sentinelOpened.text).assertEqual(sentinel);
      expect(sentinelOpened.text === 'Error!').assertFalse();
      expect(sentinelOpened.text.length).assertEqual(15);
      Logger.info(TAG, 'testRsaDec0020 end');
    });
  });
}
