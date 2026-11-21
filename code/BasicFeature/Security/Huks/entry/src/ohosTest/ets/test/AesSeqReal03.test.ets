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

// AesSeq 补充场景套件三：手写用例，覆盖 主流程 / 边界 / 异常 / 状态 四类。
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

export default function aesSeqReal03Test() {
  describe('AesSeqReal03', () => {

    /**
     * @tc.name   testAesSeq0494
     * @tc.number SUB_Huks_AESSQ_0494
     * @tc.desc   边界：21 字符输入加密得 37 字节密文，解密往返原文恢复
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0494', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0494 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0494 end');
    });

    /**
     * @tc.name   testAesSeq0495
     * @tc.number SUB_Huks_AESSQ_0495
     * @tc.desc   主流程：文本夹 emoji 按 UTF-8 14 字节加密，解密按字节还原乱码序列
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0495', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0495 begin');
      const model: HuksModel = new HuksModel();
      const cipher: string = await encryptWith(model, 'Hello😀World');
      const restored: string = await decryptWith(model);
      const mojibake: string = 'Hello\u00F0\u009F\u0098\u0080World';
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher.length), String(40));
      expect(cipher.length).assertEqual(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(cipher).length), String(30));
      expect(decodeB64(cipher).length).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restored, mojibake);
      expect(restored).assertEqual(mojibake);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0495 end');
    });

    /**
     * @tc.name   testAesSeq0496
     * @tc.number SUB_Huks_AESSQ_0496
     * @tc.desc   异常路径：制表符单字符加密得 17 字节密文，解密还原制表符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0496', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0496 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '\t';
      const cipher: string = await encryptWith(model, plain);
      const restored: string = await decryptWith(model);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher.length), String(24));
      expect(cipher.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(cipher).length), String(17));
      expect(decodeB64(cipher).length).assertEqual(17);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restored, String(plain));
      expect(restored).assertEqual(plain);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0496 end');
    });

    /**
     * @tc.name   testAesSeq0497
     * @tc.number SUB_Huks_AESSQ_0497
     * @tc.desc   状态：1/2/3 字符三档连续往返，密文长度逐档为 24/24/28
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0497', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0497 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0497 end');
    });

    /**
     * @tc.name   testAesSeq0498
     * @tc.number SUB_Huks_AESSQ_0498
     * @tc.desc   边界：40 字符输入加密得 56 字节密文，解密往返原文恢复
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0498', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0498 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMN';
      const cipher: string = await encryptWith(model, plain);
      const restored: string = await decryptWith(model);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher.length), String(76));
      expect(cipher.length).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(cipher).length), String(56));
      expect(decodeB64(cipher).length).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restored, plain);
      expect(restored).assertEqual(plain);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0498 end');
    });

    /**
     * @tc.name   testAesSeq0499
     * @tc.number SUB_Huks_AESSQ_0499
     * @tc.desc   主流程：21 字符含空格与感叹号文本加密解密往返原文恢复
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0499', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0499 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'OpenHarmony Huks AES!';
      const cipher: string = await encryptWith(model, plain);
      const restored: string = await decryptWith(model);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher.length), String(52));
      expect(cipher.length).assertEqual(52);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(cipher).length), String(37));
      expect(decodeB64(cipher).length).assertEqual(37);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restored, plain);
      expect(restored).assertEqual(plain);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0499 end');
    });

    /**
     * @tc.name   testAesSeq0500
     * @tc.number SUB_Huks_AESSQ_0500
     * @tc.desc   异常路径：单汉字按 UTF-8 3 字节加密，解密按字节还原为确定性乱码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0500 begin');
      const model: HuksModel = new HuksModel();
      const cipher: string = await encryptWith(model, '中');
      const restored: string = await decryptWith(model);
      const mojibake: string = '\u00E4\u00B8\u00AD';
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher.length), String(28));
      expect(cipher.length).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(cipher).length), String(19));
      expect(decodeB64(cipher).length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restored, mojibake);
      expect(restored).assertEqual(mojibake);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0500 end');
    });

    /**
     * @tc.name   testAesSeq0501
     * @tc.number SUB_Huks_AESSQ_0501
     * @tc.desc   状态：同明文两轮完整往返均还原，两轮密文长度一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0501 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'stable-text';
      const cipher1: string = await encryptWith(model, plain);
      const restored1: string = await decryptWith(model);
      const cipher2: string = await encryptWith(model, plain);
      const restored2: string = await decryptWith(model);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restored1, plain);
      expect(restored1).assertEqual(plain);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restored2, plain);
      expect(restored2).assertEqual(plain);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(cipher1.length === cipher2.length), String(true));
      expect(cipher1.length === cipher2.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher1.length), String(36));
      expect(cipher1.length).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0501 end');
    });

  });
}
