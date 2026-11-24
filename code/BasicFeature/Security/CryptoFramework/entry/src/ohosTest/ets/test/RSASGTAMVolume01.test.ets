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

export default function rsaSgTampTest() {
  describe('RsaSgTamp', () => {

    /**
     * @tc.name   testRsaSgTamp0001
     * @tc.number SUB_CryptoFramework_RSASGTAM_01_0001
     * @tc.desc   nibble complement of the first signature hex char fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgTamp0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0001 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const tampered: string = sig.slice(0, 0) + (15 - parseInt(sig.charAt(0), 16)).toString(16) + sig.slice(0 + 1);
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', tampered);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0001 end');
    });

    /**
     * @tc.name   testRsaSgTamp0002
     * @tc.number SUB_CryptoFramework_RSASGTAM_01_0002
     * @tc.desc   nibble complement of the signature hex at position 1 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgTamp0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0002 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const tampered: string = sig.slice(0, 1) + (15 - parseInt(sig.charAt(1), 16)).toString(16) + sig.slice(1 + 1);
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', tampered);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0002 end');
    });

    /**
     * @tc.name   testRsaSgTamp0003
     * @tc.number SUB_CryptoFramework_RSASGTAM_01_0003
     * @tc.desc   nibble complement of the signature hex at position 2 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgTamp0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0003 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const tampered: string = sig.slice(0, 2) + (15 - parseInt(sig.charAt(2), 16)).toString(16) + sig.slice(2 + 1);
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', tampered);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0003 end');
    });

    /**
     * @tc.name   testRsaSgTamp0004
     * @tc.number SUB_CryptoFramework_RSASGTAM_01_0004
     * @tc.desc   nibble complement of the signature hex at position 3 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgTamp0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0004 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const tampered: string = sig.slice(0, 3) + (15 - parseInt(sig.charAt(3), 16)).toString(16) + sig.slice(3 + 1);
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', tampered);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0004 end');
    });

    /**
     * @tc.name   testRsaSgTamp0005
     * @tc.number SUB_CryptoFramework_RSASGTAM_01_0005
     * @tc.desc   nibble complement of the signature hex at position 4 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgTamp0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0005 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const tampered: string = sig.slice(0, 4) + (15 - parseInt(sig.charAt(4), 16)).toString(16) + sig.slice(4 + 1);
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', tampered);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0005 end');
    });

    /**
     * @tc.name   testRsaSgTamp0006
     * @tc.number SUB_CryptoFramework_RSASGTAM_01_0006
     * @tc.desc   nibble complement of the signature hex at position 5 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgTamp0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0006 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const tampered: string = sig.slice(0, 5) + (15 - parseInt(sig.charAt(5), 16)).toString(16) + sig.slice(5 + 1);
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', tampered);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0006 end');
    });

    /**
     * @tc.name   testRsaSgTamp0007
     * @tc.number SUB_CryptoFramework_RSASGTAM_01_0007
     * @tc.desc   nibble complement of the signature hex at position 6 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgTamp0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0007 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const tampered: string = sig.slice(0, 6) + (15 - parseInt(sig.charAt(6), 16)).toString(16) + sig.slice(6 + 1);
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', tampered);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0007 end');
    });

    /**
     * @tc.name   testRsaSgTamp0008
     * @tc.number SUB_CryptoFramework_RSASGTAM_01_0008
     * @tc.desc   nibble complement of the signature hex at position 7 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgTamp0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0008 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const tampered: string = sig.slice(0, 7) + (15 - parseInt(sig.charAt(7), 16)).toString(16) + sig.slice(7 + 1);
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', tampered);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0008 end');
    });

    /**
     * @tc.name   testRsaSgTamp0009
     * @tc.number SUB_CryptoFramework_RSASGTAM_01_0009
     * @tc.desc   nibble complement of the signature hex at position 8 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgTamp0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0009 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const tampered: string = sig.slice(0, 8) + (15 - parseInt(sig.charAt(8), 16)).toString(16) + sig.slice(8 + 1);
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', tampered);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0009 end');
    });

    /**
     * @tc.name   testRsaSgTamp0010
     * @tc.number SUB_CryptoFramework_RSASGTAM_01_0010
     * @tc.desc   nibble complement of the signature hex at position 9 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgTamp0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0010 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const tampered: string = sig.slice(0, 9) + (15 - parseInt(sig.charAt(9), 16)).toString(16) + sig.slice(9 + 1);
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', tampered);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0010 end');
    });

    /**
     * @tc.name   testRsaSgTamp0011
     * @tc.number SUB_CryptoFramework_RSASGTAM_01_0011
     * @tc.desc   nibble complement of the signature hex at position 10 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgTamp0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0011 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const tampered: string = sig.slice(0, 10) + (15 - parseInt(sig.charAt(10), 16)).toString(16) + sig.slice(10 + 1);
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', tampered);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0011 end');
    });

    /**
     * @tc.name   testRsaSgTamp0012
     * @tc.number SUB_CryptoFramework_RSASGTAM_01_0012
     * @tc.desc   nibble complement of the signature hex at position 11 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgTamp0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0012 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const tampered: string = sig.slice(0, 11) + (15 - parseInt(sig.charAt(11), 16)).toString(16) + sig.slice(11 + 1);
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', tampered);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0012 end');
    });

    /**
     * @tc.name   testRsaSgTamp0013
     * @tc.number SUB_CryptoFramework_RSASGTAM_01_0013
     * @tc.desc   nibble complement of the signature hex at position 12 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgTamp0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0013 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const tampered: string = sig.slice(0, 12) + (15 - parseInt(sig.charAt(12), 16)).toString(16) + sig.slice(12 + 1);
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', tampered);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0013 end');
    });

    /**
     * @tc.name   testRsaSgTamp0014
     * @tc.number SUB_CryptoFramework_RSASGTAM_01_0014
     * @tc.desc   nibble complement of the signature hex at position 13 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgTamp0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0014 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const tampered: string = sig.slice(0, 13) + (15 - parseInt(sig.charAt(13), 16)).toString(16) + sig.slice(13 + 1);
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', tampered);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0014 end');
    });

    /**
     * @tc.name   testRsaSgTamp0015
     * @tc.number SUB_CryptoFramework_RSASGTAM_01_0015
     * @tc.desc   nibble complement of the signature hex at position 14 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgTamp0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0015 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const tampered: string = sig.slice(0, 14) + (15 - parseInt(sig.charAt(14), 16)).toString(16) + sig.slice(14 + 1);
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', tampered);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0015 end');
    });

    /**
     * @tc.name   testRsaSgTamp0016
     * @tc.number SUB_CryptoFramework_RSASGTAM_01_0016
     * @tc.desc   nibble complement of the signature hex at position 15 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgTamp0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0016 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const tampered: string = sig.slice(0, 15) + (15 - parseInt(sig.charAt(15), 16)).toString(16) + sig.slice(15 + 1);
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', tampered);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0016 end');
    });

    /**
     * @tc.name   testRsaSgTamp0017
     * @tc.number SUB_CryptoFramework_RSASGTAM_01_0017
     * @tc.desc   nibble complement of the signature hex at position 16 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgTamp0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0017 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const tampered: string = sig.slice(0, 16) + (15 - parseInt(sig.charAt(16), 16)).toString(16) + sig.slice(16 + 1);
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', tampered);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0017 end');
    });

    /**
     * @tc.name   testRsaSgTamp0018
     * @tc.number SUB_CryptoFramework_RSASGTAM_01_0018
     * @tc.desc   nibble complement of the signature hex at position 17 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgTamp0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0018 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const tampered: string = sig.slice(0, 17) + (15 - parseInt(sig.charAt(17), 16)).toString(16) + sig.slice(17 + 1);
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', tampered);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0018 end');
    });

    /**
     * @tc.name   testRsaSgTamp0019
     * @tc.number SUB_CryptoFramework_RSASGTAM_01_0019
     * @tc.desc   nibble complement of the signature hex at position 18 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgTamp0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0019 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const tampered: string = sig.slice(0, 18) + (15 - parseInt(sig.charAt(18), 16)).toString(16) + sig.slice(18 + 1);
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', tampered);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0019 end');
    });

    /**
     * @tc.name   testRsaSgTamp0020
     * @tc.number SUB_CryptoFramework_RSASGTAM_01_0020
     * @tc.desc   nibble complement of the signature hex at position 19 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgTamp0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0020 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const tampered: string = sig.slice(0, 19) + (15 - parseInt(sig.charAt(19), 16)).toString(16) + sig.slice(19 + 1);
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', tampered);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0020 end');
    });

    /**
     * @tc.name   testRsaSgTamp0021
     * @tc.number SUB_CryptoFramework_RSASGTAM_01_0021
     * @tc.desc   nibble complement of the signature hex at position 20 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgTamp0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0021 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const tampered: string = sig.slice(0, 20) + (15 - parseInt(sig.charAt(20), 16)).toString(16) + sig.slice(20 + 1);
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', tampered);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0021 end');
    });

    /**
     * @tc.name   testRsaSgTamp0022
     * @tc.number SUB_CryptoFramework_RSASGTAM_01_0022
     * @tc.desc   nibble complement of the signature hex at position 21 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgTamp0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0022 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const tampered: string = sig.slice(0, 21) + (15 - parseInt(sig.charAt(21), 16)).toString(16) + sig.slice(21 + 1);
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', tampered);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0022 end');
    });

    /**
     * @tc.name   testRsaSgTamp0023
     * @tc.number SUB_CryptoFramework_RSASGTAM_01_0023
     * @tc.desc   nibble complement of the signature hex at position 22 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgTamp0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0023 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const tampered: string = sig.slice(0, 22) + (15 - parseInt(sig.charAt(22), 16)).toString(16) + sig.slice(22 + 1);
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', tampered);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0023 end');
    });

    /**
     * @tc.name   testRsaSgTamp0024
     * @tc.number SUB_CryptoFramework_RSASGTAM_01_0024
     * @tc.desc   nibble complement of the signature hex at position 23 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgTamp0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0024 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const tampered: string = sig.slice(0, 23) + (15 - parseInt(sig.charAt(23), 16)).toString(16) + sig.slice(23 + 1);
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', tampered);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0024 end');
    });

    /**
     * @tc.name   testRsaSgTamp0025
     * @tc.number SUB_CryptoFramework_RSASGTAM_01_0025
     * @tc.desc   nibble complement of the signature hex at position 24 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgTamp0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0025 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const tampered: string = sig.slice(0, 24) + (15 - parseInt(sig.charAt(24), 16)).toString(16) + sig.slice(24 + 1);
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', tampered);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0025 end');
    });

    /**
     * @tc.name   testRsaSgTamp0026
     * @tc.number SUB_CryptoFramework_RSASGTAM_01_0026
     * @tc.desc   nibble complement of the signature hex at position 25 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgTamp0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0026 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const tampered: string = sig.slice(0, 25) + (15 - parseInt(sig.charAt(25), 16)).toString(16) + sig.slice(25 + 1);
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', tampered);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0026 end');
    });

    /**
     * @tc.name   testRsaSgTamp0027
     * @tc.number SUB_CryptoFramework_RSASGTAM_01_0027
     * @tc.desc   nibble complement of the signature hex at position 26 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgTamp0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0027 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const tampered: string = sig.slice(0, 26) + (15 - parseInt(sig.charAt(26), 16)).toString(16) + sig.slice(26 + 1);
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', tampered);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0027 end');
    });

    /**
     * @tc.name   testRsaSgTamp0028
     * @tc.number SUB_CryptoFramework_RSASGTAM_01_0028
     * @tc.desc   nibble complement of the signature hex at position 27 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgTamp0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0028 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const tampered: string = sig.slice(0, 27) + (15 - parseInt(sig.charAt(27), 16)).toString(16) + sig.slice(27 + 1);
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', tampered);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0028 end');
    });

    /**
     * @tc.name   testRsaSgTamp0029
     * @tc.number SUB_CryptoFramework_RSASGTAM_01_0029
     * @tc.desc   nibble complement of the signature hex at position 28 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgTamp0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0029 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const tampered: string = sig.slice(0, 28) + (15 - parseInt(sig.charAt(28), 16)).toString(16) + sig.slice(28 + 1);
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', tampered);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0029 end');
    });

    /**
     * @tc.name   testRsaSgTamp0030
     * @tc.number SUB_CryptoFramework_RSASGTAM_01_0030
     * @tc.desc   nibble complement of the signature hex at position 29 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgTamp0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0030 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const tampered: string = sig.slice(0, 29) + (15 - parseInt(sig.charAt(29), 16)).toString(16) + sig.slice(29 + 1);
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', tampered);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0030 end');
    });

    /**
     * @tc.name   testRsaSgTamp0031
     * @tc.number SUB_CryptoFramework_RSASGTAM_01_0031
     * @tc.desc   nibble complement of the signature hex at position 30 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgTamp0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0031 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const tampered: string = sig.slice(0, 30) + (15 - parseInt(sig.charAt(30), 16)).toString(16) + sig.slice(30 + 1);
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', tampered);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0031 end');
    });

    /**
     * @tc.name   testRsaSgTamp0032
     * @tc.number SUB_CryptoFramework_RSASGTAM_01_0032
     * @tc.desc   nibble complement of the signature hex at position 31 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgTamp0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0032 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const tampered: string = sig.slice(0, 31) + (15 - parseInt(sig.charAt(31), 16)).toString(16) + sig.slice(31 + 1);
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', tampered);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0032 end');
    });

    /**
     * @tc.name   testRsaSgTamp0033
     * @tc.number SUB_CryptoFramework_RSASGTAM_01_0033
     * @tc.desc   nibble complement of the signature hex at position 32 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgTamp0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0033 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const tampered: string = sig.slice(0, 32) + (15 - parseInt(sig.charAt(32), 16)).toString(16) + sig.slice(32 + 1);
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', tampered);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0033 end');
    });

    /**
     * @tc.name   testRsaSgTamp0034
     * @tc.number SUB_CryptoFramework_RSASGTAM_01_0034
     * @tc.desc   nibble complement of the signature hex at position 33 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgTamp0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0034 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const tampered: string = sig.slice(0, 33) + (15 - parseInt(sig.charAt(33), 16)).toString(16) + sig.slice(33 + 1);
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', tampered);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0034 end');
    });

    /**
     * @tc.name   testRsaSgTamp0035
     * @tc.number SUB_CryptoFramework_RSASGTAM_01_0035
     * @tc.desc   nibble complement of the signature hex at position 34 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgTamp0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0035 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const tampered: string = sig.slice(0, 34) + (15 - parseInt(sig.charAt(34), 16)).toString(16) + sig.slice(34 + 1);
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', tampered);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0035 end');
    });

    /**
     * @tc.name   testRsaSgTamp0036
     * @tc.number SUB_CryptoFramework_RSASGTAM_01_0036
     * @tc.desc   nibble complement of the signature hex at position 35 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgTamp0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0036 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const tampered: string = sig.slice(0, 35) + (15 - parseInt(sig.charAt(35), 16)).toString(16) + sig.slice(35 + 1);
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', tampered);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0036 end');
    });

    /**
     * @tc.name   testRsaSgTamp0037
     * @tc.number SUB_CryptoFramework_RSASGTAM_01_0037
     * @tc.desc   nibble complement of the signature hex at position 36 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgTamp0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0037 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const tampered: string = sig.slice(0, 36) + (15 - parseInt(sig.charAt(36), 16)).toString(16) + sig.slice(36 + 1);
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', tampered);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0037 end');
    });

    /**
     * @tc.name   testRsaSgTamp0038
     * @tc.number SUB_CryptoFramework_RSASGTAM_01_0038
     * @tc.desc   nibble complement of the signature hex at position 37 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgTamp0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0038 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const tampered: string = sig.slice(0, 37) + (15 - parseInt(sig.charAt(37), 16)).toString(16) + sig.slice(37 + 1);
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', tampered);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0038 end');
    });

    /**
     * @tc.name   testRsaSgTamp0039
     * @tc.number SUB_CryptoFramework_RSASGTAM_01_0039
     * @tc.desc   nibble complement of the signature hex at position 38 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgTamp0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0039 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const tampered: string = sig.slice(0, 38) + (15 - parseInt(sig.charAt(38), 16)).toString(16) + sig.slice(38 + 1);
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', tampered);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0039 end');
    });

    /**
     * @tc.name   testRsaSgTamp0040
     * @tc.number SUB_CryptoFramework_RSASGTAM_01_0040
     * @tc.desc   nibble complement of the signature hex at position 39 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgTamp0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0040 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const tampered: string = sig.slice(0, 39) + (15 - parseInt(sig.charAt(39), 16)).toString(16) + sig.slice(39 + 1);
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', tampered);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0040 end');
    });

    /**
     * @tc.name   testRsaSgTamp0041
     * @tc.number SUB_CryptoFramework_RSASGTAM_01_0041
     * @tc.desc   nibble complement of the signature hex at position 40 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgTamp0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0041 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const tampered: string = sig.slice(0, 40) + (15 - parseInt(sig.charAt(40), 16)).toString(16) + sig.slice(40 + 1);
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', tampered);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0041 end');
    });

    /**
     * @tc.name   testRsaSgTamp0042
     * @tc.number SUB_CryptoFramework_RSASGTAM_01_0042
     * @tc.desc   nibble complement of the signature hex at position 41 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgTamp0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0042 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const tampered: string = sig.slice(0, 41) + (15 - parseInt(sig.charAt(41), 16)).toString(16) + sig.slice(41 + 1);
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', tampered);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0042 end');
    });

    /**
     * @tc.name   testRsaSgTamp0043
     * @tc.number SUB_CryptoFramework_RSASGTAM_01_0043
     * @tc.desc   nibble complement of the signature hex at position 42 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgTamp0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0043 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const tampered: string = sig.slice(0, 42) + (15 - parseInt(sig.charAt(42), 16)).toString(16) + sig.slice(42 + 1);
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', tampered);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0043 end');
    });

    /**
     * @tc.name   testRsaSgTamp0044
     * @tc.number SUB_CryptoFramework_RSASGTAM_01_0044
     * @tc.desc   nibble complement of the signature hex at position 43 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgTamp0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0044 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const tampered: string = sig.slice(0, 43) + (15 - parseInt(sig.charAt(43), 16)).toString(16) + sig.slice(43 + 1);
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', tampered);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0044 end');
    });

    /**
     * @tc.name   testRsaSgTamp0045
     * @tc.number SUB_CryptoFramework_RSASGTAM_01_0045
     * @tc.desc   nibble complement of the signature hex at position 44 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgTamp0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0045 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const tampered: string = sig.slice(0, 44) + (15 - parseInt(sig.charAt(44), 16)).toString(16) + sig.slice(44 + 1);
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', tampered);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0045 end');
    });

    /**
     * @tc.name   testRsaSgTamp0046
     * @tc.number SUB_CryptoFramework_RSASGTAM_01_0046
     * @tc.desc   nibble complement of the signature hex at position 45 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgTamp0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0046 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const tampered: string = sig.slice(0, 45) + (15 - parseInt(sig.charAt(45), 16)).toString(16) + sig.slice(45 + 1);
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', tampered);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0046 end');
    });

    /**
     * @tc.name   testRsaSgTamp0047
     * @tc.number SUB_CryptoFramework_RSASGTAM_01_0047
     * @tc.desc   nibble complement of the signature hex at position 46 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgTamp0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0047 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const tampered: string = sig.slice(0, 46) + (15 - parseInt(sig.charAt(46), 16)).toString(16) + sig.slice(46 + 1);
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', tampered);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0047 end');
    });

    /**
     * @tc.name   testRsaSgTamp0048
     * @tc.number SUB_CryptoFramework_RSASGTAM_01_0048
     * @tc.desc   nibble complement of the signature hex at position 47 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgTamp0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0048 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const tampered: string = sig.slice(0, 47) + (15 - parseInt(sig.charAt(47), 16)).toString(16) + sig.slice(47 + 1);
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', tampered);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgTamp0048 end');
    });

  });
}
