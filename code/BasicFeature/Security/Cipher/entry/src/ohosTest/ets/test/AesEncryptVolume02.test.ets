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

export default function aesEncryptVolume02Test() {
  describe('AesEncryptVolume02Test', () => {

    /**
     * @tc.name   testAesEncryptVolume020084
     * @tc.number SUB_CIPHER_KEYENC_0084
     * @tc.desc   digit single char encrypt is deterministic across two calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020084 begin');
      const model: CipherModel = new CipherModel();
      const M: string = '5';
      const first: string = (await aesEncryptAsync(model, M)).text;
      const second: string = (await aesEncryptAsync(model, M)).text;
      expect(first).assertEqual(second);
      expect((await aesDecryptAsync(model, first)).text).assertEqual(M);
      expect(first === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020084 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020085
     * @tc.number SUB_CIPHER_KEYENC_0085
     * @tc.desc   digit class, length 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020085 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 1);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020085 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020086
     * @tc.number SUB_CIPHER_KEYENC_0086
     * @tc.desc   digit class, length 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020086 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 2);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020086 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020087
     * @tc.number SUB_CIPHER_KEYENC_0087
     * @tc.desc   digit class, length 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020087 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 3);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020087 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020088
     * @tc.number SUB_CIPHER_KEYENC_0088
     * @tc.desc   digit class, length 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020088 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 4);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020088 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020089
     * @tc.number SUB_CIPHER_KEYENC_0089
     * @tc.desc   digit class, length 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020089 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 7);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020089 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020090
     * @tc.number SUB_CIPHER_KEYENC_0090
     * @tc.desc   digit class, length 8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020090 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 8);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020090 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020091
     * @tc.number SUB_CIPHER_KEYENC_0091
     * @tc.desc   digit class, length 15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020091 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 15);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020091 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020092
     * @tc.number SUB_CIPHER_KEYENC_0092
     * @tc.desc   digit class, length 16 (device baseline: decrypt returns Error!)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020092 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 16);
      const result: string = (await aesEncryptAsync(model, M)).text;
      const restored: string = (await aesDecryptAsync(model, result)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored), String('Error!'));
      expect(restored).assertEqual('Error!');
      expect(restored.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020092 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020093
     * @tc.number SUB_CIPHER_KEYENC_0093
     * @tc.desc   digit class, length 17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020093 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 17);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020093 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020094
     * @tc.number SUB_CIPHER_KEYENC_0094
     * @tc.desc   digit class, length 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020094 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 23);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020094 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020095
     * @tc.number SUB_CIPHER_KEYENC_0095
     * @tc.desc   digit class, length 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020095 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 24);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020095 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020096
     * @tc.number SUB_CIPHER_KEYENC_0096
     * @tc.desc   digit class, length 25
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020096 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 25);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020096 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020097
     * @tc.number SUB_CIPHER_KEYENC_0097
     * @tc.desc   digit class, length 31
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020097 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 31);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020097 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020098
     * @tc.number SUB_CIPHER_KEYENC_0098
     * @tc.desc   digit class, length 32 (device baseline: decrypt returns Error!)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020098 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 32);
      const result: string = (await aesEncryptAsync(model, M)).text;
      const restored: string = (await aesDecryptAsync(model, result)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored), String('Error!'));
      expect(restored).assertEqual('Error!');
      expect(restored.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020098 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020099
     * @tc.number SUB_CIPHER_KEYENC_0099
     * @tc.desc   digit class, length 33
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020099 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 33);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020099 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020100
     * @tc.number SUB_CIPHER_KEYENC_0100
     * @tc.desc   digit class, length 47
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020100 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 47);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020100 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020101
     * @tc.number SUB_CIPHER_KEYENC_0101
     * @tc.desc   digit class, length 48 (device baseline: decrypt returns Error!)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020101 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 48);
      const result: string = (await aesEncryptAsync(model, M)).text;
      const restored: string = (await aesDecryptAsync(model, result)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored), String('Error!'));
      expect(restored).assertEqual('Error!');
      expect(restored.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020101 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020102
     * @tc.number SUB_CIPHER_KEYENC_0102
     * @tc.desc   digit class, length 49
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020102 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 49);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020102 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020103
     * @tc.number SUB_CIPHER_KEYENC_0103
     * @tc.desc   digit class, length 63
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020103 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 63);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020103 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020104
     * @tc.number SUB_CIPHER_KEYENC_0104
     * @tc.desc   digit class, length 64 (device baseline: decrypt returns Error!)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020104 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 64);
      const result: string = (await aesEncryptAsync(model, M)).text;
      const restored: string = (await aesDecryptAsync(model, result)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored), String('Error!'));
      expect(restored).assertEqual('Error!');
      expect(restored.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020104 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020105
     * @tc.number SUB_CIPHER_KEYENC_0105
     * @tc.desc   digit class, length 65
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020105 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 65);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020105 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020106
     * @tc.number SUB_CIPHER_KEYENC_0106
     * @tc.desc   digit class, length 95
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020106 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 95);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020106 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020107
     * @tc.number SUB_CIPHER_KEYENC_0107
     * @tc.desc   digit class, length 96 (device baseline: decrypt returns Error!)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020107 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 96);
      const result: string = (await aesEncryptAsync(model, M)).text;
      const restored: string = (await aesDecryptAsync(model, result)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored), String('Error!'));
      expect(restored).assertEqual('Error!');
      expect(restored.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020107 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020108
     * @tc.number SUB_CIPHER_KEYENC_0108
     * @tc.desc   digit class, length 97
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020108 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 97);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020108 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020109
     * @tc.number SUB_CIPHER_KEYENC_0109
     * @tc.desc   digit class, length 127
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020109 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 127);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020109 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020110
     * @tc.number SUB_CIPHER_KEYENC_0110
     * @tc.desc   digit class, length 128 (device baseline: decrypt returns Error!)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020110 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 128);
      const result: string = (await aesEncryptAsync(model, M)).text;
      const restored: string = (await aesDecryptAsync(model, result)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored), String('Error!'));
      expect(restored).assertEqual('Error!');
      expect(restored.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020110 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020111
     * @tc.number SUB_CIPHER_KEYENC_0111
     * @tc.desc   digit class, length 255
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020111 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 255);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020111 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020112
     * @tc.number SUB_CIPHER_KEYENC_0112
     * @tc.desc   digit class, length 256 (device baseline: decrypt returns Error!)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020112 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 256);
      const result: string = (await aesEncryptAsync(model, M)).text;
      const restored: string = (await aesDecryptAsync(model, result)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored), String('Error!'));
      expect(restored).assertEqual('Error!');
      expect(restored.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020112 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020113
     * @tc.number SUB_CIPHER_KEYENC_0113
     * @tc.desc   digit class, length 511
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020113 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 511);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020113 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020114
     * @tc.number SUB_CIPHER_KEYENC_0114
     * @tc.desc   digit class, length 1023
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020114 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('5', 1023);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020114 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020115
     * @tc.number SUB_CIPHER_KEYENC_0115
     * @tc.desc   special class, length 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020115 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 1);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020115 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020116
     * @tc.number SUB_CIPHER_KEYENC_0116
     * @tc.desc   special class, length 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020116 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 2);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020116 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020117
     * @tc.number SUB_CIPHER_KEYENC_0117
     * @tc.desc   special class, length 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020117 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 3);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020117 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020118
     * @tc.number SUB_CIPHER_KEYENC_0118
     * @tc.desc   special class, length 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020118 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 4);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020118 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020119
     * @tc.number SUB_CIPHER_KEYENC_0119
     * @tc.desc   special class, length 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020119 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 7);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020119 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020120
     * @tc.number SUB_CIPHER_KEYENC_0120
     * @tc.desc   special class, length 8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020120 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 8);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020120 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020121
     * @tc.number SUB_CIPHER_KEYENC_0121
     * @tc.desc   special class, length 15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020121 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 15);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020121 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020122
     * @tc.number SUB_CIPHER_KEYENC_0122
     * @tc.desc   special class, length 16 (device baseline: decrypt returns Error!)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020122 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 16);
      const result: string = (await aesEncryptAsync(model, M)).text;
      const restored: string = (await aesDecryptAsync(model, result)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored), String('Error!'));
      expect(restored).assertEqual('Error!');
      expect(restored.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020122 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020123
     * @tc.number SUB_CIPHER_KEYENC_0123
     * @tc.desc   special class, length 17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020123 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 17);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020123 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020124
     * @tc.number SUB_CIPHER_KEYENC_0124
     * @tc.desc   special class, length 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020124 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 23);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020124 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020125
     * @tc.number SUB_CIPHER_KEYENC_0125
     * @tc.desc   special class, length 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020125 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 24);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020125 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020126
     * @tc.number SUB_CIPHER_KEYENC_0126
     * @tc.desc   special class, length 25
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020126 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 25);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020126 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020127
     * @tc.number SUB_CIPHER_KEYENC_0127
     * @tc.desc   special class, length 31
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020127 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 31);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020127 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020128
     * @tc.number SUB_CIPHER_KEYENC_0128
     * @tc.desc   special class, length 32 (device baseline: decrypt returns Error!)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020128 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 32);
      const result: string = (await aesEncryptAsync(model, M)).text;
      const restored: string = (await aesDecryptAsync(model, result)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored), String('Error!'));
      expect(restored).assertEqual('Error!');
      expect(restored.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020128 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020129
     * @tc.number SUB_CIPHER_KEYENC_0129
     * @tc.desc   special class, length 33
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020129 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 33);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020129 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020130
     * @tc.number SUB_CIPHER_KEYENC_0130
     * @tc.desc   special class, length 47
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020130 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 47);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020130 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020131
     * @tc.number SUB_CIPHER_KEYENC_0131
     * @tc.desc   special class, length 48 (device baseline: decrypt returns Error!)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020131 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 48);
      const result: string = (await aesEncryptAsync(model, M)).text;
      const restored: string = (await aesDecryptAsync(model, result)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored), String('Error!'));
      expect(restored).assertEqual('Error!');
      expect(restored.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020131 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020132
     * @tc.number SUB_CIPHER_KEYENC_0132
     * @tc.desc   special class, length 49
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020132 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 49);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020132 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020133
     * @tc.number SUB_CIPHER_KEYENC_0133
     * @tc.desc   special class, length 63
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020133 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 63);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020133 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020134
     * @tc.number SUB_CIPHER_KEYENC_0134
     * @tc.desc   special class, length 64 (device baseline: decrypt returns Error!)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020134 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 64);
      const result: string = (await aesEncryptAsync(model, M)).text;
      const restored: string = (await aesDecryptAsync(model, result)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored), String('Error!'));
      expect(restored).assertEqual('Error!');
      expect(restored.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020134 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020135
     * @tc.number SUB_CIPHER_KEYENC_0135
     * @tc.desc   special class, length 65
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020135 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 65);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020135 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020136
     * @tc.number SUB_CIPHER_KEYENC_0136
     * @tc.desc   special class, length 95
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020136 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 95);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020136 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020137
     * @tc.number SUB_CIPHER_KEYENC_0137
     * @tc.desc   special class, length 96 (device baseline: decrypt returns Error!)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020137 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 96);
      const result: string = (await aesEncryptAsync(model, M)).text;
      const restored: string = (await aesDecryptAsync(model, result)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored), String('Error!'));
      expect(restored).assertEqual('Error!');
      expect(restored.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020137 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020138
     * @tc.number SUB_CIPHER_KEYENC_0138
     * @tc.desc   special class, length 97
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020138 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 97);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020138 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020139
     * @tc.number SUB_CIPHER_KEYENC_0139
     * @tc.desc   special class, length 127
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020139 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 127);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020139 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020140
     * @tc.number SUB_CIPHER_KEYENC_0140
     * @tc.desc   special class, length 128 (device baseline: decrypt returns Error!)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020140 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 128);
      const result: string = (await aesEncryptAsync(model, M)).text;
      const restored: string = (await aesDecryptAsync(model, result)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored), String('Error!'));
      expect(restored).assertEqual('Error!');
      expect(restored.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020140 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020141
     * @tc.number SUB_CIPHER_KEYENC_0141
     * @tc.desc   special class, length 255
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020141 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 255);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020141 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020142
     * @tc.number SUB_CIPHER_KEYENC_0142
     * @tc.desc   special class, length 256 (device baseline: decrypt returns Error!)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020142 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 256);
      const result: string = (await aesEncryptAsync(model, M)).text;
      const restored: string = (await aesDecryptAsync(model, result)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored), String('Error!'));
      expect(restored).assertEqual('Error!');
      expect(restored.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020142 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020143
     * @tc.number SUB_CIPHER_KEYENC_0143
     * @tc.desc   special class, length 511
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020143 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 511);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020143 end');
    })

    /**
     * @tc.name   testAesEncryptVolume020144
     * @tc.number SUB_CIPHER_KEYENC_0144
     * @tc.desc   special class, length 1023
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume020144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020144 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('!', 1023);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume020144 end');
    })

  })
}
