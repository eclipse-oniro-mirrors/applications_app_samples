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

export default function aesGlen1Test() {
  describe('AesGlen1', () => {

    /**
     * @tc.name   testAesGlen10001
     * @tc.number SUB_CryptoFramework_AESGLEN1_01_0001
     * @tc.desc   1-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen10001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10001 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'x');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(2));
      expect(parseAes(result).encryptedText.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10001 end');
    });

    /**
     * @tc.name   testAesGlen10002
     * @tc.number SUB_CryptoFramework_AESGLEN1_01_0002
     * @tc.desc   GCM encrypt of a 2-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen10002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10002 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(4));
      expect(parseAes(result).encryptedText.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10002 end');
    });

    /**
     * @tc.name   testAesGlen10003
     * @tc.number SUB_CryptoFramework_AESGLEN1_01_0003
     * @tc.desc   GCM encrypt of a 3-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen10003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10003 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(6));
      expect(parseAes(result).encryptedText.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10003 end');
    });

    /**
     * @tc.name   testAesGlen10004
     * @tc.number SUB_CryptoFramework_AESGLEN1_01_0004
     * @tc.desc   GCM encrypt of a 4-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen10004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10004 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(8));
      expect(parseAes(result).encryptedText.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10004 end');
    });

    /**
     * @tc.name   testAesGlen10005
     * @tc.number SUB_CryptoFramework_AESGLEN1_01_0005
     * @tc.desc   GCM encrypt of a 5-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen10005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10005 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(10));
      expect(parseAes(result).encryptedText.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10005 end');
    });

    /**
     * @tc.name   testAesGlen10006
     * @tc.number SUB_CryptoFramework_AESGLEN1_01_0006
     * @tc.desc   GCM encrypt of a 6-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen10006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10006 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(12));
      expect(parseAes(result).encryptedText.length).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10006 end');
    });

    /**
     * @tc.name   testAesGlen10007
     * @tc.number SUB_CryptoFramework_AESGLEN1_01_0007
     * @tc.desc   GCM encrypt of a 7-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen10007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10007 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(14));
      expect(parseAes(result).encryptedText.length).assertEqual(14);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10007 end');
    });

    /**
     * @tc.name   testAesGlen10008
     * @tc.number SUB_CryptoFramework_AESGLEN1_01_0008
     * @tc.desc   GCM encrypt of a 8-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen10008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10008 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(16));
      expect(parseAes(result).encryptedText.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10008 end');
    });

    /**
     * @tc.name   testAesGlen10009
     * @tc.number SUB_CryptoFramework_AESGLEN1_01_0009
     * @tc.desc   GCM encrypt of a 9-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen10009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10009 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(18));
      expect(parseAes(result).encryptedText.length).assertEqual(18);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10009 end');
    });

    /**
     * @tc.name   testAesGlen10010
     * @tc.number SUB_CryptoFramework_AESGLEN1_01_0010
     * @tc.desc   GCM encrypt of a 10-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen10010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10010 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(20));
      expect(parseAes(result).encryptedText.length).assertEqual(20);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10010 end');
    });

    /**
     * @tc.name   testAesGlen10011
     * @tc.number SUB_CryptoFramework_AESGLEN1_01_0011
     * @tc.desc   GCM encrypt of a 11-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen10011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10011 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(22));
      expect(parseAes(result).encryptedText.length).assertEqual(22);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10011 end');
    });

    /**
     * @tc.name   testAesGlen10012
     * @tc.number SUB_CryptoFramework_AESGLEN1_01_0012
     * @tc.desc   GCM encrypt of a 12-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen10012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10012 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(24));
      expect(parseAes(result).encryptedText.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10012 end');
    });

    /**
     * @tc.name   testAesGlen10013
     * @tc.number SUB_CryptoFramework_AESGLEN1_01_0013
     * @tc.desc   GCM encrypt of a 13-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen10013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10013 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(26));
      expect(parseAes(result).encryptedText.length).assertEqual(26);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10013 end');
    });

    /**
     * @tc.name   testAesGlen10014
     * @tc.number SUB_CryptoFramework_AESGLEN1_01_0014
     * @tc.desc   GCM encrypt of a 14-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen10014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10014 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(28));
      expect(parseAes(result).encryptedText.length).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10014 end');
    });

    /**
     * @tc.name   testAesGlen10015
     * @tc.number SUB_CryptoFramework_AESGLEN1_01_0015
     * @tc.desc   GCM encrypt of a 15-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen10015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10015 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(30));
      expect(parseAes(result).encryptedText.length).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10015 end');
    });

    /**
     * @tc.name   testAesGlen10016
     * @tc.number SUB_CryptoFramework_AESGLEN1_01_0016
     * @tc.desc   GCM encrypt of a 16-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen10016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10016 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(32));
      expect(parseAes(result).encryptedText.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10016 end');
    });

    /**
     * @tc.name   testAesGlen10017
     * @tc.number SUB_CryptoFramework_AESGLEN1_01_0017
     * @tc.desc   GCM encrypt of a 17-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen10017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10017 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(34));
      expect(parseAes(result).encryptedText.length).assertEqual(34);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10017 end');
    });

    /**
     * @tc.name   testAesGlen10018
     * @tc.number SUB_CryptoFramework_AESGLEN1_01_0018
     * @tc.desc   GCM encrypt of a 18-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen10018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10018 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(36));
      expect(parseAes(result).encryptedText.length).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10018 end');
    });

    /**
     * @tc.name   testAesGlen10019
     * @tc.number SUB_CryptoFramework_AESGLEN1_01_0019
     * @tc.desc   GCM encrypt of a 19-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen10019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10019 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(38));
      expect(parseAes(result).encryptedText.length).assertEqual(38);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10019 end');
    });

    /**
     * @tc.name   testAesGlen10020
     * @tc.number SUB_CryptoFramework_AESGLEN1_01_0020
     * @tc.desc   GCM encrypt of a 20-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen10020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10020 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(40));
      expect(parseAes(result).encryptedText.length).assertEqual(40);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10020 end');
    });

    /**
     * @tc.name   testAesGlen10021
     * @tc.number SUB_CryptoFramework_AESGLEN1_01_0021
     * @tc.desc   GCM encrypt of a 21-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen10021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10021 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(42));
      expect(parseAes(result).encryptedText.length).assertEqual(42);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10021 end');
    });

    /**
     * @tc.name   testAesGlen10022
     * @tc.number SUB_CryptoFramework_AESGLEN1_01_0022
     * @tc.desc   GCM encrypt of a 22-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen10022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10022 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(44));
      expect(parseAes(result).encryptedText.length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10022 end');
    });

    /**
     * @tc.name   testAesGlen10023
     * @tc.number SUB_CryptoFramework_AESGLEN1_01_0023
     * @tc.desc   GCM encrypt of a 23-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen10023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10023 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(46));
      expect(parseAes(result).encryptedText.length).assertEqual(46);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10023 end');
    });

    /**
     * @tc.name   testAesGlen10024
     * @tc.number SUB_CryptoFramework_AESGLEN1_01_0024
     * @tc.desc   GCM encrypt of a 24-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen10024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10024 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(48));
      expect(parseAes(result).encryptedText.length).assertEqual(48);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10024 end');
    });

    /**
     * @tc.name   testAesGlen10025
     * @tc.number SUB_CryptoFramework_AESGLEN1_01_0025
     * @tc.desc   GCM encrypt of a 25-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen10025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10025 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(50));
      expect(parseAes(result).encryptedText.length).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10025 end');
    });

    /**
     * @tc.name   testAesGlen10026
     * @tc.number SUB_CryptoFramework_AESGLEN1_01_0026
     * @tc.desc   GCM encrypt of a 26-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen10026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10026 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(52));
      expect(parseAes(result).encryptedText.length).assertEqual(52);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10026 end');
    });

    /**
     * @tc.name   testAesGlen10027
     * @tc.number SUB_CryptoFramework_AESGLEN1_01_0027
     * @tc.desc   GCM encrypt of a 27-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen10027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10027 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(54));
      expect(parseAes(result).encryptedText.length).assertEqual(54);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10027 end');
    });

    /**
     * @tc.name   testAesGlen10028
     * @tc.number SUB_CryptoFramework_AESGLEN1_01_0028
     * @tc.desc   GCM encrypt of a 28-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen10028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10028 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(56));
      expect(parseAes(result).encryptedText.length).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10028 end');
    });

    /**
     * @tc.name   testAesGlen10029
     * @tc.number SUB_CryptoFramework_AESGLEN1_01_0029
     * @tc.desc   GCM encrypt of a 29-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen10029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10029 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(58));
      expect(parseAes(result).encryptedText.length).assertEqual(58);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10029 end');
    });

    /**
     * @tc.name   testAesGlen10030
     * @tc.number SUB_CryptoFramework_AESGLEN1_01_0030
     * @tc.desc   GCM encrypt of a 30-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen10030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10030 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(60));
      expect(parseAes(result).encryptedText.length).assertEqual(60);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10030 end');
    });

    /**
     * @tc.name   testAesGlen10031
     * @tc.number SUB_CryptoFramework_AESGLEN1_01_0031
     * @tc.desc   GCM encrypt of a 31-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen10031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10031 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(62));
      expect(parseAes(result).encryptedText.length).assertEqual(62);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10031 end');
    });

    /**
     * @tc.name   testAesGlen10032
     * @tc.number SUB_CryptoFramework_AESGLEN1_01_0032
     * @tc.desc   GCM encrypt of a 32-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen10032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10032 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(64));
      expect(parseAes(result).encryptedText.length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10032 end');
    });

    /**
     * @tc.name   testAesGlen10033
     * @tc.number SUB_CryptoFramework_AESGLEN1_01_0033
     * @tc.desc   GCM encrypt of a 33-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen10033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10033 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(66));
      expect(parseAes(result).encryptedText.length).assertEqual(66);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10033 end');
    });

    /**
     * @tc.name   testAesGlen10034
     * @tc.number SUB_CryptoFramework_AESGLEN1_01_0034
     * @tc.desc   GCM encrypt of a 34-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen10034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10034 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(68));
      expect(parseAes(result).encryptedText.length).assertEqual(68);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10034 end');
    });

    /**
     * @tc.name   testAesGlen10035
     * @tc.number SUB_CryptoFramework_AESGLEN1_01_0035
     * @tc.desc   GCM encrypt of a 35-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen10035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10035 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(70));
      expect(parseAes(result).encryptedText.length).assertEqual(70);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10035 end');
    });

    /**
     * @tc.name   testAesGlen10036
     * @tc.number SUB_CryptoFramework_AESGLEN1_01_0036
     * @tc.desc   GCM encrypt of a 36-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen10036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10036 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(72));
      expect(parseAes(result).encryptedText.length).assertEqual(72);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10036 end');
    });

    /**
     * @tc.name   testAesGlen10037
     * @tc.number SUB_CryptoFramework_AESGLEN1_01_0037
     * @tc.desc   GCM encrypt of a 37-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen10037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10037 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(74));
      expect(parseAes(result).encryptedText.length).assertEqual(74);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10037 end');
    });

    /**
     * @tc.name   testAesGlen10038
     * @tc.number SUB_CryptoFramework_AESGLEN1_01_0038
     * @tc.desc   GCM encrypt of a 38-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen10038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10038 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(76));
      expect(parseAes(result).encryptedText.length).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10038 end');
    });

    /**
     * @tc.name   testAesGlen10039
     * @tc.number SUB_CryptoFramework_AESGLEN1_01_0039
     * @tc.desc   GCM encrypt of a 39-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen10039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10039 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(78));
      expect(parseAes(result).encryptedText.length).assertEqual(78);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10039 end');
    });

    /**
     * @tc.name   testAesGlen10040
     * @tc.number SUB_CryptoFramework_AESGLEN1_01_0040
     * @tc.desc   GCM encrypt of a 40-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen10040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10040 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(80));
      expect(parseAes(result).encryptedText.length).assertEqual(80);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10040 end');
    });

    /**
     * @tc.name   testAesGlen10041
     * @tc.number SUB_CryptoFramework_AESGLEN1_01_0041
     * @tc.desc   GCM encrypt of a 41-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen10041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10041 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(82));
      expect(parseAes(result).encryptedText.length).assertEqual(82);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10041 end');
    });

    /**
     * @tc.name   testAesGlen10042
     * @tc.number SUB_CryptoFramework_AESGLEN1_01_0042
     * @tc.desc   GCM encrypt of a 42-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen10042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10042 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(84));
      expect(parseAes(result).encryptedText.length).assertEqual(84);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10042 end');
    });

    /**
     * @tc.name   testAesGlen10043
     * @tc.number SUB_CryptoFramework_AESGLEN1_01_0043
     * @tc.desc   GCM encrypt of a 43-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen10043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10043 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(86));
      expect(parseAes(result).encryptedText.length).assertEqual(86);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10043 end');
    });

    /**
     * @tc.name   testAesGlen10044
     * @tc.number SUB_CryptoFramework_AESGLEN1_01_0044
     * @tc.desc   GCM encrypt of a 44-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen10044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10044 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(88));
      expect(parseAes(result).encryptedText.length).assertEqual(88);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10044 end');
    });

    /**
     * @tc.name   testAesGlen10045
     * @tc.number SUB_CryptoFramework_AESGLEN1_01_0045
     * @tc.desc   GCM encrypt of a 45-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen10045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10045 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(90));
      expect(parseAes(result).encryptedText.length).assertEqual(90);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10045 end');
    });

    /**
     * @tc.name   testAesGlen10046
     * @tc.number SUB_CryptoFramework_AESGLEN1_01_0046
     * @tc.desc   GCM encrypt of a 46-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen10046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10046 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(92));
      expect(parseAes(result).encryptedText.length).assertEqual(92);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10046 end');
    });

    /**
     * @tc.name   testAesGlen10047
     * @tc.number SUB_CryptoFramework_AESGLEN1_01_0047
     * @tc.desc   GCM encrypt of a 47-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen10047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10047 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(94));
      expect(parseAes(result).encryptedText.length).assertEqual(94);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10047 end');
    });

    /**
     * @tc.name   testAesGlen10048
     * @tc.number SUB_CryptoFramework_AESGLEN1_01_0048
     * @tc.desc   GCM encrypt of a 48-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen10048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10048 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(96));
      expect(parseAes(result).encryptedText.length).assertEqual(96);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen10048 end');
    });

  });
}
