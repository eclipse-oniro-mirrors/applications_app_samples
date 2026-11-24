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

export default function aesChainTest() {
  describe('AesChain', () => {

    /**
     * @tc.name   testAesChain0001
     * @tc.number SUB_CryptoFramework_AESCHAIN_01_0001
     * @tc.desc   convert and encrypt with good 64-hex key on a 1-char plain text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChain0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0001 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: string = await op.aesConvertAndEncrypt('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0', 'x');
      const result: string = await op.aesConvertAndEncrypt('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0', 'x');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(2));
      expect(parseAes(result).encryptedText.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0001 end');
    });

    /**
     * @tc.name   testAesChain0002
     * @tc.number SUB_CryptoFramework_AESCHAIN_01_0002
     * @tc.desc   convert and encrypt with good 64-hex key on a 4-char plain text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChain0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0002 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: string = await op.aesConvertAndEncrypt('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0', 'xxxx');
      const result: string = await op.aesConvertAndEncrypt('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0', 'xxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(8));
      expect(parseAes(result).encryptedText.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0002 end');
    });

    /**
     * @tc.name   testAesChain0003
     * @tc.number SUB_CryptoFramework_AESCHAIN_01_0003
     * @tc.desc   convert and encrypt with good 64-hex key on a 16-char plain text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChain0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0003 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: string = await op.aesConvertAndEncrypt('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0', 'xxxxxxxxxxxxxxxx');
      const result: string = await op.aesConvertAndEncrypt('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0', 'xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(32));
      expect(parseAes(result).encryptedText.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0003 end');
    });

    /**
     * @tc.name   testAesChain0004
     * @tc.number SUB_CryptoFramework_AESCHAIN_01_0004
     * @tc.desc   convert and encrypt with good 64-hex key on a 32-char plain text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChain0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0004 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: string = await op.aesConvertAndEncrypt('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const result: string = await op.aesConvertAndEncrypt('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(64));
      expect(parseAes(result).encryptedText.length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0004 end');
    });

    /**
     * @tc.name   testAesChain0005
     * @tc.number SUB_CryptoFramework_AESCHAIN_01_0005
     * @tc.desc   convert and encrypt with good 64-hex key on a 63-char plain text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChain0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0005 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: string = await op.aesConvertAndEncrypt('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const result: string = await op.aesConvertAndEncrypt('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0c0', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(126));
      expect(parseAes(result).encryptedText.length).assertEqual(126);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0005 end');
    });

    /**
     * @tc.name   testAesChain0006
     * @tc.number SUB_CryptoFramework_AESCHAIN_01_0006
     * @tc.desc   convert and encrypt with alternate 64-hex key on a 1-char plain text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChain0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0006 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: string = await op.aesConvertAndEncrypt('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0', 'x');
      const result: string = await op.aesConvertAndEncrypt('cccccccccccccccccccccccccccccccccccccccccccccccccccc' +
'cccccccccccc', 'x');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(2));
      expect(parseAes(result).encryptedText.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0006 end');
    });

    /**
     * @tc.name   testAesChain0007
     * @tc.number SUB_CryptoFramework_AESCHAIN_01_0007
     * @tc.desc   convert and encrypt with alternate 64-hex key on a 4-char plain text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChain0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0007 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: string = await op.aesConvertAndEncrypt('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0', 'xxxx');
      const result: string = await op.aesConvertAndEncrypt('cccccccccccccccccccccccccccccccccccccccccccccccccccc' +
'cccccccccccc', 'xxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(8));
      expect(parseAes(result).encryptedText.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0007 end');
    });

    /**
     * @tc.name   testAesChain0008
     * @tc.number SUB_CryptoFramework_AESCHAIN_01_0008
     * @tc.desc   convert and encrypt with alternate 64-hex key on a 16-char plain text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChain0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0008 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: string = await op.aesConvertAndEncrypt('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0', 'xxxxxxxxxxxxxxxx');
      const result: string = await op.aesConvertAndEncrypt('cccccccccccccccccccccccccccccccccccccccccccccccccccc' +
'cccccccccccc', 'xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(32));
      expect(parseAes(result).encryptedText.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0008 end');
    });

    /**
     * @tc.name   testAesChain0009
     * @tc.number SUB_CryptoFramework_AESCHAIN_01_0009
     * @tc.desc   convert and encrypt with alternate 64-hex key on a 32-char plain text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChain0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0009 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: string = await op.aesConvertAndEncrypt('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const result: string = await op.aesConvertAndEncrypt('cccccccccccccccccccccccccccccccccccccccccccccccccccc' +
'cccccccccccc', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(64));
      expect(parseAes(result).encryptedText.length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0009 end');
    });

    /**
     * @tc.name   testAesChain0010
     * @tc.number SUB_CryptoFramework_AESCHAIN_01_0010
     * @tc.desc   convert and encrypt with alternate 64-hex key on a 63-char plain text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChain0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0010 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: string = await op.aesConvertAndEncrypt('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const result: string = await op.aesConvertAndEncrypt('cccccccccccccccccccccccccccccccccccccccccccccccccccc' +
'cccccccccccc', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(126));
      expect(parseAes(result).encryptedText.length).assertEqual(126);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0010 end');
    });

    /**
     * @tc.name   testAesChain0011
     * @tc.number SUB_CryptoFramework_AESCHAIN_01_0011
     * @tc.desc   convert and encrypt with 63-char odd-length key on a 1-char plain text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChain0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0011 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: string = await op.aesConvertAndEncrypt('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0', 'x');
      const result: string = await op.aesConvertAndEncrypt('0000000000000000000000000000000000000000000000000000' +
'00000000000', 'x');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(2));
      expect(parseAes(result).encryptedText.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0011 end');
    });

    /**
     * @tc.name   testAesChain0012
     * @tc.number SUB_CryptoFramework_AESCHAIN_01_0012
     * @tc.desc   convert and encrypt with 63-char odd-length key on a 4-char plain text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChain0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0012 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: string = await op.aesConvertAndEncrypt('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0', 'xxxx');
      const result: string = await op.aesConvertAndEncrypt('0000000000000000000000000000000000000000000000000000' +
'00000000000', 'xxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(8));
      expect(parseAes(result).encryptedText.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0012 end');
    });

    /**
     * @tc.name   testAesChain0013
     * @tc.number SUB_CryptoFramework_AESCHAIN_01_0013
     * @tc.desc   convert and encrypt with 63-char odd-length key on a 16-char plain text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChain0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0013 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: string = await op.aesConvertAndEncrypt('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0', 'xxxxxxxxxxxxxxxx');
      const result: string = await op.aesConvertAndEncrypt('0000000000000000000000000000000000000000000000000000' +
'00000000000', 'xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(32));
      expect(parseAes(result).encryptedText.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0013 end');
    });

    /**
     * @tc.name   testAesChain0014
     * @tc.number SUB_CryptoFramework_AESCHAIN_01_0014
     * @tc.desc   convert and encrypt with 63-char odd-length key on a 32-char plain text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChain0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0014 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: string = await op.aesConvertAndEncrypt('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const result: string = await op.aesConvertAndEncrypt('0000000000000000000000000000000000000000000000000000' +
'00000000000', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(64));
      expect(parseAes(result).encryptedText.length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0014 end');
    });

    /**
     * @tc.name   testAesChain0015
     * @tc.number SUB_CryptoFramework_AESCHAIN_01_0015
     * @tc.desc   convert and encrypt with 63-char odd-length key on a 63-char plain text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChain0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0015 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: string = await op.aesConvertAndEncrypt('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const result: string = await op.aesConvertAndEncrypt('0000000000000000000000000000000000000000000000000000' +
'00000000000', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(126));
      expect(parseAes(result).encryptedText.length).assertEqual(126);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0015 end');
    });

    /**
     * @tc.name   testAesChain0016
     * @tc.number SUB_CryptoFramework_AESCHAIN_01_0016
     * @tc.desc   convert and encrypt with invalid chars zeroed key on a 1-char plain text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChain0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0016 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: string = await op.aesConvertAndEncrypt('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0', 'x');
      const result: string = await op.aesConvertAndEncrypt('zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz' +
'zzzzzzzzzzzz', 'x');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(2));
      expect(parseAes(result).encryptedText.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0016 end');
    });

    /**
     * @tc.name   testAesChain0017
     * @tc.number SUB_CryptoFramework_AESCHAIN_01_0017
     * @tc.desc   convert and encrypt with invalid chars zeroed key on a 4-char plain text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChain0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0017 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: string = await op.aesConvertAndEncrypt('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0', 'xxxx');
      const result: string = await op.aesConvertAndEncrypt('zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz' +
'zzzzzzzzzzzz', 'xxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(8));
      expect(parseAes(result).encryptedText.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0017 end');
    });

    /**
     * @tc.name   testAesChain0018
     * @tc.number SUB_CryptoFramework_AESCHAIN_01_0018
     * @tc.desc   convert and encrypt with invalid chars zeroed key on a 16-char plain text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChain0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0018 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: string = await op.aesConvertAndEncrypt('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0', 'xxxxxxxxxxxxxxxx');
      const result: string = await op.aesConvertAndEncrypt('zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz' +
'zzzzzzzzzzzz', 'xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(32));
      expect(parseAes(result).encryptedText.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0018 end');
    });

    /**
     * @tc.name   testAesChain0019
     * @tc.number SUB_CryptoFramework_AESCHAIN_01_0019
     * @tc.desc   convert and encrypt with invalid chars zeroed key on a 32-char plain text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChain0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0019 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: string = await op.aesConvertAndEncrypt('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const result: string = await op.aesConvertAndEncrypt('zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz' +
'zzzzzzzzzzzz', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(64));
      expect(parseAes(result).encryptedText.length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0019 end');
    });

    /**
     * @tc.name   testAesChain0020
     * @tc.number SUB_CryptoFramework_AESCHAIN_01_0020
     * @tc.desc   convert and encrypt with invalid chars zeroed key on a 63-char plain text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChain0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0020 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: string = await op.aesConvertAndEncrypt('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const result: string = await op.aesConvertAndEncrypt('zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz' +
'zzzzzzzzzzzz', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).aesGcmTag.length), String(32));
      expect(parseAes(result).aesGcmTag.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(result).encryptedText.length), String(126));
      expect(parseAes(result).encryptedText.length).assertEqual(126);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0020 end');
    });

    /**
     * @tc.name   testAesChain0021
     * @tc.number SUB_CryptoFramework_AESCHAIN_01_0021
     * @tc.desc   convert and encrypt with 62-char key on a 1-char plain text is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChain0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0021 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: string = await op.aesConvertAndEncrypt('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0', 'x');
      const result: string = await op.aesConvertAndEncrypt('0000000000000000000000000000000000000000000000000000' +
'0000000000', 'x');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(ctrl).encryptedText.length), String(2));
      expect(parseAes(ctrl).encryptedText.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0021 end');
    });

    /**
     * @tc.name   testAesChain0022
     * @tc.number SUB_CryptoFramework_AESCHAIN_01_0022
     * @tc.desc   convert and encrypt with 62-char key on a 4-char plain text is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChain0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0022 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: string = await op.aesConvertAndEncrypt('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0', 'xxxx');
      const result: string = await op.aesConvertAndEncrypt('0000000000000000000000000000000000000000000000000000' +
'0000000000', 'xxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(ctrl).encryptedText.length), String(8));
      expect(parseAes(ctrl).encryptedText.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0022 end');
    });

    /**
     * @tc.name   testAesChain0023
     * @tc.number SUB_CryptoFramework_AESCHAIN_01_0023
     * @tc.desc   convert and encrypt with 62-char key on a 16-char plain text is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChain0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0023 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: string = await op.aesConvertAndEncrypt('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0', 'xxxxxxxxxxxxxxxx');
      const result: string = await op.aesConvertAndEncrypt('0000000000000000000000000000000000000000000000000000' +
'0000000000', 'xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(ctrl).encryptedText.length), String(32));
      expect(parseAes(ctrl).encryptedText.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0023 end');
    });

    /**
     * @tc.name   testAesChain0024
     * @tc.number SUB_CryptoFramework_AESCHAIN_01_0024
     * @tc.desc   convert and encrypt with 62-char key on a 32-char plain text is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChain0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0024 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: string = await op.aesConvertAndEncrypt('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const result: string = await op.aesConvertAndEncrypt('0000000000000000000000000000000000000000000000000000' +
'0000000000', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(ctrl).encryptedText.length), String(64));
      expect(parseAes(ctrl).encryptedText.length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0024 end');
    });

    /**
     * @tc.name   testAesChain0025
     * @tc.number SUB_CryptoFramework_AESCHAIN_01_0025
     * @tc.desc   convert and encrypt with 62-char key on a 63-char plain text is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChain0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0025 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: string = await op.aesConvertAndEncrypt('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const result: string = await op.aesConvertAndEncrypt('0000000000000000000000000000000000000000000000000000' +
'0000000000', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(ctrl).encryptedText.length), String(126));
      expect(parseAes(ctrl).encryptedText.length).assertEqual(126);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0025 end');
    });

    /**
     * @tc.name   testAesChain0026
     * @tc.number SUB_CryptoFramework_AESCHAIN_01_0026
     * @tc.desc   empty key string makes convert and encrypt return null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChain0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0026 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: string = await op.aesConvertAndEncrypt('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0', 'x');
      const result: string = await op.aesConvertAndEncrypt('', 'x');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(ctrl).encryptedText.length), String(2));
      expect(parseAes(ctrl).encryptedText.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0026 end');
    });

    /**
     * @tc.name   testAesChain0027
     * @tc.number SUB_CryptoFramework_AESCHAIN_01_0027
     * @tc.desc   convert and encrypt with empty key string on a 4-char plain text is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChain0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0027 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: string = await op.aesConvertAndEncrypt('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0', 'xxxx');
      const result: string = await op.aesConvertAndEncrypt('', 'xxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(ctrl).encryptedText.length), String(8));
      expect(parseAes(ctrl).encryptedText.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0027 end');
    });

    /**
     * @tc.name   testAesChain0028
     * @tc.number SUB_CryptoFramework_AESCHAIN_01_0028
     * @tc.desc   convert and encrypt with empty key string on a 16-char plain text is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChain0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0028 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: string = await op.aesConvertAndEncrypt('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0', 'xxxxxxxxxxxxxxxx');
      const result: string = await op.aesConvertAndEncrypt('', 'xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(ctrl).encryptedText.length), String(32));
      expect(parseAes(ctrl).encryptedText.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0028 end');
    });

    /**
     * @tc.name   testAesChain0029
     * @tc.number SUB_CryptoFramework_AESCHAIN_01_0029
     * @tc.desc   convert and encrypt with empty key string on a 32-char plain text is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChain0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0029 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: string = await op.aesConvertAndEncrypt('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const result: string = await op.aesConvertAndEncrypt('', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(ctrl).encryptedText.length), String(64));
      expect(parseAes(ctrl).encryptedText.length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0029 end');
    });

    /**
     * @tc.name   testAesChain0030
     * @tc.number SUB_CryptoFramework_AESCHAIN_01_0030
     * @tc.desc   convert and encrypt with empty key string on a 63-char plain text is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChain0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0030 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: string = await op.aesConvertAndEncrypt('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const result: string = await op.aesConvertAndEncrypt('', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
'xxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(ctrl).encryptedText.length), String(126));
      expect(parseAes(ctrl).encryptedText.length).assertEqual(126);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0030 end');
    });

    /**
     * @tc.name   testAesChain0031
     * @tc.number SUB_CryptoFramework_AESCHAIN_01_0031
     * @tc.desc   convert and encrypt with 61-char key on a 1-char plain text is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChain0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0031 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: string = await op.aesConvertAndEncrypt('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0', 'x');
      const result: string = await op.aesConvertAndEncrypt('0000000000000000000000000000000000000000000000000000' +
'000000000', 'x');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(ctrl).encryptedText.length), String(2));
      expect(parseAes(ctrl).encryptedText.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0031 end');
    });

    /**
     * @tc.name   testAesChain0032
     * @tc.number SUB_CryptoFramework_AESCHAIN_01_0032
     * @tc.desc   convert and encrypt with 61-char key on a 4-char plain text is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChain0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0032 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: string = await op.aesConvertAndEncrypt('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0', 'xxxx');
      const result: string = await op.aesConvertAndEncrypt('0000000000000000000000000000000000000000000000000000' +
'000000000', 'xxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(ctrl).encryptedText.length), String(8));
      expect(parseAes(ctrl).encryptedText.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0032 end');
    });

    /**
     * @tc.name   testAesChain0033
     * @tc.number SUB_CryptoFramework_AESCHAIN_01_0033
     * @tc.desc   convert and encrypt with 61-char key on a 16-char plain text is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChain0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0033 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: string = await op.aesConvertAndEncrypt('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0', 'xxxxxxxxxxxxxxxx');
      const result: string = await op.aesConvertAndEncrypt('0000000000000000000000000000000000000000000000000000' +
'000000000', 'xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(ctrl).encryptedText.length), String(32));
      expect(parseAes(ctrl).encryptedText.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0033 end');
    });

    /**
     * @tc.name   testAesChain0034
     * @tc.number SUB_CryptoFramework_AESCHAIN_01_0034
     * @tc.desc   convert and encrypt with 61-char key on a 32-char plain text is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChain0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0034 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: string = await op.aesConvertAndEncrypt('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const result: string = await op.aesConvertAndEncrypt('0000000000000000000000000000000000000000000000000000' +
'000000000', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(ctrl).encryptedText.length), String(64));
      expect(parseAes(ctrl).encryptedText.length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0034 end');
    });

    /**
     * @tc.name   testAesChain0035
     * @tc.number SUB_CryptoFramework_AESCHAIN_01_0035
     * @tc.desc   convert and encrypt with 61-char key on a 63-char plain text is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChain0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0035 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: string = await op.aesConvertAndEncrypt('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const result: string = await op.aesConvertAndEncrypt('0000000000000000000000000000000000000000000000000000' +
'000000000', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(ctrl).encryptedText.length), String(126));
      expect(parseAes(ctrl).encryptedText.length).assertEqual(126);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0035 end');
    });

    /**
     * @tc.name   testAesChain0036
     * @tc.number SUB_CryptoFramework_AESCHAIN_01_0036
     * @tc.desc   convert and encrypt with 65-char key on a 1-char plain text is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChain0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0036 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: string = await op.aesConvertAndEncrypt('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0', 'x');
      const result: string = await op.aesConvertAndEncrypt('0000000000000000000000000000000000000000000000000000' +
'0000000000000', 'x');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(ctrl).encryptedText.length), String(2));
      expect(parseAes(ctrl).encryptedText.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0036 end');
    });

    /**
     * @tc.name   testAesChain0037
     * @tc.number SUB_CryptoFramework_AESCHAIN_01_0037
     * @tc.desc   convert and encrypt with 65-char key on a 4-char plain text is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChain0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0037 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: string = await op.aesConvertAndEncrypt('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0', 'xxxx');
      const result: string = await op.aesConvertAndEncrypt('0000000000000000000000000000000000000000000000000000' +
'0000000000000', 'xxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(ctrl).encryptedText.length), String(8));
      expect(parseAes(ctrl).encryptedText.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0037 end');
    });

    /**
     * @tc.name   testAesChain0038
     * @tc.number SUB_CryptoFramework_AESCHAIN_01_0038
     * @tc.desc   convert and encrypt with 65-char key on a 16-char plain text is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChain0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0038 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: string = await op.aesConvertAndEncrypt('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0', 'xxxxxxxxxxxxxxxx');
      const result: string = await op.aesConvertAndEncrypt('0000000000000000000000000000000000000000000000000000' +
'0000000000000', 'xxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(ctrl).encryptedText.length), String(32));
      expect(parseAes(ctrl).encryptedText.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0038 end');
    });

    /**
     * @tc.name   testAesChain0039
     * @tc.number SUB_CryptoFramework_AESCHAIN_01_0039
     * @tc.desc   convert and encrypt with 65-char key on a 32-char plain text is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChain0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0039 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: string = await op.aesConvertAndEncrypt('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const result: string = await op.aesConvertAndEncrypt('0000000000000000000000000000000000000000000000000000' +
'0000000000000', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(ctrl).encryptedText.length), String(64));
      expect(parseAes(ctrl).encryptedText.length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0039 end');
    });

    /**
     * @tc.name   testAesChain0040
     * @tc.number SUB_CryptoFramework_AESCHAIN_01_0040
     * @tc.desc   convert and encrypt with 65-char key on a 63-char plain text is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAesChain0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0040 begin');
      const op: CryptoOperation = new CryptoOperation();
      const ctrl: string = await op.aesConvertAndEncrypt('c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0' +
'c0c0c0c0c0', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      const result: string = await op.aesConvertAndEncrypt('0000000000000000000000000000000000000000000000000000' +
'0000000000000', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === null));
      expect(result === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ctrl === null));
      expect(ctrl === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(parseAes(ctrl).encryptedText.length), String(126));
      expect(parseAes(ctrl).encryptedText.length).assertEqual(126);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesChain0040 end');
    });

  });
}
