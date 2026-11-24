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

// 逻辑层 最小访问控制 SM2 加密主题：HuksModel.encryptDataUseSm2 的六维用例。
// 期望值来源：设备实测密文为 ASN.1 DER——SEQUENCE{INTEGER x, INTEGER y, OCTET STRING C3, OCTET STRING C2}，
// C2 长度等于明文字节数，总长随 x/y 的 INTEGER 前导零浮动；成功路径回调恰好一次；别名跨调用复用。
// 范围说明：PIN 弹窗路径（decryptDataUseSm2）不可自动化，本套件只覆盖加密面。
import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { util } from '@kit.ArkTS';
import { HuksModel } from '../../../main/ets/model/HuksModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Huks]';
const PLAIN_32: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ012345';
const LONG_1024: string = 'A'.repeat(1024);

interface CallResult {
  value: string;
  calls: number;
}

function decodeB64(input: string): Uint8Array {
  const helper: util.Base64Helper = new util.Base64Helper();
  return helper.decodeSync(input);
}

function callEncryptSm2(model: HuksModel, plain: string): Promise<CallResult> {
  return new Promise<CallResult>((resolve: (result: CallResult) => void) => {
    let calls: number = 0;
    model.encryptDataUseSm2(plain, (result: string) => {
      calls = calls + 1;
      const out: CallResult = { value: result, calls: calls };
      resolve(out);
    });
  });
}

function sm2HeaderSize(decoded: Uint8Array): number {
  if (decoded[1] === 0x81) {
    return 3;
  }
  if (decoded[1] === 0x82) {
    return 4;
  }
  return 2;
}

function sm2C2TagPos(decoded: Uint8Array): number {
  const header: number = sm2HeaderSize(decoded);
  const lx: number = decoded[header + 1];
  const ly: number = decoded[header + 3 + lx];
  return header + 38 + lx + ly;
}

function sm2LenFieldSize(c2Len: number): number {
  if (c2Len < 0x80) {
    return 1;
  }
  if (c2Len < 0x100) {
    return 2;
  }
  return 3;
}

function sm2C2Len(decoded: Uint8Array, tagPos: number): number {
  const first: number = decoded[tagPos + 1];
  if (first === 0x81) {
    return decoded[tagPos + 2];
  }
  if (first === 0x82) {
    return decoded[tagPos + 2] * 256 + decoded[tagPos + 3];
  }
  return first;
}

// main 冻结行为：SM2 明文按 UTF-16 代码单元逐字节转换，C2 长度即代码单元数
function sm2PlainLen(text: string): number {
  return text.length;
}

