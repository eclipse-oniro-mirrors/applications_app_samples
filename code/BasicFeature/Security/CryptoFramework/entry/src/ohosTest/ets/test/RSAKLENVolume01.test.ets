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

export default function rsaKeyLenTest() {
  describe('RsaKeyLen', () => {

    /**
     * @tc.name   testRsaKeyLen0001
     * @tc.number SUB_CryptoFramework_RSAKLEN_01_0001
     * @tc.desc   full rsa json converts to a key pair
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyLen0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0001 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const cut: string = fullJson.slice(0, fullJson.length - 0);
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(cut);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.priKey.getEncoded().data.length),
           String(ctrlPair.priKey.getEncoded().data.length));
      expect(actResult.priKey.getEncoded().data.length).assertEqual(ctrlPair.priKey.getEncoded().data.length);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.pubKey.getEncoded().data.length),
           String(ctrlPair.pubKey.getEncoded().data.length));
      expect(actResult.pubKey.getEncoded().data.length).assertEqual(ctrlPair.pubKey.getEncoded().data.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0001 end');
    });

    /**
     * @tc.name   testRsaKeyLen0002
     * @tc.number SUB_CryptoFramework_RSAKLEN_01_0002
     * @tc.desc   head-truncated rsa json cutting one leading char is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyLen0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0002 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const cut: string = fullJson.slice(1, fullJson.length - 0);
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(cut);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0002 end');
    });

    /**
     * @tc.name   testRsaKeyLen0003
     * @tc.number SUB_CryptoFramework_RSAKLEN_01_0003
     * @tc.desc   head-truncated rsa json cutting 2 leading chars is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyLen0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0003 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const cut: string = fullJson.slice(2, fullJson.length - 0);
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(cut);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0003 end');
    });

    /**
     * @tc.name   testRsaKeyLen0004
     * @tc.number SUB_CryptoFramework_RSAKLEN_01_0004
     * @tc.desc   head-truncated rsa json cutting 3 leading chars is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyLen0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0004 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const cut: string = fullJson.slice(3, fullJson.length - 0);
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(cut);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0004 end');
    });

    /**
     * @tc.name   testRsaKeyLen0005
     * @tc.number SUB_CryptoFramework_RSAKLEN_01_0005
     * @tc.desc   head-truncated rsa json cutting 4 leading chars is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyLen0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0005 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const cut: string = fullJson.slice(4, fullJson.length - 0);
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(cut);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0005 end');
    });

    /**
     * @tc.name   testRsaKeyLen0006
     * @tc.number SUB_CryptoFramework_RSAKLEN_01_0006
     * @tc.desc   head-truncated rsa json cutting 5 leading chars is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyLen0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0006 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const cut: string = fullJson.slice(5, fullJson.length - 0);
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(cut);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0006 end');
    });

    /**
     * @tc.name   testRsaKeyLen0007
     * @tc.number SUB_CryptoFramework_RSAKLEN_01_0007
     * @tc.desc   head-truncated rsa json cutting 6 leading chars is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyLen0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0007 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const cut: string = fullJson.slice(6, fullJson.length - 0);
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(cut);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0007 end');
    });

    /**
     * @tc.name   testRsaKeyLen0008
     * @tc.number SUB_CryptoFramework_RSAKLEN_01_0008
     * @tc.desc   head-truncated rsa json cutting 7 leading chars is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyLen0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0008 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const cut: string = fullJson.slice(7, fullJson.length - 0);
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(cut);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0008 end');
    });

    /**
     * @tc.name   testRsaKeyLen0009
     * @tc.number SUB_CryptoFramework_RSAKLEN_01_0009
     * @tc.desc   head-truncated rsa json cutting 8 leading chars is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyLen0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0009 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const cut: string = fullJson.slice(8, fullJson.length - 0);
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(cut);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0009 end');
    });

    /**
     * @tc.name   testRsaKeyLen0010
     * @tc.number SUB_CryptoFramework_RSAKLEN_01_0010
     * @tc.desc   head-truncated rsa json cutting 9 leading chars is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyLen0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0010 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const cut: string = fullJson.slice(9, fullJson.length - 0);
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(cut);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0010 end');
    });

    /**
     * @tc.name   testRsaKeyLen0011
     * @tc.number SUB_CryptoFramework_RSAKLEN_01_0011
     * @tc.desc   head-truncated rsa json cutting 10 leading chars is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyLen0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0011 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const cut: string = fullJson.slice(10, fullJson.length - 0);
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(cut);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0011 end');
    });

    /**
     * @tc.name   testRsaKeyLen0012
     * @tc.number SUB_CryptoFramework_RSAKLEN_01_0012
     * @tc.desc   head-truncated rsa json cutting 11 leading chars is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyLen0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0012 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const cut: string = fullJson.slice(11, fullJson.length - 0);
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(cut);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0012 end');
    });

    /**
     * @tc.name   testRsaKeyLen0013
     * @tc.number SUB_CryptoFramework_RSAKLEN_01_0013
     * @tc.desc   head-truncated rsa json cutting 12 leading chars is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyLen0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0013 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const cut: string = fullJson.slice(12, fullJson.length - 0);
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(cut);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0013 end');
    });

    /**
     * @tc.name   testRsaKeyLen0014
     * @tc.number SUB_CryptoFramework_RSAKLEN_01_0014
     * @tc.desc   head-truncated rsa json cutting 13 leading chars is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyLen0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0014 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const cut: string = fullJson.slice(13, fullJson.length - 0);
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(cut);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0014 end');
    });

    /**
     * @tc.name   testRsaKeyLen0015
     * @tc.number SUB_CryptoFramework_RSAKLEN_01_0015
     * @tc.desc   head-truncated rsa json cutting 14 leading chars is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyLen0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0015 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const cut: string = fullJson.slice(14, fullJson.length - 0);
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(cut);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0015 end');
    });

    /**
     * @tc.name   testRsaKeyLen0016
     * @tc.number SUB_CryptoFramework_RSAKLEN_01_0016
     * @tc.desc   head-truncated rsa json cutting 15 leading chars is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyLen0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0016 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const cut: string = fullJson.slice(15, fullJson.length - 0);
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(cut);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0016 end');
    });

    /**
     * @tc.name   testRsaKeyLen0017
     * @tc.number SUB_CryptoFramework_RSAKLEN_01_0017
     * @tc.desc   head-truncated rsa json cutting 16 leading chars is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyLen0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0017 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const cut: string = fullJson.slice(16, fullJson.length - 0);
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(cut);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0017 end');
    });

    /**
     * @tc.name   testRsaKeyLen0018
     * @tc.number SUB_CryptoFramework_RSAKLEN_01_0018
     * @tc.desc   head-truncated rsa json cutting 17 leading chars is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyLen0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0018 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const cut: string = fullJson.slice(17, fullJson.length - 0);
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(cut);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0018 end');
    });

    /**
     * @tc.name   testRsaKeyLen0019
     * @tc.number SUB_CryptoFramework_RSAKLEN_01_0019
     * @tc.desc   head-truncated rsa json cutting 18 leading chars is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyLen0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0019 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const cut: string = fullJson.slice(18, fullJson.length - 0);
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(cut);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0019 end');
    });

    /**
     * @tc.name   testRsaKeyLen0020
     * @tc.number SUB_CryptoFramework_RSAKLEN_01_0020
     * @tc.desc   head-truncated rsa json cutting 19 leading chars is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyLen0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0020 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const cut: string = fullJson.slice(19, fullJson.length - 0);
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(cut);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0020 end');
    });

    /**
     * @tc.name   testRsaKeyLen0021
     * @tc.number SUB_CryptoFramework_RSAKLEN_01_0021
     * @tc.desc   head-truncated rsa json cutting 20 leading chars is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyLen0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0021 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const cut: string = fullJson.slice(20, fullJson.length - 0);
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(cut);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0021 end');
    });

    /**
     * @tc.name   testRsaKeyLen0022
     * @tc.number SUB_CryptoFramework_RSAKLEN_01_0022
     * @tc.desc   head-truncated rsa json cutting 21 leading chars is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyLen0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0022 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const cut: string = fullJson.slice(21, fullJson.length - 0);
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(cut);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0022 end');
    });

    /**
     * @tc.name   testRsaKeyLen0023
     * @tc.number SUB_CryptoFramework_RSAKLEN_01_0023
     * @tc.desc   head-truncated rsa json cutting 22 leading chars is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyLen0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0023 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const cut: string = fullJson.slice(22, fullJson.length - 0);
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(cut);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0023 end');
    });

    /**
     * @tc.name   testRsaKeyLen0024
     * @tc.number SUB_CryptoFramework_RSAKLEN_01_0024
     * @tc.desc   head-truncated rsa json cutting 23 leading chars is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyLen0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0024 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const cut: string = fullJson.slice(23, fullJson.length - 0);
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(cut);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0024 end');
    });

    /**
     * @tc.name   testRsaKeyLen0025
     * @tc.number SUB_CryptoFramework_RSAKLEN_01_0025
     * @tc.desc   tail-truncated rsa json cutting 1 trailing chars is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyLen0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0025 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const cut: string = fullJson.slice(0, fullJson.length - 1);
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(cut);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0025 end');
    });

    /**
     * @tc.name   testRsaKeyLen0026
     * @tc.number SUB_CryptoFramework_RSAKLEN_01_0026
     * @tc.desc   tail-truncated rsa json cutting 2 trailing chars is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyLen0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0026 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const cut: string = fullJson.slice(0, fullJson.length - 2);
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(cut);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0026 end');
    });

    /**
     * @tc.name   testRsaKeyLen0027
     * @tc.number SUB_CryptoFramework_RSAKLEN_01_0027
     * @tc.desc   tail-truncated rsa json cutting 3 trailing chars is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyLen0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0027 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const cut: string = fullJson.slice(0, fullJson.length - 3);
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(cut);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0027 end');
    });

    /**
     * @tc.name   testRsaKeyLen0028
     * @tc.number SUB_CryptoFramework_RSAKLEN_01_0028
     * @tc.desc   tail-truncated rsa json cutting 4 trailing chars is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyLen0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0028 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const cut: string = fullJson.slice(0, fullJson.length - 4);
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(cut);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0028 end');
    });

    /**
     * @tc.name   testRsaKeyLen0029
     * @tc.number SUB_CryptoFramework_RSAKLEN_01_0029
     * @tc.desc   tail-truncated rsa json cutting 5 trailing chars is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyLen0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0029 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const cut: string = fullJson.slice(0, fullJson.length - 5);
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(cut);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0029 end');
    });

    /**
     * @tc.name   testRsaKeyLen0030
     * @tc.number SUB_CryptoFramework_RSAKLEN_01_0030
     * @tc.desc   tail-truncated rsa json cutting 6 trailing chars is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyLen0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0030 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const cut: string = fullJson.slice(0, fullJson.length - 6);
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(cut);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0030 end');
    });

    /**
     * @tc.name   testRsaKeyLen0031
     * @tc.number SUB_CryptoFramework_RSAKLEN_01_0031
     * @tc.desc   tail-truncated rsa json cutting 7 trailing chars is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyLen0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0031 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const cut: string = fullJson.slice(0, fullJson.length - 7);
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(cut);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0031 end');
    });

    /**
     * @tc.name   testRsaKeyLen0032
     * @tc.number SUB_CryptoFramework_RSAKLEN_01_0032
     * @tc.desc   tail-truncated rsa json cutting 8 trailing chars is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyLen0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0032 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const cut: string = fullJson.slice(0, fullJson.length - 8);
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(cut);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0032 end');
    });

    /**
     * @tc.name   testRsaKeyLen0033
     * @tc.number SUB_CryptoFramework_RSAKLEN_01_0033
     * @tc.desc   tail-truncated rsa json cutting 9 trailing chars is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyLen0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0033 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const cut: string = fullJson.slice(0, fullJson.length - 9);
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(cut);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0033 end');
    });

    /**
     * @tc.name   testRsaKeyLen0034
     * @tc.number SUB_CryptoFramework_RSAKLEN_01_0034
     * @tc.desc   tail-truncated rsa json cutting 10 trailing chars is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyLen0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0034 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const cut: string = fullJson.slice(0, fullJson.length - 10);
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(cut);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0034 end');
    });

    /**
     * @tc.name   testRsaKeyLen0035
     * @tc.number SUB_CryptoFramework_RSAKLEN_01_0035
     * @tc.desc   tail-truncated rsa json cutting 11 trailing chars is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyLen0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0035 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const cut: string = fullJson.slice(0, fullJson.length - 11);
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(cut);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0035 end');
    });

    /**
     * @tc.name   testRsaKeyLen0036
     * @tc.number SUB_CryptoFramework_RSAKLEN_01_0036
     * @tc.desc   tail-truncated rsa json cutting 12 trailing chars is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyLen0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0036 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const cut: string = fullJson.slice(0, fullJson.length - 12);
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(cut);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0036 end');
    });

    /**
     * @tc.name   testRsaKeyLen0037
     * @tc.number SUB_CryptoFramework_RSAKLEN_01_0037
     * @tc.desc   tail-truncated rsa json cutting 13 trailing chars is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyLen0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0037 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const cut: string = fullJson.slice(0, fullJson.length - 13);
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(cut);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0037 end');
    });

    /**
     * @tc.name   testRsaKeyLen0038
     * @tc.number SUB_CryptoFramework_RSAKLEN_01_0038
     * @tc.desc   tail-truncated rsa json cutting 14 trailing chars is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyLen0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0038 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const cut: string = fullJson.slice(0, fullJson.length - 14);
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(cut);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0038 end');
    });

    /**
     * @tc.name   testRsaKeyLen0039
     * @tc.number SUB_CryptoFramework_RSAKLEN_01_0039
     * @tc.desc   tail-truncated rsa json cutting 15 trailing chars is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyLen0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0039 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const cut: string = fullJson.slice(0, fullJson.length - 15);
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(cut);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0039 end');
    });

    /**
     * @tc.name   testRsaKeyLen0040
     * @tc.number SUB_CryptoFramework_RSAKLEN_01_0040
     * @tc.desc   tail-truncated rsa json cutting 16 trailing chars is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyLen0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0040 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const cut: string = fullJson.slice(0, fullJson.length - 16);
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(cut);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0040 end');
    });

    /**
     * @tc.name   testRsaKeyLen0041
     * @tc.number SUB_CryptoFramework_RSAKLEN_01_0041
     * @tc.desc   tail-truncated rsa json cutting 17 trailing chars is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyLen0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0041 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const cut: string = fullJson.slice(0, fullJson.length - 17);
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(cut);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0041 end');
    });

    /**
     * @tc.name   testRsaKeyLen0042
     * @tc.number SUB_CryptoFramework_RSAKLEN_01_0042
     * @tc.desc   tail-truncated rsa json cutting 18 trailing chars is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyLen0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0042 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const cut: string = fullJson.slice(0, fullJson.length - 18);
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(cut);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0042 end');
    });

    /**
     * @tc.name   testRsaKeyLen0043
     * @tc.number SUB_CryptoFramework_RSAKLEN_01_0043
     * @tc.desc   tail-truncated rsa json cutting 19 trailing chars is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyLen0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0043 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const cut: string = fullJson.slice(0, fullJson.length - 19);
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(cut);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0043 end');
    });

    /**
     * @tc.name   testRsaKeyLen0044
     * @tc.number SUB_CryptoFramework_RSAKLEN_01_0044
     * @tc.desc   tail-truncated rsa json cutting 20 trailing chars is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyLen0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0044 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const cut: string = fullJson.slice(0, fullJson.length - 20);
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(cut);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0044 end');
    });

    /**
     * @tc.name   testRsaKeyLen0045
     * @tc.number SUB_CryptoFramework_RSAKLEN_01_0045
     * @tc.desc   tail-truncated rsa json cutting 21 trailing chars is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyLen0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0045 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const cut: string = fullJson.slice(0, fullJson.length - 21);
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(cut);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0045 end');
    });

    /**
     * @tc.name   testRsaKeyLen0046
     * @tc.number SUB_CryptoFramework_RSAKLEN_01_0046
     * @tc.desc   tail-truncated rsa json cutting 22 trailing chars is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyLen0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0046 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const cut: string = fullJson.slice(0, fullJson.length - 22);
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(cut);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0046 end');
    });

    /**
     * @tc.name   testRsaKeyLen0047
     * @tc.number SUB_CryptoFramework_RSAKLEN_01_0047
     * @tc.desc   tail-truncated rsa json cutting 23 trailing chars is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyLen0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0047 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const cut: string = fullJson.slice(0, fullJson.length - 23);
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(cut);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0047 end');
    });

    /**
     * @tc.name   testRsaKeyLen0048
     * @tc.number SUB_CryptoFramework_RSAKLEN_01_0048
     * @tc.desc   tail-truncated rsa json cutting 24 trailing chars is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyLen0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0048 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const cut: string = fullJson.slice(0, fullJson.length - 24);
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(cut);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyLen0048 end');
    });

  });
}
