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

// ApiSmoke 补充场景套件：手写用例，覆盖 主流程 / 边界 / 异常 / 状态 四类。
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

export default function apiSmokeReal01Test() {
  describe('ApiSmokeReal01', () => {

    /**
     * @tc.name   testApiSmoke0014
     * @tc.number SUB_Huks_APISMK_0014
     * @tc.desc   encryptData 直接调用单字符 x，密文 24 字符 17 字节，解密还原
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0014 begin');
      const model: HuksModel = new HuksModel();
      const cipher: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptData('x', (c: string) => { resolve(c); });
      });
      const restored: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.decryptData((d: string) => { resolve(d); });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher.length), String(24));
      expect(cipher.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(cipher).length), String(17));
      expect(decodeB64(cipher).length).assertEqual(17);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restored, String('x'));
      expect(restored).assertEqual('x');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0014 end');
    });

    /**
     * @tc.name   testApiSmoke0015
     * @tc.number SUB_Huks_APISMK_0015
     * @tc.desc   主流程：旧密钥链路加密、导入密钥、解密完整走通
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0015 begin');
      const model: HuksModel = new HuksModel();
      const cipher: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptDataUserOldKey('chain', (c: string) => { resolve(c); });
      });
      const imported: boolean = await new Promise<boolean>((resolve: (value: boolean) => void) => {
        model.importKey().then((): void => {
          resolve(true);
        }).catch((): void => {
          resolve(false);
        });
      });
      const restored: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.decryptDataUserOldKey((d: string) => { resolve(d); });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher.length), String(24));
      expect(cipher.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(imported), String(true));
      expect(imported).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restored, String('chain'));
      expect(restored).assertEqual('chain');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0015 end');
    });

    /**
     * @tc.name   testApiSmoke0016
     * @tc.number SUB_Huks_APISMK_0016
     * @tc.desc   正向对照：SM2 单字符加密正常回调，密文按 DER 解析且 C2 为 1 字节
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0016 begin');
      const model: HuksModel = new HuksModel();
      // 正向对照：非空输入正常回调并按 DER 结构解析
      const cipher: string = await callEncryptSm2(model, 'z');
      const decoded: Uint8Array = decodeB64(cipher);
      const c2Pos: number = sm2C2TagPos(decoded);
      const c2Len: number = sm2C2Len(decoded, c2Pos);
      const total: number = decoded.length;
      expect(decoded[0]).assertEqual(0x30);
      expect(c2Len).assertEqual(1);
      expect(total).assertEqual(c2Pos + 1 + sm2LenFieldSize(c2Len) + c2Len);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0016 end');
    });

    /**
     * @tc.name   testApiSmoke0017
     * @tc.number SUB_Huks_APISMK_0017
     * @tc.desc   状态：同一模型连续两次 SM2 加密单字符，密文互异且各自按 DER 解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0017 begin');
      const model: HuksModel = new HuksModel();
      const cipherA: string = await callEncryptSm2(model, 'k');
      const cipherB: string = await callEncryptSm2(model, 'k');
      expect(cipherA === cipherB).assertFalse();
      const plainBytes_0: number = sm2PlainLen('k');
      const decoded_0: Uint8Array = decodeB64(cipherA);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
      const plainBytes_1: number = sm2PlainLen('k');
      const decoded_1: Uint8Array = decodeB64(cipherB);
      const c2Pos_1: number = sm2C2TagPos(decoded_1);
      const c2Len_1: number = sm2C2Len(decoded_1, c2Pos_1);
      const total_1: number = decoded_1.length;
      expect(decoded_1[0]).assertEqual(0x30);
      expect(c2Len_1).assertEqual(plainBytes_1);
      expect(total_1).assertEqual(c2Pos_1 + 1 + sm2LenFieldSize(c2Len_1) + c2Len_1);
    });

  });
}
