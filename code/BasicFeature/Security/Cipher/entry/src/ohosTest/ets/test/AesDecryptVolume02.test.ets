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

export default function aesDecryptVolume02Test() {
  describe('AesDecryptVolume02Test', () => {

    /**
     * @tc.name   testAesDecryptVolume020072
     * @tc.number SUB_CIPHER_KEYDEC_0072
     * @tc.desc   junk ciphertext 'zzz' decrypts to the Error! sentinel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020072 begin');
      const model: CipherModel = new CipherModel();
      const result: string = (await aesDecryptAsync(model, 'zzz')).text;
      expect(result).assertEqual('Error!');
      expect(result.length === 6).assertTrue();
      expect((await aesDecryptAsync(model, result)).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020072 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020073
     * @tc.number SUB_CIPHER_KEYDEC_0073
     * @tc.desc   junk class, length 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020073 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('z!9', 1);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020073 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020074
     * @tc.number SUB_CIPHER_KEYDEC_0074
     * @tc.desc   junk class, length 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020074 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('z!9', 2);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020074 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020075
     * @tc.number SUB_CIPHER_KEYDEC_0075
     * @tc.desc   junk class, length 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020075 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('z!9', 3);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020075 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020076
     * @tc.number SUB_CIPHER_KEYDEC_0076
     * @tc.desc   junk class, length 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020076 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('z!9', 4);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020076 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020077
     * @tc.number SUB_CIPHER_KEYDEC_0077
     * @tc.desc   junk class, length 8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020077 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('z!9', 8);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020077 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020078
     * @tc.number SUB_CIPHER_KEYDEC_0078
     * @tc.desc   junk class, length 16 (device baseline: decrypt returns Error!)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020078 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('z!9', 16);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Error!'));
      expect(result).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length));
      expect(result.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020078 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020079
     * @tc.number SUB_CIPHER_KEYDEC_0079
     * @tc.desc   junk class, length 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020079 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('z!9', 23);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020079 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020080
     * @tc.number SUB_CIPHER_KEYDEC_0080
     * @tc.desc   junk class, length 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020080 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('z!9', 24);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020080 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020081
     * @tc.number SUB_CIPHER_KEYDEC_0081
     * @tc.desc   junk class, length 25
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020081 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('z!9', 25);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020081 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020082
     * @tc.number SUB_CIPHER_KEYDEC_0082
     * @tc.desc   junk class, length 43
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020082 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('z!9', 43);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020082 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020083
     * @tc.number SUB_CIPHER_KEYDEC_0083
     * @tc.desc   junk class, length 44
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020083 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('z!9', 44);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020083 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020084
     * @tc.number SUB_CIPHER_KEYDEC_0084
     * @tc.desc   junk class, length 45
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020084 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('z!9', 45);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020084 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020085
     * @tc.number SUB_CIPHER_KEYDEC_0085
     * @tc.desc   junk class, length 86
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020085 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('z!9', 86);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020085 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020086
     * @tc.number SUB_CIPHER_KEYDEC_0086
     * @tc.desc   junk class, length 87
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020086 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('z!9', 87);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020086 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020087
     * @tc.number SUB_CIPHER_KEYDEC_0087
     * @tc.desc   junk class, length 88
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020087 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('z!9', 88);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020087 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020088
     * @tc.number SUB_CIPHER_KEYDEC_0088
     * @tc.desc   junk class, length 171
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020088 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('z!9', 171);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020088 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020089
     * @tc.number SUB_CIPHER_KEYDEC_0089
     * @tc.desc   junk class, length 172
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020089 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('z!9', 172);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020089 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020090
     * @tc.number SUB_CIPHER_KEYDEC_0090
     * @tc.desc   junk class, length 173
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020090 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('z!9', 173);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020090 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020091
     * @tc.number SUB_CIPHER_KEYDEC_0091
     * @tc.desc   junk class, length 342
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020091 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('z!9', 342);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020091 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020092
     * @tc.number SUB_CIPHER_KEYDEC_0092
     * @tc.desc   junk class, length 343
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020092 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('z!9', 343);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020092 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020093
     * @tc.number SUB_CIPHER_KEYDEC_0093
     * @tc.desc   junk class, length 344
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020093 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('z!9', 344);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020093 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020094
     * @tc.number SUB_CIPHER_KEYDEC_0094
     * @tc.desc   junk class, length 1367
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020094 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('z!9', 1367);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020094 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020095
     * @tc.number SUB_CIPHER_KEYDEC_0095
     * @tc.desc   junk class, length 1368
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020095 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('z!9', 1368);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020095 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020096
     * @tc.number SUB_CIPHER_KEYDEC_0096
     * @tc.desc   junk class, length 1369
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020096 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('z!9', 1369);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020096 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020097
     * @tc.number SUB_CIPHER_KEYDEC_0097
     * @tc.desc   junk class, length 5464
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020097 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('z!9', 5464);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020097 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020098
     * @tc.number SUB_CIPHER_KEYDEC_0098
     * @tc.desc   digit class, length 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020098 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 1);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020098 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020099
     * @tc.number SUB_CIPHER_KEYDEC_0099
     * @tc.desc   digit class, length 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020099 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 2);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020099 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020100
     * @tc.number SUB_CIPHER_KEYDEC_0100
     * @tc.desc   digit class, length 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020100 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 3);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020100 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020101
     * @tc.number SUB_CIPHER_KEYDEC_0101
     * @tc.desc   digit class, length 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020101 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 4);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020101 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020102
     * @tc.number SUB_CIPHER_KEYDEC_0102
     * @tc.desc   digit class, length 8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020102 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 8);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020102 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020103
     * @tc.number SUB_CIPHER_KEYDEC_0103
     * @tc.desc   digit class, length 16 (device baseline: decrypt returns Error!)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020103 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 16);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Error!'));
      expect(result).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length));
      expect(result.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020103 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020104
     * @tc.number SUB_CIPHER_KEYDEC_0104
     * @tc.desc   digit class, length 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020104 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 23);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020104 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020105
     * @tc.number SUB_CIPHER_KEYDEC_0105
     * @tc.desc   digit class, length 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020105 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 24);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020105 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020106
     * @tc.number SUB_CIPHER_KEYDEC_0106
     * @tc.desc   digit class, length 25
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020106 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 25);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020106 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020107
     * @tc.number SUB_CIPHER_KEYDEC_0107
     * @tc.desc   digit class, length 43
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020107 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 43);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020107 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020108
     * @tc.number SUB_CIPHER_KEYDEC_0108
     * @tc.desc   digit class, length 44
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020108 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 44);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020108 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020109
     * @tc.number SUB_CIPHER_KEYDEC_0109
     * @tc.desc   digit class, length 45
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020109 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 45);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020109 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020110
     * @tc.number SUB_CIPHER_KEYDEC_0110
     * @tc.desc   digit class, length 86
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020110 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 86);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020110 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020111
     * @tc.number SUB_CIPHER_KEYDEC_0111
     * @tc.desc   digit class, length 87
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020111 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 87);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020111 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020112
     * @tc.number SUB_CIPHER_KEYDEC_0112
     * @tc.desc   digit class, length 88
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020112 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 88);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020112 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020113
     * @tc.number SUB_CIPHER_KEYDEC_0113
     * @tc.desc   digit class, length 171
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020113 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 171);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020113 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020114
     * @tc.number SUB_CIPHER_KEYDEC_0114
     * @tc.desc   digit class, length 172
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020114 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 172);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020114 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020115
     * @tc.number SUB_CIPHER_KEYDEC_0115
     * @tc.desc   digit class, length 173
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020115 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 173);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020115 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020116
     * @tc.number SUB_CIPHER_KEYDEC_0116
     * @tc.desc   digit class, length 342
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020116 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 342);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020116 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020117
     * @tc.number SUB_CIPHER_KEYDEC_0117
     * @tc.desc   digit class, length 343
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020117 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 343);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020117 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020118
     * @tc.number SUB_CIPHER_KEYDEC_0118
     * @tc.desc   digit class, length 344
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020118 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 344);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020118 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020119
     * @tc.number SUB_CIPHER_KEYDEC_0119
     * @tc.desc   digit class, length 1367
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020119 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 1367);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020119 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020120
     * @tc.number SUB_CIPHER_KEYDEC_0120
     * @tc.desc   digit class, length 1368
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020120 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 1368);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020120 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020121
     * @tc.number SUB_CIPHER_KEYDEC_0121
     * @tc.desc   digit class, length 1369
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020121 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 1369);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020121 end');
    })

    /**
     * @tc.name   testAesDecryptVolume020122
     * @tc.number SUB_CIPHER_KEYDEC_0122
     * @tc.desc   digit class, length 5464
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesDecryptVolume020122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020122 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 5464);
      const result: string = (await aesDecryptAsync(model, (await aesEncryptAsync(model, M)).text)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(M));
      expect(result).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length === M.length));
      expect(result.length === M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, M + '!')).text), String('Error!'));
      expect((await aesDecryptAsync(model, M + '!')).text).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesDecryptVolume020122 end');
    })

  })
}
