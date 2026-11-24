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

export default function aesTagTamp1Test() {
  describe('AesTagTamp1', () => {

    /**
     * @tc.name   testAesTagTamp10001
     * @tc.number SUB_CryptoFramework_AESTGTM1_01_0001
     * @tc.desc   nibble complement of the first auth tag hex char makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp10001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10001 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 0) + (15 - parseInt(encJson.charAt(TAG_OFFSET +
        0), 16)).toString(16) + encJson.slice(TAG_OFFSET + 0 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10001 end');
    });

    /**
     * @tc.name   testAesTagTamp10002
     * @tc.number SUB_CryptoFramework_AESTGTM1_01_0002
     * @tc.desc   nibble complement of auth tag hex at position 1 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp10002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10002 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 1) + (15 - parseInt(encJson.charAt(TAG_OFFSET +
        1), 16)).toString(16) + encJson.slice(TAG_OFFSET + 1 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10002 end');
    });

    /**
     * @tc.name   testAesTagTamp10003
     * @tc.number SUB_CryptoFramework_AESTGTM1_01_0003
     * @tc.desc   nibble complement of auth tag hex at position 2 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp10003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10003 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 2) + (15 - parseInt(encJson.charAt(TAG_OFFSET +
        2), 16)).toString(16) + encJson.slice(TAG_OFFSET + 2 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10003 end');
    });

    /**
     * @tc.name   testAesTagTamp10004
     * @tc.number SUB_CryptoFramework_AESTGTM1_01_0004
     * @tc.desc   nibble complement of auth tag hex at position 3 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp10004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10004 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 3) + (15 - parseInt(encJson.charAt(TAG_OFFSET +
        3), 16)).toString(16) + encJson.slice(TAG_OFFSET + 3 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10004 end');
    });

    /**
     * @tc.name   testAesTagTamp10005
     * @tc.number SUB_CryptoFramework_AESTGTM1_01_0005
     * @tc.desc   nibble complement of auth tag hex at position 4 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp10005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10005 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 4) + (15 - parseInt(encJson.charAt(TAG_OFFSET +
        4), 16)).toString(16) + encJson.slice(TAG_OFFSET + 4 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10005 end');
    });

    /**
     * @tc.name   testAesTagTamp10006
     * @tc.number SUB_CryptoFramework_AESTGTM1_01_0006
     * @tc.desc   nibble complement of auth tag hex at position 5 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp10006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10006 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 5) + (15 - parseInt(encJson.charAt(TAG_OFFSET +
        5), 16)).toString(16) + encJson.slice(TAG_OFFSET + 5 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10006 end');
    });

    /**
     * @tc.name   testAesTagTamp10007
     * @tc.number SUB_CryptoFramework_AESTGTM1_01_0007
     * @tc.desc   nibble complement of auth tag hex at position 6 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp10007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10007 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 6) + (15 - parseInt(encJson.charAt(TAG_OFFSET +
        6), 16)).toString(16) + encJson.slice(TAG_OFFSET + 6 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10007 end');
    });

    /**
     * @tc.name   testAesTagTamp10008
     * @tc.number SUB_CryptoFramework_AESTGTM1_01_0008
     * @tc.desc   nibble complement of auth tag hex at position 7 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp10008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10008 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 7) + (15 - parseInt(encJson.charAt(TAG_OFFSET +
        7), 16)).toString(16) + encJson.slice(TAG_OFFSET + 7 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10008 end');
    });

    /**
     * @tc.name   testAesTagTamp10009
     * @tc.number SUB_CryptoFramework_AESTGTM1_01_0009
     * @tc.desc   nibble complement of auth tag hex at position 8 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp10009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10009 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 8) + (15 - parseInt(encJson.charAt(TAG_OFFSET +
        8), 16)).toString(16) + encJson.slice(TAG_OFFSET + 8 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10009 end');
    });

    /**
     * @tc.name   testAesTagTamp10010
     * @tc.number SUB_CryptoFramework_AESTGTM1_01_0010
     * @tc.desc   nibble complement of auth tag hex at position 9 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp10010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10010 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 9) + (15 - parseInt(encJson.charAt(TAG_OFFSET +
        9), 16)).toString(16) + encJson.slice(TAG_OFFSET + 9 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10010 end');
    });

    /**
     * @tc.name   testAesTagTamp10011
     * @tc.number SUB_CryptoFramework_AESTGTM1_01_0011
     * @tc.desc   nibble complement of auth tag hex at position 10 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp10011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10011 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 10) + (15 - parseInt(encJson.charAt(TAG_OFFSET +
        10), 16)).toString(16) + encJson.slice(TAG_OFFSET + 10 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10011 end');
    });

    /**
     * @tc.name   testAesTagTamp10012
     * @tc.number SUB_CryptoFramework_AESTGTM1_01_0012
     * @tc.desc   nibble complement of auth tag hex at position 11 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp10012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10012 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 11) + (15 - parseInt(encJson.charAt(TAG_OFFSET +
        11), 16)).toString(16) + encJson.slice(TAG_OFFSET + 11 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10012 end');
    });

    /**
     * @tc.name   testAesTagTamp10013
     * @tc.number SUB_CryptoFramework_AESTGTM1_01_0013
     * @tc.desc   nibble complement of auth tag hex at position 12 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp10013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10013 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 12) + (15 - parseInt(encJson.charAt(TAG_OFFSET +
        12), 16)).toString(16) + encJson.slice(TAG_OFFSET + 12 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10013 end');
    });

    /**
     * @tc.name   testAesTagTamp10014
     * @tc.number SUB_CryptoFramework_AESTGTM1_01_0014
     * @tc.desc   nibble complement of auth tag hex at position 13 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp10014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10014 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 13) + (15 - parseInt(encJson.charAt(TAG_OFFSET +
        13), 16)).toString(16) + encJson.slice(TAG_OFFSET + 13 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10014 end');
    });

    /**
     * @tc.name   testAesTagTamp10015
     * @tc.number SUB_CryptoFramework_AESTGTM1_01_0015
     * @tc.desc   nibble complement of auth tag hex at position 14 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp10015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10015 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 14) + (15 - parseInt(encJson.charAt(TAG_OFFSET +
        14), 16)).toString(16) + encJson.slice(TAG_OFFSET + 14 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10015 end');
    });

    /**
     * @tc.name   testAesTagTamp10016
     * @tc.number SUB_CryptoFramework_AESTGTM1_01_0016
     * @tc.desc   nibble complement of auth tag hex at position 15 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp10016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10016 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 15) + (15 - parseInt(encJson.charAt(TAG_OFFSET +
        15), 16)).toString(16) + encJson.slice(TAG_OFFSET + 15 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10016 end');
    });

    /**
     * @tc.name   testAesTagTamp10017
     * @tc.number SUB_CryptoFramework_AESTGTM1_01_0017
     * @tc.desc   nibble complement of auth tag hex at position 16 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp10017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10017 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 16) + (15 - parseInt(encJson.charAt(TAG_OFFSET +
        16), 16)).toString(16) + encJson.slice(TAG_OFFSET + 16 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10017 end');
    });

    /**
     * @tc.name   testAesTagTamp10018
     * @tc.number SUB_CryptoFramework_AESTGTM1_01_0018
     * @tc.desc   nibble complement of auth tag hex at position 17 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp10018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10018 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 17) + (15 - parseInt(encJson.charAt(TAG_OFFSET +
        17), 16)).toString(16) + encJson.slice(TAG_OFFSET + 17 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10018 end');
    });

    /**
     * @tc.name   testAesTagTamp10019
     * @tc.number SUB_CryptoFramework_AESTGTM1_01_0019
     * @tc.desc   nibble complement of auth tag hex at position 18 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp10019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10019 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 18) + (15 - parseInt(encJson.charAt(TAG_OFFSET +
        18), 16)).toString(16) + encJson.slice(TAG_OFFSET + 18 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10019 end');
    });

    /**
     * @tc.name   testAesTagTamp10020
     * @tc.number SUB_CryptoFramework_AESTGTM1_01_0020
     * @tc.desc   nibble complement of auth tag hex at position 19 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp10020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10020 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 19) + (15 - parseInt(encJson.charAt(TAG_OFFSET +
        19), 16)).toString(16) + encJson.slice(TAG_OFFSET + 19 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10020 end');
    });

    /**
     * @tc.name   testAesTagTamp10021
     * @tc.number SUB_CryptoFramework_AESTGTM1_01_0021
     * @tc.desc   nibble complement of auth tag hex at position 20 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp10021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10021 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 20) + (15 - parseInt(encJson.charAt(TAG_OFFSET +
        20), 16)).toString(16) + encJson.slice(TAG_OFFSET + 20 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10021 end');
    });

    /**
     * @tc.name   testAesTagTamp10022
     * @tc.number SUB_CryptoFramework_AESTGTM1_01_0022
     * @tc.desc   nibble complement of auth tag hex at position 21 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp10022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10022 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 21) + (15 - parseInt(encJson.charAt(TAG_OFFSET +
        21), 16)).toString(16) + encJson.slice(TAG_OFFSET + 21 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10022 end');
    });

    /**
     * @tc.name   testAesTagTamp10023
     * @tc.number SUB_CryptoFramework_AESTGTM1_01_0023
     * @tc.desc   nibble complement of auth tag hex at position 22 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp10023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10023 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 22) + (15 - parseInt(encJson.charAt(TAG_OFFSET +
        22), 16)).toString(16) + encJson.slice(TAG_OFFSET + 22 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10023 end');
    });

    /**
     * @tc.name   testAesTagTamp10024
     * @tc.number SUB_CryptoFramework_AESTGTM1_01_0024
     * @tc.desc   nibble complement of auth tag hex at position 23 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp10024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10024 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 23) + (15 - parseInt(encJson.charAt(TAG_OFFSET +
        23), 16)).toString(16) + encJson.slice(TAG_OFFSET + 23 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10024 end');
    });

    /**
     * @tc.name   testAesTagTamp10025
     * @tc.number SUB_CryptoFramework_AESTGTM1_01_0025
     * @tc.desc   nibble complement of auth tag hex at position 24 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp10025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10025 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 24) + (15 - parseInt(encJson.charAt(TAG_OFFSET +
        24), 16)).toString(16) + encJson.slice(TAG_OFFSET + 24 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10025 end');
    });

    /**
     * @tc.name   testAesTagTamp10026
     * @tc.number SUB_CryptoFramework_AESTGTM1_01_0026
     * @tc.desc   nibble complement of auth tag hex at position 25 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp10026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10026 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 25) + (15 - parseInt(encJson.charAt(TAG_OFFSET +
        25), 16)).toString(16) + encJson.slice(TAG_OFFSET + 25 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10026 end');
    });

    /**
     * @tc.name   testAesTagTamp10027
     * @tc.number SUB_CryptoFramework_AESTGTM1_01_0027
     * @tc.desc   nibble complement of auth tag hex at position 26 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp10027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10027 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 26) + (15 - parseInt(encJson.charAt(TAG_OFFSET +
        26), 16)).toString(16) + encJson.slice(TAG_OFFSET + 26 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10027 end');
    });

    /**
     * @tc.name   testAesTagTamp10028
     * @tc.number SUB_CryptoFramework_AESTGTM1_01_0028
     * @tc.desc   nibble complement of auth tag hex at position 27 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp10028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10028 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 27) + (15 - parseInt(encJson.charAt(TAG_OFFSET +
        27), 16)).toString(16) + encJson.slice(TAG_OFFSET + 27 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10028 end');
    });

    /**
     * @tc.name   testAesTagTamp10029
     * @tc.number SUB_CryptoFramework_AESTGTM1_01_0029
     * @tc.desc   nibble complement of auth tag hex at position 28 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp10029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10029 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 28) + (15 - parseInt(encJson.charAt(TAG_OFFSET +
        28), 16)).toString(16) + encJson.slice(TAG_OFFSET + 28 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10029 end');
    });

    /**
     * @tc.name   testAesTagTamp10030
     * @tc.number SUB_CryptoFramework_AESTGTM1_01_0030
     * @tc.desc   nibble complement of auth tag hex at position 29 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp10030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10030 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 29) + (15 - parseInt(encJson.charAt(TAG_OFFSET +
        29), 16)).toString(16) + encJson.slice(TAG_OFFSET + 29 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10030 end');
    });

    /**
     * @tc.name   testAesTagTamp10031
     * @tc.number SUB_CryptoFramework_AESTGTM1_01_0031
     * @tc.desc   nibble complement of auth tag hex at position 30 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp10031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10031 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 30) + (15 - parseInt(encJson.charAt(TAG_OFFSET +
        30), 16)).toString(16) + encJson.slice(TAG_OFFSET + 30 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10031 end');
    });

    /**
     * @tc.name   testAesTagTamp10032
     * @tc.number SUB_CryptoFramework_AESTGTM1_01_0032
     * @tc.desc   nibble complement of auth tag hex at position 31 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp10032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10032 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 31) + (15 - parseInt(encJson.charAt(TAG_OFFSET +
        31), 16)).toString(16) + encJson.slice(TAG_OFFSET + 31 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10032 end');
    });

    /**
     * @tc.name   testAesTagTamp10033
     * @tc.number SUB_CryptoFramework_AESTGTM1_01_0033
     * @tc.desc   zero or one flip of auth tag hex at position 0 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp10033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10033 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 0) + encJson.charAt(TAG_OFFSET +
        0) === '0' ? '1' : '0' + encJson.slice(TAG_OFFSET + 0 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10033 end');
    });

    /**
     * @tc.name   testAesTagTamp10034
     * @tc.number SUB_CryptoFramework_AESTGTM1_01_0034
     * @tc.desc   edge nibble flip of auth tag hex at position 0 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp10034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10034 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 0) + encJson.charAt(TAG_OFFSET +
        0) === 'f' ? 'e' : 'f' + encJson.slice(TAG_OFFSET + 0 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10034 end');
    });

    /**
     * @tc.name   testAesTagTamp10035
     * @tc.number SUB_CryptoFramework_AESTGTM1_01_0035
     * @tc.desc   zero or one flip of auth tag hex at position 4 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp10035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10035 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 4) + encJson.charAt(TAG_OFFSET +
        4) === '0' ? '1' : '0' + encJson.slice(TAG_OFFSET + 4 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10035 end');
    });

    /**
     * @tc.name   testAesTagTamp10036
     * @tc.number SUB_CryptoFramework_AESTGTM1_01_0036
     * @tc.desc   edge nibble flip of auth tag hex at position 4 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp10036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10036 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 4) + encJson.charAt(TAG_OFFSET +
        4) === 'f' ? 'e' : 'f' + encJson.slice(TAG_OFFSET + 4 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10036 end');
    });

    /**
     * @tc.name   testAesTagTamp10037
     * @tc.number SUB_CryptoFramework_AESTGTM1_01_0037
     * @tc.desc   zero or one flip of auth tag hex at position 8 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp10037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10037 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 8) + encJson.charAt(TAG_OFFSET +
        8) === '0' ? '1' : '0' + encJson.slice(TAG_OFFSET + 8 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10037 end');
    });

    /**
     * @tc.name   testAesTagTamp10038
     * @tc.number SUB_CryptoFramework_AESTGTM1_01_0038
     * @tc.desc   edge nibble flip of auth tag hex at position 8 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp10038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10038 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 8) + encJson.charAt(TAG_OFFSET +
        8) === 'f' ? 'e' : 'f' + encJson.slice(TAG_OFFSET + 8 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10038 end');
    });

    /**
     * @tc.name   testAesTagTamp10039
     * @tc.number SUB_CryptoFramework_AESTGTM1_01_0039
     * @tc.desc   zero or one flip of auth tag hex at position 12 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp10039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10039 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 12) + encJson.charAt(TAG_OFFSET +
        12) === '0' ? '1' : '0' + encJson.slice(TAG_OFFSET + 12 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10039 end');
    });

    /**
     * @tc.name   testAesTagTamp10040
     * @tc.number SUB_CryptoFramework_AESTGTM1_01_0040
     * @tc.desc   edge nibble flip of auth tag hex at position 12 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp10040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10040 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 12) + encJson.charAt(TAG_OFFSET +
        12) === 'f' ? 'e' : 'f' + encJson.slice(TAG_OFFSET + 12 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10040 end');
    });

    /**
     * @tc.name   testAesTagTamp10041
     * @tc.number SUB_CryptoFramework_AESTGTM1_01_0041
     * @tc.desc   zero or one flip of auth tag hex at position 16 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp10041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10041 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 16) + encJson.charAt(TAG_OFFSET +
        16) === '0' ? '1' : '0' + encJson.slice(TAG_OFFSET + 16 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10041 end');
    });

    /**
     * @tc.name   testAesTagTamp10042
     * @tc.number SUB_CryptoFramework_AESTGTM1_01_0042
     * @tc.desc   edge nibble flip of auth tag hex at position 16 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp10042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10042 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 16) + encJson.charAt(TAG_OFFSET +
        16) === 'f' ? 'e' : 'f' + encJson.slice(TAG_OFFSET + 16 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10042 end');
    });

    /**
     * @tc.name   testAesTagTamp10043
     * @tc.number SUB_CryptoFramework_AESTGTM1_01_0043
     * @tc.desc   zero or one flip of auth tag hex at position 20 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp10043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10043 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 20) + encJson.charAt(TAG_OFFSET +
        20) === '0' ? '1' : '0' + encJson.slice(TAG_OFFSET + 20 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10043 end');
    });

    /**
     * @tc.name   testAesTagTamp10044
     * @tc.number SUB_CryptoFramework_AESTGTM1_01_0044
     * @tc.desc   edge nibble flip of auth tag hex at position 20 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp10044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10044 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 20) + encJson.charAt(TAG_OFFSET +
        20) === 'f' ? 'e' : 'f' + encJson.slice(TAG_OFFSET + 20 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10044 end');
    });

    /**
     * @tc.name   testAesTagTamp10045
     * @tc.number SUB_CryptoFramework_AESTGTM1_01_0045
     * @tc.desc   zero or one flip of auth tag hex at position 24 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp10045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10045 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 24) + encJson.charAt(TAG_OFFSET +
        24) === '0' ? '1' : '0' + encJson.slice(TAG_OFFSET + 24 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10045 end');
    });

    /**
     * @tc.name   testAesTagTamp10046
     * @tc.number SUB_CryptoFramework_AESTGTM1_01_0046
     * @tc.desc   edge nibble flip of auth tag hex at position 24 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp10046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10046 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 24) + encJson.charAt(TAG_OFFSET +
        24) === 'f' ? 'e' : 'f' + encJson.slice(TAG_OFFSET + 24 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10046 end');
    });

    /**
     * @tc.name   testAesTagTamp10047
     * @tc.number SUB_CryptoFramework_AESTGTM1_01_0047
     * @tc.desc   zero or one flip of auth tag hex at position 28 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp10047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10047 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 28) + encJson.charAt(TAG_OFFSET +
        28) === '0' ? '1' : '0' + encJson.slice(TAG_OFFSET + 28 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10047 end');
    });

    /**
     * @tc.name   testAesTagTamp10048
     * @tc.number SUB_CryptoFramework_AESTGTM1_01_0048
     * @tc.desc   edge nibble flip of auth tag hex at position 28 makes decryption fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesTagTamp10048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10048 begin');
      const op: CryptoOperation = new CryptoOperation();
      const key: cryptoFramework.SymKey = await op.convertAesKey('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c' +
        '0c0c0c0c0c0c0c0c0c0');
      const encJson: string = await op.aesGcmEncrypt(key, 'xxxxxxxxxxxxxxxx');
      const tampered: string = encJson.slice(0, TAG_OFFSET + 28) + encJson.charAt(TAG_OFFSET +
        28) === 'f' ? 'e' : 'f' + encJson.slice(TAG_OFFSET + 28 + 1);
      const ctrlPlain: string = await op.aesGcmDecrypt(key, encJson);
      const result: string = await op.aesGcmDecrypt(key, tampered);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(ctrlPlain), String('xxxxxxxxxxxxxxxx'));
      expect(ctrlPlain).assertEqual('xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(ctrlPlain.length), String(16));
      expect(ctrlPlain.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesTagTamp10048 end');
    });

  });
}
