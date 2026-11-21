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

export default function rsaChainTest() {
  describe('RsaChain', () => {

    /**
     * @tc.name   testRsaChain0001
     * @tc.number SUB_CryptoFramework_RSACHAIN_01_0001
     * @tc.desc   convert and sign with full cached json on a 1-char message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaChain0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0001 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const ctrlSig: string = await op.rsaConvertAndSign(goodJson, 'x');
      const result: string = await op.rsaConvertAndSign(goodJson, 'x');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(ctrlSig));
      expect(result).assertEqual(ctrlSig);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0001 end');
    });

    /**
     * @tc.name   testRsaChain0002
     * @tc.number SUB_CryptoFramework_RSACHAIN_01_0002
     * @tc.desc   convert and sign with full cached json on a 4-char message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaChain0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0002 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const ctrlSig: string = await op.rsaConvertAndSign(goodJson, 'xxxx');
      const result: string = await op.rsaConvertAndSign(goodJson, 'xxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(ctrlSig));
      expect(result).assertEqual(ctrlSig);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0002 end');
    });

    /**
     * @tc.name   testRsaChain0003
     * @tc.number SUB_CryptoFramework_RSACHAIN_01_0003
     * @tc.desc   convert and sign with full cached json on a 16-char message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaChain0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0003 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const ctrlSig: string = await op.rsaConvertAndSign(goodJson, 'xxxxxxxxxxxxxxxx');
      const result: string = await op.rsaConvertAndSign(goodJson, 'xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(ctrlSig));
      expect(result).assertEqual(ctrlSig);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0003 end');
    });

    /**
     * @tc.name   testRsaChain0004
     * @tc.number SUB_CryptoFramework_RSACHAIN_01_0004
     * @tc.desc   convert and sign with full cached json on a 32-char message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaChain0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0004 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const ctrlSig: string = await op.rsaConvertAndSign(goodJson, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const result: string = await op.rsaConvertAndSign(goodJson, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(ctrlSig));
      expect(result).assertEqual(ctrlSig);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0004 end');
    });

    /**
     * @tc.name   testRsaChain0005
     * @tc.number SUB_CryptoFramework_RSACHAIN_01_0005
     * @tc.desc   convert and sign with full cached json on a 63-char message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaChain0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0005 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const ctrlSig: string = await op.rsaConvertAndSign(goodJson, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxx');
      const result: string = await op.rsaConvertAndSign(goodJson, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(768));
      expect(result.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(ctrlSig));
      expect(result).assertEqual(ctrlSig);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0005 end');
    });

    /**
     * @tc.name   testRsaChain0006
     * @tc.number SUB_CryptoFramework_RSACHAIN_01_0006
     * @tc.desc   plain text json makes convert and sign return null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaChain0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0006 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const ctrlSig: string = await op.rsaConvertAndSign(goodJson, 'x');
      const result: string = await op.rsaConvertAndSign('not-json', 'x');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlSig === null));
      expect(ctrlSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0006 end');
    });

    /**
     * @tc.name   testRsaChain0007
     * @tc.number SUB_CryptoFramework_RSACHAIN_01_0007
     * @tc.desc   convert and sign with plain text json on a 4-char message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaChain0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0007 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const ctrlSig: string = await op.rsaConvertAndSign(goodJson, 'xxxx');
      const result: string = await op.rsaConvertAndSign('not-json', 'xxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlSig === null));
      expect(ctrlSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0007 end');
    });

    /**
     * @tc.name   testRsaChain0008
     * @tc.number SUB_CryptoFramework_RSACHAIN_01_0008
     * @tc.desc   convert and sign with plain text json on a 16-char message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaChain0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0008 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const ctrlSig: string = await op.rsaConvertAndSign(goodJson, 'xxxxxxxxxxxxxxxx');
      const result: string = await op.rsaConvertAndSign('not-json', 'xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlSig === null));
      expect(ctrlSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0008 end');
    });

    /**
     * @tc.name   testRsaChain0009
     * @tc.number SUB_CryptoFramework_RSACHAIN_01_0009
     * @tc.desc   convert and sign with plain text json on a 32-char message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaChain0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0009 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const ctrlSig: string = await op.rsaConvertAndSign(goodJson, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const result: string = await op.rsaConvertAndSign('not-json', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlSig === null));
      expect(ctrlSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0009 end');
    });

    /**
     * @tc.name   testRsaChain0010
     * @tc.number SUB_CryptoFramework_RSACHAIN_01_0010
     * @tc.desc   convert and sign with plain text json on a 63-char message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaChain0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0010 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const ctrlSig: string = await op.rsaConvertAndSign(goodJson, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxx');
      const result: string = await op.rsaConvertAndSign('not-json', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlSig === null));
      expect(ctrlSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0010 end');
    });

    /**
     * @tc.name   testRsaChain0011
     * @tc.number SUB_CryptoFramework_RSACHAIN_01_0011
     * @tc.desc   convert and sign with head-truncated json on a 1-char message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaChain0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0011 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const ctrlSig: string = await op.rsaConvertAndSign(goodJson, 'x');
      const result: string = await op.rsaConvertAndSign(goodJson.slice(1), 'x');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlSig === null));
      expect(ctrlSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0011 end');
    });

    /**
     * @tc.name   testRsaChain0012
     * @tc.number SUB_CryptoFramework_RSACHAIN_01_0012
     * @tc.desc   convert and sign with head-truncated json on a 4-char message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaChain0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0012 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const ctrlSig: string = await op.rsaConvertAndSign(goodJson, 'xxxx');
      const result: string = await op.rsaConvertAndSign(goodJson.slice(1), 'xxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlSig === null));
      expect(ctrlSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0012 end');
    });

    /**
     * @tc.name   testRsaChain0013
     * @tc.number SUB_CryptoFramework_RSACHAIN_01_0013
     * @tc.desc   convert and sign with head-truncated json on a 16-char message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaChain0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0013 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const ctrlSig: string = await op.rsaConvertAndSign(goodJson, 'xxxxxxxxxxxxxxxx');
      const result: string = await op.rsaConvertAndSign(goodJson.slice(1), 'xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlSig === null));
      expect(ctrlSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0013 end');
    });

    /**
     * @tc.name   testRsaChain0014
     * @tc.number SUB_CryptoFramework_RSACHAIN_01_0014
     * @tc.desc   convert and sign with head-truncated json on a 32-char message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaChain0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0014 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const ctrlSig: string = await op.rsaConvertAndSign(goodJson, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const result: string = await op.rsaConvertAndSign(goodJson.slice(1), 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlSig === null));
      expect(ctrlSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0014 end');
    });

    /**
     * @tc.name   testRsaChain0015
     * @tc.number SUB_CryptoFramework_RSACHAIN_01_0015
     * @tc.desc   convert and sign with head-truncated json on a 63-char message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaChain0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0015 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const ctrlSig: string = await op.rsaConvertAndSign(goodJson, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxx');
      const result: string = await op.rsaConvertAndSign(goodJson.slice(1), 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlSig === null));
      expect(ctrlSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0015 end');
    });

    /**
     * @tc.name   testRsaChain0016
     * @tc.number SUB_CryptoFramework_RSACHAIN_01_0016
     * @tc.desc   convert and sign with tail-truncated json on a 1-char message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaChain0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0016 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const ctrlSig: string = await op.rsaConvertAndSign(goodJson, 'x');
      const result: string = await op.rsaConvertAndSign(goodJson.slice(0, goodJson.length - 1), 'x');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlSig === null));
      expect(ctrlSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0016 end');
    });

    /**
     * @tc.name   testRsaChain0017
     * @tc.number SUB_CryptoFramework_RSACHAIN_01_0017
     * @tc.desc   convert and sign with tail-truncated json on a 4-char message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaChain0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0017 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const ctrlSig: string = await op.rsaConvertAndSign(goodJson, 'xxxx');
      const result: string = await op.rsaConvertAndSign(goodJson.slice(0, goodJson.length - 1), 'xxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlSig === null));
      expect(ctrlSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0017 end');
    });

    /**
     * @tc.name   testRsaChain0018
     * @tc.number SUB_CryptoFramework_RSACHAIN_01_0018
     * @tc.desc   convert and sign with tail-truncated json on a 16-char message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaChain0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0018 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const ctrlSig: string = await op.rsaConvertAndSign(goodJson, 'xxxxxxxxxxxxxxxx');
      const result: string = await op.rsaConvertAndSign(goodJson.slice(0, goodJson.length - 1), 'xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlSig === null));
      expect(ctrlSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0018 end');
    });

    /**
     * @tc.name   testRsaChain0019
     * @tc.number SUB_CryptoFramework_RSACHAIN_01_0019
     * @tc.desc   convert and sign with tail-truncated json on a 32-char message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaChain0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0019 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const ctrlSig: string = await op.rsaConvertAndSign(goodJson, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const result: string = await op.rsaConvertAndSign(goodJson.slice(0, goodJson.length - 1), 'xxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlSig === null));
      expect(ctrlSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0019 end');
    });

    /**
     * @tc.name   testRsaChain0020
     * @tc.number SUB_CryptoFramework_RSACHAIN_01_0020
     * @tc.desc   convert and sign with tail-truncated json on a 63-char message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaChain0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0020 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const ctrlSig: string = await op.rsaConvertAndSign(goodJson, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxx');
      const result: string = await op.rsaConvertAndSign(goodJson.slice(0, goodJson.length - 1), 'xxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlSig === null));
      expect(ctrlSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0020 end');
    });

    /**
     * @tc.name   testRsaChain0021
     * @tc.number SUB_CryptoFramework_RSACHAIN_01_0021
     * @tc.desc   convert and sign with empty object json on a 1-char message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaChain0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0021 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const ctrlSig: string = await op.rsaConvertAndSign(goodJson, 'x');
      const result: string = await op.rsaConvertAndSign('{}', 'x');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlSig === null));
      expect(ctrlSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0021 end');
    });

    /**
     * @tc.name   testRsaChain0022
     * @tc.number SUB_CryptoFramework_RSACHAIN_01_0022
     * @tc.desc   convert and sign with empty object json on a 4-char message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaChain0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0022 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const ctrlSig: string = await op.rsaConvertAndSign(goodJson, 'xxxx');
      const result: string = await op.rsaConvertAndSign('{}', 'xxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlSig === null));
      expect(ctrlSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0022 end');
    });

    /**
     * @tc.name   testRsaChain0023
     * @tc.number SUB_CryptoFramework_RSACHAIN_01_0023
     * @tc.desc   convert and sign with empty object json on a 16-char message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaChain0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0023 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const ctrlSig: string = await op.rsaConvertAndSign(goodJson, 'xxxxxxxxxxxxxxxx');
      const result: string = await op.rsaConvertAndSign('{}', 'xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlSig === null));
      expect(ctrlSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0023 end');
    });

    /**
     * @tc.name   testRsaChain0024
     * @tc.number SUB_CryptoFramework_RSACHAIN_01_0024
     * @tc.desc   convert and sign with empty object json on a 32-char message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaChain0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0024 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const ctrlSig: string = await op.rsaConvertAndSign(goodJson, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const result: string = await op.rsaConvertAndSign('{}', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlSig === null));
      expect(ctrlSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0024 end');
    });

    /**
     * @tc.name   testRsaChain0025
     * @tc.number SUB_CryptoFramework_RSACHAIN_01_0025
     * @tc.desc   convert and sign with empty object json on a 63-char message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaChain0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0025 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const ctrlSig: string = await op.rsaConvertAndSign(goodJson, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxx');
      const result: string = await op.rsaConvertAndSign('{}', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlSig === null));
      expect(ctrlSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0025 end');
    });

    /**
     * @tc.name   testRsaChain0026
     * @tc.number SUB_CryptoFramework_RSACHAIN_01_0026
     * @tc.desc   convert and sign with empty key fields json on a 1-char message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaChain0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0026 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const ctrlSig: string = await op.rsaConvertAndSign(goodJson, 'x');
      const result: string = await op.rsaConvertAndSign('{"priKey":"","pubKey":""}', 'x');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlSig === null));
      expect(ctrlSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0026 end');
    });

    /**
     * @tc.name   testRsaChain0027
     * @tc.number SUB_CryptoFramework_RSACHAIN_01_0027
     * @tc.desc   convert and sign with empty key fields json on a 4-char message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaChain0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0027 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const ctrlSig: string = await op.rsaConvertAndSign(goodJson, 'xxxx');
      const result: string = await op.rsaConvertAndSign('{"priKey":"","pubKey":""}', 'xxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlSig === null));
      expect(ctrlSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0027 end');
    });

    /**
     * @tc.name   testRsaChain0028
     * @tc.number SUB_CryptoFramework_RSACHAIN_01_0028
     * @tc.desc   convert and sign with empty key fields json on a 16-char message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaChain0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0028 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const ctrlSig: string = await op.rsaConvertAndSign(goodJson, 'xxxxxxxxxxxxxxxx');
      const result: string = await op.rsaConvertAndSign('{"priKey":"","pubKey":""}', 'xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlSig === null));
      expect(ctrlSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0028 end');
    });

    /**
     * @tc.name   testRsaChain0029
     * @tc.number SUB_CryptoFramework_RSACHAIN_01_0029
     * @tc.desc   convert and sign with empty key fields json on a 32-char message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaChain0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0029 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const ctrlSig: string = await op.rsaConvertAndSign(goodJson, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const result: string = await op.rsaConvertAndSign('{"priKey":"","pubKey":""}', 'xxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlSig === null));
      expect(ctrlSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0029 end');
    });

    /**
     * @tc.name   testRsaChain0030
     * @tc.number SUB_CryptoFramework_RSACHAIN_01_0030
     * @tc.desc   convert and sign with empty key fields json on a 63-char message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaChain0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0030 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const ctrlSig: string = await op.rsaConvertAndSign(goodJson, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxx');
      const result: string = await op.rsaConvertAndSign('{"priKey":"","pubKey":""}', 'xxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlSig === null));
      expect(ctrlSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0030 end');
    });

    /**
     * @tc.name   testRsaChain0031
     * @tc.number SUB_CryptoFramework_RSACHAIN_01_0031
     * @tc.desc   convert and sign with single nibble key fields json on a 1-char message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaChain0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0031 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const ctrlSig: string = await op.rsaConvertAndSign(goodJson, 'x');
      const result: string = await op.rsaConvertAndSign('{"priKey":"0","pubKey":"0"}', 'x');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlSig === null));
      expect(ctrlSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0031 end');
    });

    /**
     * @tc.name   testRsaChain0032
     * @tc.number SUB_CryptoFramework_RSACHAIN_01_0032
     * @tc.desc   convert and sign with single nibble key fields json on a 4-char message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaChain0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0032 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const ctrlSig: string = await op.rsaConvertAndSign(goodJson, 'xxxx');
      const result: string = await op.rsaConvertAndSign('{"priKey":"0","pubKey":"0"}', 'xxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlSig === null));
      expect(ctrlSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0032 end');
    });

    /**
     * @tc.name   testRsaChain0033
     * @tc.number SUB_CryptoFramework_RSACHAIN_01_0033
     * @tc.desc   convert and sign with single nibble key fields json on a 16-char message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaChain0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0033 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const ctrlSig: string = await op.rsaConvertAndSign(goodJson, 'xxxxxxxxxxxxxxxx');
      const result: string = await op.rsaConvertAndSign('{"priKey":"0","pubKey":"0"}', 'xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlSig === null));
      expect(ctrlSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0033 end');
    });

    /**
     * @tc.name   testRsaChain0034
     * @tc.number SUB_CryptoFramework_RSACHAIN_01_0034
     * @tc.desc   convert and sign with single nibble key fields json on a 32-char message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaChain0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0034 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const ctrlSig: string = await op.rsaConvertAndSign(goodJson, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const result: string = await op.rsaConvertAndSign('{"priKey":"0","pubKey":"0"}', 'xxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlSig === null));
      expect(ctrlSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0034 end');
    });

    /**
     * @tc.name   testRsaChain0035
     * @tc.number SUB_CryptoFramework_RSACHAIN_01_0035
     * @tc.desc   convert and sign with single nibble key fields json on a 63-char message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaChain0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0035 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const ctrlSig: string = await op.rsaConvertAndSign(goodJson, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxx');
      const result: string = await op.rsaConvertAndSign('{"priKey":"0","pubKey":"0"}', 'xxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlSig === null));
      expect(ctrlSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0035 end');
    });

    /**
     * @tc.name   testRsaChain0036
     * @tc.number SUB_CryptoFramework_RSACHAIN_01_0036
     * @tc.desc   convert and sign with array json on a 1-char message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaChain0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0036 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const ctrlSig: string = await op.rsaConvertAndSign(goodJson, 'x');
      const result: string = await op.rsaConvertAndSign('[]', 'x');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlSig === null));
      expect(ctrlSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0036 end');
    });

    /**
     * @tc.name   testRsaChain0037
     * @tc.number SUB_CryptoFramework_RSACHAIN_01_0037
     * @tc.desc   convert and sign with array json on a 4-char message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaChain0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0037 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const ctrlSig: string = await op.rsaConvertAndSign(goodJson, 'xxxx');
      const result: string = await op.rsaConvertAndSign('[]', 'xxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlSig === null));
      expect(ctrlSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0037 end');
    });

    /**
     * @tc.name   testRsaChain0038
     * @tc.number SUB_CryptoFramework_RSACHAIN_01_0038
     * @tc.desc   convert and sign with array json on a 16-char message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaChain0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0038 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const ctrlSig: string = await op.rsaConvertAndSign(goodJson, 'xxxxxxxxxxxxxxxx');
      const result: string = await op.rsaConvertAndSign('[]', 'xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlSig === null));
      expect(ctrlSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0038 end');
    });

    /**
     * @tc.name   testRsaChain0039
     * @tc.number SUB_CryptoFramework_RSACHAIN_01_0039
     * @tc.desc   convert and sign with array json on a 32-char message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaChain0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0039 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const ctrlSig: string = await op.rsaConvertAndSign(goodJson, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const result: string = await op.rsaConvertAndSign('[]', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlSig === null));
      expect(ctrlSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0039 end');
    });

    /**
     * @tc.name   testRsaChain0040
     * @tc.number SUB_CryptoFramework_RSACHAIN_01_0040
     * @tc.desc   convert and sign with array json on a 63-char message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaChain0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0040 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const ctrlSig: string = await op.rsaConvertAndSign(goodJson, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxx');
      const result: string = await op.rsaConvertAndSign('[]', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrlSig === null));
      expect(ctrlSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlSig.length), String(768));
      expect(ctrlSig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaChain0040 end');
    });

  });
}