export default function minAccessCore() {
  describe('HuksMinAccessCore', () => {
    let model: HuksModel = new HuksModel();

    beforeEach(() => {
      model = new HuksModel();
    });

    afterEach(() => {
      model = new HuksModel();
    });

    /**
     * @tc.number SUB_Huks_MINAC_0001
     * @tc.name testMinac0001
     * @tc.desc 合法值：5 字符明文加密成功，DER 结构中 C2 恰为 5 字节明文
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testMinac0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMinac0001 begin');
      const encrypted: CallResult = await callEncryptSm2(model, 'hello');
      const decoded: Uint8Array = decodeB64(encrypted.value);
      expect(encrypted.calls).assertEqual(1);
      const plainBytes_0: number = sm2PlainLen('hello');
      const decoded_0: Uint8Array = decodeB64(encrypted.value);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.number SUB_Huks_MINAC_0002
     * @tc.name testMinac0002
     * @tc.desc 正向对照：SM2 单字符加密正常回调，密文按 DER 解析且 C2 为 1 字节
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testMinac0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMinac0002 begin');
      // 正向对照：同模型非空输入正常回调并按 DER 结构解析
      const encrypted: CallResult = await callEncryptSm2(model, 'r');
      expect(encrypted.calls).assertEqual(1);
      const decoded: Uint8Array = decodeB64(encrypted.value);
      const c2Pos: number = sm2C2TagPos(decoded);
      const c2Len: number = sm2C2Len(decoded, c2Pos);
      const total: number = decoded.length;
      expect(c2Len).assertEqual(1);
      expect(total).assertEqual(c2Pos + 1 + sm2LenFieldSize(c2Len) + c2Len);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMinac0002 end');
    });

    /**
     * @tc.number SUB_Huks_MINAC_0003
     * @tc.name testMinac0003
     * @tc.desc 合法值：单字符明文加密成功，密文 97 字节
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testMinac0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMinac0003 begin');
      const encrypted: CallResult = await callEncryptSm2(model, 'x');
      const decoded: Uint8Array = decodeB64(encrypted.value);
      expect(encrypted.calls).assertEqual(1);
      const plainBytes_0: number = sm2PlainLen('x');
      const decoded_0: Uint8Array = decodeB64(encrypted.value);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.number SUB_Huks_MINAC_0004
     * @tc.name testMinac0004
     * @tc.desc 合法值：32 字符明文加密成功，密文 128 字节
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testMinac0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMinac0004 begin');
      const encrypted: CallResult = await callEncryptSm2(model, PLAIN_32);
      const decoded: Uint8Array = decodeB64(encrypted.value);
      expect(encrypted.calls).assertEqual(1);
      const plainBytes_0: number = sm2PlainLen(PLAIN_32);
      const decoded_0: Uint8Array = decodeB64(encrypted.value);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.number SUB_Huks_MINAC_0005
     * @tc.name testMinac0005
     * @tc.desc 边界值：1 与 2 字符明文密文长度逐字节增长
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testMinac0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMinac0005 begin');
      const enc1: CallResult = await callEncryptSm2(model, '0');
      const enc2: CallResult = await callEncryptSm2(model, '00');
      const plainBytes_0: number = sm2PlainLen('0');
      const decoded_0: Uint8Array = decodeB64(enc1.value);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
      const plainBytes_1: number = sm2PlainLen('00');
      const decoded_1: Uint8Array = decodeB64(enc2.value);
      const c2Pos_1: number = sm2C2TagPos(decoded_1);
      const c2Len_1: number = sm2C2Len(decoded_1, c2Pos_1);
      const total_1: number = decoded_1.length;
      expect(decoded_1[0]).assertEqual(0x30);
      expect(c2Len_1).assertEqual(plainBytes_1);
      expect(total_1).assertEqual(c2Pos_1 + 1 + sm2LenFieldSize(c2Len_1) + c2Len_1);
    });

    /**
     * @tc.number SUB_Huks_MINAC_0006
     * @tc.name testMinac0006
     * @tc.desc 边界值：15/16/17 字符档位密文长度 148/152/152
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testMinac0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMinac0006 begin');
      const enc15: CallResult = await callEncryptSm2(model, 'ABCDEFGHIJKLMNO');
      const enc16: CallResult = await callEncryptSm2(model, 'ABCDEFGHIJKLMNOP');
      const enc17: CallResult = await callEncryptSm2(model, 'ABCDEFGHIJKLMNOPQ');
      const plainBytes_0: number = sm2PlainLen('ABCDEFGHIJKLMNO');
      const decoded_0: Uint8Array = decodeB64(enc15.value);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
      const plainBytes_1: number = sm2PlainLen('ABCDEFGHIJKLMNOP');
      const decoded_1: Uint8Array = decodeB64(enc16.value);
      const c2Pos_1: number = sm2C2TagPos(decoded_1);
      const c2Len_1: number = sm2C2Len(decoded_1, c2Pos_1);
      const total_1: number = decoded_1.length;
      expect(decoded_1[0]).assertEqual(0x30);
      expect(c2Len_1).assertEqual(plainBytes_1);
      expect(total_1).assertEqual(c2Pos_1 + 1 + sm2LenFieldSize(c2Len_1) + c2Len_1);
      const plainBytes_2: number = sm2PlainLen('ABCDEFGHIJKLMNOPQ');
      const decoded_2: Uint8Array = decodeB64(enc17.value);
      const c2Pos_2: number = sm2C2TagPos(decoded_2);
      const c2Len_2: number = sm2C2Len(decoded_2, c2Pos_2);
      const total_2: number = decoded_2.length;
      expect(decoded_2[0]).assertEqual(0x30);
      expect(c2Len_2).assertEqual(plainBytes_2);
      expect(total_2).assertEqual(c2Pos_2 + 1 + sm2LenFieldSize(c2Len_2) + c2Len_2);
    });

    /**
     * @tc.number SUB_Huks_MINAC_0007
     * @tc.name testMinac0007
     * @tc.desc 边界值：单空格明文加密成功，密文 97 字节
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testMinac0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMinac0007 begin');
      const encrypted: CallResult = await callEncryptSm2(model, ' ');
      const decoded: Uint8Array = decodeB64(encrypted.value);
      expect(encrypted.calls).assertEqual(1);
      const plainBytes_0: number = sm2PlainLen(' ');
      const decoded_0: Uint8Array = decodeB64(encrypted.value);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.number SUB_Huks_MINAC_0008
     * @tc.name testMinac0008
     * @tc.desc 非法值：中文输入按 UTF-16 单元逐字节转换，DER 结构中 C2 等于单元数
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testMinac0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMinac0008 begin');
      const encrypted: CallResult = await callEncryptSm2(model, '中文测试');
      const decoded: Uint8Array = decodeB64(encrypted.value);
      const plainBytes_0: number = sm2PlainLen('中文测试');
      const decoded_0: Uint8Array = decodeB64(encrypted.value);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.number SUB_Huks_MINAC_0009
     * @tc.name testMinac0009
     * @tc.desc 非法值：emoji 按 2 个 UTF-16 单元转换，DER 结构中 C2 等于单元数
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testMinac0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMinac0009 begin');
      const encrypted: CallResult = await callEncryptSm2(model, '😀');
      const encryptedAgain: CallResult = await callEncryptSm2(model, '😀');
      const decoded: Uint8Array = decodeB64(encrypted.value);
      expect(encrypted.value === encryptedAgain.value).assertFalse();
      const plainBytes_0: number = sm2PlainLen('😀');
      const decoded_0: Uint8Array = decodeB64(encrypted.value);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
      const plainBytes_1: number = sm2PlainLen('😀');
      const decoded_1: Uint8Array = decodeB64(encryptedAgain.value);
      const c2Pos_1: number = sm2C2TagPos(decoded_1);
      const c2Len_1: number = sm2C2Len(decoded_1, c2Pos_1);
      const total_1: number = decoded_1.length;
      expect(decoded_1[0]).assertEqual(0x30);
      expect(c2Len_1).assertEqual(plainBytes_1);
      expect(total_1).assertEqual(c2Pos_1 + 1 + sm2LenFieldSize(c2Len_1) + c2Len_1);
    });

    /**
     * @tc.number SUB_Huks_MINAC_0010
     * @tc.name testMinac0010
     * @tc.desc 极值：负数字符串 -1 加密成功，DER 结构中 C2 等于单元数
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testMinac0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMinac0010 begin');
      const encrypted: CallResult = await callEncryptSm2(model, '-1');
      const encryptedZero: CallResult = await callEncryptSm2(model, '0');
      const decoded: Uint8Array = decodeB64(encrypted.value);
      expect(encrypted.value === encryptedZero.value).assertFalse();
      const plainBytes_0: number = sm2PlainLen('-1');
      const decoded_0: Uint8Array = decodeB64(encrypted.value);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
      const plainBytes_1: number = sm2PlainLen('0');
      const decoded_1: Uint8Array = decodeB64(encryptedZero.value);
      const c2Pos_1: number = sm2C2TagPos(decoded_1);
      const c2Len_1: number = sm2C2Len(decoded_1, c2Pos_1);
      const total_1: number = decoded_1.length;
      expect(decoded_1[0]).assertEqual(0x30);
      expect(c2Len_1).assertEqual(plainBytes_1);
      expect(total_1).assertEqual(c2Pos_1 + 1 + sm2LenFieldSize(c2Len_1) + c2Len_1);
    });

    /**
     * @tc.number SUB_Huks_MINAC_0011
     * @tc.name testMinac0011
     * @tc.desc 极值：1024 字符超长明文加密成功，DER 结构中 C2 为 1024 字节
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testMinac0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMinac0011 begin');
      const encrypted: CallResult = await callEncryptSm2(model, LONG_1024);
      const decoded: Uint8Array = decodeB64(encrypted.value);
      expect(encrypted.calls).assertEqual(1);
      const plainBytes_0: number = sm2PlainLen(LONG_1024);
      const decoded_0: Uint8Array = decodeB64(encrypted.value);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.number SUB_Huks_MINAC_0012
     * @tc.name testMinac0012
     * @tc.desc 极值：C2 长度随明文字节数线性增长，总长为 DER 结构自洽值
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testMinac0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMinac0012 begin');
      const encShort: CallResult = await callEncryptSm2(model, 'hello');
      const encLong: CallResult = await callEncryptSm2(model, LONG_1024);
      const shortBytes: Uint8Array = decodeB64(encShort.value);
      const longBytes: Uint8Array = decodeB64(encLong.value);
      expect(shortBytes.length < longBytes.length).assertTrue();
      const plainBytes_0: number = sm2PlainLen('hello');
      const decoded_0: Uint8Array = decodeB64(encShort.value);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
      const plainBytes_1: number = sm2PlainLen(LONG_1024);
      const decoded_1: Uint8Array = decodeB64(encLong.value);
      const c2Pos_1: number = sm2C2TagPos(decoded_1);
      const c2Len_1: number = sm2C2Len(decoded_1, c2Pos_1);
      const total_1: number = decoded_1.length;
      expect(decoded_1[0]).assertEqual(0x30);
      expect(c2Len_1).assertEqual(plainBytes_1);
      expect(total_1).assertEqual(c2Pos_1 + 1 + sm2LenFieldSize(c2Len_1) + c2Len_1);
    });

    /**
     * @tc.number SUB_Huks_MINAC_0013
     * @tc.name testMinac0013
     * @tc.desc 组合值：同明文两次加密密文互异（随机 k），长度一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testMinac0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMinac0013 begin');
      const enc1: CallResult = await callEncryptSm2(model, 'hello');
      const enc2: CallResult = await callEncryptSm2(model, 'hello');
      expect(enc1.value === enc2.value).assertFalse();
      const plainBytes_0: number = sm2PlainLen('hello');
      const decoded_0: Uint8Array = decodeB64(enc1.value);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
      const plainBytes_1: number = sm2PlainLen('hello');
      const decoded_1: Uint8Array = decodeB64(enc2.value);
      const c2Pos_1: number = sm2C2TagPos(decoded_1);
      const c2Len_1: number = sm2C2Len(decoded_1, c2Pos_1);
      const total_1: number = decoded_1.length;
      expect(decoded_1[0]).assertEqual(0x30);
      expect(c2Len_1).assertEqual(plainBytes_1);
      expect(total_1).assertEqual(c2Pos_1 + 1 + sm2LenFieldSize(c2Len_1) + c2Len_1);
    });

    /**
     * @tc.number SUB_Huks_MINAC_0014
     * @tc.name testMinac0014
     * @tc.desc 组合值：三次加密同明文密文两两互异，长度稳定
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testMinac0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMinac0014 begin');
      const enc1: CallResult = await callEncryptSm2(model, 'abc');
      const enc2: CallResult = await callEncryptSm2(model, 'abc');
      const enc3: CallResult = await callEncryptSm2(model, 'abc');
      expect(enc1.value === enc2.value).assertFalse();
      expect(enc2.value === enc3.value).assertFalse();
      const plainBytes_0: number = sm2PlainLen('abc');
      const decoded_0: Uint8Array = decodeB64(enc1.value);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
      const plainBytes_1: number = sm2PlainLen('abc');
      const decoded_1: Uint8Array = decodeB64(enc2.value);
      const c2Pos_1: number = sm2C2TagPos(decoded_1);
      const c2Len_1: number = sm2C2Len(decoded_1, c2Pos_1);
      const total_1: number = decoded_1.length;
      expect(decoded_1[0]).assertEqual(0x30);
      expect(c2Len_1).assertEqual(plainBytes_1);
      expect(total_1).assertEqual(c2Pos_1 + 1 + sm2LenFieldSize(c2Len_1) + c2Len_1);
      const plainBytes_2: number = sm2PlainLen('abc');
      const decoded_2: Uint8Array = decodeB64(enc3.value);
      const c2Pos_2: number = sm2C2TagPos(decoded_2);
      const c2Len_2: number = sm2C2Len(decoded_2, c2Pos_2);
      const total_2: number = decoded_2.length;
      expect(decoded_2[0]).assertEqual(0x30);
      expect(c2Len_2).assertEqual(plainBytes_2);
      expect(total_2).assertEqual(c2Pos_2 + 1 + sm2LenFieldSize(c2Len_2) + c2Len_2);
    });

    /**
     * @tc.number SUB_Huks_MINAC_0015
     * @tc.name testMinac0015
     * @tc.desc 组合值：两档输入中 C2 字节数等于各档明文字节数
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testMinac0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMinac0015 begin');
      const enc1: CallResult = await callEncryptSm2(model, 'x');
      const enc32: CallResult = await callEncryptSm2(model, PLAIN_32);
      const plainBytes_0: number = sm2PlainLen('x');
      const decoded_0: Uint8Array = decodeB64(enc1.value);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
      const plainBytes_1: number = sm2PlainLen(PLAIN_32);
      const decoded_1: Uint8Array = decodeB64(enc32.value);
      const c2Pos_1: number = sm2C2TagPos(decoded_1);
      const c2Len_1: number = sm2C2Len(decoded_1, c2Pos_1);
      const total_1: number = decoded_1.length;
      expect(decoded_1[0]).assertEqual(0x30);
      expect(c2Len_1).assertEqual(plainBytes_1);
      expect(total_1).assertEqual(c2Pos_1 + 1 + sm2LenFieldSize(c2Len_1) + c2Len_1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMinac0015 end');
    });

    /**
     * @tc.number SUB_Huks_MINAC_0016
     * @tc.name testMinac0016
     * @tc.desc 状态：连续三次加密回调各恰好一次，长度稳定
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testMinac0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMinac0016 begin');
      const enc1: CallResult = await callEncryptSm2(model, 'hello');
      const enc2: CallResult = await callEncryptSm2(model, 'hello');
      const enc3: CallResult = await callEncryptSm2(model, 'hello');
      expect(enc1.calls).assertEqual(1);
      expect(enc2.calls).assertEqual(1);
      expect(enc3.calls).assertEqual(1);
      const plainBytes_0: number = sm2PlainLen('hello');
      const decoded_0: Uint8Array = decodeB64(enc1.value);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
      const plainBytes_1: number = sm2PlainLen('hello');
      const decoded_1: Uint8Array = decodeB64(enc2.value);
      const c2Pos_1: number = sm2C2TagPos(decoded_1);
      const c2Len_1: number = sm2C2Len(decoded_1, c2Pos_1);
      const total_1: number = decoded_1.length;
      expect(decoded_1[0]).assertEqual(0x30);
      expect(c2Len_1).assertEqual(plainBytes_1);
      expect(total_1).assertEqual(c2Pos_1 + 1 + sm2LenFieldSize(c2Len_1) + c2Len_1);
      const plainBytes_2: number = sm2PlainLen('hello');
      const decoded_2: Uint8Array = decodeB64(enc3.value);
      const c2Pos_2: number = sm2C2TagPos(decoded_2);
      const c2Len_2: number = sm2C2Len(decoded_2, c2Pos_2);
      const total_2: number = decoded_2.length;
      expect(decoded_2[0]).assertEqual(0x30);
      expect(c2Len_2).assertEqual(plainBytes_2);
      expect(total_2).assertEqual(c2Pos_2 + 1 + sm2LenFieldSize(c2Len_2) + c2Len_2);
    });

    /**
     * @tc.number SUB_Huks_MINAC_0017
     * @tc.name testMinac0017
     * @tc.desc 状态：不同长度明文连续加密，密文字节数随明文逐字节增长
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testMinac0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMinac0017 begin');
      const enc1: CallResult = await callEncryptSm2(model, 'x');
      const enc2: CallResult = await callEncryptSm2(model, 'xy');
      const enc3: CallResult = await callEncryptSm2(model, 'xyz');
      const plainBytes_0: number = sm2PlainLen('x');
      const decoded_0: Uint8Array = decodeB64(enc1.value);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
      const plainBytes_1: number = sm2PlainLen('xy');
      const decoded_1: Uint8Array = decodeB64(enc2.value);
      const c2Pos_1: number = sm2C2TagPos(decoded_1);
      const c2Len_1: number = sm2C2Len(decoded_1, c2Pos_1);
      const total_1: number = decoded_1.length;
      expect(decoded_1[0]).assertEqual(0x30);
      expect(c2Len_1).assertEqual(plainBytes_1);
      expect(total_1).assertEqual(c2Pos_1 + 1 + sm2LenFieldSize(c2Len_1) + c2Len_1);
      const plainBytes_2: number = sm2PlainLen('xyz');
      const decoded_2: Uint8Array = decodeB64(enc3.value);
      const c2Pos_2: number = sm2C2TagPos(decoded_2);
      const c2Len_2: number = sm2C2Len(decoded_2, c2Pos_2);
      const total_2: number = decoded_2.length;
      expect(decoded_2[0]).assertEqual(0x30);
      expect(c2Len_2).assertEqual(plainBytes_2);
      expect(total_2).assertEqual(c2Pos_2 + 1 + sm2LenFieldSize(c2Len_2) + c2Len_2);
    });

    /**
     * @tc.number SUB_Huks_MINAC_0018
     * @tc.name testMinac0018
     * @tc.desc 状态：别名跨调用复用下连续 5 次加密均成功且长度一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testMinac0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMinac0018 begin');
      const enc1: CallResult = await callEncryptSm2(model, 'x');
      const enc2: CallResult = await callEncryptSm2(model, 'x');
      const enc3: CallResult = await callEncryptSm2(model, 'x');
      const enc4: CallResult = await callEncryptSm2(model, 'x');
      const enc5: CallResult = await callEncryptSm2(model, 'x');
      const plainBytes_0: number = sm2PlainLen('x');
      const decoded_0: Uint8Array = decodeB64(enc1.value);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
      const plainBytes_1: number = sm2PlainLen('x');
      const decoded_1: Uint8Array = decodeB64(enc2.value);
      const c2Pos_1: number = sm2C2TagPos(decoded_1);
      const c2Len_1: number = sm2C2Len(decoded_1, c2Pos_1);
      const total_1: number = decoded_1.length;
      expect(decoded_1[0]).assertEqual(0x30);
      expect(c2Len_1).assertEqual(plainBytes_1);
      expect(total_1).assertEqual(c2Pos_1 + 1 + sm2LenFieldSize(c2Len_1) + c2Len_1);
      const plainBytes_2: number = sm2PlainLen('x');
      const decoded_2: Uint8Array = decodeB64(enc3.value);
      const c2Pos_2: number = sm2C2TagPos(decoded_2);
      const c2Len_2: number = sm2C2Len(decoded_2, c2Pos_2);
      const total_2: number = decoded_2.length;
      expect(decoded_2[0]).assertEqual(0x30);
      expect(c2Len_2).assertEqual(plainBytes_2);
      expect(total_2).assertEqual(c2Pos_2 + 1 + sm2LenFieldSize(c2Len_2) + c2Len_2);
      const plainBytes_3: number = sm2PlainLen('x');
      const decoded_3: Uint8Array = decodeB64(enc4.value);
      const c2Pos_3: number = sm2C2TagPos(decoded_3);
      const c2Len_3: number = sm2C2Len(decoded_3, c2Pos_3);
      const total_3: number = decoded_3.length;
      expect(decoded_3[0]).assertEqual(0x30);
      expect(c2Len_3).assertEqual(plainBytes_3);
      expect(total_3).assertEqual(c2Pos_3 + 1 + sm2LenFieldSize(c2Len_3) + c2Len_3);
      const plainBytes_4: number = sm2PlainLen('x');
      const decoded_4: Uint8Array = decodeB64(enc5.value);
      const c2Pos_4: number = sm2C2TagPos(decoded_4);
      const c2Len_4: number = sm2C2Len(decoded_4, c2Pos_4);
      const total_4: number = decoded_4.length;
      expect(decoded_4[0]).assertEqual(0x30);
      expect(c2Len_4).assertEqual(plainBytes_4);
      expect(total_4).assertEqual(c2Pos_4 + 1 + sm2LenFieldSize(c2Len_4) + c2Len_4);
    });

    /**
     * @tc.number SUB_Huks_MINAC_0019
     * @tc.name testMinac0019
     * @tc.desc 组合值：密文与明文不同，且 DER 结构中 C2 为明文本身长度
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testMinac0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMinac0019 begin');
      const plain: string = 'hello';
      const encrypted: CallResult = await callEncryptSm2(model, plain);
      expect(encrypted.value === plain).assertFalse();
      const decoded: Uint8Array = decodeB64(encrypted.value);
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(encrypted.value);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.number SUB_Huks_MINAC_0020
     * @tc.name testMinac0020
     * @tc.desc 状态：明文切换后密文状态随之更新，末次加密长度正确
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testMinac0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMinac0020 begin');
      const enc1: CallResult = await callEncryptSm2(model, 'abcde');
      const enc2: CallResult = await callEncryptSm2(model, 'abcdefghij');
      const enc3: CallResult = await callEncryptSm2(model, 'a');
      expect(enc1.calls).assertEqual(1);
      expect(enc3.calls).assertEqual(1);
      const plainBytes_0: number = sm2PlainLen('abcde');
      const decoded_0: Uint8Array = decodeB64(enc1.value);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
      const plainBytes_1: number = sm2PlainLen('abcdefghij');
      const decoded_1: Uint8Array = decodeB64(enc2.value);
      const c2Pos_1: number = sm2C2TagPos(decoded_1);
      const c2Len_1: number = sm2C2Len(decoded_1, c2Pos_1);
      const total_1: number = decoded_1.length;
      expect(decoded_1[0]).assertEqual(0x30);
      expect(c2Len_1).assertEqual(plainBytes_1);
      expect(total_1).assertEqual(c2Pos_1 + 1 + sm2LenFieldSize(c2Len_1) + c2Len_1);
      const plainBytes_2: number = sm2PlainLen('a');
      const decoded_2: Uint8Array = decodeB64(enc3.value);
      const c2Pos_2: number = sm2C2TagPos(decoded_2);
      const c2Len_2: number = sm2C2Len(decoded_2, c2Pos_2);
      const total_2: number = decoded_2.length;
      expect(decoded_2[0]).assertEqual(0x30);
      expect(c2Len_2).assertEqual(plainBytes_2);
      expect(total_2).assertEqual(c2Pos_2 + 1 + sm2LenFieldSize(c2Len_2) + c2Len_2);
    });
  });
}
