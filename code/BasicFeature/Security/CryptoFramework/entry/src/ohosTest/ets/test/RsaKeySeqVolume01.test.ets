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

export default function rsaKeySeqTest() {
  describe('RsaKeySeq', () => {

    /**
     * @tc.name   testRsaKeySeq0001
     * @tc.number SUB_CryptoFramework_RSAKSEQ_01_0001
     * @tc.desc   illegal rsa json variant 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeySeq0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0001 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const goodSig: string = await op.rsaConvertAndSign(goodJson, 'probe');
      const actResult: string = await op.rsaConvertAndSign('not-json', 'probe');
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodSig === null));
      expect(goodSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodSig));
      expect(actResult === goodSig).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0001 end');
    });

    /**
     * @tc.name   testRsaKeySeq0002
     * @tc.number SUB_CryptoFramework_RSAKSEQ_01_0002
     * @tc.desc   illegal rsa json variant 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeySeq0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0002 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const goodSig: string = await op.rsaConvertAndSign(goodJson, 'probe');
      const actResult: string = await op.rsaConvertAndSign('{}', 'probe');
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodSig === null));
      expect(goodSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodSig));
      expect(actResult === goodSig).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0002 end');
    });

    /**
     * @tc.name   testRsaKeySeq0003
     * @tc.number SUB_CryptoFramework_RSAKSEQ_01_0003
     * @tc.desc   illegal rsa json variant 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeySeq0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0003 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const goodSig: string = await op.rsaConvertAndSign(goodJson, 'probe');
      const actResult: string = await op.rsaConvertAndSign('{"priKey":""}', 'probe');
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodSig === null));
      expect(goodSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodSig));
      expect(actResult === goodSig).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0003 end');
    });

    /**
     * @tc.name   testRsaKeySeq0004
     * @tc.number SUB_CryptoFramework_RSAKSEQ_01_0004
     * @tc.desc   illegal rsa json variant 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeySeq0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0004 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const goodSig: string = await op.rsaConvertAndSign(goodJson, 'probe');
      const actResult: string = await op.rsaConvertAndSign('{"pubKey":""}', 'probe');
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodSig === null));
      expect(goodSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodSig));
      expect(actResult === goodSig).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0004 end');
    });

    /**
     * @tc.name   testRsaKeySeq0005
     * @tc.number SUB_CryptoFramework_RSAKSEQ_01_0005
     * @tc.desc   illegal rsa json variant 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeySeq0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0005 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const goodSig: string = await op.rsaConvertAndSign(goodJson, 'probe');
      const actResult: string =
        await op.rsaConvertAndSign('{"priKey":"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"}', 'probe');
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodSig === null));
      expect(goodSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodSig));
      expect(actResult === goodSig).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0005 end');
    });

    /**
     * @tc.name   testRsaKeySeq0006
     * @tc.number SUB_CryptoFramework_RSAKSEQ_01_0006
     * @tc.desc   illegal rsa json variant 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeySeq0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0006 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const goodSig: string = await op.rsaConvertAndSign(goodJson, 'probe');
      const actResult: string =
        await op.rsaConvertAndSign('{"pubKey":"bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
        'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"}', 'probe');
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodSig === null));
      expect(goodSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodSig));
      expect(actResult === goodSig).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0006 end');
    });

    /**
     * @tc.name   testRsaKeySeq0007
     * @tc.number SUB_CryptoFramework_RSAKSEQ_01_0007
     * @tc.desc   illegal rsa json variant 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeySeq0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0007 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const goodSig: string = await op.rsaConvertAndSign(goodJson, 'probe');
      const actResult: string =
        await op.rsaConvertAndSign('{"privateKey":"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"' +
        ',"publicKey":"bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
          'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"}', 'probe');
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodSig === null));
      expect(goodSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodSig));
      expect(actResult === goodSig).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0007 end');
    });

    /**
     * @tc.name   testRsaKeySeq0008
     * @tc.number SUB_CryptoFramework_RSAKSEQ_01_0008
     * @tc.desc   illegal rsa json variant 8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeySeq0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0008 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const goodSig: string = await op.rsaConvertAndSign(goodJson, 'probe');
      const actResult: string =
        await op.rsaConvertAndSign('{"priKey":"zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz' +
        'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"' +
        ',"pubKey":"bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
          'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"}', 'probe');
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodSig === null));
      expect(goodSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodSig));
      expect(actResult === goodSig).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0008 end');
    });

    /**
     * @tc.name   testRsaKeySeq0009
     * @tc.number SUB_CryptoFramework_RSAKSEQ_01_0009
     * @tc.desc   illegal rsa json variant 9
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeySeq0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0009 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const goodSig: string = await op.rsaConvertAndSign(goodJson, 'probe');
      const actResult: string =
        await op.rsaConvertAndSign('{"priKey":"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"' +
        ',"pubKey":"gggggggggggggggggggggggggggggggggggggggggggg' +
          'gggggggggggggggggggggggggggggggggggggggggggggggggggggggg"}', 'probe');
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodSig === null));
      expect(goodSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodSig));
      expect(actResult === goodSig).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0009 end');
    });

    /**
     * @tc.name   testRsaKeySeq0010
     * @tc.number SUB_CryptoFramework_RSAKSEQ_01_0010
     * @tc.desc   illegal rsa json variant 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeySeq0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0010 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const goodSig: string = await op.rsaConvertAndSign(goodJson, 'probe');
      const actResult: string =
        await op.rsaConvertAndSign('{"priKey":"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"' +
        ',"pubKey":"bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
          'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"}', 'probe');
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodSig === null));
      expect(goodSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodSig));
      expect(actResult === goodSig).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0010 end');
    });

    /**
     * @tc.name   testRsaKeySeq0011
     * @tc.number SUB_CryptoFramework_RSAKSEQ_01_0011
     * @tc.desc   illegal rsa json variant 11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeySeq0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0011 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const goodSig: string = await op.rsaConvertAndSign(goodJson, 'probe');
      const actResult: string =
        await op.rsaConvertAndSign('{"priKey":"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"' +
        ',"pubKey":"bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
          'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"}', 'probe');
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodSig === null));
      expect(goodSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodSig));
      expect(actResult === goodSig).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0011 end');
    });

    /**
     * @tc.name   testRsaKeySeq0012
     * @tc.number SUB_CryptoFramework_RSAKSEQ_01_0012
     * @tc.desc   illegal rsa json variant 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeySeq0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0012 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const goodSig: string = await op.rsaConvertAndSign(goodJson, 'probe');
      const actResult: string =
        await op.rsaConvertAndSign('{"priKey":"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"' +
          ',"pubKey":"bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
            'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
        'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
          'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
          'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
            'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
        'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
          'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
          'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
            'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
          'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
            'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
            'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
              'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"}', 'probe');
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodSig === null));
      expect(goodSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodSig));
      expect(actResult === goodSig).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0012 end');
    });

    /**
     * @tc.name   testRsaKeySeq0013
     * @tc.number SUB_CryptoFramework_RSAKSEQ_01_0013
     * @tc.desc   illegal rsa json variant 13
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeySeq0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0013 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const goodSig: string = await op.rsaConvertAndSign(goodJson, 'probe');
      const actResult: string =
        await op.rsaConvertAndSign('{"priKey":"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"' +
            ',"pubKey":"bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
              'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"}', 'probe');
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodSig === null));
      expect(goodSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodSig));
      expect(actResult === goodSig).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0013 end');
    });

    /**
     * @tc.name   testRsaKeySeq0014
     * @tc.number SUB_CryptoFramework_RSAKSEQ_01_0014
     * @tc.desc   illegal rsa json variant 14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeySeq0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0014 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const goodSig: string = await op.rsaConvertAndSign(goodJson, 'probe');
      const actResult: string =
        await op.rsaConvertAndSign('{"priKey":"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
              'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
              'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
              'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
              'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
                'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
              'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
              'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
              'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
              'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
                'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"' +
        ',"pubKey":"bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
          'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
          'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
            'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
          'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
            'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
            'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
              'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
          'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
            'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
            'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
              'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
            'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
              'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
              'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
                'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
          'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
            'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
            'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
              'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
            'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
              'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
              'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
                'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
            'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
              'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
              'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
                'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
              'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
                'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
                'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
                  'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"}', 'probe');
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodSig === null));
      expect(goodSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodSig));
      expect(actResult === goodSig).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0014 end');
    });

    /**
     * @tc.name   testRsaKeySeq0015
     * @tc.number SUB_CryptoFramework_RSAKSEQ_01_0015
     * @tc.desc   illegal rsa json variant 15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeySeq0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0015 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const goodSig: string = await op.rsaConvertAndSign(goodJson, 'probe');
      const actResult: string =
        await op.rsaConvertAndSign('{"priKey":"aaaaaaaaaa","pubKey":"bbbbbbbbbb"}', 'probe');
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodSig === null));
      expect(goodSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodSig));
      expect(actResult === goodSig).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0015 end');
    });

    /**
     * @tc.name   testRsaKeySeq0016
     * @tc.number SUB_CryptoFramework_RSAKSEQ_01_0016
     * @tc.desc   illegal rsa json variant 16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeySeq0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0016 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const goodSig: string = await op.rsaConvertAndSign(goodJson, 'probe');
      const actResult: string = await op.rsaConvertAndSign('{"priKey":123,"pubKey":456}', 'probe');
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodSig === null));
      expect(goodSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodSig));
      expect(actResult === goodSig).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0016 end');
    });

    /**
     * @tc.name   testRsaKeySeq0017
     * @tc.number SUB_CryptoFramework_RSAKSEQ_01_0017
     * @tc.desc   illegal rsa json variant 17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeySeq0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0017 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const goodSig: string = await op.rsaConvertAndSign(goodJson, 'probe');
      const actResult: string = await op.rsaConvertAndSign('{"priKey":null,"pubKey":null}', 'probe');
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodSig === null));
      expect(goodSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodSig));
      expect(actResult === goodSig).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0017 end');
    });

    /**
     * @tc.name   testRsaKeySeq0018
     * @tc.number SUB_CryptoFramework_RSAKSEQ_01_0018
     * @tc.desc   illegal rsa json variant 18
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeySeq0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0018 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const goodSig: string = await op.rsaConvertAndSign(goodJson, 'probe');
      const actResult: string = await op.rsaConvertAndSign('{"priKey":["a"],"pubKey":["b"]}', 'probe');
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodSig === null));
      expect(goodSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodSig));
      expect(actResult === goodSig).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0018 end');
    });

    /**
     * @tc.name   testRsaKeySeq0019
     * @tc.number SUB_CryptoFramework_RSAKSEQ_01_0019
     * @tc.desc   illegal rsa json variant 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeySeq0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0019 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const goodSig: string = await op.rsaConvertAndSign(goodJson, 'probe');
      const actResult: string = await op.rsaConvertAndSign('{"priKey":"aaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa "' +
        ',"pubKey":"bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"}', 'probe');
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodSig === null));
      expect(goodSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodSig));
      expect(actResult === goodSig).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0019 end');
    });

    /**
     * @tc.name   testRsaKeySeq0020
     * @tc.number SUB_CryptoFramework_RSAKSEQ_01_0020
     * @tc.desc   illegal rsa json variant 20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeySeq0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0020 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const goodSig: string = await op.rsaConvertAndSign(goodJson, 'probe');
      const actResult: string = await op.rsaConvertAndSign('{"priKey":"aaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",' +
        '"pubKey":"bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb",}', 'probe');
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodSig === null));
      expect(goodSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodSig));
      expect(actResult === goodSig).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0020 end');
    });

    /**
     * @tc.name   testRsaKeySeq0021
     * @tc.number SUB_CryptoFramework_RSAKSEQ_01_0021
     * @tc.desc   illegal rsa json variant 21
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeySeq0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0021 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const goodSig: string = await op.rsaConvertAndSign(goodJson, 'probe');
      const actResult: string = await op.rsaConvertAndSign('{"priKey":"ababababababababababababababababab' +
        'ababababababababababababababababababababababab"' +
        ',"pubKey":"cdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcd"', 'probe');
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodSig === null));
      expect(goodSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodSig));
      expect(actResult === goodSig).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0021 end');
    });

    /**
     * @tc.name   testRsaKeySeq0022
     * @tc.number SUB_CryptoFramework_RSAKSEQ_01_0022
     * @tc.desc   illegal rsa json variant 22
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeySeq0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0022 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const goodSig: string = await op.rsaConvertAndSign(goodJson, 'probe');
      const actResult: string =
        await op.rsaConvertAndSign('{priKey:aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        ',pubKey:bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb}', 'probe');
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodSig === null));
      expect(goodSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodSig));
      expect(actResult === goodSig).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0022 end');
    });

    /**
     * @tc.name   testRsaKeySeq0023
     * @tc.number SUB_CryptoFramework_RSAKSEQ_01_0023
     * @tc.desc   illegal rsa json variant 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeySeq0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0023 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const goodSig: string = await op.rsaConvertAndSign(goodJson, 'probe');
      const actResult: string = await op.rsaConvertAndSign('priKey=ab&pubKey=bb', 'probe');
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodSig === null));
      expect(goodSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodSig));
      expect(actResult === goodSig).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0023 end');
    });

    /**
     * @tc.name   testRsaKeySeq0024
     * @tc.number SUB_CryptoFramework_RSAKSEQ_01_0024
     * @tc.desc   illegal rsa json variant 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeySeq0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0024 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const goodSig: string = await op.rsaConvertAndSign(goodJson, 'probe');
      const actResult: string = await op.rsaConvertAndSign('["priKey","pubKey"]', 'probe');
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodSig === null));
      expect(goodSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodSig));
      expect(actResult === goodSig).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0024 end');
    });

    /**
     * @tc.name   testRsaKeySeq0025
     * @tc.number SUB_CryptoFramework_RSAKSEQ_01_0025
     * @tc.desc   illegal rsa json variant 25
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeySeq0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0025 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const goodSig: string = await op.rsaConvertAndSign(goodJson, 'probe');
      const actResult: string = await op.rsaConvertAndSign('42', 'probe');
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodSig === null));
      expect(goodSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodSig));
      expect(actResult === goodSig).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0025 end');
    });

    /**
     * @tc.name   testRsaKeySeq0026
     * @tc.number SUB_CryptoFramework_RSAKSEQ_01_0026
     * @tc.desc   illegal rsa json variant 26
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeySeq0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0026 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const goodSig: string = await op.rsaConvertAndSign(goodJson, 'probe');
      const actResult: string = await op.rsaConvertAndSign('true', 'probe');
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodSig === null));
      expect(goodSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodSig));
      expect(actResult === goodSig).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0026 end');
    });

    /**
     * @tc.name   testRsaKeySeq0027
     * @tc.number SUB_CryptoFramework_RSAKSEQ_01_0027
     * @tc.desc   illegal rsa json variant 27
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeySeq0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0027 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const goodSig: string = await op.rsaConvertAndSign(goodJson, 'probe');
      const actResult: string = await op.rsaConvertAndSign('null', 'probe');
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodSig === null));
      expect(goodSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodSig));
      expect(actResult === goodSig).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0027 end');
    });

    /**
     * @tc.name   testRsaKeySeq0028
     * @tc.number SUB_CryptoFramework_RSAKSEQ_01_0028
     * @tc.desc   illegal rsa json variant 28
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeySeq0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0028 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const goodSig: string = await op.rsaConvertAndSign(goodJson, 'probe');
      const actResult: string =
        await op.rsaConvertAndSign('{"PriKey":"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"' +
        ',"PubKey":"bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
          'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"}', 'probe');
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodSig === null));
      expect(goodSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodSig));
      expect(actResult === goodSig).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0028 end');
    });

    /**
     * @tc.name   testRsaKeySeq0029
     * @tc.number SUB_CryptoFramework_RSAKSEQ_01_0029
     * @tc.desc   illegal rsa json variant 29
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeySeq0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0029 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const goodSig: string = await op.rsaConvertAndSign(goodJson, 'probe');
      const actResult: string =
        await op.rsaConvertAndSign('{"prikey":"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"' +
        ',"pubkey":"bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
          'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"}', 'probe');
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodSig === null));
      expect(goodSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodSig));
      expect(actResult === goodSig).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0029 end');
    });

    /**
     * @tc.name   testRsaKeySeq0030
     * @tc.number SUB_CryptoFramework_RSAKSEQ_01_0030
     * @tc.desc   illegal rsa json variant 30
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeySeq0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0030 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const goodSig: string = await op.rsaConvertAndSign(goodJson, 'probe');
      const actResult: string =
        await op.rsaConvertAndSign('{"priKey":"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa","pub' +
        'Key":"bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
          'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb","extra":1}', 'probe');
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodSig === null));
      expect(goodSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodSig));
      expect(actResult === goodSig).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0030 end');
    });

    /**
     * @tc.name   testRsaKeySeq0031
     * @tc.number SUB_CryptoFramework_RSAKSEQ_01_0031
     * @tc.desc   illegal rsa json variant 31
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeySeq0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0031 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const goodSig: string = await op.rsaConvertAndSign(goodJson, 'probe');
      const actResult: string = await op.rsaConvertAndSign('{"priKey":"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaag","pubKey":"bbbbbbbbbbb' +
        'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"}', 'probe');
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodSig === null));
      expect(goodSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodSig));
      expect(actResult === goodSig).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0031 end');
    });

    /**
     * @tc.name   testRsaKeySeq0032
     * @tc.number SUB_CryptoFramework_RSAKSEQ_01_0032
     * @tc.desc   illegal rsa json variant 32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeySeq0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0032 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const goodSig: string = await op.rsaConvertAndSign(goodJson, 'probe');
      const actResult: string = await op.rsaConvertAndSign('{"priKey":"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaa","pubKey":"bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbg"}', 'probe');
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodSig === null));
      expect(goodSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodSig));
      expect(actResult === goodSig).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0032 end');
    });

    /**
     * @tc.name   testRsaKeySeq0033
     * @tc.number SUB_CryptoFramework_RSAKSEQ_01_0033
     * @tc.desc   illegal rsa json variant 33
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeySeq0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0033 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const goodSig: string = await op.rsaConvertAndSign(goodJson, 'probe');
      const actResult: string =
        await op.rsaConvertAndSign('{"priKey":"00000000000000000000000000000000000000000000' +
        '00000000000000000000000000000000000000000000000000000000"' +
        ',"pubKey":"00000000000000000000000000000000000000000000' +
          '00000000000000000000000000000000000000000000000000000000"}', 'probe');
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodSig === null));
      expect(goodSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodSig));
      expect(actResult === goodSig).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0033 end');
    });

    /**
     * @tc.name   testRsaKeySeq0034
     * @tc.number SUB_CryptoFramework_RSAKSEQ_01_0034
     * @tc.desc   illegal rsa json variant 34
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeySeq0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0034 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const goodSig: string = await op.rsaConvertAndSign(goodJson, 'probe');
      const actResult: string =
        await op.rsaConvertAndSign('{"priKey":"ffffffffffffffffffffffffffffffffffffffffffff' +
        'ffffffffffffffffffffffffffffffffffffffffffffffffffffffff"' +
        ',"pubKey":"ffffffffffffffffffffffffffffffffffffffffffff' +
          'ffffffffffffffffffffffffffffffffffffffffffffffffffffffff"}', 'probe');
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodSig === null));
      expect(goodSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodSig));
      expect(actResult === goodSig).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0034 end');
    });

    /**
     * @tc.name   testRsaKeySeq0035
     * @tc.number SUB_CryptoFramework_RSAKSEQ_01_0035
     * @tc.desc   illegal rsa json variant 35
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeySeq0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0035 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const goodSig: string = await op.rsaConvertAndSign(goodJson, 'probe');
      const actResult: string =
        await op.rsaConvertAndSign('{"priKey":"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"' +
        ',"pubKey":"bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
          'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"}', 'probe');
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodSig === null));
      expect(goodSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodSig));
      expect(actResult === goodSig).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0035 end');
    });

    /**
     * @tc.name   testRsaKeySeq0036
     * @tc.number SUB_CryptoFramework_RSAKSEQ_01_0036
     * @tc.desc   illegal rsa json variant 36
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeySeq0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0036 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const goodSig: string = await op.rsaConvertAndSign(goodJson, 'probe');
      const actResult: string = await op.rsaConvertAndSign('{"priKey":"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '\\u0000aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa","pubK' +
        'ey":"bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
          'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"}', 'probe');
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodSig === null));
      expect(goodSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodSig));
      expect(actResult === goodSig).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0036 end');
    });

    /**
     * @tc.name   testRsaKeySeq0037
     * @tc.number SUB_CryptoFramework_RSAKSEQ_01_0037
     * @tc.desc   illegal rsa json variant 37
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeySeq0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0037 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const goodSig: string = await op.rsaConvertAndSign(goodJson, 'probe');
      const actResult: string = await op.rsaConvertAndSign('{"priKey":"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaa","pubKey":"bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
          'bbbbbb\\u0000bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"}', 'probe');
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodSig === null));
      expect(goodSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodSig));
      expect(actResult === goodSig).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0037 end');
    });

    /**
     * @tc.name   testRsaKeySeq0038
     * @tc.number SUB_CryptoFramework_RSAKSEQ_01_0038
     * @tc.desc   illegal rsa json variant 38
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeySeq0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0038 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const goodSig: string = await op.rsaConvertAndSign(goodJson, 'probe');
      const actResult: string =
        await op.rsaConvertAndSign('{"priKey":"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa","pubKey' +
        '":"bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' +
          'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb","priKey":"dup"}', 'probe');
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodSig === null));
      expect(goodSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodSig));
      expect(actResult === goodSig).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0038 end');
    });

    /**
     * @tc.name   testRsaKeySeq0039
     * @tc.number SUB_CryptoFramework_RSAKSEQ_01_0039
     * @tc.desc   illegal rsa json variant 39
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeySeq0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0039 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const goodSig: string = await op.rsaConvertAndSign(goodJson, 'probe');
      const actResult: string = await op.rsaConvertAndSign('{"priKey":"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaazz","pubKey":"bbbbbbbbbbb' +
        'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"}', 'probe');
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodSig === null));
      expect(goodSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodSig));
      expect(actResult === goodSig).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0039 end');
    });

    /**
     * @tc.name   testRsaKeySeq0040
     * @tc.number SUB_CryptoFramework_RSAKSEQ_01_0040
     * @tc.desc   illegal rsa json variant 40
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeySeq0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0040 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodJson: string = await getCachedRsaJson(op);
      const goodSig: string = await op.rsaConvertAndSign(goodJson, 'probe');
      const actResult: string = await op.rsaConvertAndSign('{"priKey":"aaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"' +
        ',"pubKey":"bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"}', 'probe');
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodSig === null));
      expect(goodSig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodSig));
      expect(actResult === goodSig).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0040 end');
    });

    /**
     * @tc.name   testRsaKeySeq0041
     * @tc.number SUB_CryptoFramework_RSAKSEQ_01_0041
     * @tc.desc   generateRsaKey 合法 JSON 走 rsaConvertAndSign 产出 768-hex 签名（主流程对照）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeySeq0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0041 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyJson: string = await op.generateRsaKey();
      const sig: string = await op.rsaConvertAndSign(keyJson, 'anchor flow');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig === null), 'false');
      expect(sig === null).assertFalse();
      expect(sig.length).assertEqual(768);
      expect(keyJson.indexOf('priKey') >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeySeq0041 end');
    });

  });
}
