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

// 逻辑层 新密钥 AES 主题：HuksModel.encryptData/decryptData 的六维用例。
// 期望值来源：main 规格常量（GCM tag 16 字节）+ 状态推演（同进程固定 IV、
// 成功路径回调恰好一次、cipherDataString 模块级覆盖写、密文长度 = UTF-8 字节数 + 16）。
import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { util } from '@kit.ArkTS';
import { HuksModel } from '../../../main/ets/model/HuksModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Huks]';
// GCM tag 固定 16 字节（main 冻结规格）
const GCM_TAG_LEN: number = 16;
const PLAIN_19: string = 'ABCDEFGHIJKLMNOPQRS';
const PLAIN_20: string = 'ABCDEFGHIJKLMNOPQRST';
const PLAIN_21: string = 'ABCDEFGHIJKLMNOPQRSTU';
const LONG_100: string = 'A'.repeat(100);
const LONG_1024: string = 'A'.repeat(1024);
const MAX_SAFE_STR: string = '9007199254740991';
// main 冻结行为：decrypt 按字节还原 UTF-8 数据，非 ASCII 输入的往返结果固定
const MOJIBAKE_ZH_UTF8: string =
  '\u00E4\u00B8\u00AD\u00E6\u0096\u0087\u00E6\u00B5\u008B\u00E8\u00AF\u0095';
const MOJIBAKE_EMOJI_UTF8: string = '\u00F0\u009F\u0098\u0080';

interface CallResult {
  value: string;
  calls: number;
}

function decodeB64(input: string): Uint8Array {
  const helper: util.Base64Helper = new util.Base64Helper();
  return helper.decodeSync(input);
}

function callEncrypt(model: HuksModel, plain: string): Promise<CallResult> {
  return new Promise<CallResult>((resolve: (result: CallResult) => void) => {
    let calls: number = 0;
    model.encryptData(plain, (result: string) => {
      calls = calls + 1;
      const out: CallResult = { value: result, calls: calls };
      resolve(out);
    });
  });
}

function callDecrypt(model: HuksModel): Promise<CallResult> {
  return new Promise<CallResult>((resolve: (result: CallResult) => void) => {
    let calls: number = 0;
    model.decryptData((result: string) => {
      calls = calls + 1;
      const out: CallResult = { value: result, calls: calls };
      resolve(out);
    });
  });
}

