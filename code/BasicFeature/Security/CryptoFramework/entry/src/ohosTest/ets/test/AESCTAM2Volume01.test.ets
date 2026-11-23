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

export default function aesCtTamp2Test() {
  describe('AesCtTamp2', () => {

    /**
     * @tc.name   testAesCtTamp20001
     * @tc.number SUB_CryptoFramework_AESCTAM2_01_0001
     * @tc.desc   deleting the cipher text hex nibble at position 0 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20001 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 0) + encJson.slice(ctStart + 0 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20001 end');
    });

    /**
     * @tc.name   testAesCtTamp20002
     * @tc.number SUB_CryptoFramework_AESCTAM2_01_0002
     * @tc.desc   deleting the cipher text hex nibble at position 1 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp20002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20002 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 1) + encJson.slice(ctStart + 1 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20002 end');
    });

    /**
     * @tc.name   testAesCtTamp20003
     * @tc.number SUB_CryptoFramework_AESCTAM2_01_0003
     * @tc.desc   deleting the cipher text hex nibble at position 2 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp20003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20003 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 2) + encJson.slice(ctStart + 2 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20003 end');
    });

    /**
     * @tc.name   testAesCtTamp20004
     * @tc.number SUB_CryptoFramework_AESCTAM2_01_0004
     * @tc.desc   deleting the cipher text hex nibble at position 3 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp20004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20004 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 3) + encJson.slice(ctStart + 3 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20004 end');
    });

    /**
     * @tc.name   testAesCtTamp20005
     * @tc.number SUB_CryptoFramework_AESCTAM2_01_0005
     * @tc.desc   deleting the cipher text hex nibble at position 4 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp20005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20005 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 4) + encJson.slice(ctStart + 4 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20005 end');
    });

    /**
     * @tc.name   testAesCtTamp20006
     * @tc.number SUB_CryptoFramework_AESCTAM2_01_0006
     * @tc.desc   deleting the cipher text hex nibble at position 5 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp20006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20006 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 5) + encJson.slice(ctStart + 5 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20006 end');
    });

    /**
     * @tc.name   testAesCtTamp20007
     * @tc.number SUB_CryptoFramework_AESCTAM2_01_0007
     * @tc.desc   deleting the cipher text hex nibble at position 6 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp20007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20007 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 6) + encJson.slice(ctStart + 6 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20007 end');
    });

    /**
     * @tc.name   testAesCtTamp20008
     * @tc.number SUB_CryptoFramework_AESCTAM2_01_0008
     * @tc.desc   deleting the cipher text hex nibble at position 7 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp20008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20008 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 7) + encJson.slice(ctStart + 7 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20008 end');
    });

    /**
     * @tc.name   testAesCtTamp20009
     * @tc.number SUB_CryptoFramework_AESCTAM2_01_0009
     * @tc.desc   deleting the cipher text hex nibble at position 8 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp20009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20009 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 8) + encJson.slice(ctStart + 8 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20009 end');
    });

    /**
     * @tc.name   testAesCtTamp20010
     * @tc.number SUB_CryptoFramework_AESCTAM2_01_0010
     * @tc.desc   deleting the cipher text hex nibble at position 9 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp20010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20010 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 9) + encJson.slice(ctStart + 9 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20010 end');
    });

    /**
     * @tc.name   testAesCtTamp20011
     * @tc.number SUB_CryptoFramework_AESCTAM2_01_0011
     * @tc.desc   deleting the cipher text hex nibble at position 10 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp20011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20011 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 10) + encJson.slice(ctStart + 10 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20011 end');
    });

    /**
     * @tc.name   testAesCtTamp20012
     * @tc.number SUB_CryptoFramework_AESCTAM2_01_0012
     * @tc.desc   deleting the cipher text hex nibble at position 11 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp20012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20012 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 11) + encJson.slice(ctStart + 11 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20012 end');
    });

    /**
     * @tc.name   testAesCtTamp20013
     * @tc.number SUB_CryptoFramework_AESCTAM2_01_0013
     * @tc.desc   deleting the cipher text hex nibble at position 12 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp20013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20013 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 12) + encJson.slice(ctStart + 12 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20013 end');
    });

    /**
     * @tc.name   testAesCtTamp20014
     * @tc.number SUB_CryptoFramework_AESCTAM2_01_0014
     * @tc.desc   deleting the cipher text hex nibble at position 13 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp20014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20014 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 13) + encJson.slice(ctStart + 13 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20014 end');
    });

    /**
     * @tc.name   testAesCtTamp20015
     * @tc.number SUB_CryptoFramework_AESCTAM2_01_0015
     * @tc.desc   deleting the cipher text hex nibble at position 14 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp20015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20015 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 14) + encJson.slice(ctStart + 14 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20015 end');
    });

    /**
     * @tc.name   testAesCtTamp20016
     * @tc.number SUB_CryptoFramework_AESCTAM2_01_0016
     * @tc.desc   deleting the cipher text hex nibble at position 15 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp20016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20016 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 15) + encJson.slice(ctStart + 15 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20016 end');
    });

    /**
     * @tc.name   testAesCtTamp20017
     * @tc.number SUB_CryptoFramework_AESCTAM2_01_0017
     * @tc.desc   deleting the cipher text hex nibble at position 16 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp20017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20017 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 16) + encJson.slice(ctStart + 16 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20017 end');
    });

    /**
     * @tc.name   testAesCtTamp20018
     * @tc.number SUB_CryptoFramework_AESCTAM2_01_0018
     * @tc.desc   deleting the cipher text hex nibble at position 17 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp20018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20018 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 17) + encJson.slice(ctStart + 17 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20018 end');
    });

    /**
     * @tc.name   testAesCtTamp20019
     * @tc.number SUB_CryptoFramework_AESCTAM2_01_0019
     * @tc.desc   deleting the cipher text hex nibble at position 18 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp20019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20019 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 18) + encJson.slice(ctStart + 18 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20019 end');
    });

    /**
     * @tc.name   testAesCtTamp20020
     * @tc.number SUB_CryptoFramework_AESCTAM2_01_0020
     * @tc.desc   deleting the cipher text hex nibble at position 19 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp20020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20020 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 19) + encJson.slice(ctStart + 19 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20020 end');
    });

    /**
     * @tc.name   testAesCtTamp20021
     * @tc.number SUB_CryptoFramework_AESCTAM2_01_0021
     * @tc.desc   deleting the cipher text hex nibble at position 20 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp20021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20021 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 20) + encJson.slice(ctStart + 20 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20021 end');
    });

    /**
     * @tc.name   testAesCtTamp20022
     * @tc.number SUB_CryptoFramework_AESCTAM2_01_0022
     * @tc.desc   deleting the cipher text hex nibble at position 21 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp20022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20022 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 21) + encJson.slice(ctStart + 21 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20022 end');
    });

    /**
     * @tc.name   testAesCtTamp20023
     * @tc.number SUB_CryptoFramework_AESCTAM2_01_0023
     * @tc.desc   deleting the cipher text hex nibble at position 22 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp20023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20023 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 22) + encJson.slice(ctStart + 22 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20023 end');
    });

    /**
     * @tc.name   testAesCtTamp20024
     * @tc.number SUB_CryptoFramework_AESCTAM2_01_0024
     * @tc.desc   deleting the cipher text hex nibble at position 23 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp20024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20024 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 23) + encJson.slice(ctStart + 23 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20024 end');
    });

    /**
     * @tc.name   testAesCtTamp20025
     * @tc.number SUB_CryptoFramework_AESCTAM2_01_0025
     * @tc.desc   deleting the cipher text hex nibble at position 24 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp20025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20025 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 24) + encJson.slice(ctStart + 24 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20025 end');
    });

    /**
     * @tc.name   testAesCtTamp20026
     * @tc.number SUB_CryptoFramework_AESCTAM2_01_0026
     * @tc.desc   deleting the cipher text hex nibble at position 25 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp20026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20026 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 25) + encJson.slice(ctStart + 25 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20026 end');
    });

    /**
     * @tc.name   testAesCtTamp20027
     * @tc.number SUB_CryptoFramework_AESCTAM2_01_0027
     * @tc.desc   deleting the cipher text hex nibble at position 26 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp20027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20027 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 26) + encJson.slice(ctStart + 26 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20027 end');
    });

    /**
     * @tc.name   testAesCtTamp20028
     * @tc.number SUB_CryptoFramework_AESCTAM2_01_0028
     * @tc.desc   deleting the cipher text hex nibble at position 27 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp20028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20028 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 27) + encJson.slice(ctStart + 27 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20028 end');
    });

    /**
     * @tc.name   testAesCtTamp20029
     * @tc.number SUB_CryptoFramework_AESCTAM2_01_0029
     * @tc.desc   deleting the cipher text hex nibble at position 28 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp20029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20029 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 28) + encJson.slice(ctStart + 28 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20029 end');
    });

    /**
     * @tc.name   testAesCtTamp20030
     * @tc.number SUB_CryptoFramework_AESCTAM2_01_0030
     * @tc.desc   deleting the cipher text hex nibble at position 29 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp20030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20030 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 29) + encJson.slice(ctStart + 29 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20030 end');
    });

    /**
     * @tc.name   testAesCtTamp20031
     * @tc.number SUB_CryptoFramework_AESCTAM2_01_0031
     * @tc.desc   deleting the cipher text hex nibble at position 30 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp20031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20031 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 30) + encJson.slice(ctStart + 30 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20031 end');
    });

    /**
     * @tc.name   testAesCtTamp20032
     * @tc.number SUB_CryptoFramework_AESCTAM2_01_0032
     * @tc.desc   deleting the cipher text hex nibble at position 31 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp20032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20032 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 31) + encJson.slice(ctStart + 31 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20032 end');
    });

    /**
     * @tc.name   testAesCtTamp20033
     * @tc.number SUB_CryptoFramework_AESCTAM2_01_0033
     * @tc.desc   deleting two cipher text hex nibbles makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp20033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20033 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 0) + encJson.slice(ctStart + 0 + 1, ctStart + 16) +
encJson.slice(ctStart + 16 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20033 end');
    });

    /**
     * @tc.name   testAesCtTamp20034
     * @tc.number SUB_CryptoFramework_AESCTAM2_01_0034
     * @tc.desc   deleting two cipher text hex nibbles at positions 1 and 17 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp20034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20034 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 1) + encJson.slice(ctStart + 1 + 1, ctStart + 17) +
encJson.slice(ctStart + 17 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20034 end');
    });

    /**
     * @tc.name   testAesCtTamp20035
     * @tc.number SUB_CryptoFramework_AESCTAM2_01_0035
     * @tc.desc   deleting two cipher text hex nibbles at positions 2 and 18 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp20035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20035 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 2) + encJson.slice(ctStart + 2 + 1, ctStart + 18) +
encJson.slice(ctStart + 18 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20035 end');
    });

    /**
     * @tc.name   testAesCtTamp20036
     * @tc.number SUB_CryptoFramework_AESCTAM2_01_0036
     * @tc.desc   deleting two cipher text hex nibbles at positions 3 and 19 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp20036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20036 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 3) + encJson.slice(ctStart + 3 + 1, ctStart + 19) +
encJson.slice(ctStart + 19 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20036 end');
    });

    /**
     * @tc.name   testAesCtTamp20037
     * @tc.number SUB_CryptoFramework_AESCTAM2_01_0037
     * @tc.desc   deleting two cipher text hex nibbles at positions 4 and 20 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp20037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20037 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 4) + encJson.slice(ctStart + 4 + 1, ctStart + 20) +
encJson.slice(ctStart + 20 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20037 end');
    });

    /**
     * @tc.name   testAesCtTamp20038
     * @tc.number SUB_CryptoFramework_AESCTAM2_01_0038
     * @tc.desc   deleting two cipher text hex nibbles at positions 5 and 21 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp20038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20038 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 5) + encJson.slice(ctStart + 5 + 1, ctStart + 21) +
encJson.slice(ctStart + 21 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20038 end');
    });

    /**
     * @tc.name   testAesCtTamp20039
     * @tc.number SUB_CryptoFramework_AESCTAM2_01_0039
     * @tc.desc   deleting two cipher text hex nibbles at positions 6 and 22 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp20039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20039 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 6) + encJson.slice(ctStart + 6 + 1, ctStart + 22) +
encJson.slice(ctStart + 22 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20039 end');
    });

    /**
     * @tc.name   testAesCtTamp20040
     * @tc.number SUB_CryptoFramework_AESCTAM2_01_0040
     * @tc.desc   deleting two cipher text hex nibbles at positions 7 and 23 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp20040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20040 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 7) + encJson.slice(ctStart + 7 + 1, ctStart + 23) +
encJson.slice(ctStart + 23 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20040 end');
    });

    /**
     * @tc.name   testAesCtTamp20041
     * @tc.number SUB_CryptoFramework_AESCTAM2_01_0041
     * @tc.desc   deleting two cipher text hex nibbles at positions 8 and 24 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp20041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20041 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 8) + encJson.slice(ctStart + 8 + 1, ctStart + 24) +
encJson.slice(ctStart + 24 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20041 end');
    });

    /**
     * @tc.name   testAesCtTamp20042
     * @tc.number SUB_CryptoFramework_AESCTAM2_01_0042
     * @tc.desc   deleting two cipher text hex nibbles at positions 9 and 25 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp20042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20042 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 9) + encJson.slice(ctStart + 9 + 1, ctStart + 25) +
encJson.slice(ctStart + 25 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20042 end');
    });

    /**
     * @tc.name   testAesCtTamp20043
     * @tc.number SUB_CryptoFramework_AESCTAM2_01_0043
     * @tc.desc   deleting two cipher text hex nibbles at positions 10 and 26 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp20043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20043 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 10) + encJson.slice(ctStart + 10 + 1, ctStart + 26) +
encJson.slice(ctStart + 26 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20043 end');
    });

    /**
     * @tc.name   testAesCtTamp20044
     * @tc.number SUB_CryptoFramework_AESCTAM2_01_0044
     * @tc.desc   deleting two cipher text hex nibbles at positions 11 and 27 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp20044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20044 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 11) + encJson.slice(ctStart + 11 + 1, ctStart + 27) +
encJson.slice(ctStart + 27 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20044 end');
    });

    /**
     * @tc.name   testAesCtTamp20045
     * @tc.number SUB_CryptoFramework_AESCTAM2_01_0045
     * @tc.desc   deleting two cipher text hex nibbles at positions 12 and 28 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp20045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20045 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 12) + encJson.slice(ctStart + 12 + 1, ctStart + 28) +
encJson.slice(ctStart + 28 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20045 end');
    });

    /**
     * @tc.name   testAesCtTamp20046
     * @tc.number SUB_CryptoFramework_AESCTAM2_01_0046
     * @tc.desc   deleting two cipher text hex nibbles at positions 13 and 29 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp20046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20046 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 13) + encJson.slice(ctStart + 13 + 1, ctStart + 29) +
encJson.slice(ctStart + 29 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20046 end');
    });

    /**
     * @tc.name   testAesCtTamp20047
     * @tc.number SUB_CryptoFramework_AESCTAM2_01_0047
     * @tc.desc   deleting two cipher text hex nibbles at positions 14 and 30 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp20047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20047 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 14) + encJson.slice(ctStart + 14 + 1, ctStart + 30) +
encJson.slice(ctStart + 30 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20047 end');
    });

    /**
     * @tc.name   testAesCtTamp20048
     * @tc.number SUB_CryptoFramework_AESCTAM2_01_0048
     * @tc.desc   deleting two cipher text hex nibbles at positions 15 and 31 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesCtTamp20048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20048 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const ctStart: number = encJson.indexOf('encryptedText') + 16;
      const tampered: string = encJson.slice(0, ctStart + 15) + encJson.slice(ctStart + 15 + 1, ctStart + 31) +
encJson.slice(ctStart + 31 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(32));
      expect(ctrlPlain.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesCtTamp20048 end');
    });

  });
}
