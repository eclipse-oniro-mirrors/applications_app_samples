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

interface AesJson {
  aesGcmTag: string;
  encryptedText: string;
}

function parseAes(json: string): AesJson {
  return JSON.parse(json) as AesJson;
}

function allHex(s: string): boolean {
  const hexChars: string = '0123456789abcdefABCDEF';
  for (let i = 0; i < s.length; i++) {
    if (hexChars.indexOf(s.charAt(i)) < 0) {
      return false;
    }
  }
  return true;
}

function repeatChar(ch: string, count: number): string {
  let ret: string = '';
  for (let i = 0; i < count; i++) {
    ret += ch;
  }
  return ret;
}

export default function aesKeyReal2Test() {
  describe('AesKeyReal2', () => {

    /**
     * @tc.name   testAesKeyReal20001
     * @tc.number SUB_CryptoFramework_AESKR2_0001
     * @tc.desc   a generated key blob is 64 hex characters and never empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyReal20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyReal20001 begin');
      const op: CryptoOperation = new CryptoOperation();
      const blob: string = await op.generateAesKey();
      const actResult: string = blob;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(blob.length), String(64));
      expect(blob.length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(allHex(blob)));
      expect(allHex(blob)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(blob !== ''));
      expect(blob !== '').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyReal20001 end');
    });

    /**
     * @tc.name   testAesKeyReal20002
     * @tc.number SUB_CryptoFramework_AESKR2_0002
     * @tc.desc   two consecutive generations produce different key blobs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyReal20002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyReal20002 begin');
      const op: CryptoOperation = new CryptoOperation();
      const blobA: string = await op.generateAesKey();
      const blobB: string = await op.generateAesKey();
      const actResult: string = blobA;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(blobA === blobB));
      expect(blobA === blobB).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(blobA.length), String(64));
      expect(blobA.length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(blobB.length), String(64));
      expect(blobB.length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyReal20002 end');
    });

    /**
     * @tc.name   testAesKeyReal20003
     * @tc.number SUB_CryptoFramework_AESKR2_0003
     * @tc.desc   a generated blob converts to a key that encrypts and decrypts back
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyReal20003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyReal20003 begin');
      const op: CryptoOperation = new CryptoOperation();
      const blob: string = await op.generateAesKey();
      const key: cryptoFramework.SymKey = await op.convertAesKey(blob);
      const actResult: cryptoFramework.SymKey = key;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(key === null));
      expect(key === null).assertFalse();
      const json: string = await op.aesGcmEncrypt(key, 'roundtrip probe');
      const back: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', back, 'roundtrip probe');
      expect(back).assertEqual('roundtrip probe');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(json.length > 0));
      expect(json.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyReal20003 end');
    });

    /**
     * @tc.name   testAesKeyReal20004
     * @tc.number SUB_CryptoFramework_AESKR2_0004
     * @tc.desc   converting the same blob twice yields two usable key objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyReal20004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyReal20004 begin');
      const op: CryptoOperation = new CryptoOperation();
      const blob: string = await op.generateAesKey();
      const keyA: cryptoFramework.SymKey = await op.convertAesKey(blob);
      const keyB: cryptoFramework.SymKey = await op.convertAesKey(blob);
      const actResult: cryptoFramework.SymKey = keyA;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(keyA === null || keyB === null));
      expect(keyA === null || keyB === null).assertFalse();
      const json: string = await op.aesGcmEncrypt(keyB, 'cross key text');
      const back: string = await op.aesGcmDecrypt(keyA, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', back, 'cross key text');
      expect(back).assertEqual('cross key text');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(back.length), String(14));
      expect(back.length).assertEqual(14);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyReal20004 end');
    });

    /**
     * @tc.name   testAesKeyReal20005
     * @tc.number SUB_CryptoFramework_AESKR2_0005
     * @tc.desc   convertAndEncrypt returns a JSON with a 32 char tag and doubled ciphertext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyReal20005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyReal20005 begin');
      const op: CryptoOperation = new CryptoOperation();
      const blob: string = await op.generateAesKey();
      const json: string = await op.aesConvertAndEncrypt(blob, 'structure text');
      const actResult: string = json;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(json === null));
      expect(json === null).assertFalse();
      const parsed: AesJson = parseAes(json);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parsed.aesGcmTag.length), String(32));
      expect(parsed.aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parsed.encryptedText.length), String(28));
      expect(parsed.encryptedText.length).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyReal20005 end');
    });

    /**
     * @tc.name   testAesKeyReal20006
     * @tc.number SUB_CryptoFramework_AESKR2_0006
     * @tc.desc   convertAndDecrypt restores the plaintext produced by convertAndEncrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyReal20006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyReal20006 begin');
      const op: CryptoOperation = new CryptoOperation();
      const blob: string = await op.generateAesKey();
      const json: string = await op.aesConvertAndEncrypt(blob, 'restore me');
      const back: string = await op.aesConvertAndDecrypt(blob, json);
      const actResult: string = back;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', back, 'restore me');
      expect(back).assertEqual('restore me');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(json === null));
      expect(json === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(back.length), String(10));
      expect(back.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyReal20006 end');
    });

    /**
     * @tc.name   testAesKeyReal20007
     * @tc.number SUB_CryptoFramework_AESKR2_0007
     * @tc.desc   short and long texts both survive the convertAndEncrypt/Decrypt cycle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyReal20007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyReal20007 begin');
      const op: CryptoOperation = new CryptoOperation();
      const blob: string = await op.generateAesKey();
      const short: string = await op.aesConvertAndEncrypt(blob, 'x');
      const shortBack: string = await op.aesConvertAndDecrypt(blob, short);
      const longText: string = repeatChar('y', 100);
      const long: string = await op.aesConvertAndEncrypt(blob, longText);
      const longBack: string = await op.aesConvertAndDecrypt(blob, long);
      const actResult: string = shortBack;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', shortBack, 'x');
      expect(shortBack).assertEqual('x');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(longBack === longText));
      expect(longBack === longText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(longBack.length), String(100));
      expect(longBack.length).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyReal20007 end');
    });

    /**
     * @tc.name   testAesKeyReal20008
     * @tc.number SUB_CryptoFramework_AESKR2_0008
     * @tc.desc   an invalid 62 char blob makes convertAndEncrypt return null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyReal20008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyReal20008 begin');
      const op: CryptoOperation = new CryptoOperation();
      const bad: string = repeatChar('c', 62);
      const json: string = await op.aesConvertAndEncrypt(bad, 'payload');
      const actResult: string = json;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(json === null));
      expect(json === null).assertTrue();
      const key: cryptoFramework.SymKey = await op.convertAesKey(bad);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(key === null));
      expect(key === null).assertTrue();
      const good: string = repeatChar('c', 64);
      const key64: cryptoFramework.SymKey = await op.convertAesKey(good);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(key64 === null));
      expect(key64 === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyReal20008 end');
    });

    /**
     * @tc.name   testAesKeyReal20009
     * @tc.number SUB_CryptoFramework_AESKR2_0009
     * @tc.desc   an invalid 63 char blob makes convertAndDecrypt return null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyReal20009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyReal20009 begin');
      const op: CryptoOperation = new CryptoOperation();
      const good: string = repeatChar('c', 64);
      const json: string = await op.aesConvertAndEncrypt(good, 'payload');
      const bad: string = repeatChar('c', 63);
      const back: string = await op.aesConvertAndDecrypt(bad, json);
      const actResult: string = back;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(back === null));
      expect(back === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(json === null));
      expect(json === null).assertFalse();
      const backGood: string = await op.aesConvertAndDecrypt(good, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', backGood, 'payload');
      expect(backGood).assertEqual('payload');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyReal20009 end');
    });

    /**
     * @tc.name   testAesKeyReal20010
     * @tc.number SUB_CryptoFramework_AESKR2_0010
     * @tc.desc   convertAesKey rejects 62 chars and accepts 64 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyReal20010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyReal20010 begin');
      const op: CryptoOperation = new CryptoOperation();
      const bad: string = repeatChar('c', 62);
      const keyBad: cryptoFramework.SymKey = await op.convertAesKey(bad);
      const actResult: cryptoFramework.SymKey = keyBad;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(keyBad === null));
      expect(keyBad === null).assertTrue();
      const good: string = repeatChar('c', 64);
      const keyGood: cryptoFramework.SymKey = await op.convertAesKey(good);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(keyGood === null));
      expect(keyGood === null).assertFalse();
      const blob: string = await op.generateAesKey();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(blob.length), String(64));
      expect(blob.length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyReal20010 end');
    });

    /**
     * @tc.name   testAesKeyReal20011
     * @tc.number SUB_CryptoFramework_AESKR2_0011
     * @tc.desc   one converted key serves three sequential messages correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyReal20011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyReal20011 begin');
      const op: CryptoOperation = new CryptoOperation();
      const blob: string = await op.generateAesKey();
      const key: cryptoFramework.SymKey = await op.convertAesKey(blob);
      const t1: string = 'first message';
      const t2: string = 'second message';
      const t3: string = 'third message';
      const b1: string = await op.aesGcmDecrypt(key, await op.aesGcmEncrypt(key, t1));
      const b2: string = await op.aesGcmDecrypt(key, await op.aesGcmEncrypt(key, t2));
      const b3: string = await op.aesGcmDecrypt(key, await op.aesGcmEncrypt(key, t3));
      const actResult: string = b1;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', b1, t1);
      expect(b1).assertEqual(t1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', b2, t2);
      expect(b2).assertEqual(t2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', b3, t3);
      expect(b3).assertEqual(t3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyReal20011 end');
    });

    /**
     * @tc.name   testAesKeyReal20012
     * @tc.number SUB_CryptoFramework_AESKR2_0012
     * @tc.desc   an empty text is rejected by the encryption stage and decrypted back as empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyReal20012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyReal20012 begin');
      const op: CryptoOperation = new CryptoOperation();
      const blob: string = await op.generateAesKey();
      const json: string = await op.aesConvertAndEncrypt(blob, '');
      const actResult: string = json;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(json === null));
      expect(json === null).assertTrue();
      const back: string = await op.aesConvertAndDecrypt(blob, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', back, '');
      expect(back).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(back.length), String(0));
      expect(back.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyReal20012 end');
    });

    /**
     * @tc.name   testAesKeyReal20013
     * @tc.number SUB_CryptoFramework_AESKR2_0013
     * @tc.desc   a 200 char text survives the full conversion pipeline
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyReal20013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyReal20013 begin');
      const op: CryptoOperation = new CryptoOperation();
      const longText: string = repeatChar('k', 200);
      const blob: string = await op.generateAesKey();
      const json: string = await op.aesConvertAndEncrypt(blob, longText);
      const back: string = await op.aesConvertAndDecrypt(blob, json);
      const actResult: string = back;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(back === longText));
      expect(back === longText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(back.length), String(200));
      expect(back.length).assertEqual(200);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(json === null));
      expect(json === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyReal20013 end');
    });

    /**
     * @tc.name   testAesKeyReal20014
     * @tc.number SUB_CryptoFramework_AESKR2_0014
     * @tc.desc   latin1 letters inside the text come back unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyReal20014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyReal20014 begin');
      const op: CryptoOperation = new CryptoOperation();
      const text: string = 'caf\u00e9 \u00e4\u00f6\u00fc \u00df';
      const blob: string = await op.generateAesKey();
      const key: cryptoFramework.SymKey = await op.convertAesKey(blob);
      const json: string = await op.aesGcmEncrypt(key, text);
      const back: string = await op.aesGcmDecrypt(key, json);
      const actResult: string = back;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(back === text));
      expect(back === text).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(back.length), String(10));
      expect(back.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(allHex(blob)));
      expect(allHex(blob)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyReal20014 end');
    });

    /**
     * @tc.name   testAesKeyReal20015
     * @tc.number SUB_CryptoFramework_AESKR2_0015
     * @tc.desc   ciphertext from one key cannot be opened by another key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyReal20015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyReal20015 begin');
      const op: CryptoOperation = new CryptoOperation();
      const blobA: string = await op.generateAesKey();
      const blobB: string = await op.generateAesKey();
      const keyA: cryptoFramework.SymKey = await op.convertAesKey(blobA);
      const keyB: cryptoFramework.SymKey = await op.convertAesKey(blobB);
      const json: string = await op.aesGcmEncrypt(keyA, 'secret payload');
      const backB: string = await op.aesGcmDecrypt(keyB, json);
      const actResult: string = backB;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(backB === null));
      expect(backB === null).assertTrue();
      const backA: string = await op.aesGcmDecrypt(keyA, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', backA, 'secret payload');
      expect(backA).assertEqual('secret payload');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(backA.length), String(14));
      expect(backA.length).assertEqual(14);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyReal20015 end');
    });

    /**
     * @tc.name   testAesKeyReal20016
     * @tc.number SUB_CryptoFramework_AESKR2_0016
     * @tc.desc   flipping one ciphertext hex char makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyReal20016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyReal20016 begin');
      const op: CryptoOperation = new CryptoOperation();
      const blob: string = await op.generateAesKey();
      const key: cryptoFramework.SymKey = await op.convertAesKey(blob);
      const json: string = await op.aesGcmEncrypt(key, 'tamper probe');
      const ctStart: number = json.indexOf('encryptedText') + 16;
      const origChar: string = json.charAt(ctStart);
      const flipChar: string = origChar === '0' ? '1' : '0';
      const flipped: string = json.slice(0, ctStart) + flipChar + json.slice(ctStart + 1);
      const back: string = await op.aesGcmDecrypt(key, flipped);
      const actResult: string = back;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(back === null));
      expect(back === null).assertTrue();
      const backOk: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', backOk, 'tamper probe');
      expect(backOk).assertEqual('tamper probe');
      const parsed: AesJson = parseAes(json);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parsed.aesGcmTag.length), String(32));
      expect(parsed.aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyReal20016 end');
    });

    /**
     * @tc.name   testAesKeyReal20017
     * @tc.number SUB_CryptoFramework_AESKR2_0017
     * @tc.desc   generated key pipeline keeps the tag hex and doubles ciphertext size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyReal20017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyReal20017 begin');
      const op: CryptoOperation = new CryptoOperation();
      const blob: string = await op.generateAesKey();
      const key: cryptoFramework.SymKey = await op.convertAesKey(blob);
      const json: string = await op.aesGcmEncrypt(key, 'structure probe');
      const parsed: AesJson = parseAes(json);
      const actResult: AesJson = parsed;
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parsed.aesGcmTag.length), String(32));
      expect(parsed.aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parsed.encryptedText.length), String(30));
      expect(parsed.encryptedText.length).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(allHex(parsed.aesGcmTag)));
      expect(allHex(parsed.aesGcmTag)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyReal20017 end');
    });

    /**
     * @tc.name   testAesKeyReal20018
     * @tc.number SUB_CryptoFramework_AESKR2_0018
     * @tc.desc   an empty blob makes convertAesKey throw and a blank blob is rejected with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesKeyReal20018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyReal20018 begin');
      const op: CryptoOperation = new CryptoOperation();
      let thrownEmpty: boolean = false;
      try {
        await op.convertAesKey('');
      } catch (e) {
        thrownEmpty = true;
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(thrownEmpty));
      expect(thrownEmpty).assertTrue();
      const keyBlank: cryptoFramework.SymKey = await op.convertAesKey('  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(keyBlank === null));
      expect(keyBlank === null).assertTrue();
      const blob: string = await op.generateAesKey();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(blob.length), String(64));
      expect(blob.length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesKeyReal20018 end');
    });

  });
}
