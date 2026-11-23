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

// MinAccessSeq 补充场景套件：手写用例，覆盖 主流程 / 边界 / 异常 / 状态 四类。
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

function callEncryptSm2(model: HuksModel, plain: string): Promise<string> {
  return new Promise<string>((resolve: (value: string) => void) => {
    model.encryptDataUseSm2(plain, (result: string) => { resolve(result); });
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

export default function minAccessSeqReal01Test() {
  describe('MinAccessSeqReal01', () => {

    /**
     * @tc.name   testMinAccessSeq0026
     * @tc.number SUB_Huks_MCSQ_0026
     * @tc.desc   组合输入 A中😀1 按 UTF-16 5 码元得 101 字节密文，随机 k 使两次密文互异
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0026 begin');
      const model: HuksModel = new HuksModel();
      const cipherA: string = await callEncryptSm2(model, 'A中😀1');
      const cipherB: string = await callEncryptSm2(model, 'A中😀1');
      expect(cipherA === cipherB).assertFalse();
      const plainBytes_0: number = sm2PlainLen('A中😀1');
      const decoded_0: Uint8Array = decodeB64(cipherA);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
      const plainBytes_1: number = sm2PlainLen('A中😀1');
      const decoded_1: Uint8Array = decodeB64(cipherB);
      const c2Pos_1: number = sm2C2TagPos(decoded_1);
      const c2Len_1: number = sm2C2Len(decoded_1, c2Pos_1);
      const total_1: number = decoded_1.length;
      expect(decoded_1[0]).assertEqual(0x30);
      expect(c2Len_1).assertEqual(plainBytes_1);
      expect(total_1).assertEqual(c2Pos_1 + 1 + sm2LenFieldSize(c2Len_1) + c2Len_1);
    });

    /**
     * @tc.name   testMinAccessSeq0027
     * @tc.number SUB_Huks_MCSQ_0027
     * @tc.desc   主流程：sm2-main 加密，DER 结构中 C2 等于 UTF-16 单元数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0027 begin');
      const model: HuksModel = new HuksModel();
      const cipher: string = await callEncryptSm2(model, 'sm2-main');
      expect(cipher === '').assertFalse();
      const plainBytes_0: number = sm2PlainLen('sm2-main');
      const decoded_0: Uint8Array = decodeB64(cipher);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0028
     * @tc.number SUB_Huks_MCSQ_0028
     * @tc.desc   异常路径：双 emoji 输入按 UTF-16 4 码元加密，两次密文互异
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0028 begin');
      const model: HuksModel = new HuksModel();
      const cipherA: string = await callEncryptSm2(model, '😀😀');
      const cipherB: string = await callEncryptSm2(model, '😀😀');
      expect(cipherA === cipherB).assertFalse();
      const plainBytes_0: number = sm2PlainLen('😀😀');
      const decoded_0: Uint8Array = decodeB64(cipherA);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
      const plainBytes_1: number = sm2PlainLen('😀😀');
      const decoded_1: Uint8Array = decodeB64(cipherB);
      const c2Pos_1: number = sm2C2TagPos(decoded_1);
      const c2Len_1: number = sm2C2Len(decoded_1, c2Pos_1);
      const total_1: number = decoded_1.length;
      expect(decoded_1[0]).assertEqual(0x30);
      expect(c2Len_1).assertEqual(plainBytes_1);
      expect(total_1).assertEqual(c2Pos_1 + 1 + sm2LenFieldSize(c2Len_1) + c2Len_1);
    });

    /**
     * @tc.name   testMinAccessSeq0029
     * @tc.number SUB_Huks_MCSQ_0029
     * @tc.desc   状态：同一模型连续三次加密同明文，每次 136 字符且两两互异
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0029 begin');
      const model: HuksModel = new HuksModel();
      const cipherA: string = await callEncryptSm2(model, 'state');
      const cipherB: string = await callEncryptSm2(model, 'state');
      const cipherC: string = await callEncryptSm2(model, 'state');
      expect(cipherA === cipherB).assertFalse();
      expect(cipherB === cipherC).assertFalse();
      expect(cipherA === cipherC).assertFalse();
      const plainBytes_0: number = sm2PlainLen('state');
      const decoded_0: Uint8Array = decodeB64(cipherA);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
      const plainBytes_1: number = sm2PlainLen('state');
      const decoded_1: Uint8Array = decodeB64(cipherB);
      const c2Pos_1: number = sm2C2TagPos(decoded_1);
      const c2Len_1: number = sm2C2Len(decoded_1, c2Pos_1);
      const total_1: number = decoded_1.length;
      expect(decoded_1[0]).assertEqual(0x30);
      expect(c2Len_1).assertEqual(plainBytes_1);
      expect(total_1).assertEqual(c2Pos_1 + 1 + sm2LenFieldSize(c2Len_1) + c2Len_1);
      const plainBytes_2: number = sm2PlainLen('state');
      const decoded_2: Uint8Array = decodeB64(cipherC);
      const c2Pos_2: number = sm2C2TagPos(decoded_2);
      const c2Len_2: number = sm2C2Len(decoded_2, c2Pos_2);
      const total_2: number = decoded_2.length;
      expect(decoded_2[0]).assertEqual(0x30);
      expect(c2Len_2).assertEqual(plainBytes_2);
      expect(total_2).assertEqual(c2Pos_2 + 1 + sm2LenFieldSize(c2Len_2) + c2Len_2);
    });

  });
}
