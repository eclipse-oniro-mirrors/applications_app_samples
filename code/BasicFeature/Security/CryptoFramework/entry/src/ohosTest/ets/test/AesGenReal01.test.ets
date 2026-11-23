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

export default function aesGenReal1Test() {
  describe('AesGenReal1', () => {

    /**
     * @tc.name   testAesGenReal10001
     * @tc.number SUB_CryptoFramework_AESGN1_0001
     * @tc.desc   a generated key blob always has 64 characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGenReal10001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGenReal10001 begin');
      const op: CryptoOperation = new CryptoOperation();
      const blob: string = await op.generateAesKey();
      const actResult: string = blob;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(blob.length), String(64));
      expect(blob.length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(blob !== ''));
      expect(blob !== '').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(blob.indexOf(' ') < 0));
      expect(blob.indexOf(' ') < 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGenReal10001 end');
    });

    /**
     * @tc.name   testAesGenReal10002
     * @tc.number SUB_CryptoFramework_AESGN1_0002
     * @tc.desc   every character of a generated blob is a hex digit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGenReal10002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGenReal10002 begin');
      const op: CryptoOperation = new CryptoOperation();
      const blob: string = await op.generateAesKey();
      const actResult: string = blob;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(allHex(blob)));
      expect(allHex(blob)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(allHex(blob.toLowerCase())));
      expect(allHex(blob.toLowerCase())).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(blob.length), String(64));
      expect(blob.length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGenReal10002 end');
    });

    /**
     * @tc.name   testAesGenReal10003
     * @tc.number SUB_CryptoFramework_AESGN1_0003
     * @tc.desc   two generated blobs are different from each other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGenReal10003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGenReal10003 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGenReal10003 end');
    });

    /**
     * @tc.name   testAesGenReal10004
     * @tc.number SUB_CryptoFramework_AESGN1_0004
     * @tc.desc   a generated blob converts into a usable key object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGenReal10004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGenReal10004 begin');
      const op: CryptoOperation = new CryptoOperation();
      const blob: string = await op.generateAesKey();
      const key: cryptoFramework.SymKey = await op.convertAesKey(blob);
      const actResult: cryptoFramework.SymKey = key;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(key === null));
      expect(key === null).assertFalse();
      const json: string = await op.aesGcmEncrypt(key, 'usable key check');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(json === null));
      expect(json === null).assertFalse();
      const back: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', back, 'usable key check');
      expect(back).assertEqual('usable key check');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGenReal10004 end');
    });

    /**
     * @tc.name   testAesGenReal10005
     * @tc.number SUB_CryptoFramework_AESGN1_0005
     * @tc.desc   generate, convert, encrypt and decrypt restore the text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGenReal10005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGenReal10005 begin');
      const op: CryptoOperation = new CryptoOperation();
      const blob: string = await op.generateAesKey();
      const key: cryptoFramework.SymKey = await op.convertAesKey(blob);
      const json: string = await op.aesGcmEncrypt(key, 'pipeline probe');
      const back: string = await op.aesGcmDecrypt(key, json);
      const actResult: string = back;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', back, 'pipeline probe');
      expect(back).assertEqual('pipeline probe');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(back.length), String(14));
      expect(back.length).assertEqual(14);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(json).aesGcmTag.length), String(32));
      expect(parseAes(json).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGenReal10005 end');
    });

    /**
     * @tc.name   testAesGenReal10006
     * @tc.number SUB_CryptoFramework_AESGN1_0006
     * @tc.desc   a generated blob works with the convertAndEncrypt shortcut
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGenReal10006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGenReal10006 begin');
      const op: CryptoOperation = new CryptoOperation();
      const blob: string = await op.generateAesKey();
      const json: string = await op.aesConvertAndEncrypt(blob, 'shortcut text');
      const actResult: string = json;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(json === null));
      expect(json === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(json.indexOf('encryptedText') >= 0));
      expect(json.indexOf('encryptedText') >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(json).encryptedText.length), String(26));
      expect(parseAes(json).encryptedText.length).assertEqual(26);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGenReal10006 end');
    });

    /**
     * @tc.name   testAesGenReal10007
     * @tc.number SUB_CryptoFramework_AESGN1_0007
     * @tc.desc   the convertAndDecrypt shortcut restores a generated blob ciphertext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGenReal10007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGenReal10007 begin');
      const op: CryptoOperation = new CryptoOperation();
      const blob: string = await op.generateAesKey();
      const json: string = await op.aesConvertAndEncrypt(blob, 'decrypt shortcut');
      const back: string = await op.aesConvertAndDecrypt(blob, json);
      const actResult: string = back;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', back, 'decrypt shortcut');
      expect(back).assertEqual('decrypt shortcut');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(back.length), String(16));
      expect(back.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(back.indexOf(' ') >= 0));
      expect(back.indexOf(' ') >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGenReal10007 end');
    });

    /**
     * @tc.name   testAesGenReal10008
     * @tc.number SUB_CryptoFramework_AESGN1_0008
     * @tc.desc   one generated blob serves three distinct texts in sequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGenReal10008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGenReal10008 begin');
      const op: CryptoOperation = new CryptoOperation();
      const blob: string = await op.generateAesKey();
      const textA: string = 'alpha payload';
      const textB: string = 'beta payload';
      const textC: string = 'gamma payload';
      const backA: string = await op.aesConvertAndDecrypt(blob, await op.aesConvertAndEncrypt(blob, textA));
      const backB: string = await op.aesConvertAndDecrypt(blob, await op.aesConvertAndEncrypt(blob, textB));
      const backC: string = await op.aesConvertAndDecrypt(blob, await op.aesConvertAndEncrypt(blob, textC));
      const actResult: string = backA;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', backA, textA);
      expect(backA).assertEqual(textA);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', backB, textB);
      expect(backB).assertEqual(textB);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', backC, textC);
      expect(backC).assertEqual(textC);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGenReal10008 end');
    });

    /**
     * @tc.name   testAesGenReal10009
     * @tc.number SUB_CryptoFramework_AESGN1_0009
     * @tc.desc   converting one generated blob twice yields two usable keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGenReal10009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGenReal10009 begin');
      const op: CryptoOperation = new CryptoOperation();
      const blob: string = await op.generateAesKey();
      const keyA: cryptoFramework.SymKey = await op.convertAesKey(blob);
      const keyB: cryptoFramework.SymKey = await op.convertAesKey(blob);
      const actResult: cryptoFramework.SymKey = keyA;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(keyA === null || keyB === null));
      expect(keyA === null || keyB === null).assertFalse();
      const json: string = await op.aesGcmEncrypt(keyA, 'double convert');
      const back: string = await op.aesGcmDecrypt(keyB, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', back, 'double convert');
      expect(back).assertEqual('double convert');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(back.length), String(14));
      expect(back.length).assertEqual(14);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGenReal10009 end');
    });

    /**
     * @tc.name   testAesGenReal10010
     * @tc.number SUB_CryptoFramework_AESGN1_0010
     * @tc.desc   ciphertext from the first generated blob fails under the second
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGenReal10010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGenReal10010 begin');
      const op: CryptoOperation = new CryptoOperation();
      const blobA: string = await op.generateAesKey();
      const blobB: string = await op.generateAesKey();
      const keyA: cryptoFramework.SymKey = await op.convertAesKey(blobA);
      const keyB: cryptoFramework.SymKey = await op.convertAesKey(blobB);
      const json: string = await op.aesGcmEncrypt(keyA, 'cross blob probe');
      const backB: string = await op.aesGcmDecrypt(keyB, json);
      const actResult: string = backB;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(backB === null));
      expect(backB === null).assertTrue();
      const backA: string = await op.aesGcmDecrypt(keyA, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', backA, 'cross blob probe');
      expect(backA).assertEqual('cross blob probe');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(blobA !== blobB));
      expect(blobA !== blobB).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGenReal10010 end');
    });

    /**
     * @tc.name   testAesGenReal10011
     * @tc.number SUB_CryptoFramework_AESGN1_0011
     * @tc.desc   an empty text is rejected by the generated blob encryption and decrypted as empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGenReal10011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGenReal10011 begin');
      const op: CryptoOperation = new CryptoOperation();
      const blob: string = await op.generateAesKey();
      const json: string = await op.aesConvertAndEncrypt(blob, '');
      const back: string = await op.aesConvertAndDecrypt(blob, json);
      const actResult: string = back;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(json === null));
      expect(json === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', back, '');
      expect(back).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(back.length), String(0));
      expect(back.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGenReal10011 end');
    });

    /**
     * @tc.name   testAesGenReal10012
     * @tc.number SUB_CryptoFramework_AESGN1_0012
     * @tc.desc   a 300 char text roundtrips through a generated blob pipeline
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGenReal10012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGenReal10012 begin');
      const op: CryptoOperation = new CryptoOperation();
      const blob: string = await op.generateAesKey();
      const text: string = repeatChar('w', 300);
      const json: string = await op.aesConvertAndEncrypt(blob, text);
      const back: string = await op.aesConvertAndDecrypt(blob, json);
      const actResult: string = back;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(back === text));
      expect(back === text).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(back.length), String(300));
      expect(back.length).assertEqual(300);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(json).encryptedText.length), String(600));
      expect(parseAes(json).encryptedText.length).assertEqual(600);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGenReal10012 end');
    });

    /**
     * @tc.name   testAesGenReal10013
     * @tc.number SUB_CryptoFramework_AESGN1_0013
     * @tc.desc   newline characters survive a generated blob pipeline
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGenReal10013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGenReal10013 begin');
      const op: CryptoOperation = new CryptoOperation();
      const blob: string = await op.generateAesKey();
      const text: string = 'first row\nsecond row\nthird row';
      const json: string = await op.aesConvertAndEncrypt(blob, text);
      const back: string = await op.aesConvertAndDecrypt(blob, json);
      const actResult: string = back;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(back === text));
      expect(back === text).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(back.length), String(30));
      expect(back.length).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(back.indexOf('\n') >= 0));
      expect(back.indexOf('\n') >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGenReal10013 end');
    });

    /**
     * @tc.name   testAesGenReal10014
     * @tc.number SUB_CryptoFramework_AESGN1_0014
     * @tc.desc   generated blob ciphertext keeps a 32 char tag and hex ciphertext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGenReal10014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGenReal10014 begin');
      const op: CryptoOperation = new CryptoOperation();
      const blob: string = await op.generateAesKey();
      const json: string = await op.aesConvertAndEncrypt(blob, 'structure check');
      const parsed: AesJson = parseAes(json);
      const actResult: AesJson = parsed;
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parsed.aesGcmTag.length), String(32));
      expect(parsed.aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(allHex(parsed.aesGcmTag)));
      expect(allHex(parsed.aesGcmTag)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(allHex(parsed.encryptedText)));
      expect(allHex(parsed.encryptedText)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGenReal10014 end');
    });

    /**
     * @tc.name   testAesGenReal10015
     * @tc.number SUB_CryptoFramework_AESGN1_0015
     * @tc.desc   a 41 char text produces an 82 char ciphertext under a generated key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGenReal10015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGenReal10015 begin');
      const op: CryptoOperation = new CryptoOperation();
      const blob: string = await op.generateAesKey();
      const key: cryptoFramework.SymKey = await op.convertAesKey(blob);
      const text: string = repeatChar('q', 41);
      const json: string = await op.aesGcmEncrypt(key, text);
      const parsed: AesJson = parseAes(json);
      const actResult: AesJson = parsed;
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parsed.encryptedText.length), String(82));
      expect(parsed.encryptedText.length).assertEqual(82);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parsed.aesGcmTag.length), String(32));
      expect(parsed.aesGcmTag.length).assertEqual(32);
      const back: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(back.length), String(41));
      expect(back.length).assertEqual(41);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGenReal10015 end');
    });

    /**
     * @tc.name   testAesGenReal10016
     * @tc.number SUB_CryptoFramework_AESGN1_0016
     * @tc.desc   three consecutive generated blobs are pairwise distinct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesGenReal10016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGenReal10016 begin');
      const op: CryptoOperation = new CryptoOperation();
      const blobA: string = await op.generateAesKey();
      const blobB: string = await op.generateAesKey();
      const blobC: string = await op.generateAesKey();
      const actResult: string = blobA;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(blobA !== blobB));
      expect(blobA !== blobB).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(blobB !== blobC));
      expect(blobB !== blobC).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(blobA !== blobC));
      expect(blobA !== blobC).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesGenReal10016 end');
    });

  });
}
