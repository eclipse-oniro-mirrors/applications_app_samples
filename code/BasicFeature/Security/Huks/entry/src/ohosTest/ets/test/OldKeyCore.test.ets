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

// 逻辑层 旧密钥 SM4 主题：HuksModel.encryptDataUserOldKey/importKey/decryptDataUserOldKey 的六维用例。
// 期望值来源：main 规格常量（SM4-CBC-PKCS7 按 16 字节块填充、固定密钥材料 PLAIN_TEXT_SIZE_16）
// + 状态推演（同进程固定 IV 使同明文密文恒定、cipherData 模块级覆盖写、成功回调恰好一次）。
import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { util } from '@kit.ArkTS';
import { HuksModel } from '../../../main/ets/model/HuksModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Huks]';
const PLAIN_15: string = 'ABCDEFGHIJKLMNO';
const PLAIN_16: string = 'ABCDEFGHIJKLMNOP';
const PLAIN_17: string = 'ABCDEFGHIJKLMNOPQ';
const PLAIN_32: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ012345';
const LONG_128: string = 'A'.repeat(128);
const LONG_1024: string = 'A'.repeat(1024);
// main 冻结行为：stringToUint8Array 按 UTF-16 单元取低 8 位，解密按字节还原
const MOJIBAKE_ZH_BYTES: string = '\u002D\u0087\u004B\u00D5';
const MOJIBAKE_EMOJI_BYTES: string = '\u003D\u0000';

interface CallResult {
  value: string;
  calls: number;
}

function decodeB64(input: string): Uint8Array {
  const helper: util.Base64Helper = new util.Base64Helper();
  return helper.decodeSync(input);
}

function callEncryptOld(model: HuksModel, plain: string): Promise<CallResult> {
  return new Promise<CallResult>((resolve: (result: CallResult) => void) => {
    let calls: number = 0;
    model.encryptDataUserOldKey(plain, (result: string) => {
      calls = calls + 1;
      const out: CallResult = { value: result, calls: calls };
      resolve(out);
    });
  });
}

function callImport(model: HuksModel): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    model.importKey().then((): void => {
      resolve();
    }).catch((): void => {
      resolve();
    });
  });
}

function callDecryptOld(model: HuksModel): Promise<CallResult> {
  return new Promise<CallResult>((resolve: (result: CallResult) => void) => {
    let calls: number = 0;
    model.decryptDataUserOldKey((result: string) => {
      calls = calls + 1;
      const out: CallResult = { value: result, calls: calls };
      resolve(out);
    });
  });
}

