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

// AesSeq 补充场景套件二：手写用例，覆盖 主流程 / 边界 / 异常 / 状态 四类。
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

export default function aesSeqReal02Test() {
  describe('AesSeqReal02', () => {

    /**
     * @tc.name   testAesSeq0482
     * @tc.number SUB_Huks_AESSQ_0482
     * @tc.desc   边界：20 字符整输入加密得 36 字节密文，解密往返原文恢复
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0482', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0482 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '0123456789abcdefghij';
      const cipher: string = await encryptWith(model, plain);
      const restored: string = await decryptWith(model);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher.length), String(48));
      expect(cipher.length).assertEqual(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(cipher).length), String(36));
      expect(decodeB64(cipher).length).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restored, plain);
      expect(restored).assertEqual(plain);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0482 end');
    });

    /**
     * @tc.name   testAesSeq0483
     * @tc.number SUB_Huks_AESSQ_0483
     * @tc.desc   主流程：23 字符带空格文本加密解密往返原文恢复，密文 52 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0483', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0483 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Huks AES roundtrip 2026';
      const cipher: string = await encryptWith(model, plain);
      const restored: string = await decryptWith(model);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher.length), String(52));
      expect(cipher.length).assertEqual(52);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(cipher).length), String(39));
      expect(decodeB64(cipher).length).assertEqual(39);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restored, plain);
      expect(restored).assertEqual(plain);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0483 end');
    });

    /**
     * @tc.name   testAesSeq0484
     * @tc.number SUB_Huks_AESSQ_0484
     * @tc.desc   异常路径：三个空格按非空输入加密，解密按字节还原空格串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0484', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0484 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '   ';
      const cipher: string = await encryptWith(model, plain);
      const restored: string = await decryptWith(model);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher.length), String(28));
      expect(cipher.length).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(cipher).length), String(19));
      expect(decodeB64(cipher).length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restored, plain);
      expect(restored).assertEqual(plain);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0484 end');
    });

    /**
     * @tc.name   testAesSeq0485
     * @tc.number SUB_Huks_AESSQ_0485
     * @tc.desc   状态：同一模型连续两轮不同明文往返，各自密文长度正确且各自还原
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0485', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0485 begin');
      const model: HuksModel = new HuksModel();
      const cipher1: string = await encryptWith(model, 'one');
      const restored1: string = await decryptWith(model);
      const cipher2: string = await encryptWith(model, 'second');
      const restored2: string = await decryptWith(model);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restored1, String('one'));
      expect(restored1).assertEqual('one');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restored2, String('second'));
      expect(restored2).assertEqual('second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher1.length), String(28));
      expect(cipher1.length).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher2.length), String(32));
      expect(cipher2.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0485 end');
    });

    /**
     * @tc.name   testAesSeq0486
     * @tc.number SUB_Huks_AESSQ_0486
     * @tc.desc   边界：单字符输入加密得 17 字节密文，解密还原该字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0486', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0486 begin');
      const model: HuksModel = new HuksModel();
      const cipher: string = await encryptWith(model, 'q');
      const restored: string = await decryptWith(model);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher.length), String(24));
      expect(cipher.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(cipher).length), String(17));
      expect(decodeB64(cipher).length).assertEqual(17);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restored, String('q'));
      expect(restored).assertEqual('q');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0486 end');
    });

    /**
     * @tc.name   testAesSeq0487
     * @tc.number SUB_Huks_AESSQ_0487
     * @tc.desc   主流程：纯数字串 8 字符加密得 24 字节密文，解密还原数字串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0487', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0487 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '20261120';
      const cipher: string = await encryptWith(model, plain);
      const restored: string = await decryptWith(model);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher.length), String(32));
      expect(cipher.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(cipher).length), String(24));
      expect(decodeB64(cipher).length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restored, plain);
      expect(restored).assertEqual(plain);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0487 end');
    });

    /**
     * @tc.name   testAesSeq0488
     * @tc.number SUB_Huks_AESSQ_0488
     * @tc.desc   异常路径：emoji 按 UTF-8 4 字节加密，解密按字节还原为确定性乱码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0488', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0488 begin');
      const model: HuksModel = new HuksModel();
      const cipher: string = await encryptWith(model, '😀');
      const restored: string = await decryptWith(model);
      const mojibake: string = '\u00F0\u009F\u0098\u0080';
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher.length), String(28));
      expect(cipher.length).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(cipher).length), String(20));
      expect(decodeB64(cipher).length).assertEqual(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restored, mojibake);
      expect(restored).assertEqual(mojibake);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0488 end');
    });

    /**
     * @tc.name   testAesSeq0489
     * @tc.number SUB_Huks_AESSQ_0489
     * @tc.desc   状态：B 实例解密恢复 A 实例刚写入的明文，槽位共享语义稳定
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0489', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0489 begin');
      const modelA: HuksModel = new HuksModel();
      const modelB: HuksModel = new HuksModel();
      const cipher: string = await encryptWith(modelA, 'shared');
      const restored: string = await decryptWith(modelB);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restored, String('shared'));
      expect(restored).assertEqual('shared');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher.length), String(32));
      expect(cipher.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(cipher).length), String(22));
      expect(decodeB64(cipher).length).assertEqual(22);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0489 end');
    });

    /**
     * @tc.name   testAesSeq0490
     * @tc.number SUB_Huks_AESSQ_0490
     * @tc.desc   边界：19 字符输入加密得 35 字节密文，解密往返原文恢复
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0490 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'abcdefghijklmnopqrs';
      const cipher: string = await encryptWith(model, plain);
      const restored: string = await decryptWith(model);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher.length), String(48));
      expect(cipher.length).assertEqual(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(cipher).length), String(35));
      expect(decodeB64(cipher).length).assertEqual(35);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restored, plain);
      expect(restored).assertEqual(plain);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0490 end');
    });

    /**
     * @tc.name   testAesSeq0491
     * @tc.number SUB_Huks_AESSQ_0491
     * @tc.desc   主流程：5 个符号字符加密得 21 字节密文，解密还原符号串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0491', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0491 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '!@#$%';
      const cipher: string = await encryptWith(model, plain);
      const restored: string = await decryptWith(model);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher.length), String(28));
      expect(cipher.length).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(cipher).length), String(21));
      expect(decodeB64(cipher).length).assertEqual(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restored, plain);
      expect(restored).assertEqual(plain);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0491 end');
    });

    /**
     * @tc.name   testAesSeq0492
     * @tc.number SUB_Huks_AESSQ_0492
     * @tc.desc   异常路径：单数字 0 加密得 17 字节密文，解密还原数字字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0492', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0492 begin');
      const model: HuksModel = new HuksModel();
      const cipher: string = await encryptWith(model, '0');
      const restored: string = await decryptWith(model);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher.length), String(24));
      expect(cipher.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(cipher).length), String(17));
      expect(decodeB64(cipher).length).assertEqual(17);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restored, String('0'));
      expect(restored).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0492 end');
    });

    /**
     * @tc.name   testAesSeq0493
     * @tc.number SUB_Huks_AESSQ_0493
     * @tc.desc   状态：解密删键后再次加密仍可完整往返，密钥生命周期两轮稳定
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0493', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0493 begin');
      const model: HuksModel = new HuksModel();
      const cipher1: string = await encryptWith(model, 'round-1');
      const restored1: string = await decryptWith(model);
      const cipher2: string = await encryptWith(model, 'round-2');
      const restored2: string = await decryptWith(model);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restored1, String('round-1'));
      expect(restored1).assertEqual('round-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', restored2, String('round-2'));
      expect(restored2).assertEqual('round-2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher1.length), String(32));
      expect(cipher1.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher2.length), String(32));
      expect(cipher2.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0493 end');
    });

  });
}
