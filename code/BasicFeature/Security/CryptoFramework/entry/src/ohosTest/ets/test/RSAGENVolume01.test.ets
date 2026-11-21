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

export default function rsaGenTest() {
  describe('RsaGen', () => {

    /**
     * @tc.name   testRsaGen0001
     * @tc.number SUB_CryptoFramework_RSAGEN_01_0001
     * @tc.desc   generateRsaKey run 1 yields a parseable key pair json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaGen0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGen0001 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: string = await op.generateRsaKey();
      const kp: cryptoFramework.KeyPair = await op.convertRsaKey(actResult);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parseRsa(actResult).priKey.length > 1000));
      expect(parseRsa(actResult).priKey.length > 1000).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parseRsa(actResult).pubKey.length > 300));
      expect(parseRsa(actResult).pubKey.length > 300).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGen0001 end');
    });

    /**
     * @tc.name   testRsaGen0002
     * @tc.number SUB_CryptoFramework_RSAGEN_01_0002
     * @tc.desc   generateRsaKey run 2 yields a parseable key pair json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaGen0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGen0002 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: string = await op.generateRsaKey();
      const kp: cryptoFramework.KeyPair = await op.convertRsaKey(actResult);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parseRsa(actResult).priKey.length > 1000));
      expect(parseRsa(actResult).priKey.length > 1000).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parseRsa(actResult).pubKey.length > 300));
      expect(parseRsa(actResult).pubKey.length > 300).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGen0002 end');
    });

    /**
     * @tc.name   testRsaGen0003
     * @tc.number SUB_CryptoFramework_RSAGEN_01_0003
     * @tc.desc   generateRsaKey run 3 yields a parseable key pair json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaGen0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGen0003 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: string = await op.generateRsaKey();
      const kp: cryptoFramework.KeyPair = await op.convertRsaKey(actResult);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parseRsa(actResult).priKey.length > 1000));
      expect(parseRsa(actResult).priKey.length > 1000).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parseRsa(actResult).pubKey.length > 300));
      expect(parseRsa(actResult).pubKey.length > 300).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGen0003 end');
    });

    /**
     * @tc.name   testRsaGen0004
     * @tc.number SUB_CryptoFramework_RSAGEN_01_0004
     * @tc.desc   generateRsaKey run 4 yields a parseable key pair json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaGen0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGen0004 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: string = await op.generateRsaKey();
      const kp: cryptoFramework.KeyPair = await op.convertRsaKey(actResult);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parseRsa(actResult).priKey.length > 1000));
      expect(parseRsa(actResult).priKey.length > 1000).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parseRsa(actResult).pubKey.length > 300));
      expect(parseRsa(actResult).pubKey.length > 300).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGen0004 end');
    });

    /**
     * @tc.name   testRsaGen0005
     * @tc.number SUB_CryptoFramework_RSAGEN_01_0005
     * @tc.desc   generateRsaKey run 5 yields a parseable key pair json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaGen0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGen0005 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: string = await op.generateRsaKey();
      const kp: cryptoFramework.KeyPair = await op.convertRsaKey(actResult);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parseRsa(actResult).priKey.length > 1000));
      expect(parseRsa(actResult).priKey.length > 1000).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parseRsa(actResult).pubKey.length > 300));
      expect(parseRsa(actResult).pubKey.length > 300).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGen0005 end');
    });

    /**
     * @tc.name   testRsaGen0006
     * @tc.number SUB_CryptoFramework_RSAGEN_01_0006
     * @tc.desc   generateRsaKey run 6 yields a parseable key pair json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaGen0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGen0006 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: string = await op.generateRsaKey();
      const kp: cryptoFramework.KeyPair = await op.convertRsaKey(actResult);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parseRsa(actResult).priKey.length > 1000));
      expect(parseRsa(actResult).priKey.length > 1000).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parseRsa(actResult).pubKey.length > 300));
      expect(parseRsa(actResult).pubKey.length > 300).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGen0006 end');
    });

    /**
     * @tc.name   testRsaGen0007
     * @tc.number SUB_CryptoFramework_RSAGEN_01_0007
     * @tc.desc   generateRsaKey run 7 yields a parseable key pair json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaGen0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGen0007 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: string = await op.generateRsaKey();
      const kp: cryptoFramework.KeyPair = await op.convertRsaKey(actResult);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parseRsa(actResult).priKey.length > 1000));
      expect(parseRsa(actResult).priKey.length > 1000).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parseRsa(actResult).pubKey.length > 300));
      expect(parseRsa(actResult).pubKey.length > 300).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGen0007 end');
    });

    /**
     * @tc.name   testRsaGen0008
     * @tc.number SUB_CryptoFramework_RSAGEN_01_0008
     * @tc.desc   generateRsaKey run 8 yields a parseable key pair json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaGen0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGen0008 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: string = await op.generateRsaKey();
      const kp: cryptoFramework.KeyPair = await op.convertRsaKey(actResult);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parseRsa(actResult).priKey.length > 1000));
      expect(parseRsa(actResult).priKey.length > 1000).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parseRsa(actResult).pubKey.length > 300));
      expect(parseRsa(actResult).pubKey.length > 300).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGen0008 end');
    });

    /**
     * @tc.name   testRsaGen0009
     * @tc.number SUB_CryptoFramework_RSAGEN_01_0009
     * @tc.desc   generateRsaKey run 9 yields a parseable key pair json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaGen0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGen0009 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: string = await op.generateRsaKey();
      const kp: cryptoFramework.KeyPair = await op.convertRsaKey(actResult);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parseRsa(actResult).priKey.length > 1000));
      expect(parseRsa(actResult).priKey.length > 1000).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parseRsa(actResult).pubKey.length > 300));
      expect(parseRsa(actResult).pubKey.length > 300).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGen0009 end');
    });

    /**
     * @tc.name   testRsaGen0010
     * @tc.number SUB_CryptoFramework_RSAGEN_01_0010
     * @tc.desc   generateRsaKey run 10 yields a parseable key pair json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaGen0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGen0010 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: string = await op.generateRsaKey();
      const kp: cryptoFramework.KeyPair = await op.convertRsaKey(actResult);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parseRsa(actResult).priKey.length > 1000));
      expect(parseRsa(actResult).priKey.length > 1000).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parseRsa(actResult).pubKey.length > 300));
      expect(parseRsa(actResult).pubKey.length > 300).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGen0010 end');
    });

    /**
     * @tc.name   testRsaGen0011
     * @tc.number SUB_CryptoFramework_RSAGEN_01_0011
     * @tc.desc   generateRsaKey run 11 yields a parseable key pair json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaGen0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGen0011 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: string = await op.generateRsaKey();
      const kp: cryptoFramework.KeyPair = await op.convertRsaKey(actResult);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parseRsa(actResult).priKey.length > 1000));
      expect(parseRsa(actResult).priKey.length > 1000).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parseRsa(actResult).pubKey.length > 300));
      expect(parseRsa(actResult).pubKey.length > 300).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGen0011 end');
    });

    /**
     * @tc.name   testRsaGen0012
     * @tc.number SUB_CryptoFramework_RSAGEN_01_0012
     * @tc.desc   generateRsaKey run 12 yields a parseable key pair json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaGen0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGen0012 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: string = await op.generateRsaKey();
      const kp: cryptoFramework.KeyPair = await op.convertRsaKey(actResult);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parseRsa(actResult).priKey.length > 1000));
      expect(parseRsa(actResult).priKey.length > 1000).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parseRsa(actResult).pubKey.length > 300));
      expect(parseRsa(actResult).pubKey.length > 300).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGen0012 end');
    });

    /**
     * @tc.name   testRsaGen0013
     * @tc.number SUB_CryptoFramework_RSAGEN_01_0013
     * @tc.desc   generateRsaKey run 13 yields a parseable key pair json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaGen0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGen0013 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: string = await op.generateRsaKey();
      const kp: cryptoFramework.KeyPair = await op.convertRsaKey(actResult);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parseRsa(actResult).priKey.length > 1000));
      expect(parseRsa(actResult).priKey.length > 1000).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parseRsa(actResult).pubKey.length > 300));
      expect(parseRsa(actResult).pubKey.length > 300).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGen0013 end');
    });

    /**
     * @tc.name   testRsaGen0014
     * @tc.number SUB_CryptoFramework_RSAGEN_01_0014
     * @tc.desc   generateRsaKey run 14 yields a parseable key pair json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaGen0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGen0014 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: string = await op.generateRsaKey();
      const kp: cryptoFramework.KeyPair = await op.convertRsaKey(actResult);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parseRsa(actResult).priKey.length > 1000));
      expect(parseRsa(actResult).priKey.length > 1000).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parseRsa(actResult).pubKey.length > 300));
      expect(parseRsa(actResult).pubKey.length > 300).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGen0014 end');
    });

    /**
     * @tc.name   testRsaGen0015
     * @tc.number SUB_CryptoFramework_RSAGEN_01_0015
     * @tc.desc   generateRsaKey run 15 yields a parseable key pair json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaGen0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGen0015 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: string = await op.generateRsaKey();
      const kp: cryptoFramework.KeyPair = await op.convertRsaKey(actResult);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parseRsa(actResult).priKey.length > 1000));
      expect(parseRsa(actResult).priKey.length > 1000).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parseRsa(actResult).pubKey.length > 300));
      expect(parseRsa(actResult).pubKey.length > 300).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGen0015 end');
    });

    /**
     * @tc.name   testRsaGen0016
     * @tc.number SUB_CryptoFramework_RSAGEN_01_0016
     * @tc.desc   generateRsaKey run 16 yields a parseable key pair json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaGen0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGen0016 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: string = await op.generateRsaKey();
      const kp: cryptoFramework.KeyPair = await op.convertRsaKey(actResult);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parseRsa(actResult).priKey.length > 1000));
      expect(parseRsa(actResult).priKey.length > 1000).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parseRsa(actResult).pubKey.length > 300));
      expect(parseRsa(actResult).pubKey.length > 300).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGen0016 end');
    });

    /**
     * @tc.name   testRsaGen0017
     * @tc.number SUB_CryptoFramework_RSAGEN_01_0017
     * @tc.desc   generateRsaKey run 17 yields a parseable key pair json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaGen0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGen0017 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: string = await op.generateRsaKey();
      const kp: cryptoFramework.KeyPair = await op.convertRsaKey(actResult);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parseRsa(actResult).priKey.length > 1000));
      expect(parseRsa(actResult).priKey.length > 1000).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parseRsa(actResult).pubKey.length > 300));
      expect(parseRsa(actResult).pubKey.length > 300).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGen0017 end');
    });

    /**
     * @tc.name   testRsaGen0018
     * @tc.number SUB_CryptoFramework_RSAGEN_01_0018
     * @tc.desc   generateRsaKey run 18 yields a parseable key pair json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaGen0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGen0018 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: string = await op.generateRsaKey();
      const kp: cryptoFramework.KeyPair = await op.convertRsaKey(actResult);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parseRsa(actResult).priKey.length > 1000));
      expect(parseRsa(actResult).priKey.length > 1000).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parseRsa(actResult).pubKey.length > 300));
      expect(parseRsa(actResult).pubKey.length > 300).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGen0018 end');
    });

    /**
     * @tc.name   testRsaGen0019
     * @tc.number SUB_CryptoFramework_RSAGEN_01_0019
     * @tc.desc   generateRsaKey run 19 yields a parseable key pair json
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaGen0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGen0019 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: string = await op.generateRsaKey();
      const kp: cryptoFramework.KeyPair = await op.convertRsaKey(actResult);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parseRsa(actResult).priKey.length > 1000));
      expect(parseRsa(actResult).priKey.length > 1000).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parseRsa(actResult).pubKey.length > 300));
      expect(parseRsa(actResult).pubKey.length > 300).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGen0019 end');
    });

    /**
     * @tc.name   testRsaGen0020
     * @tc.number SUB_CryptoFramework_RSAGEN_01_0020
     * @tc.desc   twentieth generation still converts back to a key pair
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaGen0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGen0020 begin');
      const op: CryptoOperation = new CryptoOperation();
      const actResult: string = await op.generateRsaKey();
      const kp: cryptoFramework.KeyPair = await op.convertRsaKey(actResult);
      const result: string = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult === null));
      expect(actResult === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parseRsa(actResult).priKey.length > 1000));
      expect(parseRsa(actResult).priKey.length > 1000).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parseRsa(actResult).pubKey.length > 300));
      expect(parseRsa(actResult).pubKey.length > 300).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGen0020 end');
    });

  });
}
