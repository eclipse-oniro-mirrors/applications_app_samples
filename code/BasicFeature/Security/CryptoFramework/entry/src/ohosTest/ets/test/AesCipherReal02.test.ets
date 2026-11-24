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

export default function aesCipherReal2Test() {
  describe('AesCipherReal2', () => {

    /**
     * @tc.name   testAesCipherReal20001
     * @tc.number SUB_CryptoFramework_AESCP2_0001
     * @tc.desc   encrypted JSON carries both the tag and ciphertext fields
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCipherReal20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCipherReal20001 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(repeatChar('c', 64));
      const json: string = await op.aesGcmEncrypt(key, 'field probe');
      const actResult: string = json;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(json.indexOf('aesGcmTag') >= 0));
      expect(json.indexOf('aesGcmTag') >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(json.indexOf('encryptedText') >= 0));
      expect(json.indexOf('encryptedText') >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'value=%{public}s', String(json.indexOf('aesGcmTag') < json.indexOf('encryptedText')));
      expect(json.indexOf('aesGcmTag') < json.indexOf('encryptedText')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCipherReal20001 end');
    });

    /**
     * @tc.name   testAesCipherReal20002
     * @tc.number SUB_CryptoFramework_AESCP2_0002
     * @tc.desc   the auth tag is exactly 32 hex characters long
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCipherReal20002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCipherReal20002 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(repeatChar('c', 64));
      const json: string = await op.aesGcmEncrypt(key, 'tag probe');
      const parsed: AesJson = parseAes(json);
      const actResult: AesJson = parsed;
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parsed.aesGcmTag.length), String(32));
      expect(parsed.aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(allHex(parsed.aesGcmTag)));
      expect(allHex(parsed.aesGcmTag)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parsed.encryptedText.length > 0));
      expect(parsed.encryptedText.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCipherReal20002 end');
    });

    /**
     * @tc.name   testAesCipherReal20003
     * @tc.number SUB_CryptoFramework_AESCP2_0003
     * @tc.desc   ciphertext hex is twice the plaintext length and all hex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCipherReal20003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCipherReal20003 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(repeatChar('c', 64));
      const json: string = await op.aesGcmEncrypt(key, 'length probe');
      const parsed: AesJson = parseAes(json);
      const actResult: AesJson = parsed;
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parsed.encryptedText.length), String(24));
      expect(parsed.encryptedText.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(allHex(parsed.encryptedText)));
      expect(allHex(parsed.encryptedText)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parsed.aesGcmTag.length), String(32));
      expect(parsed.aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCipherReal20003 end');
    });

    /**
     * @tc.name   testAesCipherReal20004
     * @tc.number SUB_CryptoFramework_AESCP2_0004
     * @tc.desc   two encryptions of the same text with the same key produce identical ciphertexts (fixed IV)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCipherReal20004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCipherReal20004 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(repeatChar('c', 64));
      const jsonA: string = await op.aesGcmEncrypt(key, 'iv probe text');
      const jsonB: string = await op.aesGcmEncrypt(key, 'iv probe text');
      const actResult: string = jsonA;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(jsonA === jsonB));
      expect(jsonA === jsonB).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(jsonA === null || jsonB === null));
      expect(jsonA === null || jsonB === null).assertFalse();
      const backA: string = await op.aesGcmDecrypt(key, jsonA);
      const backB: string = await op.aesGcmDecrypt(key, jsonB);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(backA === backB));
      expect(backA === backB).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCipherReal20004 end');
    });

    /**
     * @tc.name   testAesCipherReal20005
     * @tc.number SUB_CryptoFramework_AESCP2_0005
     * @tc.desc   both fresh encryptions decrypt back to the same plaintext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCipherReal20005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCipherReal20005 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(repeatChar('c', 64));
      const jsonA: string = await op.aesGcmEncrypt(key, 'same plain');
      const jsonB: string = await op.aesGcmEncrypt(key, 'same plain');
      const backA: string = await op.aesGcmDecrypt(key, jsonA);
      const backB: string = await op.aesGcmDecrypt(key, jsonB);
      const actResult: string = backA;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', backA, 'same plain');
      expect(backA).assertEqual('same plain');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', backB, 'same plain');
      expect(backB).assertEqual('same plain');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(backA.length), String(10));
      expect(backA.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCipherReal20005 end');
    });

    /**
     * @tc.name   testAesCipherReal20006
     * @tc.number SUB_CryptoFramework_AESCP2_0006
     * @tc.desc   tags of two encryptions of the same text with the same key are identical (fixed IV)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCipherReal20006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCipherReal20006 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(repeatChar('c', 64));
      const jsonA: string = await op.aesGcmEncrypt(key, 'tag difference');
      const jsonB: string = await op.aesGcmEncrypt(key, 'tag difference');
      const tagA: string = parseAes(jsonA).aesGcmTag;
      const tagB: string = parseAes(jsonB).aesGcmTag;
      const actResult: string = tagA;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tagA === tagB));
      expect(tagA === tagB).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tagA.length), String(32));
      expect(tagA.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tagB.length), String(32));
      expect(tagB.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCipherReal20006 end');
    });

    /**
     * @tc.name   testAesCipherReal20007
     * @tc.number SUB_CryptoFramework_AESCP2_0007
     * @tc.desc   a 128 char ascii text roundtrips through encryption
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCipherReal20007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCipherReal20007 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(repeatChar('c', 64));
      const text: string = repeatChar('ascii probe ', 11).slice(0, 128);
      const json: string = await op.aesGcmEncrypt(key, text);
      const back: string = await op.aesGcmDecrypt(key, json);
      const actResult: string = back;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(back === text));
      expect(back === text).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(back.length), String(128));
      expect(back.length).assertEqual(128);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(json).encryptedText.length), String(256));
      expect(parseAes(json).encryptedText.length).assertEqual(256);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCipherReal20007 end');
    });

    /**
     * @tc.name   testAesCipherReal20008
     * @tc.number SUB_CryptoFramework_AESCP2_0008
     * @tc.desc   a text full of symbols roundtrips through encryption
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCipherReal20008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCipherReal20008 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(repeatChar('c', 64));
      const text: string = '!@#$%^&*()_+-=[]{}|;:,.<>?/~`';
      const json: string = await op.aesGcmEncrypt(key, text);
      const back: string = await op.aesGcmDecrypt(key, json);
      const actResult: string = back;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(back === text));
      expect(back === text).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(back.length), String(29));
      expect(back.length).assertEqual(29);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(json).encryptedText.length), String(58));
      expect(parseAes(json).encryptedText.length).assertEqual(58);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCipherReal20008 end');
    });

    /**
     * @tc.name   testAesCipherReal20009
     * @tc.number SUB_CryptoFramework_AESCP2_0009
     * @tc.desc   a numeric text roundtrips through encryption
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCipherReal20009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCipherReal20009 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(repeatChar('c', 64));
      const text: string = repeatChar('0123456789', 6);
      const json: string = await op.aesGcmEncrypt(key, text);
      const back: string = await op.aesGcmDecrypt(key, json);
      const actResult: string = back;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(back === text));
      expect(back === text).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(back.length), String(60));
      expect(back.length).assertEqual(60);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(json).encryptedText.length), String(120));
      expect(parseAes(json).encryptedText.length).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCipherReal20009 end');
    });

    /**
     * @tc.name   testAesCipherReal20010
     * @tc.number SUB_CryptoFramework_AESCP2_0010
     * @tc.desc   a text with spaces and newlines roundtrips through encryption
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCipherReal20010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCipherReal20010 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(repeatChar('c', 64));
      const text: string = 'line one\nline two\n\tindented';
      const json: string = await op.aesGcmEncrypt(key, text);
      const back: string = await op.aesGcmDecrypt(key, json);
      const actResult: string = back;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(back === text));
      expect(back === text).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(back.length), String(27));
      expect(back.length).assertEqual(27);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(json).encryptedText.length), String(54));
      expect(parseAes(json).encryptedText.length).assertEqual(54);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCipherReal20010 end');
    });

    /**
     * @tc.name   testAesCipherReal20011
     * @tc.number SUB_CryptoFramework_AESCP2_0011
     * @tc.desc   interleaved encrypt and decrypt calls keep three messages intact
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCipherReal20011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCipherReal20011 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(repeatChar('c', 64));
      const j1: string = await op.aesGcmEncrypt(key, 'message one');
      const j2: string = await op.aesGcmEncrypt(key, 'message two');
      const b1: string = await op.aesGcmDecrypt(key, j1);
      const j3: string = await op.aesGcmEncrypt(key, 'message three');
      const b2: string = await op.aesGcmDecrypt(key, j2);
      const b3: string = await op.aesGcmDecrypt(key, j3);
      const actResult: string = b1;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', b1, 'message one');
      expect(b1).assertEqual('message one');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', b2, 'message two');
      expect(b2).assertEqual('message two');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', b3, 'message three');
      expect(b3).assertEqual('message three');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCipherReal20011 end');
    });

    /**
     * @tc.name   testAesCipherReal20012
     * @tc.number SUB_CryptoFramework_AESCP2_0012
     * @tc.desc   flipping one tag hex char makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCipherReal20012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCipherReal20012 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(repeatChar('c', 64));
      const json: string = await op.aesGcmEncrypt(key, 'tamper the tag');
      const flippedChar: string = json.charAt(14) === '0' ? '1' : '0';
      const tampered: string = json.slice(0, 14) + flippedChar + json.slice(15);
      const back: string = await op.aesGcmDecrypt(key, tampered);
      const actResult: string = back;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(back === null));
      expect(back === null).assertTrue();
      const backOk: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', backOk, 'tamper the tag');
      expect(backOk).assertEqual('tamper the tag');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(json).aesGcmTag.length), String(32));
      expect(parseAes(json).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCipherReal20012 end');
    });

    /**
     * @tc.name   testAesCipherReal20013
     * @tc.number SUB_CryptoFramework_AESCP2_0013
     * @tc.desc   flipping one ciphertext hex char makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCipherReal20013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCipherReal20013 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(repeatChar('c', 64));
      const json: string = await op.aesGcmEncrypt(key, 'tamper the body');
      const ctStart: number = json.indexOf('encryptedText') + 16;
      const flipped: string = json.slice(0, ctStart) + '0' + json.slice(ctStart + 1);
      const back: string = await op.aesGcmDecrypt(key, flipped);
      const actResult: string = back;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(back === null));
      expect(back === null).assertTrue();
      const backOk: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', backOk, 'tamper the body');
      expect(backOk).assertEqual('tamper the body');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(json).encryptedText.length), String(30));
      expect(parseAes(json).encryptedText.length).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCipherReal20013 end');
    });

    /**
     * @tc.name   testAesCipherReal20014
     * @tc.number SUB_CryptoFramework_AESCP2_0014
     * @tc.desc   removing two ciphertext hex chars makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCipherReal20014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCipherReal20014 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(repeatChar('c', 64));
      const json: string = await op.aesGcmEncrypt(key, 'truncate probe');
      const cut: string = json.slice(0, json.length - 3) + '}';
      const back: string = await op.aesGcmDecrypt(key, cut);
      const actResult: string = back;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(back === null));
      expect(back === null).assertTrue();
      const backOk: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', backOk, 'truncate probe');
      expect(backOk).assertEqual('truncate probe');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(json).encryptedText.length), String(28));
      expect(parseAes(json).encryptedText.length).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCipherReal20014 end');
    });

    /**
     * @tc.name   testAesCipherReal20015
     * @tc.number SUB_CryptoFramework_AESCP2_0015
     * @tc.desc   appending two ciphertext hex chars makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCipherReal20015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCipherReal20015 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(repeatChar('c', 64));
      const json: string = await op.aesGcmEncrypt(key, 'extend probe');
      const plus: string = json.slice(0, json.length - 1) + '00}';
      const back: string = await op.aesGcmDecrypt(key, plus);
      const actResult: string = back;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(back === null));
      expect(back === null).assertTrue();
      const backOk: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', backOk, 'extend probe');
      expect(backOk).assertEqual('extend probe');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(json).encryptedText.length), String(24));
      expect(parseAes(json).encryptedText.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCipherReal20015 end');
    });

    /**
     * @tc.name   testAesCipherReal20016
     * @tc.number SUB_CryptoFramework_AESCP2_0016
     * @tc.desc   a JSON with only the tag field cannot be decrypted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCipherReal20016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCipherReal20016 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(repeatChar('c', 64));
      const json: string = await op.aesGcmEncrypt(key, 'full roundtrip');
      const tagOnly: string = '{"aesGcmTag":"' + parseAes(json).aesGcmTag + '"}';
      let thrown: boolean = false;
      try {
        await op.aesGcmDecrypt(key, tagOnly);
      } catch (e) {
        thrown = true;
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(thrown));
      expect(thrown).assertTrue();
      const backOk: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', backOk, 'full roundtrip');
      expect(backOk).assertEqual('full roundtrip');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tagOnly.length), String(48));
      expect(tagOnly.length).assertEqual(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCipherReal20016 end');
    });

    /**
     * @tc.name   testAesCipherReal20017
     * @tc.number SUB_CryptoFramework_AESCP2_0017
     * @tc.desc   an empty input cannot be decrypted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCipherReal20017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCipherReal20017 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(repeatChar('c', 64));
      const back: string = await op.aesGcmDecrypt(key, '');
      const actResult: string = back;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(back === null));
      expect(back === null).assertTrue();
      const json: string = await op.aesGcmEncrypt(key, 'control text');
      const backOk: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', backOk, 'control text');
      expect(backOk).assertEqual('control text');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(json.length > 0));
      expect(json.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCipherReal20017 end');
    });

    /**
     * @tc.name   testAesCipherReal20018
     * @tc.number SUB_CryptoFramework_AESCP2_0018
     * @tc.desc   a plain non-JSON string cannot be decrypted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCipherReal20018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCipherReal20018 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(repeatChar('c', 64));
      const back: string = await op.aesGcmDecrypt(key, 'not a json string');
      const actResult: string = back;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(back === null));
      expect(back === null).assertTrue();
      const json: string = await op.aesGcmEncrypt(key, 'anchor control');
      const backOk: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', backOk, 'anchor control');
      expect(backOk).assertEqual('anchor control');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(json).aesGcmTag.length), String(32));
      expect(parseAes(json).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCipherReal20018 end');
    });

  });
}
