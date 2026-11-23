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

export default function aesDecryptVolume01Test() {
  describe('AesDecryptVolume01Test', () => {

    /**
     * @tc.name   testAesDecryptVolume010021
     * @tc.number SUB_CIPHER_KEYDEC_0021
     * @tc.desc   frozen baseline ciphertext decrypts back to 'a'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010021 begin');
      const model: CipherModel = new CipherModel();
      const cipher: string = 'ZtJpi1Z5BwPPXqXYRHGthQ==';
      const result: string = (await aesDecryptAsync(model, cipher)).text;
      expect(result).assertEqual('a');
      expect(result.length === 1).assertTrue();
      expect((await aesEncryptAsync(model, result)).text).assertEqual(cipher);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010021 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010022
     * @tc.number SUB_CIPHER_KEYDEC_0022
     * @tc.desc   ascii class, length 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010022 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 1);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010022 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010023
     * @tc.number SUB_CIPHER_KEYDEC_0023
     * @tc.desc   ascii class, length 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010023 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 2);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010023 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010024
     * @tc.number SUB_CIPHER_KEYDEC_0024
     * @tc.desc   ascii class, length 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010024 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 3);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010024 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010025
     * @tc.number SUB_CIPHER_KEYDEC_0025
     * @tc.desc   ascii class, length 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010025 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 4);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010025 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010026
     * @tc.number SUB_CIPHER_KEYDEC_0026
     * @tc.desc   ascii class, length 8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010026 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 8);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010026 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010027
     * @tc.number SUB_CIPHER_KEYDEC_0027
     * @tc.desc   ascii class, length 16 (device baseline: decrypt returns Error!)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010027 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 16);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Error!'));
      expect(result).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length));
      expect(result.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010027 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010028
     * @tc.number SUB_CIPHER_KEYDEC_0028
     * @tc.desc   ascii class, length 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010028 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 23);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010028 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010029
     * @tc.number SUB_CIPHER_KEYDEC_0029
     * @tc.desc   ascii class, length 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010029 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 24);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010029 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010030
     * @tc.number SUB_CIPHER_KEYDEC_0030
     * @tc.desc   ascii class, length 25
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010030 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 25);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010030 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010031
     * @tc.number SUB_CIPHER_KEYDEC_0031
     * @tc.desc   ascii class, length 43
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010031 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 43);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010031 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010032
     * @tc.number SUB_CIPHER_KEYDEC_0032
     * @tc.desc   ascii class, length 44
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010032 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 44);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010032 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010033
     * @tc.number SUB_CIPHER_KEYDEC_0033
     * @tc.desc   ascii class, length 45
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010033 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 45);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010033 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010034
     * @tc.number SUB_CIPHER_KEYDEC_0034
     * @tc.desc   ascii class, length 86
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010034 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 86);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010034 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010035
     * @tc.number SUB_CIPHER_KEYDEC_0035
     * @tc.desc   ascii class, length 87
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010035 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 87);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010035 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010036
     * @tc.number SUB_CIPHER_KEYDEC_0036
     * @tc.desc   ascii class, length 88
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010036 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 88);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010036 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010037
     * @tc.number SUB_CIPHER_KEYDEC_0037
     * @tc.desc   ascii class, length 171
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010037 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 171);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010037 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010038
     * @tc.number SUB_CIPHER_KEYDEC_0038
     * @tc.desc   ascii class, length 172
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010038 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 172);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010038 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010039
     * @tc.number SUB_CIPHER_KEYDEC_0039
     * @tc.desc   ascii class, length 173
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010039 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 173);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010039 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010040
     * @tc.number SUB_CIPHER_KEYDEC_0040
     * @tc.desc   ascii class, length 342
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010040 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 342);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010040 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010041
     * @tc.number SUB_CIPHER_KEYDEC_0041
     * @tc.desc   ascii class, length 343
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010041 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 343);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010041 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010042
     * @tc.number SUB_CIPHER_KEYDEC_0042
     * @tc.desc   ascii class, length 344
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010042 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 344);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010042 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010043
     * @tc.number SUB_CIPHER_KEYDEC_0043
     * @tc.desc   ascii class, length 1367
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010043 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 1367);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010043 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010044
     * @tc.number SUB_CIPHER_KEYDEC_0044
     * @tc.desc   ascii class, length 1368
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010044 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 1368);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010044 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010045
     * @tc.number SUB_CIPHER_KEYDEC_0045
     * @tc.desc   ascii class, length 1369
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010045 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 1369);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010045 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010046
     * @tc.number SUB_CIPHER_KEYDEC_0046
     * @tc.desc   ascii class, length 5464
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010046 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 5464);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010046 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010047
     * @tc.number SUB_CIPHER_KEYDEC_0047
     * @tc.desc   cjk class, length 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010047 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 1);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010047 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010048
     * @tc.number SUB_CIPHER_KEYDEC_0048
     * @tc.desc   cjk class, length 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010048 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 2);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010048 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010049
     * @tc.number SUB_CIPHER_KEYDEC_0049
     * @tc.desc   cjk class, length 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010049 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 3);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010049 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010050
     * @tc.number SUB_CIPHER_KEYDEC_0050
     * @tc.desc   cjk class, length 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010050 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 4);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010050 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010051
     * @tc.number SUB_CIPHER_KEYDEC_0051
     * @tc.desc   cjk class, length 8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010051 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 8);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010051 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010052
     * @tc.number SUB_CIPHER_KEYDEC_0052
     * @tc.desc   cjk class, length 16 (device baseline: decrypt returns Error!)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010052 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 16);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Error!'));
      expect(result).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length));
      expect(result.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010052 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010053
     * @tc.number SUB_CIPHER_KEYDEC_0053
     * @tc.desc   cjk class, length 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010053 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 23);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010053 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010054
     * @tc.number SUB_CIPHER_KEYDEC_0054
     * @tc.desc   cjk class, length 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010054 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 24);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010054 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010055
     * @tc.number SUB_CIPHER_KEYDEC_0055
     * @tc.desc   cjk class, length 25
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010055 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 25);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010055 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010056
     * @tc.number SUB_CIPHER_KEYDEC_0056
     * @tc.desc   cjk class, length 43
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010056 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 43);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010056 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010057
     * @tc.number SUB_CIPHER_KEYDEC_0057
     * @tc.desc   cjk class, length 44
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010057 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 44);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010057 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010058
     * @tc.number SUB_CIPHER_KEYDEC_0058
     * @tc.desc   cjk class, length 45
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010058 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 45);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010058 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010059
     * @tc.number SUB_CIPHER_KEYDEC_0059
     * @tc.desc   cjk class, length 86
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010059 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 86);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010059 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010060
     * @tc.number SUB_CIPHER_KEYDEC_0060
     * @tc.desc   cjk class, length 87
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010060 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 87);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010060 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010061
     * @tc.number SUB_CIPHER_KEYDEC_0061
     * @tc.desc   cjk class, length 88
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010061 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 88);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010061 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010062
     * @tc.number SUB_CIPHER_KEYDEC_0062
     * @tc.desc   cjk class, length 171
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010062 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 171);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010062 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010063
     * @tc.number SUB_CIPHER_KEYDEC_0063
     * @tc.desc   cjk class, length 172
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010063 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 172);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010063 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010064
     * @tc.number SUB_CIPHER_KEYDEC_0064
     * @tc.desc   cjk class, length 173
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010064 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 173);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010064 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010065
     * @tc.number SUB_CIPHER_KEYDEC_0065
     * @tc.desc   cjk class, length 342
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010065 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 342);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010065 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010066
     * @tc.number SUB_CIPHER_KEYDEC_0066
     * @tc.desc   cjk class, length 343
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010066 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 343);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010066 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010067
     * @tc.number SUB_CIPHER_KEYDEC_0067
     * @tc.desc   cjk class, length 344
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010067 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 344);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010067 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010068
     * @tc.number SUB_CIPHER_KEYDEC_0068
     * @tc.desc   cjk class, length 1367
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010068 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 1367);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010068 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010069
     * @tc.number SUB_CIPHER_KEYDEC_0069
     * @tc.desc   cjk class, length 1368
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010069 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 1368);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010069 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010070
     * @tc.number SUB_CIPHER_KEYDEC_0070
     * @tc.desc   cjk class, length 1369
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010070 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 1369);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010070 end');
    })

    /**
     * @tc.name   testAesDecryptVolume010071
     * @tc.number SUB_CIPHER_KEYDEC_0071
     * @tc.desc   cjk class, length 5464
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume010071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010071 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 5464);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume010071 end');
    })

  })
}
