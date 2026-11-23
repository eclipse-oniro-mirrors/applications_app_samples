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

export default function rsaSeqTest() {
  describe('RsaSeq', () => {

    /**
     * @tc.name   testRsaSeq0001
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0001
     * @tc.desc   sign verify sequence variant 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0001 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(keyPair, 'signature text 1');
      const verifyRes: Boolean = await op.rsaVerify(keyPair, 'signature text 1', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0001 end');
    });

    /**
     * @tc.name   testRsaSeq0002
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0002
     * @tc.desc   sign verify sequence variant 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0002 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(keyPair, 'signature text 2');
      const verifyRes: Boolean = await op.rsaVerify(keyPair, 'signature text 2', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0002 end');
    });

    /**
     * @tc.name   testRsaSeq0003
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0003
     * @tc.desc   sign verify sequence variant 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0003 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(keyPair, 'signature text 3');
      const verifyRes: Boolean = await op.rsaVerify(keyPair, 'signature text 3', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0003 end');
    });

    /**
     * @tc.name   testRsaSeq0004
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0004
     * @tc.desc   sign verify sequence variant 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0004 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(keyPair, 'signature text 4');
      const verifyRes: Boolean = await op.rsaVerify(keyPair, 'signature text 4', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0004 end');
    });

    /**
     * @tc.name   testRsaSeq0005
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0005
     * @tc.desc   sign verify sequence variant 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0005 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(keyPair, 'signature text 5');
      const verifyRes: Boolean = await op.rsaVerify(keyPair, 'signature text 5', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0005 end');
    });

    /**
     * @tc.name   testRsaSeq0006
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0006
     * @tc.desc   sign verify sequence variant 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0006 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(keyPair, 'signature text 6');
      const verifyRes: Boolean = await op.rsaVerify(keyPair, 'signature text 6', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0006 end');
    });

    /**
     * @tc.name   testRsaSeq0007
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0007
     * @tc.desc   sign verify sequence variant 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0007 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(keyPair, 'signature text 7');
      const verifyRes: Boolean = await op.rsaVerify(keyPair, 'signature text 7', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0007 end');
    });

    /**
     * @tc.name   testRsaSeq0008
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0008
     * @tc.desc   sign verify sequence variant 8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0008 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(keyPair, 'signature text 8');
      const verifyRes: Boolean = await op.rsaVerify(keyPair, 'signature text 8', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0008 end');
    });

    /**
     * @tc.name   testRsaSeq0009
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0009
     * @tc.desc   sign verify sequence variant 9
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0009 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(keyPair, 'signature text 9');
      const verifyRes: Boolean = await op.rsaVerify(keyPair, 'signature text 9', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0009 end');
    });

    /**
     * @tc.name   testRsaSeq0010
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0010
     * @tc.desc   sign verify sequence variant 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0010 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(keyPair, 'signature text 10');
      const verifyRes: Boolean = await op.rsaVerify(keyPair, 'signature text 10', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0010 end');
    });

    /**
     * @tc.name   testRsaSeq0011
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0011
     * @tc.desc   sign verify sequence variant 11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0011 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(keyPair, 'signature text 11');
      const verifyRes: Boolean = await op.rsaVerify(keyPair, 'signature text 11', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0011 end');
    });

    /**
     * @tc.name   testRsaSeq0012
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0012
     * @tc.desc   sign verify sequence variant 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0012 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(keyPair, 'signature text 12');
      const verifyRes: Boolean = await op.rsaVerify(keyPair, 'signature text 12', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0012 end');
    });

    /**
     * @tc.name   testRsaSeq0013
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0013
     * @tc.desc   sign verify sequence variant 13
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0013 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(keyPair, 'signature text 13');
      const verifyRes: Boolean = await op.rsaVerify(keyPair, 'signature text 13', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0013 end');
    });

    /**
     * @tc.name   testRsaSeq0014
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0014
     * @tc.desc   sign verify sequence variant 14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0014 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(keyPair, 'signature text 14');
      const verifyRes: Boolean = await op.rsaVerify(keyPair, 'signature text 14', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0014 end');
    });

    /**
     * @tc.name   testRsaSeq0015
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0015
     * @tc.desc   sign verify sequence variant 15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0015 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(keyPair, 'signature text 15');
      const verifyRes: Boolean = await op.rsaVerify(keyPair, 'signature text 15', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0015 end');
    });

    /**
     * @tc.name   testRsaSeq0016
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0016
     * @tc.desc   sign verify sequence variant 16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0016 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(keyPair, 'signature text 16');
      const verifyRes: Boolean = await op.rsaVerify(keyPair, 'signature text 16', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0016 end');
    });

    /**
     * @tc.name   testRsaSeq0017
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0017
     * @tc.desc   sign verify sequence variant 17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0017 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(keyPair, 'signature text 17');
      const verifyRes: Boolean = await op.rsaVerify(keyPair, 'signature text 17', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0017 end');
    });

    /**
     * @tc.name   testRsaSeq0018
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0018
     * @tc.desc   sign verify sequence variant 18
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0018 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(keyPair, 'signature text 18');
      const verifyRes: Boolean = await op.rsaVerify(keyPair, 'signature text 18', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0018 end');
    });

    /**
     * @tc.name   testRsaSeq0019
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0019
     * @tc.desc   sign verify sequence variant 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0019 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(keyPair, 'signature text 19');
      const verifyRes: Boolean = await op.rsaVerify(keyPair, 'signature text 19', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0019 end');
    });

    /**
     * @tc.name   testRsaSeq0020
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0020
     * @tc.desc   sign verify sequence variant 20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0020 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(keyPair, 'signature text 20');
      const verifyRes: Boolean = await op.rsaVerify(keyPair, 'signature text 20', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0020 end');
    });

    /**
     * @tc.name   testRsaSeq0021
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0021
     * @tc.desc   sign verify sequence variant 21
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0021 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(keyPair, 'Hello OpenHarmony sign verify');
      const verifyRes: Boolean = await op.rsaVerify(keyPair, 'Hello OpenHarmony sign verify', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0021 end');
    });

    /**
     * @tc.name   testRsaSeq0022
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0022
     * @tc.desc   sign verify sequence variant 22
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0022 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(keyPair, '0123456789');
      const verifyRes: Boolean = await op.rsaVerify(keyPair, '0123456789', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0022 end');
    });

    /**
     * @tc.name   testRsaSeq0023
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0023
     * @tc.desc   sign verify sequence variant 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0023 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(keyPair, '{"sig":true,"algo":"RSA3072|PKCS1|SHA256"}');
      const verifyRes: Boolean = await op.rsaVerify(keyPair, '{"sig":true,"algo":"RSA3072|PKCS1|SHA256"}', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0023 end');
    });

    /**
     * @tc.name   testRsaSeq0024
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0024
     * @tc.desc   sign verify sequence variant 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0024 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(keyPair, 'https://example.com/sign?n=1');
      const verifyRes: Boolean = await op.rsaVerify(keyPair, 'https://example.com/sign?n=1', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0024 end');
    });

    /**
     * @tc.name   testRsaSeq0025
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0025
     * @tc.desc   sign verify sequence variant 25
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0025 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(keyPair, 'a!@#b$%^c&*()');
      const verifyRes: Boolean = await op.rsaVerify(keyPair, 'a!@#b$%^c&*()', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0025 end');
    });

    /**
     * @tc.name   testRsaSeq0026
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0026
     * @tc.desc   sign verify sequence variant 26
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0026 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(keyPair, 'line1\nline2\tcol3\r\nend');
      const verifyRes: Boolean = await op.rsaVerify(keyPair, 'line1\nline2\tcol3\r\nend', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0026 end');
    });

  });
}
