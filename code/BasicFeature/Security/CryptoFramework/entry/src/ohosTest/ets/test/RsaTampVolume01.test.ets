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
import { getCachedRsaJson, getCachedRsaPair } from './CryptoVolumeHelper';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_CryptoFramework]';

export default function rsaTampTest() {
  describe('RsaTamp', () => {

    /**
     * @tc.name   testRsaTamp0001
     * @tc.number SUB_CryptoFramework_RSATAMP_01_0001
     * @tc.desc   tampered signature variant 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaTamp0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0001 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyJson: string = await getCachedRsaJson(op);
      const sig: string = await op.rsaConvertAndSign(keyJson, 'probe text');
      const actResult: Boolean = await op.rsaConvertAndVerify(keyJson, 'probe text', '');
      const result: Boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null || !actResult.valueOf()));
      expect(actResult === null || !actResult.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0001 end');
    });

    /**
     * @tc.name   testRsaTamp0002
     * @tc.number SUB_CryptoFramework_RSATAMP_01_0002
     * @tc.desc   tampered signature variant 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaTamp0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0002 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyJson: string = await getCachedRsaJson(op);
      const sig: string = await op.rsaConvertAndSign(keyJson, 'probe text');
      const actResult: Boolean = await op.rsaConvertAndVerify(keyJson, 'probe text', '00');
      const result: Boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null || !actResult.valueOf()));
      expect(actResult === null || !actResult.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0002 end');
    });

    /**
     * @tc.name   testRsaTamp0003
     * @tc.number SUB_CryptoFramework_RSATAMP_01_0003
     * @tc.desc   tampered signature variant 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaTamp0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0003 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyJson: string = await getCachedRsaJson(op);
      const sig: string = await op.rsaConvertAndSign(keyJson, 'probe text');
      const actResult: Boolean =
        await op.rsaConvertAndVerify(keyJson, 'probe text', '000000000000000000000000000000000000000000000000' +
          '000000000000000000000000000000000000000000000000' +
          '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000' +
          '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000' +
          '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000' +
          '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000' +
            '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000');
      const result: Boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null || !actResult.valueOf()));
      expect(actResult === null || !actResult.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0003 end');
    });

    /**
     * @tc.name   testRsaTamp0004
     * @tc.number SUB_CryptoFramework_RSATAMP_01_0004
     * @tc.desc   tampered signature variant 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaTamp0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0004 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyJson: string = await getCachedRsaJson(op);
      const sig: string = await op.rsaConvertAndSign(keyJson, 'probe text');
      const actResult: Boolean =
        await op.rsaConvertAndVerify(keyJson, 'probe text', 'ffffffffffffffffffffffffffffffffffffffffffffffff' +
          'ffffffffffffffffffffffffffffffffffffffffffffffff' +
          'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff' +
        'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff' +
          'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff' +
        'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff' +
          'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff' +
          'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff' +
            'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff');
      const result: Boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null || !actResult.valueOf()));
      expect(actResult === null || !actResult.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0004 end');
    });

    /**
     * @tc.name   testRsaTamp0005
     * @tc.number SUB_CryptoFramework_RSATAMP_01_0005
     * @tc.desc   tampered signature variant 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaTamp0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0005 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyJson: string = await getCachedRsaJson(op);
      const sig: string = await op.rsaConvertAndSign(keyJson, 'probe text');
      const actResult: Boolean =
        await op.rsaConvertAndVerify(keyJson, 'probe text', 'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF' +
          'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF' +
          'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF' +
        'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF' +
          'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF' +
        'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF' +
          'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF' +
          'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF' +
            'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF');
      const result: Boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null || !actResult.valueOf()));
      expect(actResult === null || !actResult.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0005 end');
    });

    /**
     * @tc.name   testRsaTamp0006
     * @tc.number SUB_CryptoFramework_RSATAMP_01_0006
     * @tc.desc   tampered signature variant 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaTamp0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0006 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyJson: string = await getCachedRsaJson(op);
      const sig: string = await op.rsaConvertAndSign(keyJson, 'probe text');
      const actResult: Boolean =
        await op.rsaConvertAndVerify(keyJson, 'probe text', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      const result: Boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null || !actResult.valueOf()));
      expect(actResult === null || !actResult.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0006 end');
    });

    /**
     * @tc.name   testRsaTamp0007
     * @tc.number SUB_CryptoFramework_RSATAMP_01_0007
     * @tc.desc   tampered signature variant 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaTamp0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0007 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyJson: string = await getCachedRsaJson(op);
      const sig: string = await op.rsaConvertAndSign(keyJson, 'probe text');
      const actResult: Boolean =
        await op.rsaConvertAndVerify(keyJson, 'probe text', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      const result: Boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null || !actResult.valueOf()));
      expect(actResult === null || !actResult.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0007 end');
    });

    /**
     * @tc.name   testRsaTamp0008
     * @tc.number SUB_CryptoFramework_RSATAMP_01_0008
     * @tc.desc   tampered signature variant 8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaTamp0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0008 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyJson: string = await getCachedRsaJson(op);
      const sig: string = await op.rsaConvertAndSign(keyJson, 'probe text');
      const actResult: Boolean =
        await op.rsaConvertAndVerify(keyJson, 'probe text', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      const result: Boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null || !actResult.valueOf()));
      expect(actResult === null || !actResult.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0008 end');
    });

    /**
     * @tc.name   testRsaTamp0009
     * @tc.number SUB_CryptoFramework_RSATAMP_01_0009
     * @tc.desc   tampered signature variant 9
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaTamp0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0009 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyJson: string = await getCachedRsaJson(op);
      const sig: string = await op.rsaConvertAndSign(keyJson, 'probe text');
      const actResult: Boolean =
        await op.rsaConvertAndVerify(keyJson, 'probe text', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      const result: Boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null || !actResult.valueOf()));
      expect(actResult === null || !actResult.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0009 end');
    });

    /**
     * @tc.name   testRsaTamp0010
     * @tc.number SUB_CryptoFramework_RSATAMP_01_0010
     * @tc.desc   tampered signature variant 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaTamp0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0010 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyJson: string = await getCachedRsaJson(op);
      const sig: string = await op.rsaConvertAndSign(keyJson, 'probe text');
      const actResult: Boolean =
        await op.rsaConvertAndVerify(keyJson, 'probe text', '000000000000000000000000000000000000000000000000' +
          '000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000' +
          '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000');
      const result: Boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null || !actResult.valueOf()));
      expect(actResult === null || !actResult.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0010 end');
    });

    /**
     * @tc.name   testRsaTamp0011
     * @tc.number SUB_CryptoFramework_RSATAMP_01_0011
     * @tc.desc   tampered signature variant 11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaTamp0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0011 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyJson: string = await getCachedRsaJson(op);
      const sig: string = await op.rsaConvertAndSign(keyJson, 'probe text');
      const actResult: Boolean =
        await op.rsaConvertAndVerify(keyJson, 'probe text', '000000000000000000000000000000000000000000000000' +
          '000000000000000000000000000000000000000000000000' +
          '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000' +
          '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000' +
            '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000' +
          '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000' +
          '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000' +
            '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000' +
          '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000' +
          '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000' +
            '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000' +
          '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000' +
            '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000' +
            '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000' +
              '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000');
      const result: Boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null || !actResult.valueOf()));
      expect(actResult === null || !actResult.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0011 end');
    });

    /**
     * @tc.name   testRsaTamp0012
     * @tc.number SUB_CryptoFramework_RSATAMP_01_0012
     * @tc.desc   tampered signature variant 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaTamp0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0012 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyJson: string = await getCachedRsaJson(op);
      const sig: string = await op.rsaConvertAndSign(keyJson, 'probe text');
      const actResult: Boolean =
        await op.rsaConvertAndVerify(keyJson, 'probe text', 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz' +
          'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz' +
          'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz' +
        'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz' +
          'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz' +
        'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz' +
          'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz' +
          'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz' +
            'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz');
      const result: Boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null || !actResult.valueOf()));
      expect(actResult === null || !actResult.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0012 end');
    });

    /**
     * @tc.name   testRsaTamp0013
     * @tc.number SUB_CryptoFramework_RSATAMP_01_0013
     * @tc.desc   tampered signature variant 13
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaTamp0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0013 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyJson: string = await getCachedRsaJson(op);
      const sig: string = await op.rsaConvertAndSign(keyJson, 'probe text');
      const actResult: Boolean =
        await op.rsaConvertAndVerify(keyJson, 'probe text', 'gggggggggggggggggggggggggggggggggggggggggggggggg' +
          'gggggggggggggggggggggggggggggggggggggggggggggggg' +
          'gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg' +
        'gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg' +
          'gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg' +
        'gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg' +
          'gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg' +
          'gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg' +
            'gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg');
      const result: Boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null || !actResult.valueOf()));
      expect(actResult === null || !actResult.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0013 end');
    });

    /**
     * @tc.name   testRsaTamp0014
     * @tc.number SUB_CryptoFramework_RSATAMP_01_0014
     * @tc.desc   tampered signature variant 14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaTamp0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0014 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyJson: string = await getCachedRsaJson(op);
      const sig: string = await op.rsaConvertAndSign(keyJson, 'probe text');
      const actResult: Boolean =
        await op.rsaConvertAndVerify(keyJson, 'probe text', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaag');
      const result: Boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null || !actResult.valueOf()));
      expect(actResult === null || !actResult.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0014 end');
    });

    /**
     * @tc.name   testRsaTamp0015
     * @tc.number SUB_CryptoFramework_RSATAMP_01_0015
     * @tc.desc   tampered signature variant 15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaTamp0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0015 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyJson: string = await getCachedRsaJson(op);
      const sig: string = await op.rsaConvertAndSign(keyJson, 'probe text');
      const actResult: Boolean =
        await op.rsaConvertAndVerify(keyJson, 'probe text', 'gaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      const result: Boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null || !actResult.valueOf()));
      expect(actResult === null || !actResult.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0015 end');
    });

    /**
     * @tc.name   testRsaTamp0016
     * @tc.number SUB_CryptoFramework_RSATAMP_01_0016
     * @tc.desc   tampered signature variant 16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaTamp0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0016 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyJson: string = await getCachedRsaJson(op);
      const sig: string = await op.rsaConvertAndSign(keyJson, 'probe text');
      const actResult: Boolean =
        await op.rsaConvertAndVerify(keyJson, 'probe text', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'gaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      const result: Boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null || !actResult.valueOf()));
      expect(actResult === null || !actResult.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0016 end');
    });

    /**
     * @tc.name   testRsaTamp0017
     * @tc.number SUB_CryptoFramework_RSATAMP_01_0017
     * @tc.desc   tampered signature variant 17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaTamp0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0017 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyJson: string = await getCachedRsaJson(op);
      const sig: string = await op.rsaConvertAndSign(keyJson, 'probe text');
      const actResult: Boolean =
        await op.rsaConvertAndVerify(keyJson, 'probe text', '                                                ' +
          '                                                ' +
          '                                                                                                ' +
        '                                                                                                ' +
          '                                                                                                ' +
        '                                                                                                ' +
          '                                                                                                ' +
          '                                                                                                ' +
            '                                                                                                ');
      const result: Boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null || !actResult.valueOf()));
      expect(actResult === null || !actResult.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0017 end');
    });

    /**
     * @tc.name   testRsaTamp0018
     * @tc.number SUB_CryptoFramework_RSATAMP_01_0018
     * @tc.desc   tampered signature variant 18
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaTamp0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0018 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyJson: string = await getCachedRsaJson(op);
      const sig: string = await op.rsaConvertAndSign(keyJson, 'probe text');
      const actResult: Boolean =
        await op.rsaConvertAndVerify(keyJson, 'probe text', '------------------------------------------------' +
          '------------------------------------------------' +
          '------------------------------------------------------------------------------------------------' +
        '------------------------------------------------------------------------------------------------' +
          '------------------------------------------------------------------------------------------------' +
        '------------------------------------------------------------------------------------------------' +
          '------------------------------------------------------------------------------------------------' +
          '------------------------------------------------------------------------------------------------' +
            '------------------------------------------------------------------------------------------------');
      const result: Boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null || !actResult.valueOf()));
      expect(actResult === null || !actResult.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0018 end');
    });

    /**
     * @tc.name   testRsaTamp0019
     * @tc.number SUB_CryptoFramework_RSATAMP_01_0019
     * @tc.desc   tampered signature variant 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaTamp0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0019 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyJson: string = await getCachedRsaJson(op);
      const sig: string = await op.rsaConvertAndSign(keyJson, 'probe text');
      const actResult: Boolean =
        await op.rsaConvertAndVerify(keyJson, 'probe text', '++++++++++++++++++++++++++++++++++++++++++++++++' +
          '++++++++++++++++++++++++++++++++++++++++++++++++' +
          '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++' +
        '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++' +
          '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++' +
        '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++' +
          '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++' +
          '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++' +
            '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
      const result: Boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null || !actResult.valueOf()));
      expect(actResult === null || !actResult.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0019 end');
    });

    /**
     * @tc.name   testRsaTamp0020
     * @tc.number SUB_CryptoFramework_RSATAMP_01_0020
     * @tc.desc   tampered signature variant 20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaTamp0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0020 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyJson: string = await getCachedRsaJson(op);
      const sig: string = await op.rsaConvertAndSign(keyJson, 'probe text');
      const actResult: Boolean =
        await op.rsaConvertAndVerify(keyJson, 'probe text', 'eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee' +
          'eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee' +
          'eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee' +
        'eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee' +
          'eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee' +
        'eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee' +
          'eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee' +
          'eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee' +
            'eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeezzzzzzzz');
      const result: Boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null || !actResult.valueOf()));
      expect(actResult === null || !actResult.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0020 end');
    });

    /**
     * @tc.name   testRsaTamp0021
     * @tc.number SUB_CryptoFramework_RSATAMP_01_0021
     * @tc.desc   tampered signature variant 21
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaTamp0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0021 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyJson: string = await getCachedRsaJson(op);
      const sig: string = await op.rsaConvertAndSign(keyJson, 'probe text');
      const actResult: Boolean =
        await op.rsaConvertAndVerify(keyJson, 'probe text', '999999999999999999999999999999999999999999999999' +
          '999999999999999999999999999999999999999999999999' +
          '999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999' +
        '999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999' +
          '999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999' +
        '999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999' +
          '999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999' +
          '999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999' +
            '999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999');
      const result: Boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null || !actResult.valueOf()));
      expect(actResult === null || !actResult.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0021 end');
    });

    /**
     * @tc.name   testRsaTamp0022
     * @tc.number SUB_CryptoFramework_RSATAMP_01_0022
     * @tc.desc   tampered signature variant 22
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaTamp0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0022 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyJson: string = await getCachedRsaJson(op);
      const sig: string = await op.rsaConvertAndSign(keyJson, 'probe text');
      const actResult: Boolean =
        await op.rsaConvertAndVerify(keyJson, 'probe text', '111111111111111111111111111111111111111111111111' +
          '111111111111111111111111111111111111111111111111' +
          '111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111' +
        '111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111' +
          '111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111' +
        '111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111' +
          '111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111' +
          '111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111' +
            '111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111');
      const result: Boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null || !actResult.valueOf()));
      expect(actResult === null || !actResult.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0022 end');
    });

    /**
     * @tc.name   testRsaTamp0023
     * @tc.number SUB_CryptoFramework_RSATAMP_01_0023
     * @tc.desc   tampered signature variant 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaTamp0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0023 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyJson: string = await getCachedRsaJson(op);
      const sig: string = await op.rsaConvertAndSign(keyJson, 'probe text');
      const actResult: Boolean =
        await op.rsaConvertAndVerify(keyJson, 'probe text', 'abababababababababababababababababababababababab' +
          'abababababababababababababababababababababababab' +
          'abababababababababababababababababababababababababababababababababababababababababababababababab' +
        'abababababababababababababababababababababababababababababababababababababababababababababababab' +
          'abababababababababababababababababababababababababababababababababababababababababababababababab' +
        'abababababababababababababababababababababababababababababababababababababababababababababababab' +
          'abababababababababababababababababababababababababababababababababababababababababababababababab' +
          'abababababababababababababababababababababababababababababababababababababababababababababababab' +
            'abababababababababababababababababababababababababababababababababababababababababababababababab');
      const result: Boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null || !actResult.valueOf()));
      expect(actResult === null || !actResult.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0023 end');
    });

    /**
     * @tc.name   testRsaTamp0024
     * @tc.number SUB_CryptoFramework_RSATAMP_01_0024
     * @tc.desc   tampered signature variant 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaTamp0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0024 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyJson: string = await getCachedRsaJson(op);
      const sig: string = await op.rsaConvertAndSign(keyJson, 'probe text');
      const actResult: Boolean =
        await op.rsaConvertAndVerify(keyJson, 'probe text', '0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f' +
          '0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f' +
          '0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f' +
        '0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f' +
          '0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f' +
        '0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f' +
          '0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f' +
          '0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f' +
            '0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f');
      const result: Boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null || !actResult.valueOf()));
      expect(actResult === null || !actResult.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0024 end');
    });

    /**
     * @tc.name   testRsaTamp0025
     * @tc.number SUB_CryptoFramework_RSATAMP_01_0025
     * @tc.desc   tampered signature variant 25
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaTamp0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0025 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyJson: string = await getCachedRsaJson(op);
      const sig: string = await op.rsaConvertAndSign(keyJson, 'probe text');
      const actResult: Boolean =
        await op.rsaConvertAndVerify(keyJson, 'probe text', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab');
      const result: Boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null || !actResult.valueOf()));
      expect(actResult === null || !actResult.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0025 end');
    });

    /**
     * @tc.name   testRsaTamp0026
     * @tc.number SUB_CryptoFramework_RSATAMP_01_0026
     * @tc.desc   tampered signature variant 26
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaTamp0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0026 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyJson: string = await getCachedRsaJson(op);
      const sig: string = await op.rsaConvertAndSign(keyJson, 'probe text');
      const actResult: Boolean =
        await op.rsaConvertAndVerify(keyJson, 'probe text', '010101010101010101010101010101010101010101010101' +
          '010101010101010101010101010101010101010101010101' +
          '010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101' +
        '010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101' +
          '010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101' +
        '010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101' +
          '010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101' +
          '010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101' +
            '010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101');
      const result: Boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null || !actResult.valueOf()));
      expect(actResult === null || !actResult.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0026 end');
    });

    /**
     * @tc.name   testRsaTamp0027
     * @tc.number SUB_CryptoFramework_RSATAMP_01_0027
     * @tc.desc   tampered signature variant 27
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaTamp0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0027 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyJson: string = await getCachedRsaJson(op);
      const sig: string = await op.rsaConvertAndSign(keyJson, 'probe text');
      const actResult: Boolean =
        await op.rsaConvertAndVerify(keyJson, 'probe text', '101010101010101010101010101010101010101010101010' +
          '101010101010101010101010101010101010101010101010' +
          '101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010' +
        '101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010' +
          '101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010' +
        '101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010' +
          '101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010' +
          '101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010' +
            '101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010');
      const result: Boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null || !actResult.valueOf()));
      expect(actResult === null || !actResult.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0027 end');
    });

    /**
     * @tc.name   testRsaTamp0028
     * @tc.number SUB_CryptoFramework_RSATAMP_01_0028
     * @tc.desc   tampered signature variant 28
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaTamp0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0028 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyJson: string = await getCachedRsaJson(op);
      const sig: string = await op.rsaConvertAndSign(keyJson, 'probe text');
      const actResult: Boolean =
        await op.rsaConvertAndVerify(keyJson, 'probe text', 'ffffffffffffffffffffffffffffffffffffffffffffffff' +
          'ffffffffffffffffffffffffffffffffffffffffffffffff' +
          'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff' +
        'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff' +
          'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff' +
        'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff' +
          'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff' +
          'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff' +
            'fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe');
      const result: Boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null || !actResult.valueOf()));
      expect(actResult === null || !actResult.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0028 end');
    });

    /**
     * @tc.name   testRsaTamp0029
     * @tc.number SUB_CryptoFramework_RSATAMP_01_0029
     * @tc.desc   tampered signature variant 29
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaTamp0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0029 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyJson: string = await getCachedRsaJson(op);
      const sig: string = await op.rsaConvertAndSign(keyJson, 'probe text');
      const actResult: Boolean =
        await op.rsaConvertAndVerify(keyJson, 'probe text', '7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f' +
          '7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f' +
          '7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f' +
        '7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f' +
          '7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f' +
        '7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f' +
          '7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f' +
          '7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f' +
            '7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f');
      const result: Boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null || !actResult.valueOf()));
      expect(actResult === null || !actResult.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0029 end');
    });

    /**
     * @tc.name   testRsaTamp0030
     * @tc.number SUB_CryptoFramework_RSATAMP_01_0030
     * @tc.desc   tampered signature variant 30
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaTamp0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0030 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyJson: string = await getCachedRsaJson(op);
      const sig: string = await op.rsaConvertAndSign(keyJson, 'probe text');
      const actResult: Boolean =
        await op.rsaConvertAndVerify(keyJson, 'probe text', '808080808080808080808080808080808080808080808080' +
          '808080808080808080808080808080808080808080808080' +
          '808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080' +
        '808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080' +
          '808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080' +
        '808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080' +
          '808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080' +
          '808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080' +
            '808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080');
      const result: Boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null || !actResult.valueOf()));
      expect(actResult === null || !actResult.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0030 end');
    });

    /**
     * @tc.name   testRsaTamp0031
     * @tc.number SUB_CryptoFramework_RSATAMP_01_0031
     * @tc.desc   未篡改签名验签必须通过（篡改桶的合法对照）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaTamp0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0031 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyJson: string = await getCachedRsaJson(op);
      const sig: string = await op.rsaConvertAndSign(keyJson, 'probe text');
      const verifyRes: Boolean = await op.rsaConvertAndVerify(keyJson, 'probe text', sig);
      const passed: boolean = verifyRes !== null && verifyRes.valueOf();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(passed), 'true');
      expect(passed).assertTrue();
      expect(sig.length).assertEqual(768);
      expect(verifyRes === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaTamp0031 end');
    });

  });
}
