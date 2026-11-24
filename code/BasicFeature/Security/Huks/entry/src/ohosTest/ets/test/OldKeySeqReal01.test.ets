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

// OldKeySeq 补充场景套件：手写用例，覆盖 主流程 / 边界 / 异常 / 状态 四类。
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

function callEncryptOld(model: HuksModel, plain: string): Promise<string> {
  return new Promise<string>((resolve: (value: string) => void) => {
    model.encryptDataUserOldKey(plain, (result: string) => { resolve(result); });
  });
}

function callImport(model: HuksModel): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    model.importKey().then((): void => {
      resolve();
    }).catch((): void => {
      resolve();
    });
  });
}

function callDecryptOld(model: HuksModel): Promise<string> {
  return new Promise<string>((resolve: (value: string) => void) => {
    model.decryptDataUserOldKey((result: string) => { resolve(result); });
  });
}

export default function oldKeySeqReal01Test() {
  describe('OldKeySeqReal01', () => {

    /**
     * @tc.name   testOldKeySeq0030
     * @tc.number SUB_Huks_OKSQ_0030
     * @tc.desc   组合：A中😀1 共 5 个 UTF-16 单元取低 8 位，补 1 块到 16 字节，固定密钥与 IV 下密文确定
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0030 begin');
      const modelA: HuksModel = new HuksModel();
      const modelB: HuksModel = new HuksModel();
      const cipherA: string = await callEncryptOld(modelA, 'A中😀1');
      const cipherB: string = await callEncryptOld(modelB, 'A中😀1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipherA.length), String(24));
      expect(cipherA.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(cipherA).length === decodeB64(cipherB).length), String(true));
      expect(decodeB64(cipherA).length === decodeB64(cipherB).length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(cipherA === cipherB), String(true));
      expect(cipherA === cipherB).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0030 end');
    });

    /**
     * @tc.name   testOldKeySeq0031
     * @tc.number SUB_Huks_OKSQ_0031
     * @tc.desc   主流程：main-sm4 加密、导入密钥、解密往返原文恢复
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0031 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'main-sm4';
      const cipher: string = await callEncryptOld(model, plain);
      await callImport(model);
      const restored: string = await callDecryptOld(model);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher.length), String(24));
      expect(cipher.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(cipher).length), String(16));
      expect(decodeB64(cipher).length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restored, plain);
      expect(restored).assertEqual(plain);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0031 end');
    });

    /**
     * @tc.name   testOldKeySeq0032
     * @tc.number SUB_Huks_OKSQ_0032
     * @tc.desc   状态：两个独立模型对同一单字符加密，块结构一致且密文相同
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0032 begin');
      const modelA: HuksModel = new HuksModel();
      const modelB: HuksModel = new HuksModel();
      const cipherA: string = await callEncryptOld(modelA, 'a');
      const cipherB: string = await callEncryptOld(modelB, 'a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipherA.length), String(24));
      expect(cipherA.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(cipherB).length), String(16));
      expect(decodeB64(cipherB).length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(cipherA === cipherB), String(true));
      expect(cipherA === cipherB).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0032 end');
    });

    /**
     * @tc.name   testOldKeySeq0033
     * @tc.number SUB_Huks_OKSQ_0033
     * @tc.desc   状态：16 字符整块补满块解密恢复后，重复加密同明文密文不变
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0033 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'AAAAAAAAAAAAAAAA';
      const cipher: string = await callEncryptOld(model, plain);
      await callImport(model);
      const restored: string = await callDecryptOld(model);
      const cipherAgain: string = await callEncryptOld(model, plain);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher.length), String(44));
      expect(cipher.length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(cipher).length), String(32));
      expect(decodeB64(cipher).length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restored, plain);
      expect(restored).assertEqual(plain);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(cipherAgain === cipher), String(true));
      expect(cipherAgain === cipher).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0033 end');
    });

  });
}
