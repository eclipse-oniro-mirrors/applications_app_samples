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

// AesSeq 补充场景套件：手写用例，覆盖 主流程 / 边界 / 异常 / 状态 四类。
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

export default function aesSeqReal01Test() {
  describe('AesSeqReal01', () => {

    /**
     * @tc.name   testAesSeq0038
     * @tc.number SUB_Huks_AESSQ_0038
     * @tc.desc   非法混合输入 A中😀1 按 UTF-8 9 字节加密，解密按字节还原为确定性乱码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0038 begin');
      const model: HuksModel = new HuksModel();
      const cipher: string = await encryptWith(model, 'A中😀1');
      const restored: string = await decryptWith(model);
      const mojibake: string = 'A\u00E4\u00B8\u00AD\u00F0\u009F\u0098\u00801';
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher.length), String(36));
      expect(cipher.length).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(cipher).length), String(25));
      expect(decodeB64(cipher).length).assertEqual(25);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restored, mojibake);
      expect(restored).assertEqual(mojibake);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0038 end');
    });

    /**
     * @tc.name   testAesSeq0039
     * @tc.number SUB_Huks_AESSQ_0039
     * @tc.desc   主流程：Hello OpenHarmony 加密解密往返原文恢复，密文长度 44
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0039 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Hello OpenHarmony';
      const cipher: string = await encryptWith(model, plain);
      const restored: string = await decryptWith(model);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher.length), String(44));
      expect(cipher.length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(cipher).length), String(33));
      expect(decodeB64(cipher).length).assertEqual(33);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restored, plain);
      expect(restored).assertEqual(plain);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0039 end');
    });

    /**
     * @tc.name   testAesSeq0040
     * @tc.number SUB_Huks_AESSQ_0040
     * @tc.desc   异常路径：单个空格加密后按字节解密仍还原空格本身
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0040 begin');
      const model: HuksModel = new HuksModel();
      const cipher: string = await encryptWith(model, ' ');
      const restored: string = await decryptWith(model);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher.length), String(24));
      expect(cipher.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(cipher).length), String(17));
      expect(decodeB64(cipher).length).assertEqual(17);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restored, String(' '));
      expect(restored).assertEqual(' ');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0040 end');
    });

    /**
     * @tc.name   testAesSeq0041
     * @tc.number SUB_Huks_AESSQ_0041
     * @tc.desc   状态：密文与密钥槽位为模块级共享，B 实例解密恢复 A 实例刚写入的明文
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0041 begin');
      const modelA: HuksModel = new HuksModel();
      const modelB: HuksModel = new HuksModel();
      const cipherA: string = await encryptWith(modelA, 's1');
      const restoredB: string = await decryptWith(modelB);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restoredB, String('s1'));
      expect(restoredB).assertEqual('s1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipherA.length), String(24));
      expect(cipherA.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(cipherA).length), String(18));
      expect(decodeB64(cipherA).length).assertEqual(18);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0041 end');
    });

  });
}