export default function newKeyCore() {
  describe('HuksNewKeyCore', () => {
    let model: HuksModel = new HuksModel();

    beforeEach(() => {
      model = new HuksModel();
    });

    afterEach(() => {
      model = new HuksModel();
    });

    /**
     * @tc.number SUB_Huks_AES_0001
     * @tc.name testAes0001
     * @tc.desc 合法值：5 字符明文加解密往返一致，密文长度 = UTF-8 字节数 + 16 字节 tag 的 base64
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testAes0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAes0001 begin');
      const encrypted: CallResult = await callEncrypt(model, 'hello');
      const decrypted: CallResult = await callDecrypt(model);
      hilog.info(DOMAIN, TAG, 'cipherLen=%{public}d expected=28', encrypted.value.length);
      expect(encrypted.value.length).assertEqual(28);
      hilog.info(DOMAIN, TAG, 'plain=%{public}s expected=hello', decrypted.value);
      expect(decrypted.value).assertEqual('hello');
      hilog.info(DOMAIN, TAG, 'calls=%{public}d expected=1', encrypted.calls);
      expect(encrypted.calls).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAes0001 end');
    });

    /**
     * @tc.number SUB_Huks_AES_0002
     * @tc.name testAes0002
     * @tc.desc 正向对照：单字符明文密文为 1 字节明文加 16 字节 GCM tag，解密往返一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testAes0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAes0002 begin');
      // 正向对照：单字节明文密文等于 1 字节明文 + 16 字节 GCM tag 的 base64
      const encrypted: CallResult = await callEncrypt(model, 'r');
      const decrypted: CallResult = await callDecrypt(model);
      const decoded: Uint8Array = decodeB64(encrypted.value);
      expect(encrypted.calls).assertEqual(1);
      expect(decoded.length).assertEqual(GCM_TAG_LEN + 1);
      expect(decrypted.value).assertEqual('r');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAes0002 end');
    });

    /**
     * @tc.number SUB_Huks_AES_0003
     * @tc.name testAes0003
     * @tc.desc 合法值：20 字符明文全程加密不截断，往返一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testAes0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAes0003 begin');
      const encrypted: CallResult = await callEncrypt(model, PLAIN_20);
      const decrypted: CallResult = await callDecrypt(model);
      hilog.info(DOMAIN, TAG, 'cipherLen=%{public}d expected=48', encrypted.value.length);
      expect(encrypted.value.length).assertEqual(48);
      hilog.info(DOMAIN, TAG, 'plain=%{public}s', decrypted.value);
      expect(decrypted.value).assertEqual(PLAIN_20);
      const decoded: Uint8Array = decodeB64(encrypted.value);
      hilog.info(DOMAIN, TAG, 'bytes=%{public}d expected=36', decoded.length);
      expect(decoded.length).assertEqual(36);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAes0003 end');
    });

    /**
     * @tc.number SUB_Huks_AES_0004
     * @tc.name testAes0004
     * @tc.desc 合法值：100 字符长明文往返一致，密文 116 字节
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testAes0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAes0004 begin');
      const encrypted: CallResult = await callEncrypt(model, LONG_100);
      const decrypted: CallResult = await callDecrypt(model);
      hilog.info(DOMAIN, TAG, 'cipherLen=%{public}d expected=156', encrypted.value.length);
      expect(encrypted.value.length).assertEqual(156);
      hilog.info(DOMAIN, TAG, 'plainLen=%{public}d expected=100', decrypted.value.length);
      expect(decrypted.value.length).assertEqual(100);
      expect(decrypted.value).assertEqual(LONG_100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAes0004 end');
    });

    /**
     * @tc.number SUB_Huks_AES_0005
     * @tc.name testAes0005
     * @tc.desc 边界值：单字符明文下界，往返一致且密文 17 字节
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testAes0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAes0005 begin');
      const encrypted: CallResult = await callEncrypt(model, 'A');
      const decrypted: CallResult = await callDecrypt(model);
      hilog.info(DOMAIN, TAG, 'cipherLen=%{public}d expected=24', encrypted.value.length);
      expect(encrypted.value.length).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'plain=%{public}s expected=A', decrypted.value);
      expect(decrypted.value).assertEqual('A');
      const decoded: Uint8Array = decodeB64(encrypted.value);
      hilog.info(DOMAIN, TAG, 'bytes=%{public}d expected=17', decoded.length);
      expect(decoded.length).assertEqual(17);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAes0005 end');
    });

    /**
     * @tc.number SUB_Huks_AES_0006
     * @tc.name testAes0006
     * @tc.desc 边界值：19 与 21 字符跨 20 字节档位，均不截断且往返一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testAes0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAes0006 begin');
      const enc19: CallResult = await callEncrypt(model, PLAIN_19);
      const dec19: CallResult = await callDecrypt(model);
      const enc21: CallResult = await callEncrypt(model, PLAIN_21);
      const dec21: CallResult = await callDecrypt(model);
      hilog.info(DOMAIN, TAG, 'len19=%{public}d expected=48', enc19.value.length);
      expect(enc19.value.length).assertEqual(48);
      hilog.info(DOMAIN, TAG, 'len21=%{public}d expected=52', enc21.value.length);
      expect(enc21.value.length).assertEqual(52);
      expect(dec19.value).assertEqual(PLAIN_19);
      expect(dec21.value).assertEqual(PLAIN_21);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAes0006 end');
    });

    /**
     * @tc.number SUB_Huks_AES_0007
     * @tc.name testAes0007
     * @tc.desc 边界值：单空格明文密文为 1 字节明文加 GCM tag，往返一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testAes0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAes0007 begin');
      const encrypted: CallResult = await callEncrypt(model, ' ');
      const decrypted: CallResult = await callDecrypt(model);
      hilog.info(DOMAIN, TAG, 'cipherLen=%{public}d expected=24', encrypted.value.length);
      expect(encrypted.value.length).assertEqual(24);
      hilog.info(DOMAIN, TAG, 'plainLen=%{public}d expected=1', decrypted.value.length);
      expect(decrypted.value.length).assertEqual(1);
      expect(decrypted.value).assertEqual(' ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAes0007 end');
    });

    /**
     * @tc.number SUB_Huks_AES_0008
     * @tc.name testAes0008
     * @tc.desc 非法值：中文输入按 UTF-8 12 字节加密，往返为逐字节还原的冻结字符串
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testAes0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAes0008 begin');
      const encrypted: CallResult = await callEncrypt(model, '中文测试');
      const decrypted: CallResult = await callDecrypt(model);
      hilog.info(DOMAIN, TAG, 'cipherLen=%{public}d expected=40', encrypted.value.length);
      expect(encrypted.value.length).assertEqual(40);
      hilog.info(DOMAIN, TAG, 'mojibake=%{public}s', decrypted.value);
      expect(decrypted.value).assertEqual(MOJIBAKE_ZH_UTF8);
      const decoded: Uint8Array = decodeB64(encrypted.value);
      hilog.info(DOMAIN, TAG, 'bytes=%{public}d expected=28', decoded.length);
      expect(decoded.length).assertEqual(28);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAes0008 end');
    });

    /**
     * @tc.number SUB_Huks_AES_0009
     * @tc.name testAes0009
     * @tc.desc 非法值：emoji 按 UTF-8 4 字节加密，往返为逐字节还原的冻结字符串
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testAes0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAes0009 begin');
      const encrypted: CallResult = await callEncrypt(model, '😀');
      const decrypted: CallResult = await callDecrypt(model);
      hilog.info(DOMAIN, TAG, 'cipherLen=%{public}d expected=28', encrypted.value.length);
      expect(encrypted.value.length).assertEqual(28);
      hilog.info(DOMAIN, TAG, 'mojibake=%{public}s', decrypted.value);
      expect(decrypted.value).assertEqual(MOJIBAKE_EMOJI_UTF8);
      const decoded: Uint8Array = decodeB64(encrypted.value);
      hilog.info(DOMAIN, TAG, 'bytes=%{public}d expected=20', decoded.length);
      expect(decoded.length).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAes0009 end');
    });

    /**
     * @tc.number SUB_Huks_AES_0010
     * @tc.name testAes0010
     * @tc.desc 极值：数字字符串 0 与 -1 往返一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testAes0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAes0010 begin');
      const encZero: CallResult = await callEncrypt(model, '0');
      const decZero: CallResult = await callDecrypt(model);
      const encNeg: CallResult = await callEncrypt(model, '-1');
      const decNeg: CallResult = await callDecrypt(model);
      hilog.info(DOMAIN, TAG, 'zeroLen=%{public}d expected=24', encZero.value.length);
      expect(encZero.value.length).assertEqual(24);
      expect(decZero.value).assertEqual('0');
      expect(decNeg.value).assertEqual('-1');
      expect(encNeg.value.length).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAes0010 end');
    });

    /**
     * @tc.number SUB_Huks_AES_0011
     * @tc.name testAes0011
     * @tc.desc 极值：Number.MAX_SAFE_INTEGER 字符串 16 字符往返一致，密文 32 字节
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testAes0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAes0011 begin');
      const encrypted: CallResult = await callEncrypt(model, MAX_SAFE_STR);
      const decrypted: CallResult = await callDecrypt(model);
      hilog.info(DOMAIN, TAG, 'cipherLen=%{public}d expected=44', encrypted.value.length);
      expect(encrypted.value.length).assertEqual(44);
      hilog.info(DOMAIN, TAG, 'plainLen=%{public}d expected=16', decrypted.value.length);
      expect(decrypted.value.length).assertEqual(16);
      expect(decrypted.value).assertEqual(MAX_SAFE_STR);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAes0011 end');
    });

    /**
     * @tc.number SUB_Huks_AES_0012
     * @tc.name testAes0012
     * @tc.desc 极值：1024 字符超长明文往返一致，密文 1040 字节
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testAes0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAes0012 begin');
      const encrypted: CallResult = await callEncrypt(model, LONG_1024);
      const decrypted: CallResult = await callDecrypt(model);
      hilog.info(DOMAIN, TAG, 'cipherLen=%{public}d expected=1388', encrypted.value.length);
      expect(encrypted.value.length).assertEqual(1388);
      hilog.info(DOMAIN, TAG, 'plainLen=%{public}d expected=1024', decrypted.value.length);
      expect(decrypted.value.length).assertEqual(1024);
      expect(decrypted.value).assertEqual(LONG_1024);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAes0012 end');
    });

    /**
     * @tc.number SUB_Huks_AES_0013
     * @tc.name testAes0013
     * @tc.desc 组合值：两个不同明文先后加密，密文互异且各自往返一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testAes0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAes0013 begin');
      const enc1: CallResult = await callEncrypt(model, 'abc');
      const dec1: CallResult = await callDecrypt(model);
      const enc2: CallResult = await callEncrypt(model, 'xyz');
      const dec2: CallResult = await callDecrypt(model);
      hilog.info(DOMAIN, TAG, 'len1=%{public}d len2=%{public}d expected=28', enc1.value.length, enc2.value.length);
      expect(enc1.value.length).assertEqual(28);
      expect(enc2.value.length).assertEqual(28);
      expect(enc1.value === enc2.value).assertFalse();
      expect(dec1.value).assertEqual('abc');
      expect(dec2.value).assertEqual('xyz');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAes0013 end');
    });

    /**
     * @tc.number SUB_Huks_AES_0014
     * @tc.name testAes0014
     * @tc.desc 组合值：连续两次加密不经过解密，密文互异且解密返回后一次明文
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testAes0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAes0014 begin');
      const enc1: CallResult = await callEncrypt(model, 'same');
      const enc2: CallResult = await callEncrypt(model, 'other');
      const decrypted: CallResult = await callDecrypt(model);
      hilog.info(DOMAIN, TAG, 'len1=%{public}d len2=%{public}d expected=28', enc1.value.length, enc2.value.length);
      expect(enc1.value.length).assertEqual(28);
      expect(enc2.value.length).assertEqual(28);
      expect(enc1.value === enc2.value).assertFalse();
      hilog.info(DOMAIN, TAG, 'plain=%{public}s expected=other', decrypted.value);
      expect(decrypted.value).assertEqual('other');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAes0014 end');
    });

    /**
     * @tc.number SUB_Huks_AES_0015
     * @tc.name testAes0015
     * @tc.desc 组合值：密文 base64 可解码且长度恰为明文字节数 + 16 字节 tag
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testAes0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAes0015 begin');
      const encrypted: CallResult = await callEncrypt(model, 'hello');
      const decoded: Uint8Array = decodeB64(encrypted.value);
      hilog.info(DOMAIN, TAG, 'bytes=%{public}d expected=21', decoded.length);
      expect(decoded.length).assertEqual(5 + GCM_TAG_LEN);
      hilog.info(DOMAIN, TAG, 'cipherLen=%{public}d expected=28', encrypted.value.length);
      expect(encrypted.value.length).assertEqual(28);
      const decrypted: CallResult = await callDecrypt(model);
      expect(decrypted.value).assertEqual('hello');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAes0015 end');
    });

    /**
     * @tc.number SUB_Huks_AES_0016
     * @tc.name testAes0016
     * @tc.desc 状态：连续两次加密覆盖模块密文状态，解密返回后一次明文
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testAes0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAes0016 begin');
      const enc1: CallResult = await callEncrypt(model, 'first');
      const enc2: CallResult = await callEncrypt(model, 'second');
      const decrypted: CallResult = await callDecrypt(model);
      hilog.info(DOMAIN, TAG, 'plain=%{public}s expected=second', decrypted.value);
      expect(decrypted.value).assertEqual('second');
      expect(decrypted.value === 'first').assertFalse();
      hilog.info(DOMAIN, TAG, 'len1=%{public}d expected=28', enc1.value.length);
      expect(enc1.value.length).assertEqual(28);
      hilog.info(DOMAIN, TAG, 'len2=%{public}d expected=32', enc2.value.length);
      expect(enc2.value.length).assertEqual(32);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAes0016 end');
    });

    /**
     * @tc.number SUB_Huks_AES_0017
     * @tc.name testAes0017
     * @tc.desc 状态：加密-解密两轮周期各自独立，两轮往返一致且密文长度稳定
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testAes0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAes0017 begin');
      const enc1: CallResult = await callEncrypt(model, 'hello');
      const dec1: CallResult = await callDecrypt(model);
      const enc2: CallResult = await callEncrypt(model, 'hello');
      const dec2: CallResult = await callDecrypt(model);
      hilog.info(DOMAIN, TAG, 'plain1=%{public}s plain2=%{public}s', dec1.value, dec2.value);
      expect(dec1.value).assertEqual('hello');
      expect(dec2.value).assertEqual('hello');
      hilog.info(DOMAIN, TAG, 'len1=%{public}d len2=%{public}d expected=28', enc1.value.length, enc2.value.length);
      expect(enc1.value.length).assertEqual(28);
      expect(enc2.value.length).assertEqual(28);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAes0017 end');
    });

    /**
     * @tc.number SUB_Huks_AES_0018
     * @tc.name testAes0018
     * @tc.desc 状态：加密与解密成功路径回调各恰好触发一次
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testAes0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAes0018 begin');
      const encrypted: CallResult = await callEncrypt(model, 'hello');
      const decrypted: CallResult = await callDecrypt(model);
      hilog.info(DOMAIN, TAG, 'encCalls=%{public}d expected=1', encrypted.calls);
      expect(encrypted.calls).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'decCalls=%{public}d expected=1', decrypted.calls);
      expect(decrypted.calls).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'plain=%{public}s expected=hello', decrypted.value);
      expect(decrypted.value).assertEqual('hello');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAes0018 end');
    });

    /**
     * @tc.number SUB_Huks_AES_0019
     * @tc.name testAes0019
     * @tc.desc 组合值：连续三次加密不同明文，密文两两互异且解密返回末次明文
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testAes0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAes0019 begin');
      const enc1: CallResult = await callEncrypt(model, 'aaaa');
      const enc2: CallResult = await callEncrypt(model, 'bbbb');
      const enc3: CallResult = await callEncrypt(model, 'cccc');
      const decrypted: CallResult = await callDecrypt(model);
      hilog.info(DOMAIN, TAG, 'lens=%{public}d/%{public}d/%{public}d expected=28',
        enc1.value.length, enc2.value.length, enc3.value.length);
      expect(enc1.value.length).assertEqual(28);
      expect(enc2.value.length).assertEqual(28);
      expect(enc3.value.length).assertEqual(28);
      expect(enc1.value === enc2.value).assertFalse();
      expect(enc2.value === enc3.value).assertFalse();
      hilog.info(DOMAIN, TAG, 'plain=%{public}s expected=cccc', decrypted.value);
      expect(decrypted.value).assertEqual('cccc');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAes0019 end');
    });

    /**
     * @tc.number SUB_Huks_AES_0020
     * @tc.name testAes0020
     * @tc.desc 状态：同明文两轮周期加密-解密，回调各一次且往返值一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testAes0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAes0020 begin');
      const enc1: CallResult = await callEncrypt(model, 'hello');
      const dec1: CallResult = await callDecrypt(model);
      const enc2: CallResult = await callEncrypt(model, 'hello');
      const dec2: CallResult = await callDecrypt(model);
      expect(dec1.value).assertEqual('hello');
      expect(dec2.value).assertEqual('hello');
      expect(enc1.calls).assertEqual(1);
      expect(enc2.calls).assertEqual(1);
      expect(dec1.calls).assertEqual(1);
      expect(dec2.calls).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAes0020 end');
    });
  });
}
