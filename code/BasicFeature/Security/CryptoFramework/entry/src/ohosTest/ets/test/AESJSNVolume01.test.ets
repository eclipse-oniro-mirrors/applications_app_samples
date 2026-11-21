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
function parseAes(s: string): AesJson { return JSON.parse(s) as AesJson; }
function repeatChar(ch: string, count: number): string {
  let ret: string = '';
  for (let i = 0; i < count; i++) {
    ret += ch;
  }
  return ret;
}
const GOOD_AES: string = 'c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_CryptoFramework]';

export default function aesJsonVolume01Test() {
  describe('AesJsonVolume01', () => {

    /**
     * @tc.name   testAesJsonVolume010001
     * @tc.number SUB_CryptoFramework_AESJSN_01_0001
     * @tc.desc   the untouched ciphertext roundtrips to the original plaintext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010001 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = encJson;
      const result: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('json probe'));
      expect(result).assertEqual('json probe');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'json probe'));
      expect(result === 'json probe').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010001 end');
    });

    /**
     * @tc.name   testAesJsonVolume010002
     * @tc.number SUB_CryptoFramework_AESJSN_01_0002
     * @tc.desc   a leading space before the JSON still decrypts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010002 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = ' ' + encJson;
      const result: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('json probe'));
      expect(result).assertEqual('json probe');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'json probe'));
      expect(result === 'json probe').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010002 end');
    });

    /**
     * @tc.name   testAesJsonVolume010003
     * @tc.number SUB_CryptoFramework_AESJSN_01_0003
     * @tc.desc   a trailing space after the JSON still decrypts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010003 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = encJson + ' ';
      const result: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('json probe'));
      expect(result).assertEqual('json probe');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'json probe'));
      expect(result === 'json probe').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010003 end');
    });

    /**
     * @tc.name   testAesJsonVolume010004
     * @tc.number SUB_CryptoFramework_AESJSN_01_0004
     * @tc.desc   a leading tab before the JSON still decrypts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010004 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = '\t' + encJson;
      const result: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('json probe'));
      expect(result).assertEqual('json probe');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'json probe'));
      expect(result === 'json probe').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010004 end');
    });

    /**
     * @tc.name   testAesJsonVolume010005
     * @tc.number SUB_CryptoFramework_AESJSN_01_0005
     * @tc.desc   a trailing newline after the JSON still decrypts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010005 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = encJson + '\n';
      const result: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('json probe'));
      expect(result).assertEqual('json probe');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'json probe'));
      expect(result === 'json probe').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010005 end');
    });

    /**
     * @tc.name   testAesJsonVolume010006
     * @tc.number SUB_CryptoFramework_AESJSN_01_0006
     * @tc.desc   newlines on both sides of the JSON still decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010006 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = '\n' + encJson + '\n';
      const result: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('json probe'));
      expect(result).assertEqual('json probe');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'json probe'));
      expect(result === 'json probe').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010006 end');
    });

    /**
     * @tc.name   testAesJsonVolume010007
     * @tc.number SUB_CryptoFramework_AESJSN_01_0007
     * @tc.desc   blank runs on both sides of the JSON still decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010007 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = '    ' + encJson + '  ';
      const result: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('json probe'));
      expect(result).assertEqual('json probe');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'json probe'));
      expect(result === 'json probe').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010007 end');
    });

    /**
     * @tc.name   testAesJsonVolume010008
     * @tc.number SUB_CryptoFramework_AESJSN_01_0008
     * @tc.desc   a carriage return newline before the JSON still decrypts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010008 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = '\r\n' + encJson;
      const result: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('json probe'));
      expect(result).assertEqual('json probe');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'json probe'));
      expect(result === 'json probe').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010008 end');
    });

    /**
     * @tc.name   testAesJsonVolume010009
     * @tc.number SUB_CryptoFramework_AESJSN_01_0009
     * @tc.desc   a trailing tab after the JSON still decrypts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010009 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = encJson + '\t';
      const result: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('json probe'));
      expect(result).assertEqual('json probe');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'json probe'));
      expect(result === 'json probe').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010009 end');
    });

    /**
     * @tc.name   testAesJsonVolume010010
     * @tc.number SUB_CryptoFramework_AESJSN_01_0010
     * @tc.desc   a trailing carriage return after the JSON still decrypts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010010 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = encJson + '\r';
      const result: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('json probe'));
      expect(result).assertEqual('json probe');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'json probe'));
      expect(result === 'json probe').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010010 end');
    });

    /**
     * @tc.name   testAesJsonVolume010011
     * @tc.number SUB_CryptoFramework_AESJSN_01_0011
     * @tc.desc   two trailing newlines after the JSON still decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010011 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = encJson + '\n\n';
      const result: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('json probe'));
      expect(result).assertEqual('json probe');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'json probe'));
      expect(result === 'json probe').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010011 end');
    });

    /**
     * @tc.name   testAesJsonVolume010012
     * @tc.number SUB_CryptoFramework_AESJSN_01_0012
     * @tc.desc   swapping the field order of the JSON still decrypts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010012 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = '{"encryptedText":"' + ctPart + '","aesGcmTag":"' + tagPart + '"}';
      const result: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('json probe'));
      expect(result).assertEqual('json probe');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'json probe'));
      expect(result === 'json probe').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010012 end');
    });

    /**
     * @tc.name   testAesJsonVolume010013
     * @tc.number SUB_CryptoFramework_AESJSN_01_0013
     * @tc.desc   an extra string field in the JSON still decrypts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010013 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = encJson.slice(0, encJson.length - 1) + ',"extra":"x"}';
      const result: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('json probe'));
      expect(result).assertEqual('json probe');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'json probe'));
      expect(result === 'json probe').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010013 end');
    });

    /**
     * @tc.name   testAesJsonVolume010014
     * @tc.number SUB_CryptoFramework_AESJSN_01_0014
     * @tc.desc   an extra numeric field in the JSON still decrypts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010014 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = encJson.slice(0, encJson.length - 1) + ',"num":7}';
      const result: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('json probe'));
      expect(result).assertEqual('json probe');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'json probe'));
      expect(result === 'json probe').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010014 end');
    });

    /**
     * @tc.name   testAesJsonVolume010015
     * @tc.number SUB_CryptoFramework_AESJSN_01_0015
     * @tc.desc   an extra boolean field in the JSON still decrypts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010015 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = encJson.slice(0, encJson.length - 1) + ',"ok":true}';
      const result: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('json probe'));
      expect(result).assertEqual('json probe');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'json probe'));
      expect(result === 'json probe').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010015 end');
    });

    /**
     * @tc.name   testAesJsonVolume010016
     * @tc.number SUB_CryptoFramework_AESJSN_01_0016
     * @tc.desc   an extra null field in the JSON still decrypts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010016 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = encJson.slice(0, encJson.length - 1) + ',"none":null}';
      const result: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('json probe'));
      expect(result).assertEqual('json probe');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'json probe'));
      expect(result === 'json probe').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010016 end');
    });

    /**
     * @tc.name   testAesJsonVolume010017
     * @tc.number SUB_CryptoFramework_AESJSN_01_0017
     * @tc.desc   two extra fields in the JSON still decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010017 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = encJson.slice(0, encJson.length - 1) + ',"a":1,"b":2}';
      const result: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('json probe'));
      expect(result).assertEqual('json probe');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'json probe'));
      expect(result === 'json probe').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010017 end');
    });

    /**
     * @tc.name   testAesJsonVolume010018
     * @tc.number SUB_CryptoFramework_AESJSN_01_0018
     * @tc.desc   a nested extra object in the JSON still decrypts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010018 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = encJson.slice(0, encJson.length - 1) + ',"nested":{"k":"v"}}';
      const result: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('json probe'));
      expect(result).assertEqual('json probe');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'json probe'));
      expect(result === 'json probe').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010018 end');
    });

    /**
     * @tc.name   testAesJsonVolume010019
     * @tc.number SUB_CryptoFramework_AESJSN_01_0019
     * @tc.desc   reordered fields with an extra field still decrypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010019 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = '{"encryptedText":"' + ctPart + '","aesGcmTag":"' + tagPart + '","extra":true}';
      const result: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('json probe'));
      expect(result).assertEqual('json probe');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'json probe'));
      expect(result === 'json probe').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010019 end');
    });

    /**
     * @tc.name   testAesJsonVolume010020
     * @tc.number SUB_CryptoFramework_AESJSN_01_0020
     * @tc.desc   single quoted keys make decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010020 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = encJson.split('"').join('\'');
      const result: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'json probe'));
      expect(result === 'json probe').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('null'));
      expect(String(result)).assertEqual('null');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010020 end');
    });

    /**
     * @tc.name   testAesJsonVolume010021
     * @tc.number SUB_CryptoFramework_AESJSN_01_0021
     * @tc.desc   a missing closing brace makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010021 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = encJson.slice(0, encJson.length - 1);
      const result: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'json probe'));
      expect(result === 'json probe').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('null'));
      expect(String(result)).assertEqual('null');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010021 end');
    });

    /**
     * @tc.name   testAesJsonVolume010022
     * @tc.number SUB_CryptoFramework_AESJSN_01_0022
     * @tc.desc   a trailing comma before the brace makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010022 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = encJson.slice(0, encJson.length - 1) + ',}';
      const result: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'json probe'));
      expect(result === 'json probe').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('null'));
      expect(String(result)).assertEqual('null');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010022 end');
    });

    /**
     * @tc.name   testAesJsonVolume010023
     * @tc.number SUB_CryptoFramework_AESJSN_01_0023
     * @tc.desc   a missing opening brace makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010023 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = encJson.slice(1);
      const result: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'json probe'));
      expect(result === 'json probe').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('null'));
      expect(String(result)).assertEqual('null');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010023 end');
    });

    /**
     * @tc.name   testAesJsonVolume010024
     * @tc.number SUB_CryptoFramework_AESJSN_01_0024
     * @tc.desc   a missing closing quote makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010024 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = encJson.slice(0, encJson.length - 2) + '}';
      const result: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'json probe'));
      expect(result === 'json probe').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('null'));
      expect(String(result)).assertEqual('null');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010024 end');
    });

    /**
     * @tc.name   testAesJsonVolume010025
     * @tc.number SUB_CryptoFramework_AESJSN_01_0025
     * @tc.desc   an unquoted tag key makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010025 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = encJson.slice(0, 1) + encJson.slice(12);
      const result: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'json probe'));
      expect(result === 'json probe').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('null'));
      expect(String(result)).assertEqual('null');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010025 end');
    });

    /**
     * @tc.name   testAesJsonVolume010026
     * @tc.number SUB_CryptoFramework_AESJSN_01_0026
     * @tc.desc   a comma instead of the tag colon makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010026 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = encJson.slice(0, 13) + ',' + encJson.slice(14);
      const result: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'json probe'));
      expect(result === 'json probe').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('null'));
      expect(String(result)).assertEqual('null');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010026 end');
    });

    /**
     * @tc.name   testAesJsonVolume010027
     * @tc.number SUB_CryptoFramework_AESJSN_01_0027
     * @tc.desc   the null literal makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010027 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = 'null';
      let thrown: boolean = false;
      try {
        await op.aesGcmDecrypt(key, json);
      } catch (e) {
        thrown = true;
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(thrown));
      expect(thrown).assertTrue();
      const ctrl: string = await op.aesGcmDecrypt(key, encJson);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', ctrl, 'json probe');
      expect(ctrl).assertEqual('json probe');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(parseAes(encJson).aesGcmTag.length), String(32));
      expect(parseAes(encJson).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010027 end');
    });

    /**
     * @tc.name   testAesJsonVolume010028
     * @tc.number SUB_CryptoFramework_AESJSN_01_0028
     * @tc.desc   a bare number makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010028 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = '42';
      let thrown: boolean = false;
      try {
        await op.aesGcmDecrypt(key, json);
      } catch (e) {
        thrown = true;
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(thrown));
      expect(thrown).assertTrue();
      const ctrl: string = await op.aesGcmDecrypt(key, encJson);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', ctrl, 'json probe');
      expect(ctrl).assertEqual('json probe');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(parseAes(encJson).aesGcmTag.length), String(32));
      expect(parseAes(encJson).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010028 end');
    });

    /**
     * @tc.name   testAesJsonVolume010029
     * @tc.number SUB_CryptoFramework_AESJSN_01_0029
     * @tc.desc   a bare boolean makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010029 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = 'true';
      let thrown: boolean = false;
      try {
        await op.aesGcmDecrypt(key, json);
      } catch (e) {
        thrown = true;
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(thrown));
      expect(thrown).assertTrue();
      const ctrl: string = await op.aesGcmDecrypt(key, encJson);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', ctrl, 'json probe');
      expect(ctrl).assertEqual('json probe');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(parseAes(encJson).aesGcmTag.length), String(32));
      expect(parseAes(encJson).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010029 end');
    });

    /**
     * @tc.name   testAesJsonVolume010030
     * @tc.number SUB_CryptoFramework_AESJSN_01_0030
     * @tc.desc   an empty array makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010030 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = '[]';
      let thrown: boolean = false;
      try {
        await op.aesGcmDecrypt(key, json);
      } catch (e) {
        thrown = true;
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(thrown));
      expect(thrown).assertTrue();
      const ctrl: string = await op.aesGcmDecrypt(key, encJson);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', ctrl, 'json probe');
      expect(ctrl).assertEqual('json probe');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(parseAes(encJson).aesGcmTag.length), String(32));
      expect(parseAes(encJson).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010030 end');
    });

    /**
     * @tc.name   testAesJsonVolume010031
     * @tc.number SUB_CryptoFramework_AESJSN_01_0031
     * @tc.desc   a doubled opening brace makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010031 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = '{{';
      const result: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'json probe'));
      expect(result === 'json probe').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('null'));
      expect(String(result)).assertEqual('null');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010031 end');
    });

    /**
     * @tc.name   testAesJsonVolume010032
     * @tc.number SUB_CryptoFramework_AESJSN_01_0032
     * @tc.desc   a misspelled tag key makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010032 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = encJson.slice(0, 2) + 'x' + encJson.slice(3);
      let thrown: boolean = false;
      try {
        await op.aesGcmDecrypt(key, json);
      } catch (e) {
        thrown = true;
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(thrown));
      expect(thrown).assertTrue();
      const ctrl: string = await op.aesGcmDecrypt(key, encJson);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', ctrl, 'json probe');
      expect(ctrl).assertEqual('json probe');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(parseAes(encJson).aesGcmTag.length), String(32));
      expect(parseAes(encJson).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010032 end');
    });

    /**
     * @tc.name   testAesJsonVolume010033
     * @tc.number SUB_CryptoFramework_AESJSN_01_0033
     * @tc.desc   a misspelled ciphertext key makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010033 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = encJson.slice(0, 50) + 'x' + encJson.slice(51);
      let thrown: boolean = false;
      try {
        await op.aesGcmDecrypt(key, json);
      } catch (e) {
        thrown = true;
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(thrown));
      expect(thrown).assertTrue();
      const ctrl: string = await op.aesGcmDecrypt(key, encJson);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', ctrl, 'json probe');
      expect(ctrl).assertEqual('json probe');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(parseAes(encJson).aesGcmTag.length), String(32));
      expect(parseAes(encJson).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010033 end');
    });

    /**
     * @tc.name   testAesJsonVolume010034
     * @tc.number SUB_CryptoFramework_AESJSN_01_0034
     * @tc.desc   dropping the whole tag field makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010034 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = encJson.slice(0, 1) + encJson.slice(47);
      const result: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'json probe'));
      expect(result === 'json probe').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('null'));
      expect(String(result)).assertEqual('null');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010034 end');
    });

    /**
     * @tc.name   testAesJsonVolume010035
     * @tc.number SUB_CryptoFramework_AESJSN_01_0035
     * @tc.desc   an empty ciphertext value makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010035 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = encJson.slice(0, 65) + '"}';
      let thrown: boolean = false;
      try {
        await op.aesGcmDecrypt(key, json);
      } catch (e) {
        thrown = true;
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(thrown));
      expect(thrown).assertTrue();
      const ctrl: string = await op.aesGcmDecrypt(key, encJson);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', ctrl, 'json probe');
      expect(ctrl).assertEqual('json probe');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(parseAes(encJson).aesGcmTag.length), String(32));
      expect(parseAes(encJson).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010035 end');
    });

    /**
     * @tc.name   testAesJsonVolume010036
     * @tc.number SUB_CryptoFramework_AESJSN_01_0036
     * @tc.desc   an empty tag value makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010036 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = encJson.slice(0, 14) + '","encryptedText":"' + encJson.slice(65);
      let thrown: boolean = false;
      try {
        await op.aesGcmDecrypt(key, json);
      } catch (e) {
        thrown = true;
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(thrown));
      expect(thrown).assertTrue();
      const ctrl: string = await op.aesGcmDecrypt(key, encJson);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', ctrl, 'json probe');
      expect(ctrl).assertEqual('json probe');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(parseAes(encJson).aesGcmTag.length), String(32));
      expect(parseAes(encJson).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010036 end');
    });

    /**
     * @tc.name   testAesJsonVolume010037
     * @tc.number SUB_CryptoFramework_AESJSN_01_0037
     * @tc.desc   an uppercase ciphertext key makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010037 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = encJson.slice(0, 49) + 'ENCRYPTEDTEXT' + encJson.slice(62);
      let thrown: boolean = false;
      try {
        await op.aesGcmDecrypt(key, json);
      } catch (e) {
        thrown = true;
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(thrown));
      expect(thrown).assertTrue();
      const ctrl: string = await op.aesGcmDecrypt(key, encJson);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', ctrl, 'json probe');
      expect(ctrl).assertEqual('json probe');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(parseAes(encJson).aesGcmTag.length), String(32));
      expect(parseAes(encJson).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010037 end');
    });

    /**
     * @tc.name   testAesJsonVolume010038
     * @tc.number SUB_CryptoFramework_AESJSN_01_0038
     * @tc.desc   an uppercase tag key makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010038 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = encJson.slice(0, 2) + 'AESGCMTAG' + encJson.slice(11);
      let thrown: boolean = false;
      try {
        await op.aesGcmDecrypt(key, json);
      } catch (e) {
        thrown = true;
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(thrown));
      expect(thrown).assertTrue();
      const ctrl: string = await op.aesGcmDecrypt(key, encJson);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', ctrl, 'json probe');
      expect(ctrl).assertEqual('json probe');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(parseAes(encJson).aesGcmTag.length), String(32));
      expect(parseAes(encJson).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010038 end');
    });

    /**
     * @tc.name   testAesJsonVolume010039
     * @tc.number SUB_CryptoFramework_AESJSN_01_0039
     * @tc.desc   dropping the comma between fields makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010039 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = encJson.slice(0, 47) + encJson.slice(48);
      const result: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'json probe'));
      expect(result === 'json probe').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('null'));
      expect(String(result)).assertEqual('null');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010039 end');
    });

    /**
     * @tc.name   testAesJsonVolume010040
     * @tc.number SUB_CryptoFramework_AESJSN_01_0040
     * @tc.desc   a newline inside the tag key makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010040 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = encJson.slice(0, 3) + '\n' + encJson.slice(3);
      const result: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'json probe'));
      expect(result === 'json probe').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('null'));
      expect(String(result)).assertEqual('null');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010040 end');
    });

    /**
     * @tc.name   testAesJsonVolume010041
     * @tc.number SUB_CryptoFramework_AESJSN_01_0041
     * @tc.desc   a three char tag value makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010041 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = encJson.slice(0, 14) + '123' + encJson.slice(46);
      const result: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'json probe'));
      expect(result === 'json probe').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('null'));
      expect(String(result)).assertEqual('null');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010041 end');
    });

    /**
     * @tc.name   testAesJsonVolume010042
     * @tc.number SUB_CryptoFramework_AESJSN_01_0042
     * @tc.desc   a 64 char tag value makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010042 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = encJson.slice(0, 14) + tagX + encJson.slice(46);
      const result: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'json probe'));
      expect(result === 'json probe').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('null'));
      expect(String(result)).assertEqual('null');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010042 end');
    });

    /**
     * @tc.name   testAesJsonVolume010043
     * @tc.number SUB_CryptoFramework_AESJSN_01_0043
     * @tc.desc   removing two ciphertext hex chars makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010043 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = encJson.slice(0, encJson.length - 3) + '}';
      const result: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'json probe'));
      expect(result === 'json probe').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('null'));
      expect(String(result)).assertEqual('null');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010043 end');
    });

    /**
     * @tc.name   testAesJsonVolume010044
     * @tc.number SUB_CryptoFramework_AESJSN_01_0044
     * @tc.desc   adding one ciphertext hex char makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010044 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = encJson.slice(0, encJson.length - 1) + '0}';
      const result: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'json probe'));
      expect(result === 'json probe').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('null'));
      expect(String(result)).assertEqual('null');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010044 end');
    });

    /**
     * @tc.name   testAesJsonVolume010045
     * @tc.number SUB_CryptoFramework_AESJSN_01_0045
     * @tc.desc   a space inside the ciphertext value makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010045 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = encJson.slice(0, 66) + ' ' + encJson.slice(66);
      const result: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'json probe'));
      expect(result === 'json probe').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('null'));
      expect(String(result)).assertEqual('null');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010045 end');
    });

    /**
     * @tc.name   testAesJsonVolume010046
     * @tc.number SUB_CryptoFramework_AESJSN_01_0046
     * @tc.desc   a tab inside the tag value makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010046 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = encJson.slice(0, 16) + '\t' + encJson.slice(16);
      const result: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'json probe'));
      expect(result === 'json probe').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('null'));
      expect(String(result)).assertEqual('null');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010046 end');
    });

    /**
     * @tc.name   testAesJsonVolume010047
     * @tc.number SUB_CryptoFramework_AESJSN_01_0047
     * @tc.desc   an uppercase hex tag carries the same value and still decrypts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010047 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = encJson.slice(0, 14) + encJson.slice(14, 46).toUpperCase() + encJson.slice(46);
      const result: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('json probe'));
      expect(result).assertEqual('json probe');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'json probe'));
      expect(result === 'json probe').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010047 end');
    });

    /**
     * @tc.name   testAesJsonVolume010048
     * @tc.number SUB_CryptoFramework_AESJSN_01_0048
     * @tc.desc   an uppercase hex ciphertext carries the same value and still decrypts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010048 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = encJson.slice(0, 65) + encJson.slice(65, 85).toUpperCase() + encJson.slice(85);
      const result: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('json probe'));
      expect(result).assertEqual('json probe');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'json probe'));
      expect(result === 'json probe').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010048 end');
    });

    /**
     * @tc.name   testAesJsonVolume010049
     * @tc.number SUB_CryptoFramework_AESJSN_01_0049
     * @tc.desc   a byte order mark before the JSON makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010049 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = '\uFEFF' + encJson;
      const result: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'json probe'));
      expect(result === 'json probe').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('null'));
      expect(String(result)).assertEqual('null');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010049 end');
    });

    /**
     * @tc.name   testAesJsonVolume010050
     * @tc.number SUB_CryptoFramework_AESJSN_01_0050
     * @tc.desc   a double encoded JSON string makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010050 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = JSON.stringify(encJson);
      let thrown: boolean = false;
      try {
        await op.aesGcmDecrypt(key, json);
      } catch (e) {
        thrown = true;
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(thrown));
      expect(thrown).assertTrue();
      const ctrl: string = await op.aesGcmDecrypt(key, encJson);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', ctrl, 'json probe');
      expect(ctrl).assertEqual('json probe');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(parseAes(encJson).aesGcmTag.length), String(32));
      expect(parseAes(encJson).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010050 end');
    });

    /**
     * @tc.name   testAesJsonVolume010051
     * @tc.number SUB_CryptoFramework_AESJSN_01_0051
     * @tc.desc   an extra leading field before both known fields still decrypts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesJsonVolume010051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010051 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey(GOOD_AES);
      const encJson: string = await op.aesGcmEncrypt(key, 'json probe');
      const ctPart: string = parseAes(encJson).encryptedText;
      const tagPart: string = parseAes(encJson).aesGcmTag;
      const tagX: string = repeatChar('c0', 32);
      const json: string = encJson.slice(0, 1) + '"extra":0,' + encJson.slice(1);
      const result: string = await op.aesGcmDecrypt(key, json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('json probe'));
      expect(result).assertEqual('json probe');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === 'json probe'));
      expect(result === 'json probe').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesJsonVolume010051 end');
    });

  });
}
