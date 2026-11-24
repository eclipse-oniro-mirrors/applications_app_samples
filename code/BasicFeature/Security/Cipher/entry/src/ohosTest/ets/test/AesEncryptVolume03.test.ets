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

export default function aesEncryptVolume03Test() {
  describe('AesEncryptVolume03Test', () => {

    /**
     * @tc.name   testAesEncryptVolume030145
     * @tc.number SUB_CIPHER_KEYENC_0145
     * @tc.desc   blank-only input round-trips and encrypts deterministically
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume030145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030145 begin');
      const model: CipherModel = new CipherModel();
      const M: string = '   ';
      const first: string = (await aesEncryptAsync(model, M)).text;
      const second: string = (await aesEncryptAsync(model, M)).text;
      expect(first).assertEqual(second);
      expect((await aesDecryptAsync(model, first)).text).assertEqual(M);
      expect(first === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030145 end');
    })

    /**
     * @tc.name   testAesEncryptVolume030146
     * @tc.number SUB_CIPHER_KEYENC_0146
     * @tc.desc   blank class, length 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume030146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030146 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 1);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030146 end');
    })

    /**
     * @tc.name   testAesEncryptVolume030147
     * @tc.number SUB_CIPHER_KEYENC_0147
     * @tc.desc   blank class, length 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume030147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030147 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 2);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030147 end');
    })

    /**
     * @tc.name   testAesEncryptVolume030148
     * @tc.number SUB_CIPHER_KEYENC_0148
     * @tc.desc   blank class, length 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume030148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030148 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 3);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030148 end');
    })

    /**
     * @tc.name   testAesEncryptVolume030149
     * @tc.number SUB_CIPHER_KEYENC_0149
     * @tc.desc   blank class, length 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume030149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030149 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 4);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030149 end');
    })

    /**
     * @tc.name   testAesEncryptVolume030150
     * @tc.number SUB_CIPHER_KEYENC_0150
     * @tc.desc   blank class, length 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume030150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030150 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 7);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030150 end');
    })

    /**
     * @tc.name   testAesEncryptVolume030151
     * @tc.number SUB_CIPHER_KEYENC_0151
     * @tc.desc   blank class, length 8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume030151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030151 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 8);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030151 end');
    })

    /**
     * @tc.name   testAesEncryptVolume030152
     * @tc.number SUB_CIPHER_KEYENC_0152
     * @tc.desc   blank class, length 15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume030152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030152 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 15);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030152 end');
    })

    /**
     * @tc.name   testAesEncryptVolume030153
     * @tc.number SUB_CIPHER_KEYENC_0153
     * @tc.desc   blank class, length 16 (device baseline: decrypt returns Error!)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume030153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030153 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 16);
      const result: string = (await aesEncryptAsync(model, M)).text;
      const restored: string = (await aesDecryptAsync(model, result)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored), String('Error!'));
      expect(restored).assertEqual('Error!');
      expect(restored.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030153 end');
    })

    /**
     * @tc.name   testAesEncryptVolume030154
     * @tc.number SUB_CIPHER_KEYENC_0154
     * @tc.desc   blank class, length 17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume030154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030154 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 17);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030154 end');
    })

    /**
     * @tc.name   testAesEncryptVolume030155
     * @tc.number SUB_CIPHER_KEYENC_0155
     * @tc.desc   blank class, length 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume030155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030155 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 23);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030155 end');
    })

    /**
     * @tc.name   testAesEncryptVolume030156
     * @tc.number SUB_CIPHER_KEYENC_0156
     * @tc.desc   blank class, length 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume030156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030156 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 24);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030156 end');
    })

    /**
     * @tc.name   testAesEncryptVolume030157
     * @tc.number SUB_CIPHER_KEYENC_0157
     * @tc.desc   blank class, length 25
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume030157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030157 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 25);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030157 end');
    })

    /**
     * @tc.name   testAesEncryptVolume030158
     * @tc.number SUB_CIPHER_KEYENC_0158
     * @tc.desc   blank class, length 31
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume030158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030158 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 31);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030158 end');
    })

    /**
     * @tc.name   testAesEncryptVolume030159
     * @tc.number SUB_CIPHER_KEYENC_0159
     * @tc.desc   blank class, length 32 (device baseline: decrypt returns Error!)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume030159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030159 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 32);
      const result: string = (await aesEncryptAsync(model, M)).text;
      const restored: string = (await aesDecryptAsync(model, result)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored), String('Error!'));
      expect(restored).assertEqual('Error!');
      expect(restored.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030159 end');
    })

    /**
     * @tc.name   testAesEncryptVolume030160
     * @tc.number SUB_CIPHER_KEYENC_0160
     * @tc.desc   blank class, length 33
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume030160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030160 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 33);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030160 end');
    })

    /**
     * @tc.name   testAesEncryptVolume030161
     * @tc.number SUB_CIPHER_KEYENC_0161
     * @tc.desc   blank class, length 47
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume030161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030161 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 47);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030161 end');
    })

    /**
     * @tc.name   testAesEncryptVolume030162
     * @tc.number SUB_CIPHER_KEYENC_0162
     * @tc.desc   blank class, length 48 (device baseline: decrypt returns Error!)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume030162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030162 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 48);
      const result: string = (await aesEncryptAsync(model, M)).text;
      const restored: string = (await aesDecryptAsync(model, result)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored), String('Error!'));
      expect(restored).assertEqual('Error!');
      expect(restored.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030162 end');
    })

    /**
     * @tc.name   testAesEncryptVolume030163
     * @tc.number SUB_CIPHER_KEYENC_0163
     * @tc.desc   blank class, length 49
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume030163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030163 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 49);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030163 end');
    })

    /**
     * @tc.name   testAesEncryptVolume030164
     * @tc.number SUB_CIPHER_KEYENC_0164
     * @tc.desc   blank class, length 63
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume030164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030164 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 63);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030164 end');
    })

    /**
     * @tc.name   testAesEncryptVolume030165
     * @tc.number SUB_CIPHER_KEYENC_0165
     * @tc.desc   blank class, length 64 (device baseline: decrypt returns Error!)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume030165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030165 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 64);
      const result: string = (await aesEncryptAsync(model, M)).text;
      const restored: string = (await aesDecryptAsync(model, result)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored), String('Error!'));
      expect(restored).assertEqual('Error!');
      expect(restored.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030165 end');
    })

    /**
     * @tc.name   testAesEncryptVolume030166
     * @tc.number SUB_CIPHER_KEYENC_0166
     * @tc.desc   blank class, length 65
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume030166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030166 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 65);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030166 end');
    })

    /**
     * @tc.name   testAesEncryptVolume030167
     * @tc.number SUB_CIPHER_KEYENC_0167
     * @tc.desc   blank class, length 95
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume030167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030167 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 95);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030167 end');
    })

    /**
     * @tc.name   testAesEncryptVolume030168
     * @tc.number SUB_CIPHER_KEYENC_0168
     * @tc.desc   blank class, length 96 (device baseline: decrypt returns Error!)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume030168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030168 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 96);
      const result: string = (await aesEncryptAsync(model, M)).text;
      const restored: string = (await aesDecryptAsync(model, result)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored), String('Error!'));
      expect(restored).assertEqual('Error!');
      expect(restored.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030168 end');
    })

    /**
     * @tc.name   testAesEncryptVolume030169
     * @tc.number SUB_CIPHER_KEYENC_0169
     * @tc.desc   blank class, length 97
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume030169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030169 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 97);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030169 end');
    })

    /**
     * @tc.name   testAesEncryptVolume030170
     * @tc.number SUB_CIPHER_KEYENC_0170
     * @tc.desc   blank class, length 127
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume030170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030170 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 127);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030170 end');
    })

    /**
     * @tc.name   testAesEncryptVolume030171
     * @tc.number SUB_CIPHER_KEYENC_0171
     * @tc.desc   blank class, length 128 (device baseline: decrypt returns Error!)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume030171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030171 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 128);
      const result: string = (await aesEncryptAsync(model, M)).text;
      const restored: string = (await aesDecryptAsync(model, result)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored), String('Error!'));
      expect(restored).assertEqual('Error!');
      expect(restored.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030171 end');
    })

    /**
     * @tc.name   testAesEncryptVolume030172
     * @tc.number SUB_CIPHER_KEYENC_0172
     * @tc.desc   blank class, length 255
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume030172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030172 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 255);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030172 end');
    })

    /**
     * @tc.name   testAesEncryptVolume030173
     * @tc.number SUB_CIPHER_KEYENC_0173
     * @tc.desc   blank class, length 256 (device baseline: decrypt returns Error!)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume030173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030173 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 256);
      const result: string = (await aesEncryptAsync(model, M)).text;
      const restored: string = (await aesDecryptAsync(model, result)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored), String('Error!'));
      expect(restored).assertEqual('Error!');
      expect(restored.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030173 end');
    })

    /**
     * @tc.name   testAesEncryptVolume030174
     * @tc.number SUB_CIPHER_KEYENC_0174
     * @tc.desc   blank class, length 511
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume030174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030174 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 511);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030174 end');
    })

    /**
     * @tc.name   testAesEncryptVolume030175
     * @tc.number SUB_CIPHER_KEYENC_0175
     * @tc.desc   blank class, length 1023
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesEncryptVolume030175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030175 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput(' ', 1023);
      const result: string = (await aesEncryptAsync(model, M)).text;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String((await aesDecryptAsync(model, result)).text), String(M));
      expect((await aesDecryptAsync(model, result)).text).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > M.length));
      expect(result.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === M));
      expect(result === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesEncryptVolume030175 end');
    })

  })
}
