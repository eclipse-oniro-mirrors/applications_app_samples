/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { CipherModel } from '../../../main/ets/model/CipherModel';
import { aesEncryptAsync, aesDecryptAsync } from '../utils/CipherAsync';
function buildInput(cls: string, n: number): string {
  let out: string = '';
  for (let i: number = 0; i < n; i++) {
    out += cls;
  }
  return out;
}
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_Cipher]';

export default function aesDecryptVolume03Test() {
  describe('AesDecryptVolume03Test', () => {

    /**
     * @tc.name   testAesDecryptVolume030123
     * @tc.number SUB_CIPHER_KEYDEC_0123
     * @tc.desc   empty-string ciphertext decrypts to the Error! sentinel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030123 begin');
      const model: CipherModel = new CipherModel();
      const result: string = (await aesDecryptAsync(model, '')).text;
      expect(result).assertEqual('Error!');
      expect(result.length === 6).assertTrue();
      expect((await aesDecryptAsync(model, result)).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030123 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030124
     * @tc.number SUB_CIPHER_KEYDEC_0124
     * @tc.desc   special class, length 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030124 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 1);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030124 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030125
     * @tc.number SUB_CIPHER_KEYDEC_0125
     * @tc.desc   special class, length 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030125 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 2);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030125 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030126
     * @tc.number SUB_CIPHER_KEYDEC_0126
     * @tc.desc   special class, length 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030126 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 3);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030126 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030127
     * @tc.number SUB_CIPHER_KEYDEC_0127
     * @tc.desc   special class, length 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030127 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 4);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030127 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030128
     * @tc.number SUB_CIPHER_KEYDEC_0128
     * @tc.desc   special class, length 8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030128 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 8);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030128 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030129
     * @tc.number SUB_CIPHER_KEYDEC_0129
     * @tc.desc   special class, length 16 (device baseline: decrypt returns Error!)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030129 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 16);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Error!'));
      expect(result).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length));
      expect(result.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030129 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030130
     * @tc.number SUB_CIPHER_KEYDEC_0130
     * @tc.desc   special class, length 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030130 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 23);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030130 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030131
     * @tc.number SUB_CIPHER_KEYDEC_0131
     * @tc.desc   special class, length 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030131 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 24);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030131 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030132
     * @tc.number SUB_CIPHER_KEYDEC_0132
     * @tc.desc   special class, length 25
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030132 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 25);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030132 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030133
     * @tc.number SUB_CIPHER_KEYDEC_0133
     * @tc.desc   special class, length 43
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030133 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 43);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030133 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030134
     * @tc.number SUB_CIPHER_KEYDEC_0134
     * @tc.desc   special class, length 44
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030134 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 44);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030134 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030135
     * @tc.number SUB_CIPHER_KEYDEC_0135
     * @tc.desc   special class, length 45
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030135 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 45);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030135 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030136
     * @tc.number SUB_CIPHER_KEYDEC_0136
     * @tc.desc   special class, length 86
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030136 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 86);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030136 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030137
     * @tc.number SUB_CIPHER_KEYDEC_0137
     * @tc.desc   special class, length 87
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030137 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 87);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030137 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030138
     * @tc.number SUB_CIPHER_KEYDEC_0138
     * @tc.desc   special class, length 88
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030138 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 88);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030138 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030139
     * @tc.number SUB_CIPHER_KEYDEC_0139
     * @tc.desc   special class, length 171
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030139 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 171);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030139 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030140
     * @tc.number SUB_CIPHER_KEYDEC_0140
     * @tc.desc   special class, length 172
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030140 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 172);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030140 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030141
     * @tc.number SUB_CIPHER_KEYDEC_0141
     * @tc.desc   special class, length 173
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030141 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 173);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030141 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030142
     * @tc.number SUB_CIPHER_KEYDEC_0142
     * @tc.desc   special class, length 342
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030142 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 342);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030142 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030143
     * @tc.number SUB_CIPHER_KEYDEC_0143
     * @tc.desc   special class, length 343
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030143 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 343);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030143 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030144
     * @tc.number SUB_CIPHER_KEYDEC_0144
     * @tc.desc   special class, length 344
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030144 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 344);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030144 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030145
     * @tc.number SUB_CIPHER_KEYDEC_0145
     * @tc.desc   special class, length 1367
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030145 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 1367);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030145 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030146
     * @tc.number SUB_CIPHER_KEYDEC_0146
     * @tc.desc   special class, length 1368
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030146 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 1368);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030146 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030147
     * @tc.number SUB_CIPHER_KEYDEC_0147
     * @tc.desc   special class, length 1369
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030147 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 1369);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030147 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030148
     * @tc.number SUB_CIPHER_KEYDEC_0148
     * @tc.desc   special class, length 5464
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030148 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 5464);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030148 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030149
     * @tc.number SUB_CIPHER_KEYDEC_0149
     * @tc.desc   blank class, length 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030149 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 1);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030149 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030150
     * @tc.number SUB_CIPHER_KEYDEC_0150
     * @tc.desc   blank class, length 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030150 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 2);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030150 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030151
     * @tc.number SUB_CIPHER_KEYDEC_0151
     * @tc.desc   blank class, length 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030151 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 3);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030151 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030152
     * @tc.number SUB_CIPHER_KEYDEC_0152
     * @tc.desc   blank class, length 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030152 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 4);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030152 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030153
     * @tc.number SUB_CIPHER_KEYDEC_0153
     * @tc.desc   blank class, length 8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030153 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 8);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030153 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030154
     * @tc.number SUB_CIPHER_KEYDEC_0154
     * @tc.desc   blank class, length 16 (device baseline: decrypt returns Error!)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030154 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 16);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Error!'));
      expect(result).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length));
      expect(result.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030154 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030155
     * @tc.number SUB_CIPHER_KEYDEC_0155
     * @tc.desc   blank class, length 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030155 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 23);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030155 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030156
     * @tc.number SUB_CIPHER_KEYDEC_0156
     * @tc.desc   blank class, length 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030156 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 24);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030156 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030157
     * @tc.number SUB_CIPHER_KEYDEC_0157
     * @tc.desc   blank class, length 25
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030157 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 25);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030157 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030158
     * @tc.number SUB_CIPHER_KEYDEC_0158
     * @tc.desc   blank class, length 43
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030158 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 43);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030158 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030159
     * @tc.number SUB_CIPHER_KEYDEC_0159
     * @tc.desc   blank class, length 44
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030159 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 44);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030159 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030160
     * @tc.number SUB_CIPHER_KEYDEC_0160
     * @tc.desc   blank class, length 45
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030160 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 45);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030160 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030161
     * @tc.number SUB_CIPHER_KEYDEC_0161
     * @tc.desc   blank class, length 86
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030161 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 86);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030161 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030162
     * @tc.number SUB_CIPHER_KEYDEC_0162
     * @tc.desc   blank class, length 87
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030162 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 87);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030162 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030163
     * @tc.number SUB_CIPHER_KEYDEC_0163
     * @tc.desc   blank class, length 88
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030163 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 88);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030163 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030164
     * @tc.number SUB_CIPHER_KEYDEC_0164
     * @tc.desc   blank class, length 171
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030164 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 171);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030164 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030165
     * @tc.number SUB_CIPHER_KEYDEC_0165
     * @tc.desc   blank class, length 172
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030165 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 172);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030165 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030166
     * @tc.number SUB_CIPHER_KEYDEC_0166
     * @tc.desc   blank class, length 173
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030166 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 173);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030166 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030167
     * @tc.number SUB_CIPHER_KEYDEC_0167
     * @tc.desc   blank class, length 342
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030167 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 342);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030167 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030168
     * @tc.number SUB_CIPHER_KEYDEC_0168
     * @tc.desc   blank class, length 343
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030168 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 343);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030168 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030169
     * @tc.number SUB_CIPHER_KEYDEC_0169
     * @tc.desc   blank class, length 344
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030169 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 344);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030169 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030170
     * @tc.number SUB_CIPHER_KEYDEC_0170
     * @tc.desc   blank class, length 1367
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030170 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 1367);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030170 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030171
     * @tc.number SUB_CIPHER_KEYDEC_0171
     * @tc.desc   blank class, length 1368
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030171 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 1368);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030171 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030172
     * @tc.number SUB_CIPHER_KEYDEC_0172
     * @tc.desc   blank class, length 1369
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030172 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 1369);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030172 end');
    })

    /**
     * @tc.name   testAesDecryptVolume030173
     * @tc.number SUB_CIPHER_KEYDEC_0173
     * @tc.desc   blank class, length 5464
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume030173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030173 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 5464);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume030173 end');
    })

  })
}
