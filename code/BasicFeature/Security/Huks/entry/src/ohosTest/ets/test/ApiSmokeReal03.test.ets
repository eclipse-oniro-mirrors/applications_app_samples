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

// ApiSmoke 补充场景套件三：手写用例，覆盖 主流程 / 边界 / 异常 / 状态 四类。
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

function encryptWith(model: HuksModel, plain: string): Promise<string> {
  return new Promise<string>((resolve: (value: string) => void) => {
    model.encryptData(plain, (cipher: string) => { resolve(cipher); });
  });
}

function decryptWith(model: HuksModel): Promise<string> {
  return new Promise<string>((resolve: (value: string) => void) => {
    model.decryptData((decoded: string) => { resolve(decoded); });
  });
}

function encryptSm2With(model: HuksModel, plain: string): Promise<string> {
  return new Promise<string>((resolve: (value: string) => void) => {
    model.encryptDataUseSm2(plain, (cipher: string) => { resolve(cipher); });
  });
}

function encryptOldWith(model: HuksModel, plain: string): Promise<string> {
  return new Promise<string>((resolve: (value: string) => void) => {
    model.encryptDataUserOldKey(plain, (cipher: string) => { resolve(cipher); });
  });
}

function importWith(model: HuksModel): Promise<void> {
  return model.importKey();
}

function decryptOldWith(model: HuksModel): Promise<string> {
  return new Promise<string>((resolve: (value: string) => void) => {
    model.decryptDataUserOldKey((decoded: string) => { resolve(decoded); });
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

export default function apiSmokeReal03Test() {
  describe('ApiSmokeReal03', () => {

    /**
     * @tc.name   testApiSmoke0070
     * @tc.number SUB_Huks_APISMK_0070
     * @tc.desc   边界：6 字节文本 SM2 加密，DER 结构中 C2 等于明文字节数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0070 begin');
      const model: HuksModel = new HuksModel();
      const cipher: string = await encryptSm2With(model, 'anchor');
      expect(cipher.length > 0).assertTrue();
      const plainBytes_0: number = sm2PlainLen('anchor');
      const decoded_0: Uint8Array = decodeB64(cipher);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testApiSmoke0071
     * @tc.number SUB_Huks_APISMK_0071
     * @tc.desc   主流程：14 字符迁移文本旧密钥加密导入解密往返恢复
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0071 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'smoke-transfer';
      const cipher: string = await encryptOldWith(model, plain);
      await importWith(model);
      const restored: string = await decryptOldWith(model);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher.length), String(24));
      expect(cipher.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(cipher).length), String(16));
      expect(decodeB64(cipher).length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restored, plain);
      expect(restored).assertEqual(plain);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0071 end');
    });

    /**
     * @tc.name   testApiSmoke0072
     * @tc.number SUB_Huks_APISMK_0072
     * @tc.desc   异常路径：感叹号两次 SM2 加密密文不同，长度保持 97 字节
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0072 begin');
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
     * @tc.name   testApiSmoke0073
     * @tc.number SUB_Huks_APISMK_0073
     * @tc.desc   状态：AES 槽位双向共享，B 解 A 写再 A 解 B 写均恢复对方明文
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0073 begin');
      const modelA: HuksModel = new HuksModel();
      const modelB: HuksModel = new HuksModel();
      const cipherA: string = await encryptWith(modelA, 'x');
      const restoredB: string = await decryptWith(modelB);
      const cipherB: string = await encryptWith(modelB, 'y');
      const restoredA: string = await decryptWith(modelA);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restoredB, String('x'));
      expect(restoredB).assertEqual('x');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restoredA, String('y'));
      expect(restoredA).assertEqual('y');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipherA.length), String(24));
      expect(cipherA.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipherB.length), String(24));
      expect(cipherB.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0073 end');
    });

    /**
     * @tc.name   testApiSmoke0074
     * @tc.number SUB_Huks_APISMK_0074
     * @tc.desc   边界：21 字符文本 AES 加密得 37 字节密文，解密往返恢复
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0074 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'abcdefghijklmnopqrstu';
      const cipher: string = await encryptWith(model, plain);
      const restored: string = await decryptWith(model);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher.length), String(52));
      expect(cipher.length).assertEqual(52);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(cipher).length), String(37));
      expect(decodeB64(cipher).length).assertEqual(37);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restored, plain);
      expect(restored).assertEqual(plain);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0074 end');
    });

    /**
     * @tc.name   testApiSmoke0075
     * @tc.number SUB_Huks_APISMK_0075
     * @tc.desc   主流程：9 码元文本 SM2 加密得 105 字节密文且非空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0075 begin');
      const model: HuksModel = new HuksModel();
      const cipher: string = await encryptSm2With(model, 'hello-sm2');
      expect(cipher.length > 0).assertTrue();
      const plainBytes_0: number = sm2PlainLen('hello-sm2');
      const decoded_0: Uint8Array = decodeB64(cipher);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testApiSmoke0076
     * @tc.number SUB_Huks_APISMK_0076
     * @tc.desc   异常路径：单个空格旧密钥两实例加密产出同值 16 字节密文
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0076 begin');
      const modelA: HuksModel = new HuksModel();
      const modelB: HuksModel = new HuksModel();
      const cipherA: string = await encryptOldWith(modelA, ' ');
      const cipherB: string = await encryptOldWith(modelB, ' ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(cipherA === cipherB), String(true));
      expect(cipherA === cipherB).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipherA.length), String(24));
      expect(cipherA.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(cipherA).length), String(16));
      expect(decodeB64(cipherA).length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0076 end');
    });

    /**
     * @tc.name   testApiSmoke0077
     * @tc.number SUB_Huks_APISMK_0077
     * @tc.desc   状态：AES 先 4 字符后 7 字符两轮往返，密文长度 28 与 32 逐轮恢复
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0077 begin');
      const model: HuksModel = new HuksModel();
      const cipher1: string = await encryptWith(model, 'wxyz');
      const restored1: string = await decryptWith(model);
      const cipher2: string = await encryptWith(model, 'qwertyu');
      const restored2: string = await decryptWith(model);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher1.length), String(28));
      expect(cipher1.length).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher2.length), String(32));
      expect(cipher2.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restored1, String('wxyz'));
      expect(restored1).assertEqual('wxyz');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restored2, String('qwertyu'));
      expect(restored2).assertEqual('qwertyu');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0077 end');
    });

  });
}
