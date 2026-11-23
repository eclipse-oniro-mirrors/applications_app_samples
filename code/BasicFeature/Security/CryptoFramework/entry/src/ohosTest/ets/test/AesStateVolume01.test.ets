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

export default function aesStateTest() {
  describe('AesState', () => {

    /**
     * @tc.name   testAesState0001
     * @tc.number SUB_CryptoFramework_AESSTATE_01_0001
     * @tc.desc   two-round state sequence variant 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesState0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0001 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc1: string = await op.aesGcmEncrypt(key, 'round state 1');
      const dec1: string = await op.aesGcmDecrypt(key, enc1);
      const enc2: string = await op.aesGcmEncrypt(key, dec1);
      const actResult: string = await op.aesGcmDecrypt(key, enc2);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(dec1), String('round state 1'));
      expect(dec1).assertEqual('round state 1');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult), String('round state 1'));
      expect(actResult).assertEqual('round state 1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(enc1 === enc2), String(true));
      expect(enc1 === enc2).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0001 end');
    });

    /**
     * @tc.name   testAesState0002
     * @tc.number SUB_CryptoFramework_AESSTATE_01_0002
     * @tc.desc   two-round state sequence variant 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesState0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0002 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc1: string = await op.aesGcmEncrypt(key, 'round state 2');
      const dec1: string = await op.aesGcmDecrypt(key, enc1);
      const enc2: string = await op.aesGcmEncrypt(key, dec1);
      const actResult: string = await op.aesGcmDecrypt(key, enc2);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(dec1), String('round state 2'));
      expect(dec1).assertEqual('round state 2');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult), String('round state 2'));
      expect(actResult).assertEqual('round state 2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(enc1 === enc2), String(true));
      expect(enc1 === enc2).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0002 end');
    });

    /**
     * @tc.name   testAesState0003
     * @tc.number SUB_CryptoFramework_AESSTATE_01_0003
     * @tc.desc   two-round state sequence variant 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesState0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0003 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc1: string = await op.aesGcmEncrypt(key, 'round state 3');
      const dec1: string = await op.aesGcmDecrypt(key, enc1);
      const enc2: string = await op.aesGcmEncrypt(key, dec1);
      const actResult: string = await op.aesGcmDecrypt(key, enc2);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(dec1), String('round state 3'));
      expect(dec1).assertEqual('round state 3');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult), String('round state 3'));
      expect(actResult).assertEqual('round state 3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(enc1 === enc2), String(true));
      expect(enc1 === enc2).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0003 end');
    });

    /**
     * @tc.name   testAesState0004
     * @tc.number SUB_CryptoFramework_AESSTATE_01_0004
     * @tc.desc   two-round state sequence variant 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesState0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0004 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc1: string = await op.aesGcmEncrypt(key, 'round state 4');
      const dec1: string = await op.aesGcmDecrypt(key, enc1);
      const enc2: string = await op.aesGcmEncrypt(key, dec1);
      const actResult: string = await op.aesGcmDecrypt(key, enc2);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(dec1), String('round state 4'));
      expect(dec1).assertEqual('round state 4');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult), String('round state 4'));
      expect(actResult).assertEqual('round state 4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(enc1 === enc2), String(true));
      expect(enc1 === enc2).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0004 end');
    });

    /**
     * @tc.name   testAesState0005
     * @tc.number SUB_CryptoFramework_AESSTATE_01_0005
     * @tc.desc   two-round state sequence variant 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesState0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0005 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc1: string = await op.aesGcmEncrypt(key, 'round state 5');
      const dec1: string = await op.aesGcmDecrypt(key, enc1);
      const enc2: string = await op.aesGcmEncrypt(key, dec1);
      const actResult: string = await op.aesGcmDecrypt(key, enc2);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(dec1), String('round state 5'));
      expect(dec1).assertEqual('round state 5');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult), String('round state 5'));
      expect(actResult).assertEqual('round state 5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(enc1 === enc2), String(true));
      expect(enc1 === enc2).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0005 end');
    });

    /**
     * @tc.name   testAesState0006
     * @tc.number SUB_CryptoFramework_AESSTATE_01_0006
     * @tc.desc   two-round state sequence variant 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesState0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0006 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc1: string = await op.aesGcmEncrypt(key, 'round state 6');
      const dec1: string = await op.aesGcmDecrypt(key, enc1);
      const enc2: string = await op.aesGcmEncrypt(key, dec1);
      const actResult: string = await op.aesGcmDecrypt(key, enc2);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(dec1), String('round state 6'));
      expect(dec1).assertEqual('round state 6');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult), String('round state 6'));
      expect(actResult).assertEqual('round state 6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(enc1 === enc2), String(true));
      expect(enc1 === enc2).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0006 end');
    });

    /**
     * @tc.name   testAesState0007
     * @tc.number SUB_CryptoFramework_AESSTATE_01_0007
     * @tc.desc   two-round state sequence variant 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesState0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0007 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc1: string = await op.aesGcmEncrypt(key, 'round state 7');
      const dec1: string = await op.aesGcmDecrypt(key, enc1);
      const enc2: string = await op.aesGcmEncrypt(key, dec1);
      const actResult: string = await op.aesGcmDecrypt(key, enc2);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(dec1), String('round state 7'));
      expect(dec1).assertEqual('round state 7');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult), String('round state 7'));
      expect(actResult).assertEqual('round state 7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(enc1 === enc2), String(true));
      expect(enc1 === enc2).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0007 end');
    });

    /**
     * @tc.name   testAesState0008
     * @tc.number SUB_CryptoFramework_AESSTATE_01_0008
     * @tc.desc   two-round state sequence variant 8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesState0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0008 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc1: string = await op.aesGcmEncrypt(key, 'round state 8');
      const dec1: string = await op.aesGcmDecrypt(key, enc1);
      const enc2: string = await op.aesGcmEncrypt(key, dec1);
      const actResult: string = await op.aesGcmDecrypt(key, enc2);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(dec1), String('round state 8'));
      expect(dec1).assertEqual('round state 8');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult), String('round state 8'));
      expect(actResult).assertEqual('round state 8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(enc1 === enc2), String(true));
      expect(enc1 === enc2).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0008 end');
    });

    /**
     * @tc.name   testAesState0009
     * @tc.number SUB_CryptoFramework_AESSTATE_01_0009
     * @tc.desc   two-round state sequence variant 9
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesState0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0009 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc1: string = await op.aesGcmEncrypt(key, 'round state 9');
      const dec1: string = await op.aesGcmDecrypt(key, enc1);
      const enc2: string = await op.aesGcmEncrypt(key, dec1);
      const actResult: string = await op.aesGcmDecrypt(key, enc2);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(dec1), String('round state 9'));
      expect(dec1).assertEqual('round state 9');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult), String('round state 9'));
      expect(actResult).assertEqual('round state 9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(enc1 === enc2), String(true));
      expect(enc1 === enc2).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0009 end');
    });

    /**
     * @tc.name   testAesState0010
     * @tc.number SUB_CryptoFramework_AESSTATE_01_0010
     * @tc.desc   two-round state sequence variant 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesState0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0010 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc1: string = await op.aesGcmEncrypt(key, 'round state 10');
      const dec1: string = await op.aesGcmDecrypt(key, enc1);
      const enc2: string = await op.aesGcmEncrypt(key, dec1);
      const actResult: string = await op.aesGcmDecrypt(key, enc2);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(dec1), String('round state 10'));
      expect(dec1).assertEqual('round state 10');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult), String('round state 10'));
      expect(actResult).assertEqual('round state 10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(enc1 === enc2), String(true));
      expect(enc1 === enc2).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0010 end');
    });

    /**
     * @tc.name   testAesState0011
     * @tc.number SUB_CryptoFramework_AESSTATE_01_0011
     * @tc.desc   two-round state sequence variant 11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesState0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0011 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc1: string = await op.aesGcmEncrypt(key, 'round state 11');
      const dec1: string = await op.aesGcmDecrypt(key, enc1);
      const enc2: string = await op.aesGcmEncrypt(key, dec1);
      const actResult: string = await op.aesGcmDecrypt(key, enc2);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(dec1), String('round state 11'));
      expect(dec1).assertEqual('round state 11');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult), String('round state 11'));
      expect(actResult).assertEqual('round state 11');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(enc1 === enc2), String(true));
      expect(enc1 === enc2).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0011 end');
    });

    /**
     * @tc.name   testAesState0012
     * @tc.number SUB_CryptoFramework_AESSTATE_01_0012
     * @tc.desc   two-round state sequence variant 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesState0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0012 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc1: string = await op.aesGcmEncrypt(key, 'round state 12');
      const dec1: string = await op.aesGcmDecrypt(key, enc1);
      const enc2: string = await op.aesGcmEncrypt(key, dec1);
      const actResult: string = await op.aesGcmDecrypt(key, enc2);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(dec1), String('round state 12'));
      expect(dec1).assertEqual('round state 12');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult), String('round state 12'));
      expect(actResult).assertEqual('round state 12');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(enc1 === enc2), String(true));
      expect(enc1 === enc2).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0012 end');
    });

    /**
     * @tc.name   testAesState0013
     * @tc.number SUB_CryptoFramework_AESSTATE_01_0013
     * @tc.desc   two-round state sequence variant 13
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesState0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0013 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc1: string = await op.aesGcmEncrypt(key, 'round state 13');
      const dec1: string = await op.aesGcmDecrypt(key, enc1);
      const enc2: string = await op.aesGcmEncrypt(key, dec1);
      const actResult: string = await op.aesGcmDecrypt(key, enc2);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(dec1), String('round state 13'));
      expect(dec1).assertEqual('round state 13');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult), String('round state 13'));
      expect(actResult).assertEqual('round state 13');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(enc1 === enc2), String(true));
      expect(enc1 === enc2).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0013 end');
    });

    /**
     * @tc.name   testAesState0014
     * @tc.number SUB_CryptoFramework_AESSTATE_01_0014
     * @tc.desc   two-round state sequence variant 14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesState0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0014 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc1: string = await op.aesGcmEncrypt(key, 'round state 14');
      const dec1: string = await op.aesGcmDecrypt(key, enc1);
      const enc2: string = await op.aesGcmEncrypt(key, dec1);
      const actResult: string = await op.aesGcmDecrypt(key, enc2);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(dec1), String('round state 14'));
      expect(dec1).assertEqual('round state 14');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult), String('round state 14'));
      expect(actResult).assertEqual('round state 14');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(enc1 === enc2), String(true));
      expect(enc1 === enc2).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0014 end');
    });

    /**
     * @tc.name   testAesState0015
     * @tc.number SUB_CryptoFramework_AESSTATE_01_0015
     * @tc.desc   two-round state sequence variant 15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesState0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0015 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc1: string = await op.aesGcmEncrypt(key, 'round state 15');
      const dec1: string = await op.aesGcmDecrypt(key, enc1);
      const enc2: string = await op.aesGcmEncrypt(key, dec1);
      const actResult: string = await op.aesGcmDecrypt(key, enc2);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(dec1), String('round state 15'));
      expect(dec1).assertEqual('round state 15');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult), String('round state 15'));
      expect(actResult).assertEqual('round state 15');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(enc1 === enc2), String(true));
      expect(enc1 === enc2).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0015 end');
    });

    /**
     * @tc.name   testAesState0016
     * @tc.number SUB_CryptoFramework_AESSTATE_01_0016
     * @tc.desc   two-round state sequence variant 16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesState0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0016 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc1: string = await op.aesGcmEncrypt(key, 'round state 16');
      const dec1: string = await op.aesGcmDecrypt(key, enc1);
      const enc2: string = await op.aesGcmEncrypt(key, dec1);
      const actResult: string = await op.aesGcmDecrypt(key, enc2);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(dec1), String('round state 16'));
      expect(dec1).assertEqual('round state 16');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult), String('round state 16'));
      expect(actResult).assertEqual('round state 16');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(enc1 === enc2), String(true));
      expect(enc1 === enc2).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0016 end');
    });

    /**
     * @tc.name   testAesState0017
     * @tc.number SUB_CryptoFramework_AESSTATE_01_0017
     * @tc.desc   two-round state sequence variant 17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesState0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0017 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc1: string = await op.aesGcmEncrypt(key, 'round state 17');
      const dec1: string = await op.aesGcmDecrypt(key, enc1);
      const enc2: string = await op.aesGcmEncrypt(key, dec1);
      const actResult: string = await op.aesGcmDecrypt(key, enc2);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(dec1), String('round state 17'));
      expect(dec1).assertEqual('round state 17');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult), String('round state 17'));
      expect(actResult).assertEqual('round state 17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(enc1 === enc2), String(true));
      expect(enc1 === enc2).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0017 end');
    });

    /**
     * @tc.name   testAesState0018
     * @tc.number SUB_CryptoFramework_AESSTATE_01_0018
     * @tc.desc   two-round state sequence variant 18
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesState0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0018 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc1: string = await op.aesGcmEncrypt(key, 'round state 18');
      const dec1: string = await op.aesGcmDecrypt(key, enc1);
      const enc2: string = await op.aesGcmEncrypt(key, dec1);
      const actResult: string = await op.aesGcmDecrypt(key, enc2);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(dec1), String('round state 18'));
      expect(dec1).assertEqual('round state 18');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult), String('round state 18'));
      expect(actResult).assertEqual('round state 18');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(enc1 === enc2), String(true));
      expect(enc1 === enc2).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0018 end');
    });

    /**
     * @tc.name   testAesState0019
     * @tc.number SUB_CryptoFramework_AESSTATE_01_0019
     * @tc.desc   two-round state sequence variant 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesState0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0019 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc1: string = await op.aesGcmEncrypt(key, 'round state 19');
      const dec1: string = await op.aesGcmDecrypt(key, enc1);
      const enc2: string = await op.aesGcmEncrypt(key, dec1);
      const actResult: string = await op.aesGcmDecrypt(key, enc2);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(dec1), String('round state 19'));
      expect(dec1).assertEqual('round state 19');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult), String('round state 19'));
      expect(actResult).assertEqual('round state 19');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(enc1 === enc2), String(true));
      expect(enc1 === enc2).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0019 end');
    });

    /**
     * @tc.name   testAesState0020
     * @tc.number SUB_CryptoFramework_AESSTATE_01_0020
     * @tc.desc   two-round state sequence variant 20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesState0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0020 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc1: string = await op.aesGcmEncrypt(key, 'round state 20');
      const dec1: string = await op.aesGcmDecrypt(key, enc1);
      const enc2: string = await op.aesGcmEncrypt(key, dec1);
      const actResult: string = await op.aesGcmDecrypt(key, enc2);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(dec1), String('round state 20'));
      expect(dec1).assertEqual('round state 20');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult), String('round state 20'));
      expect(actResult).assertEqual('round state 20');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(enc1 === enc2), String(true));
      expect(enc1 === enc2).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0020 end');
    });

    /**
     * @tc.name   testAesState0021
     * @tc.number SUB_CryptoFramework_AESSTATE_01_0021
     * @tc.desc   two-round state sequence variant 21
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesState0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0021 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc1: string = await op.aesGcmEncrypt(key, 'A');
      const dec1: string = await op.aesGcmDecrypt(key, enc1);
      const enc2: string = await op.aesGcmEncrypt(key, dec1);
      const actResult: string = await op.aesGcmDecrypt(key, enc2);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(dec1), String('A'));
      expect(dec1).assertEqual('A');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult), String('A'));
      expect(actResult).assertEqual('A');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(enc1 === enc2), String(true));
      expect(enc1 === enc2).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0021 end');
    });

    /**
     * @tc.name   testAesState0022
     * @tc.number SUB_CryptoFramework_AESSTATE_01_0022
     * @tc.desc   two-round state sequence variant 22
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesState0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0022 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc1: string = await op.aesGcmEncrypt(key, 'ab');
      const dec1: string = await op.aesGcmDecrypt(key, enc1);
      const enc2: string = await op.aesGcmEncrypt(key, dec1);
      const actResult: string = await op.aesGcmDecrypt(key, enc2);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(dec1), String('ab'));
      expect(dec1).assertEqual('ab');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult), String('ab'));
      expect(actResult).assertEqual('ab');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(enc1 === enc2), String(true));
      expect(enc1 === enc2).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0022 end');
    });

    /**
     * @tc.name   testAesState0023
     * @tc.number SUB_CryptoFramework_AESSTATE_01_0023
     * @tc.desc   two-round state sequence variant 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesState0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0023 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc1: string = await op.aesGcmEncrypt(key, 'abc');
      const dec1: string = await op.aesGcmDecrypt(key, enc1);
      const enc2: string = await op.aesGcmEncrypt(key, dec1);
      const actResult: string = await op.aesGcmDecrypt(key, enc2);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(dec1), String('abc'));
      expect(dec1).assertEqual('abc');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult), String('abc'));
      expect(actResult).assertEqual('abc');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(enc1 === enc2), String(true));
      expect(enc1 === enc2).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0023 end');
    });

    /**
     * @tc.name   testAesState0024
     * @tc.number SUB_CryptoFramework_AESSTATE_01_0024
     * @tc.desc   two-round state sequence variant 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesState0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0024 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc1: string = await op.aesGcmEncrypt(key, 'state-full');
      const dec1: string = await op.aesGcmDecrypt(key, enc1);
      const enc2: string = await op.aesGcmEncrypt(key, dec1);
      const actResult: string = await op.aesGcmDecrypt(key, enc2);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(dec1), String('state-full'));
      expect(dec1).assertEqual('state-full');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult), String('state-full'));
      expect(actResult).assertEqual('state-full');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(enc1 === enc2), String(true));
      expect(enc1 === enc2).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0024 end');
    });

    /**
     * @tc.name   testAesState0025
     * @tc.number SUB_CryptoFramework_AESSTATE_01_0025
     * @tc.desc   two-round state sequence variant 25
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesState0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0025 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc1: string = await op.aesGcmEncrypt(key, 'state-less');
      const dec1: string = await op.aesGcmDecrypt(key, enc1);
      const enc2: string = await op.aesGcmEncrypt(key, dec1);
      const actResult: string = await op.aesGcmDecrypt(key, enc2);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(dec1), String('state-less'));
      expect(dec1).assertEqual('state-less');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult), String('state-less'));
      expect(actResult).assertEqual('state-less');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(enc1 === enc2), String(true));
      expect(enc1 === enc2).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0025 end');
    });

    /**
     * @tc.name   testAesState0026
     * @tc.number SUB_CryptoFramework_AESSTATE_01_0026
     * @tc.desc   two-round state sequence variant 26
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesState0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0026 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc1: string = await op.aesGcmEncrypt(key, 'sequential');
      const dec1: string = await op.aesGcmDecrypt(key, enc1);
      const enc2: string = await op.aesGcmEncrypt(key, dec1);
      const actResult: string = await op.aesGcmDecrypt(key, enc2);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(dec1), String('sequential'));
      expect(dec1).assertEqual('sequential');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult), String('sequential'));
      expect(actResult).assertEqual('sequential');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(enc1 === enc2), String(true));
      expect(enc1 === enc2).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0026 end');
    });

    /**
     * @tc.name   testAesState0027
     * @tc.number SUB_CryptoFramework_AESSTATE_01_0027
     * @tc.desc   two-round state sequence variant 27
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesState0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0027 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc1: string = await op.aesGcmEncrypt(key, 'pipeline');
      const dec1: string = await op.aesGcmDecrypt(key, enc1);
      const enc2: string = await op.aesGcmEncrypt(key, dec1);
      const actResult: string = await op.aesGcmDecrypt(key, enc2);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(dec1), String('pipeline'));
      expect(dec1).assertEqual('pipeline');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult), String('pipeline'));
      expect(actResult).assertEqual('pipeline');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(enc1 === enc2), String(true));
      expect(enc1 === enc2).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0027 end');
    });

    /**
     * @tc.name   testAesState0028
     * @tc.number SUB_CryptoFramework_AESSTATE_01_0028
     * @tc.desc   two-round state sequence variant 28
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesState0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0028 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc1: string = await op.aesGcmEncrypt(key, 'chained text');
      const dec1: string = await op.aesGcmDecrypt(key, enc1);
      const enc2: string = await op.aesGcmEncrypt(key, dec1);
      const actResult: string = await op.aesGcmDecrypt(key, enc2);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(dec1), String('chained text'));
      expect(dec1).assertEqual('chained text');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult), String('chained text'));
      expect(actResult).assertEqual('chained text');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(enc1 === enc2), String(true));
      expect(enc1 === enc2).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0028 end');
    });

    /**
     * @tc.name   testAesState0029
     * @tc.number SUB_CryptoFramework_AESSTATE_01_0029
     * @tc.desc   two-round state sequence variant 29
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesState0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0029 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc1: string = await op.aesGcmEncrypt(key, 'two rounds');
      const dec1: string = await op.aesGcmDecrypt(key, enc1);
      const enc2: string = await op.aesGcmEncrypt(key, dec1);
      const actResult: string = await op.aesGcmDecrypt(key, enc2);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(dec1), String('two rounds'));
      expect(dec1).assertEqual('two rounds');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult), String('two rounds'));
      expect(actResult).assertEqual('two rounds');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(enc1 === enc2), String(true));
      expect(enc1 === enc2).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0029 end');
    });

    /**
     * @tc.name   testAesState0030
     * @tc.number SUB_CryptoFramework_AESSTATE_01_0030
     * @tc.desc   two-round state sequence variant 30
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesState0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0030 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc1: string = await op.aesGcmEncrypt(key, 'double pass');
      const dec1: string = await op.aesGcmDecrypt(key, enc1);
      const enc2: string = await op.aesGcmEncrypt(key, dec1);
      const actResult: string = await op.aesGcmDecrypt(key, enc2);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(dec1), String('double pass'));
      expect(dec1).assertEqual('double pass');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult), String('double pass'));
      expect(actResult).assertEqual('double pass');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(enc1 === enc2), String(true));
      expect(enc1 === enc2).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0030 end');
    });

    /**
     * @tc.name   testAesState0031
     * @tc.number SUB_CryptoFramework_AESSTATE_01_0031
     * @tc.desc   two-round state sequence variant 31
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesState0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0031 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc1: string = await op.aesGcmEncrypt(key, '123456789');
      const dec1: string = await op.aesGcmDecrypt(key, enc1);
      const enc2: string = await op.aesGcmEncrypt(key, dec1);
      const actResult: string = await op.aesGcmDecrypt(key, enc2);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(dec1), String('123456789'));
      expect(dec1).assertEqual('123456789');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult), String('123456789'));
      expect(actResult).assertEqual('123456789');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(enc1 === enc2), String(true));
      expect(enc1 === enc2).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0031 end');
    });

    /**
     * @tc.name   testAesState0032
     * @tc.number SUB_CryptoFramework_AESSTATE_01_0032
     * @tc.desc   two-round state sequence variant 32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesState0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0032 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc1: string = await op.aesGcmEncrypt(key, '!@#$%^&*');
      const dec1: string = await op.aesGcmDecrypt(key, enc1);
      const enc2: string = await op.aesGcmEncrypt(key, dec1);
      const actResult: string = await op.aesGcmDecrypt(key, enc2);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(dec1), String('!@#$%^&*'));
      expect(dec1).assertEqual('!@#$%^&*');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult), String('!@#$%^&*'));
      expect(actResult).assertEqual('!@#$%^&*');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(enc1 === enc2), String(true));
      expect(enc1 === enc2).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0032 end');
    });

    /**
     * @tc.name   testAesState0033
     * @tc.number SUB_CryptoFramework_AESSTATE_01_0033
     * @tc.desc   two-round state sequence variant 33
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesState0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0033 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc1: string = await op.aesGcmEncrypt(key, '{"round":1,"state":"ok"}');
      const dec1: string = await op.aesGcmDecrypt(key, enc1);
      const enc2: string = await op.aesGcmEncrypt(key, dec1);
      const actResult: string = await op.aesGcmDecrypt(key, enc2);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(dec1), String('{"round":1,"state":"ok"}'));
      expect(dec1).assertEqual('{"round":1,"state":"ok"}');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult), String('{"round":1,"state":"ok"}'));
      expect(actResult).assertEqual('{"round":1,"state":"ok"}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(enc1 === enc2), String(true));
      expect(enc1 === enc2).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0033 end');
    });

    /**
     * @tc.name   testAesState0034
     * @tc.number SUB_CryptoFramework_AESSTATE_01_0034
     * @tc.desc   two-round state sequence variant 34
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesState0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0034 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc1: string = await op.aesGcmEncrypt(key, 'aébèc');
      const dec1: string = await op.aesGcmDecrypt(key, enc1);
      const enc2: string = await op.aesGcmEncrypt(key, dec1);
      const actResult: string = await op.aesGcmDecrypt(key, enc2);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(dec1), String('aébèc'));
      expect(dec1).assertEqual('aébèc');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult), String('aébèc'));
      expect(actResult).assertEqual('aébèc');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(enc1 === enc2), String(true));
      expect(enc1 === enc2).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0034 end');
    });

    /**
     * @tc.name   testAesState0035
     * @tc.number SUB_CryptoFramework_AESSTATE_01_0035
     * @tc.desc   two-round state sequence variant 35
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesState0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0035 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc1: string = await op.aesGcmEncrypt(key, 'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
        'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
      const dec1: string = await op.aesGcmDecrypt(key, enc1);
      const enc2: string = await op.aesGcmEncrypt(key, dec1);
      const actResult: string = await op.aesGcmDecrypt(key, enc2);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(dec1), String('rrrrrrrrrrrrrrrrrrrrrrrrr' +
          'rrrrrrrrrrrrrrrrrrrrrrrrr' +
          'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr'));
      expect(dec1).assertEqual('rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
        'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult), String('rrrrrrrrrrrrrrrrrrrrrrrrr' +
          'rrrrrrrrrrrrrrrrrrrrrrrrr' +
          'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr'));
      expect(actResult).assertEqual('rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
        'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(enc1 === enc2), String(true));
      expect(enc1 === enc2).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0035 end');
    });

    /**
     * @tc.name   testAesState0036
     * @tc.number SUB_CryptoFramework_AESSTATE_01_0036
     * @tc.desc   two-round state sequence variant 36
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesState0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0036 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc1: string =
        await op.aesGcmEncrypt(key, 'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
          'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
          'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
            'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
        'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
          'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
          'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
            'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
        'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
          'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
          'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
            'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
          'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
            'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
            'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
              'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
      const dec1: string = await op.aesGcmDecrypt(key, enc1);
      const enc2: string = await op.aesGcmEncrypt(key, dec1);
      const actResult: string = await op.aesGcmDecrypt(key, enc2);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(dec1), String('rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
          'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
          'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
          'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
            'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
          'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
            'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
            'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
              'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
          'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
            'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
            'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
              'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
            'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
              'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
              'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
                'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr'));
      expect(dec1).assertEqual('rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
        'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
        'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
          'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
        'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
          'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
          'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
            'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
        'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
          'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
          'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
            'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
          'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
            'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
            'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
              'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult), String('rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
          'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
          'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
          'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
            'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
          'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
            'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
            'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
              'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
          'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
            'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
            'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
              'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
            'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
              'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
              'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
                'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr'));
      expect(actResult).assertEqual('rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
        'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
        'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
          'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
        'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
          'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
          'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
            'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
        'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
          'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
          'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
            'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
          'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
            'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
            'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' +
              'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(enc1 === enc2), String(true));
      expect(enc1 === enc2).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0036 end');
    });

    /**
     * @tc.name   testAesState0037
     * @tc.number SUB_CryptoFramework_AESSTATE_01_0037
     * @tc.desc   two-round state sequence variant 37
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesState0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0037 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc1: string = await op.aesGcmEncrypt(key, 'alpha-beta-gamma');
      const dec1: string = await op.aesGcmDecrypt(key, enc1);
      const enc2: string = await op.aesGcmEncrypt(key, dec1);
      const actResult: string = await op.aesGcmDecrypt(key, enc2);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(dec1), String('alpha-beta-gamma'));
      expect(dec1).assertEqual('alpha-beta-gamma');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult), String('alpha-beta-gamma'));
      expect(actResult).assertEqual('alpha-beta-gamma');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(enc1 === enc2), String(true));
      expect(enc1 === enc2).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0037 end');
    });

    /**
     * @tc.name   testAesState0038
     * @tc.number SUB_CryptoFramework_AESSTATE_01_0038
     * @tc.desc   two-round state sequence variant 38
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesState0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0038 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc1: string = await op.aesGcmEncrypt(key, 'cipher state chain');
      const dec1: string = await op.aesGcmDecrypt(key, enc1);
      const enc2: string = await op.aesGcmEncrypt(key, dec1);
      const actResult: string = await op.aesGcmDecrypt(key, enc2);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(dec1), String('cipher state chain'));
      expect(dec1).assertEqual('cipher state chain');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult), String('cipher state chain'));
      expect(actResult).assertEqual('cipher state chain');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(enc1 === enc2), String(true));
      expect(enc1 === enc2).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0038 end');
    });

    /**
     * @tc.name   testAesState0039
     * @tc.number SUB_CryptoFramework_AESSTATE_01_0039
     * @tc.desc   two-round state sequence variant 39
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesState0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0039 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc1: string = await op.aesGcmEncrypt(key, 'enc then enc again');
      const dec1: string = await op.aesGcmDecrypt(key, enc1);
      const enc2: string = await op.aesGcmEncrypt(key, dec1);
      const actResult: string = await op.aesGcmDecrypt(key, enc2);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(dec1), String('enc then enc again'));
      expect(dec1).assertEqual('enc then enc again');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult), String('enc then enc again'));
      expect(actResult).assertEqual('enc then enc again');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(enc1 === enc2), String(true));
      expect(enc1 === enc2).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0039 end');
    });

    /**
     * @tc.name   testAesState0040
     * @tc.number SUB_CryptoFramework_AESSTATE_01_0040
     * @tc.desc   two-round state sequence variant 40
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesState0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0040 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc1: string = await op.aesGcmEncrypt(key, 'final state probe');
      const dec1: string = await op.aesGcmDecrypt(key, enc1);
      const enc2: string = await op.aesGcmEncrypt(key, dec1);
      const actResult: string = await op.aesGcmDecrypt(key, enc2);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(dec1), String('final state probe'));
      expect(dec1).assertEqual('final state probe');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(actResult), String('final state probe'));
      expect(actResult).assertEqual('final state probe');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(enc1 === enc2), String(true));
      expect(enc1 === enc2).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0040 end');
    });

    /**
     * @tc.name   testAesState0041
     * @tc.number SUB_CryptoFramework_AESSTATE_01_0041
     * @tc.desc   空串加密返回 null；非空明文两轮密文确定性相同（下界边界）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesState0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0041 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const enc1: string = await op.aesGcmEncrypt(key, '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(enc1 === null));
      expect(enc1 === null).assertTrue();
      const enc2: string = await op.aesGcmEncrypt(key, 'probe');
      const enc3: string = await op.aesGcmEncrypt(key, 'probe');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(enc2 === enc3));
      expect(enc2 === enc3).assertTrue();
      const dec2: string = await op.aesGcmDecrypt(key, enc2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', dec2, 'probe');
      expect(dec2).assertEqual('probe');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesState0041 end');
    });

  });
}
