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
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_CryptoFramework]';

export default function aesKeySeqTest() {
  describe('AesKeySeq', () => {

    /**
     * @tc.name   testAesKeySeq0001
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0001
     * @tc.desc   hex value sequence index 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0001 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('00000000000000000000000000000000' +
        '00000000000000000000000000000001');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0001 end');
    });

    /**
     * @tc.name   testAesKeySeq0002
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0002
     * @tc.desc   hex value sequence index 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0002 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('00000000000000000000000000000000' +
        '00000000000000000000000000001002');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0002 end');
    });

    /**
     * @tc.name   testAesKeySeq0003
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0003
     * @tc.desc   hex value sequence index 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0003 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('00000000000000000000000000000000' +
        '00000000000000000000000000002003');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0003 end');
    });

    /**
     * @tc.name   testAesKeySeq0004
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0004
     * @tc.desc   hex value sequence index 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0004 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('00000000000000000000000000000000' +
        '00000000000000000000000000003004');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0004 end');
    });

    /**
     * @tc.name   testAesKeySeq0005
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0005
     * @tc.desc   hex value sequence index 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0005 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('00000000000000000000000000000000' +
        '00000000000000000000000000004005');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0005 end');
    });

    /**
     * @tc.name   testAesKeySeq0006
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0006
     * @tc.desc   hex value sequence index 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0006 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('00000000000000000000000000000000' +
        '00000000000000000000000000005006');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0006 end');
    });

    /**
     * @tc.name   testAesKeySeq0007
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0007
     * @tc.desc   hex value sequence index 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0007 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('00000000000000000000000000000000' +
        '00000000000000000000000000006007');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0007 end');
    });

    /**
     * @tc.name   testAesKeySeq0008
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0008
     * @tc.desc   hex value sequence index 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0008 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('00000000000000000000000000000000' +
        '00000000000000000000000000007008');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0008 end');
    });

    /**
     * @tc.name   testAesKeySeq0009
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0009
     * @tc.desc   hex value sequence index 8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0009 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('00000000000000000000000000000000' +
        '00000000000000000000000000008009');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0009 end');
    });

    /**
     * @tc.name   testAesKeySeq0010
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0010
     * @tc.desc   hex value sequence index 9
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0010 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('00000000000000000000000000000000' +
        '0000000000000000000000000000900a');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0010 end');
    });

    /**
     * @tc.name   testAesKeySeq0011
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0011
     * @tc.desc   hex value sequence index 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0011 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('00000000000000000000000000000000' +
        '0000000000000000000000000000a00b');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0011 end');
    });

    /**
     * @tc.name   testAesKeySeq0012
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0012
     * @tc.desc   hex value sequence index 11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0012 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('00000000000000000000000000000000' +
        '0000000000000000000000000000b00c');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0012 end');
    });

    /**
     * @tc.name   testAesKeySeq0013
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0013
     * @tc.desc   hex value sequence index 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0013 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('00000000000000000000000000000000' +
        '0000000000000000000000000000c00d');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0013 end');
    });

    /**
     * @tc.name   testAesKeySeq0014
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0014
     * @tc.desc   hex value sequence index 13
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0014 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('00000000000000000000000000000000' +
        '0000000000000000000000000000d00e');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0014 end');
    });

    /**
     * @tc.name   testAesKeySeq0015
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0015
     * @tc.desc   hex value sequence index 14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0015 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('00000000000000000000000000000000' +
        '0000000000000000000000000000e00f');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0015 end');
    });

    /**
     * @tc.name   testAesKeySeq0016
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0016
     * @tc.desc   hex value sequence index 15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0016 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('00000000000000000000000000000000' +
        '0000000000000000000000000000f010');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0016 end');
    });

    /**
     * @tc.name   testAesKeySeq0017
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0017
     * @tc.desc   hex value sequence index 16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0017 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('00000000000000000000000000000000' +
        '00000000000000000000000000010011');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0017 end');
    });

    /**
     * @tc.name   testAesKeySeq0018
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0018
     * @tc.desc   hex value sequence index 17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0018 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('00000000000000000000000000000000' +
        '00000000000000000000000000011012');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0018 end');
    });

    /**
     * @tc.name   testAesKeySeq0019
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0019
     * @tc.desc   hex value sequence index 18
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0019 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('00000000000000000000000000000000' +
        '00000000000000000000000000012013');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0019 end');
    });

    /**
     * @tc.name   testAesKeySeq0020
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0020
     * @tc.desc   hex value sequence index 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0020 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('00000000000000000000000000000000' +
        '00000000000000000000000000013014');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0020 end');
    });

    /**
     * @tc.name   testAesKeySeq0021
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0021
     * @tc.desc   hex value sequence index 20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0021 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('00000000000000000000000000000000' +
        '00000000000000000000000000014015');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0021 end');
    });

    /**
     * @tc.name   testAesKeySeq0022
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0022
     * @tc.desc   hex value sequence index 21
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0022 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('00000000000000000000000000000000' +
        '00000000000000000000000000015016');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0022 end');
    });

    /**
     * @tc.name   testAesKeySeq0023
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0023
     * @tc.desc   hex value sequence index 22
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0023 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('00000000000000000000000000000000' +
        '00000000000000000000000000016017');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0023 end');
    });

    /**
     * @tc.name   testAesKeySeq0024
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0024
     * @tc.desc   hex value sequence index 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0024 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('00000000000000000000000000000000' +
        '00000000000000000000000000017018');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0024 end');
    });

    /**
     * @tc.name   testAesKeySeq0025
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0025
     * @tc.desc   all-zero 64-hex lower bound
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0025 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('00000000000000000000000000000000' +
        '00000000000000000000000000000000');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0025 end');
    });

    /**
     * @tc.name   testAesKeySeq0026
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0026
     * @tc.desc   all-f 64-hex upper bound
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0026 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ffffffffffffffffffffffffffffffff' +
        'ffffffffffffffffffffffffffffffff');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0026 end');
    });

    /**
     * @tc.name   testAesKeySeq0027
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0027
     * @tc.desc   all-upper-case F 64-hex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0027 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF' +
        'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0027 end');
    });

    /**
     * @tc.name   testAesKeySeq0028
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0028
     * @tc.desc   mixed case aB pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0028 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('aBaBaBaBaBaBaBaBaBaBaBaBaBaBaBaB' +
        'aBaBaBaBaBaBaBaBaBaBaBaBaBaBaBaB');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0028 end');
    });

    /**
     * @tc.name   testAesKeySeq0029
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0029
     * @tc.desc   alternating 0f pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0029 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f' +
        '0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0029 end');
    });

    /**
     * @tc.name   testAesKeySeq0030
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0030
     * @tc.desc   repeated identical hex bytes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0030 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0030 end');
    });

    /**
     * @tc.name   testAesKeySeq0031
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0031
     * @tc.desc   repeated 55 bytes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0031 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('55555555555555555555555555555555' +
        '55555555555555555555555555555555');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0031 end');
    });

    /**
     * @tc.name   testAesKeySeq0032
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0032
     * @tc.desc   repeated 80 bytes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0032 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('80808080808080808080808080808080' +
        '80808080808080808080808080808080');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0032 end');
    });

    /**
     * @tc.name   testAesKeySeq0033
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0033
     * @tc.desc   repeated 01 bytes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0033 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('01010101010101010101010101010101' +
        '01010101010101010101010101010101');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0033 end');
    });

    /**
     * @tc.name   testAesKeySeq0034
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0034
     * @tc.desc   leading zeros then ab
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0034 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('00000000000000000000000000000000' +
        '000000000000000000000000000000ab');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0034 end');
    });

    /**
     * @tc.name   testAesKeySeq0035
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0035
     * @tc.desc   low half zeros high half f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0035 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('00000000000000000000000000000000' +
        'ffffffffffffffffffffffffffffffff');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0035 end');
    });

    /**
     * @tc.name   testAesKeySeq0036
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0036
     * @tc.desc   low half f high half zeros
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0036 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ffffffffffffffffffffffffffffffff' +
        '00000000000000000000000000000000');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0036 end');
    });

    /**
     * @tc.name   testAesKeySeq0037
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0037
     * @tc.desc   ascending nibble ladder repeated 4x
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0037 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('0123456789abcdef0123456789abcdef' +
        '0123456789abcdef0123456789abcdef');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0037 end');
    });

    /**
     * @tc.name   testAesKeySeq0038
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0038
     * @tc.desc   descending nibble ladder repeated 4x
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0038 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('fedcba9876543210fedcba9876543210' +
        'fedcba9876543210fedcba9876543210');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0038 end');
    });

    /**
     * @tc.name   testAesKeySeq0039
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0039
     * @tc.desc   decimal digits only 64 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0039 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('12345678901234567890123456789012' +
        '34567890123456789012345678901234');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0039 end');
    });

    /**
     * @tc.name   testAesKeySeq0040
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0040
     * @tc.desc   ab prefix c fill cd suffix
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0040 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('abcccccccccccccccccccccccccccccc' +
        'cccccccccccccccccccccccccccccccd');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0040 end');
    });

    /**
     * @tc.name   testAesKeySeq0041
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0041
     * @tc.desc   beef repeated 16x
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0041 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('beefbeefbeefbeefbeefbeefbeefbeef' +
        'beefbeefbeefbeefbeefbeefbeefbeef');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0041 end');
    });

    /**
     * @tc.name   testAesKeySeq0042
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0042
     * @tc.desc   cafe repeated 16x
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0042 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('cafecafecafecafecafecafecafecafe' +
        'cafecafecafecafecafecafecafecafe');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0042 end');
    });

    /**
     * @tc.name   testAesKeySeq0043
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0043
     * @tc.desc   dead repeated 16x
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0043 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('deaddeaddeaddeaddeaddeaddeaddead' +
        'deaddeaddeaddeaddeaddeaddeaddead');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0043 end');
    });

    /**
     * @tc.name   testAesKeySeq0044
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0044
     * @tc.desc   full nibble set repeated 4x
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0044 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('0123456789abcdef0123456789abcdef' +
        '0123456789abcdef0123456789abcdef');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0044 end');
    });

    /**
     * @tc.name   testAesKeySeq0045
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0045
     * @tc.desc   A-F only 64 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0045 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ABCDEFABCDEFABCDEFABCDEFABCDEFAB' +
        'CDEFABCDEFABCDEFABCDEFABCDEFABCD');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0045 end');
    });

    /**
     * @tc.name   testAesKeySeq0046
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0046
     * @tc.desc   filler valid hex index 45
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0046 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('00000000000000000000000000000000' +
        '000000000000000000000000feed02fd');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0046 end');
    });

    /**
     * @tc.name   testAesKeySeq0047
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0047
     * @tc.desc   filler valid hex index 46
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0047 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('00000000000000000000000000000000' +
        '000000000000000000000000feed030e');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0047 end');
    });

    /**
     * @tc.name   testAesKeySeq0048
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0048
     * @tc.desc   filler valid hex index 47
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0048 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('00000000000000000000000000000000' +
        '000000000000000000000000feed031f');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0048 end');
    });

    /**
     * @tc.name   testAesKeySeq0049
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0049
     * @tc.desc   filler valid hex index 48
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0049 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('00000000000000000000000000000000' +
        '000000000000000000000000feed0330');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0049 end');
    });

    /**
     * @tc.name   testAesKeySeq0050
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0050
     * @tc.desc   filler valid hex index 49
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0050 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('00000000000000000000000000000000' +
        '000000000000000000000000feed0341');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.algName), String('AES256'));
      expect(actResult.algName).assertEqual('AES256');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult.getEncoded().data.length), String(32));
      expect(actResult.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0050 end');
    });

    /**
     * @tc.name   testAesKeySeq0051
     * @tc.number SUB_CryptoFramework_AESKSEQ_01_0051
     * @tc.desc   generateAesKey 产出串直接 convert 成功（合法 64-hex 主流程对照）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeySeq0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0051 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyHex: string = await op.generateAesKey();
      const key: cryptoFramework.SymKey = await op.convertAesKey(keyHex);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(key === null), 'false');
      expect(key === null).assertFalse();
      expect(key.algName).assertEqual('AES256');
      expect(key.getEncoded().data.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeySeq0051 end');
    });

  });
}
