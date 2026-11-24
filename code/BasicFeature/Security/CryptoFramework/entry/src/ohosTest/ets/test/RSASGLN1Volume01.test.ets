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

export default function rsaSgLen1Test() {
  describe('RsaSgLen1', () => {

    /**
     * @tc.name   testRsaSgLen10001
     * @tc.number SUB_CryptoFramework_RSASGLN1_01_0001
     * @tc.desc   signing a 1-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen10001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10001 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'x');
      const vOk: Boolean = await op.rsaVerify(pair, 'x', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10001 end');
    });

    /**
     * @tc.name   testRsaSgLen10002
     * @tc.number SUB_CryptoFramework_RSASGLN1_01_0002
     * @tc.desc   signing a 2-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen10002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10002 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10002 end');
    });

    /**
     * @tc.name   testRsaSgLen10003
     * @tc.number SUB_CryptoFramework_RSASGLN1_01_0003
     * @tc.desc   signing a 3-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen10003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10003 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10003 end');
    });

    /**
     * @tc.name   testRsaSgLen10004
     * @tc.number SUB_CryptoFramework_RSASGLN1_01_0004
     * @tc.desc   signing a 4-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen10004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10004 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10004 end');
    });

    /**
     * @tc.name   testRsaSgLen10005
     * @tc.number SUB_CryptoFramework_RSASGLN1_01_0005
     * @tc.desc   signing a 5-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen10005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10005 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10005 end');
    });

    /**
     * @tc.name   testRsaSgLen10006
     * @tc.number SUB_CryptoFramework_RSASGLN1_01_0006
     * @tc.desc   signing a 6-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen10006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10006 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10006 end');
    });

    /**
     * @tc.name   testRsaSgLen10007
     * @tc.number SUB_CryptoFramework_RSASGLN1_01_0007
     * @tc.desc   signing a 7-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen10007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10007 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10007 end');
    });

    /**
     * @tc.name   testRsaSgLen10008
     * @tc.number SUB_CryptoFramework_RSASGLN1_01_0008
     * @tc.desc   signing a 8-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen10008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10008 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10008 end');
    });

    /**
     * @tc.name   testRsaSgLen10009
     * @tc.number SUB_CryptoFramework_RSASGLN1_01_0009
     * @tc.desc   signing a 9-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen10009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10009 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10009 end');
    });

    /**
     * @tc.name   testRsaSgLen10010
     * @tc.number SUB_CryptoFramework_RSASGLN1_01_0010
     * @tc.desc   signing a 10-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen10010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10010 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10010 end');
    });

    /**
     * @tc.name   testRsaSgLen10011
     * @tc.number SUB_CryptoFramework_RSASGLN1_01_0011
     * @tc.desc   signing a 11-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen10011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10011 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10011 end');
    });

    /**
     * @tc.name   testRsaSgLen10012
     * @tc.number SUB_CryptoFramework_RSASGLN1_01_0012
     * @tc.desc   signing a 12-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen10012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10012 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10012 end');
    });

    /**
     * @tc.name   testRsaSgLen10013
     * @tc.number SUB_CryptoFramework_RSASGLN1_01_0013
     * @tc.desc   signing a 13-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen10013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10013 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10013 end');
    });

    /**
     * @tc.name   testRsaSgLen10014
     * @tc.number SUB_CryptoFramework_RSASGLN1_01_0014
     * @tc.desc   signing a 14-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen10014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10014 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10014 end');
    });

    /**
     * @tc.name   testRsaSgLen10015
     * @tc.number SUB_CryptoFramework_RSASGLN1_01_0015
     * @tc.desc   signing a 15-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen10015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10015 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10015 end');
    });

    /**
     * @tc.name   testRsaSgLen10016
     * @tc.number SUB_CryptoFramework_RSASGLN1_01_0016
     * @tc.desc   signing a 16-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen10016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10016 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10016 end');
    });

    /**
     * @tc.name   testRsaSgLen10017
     * @tc.number SUB_CryptoFramework_RSASGLN1_01_0017
     * @tc.desc   signing a 17-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen10017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10017 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10017 end');
    });

    /**
     * @tc.name   testRsaSgLen10018
     * @tc.number SUB_CryptoFramework_RSASGLN1_01_0018
     * @tc.desc   signing a 18-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen10018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10018 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10018 end');
    });

    /**
     * @tc.name   testRsaSgLen10019
     * @tc.number SUB_CryptoFramework_RSASGLN1_01_0019
     * @tc.desc   signing a 19-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen10019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10019 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10019 end');
    });

    /**
     * @tc.name   testRsaSgLen10020
     * @tc.number SUB_CryptoFramework_RSASGLN1_01_0020
     * @tc.desc   signing a 20-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen10020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10020 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10020 end');
    });

    /**
     * @tc.name   testRsaSgLen10021
     * @tc.number SUB_CryptoFramework_RSASGLN1_01_0021
     * @tc.desc   signing a 21-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen10021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10021 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10021 end');
    });

    /**
     * @tc.name   testRsaSgLen10022
     * @tc.number SUB_CryptoFramework_RSASGLN1_01_0022
     * @tc.desc   signing a 22-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen10022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10022 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10022 end');
    });

    /**
     * @tc.name   testRsaSgLen10023
     * @tc.number SUB_CryptoFramework_RSASGLN1_01_0023
     * @tc.desc   signing a 23-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen10023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10023 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10023 end');
    });

    /**
     * @tc.name   testRsaSgLen10024
     * @tc.number SUB_CryptoFramework_RSASGLN1_01_0024
     * @tc.desc   signing a 24-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen10024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10024 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10024 end');
    });

    /**
     * @tc.name   testRsaSgLen10025
     * @tc.number SUB_CryptoFramework_RSASGLN1_01_0025
     * @tc.desc   signing a 25-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen10025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10025 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10025 end');
    });

    /**
     * @tc.name   testRsaSgLen10026
     * @tc.number SUB_CryptoFramework_RSASGLN1_01_0026
     * @tc.desc   signing a 26-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen10026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10026 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10026 end');
    });

    /**
     * @tc.name   testRsaSgLen10027
     * @tc.number SUB_CryptoFramework_RSASGLN1_01_0027
     * @tc.desc   signing a 27-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen10027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10027 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10027 end');
    });

    /**
     * @tc.name   testRsaSgLen10028
     * @tc.number SUB_CryptoFramework_RSASGLN1_01_0028
     * @tc.desc   signing a 28-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen10028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10028 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10028 end');
    });

    /**
     * @tc.name   testRsaSgLen10029
     * @tc.number SUB_CryptoFramework_RSASGLN1_01_0029
     * @tc.desc   signing a 29-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen10029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10029 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10029 end');
    });

    /**
     * @tc.name   testRsaSgLen10030
     * @tc.number SUB_CryptoFramework_RSASGLN1_01_0030
     * @tc.desc   signing a 30-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen10030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10030 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10030 end');
    });

    /**
     * @tc.name   testRsaSgLen10031
     * @tc.number SUB_CryptoFramework_RSASGLN1_01_0031
     * @tc.desc   signing a 31-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen10031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10031 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10031 end');
    });

    /**
     * @tc.name   testRsaSgLen10032
     * @tc.number SUB_CryptoFramework_RSASGLN1_01_0032
     * @tc.desc   signing a 32-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen10032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10032 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10032 end');
    });

    /**
     * @tc.name   testRsaSgLen10033
     * @tc.number SUB_CryptoFramework_RSASGLN1_01_0033
     * @tc.desc   signing a 33-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen10033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10033 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10033 end');
    });

    /**
     * @tc.name   testRsaSgLen10034
     * @tc.number SUB_CryptoFramework_RSASGLN1_01_0034
     * @tc.desc   signing a 34-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen10034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10034 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10034 end');
    });

    /**
     * @tc.name   testRsaSgLen10035
     * @tc.number SUB_CryptoFramework_RSASGLN1_01_0035
     * @tc.desc   signing a 35-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen10035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10035 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10035 end');
    });

    /**
     * @tc.name   testRsaSgLen10036
     * @tc.number SUB_CryptoFramework_RSASGLN1_01_0036
     * @tc.desc   signing a 36-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen10036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10036 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10036 end');
    });

    /**
     * @tc.name   testRsaSgLen10037
     * @tc.number SUB_CryptoFramework_RSASGLN1_01_0037
     * @tc.desc   signing a 37-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen10037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10037 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10037 end');
    });

    /**
     * @tc.name   testRsaSgLen10038
     * @tc.number SUB_CryptoFramework_RSASGLN1_01_0038
     * @tc.desc   signing a 38-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen10038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10038 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10038 end');
    });

    /**
     * @tc.name   testRsaSgLen10039
     * @tc.number SUB_CryptoFramework_RSASGLN1_01_0039
     * @tc.desc   signing a 39-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen10039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10039 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10039 end');
    });

    /**
     * @tc.name   testRsaSgLen10040
     * @tc.number SUB_CryptoFramework_RSASGLN1_01_0040
     * @tc.desc   signing a 40-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen10040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10040 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10040 end');
    });

    /**
     * @tc.name   testRsaSgLen10041
     * @tc.number SUB_CryptoFramework_RSASGLN1_01_0041
     * @tc.desc   signing a 41-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen10041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10041 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10041 end');
    });

    /**
     * @tc.name   testRsaSgLen10042
     * @tc.number SUB_CryptoFramework_RSASGLN1_01_0042
     * @tc.desc   signing a 42-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen10042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10042 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10042 end');
    });

    /**
     * @tc.name   testRsaSgLen10043
     * @tc.number SUB_CryptoFramework_RSASGLN1_01_0043
     * @tc.desc   signing a 43-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen10043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10043 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10043 end');
    });

    /**
     * @tc.name   testRsaSgLen10044
     * @tc.number SUB_CryptoFramework_RSASGLN1_01_0044
     * @tc.desc   signing a 44-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen10044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10044 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10044 end');
    });

    /**
     * @tc.name   testRsaSgLen10045
     * @tc.number SUB_CryptoFramework_RSASGLN1_01_0045
     * @tc.desc   signing a 45-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen10045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10045 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10045 end');
    });

    /**
     * @tc.name   testRsaSgLen10046
     * @tc.number SUB_CryptoFramework_RSASGLN1_01_0046
     * @tc.desc   signing a 46-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen10046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10046 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10046 end');
    });

    /**
     * @tc.name   testRsaSgLen10047
     * @tc.number SUB_CryptoFramework_RSASGLN1_01_0047
     * @tc.desc   signing a 47-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen10047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10047 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10047 end');
    });

    /**
     * @tc.name   testRsaSgLen10048
     * @tc.number SUB_CryptoFramework_RSASGLN1_01_0048
     * @tc.desc   signing a 48-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen10048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10048 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen10048 end');
    });

  });
}
