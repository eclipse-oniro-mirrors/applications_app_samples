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

export default function rsaSgLen3Test() {
  describe('RsaSgLen3', () => {

    /**
     * @tc.name   testRsaSgLen30001
     * @tc.number SUB_CryptoFramework_RSASGLN3_01_0001
     * @tc.desc   signing a 97-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen30001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30001 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30001 end');
    });

    /**
     * @tc.name   testRsaSgLen30002
     * @tc.number SUB_CryptoFramework_RSASGLN3_01_0002
     * @tc.desc   signing a 98-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30002 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30002 end');
    });

    /**
     * @tc.name   testRsaSgLen30003
     * @tc.number SUB_CryptoFramework_RSASGLN3_01_0003
     * @tc.desc   signing a 99-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen30003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30003 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30003 end');
    });

    /**
     * @tc.name   testRsaSgLen30004
     * @tc.number SUB_CryptoFramework_RSASGLN3_01_0004
     * @tc.desc   signing a 100-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen30004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30004 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30004 end');
    });

    /**
     * @tc.name   testRsaSgLen30005
     * @tc.number SUB_CryptoFramework_RSASGLN3_01_0005
     * @tc.desc   signing a 101-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen30005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30005 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30005 end');
    });

    /**
     * @tc.name   testRsaSgLen30006
     * @tc.number SUB_CryptoFramework_RSASGLN3_01_0006
     * @tc.desc   signing a 102-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen30006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30006 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30006 end');
    });

    /**
     * @tc.name   testRsaSgLen30007
     * @tc.number SUB_CryptoFramework_RSASGLN3_01_0007
     * @tc.desc   signing a 103-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen30007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30007 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30007 end');
    });

    /**
     * @tc.name   testRsaSgLen30008
     * @tc.number SUB_CryptoFramework_RSASGLN3_01_0008
     * @tc.desc   signing a 104-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen30008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30008 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30008 end');
    });

    /**
     * @tc.name   testRsaSgLen30009
     * @tc.number SUB_CryptoFramework_RSASGLN3_01_0009
     * @tc.desc   signing a 105-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen30009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30009 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30009 end');
    });

    /**
     * @tc.name   testRsaSgLen30010
     * @tc.number SUB_CryptoFramework_RSASGLN3_01_0010
     * @tc.desc   signing a 106-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen30010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30010 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30010 end');
    });

    /**
     * @tc.name   testRsaSgLen30011
     * @tc.number SUB_CryptoFramework_RSASGLN3_01_0011
     * @tc.desc   signing a 107-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen30011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30011 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30011 end');
    });

    /**
     * @tc.name   testRsaSgLen30012
     * @tc.number SUB_CryptoFramework_RSASGLN3_01_0012
     * @tc.desc   signing a 108-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen30012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30012 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30012 end');
    });

    /**
     * @tc.name   testRsaSgLen30013
     * @tc.number SUB_CryptoFramework_RSASGLN3_01_0013
     * @tc.desc   signing a 109-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen30013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30013 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30013 end');
    });

    /**
     * @tc.name   testRsaSgLen30014
     * @tc.number SUB_CryptoFramework_RSASGLN3_01_0014
     * @tc.desc   signing a 110-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen30014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30014 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30014 end');
    });

    /**
     * @tc.name   testRsaSgLen30015
     * @tc.number SUB_CryptoFramework_RSASGLN3_01_0015
     * @tc.desc   signing a 111-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen30015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30015 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30015 end');
    });

    /**
     * @tc.name   testRsaSgLen30016
     * @tc.number SUB_CryptoFramework_RSASGLN3_01_0016
     * @tc.desc   signing a 112-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen30016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30016 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30016 end');
    });

    /**
     * @tc.name   testRsaSgLen30017
     * @tc.number SUB_CryptoFramework_RSASGLN3_01_0017
     * @tc.desc   signing a 113-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen30017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30017 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30017 end');
    });

    /**
     * @tc.name   testRsaSgLen30018
     * @tc.number SUB_CryptoFramework_RSASGLN3_01_0018
     * @tc.desc   signing a 114-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen30018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30018 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30018 end');
    });

    /**
     * @tc.name   testRsaSgLen30019
     * @tc.number SUB_CryptoFramework_RSASGLN3_01_0019
     * @tc.desc   signing a 115-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen30019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30019 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30019 end');
    });

    /**
     * @tc.name   testRsaSgLen30020
     * @tc.number SUB_CryptoFramework_RSASGLN3_01_0020
     * @tc.desc   signing a 116-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen30020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30020 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30020 end');
    });

    /**
     * @tc.name   testRsaSgLen30021
     * @tc.number SUB_CryptoFramework_RSASGLN3_01_0021
     * @tc.desc   signing a 117-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen30021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30021 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30021 end');
    });

    /**
     * @tc.name   testRsaSgLen30022
     * @tc.number SUB_CryptoFramework_RSASGLN3_01_0022
     * @tc.desc   signing a 118-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen30022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30022 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30022 end');
    });

    /**
     * @tc.name   testRsaSgLen30023
     * @tc.number SUB_CryptoFramework_RSASGLN3_01_0023
     * @tc.desc   signing a 119-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen30023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30023 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30023 end');
    });

    /**
     * @tc.name   testRsaSgLen30024
     * @tc.number SUB_CryptoFramework_RSASGLN3_01_0024
     * @tc.desc   signing a 120-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen30024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30024 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30024 end');
    });

    /**
     * @tc.name   testRsaSgLen30025
     * @tc.number SUB_CryptoFramework_RSASGLN3_01_0025
     * @tc.desc   signing a 121-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen30025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30025 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30025 end');
    });

    /**
     * @tc.name   testRsaSgLen30026
     * @tc.number SUB_CryptoFramework_RSASGLN3_01_0026
     * @tc.desc   signing a 122-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen30026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30026 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30026 end');
    });

    /**
     * @tc.name   testRsaSgLen30027
     * @tc.number SUB_CryptoFramework_RSASGLN3_01_0027
     * @tc.desc   signing a 123-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen30027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30027 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30027 end');
    });

    /**
     * @tc.name   testRsaSgLen30028
     * @tc.number SUB_CryptoFramework_RSASGLN3_01_0028
     * @tc.desc   signing a 124-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen30028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30028 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30028 end');
    });

    /**
     * @tc.name   testRsaSgLen30029
     * @tc.number SUB_CryptoFramework_RSASGLN3_01_0029
     * @tc.desc   signing a 125-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen30029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30029 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30029 end');
    });

    /**
     * @tc.name   testRsaSgLen30030
     * @tc.number SUB_CryptoFramework_RSASGLN3_01_0030
     * @tc.desc   signing a 126-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen30030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30030 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30030 end');
    });

    /**
     * @tc.name   testRsaSgLen30031
     * @tc.number SUB_CryptoFramework_RSASGLN3_01_0031
     * @tc.desc   signing a 127-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen30031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30031 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30031 end');
    });

    /**
     * @tc.name   testRsaSgLen30032
     * @tc.number SUB_CryptoFramework_RSASGLN3_01_0032
     * @tc.desc   signing a 128-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen30032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30032 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30032 end');
    });

    /**
     * @tc.name   testRsaSgLen30033
     * @tc.number SUB_CryptoFramework_RSASGLN3_01_0033
     * @tc.desc   signing a 129-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen30033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30033 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30033 end');
    });

    /**
     * @tc.name   testRsaSgLen30034
     * @tc.number SUB_CryptoFramework_RSASGLN3_01_0034
     * @tc.desc   signing a 130-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen30034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30034 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30034 end');
    });

    /**
     * @tc.name   testRsaSgLen30035
     * @tc.number SUB_CryptoFramework_RSASGLN3_01_0035
     * @tc.desc   signing a 131-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen30035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30035 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30035 end');
    });

    /**
     * @tc.name   testRsaSgLen30036
     * @tc.number SUB_CryptoFramework_RSASGLN3_01_0036
     * @tc.desc   signing a 132-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen30036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30036 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30036 end');
    });

    /**
     * @tc.name   testRsaSgLen30037
     * @tc.number SUB_CryptoFramework_RSASGLN3_01_0037
     * @tc.desc   signing a 133-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen30037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30037 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30037 end');
    });

    /**
     * @tc.name   testRsaSgLen30038
     * @tc.number SUB_CryptoFramework_RSASGLN3_01_0038
     * @tc.desc   signing a 134-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen30038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30038 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30038 end');
    });

    /**
     * @tc.name   testRsaSgLen30039
     * @tc.number SUB_CryptoFramework_RSASGLN3_01_0039
     * @tc.desc   signing a 135-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen30039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30039 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30039 end');
    });

    /**
     * @tc.name   testRsaSgLen30040
     * @tc.number SUB_CryptoFramework_RSASGLN3_01_0040
     * @tc.desc   signing a 136-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen30040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30040 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30040 end');
    });

    /**
     * @tc.name   testRsaSgLen30041
     * @tc.number SUB_CryptoFramework_RSASGLN3_01_0041
     * @tc.desc   signing a 137-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen30041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30041 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30041 end');
    });

    /**
     * @tc.name   testRsaSgLen30042
     * @tc.number SUB_CryptoFramework_RSASGLN3_01_0042
     * @tc.desc   signing a 138-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen30042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30042 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30042 end');
    });

    /**
     * @tc.name   testRsaSgLen30043
     * @tc.number SUB_CryptoFramework_RSASGLN3_01_0043
     * @tc.desc   signing a 139-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen30043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30043 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30043 end');
    });

    /**
     * @tc.name   testRsaSgLen30044
     * @tc.number SUB_CryptoFramework_RSASGLN3_01_0044
     * @tc.desc   signing a 140-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen30044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30044 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30044 end');
    });

    /**
     * @tc.name   testRsaSgLen30045
     * @tc.number SUB_CryptoFramework_RSASGLN3_01_0045
     * @tc.desc   signing a 141-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen30045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30045 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30045 end');
    });

    /**
     * @tc.name   testRsaSgLen30046
     * @tc.number SUB_CryptoFramework_RSASGLN3_01_0046
     * @tc.desc   signing a 142-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen30046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30046 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30046 end');
    });

    /**
     * @tc.name   testRsaSgLen30047
     * @tc.number SUB_CryptoFramework_RSASGLN3_01_0047
     * @tc.desc   signing a 143-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen30047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30047 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30047 end');
    });

    /**
     * @tc.name   testRsaSgLen30048
     * @tc.number SUB_CryptoFramework_RSASGLN3_01_0048
     * @tc.desc   signing a 144-char message yields a 768-hex signature that verifies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSgLen30048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30048 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const vOk: Boolean = await op.rsaVerify(pair, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', sig);
      const result: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSgLen30048 end');
    });

  });
}
