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
import { CryptoOperation } from '../../../main/ets/cryptoframework/CryptoOperation';
import cryptoFramework from '@ohos.security.cryptoFramework';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_CryptoFramework]';

export default function aesKeyLenTest() {
  describe('AesKeyLen', () => {

    /**
     * @tc.name   testAesKeyLen0001
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0001
     * @tc.desc   key hex string of length 0 is rejected by convertAesKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0001 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      let thrown: boolean = false;
      try {
        await op.convertAesKey('');
      } catch (e) {
        thrown = true;
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(thrown));
      expect(thrown).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrl.getEncoded().data.length), String(32));
      expect(ctrl.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0001 end');
    });

    /**
     * @tc.name   testAesKeyLen0002
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0002
     * @tc.desc   key hex string of length 1 is rejected by convertAesKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0002 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('0');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrl.getEncoded().data.length), String(32));
      expect(ctrl.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0002 end');
    });

    /**
     * @tc.name   testAesKeyLen0003
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0003
     * @tc.desc   key hex string of length 2 is rejected by convertAesKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0003 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('00');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrl.getEncoded().data.length), String(32));
      expect(ctrl.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0003 end');
    });

    /**
     * @tc.name   testAesKeyLen0004
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0004
     * @tc.desc   key hex string of length 3 is rejected by convertAesKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0004 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('000');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrl.getEncoded().data.length), String(32));
      expect(ctrl.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0004 end');
    });

    /**
     * @tc.name   testAesKeyLen0005
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0005
     * @tc.desc   key hex string of length 4 is rejected by convertAesKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0005 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('0000');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrl.getEncoded().data.length), String(32));
      expect(ctrl.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0005 end');
    });

    /**
     * @tc.name   testAesKeyLen0006
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0006
     * @tc.desc   key hex string of length 5 is rejected by convertAesKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0006 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('00000');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrl.getEncoded().data.length), String(32));
      expect(ctrl.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0006 end');
    });

    /**
     * @tc.name   testAesKeyLen0007
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0007
     * @tc.desc   key hex string of length 6 is rejected by convertAesKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0007 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('000000');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrl.getEncoded().data.length), String(32));
      expect(ctrl.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0007 end');
    });

    /**
     * @tc.name   testAesKeyLen0008
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0008
     * @tc.desc   key hex string of length 7 is rejected by convertAesKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0008 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('0000000');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrl.getEncoded().data.length), String(32));
      expect(ctrl.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0008 end');
    });

    /**
     * @tc.name   testAesKeyLen0009
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0009
     * @tc.desc   key hex string of length 8 is rejected by convertAesKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0009 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('00000000');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrl.getEncoded().data.length), String(32));
      expect(ctrl.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0009 end');
    });

    /**
     * @tc.name   testAesKeyLen0010
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0010
     * @tc.desc   key hex string of length 9 is rejected by convertAesKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0010 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('000000000');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrl.getEncoded().data.length), String(32));
      expect(ctrl.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0010 end');
    });

    /**
     * @tc.name   testAesKeyLen0011
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0011
     * @tc.desc   key hex string of length 10 is rejected by convertAesKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0011 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('0000000000');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrl.getEncoded().data.length), String(32));
      expect(ctrl.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0011 end');
    });

    /**
     * @tc.name   testAesKeyLen0012
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0012
     * @tc.desc   key hex string of length 11 is rejected by convertAesKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0012 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('00000000000');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrl.getEncoded().data.length), String(32));
      expect(ctrl.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0012 end');
    });

    /**
     * @tc.name   testAesKeyLen0013
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0013
     * @tc.desc   key hex string of length 12 is rejected by convertAesKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0013 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('000000000000');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrl.getEncoded().data.length), String(32));
      expect(ctrl.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0013 end');
    });

    /**
     * @tc.name   testAesKeyLen0014
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0014
     * @tc.desc   key hex string of length 13 is rejected by convertAesKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0014 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('0000000000000');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrl.getEncoded().data.length), String(32));
      expect(ctrl.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0014 end');
    });

    /**
     * @tc.name   testAesKeyLen0015
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0015
     * @tc.desc   key hex string of length 14 is rejected by convertAesKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0015 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('00000000000000');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrl.getEncoded().data.length), String(32));
      expect(ctrl.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0015 end');
    });

    /**
     * @tc.name   testAesKeyLen0016
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0016
     * @tc.desc   key hex string of length 15 is rejected by convertAesKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0016 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('000000000000000');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrl.getEncoded().data.length), String(32));
      expect(ctrl.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0016 end');
    });

    /**
     * @tc.name   testAesKeyLen0017
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0017
     * @tc.desc   key hex string of length 16 is rejected by convertAesKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0017 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('0000000000000000');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrl.getEncoded().data.length), String(32));
      expect(ctrl.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0017 end');
    });

    /**
     * @tc.name   testAesKeyLen0018
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0018
     * @tc.desc   key hex string of length 17 is rejected by convertAesKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0018 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('00000000000000000');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrl.getEncoded().data.length), String(32));
      expect(ctrl.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0018 end');
    });

    /**
     * @tc.name   testAesKeyLen0019
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0019
     * @tc.desc   key hex string of length 18 is rejected by convertAesKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0019 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('000000000000000000');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrl.getEncoded().data.length), String(32));
      expect(ctrl.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0019 end');
    });

    /**
     * @tc.name   testAesKeyLen0020
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0020
     * @tc.desc   key hex string of length 19 is rejected by convertAesKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0020 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('0000000000000000000');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrl.getEncoded().data.length), String(32));
      expect(ctrl.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0020 end');
    });

    /**
     * @tc.name   testAesKeyLen0021
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0021
     * @tc.desc   key hex string of length 20 is rejected by convertAesKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0021 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('00000000000000000000');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrl.getEncoded().data.length), String(32));
      expect(ctrl.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0021 end');
    });

    /**
     * @tc.name   testAesKeyLen0022
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0022
     * @tc.desc   key hex string of length 21 is rejected by convertAesKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0022 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('000000000000000000000');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrl.getEncoded().data.length), String(32));
      expect(ctrl.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0022 end');
    });

    /**
     * @tc.name   testAesKeyLen0023
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0023
     * @tc.desc   key hex string of length 22 is rejected by convertAesKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0023 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('0000000000000000000000');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrl.getEncoded().data.length), String(32));
      expect(ctrl.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0023 end');
    });

    /**
     * @tc.name   testAesKeyLen0024
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0024
     * @tc.desc   key hex string of length 23 is rejected by convertAesKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0024 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('00000000000000000000000');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrl.getEncoded().data.length), String(32));
      expect(ctrl.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0024 end');
    });

    /**
     * @tc.name   testAesKeyLen0025
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0025
     * @tc.desc   key hex string of length 24 is rejected by convertAesKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0025 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('000000000000000000000000');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrl.getEncoded().data.length), String(32));
      expect(ctrl.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0025 end');
    });

    /**
     * @tc.name   testAesKeyLen0026
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0026
     * @tc.desc   key hex string of length 25 is rejected by convertAesKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0026 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('0000000000000000000000000');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrl.getEncoded().data.length), String(32));
      expect(ctrl.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0026 end');
    });

    /**
     * @tc.name   testAesKeyLen0027
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0027
     * @tc.desc   key hex string of length 26 is rejected by convertAesKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0027 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('00000000000000000000000000');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrl.getEncoded().data.length), String(32));
      expect(ctrl.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0027 end');
    });

    /**
     * @tc.name   testAesKeyLen0028
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0028
     * @tc.desc   key hex string of length 27 is rejected by convertAesKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0028 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('000000000000000000000000000');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrl.getEncoded().data.length), String(32));
      expect(ctrl.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0028 end');
    });

    /**
     * @tc.name   testAesKeyLen0029
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0029
     * @tc.desc   key hex string of length 28 is rejected by convertAesKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0029 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('0000000000000000000000000000');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrl.getEncoded().data.length), String(32));
      expect(ctrl.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0029 end');
    });

    /**
     * @tc.name   testAesKeyLen0030
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0030
     * @tc.desc   key hex string of length 29 is rejected by convertAesKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0030 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('00000000000000000000000000000');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrl.getEncoded().data.length), String(32));
      expect(ctrl.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0030 end');
    });

    /**
     * @tc.name   testAesKeyLen0031
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0031
     * @tc.desc   key hex string of length 30 is rejected by convertAesKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0031 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('000000000000000000000000000000');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrl.getEncoded().data.length), String(32));
      expect(ctrl.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0031 end');
    });

    /**
     * @tc.name   testAesKeyLen0032
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0032
     * @tc.desc   key hex string of length 31 is rejected by convertAesKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0032 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('0000000000000000000000000000000');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrl.getEncoded().data.length), String(32));
      expect(ctrl.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0032 end');
    });

    /**
     * @tc.name   testAesKeyLen0033
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0033
     * @tc.desc   key hex string of length 32 is rejected by convertAesKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0033 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('00000000000000000000000000000000');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrl.getEncoded().data.length), String(32));
      expect(ctrl.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0033 end');
    });

    /**
     * @tc.name   testAesKeyLen0034
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0034
     * @tc.desc   key hex string of length 33 is rejected by convertAesKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0034 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('000000000000000000000000000000000');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrl.getEncoded().data.length), String(32));
      expect(ctrl.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0034 end');
    });

    /**
     * @tc.name   testAesKeyLen0035
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0035
     * @tc.desc   key hex string of length 34 is rejected by convertAesKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0035 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('0000000000000000000000000000000000');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrl.getEncoded().data.length), String(32));
      expect(ctrl.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0035 end');
    });

    /**
     * @tc.name   testAesKeyLen0036
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0036
     * @tc.desc   key hex string of length 35 is rejected by convertAesKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0036 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('00000000000000000000000000000000000');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrl.getEncoded().data.length), String(32));
      expect(ctrl.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0036 end');
    });

    /**
     * @tc.name   testAesKeyLen0037
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0037
     * @tc.desc   key hex string of length 36 is rejected by convertAesKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0037 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('000000000000000000000000000000000000');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrl.getEncoded().data.length), String(32));
      expect(ctrl.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0037 end');
    });

    /**
     * @tc.name   testAesKeyLen0038
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0038
     * @tc.desc   key hex string of length 37 is rejected by convertAesKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0038 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('0000000000000000000000000000000000000');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrl.getEncoded().data.length), String(32));
      expect(ctrl.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0038 end');
    });

    /**
     * @tc.name   testAesKeyLen0039
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0039
     * @tc.desc   key hex string of length 38 is rejected by convertAesKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0039 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('00000000000000000000000000000000000000');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrl.getEncoded().data.length), String(32));
      expect(ctrl.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0039 end');
    });

    /**
     * @tc.name   testAesKeyLen0040
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0040
     * @tc.desc   key hex string of length 39 is rejected by convertAesKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0040 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('000000000000000000000000000000000000000');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrl.getEncoded().data.length), String(32));
      expect(ctrl.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0040 end');
    });

    /**
     * @tc.name   testAesKeyLen0041
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0041
     * @tc.desc   key hex string of length 40 is rejected by convertAesKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0041 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('0000000000000000000000000000000000000000');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrl.getEncoded().data.length), String(32));
      expect(ctrl.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0041 end');
    });

    /**
     * @tc.name   testAesKeyLen0042
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0042
     * @tc.desc   key hex string of length 41 is rejected by convertAesKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0042 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('00000000000000000000000000000000000000000');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrl.getEncoded().data.length), String(32));
      expect(ctrl.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0042 end');
    });

    /**
     * @tc.name   testAesKeyLen0043
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0043
     * @tc.desc   key hex string of length 42 is rejected by convertAesKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0043 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('000000000000000000000000000000000000000000');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrl.getEncoded().data.length), String(32));
      expect(ctrl.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0043 end');
    });

    /**
     * @tc.name   testAesKeyLen0044
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0044
     * @tc.desc   key hex string of length 43 is rejected by convertAesKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0044 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('0000000000000000000000000000000000000000000');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrl.getEncoded().data.length), String(32));
      expect(ctrl.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0044 end');
    });

    /**
     * @tc.name   testAesKeyLen0045
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0045
     * @tc.desc   key hex string of length 44 is rejected by convertAesKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0045 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('00000000000000000000000000000000000000000000');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrl.getEncoded().data.length), String(32));
      expect(ctrl.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0045 end');
    });

    /**
     * @tc.name   testAesKeyLen0046
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0046
     * @tc.desc   key hex string of length 45 is rejected by convertAesKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0046 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('000000000000000000000000000000000000000000000');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrl.getEncoded().data.length), String(32));
      expect(ctrl.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0046 end');
    });

    /**
     * @tc.name   testAesKeyLen0047
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0047
     * @tc.desc   key hex string of length 46 is rejected by convertAesKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0047 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('000000000000000000000000000000000000000' +
        '0000000');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrl.getEncoded().data.length), String(32));
      expect(ctrl.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0047 end');
    });

    /**
     * @tc.name   testAesKeyLen0048
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0048
     * @tc.desc   key hex string of length 47 is rejected by convertAesKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0048 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('000000000000000000000000000000000000000' +
        '00000000');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrl.getEncoded().data.length), String(32));
      expect(ctrl.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0048 end');
    });

    /**
     * @tc.name   testAesKeyLen0049
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0049
     * @tc.desc   63-char odd-length hex still yields a 32-byte AES256 key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0049 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('000000000000000000000000000000000000000' +
        '000000000000000000000000');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0049 end');
    });

    /**
     * @tc.name   testAesKeyLen0050
     * @tc.number SUB_CryptoFramework_AESKLEN_01_0050
     * @tc.desc   64-char hex yields a valid AES256 key with 32 encoded bytes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyLen0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0050 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
        'c0c0c0c0c0c0c0c0c0c0');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0c0c0c0');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyLen0050 end');
    });

  });
}
