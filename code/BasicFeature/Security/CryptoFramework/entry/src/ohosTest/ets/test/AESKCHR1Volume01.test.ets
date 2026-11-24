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

export default function aesKeyChr1Test() {
  describe('AesKeyChr1', () => {

    /**
     * @tc.name   testAesKeyChr10001
     * @tc.number SUB_CryptoFramework_AESKCHR1_01_0001
     * @tc.desc   invalid char at pair-leading nibble of byte 0 zeroes that byte, key stays valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr10001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10001 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('g0ccccccccccccccccccccccccccccccccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[0]), String(0));
      expect(actResult.getEncoded().data[0]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10001 end');
    });

    /**
     * @tc.name   testAesKeyChr10002
     * @tc.number SUB_CryptoFramework_AESKCHR1_01_0002
     * @tc.desc   invalid char at pair-leading nibble of byte 0 zeroes that byte, key stays valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr10002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10002 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('m0ccccccccccccccccccccccccccccccccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[0]), String(0));
      expect(actResult.getEncoded().data[0]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10002 end');
    });

    /**
     * @tc.name   testAesKeyChr10003
     * @tc.number SUB_CryptoFramework_AESKCHR1_01_0003
     * @tc.desc   invalid char at pair-leading nibble of byte 0 zeroes that byte, key stays valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr10003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10003 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('t0ccccccccccccccccccccccccccccccccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[0]), String(0));
      expect(actResult.getEncoded().data[0]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10003 end');
    });

    /**
     * @tc.name   testAesKeyChr10004
     * @tc.number SUB_CryptoFramework_AESKCHR1_01_0004
     * @tc.desc   invalid char at pair-leading nibble of byte 0 zeroes that byte, key stays valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr10004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10004 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('z0ccccccccccccccccccccccccccccccccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[0]), String(0));
      expect(actResult.getEncoded().data[0]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10004 end');
    });

    /**
     * @tc.name   testAesKeyChr10005
     * @tc.number SUB_CryptoFramework_AESKCHR1_01_0005
     * @tc.desc   invalid char at pair-leading nibble of byte 0 zeroes that byte, key stays valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr10005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10005 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('G0ccccccccccccccccccccccccccccccccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[0]), String(0));
      expect(actResult.getEncoded().data[0]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10005 end');
    });

    /**
     * @tc.name   testAesKeyChr10006
     * @tc.number SUB_CryptoFramework_AESKCHR1_01_0006
     * @tc.desc   invalid char at pair-leading nibble of byte 0 zeroes that byte, key stays valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr10006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10006 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('K0ccccccccccccccccccccccccccccccccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[0]), String(0));
      expect(actResult.getEncoded().data[0]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10006 end');
    });

    /**
     * @tc.name   testAesKeyChr10007
     * @tc.number SUB_CryptoFramework_AESKCHR1_01_0007
     * @tc.desc   invalid char at pair-leading nibble of byte 0 zeroes that byte, key stays valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr10007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10007 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('T0ccccccccccccccccccccccccccccccccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[0]), String(0));
      expect(actResult.getEncoded().data[0]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10007 end');
    });

    /**
     * @tc.name   testAesKeyChr10008
     * @tc.number SUB_CryptoFramework_AESKCHR1_01_0008
     * @tc.desc   invalid char at pair-leading nibble of byte 0 zeroes that byte, key stays valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr10008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10008 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('Z0ccccccccccccccccccccccccccccccccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[0]), String(0));
      expect(actResult.getEncoded().data[0]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10008 end');
    });

    /**
     * @tc.name   testAesKeyChr10009
     * @tc.number SUB_CryptoFramework_AESKCHR1_01_0009
     * @tc.desc   invalid char at pair-leading nibble of byte 1 zeroes that byte, key stays valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr10009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10009 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccg0ccccccccccccccccccccccccccccccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[1]), String(0));
      expect(actResult.getEncoded().data[1]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10009 end');
    });

    /**
     * @tc.name   testAesKeyChr10010
     * @tc.number SUB_CryptoFramework_AESKCHR1_01_0010
     * @tc.desc   invalid char at pair-leading nibble of byte 1 zeroes that byte, key stays valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr10010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10010 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccm0ccccccccccccccccccccccccccccccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[1]), String(0));
      expect(actResult.getEncoded().data[1]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10010 end');
    });

    /**
     * @tc.name   testAesKeyChr10011
     * @tc.number SUB_CryptoFramework_AESKCHR1_01_0011
     * @tc.desc   invalid char at pair-leading nibble of byte 1 zeroes that byte, key stays valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr10011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10011 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('cct0ccccccccccccccccccccccccccccccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[1]), String(0));
      expect(actResult.getEncoded().data[1]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10011 end');
    });

    /**
     * @tc.name   testAesKeyChr10012
     * @tc.number SUB_CryptoFramework_AESKCHR1_01_0012
     * @tc.desc   invalid char at pair-leading nibble of byte 1 zeroes that byte, key stays valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr10012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10012 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccz0ccccccccccccccccccccccccccccccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[1]), String(0));
      expect(actResult.getEncoded().data[1]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10012 end');
    });

    /**
     * @tc.name   testAesKeyChr10013
     * @tc.number SUB_CryptoFramework_AESKCHR1_01_0013
     * @tc.desc   invalid char at pair-leading nibble of byte 1 zeroes that byte, key stays valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr10013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10013 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccG0ccccccccccccccccccccccccccccccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[1]), String(0));
      expect(actResult.getEncoded().data[1]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10013 end');
    });

    /**
     * @tc.name   testAesKeyChr10014
     * @tc.number SUB_CryptoFramework_AESKCHR1_01_0014
     * @tc.desc   invalid char at pair-leading nibble of byte 1 zeroes that byte, key stays valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr10014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10014 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccK0ccccccccccccccccccccccccccccccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[1]), String(0));
      expect(actResult.getEncoded().data[1]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10014 end');
    });

    /**
     * @tc.name   testAesKeyChr10015
     * @tc.number SUB_CryptoFramework_AESKCHR1_01_0015
     * @tc.desc   invalid char at pair-leading nibble of byte 1 zeroes that byte, key stays valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr10015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10015 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccT0ccccccccccccccccccccccccccccccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[1]), String(0));
      expect(actResult.getEncoded().data[1]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10015 end');
    });

    /**
     * @tc.name   testAesKeyChr10016
     * @tc.number SUB_CryptoFramework_AESKCHR1_01_0016
     * @tc.desc   invalid char at pair-leading nibble of byte 1 zeroes that byte, key stays valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr10016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10016 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccZ0ccccccccccccccccccccccccccccccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[1]), String(0));
      expect(actResult.getEncoded().data[1]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10016 end');
    });

    /**
     * @tc.name   testAesKeyChr10017
     * @tc.number SUB_CryptoFramework_AESKCHR1_01_0017
     * @tc.desc   invalid char at pair-leading nibble of byte 8 zeroes that byte, key stays valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr10017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10017 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccccg0ccccccccccccccccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[8]), String(0));
      expect(actResult.getEncoded().data[8]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10017 end');
    });

    /**
     * @tc.name   testAesKeyChr10018
     * @tc.number SUB_CryptoFramework_AESKCHR1_01_0018
     * @tc.desc   invalid char at pair-leading nibble of byte 8 zeroes that byte, key stays valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr10018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10018 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccccm0ccccccccccccccccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[8]), String(0));
      expect(actResult.getEncoded().data[8]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10018 end');
    });

    /**
     * @tc.name   testAesKeyChr10019
     * @tc.number SUB_CryptoFramework_AESKCHR1_01_0019
     * @tc.desc   invalid char at pair-leading nibble of byte 8 zeroes that byte, key stays valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr10019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10019 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccct0ccccccccccccccccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[8]), String(0));
      expect(actResult.getEncoded().data[8]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10019 end');
    });

    /**
     * @tc.name   testAesKeyChr10020
     * @tc.number SUB_CryptoFramework_AESKCHR1_01_0020
     * @tc.desc   invalid char at pair-leading nibble of byte 8 zeroes that byte, key stays valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr10020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10020 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccccz0ccccccccccccccccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[8]), String(0));
      expect(actResult.getEncoded().data[8]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10020 end');
    });

    /**
     * @tc.name   testAesKeyChr10021
     * @tc.number SUB_CryptoFramework_AESKCHR1_01_0021
     * @tc.desc   invalid char at pair-leading nibble of byte 8 zeroes that byte, key stays valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr10021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10021 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccccG0ccccccccccccccccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[8]), String(0));
      expect(actResult.getEncoded().data[8]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10021 end');
    });

    /**
     * @tc.name   testAesKeyChr10022
     * @tc.number SUB_CryptoFramework_AESKCHR1_01_0022
     * @tc.desc   invalid char at pair-leading nibble of byte 8 zeroes that byte, key stays valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr10022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10022 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccccK0ccccccccccccccccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[8]), String(0));
      expect(actResult.getEncoded().data[8]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10022 end');
    });

    /**
     * @tc.name   testAesKeyChr10023
     * @tc.number SUB_CryptoFramework_AESKCHR1_01_0023
     * @tc.desc   invalid char at pair-leading nibble of byte 8 zeroes that byte, key stays valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr10023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10023 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccccT0ccccccccccccccccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[8]), String(0));
      expect(actResult.getEncoded().data[8]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10023 end');
    });

    /**
     * @tc.name   testAesKeyChr10024
     * @tc.number SUB_CryptoFramework_AESKCHR1_01_0024
     * @tc.desc   invalid char at pair-leading nibble of byte 8 zeroes that byte, key stays valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr10024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10024 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccccZ0ccccccccccccccccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[8]), String(0));
      expect(actResult.getEncoded().data[8]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10024 end');
    });

    /**
     * @tc.name   testAesKeyChr10025
     * @tc.number SUB_CryptoFramework_AESKCHR1_01_0025
     * @tc.desc   invalid char at pair-leading nibble of byte 16 zeroes that byte, key stays valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr10025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10025 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccccccccccccccccccccg0ccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[16]), String(0));
      expect(actResult.getEncoded().data[16]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10025 end');
    });

    /**
     * @tc.name   testAesKeyChr10026
     * @tc.number SUB_CryptoFramework_AESKCHR1_01_0026
     * @tc.desc   invalid char at pair-leading nibble of byte 16 zeroes that byte, key stays valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr10026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10026 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccccccccccccccccccccm0ccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[16]), String(0));
      expect(actResult.getEncoded().data[16]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10026 end');
    });

    /**
     * @tc.name   testAesKeyChr10027
     * @tc.number SUB_CryptoFramework_AESKCHR1_01_0027
     * @tc.desc   invalid char at pair-leading nibble of byte 16 zeroes that byte, key stays valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr10027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10027 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccct0ccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[16]), String(0));
      expect(actResult.getEncoded().data[16]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10027 end');
    });

    /**
     * @tc.name   testAesKeyChr10028
     * @tc.number SUB_CryptoFramework_AESKCHR1_01_0028
     * @tc.desc   invalid char at pair-leading nibble of byte 16 zeroes that byte, key stays valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr10028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10028 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccccccccccccccccccccz0ccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[16]), String(0));
      expect(actResult.getEncoded().data[16]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10028 end');
    });

    /**
     * @tc.name   testAesKeyChr10029
     * @tc.number SUB_CryptoFramework_AESKCHR1_01_0029
     * @tc.desc   invalid char at pair-leading nibble of byte 16 zeroes that byte, key stays valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr10029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10029 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccccccccccccccccccccG0ccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[16]), String(0));
      expect(actResult.getEncoded().data[16]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10029 end');
    });

    /**
     * @tc.name   testAesKeyChr10030
     * @tc.number SUB_CryptoFramework_AESKCHR1_01_0030
     * @tc.desc   invalid char at pair-leading nibble of byte 16 zeroes that byte, key stays valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr10030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10030 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccccccccccccccccccccK0ccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[16]), String(0));
      expect(actResult.getEncoded().data[16]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10030 end');
    });

    /**
     * @tc.name   testAesKeyChr10031
     * @tc.number SUB_CryptoFramework_AESKCHR1_01_0031
     * @tc.desc   invalid char at pair-leading nibble of byte 16 zeroes that byte, key stays valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr10031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10031 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccccccccccccccccccccT0ccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[16]), String(0));
      expect(actResult.getEncoded().data[16]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10031 end');
    });

    /**
     * @tc.name   testAesKeyChr10032
     * @tc.number SUB_CryptoFramework_AESKCHR1_01_0032
     * @tc.desc   invalid char at pair-leading nibble of byte 16 zeroes that byte, key stays valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr10032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10032 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccccccccccccccccccccZ0ccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[16]), String(0));
      expect(actResult.getEncoded().data[16]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10032 end');
    });

    /**
     * @tc.name   testAesKeyChr10033
     * @tc.number SUB_CryptoFramework_AESKCHR1_01_0033
     * @tc.desc   invalid char at pair-leading nibble of byte 24 zeroes that byte, key stays valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr10033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10033 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccg0cccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[24]), String(0));
      expect(actResult.getEncoded().data[24]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10033 end');
    });

    /**
     * @tc.name   testAesKeyChr10034
     * @tc.number SUB_CryptoFramework_AESKCHR1_01_0034
     * @tc.desc   invalid char at pair-leading nibble of byte 24 zeroes that byte, key stays valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr10034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10034 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccm0cccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[24]), String(0));
      expect(actResult.getEncoded().data[24]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10034 end');
    });

    /**
     * @tc.name   testAesKeyChr10035
     * @tc.number SUB_CryptoFramework_AESKCHR1_01_0035
     * @tc.desc   invalid char at pair-leading nibble of byte 24 zeroes that byte, key stays valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr10035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10035 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccccccccccccccccccccccccccc' +
        'ccccccccct0cccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[24]), String(0));
      expect(actResult.getEncoded().data[24]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10035 end');
    });

    /**
     * @tc.name   testAesKeyChr10036
     * @tc.number SUB_CryptoFramework_AESKCHR1_01_0036
     * @tc.desc   invalid char at pair-leading nibble of byte 24 zeroes that byte, key stays valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr10036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10036 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccz0cccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[24]), String(0));
      expect(actResult.getEncoded().data[24]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10036 end');
    });

    /**
     * @tc.name   testAesKeyChr10037
     * @tc.number SUB_CryptoFramework_AESKCHR1_01_0037
     * @tc.desc   invalid char at pair-leading nibble of byte 24 zeroes that byte, key stays valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr10037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10037 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccG0cccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[24]), String(0));
      expect(actResult.getEncoded().data[24]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10037 end');
    });

    /**
     * @tc.name   testAesKeyChr10038
     * @tc.number SUB_CryptoFramework_AESKCHR1_01_0038
     * @tc.desc   invalid char at pair-leading nibble of byte 24 zeroes that byte, key stays valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr10038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10038 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccK0cccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[24]), String(0));
      expect(actResult.getEncoded().data[24]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10038 end');
    });

    /**
     * @tc.name   testAesKeyChr10039
     * @tc.number SUB_CryptoFramework_AESKCHR1_01_0039
     * @tc.desc   invalid char at pair-leading nibble of byte 24 zeroes that byte, key stays valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr10039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10039 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccT0cccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[24]), String(0));
      expect(actResult.getEncoded().data[24]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10039 end');
    });

    /**
     * @tc.name   testAesKeyChr10040
     * @tc.number SUB_CryptoFramework_AESKCHR1_01_0040
     * @tc.desc   invalid char at pair-leading nibble of byte 24 zeroes that byte, key stays valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr10040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10040 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccZ0cccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[24]), String(0));
      expect(actResult.getEncoded().data[24]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10040 end');
    });

    /**
     * @tc.name   testAesKeyChr10041
     * @tc.number SUB_CryptoFramework_AESKCHR1_01_0041
     * @tc.desc   invalid char at pair-leading nibble of byte 31 zeroes that byte, key stays valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr10041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10041 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccccccg0');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[31]), String(0));
      expect(actResult.getEncoded().data[31]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10041 end');
    });

    /**
     * @tc.name   testAesKeyChr10042
     * @tc.number SUB_CryptoFramework_AESKCHR1_01_0042
     * @tc.desc   invalid char at pair-leading nibble of byte 31 zeroes that byte, key stays valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr10042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10042 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccccccm0');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[31]), String(0));
      expect(actResult.getEncoded().data[31]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10042 end');
    });

    /**
     * @tc.name   testAesKeyChr10043
     * @tc.number SUB_CryptoFramework_AESKCHR1_01_0043
     * @tc.desc   invalid char at pair-leading nibble of byte 31 zeroes that byte, key stays valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr10043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10043 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccccccccccccccccccccccccccc' +
        'ccccccccccccccccccccccct0');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[31]), String(0));
      expect(actResult.getEncoded().data[31]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10043 end');
    });

    /**
     * @tc.name   testAesKeyChr10044
     * @tc.number SUB_CryptoFramework_AESKCHR1_01_0044
     * @tc.desc   invalid char at pair-leading nibble of byte 31 zeroes that byte, key stays valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr10044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10044 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccccccz0');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[31]), String(0));
      expect(actResult.getEncoded().data[31]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10044 end');
    });

    /**
     * @tc.name   testAesKeyChr10045
     * @tc.number SUB_CryptoFramework_AESKCHR1_01_0045
     * @tc.desc   invalid char at pair-leading nibble of byte 31 zeroes that byte, key stays valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr10045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10045 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccccccG0');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[31]), String(0));
      expect(actResult.getEncoded().data[31]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10045 end');
    });

    /**
     * @tc.name   testAesKeyChr10046
     * @tc.number SUB_CryptoFramework_AESKCHR1_01_0046
     * @tc.desc   invalid char at pair-leading nibble of byte 31 zeroes that byte, key stays valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr10046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10046 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccccccK0');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[31]), String(0));
      expect(actResult.getEncoded().data[31]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10046 end');
    });

    /**
     * @tc.name   testAesKeyChr10047
     * @tc.number SUB_CryptoFramework_AESKCHR1_01_0047
     * @tc.desc   invalid char at pair-leading nibble of byte 31 zeroes that byte, key stays valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr10047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10047 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccccccT0');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[31]), String(0));
      expect(actResult.getEncoded().data[31]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10047 end');
    });

    /**
     * @tc.name   testAesKeyChr10048
     * @tc.number SUB_CryptoFramework_AESKCHR1_01_0048
     * @tc.desc   invalid char at pair-leading nibble of byte 31 zeroes that byte, key stays valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr10048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10048 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccccccZ0');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[31]), String(0));
      expect(actResult.getEncoded().data[31]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10048 end');
    });

    /**
     * @tc.name   testAesKeyChr10049
     * @tc.number SUB_CryptoFramework_AESKCHR1_01_0049
     * @tc.desc   punctuation char at the first pair-leading nibble still zeroes byte 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr10049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10049 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('!0ccccccccccccccccccccccccccccccccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[0]), String(0));
      expect(actResult.getEncoded().data[0]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr10049 end');
    });

  });
}
