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

// ApiSmoke 补充场景套件二：手写用例，覆盖 主流程 / 边界 / 异常 / 状态 四类。
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

export default function apiSmokeReal02Test() {
  describe('ApiSmokeReal02', () => {

    /**
     * @tc.name   testApiSmoke0058
     * @tc.number SUB_Huks_APISMK_0058
     * @tc.desc   边界：10 字符文本 AES 加密得 26 字节密文，解密往返恢复
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0058 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'anchor-aes';
      const cipher: string = await encryptWith(model, plain);
      const restored: string = await decryptWith(model);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher.length), String(36));
      expect(cipher.length).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(cipher).length), String(26));
      expect(decodeB64(cipher).length).assertEqual(26);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restored, plain);
      expect(restored).assertEqual(plain);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0058 end');
    });

    /**
     * @tc.name   testApiSmoke0059
     * @tc.number SUB_Huks_APISMK_0059
     * @tc.desc   主流程：13 字节文本 SM2 加密，DER 结构中 C2 等于明文字节数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0059 begin');
      const model: HuksModel = new HuksModel();
      const cipher: string = await encryptSm2With(model, 'api-smoke-sm2');
      expect(cipher.length > 0).assertTrue();
      const plainBytes_0: number = sm2PlainLen('api-smoke-sm2');
      const decoded_0: Uint8Array = decodeB64(cipher);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testApiSmoke0060
     * @tc.number SUB_Huks_APISMK_0060
     * @tc.desc   异常路径：7 字符文本旧密钥链路加密导入解密往返恢复
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0060 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'api-neg';
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0060 end');
    });

    /**
     * @tc.name   testApiSmoke0061
     * @tc.number SUB_Huks_APISMK_0061
     * @tc.desc   状态：AES 连续两轮完整往返各自恢复原文，槽位密文被新一轮覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0061 begin');
      const model: HuksModel = new HuksModel();
      const cipher1: string = await encryptWith(model, 'one');
      const restored1: string = await decryptWith(model);
      const cipher2: string = await encryptWith(model, 'two');
      const restored2: string = await decryptWith(model);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restored1, String('one'));
      expect(restored1).assertEqual('one');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restored2, String('two'));
      expect(restored2).assertEqual('two');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher1.length), String(28));
      expect(cipher1.length).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher2.length), String(28));
      expect(cipher2.length).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0061 end');
    });

    /**
     * @tc.name   testApiSmoke0062
     * @tc.number SUB_Huks_APISMK_0062
     * @tc.desc   边界：20 字符文本 AES 加密得 36 字节密文，解密往返恢复
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0062 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'abcdefghijklmnopqrst';
      const cipher: string = await encryptWith(model, plain);
      const restored: string = await decryptWith(model);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher.length), String(48));
      expect(cipher.length).assertEqual(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(cipher).length), String(36));
      expect(decodeB64(cipher).length).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restored, plain);
      expect(restored).assertEqual(plain);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0062 end');
    });

    /**
     * @tc.name   testApiSmoke0063
     * @tc.number SUB_Huks_APISMK_0063
     * @tc.desc   边界：20 字符文本旧密钥加密得 32 字节密文，导入后解密往返恢复
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0063 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'abcdefghijklmnopqrst';
      const cipher: string = await encryptOldWith(model, plain);
      await importWith(model);
      const restored: string = await decryptOldWith(model);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher.length), String(44));
      expect(cipher.length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(cipher).length), String(32));
      expect(decodeB64(cipher).length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restored, plain);
      expect(restored).assertEqual(plain);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0063 end');
    });

    /**
     * @tc.name   testApiSmoke0064
     * @tc.number SUB_Huks_APISMK_0064
     * @tc.desc   异常路径：两个空格 SM2 加密，DER 结构中 C2 为 2 字节且密文非空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0064 begin');
      const model: HuksModel = new HuksModel();
      const cipher: string = await encryptSm2With(model, '  ');
      expect(cipher.length > 0).assertTrue();
      const plainBytes_0: number = sm2PlainLen('  ');
      const decoded_0: Uint8Array = decodeB64(cipher);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testApiSmoke0065
     * @tc.number SUB_Huks_APISMK_0065
     * @tc.desc   状态：同明文两次旧密钥加密产生完全一致的确定性密文
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0065 begin');
      const model: HuksModel = new HuksModel();
      const cipher1: string = await encryptOldWith(model, 'dup');
      const cipher2: string = await encryptOldWith(model, 'dup');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(cipher1 === cipher2), String(true));
      expect(cipher1 === cipher2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher1.length), String(24));
      expect(cipher1.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(cipher1).length), String(16));
      expect(decodeB64(cipher1).length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0065 end');
    });

    /**
     * @tc.name   testApiSmoke0066
     * @tc.number SUB_Huks_APISMK_0066
     * @tc.desc   异常路径：emoji 按 2 个 UTF-16 单元加密，DER 结构中 C2 为 2 字节
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0066 begin');
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
     * @tc.name   testApiSmoke0067
     * @tc.number SUB_Huks_APISMK_0067
     * @tc.desc   主流程：10 位数字串 AES 加密得 26 字节密文，解密往返恢复
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0067 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '0123456789';
      const cipher: string = await encryptWith(model, plain);
      const restored: string = await decryptWith(model);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher.length), String(36));
      expect(cipher.length).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(cipher).length), String(26));
      expect(decodeB64(cipher).length).assertEqual(26);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restored, plain);
      expect(restored).assertEqual(plain);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0067 end');
    });

    /**
     * @tc.name   testApiSmoke0068
     * @tc.number SUB_Huks_APISMK_0068
     * @tc.desc   异常路径：连续五个空格旧密钥加密得 16 字节密文，导入后解密还原原串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0068 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '     ';
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0068 end');
    });

    /**
     * @tc.name   testApiSmoke0069
     * @tc.number SUB_Huks_APISMK_0069
     * @tc.desc   状态：1/2/3 字符三档连续 AES 往返，密文长度逐档为 24/24/28
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0069 begin');
      const model: HuksModel = new HuksModel();
      const cipher1: string = await encryptWith(model, 'a');
      const restored1: string = await decryptWith(model);
      const cipher2: string = await encryptWith(model, 'ab');
      const restored2: string = await decryptWith(model);
      const cipher3: string = await encryptWith(model, 'abc');
      const restored3: string = await decryptWith(model);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher1.length), String(24));
      expect(cipher1.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher2.length), String(24));
      expect(cipher2.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher3.length), String(28));
      expect(cipher3.length).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restored1, String('a'));
      expect(restored1).assertEqual('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restored2, String('ab'));
      expect(restored2).assertEqual('ab');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restored3, String('abc'));
      expect(restored3).assertEqual('abc');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0069 end');
    });

  });
}
