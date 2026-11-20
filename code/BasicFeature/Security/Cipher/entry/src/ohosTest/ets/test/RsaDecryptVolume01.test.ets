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

export default function rsaDecryptVolume01Test() {
  describe('RsaDecryptVolume01Test', () => {

    /**
     * @tc.name   testRsaDecryptVolume010021
     * @tc.number SUB_CIPHER_RSADEC_0021
     * @tc.desc   a real RSA ciphertext round-trips back to 'a'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaDecryptVolume010021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaDecryptVolume010021 begin');
      const model: CipherModel = new CipherModel();
      const M: string = 'a';
      const cipher: string = (await rsaEncryptAsync(model, M)).text;
      const result: string = (await rsaDecryptAsync(model, cipher)).text;
      expect(result).assertEqual(M);
      expect(result.length === 1).assertTrue();
      expect(cipher === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaDecryptVolume010021 end');
    })

    /**
     * @tc.name   testRsaDecryptVolume010022
     * @tc.number SUB_CIPHER_RSADEC_0022
     * @tc.desc   cjk junk, length 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaDecryptVolume010022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaDecryptVolume010022 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 1);
      const result: string = (await rsaDecryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Error!'));
      expect(result).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 6));
      expect(result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaDecryptVolume010022 end');
    })

    /**
     * @tc.name   testRsaDecryptVolume010023
     * @tc.number SUB_CIPHER_RSADEC_0023
     * @tc.desc   cjk junk, length 171
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaDecryptVolume010023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaDecryptVolume010023 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 171);
      const result: string = (await rsaDecryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Error!'));
      expect(result).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 6));
      expect(result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaDecryptVolume010023 end');
    })

    /**
     * @tc.name   testRsaDecryptVolume010024
     * @tc.number SUB_CIPHER_RSADEC_0024
     * @tc.desc   cjk junk, length 172
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaDecryptVolume010024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaDecryptVolume010024 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 172);
      const result: string = (await rsaDecryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Error!'));
      expect(result).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 6));
      expect(result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaDecryptVolume010024 end');
    })

    /**
     * @tc.name   testRsaDecryptVolume010025
     * @tc.number SUB_CIPHER_RSADEC_0025
     * @tc.desc   cjk junk, length 344
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaDecryptVolume010025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaDecryptVolume010025 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('密', 344);
      const result: string = (await rsaDecryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Error!'));
      expect(result).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 6));
      expect(result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaDecryptVolume010025 end');
    })

    /**
     * @tc.name   testRsaDecryptVolume010026
     * @tc.number SUB_CIPHER_RSADEC_0026
     * @tc.desc   special junk, length 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaDecryptVolume010026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaDecryptVolume010026 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 1);
      const result: string = (await rsaDecryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Error!'));
      expect(result).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 6));
      expect(result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaDecryptVolume010026 end');
    })

    /**
     * @tc.name   testRsaDecryptVolume010027
     * @tc.number SUB_CIPHER_RSADEC_0027
     * @tc.desc   special junk, length 171
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaDecryptVolume010027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaDecryptVolume010027 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 171);
      const result: string = (await rsaDecryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Error!'));
      expect(result).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 6));
      expect(result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaDecryptVolume010027 end');
    })

    /**
     * @tc.name   testRsaDecryptVolume010028
     * @tc.number SUB_CIPHER_RSADEC_0028
     * @tc.desc   special junk, length 172
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaDecryptVolume010028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaDecryptVolume010028 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 172);
      const result: string = (await rsaDecryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Error!'));
      expect(result).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 6));
      expect(result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaDecryptVolume010028 end');
    })

    /**
     * @tc.name   testRsaDecryptVolume010029
     * @tc.number SUB_CIPHER_RSADEC_0029
     * @tc.desc   special junk, length 344
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaDecryptVolume010029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaDecryptVolume010029 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 344);
      const result: string = (await rsaDecryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Error!'));
      expect(result).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 6));
      expect(result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaDecryptVolume010029 end');
    })

    /**
     * @tc.name   testRsaDecryptVolume010030
     * @tc.number SUB_CIPHER_RSADEC_0030
     * @tc.desc   blank junk, length 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaDecryptVolume010030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaDecryptVolume010030 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 1);
      const result: string = (await rsaDecryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Error!'));
      expect(result).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 6));
      expect(result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaDecryptVolume010030 end');
    })

    /**
     * @tc.name   testRsaDecryptVolume010031
     * @tc.number SUB_CIPHER_RSADEC_0031
     * @tc.desc   blank junk, length 171
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaDecryptVolume010031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaDecryptVolume010031 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 171);
      const result: string = (await rsaDecryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Error!'));
      expect(result).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 6));
      expect(result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaDecryptVolume010031 end');
    })

    /**
     * @tc.name   testRsaDecryptVolume010032
     * @tc.number SUB_CIPHER_RSADEC_0032
     * @tc.desc   blank junk, length 172
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaDecryptVolume010032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaDecryptVolume010032 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 172);
      const result: string = (await rsaDecryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Error!'));
      expect(result).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 6));
      expect(result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaDecryptVolume010032 end');
    })

    /**
     * @tc.name   testRsaDecryptVolume010033
     * @tc.number SUB_CIPHER_RSADEC_0033
     * @tc.desc   blank junk, length 344
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaDecryptVolume010033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaDecryptVolume010033 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 344);
      const result: string = (await rsaDecryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Error!'));
      expect(result).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 6));
      expect(result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaDecryptVolume010033 end');
    })

    /**
     * @tc.name   testRsaDecryptVolume010034
     * @tc.number SUB_CIPHER_RSADEC_0034
     * @tc.desc   junk junk, length 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaDecryptVolume010034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaDecryptVolume010034 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('z!9', 1);
      const result: string = (await rsaDecryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Error!'));
      expect(result).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 6));
      expect(result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaDecryptVolume010034 end');
    })

    /**
     * @tc.name   testRsaDecryptVolume010035
     * @tc.number SUB_CIPHER_RSADEC_0035
     * @tc.desc   junk junk, length 171
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaDecryptVolume010035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaDecryptVolume010035 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('z!9', 171);
      const result: string = (await rsaDecryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Error!'));
      expect(result).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 6));
      expect(result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaDecryptVolume010035 end');
    })

    /**
     * @tc.name   testRsaDecryptVolume010036
     * @tc.number SUB_CIPHER_RSADEC_0036
     * @tc.desc   junk junk, length 172
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaDecryptVolume010036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaDecryptVolume010036 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('z!9', 172);
      const result: string = (await rsaDecryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Error!'));
      expect(result).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 6));
      expect(result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaDecryptVolume010036 end');
    })

    /**
     * @tc.name   testRsaDecryptVolume010037
     * @tc.number SUB_CIPHER_RSADEC_0037
     * @tc.desc   junk junk, length 344
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaDecryptVolume010037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaDecryptVolume010037 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('z!9', 344);
      const result: string = (await rsaDecryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Error!'));
      expect(result).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 6));
      expect(result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaDecryptVolume010037 end');
    })

    /**
     * @tc.name   testRsaDecryptVolume010038
     * @tc.number SUB_CIPHER_RSADEC_0038
     * @tc.desc   mixed junk, length 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaDecryptVolume010038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaDecryptVolume010038 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a1!', 1);
      const result: string = (await rsaDecryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Error!'));
      expect(result).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 6));
      expect(result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaDecryptVolume010038 end');
    })

    /**
     * @tc.name   testRsaDecryptVolume010039
     * @tc.number SUB_CIPHER_RSADEC_0039
     * @tc.desc   mixed junk, length 171
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaDecryptVolume010039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaDecryptVolume010039 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a1!', 171);
      const result: string = (await rsaDecryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Error!'));
      expect(result).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 6));
      expect(result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaDecryptVolume010039 end');
    })

    /**
     * @tc.name   testRsaDecryptVolume010040
     * @tc.number SUB_CIPHER_RSADEC_0040
     * @tc.desc   mixed junk, length 172
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaDecryptVolume010040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaDecryptVolume010040 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a1!', 172);
      const result: string = (await rsaDecryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Error!'));
      expect(result).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 6));
      expect(result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaDecryptVolume010040 end');
    })

    /**
     * @tc.name   testRsaDecryptVolume010041
     * @tc.number SUB_CIPHER_RSADEC_0041
     * @tc.desc   mixed junk, length 344
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaDecryptVolume010041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaDecryptVolume010041 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a1!', 344);
      const result: string = (await rsaDecryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Error!'));
      expect(result).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === 6));
      expect(result.length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaDecryptVolume010041 end');
    })

  })
}
