/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { CryptoOperation } from '../../../main/ets/cryptoframework/CryptoOperation';
import cryptoFramework from '@ohos.security.cryptoFramework';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CryptoFramework]';

class DecryptOutcome {
  public decrypted: string = '';
  public thrown: boolean = false;
}

function repeatChar(ch: string, count: number): string {
  let ret: string = '';
  for (let i = 0; i < count; i++) {
    ret += ch;
  }
  return ret;
}

async function decryptSafely(op: CryptoOperation, key: cryptoFramework.SymKey, json: string): Promise<DecryptOutcome> {
  const outcome: DecryptOutcome = new DecryptOutcome();
  try {
    outcome.decrypted = await op.aesGcmDecrypt(key, json);
    outcome.thrown = false;
  } catch (e) {
    outcome.thrown = true;
    outcome.decrypted = '';
  }
  return outcome;
}

export default function aesCipherCore() {
  describe('AesCipherCore', () => {
    let op: CryptoOperation = new CryptoOperation();

    beforeEach(() => {
      op = new CryptoOperation();
    });

    afterEach(() => {
      op = new CryptoOperation();
    });

    /**
     * @tc.number SUB_CryptoFramework_AESCIP_0001
     * @tc.name testAesCipher0001
     * @tc.desc 合法值：英文文本加密后解密还原原文
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testAesCipher0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0001 begin');
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const plain: string = 'hello crypto framework';
      const encrypted: string = await op.aesGcmEncrypt(key, plain);
      const decrypted: string = await op.aesGcmDecrypt(key, encrypted);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', decrypted, plain);
      expect(decrypted).assertEqual(plain);
      expect(encrypted === null).assertFalse();
      expect(decrypted === null).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0001 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESCIP_0002
     * @tc.name testAesCipher0002
     * @tc.desc 合法值：数字文本加密后解密还原原文
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testAesCipher0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0002 begin');
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const plain: string = '01234567890123456789';
      const encrypted: string = await op.aesGcmEncrypt(key, plain);
      const decrypted: string = await op.aesGcmDecrypt(key, encrypted);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', decrypted, plain);
      expect(decrypted).assertEqual(plain);
      expect(encrypted.indexOf('encryptedText') >= 0).assertTrue();
      expect(decrypted.length).assertEqual(plain.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0002 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESCIP_0003
     * @tc.name testAesCipher0003
     * @tc.desc 合法值：字母数字符号混合文本往返一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testAesCipher0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0003 begin');
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const plain: string = 'Ab3!@#dEf9_+=-';
      const encrypted: string = await op.aesGcmEncrypt(key, plain);
      const decrypted: string = await op.aesGcmDecrypt(key, encrypted);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', decrypted, plain);
      expect(decrypted).assertEqual(plain);
      expect(encrypted === null).assertFalse();
      expect(decrypted === null).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0003 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESCIP_0004
     * @tc.name testAesCipher0004
     * @tc.desc 合法值：JSON 文本加密后解密还原原文
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testAesCipher0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0004 begin');
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const plain: string = '{"name":"crypto","version":26,"ok":true}';
      const encrypted: string = await op.aesGcmEncrypt(key, plain);
      const decrypted: string = await op.aesGcmDecrypt(key, encrypted);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', decrypted, plain);
      expect(decrypted).assertEqual(plain);
      expect(decrypted.length).assertEqual(plain.length);
      expect(encrypted.indexOf('aesGcmTag') >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0004 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESCIP_0005
     * @tc.name testAesCipher0005
     * @tc.desc 合法值：URL 风格文本加密后解密还原原文
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testAesCipher0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0005 begin');
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const plain: string = 'https://example.com/path?q=1&x=2';
      const encrypted: string = await op.aesGcmEncrypt(key, plain);
      const decrypted: string = await op.aesGcmDecrypt(key, encrypted);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', decrypted, plain);
      expect(decrypted).assertEqual(plain);
      expect(decrypted === null).assertFalse();
      expect(encrypted === null).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0005 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESCIP_0006
     * @tc.name testAesCipher0006
     * @tc.desc 合法值：Latin-1 高位字符（0x80~0xFF 单字节）往返一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testAesCipher0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0006 begin');
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const plain: string = 'caf\u00e9 \u00e0 la mode';
      const encrypted: string = await op.aesGcmEncrypt(key, plain);
      const decrypted: string = await op.aesGcmDecrypt(key, encrypted);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', decrypted, plain);
      expect(decrypted).assertEqual(plain);
      expect(decrypted.length).assertEqual(plain.length);
      expect(encrypted === null).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0006 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESCIP_0007
     * @tc.name testAesCipher0007
     * @tc.desc 边界值：空字符串加密被拒绝（返回 null），非空明文链路正常
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testAesCipher0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0007 begin');
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const plain: string = '';
      const encrypted: string = await op.aesGcmEncrypt(key, plain);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(encrypted === null), 'true');
      expect(encrypted === null).assertTrue();
      const ctrl: string = await op.aesGcmEncrypt(key, 'control');
      const decCtrl: string = await op.aesGcmDecrypt(key, ctrl);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', decCtrl, 'control');
      expect(decCtrl).assertEqual('control');
      expect(ctrl === null).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0007 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESCIP_0008
     * @tc.name testAesCipher0008
     * @tc.desc 边界值：单字符文本加密后解密还原
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testAesCipher0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0008 begin');
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const plain: string = 'A';
      const encrypted: string = await op.aesGcmEncrypt(key, plain);
      const decrypted: string = await op.aesGcmDecrypt(key, encrypted);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', decrypted, plain);
      expect(decrypted).assertEqual(plain);
      expect(decrypted.length).assertEqual(1);
      expect(encrypted === null).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0008 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESCIP_0009
     * @tc.name testAesCipher0009
     * @tc.desc 边界值：15 字符（块长度-1）往返一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testAesCipher0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0009 begin');
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const plain: string = repeatChar('b', 15);
      const encrypted: string = await op.aesGcmEncrypt(key, plain);
      const decrypted: string = await op.aesGcmDecrypt(key, encrypted);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', decrypted, plain);
      expect(decrypted).assertEqual(plain);
      expect(decrypted.length).assertEqual(15);
      expect(encrypted === null).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0009 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESCIP_0010
     * @tc.name testAesCipher0010
     * @tc.desc 边界值：16 字符（整块）往返一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testAesCipher0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0010 begin');
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const plain: string = repeatChar('c', 16);
      const encrypted: string = await op.aesGcmEncrypt(key, plain);
      const decrypted: string = await op.aesGcmDecrypt(key, encrypted);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', decrypted, plain);
      expect(decrypted).assertEqual(plain);
      expect(decrypted.length).assertEqual(16);
      expect(encrypted === null).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0010 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESCIP_0011
     * @tc.name testAesCipher0011
     * @tc.desc 边界值：17 字符（块长度+1）往返一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testAesCipher0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0011 begin');
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const plain: string = repeatChar('d', 17);
      const encrypted: string = await op.aesGcmEncrypt(key, plain);
      const decrypted: string = await op.aesGcmDecrypt(key, encrypted);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', decrypted, plain);
      expect(decrypted).assertEqual(plain);
      expect(decrypted.length).assertEqual(17);
      expect(encrypted === null).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0011 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESCIP_0012
     * @tc.name testAesCipher0012
     * @tc.desc 边界值：8192 字符文本往返一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testAesCipher0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0012 begin');
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const plain: string = repeatChar('e', 8192);
      const encrypted: string = await op.aesGcmEncrypt(key, plain);
      const decrypted: string = await op.aesGcmDecrypt(key, encrypted);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', decrypted.length, 8192);
      expect(decrypted).assertEqual(plain);
      expect(decrypted.length).assertEqual(8192);
      expect(encrypted === null).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0012 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESCIP_0013
     * @tc.name testAesCipher0013
     * @tc.desc 非法值：非 JSON 字符串解密返回 null
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testAesCipher0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0013 begin');
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const badJson: string = 'not-a-json';
      const decrypted: string = await op.aesGcmDecrypt(key, badJson);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', decrypted === null ? 'null' : decrypted, 'null');
      expect(decrypted === null).assertTrue();
      expect(decrypted === 'not-a-json').assertFalse();
      expect(badJson.indexOf('{') < 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0013 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESCIP_0014
     * @tc.name testAesCipher0014
     * @tc.desc 非法值：缺 aesGcmTag 字段的 JSON 解密失败且不返回原文
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testAesCipher0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0014 begin');
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const plain: string = 'target text';
      const encrypted: string = await op.aesGcmEncrypt(key, plain);
      const textStart: number = encrypted.indexOf('encryptedText') + 16;
      const textEnd: number = encrypted.indexOf('"', textStart);
      const tampered: string = '{"encryptedText":"' + encrypted.substring(textStart, textEnd) + '"}';
      const outcome: DecryptOutcome = await decryptSafely(op, key, tampered);
      const failed: boolean = outcome.thrown || outcome.decrypted === null;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(failed), 'true');
      expect(failed).assertTrue();
      expect(outcome.decrypted === plain).assertFalse();
      expect(tampered.indexOf('aesGcmTag') < 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0014 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESCIP_0015
     * @tc.name testAesCipher0015
     * @tc.desc 非法值：缺 encryptedText 字段的 JSON 解密失败且不返回原文
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testAesCipher0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0015 begin');
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const plain: string = 'target text';
      const encrypted: string = await op.aesGcmEncrypt(key, plain);
      const tagStart: number = encrypted.indexOf('aesGcmTag') + 12;
      const tagEnd: number = tagStart + 32;
      const tampered: string = '{"aesGcmTag":"' + encrypted.substring(tagStart, tagEnd) + '"}';
      const outcome: DecryptOutcome = await decryptSafely(op, key, tampered);
      const failed: boolean = outcome.thrown || outcome.decrypted === null;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(failed), 'true');
      expect(failed).assertTrue();
      expect(outcome.decrypted === plain).assertFalse();
      expect(tampered.indexOf('encryptedText') < 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0015 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESCIP_0016
     * @tc.name testAesCipher0016
     * @tc.desc 非法值：篡改 GCM authTag 后解密失败（完整性验证不通过）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testAesCipher0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0016 begin');
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const plain: string = 'tamper me';
      const encrypted: string = await op.aesGcmEncrypt(key, plain);
      const tagStart: number = encrypted.indexOf('aesGcmTag') + 12;
      const tampered: string = encrypted.substring(0, tagStart) + '0' + encrypted.substring(tagStart + 1);
      const outcome: DecryptOutcome = await decryptSafely(op, key, tampered);
      const failed: boolean = outcome.thrown || outcome.decrypted === null;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(failed), 'true');
      expect(failed).assertTrue();
      expect(outcome.decrypted === plain).assertFalse();
      expect(tampered === encrypted).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0016 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESCIP_0017
     * @tc.name testAesCipher0017
     * @tc.desc 非法值：篡改密文后解密失败（完整性验证不通过）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testAesCipher0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0017 begin');
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const plain: string = 'tamper cipher';
      const encrypted: string = await op.aesGcmEncrypt(key, plain);
      const textStart: number = encrypted.indexOf('encryptedText') + 16;
      const tampered: string = encrypted.substring(0, textStart) + '0' + encrypted.substring(textStart + 1);
      const outcome: DecryptOutcome = await decryptSafely(op, key, tampered);
      const failed: boolean = outcome.thrown || outcome.decrypted === null;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(failed), 'true');
      expect(failed).assertTrue();
      expect(outcome.decrypted === plain).assertFalse();
      expect(tampered === encrypted).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0017 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESCIP_0018
     * @tc.name testAesCipher0018
     * @tc.desc 非法值：非 hex 字符的 authTag 解密失败
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testAesCipher0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0018 begin');
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const plain: string = 'bad tag';
      const encrypted: string = await op.aesGcmEncrypt(key, plain);
      const tagStart: number = encrypted.indexOf('aesGcmTag') + 12;
      const badJson: string =
        encrypted.substring(0, tagStart) + repeatChar('z', 32) + encrypted.substring(tagStart + 32);
      const outcome: DecryptOutcome = await decryptSafely(op, key, badJson);
      const failed: boolean = outcome.thrown || outcome.decrypted === null;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(failed), 'true');
      expect(failed).assertTrue();
      expect(outcome.decrypted === plain).assertFalse();
      expect(badJson.indexOf('zz') >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0018 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESCIP_0019
     * @tc.name testAesCipher0019
     * @tc.desc 非法值：奇数长度的密文 hex 解密失败
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testAesCipher0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0019 begin');
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const plain: string = 'odd cipher';
      const encrypted: string = await op.aesGcmEncrypt(key, plain);
      const textStart: number = encrypted.indexOf('encryptedText') + 16;
      const oddJson: string = encrypted.substring(0, textStart) + 'a' + encrypted.substring(textStart);
      const outcome: DecryptOutcome = await decryptSafely(op, key, oddJson);
      const failed: boolean = outcome.thrown || outcome.decrypted === null;
      const hexEnd: number = oddJson.indexOf('"', textStart);
      const hexFieldLen: number = hexEnd - textStart;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(failed), 'true');
      expect(failed).assertTrue();
      expect(outcome.decrypted === plain).assertFalse();
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', hexFieldLen, 1);
      expect(hexFieldLen % 2).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0019 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESCIP_0020
     * @tc.name testAesCipher0020
     * @tc.desc 非法值：用另一把密钥解密失败
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testAesCipher0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0020 begin');
      const keyA: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const keyB: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const plain: string = 'wrong key';
      const encrypted: string = await op.aesGcmEncrypt(keyA, plain);
      const outcome: DecryptOutcome = await decryptSafely(op, keyB, encrypted);
      const failed: boolean = outcome.thrown || outcome.decrypted === null;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(failed), 'true');
      expect(failed).assertTrue();
      expect(outcome.decrypted === plain).assertFalse();
      expect(keyA.getEncoded().data[0] === keyB.getEncoded().data[0]).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0020 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESCIP_0021
     * @tc.name testAesCipher0021
     * @tc.desc 极值：10000 字符长文本往返一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testAesCipher0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0021 begin');
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const plain: string = repeatChar('f', 10000);
      const encrypted: string = await op.aesGcmEncrypt(key, plain);
      const decrypted: string = await op.aesGcmDecrypt(key, encrypted);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', decrypted.length, 10000);
      expect(decrypted).assertEqual(plain);
      expect(decrypted.length).assertEqual(10000);
      expect(encrypted === null).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0021 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESCIP_0022
     * @tc.name testAesCipher0022
     * @tc.desc 极值：含换行与制表符的文本往返一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testAesCipher0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0022 begin');
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const plain: string = 'line1\nline2\tcolumn3\r\nend';
      const encrypted: string = await op.aesGcmEncrypt(key, plain);
      const decrypted: string = await op.aesGcmDecrypt(key, encrypted);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', decrypted, plain);
      expect(decrypted).assertEqual(plain);
      expect(decrypted.indexOf('\n') >= 0).assertTrue();
      expect(decrypted.indexOf('\t') >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0022 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESCIP_0023
     * @tc.name testAesCipher0023
     * @tc.desc 极值：含 0x00 与 0xFF 字节字符的文本往返一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testAesCipher0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0023 begin');
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const plain: string = 'a\u0000b\u00ffc';
      const encrypted: string = await op.aesGcmEncrypt(key, plain);
      const decrypted: string = await op.aesGcmDecrypt(key, encrypted);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', decrypted, plain);
      expect(decrypted).assertEqual(plain);
      expect(decrypted.charCodeAt(1)).assertEqual(0);
      expect(decrypted.charCodeAt(3)).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0023 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESCIP_0024
     * @tc.name testAesCipher0024
     * @tc.desc 极值：重复字符压缩型文本往返一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testAesCipher0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0024 begin');
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const plain: string = 'ab' + repeatChar('0', 100) + 'cd';
      const encrypted: string = await op.aesGcmEncrypt(key, plain);
      const decrypted: string = await op.aesGcmDecrypt(key, encrypted);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', decrypted, plain);
      expect(decrypted).assertEqual(plain);
      expect(decrypted.length).assertEqual(104);
      expect(encrypted === null).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0024 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESCIP_0025
     * @tc.name testAesCipher0025
     * @tc.desc 状态：同一密钥连续加密五次不同文本，各自解密一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testAesCipher0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0025 begin');
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const texts: string[] = ['m1', 'm2', 'm3', 'm4', 'm5'];
      let allOk: boolean = true;
      for (let i = 0; i < 5; i++) {
        const enc: string = await op.aesGcmEncrypt(key, texts[i]);
        const dec: string = await op.aesGcmDecrypt(key, enc);
        if (dec !== texts[i]) {
          allOk = false;
        }
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(allOk), 'true');
      expect(allOk).assertTrue();
      expect(texts.length).assertEqual(5);
      expect(key === null).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0025 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESCIP_0026
     * @tc.name testAesCipher0026
     * @tc.desc 状态：交替加密解密两次均还原对应原文
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testAesCipher0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0026 begin');
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const encA: string = await op.aesGcmEncrypt(key, 'alternate A');
      const decA: string = await op.aesGcmDecrypt(key, encA);
      const encB: string = await op.aesGcmEncrypt(key, 'alternate B');
      const decB: string = await op.aesGcmDecrypt(key, encB);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', decA, 'alternate A');
      expect(decA).assertEqual('alternate A');
      expect(decB).assertEqual('alternate B');
      expect(encA === encB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0026 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESCIP_0027
     * @tc.name testAesCipher0027
     * @tc.desc 状态：固定 IV/AAD 下同密钥同明文两次加密结果相同（main 冻结规则）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testAesCipher0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0027 begin');
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const plain: string = 'deterministic check';
      const encA: string = await op.aesGcmEncrypt(key, plain);
      const encB: string = await op.aesGcmEncrypt(key, plain);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', encA === encB ? 'same' : 'diff', 'same');
      expect(encA === encB).assertTrue();
      expect(encA === null).assertFalse();
      expect(encA.indexOf('aesGcmTag') >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0027 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESCIP_0028
     * @tc.name testAesCipher0028
     * @tc.desc 状态：加密输出 JSON 结构符合约定（aesGcmTag 32 hex，encryptedText 偶数长 hex）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testAesCipher0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0028 begin');
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const encrypted: string = await op.aesGcmEncrypt(key, 'structure check');
      const tagStart: number = encrypted.indexOf('aesGcmTag') + 12;
      const tag: string = encrypted.substring(tagStart, tagStart + 32);
      const textStart: number = encrypted.indexOf('encryptedText') + 16;
      const textEnd: number = encrypted.indexOf('"', textStart);
      const cipherHex: string = encrypted.substring(textStart, textEnd);
      const structureOk: boolean = tag.length === 32 && cipherHex.length % 2 === 0 && cipherHex.length > 0;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(structureOk), 'true');
      expect(structureOk).assertTrue();
      expect(tag.length).assertEqual(32);
      expect(cipherHex.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0028 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESCIP_0029
     * @tc.name testAesCipher0029
     * @tc.desc 组合：两把密钥各自往返成功且交叉解密失败（密钥隔离）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testAesCipher0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0029 begin');
      const keyA: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const keyB: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const encA: string = await op.aesGcmEncrypt(keyA, 'isolation A');
      const encB: string = await op.aesGcmEncrypt(keyB, 'isolation B');
      const decAA: string = await op.aesGcmDecrypt(keyA, encA);
      const decBB: string = await op.aesGcmDecrypt(keyB, encB);
      const crossA: DecryptOutcome = await decryptSafely(op, keyB, encA);
      const crossB: DecryptOutcome = await decryptSafely(op, keyA, encB);
      const crossFailed: boolean =
        (crossA.thrown || crossA.decrypted === null) && (crossB.thrown || crossB.decrypted === null);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(crossFailed), 'true');
      expect(decAA).assertEqual('isolation A');
      expect(decBB).assertEqual('isolation B');
      expect(crossFailed).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0029 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_AESCIP_0030
     * @tc.name testAesCipher0030
     * @tc.desc 组合：加密再解密的明文长度与原文一致且密文比原文长（含 GCM tag 开销）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testAesCipher0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0030 begin');
      const key: cryptoFramework.SymKey = await op.convertAesKey(await op.generateAesKey());
      const plain: string = 'length relation';
      const encrypted: string = await op.aesGcmEncrypt(key, plain);
      const decrypted: string = await op.aesGcmDecrypt(key, encrypted);
      const longerThanPlain: boolean = encrypted.length > plain.length;
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', decrypted.length, plain.length);
      expect(decrypted.length).assertEqual(plain.length);
      expect(longerThanPlain).assertTrue();
      expect(decrypted === null).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAesCipher0030 end');
    });
  });
}
