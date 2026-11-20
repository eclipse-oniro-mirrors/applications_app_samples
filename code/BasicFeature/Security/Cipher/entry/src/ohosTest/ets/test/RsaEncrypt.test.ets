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

// RSA 加密主题（逻辑层）：1024 位密钥 RSA/None/OAEPWithSHA256AndMGF1Padding。
// 规格：输出密文恒为 128 字节（base64 172 字符）；单次加密明文上限 62 字节（超限走 fail 返回 'Error!'）；
// OAEP 随机化使同一输入两次加密输出不同。
import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import Logger from '../../../main/ets/model/Logger';
import { CipherModel } from '../../../main/ets/model/CipherModel';
import { rsaEncryptAsync, rsaDecryptAsync, aesEncryptAsync, aesDecryptAsync, CipherText } from '../utils/CipherAsync';

const TAG: string = '[Sample_Cipher]';

export default function rsaEncryptTest() {
  describe('RsaEncryptTest', () => {
    let subject: CipherModel = new CipherModel();

    beforeEach(() => {
      subject = new CipherModel();
    });

    afterEach(() => {
      subject = new CipherModel();
    });

    /**
     * @tc.number SUB_CIPHER_RSAENC_0001
     * @tc.name testRsaEnc0001
     * @tc.desc 合法值：英文句加密后密文 172 字符且可解密还原
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testRsaEnc0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      Logger.info(TAG, 'testRsaEnc0001 begin');
      const input: string = 'hello world';
      const cipherText: CipherText = await rsaEncryptAsync(subject, input);
      const restored: CipherText = await rsaDecryptAsync(subject, cipherText.text);
      expect(restored.text).assertEqual(input);
      expect(cipherText.text.length).assertEqual(172);
      expect(cipherText.text === input).assertFalse();
      Logger.info(TAG, 'testRsaEnc0001 end');
    });

    /**
     * @tc.number SUB_CIPHER_RSAENC_0002
     * @tc.name testRsaEnc0002
     * @tc.desc 合法值：中文多字节输入加密还原且结果非失败哨兵
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testRsaEnc0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      Logger.info(TAG, 'testRsaEnc0002 begin');
      const plain: string = '中文内容';
      const encoded: CipherText = await rsaEncryptAsync(subject, plain);
      const decoded: CipherText = await rsaDecryptAsync(subject, encoded.text);
      expect(decoded.text).assertEqual(plain);
      expect(encoded.text.length).assertEqual(172);
      expect(decoded.text !== 'Error!').assertTrue();
      Logger.info(TAG, 'testRsaEnc0002 end');
    });

    /**
     * @tc.number SUB_CIPHER_RSAENC_0003
     * @tc.name testRsaEnc0003
     * @tc.desc 合法值：特殊字符加密还原且密文异于明文
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testRsaEnc0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      Logger.info(TAG, 'testRsaEnc0003 begin');
      const raw: string = '!@#$%^&*()_+';
      const sealed: CipherText = await rsaEncryptAsync(subject, raw);
      const opened: CipherText = await rsaDecryptAsync(subject, sealed.text);
      expect(opened.text).assertEqual(raw);
      expect(sealed.text !== raw).assertTrue();
      expect(sealed.text.length).assertEqual(172);
      Logger.info(TAG, 'testRsaEnc0003 end');
    });

    /**
     * @tc.number SUB_CIPHER_RSAENC_0004
     * @tc.name testRsaEnc0004
     * @tc.desc 边界值：空串加密走 fail 分支返回 Error!
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testRsaEnc0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      Logger.info(TAG, 'testRsaEnc0004 begin');
      const emptyInput: string = '';
      const emptyCipher: CipherText = await rsaEncryptAsync(subject, emptyInput);
      expect(emptyCipher.text).assertEqual('Error!');
      expect(emptyCipher.text.length).assertEqual(6);
      expect(emptyCipher.text === emptyInput).assertFalse();
      Logger.info(TAG, 'testRsaEnc0004 end');
    });

    /**
     * @tc.number SUB_CIPHER_RSAENC_0005
     * @tc.name testRsaEnc0005
     * @tc.desc 边界值：61 字符（上限-1）加密成功且还原等长
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testRsaEnc0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      Logger.info(TAG, 'testRsaEnc0005 begin');
      let nearMax: string = '';
      for (let i: number = 0; i < 61; i++) {
        nearMax += 'n';
      }
      const nearCipher: CipherText = await rsaEncryptAsync(subject, nearMax);
      const nearPlain: CipherText = await rsaDecryptAsync(subject, nearCipher.text);
      expect(nearPlain.text).assertEqual(nearMax);
      expect(nearPlain.text.length).assertEqual(61);
      expect(nearCipher.text.length).assertEqual(172);
      Logger.info(TAG, 'testRsaEnc0005 end');
    });

    /**
     * @tc.number SUB_CIPHER_RSAENC_0006
     * @tc.name testRsaEnc0006
     * @tc.desc 边界值：62 字符（上限）加密成功且结果非失败哨兵
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testRsaEnc0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      Logger.info(TAG, 'testRsaEnc0006 begin');
      let atMax: string = '';
      for (let i: number = 0; i < 62; i++) {
        atMax += 'm';
      }
      const maxCipher: CipherText = await rsaEncryptAsync(subject, atMax);
      const maxPlain: CipherText = await rsaDecryptAsync(subject, maxCipher.text);
      expect(maxPlain.text).assertEqual(atMax);
      expect(maxPlain.text !== 'Error!').assertTrue();
      expect(maxCipher.text.length).assertEqual(172);
      Logger.info(TAG, 'testRsaEnc0006 end');
    });

    /**
     * @tc.number SUB_CIPHER_RSAENC_0007
     * @tc.name testRsaEnc0007
     * @tc.desc 边界值：63 字符（上限+1）走 fail 分支返回 Error!
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testRsaEnc0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      Logger.info(TAG, 'testRsaEnc0007 begin');
      let overMax: string = '';
      for (let i: number = 0; i < 63; i++) {
        overMax += 'o';
      }
      const overCipher: CipherText = await rsaEncryptAsync(subject, overMax);
      expect(overCipher.text).assertEqual('Error!');
      expect(overCipher.text.length).assertEqual(6);
      expect(overCipher.text === overMax).assertFalse();
      Logger.info(TAG, 'testRsaEnc0007 end');
    });

    /**
     * @tc.number SUB_CIPHER_RSAENC_0008
     * @tc.name testRsaEnc0008
     * @tc.desc 非法值：64 字符输入加密失败返回 Error!
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testRsaEnc0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      Logger.info(TAG, 'testRsaEnc0008 begin');
      let over64: string = '';
      for (let i: number = 0; i < 64; i++) {
        over64 += 'p';
      }
      const over64Result: CipherText = await rsaEncryptAsync(subject, over64);
      expect(over64Result.text).assertEqual('Error!');
      expect(over64Result.text !== over64).assertTrue();
      expect(over64Result.text.length).assertEqual(6);
      Logger.info(TAG, 'testRsaEnc0008 end');
    });

    /**
     * @tc.number SUB_CIPHER_RSAENC_0009
     * @tc.name testRsaEnc0009
     * @tc.desc 非法值：100 字符输入加密失败返回 Error! 且不抛异常
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testRsaEnc0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      Logger.info(TAG, 'testRsaEnc0009 begin');
      let hundredText: string = '';
      for (let i: number = 0; i < 100; i++) {
        hundredText += 'h';
      }
      const hundredResult: CipherText = await rsaEncryptAsync(subject, hundredText);
      expect(hundredResult.text).assertEqual('Error!');
      expect(hundredResult.text.length).assertEqual(6);
      expect(hundredResult.text !== hundredText).assertTrue();
      Logger.info(TAG, 'testRsaEnc0009 end');
    });

    /**
     * @tc.number SUB_CIPHER_RSAENC_0010
     * @tc.name testRsaEnc0010
     * @tc.desc 非法值：4096 字符长输入加密失败返回 Error!
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testRsaEnc0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      Logger.info(TAG, 'testRsaEnc0010 begin');
      let hugeInput: string = '';
      for (let i: number = 0; i < 4096; i++) {
        hugeInput += 'z';
      }
      const hugeResult: CipherText = await rsaEncryptAsync(subject, hugeInput);
      expect(hugeResult.text).assertEqual('Error!');
      expect(hugeResult.text === hugeInput).assertFalse();
      expect(hugeResult.text.length).assertEqual(6);
      Logger.info(TAG, 'testRsaEnc0010 end');
    });

    /**
     * @tc.number SUB_CIPHER_RSAENC_0011
     * @tc.name testRsaEnc0011
     * @tc.desc 极值：最小非空输入 1 字符加密还原且密文 172 字符
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testRsaEnc0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testRsaEnc0011 begin');
      const minInput: string = 'A';
      const minCipher: CipherText = await rsaEncryptAsync(subject, minInput);
      const minPlain: CipherText = await rsaDecryptAsync(subject, minCipher.text);
      expect(minPlain.text).assertEqual(minInput);
      expect(minCipher.text.length).assertEqual(172);
      expect(minCipher.text !== minInput).assertTrue();
      Logger.info(TAG, 'testRsaEnc0011 end');
    });

    /**
     * @tc.number SUB_CIPHER_RSAENC_0012
     * @tc.name testRsaEnc0012
     * @tc.desc 极值：最大合法长度 62 字符加密还原且长度逐字保留
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testRsaEnc0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testRsaEnc0012 begin');
      let fullInput: string = '';
      for (let i: number = 0; i < 62; i++) {
        fullInput += 'f';
      }
      const fullCipher: CipherText = await rsaEncryptAsync(subject, fullInput);
      const fullPlain: CipherText = await rsaDecryptAsync(subject, fullCipher.text);
      expect(fullPlain.text).assertEqual(fullInput);
      expect(fullCipher.text.length).assertEqual(172);
      expect(fullPlain.text.length).assertEqual(62);
      Logger.info(TAG, 'testRsaEnc0012 end');
    });

    /**
     * @tc.number SUB_CIPHER_RSAENC_0013
     * @tc.name testRsaEnc0013
     * @tc.desc 极值：超长失败后系统恢复，正常加密不受影响
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testRsaEnc0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testRsaEnc0013 begin');
      let bombInput: string = '';
      for (let i: number = 0; i < 4096; i++) {
        bombInput += 'b';
      }
      const bombResult: CipherText = await rsaEncryptAsync(subject, bombInput);
      const fineInput: string = 'fine';
      const fineCipher: CipherText = await rsaEncryptAsync(subject, fineInput);
      const finePlain: CipherText = await rsaDecryptAsync(subject, fineCipher.text);
      expect(bombResult.text).assertEqual('Error!');
      expect(finePlain.text).assertEqual(fineInput);
      expect(fineCipher.text.length).assertEqual(172);
      Logger.info(TAG, 'testRsaEnc0013 end');
    });

    /**
     * @tc.number SUB_CIPHER_RSAENC_0014
     * @tc.name testRsaEnc0014
     * @tc.desc 组合值：两次加密同输入输出不同（OAEP 随机化）且均还原
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testRsaEnc0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testRsaEnc0014 begin');
      const origin: string = 'roundtrip';
      const passOne: CipherText = await rsaEncryptAsync(subject, origin);
      const passTwo: CipherText = await rsaEncryptAsync(subject, origin);
      const backOne: CipherText = await rsaDecryptAsync(subject, passOne.text);
      const backTwo: CipherText = await rsaDecryptAsync(subject, passTwo.text);
      expect(passOne.text === passTwo.text).assertFalse();
      expect(backOne.text).assertEqual(origin);
      expect(backTwo.text).assertEqual(origin);
      Logger.info(TAG, 'testRsaEnc0014 end');
    });

    /**
     * @tc.number SUB_CIPHER_RSAENC_0015
     * @tc.name testRsaEnc0015
     * @tc.desc 组合值：RSA 与 AES 密文互不可解且两者输出不同
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testRsaEnc0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testRsaEnc0015 begin');
      const crossPlain: string = 'cross';
      const rsaOutput: CipherText = await rsaEncryptAsync(subject, crossPlain);
      const aesOutput: CipherText = await aesEncryptAsync(subject, crossPlain);
      const rsaSeenByAes: CipherText = await aesDecryptAsync(subject, rsaOutput.text);
      const aesSeenByRsa: CipherText = await rsaDecryptAsync(subject, aesOutput.text);
      expect(rsaSeenByAes.text).assertEqual('Error!');
      expect(aesSeenByRsa.text).assertEqual('Error!');
      expect(rsaOutput.text === aesOutput.text).assertFalse();
      Logger.info(TAG, 'testRsaEnc0015 end');
    });

    /**
     * @tc.number SUB_CIPHER_RSAENC_0016
     * @tc.name testRsaEnc0016
     * @tc.desc 组合值：短输入正常还原；空输入加密返回 Error!
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testRsaEnc0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testRsaEnc0016 begin');
      const shortInput: string = 'a';
      const shortCipher: CipherText = await rsaEncryptAsync(subject, shortInput);
      const shortPlain: CipherText = await rsaDecryptAsync(subject, shortCipher.text);
      const blankInput: string = '';
      const blankCipher: CipherText = await rsaEncryptAsync(subject, blankInput);
      expect(shortPlain.text).assertEqual(shortInput);
      expect(blankCipher.text).assertEqual('Error!');
      expect(blankCipher.text.length).assertEqual(6);
      Logger.info(TAG, 'testRsaEnc0016 end');
    });

    /**
     * @tc.number SUB_CIPHER_RSAENC_0017
     * @tc.name testRsaEnc0017
     * @tc.desc 状态：同一输入两次加密密文不同且长度相等（非确定性）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testRsaEnc0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testRsaEnc0017 begin');
      const stateInput: string = 'state';
      const firstShot: CipherText = await rsaEncryptAsync(subject, stateInput);
      const secondShot: CipherText = await rsaEncryptAsync(subject, stateInput);
      expect(firstShot.text === secondShot.text).assertFalse();
      expect(firstShot.text.length).assertEqual(secondShot.text.length);
      expect(firstShot.text.length).assertEqual(172);
      Logger.info(TAG, 'testRsaEnc0017 end');
    });

    /**
     * @tc.number SUB_CIPHER_RSAENC_0018
     * @tc.name testRsaEnc0018
     * @tc.desc 状态：一次失败后正常加密还原不受污染
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testRsaEnc0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testRsaEnc0018 begin');
      let badInput: string = '';
      for (let i: number = 0; i < 100; i++) {
        badInput += 'x';
      }
      const badResult: CipherText = await rsaEncryptAsync(subject, badInput);
      const goodInput: string = 'good';
      const goodCipher: CipherText = await rsaEncryptAsync(subject, goodInput);
      const goodPlain: CipherText = await rsaDecryptAsync(subject, goodCipher.text);
      expect(badResult.text).assertEqual('Error!');
      expect(goodPlain.text).assertEqual(goodInput);
      expect(goodPlain.text.length).assertEqual(4);
      Logger.info(TAG, 'testRsaEnc0018 end');
    });

    /**
     * @tc.number SUB_CIPHER_RSAENC_0019
     * @tc.name testRsaEnc0019
     * @tc.desc 状态：不同输入密文互异，旧密文仍可还原对应明文
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testRsaEnc0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testRsaEnc0019 begin');
      const firstMsg: string = 'first';
      const firstCipher: CipherText = await rsaEncryptAsync(subject, firstMsg);
      const secondMsg: string = 'second';
      const secondCipher: CipherText = await rsaEncryptAsync(subject, secondMsg);
      const firstPlain: CipherText = await rsaDecryptAsync(subject, firstCipher.text);
      expect(firstPlain.text).assertEqual(firstMsg);
      expect(secondCipher.text === firstCipher.text).assertFalse();
      expect(firstPlain.text.length).assertEqual(5);
      Logger.info(TAG, 'testRsaEnc0019 end');
    });

    /**
     * @tc.number SUB_CIPHER_RSAENC_0020
     * @tc.name testRsaEnc0020
     * @tc.desc 状态：两轮加密解密循环各自还原且两次密文互异
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testRsaEnc0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testRsaEnc0020 begin');
      const cycleInput: string = 'cycle';
      const cycleOne: CipherText = await rsaEncryptAsync(subject, cycleInput);
      const cycleOneBack: CipherText = await rsaDecryptAsync(subject, cycleOne.text);
      const cycleTwo: CipherText = await rsaEncryptAsync(subject, cycleInput);
      const cycleTwoBack: CipherText = await rsaDecryptAsync(subject, cycleTwo.text);
      expect(cycleOneBack.text).assertEqual(cycleInput);
      expect(cycleTwoBack.text).assertEqual(cycleInput);
      expect(cycleOne.text === cycleTwo.text).assertFalse();
      Logger.info(TAG, 'testRsaEnc0020 end');
    });
  });
}
