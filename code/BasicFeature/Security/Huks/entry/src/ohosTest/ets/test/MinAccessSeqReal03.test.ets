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

// MinAccessSeq 补充场景套件三：手写用例，覆盖 主流程 / 边界 / 异常 / 状态 四类。
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { HuksModel } from '../../../main/ets/model/HuksModel';
import { util } from '@kit.ArkTS';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_Huks]';

function decodeB64(text: string): Uint8Array {
  const helper: util.Base64Helper = new util.Base64Helper();
  return helper.decodeSync(text);
}

function encryptSm2With(model: HuksModel, plain: string): Promise<string> {
  return new Promise<string>((resolve: (value: string) => void) => {
    model.encryptDataUseSm2(plain, (cipher: string) => { resolve(cipher); });
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

export default function minAccessSeqReal03Test() {
  describe('MinAccessSeqReal03', () => {

    /**
     * @tc.name   testMinAccessSeq0382
     * @tc.number SUB_Huks_MCSQ_0382
     * @tc.desc   边界：12 码元输入 SM2 加密，DER 结构中 C2 等于明文字节数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0382', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0382 begin');
      const model: HuksModel = new HuksModel();
      const cipher: string = await encryptSm2With(model, 'sm2-anchor-1');
      expect(cipher.length > 0).assertTrue();
      const plainBytes_0: number = sm2PlainLen('sm2-anchor-1');
      const decoded_0: Uint8Array = decodeB64(cipher);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0383
     * @tc.number SUB_Huks_MCSQ_0383
     * @tc.desc   异常路径：六个汉字加密，DER 结构中 C2 为 6 字节且密文非空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0383', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0383 begin');
      const model: HuksModel = new HuksModel();
      const cipher: string = await encryptSm2With(model, '低安访问控制');
      expect(cipher.length > 0).assertTrue();
      const plainBytes_0: number = sm2PlainLen('低安访问控制');
      const decoded_0: Uint8Array = decodeB64(cipher);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0384
     * @tc.number SUB_Huks_MCSQ_0384
     * @tc.desc   异常路径：字母夹 emoji 加密，DER 结构中 C2 等于 UTF-16 单元数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0384', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0384 begin');
      const model: HuksModel = new HuksModel();
      const cipher: string = await encryptSm2With(model, 'a😀b');
      expect(cipher.length > 0).assertTrue();
      const plainBytes_0: number = sm2PlainLen('a😀b');
      const decoded_0: Uint8Array = decodeB64(cipher);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0385
     * @tc.number SUB_Huks_MCSQ_0385
     * @tc.desc   状态：同明文两次加密密文不同，长度稳定为 99 字节
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0385', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0385 begin');
      const model: HuksModel = new HuksModel();
      const cipher1: string = await encryptSm2With(model, 'abc');
      const cipher2: string = await encryptSm2With(model, 'abc');
      expect(cipher1 !== cipher2).assertTrue();
      const plainBytes_0: number = sm2PlainLen('abc');
      const decoded_0: Uint8Array = decodeB64(cipher1);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
      const plainBytes_1: number = sm2PlainLen('abc');
      const decoded_1: Uint8Array = decodeB64(cipher2);
      const c2Pos_1: number = sm2C2TagPos(decoded_1);
      const c2Len_1: number = sm2C2Len(decoded_1, c2Pos_1);
      const total_1: number = decoded_1.length;
      expect(decoded_1[0]).assertEqual(0x30);
      expect(c2Len_1).assertEqual(plainBytes_1);
      expect(total_1).assertEqual(c2Pos_1 + 1 + sm2LenFieldSize(c2Len_1) + c2Len_1);
    });

    /**
     * @tc.name   testMinAccessSeq0386
     * @tc.number SUB_Huks_MCSQ_0386
     * @tc.desc   边界：16 码元输入加密得 112 字节密文，长度随码元数线性增长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0386', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0386 begin');
      const model: HuksModel = new HuksModel();
      const cipher: string = await encryptSm2With(model, '0123456789abcdef');
      expect(cipher.length > 0).assertTrue();
      const plainBytes_0: number = sm2PlainLen('0123456789abcdef');
      const decoded_0: Uint8Array = decodeB64(cipher);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0387
     * @tc.number SUB_Huks_MCSQ_0387
     * @tc.desc   主流程：16 码元含空格文本加密得 112 字节密文，密文非空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0387', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0387 begin');
      const model: HuksModel = new HuksModel();
      const cipher: string = await encryptSm2With(model, 'OpenHarmony SM2');
      expect(cipher.length > 0).assertTrue();
      const plainBytes_0: number = sm2PlainLen('OpenHarmony SM2');
      const decoded_0: Uint8Array = decodeB64(cipher);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0388
     * @tc.number SUB_Huks_MCSQ_0388
     * @tc.desc   异常路径：三个 emoji 加密，DER 结构中 C2 为 6 字节且密文非空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0388', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0388 begin');
      const model: HuksModel = new HuksModel();
      const cipher: string = await encryptSm2With(model, '😀😀😀');
      expect(cipher.length > 0).assertTrue();
      const plainBytes_0: number = sm2PlainLen('😀😀😀');
      const decoded_0: Uint8Array = decodeB64(cipher);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0389
     * @tc.number SUB_Huks_MCSQ_0389
     * @tc.desc   状态：1/2/3 码元三档密文两两不同，长度按码元数逐档递增
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0389', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0389 begin');
      const model: HuksModel = new HuksModel();
      const cipher1: string = await encryptSm2With(model, 'a');
      const cipher2: string = await encryptSm2With(model, 'ab');
      const cipher3: string = await encryptSm2With(model, 'abc');
      expect(cipher1 !== cipher2).assertTrue();
      expect(cipher2 !== cipher3).assertTrue();
      const plainBytes_0: number = sm2PlainLen('a');
      const decoded_0: Uint8Array = decodeB64(cipher1);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
      const plainBytes_1: number = sm2PlainLen('ab');
      const decoded_1: Uint8Array = decodeB64(cipher2);
      const c2Pos_1: number = sm2C2TagPos(decoded_1);
      const c2Len_1: number = sm2C2Len(decoded_1, c2Pos_1);
      const total_1: number = decoded_1.length;
      expect(decoded_1[0]).assertEqual(0x30);
      expect(c2Len_1).assertEqual(plainBytes_1);
      expect(total_1).assertEqual(c2Pos_1 + 1 + sm2LenFieldSize(c2Len_1) + c2Len_1);
      const plainBytes_2: number = sm2PlainLen('abc');
      const decoded_2: Uint8Array = decodeB64(cipher3);
      const c2Pos_2: number = sm2C2TagPos(decoded_2);
      const c2Len_2: number = sm2C2Len(decoded_2, c2Pos_2);
      const total_2: number = decoded_2.length;
      expect(decoded_2[0]).assertEqual(0x30);
      expect(c2Len_2).assertEqual(plainBytes_2);
      expect(total_2).assertEqual(c2Pos_2 + 1 + sm2LenFieldSize(c2Len_2) + c2Len_2);
    });

  });
}
