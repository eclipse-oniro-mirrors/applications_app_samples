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
import { rsaEncryptAsync, rsaDecryptAsync } from '../utils/CipherAsync';
function buildInput(cls: string, n: number): string {
  let out: string = '';
  for (let i: number = 0; i < n; i++) {
    out += cls;
  }
  return out;
}
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_Cipher]';

export default function rsaEncryptVolume01Test() {
  describe('RsaEncryptVolume01Test', () => {

    /**
     * @tc.name   testRsaEncryptVolume010021
     * @tc.number SUB_CIPHER_RSAENC_0021
     * @tc.desc   62-byte boundary plaintext encrypts to the frozen 172-char ciphertext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010021 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 62);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      expect(result.length === 172).assertTrue();
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010021 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010022
     * @tc.number SUB_CIPHER_RSAENC_0022
     * @tc.desc   legal plaintext, length 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010022 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 1);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010022 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010023
     * @tc.number SUB_CIPHER_RSAENC_0023
     * @tc.desc   legal plaintext, length 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010023 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 2);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010023 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010024
     * @tc.number SUB_CIPHER_RSAENC_0024
     * @tc.desc   legal plaintext, length 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010024 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 3);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010024 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010025
     * @tc.number SUB_CIPHER_RSAENC_0025
     * @tc.desc   legal plaintext, length 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010025 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 4);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010025 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010026
     * @tc.number SUB_CIPHER_RSAENC_0026
     * @tc.desc   legal plaintext, length 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010026 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 5);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010026 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010027
     * @tc.number SUB_CIPHER_RSAENC_0027
     * @tc.desc   legal plaintext, length 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010027 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 6);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010027 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010028
     * @tc.number SUB_CIPHER_RSAENC_0028
     * @tc.desc   legal plaintext, length 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010028 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 7);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010028 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010029
     * @tc.number SUB_CIPHER_RSAENC_0029
     * @tc.desc   legal plaintext, length 8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010029 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 8);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010029 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010030
     * @tc.number SUB_CIPHER_RSAENC_0030
     * @tc.desc   legal plaintext, length 9
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010030 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 9);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010030 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010031
     * @tc.number SUB_CIPHER_RSAENC_0031
     * @tc.desc   legal plaintext, length 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010031 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 10);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010031 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010032
     * @tc.number SUB_CIPHER_RSAENC_0032
     * @tc.desc   legal plaintext, length 11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010032 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 11);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010032 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010033
     * @tc.number SUB_CIPHER_RSAENC_0033
     * @tc.desc   legal plaintext, length 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010033 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 12);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010033 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010034
     * @tc.number SUB_CIPHER_RSAENC_0034
     * @tc.desc   legal plaintext, length 13
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010034 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 13);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010034 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010035
     * @tc.number SUB_CIPHER_RSAENC_0035
     * @tc.desc   legal plaintext, length 14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010035 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 14);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010035 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010036
     * @tc.number SUB_CIPHER_RSAENC_0036
     * @tc.desc   legal plaintext, length 15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010036 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 15);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010036 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010037
     * @tc.number SUB_CIPHER_RSAENC_0037
     * @tc.desc   legal plaintext, length 16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010037 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 16);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010037 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010038
     * @tc.number SUB_CIPHER_RSAENC_0038
     * @tc.desc   legal plaintext, length 17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010038 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 17);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010038 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010039
     * @tc.number SUB_CIPHER_RSAENC_0039
     * @tc.desc   legal plaintext, length 18
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010039 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 18);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010039 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010040
     * @tc.number SUB_CIPHER_RSAENC_0040
     * @tc.desc   legal plaintext, length 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010040 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 19);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010040 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010041
     * @tc.number SUB_CIPHER_RSAENC_0041
     * @tc.desc   legal plaintext, length 20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010041 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 20);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010041 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010042
     * @tc.number SUB_CIPHER_RSAENC_0042
     * @tc.desc   legal plaintext, length 21
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010042 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 21);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010042 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010043
     * @tc.number SUB_CIPHER_RSAENC_0043
     * @tc.desc   legal plaintext, length 22
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010043 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 22);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010043 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010044
     * @tc.number SUB_CIPHER_RSAENC_0044
     * @tc.desc   legal plaintext, length 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010044 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 23);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010044 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010045
     * @tc.number SUB_CIPHER_RSAENC_0045
     * @tc.desc   legal plaintext, length 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010045 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 24);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010045 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010046
     * @tc.number SUB_CIPHER_RSAENC_0046
     * @tc.desc   legal plaintext, length 25
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010046 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 25);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010046 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010047
     * @tc.number SUB_CIPHER_RSAENC_0047
     * @tc.desc   legal plaintext, length 26
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010047 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 26);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010047 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010048
     * @tc.number SUB_CIPHER_RSAENC_0048
     * @tc.desc   legal plaintext, length 27
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010048 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 27);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010048 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010049
     * @tc.number SUB_CIPHER_RSAENC_0049
     * @tc.desc   legal plaintext, length 28
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010049 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 28);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010049 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010050
     * @tc.number SUB_CIPHER_RSAENC_0050
     * @tc.desc   legal plaintext, length 29
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010050 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 29);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010050 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010051
     * @tc.number SUB_CIPHER_RSAENC_0051
     * @tc.desc   legal plaintext, length 30
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010051 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 30);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010051 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010052
     * @tc.number SUB_CIPHER_RSAENC_0052
     * @tc.desc   legal plaintext, length 31
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010052 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 31);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010052 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010053
     * @tc.number SUB_CIPHER_RSAENC_0053
     * @tc.desc   legal plaintext, length 32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010053 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 32);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010053 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010054
     * @tc.number SUB_CIPHER_RSAENC_0054
     * @tc.desc   legal plaintext, length 33
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010054 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 33);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010054 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010055
     * @tc.number SUB_CIPHER_RSAENC_0055
     * @tc.desc   legal plaintext, length 34
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010055 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 34);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010055 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010056
     * @tc.number SUB_CIPHER_RSAENC_0056
     * @tc.desc   legal plaintext, length 35
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010056 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 35);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010056 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010057
     * @tc.number SUB_CIPHER_RSAENC_0057
     * @tc.desc   legal plaintext, length 36
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010057 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 36);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010057 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010058
     * @tc.number SUB_CIPHER_RSAENC_0058
     * @tc.desc   legal plaintext, length 37
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010058 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 37);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010058 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010059
     * @tc.number SUB_CIPHER_RSAENC_0059
     * @tc.desc   legal plaintext, length 38
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010059 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 38);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010059 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010060
     * @tc.number SUB_CIPHER_RSAENC_0060
     * @tc.desc   legal plaintext, length 39
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010060 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 39);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010060 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010061
     * @tc.number SUB_CIPHER_RSAENC_0061
     * @tc.desc   legal plaintext, length 40
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010061 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 40);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010061 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010062
     * @tc.number SUB_CIPHER_RSAENC_0062
     * @tc.desc   legal plaintext, length 41
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010062 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 41);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010062 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010063
     * @tc.number SUB_CIPHER_RSAENC_0063
     * @tc.desc   legal plaintext, length 42
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010063 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 42);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010063 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010064
     * @tc.number SUB_CIPHER_RSAENC_0064
     * @tc.desc   legal plaintext, length 43
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010064 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 43);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010064 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010065
     * @tc.number SUB_CIPHER_RSAENC_0065
     * @tc.desc   legal plaintext, length 44
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010065 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 44);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010065 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010066
     * @tc.number SUB_CIPHER_RSAENC_0066
     * @tc.desc   legal plaintext, length 45
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010066 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 45);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010066 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010067
     * @tc.number SUB_CIPHER_RSAENC_0067
     * @tc.desc   legal plaintext, length 46
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010067 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 46);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010067 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010068
     * @tc.number SUB_CIPHER_RSAENC_0068
     * @tc.desc   legal plaintext, length 47
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010068 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 47);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010068 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010069
     * @tc.number SUB_CIPHER_RSAENC_0069
     * @tc.desc   legal plaintext, length 48
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010069 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 48);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010069 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010070
     * @tc.number SUB_CIPHER_RSAENC_0070
     * @tc.desc   legal plaintext, length 49
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010070 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 49);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010070 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010071
     * @tc.number SUB_CIPHER_RSAENC_0071
     * @tc.desc   legal plaintext, length 50
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010071 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 50);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010071 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010072
     * @tc.number SUB_CIPHER_RSAENC_0072
     * @tc.desc   legal plaintext, length 51
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010072 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 51);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010072 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010073
     * @tc.number SUB_CIPHER_RSAENC_0073
     * @tc.desc   legal plaintext, length 52
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010073 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 52);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010073 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010074
     * @tc.number SUB_CIPHER_RSAENC_0074
     * @tc.desc   legal plaintext, length 53
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010074 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 53);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010074 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010075
     * @tc.number SUB_CIPHER_RSAENC_0075
     * @tc.desc   legal plaintext, length 54
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010075 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 54);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010075 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010076
     * @tc.number SUB_CIPHER_RSAENC_0076
     * @tc.desc   legal plaintext, length 55
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010076 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 55);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010076 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010077
     * @tc.number SUB_CIPHER_RSAENC_0077
     * @tc.desc   legal plaintext, length 56
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010077 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 56);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010077 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010078
     * @tc.number SUB_CIPHER_RSAENC_0078
     * @tc.desc   legal plaintext, length 57
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010078 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 57);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010078 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010079
     * @tc.number SUB_CIPHER_RSAENC_0079
     * @tc.desc   legal plaintext, length 58
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010079 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 58);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010079 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010080
     * @tc.number SUB_CIPHER_RSAENC_0080
     * @tc.desc   legal plaintext, length 59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010080 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 59);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010080 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010081
     * @tc.number SUB_CIPHER_RSAENC_0081
     * @tc.desc   legal plaintext, length 60
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010081 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 60);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010081 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010082
     * @tc.number SUB_CIPHER_RSAENC_0082
     * @tc.desc   legal plaintext, length 61
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010082 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 61);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010082 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010083
     * @tc.number SUB_CIPHER_RSAENC_0083
     * @tc.desc   legal plaintext, length 62
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010083 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 62);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String(M));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 172));
      expect(result.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010083 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010084
     * @tc.number SUB_CIPHER_RSAENC_0084
     * @tc.desc   over-bound plaintext, length 63
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010084 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 63);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Error!'));
      expect(result).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String('Error!'));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010084 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010085
     * @tc.number SUB_CIPHER_RSAENC_0085
     * @tc.desc   over-bound plaintext, length 64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010085 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 64);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Error!'));
      expect(result).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String('Error!'));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010085 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010086
     * @tc.number SUB_CIPHER_RSAENC_0086
     * @tc.desc   over-bound plaintext, length 65
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010086 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 65);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Error!'));
      expect(result).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String('Error!'));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010086 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010087
     * @tc.number SUB_CIPHER_RSAENC_0087
     * @tc.desc   over-bound plaintext, length 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010087 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 100);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Error!'));
      expect(result).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String('Error!'));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010087 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010088
     * @tc.number SUB_CIPHER_RSAENC_0088
     * @tc.desc   over-bound plaintext, length 127
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010088 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 127);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Error!'));
      expect(result).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String('Error!'));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010088 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010089
     * @tc.number SUB_CIPHER_RSAENC_0089
     * @tc.desc   over-bound plaintext, length 128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010089 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 128);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Error!'));
      expect(result).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String('Error!'));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010089 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010090
     * @tc.number SUB_CIPHER_RSAENC_0090
     * @tc.desc   over-bound plaintext, length 1024
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010090 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 1024);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Error!'));
      expect(result).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String('Error!'));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010090 end');
    })

    /**
     * @tc.name   testRsaEncryptVolume010091
     * @tc.number SUB_CIPHER_RSAENC_0091
     * @tc.desc   over-bound plaintext, length 4096
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaEncryptVolume010091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010091 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 4096);
      const result: string = (await rsaEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Error!'));
      expect(result).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await rsaDecryptAsync(model, result)).text), String('Error!'));
      expect((await rsaDecryptAsync(model, result)).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaEncryptVolume010091 end');
    })

  })
}
