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

export default function aesChrTest() {
  describe('AesChr', () => {

    /**
     * @tc.name   testAesChr0001
     * @tc.number SUB_CryptoFramework_AESCHR_01_0001
     * @tc.desc   wrong-length key variant 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChr0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0001 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodKey: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodKey === null));
      expect(goodKey === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodKey));
      expect(actResult === goodKey).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0001 end');
    });

    /**
     * @tc.name   testAesChr0002
     * @tc.number SUB_CryptoFramework_AESCHR_01_0002
     * @tc.desc   wrong-length key variant 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChr0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0002 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodKey: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodKey === null));
      expect(goodKey === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodKey));
      expect(actResult === goodKey).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0002 end');
    });

    /**
     * @tc.name   testAesChr0003
     * @tc.number SUB_CryptoFramework_AESCHR_01_0003
     * @tc.desc   wrong-length key variant 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChr0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0003 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodKey: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodKey === null));
      expect(goodKey === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodKey));
      expect(actResult === goodKey).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0003 end');
    });

    /**
     * @tc.name   testAesChr0004
     * @tc.number SUB_CryptoFramework_AESCHR_01_0004
     * @tc.desc   wrong-length key variant 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChr0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0004 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodKey: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodKey === null));
      expect(goodKey === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodKey));
      expect(actResult === goodKey).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0004 end');
    });

    /**
     * @tc.name   testAesChr0005
     * @tc.number SUB_CryptoFramework_AESCHR_01_0005
     * @tc.desc   wrong-length key variant 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChr0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0005 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodKey: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodKey === null));
      expect(goodKey === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodKey));
      expect(actResult === goodKey).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0005 end');
    });

    /**
     * @tc.name   testAesChr0006
     * @tc.number SUB_CryptoFramework_AESCHR_01_0006
     * @tc.desc   wrong-length key variant 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChr0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0006 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodKey: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('aaaaaaaaaaaaaaaa');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodKey === null));
      expect(goodKey === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodKey));
      expect(actResult === goodKey).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0006 end');
    });

    /**
     * @tc.name   testAesChr0007
     * @tc.number SUB_CryptoFramework_AESCHR_01_0007
     * @tc.desc   wrong-length key variant 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChr0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0007 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodKey: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const actResult: cryptoFramework.SymKey =
        await op.convertAesKey('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodKey === null));
      expect(goodKey === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodKey));
      expect(actResult === goodKey).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0007 end');
    });

    /**
     * @tc.name   testAesChr0008
     * @tc.number SUB_CryptoFramework_AESCHR_01_0008
     * @tc.desc   wrong-length key variant 8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChr0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0008 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodKey: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodKey === null));
      expect(goodKey === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodKey));
      expect(actResult === goodKey).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0008 end');
    });

    /**
     * @tc.name   testAesChr0009
     * @tc.number SUB_CryptoFramework_AESCHR_01_0009
     * @tc.desc   wrong-length key variant 9
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChr0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0009 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodKey: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const actResult: cryptoFramework.SymKey =
        await op.convertAesKey('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodKey === null));
      expect(goodKey === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodKey));
      expect(actResult === goodKey).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0009 end');
    });

    /**
     * @tc.name   testAesChr0010
     * @tc.number SUB_CryptoFramework_AESCHR_01_0010
     * @tc.desc   wrong-length key variant 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChr0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0010 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodKey: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('a');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodKey === null));
      expect(goodKey === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodKey));
      expect(actResult === goodKey).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0010 end');
    });

    /**
     * @tc.name   testAesChr0011
     * @tc.number SUB_CryptoFramework_AESCHR_01_0011
     * @tc.desc   wrong-length key variant 11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChr0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0011 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodKey: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('bb');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodKey === null));
      expect(goodKey === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodKey));
      expect(actResult === goodKey).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0011 end');
    });

    /**
     * @tc.name   testAesChr0012
     * @tc.number SUB_CryptoFramework_AESCHR_01_0012
     * @tc.desc   wrong-length key variant 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChr0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0012 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodKey: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('aaa');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodKey === null));
      expect(goodKey === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodKey));
      expect(actResult === goodKey).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0012 end');
    });

    /**
     * @tc.name   testAesChr0013
     * @tc.number SUB_CryptoFramework_AESCHR_01_0013
     * @tc.desc   wrong-length key variant 13
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChr0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0013 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodKey: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz' +
        'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodKey === null));
      expect(goodKey === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodKey));
      expect(actResult === goodKey).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0013 end');
    });

    /**
     * @tc.name   testAesChr0014
     * @tc.number SUB_CryptoFramework_AESCHR_01_0014
     * @tc.desc   wrong-length key variant 14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChr0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0014 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodKey: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('gggggggggggggggggggggggggggggggg' +
        'ggggggggggggggggggggggggggggggggg');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodKey === null));
      expect(goodKey === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodKey));
      expect(actResult === goodKey).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0014 end');
    });

    /**
     * @tc.name   testAesChr0015
     * @tc.number SUB_CryptoFramework_AESCHR_01_0015
     * @tc.desc   wrong-length key variant 15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChr0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0015 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodKey: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('abababababababababababababababa' +
        'bababababababababababababababab');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodKey === null));
      expect(goodKey === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodKey));
      expect(actResult === goodKey).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0015 end');
    });

    /**
     * @tc.name   testAesChr0016
     * @tc.number SUB_CryptoFramework_AESCHR_01_0016
     * @tc.desc   wrong-length key variant 16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChr0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0016 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodKey: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ababababababababababababababababa' +
        'babababababababababababababababab');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodKey === null));
      expect(goodKey === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodKey));
      expect(actResult === goodKey).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0016 end');
    });

    /**
     * @tc.name   testAesChr0017
     * @tc.number SUB_CryptoFramework_AESCHR_01_0017
     * @tc.desc   wrong-length key variant 17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChr0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0017 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodKey: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('ffffffffffffffffffffffffffffffff');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodKey === null));
      expect(goodKey === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodKey));
      expect(actResult === goodKey).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0017 end');
    });

    /**
     * @tc.name   testAesChr0018
     * @tc.number SUB_CryptoFramework_AESCHR_01_0018
     * @tc.desc   wrong-length key variant 18
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChr0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0018 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodKey: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const actResult: cryptoFramework.SymKey =
        await op.convertAesKey('000000000000000000000000000000000000000000000000' +
        '000000000000000000000000000000000000000000000000');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodKey === null));
      expect(goodKey === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodKey));
      expect(actResult === goodKey).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0018 end');
    });

    /**
     * @tc.name   testAesChr0019
     * @tc.number SUB_CryptoFramework_AESCHR_01_0019
     * @tc.desc   wrong-length key variant 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChr0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0019 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodKey: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const actResult: cryptoFramework.SymKey = await op.convertAesKey(' aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodKey === null));
      expect(goodKey === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodKey));
      expect(actResult === goodKey).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0019 end');
    });

    /**
     * @tc.name   testAesChr0020
     * @tc.number SUB_CryptoFramework_AESCHR_01_0020
     * @tc.desc   wrong-length key variant 20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChr0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0020 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodKey: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('-aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodKey === null));
      expect(goodKey === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodKey));
      expect(actResult === goodKey).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0020 end');
    });

    /**
     * @tc.name   testAesChr0021
     * @tc.number SUB_CryptoFramework_AESCHR_01_0021
     * @tc.desc   wrong-length key variant 21
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChr0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0021 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodKey: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('0xaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodKey === null));
      expect(goodKey === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodKey));
      expect(actResult === goodKey).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0021 end');
    });

    /**
     * @tc.name   testAesChr0022
     * @tc.number SUB_CryptoFramework_AESCHR_01_0022
     * @tc.desc   wrong-length key variant 22
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChr0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0022 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodKey: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaz' +
        'zaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodKey === null));
      expect(goodKey === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodKey));
      expect(actResult === goodKey).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0022 end');
    });

    /**
     * @tc.name   testAesChr0023
     * @tc.number SUB_CryptoFramework_AESCHR_01_0023
     * @tc.desc   wrong-length key variant 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChr0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0023 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodKey: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA' +
        'BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodKey === null));
      expect(goodKey === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodKey));
      expect(actResult === goodKey).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0023 end');
    });

    /**
     * @tc.name   testAesChr0024
     * @tc.number SUB_CryptoFramework_AESCHR_01_0024
     * @tc.desc   wrong-length key variant 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChr0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0024 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodKey: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee' +
        'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodKey === null));
      expect(goodKey === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodKey));
      expect(actResult === goodKey).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0024 end');
    });

    /**
     * @tc.name   testAesChr0025
     * @tc.number SUB_CryptoFramework_AESCHR_01_0025
     * @tc.desc   wrong-length key variant 25
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChr0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0025 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodKey: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        'aaaaaaaa-aaaaaaaaaaaaaaaaaaaaaaaa');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodKey === null));
      expect(goodKey === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodKey));
      expect(actResult === goodKey).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0025 end');
    });

    /**
     * @tc.name   testAesChr0026
     * @tc.number SUB_CryptoFramework_AESCHR_01_0026
     * @tc.desc   wrong-length key variant 26
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChr0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0026 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodKey: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq' +
        'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodKey === null));
      expect(goodKey === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodKey));
      expect(actResult === goodKey).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0026 end');
    });

    /**
     * @tc.name   testAesChr0027
     * @tc.number SUB_CryptoFramework_AESCHR_01_0027
     * @tc.desc   wrong-length key variant 27
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChr0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0027 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodKey: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaé' +
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodKey === null));
      expect(goodKey === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodKey));
      expect(actResult === goodKey).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0027 end');
    });

    /**
     * @tc.name   testAesChr0028
     * @tc.number SUB_CryptoFramework_AESCHR_01_0028
     * @tc.desc   wrong-length key variant 28
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChr0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0028 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodKey: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
        '中aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodKey === null));
      expect(goodKey === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodKey));
      expect(actResult === goodKey).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0028 end');
    });

    /**
     * @tc.name   testAesChr0029
     * @tc.number SUB_CryptoFramework_AESCHR_01_0029
     * @tc.desc   wrong-length key variant 29
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChr0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0029 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodKey: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const actResult: cryptoFramework.SymKey = await op.convertAesKey('99999999999999999999999999999999' +
        '99999999999999999999999999999999x');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodKey === null));
      expect(goodKey === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodKey));
      expect(actResult === goodKey).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0029 end');
    });

    /**
     * @tc.name   testAesChr0030
     * @tc.number SUB_CryptoFramework_AESCHR_01_0030
     * @tc.desc   wrong-length key variant 30
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChr0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0030 begin');
      const op: CryptoOperation = new CryptoOperation();
      const goodKey: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const actResult: cryptoFramework.SymKey = await op.convertAesKey(':::::::::::::::::::::::::::::::' +
        ':::::::::::::::::::::::::::::::');
      const result: cryptoFramework.SymKey = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(goodKey === null));
      expect(goodKey === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === goodKey));
      expect(actResult === goodKey).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0030 end');
    });

    /**
     * @tc.name   testAesChr0031
     * @tc.number SUB_CryptoFramework_AESCHR_01_0031
     * @tc.desc   96-hex（48 字节）长度错位返回 null，且重复调用结果稳定（边界-非法对照）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChr0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0031 begin');
      const op: CryptoOperation = new CryptoOperation();
      let longHex: string = '';
      for (let i = 0; i < 96; i++) {
        longHex += 'a';
      }
      const goodKey: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const badKey: cryptoFramework.SymKey = await op.convertAesKey(longHex);
      const badAgain: cryptoFramework.SymKey = await op.convertAesKey(longHex);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(badKey === null), 'true');
      expect(badKey === null).assertTrue();
      expect(badAgain === null).assertTrue();
      expect(goodKey === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChr0031 end');
    });

  });
}
