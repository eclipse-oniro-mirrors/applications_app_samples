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
interface AesJson { aesGcmTag: string; encryptedText: string; }
interface RsaKeyJson { priKey: string; pubKey: string; }
function parseAes(s: string): AesJson { return JSON.parse(s) as AesJson; }
function parseRsa(s: string): RsaKeyJson { return JSON.parse(s) as RsaKeyJson; }
function allHex(s: string): boolean {
  for (let i: number = 0; i < s.length; i++) {
    const c: string = s.charAt(i);
    if ((c >= '0' && c <= '9') || (c >= 'a' && c <= 'f')) {
      continue;
    }
    return false;
  }
  return true;
}
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_CryptoFramework]';

export default function rsaKeyChrTest() {
  describe('RsaKeyChr', () => {

    /**
     * @tc.name   testRsaKeyChr0001
     * @tc.number SUB_CryptoFramework_RSAKCHR_01_0001
     * @tc.desc   zeroing the DER structure byte at priKey hex position 0 makes conversion fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyChr0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0001 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const priStr: string = parseRsa(fullJson).priKey;
      const pubStr: string = parseRsa(fullJson).pubKey;
      const mutJson: string = '{"priKey":"' + priStr.slice(0, 0) + 'g0' + priStr.slice(0 + 2) + '","pubKey":"' +
        pubStr + '"}';
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0001 end');
    });

    /**
     * @tc.name   testRsaKeyChr0002
     * @tc.number SUB_CryptoFramework_RSAKCHR_01_0002
     * @tc.desc   zeroing the DER structure byte at priKey hex position 0 makes conversion fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyChr0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0002 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const priStr: string = parseRsa(fullJson).priKey;
      const pubStr: string = parseRsa(fullJson).pubKey;
      const mutJson: string = '{"priKey":"' + priStr.slice(0, 0) + 'm0' + priStr.slice(0 + 2) + '","pubKey":"' +
        pubStr + '"}';
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0002 end');
    });

    /**
     * @tc.name   testRsaKeyChr0003
     * @tc.number SUB_CryptoFramework_RSAKCHR_01_0003
     * @tc.desc   zeroing the DER structure byte at priKey hex position 0 makes conversion fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyChr0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0003 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const priStr: string = parseRsa(fullJson).priKey;
      const pubStr: string = parseRsa(fullJson).pubKey;
      const mutJson: string = '{"priKey":"' + priStr.slice(0, 0) + 't0' + priStr.slice(0 + 2) + '","pubKey":"' +
        pubStr + '"}';
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0003 end');
    });

    /**
     * @tc.name   testRsaKeyChr0004
     * @tc.number SUB_CryptoFramework_RSAKCHR_01_0004
     * @tc.desc   zeroing the DER structure byte at priKey hex position 0 makes conversion fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyChr0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0004 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const priStr: string = parseRsa(fullJson).priKey;
      const pubStr: string = parseRsa(fullJson).pubKey;
      const mutJson: string = '{"priKey":"' + priStr.slice(0, 0) + 'z0' + priStr.slice(0 + 2) + '","pubKey":"' +
        pubStr + '"}';
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0004 end');
    });

    /**
     * @tc.name   testRsaKeyChr0005
     * @tc.number SUB_CryptoFramework_RSAKCHR_01_0005
     * @tc.desc   zeroing the DER structure byte at priKey hex position 0 makes conversion fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyChr0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0005 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const priStr: string = parseRsa(fullJson).priKey;
      const pubStr: string = parseRsa(fullJson).pubKey;
      const mutJson: string = '{"priKey":"' + priStr.slice(0, 0) + 'G0' + priStr.slice(0 + 2) + '","pubKey":"' +
        pubStr + '"}';
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0005 end');
    });

    /**
     * @tc.name   testRsaKeyChr0006
     * @tc.number SUB_CryptoFramework_RSAKCHR_01_0006
     * @tc.desc   zeroing the DER structure byte at priKey hex position 0 makes conversion fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyChr0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0006 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const priStr: string = parseRsa(fullJson).priKey;
      const pubStr: string = parseRsa(fullJson).pubKey;
      const mutJson: string = '{"priKey":"' + priStr.slice(0, 0) + 'K0' + priStr.slice(0 + 2) + '","pubKey":"' +
        pubStr + '"}';
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0006 end');
    });

    /**
     * @tc.name   testRsaKeyChr0007
     * @tc.number SUB_CryptoFramework_RSAKCHR_01_0007
     * @tc.desc   zeroing the DER structure byte at priKey hex position 0 makes conversion fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyChr0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0007 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const priStr: string = parseRsa(fullJson).priKey;
      const pubStr: string = parseRsa(fullJson).pubKey;
      const mutJson: string = '{"priKey":"' + priStr.slice(0, 0) + 'T0' + priStr.slice(0 + 2) + '","pubKey":"' +
        pubStr + '"}';
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0007 end');
    });

    /**
     * @tc.name   testRsaKeyChr0008
     * @tc.number SUB_CryptoFramework_RSAKCHR_01_0008
     * @tc.desc   zeroing the DER structure byte at priKey hex position 0 makes conversion fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyChr0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0008 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const priStr: string = parseRsa(fullJson).priKey;
      const pubStr: string = parseRsa(fullJson).pubKey;
      const mutJson: string = '{"priKey":"' + priStr.slice(0, 0) + 'Z0' + priStr.slice(0 + 2) + '","pubKey":"' +
        pubStr + '"}';
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0008 end');
    });

    /**
     * @tc.name   testRsaKeyChr0009
     * @tc.number SUB_CryptoFramework_RSAKCHR_01_0009
     * @tc.desc   zeroing the DER structure byte at priKey hex position 2 makes conversion fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyChr0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0009 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const priStr: string = parseRsa(fullJson).priKey;
      const pubStr: string = parseRsa(fullJson).pubKey;
      const mutJson: string = '{"priKey":"' + priStr.slice(0, 2) + 'g0' + priStr.slice(2 + 2) + '","pubKey":"' +
        pubStr + '"}';
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0009 end');
    });

    /**
     * @tc.name   testRsaKeyChr0010
     * @tc.number SUB_CryptoFramework_RSAKCHR_01_0010
     * @tc.desc   zeroing the DER structure byte at priKey hex position 2 makes conversion fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyChr0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0010 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const priStr: string = parseRsa(fullJson).priKey;
      const pubStr: string = parseRsa(fullJson).pubKey;
      const mutJson: string = '{"priKey":"' + priStr.slice(0, 2) + 'm0' + priStr.slice(2 + 2) + '","pubKey":"' +
        pubStr + '"}';
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0010 end');
    });

    /**
     * @tc.name   testRsaKeyChr0011
     * @tc.number SUB_CryptoFramework_RSAKCHR_01_0011
     * @tc.desc   zeroing the DER structure byte at priKey hex position 2 makes conversion fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyChr0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0011 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const priStr: string = parseRsa(fullJson).priKey;
      const pubStr: string = parseRsa(fullJson).pubKey;
      const mutJson: string = '{"priKey":"' + priStr.slice(0, 2) + 't0' + priStr.slice(2 + 2) + '","pubKey":"' +
        pubStr + '"}';
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0011 end');
    });

    /**
     * @tc.name   testRsaKeyChr0012
     * @tc.number SUB_CryptoFramework_RSAKCHR_01_0012
     * @tc.desc   zeroing the DER structure byte at priKey hex position 2 makes conversion fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyChr0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0012 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const priStr: string = parseRsa(fullJson).priKey;
      const pubStr: string = parseRsa(fullJson).pubKey;
      const mutJson: string = '{"priKey":"' + priStr.slice(0, 2) + 'z0' + priStr.slice(2 + 2) + '","pubKey":"' +
        pubStr + '"}';
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0012 end');
    });

    /**
     * @tc.name   testRsaKeyChr0013
     * @tc.number SUB_CryptoFramework_RSAKCHR_01_0013
     * @tc.desc   zeroing the DER structure byte at priKey hex position 2 makes conversion fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyChr0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0013 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const priStr: string = parseRsa(fullJson).priKey;
      const pubStr: string = parseRsa(fullJson).pubKey;
      const mutJson: string = '{"priKey":"' + priStr.slice(0, 2) + 'G0' + priStr.slice(2 + 2) + '","pubKey":"' +
        pubStr + '"}';
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0013 end');
    });

    /**
     * @tc.name   testRsaKeyChr0014
     * @tc.number SUB_CryptoFramework_RSAKCHR_01_0014
     * @tc.desc   zeroing the DER structure byte at priKey hex position 2 makes conversion fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyChr0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0014 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const priStr: string = parseRsa(fullJson).priKey;
      const pubStr: string = parseRsa(fullJson).pubKey;
      const mutJson: string = '{"priKey":"' + priStr.slice(0, 2) + 'K0' + priStr.slice(2 + 2) + '","pubKey":"' +
        pubStr + '"}';
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0014 end');
    });

    /**
     * @tc.name   testRsaKeyChr0015
     * @tc.number SUB_CryptoFramework_RSAKCHR_01_0015
     * @tc.desc   zeroing the DER structure byte at priKey hex position 2 makes conversion fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyChr0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0015 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const priStr: string = parseRsa(fullJson).priKey;
      const pubStr: string = parseRsa(fullJson).pubKey;
      const mutJson: string = '{"priKey":"' + priStr.slice(0, 2) + 'T0' + priStr.slice(2 + 2) + '","pubKey":"' +
        pubStr + '"}';
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0015 end');
    });

    /**
     * @tc.name   testRsaKeyChr0016
     * @tc.number SUB_CryptoFramework_RSAKCHR_01_0016
     * @tc.desc   zeroing the DER structure byte at priKey hex position 2 makes conversion fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyChr0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0016 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const priStr: string = parseRsa(fullJson).priKey;
      const pubStr: string = parseRsa(fullJson).pubKey;
      const mutJson: string = '{"priKey":"' + priStr.slice(0, 2) + 'Z0' + priStr.slice(2 + 2) + '","pubKey":"' +
        pubStr + '"}';
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
      const result: cryptoFramework.KeyPair = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0016 end');
    });

    /**
     * @tc.name   testRsaKeyChr0017
     * @tc.number SUB_CryptoFramework_RSAKCHR_01_0017
     * @tc.desc   zeroing the byte at priKey hex position 40 makes conversion reject the key pair
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyChr0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0017 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const priStr: string = parseRsa(fullJson).priKey;
      const pubStr: string = parseRsa(fullJson).pubKey;
      const mutJson: string = '{"priKey":"' + priStr.slice(0, 40) + 'g0' + priStr.slice(40 + 2) +
        '","pubKey":"' + pubStr + '"}';
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(mutJson.length),
        String(fullJson.length));
      expect(mutJson.length).assertEqual(fullJson.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0017 end');
    });

    /**
     * @tc.name   testRsaKeyChr0018
     * @tc.number SUB_CryptoFramework_RSAKCHR_01_0018
     * @tc.desc   zeroing the byte at priKey hex position 40 makes conversion reject the key pair
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyChr0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0018 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const priStr: string = parseRsa(fullJson).priKey;
      const pubStr: string = parseRsa(fullJson).pubKey;
      const mutJson: string = '{"priKey":"' + priStr.slice(0, 40) + 'm0' + priStr.slice(40 + 2) +
        '","pubKey":"' + pubStr + '"}';
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(mutJson.length),
        String(fullJson.length));
      expect(mutJson.length).assertEqual(fullJson.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0018 end');
    });

    /**
     * @tc.name   testRsaKeyChr0019
     * @tc.number SUB_CryptoFramework_RSAKCHR_01_0019
     * @tc.desc   zeroing the byte at priKey hex position 40 makes conversion reject the key pair
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyChr0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0019 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const priStr: string = parseRsa(fullJson).priKey;
      const pubStr: string = parseRsa(fullJson).pubKey;
      const mutJson: string = '{"priKey":"' + priStr.slice(0, 40) + 't0' + priStr.slice(40 + 2) +
        '","pubKey":"' + pubStr + '"}';
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(mutJson.length),
        String(fullJson.length));
      expect(mutJson.length).assertEqual(fullJson.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0019 end');
    });

    /**
     * @tc.name   testRsaKeyChr0020
     * @tc.number SUB_CryptoFramework_RSAKCHR_01_0020
     * @tc.desc   zeroing the byte at priKey hex position 40 makes conversion reject the key pair
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyChr0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0020 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const priStr: string = parseRsa(fullJson).priKey;
      const pubStr: string = parseRsa(fullJson).pubKey;
      const mutJson: string = '{"priKey":"' + priStr.slice(0, 40) + 'z0' + priStr.slice(40 + 2) +
        '","pubKey":"' + pubStr + '"}';
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(mutJson.length),
        String(fullJson.length));
      expect(mutJson.length).assertEqual(fullJson.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0020 end');
    });

    /**
     * @tc.name   testRsaKeyChr0021
     * @tc.number SUB_CryptoFramework_RSAKCHR_01_0021
     * @tc.desc   zeroing the byte at priKey hex position 40 makes conversion reject the key pair
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyChr0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0021 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const priStr: string = parseRsa(fullJson).priKey;
      const pubStr: string = parseRsa(fullJson).pubKey;
      const mutJson: string = '{"priKey":"' + priStr.slice(0, 40) + 'G0' + priStr.slice(40 + 2) +
        '","pubKey":"' + pubStr + '"}';
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(mutJson.length),
        String(fullJson.length));
      expect(mutJson.length).assertEqual(fullJson.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0021 end');
    });

    /**
     * @tc.name   testRsaKeyChr0022
     * @tc.number SUB_CryptoFramework_RSAKCHR_01_0022
     * @tc.desc   zeroing the byte at priKey hex position 40 makes conversion reject the key pair
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyChr0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0022 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const priStr: string = parseRsa(fullJson).priKey;
      const pubStr: string = parseRsa(fullJson).pubKey;
      const mutJson: string = '{"priKey":"' + priStr.slice(0, 40) + 'K0' + priStr.slice(40 + 2) +
        '","pubKey":"' + pubStr + '"}';
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(mutJson.length),
        String(fullJson.length));
      expect(mutJson.length).assertEqual(fullJson.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0022 end');
    });

    /**
     * @tc.name   testRsaKeyChr0023
     * @tc.number SUB_CryptoFramework_RSAKCHR_01_0023
     * @tc.desc   zeroing the byte at priKey hex position 40 makes conversion reject the key pair
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyChr0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0023 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const priStr: string = parseRsa(fullJson).priKey;
      const pubStr: string = parseRsa(fullJson).pubKey;
      const mutJson: string = '{"priKey":"' + priStr.slice(0, 40) + 'T0' + priStr.slice(40 + 2) +
        '","pubKey":"' + pubStr + '"}';
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(mutJson.length),
        String(fullJson.length));
      expect(mutJson.length).assertEqual(fullJson.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0023 end');
    });

    /**
     * @tc.name   testRsaKeyChr0024
     * @tc.number SUB_CryptoFramework_RSAKCHR_01_0024
     * @tc.desc   zeroing the byte at priKey hex position 40 makes conversion reject the key pair
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyChr0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0024 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const priStr: string = parseRsa(fullJson).priKey;
      const pubStr: string = parseRsa(fullJson).pubKey;
      const mutJson: string = '{"priKey":"' + priStr.slice(0, 40) + 'Z0' + priStr.slice(40 + 2) +
        '","pubKey":"' + pubStr + '"}';
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlOk !== null && ctrlOk.valueOf()));
      expect(ctrlOk !== null && ctrlOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(mutJson.length),
        String(fullJson.length));
      expect(mutJson.length).assertEqual(fullJson.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0024 end');
    });

    /**
     * @tc.name   testRsaKeyChr0025
     * @tc.number SUB_CryptoFramework_RSAKCHR_01_0025
     * @tc.desc   zeroing a modulus content byte at priKey hex position 100 keeps the key pair valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyChr0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0025 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const priStr: string = parseRsa(fullJson).priKey;
      const pubStr: string = parseRsa(fullJson).pubKey;
      const mutJson: string = '{"priKey":"' + priStr.slice(0, 100) + 'g0' + priStr.slice(100 + 2) +
        '","pubKey":"' + pubStr + '"}';
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0025 end');
    });

    /**
     * @tc.name   testRsaKeyChr0026
     * @tc.number SUB_CryptoFramework_RSAKCHR_01_0026
     * @tc.desc   zeroing a modulus content byte at priKey hex position 100 keeps the key pair valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyChr0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0026 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const priStr: string = parseRsa(fullJson).priKey;
      const pubStr: string = parseRsa(fullJson).pubKey;
      const mutJson: string = '{"priKey":"' + priStr.slice(0, 100) + 'm0' + priStr.slice(100 + 2) +
        '","pubKey":"' + pubStr + '"}';
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0026 end');
    });

    /**
     * @tc.name   testRsaKeyChr0027
     * @tc.number SUB_CryptoFramework_RSAKCHR_01_0027
     * @tc.desc   zeroing a modulus content byte at priKey hex position 100 keeps the key pair valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyChr0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0027 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const priStr: string = parseRsa(fullJson).priKey;
      const pubStr: string = parseRsa(fullJson).pubKey;
      const mutJson: string = '{"priKey":"' + priStr.slice(0, 100) + 't0' + priStr.slice(100 + 2) +
        '","pubKey":"' + pubStr + '"}';
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0027 end');
    });

    /**
     * @tc.name   testRsaKeyChr0028
     * @tc.number SUB_CryptoFramework_RSAKCHR_01_0028
     * @tc.desc   zeroing a modulus content byte at priKey hex position 100 keeps the key pair valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyChr0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0028 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const priStr: string = parseRsa(fullJson).priKey;
      const pubStr: string = parseRsa(fullJson).pubKey;
      const mutJson: string = '{"priKey":"' + priStr.slice(0, 100) + 'z0' + priStr.slice(100 + 2) +
        '","pubKey":"' + pubStr + '"}';
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0028 end');
    });

    /**
     * @tc.name   testRsaKeyChr0029
     * @tc.number SUB_CryptoFramework_RSAKCHR_01_0029
     * @tc.desc   zeroing a modulus content byte at priKey hex position 100 keeps the key pair valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyChr0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0029 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const priStr: string = parseRsa(fullJson).priKey;
      const pubStr: string = parseRsa(fullJson).pubKey;
      const mutJson: string = '{"priKey":"' + priStr.slice(0, 100) + 'G0' + priStr.slice(100 + 2) +
        '","pubKey":"' + pubStr + '"}';
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0029 end');
    });

    /**
     * @tc.name   testRsaKeyChr0030
     * @tc.number SUB_CryptoFramework_RSAKCHR_01_0030
     * @tc.desc   zeroing a modulus content byte at priKey hex position 100 keeps the key pair valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyChr0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0030 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const priStr: string = parseRsa(fullJson).priKey;
      const pubStr: string = parseRsa(fullJson).pubKey;
      const mutJson: string = '{"priKey":"' + priStr.slice(0, 100) + 'K0' + priStr.slice(100 + 2) +
        '","pubKey":"' + pubStr + '"}';
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0030 end');
    });

    /**
     * @tc.name   testRsaKeyChr0031
     * @tc.number SUB_CryptoFramework_RSAKCHR_01_0031
     * @tc.desc   zeroing a modulus content byte at priKey hex position 100 keeps the key pair valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyChr0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0031 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const priStr: string = parseRsa(fullJson).priKey;
      const pubStr: string = parseRsa(fullJson).pubKey;
      const mutJson: string = '{"priKey":"' + priStr.slice(0, 100) + 'T0' + priStr.slice(100 + 2) +
        '","pubKey":"' + pubStr + '"}';
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0031 end');
    });

    /**
     * @tc.name   testRsaKeyChr0032
     * @tc.number SUB_CryptoFramework_RSAKCHR_01_0032
     * @tc.desc   zeroing a modulus content byte at priKey hex position 100 keeps the key pair valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyChr0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0032 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const priStr: string = parseRsa(fullJson).priKey;
      const pubStr: string = parseRsa(fullJson).pubKey;
      const mutJson: string = '{"priKey":"' + priStr.slice(0, 100) + 'Z0' + priStr.slice(100 + 2) +
        '","pubKey":"' + pubStr + '"}';
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0032 end');
    });

    /**
     * @tc.name   testRsaKeyChr0033
     * @tc.number SUB_CryptoFramework_RSAKCHR_01_0033
     * @tc.desc   zeroing a modulus content byte at priKey hex position 200 keeps the key pair valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyChr0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0033 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const priStr: string = parseRsa(fullJson).priKey;
      const pubStr: string = parseRsa(fullJson).pubKey;
      const mutJson: string = '{"priKey":"' + priStr.slice(0, 200) + 'g0' + priStr.slice(200 + 2) +
        '","pubKey":"' + pubStr + '"}';
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0033 end');
    });

    /**
     * @tc.name   testRsaKeyChr0034
     * @tc.number SUB_CryptoFramework_RSAKCHR_01_0034
     * @tc.desc   zeroing a modulus content byte at priKey hex position 200 keeps the key pair valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyChr0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0034 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const priStr: string = parseRsa(fullJson).priKey;
      const pubStr: string = parseRsa(fullJson).pubKey;
      const mutJson: string = '{"priKey":"' + priStr.slice(0, 200) + 'm0' + priStr.slice(200 + 2) +
        '","pubKey":"' + pubStr + '"}';
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0034 end');
    });

    /**
     * @tc.name   testRsaKeyChr0035
     * @tc.number SUB_CryptoFramework_RSAKCHR_01_0035
     * @tc.desc   zeroing a modulus content byte at priKey hex position 200 keeps the key pair valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyChr0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0035 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const priStr: string = parseRsa(fullJson).priKey;
      const pubStr: string = parseRsa(fullJson).pubKey;
      const mutJson: string = '{"priKey":"' + priStr.slice(0, 200) + 't0' + priStr.slice(200 + 2) +
        '","pubKey":"' + pubStr + '"}';
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0035 end');
    });

    /**
     * @tc.name   testRsaKeyChr0036
     * @tc.number SUB_CryptoFramework_RSAKCHR_01_0036
     * @tc.desc   zeroing a modulus content byte at priKey hex position 200 keeps the key pair valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyChr0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0036 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const priStr: string = parseRsa(fullJson).priKey;
      const pubStr: string = parseRsa(fullJson).pubKey;
      const mutJson: string = '{"priKey":"' + priStr.slice(0, 200) + 'z0' + priStr.slice(200 + 2) +
        '","pubKey":"' + pubStr + '"}';
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0036 end');
    });

    /**
     * @tc.name   testRsaKeyChr0037
     * @tc.number SUB_CryptoFramework_RSAKCHR_01_0037
     * @tc.desc   zeroing a modulus content byte at priKey hex position 200 keeps the key pair valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyChr0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0037 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const priStr: string = parseRsa(fullJson).priKey;
      const pubStr: string = parseRsa(fullJson).pubKey;
      const mutJson: string = '{"priKey":"' + priStr.slice(0, 200) + 'G0' + priStr.slice(200 + 2) +
        '","pubKey":"' + pubStr + '"}';
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0037 end');
    });

    /**
     * @tc.name   testRsaKeyChr0038
     * @tc.number SUB_CryptoFramework_RSAKCHR_01_0038
     * @tc.desc   zeroing a modulus content byte at priKey hex position 200 keeps the key pair valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyChr0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0038 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const priStr: string = parseRsa(fullJson).priKey;
      const pubStr: string = parseRsa(fullJson).pubKey;
      const mutJson: string = '{"priKey":"' + priStr.slice(0, 200) + 'K0' + priStr.slice(200 + 2) +
        '","pubKey":"' + pubStr + '"}';
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0038 end');
    });

    /**
     * @tc.name   testRsaKeyChr0039
     * @tc.number SUB_CryptoFramework_RSAKCHR_01_0039
     * @tc.desc   zeroing a modulus content byte at priKey hex position 200 keeps the key pair valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyChr0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0039 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const priStr: string = parseRsa(fullJson).priKey;
      const pubStr: string = parseRsa(fullJson).pubKey;
      const mutJson: string = '{"priKey":"' + priStr.slice(0, 200) + 'T0' + priStr.slice(200 + 2) +
        '","pubKey":"' + pubStr + '"}';
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0039 end');
    });

    /**
     * @tc.name   testRsaKeyChr0040
     * @tc.number SUB_CryptoFramework_RSAKCHR_01_0040
     * @tc.desc   zeroing a modulus content byte at priKey hex position 200 keeps the key pair valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyChr0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0040 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const priStr: string = parseRsa(fullJson).priKey;
      const pubStr: string = parseRsa(fullJson).pubKey;
      const mutJson: string = '{"priKey":"' + priStr.slice(0, 200) + 'Z0' + priStr.slice(200 + 2) +
        '","pubKey":"' + pubStr + '"}';
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0040 end');
    });

    /**
     * @tc.name   testRsaKeyChr0041
     * @tc.number SUB_CryptoFramework_RSAKCHR_01_0041
     * @tc.desc   zeroing a modulus content byte at priKey hex position 400 keeps the key pair valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyChr0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0041 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const priStr: string = parseRsa(fullJson).priKey;
      const pubStr: string = parseRsa(fullJson).pubKey;
      const mutJson: string = '{"priKey":"' + priStr.slice(0, 400) + 'g0' + priStr.slice(400 + 2) +
        '","pubKey":"' + pubStr + '"}';
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0041 end');
    });

    /**
     * @tc.name   testRsaKeyChr0042
     * @tc.number SUB_CryptoFramework_RSAKCHR_01_0042
     * @tc.desc   zeroing a modulus content byte at priKey hex position 400 keeps the key pair valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyChr0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0042 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const priStr: string = parseRsa(fullJson).priKey;
      const pubStr: string = parseRsa(fullJson).pubKey;
      const mutJson: string = '{"priKey":"' + priStr.slice(0, 400) + 'm0' + priStr.slice(400 + 2) +
        '","pubKey":"' + pubStr + '"}';
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0042 end');
    });

    /**
     * @tc.name   testRsaKeyChr0043
     * @tc.number SUB_CryptoFramework_RSAKCHR_01_0043
     * @tc.desc   zeroing a modulus content byte at priKey hex position 400 keeps the key pair valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyChr0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0043 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const priStr: string = parseRsa(fullJson).priKey;
      const pubStr: string = parseRsa(fullJson).pubKey;
      const mutJson: string = '{"priKey":"' + priStr.slice(0, 400) + 't0' + priStr.slice(400 + 2) +
        '","pubKey":"' + pubStr + '"}';
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0043 end');
    });

    /**
     * @tc.name   testRsaKeyChr0044
     * @tc.number SUB_CryptoFramework_RSAKCHR_01_0044
     * @tc.desc   zeroing a modulus content byte at priKey hex position 400 keeps the key pair valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyChr0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0044 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const priStr: string = parseRsa(fullJson).priKey;
      const pubStr: string = parseRsa(fullJson).pubKey;
      const mutJson: string = '{"priKey":"' + priStr.slice(0, 400) + 'z0' + priStr.slice(400 + 2) +
        '","pubKey":"' + pubStr + '"}';
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0044 end');
    });

    /**
     * @tc.name   testRsaKeyChr0045
     * @tc.number SUB_CryptoFramework_RSAKCHR_01_0045
     * @tc.desc   zeroing a modulus content byte at priKey hex position 400 keeps the key pair valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyChr0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0045 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const priStr: string = parseRsa(fullJson).priKey;
      const pubStr: string = parseRsa(fullJson).pubKey;
      const mutJson: string = '{"priKey":"' + priStr.slice(0, 400) + 'G0' + priStr.slice(400 + 2) +
        '","pubKey":"' + pubStr + '"}';
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0045 end');
    });

    /**
     * @tc.name   testRsaKeyChr0046
     * @tc.number SUB_CryptoFramework_RSAKCHR_01_0046
     * @tc.desc   zeroing a modulus content byte at priKey hex position 400 keeps the key pair valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyChr0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0046 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const priStr: string = parseRsa(fullJson).priKey;
      const pubStr: string = parseRsa(fullJson).pubKey;
      const mutJson: string = '{"priKey":"' + priStr.slice(0, 400) + 'K0' + priStr.slice(400 + 2) +
        '","pubKey":"' + pubStr + '"}';
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0046 end');
    });

    /**
     * @tc.name   testRsaKeyChr0047
     * @tc.number SUB_CryptoFramework_RSAKCHR_01_0047
     * @tc.desc   zeroing a modulus content byte at priKey hex position 400 keeps the key pair valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyChr0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0047 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const priStr: string = parseRsa(fullJson).priKey;
      const pubStr: string = parseRsa(fullJson).pubKey;
      const mutJson: string = '{"priKey":"' + priStr.slice(0, 400) + 'T0' + priStr.slice(400 + 2) +
        '","pubKey":"' + pubStr + '"}';
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0047 end');
    });

    /**
     * @tc.name   testRsaKeyChr0048
     * @tc.number SUB_CryptoFramework_RSAKCHR_01_0048
     * @tc.desc   zeroing a modulus content byte at priKey hex position 400 keeps the key pair valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyChr0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0048 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const priStr: string = parseRsa(fullJson).priKey;
      const pubStr: string = parseRsa(fullJson).pubKey;
      const mutJson: string = '{"priKey":"' + priStr.slice(0, 400) + 'Z0' + priStr.slice(400 + 2) +
        '","pubKey":"' + pubStr + '"}';
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0048 end');
    });

    /**
     * @tc.name   testRsaKeyChr0049
     * @tc.number SUB_CryptoFramework_RSAKCHR_01_0049
     * @tc.desc   punctuation pair at modulus byte position 400 keeps the key pair valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyChr0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0049 begin');
      const op: CryptoOperation = new CryptoOperation();
      const fullJson: string = await getCachedRsaJson(op);
      const ctrlPair: cryptoFramework.KeyPair = await op.convertRsaKey(fullJson);
      const ctrlSig: string = await op.rsaSign(ctrlPair, 'sign-control');
      const ctrlOk: Boolean = await op.rsaVerify(ctrlPair, 'sign-control', ctrlSig);
      const priStr: string = parseRsa(fullJson).priKey;
      const pubStr: string = parseRsa(fullJson).pubKey;
      const mutJson: string = '{"priKey":"' + priStr.slice(0, 400) + '!0' + priStr.slice(400 + 2) +
        '","pubKey":"' + pubStr + '"}';
      const actResult: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyChr0049 end');
    });

  });
}
