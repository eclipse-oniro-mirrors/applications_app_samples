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

// OldKeySeq 补充场景套件三：手写用例，覆盖 主流程 / 边界 / 异常 / 状态 四类。
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

export default function oldKeySeqReal03Test() {
  describe('OldKeySeqReal03', () => {

    /**
     * @tc.name   testOldKeySeq0387
     * @tc.number SUB_Huks_OKSQ_0387
     * @tc.desc   主流程：32 字符设备迁移文本 SM4 加密得 48 字节密文，导入后解密往返恢复
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0387', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0387 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '0123456789abcdefghijklmnopqrstuv';
      const cipher: string = await encryptOldWith(model, plain);
      await importWith(model);
      const restored: string = await decryptOldWith(model);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher.length), String(64));
      expect(cipher.length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(cipher).length), String(48));
      expect(decodeB64(cipher).length).assertEqual(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restored, plain);
      expect(restored).assertEqual(plain);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0387 end');
    });

    /**
     * @tc.name   testOldKeySeq0388
     * @tc.number SUB_Huks_OKSQ_0388
     * @tc.desc   主流程：28 字符设备迁移文本 SM4 加密解密往返原文恢复
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0388', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0388 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'device1-device2-sm4-transfer';
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0388 end');
    });

    /**
     * @tc.name   testOldKeySeq0389
     * @tc.number SUB_Huks_OKSQ_0389
     * @tc.desc   边界：字母混 emoji 按 3 个 UTF-16 单元取低 8 位，单块密文 24 字符，跨实例一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0389', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0389 begin');
      const modelA: HuksModel = new HuksModel();
      const modelB: HuksModel = new HuksModel();
      const cipherA: string = await encryptOldWith(modelA, 'A😀');
      const cipherB: string = await encryptOldWith(modelB, 'A😀');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipherA.length), String(24));
      expect(cipherA.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(cipherA).length), String(16));
      expect(decodeB64(cipherA).length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(cipherA === cipherB), String(true));
      expect(cipherA === cipherB).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0389 end');
    });

    /**
     * @tc.name   testOldKeySeq0390
     * @tc.number SUB_Huks_OKSQ_0390
     * @tc.desc   状态：同一密文连续三轮导入解密均恢复原文，槽位密文保持稳定
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0390 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'three';
      const cipher: string = await encryptOldWith(model, plain);
      await importWith(model);
      const restored1: string = await decryptOldWith(model);
      await importWith(model);
      const restored2: string = await decryptOldWith(model);
      await importWith(model);
      const restored3: string = await decryptOldWith(model);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher.length), String(24));
      expect(cipher.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restored1, plain);
      expect(restored1).assertEqual(plain);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restored2, plain);
      expect(restored2).assertEqual(plain);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restored3, plain);
      expect(restored3).assertEqual(plain);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0390 end');
    });

    /**
     * @tc.name   testOldKeySeq0391
     * @tc.number SUB_Huks_OKSQ_0391
     * @tc.desc   状态：单字符两次加密密文完全一致，确定性由固定密钥与填充保证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0391', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0391 begin');
      const model: HuksModel = new HuksModel();
      const cipher1: string = await encryptOldWith(model, 'x');
      const cipher2: string = await encryptOldWith(model, 'x');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(cipher1 === cipher2), String(true));
      expect(cipher1 === cipher2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher1.length), String(24));
      expect(cipher1.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(cipher1).length), String(16));
      expect(decodeB64(cipher1).length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0391 end');
    });

    /**
     * @tc.name   testOldKeySeq0392
     * @tc.number SUB_Huks_OKSQ_0392
     * @tc.desc   主流程：10 位数字串加密得 16 字节密文，导入后解密还原数字串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0392', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0392 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '1234567890';
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0392 end');
    });

    /**
     * @tc.name   testOldKeySeq0393
     * @tc.number SUB_Huks_OKSQ_0393
     * @tc.desc   边界：单汉字按 UTF-16 单元取低 8 位，单块密文 24 字符，解密为冻结字节串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0393', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0393 begin');
      const model: HuksModel = new HuksModel();
      const cipher: string = await encryptOldWith(model, '中');
      await importWith(model);
      const restored: string = await decryptOldWith(model);
      const mojibake: string = '\u002D';
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher.length), String(24));
      expect(cipher.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(cipher).length), String(16));
      expect(decodeB64(cipher).length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restored, mojibake);
      expect(restored).assertEqual(mojibake);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0393 end');
    });

    /**
     * @tc.name   testOldKeySeq0394
     * @tc.number SUB_Huks_OKSQ_0394
     * @tc.desc   状态：20 字符输入两实例产出同值 32 字节密文，跨实例一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0394', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0394 begin');
      const modelA: HuksModel = new HuksModel();
      const modelB: HuksModel = new HuksModel();
      const plain: string = 'abcdefghijklmnopqrst';
      const cipherA: string = await encryptOldWith(modelA, plain);
      const cipherB: string = await encryptOldWith(modelB, plain);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(cipherA === cipherB), String(true));
      expect(cipherA === cipherB).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipherA.length), String(44));
      expect(cipherA.length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(cipherA).length), String(32));
      expect(decodeB64(cipherA).length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0394 end');
    });

  });
}
