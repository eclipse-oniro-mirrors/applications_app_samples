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
const TAG_OFFSET: number = 14;
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_CryptoFramework]';

export default function aesTagTamp2Test() {
  describe('AesTagTamp2', () => {

    /**
     * @tc.name   testAesTagTamp20001
     * @tc.number SUB_CryptoFramework_AESTGTM2_01_0001
     * @tc.desc   deleting the auth tag hex nibble at position 0 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20001 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 0) + encJson.slice(TAG_OFFSET + 0 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20001 end');
    });

    /**
     * @tc.name   testAesTagTamp20002
     * @tc.number SUB_CryptoFramework_AESTGTM2_01_0002
     * @tc.desc   deleting the auth tag hex nibble at position 1 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp20002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20002 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 1) + encJson.slice(TAG_OFFSET + 1 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20002 end');
    });

    /**
     * @tc.name   testAesTagTamp20003
     * @tc.number SUB_CryptoFramework_AESTGTM2_01_0003
     * @tc.desc   deleting the auth tag hex nibble at position 2 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp20003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20003 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 2) + encJson.slice(TAG_OFFSET + 2 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20003 end');
    });

    /**
     * @tc.name   testAesTagTamp20004
     * @tc.number SUB_CryptoFramework_AESTGTM2_01_0004
     * @tc.desc   deleting the auth tag hex nibble at position 3 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp20004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20004 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 3) + encJson.slice(TAG_OFFSET + 3 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20004 end');
    });

    /**
     * @tc.name   testAesTagTamp20005
     * @tc.number SUB_CryptoFramework_AESTGTM2_01_0005
     * @tc.desc   deleting the auth tag hex nibble at position 4 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp20005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20005 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 4) + encJson.slice(TAG_OFFSET + 4 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20005 end');
    });

    /**
     * @tc.name   testAesTagTamp20006
     * @tc.number SUB_CryptoFramework_AESTGTM2_01_0006
     * @tc.desc   deleting the auth tag hex nibble at position 5 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp20006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20006 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 5) + encJson.slice(TAG_OFFSET + 5 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20006 end');
    });

    /**
     * @tc.name   testAesTagTamp20007
     * @tc.number SUB_CryptoFramework_AESTGTM2_01_0007
     * @tc.desc   deleting the auth tag hex nibble at position 6 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp20007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20007 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 6) + encJson.slice(TAG_OFFSET + 6 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20007 end');
    });

    /**
     * @tc.name   testAesTagTamp20008
     * @tc.number SUB_CryptoFramework_AESTGTM2_01_0008
     * @tc.desc   deleting the auth tag hex nibble at position 7 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp20008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20008 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 7) + encJson.slice(TAG_OFFSET + 7 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20008 end');
    });

    /**
     * @tc.name   testAesTagTamp20009
     * @tc.number SUB_CryptoFramework_AESTGTM2_01_0009
     * @tc.desc   deleting the auth tag hex nibble at position 8 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp20009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20009 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 8) + encJson.slice(TAG_OFFSET + 8 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20009 end');
    });

    /**
     * @tc.name   testAesTagTamp20010
     * @tc.number SUB_CryptoFramework_AESTGTM2_01_0010
     * @tc.desc   deleting the auth tag hex nibble at position 9 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp20010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20010 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 9) + encJson.slice(TAG_OFFSET + 9 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20010 end');
    });

    /**
     * @tc.name   testAesTagTamp20011
     * @tc.number SUB_CryptoFramework_AESTGTM2_01_0011
     * @tc.desc   deleting the auth tag hex nibble at position 10 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp20011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20011 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 10) + encJson.slice(TAG_OFFSET + 10 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20011 end');
    });

    /**
     * @tc.name   testAesTagTamp20012
     * @tc.number SUB_CryptoFramework_AESTGTM2_01_0012
     * @tc.desc   deleting the auth tag hex nibble at position 11 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp20012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20012 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 11) + encJson.slice(TAG_OFFSET + 11 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20012 end');
    });

    /**
     * @tc.name   testAesTagTamp20013
     * @tc.number SUB_CryptoFramework_AESTGTM2_01_0013
     * @tc.desc   deleting the auth tag hex nibble at position 12 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp20013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20013 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 12) + encJson.slice(TAG_OFFSET + 12 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20013 end');
    });

    /**
     * @tc.name   testAesTagTamp20014
     * @tc.number SUB_CryptoFramework_AESTGTM2_01_0014
     * @tc.desc   deleting the auth tag hex nibble at position 13 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp20014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20014 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 13) + encJson.slice(TAG_OFFSET + 13 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20014 end');
    });

    /**
     * @tc.name   testAesTagTamp20015
     * @tc.number SUB_CryptoFramework_AESTGTM2_01_0015
     * @tc.desc   deleting the auth tag hex nibble at position 14 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp20015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20015 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 14) + encJson.slice(TAG_OFFSET + 14 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20015 end');
    });

    /**
     * @tc.name   testAesTagTamp20016
     * @tc.number SUB_CryptoFramework_AESTGTM2_01_0016
     * @tc.desc   deleting the auth tag hex nibble at position 15 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp20016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20016 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 15) + encJson.slice(TAG_OFFSET + 15 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20016 end');
    });

    /**
     * @tc.name   testAesTagTamp20017
     * @tc.number SUB_CryptoFramework_AESTGTM2_01_0017
     * @tc.desc   deleting the auth tag hex nibble at position 16 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp20017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20017 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 16) + encJson.slice(TAG_OFFSET + 16 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20017 end');
    });

    /**
     * @tc.name   testAesTagTamp20018
     * @tc.number SUB_CryptoFramework_AESTGTM2_01_0018
     * @tc.desc   deleting the auth tag hex nibble at position 17 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp20018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20018 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 17) + encJson.slice(TAG_OFFSET + 17 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20018 end');
    });

    /**
     * @tc.name   testAesTagTamp20019
     * @tc.number SUB_CryptoFramework_AESTGTM2_01_0019
     * @tc.desc   deleting the auth tag hex nibble at position 18 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp20019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20019 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 18) + encJson.slice(TAG_OFFSET + 18 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20019 end');
    });

    /**
     * @tc.name   testAesTagTamp20020
     * @tc.number SUB_CryptoFramework_AESTGTM2_01_0020
     * @tc.desc   deleting the auth tag hex nibble at position 19 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp20020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20020 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 19) + encJson.slice(TAG_OFFSET + 19 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20020 end');
    });

    /**
     * @tc.name   testAesTagTamp20021
     * @tc.number SUB_CryptoFramework_AESTGTM2_01_0021
     * @tc.desc   deleting the auth tag hex nibble at position 20 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp20021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20021 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 20) + encJson.slice(TAG_OFFSET + 20 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20021 end');
    });

    /**
     * @tc.name   testAesTagTamp20022
     * @tc.number SUB_CryptoFramework_AESTGTM2_01_0022
     * @tc.desc   deleting the auth tag hex nibble at position 21 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp20022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20022 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 21) + encJson.slice(TAG_OFFSET + 21 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20022 end');
    });

    /**
     * @tc.name   testAesTagTamp20023
     * @tc.number SUB_CryptoFramework_AESTGTM2_01_0023
     * @tc.desc   deleting the auth tag hex nibble at position 22 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp20023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20023 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 22) + encJson.slice(TAG_OFFSET + 22 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20023 end');
    });

    /**
     * @tc.name   testAesTagTamp20024
     * @tc.number SUB_CryptoFramework_AESTGTM2_01_0024
     * @tc.desc   deleting the auth tag hex nibble at position 23 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp20024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20024 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 23) + encJson.slice(TAG_OFFSET + 23 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20024 end');
    });

    /**
     * @tc.name   testAesTagTamp20025
     * @tc.number SUB_CryptoFramework_AESTGTM2_01_0025
     * @tc.desc   deleting the auth tag hex nibble at position 24 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp20025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20025 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 24) + encJson.slice(TAG_OFFSET + 24 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20025 end');
    });

    /**
     * @tc.name   testAesTagTamp20026
     * @tc.number SUB_CryptoFramework_AESTGTM2_01_0026
     * @tc.desc   deleting the auth tag hex nibble at position 25 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp20026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20026 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 25) + encJson.slice(TAG_OFFSET + 25 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20026 end');
    });

    /**
     * @tc.name   testAesTagTamp20027
     * @tc.number SUB_CryptoFramework_AESTGTM2_01_0027
     * @tc.desc   deleting the auth tag hex nibble at position 26 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp20027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20027 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 26) + encJson.slice(TAG_OFFSET + 26 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20027 end');
    });

    /**
     * @tc.name   testAesTagTamp20028
     * @tc.number SUB_CryptoFramework_AESTGTM2_01_0028
     * @tc.desc   deleting the auth tag hex nibble at position 27 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp20028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20028 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 27) + encJson.slice(TAG_OFFSET + 27 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20028 end');
    });

    /**
     * @tc.name   testAesTagTamp20029
     * @tc.number SUB_CryptoFramework_AESTGTM2_01_0029
     * @tc.desc   deleting the auth tag hex nibble at position 28 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp20029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20029 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 28) + encJson.slice(TAG_OFFSET + 28 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20029 end');
    });

    /**
     * @tc.name   testAesTagTamp20030
     * @tc.number SUB_CryptoFramework_AESTGTM2_01_0030
     * @tc.desc   deleting the auth tag hex nibble at position 29 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp20030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20030 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 29) + encJson.slice(TAG_OFFSET + 29 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20030 end');
    });

    /**
     * @tc.name   testAesTagTamp20031
     * @tc.number SUB_CryptoFramework_AESTGTM2_01_0031
     * @tc.desc   deleting the auth tag hex nibble at position 30 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp20031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20031 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 30) + encJson.slice(TAG_OFFSET + 30 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20031 end');
    });

    /**
     * @tc.name   testAesTagTamp20032
     * @tc.number SUB_CryptoFramework_AESTGTM2_01_0032
     * @tc.desc   deleting the auth tag hex nibble at position 31 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp20032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20032 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 31) + encJson.slice(TAG_OFFSET + 31 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20032 end');
    });

    /**
     * @tc.name   testAesTagTamp20033
     * @tc.number SUB_CryptoFramework_AESTGTM2_01_0033
     * @tc.desc   deleting two auth tag hex nibbles makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp20033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20033 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 0) + encJson.slice(TAG_OFFSET + 0 + 1, TAG_OFFSET +
        16) + encJson.slice(TAG_OFFSET + 16 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20033 end');
    });

    /**
     * @tc.name   testAesTagTamp20034
     * @tc.number SUB_CryptoFramework_AESTGTM2_01_0034
     * @tc.desc   deleting two auth tag hex nibbles at positions 1 and 17 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp20034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20034 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 1) + encJson.slice(TAG_OFFSET + 1 + 1, TAG_OFFSET +
        17) + encJson.slice(TAG_OFFSET + 17 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20034 end');
    });

    /**
     * @tc.name   testAesTagTamp20035
     * @tc.number SUB_CryptoFramework_AESTGTM2_01_0035
     * @tc.desc   deleting two auth tag hex nibbles at positions 2 and 18 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp20035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20035 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 2) + encJson.slice(TAG_OFFSET + 2 + 1, TAG_OFFSET +
        18) + encJson.slice(TAG_OFFSET + 18 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20035 end');
    });

    /**
     * @tc.name   testAesTagTamp20036
     * @tc.number SUB_CryptoFramework_AESTGTM2_01_0036
     * @tc.desc   deleting two auth tag hex nibbles at positions 3 and 19 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp20036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20036 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 3) + encJson.slice(TAG_OFFSET + 3 + 1, TAG_OFFSET +
        19) + encJson.slice(TAG_OFFSET + 19 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20036 end');
    });

    /**
     * @tc.name   testAesTagTamp20037
     * @tc.number SUB_CryptoFramework_AESTGTM2_01_0037
     * @tc.desc   deleting two auth tag hex nibbles at positions 4 and 20 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp20037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20037 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 4) + encJson.slice(TAG_OFFSET + 4 + 1, TAG_OFFSET +
        20) + encJson.slice(TAG_OFFSET + 20 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20037 end');
    });

    /**
     * @tc.name   testAesTagTamp20038
     * @tc.number SUB_CryptoFramework_AESTGTM2_01_0038
     * @tc.desc   deleting two auth tag hex nibbles at positions 5 and 21 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp20038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20038 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 5) + encJson.slice(TAG_OFFSET + 5 + 1, TAG_OFFSET +
        21) + encJson.slice(TAG_OFFSET + 21 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20038 end');
    });

    /**
     * @tc.name   testAesTagTamp20039
     * @tc.number SUB_CryptoFramework_AESTGTM2_01_0039
     * @tc.desc   deleting two auth tag hex nibbles at positions 6 and 22 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp20039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20039 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 6) + encJson.slice(TAG_OFFSET + 6 + 1, TAG_OFFSET +
        22) + encJson.slice(TAG_OFFSET + 22 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20039 end');
    });

    /**
     * @tc.name   testAesTagTamp20040
     * @tc.number SUB_CryptoFramework_AESTGTM2_01_0040
     * @tc.desc   deleting two auth tag hex nibbles at positions 7 and 23 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp20040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20040 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 7) + encJson.slice(TAG_OFFSET + 7 + 1, TAG_OFFSET +
        23) + encJson.slice(TAG_OFFSET + 23 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20040 end');
    });

    /**
     * @tc.name   testAesTagTamp20041
     * @tc.number SUB_CryptoFramework_AESTGTM2_01_0041
     * @tc.desc   deleting two auth tag hex nibbles at positions 8 and 24 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp20041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20041 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 8) + encJson.slice(TAG_OFFSET + 8 + 1, TAG_OFFSET +
        24) + encJson.slice(TAG_OFFSET + 24 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20041 end');
    });

    /**
     * @tc.name   testAesTagTamp20042
     * @tc.number SUB_CryptoFramework_AESTGTM2_01_0042
     * @tc.desc   deleting two auth tag hex nibbles at positions 9 and 25 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp20042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20042 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 9) + encJson.slice(TAG_OFFSET + 9 + 1, TAG_OFFSET +
        25) + encJson.slice(TAG_OFFSET + 25 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20042 end');
    });

    /**
     * @tc.name   testAesTagTamp20043
     * @tc.number SUB_CryptoFramework_AESTGTM2_01_0043
     * @tc.desc   deleting two auth tag hex nibbles at positions 10 and 26 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp20043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20043 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 10) + encJson.slice(TAG_OFFSET + 10 +
        1, TAG_OFFSET + 26) + encJson.slice(TAG_OFFSET + 26 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20043 end');
    });

    /**
     * @tc.name   testAesTagTamp20044
     * @tc.number SUB_CryptoFramework_AESTGTM2_01_0044
     * @tc.desc   deleting two auth tag hex nibbles at positions 11 and 27 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp20044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20044 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 11) + encJson.slice(TAG_OFFSET + 11 +
        1, TAG_OFFSET + 27) + encJson.slice(TAG_OFFSET + 27 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20044 end');
    });

    /**
     * @tc.name   testAesTagTamp20045
     * @tc.number SUB_CryptoFramework_AESTGTM2_01_0045
     * @tc.desc   deleting two auth tag hex nibbles at positions 12 and 28 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp20045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20045 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 12) + encJson.slice(TAG_OFFSET + 12 +
        1, TAG_OFFSET + 28) + encJson.slice(TAG_OFFSET + 28 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20045 end');
    });

    /**
     * @tc.name   testAesTagTamp20046
     * @tc.number SUB_CryptoFramework_AESTGTM2_01_0046
     * @tc.desc   deleting two auth tag hex nibbles at positions 13 and 29 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp20046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20046 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 13) + encJson.slice(TAG_OFFSET + 13 +
        1, TAG_OFFSET + 29) + encJson.slice(TAG_OFFSET + 29 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20046 end');
    });

    /**
     * @tc.name   testAesTagTamp20047
     * @tc.number SUB_CryptoFramework_AESTGTM2_01_0047
     * @tc.desc   deleting two auth tag hex nibbles at positions 14 and 30 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp20047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20047 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 14) + encJson.slice(TAG_OFFSET + 14 +
        1, TAG_OFFSET + 30) + encJson.slice(TAG_OFFSET + 30 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20047 end');
    });

    /**
     * @tc.name   testAesTagTamp20048
     * @tc.number SUB_CryptoFramework_AESTGTM2_01_0048
     * @tc.desc   deleting two auth tag hex nibbles at positions 15 and 31 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp20048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20048 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 15) + encJson.slice(TAG_OFFSET + 15 +
        1, TAG_OFFSET + 31) + encJson.slice(TAG_OFFSET + 31 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp20048 end');
    });

  });
}
