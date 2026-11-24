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

export default function aesKeyChr2Test() {
  describe('AesKeyChr2', () => {

    /**
     * @tc.name   testAesKeyChr20001
     * @tc.number SUB_CryptoFramework_AESKCHR2_01_0001
     * @tc.desc   invalid char at pair-trailing nibble of byte 0 keeps the high nibble, byte becomes 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20001 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('cgccccccccccccccccccccccccccccccccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[0]), String(12));
      expect(actResult.getEncoded().data[0]).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20001 end');
    });

    /**
     * @tc.name   testAesKeyChr20002
     * @tc.number SUB_CryptoFramework_AESKCHR2_01_0002
     * @tc.desc   invalid char at pair-trailing nibble of byte 0 keeps the high nibble, byte becomes 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr20002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20002 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('cmccccccccccccccccccccccccccccccccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[0]), String(12));
      expect(actResult.getEncoded().data[0]).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20002 end');
    });

    /**
     * @tc.name   testAesKeyChr20003
     * @tc.number SUB_CryptoFramework_AESKCHR2_01_0003
     * @tc.desc   invalid char at pair-trailing nibble of byte 0 keeps the high nibble, byte becomes 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr20003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20003 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ctccccccccccccccccccccccccccccccccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[0]), String(12));
      expect(actResult.getEncoded().data[0]).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20003 end');
    });

    /**
     * @tc.name   testAesKeyChr20004
     * @tc.number SUB_CryptoFramework_AESKCHR2_01_0004
     * @tc.desc   invalid char at pair-trailing nibble of byte 0 keeps the high nibble, byte becomes 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr20004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20004 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('czccccccccccccccccccccccccccccccccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[0]), String(12));
      expect(actResult.getEncoded().data[0]).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20004 end');
    });

    /**
     * @tc.name   testAesKeyChr20005
     * @tc.number SUB_CryptoFramework_AESKCHR2_01_0005
     * @tc.desc   invalid char at pair-trailing nibble of byte 0 keeps the high nibble, byte becomes 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr20005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20005 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('cGccccccccccccccccccccccccccccccccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[0]), String(12));
      expect(actResult.getEncoded().data[0]).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20005 end');
    });

    /**
     * @tc.name   testAesKeyChr20006
     * @tc.number SUB_CryptoFramework_AESKCHR2_01_0006
     * @tc.desc   invalid char at pair-trailing nibble of byte 0 keeps the high nibble, byte becomes 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr20006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20006 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('cKccccccccccccccccccccccccccccccccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[0]), String(12));
      expect(actResult.getEncoded().data[0]).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20006 end');
    });

    /**
     * @tc.name   testAesKeyChr20007
     * @tc.number SUB_CryptoFramework_AESKCHR2_01_0007
     * @tc.desc   invalid char at pair-trailing nibble of byte 0 keeps the high nibble, byte becomes 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr20007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20007 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('cTccccccccccccccccccccccccccccccccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[0]), String(12));
      expect(actResult.getEncoded().data[0]).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20007 end');
    });

    /**
     * @tc.name   testAesKeyChr20008
     * @tc.number SUB_CryptoFramework_AESKCHR2_01_0008
     * @tc.desc   invalid char at pair-trailing nibble of byte 0 keeps the high nibble, byte becomes 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr20008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20008 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('cZccccccccccccccccccccccccccccccccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[0]), String(12));
      expect(actResult.getEncoded().data[0]).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20008 end');
    });

    /**
     * @tc.name   testAesKeyChr20009
     * @tc.number SUB_CryptoFramework_AESKCHR2_01_0009
     * @tc.desc   invalid char at pair-trailing nibble of byte 7 keeps the high nibble, byte becomes 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr20009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20009 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccgccccccccccccccccccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[7]), String(12));
      expect(actResult.getEncoded().data[7]).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20009 end');
    });

    /**
     * @tc.name   testAesKeyChr20010
     * @tc.number SUB_CryptoFramework_AESKCHR2_01_0010
     * @tc.desc   invalid char at pair-trailing nibble of byte 7 keeps the high nibble, byte becomes 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr20010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20010 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccmccccccccccccccccccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[7]), String(12));
      expect(actResult.getEncoded().data[7]).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20010 end');
    });

    /**
     * @tc.name   testAesKeyChr20011
     * @tc.number SUB_CryptoFramework_AESKCHR2_01_0011
     * @tc.desc   invalid char at pair-trailing nibble of byte 7 keeps the high nibble, byte becomes 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr20011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20011 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccctccccccccccccccccccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[7]), String(12));
      expect(actResult.getEncoded().data[7]).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20011 end');
    });

    /**
     * @tc.name   testAesKeyChr20012
     * @tc.number SUB_CryptoFramework_AESKCHR2_01_0012
     * @tc.desc   invalid char at pair-trailing nibble of byte 7 keeps the high nibble, byte becomes 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr20012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20012 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccczccccccccccccccccccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[7]), String(12));
      expect(actResult.getEncoded().data[7]).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20012 end');
    });

    /**
     * @tc.name   testAesKeyChr20013
     * @tc.number SUB_CryptoFramework_AESKCHR2_01_0013
     * @tc.desc   invalid char at pair-trailing nibble of byte 7 keeps the high nibble, byte becomes 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr20013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20013 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccGccccccccccccccccccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[7]), String(12));
      expect(actResult.getEncoded().data[7]).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20013 end');
    });

    /**
     * @tc.name   testAesKeyChr20014
     * @tc.number SUB_CryptoFramework_AESKCHR2_01_0014
     * @tc.desc   invalid char at pair-trailing nibble of byte 7 keeps the high nibble, byte becomes 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr20014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20014 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccKccccccccccccccccccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[7]), String(12));
      expect(actResult.getEncoded().data[7]).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20014 end');
    });

    /**
     * @tc.name   testAesKeyChr20015
     * @tc.number SUB_CryptoFramework_AESKCHR2_01_0015
     * @tc.desc   invalid char at pair-trailing nibble of byte 7 keeps the high nibble, byte becomes 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr20015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20015 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccTccccccccccccccccccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[7]), String(12));
      expect(actResult.getEncoded().data[7]).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20015 end');
    });

    /**
     * @tc.name   testAesKeyChr20016
     * @tc.number SUB_CryptoFramework_AESKCHR2_01_0016
     * @tc.desc   invalid char at pair-trailing nibble of byte 7 keeps the high nibble, byte becomes 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr20016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20016 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccZccccccccccccccccccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[7]), String(12));
      expect(actResult.getEncoded().data[7]).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20016 end');
    });

    /**
     * @tc.name   testAesKeyChr20017
     * @tc.number SUB_CryptoFramework_AESKCHR2_01_0017
     * @tc.desc   invalid char at pair-trailing nibble of byte 15 keeps the high nibble, byte becomes 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr20017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20017 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccgccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[15]), String(12));
      expect(actResult.getEncoded().data[15]).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20017 end');
    });

    /**
     * @tc.name   testAesKeyChr20018
     * @tc.number SUB_CryptoFramework_AESKCHR2_01_0018
     * @tc.desc   invalid char at pair-trailing nibble of byte 15 keeps the high nibble, byte becomes 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr20018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20018 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccmccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[15]), String(12));
      expect(actResult.getEncoded().data[15]).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20018 end');
    });

    /**
     * @tc.name   testAesKeyChr20019
     * @tc.number SUB_CryptoFramework_AESKCHR2_01_0019
     * @tc.desc   invalid char at pair-trailing nibble of byte 15 keeps the high nibble, byte becomes 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr20019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20019 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccccccccccccccccccctccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[15]), String(12));
      expect(actResult.getEncoded().data[15]).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20019 end');
    });

    /**
     * @tc.name   testAesKeyChr20020
     * @tc.number SUB_CryptoFramework_AESKCHR2_01_0020
     * @tc.desc   invalid char at pair-trailing nibble of byte 15 keeps the high nibble, byte becomes 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr20020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20020 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccccccccccccccccccczccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[15]), String(12));
      expect(actResult.getEncoded().data[15]).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20020 end');
    });

    /**
     * @tc.name   testAesKeyChr20021
     * @tc.number SUB_CryptoFramework_AESKCHR2_01_0021
     * @tc.desc   invalid char at pair-trailing nibble of byte 15 keeps the high nibble, byte becomes 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr20021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20021 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccGccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[15]), String(12));
      expect(actResult.getEncoded().data[15]).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20021 end');
    });

    /**
     * @tc.name   testAesKeyChr20022
     * @tc.number SUB_CryptoFramework_AESKCHR2_01_0022
     * @tc.desc   invalid char at pair-trailing nibble of byte 15 keeps the high nibble, byte becomes 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr20022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20022 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccKccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[15]), String(12));
      expect(actResult.getEncoded().data[15]).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20022 end');
    });

    /**
     * @tc.name   testAesKeyChr20023
     * @tc.number SUB_CryptoFramework_AESKCHR2_01_0023
     * @tc.desc   invalid char at pair-trailing nibble of byte 15 keeps the high nibble, byte becomes 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr20023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20023 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccTccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[15]), String(12));
      expect(actResult.getEncoded().data[15]).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20023 end');
    });

    /**
     * @tc.name   testAesKeyChr20024
     * @tc.number SUB_CryptoFramework_AESKCHR2_01_0024
     * @tc.desc   invalid char at pair-trailing nibble of byte 15 keeps the high nibble, byte becomes 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr20024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20024 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccZccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[15]), String(12));
      expect(actResult.getEncoded().data[15]).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20024 end');
    });

    /**
     * @tc.name   testAesKeyChr20025
     * @tc.number SUB_CryptoFramework_AESKCHR2_01_0025
     * @tc.desc   invalid char at pair-trailing nibble of byte 23 keeps the high nibble, byte becomes 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr20025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20025 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccccccccccccccccccccccccccc' +
        'ccccccccgcccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[23]), String(12));
      expect(actResult.getEncoded().data[23]).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20025 end');
    });

    /**
     * @tc.name   testAesKeyChr20026
     * @tc.number SUB_CryptoFramework_AESKCHR2_01_0026
     * @tc.desc   invalid char at pair-trailing nibble of byte 23 keeps the high nibble, byte becomes 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr20026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20026 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccccccccccccccccccccccccccc' +
        'ccccccccmcccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[23]), String(12));
      expect(actResult.getEncoded().data[23]).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20026 end');
    });

    /**
     * @tc.name   testAesKeyChr20027
     * @tc.number SUB_CryptoFramework_AESKCHR2_01_0027
     * @tc.desc   invalid char at pair-trailing nibble of byte 23 keeps the high nibble, byte becomes 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr20027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20027 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccccccccccccccccccccccccccc' +
        'cccccccctcccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[23]), String(12));
      expect(actResult.getEncoded().data[23]).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20027 end');
    });

    /**
     * @tc.name   testAesKeyChr20028
     * @tc.number SUB_CryptoFramework_AESKCHR2_01_0028
     * @tc.desc   invalid char at pair-trailing nibble of byte 23 keeps the high nibble, byte becomes 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr20028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20028 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccccccccccccccccccccccccccc' +
        'cccccccczcccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[23]), String(12));
      expect(actResult.getEncoded().data[23]).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20028 end');
    });

    /**
     * @tc.name   testAesKeyChr20029
     * @tc.number SUB_CryptoFramework_AESKCHR2_01_0029
     * @tc.desc   invalid char at pair-trailing nibble of byte 23 keeps the high nibble, byte becomes 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr20029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20029 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccccccccccccccccccccccccccc' +
        'ccccccccGcccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[23]), String(12));
      expect(actResult.getEncoded().data[23]).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20029 end');
    });

    /**
     * @tc.name   testAesKeyChr20030
     * @tc.number SUB_CryptoFramework_AESKCHR2_01_0030
     * @tc.desc   invalid char at pair-trailing nibble of byte 23 keeps the high nibble, byte becomes 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr20030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20030 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccccccccccccccccccccccccccc' +
        'ccccccccKcccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[23]), String(12));
      expect(actResult.getEncoded().data[23]).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20030 end');
    });

    /**
     * @tc.name   testAesKeyChr20031
     * @tc.number SUB_CryptoFramework_AESKCHR2_01_0031
     * @tc.desc   invalid char at pair-trailing nibble of byte 23 keeps the high nibble, byte becomes 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr20031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20031 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccccccccccccccccccccccccccc' +
        'ccccccccTcccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[23]), String(12));
      expect(actResult.getEncoded().data[23]).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20031 end');
    });

    /**
     * @tc.name   testAesKeyChr20032
     * @tc.number SUB_CryptoFramework_AESKCHR2_01_0032
     * @tc.desc   invalid char at pair-trailing nibble of byte 23 keeps the high nibble, byte becomes 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr20032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20032 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccccccccccccccccccccccccccc' +
        'ccccccccZcccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[23]), String(12));
      expect(actResult.getEncoded().data[23]).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20032 end');
    });

    /**
     * @tc.name   testAesKeyChr20033
     * @tc.number SUB_CryptoFramework_AESKCHR2_01_0033
     * @tc.desc   invalid char at pair-trailing nibble of byte 31 keeps the high nibble, byte becomes 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr20033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20033 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccccccccccccccccccccccccccc' +
        'ccccccccccccccccccccccccg');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[31]), String(12));
      expect(actResult.getEncoded().data[31]).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20033 end');
    });

    /**
     * @tc.name   testAesKeyChr20034
     * @tc.number SUB_CryptoFramework_AESKCHR2_01_0034
     * @tc.desc   invalid char at pair-trailing nibble of byte 31 keeps the high nibble, byte becomes 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr20034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20034 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccccccccccccccccccccccccccc' +
        'ccccccccccccccccccccccccm');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[31]), String(12));
      expect(actResult.getEncoded().data[31]).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20034 end');
    });

    /**
     * @tc.name   testAesKeyChr20035
     * @tc.number SUB_CryptoFramework_AESKCHR2_01_0035
     * @tc.desc   invalid char at pair-trailing nibble of byte 31 keeps the high nibble, byte becomes 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr20035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20035 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccccccct');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[31]), String(12));
      expect(actResult.getEncoded().data[31]).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20035 end');
    });

    /**
     * @tc.name   testAesKeyChr20036
     * @tc.number SUB_CryptoFramework_AESKCHR2_01_0036
     * @tc.desc   invalid char at pair-trailing nibble of byte 31 keeps the high nibble, byte becomes 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr20036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20036 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccccccccccccccccccccccccccc' +
        'ccccccccccccccccccccccccz');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[31]), String(12));
      expect(actResult.getEncoded().data[31]).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20036 end');
    });

    /**
     * @tc.name   testAesKeyChr20037
     * @tc.number SUB_CryptoFramework_AESKCHR2_01_0037
     * @tc.desc   invalid char at pair-trailing nibble of byte 31 keeps the high nibble, byte becomes 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr20037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20037 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccccccccccccccccccccccccccc' +
        'ccccccccccccccccccccccccG');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[31]), String(12));
      expect(actResult.getEncoded().data[31]).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20037 end');
    });

    /**
     * @tc.name   testAesKeyChr20038
     * @tc.number SUB_CryptoFramework_AESKCHR2_01_0038
     * @tc.desc   invalid char at pair-trailing nibble of byte 31 keeps the high nibble, byte becomes 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr20038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20038 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccccccccccccccccccccccccccc' +
        'ccccccccccccccccccccccccK');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[31]), String(12));
      expect(actResult.getEncoded().data[31]).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20038 end');
    });

    /**
     * @tc.name   testAesKeyChr20039
     * @tc.number SUB_CryptoFramework_AESKCHR2_01_0039
     * @tc.desc   invalid char at pair-trailing nibble of byte 31 keeps the high nibble, byte becomes 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr20039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20039 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccccccccccccccccccccccccccc' +
        'ccccccccccccccccccccccccT');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[31]), String(12));
      expect(actResult.getEncoded().data[31]).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20039 end');
    });

    /**
     * @tc.name   testAesKeyChr20040
     * @tc.number SUB_CryptoFramework_AESKCHR2_01_0040
     * @tc.desc   invalid char at pair-trailing nibble of byte 31 keeps the high nibble, byte becomes 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr20040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20040 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ccccccccccccccccccccccccccccccccccccccc' +
        'ccccccccccccccccccccccccZ');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[31]), String(12));
      expect(actResult.getEncoded().data[31]).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20040 end');
    });

    /**
     * @tc.name   testAesKeyChr20041
     * @tc.number SUB_CryptoFramework_AESKCHR2_01_0041
     * @tc.desc   punctuation char at the first pair-trailing nibble keeps the parsed high nibble value 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyChr20041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20041 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: cryptoFramework.SymKey = await op.convertAesKey('cccccccccccccccccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccc');
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('c#ccccccccccccccccccccccccccccccccccccc' +
        'ccccccccccccccccccccccccc');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data[0]), String(12));
      expect(actResult.getEncoded().data[0]).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyChr20041 end');
    });

  });
}
