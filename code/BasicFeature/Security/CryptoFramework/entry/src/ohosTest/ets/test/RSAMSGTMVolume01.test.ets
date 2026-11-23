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

export default function rsaMsgTampTest() {
  describe('RsaMsgTamp', () => {

    /**
     * @tc.name   testRsaMsgTamp0001
     * @tc.number SUB_CryptoFramework_RSAMSGTM_01_0001
     * @tc.desc   single char swap at message position 0 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaMsgTamp0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0001 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'yxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0001 end');
    });

    /**
     * @tc.name   testRsaMsgTamp0002
     * @tc.number SUB_CryptoFramework_RSAMSGTM_01_0002
     * @tc.desc   single char swap of the message at position 1 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaMsgTamp0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0002 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xyxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0002 end');
    });

    /**
     * @tc.name   testRsaMsgTamp0003
     * @tc.number SUB_CryptoFramework_RSAMSGTM_01_0003
     * @tc.desc   single char swap of the message at position 2 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaMsgTamp0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0003 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxyxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0003 end');
    });

    /**
     * @tc.name   testRsaMsgTamp0004
     * @tc.number SUB_CryptoFramework_RSAMSGTM_01_0004
     * @tc.desc   single char swap of the message at position 3 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaMsgTamp0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0004 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxyxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0004 end');
    });

    /**
     * @tc.name   testRsaMsgTamp0005
     * @tc.number SUB_CryptoFramework_RSAMSGTM_01_0005
     * @tc.desc   single char swap of the message at position 4 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaMsgTamp0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0005 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxyxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0005 end');
    });

    /**
     * @tc.name   testRsaMsgTamp0006
     * @tc.number SUB_CryptoFramework_RSAMSGTM_01_0006
     * @tc.desc   single char swap of the message at position 5 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaMsgTamp0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0006 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxyxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0006 end');
    });

    /**
     * @tc.name   testRsaMsgTamp0007
     * @tc.number SUB_CryptoFramework_RSAMSGTM_01_0007
     * @tc.desc   single char swap of the message at position 6 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaMsgTamp0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0007 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxyxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0007 end');
    });

    /**
     * @tc.name   testRsaMsgTamp0008
     * @tc.number SUB_CryptoFramework_RSAMSGTM_01_0008
     * @tc.desc   single char swap of the message at position 7 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaMsgTamp0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0008 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxyxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0008 end');
    });

    /**
     * @tc.name   testRsaMsgTamp0009
     * @tc.number SUB_CryptoFramework_RSAMSGTM_01_0009
     * @tc.desc   single char swap of the message at position 8 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaMsgTamp0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0009 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxyxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0009 end');
    });

    /**
     * @tc.name   testRsaMsgTamp0010
     * @tc.number SUB_CryptoFramework_RSAMSGTM_01_0010
     * @tc.desc   single char swap of the message at position 9 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaMsgTamp0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0010 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxyxxxxxxxxxxxxxxxxxxxxxx', sig);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0010 end');
    });

    /**
     * @tc.name   testRsaMsgTamp0011
     * @tc.number SUB_CryptoFramework_RSAMSGTM_01_0011
     * @tc.desc   single char swap of the message at position 10 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaMsgTamp0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0011 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxyxxxxxxxxxxxxxxxxxxxxx', sig);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0011 end');
    });

    /**
     * @tc.name   testRsaMsgTamp0012
     * @tc.number SUB_CryptoFramework_RSAMSGTM_01_0012
     * @tc.desc   single char swap of the message at position 11 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaMsgTamp0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0012 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxyxxxxxxxxxxxxxxxxxxxx', sig);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0012 end');
    });

    /**
     * @tc.name   testRsaMsgTamp0013
     * @tc.number SUB_CryptoFramework_RSAMSGTM_01_0013
     * @tc.desc   single char swap of the message at position 12 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaMsgTamp0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0013 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxyxxxxxxxxxxxxxxxxxxx', sig);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0013 end');
    });

    /**
     * @tc.name   testRsaMsgTamp0014
     * @tc.number SUB_CryptoFramework_RSAMSGTM_01_0014
     * @tc.desc   single char swap of the message at position 13 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaMsgTamp0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0014 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxyxxxxxxxxxxxxxxxxxx', sig);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0014 end');
    });

    /**
     * @tc.name   testRsaMsgTamp0015
     * @tc.number SUB_CryptoFramework_RSAMSGTM_01_0015
     * @tc.desc   single char swap of the message at position 14 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaMsgTamp0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0015 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxyxxxxxxxxxxxxxxxxx', sig);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0015 end');
    });

    /**
     * @tc.name   testRsaMsgTamp0016
     * @tc.number SUB_CryptoFramework_RSAMSGTM_01_0016
     * @tc.desc   single char swap of the message at position 15 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaMsgTamp0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0016 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxyxxxxxxxxxxxxxxxx', sig);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0016 end');
    });

    /**
     * @tc.name   testRsaMsgTamp0017
     * @tc.number SUB_CryptoFramework_RSAMSGTM_01_0017
     * @tc.desc   single char swap of the message at position 16 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaMsgTamp0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0017 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxyxxxxxxxxxxxxxxx', sig);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0017 end');
    });

    /**
     * @tc.name   testRsaMsgTamp0018
     * @tc.number SUB_CryptoFramework_RSAMSGTM_01_0018
     * @tc.desc   single char swap of the message at position 17 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaMsgTamp0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0018 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxyxxxxxxxxxxxxxx', sig);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0018 end');
    });

    /**
     * @tc.name   testRsaMsgTamp0019
     * @tc.number SUB_CryptoFramework_RSAMSGTM_01_0019
     * @tc.desc   single char swap of the message at position 18 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaMsgTamp0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0019 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxyxxxxxxxxxxxxx', sig);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0019 end');
    });

    /**
     * @tc.name   testRsaMsgTamp0020
     * @tc.number SUB_CryptoFramework_RSAMSGTM_01_0020
     * @tc.desc   single char swap of the message at position 19 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaMsgTamp0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0020 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxyxxxxxxxxxxxx', sig);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0020 end');
    });

    /**
     * @tc.name   testRsaMsgTamp0021
     * @tc.number SUB_CryptoFramework_RSAMSGTM_01_0021
     * @tc.desc   single char swap of the message at position 20 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaMsgTamp0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0021 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxyxxxxxxxxxxx', sig);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0021 end');
    });

    /**
     * @tc.name   testRsaMsgTamp0022
     * @tc.number SUB_CryptoFramework_RSAMSGTM_01_0022
     * @tc.desc   single char swap of the message at position 21 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaMsgTamp0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0022 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxyxxxxxxxxxx', sig);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0022 end');
    });

    /**
     * @tc.name   testRsaMsgTamp0023
     * @tc.number SUB_CryptoFramework_RSAMSGTM_01_0023
     * @tc.desc   single char swap of the message at position 22 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaMsgTamp0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0023 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxyxxxxxxxxx', sig);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0023 end');
    });

    /**
     * @tc.name   testRsaMsgTamp0024
     * @tc.number SUB_CryptoFramework_RSAMSGTM_01_0024
     * @tc.desc   single char swap of the message at position 23 fails verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaMsgTamp0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0024 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxyxxxxxxxx', sig);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0024 end');
    });

    /**
     * @tc.name   testRsaMsgTamp0025
     * @tc.number SUB_CryptoFramework_RSAMSGTM_01_0025
     * @tc.desc   prefix slice of length 1 fails verification against the full message signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaMsgTamp0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0025 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'x', sig);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0025 end');
    });

    /**
     * @tc.name   testRsaMsgTamp0026
     * @tc.number SUB_CryptoFramework_RSAMSGTM_01_0026
     * @tc.desc   suffix slice of length 1 fails verification against the full message signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaMsgTamp0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0026 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'x', sig);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0026 end');
    });

    /**
     * @tc.name   testRsaMsgTamp0027
     * @tc.number SUB_CryptoFramework_RSAMSGTM_01_0027
     * @tc.desc   replacement content of length 1 fails verification against the full message signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaMsgTamp0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0027 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'y', sig);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0027 end');
    });

    /**
     * @tc.name   testRsaMsgTamp0028
     * @tc.number SUB_CryptoFramework_RSAMSGTM_01_0028
     * @tc.desc   prefix slice of length 2 fails verification against the full message signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaMsgTamp0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0028 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xx', sig);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0028 end');
    });

    /**
     * @tc.name   testRsaMsgTamp0029
     * @tc.number SUB_CryptoFramework_RSAMSGTM_01_0029
     * @tc.desc   suffix slice of length 2 fails verification against the full message signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaMsgTamp0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0029 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xx', sig);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0029 end');
    });

    /**
     * @tc.name   testRsaMsgTamp0030
     * @tc.number SUB_CryptoFramework_RSAMSGTM_01_0030
     * @tc.desc   replacement content of length 2 fails verification against the full message signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaMsgTamp0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0030 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'yy', sig);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0030 end');
    });

    /**
     * @tc.name   testRsaMsgTamp0031
     * @tc.number SUB_CryptoFramework_RSAMSGTM_01_0031
     * @tc.desc   prefix slice of length 4 fails verification against the full message signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaMsgTamp0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0031 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxx', sig);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0031 end');
    });

    /**
     * @tc.name   testRsaMsgTamp0032
     * @tc.number SUB_CryptoFramework_RSAMSGTM_01_0032
     * @tc.desc   suffix slice of length 4 fails verification against the full message signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaMsgTamp0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0032 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxx', sig);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0032 end');
    });

    /**
     * @tc.name   testRsaMsgTamp0033
     * @tc.number SUB_CryptoFramework_RSAMSGTM_01_0033
     * @tc.desc   replacement content of length 4 fails verification against the full message signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaMsgTamp0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0033 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'yyyy', sig);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0033 end');
    });

    /**
     * @tc.name   testRsaMsgTamp0034
     * @tc.number SUB_CryptoFramework_RSAMSGTM_01_0034
     * @tc.desc   prefix slice of length 8 fails verification against the full message signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaMsgTamp0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0034 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxx', sig);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0034 end');
    });

    /**
     * @tc.name   testRsaMsgTamp0035
     * @tc.number SUB_CryptoFramework_RSAMSGTM_01_0035
     * @tc.desc   suffix slice of length 8 fails verification against the full message signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaMsgTamp0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0035 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxx', sig);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0035 end');
    });

    /**
     * @tc.name   testRsaMsgTamp0036
     * @tc.number SUB_CryptoFramework_RSAMSGTM_01_0036
     * @tc.desc   replacement content of length 8 fails verification against the full message signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaMsgTamp0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0036 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'yyyyyyyy', sig);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0036 end');
    });

    /**
     * @tc.name   testRsaMsgTamp0037
     * @tc.number SUB_CryptoFramework_RSAMSGTM_01_0037
     * @tc.desc   prefix slice of length 16 fails verification against the full message signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaMsgTamp0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0037 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxx', sig);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0037 end');
    });

    /**
     * @tc.name   testRsaMsgTamp0038
     * @tc.number SUB_CryptoFramework_RSAMSGTM_01_0038
     * @tc.desc   suffix slice of length 16 fails verification against the full message signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaMsgTamp0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0038 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxx', sig);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0038 end');
    });

    /**
     * @tc.name   testRsaMsgTamp0039
     * @tc.number SUB_CryptoFramework_RSAMSGTM_01_0039
     * @tc.desc   replacement content of length 16 fails verification against the full message signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaMsgTamp0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0039 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'yyyyyyyyyyyyyyyy', sig);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0039 end');
    });

    /**
     * @tc.name   testRsaMsgTamp0040
     * @tc.number SUB_CryptoFramework_RSAMSGTM_01_0040
     * @tc.desc   prefix slice of length 24 fails verification against the full message signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaMsgTamp0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0040 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0040 end');
    });

    /**
     * @tc.name   testRsaMsgTamp0041
     * @tc.number SUB_CryptoFramework_RSAMSGTM_01_0041
     * @tc.desc   suffix slice of length 24 fails verification against the full message signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaMsgTamp0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0041 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0041 end');
    });

    /**
     * @tc.name   testRsaMsgTamp0042
     * @tc.number SUB_CryptoFramework_RSAMSGTM_01_0042
     * @tc.desc   replacement content of length 24 fails verification against the full message signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaMsgTamp0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0042 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'yyyyyyyyyyyyyyyyyyyyyyyy', sig);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0042 end');
    });

    /**
     * @tc.name   testRsaMsgTamp0043
     * @tc.number SUB_CryptoFramework_RSAMSGTM_01_0043
     * @tc.desc   prefix slice of length 30 fails verification against the full message signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaMsgTamp0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0043 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0043 end');
    });

    /**
     * @tc.name   testRsaMsgTamp0044
     * @tc.number SUB_CryptoFramework_RSAMSGTM_01_0044
     * @tc.desc   suffix slice of length 30 fails verification against the full message signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaMsgTamp0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0044 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0044 end');
    });

    /**
     * @tc.name   testRsaMsgTamp0045
     * @tc.number SUB_CryptoFramework_RSAMSGTM_01_0045
     * @tc.desc   replacement content of length 30 fails verification against the full message signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaMsgTamp0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0045 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyy', sig);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0045 end');
    });

    /**
     * @tc.name   testRsaMsgTamp0046
     * @tc.number SUB_CryptoFramework_RSAMSGTM_01_0046
     * @tc.desc   prefix slice of length 31 fails verification against the full message signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaMsgTamp0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0046 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0046 end');
    });

    /**
     * @tc.name   testRsaMsgTamp0047
     * @tc.number SUB_CryptoFramework_RSAMSGTM_01_0047
     * @tc.desc   suffix slice of length 31 fails verification against the full message signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaMsgTamp0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0047 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0047 end');
    });

    /**
     * @tc.name   testRsaMsgTamp0048
     * @tc.number SUB_CryptoFramework_RSAMSGTM_01_0048
     * @tc.desc   replacement content of length 31 fails verification against the full message signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaMsgTamp0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0048 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy', sig);
      const ctrlOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null || !result.valueOf()));
      expect(result === null || !result.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaMsgTamp0048 end');
    });

  });
}
