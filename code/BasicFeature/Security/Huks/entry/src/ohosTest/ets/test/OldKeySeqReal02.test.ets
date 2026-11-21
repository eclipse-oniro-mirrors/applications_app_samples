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

// OldKeySeq 补充场景套件二：手写用例，覆盖 主流程 / 边界 / 异常 / 状态 四类。
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

export default function oldKeySeqReal02Test() {
  describe('OldKeySeqReal02', () => {

    /**
     * @tc.name   testOldKeySeq0375
     * @tc.number SUB_Huks_OKSQ_0375
     * @tc.desc   主流程：15 字符文本 SM4 加密得单块 24 字符密文，导入后解密往返恢复
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0375', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0375 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '0123456789abcde';
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0375 end');
    });

    /**
     * @tc.name   testOldKeySeq0376
     * @tc.number SUB_Huks_OKSQ_0376
     * @tc.desc   主流程：21 字符文本 SM4 加密得 32 字节密文，导入后解密往返恢复
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0376', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0376 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'sm4-main-roundtrip';
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0376 end');
    });

    /**
     * @tc.name   testOldKeySeq0377
     * @tc.number SUB_Huks_OKSQ_0377
     * @tc.desc   异常路径：单个空格加密得 16 字节密文，导入后解密还原空格
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0377', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0377 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ' ';
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0377 end');
    });

    /**
     * @tc.name   testOldKeySeq0378
     * @tc.number SUB_Huks_OKSQ_0378
     * @tc.desc   边界：恰好 16 字符整块输入补齐为 32 字节密文，解密往返恢复
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0378', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0378 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '0123456789abcdef';
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0378 end');
    });

    /**
     * @tc.name   testOldKeySeq0379
     * @tc.number SUB_Huks_OKSQ_0379
     * @tc.desc   边界：17 字符跨越单块补齐为 32 字节密文，解密往返恢复
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0379', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0379 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '0123456789abcdefg';
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0379 end');
    });

    /**
     * @tc.name   testOldKeySeq0380
     * @tc.number SUB_Huks_OKSQ_0380
     * @tc.desc   状态：同明文连续两次 SM4 加密产生完全一致的确定性密文
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0380 begin');
      const model: HuksModel = new HuksModel();
      const cipher1: string = await encryptOldWith(model, 'x');
      const cipher2: string = await encryptOldWith(model, 'x');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher1.length), String(24));
      expect(cipher1.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher2.length), String(24));
      expect(cipher2.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(cipher1 === cipher2), String(true));
      expect(cipher1 === cipher2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0380 end');
    });

    /**
     * @tc.name   testOldKeySeq0381
     * @tc.number SUB_Huks_OKSQ_0381
     * @tc.desc   边界：单个 emoji 按 2 个 UTF-16 单元取低 8 位，单块密文 24 字符，两实例产出相同
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0381', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0381 begin');
      const modelA: HuksModel = new HuksModel();
      const modelB: HuksModel = new HuksModel();
      const cipherA: string = await encryptOldWith(modelA, '😀');
      const cipherB: string = await encryptOldWith(modelB, '😀');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipherA.length), String(24));
      expect(cipherA.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(cipherA).length), String(16));
      expect(decodeB64(cipherA).length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(cipherA === cipherB), String(true));
      expect(cipherA === cipherB).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0381 end');
    });

    /**
     * @tc.name   testOldKeySeq0382
     * @tc.number SUB_Huks_OKSQ_0382
     * @tc.desc   状态：同一密文连续两轮导入解密均恢复原文，解密后密钥可重新导入
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0382', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0382 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'reuse';
      const cipher: string = await encryptOldWith(model, plain);
      await importWith(model);
      const restored1: string = await decryptOldWith(model);
      await importWith(model);
      const restored2: string = await decryptOldWith(model);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher.length), String(24));
      expect(cipher.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restored1, plain);
      expect(restored1).assertEqual(plain);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restored2, plain);
      expect(restored2).assertEqual(plain);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0382 end');
    });

    /**
     * @tc.name   testOldKeySeq0383
     * @tc.number SUB_Huks_OKSQ_0383
     * @tc.desc   边界：31 字符输入补齐为 32 字节密文，导入后解密往返恢复
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0383', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0383 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'abcdefghijklmnopqrstuvwxyz12345';
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0383 end');
    });

    /**
     * @tc.name   testOldKeySeq0384
     * @tc.number SUB_Huks_OKSQ_0384
     * @tc.desc   边界：汉字与 emoji 混合 3 个 UTF-16 单元取低 8 位，单块密文 24 字符，解密为冻结字节串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0384', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0384 begin');
      const model: HuksModel = new HuksModel();
      const cipher: string = await encryptOldWith(model, '中😀');
      await importWith(model);
      const restored: string = await decryptOldWith(model);
      const mojibake: string = '\u002D\u003D\u0000';
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher.length), String(24));
      expect(cipher.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(cipher).length), String(16));
      expect(decodeB64(cipher).length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restored, mojibake);
      expect(restored).assertEqual(mojibake);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0384 end');
    });

    /**
     * @tc.name   testOldKeySeq0385
     * @tc.number SUB_Huks_OKSQ_0385
     * @tc.desc   异常路径：连续五个空格加密得 16 字节密文，导入后解密还原原串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0385', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0385 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0385 end');
    });

    /**
     * @tc.name   testOldKeySeq0386
     * @tc.number SUB_Huks_OKSQ_0386
     * @tc.desc   状态：A 实例加密并导入后，B 实例直接解密恢复密文槽位中的明文
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0386', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0386 begin');
      const modelA: HuksModel = new HuksModel();
      const modelB: HuksModel = new HuksModel();
      const plain: string = 'xfer';
      const cipher: string = await encryptOldWith(modelA, plain);
      await importWith(modelA);
      const restoredB: string = await decryptOldWith(modelB);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restoredB, plain);
      expect(restoredB).assertEqual(plain);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher.length), String(24));
      expect(cipher.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(cipher).length), String(16));
      expect(decodeB64(cipher).length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0386 end');
    });

  });
}
