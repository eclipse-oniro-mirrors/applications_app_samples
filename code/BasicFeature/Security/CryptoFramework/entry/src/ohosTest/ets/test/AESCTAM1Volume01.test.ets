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

export default function aesCtTamp1Test() {
  describe('AesCtTamp1', () => {

    /**
     * @tc.name   testAesCtTamp10001
     * @tc.number SUB_CryptoFramework_AESCTAM1_01_0001
     * @tc.desc   nibble complement of the first cipher text hex char makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp10001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10001 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 0) + (15 - parseInt(encJson.charAt(ctStart +
0), 16)).toString(16) + encJson.slice(ctStart + 0 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10001 end');
    });

    /**
     * @tc.name   testAesCtTamp10002
     * @tc.number SUB_CryptoFramework_AESCTAM1_01_0002
     * @tc.desc   nibble complement of cipher text hex at position 1 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp10002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10002 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 1) + (15 - parseInt(encJson.charAt(ctStart +
1), 16)).toString(16) + encJson.slice(ctStart + 1 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10002 end');
    });

    /**
     * @tc.name   testAesCtTamp10003
     * @tc.number SUB_CryptoFramework_AESCTAM1_01_0003
     * @tc.desc   nibble complement of cipher text hex at position 2 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp10003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10003 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 2) + (15 - parseInt(encJson.charAt(ctStart +
2), 16)).toString(16) + encJson.slice(ctStart + 2 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10003 end');
    });

    /**
     * @tc.name   testAesCtTamp10004
     * @tc.number SUB_CryptoFramework_AESCTAM1_01_0004
     * @tc.desc   nibble complement of cipher text hex at position 3 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp10004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10004 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 3) + (15 - parseInt(encJson.charAt(ctStart +
3), 16)).toString(16) + encJson.slice(ctStart + 3 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10004 end');
    });

    /**
     * @tc.name   testAesCtTamp10005
     * @tc.number SUB_CryptoFramework_AESCTAM1_01_0005
     * @tc.desc   nibble complement of cipher text hex at position 4 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp10005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10005 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 4) + (15 - parseInt(encJson.charAt(ctStart +
4), 16)).toString(16) + encJson.slice(ctStart + 4 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10005 end');
    });

    /**
     * @tc.name   testAesCtTamp10006
     * @tc.number SUB_CryptoFramework_AESCTAM1_01_0006
     * @tc.desc   nibble complement of cipher text hex at position 5 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp10006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10006 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 5) + (15 - parseInt(encJson.charAt(ctStart +
5), 16)).toString(16) + encJson.slice(ctStart + 5 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10006 end');
    });

    /**
     * @tc.name   testAesCtTamp10007
     * @tc.number SUB_CryptoFramework_AESCTAM1_01_0007
     * @tc.desc   nibble complement of cipher text hex at position 6 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp10007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10007 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 6) + (15 - parseInt(encJson.charAt(ctStart +
6), 16)).toString(16) + encJson.slice(ctStart + 6 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10007 end');
    });

    /**
     * @tc.name   testAesCtTamp10008
     * @tc.number SUB_CryptoFramework_AESCTAM1_01_0008
     * @tc.desc   nibble complement of cipher text hex at position 7 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp10008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10008 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 7) + (15 - parseInt(encJson.charAt(ctStart +
7), 16)).toString(16) + encJson.slice(ctStart + 7 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10008 end');
    });

    /**
     * @tc.name   testAesCtTamp10009
     * @tc.number SUB_CryptoFramework_AESCTAM1_01_0009
     * @tc.desc   nibble complement of cipher text hex at position 8 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp10009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10009 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 8) + (15 - parseInt(encJson.charAt(ctStart +
8), 16)).toString(16) + encJson.slice(ctStart + 8 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10009 end');
    });

    /**
     * @tc.name   testAesCtTamp10010
     * @tc.number SUB_CryptoFramework_AESCTAM1_01_0010
     * @tc.desc   nibble complement of cipher text hex at position 9 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp10010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10010 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 9) + (15 - parseInt(encJson.charAt(ctStart +
9), 16)).toString(16) + encJson.slice(ctStart + 9 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10010 end');
    });

    /**
     * @tc.name   testAesCtTamp10011
     * @tc.number SUB_CryptoFramework_AESCTAM1_01_0011
     * @tc.desc   nibble complement of cipher text hex at position 10 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp10011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10011 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 10) + (15 - parseInt(encJson.charAt(ctStart +
10), 16)).toString(16) + encJson.slice(ctStart + 10 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10011 end');
    });

    /**
     * @tc.name   testAesCtTamp10012
     * @tc.number SUB_CryptoFramework_AESCTAM1_01_0012
     * @tc.desc   nibble complement of cipher text hex at position 11 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp10012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10012 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 11) + (15 - parseInt(encJson.charAt(ctStart +
11), 16)).toString(16) + encJson.slice(ctStart + 11 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10012 end');
    });

    /**
     * @tc.name   testAesCtTamp10013
     * @tc.number SUB_CryptoFramework_AESCTAM1_01_0013
     * @tc.desc   nibble complement of cipher text hex at position 12 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp10013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10013 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 12) + (15 - parseInt(encJson.charAt(ctStart +
12), 16)).toString(16) + encJson.slice(ctStart + 12 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10013 end');
    });

    /**
     * @tc.name   testAesCtTamp10014
     * @tc.number SUB_CryptoFramework_AESCTAM1_01_0014
     * @tc.desc   nibble complement of cipher text hex at position 13 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp10014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10014 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 13) + (15 - parseInt(encJson.charAt(ctStart +
13), 16)).toString(16) + encJson.slice(ctStart + 13 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10014 end');
    });

    /**
     * @tc.name   testAesCtTamp10015
     * @tc.number SUB_CryptoFramework_AESCTAM1_01_0015
     * @tc.desc   nibble complement of cipher text hex at position 14 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp10015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10015 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 14) + (15 - parseInt(encJson.charAt(ctStart +
14), 16)).toString(16) + encJson.slice(ctStart + 14 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10015 end');
    });

    /**
     * @tc.name   testAesCtTamp10016
     * @tc.number SUB_CryptoFramework_AESCTAM1_01_0016
     * @tc.desc   nibble complement of cipher text hex at position 15 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp10016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10016 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 15) + (15 - parseInt(encJson.charAt(ctStart +
15), 16)).toString(16) + encJson.slice(ctStart + 15 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10016 end');
    });

    /**
     * @tc.name   testAesCtTamp10017
     * @tc.number SUB_CryptoFramework_AESCTAM1_01_0017
     * @tc.desc   nibble complement of cipher text hex at position 16 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp10017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10017 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 16) + (15 - parseInt(encJson.charAt(ctStart +
16), 16)).toString(16) + encJson.slice(ctStart + 16 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10017 end');
    });

    /**
     * @tc.name   testAesCtTamp10018
     * @tc.number SUB_CryptoFramework_AESCTAM1_01_0018
     * @tc.desc   nibble complement of cipher text hex at position 17 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp10018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10018 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 17) + (15 - parseInt(encJson.charAt(ctStart +
17), 16)).toString(16) + encJson.slice(ctStart + 17 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10018 end');
    });

    /**
     * @tc.name   testAesCtTamp10019
     * @tc.number SUB_CryptoFramework_AESCTAM1_01_0019
     * @tc.desc   nibble complement of cipher text hex at position 18 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp10019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10019 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 18) + (15 - parseInt(encJson.charAt(ctStart +
18), 16)).toString(16) + encJson.slice(ctStart + 18 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10019 end');
    });

    /**
     * @tc.name   testAesCtTamp10020
     * @tc.number SUB_CryptoFramework_AESCTAM1_01_0020
     * @tc.desc   nibble complement of cipher text hex at position 19 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp10020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10020 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 19) + (15 - parseInt(encJson.charAt(ctStart +
19), 16)).toString(16) + encJson.slice(ctStart + 19 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10020 end');
    });

    /**
     * @tc.name   testAesCtTamp10021
     * @tc.number SUB_CryptoFramework_AESCTAM1_01_0021
     * @tc.desc   nibble complement of cipher text hex at position 20 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp10021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10021 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 20) + (15 - parseInt(encJson.charAt(ctStart +
20), 16)).toString(16) + encJson.slice(ctStart + 20 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10021 end');
    });

    /**
     * @tc.name   testAesCtTamp10022
     * @tc.number SUB_CryptoFramework_AESCTAM1_01_0022
     * @tc.desc   nibble complement of cipher text hex at position 21 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp10022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10022 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 21) + (15 - parseInt(encJson.charAt(ctStart +
21), 16)).toString(16) + encJson.slice(ctStart + 21 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10022 end');
    });

    /**
     * @tc.name   testAesCtTamp10023
     * @tc.number SUB_CryptoFramework_AESCTAM1_01_0023
     * @tc.desc   nibble complement of cipher text hex at position 22 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp10023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10023 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 22) + (15 - parseInt(encJson.charAt(ctStart +
22), 16)).toString(16) + encJson.slice(ctStart + 22 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10023 end');
    });

    /**
     * @tc.name   testAesCtTamp10024
     * @tc.number SUB_CryptoFramework_AESCTAM1_01_0024
     * @tc.desc   nibble complement of cipher text hex at position 23 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp10024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10024 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 23) + (15 - parseInt(encJson.charAt(ctStart +
23), 16)).toString(16) + encJson.slice(ctStart + 23 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10024 end');
    });

    /**
     * @tc.name   testAesCtTamp10025
     * @tc.number SUB_CryptoFramework_AESCTAM1_01_0025
     * @tc.desc   nibble complement of cipher text hex at position 24 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp10025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10025 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 24) + (15 - parseInt(encJson.charAt(ctStart +
24), 16)).toString(16) + encJson.slice(ctStart + 24 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10025 end');
    });

    /**
     * @tc.name   testAesCtTamp10026
     * @tc.number SUB_CryptoFramework_AESCTAM1_01_0026
     * @tc.desc   nibble complement of cipher text hex at position 25 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp10026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10026 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 25) + (15 - parseInt(encJson.charAt(ctStart +
25), 16)).toString(16) + encJson.slice(ctStart + 25 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10026 end');
    });

    /**
     * @tc.name   testAesCtTamp10027
     * @tc.number SUB_CryptoFramework_AESCTAM1_01_0027
     * @tc.desc   nibble complement of cipher text hex at position 26 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp10027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10027 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 26) + (15 - parseInt(encJson.charAt(ctStart +
26), 16)).toString(16) + encJson.slice(ctStart + 26 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10027 end');
    });

    /**
     * @tc.name   testAesCtTamp10028
     * @tc.number SUB_CryptoFramework_AESCTAM1_01_0028
     * @tc.desc   nibble complement of cipher text hex at position 27 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp10028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10028 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 27) + (15 - parseInt(encJson.charAt(ctStart +
27), 16)).toString(16) + encJson.slice(ctStart + 27 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10028 end');
    });

    /**
     * @tc.name   testAesCtTamp10029
     * @tc.number SUB_CryptoFramework_AESCTAM1_01_0029
     * @tc.desc   nibble complement of cipher text hex at position 28 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp10029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10029 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 28) + (15 - parseInt(encJson.charAt(ctStart +
28), 16)).toString(16) + encJson.slice(ctStart + 28 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10029 end');
    });

    /**
     * @tc.name   testAesCtTamp10030
     * @tc.number SUB_CryptoFramework_AESCTAM1_01_0030
     * @tc.desc   nibble complement of cipher text hex at position 29 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp10030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10030 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 29) + (15 - parseInt(encJson.charAt(ctStart +
29), 16)).toString(16) + encJson.slice(ctStart + 29 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10030 end');
    });

    /**
     * @tc.name   testAesCtTamp10031
     * @tc.number SUB_CryptoFramework_AESCTAM1_01_0031
     * @tc.desc   nibble complement of cipher text hex at position 30 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp10031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10031 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 30) + (15 - parseInt(encJson.charAt(ctStart +
30), 16)).toString(16) + encJson.slice(ctStart + 30 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10031 end');
    });

    /**
     * @tc.name   testAesCtTamp10032
     * @tc.number SUB_CryptoFramework_AESCTAM1_01_0032
     * @tc.desc   nibble complement of cipher text hex at position 31 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp10032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10032 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 31) + (15 - parseInt(encJson.charAt(ctStart +
31), 16)).toString(16) + encJson.slice(ctStart + 31 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10032 end');
    });

    /**
     * @tc.name   testAesCtTamp10033
     * @tc.number SUB_CryptoFramework_AESCTAM1_01_0033
     * @tc.desc   nibble complement of cipher text hex at position 32 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp10033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10033 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 32) + (15 - parseInt(encJson.charAt(ctStart +
32), 16)).toString(16) + encJson.slice(ctStart + 32 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10033 end');
    });

    /**
     * @tc.name   testAesCtTamp10034
     * @tc.number SUB_CryptoFramework_AESCTAM1_01_0034
     * @tc.desc   nibble complement of cipher text hex at position 33 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp10034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10034 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 33) + (15 - parseInt(encJson.charAt(ctStart +
33), 16)).toString(16) + encJson.slice(ctStart + 33 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10034 end');
    });

    /**
     * @tc.name   testAesCtTamp10035
     * @tc.number SUB_CryptoFramework_AESCTAM1_01_0035
     * @tc.desc   nibble complement of cipher text hex at position 34 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp10035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10035 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 34) + (15 - parseInt(encJson.charAt(ctStart +
34), 16)).toString(16) + encJson.slice(ctStart + 34 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10035 end');
    });

    /**
     * @tc.name   testAesCtTamp10036
     * @tc.number SUB_CryptoFramework_AESCTAM1_01_0036
     * @tc.desc   nibble complement of cipher text hex at position 35 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp10036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10036 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 35) + (15 - parseInt(encJson.charAt(ctStart +
35), 16)).toString(16) + encJson.slice(ctStart + 35 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10036 end');
    });

    /**
     * @tc.name   testAesCtTamp10037
     * @tc.number SUB_CryptoFramework_AESCTAM1_01_0037
     * @tc.desc   nibble complement of cipher text hex at position 36 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp10037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10037 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 36) + (15 - parseInt(encJson.charAt(ctStart +
36), 16)).toString(16) + encJson.slice(ctStart + 36 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10037 end');
    });

    /**
     * @tc.name   testAesCtTamp10038
     * @tc.number SUB_CryptoFramework_AESCTAM1_01_0038
     * @tc.desc   nibble complement of cipher text hex at position 37 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp10038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10038 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 37) + (15 - parseInt(encJson.charAt(ctStart +
37), 16)).toString(16) + encJson.slice(ctStart + 37 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10038 end');
    });

    /**
     * @tc.name   testAesCtTamp10039
     * @tc.number SUB_CryptoFramework_AESCTAM1_01_0039
     * @tc.desc   nibble complement of cipher text hex at position 38 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp10039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10039 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 38) + (15 - parseInt(encJson.charAt(ctStart +
38), 16)).toString(16) + encJson.slice(ctStart + 38 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10039 end');
    });

    /**
     * @tc.name   testAesCtTamp10040
     * @tc.number SUB_CryptoFramework_AESCTAM1_01_0040
     * @tc.desc   nibble complement of cipher text hex at position 39 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp10040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10040 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 39) + (15 - parseInt(encJson.charAt(ctStart +
39), 16)).toString(16) + encJson.slice(ctStart + 39 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10040 end');
    });

    /**
     * @tc.name   testAesCtTamp10041
     * @tc.number SUB_CryptoFramework_AESCTAM1_01_0041
     * @tc.desc   nibble complement of cipher text hex at position 40 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp10041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10041 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 40) + (15 - parseInt(encJson.charAt(ctStart +
40), 16)).toString(16) + encJson.slice(ctStart + 40 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10041 end');
    });

    /**
     * @tc.name   testAesCtTamp10042
     * @tc.number SUB_CryptoFramework_AESCTAM1_01_0042
     * @tc.desc   nibble complement of cipher text hex at position 41 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp10042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10042 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 41) + (15 - parseInt(encJson.charAt(ctStart +
41), 16)).toString(16) + encJson.slice(ctStart + 41 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10042 end');
    });

    /**
     * @tc.name   testAesCtTamp10043
     * @tc.number SUB_CryptoFramework_AESCTAM1_01_0043
     * @tc.desc   nibble complement of cipher text hex at position 42 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp10043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10043 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 42) + (15 - parseInt(encJson.charAt(ctStart +
42), 16)).toString(16) + encJson.slice(ctStart + 42 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10043 end');
    });

    /**
     * @tc.name   testAesCtTamp10044
     * @tc.number SUB_CryptoFramework_AESCTAM1_01_0044
     * @tc.desc   nibble complement of cipher text hex at position 43 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp10044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10044 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 43) + (15 - parseInt(encJson.charAt(ctStart +
43), 16)).toString(16) + encJson.slice(ctStart + 43 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10044 end');
    });

    /**
     * @tc.name   testAesCtTamp10045
     * @tc.number SUB_CryptoFramework_AESCTAM1_01_0045
     * @tc.desc   nibble complement of cipher text hex at position 44 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp10045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10045 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 44) + (15 - parseInt(encJson.charAt(ctStart +
44), 16)).toString(16) + encJson.slice(ctStart + 44 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10045 end');
    });

    /**
     * @tc.name   testAesCtTamp10046
     * @tc.number SUB_CryptoFramework_AESCTAM1_01_0046
     * @tc.desc   nibble complement of cipher text hex at position 45 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp10046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10046 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 45) + (15 - parseInt(encJson.charAt(ctStart +
45), 16)).toString(16) + encJson.slice(ctStart + 45 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10046 end');
    });

    /**
     * @tc.name   testAesCtTamp10047
     * @tc.number SUB_CryptoFramework_AESCTAM1_01_0047
     * @tc.desc   nibble complement of cipher text hex at position 46 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp10047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10047 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 46) + (15 - parseInt(encJson.charAt(ctStart +
46), 16)).toString(16) + encJson.slice(ctStart + 46 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10047 end');
    });

    /**
     * @tc.name   testAesCtTamp10048
     * @tc.number SUB_CryptoFramework_AESCTAM1_01_0048
     * @tc.desc   nibble complement of cipher text hex at position 47 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp10048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10048 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 47) + (15 - parseInt(encJson.charAt(ctStart +
47), 16)).toString(16) + encJson.slice(ctStart + 47 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp10048 end');
    });

  });
}
