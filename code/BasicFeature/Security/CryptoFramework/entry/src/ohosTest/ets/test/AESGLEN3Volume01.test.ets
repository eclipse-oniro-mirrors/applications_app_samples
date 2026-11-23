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

export default function aesGlen3Test() {
  describe('AesGlen3', () => {

    /**
     * @tc.name   testAesGlen30001
     * @tc.number SUB_CryptoFramework_AESGLEN3_01_0001
     * @tc.desc   97-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen30001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30001 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(194));
      expect(parseAes(result).encryptedText.length).assertEqual(194);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30001 end');
    });

    /**
     * @tc.name   testAesGlen30002
     * @tc.number SUB_CryptoFramework_AESGLEN3_01_0002
     * @tc.desc   GCM encrypt of a 98-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30002 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(196));
      expect(parseAes(result).encryptedText.length).assertEqual(196);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30002 end');
    });

    /**
     * @tc.name   testAesGlen30003
     * @tc.number SUB_CryptoFramework_AESGLEN3_01_0003
     * @tc.desc   GCM encrypt of a 99-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen30003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30003 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(198));
      expect(parseAes(result).encryptedText.length).assertEqual(198);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30003 end');
    });

    /**
     * @tc.name   testAesGlen30004
     * @tc.number SUB_CryptoFramework_AESGLEN3_01_0004
     * @tc.desc   GCM encrypt of a 100-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen30004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30004 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(200));
      expect(parseAes(result).encryptedText.length).assertEqual(200);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30004 end');
    });

    /**
     * @tc.name   testAesGlen30005
     * @tc.number SUB_CryptoFramework_AESGLEN3_01_0005
     * @tc.desc   GCM encrypt of a 101-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen30005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30005 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(202));
      expect(parseAes(result).encryptedText.length).assertEqual(202);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30005 end');
    });

    /**
     * @tc.name   testAesGlen30006
     * @tc.number SUB_CryptoFramework_AESGLEN3_01_0006
     * @tc.desc   GCM encrypt of a 102-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen30006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30006 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(204));
      expect(parseAes(result).encryptedText.length).assertEqual(204);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30006 end');
    });

    /**
     * @tc.name   testAesGlen30007
     * @tc.number SUB_CryptoFramework_AESGLEN3_01_0007
     * @tc.desc   GCM encrypt of a 103-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen30007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30007 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(206));
      expect(parseAes(result).encryptedText.length).assertEqual(206);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30007 end');
    });

    /**
     * @tc.name   testAesGlen30008
     * @tc.number SUB_CryptoFramework_AESGLEN3_01_0008
     * @tc.desc   GCM encrypt of a 104-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen30008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30008 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(208));
      expect(parseAes(result).encryptedText.length).assertEqual(208);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30008 end');
    });

    /**
     * @tc.name   testAesGlen30009
     * @tc.number SUB_CryptoFramework_AESGLEN3_01_0009
     * @tc.desc   GCM encrypt of a 105-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen30009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30009 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(210));
      expect(parseAes(result).encryptedText.length).assertEqual(210);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30009 end');
    });

    /**
     * @tc.name   testAesGlen30010
     * @tc.number SUB_CryptoFramework_AESGLEN3_01_0010
     * @tc.desc   GCM encrypt of a 106-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen30010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30010 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(212));
      expect(parseAes(result).encryptedText.length).assertEqual(212);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30010 end');
    });

    /**
     * @tc.name   testAesGlen30011
     * @tc.number SUB_CryptoFramework_AESGLEN3_01_0011
     * @tc.desc   GCM encrypt of a 107-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen30011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30011 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(214));
      expect(parseAes(result).encryptedText.length).assertEqual(214);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30011 end');
    });

    /**
     * @tc.name   testAesGlen30012
     * @tc.number SUB_CryptoFramework_AESGLEN3_01_0012
     * @tc.desc   GCM encrypt of a 108-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen30012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30012 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(216));
      expect(parseAes(result).encryptedText.length).assertEqual(216);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30012 end');
    });

    /**
     * @tc.name   testAesGlen30013
     * @tc.number SUB_CryptoFramework_AESGLEN3_01_0013
     * @tc.desc   GCM encrypt of a 109-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen30013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30013 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(218));
      expect(parseAes(result).encryptedText.length).assertEqual(218);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30013 end');
    });

    /**
     * @tc.name   testAesGlen30014
     * @tc.number SUB_CryptoFramework_AESGLEN3_01_0014
     * @tc.desc   GCM encrypt of a 110-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen30014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30014 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(220));
      expect(parseAes(result).encryptedText.length).assertEqual(220);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30014 end');
    });

    /**
     * @tc.name   testAesGlen30015
     * @tc.number SUB_CryptoFramework_AESGLEN3_01_0015
     * @tc.desc   GCM encrypt of a 111-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen30015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30015 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(222));
      expect(parseAes(result).encryptedText.length).assertEqual(222);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30015 end');
    });

    /**
     * @tc.name   testAesGlen30016
     * @tc.number SUB_CryptoFramework_AESGLEN3_01_0016
     * @tc.desc   GCM encrypt of a 112-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen30016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30016 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(224));
      expect(parseAes(result).encryptedText.length).assertEqual(224);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30016 end');
    });

    /**
     * @tc.name   testAesGlen30017
     * @tc.number SUB_CryptoFramework_AESGLEN3_01_0017
     * @tc.desc   GCM encrypt of a 113-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen30017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30017 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(226));
      expect(parseAes(result).encryptedText.length).assertEqual(226);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30017 end');
    });

    /**
     * @tc.name   testAesGlen30018
     * @tc.number SUB_CryptoFramework_AESGLEN3_01_0018
     * @tc.desc   GCM encrypt of a 114-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen30018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30018 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(228));
      expect(parseAes(result).encryptedText.length).assertEqual(228);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30018 end');
    });

    /**
     * @tc.name   testAesGlen30019
     * @tc.number SUB_CryptoFramework_AESGLEN3_01_0019
     * @tc.desc   GCM encrypt of a 115-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen30019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30019 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(230));
      expect(parseAes(result).encryptedText.length).assertEqual(230);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30019 end');
    });

    /**
     * @tc.name   testAesGlen30020
     * @tc.number SUB_CryptoFramework_AESGLEN3_01_0020
     * @tc.desc   GCM encrypt of a 116-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen30020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30020 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(232));
      expect(parseAes(result).encryptedText.length).assertEqual(232);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30020 end');
    });

    /**
     * @tc.name   testAesGlen30021
     * @tc.number SUB_CryptoFramework_AESGLEN3_01_0021
     * @tc.desc   GCM encrypt of a 117-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen30021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30021 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(234));
      expect(parseAes(result).encryptedText.length).assertEqual(234);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30021 end');
    });

    /**
     * @tc.name   testAesGlen30022
     * @tc.number SUB_CryptoFramework_AESGLEN3_01_0022
     * @tc.desc   GCM encrypt of a 118-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen30022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30022 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(236));
      expect(parseAes(result).encryptedText.length).assertEqual(236);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30022 end');
    });

    /**
     * @tc.name   testAesGlen30023
     * @tc.number SUB_CryptoFramework_AESGLEN3_01_0023
     * @tc.desc   GCM encrypt of a 119-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen30023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30023 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(238));
      expect(parseAes(result).encryptedText.length).assertEqual(238);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30023 end');
    });

    /**
     * @tc.name   testAesGlen30024
     * @tc.number SUB_CryptoFramework_AESGLEN3_01_0024
     * @tc.desc   GCM encrypt of a 120-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen30024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30024 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(240));
      expect(parseAes(result).encryptedText.length).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30024 end');
    });

    /**
     * @tc.name   testAesGlen30025
     * @tc.number SUB_CryptoFramework_AESGLEN3_01_0025
     * @tc.desc   GCM encrypt of a 121-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen30025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30025 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(242));
      expect(parseAes(result).encryptedText.length).assertEqual(242);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30025 end');
    });

    /**
     * @tc.name   testAesGlen30026
     * @tc.number SUB_CryptoFramework_AESGLEN3_01_0026
     * @tc.desc   GCM encrypt of a 122-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen30026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30026 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(244));
      expect(parseAes(result).encryptedText.length).assertEqual(244);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30026 end');
    });

    /**
     * @tc.name   testAesGlen30027
     * @tc.number SUB_CryptoFramework_AESGLEN3_01_0027
     * @tc.desc   GCM encrypt of a 123-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen30027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30027 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(246));
      expect(parseAes(result).encryptedText.length).assertEqual(246);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30027 end');
    });

    /**
     * @tc.name   testAesGlen30028
     * @tc.number SUB_CryptoFramework_AESGLEN3_01_0028
     * @tc.desc   GCM encrypt of a 124-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen30028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30028 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(248));
      expect(parseAes(result).encryptedText.length).assertEqual(248);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30028 end');
    });

    /**
     * @tc.name   testAesGlen30029
     * @tc.number SUB_CryptoFramework_AESGLEN3_01_0029
     * @tc.desc   GCM encrypt of a 125-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen30029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30029 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(250));
      expect(parseAes(result).encryptedText.length).assertEqual(250);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30029 end');
    });

    /**
     * @tc.name   testAesGlen30030
     * @tc.number SUB_CryptoFramework_AESGLEN3_01_0030
     * @tc.desc   GCM encrypt of a 126-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen30030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30030 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(252));
      expect(parseAes(result).encryptedText.length).assertEqual(252);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30030 end');
    });

    /**
     * @tc.name   testAesGlen30031
     * @tc.number SUB_CryptoFramework_AESGLEN3_01_0031
     * @tc.desc   GCM encrypt of a 127-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen30031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30031 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(254));
      expect(parseAes(result).encryptedText.length).assertEqual(254);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30031 end');
    });

    /**
     * @tc.name   testAesGlen30032
     * @tc.number SUB_CryptoFramework_AESGLEN3_01_0032
     * @tc.desc   GCM encrypt of a 128-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen30032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30032 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(256));
      expect(parseAes(result).encryptedText.length).assertEqual(256);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30032 end');
    });

    /**
     * @tc.name   testAesGlen30033
     * @tc.number SUB_CryptoFramework_AESGLEN3_01_0033
     * @tc.desc   GCM encrypt of a 129-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen30033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30033 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(258));
      expect(parseAes(result).encryptedText.length).assertEqual(258);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30033 end');
    });

    /**
     * @tc.name   testAesGlen30034
     * @tc.number SUB_CryptoFramework_AESGLEN3_01_0034
     * @tc.desc   GCM encrypt of a 130-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen30034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30034 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(260));
      expect(parseAes(result).encryptedText.length).assertEqual(260);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30034 end');
    });

    /**
     * @tc.name   testAesGlen30035
     * @tc.number SUB_CryptoFramework_AESGLEN3_01_0035
     * @tc.desc   GCM encrypt of a 131-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen30035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30035 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(262));
      expect(parseAes(result).encryptedText.length).assertEqual(262);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30035 end');
    });

    /**
     * @tc.name   testAesGlen30036
     * @tc.number SUB_CryptoFramework_AESGLEN3_01_0036
     * @tc.desc   GCM encrypt of a 132-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen30036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30036 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(264));
      expect(parseAes(result).encryptedText.length).assertEqual(264);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30036 end');
    });

    /**
     * @tc.name   testAesGlen30037
     * @tc.number SUB_CryptoFramework_AESGLEN3_01_0037
     * @tc.desc   GCM encrypt of a 133-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen30037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30037 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(266));
      expect(parseAes(result).encryptedText.length).assertEqual(266);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30037 end');
    });

    /**
     * @tc.name   testAesGlen30038
     * @tc.number SUB_CryptoFramework_AESGLEN3_01_0038
     * @tc.desc   GCM encrypt of a 134-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen30038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30038 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(268));
      expect(parseAes(result).encryptedText.length).assertEqual(268);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30038 end');
    });

    /**
     * @tc.name   testAesGlen30039
     * @tc.number SUB_CryptoFramework_AESGLEN3_01_0039
     * @tc.desc   GCM encrypt of a 135-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen30039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30039 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(270));
      expect(parseAes(result).encryptedText.length).assertEqual(270);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30039 end');
    });

    /**
     * @tc.name   testAesGlen30040
     * @tc.number SUB_CryptoFramework_AESGLEN3_01_0040
     * @tc.desc   GCM encrypt of a 136-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen30040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30040 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(272));
      expect(parseAes(result).encryptedText.length).assertEqual(272);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30040 end');
    });

    /**
     * @tc.name   testAesGlen30041
     * @tc.number SUB_CryptoFramework_AESGLEN3_01_0041
     * @tc.desc   GCM encrypt of a 137-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen30041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30041 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(274));
      expect(parseAes(result).encryptedText.length).assertEqual(274);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30041 end');
    });

    /**
     * @tc.name   testAesGlen30042
     * @tc.number SUB_CryptoFramework_AESGLEN3_01_0042
     * @tc.desc   GCM encrypt of a 138-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen30042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30042 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(276));
      expect(parseAes(result).encryptedText.length).assertEqual(276);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30042 end');
    });

    /**
     * @tc.name   testAesGlen30043
     * @tc.number SUB_CryptoFramework_AESGLEN3_01_0043
     * @tc.desc   GCM encrypt of a 139-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen30043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30043 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(278));
      expect(parseAes(result).encryptedText.length).assertEqual(278);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30043 end');
    });

    /**
     * @tc.name   testAesGlen30044
     * @tc.number SUB_CryptoFramework_AESGLEN3_01_0044
     * @tc.desc   GCM encrypt of a 140-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen30044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30044 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(280));
      expect(parseAes(result).encryptedText.length).assertEqual(280);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30044 end');
    });

    /**
     * @tc.name   testAesGlen30045
     * @tc.number SUB_CryptoFramework_AESGLEN3_01_0045
     * @tc.desc   GCM encrypt of a 141-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen30045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30045 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(282));
      expect(parseAes(result).encryptedText.length).assertEqual(282);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30045 end');
    });

    /**
     * @tc.name   testAesGlen30046
     * @tc.number SUB_CryptoFramework_AESGLEN3_01_0046
     * @tc.desc   GCM encrypt of a 142-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen30046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30046 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(284));
      expect(parseAes(result).encryptedText.length).assertEqual(284);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30046 end');
    });

    /**
     * @tc.name   testAesGlen30047
     * @tc.number SUB_CryptoFramework_AESGLEN3_01_0047
     * @tc.desc   GCM encrypt of a 143-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen30047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30047 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(286));
      expect(parseAes(result).encryptedText.length).assertEqual(286);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30047 end');
    });

    /**
     * @tc.name   testAesGlen30048
     * @tc.number SUB_CryptoFramework_AESGLEN3_01_0048
     * @tc.desc   GCM encrypt of a 144-char plain text keeps cipher length and tag shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGlen30048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30048 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const result: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(288));
      expect(parseAes(result).encryptedText.length).assertEqual(288);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGlen30048 end');
    });

  });
}