export default function oldKeyCore() {
  describe('HuksOldKeyCore', () => {
    let model: HuksModel = new HuksModel();

    beforeEach(() => {
      model = new HuksModel();
    });

    afterEach(() => {
      model = new HuksModel();
    });

    /**
     * @tc.number SUB_Huks_OLDKEY_0001
     * @tc.name testOldkey0001
     * @tc.desc 合法值：设备1加密-设备2导入-解密往返一致，5 字符填充后密文 16 字节
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testOldkey0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOldkey0001 begin');
      const encrypted: CallResult = await callEncryptOld(model, 'hello');
      await callImport(model);
      const decrypted: CallResult = await callDecryptOld(model);
      hilog.info(DOMAIN, TAG, 'cipherLen=%{public}d expected=24', encrypted.value.length);
      expect(encrypted.value.length).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'plain=%{public}s expected=hello', decrypted.value);
      expect(decrypted.value).assertEqual('hello');
      hilog.info(DOMAIN, TAG, 'calls=%{public}d expected=1', encrypted.calls);
      expect(encrypted.calls).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOldkey0001 end');
    });

    /**
     * @tc.number SUB_Huks_OLDKEY_0002
     * @tc.name testOldkey0002
     * @tc.desc 合法值：单字符明文在固定块内往返一致，密钥导入可复用
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testOldkey0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOldkey0002 begin');
      const encrypted: CallResult = await callEncryptOld(model, 'r');
      await callImport(model);
      const decrypted: CallResult = await callDecryptOld(model);
      const decoded: Uint8Array = decodeB64(encrypted.value);
      hilog.info(DOMAIN, TAG, 'cipherLen=%{public}d expected=24', encrypted.value.length);
      expect(encrypted.calls).assertEqual(1);
      expect(encrypted.value.length).assertEqual(24);
      expect(decoded.length).assertEqual(16);
      hilog.info(DOMAIN, TAG, 'plain=%{public}s expected=r', decrypted.value);
      expect(decrypted.value).assertEqual('r');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOldkey0002 end');
    });

    /**
     * @tc.number SUB_Huks_OLDKEY_0003
     * @tc.name testOldkey0003
     * @tc.desc 合法值：15 字符恰填满单块（1 字节填充），往返一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testOldkey0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOldkey0003 begin');
      const encrypted: CallResult = await callEncryptOld(model, PLAIN_15);
      await callImport(model);
      const decrypted: CallResult = await callDecryptOld(model);
      hilog.info(DOMAIN, TAG, 'cipherLen=%{public}d expected=24', encrypted.value.length);
      expect(encrypted.value.length).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'plainLen=%{public}d expected=15', decrypted.value.length);
      expect(decrypted.value.length).assertEqual(15);
      expect(decrypted.value).assertEqual(PLAIN_15);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOldkey0003 end');
    });

    /**
     * @tc.number SUB_Huks_OLDKEY_0004
     * @tc.name testOldkey0004
     * @tc.desc 合法值：16 字符整块触发整块填充，密文 32 字节，往返一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testOldkey0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOldkey0004 begin');
      const encrypted: CallResult = await callEncryptOld(model, PLAIN_16);
      await callImport(model);
      const decrypted: CallResult = await callDecryptOld(model);
      hilog.info(DOMAIN, TAG, 'cipherLen=%{public}d expected=44', encrypted.value.length);
      expect(encrypted.value.length).assertEqual(44);
      hilog.info(DOMAIN, TAG, 'plainLen=%{public}d expected=16', decrypted.value.length);
      expect(decrypted.value.length).assertEqual(16);
      expect(decrypted.value).assertEqual(PLAIN_16);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOldkey0004 end');
    });

    /**
     * @tc.number SUB_Huks_OLDKEY_0005
     * @tc.name testOldkey0005
     * @tc.desc 边界值：单字符明文下界，密文 16 字节，往返一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testOldkey0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOldkey0005 begin');
      const encrypted: CallResult = await callEncryptOld(model, 'A');
      await callImport(model);
      const decrypted: CallResult = await callDecryptOld(model);
      hilog.info(DOMAIN, TAG, 'cipherLen=%{public}d expected=24', encrypted.value.length);
      expect(encrypted.value.length).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'plain=%{public}s expected=A', decrypted.value);
      expect(decrypted.value).assertEqual('A');
      expect(decodeB64(encrypted.value).length).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOldkey0005 end');
    });

    /**
     * @tc.number SUB_Huks_OLDKEY_0006
     * @tc.name testOldkey0006
     * @tc.desc 边界值：15/16/17/32 字符档位密文 16/32/32/48 字节，各自往返一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testOldkey0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOldkey0006 begin');
      const enc15: CallResult = await callEncryptOld(model, PLAIN_15);
      await callImport(model);
      const dec15: CallResult = await callDecryptOld(model);
      const enc16: CallResult = await callEncryptOld(model, PLAIN_16);
      await callImport(model);
      const dec16: CallResult = await callDecryptOld(model);
      const enc17: CallResult = await callEncryptOld(model, PLAIN_17);
      await callImport(model);
      const dec17: CallResult = await callDecryptOld(model);
      const enc32: CallResult = await callEncryptOld(model, PLAIN_32);
      await callImport(model);
      const dec32: CallResult = await callDecryptOld(model);
      hilog.info(DOMAIN, TAG, 'lens=%{public}d/%{public}d/%{public}d/%{public}d expected=24/44/44/64',
        enc15.value.length, enc16.value.length, enc17.value.length, enc32.value.length);
      expect(enc15.value.length).assertEqual(24);
      expect(enc16.value.length).assertEqual(44);
      expect(enc17.value.length).assertEqual(44);
      expect(enc32.value.length).assertEqual(64);
      expect(dec15.value).assertEqual(PLAIN_15);
      expect(dec16.value).assertEqual(PLAIN_16);
      expect(dec17.value).assertEqual(PLAIN_17);
      expect(dec32.value).assertEqual(PLAIN_32);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOldkey0006 end');
    });

    /**
     * @tc.number SUB_Huks_OLDKEY_0007
     * @tc.name testOldkey0007
     * @tc.desc 边界值：单空格明文补一个填充块，往返一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testOldkey0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOldkey0007 begin');
      const encrypted: CallResult = await callEncryptOld(model, ' ');
      await callImport(model);
      const decrypted: CallResult = await callDecryptOld(model);
      hilog.info(DOMAIN, TAG, 'cipherLen=%{public}d expected=24', encrypted.value.length);
      expect(encrypted.value.length).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'plainLen=%{public}d expected=1', decrypted.value.length);
      expect(decrypted.value.length).assertEqual(1);
      expect(decrypted.value).assertEqual(' ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOldkey0007 end');
    });

    /**
     * @tc.number SUB_Huks_OLDKEY_0008
     * @tc.name testOldkey0008
     * @tc.desc 非法值：中文按 UTF-16 单元取低 8 位加密，往返为冻结字节串
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testOldkey0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOldkey0008 begin');
      const encrypted: CallResult = await callEncryptOld(model, '中文测试');
      await callImport(model);
      const decrypted: CallResult = await callDecryptOld(model);
      hilog.info(DOMAIN, TAG, 'cipherLen=%{public}d expected=24', encrypted.value.length);
      expect(encrypted.value.length).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'mojibake=%{public}s', decrypted.value);
      expect(decrypted.value).assertEqual(MOJIBAKE_ZH_BYTES);
      expect(decodeB64(encrypted.value).length).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOldkey0008 end');
    });

    /**
     * @tc.number SUB_Huks_OLDKEY_0009
     * @tc.name testOldkey0009
     * @tc.desc 非法值：emoji 按 2 个 UTF-16 单元取低 8 位加密，往返为冻结字节串
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testOldkey0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOldkey0009 begin');
      const encrypted: CallResult = await callEncryptOld(model, '😀');
      await callImport(model);
      const decrypted: CallResult = await callDecryptOld(model);
      hilog.info(DOMAIN, TAG, 'cipherLen=%{public}d expected=24', encrypted.value.length);
      expect(encrypted.value.length).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'mojibake=%{public}s', decrypted.value);
      expect(decrypted.value).assertEqual(MOJIBAKE_EMOJI_BYTES);
      expect(decodeB64(encrypted.value).length).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOldkey0009 end');
    });

    /**
     * @tc.number SUB_Huks_OLDKEY_0010
     * @tc.name testOldkey0010
     * @tc.desc 极值：数字字符串 0 与 -1 各自往返一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testOldkey0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOldkey0010 begin');
      const encZero: CallResult = await callEncryptOld(model, '0');
      await callImport(model);
      const decZero: CallResult = await callDecryptOld(model);
      const encNeg: CallResult = await callEncryptOld(model, '-1');
      await callImport(model);
      const decNeg: CallResult = await callDecryptOld(model);
      expect(encZero.value.length).assertEqual(24);
      expect(decZero.value).assertEqual('0');
      expect(encNeg.value.length).assertEqual(24);
      expect(decNeg.value).assertEqual('-1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOldkey0010 end');
    });

    /**
     * @tc.number SUB_Huks_OLDKEY_0011
     * @tc.name testOldkey0011
     * @tc.desc 极值：128 字符明文密文 144 字节，往返一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testOldkey0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOldkey0011 begin');
      const encrypted: CallResult = await callEncryptOld(model, LONG_128);
      await callImport(model);
      const decrypted: CallResult = await callDecryptOld(model);
      hilog.info(DOMAIN, TAG, 'cipherLen=%{public}d expected=192', encrypted.value.length);
      expect(encrypted.value.length).assertEqual(192);
      hilog.info(DOMAIN, TAG, 'plainLen=%{public}d expected=128', decrypted.value.length);
      expect(decrypted.value.length).assertEqual(128);
      expect(decrypted.value).assertEqual(LONG_128);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOldkey0011 end');
    });

    /**
     * @tc.number SUB_Huks_OLDKEY_0012
     * @tc.name testOldkey0012
     * @tc.desc 极值：1024 字符超长明文密文 1040 字节，往返一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testOldkey0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOldkey0012 begin');
      const encrypted: CallResult = await callEncryptOld(model, LONG_1024);
      await callImport(model);
      const decrypted: CallResult = await callDecryptOld(model);
      hilog.info(DOMAIN, TAG, 'cipherLen=%{public}d expected=1388', encrypted.value.length);
      expect(encrypted.value.length).assertEqual(1388);
      hilog.info(DOMAIN, TAG, 'plainLen=%{public}d expected=1024', decrypted.value.length);
      expect(decrypted.value.length).assertEqual(1024);
      expect(decrypted.value).assertEqual(LONG_1024);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOldkey0012 end');
    });

    /**
     * @tc.number SUB_Huks_OLDKEY_0013
     * @tc.name testOldkey0013
     * @tc.desc 组合值：固定密钥与固定 IV 下不同明文密文互异，长度一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testOldkey0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOldkey0013 begin');
      const enc1: CallResult = await callEncryptOld(model, 'abc');
      const enc2: CallResult = await callEncryptOld(model, 'xyz');
      hilog.info(DOMAIN, TAG, 'len1=%{public}d len2=%{public}d expected=24', enc1.value.length, enc2.value.length);
      expect(enc1.value.length).assertEqual(24);
      expect(enc2.value.length).assertEqual(24);
      expect(enc1.value === enc2.value).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOldkey0013 end');
    });

    /**
     * @tc.number SUB_Huks_OLDKEY_0014
     * @tc.name testOldkey0014
     * @tc.desc 组合值：固定密钥与固定 IV 下同明文密文恒定（CBC 确定性）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testOldkey0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOldkey0014 begin');
      const enc1: CallResult = await callEncryptOld(model, 'hello');
      const enc2: CallResult = await callEncryptOld(model, 'hello');
      hilog.info(DOMAIN, TAG, 'c1=%{public}s', enc1.value);
      hilog.info(DOMAIN, TAG, 'c2=%{public}s', enc2.value);
      expect(enc1.value === enc2.value).assertTrue();
      hilog.info(DOMAIN, TAG, 'len=%{public}d expected=24', enc1.value.length);
      expect(enc1.value.length).assertEqual(24);
      await callImport(model);
      const decrypted: CallResult = await callDecryptOld(model);
      expect(decrypted.value).assertEqual('hello');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOldkey0014 end');
    });

    /**
     * @tc.number SUB_Huks_OLDKEY_0015
     * @tc.name testOldkey0015
     * @tc.desc 组合值：密文字节数等于 16 字节块向上取整（16 与 32 两档）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testOldkey0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOldkey0015 begin');
      const encShort: CallResult = await callEncryptOld(model, 'hello');
      const enc16: CallResult = await callEncryptOld(model, PLAIN_16);
      const shortBytes: number = decodeB64(encShort.value).length;
      const bytes16: number = decodeB64(enc16.value).length;
      hilog.info(DOMAIN, TAG, 'bytes=%{public}d/%{public}d expected=16/32', shortBytes, bytes16);
      expect(shortBytes).assertEqual(16);
      expect(bytes16).assertEqual(32);
      expect(encShort.value.length).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOldkey0015 end');
    });

    /**
     * @tc.number SUB_Huks_OLDKEY_0016
     * @tc.name testOldkey0016
     * @tc.desc 状态：加密-导入-解密两个周期各自独立，往返值互不串扰
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testOldkey0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOldkey0016 begin');
      const enc1: CallResult = await callEncryptOld(model, 'first');
      await callImport(model);
      const dec1: CallResult = await callDecryptOld(model);
      const enc2: CallResult = await callEncryptOld(model, 'second');
      await callImport(model);
      const dec2: CallResult = await callDecryptOld(model);
      hilog.info(DOMAIN, TAG, 'plain1=%{public}s expected=first', dec1.value);
      expect(dec1.value).assertEqual('first');
      hilog.info(DOMAIN, TAG, 'plain2=%{public}s expected=second', dec2.value);
      expect(dec2.value).assertEqual('second');
      expect(enc1.value === enc2.value).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOldkey0016 end');
    });

    /**
     * @tc.number SUB_Huks_OLDKEY_0017
     * @tc.name testOldkey0017
     * @tc.desc 状态：连续两次加密覆盖模块密文状态，解密返回后一次明文
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testOldkey0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOldkey0017 begin');
      const enc1: CallResult = await callEncryptOld(model, 'first');
      const enc2: CallResult = await callEncryptOld(model, 'second');
      await callImport(model);
      const decrypted: CallResult = await callDecryptOld(model);
      hilog.info(DOMAIN, TAG, 'plain=%{public}s expected=second', decrypted.value);
      expect(decrypted.value).assertEqual('second');
      expect(decrypted.value === 'first').assertFalse();
      expect(enc1.value === enc2.value).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOldkey0017 end');
    });

    /**
     * @tc.number SUB_Huks_OLDKEY_0018
     * @tc.name testOldkey0018
     * @tc.desc 状态：设备2重复导入幂等，解密仍成功返回明文
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testOldkey0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOldkey0018 begin');
      const encrypted: CallResult = await callEncryptOld(model, 'hello');
      await callImport(model);
      await callImport(model);
      const decrypted: CallResult = await callDecryptOld(model);
      hilog.info(DOMAIN, TAG, 'plain=%{public}s expected=hello', decrypted.value);
      expect(decrypted.value).assertEqual('hello');
      hilog.info(DOMAIN, TAG, 'cipherLen=%{public}d expected=24', encrypted.value.length);
      expect(encrypted.value.length).assertEqual(24);
      expect(decrypted.calls).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOldkey0018 end');
    });

    /**
     * @tc.number SUB_Huks_OLDKEY_0019
     * @tc.name testOldkey0019
     * @tc.desc 组合值：加密与解密成功路径回调各恰好触发一次
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testOldkey0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOldkey0019 begin');
      const encrypted: CallResult = await callEncryptOld(model, 'hello');
      await callImport(model);
      const decrypted: CallResult = await callDecryptOld(model);
      hilog.info(DOMAIN, TAG, 'encCalls=%{public}d expected=1', encrypted.calls);
      expect(encrypted.calls).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'decCalls=%{public}d expected=1', decrypted.calls);
      expect(decrypted.calls).assertEqual(1);
      expect(decrypted.value).assertEqual('hello');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOldkey0019 end');
    });

    /**
     * @tc.number SUB_Huks_OLDKEY_0020
     * @tc.name testOldkey0020
     * @tc.desc 状态：同明文两轮周期密文恒定且往返值一致（固定密钥+固定 IV）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testOldkey0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOldkey0020 begin');
      const enc1: CallResult = await callEncryptOld(model, 'hello');
      await callImport(model);
      const dec1: CallResult = await callDecryptOld(model);
      const enc2: CallResult = await callEncryptOld(model, 'hello');
      await callImport(model);
      const dec2: CallResult = await callDecryptOld(model);
      expect(dec1.value).assertEqual('hello');
      expect(dec2.value).assertEqual('hello');
      hilog.info(DOMAIN, TAG, 'c1=%{public}s', enc1.value);
      hilog.info(DOMAIN, TAG, 'c2=%{public}s', enc2.value);
      expect(enc1.value === enc2.value).assertTrue();
      expect(enc1.value.length).assertEqual(24);
      expect(enc2.value.length).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOldkey0020 end');
    });
  });
}
