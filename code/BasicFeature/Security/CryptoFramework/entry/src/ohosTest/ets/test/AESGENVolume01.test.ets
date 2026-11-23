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

export default function aesGenTest() {
  describe('AesGen', () => {

    /**
     * @tc.name   testAesGen0001
     * @tc.number SUB_CryptoFramework_AESGEN_01_0001
     * @tc.desc   generateAesKey run 1 yields a 64-char lowercase hex string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGen0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGen0001 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: string = await op.generateAesKey();
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult.length), String(64));
      expect(actResult.length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(allHex(actResult)));
      expect(allHex(actResult)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGen0001 end');
    });

    /**
     * @tc.name   testAesGen0002
     * @tc.number SUB_CryptoFramework_AESGEN_01_0002
     * @tc.desc   generateAesKey run 2 yields a 64-char lowercase hex string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGen0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGen0002 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: string = await op.generateAesKey();
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult.length), String(64));
      expect(actResult.length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(allHex(actResult)));
      expect(allHex(actResult)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGen0002 end');
    });

    /**
     * @tc.name   testAesGen0003
     * @tc.number SUB_CryptoFramework_AESGEN_01_0003
     * @tc.desc   generateAesKey run 3 yields a 64-char lowercase hex string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGen0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGen0003 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: string = await op.generateAesKey();
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult.length), String(64));
      expect(actResult.length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(allHex(actResult)));
      expect(allHex(actResult)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGen0003 end');
    });

    /**
     * @tc.name   testAesGen0004
     * @tc.number SUB_CryptoFramework_AESGEN_01_0004
     * @tc.desc   generateAesKey run 4 yields a 64-char lowercase hex string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGen0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGen0004 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: string = await op.generateAesKey();
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult.length), String(64));
      expect(actResult.length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(allHex(actResult)));
      expect(allHex(actResult)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGen0004 end');
    });

    /**
     * @tc.name   testAesGen0005
     * @tc.number SUB_CryptoFramework_AESGEN_01_0005
     * @tc.desc   generateAesKey run 5 yields a 64-char lowercase hex string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGen0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGen0005 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: string = await op.generateAesKey();
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult.length), String(64));
      expect(actResult.length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(allHex(actResult)));
      expect(allHex(actResult)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGen0005 end');
    });

    /**
     * @tc.name   testAesGen0006
     * @tc.number SUB_CryptoFramework_AESGEN_01_0006
     * @tc.desc   generateAesKey run 6 yields a 64-char lowercase hex string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGen0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGen0006 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: string = await op.generateAesKey();
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult.length), String(64));
      expect(actResult.length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(allHex(actResult)));
      expect(allHex(actResult)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGen0006 end');
    });

    /**
     * @tc.name   testAesGen0007
     * @tc.number SUB_CryptoFramework_AESGEN_01_0007
     * @tc.desc   generateAesKey run 7 yields a 64-char lowercase hex string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGen0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGen0007 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: string = await op.generateAesKey();
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult.length), String(64));
      expect(actResult.length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(allHex(actResult)));
      expect(allHex(actResult)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGen0007 end');
    });

    /**
     * @tc.name   testAesGen0008
     * @tc.number SUB_CryptoFramework_AESGEN_01_0008
     * @tc.desc   generateAesKey run 8 yields a 64-char lowercase hex string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGen0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGen0008 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: string = await op.generateAesKey();
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult.length), String(64));
      expect(actResult.length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(allHex(actResult)));
      expect(allHex(actResult)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGen0008 end');
    });

    /**
     * @tc.name   testAesGen0009
     * @tc.number SUB_CryptoFramework_AESGEN_01_0009
     * @tc.desc   generateAesKey run 9 yields a 64-char lowercase hex string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGen0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGen0009 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: string = await op.generateAesKey();
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult.length), String(64));
      expect(actResult.length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(allHex(actResult)));
      expect(allHex(actResult)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGen0009 end');
    });

    /**
     * @tc.name   testAesGen0010
     * @tc.number SUB_CryptoFramework_AESGEN_01_0010
     * @tc.desc   generateAesKey run 10 yields a 64-char lowercase hex string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGen0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGen0010 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: string = await op.generateAesKey();
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult.length), String(64));
      expect(actResult.length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(allHex(actResult)));
      expect(allHex(actResult)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGen0010 end');
    });

    /**
     * @tc.name   testAesGen0011
     * @tc.number SUB_CryptoFramework_AESGEN_01_0011
     * @tc.desc   generateAesKey run 11 yields a 64-char lowercase hex string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGen0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGen0011 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: string = await op.generateAesKey();
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult.length), String(64));
      expect(actResult.length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(allHex(actResult)));
      expect(allHex(actResult)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGen0011 end');
    });

    /**
     * @tc.name   testAesGen0012
     * @tc.number SUB_CryptoFramework_AESGEN_01_0012
     * @tc.desc   generateAesKey run 12 yields a 64-char lowercase hex string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGen0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGen0012 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: string = await op.generateAesKey();
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult.length), String(64));
      expect(actResult.length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(allHex(actResult)));
      expect(allHex(actResult)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGen0012 end');
    });

    /**
     * @tc.name   testAesGen0013
     * @tc.number SUB_CryptoFramework_AESGEN_01_0013
     * @tc.desc   generateAesKey run 13 yields a 64-char lowercase hex string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGen0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGen0013 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: string = await op.generateAesKey();
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult.length), String(64));
      expect(actResult.length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(allHex(actResult)));
      expect(allHex(actResult)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGen0013 end');
    });

    /**
     * @tc.name   testAesGen0014
     * @tc.number SUB_CryptoFramework_AESGEN_01_0014
     * @tc.desc   generateAesKey run 14 yields a 64-char lowercase hex string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGen0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGen0014 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: string = await op.generateAesKey();
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult.length), String(64));
      expect(actResult.length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(allHex(actResult)));
      expect(allHex(actResult)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGen0014 end');
    });

    /**
     * @tc.name   testAesGen0015
     * @tc.number SUB_CryptoFramework_AESGEN_01_0015
     * @tc.desc   generateAesKey run 15 yields a 64-char lowercase hex string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGen0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGen0015 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: string = await op.generateAesKey();
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult.length), String(64));
      expect(actResult.length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(allHex(actResult)));
      expect(allHex(actResult)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGen0015 end');
    });

    /**
     * @tc.name   testAesGen0016
     * @tc.number SUB_CryptoFramework_AESGEN_01_0016
     * @tc.desc   generateAesKey run 16 yields a 64-char lowercase hex string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGen0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGen0016 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: string = await op.generateAesKey();
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult.length), String(64));
      expect(actResult.length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(allHex(actResult)));
      expect(allHex(actResult)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGen0016 end');
    });

    /**
     * @tc.name   testAesGen0017
     * @tc.number SUB_CryptoFramework_AESGEN_01_0017
     * @tc.desc   generateAesKey run 17 yields a 64-char lowercase hex string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGen0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGen0017 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: string = await op.generateAesKey();
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult.length), String(64));
      expect(actResult.length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(allHex(actResult)));
      expect(allHex(actResult)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGen0017 end');
    });

    /**
     * @tc.name   testAesGen0018
     * @tc.number SUB_CryptoFramework_AESGEN_01_0018
     * @tc.desc   generateAesKey run 18 yields a 64-char lowercase hex string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGen0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGen0018 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: string = await op.generateAesKey();
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult.length), String(64));
      expect(actResult.length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(allHex(actResult)));
      expect(allHex(actResult)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGen0018 end');
    });

    /**
     * @tc.name   testAesGen0019
     * @tc.number SUB_CryptoFramework_AESGEN_01_0019
     * @tc.desc   generateAesKey run 19 yields a 64-char lowercase hex string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGen0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGen0019 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: string = await op.generateAesKey();
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult.length), String(64));
      expect(actResult.length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(allHex(actResult)));
      expect(allHex(actResult)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGen0019 end');
    });

    /**
     * @tc.name   testAesGen0020
     * @tc.number SUB_CryptoFramework_AESGEN_01_0020
     * @tc.desc   twentieth generation still yields a 64-char lowercase hex string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGen0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGen0020 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: string = await op.generateAesKey();
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actResult.length), String(64));
      expect(actResult.length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(allHex(actResult)));
      expect(allHex(actResult)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGen0020 end');
    });

  });
}
