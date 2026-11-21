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

export default function rsaStateTest() {
  describe('RsaState', () => {

    /**
     * @tc.name   testRsaState0001
     * @tc.number SUB_CryptoFramework_RSASTATE_01_0001
     * @tc.desc   rsa state sequence variant 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaState0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0001 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sigA: string = await op.rsaSign(keyPair, 'sign state 1' + '-A');
      const okA: Boolean = await op.rsaVerify(keyPair, 'sign state 1' + '-A', sigA);
      const sigB: string = await op.rsaSign(keyPair, 'sign state 1' + '-B');
      const okB: Boolean = await op.rsaVerify(keyPair, 'sign state 1' + '-B', sigB);
      const actResult: boolean = okA !== null && okA.valueOf() && okB !== null && okB.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sigA === sigB));
      expect(sigA === sigB).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sigA.length), String(768));
      expect(sigA.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0001 end');
    });

    /**
     * @tc.name   testRsaState0002
     * @tc.number SUB_CryptoFramework_RSASTATE_01_0002
     * @tc.desc   rsa state sequence variant 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaState0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0002 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sigA: string = await op.rsaSign(keyPair, 'sign state 2' + '-A');
      const okA: Boolean = await op.rsaVerify(keyPair, 'sign state 2' + '-A', sigA);
      const sigB: string = await op.rsaSign(keyPair, 'sign state 2' + '-B');
      const okB: Boolean = await op.rsaVerify(keyPair, 'sign state 2' + '-B', sigB);
      const actResult: boolean = okA !== null && okA.valueOf() && okB !== null && okB.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sigA === sigB));
      expect(sigA === sigB).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sigA.length), String(768));
      expect(sigA.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0002 end');
    });

    /**
     * @tc.name   testRsaState0003
     * @tc.number SUB_CryptoFramework_RSASTATE_01_0003
     * @tc.desc   rsa state sequence variant 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaState0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0003 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sigA: string = await op.rsaSign(keyPair, 'sign state 3' + '-A');
      const okA: Boolean = await op.rsaVerify(keyPair, 'sign state 3' + '-A', sigA);
      const sigB: string = await op.rsaSign(keyPair, 'sign state 3' + '-B');
      const okB: Boolean = await op.rsaVerify(keyPair, 'sign state 3' + '-B', sigB);
      const actResult: boolean = okA !== null && okA.valueOf() && okB !== null && okB.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sigA === sigB));
      expect(sigA === sigB).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sigA.length), String(768));
      expect(sigA.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0003 end');
    });

    /**
     * @tc.name   testRsaState0004
     * @tc.number SUB_CryptoFramework_RSASTATE_01_0004
     * @tc.desc   rsa state sequence variant 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaState0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0004 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sigA: string = await op.rsaSign(keyPair, 'sign state 4' + '-A');
      const okA: Boolean = await op.rsaVerify(keyPair, 'sign state 4' + '-A', sigA);
      const sigB: string = await op.rsaSign(keyPair, 'sign state 4' + '-B');
      const okB: Boolean = await op.rsaVerify(keyPair, 'sign state 4' + '-B', sigB);
      const actResult: boolean = okA !== null && okA.valueOf() && okB !== null && okB.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sigA === sigB));
      expect(sigA === sigB).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sigA.length), String(768));
      expect(sigA.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0004 end');
    });

    /**
     * @tc.name   testRsaState0005
     * @tc.number SUB_CryptoFramework_RSASTATE_01_0005
     * @tc.desc   rsa state sequence variant 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaState0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0005 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sigA: string = await op.rsaSign(keyPair, 'sign state 5' + '-A');
      const okA: Boolean = await op.rsaVerify(keyPair, 'sign state 5' + '-A', sigA);
      const sigB: string = await op.rsaSign(keyPair, 'sign state 5' + '-B');
      const okB: Boolean = await op.rsaVerify(keyPair, 'sign state 5' + '-B', sigB);
      const actResult: boolean = okA !== null && okA.valueOf() && okB !== null && okB.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sigA === sigB));
      expect(sigA === sigB).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sigA.length), String(768));
      expect(sigA.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0005 end');
    });

    /**
     * @tc.name   testRsaState0006
     * @tc.number SUB_CryptoFramework_RSASTATE_01_0006
     * @tc.desc   rsa state sequence variant 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaState0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0006 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sigA: string = await op.rsaSign(keyPair, 'sign state 6' + '-A');
      const okA: Boolean = await op.rsaVerify(keyPair, 'sign state 6' + '-A', sigA);
      const sigB: string = await op.rsaSign(keyPair, 'sign state 6' + '-B');
      const okB: Boolean = await op.rsaVerify(keyPair, 'sign state 6' + '-B', sigB);
      const actResult: boolean = okA !== null && okA.valueOf() && okB !== null && okB.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sigA === sigB));
      expect(sigA === sigB).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sigA.length), String(768));
      expect(sigA.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0006 end');
    });

    /**
     * @tc.name   testRsaState0007
     * @tc.number SUB_CryptoFramework_RSASTATE_01_0007
     * @tc.desc   rsa state sequence variant 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaState0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0007 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sigA: string = await op.rsaSign(keyPair, 'sign state 7' + '-A');
      const okA: Boolean = await op.rsaVerify(keyPair, 'sign state 7' + '-A', sigA);
      const sigB: string = await op.rsaSign(keyPair, 'sign state 7' + '-B');
      const okB: Boolean = await op.rsaVerify(keyPair, 'sign state 7' + '-B', sigB);
      const actResult: boolean = okA !== null && okA.valueOf() && okB !== null && okB.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sigA === sigB));
      expect(sigA === sigB).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sigA.length), String(768));
      expect(sigA.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0007 end');
    });

    /**
     * @tc.name   testRsaState0008
     * @tc.number SUB_CryptoFramework_RSASTATE_01_0008
     * @tc.desc   rsa state sequence variant 8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaState0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0008 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sigA: string = await op.rsaSign(keyPair, 'sign state 8' + '-A');
      const okA: Boolean = await op.rsaVerify(keyPair, 'sign state 8' + '-A', sigA);
      const sigB: string = await op.rsaSign(keyPair, 'sign state 8' + '-B');
      const okB: Boolean = await op.rsaVerify(keyPair, 'sign state 8' + '-B', sigB);
      const actResult: boolean = okA !== null && okA.valueOf() && okB !== null && okB.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sigA === sigB));
      expect(sigA === sigB).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sigA.length), String(768));
      expect(sigA.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0008 end');
    });

    /**
     * @tc.name   testRsaState0009
     * @tc.number SUB_CryptoFramework_RSASTATE_01_0009
     * @tc.desc   rsa state sequence variant 9
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaState0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0009 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sigA: string = await op.rsaSign(keyPair, 'sign state 9' + '-A');
      const okA: Boolean = await op.rsaVerify(keyPair, 'sign state 9' + '-A', sigA);
      const sigB: string = await op.rsaSign(keyPair, 'sign state 9' + '-B');
      const okB: Boolean = await op.rsaVerify(keyPair, 'sign state 9' + '-B', sigB);
      const actResult: boolean = okA !== null && okA.valueOf() && okB !== null && okB.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sigA === sigB));
      expect(sigA === sigB).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sigA.length), String(768));
      expect(sigA.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0009 end');
    });

    /**
     * @tc.name   testRsaState0010
     * @tc.number SUB_CryptoFramework_RSASTATE_01_0010
     * @tc.desc   rsa state sequence variant 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaState0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0010 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sigA: string = await op.rsaSign(keyPair, 'sign state 10' + '-A');
      const okA: Boolean = await op.rsaVerify(keyPair, 'sign state 10' + '-A', sigA);
      const sigB: string = await op.rsaSign(keyPair, 'sign state 10' + '-B');
      const okB: Boolean = await op.rsaVerify(keyPair, 'sign state 10' + '-B', sigB);
      const actResult: boolean = okA !== null && okA.valueOf() && okB !== null && okB.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sigA === sigB));
      expect(sigA === sigB).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sigA.length), String(768));
      expect(sigA.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0010 end');
    });

    /**
     * @tc.name   testRsaState0011
     * @tc.number SUB_CryptoFramework_RSASTATE_01_0011
     * @tc.desc   rsa state sequence variant 11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaState0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0011 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sigA: string = await op.rsaSign(keyPair, 'sign state 11' + '-A');
      const okA: Boolean = await op.rsaVerify(keyPair, 'sign state 11' + '-A', sigA);
      const sigB: string = await op.rsaSign(keyPair, 'sign state 11' + '-B');
      const okB: Boolean = await op.rsaVerify(keyPair, 'sign state 11' + '-B', sigB);
      const actResult: boolean = okA !== null && okA.valueOf() && okB !== null && okB.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sigA === sigB));
      expect(sigA === sigB).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sigA.length), String(768));
      expect(sigA.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0011 end');
    });

    /**
     * @tc.name   testRsaState0012
     * @tc.number SUB_CryptoFramework_RSASTATE_01_0012
     * @tc.desc   rsa state sequence variant 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaState0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0012 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sigA: string = await op.rsaSign(keyPair, 'sign state 12' + '-A');
      const okA: Boolean = await op.rsaVerify(keyPair, 'sign state 12' + '-A', sigA);
      const sigB: string = await op.rsaSign(keyPair, 'sign state 12' + '-B');
      const okB: Boolean = await op.rsaVerify(keyPair, 'sign state 12' + '-B', sigB);
      const actResult: boolean = okA !== null && okA.valueOf() && okB !== null && okB.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sigA === sigB));
      expect(sigA === sigB).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sigA.length), String(768));
      expect(sigA.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0012 end');
    });

    /**
     * @tc.name   testRsaState0013
     * @tc.number SUB_CryptoFramework_RSASTATE_01_0013
     * @tc.desc   rsa state sequence variant 13
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaState0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0013 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sigA: string = await op.rsaSign(keyPair, 'sign state 13' + '-A');
      const okA: Boolean = await op.rsaVerify(keyPair, 'sign state 13' + '-A', sigA);
      const sigB: string = await op.rsaSign(keyPair, 'sign state 13' + '-B');
      const okB: Boolean = await op.rsaVerify(keyPair, 'sign state 13' + '-B', sigB);
      const actResult: boolean = okA !== null && okA.valueOf() && okB !== null && okB.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sigA === sigB));
      expect(sigA === sigB).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sigA.length), String(768));
      expect(sigA.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0013 end');
    });

    /**
     * @tc.name   testRsaState0014
     * @tc.number SUB_CryptoFramework_RSASTATE_01_0014
     * @tc.desc   rsa state sequence variant 14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaState0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0014 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sigA: string = await op.rsaSign(keyPair, 'sign state 14' + '-A');
      const okA: Boolean = await op.rsaVerify(keyPair, 'sign state 14' + '-A', sigA);
      const sigB: string = await op.rsaSign(keyPair, 'sign state 14' + '-B');
      const okB: Boolean = await op.rsaVerify(keyPair, 'sign state 14' + '-B', sigB);
      const actResult: boolean = okA !== null && okA.valueOf() && okB !== null && okB.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sigA === sigB));
      expect(sigA === sigB).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sigA.length), String(768));
      expect(sigA.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0014 end');
    });

    /**
     * @tc.name   testRsaState0015
     * @tc.number SUB_CryptoFramework_RSASTATE_01_0015
     * @tc.desc   rsa state sequence variant 15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaState0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0015 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sigA: string = await op.rsaSign(keyPair, 'sign state 15' + '-A');
      const okA: Boolean = await op.rsaVerify(keyPair, 'sign state 15' + '-A', sigA);
      const sigB: string = await op.rsaSign(keyPair, 'sign state 15' + '-B');
      const okB: Boolean = await op.rsaVerify(keyPair, 'sign state 15' + '-B', sigB);
      const actResult: boolean = okA !== null && okA.valueOf() && okB !== null && okB.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sigA === sigB));
      expect(sigA === sigB).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sigA.length), String(768));
      expect(sigA.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0015 end');
    });

    /**
     * @tc.name   testRsaState0016
     * @tc.number SUB_CryptoFramework_RSASTATE_01_0016
     * @tc.desc   rsa state sequence variant 16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaState0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0016 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sigA: string = await op.rsaSign(keyPair, 'sign state 16' + '-A');
      const okA: Boolean = await op.rsaVerify(keyPair, 'sign state 16' + '-A', sigA);
      const sigB: string = await op.rsaSign(keyPair, 'sign state 16' + '-B');
      const okB: Boolean = await op.rsaVerify(keyPair, 'sign state 16' + '-B', sigB);
      const actResult: boolean = okA !== null && okA.valueOf() && okB !== null && okB.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sigA === sigB));
      expect(sigA === sigB).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sigA.length), String(768));
      expect(sigA.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0016 end');
    });

    /**
     * @tc.name   testRsaState0017
     * @tc.number SUB_CryptoFramework_RSASTATE_01_0017
     * @tc.desc   rsa state sequence variant 17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaState0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0017 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sigA: string = await op.rsaSign(keyPair, 'sign state 17' + '-A');
      const okA: Boolean = await op.rsaVerify(keyPair, 'sign state 17' + '-A', sigA);
      const sigB: string = await op.rsaSign(keyPair, 'sign state 17' + '-B');
      const okB: Boolean = await op.rsaVerify(keyPair, 'sign state 17' + '-B', sigB);
      const actResult: boolean = okA !== null && okA.valueOf() && okB !== null && okB.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sigA === sigB));
      expect(sigA === sigB).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sigA.length), String(768));
      expect(sigA.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0017 end');
    });

    /**
     * @tc.name   testRsaState0018
     * @tc.number SUB_CryptoFramework_RSASTATE_01_0018
     * @tc.desc   rsa state sequence variant 18
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaState0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0018 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sigA: string = await op.rsaSign(keyPair, 'sign state 18' + '-A');
      const okA: Boolean = await op.rsaVerify(keyPair, 'sign state 18' + '-A', sigA);
      const sigB: string = await op.rsaSign(keyPair, 'sign state 18' + '-B');
      const okB: Boolean = await op.rsaVerify(keyPair, 'sign state 18' + '-B', sigB);
      const actResult: boolean = okA !== null && okA.valueOf() && okB !== null && okB.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sigA === sigB));
      expect(sigA === sigB).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sigA.length), String(768));
      expect(sigA.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0018 end');
    });

    /**
     * @tc.name   testRsaState0019
     * @tc.number SUB_CryptoFramework_RSASTATE_01_0019
     * @tc.desc   rsa state sequence variant 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaState0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0019 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sigA: string = await op.rsaSign(keyPair, 'sign state 19' + '-A');
      const okA: Boolean = await op.rsaVerify(keyPair, 'sign state 19' + '-A', sigA);
      const sigB: string = await op.rsaSign(keyPair, 'sign state 19' + '-B');
      const okB: Boolean = await op.rsaVerify(keyPair, 'sign state 19' + '-B', sigB);
      const actResult: boolean = okA !== null && okA.valueOf() && okB !== null && okB.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sigA === sigB));
      expect(sigA === sigB).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sigA.length), String(768));
      expect(sigA.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0019 end');
    });

    /**
     * @tc.name   testRsaState0020
     * @tc.number SUB_CryptoFramework_RSASTATE_01_0020
     * @tc.desc   rsa state sequence variant 20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaState0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0020 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sigA: string = await op.rsaSign(keyPair, 'sign state 20' + '-A');
      const okA: Boolean = await op.rsaVerify(keyPair, 'sign state 20' + '-A', sigA);
      const sigB: string = await op.rsaSign(keyPair, 'sign state 20' + '-B');
      const okB: Boolean = await op.rsaVerify(keyPair, 'sign state 20' + '-B', sigB);
      const actResult: boolean = okA !== null && okA.valueOf() && okB !== null && okB.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sigA === sigB));
      expect(sigA === sigB).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sigA.length), String(768));
      expect(sigA.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0020 end');
    });

    /**
     * @tc.name   testRsaState0021
     * @tc.number SUB_CryptoFramework_RSASTATE_01_0021
     * @tc.desc   rsa state sequence variant 21
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaState0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0021 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sigA: string = await op.rsaSign(keyPair, 'A' + '-A');
      const okA: Boolean = await op.rsaVerify(keyPair, 'A' + '-A', sigA);
      const sigB: string = await op.rsaSign(keyPair, 'A' + '-B');
      const okB: Boolean = await op.rsaVerify(keyPair, 'A' + '-B', sigB);
      const actResult: boolean = okA !== null && okA.valueOf() && okB !== null && okB.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sigA === sigB));
      expect(sigA === sigB).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sigA.length), String(768));
      expect(sigA.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0021 end');
    });

    /**
     * @tc.name   testRsaState0022
     * @tc.number SUB_CryptoFramework_RSASTATE_01_0022
     * @tc.desc   rsa state sequence variant 22
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaState0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0022 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sigA: string = await op.rsaSign(keyPair, 'ab' + '-A');
      const okA: Boolean = await op.rsaVerify(keyPair, 'ab' + '-A', sigA);
      const sigB: string = await op.rsaSign(keyPair, 'ab' + '-B');
      const okB: Boolean = await op.rsaVerify(keyPair, 'ab' + '-B', sigB);
      const actResult: boolean = okA !== null && okA.valueOf() && okB !== null && okB.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sigA === sigB));
      expect(sigA === sigB).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sigA.length), String(768));
      expect(sigA.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0022 end');
    });

    /**
     * @tc.name   testRsaState0023
     * @tc.number SUB_CryptoFramework_RSASTATE_01_0023
     * @tc.desc   rsa state sequence variant 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaState0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0023 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sigA: string = await op.rsaSign(keyPair, 'double sign' + '-A');
      const okA: Boolean = await op.rsaVerify(keyPair, 'double sign' + '-A', sigA);
      const sigB: string = await op.rsaSign(keyPair, 'double sign' + '-B');
      const okB: Boolean = await op.rsaVerify(keyPair, 'double sign' + '-B', sigB);
      const actResult: boolean = okA !== null && okA.valueOf() && okB !== null && okB.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sigA === sigB));
      expect(sigA === sigB).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sigA.length), String(768));
      expect(sigA.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0023 end');
    });

    /**
     * @tc.name   testRsaState0024
     * @tc.number SUB_CryptoFramework_RSASTATE_01_0024
     * @tc.desc   rsa state sequence variant 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaState0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0024 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sigA: string = await op.rsaSign(keyPair, 'sequential sign' + '-A');
      const okA: Boolean = await op.rsaVerify(keyPair, 'sequential sign' + '-A', sigA);
      const sigB: string = await op.rsaSign(keyPair, 'sequential sign' + '-B');
      const okB: Boolean = await op.rsaVerify(keyPair, 'sequential sign' + '-B', sigB);
      const actResult: boolean = okA !== null && okA.valueOf() && okB !== null && okB.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sigA === sigB));
      expect(sigA === sigB).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sigA.length), String(768));
      expect(sigA.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0024 end');
    });

    /**
     * @tc.name   testRsaState0025
     * @tc.number SUB_CryptoFramework_RSASTATE_01_0025
     * @tc.desc   rsa state sequence variant 25
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaState0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0025 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sigA: string = await op.rsaSign(keyPair, '{"state":1,"sign":true}' + '-A');
      const okA: Boolean = await op.rsaVerify(keyPair, '{"state":1,"sign":true}' + '-A', sigA);
      const sigB: string = await op.rsaSign(keyPair, '{"state":1,"sign":true}' + '-B');
      const okB: Boolean = await op.rsaVerify(keyPair, '{"state":1,"sign":true}' + '-B', sigB);
      const actResult: boolean = okA !== null && okA.valueOf() && okB !== null && okB.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sigA === sigB));
      expect(sigA === sigB).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sigA.length), String(768));
      expect(sigA.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0025 end');
    });

    /**
     * @tc.name   testRsaState0026
     * @tc.number SUB_CryptoFramework_RSASTATE_01_0026
     * @tc.desc   rsa state sequence variant 26
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaState0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0026 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sigA: string = await op.rsaSign(keyPair, 'A\u0000BÿC' + '-A');
      const okA: Boolean = await op.rsaVerify(keyPair, 'A\u0000BÿC' + '-A', sigA);
      const sigB: string = await op.rsaSign(keyPair, 'A\u0000BÿC' + '-B');
      const okB: Boolean = await op.rsaVerify(keyPair, 'A\u0000BÿC' + '-B', sigB);
      const actResult: boolean = okA !== null && okA.valueOf() && okB !== null && okB.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sigA === sigB));
      expect(sigA === sigB).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sigA.length), String(768));
      expect(sigA.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0026 end');
    });

    /**
     * @tc.name   testRsaState0027
     * @tc.number SUB_CryptoFramework_RSASTATE_01_0027
     * @tc.desc   rsa state sequence variant 27
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaState0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0027 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sigA: string = await op.rsaSign(keyPair, 'tttttttttttttttttttttttttttttttttttttttttttttttttt' +
        'tttttttttttttttttttttttttttttttttttttttttttttttttt' + '-A');
      const okA: Boolean = await op.rsaVerify(keyPair, 'tttttttttttttttttttttttttttttttttttttttttttttttttt' +
        'tttttttttttttttttttttttttttttttttttttttttttttttttt' + '-A', sigA);
      const sigB: string = await op.rsaSign(keyPair, 'tttttttttttttttttttttttttttttttttttttttttttttttttt' +
        'tttttttttttttttttttttttttttttttttttttttttttttttttt' + '-B');
      const okB: Boolean = await op.rsaVerify(keyPair, 'tttttttttttttttttttttttttttttttttttttttttttttttttt' +
        'tttttttttttttttttttttttttttttttttttttttttttttttttt' + '-B', sigB);
      const actResult: boolean = okA !== null && okA.valueOf() && okB !== null && okB.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sigA === sigB));
      expect(sigA === sigB).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sigA.length), String(768));
      expect(sigA.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0027 end');
    });

    /**
     * @tc.name   testRsaState0028
     * @tc.number SUB_CryptoFramework_RSASTATE_01_0028
     * @tc.desc   rsa state sequence variant 28
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaState0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0028 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sigA: string =
        await op.rsaSign(keyPair, 'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
          'ttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
          'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
            'ttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
        'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
          'ttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
          'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
            'ttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
        'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
          'ttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
          'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
            'ttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
          'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
            'ttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
            'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
              'ttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' + '-A');
      const okA: Boolean =
        await op.rsaVerify(keyPair, 'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
          'ttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
          'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
            'ttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
        'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
          'ttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
          'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
            'ttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
        'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
          'ttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
          'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
            'ttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
          'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
            'ttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
            'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
              'ttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' + '-A', sigA);
      const sigB: string =
        await op.rsaSign(keyPair, 'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
          'ttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
          'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
            'ttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
        'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
          'ttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
          'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
            'ttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
        'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
          'ttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
          'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
            'ttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
          'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
            'ttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
            'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
              'ttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' + '-B');
      const okB: Boolean =
        await op.rsaVerify(keyPair, 'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
          'ttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
          'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
            'ttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
        'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
          'ttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
          'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
            'ttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
        'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
          'ttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
          'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
            'ttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
          'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
            'ttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
            'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' +
              'ttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt' + '-B', sigB);
      const actResult: boolean = okA !== null && okA.valueOf() && okB !== null && okB.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sigA === sigB));
      expect(sigA === sigB).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sigA.length), String(768));
      expect(sigA.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0028 end');
    });

    /**
     * @tc.name   testRsaState0029
     * @tc.number SUB_CryptoFramework_RSASTATE_01_0029
     * @tc.desc   rsa state sequence variant 29
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaState0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0029 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sigA: string = await op.rsaSign(keyPair, 'two signatures differ' + '-A');
      const okA: Boolean = await op.rsaVerify(keyPair, 'two signatures differ' + '-A', sigA);
      const sigB: string = await op.rsaSign(keyPair, 'two signatures differ' + '-B');
      const okB: Boolean = await op.rsaVerify(keyPair, 'two signatures differ' + '-B', sigB);
      const actResult: boolean = okA !== null && okA.valueOf() && okB !== null && okB.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sigA === sigB));
      expect(sigA === sigB).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sigA.length), String(768));
      expect(sigA.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0029 end');
    });

    /**
     * @tc.name   testRsaState0030
     * @tc.number SUB_CryptoFramework_RSASTATE_01_0030
     * @tc.desc   rsa state sequence variant 30
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaState0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0030 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sigA: string = await op.rsaSign(keyPair, 'same key two texts' + '-A');
      const okA: Boolean = await op.rsaVerify(keyPair, 'same key two texts' + '-A', sigA);
      const sigB: string = await op.rsaSign(keyPair, 'same key two texts' + '-B');
      const okB: Boolean = await op.rsaVerify(keyPair, 'same key two texts' + '-B', sigB);
      const actResult: boolean = okA !== null && okA.valueOf() && okB !== null && okB.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sigA === sigB));
      expect(sigA === sigB).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sigA.length), String(768));
      expect(sigA.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0030 end');
    });

    /**
     * @tc.name   testRsaState0031
     * @tc.number SUB_CryptoFramework_RSASTATE_01_0031
     * @tc.desc   rsa state sequence variant 31
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaState0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0031 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sigA: string = await op.rsaSign(keyPair, 'final state check' + '-A');
      const okA: Boolean = await op.rsaVerify(keyPair, 'final state check' + '-A', sigA);
      const sigB: string = await op.rsaSign(keyPair, 'final state check' + '-B');
      const okB: Boolean = await op.rsaVerify(keyPair, 'final state check' + '-B', sigB);
      const actResult: boolean = okA !== null && okA.valueOf() && okB !== null && okB.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sigA === sigB));
      expect(sigA === sigB).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sigA.length), String(768));
      expect(sigA.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0031 end');
    });

    /**
     * @tc.name   testRsaState0032
     * @tc.number SUB_CryptoFramework_RSASTATE_01_0032
     * @tc.desc   rsa state sequence variant 32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaState0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0032 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sigA: string = await op.rsaSign(keyPair, 'rsa state filler 31' + '-A');
      const okA: Boolean = await op.rsaVerify(keyPair, 'rsa state filler 31' + '-A', sigA);
      const sigB: string = await op.rsaSign(keyPair, 'rsa state filler 31' + '-B');
      const okB: Boolean = await op.rsaVerify(keyPair, 'rsa state filler 31' + '-B', sigB);
      const actResult: boolean = okA !== null && okA.valueOf() && okB !== null && okB.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sigA === sigB));
      expect(sigA === sigB).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sigA.length), String(768));
      expect(sigA.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0032 end');
    });

    /**
     * @tc.name   testRsaState0033
     * @tc.number SUB_CryptoFramework_RSASTATE_01_0033
     * @tc.desc   同消息两次签名确定性相同（PKCS1 v1.5 确定性签名状态特性）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaState0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0033 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sigA: string = await op.rsaSign(keyPair, 'same-message');
      const sigB: string = await op.rsaSign(keyPair, 'same-message');
      const okA: Boolean = await op.rsaVerify(keyPair, 'same-message', sigA);
      const passed: boolean = okA !== null && okA.valueOf();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sigA === sigB), 'true');
      expect(sigA === sigB).assertTrue();
      expect(sigA.length).assertEqual(768);
      expect(passed).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaState0033 end');
    });

  });
}
