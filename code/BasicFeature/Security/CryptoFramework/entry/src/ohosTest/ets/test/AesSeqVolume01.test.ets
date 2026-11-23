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

export default function aesSeqTest() {
  describe('AesSeq', () => {

    /**
     * @tc.name   testAesSeq0001
     * @tc.number SUB_CryptoFramework_AESSEQ_01_0001
     * @tc.desc   plaintext roundtrip variant 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesSeq0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0001 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc: string = await op.aesGcmEncrypt(key, 'alpha 1');
      const actResult: string = await op.aesGcmDecrypt(key, enc);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult), String('alpha 1'));
      expect(actResult).assertEqual('alpha 1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult.length), String(7));
      expect(actResult.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(enc === null));
      expect(enc === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0001 end');
    });

    /**
     * @tc.name   testAesSeq0002
     * @tc.number SUB_CryptoFramework_AESSEQ_01_0002
     * @tc.desc   plaintext roundtrip variant 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesSeq0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0002 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc: string = await op.aesGcmEncrypt(key, 'bravo 2');
      const actResult: string = await op.aesGcmDecrypt(key, enc);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult), String('bravo 2'));
      expect(actResult).assertEqual('bravo 2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult.length), String(7));
      expect(actResult.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(enc === null));
      expect(enc === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0002 end');
    });

    /**
     * @tc.name   testAesSeq0003
     * @tc.number SUB_CryptoFramework_AESSEQ_01_0003
     * @tc.desc   plaintext roundtrip variant 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesSeq0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0003 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc: string = await op.aesGcmEncrypt(key, 'charlie 3');
      const actResult: string = await op.aesGcmDecrypt(key, enc);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult), String('charlie 3'));
      expect(actResult).assertEqual('charlie 3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult.length), String(9));
      expect(actResult.length).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(enc === null));
      expect(enc === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0003 end');
    });

    /**
     * @tc.name   testAesSeq0004
     * @tc.number SUB_CryptoFramework_AESSEQ_01_0004
     * @tc.desc   plaintext roundtrip variant 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesSeq0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0004 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc: string = await op.aesGcmEncrypt(key, 'delta 4');
      const actResult: string = await op.aesGcmDecrypt(key, enc);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult), String('delta 4'));
      expect(actResult).assertEqual('delta 4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult.length), String(7));
      expect(actResult.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(enc === null));
      expect(enc === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0004 end');
    });

    /**
     * @tc.name   testAesSeq0005
     * @tc.number SUB_CryptoFramework_AESSEQ_01_0005
     * @tc.desc   plaintext roundtrip variant 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesSeq0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0005 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc: string = await op.aesGcmEncrypt(key, 'echo 5');
      const actResult: string = await op.aesGcmDecrypt(key, enc);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult), String('echo 5'));
      expect(actResult).assertEqual('echo 5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult.length), String(6));
      expect(actResult.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(enc === null));
      expect(enc === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0005 end');
    });

    /**
     * @tc.name   testAesSeq0006
     * @tc.number SUB_CryptoFramework_AESSEQ_01_0006
     * @tc.desc   plaintext roundtrip variant 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesSeq0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0006 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc: string = await op.aesGcmEncrypt(key, 'foxtrot 6');
      const actResult: string = await op.aesGcmDecrypt(key, enc);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult), String('foxtrot 6'));
      expect(actResult).assertEqual('foxtrot 6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult.length), String(9));
      expect(actResult.length).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(enc === null));
      expect(enc === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0006 end');
    });

    /**
     * @tc.name   testAesSeq0007
     * @tc.number SUB_CryptoFramework_AESSEQ_01_0007
     * @tc.desc   plaintext roundtrip variant 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesSeq0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0007 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc: string = await op.aesGcmEncrypt(key, 'golf 7');
      const actResult: string = await op.aesGcmDecrypt(key, enc);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult), String('golf 7'));
      expect(actResult).assertEqual('golf 7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult.length), String(6));
      expect(actResult.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(enc === null));
      expect(enc === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0007 end');
    });

    /**
     * @tc.name   testAesSeq0008
     * @tc.number SUB_CryptoFramework_AESSEQ_01_0008
     * @tc.desc   plaintext roundtrip variant 8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesSeq0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0008 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc: string = await op.aesGcmEncrypt(key, 'hotel 8');
      const actResult: string = await op.aesGcmDecrypt(key, enc);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult), String('hotel 8'));
      expect(actResult).assertEqual('hotel 8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult.length), String(7));
      expect(actResult.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(enc === null));
      expect(enc === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0008 end');
    });

    /**
     * @tc.name   testAesSeq0009
     * @tc.number SUB_CryptoFramework_AESSEQ_01_0009
     * @tc.desc   plaintext roundtrip variant 9
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesSeq0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0009 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc: string = await op.aesGcmEncrypt(key, 'india 9');
      const actResult: string = await op.aesGcmDecrypt(key, enc);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult), String('india 9'));
      expect(actResult).assertEqual('india 9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult.length), String(7));
      expect(actResult.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(enc === null));
      expect(enc === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0009 end');
    });

    /**
     * @tc.name   testAesSeq0010
     * @tc.number SUB_CryptoFramework_AESSEQ_01_0010
     * @tc.desc   plaintext roundtrip variant 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesSeq0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0010 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc: string = await op.aesGcmEncrypt(key, 'juliet 10');
      const actResult: string = await op.aesGcmDecrypt(key, enc);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult), String('juliet 10'));
      expect(actResult).assertEqual('juliet 10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult.length), String(9));
      expect(actResult.length).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(enc === null));
      expect(enc === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0010 end');
    });

    /**
     * @tc.name   testAesSeq0011
     * @tc.number SUB_CryptoFramework_AESSEQ_01_0011
     * @tc.desc   plaintext roundtrip variant 11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesSeq0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0011 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc: string = await op.aesGcmEncrypt(key, 'kilo 11');
      const actResult: string = await op.aesGcmDecrypt(key, enc);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult), String('kilo 11'));
      expect(actResult).assertEqual('kilo 11');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult.length), String(7));
      expect(actResult.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(enc === null));
      expect(enc === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0011 end');
    });

    /**
     * @tc.name   testAesSeq0012
     * @tc.number SUB_CryptoFramework_AESSEQ_01_0012
     * @tc.desc   plaintext roundtrip variant 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesSeq0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0012 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc: string = await op.aesGcmEncrypt(key, 'lima 12');
      const actResult: string = await op.aesGcmDecrypt(key, enc);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult), String('lima 12'));
      expect(actResult).assertEqual('lima 12');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult.length), String(7));
      expect(actResult.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(enc === null));
      expect(enc === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0012 end');
    });

    /**
     * @tc.name   testAesSeq0013
     * @tc.number SUB_CryptoFramework_AESSEQ_01_0013
     * @tc.desc   plaintext roundtrip variant 13
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesSeq0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0013 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc: string = await op.aesGcmEncrypt(key, 'mike 13');
      const actResult: string = await op.aesGcmDecrypt(key, enc);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult), String('mike 13'));
      expect(actResult).assertEqual('mike 13');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult.length), String(7));
      expect(actResult.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(enc === null));
      expect(enc === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0013 end');
    });

    /**
     * @tc.name   testAesSeq0014
     * @tc.number SUB_CryptoFramework_AESSEQ_01_0014
     * @tc.desc   plaintext roundtrip variant 14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesSeq0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0014 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc: string = await op.aesGcmEncrypt(key, 'november 14');
      const actResult: string = await op.aesGcmDecrypt(key, enc);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult), String('november 14'));
      expect(actResult).assertEqual('november 14');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult.length), String(11));
      expect(actResult.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(enc === null));
      expect(enc === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0014 end');
    });

    /**
     * @tc.name   testAesSeq0015
     * @tc.number SUB_CryptoFramework_AESSEQ_01_0015
     * @tc.desc   plaintext roundtrip variant 15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesSeq0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0015 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc: string = await op.aesGcmEncrypt(key, 'oscar 15');
      const actResult: string = await op.aesGcmDecrypt(key, enc);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult), String('oscar 15'));
      expect(actResult).assertEqual('oscar 15');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult.length), String(8));
      expect(actResult.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(enc === null));
      expect(enc === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0015 end');
    });

    /**
     * @tc.name   testAesSeq0016
     * @tc.number SUB_CryptoFramework_AESSEQ_01_0016
     * @tc.desc   plaintext roundtrip variant 16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesSeq0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0016 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc: string = await op.aesGcmEncrypt(key, 'papa 16');
      const actResult: string = await op.aesGcmDecrypt(key, enc);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult), String('papa 16'));
      expect(actResult).assertEqual('papa 16');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult.length), String(7));
      expect(actResult.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(enc === null));
      expect(enc === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0016 end');
    });

    /**
     * @tc.name   testAesSeq0017
     * @tc.number SUB_CryptoFramework_AESSEQ_01_0017
     * @tc.desc   plaintext roundtrip variant 17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesSeq0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0017 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc: string = await op.aesGcmEncrypt(key, 'Hello OpenHarmony CryptoFramework');
      const actResult: string = await op.aesGcmDecrypt(key, enc);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult), String('Hello OpenHarmony CryptoFramework'));
      expect(actResult).assertEqual('Hello OpenHarmony CryptoFramework');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult.length), String(33));
      expect(actResult.length).assertEqual(33);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(enc === null));
      expect(enc === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0017 end');
    });

    /**
     * @tc.name   testAesSeq0018
     * @tc.number SUB_CryptoFramework_AESSEQ_01_0018
     * @tc.desc   plaintext roundtrip variant 18
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesSeq0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0018 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc: string = await op.aesGcmEncrypt(key, '0123456789');
      const actResult: string = await op.aesGcmDecrypt(key, enc);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult), String('0123456789'));
      expect(actResult).assertEqual('0123456789');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult.length), String(10));
      expect(actResult.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(enc === null));
      expect(enc === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0018 end');
    });

    /**
     * @tc.name   testAesSeq0019
     * @tc.number SUB_CryptoFramework_AESSEQ_01_0019
     * @tc.desc   plaintext roundtrip variant 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesSeq0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0019 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc: string = await op.aesGcmEncrypt(key, 'abcdefghijklmnopqrstuvwxyz');
      const actResult: string = await op.aesGcmDecrypt(key, enc);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult), String('abcdefghijklmnopqrstuvwxyz'));
      expect(actResult).assertEqual('abcdefghijklmnopqrstuvwxyz');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult.length), String(26));
      expect(actResult.length).assertEqual(26);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(enc === null));
      expect(enc === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0019 end');
    });

    /**
     * @tc.name   testAesSeq0020
     * @tc.number SUB_CryptoFramework_AESSEQ_01_0020
     * @tc.desc   plaintext roundtrip variant 20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesSeq0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0020 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc: string = await op.aesGcmEncrypt(key, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ');
      const actResult: string = await op.aesGcmDecrypt(key, enc);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult), String('ABCDEFGHIJKLMNOPQRSTUVWXYZ'));
      expect(actResult).assertEqual('ABCDEFGHIJKLMNOPQRSTUVWXYZ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult.length), String(26));
      expect(actResult.length).assertEqual(26);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(enc === null));
      expect(enc === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0020 end');
    });

    /**
     * @tc.name   testAesSeq0021
     * @tc.number SUB_CryptoFramework_AESSEQ_01_0021
     * @tc.desc   plaintext roundtrip variant 21
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesSeq0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0021 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc: string = await op.aesGcmEncrypt(key, '{"name":"crypto","version":26,"ok":true}');
      const actResult: string = await op.aesGcmDecrypt(key, enc);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult), String('{"name":"crypto","v' +
          'ersion":26,"ok":true}'));
      expect(actResult).assertEqual('{"name":"crypto","version":26,"ok":true}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult.length), String(40));
      expect(actResult.length).assertEqual(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(enc === null));
      expect(enc === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0021 end');
    });

    /**
     * @tc.name   testAesSeq0022
     * @tc.number SUB_CryptoFramework_AESSEQ_01_0022
     * @tc.desc   plaintext roundtrip variant 22
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesSeq0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0022 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc: string = await op.aesGcmEncrypt(key, '[1,2,3,4,5]');
      const actResult: string = await op.aesGcmDecrypt(key, enc);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult), String('[1,2,3,4,5]'));
      expect(actResult).assertEqual('[1,2,3,4,5]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult.length), String(11));
      expect(actResult.length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(enc === null));
      expect(enc === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0022 end');
    });

    /**
     * @tc.name   testAesSeq0023
     * @tc.number SUB_CryptoFramework_AESSEQ_01_0023
     * @tc.desc   plaintext roundtrip variant 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesSeq0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0023 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc: string = await op.aesGcmEncrypt(key, 'https://example.com/path?q=1&x=2');
      const actResult: string = await op.aesGcmDecrypt(key, enc);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult), String('https://example.com/path?q=1&x=2'));
      expect(actResult).assertEqual('https://example.com/path?q=1&x=2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult.length), String(32));
      expect(actResult.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(enc === null));
      expect(enc === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0023 end');
    });

    /**
     * @tc.name   testAesSeq0024
     * @tc.number SUB_CryptoFramework_AESSEQ_01_0024
     * @tc.desc   plaintext roundtrip variant 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesSeq0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0024 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc: string = await op.aesGcmEncrypt(key, 'key=value;another=1');
      const actResult: string = await op.aesGcmDecrypt(key, enc);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult), String('key=value;another=1'));
      expect(actResult).assertEqual('key=value;another=1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult.length), String(19));
      expect(actResult.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(enc === null));
      expect(enc === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0024 end');
    });

    /**
     * @tc.name   testAesSeq0025
     * @tc.number SUB_CryptoFramework_AESSEQ_01_0025
     * @tc.desc   plaintext roundtrip variant 25
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesSeq0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0025 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc: string = await op.aesGcmEncrypt(key, 'user@example.com');
      const actResult: string = await op.aesGcmDecrypt(key, enc);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult), String('user@example.com'));
      expect(actResult).assertEqual('user@example.com');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult.length), String(16));
      expect(actResult.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(enc === null));
      expect(enc === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0025 end');
    });

    /**
     * @tc.name   testAesSeq0026
     * @tc.number SUB_CryptoFramework_AESSEQ_01_0026
     * @tc.desc   plaintext roundtrip variant 26
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesSeq0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0026 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc: string = await op.aesGcmEncrypt(key, 'a!@#b$%^c&*()d-=+e_');
      const actResult: string = await op.aesGcmDecrypt(key, enc);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult), String('a!@#b$%^c&*()d-=+e_'));
      expect(actResult).assertEqual('a!@#b$%^c&*()d-=+e_');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult.length), String(19));
      expect(actResult.length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(enc === null));
      expect(enc === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0026 end');
    });

  });
}
