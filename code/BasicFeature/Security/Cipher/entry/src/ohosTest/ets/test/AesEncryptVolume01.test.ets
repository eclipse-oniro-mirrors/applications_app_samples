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

export default function aesEncryptVolume01Test() {
  describe('AesEncryptVolume01Test', () => {

    /**
     * @tc.name   testAesEncryptVolume010023
     * @tc.number SUB_CIPHER_KEYENC_0023
     * @tc.desc   frozen baseline, encrypting 'a' matches the measured ciphertext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010023 begin');
      const model: CipherModel = new CipherModel();
      const M: string = 'a';
      const result: string = (await aesEncryptAsync(model, M)).text;
      expect(result).assertEqual('ZtJpi1Z5BwPPXqXYRHGthQ==');
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      expect(result.length === 24).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010023 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010024
     * @tc.number SUB_CIPHER_KEYENC_0024
     * @tc.desc   ascii class, length 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010024 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 1);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010024 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010025
     * @tc.number SUB_CIPHER_KEYENC_0025
     * @tc.desc   ascii class, length 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010025 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 2);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010025 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010026
     * @tc.number SUB_CIPHER_KEYENC_0026
     * @tc.desc   ascii class, length 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010026 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 3);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010026 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010027
     * @tc.number SUB_CIPHER_KEYENC_0027
     * @tc.desc   ascii class, length 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010027 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 4);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010027 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010028
     * @tc.number SUB_CIPHER_KEYENC_0028
     * @tc.desc   ascii class, length 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010028 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 7);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010028 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010029
     * @tc.number SUB_CIPHER_KEYENC_0029
     * @tc.desc   ascii class, length 8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010029 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 8);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010029 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010030
     * @tc.number SUB_CIPHER_KEYENC_0030
     * @tc.desc   ascii class, length 15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010030 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 15);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010030 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010031
     * @tc.number SUB_CIPHER_KEYENC_0031
     * @tc.desc   ascii class, length 16 (device baseline: decrypt returns Error!)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010031 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 16);
      const result: string = (await aesEncryptAsync(model, M)).text;
      const restored: string = (await aesDecryptAsync(model, result)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored), String('Error!'));
      expect(restored).assertEqual('Error!');
      expect(restored.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010031 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010032
     * @tc.number SUB_CIPHER_KEYENC_0032
     * @tc.desc   ascii class, length 17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010032 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 17);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010032 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010033
     * @tc.number SUB_CIPHER_KEYENC_0033
     * @tc.desc   ascii class, length 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010033 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 23);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010033 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010034
     * @tc.number SUB_CIPHER_KEYENC_0034
     * @tc.desc   ascii class, length 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010034 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 24);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010034 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010035
     * @tc.number SUB_CIPHER_KEYENC_0035
     * @tc.desc   ascii class, length 25
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010035 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 25);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010035 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010036
     * @tc.number SUB_CIPHER_KEYENC_0036
     * @tc.desc   ascii class, length 31
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010036 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 31);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010036 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010037
     * @tc.number SUB_CIPHER_KEYENC_0037
     * @tc.desc   ascii class, length 32 (device baseline: decrypt returns Error!)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010037 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 32);
      const result: string = (await aesEncryptAsync(model, M)).text;
      const restored: string = (await aesDecryptAsync(model, result)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored), String('Error!'));
      expect(restored).assertEqual('Error!');
      expect(restored.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010037 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010038
     * @tc.number SUB_CIPHER_KEYENC_0038
     * @tc.desc   ascii class, length 33
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010038 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 33);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010038 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010039
     * @tc.number SUB_CIPHER_KEYENC_0039
     * @tc.desc   ascii class, length 47
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010039 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 47);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010039 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010040
     * @tc.number SUB_CIPHER_KEYENC_0040
     * @tc.desc   ascii class, length 48 (device baseline: decrypt returns Error!)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010040 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 48);
      const result: string = (await aesEncryptAsync(model, M)).text;
      const restored: string = (await aesDecryptAsync(model, result)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored), String('Error!'));
      expect(restored).assertEqual('Error!');
      expect(restored.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010040 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010041
     * @tc.number SUB_CIPHER_KEYENC_0041
     * @tc.desc   ascii class, length 49
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010041 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 49);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010041 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010042
     * @tc.number SUB_CIPHER_KEYENC_0042
     * @tc.desc   ascii class, length 63
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010042 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 63);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010042 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010043
     * @tc.number SUB_CIPHER_KEYENC_0043
     * @tc.desc   ascii class, length 64 (device baseline: decrypt returns Error!)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010043 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 64);
      const result: string = (await aesEncryptAsync(model, M)).text;
      const restored: string = (await aesDecryptAsync(model, result)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored), String('Error!'));
      expect(restored).assertEqual('Error!');
      expect(restored.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010043 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010044
     * @tc.number SUB_CIPHER_KEYENC_0044
     * @tc.desc   ascii class, length 65
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010044 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 65);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010044 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010045
     * @tc.number SUB_CIPHER_KEYENC_0045
     * @tc.desc   ascii class, length 95
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010045 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 95);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010045 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010046
     * @tc.number SUB_CIPHER_KEYENC_0046
     * @tc.desc   ascii class, length 96 (device baseline: decrypt returns Error!)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010046 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 96);
      const result: string = (await aesEncryptAsync(model, M)).text;
      const restored: string = (await aesDecryptAsync(model, result)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored), String('Error!'));
      expect(restored).assertEqual('Error!');
      expect(restored.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010046 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010047
     * @tc.number SUB_CIPHER_KEYENC_0047
     * @tc.desc   ascii class, length 97
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010047 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 97);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010047 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010048
     * @tc.number SUB_CIPHER_KEYENC_0048
     * @tc.desc   ascii class, length 127
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010048 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 127);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010048 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010049
     * @tc.number SUB_CIPHER_KEYENC_0049
     * @tc.desc   ascii class, length 128 (device baseline: decrypt returns Error!)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010049 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 128);
      const result: string = (await aesEncryptAsync(model, M)).text;
      const restored: string = (await aesDecryptAsync(model, result)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored), String('Error!'));
      expect(restored).assertEqual('Error!');
      expect(restored.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010049 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010050
     * @tc.number SUB_CIPHER_KEYENC_0050
     * @tc.desc   ascii class, length 255
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010050 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 255);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010050 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010051
     * @tc.number SUB_CIPHER_KEYENC_0051
     * @tc.desc   ascii class, length 256 (device baseline: decrypt returns Error!)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010051 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 256);
      const result: string = (await aesEncryptAsync(model, M)).text;
      const restored: string = (await aesDecryptAsync(model, result)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored), String('Error!'));
      expect(restored).assertEqual('Error!');
      expect(restored.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010051 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010052
     * @tc.number SUB_CIPHER_KEYENC_0052
     * @tc.desc   ascii class, length 511
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010052 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 511);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010052 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010053
     * @tc.number SUB_CIPHER_KEYENC_0053
     * @tc.desc   ascii class, length 1023
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010053 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 1023);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010053 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010054
     * @tc.number SUB_CIPHER_KEYENC_0054
     * @tc.desc   cjk class, length 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010054 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 1);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010054 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010055
     * @tc.number SUB_CIPHER_KEYENC_0055
     * @tc.desc   cjk class, length 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010055 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 2);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010055 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010056
     * @tc.number SUB_CIPHER_KEYENC_0056
     * @tc.desc   cjk class, length 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010056 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 3);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010056 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010057
     * @tc.number SUB_CIPHER_KEYENC_0057
     * @tc.desc   cjk class, length 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010057 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 4);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010057 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010058
     * @tc.number SUB_CIPHER_KEYENC_0058
     * @tc.desc   cjk class, length 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010058 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 7);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010058 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010059
     * @tc.number SUB_CIPHER_KEYENC_0059
     * @tc.desc   cjk class, length 8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010059 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 8);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010059 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010060
     * @tc.number SUB_CIPHER_KEYENC_0060
     * @tc.desc   cjk class, length 15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010060 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 15);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010060 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010061
     * @tc.number SUB_CIPHER_KEYENC_0061
     * @tc.desc   cjk class, length 16 (device baseline: decrypt returns Error!)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010061 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 16);
      const result: string = (await aesEncryptAsync(model, M)).text;
      const restored: string = (await aesDecryptAsync(model, result)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored), String('Error!'));
      expect(restored).assertEqual('Error!');
      expect(restored.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010061 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010062
     * @tc.number SUB_CIPHER_KEYENC_0062
     * @tc.desc   cjk class, length 17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010062 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 17);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010062 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010063
     * @tc.number SUB_CIPHER_KEYENC_0063
     * @tc.desc   cjk class, length 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010063 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 23);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010063 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010064
     * @tc.number SUB_CIPHER_KEYENC_0064
     * @tc.desc   cjk class, length 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010064 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 24);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010064 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010065
     * @tc.number SUB_CIPHER_KEYENC_0065
     * @tc.desc   cjk class, length 25
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010065 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 25);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010065 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010066
     * @tc.number SUB_CIPHER_KEYENC_0066
     * @tc.desc   cjk class, length 31
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010066 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 31);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010066 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010067
     * @tc.number SUB_CIPHER_KEYENC_0067
     * @tc.desc   cjk class, length 32 (device baseline: decrypt returns Error!)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010067 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 32);
      const result: string = (await aesEncryptAsync(model, M)).text;
      const restored: string = (await aesDecryptAsync(model, result)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored), String('Error!'));
      expect(restored).assertEqual('Error!');
      expect(restored.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010067 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010068
     * @tc.number SUB_CIPHER_KEYENC_0068
     * @tc.desc   cjk class, length 33
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010068 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 33);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010068 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010069
     * @tc.number SUB_CIPHER_KEYENC_0069
     * @tc.desc   cjk class, length 47
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010069 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 47);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010069 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010070
     * @tc.number SUB_CIPHER_KEYENC_0070
     * @tc.desc   cjk class, length 48 (device baseline: decrypt returns Error!)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010070 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 48);
      const result: string = (await aesEncryptAsync(model, M)).text;
      const restored: string = (await aesDecryptAsync(model, result)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored), String('Error!'));
      expect(restored).assertEqual('Error!');
      expect(restored.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010070 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010071
     * @tc.number SUB_CIPHER_KEYENC_0071
     * @tc.desc   cjk class, length 49
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010071 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 49);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010071 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010072
     * @tc.number SUB_CIPHER_KEYENC_0072
     * @tc.desc   cjk class, length 63
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010072 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 63);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010072 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010073
     * @tc.number SUB_CIPHER_KEYENC_0073
     * @tc.desc   cjk class, length 64 (device baseline: decrypt returns Error!)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010073 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 64);
      const result: string = (await aesEncryptAsync(model, M)).text;
      const restored: string = (await aesDecryptAsync(model, result)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored), String('Error!'));
      expect(restored).assertEqual('Error!');
      expect(restored.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010073 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010074
     * @tc.number SUB_CIPHER_KEYENC_0074
     * @tc.desc   cjk class, length 65
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010074 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 65);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010074 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010075
     * @tc.number SUB_CIPHER_KEYENC_0075
     * @tc.desc   cjk class, length 95
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010075 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 95);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010075 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010076
     * @tc.number SUB_CIPHER_KEYENC_0076
     * @tc.desc   cjk class, length 96 (device baseline: decrypt returns Error!)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010076 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 96);
      const result: string = (await aesEncryptAsync(model, M)).text;
      const restored: string = (await aesDecryptAsync(model, result)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored), String('Error!'));
      expect(restored).assertEqual('Error!');
      expect(restored.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010076 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010077
     * @tc.number SUB_CIPHER_KEYENC_0077
     * @tc.desc   cjk class, length 97
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010077 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 97);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010077 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010078
     * @tc.number SUB_CIPHER_KEYENC_0078
     * @tc.desc   cjk class, length 127
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010078 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 127);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010078 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010079
     * @tc.number SUB_CIPHER_KEYENC_0079
     * @tc.desc   cjk class, length 128 (device baseline: decrypt returns Error!)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010079 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 128);
      const result: string = (await aesEncryptAsync(model, M)).text;
      const restored: string = (await aesDecryptAsync(model, result)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored), String('Error!'));
      expect(restored).assertEqual('Error!');
      expect(restored.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010079 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010080
     * @tc.number SUB_CIPHER_KEYENC_0080
     * @tc.desc   cjk class, length 255
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010080 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 255);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010080 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010081
     * @tc.number SUB_CIPHER_KEYENC_0081
     * @tc.desc   cjk class, length 256 (device baseline: decrypt returns Error!)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010081 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 256);
      const result: string = (await aesEncryptAsync(model, M)).text;
      const restored: string = (await aesDecryptAsync(model, result)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored), String('Error!'));
      expect(restored).assertEqual('Error!');
      expect(restored.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010081 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010082
     * @tc.number SUB_CIPHER_KEYENC_0082
     * @tc.desc   cjk class, length 511
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010082 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 511);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010082 end');
    })

    /**
     * @tc.name   testAesEncryptVolume010083
     * @tc.number SUB_CIPHER_KEYENC_0083
     * @tc.desc   cjk class, length 1023
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume010083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010083 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 1023);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume010083 end');
    })

  })
}
