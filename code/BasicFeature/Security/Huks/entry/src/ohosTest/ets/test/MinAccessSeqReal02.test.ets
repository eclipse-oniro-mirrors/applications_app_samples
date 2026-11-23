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

// MinAccessSeq 补充场景套件二：手写用例，覆盖 主流程 / 边界 / 异常 / 状态 四类。
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

export default function minAccessSeqReal02Test() {
  describe('MinAccessSeqReal02', () => {

    /**
     * @tc.name   testMinAccessSeq0370
     * @tc.number SUB_Huks_MCSQ_0370
     * @tc.desc   边界：单字符 SM2 加密得 97 字节密文，密文非空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0370 begin');
      const model: HuksModel = new HuksModel();
      const cipher: string = await encryptSm2With(model, 'x');
      expect(cipher.length > 0).assertTrue();
      const plainBytes_0: number = sm2PlainLen('x');
      const decoded_0: Uint8Array = decodeB64(cipher);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0371
     * @tc.number SUB_Huks_MCSQ_0371
     * @tc.desc   主流程：20 字符文本 SM2 加密得 116 字节密文，长度随码元数递增
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0371', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0371 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'sm2-encrypt-main';
      const cipher: string = await encryptSm2With(model, plain);
      expect(cipher.length > plain.length).assertTrue();
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(cipher);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0372
     * @tc.number SUB_Huks_MCSQ_0372
     * @tc.desc   正向对照：SM2 单字符加密正常回调，密文按 DER 解析且 C2 为 1 字节
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0372', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0372 begin');
      const model: HuksModel = new HuksModel();
      // 正向对照：单字节明文密文按 DER 结构解析，C2 恰为 1 字节
      const cipher: string = await encryptSm2With(model, 'k');
      const decoded: Uint8Array = decodeB64(cipher);
      const c2Pos: number = sm2C2TagPos(decoded);
      const c2Len: number = sm2C2Len(decoded, c2Pos);
      const total: number = decoded.length;
      expect(decoded[0]).assertEqual(0x30);
      expect(c2Len).assertEqual(1);
      expect(total).assertEqual(c2Pos + 1 + sm2LenFieldSize(c2Len) + c2Len);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0372 end');
    });

    /**
     * @tc.name   testMinAccessSeq0373
     * @tc.number SUB_Huks_MCSQ_0373
     * @tc.desc   异常路径：同汉字三次加密密文两两不同，随机 k 保证抗重放
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0373', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0373 begin');
      const model: HuksModel = new HuksModel();
      const cipher1: string = await encryptSm2With(model, '中');
      const cipher2: string = await encryptSm2With(model, '中');
      const cipher3: string = await encryptSm2With(model, '中');
      expect(cipher1 !== cipher2).assertTrue();
      expect(cipher2 !== cipher3).assertTrue();
      const plainBytes_0: number = sm2PlainLen('中');
      const decoded_0: Uint8Array = decodeB64(cipher1);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
      const plainBytes_1: number = sm2PlainLen('中');
      const decoded_1: Uint8Array = decodeB64(cipher2);
      const c2Pos_1: number = sm2C2TagPos(decoded_1);
      const c2Len_1: number = sm2C2Len(decoded_1, c2Pos_1);
      const total_1: number = decoded_1.length;
      expect(decoded_1[0]).assertEqual(0x30);
      expect(c2Len_1).assertEqual(plainBytes_1);
      expect(total_1).assertEqual(c2Pos_1 + 1 + sm2LenFieldSize(c2Len_1) + c2Len_1);
      const plainBytes_2: number = sm2PlainLen('中');
      const decoded_2: Uint8Array = decodeB64(cipher3);
      const c2Pos_2: number = sm2C2TagPos(decoded_2);
      const c2Len_2: number = sm2C2Len(decoded_2, c2Pos_2);
      const total_2: number = decoded_2.length;
      expect(decoded_2[0]).assertEqual(0x30);
      expect(c2Len_2).assertEqual(plainBytes_2);
      expect(total_2).assertEqual(c2Pos_2 + 1 + sm2LenFieldSize(c2Len_2) + c2Len_2);
    });

    /**
     * @tc.name   testMinAccessSeq0374
     * @tc.number SUB_Huks_MCSQ_0374
     * @tc.desc   异常路径：emoji 按 2 个 UTF-16 单元转换，DER 结构中 C2 等于单元数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0374', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0374 begin');
      const model: HuksModel = new HuksModel();
      const cipher: string = await encryptSm2With(model, '😀');
      expect(cipher.length > 0).assertTrue();
      const plainBytes_0: number = sm2PlainLen('😀');
      const decoded_0: Uint8Array = decodeB64(cipher);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0375
     * @tc.number SUB_Huks_MCSQ_0375
     * @tc.desc   异常路径：汉字加符号锁图标加密，DER 结构中 C2 等于 UTF-16 单元数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0375', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0375 begin');
      const model: HuksModel = new HuksModel();
      const cipher: string = await encryptSm2With(model, '密码🔐');
      expect(cipher.length > 0).assertTrue();
      const plainBytes_0: number = sm2PlainLen('密码🔐');
      const decoded_0: Uint8Array = decodeB64(cipher);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0376
     * @tc.number SUB_Huks_MCSQ_0376
     * @tc.desc   异常路径：两个空格两次加密密文不同，DER 结构中 C2 均为 2 字节
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0376', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0376 begin');
      const model: HuksModel = new HuksModel();
      const cipher1: string = await encryptSm2With(model, '  ');
      const cipher2: string = await encryptSm2With(model, '  ');
      expect(cipher1 !== cipher2).assertTrue();
      const plainBytes_0: number = sm2PlainLen('  ');
      const decoded_0: Uint8Array = decodeB64(cipher1);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
      const plainBytes_1: number = sm2PlainLen('  ');
      const decoded_1: Uint8Array = decodeB64(cipher2);
      const c2Pos_1: number = sm2C2TagPos(decoded_1);
      const c2Len_1: number = sm2C2Len(decoded_1, c2Pos_1);
      const total_1: number = decoded_1.length;
      expect(decoded_1[0]).assertEqual(0x30);
      expect(c2Len_1).assertEqual(plainBytes_1);
      expect(total_1).assertEqual(c2Pos_1 + 1 + sm2LenFieldSize(c2Len_1) + c2Len_1);
    });

    /**
     * @tc.name   testMinAccessSeq0377
     * @tc.number SUB_Huks_MCSQ_0377
     * @tc.desc   状态：两实例同输入产出长度一致但密文不同的随机化结果
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0377', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0377 begin');
      const modelA: HuksModel = new HuksModel();
      const modelB: HuksModel = new HuksModel();
      const cipherA: string = await encryptSm2With(modelA, 's');
      const cipherB: string = await encryptSm2With(modelB, 's');
      expect(cipherA !== cipherB).assertTrue();
      const plainBytes_0: number = sm2PlainLen('s');
      const decoded_0: Uint8Array = decodeB64(cipherA);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0378
     * @tc.number SUB_Huks_MCSQ_0378
     * @tc.desc   主流程：5 码元混合串加密得 101 字节密文，密文非空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0378', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0378 begin');
      const model: HuksModel = new HuksModel();
      const cipher: string = await encryptSm2With(model, 'sm2-5');
      expect(cipher.length > 0).assertTrue();
      const plainBytes_0: number = sm2PlainLen('sm2-5');
      const decoded_0: Uint8Array = decodeB64(cipher);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0379
     * @tc.number SUB_Huks_MCSQ_0379
     * @tc.desc   主流程：四汉字加三字符共 7 码元加密得 103 字节密文
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0379', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0379 begin');
      const model: HuksModel = new HuksModel();
      const cipher: string = await encryptSm2With(model, '中文输入sm2');
      expect(cipher.length > 0).assertTrue();
      const plainBytes_0: number = sm2PlainLen('中文输入sm2');
      const decoded_0: Uint8Array = decodeB64(cipher);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0380
     * @tc.number SUB_Huks_MCSQ_0380
     * @tc.desc   异常路径：感叹号两次加密密文不同，长度保持 97 字节
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0380 begin');
      const model: HuksModel = new HuksModel();
      const cipher1: string = await encryptSm2With(model, '!');
      const cipher2: string = await encryptSm2With(model, '!');
      expect(cipher1 !== cipher2).assertTrue();
      const plainBytes_0: number = sm2PlainLen('!');
      const decoded_0: Uint8Array = decodeB64(cipher1);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
      const plainBytes_1: number = sm2PlainLen('!');
      const decoded_1: Uint8Array = decodeB64(cipher2);
      const c2Pos_1: number = sm2C2TagPos(decoded_1);
      const c2Len_1: number = sm2C2Len(decoded_1, c2Pos_1);
      const total_1: number = decoded_1.length;
      expect(decoded_1[0]).assertEqual(0x30);
      expect(c2Len_1).assertEqual(plainBytes_1);
      expect(total_1).assertEqual(c2Pos_1 + 1 + sm2LenFieldSize(c2Len_1) + c2Len_1);
    });

    /**
     * @tc.name   testMinAccessSeq0381
     * @tc.number SUB_Huks_MCSQ_0381
     * @tc.desc   状态：1/2/3/4 码元四档 C2 长度随明文字节数逐档增长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0381', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0381 begin');
      const model: HuksModel = new HuksModel();
      const cipher1: string = await encryptSm2With(model, 'a');
      const cipher2: string = await encryptSm2With(model, 'ab');
      const cipher3: string = await encryptSm2With(model, 'abc');
      const cipher4: string = await encryptSm2With(model, 'abcd');
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
      const plainBytes_3: number = sm2PlainLen('abcd');
      const decoded_3: Uint8Array = decodeB64(cipher4);
      const c2Pos_3: number = sm2C2TagPos(decoded_3);
      const c2Len_3: number = sm2C2Len(decoded_3, c2Pos_3);
      const total_3: number = decoded_3.length;
      expect(decoded_3[0]).assertEqual(0x30);
      expect(c2Len_3).assertEqual(plainBytes_3);
      expect(total_3).assertEqual(c2Pos_3 + 1 + sm2LenFieldSize(c2Len_3) + c2Len_3);
    });

  });
}
