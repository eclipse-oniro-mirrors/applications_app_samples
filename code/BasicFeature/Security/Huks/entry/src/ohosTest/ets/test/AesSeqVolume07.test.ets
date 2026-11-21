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

export default function aesSeqVolume07Test() {
  describe('AesSeqVolume07', () => {

    /**
     * @tc.name   testAesSeq0342
     * @tc.number SUB_Huks_AESSQ_0342
     * @tc.desc   边界：1 字符最小非空输入
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0342', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0342 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(1);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(24));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(17));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(17);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1));
      expect(decodeB64(result).length - 16).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0342 end');
    });

    /**
     * @tc.name   testAesSeq0343
     * @tc.number SUB_Huks_AESSQ_0343
     * @tc.desc   边界：1 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0343', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0343 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(1);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(24));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(17));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(17);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1));
      expect(decodeB64(result).length - 16).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0343 end');
    });

    /**
     * @tc.name   testAesSeq0344
     * @tc.number SUB_Huks_AESSQ_0344
     * @tc.desc   边界：2 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0344', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0344 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(2);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(24));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(18));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(18);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(2));
      expect(decodeB64(result).length - 16).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0344 end');
    });

    /**
     * @tc.name   testAesSeq0345
     * @tc.number SUB_Huks_AESSQ_0345
     * @tc.desc   边界：3 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0345', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0345 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(3);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(28));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(19));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(3));
      expect(decodeB64(result).length - 16).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0345 end');
    });

    /**
     * @tc.name   testAesSeq0346
     * @tc.number SUB_Huks_AESSQ_0346
     * @tc.desc   边界：4 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0346', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0346 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(4);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(28));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(20));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(4));
      expect(decodeB64(result).length - 16).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0346 end');
    });

    /**
     * @tc.name   testAesSeq0347
     * @tc.number SUB_Huks_AESSQ_0347
     * @tc.desc   边界：5 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0347', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0347 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(5);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(28));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(21));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(5));
      expect(decodeB64(result).length - 16).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0347 end');
    });

    /**
     * @tc.name   testAesSeq0348
     * @tc.number SUB_Huks_AESSQ_0348
     * @tc.desc   边界：14 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0348', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0348 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(14);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(40));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(30));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(14));
      expect(decodeB64(result).length - 16).assertEqual(14);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0348 end');
    });

    /**
     * @tc.name   testAesSeq0349
     * @tc.number SUB_Huks_AESSQ_0349
     * @tc.desc   边界：15 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0349', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0349 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(15);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(44));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(31));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(31);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(15));
      expect(decodeB64(result).length - 16).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0349 end');
    });

    /**
     * @tc.name   testAesSeq0350
     * @tc.number SUB_Huks_AESSQ_0350
     * @tc.desc   边界：16 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0350 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(16);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(44));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(32));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(16));
      expect(decodeB64(result).length - 16).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0350 end');
    });

    /**
     * @tc.name   testAesSeq0351
     * @tc.number SUB_Huks_AESSQ_0351
     * @tc.desc   边界：17 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0351', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0351 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(17);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(44));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(33));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(33);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(17));
      expect(decodeB64(result).length - 16).assertEqual(17);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0351 end');
    });

    /**
     * @tc.name   testAesSeq0352
     * @tc.number SUB_Huks_AESSQ_0352
     * @tc.desc   边界：18 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0352', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0352 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(18);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(48));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(34));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(34);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(18));
      expect(decodeB64(result).length - 16).assertEqual(18);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0352 end');
    });

    /**
     * @tc.name   testAesSeq0353
     * @tc.number SUB_Huks_AESSQ_0353
     * @tc.desc   边界：19 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0353', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0353 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(19);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(48));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(35));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(35);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(19));
      expect(decodeB64(result).length - 16).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0353 end');
    });

    /**
     * @tc.name   testAesSeq0354
     * @tc.number SUB_Huks_AESSQ_0354
     * @tc.desc   边界：20 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0354', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0354 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(20);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(48));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(36));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(20));
      expect(decodeB64(result).length - 16).assertEqual(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0354 end');
    });

    /**
     * @tc.name   testAesSeq0355
     * @tc.number SUB_Huks_AESSQ_0355
     * @tc.desc   边界：21 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0355', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0355 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(21);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(52));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(52);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(37));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(37);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(21));
      expect(decodeB64(result).length - 16).assertEqual(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0355 end');
    });

    /**
     * @tc.name   testAesSeq0356
     * @tc.number SUB_Huks_AESSQ_0356
     * @tc.desc   边界：22 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0356', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0356 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(22);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(52));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(52);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(38));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(38);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(22));
      expect(decodeB64(result).length - 16).assertEqual(22);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0356 end');
    });

    /**
     * @tc.name   testAesSeq0357
     * @tc.number SUB_Huks_AESSQ_0357
     * @tc.desc   边界：23 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0357', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0357 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(23);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(52));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(52);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(39));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(39);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(23));
      expect(decodeB64(result).length - 16).assertEqual(23);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0357 end');
    });

    /**
     * @tc.name   testAesSeq0358
     * @tc.number SUB_Huks_AESSQ_0358
     * @tc.desc   边界：31 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0358', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0358 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(31);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(64));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(47));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(47);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(31));
      expect(decodeB64(result).length - 16).assertEqual(31);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0358 end');
    });

    /**
     * @tc.name   testAesSeq0359
     * @tc.number SUB_Huks_AESSQ_0359
     * @tc.desc   边界：32 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0359', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0359 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(32);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(64));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(48));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(32));
      expect(decodeB64(result).length - 16).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0359 end');
    });

    /**
     * @tc.name   testAesSeq0360
     * @tc.number SUB_Huks_AESSQ_0360
     * @tc.desc   边界：33 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0360 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(33);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(68));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(68);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(49));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(49);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(33));
      expect(decodeB64(result).length - 16).assertEqual(33);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0360 end');
    });

    /**
     * @tc.name   testAesSeq0361
     * @tc.number SUB_Huks_AESSQ_0361
     * @tc.desc   边界：47 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0361', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0361 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(47);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(84));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(84);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(63));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(63);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(47));
      expect(decodeB64(result).length - 16).assertEqual(47);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0361 end');
    });

    /**
     * @tc.name   testAesSeq0362
     * @tc.number SUB_Huks_AESSQ_0362
     * @tc.desc   边界：48 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0362', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0362 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(48);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(88));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(88);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(64));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(48));
      expect(decodeB64(result).length - 16).assertEqual(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0362 end');
    });

    /**
     * @tc.name   testAesSeq0363
     * @tc.number SUB_Huks_AESSQ_0363
     * @tc.desc   边界：49 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0363', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0363 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(49);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(88));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(88);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(65));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(65);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(49));
      expect(decodeB64(result).length - 16).assertEqual(49);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0363 end');
    });

    /**
     * @tc.name   testAesSeq0364
     * @tc.number SUB_Huks_AESSQ_0364
     * @tc.desc   边界：62 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0364', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0364 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(62);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(104));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(78));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(78);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(62));
      expect(decodeB64(result).length - 16).assertEqual(62);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0364 end');
    });

    /**
     * @tc.name   testAesSeq0365
     * @tc.number SUB_Huks_AESSQ_0365
     * @tc.desc   边界：63 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0365', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0365 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(63);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(108));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(108);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(79));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(79);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(63));
      expect(decodeB64(result).length - 16).assertEqual(63);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0365 end');
    });

    /**
     * @tc.name   testAesSeq0366
     * @tc.number SUB_Huks_AESSQ_0366
     * @tc.desc   边界：64 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0366', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0366 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(64);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(108));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(108);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(80));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(80);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(64));
      expect(decodeB64(result).length - 16).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0366 end');
    });

    /**
     * @tc.name   testAesSeq0367
     * @tc.number SUB_Huks_AESSQ_0367
     * @tc.desc   边界：65 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0367', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0367 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(65);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(108));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(108);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(81));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(81);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(65));
      expect(decodeB64(result).length - 16).assertEqual(65);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0367 end');
    });

    /**
     * @tc.name   testAesSeq0368
     * @tc.number SUB_Huks_AESSQ_0368
     * @tc.desc   边界：66 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0368', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0368 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(66);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(112));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(112);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(82));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(82);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(66));
      expect(decodeB64(result).length - 16).assertEqual(66);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0368 end');
    });

    /**
     * @tc.name   testAesSeq0369
     * @tc.number SUB_Huks_AESSQ_0369
     * @tc.desc   边界：95 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0369', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0369 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(95);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(148));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(148);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(111));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(111);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(95));
      expect(decodeB64(result).length - 16).assertEqual(95);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0369 end');
    });

    /**
     * @tc.name   testAesSeq0370
     * @tc.number SUB_Huks_AESSQ_0370
     * @tc.desc   边界：96 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0370 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(96);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(152));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(152);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(112));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(112);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(96));
      expect(decodeB64(result).length - 16).assertEqual(96);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0370 end');
    });

    /**
     * @tc.name   testAesSeq0371
     * @tc.number SUB_Huks_AESSQ_0371
     * @tc.desc   边界：97 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0371', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0371 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(97);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(152));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(152);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(113));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(113);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(97));
      expect(decodeB64(result).length - 16).assertEqual(97);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0371 end');
    });

    /**
     * @tc.name   testAesSeq0372
     * @tc.number SUB_Huks_AESSQ_0372
     * @tc.desc   边界：127 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0372', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0372 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(127);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(192));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(192);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(143));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(143);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(127));
      expect(decodeB64(result).length - 16).assertEqual(127);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0372 end');
    });

    /**
     * @tc.name   testAesSeq0373
     * @tc.number SUB_Huks_AESSQ_0373
     * @tc.desc   边界：128 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0373', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0373 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(128);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(192));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(192);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(144));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(144);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(128));
      expect(decodeB64(result).length - 16).assertEqual(128);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0373 end');
    });

    /**
     * @tc.name   testAesSeq0374
     * @tc.number SUB_Huks_AESSQ_0374
     * @tc.desc   边界：129 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0374', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0374 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(129);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(196));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(196);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(145));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(145);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(129));
      expect(decodeB64(result).length - 16).assertEqual(129);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0374 end');
    });

    /**
     * @tc.name   testAesSeq0375
     * @tc.number SUB_Huks_AESSQ_0375
     * @tc.desc   边界：130 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0375', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0375 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(130);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(196));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(196);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(146));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(146);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(130));
      expect(decodeB64(result).length - 16).assertEqual(130);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0375 end');
    });

    /**
     * @tc.name   testAesSeq0376
     * @tc.number SUB_Huks_AESSQ_0376
     * @tc.desc   边界：254 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0376', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0376 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(254);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(360));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(360);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(270));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(270);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(254));
      expect(decodeB64(result).length - 16).assertEqual(254);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0376 end');
    });

    /**
     * @tc.name   testAesSeq0377
     * @tc.number SUB_Huks_AESSQ_0377
     * @tc.desc   边界：255 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0377', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0377 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(255);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(364));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(364);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(271));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(271);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(255));
      expect(decodeB64(result).length - 16).assertEqual(255);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0377 end');
    });

    /**
     * @tc.name   testAesSeq0378
     * @tc.number SUB_Huks_AESSQ_0378
     * @tc.desc   边界：256 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0378', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0378 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(256);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(364));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(364);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(272));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(272);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(256));
      expect(decodeB64(result).length - 16).assertEqual(256);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0378 end');
    });

    /**
     * @tc.name   testAesSeq0379
     * @tc.number SUB_Huks_AESSQ_0379
     * @tc.desc   边界：257 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0379', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0379 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(257);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(364));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(364);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(273));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(273);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(257));
      expect(decodeB64(result).length - 16).assertEqual(257);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0379 end');
    });

    /**
     * @tc.name   testAesSeq0380
     * @tc.number SUB_Huks_AESSQ_0380
     * @tc.desc   边界：258 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0380 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(258);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(368));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(368);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(274));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(274);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(258));
      expect(decodeB64(result).length - 16).assertEqual(258);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0380 end');
    });

    /**
     * @tc.name   testAesSeq0381
     * @tc.number SUB_Huks_AESSQ_0381
     * @tc.desc   边界：510 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0381', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0381 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(510);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(704));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(704);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(526));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(526);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(510));
      expect(decodeB64(result).length - 16).assertEqual(510);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0381 end');
    });

    /**
     * @tc.name   testAesSeq0382
     * @tc.number SUB_Huks_AESSQ_0382
     * @tc.desc   边界：511 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0382', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0382 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(511);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(704));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(704);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(527));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(527);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(511));
      expect(decodeB64(result).length - 16).assertEqual(511);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0382 end');
    });

    /**
     * @tc.name   testAesSeq0383
     * @tc.number SUB_Huks_AESSQ_0383
     * @tc.desc   边界：512 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0383', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0383 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(512);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(704));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(704);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(528));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(528);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(512));
      expect(decodeB64(result).length - 16).assertEqual(512);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0383 end');
    });

    /**
     * @tc.name   testAesSeq0384
     * @tc.number SUB_Huks_AESSQ_0384
     * @tc.desc   边界：513 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0384', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0384 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(513);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(708));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(708);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(529));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(529);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(513));
      expect(decodeB64(result).length - 16).assertEqual(513);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0384 end');
    });

    /**
     * @tc.name   testAesSeq0385
     * @tc.number SUB_Huks_AESSQ_0385
     * @tc.desc   边界：514 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0385', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0385 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(514);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(708));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(708);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(530));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(530);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(514));
      expect(decodeB64(result).length - 16).assertEqual(514);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0385 end');
    });

    /**
     * @tc.name   testAesSeq0386
     * @tc.number SUB_Huks_AESSQ_0386
     * @tc.desc   边界：766 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0386', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0386 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(766);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1044));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1044);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(782));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(782);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(766));
      expect(decodeB64(result).length - 16).assertEqual(766);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0386 end');
    });

    /**
     * @tc.name   testAesSeq0387
     * @tc.number SUB_Huks_AESSQ_0387
     * @tc.desc   边界：767 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0387', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0387 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(767);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1044));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1044);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(783));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(783);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(767));
      expect(decodeB64(result).length - 16).assertEqual(767);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0387 end');
    });

    /**
     * @tc.name   testAesSeq0388
     * @tc.number SUB_Huks_AESSQ_0388
     * @tc.desc   边界：768 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0388', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0388 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(768);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1048));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1048);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(784));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(784);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(768));
      expect(decodeB64(result).length - 16).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0388 end');
    });

    /**
     * @tc.name   testAesSeq0389
     * @tc.number SUB_Huks_AESSQ_0389
     * @tc.desc   边界：769 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0389', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0389 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(769);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1048));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1048);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(785));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(785);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(769));
      expect(decodeB64(result).length - 16).assertEqual(769);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0389 end');
    });

    /**
     * @tc.name   testAesSeq0390
     * @tc.number SUB_Huks_AESSQ_0390
     * @tc.desc   边界：1021 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0390 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(1021);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1384));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1384);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1037));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1037);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1021));
      expect(decodeB64(result).length - 16).assertEqual(1021);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0390 end');
    });

    /**
     * @tc.name   testAesSeq0391
     * @tc.number SUB_Huks_AESSQ_0391
     * @tc.desc   边界：1022 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0391', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0391 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(1022);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1384));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1384);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1038));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1038);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1022));
      expect(decodeB64(result).length - 16).assertEqual(1022);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0391 end');
    });

    /**
     * @tc.name   testAesSeq0392
     * @tc.number SUB_Huks_AESSQ_0392
     * @tc.desc   边界：1023 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0392', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0392 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(1023);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1388));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1388);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1039));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1039);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1023));
      expect(decodeB64(result).length - 16).assertEqual(1023);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0392 end');
    });

    /**
     * @tc.name   testAesSeq0393
     * @tc.number SUB_Huks_AESSQ_0393
     * @tc.desc   边界：1024 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0393', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0393 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(1024);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1388));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1388);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1040));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1040);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1024));
      expect(decodeB64(result).length - 16).assertEqual(1024);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0393 end');
    });

    /**
     * @tc.name   testAesSeq0394
     * @tc.number SUB_Huks_AESSQ_0394
     * @tc.desc   边界：1025 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0394', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0394 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(1025);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1388));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1388);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1041));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1041);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1025));
      expect(decodeB64(result).length - 16).assertEqual(1025);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0394 end');
    });

    /**
     * @tc.name   testAesSeq0395
     * @tc.number SUB_Huks_AESSQ_0395
     * @tc.desc   边界：1026 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0395', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0395 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(1026);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1392));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1392);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1042));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1042);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1026));
      expect(decodeB64(result).length - 16).assertEqual(1026);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0395 end');
    });

    /**
     * @tc.name   testAesSeq0396
     * @tc.number SUB_Huks_AESSQ_0396
     * @tc.desc   非法：符号与空白混合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0396', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0396 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '   ';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(28));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(19));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(3));
      expect(decodeB64(result).length - 16).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0396 end');
    });

    /**
     * @tc.name   testAesSeq0397
     * @tc.number SUB_Huks_AESSQ_0397
     * @tc.desc   非法：符号与空白混合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0397', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0397 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '!@#$%^&*()';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(36));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(26));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(26);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(10));
      expect(decodeB64(result).length - 16).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0397 end');
    });

    /**
     * @tc.name   testAesSeq0398
     * @tc.number SUB_Huks_AESSQ_0398
     * @tc.desc   非法：符号与空白混合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0398', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0398 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a b c d e';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(36));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(25));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(25);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(9));
      expect(decodeB64(result).length - 16).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0398 end');
    });

    /**
     * @tc.name   testAesSeq0399
     * @tc.number SUB_Huks_AESSQ_0399
     * @tc.desc   非法：符号与空白混合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0399', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0399 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '<tag>&"quoted"';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(40));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(30));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(14));
      expect(decodeB64(result).length - 16).assertEqual(14);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0399 end');
    });

    /**
     * @tc.name   testAesSeq0400
     * @tc.number SUB_Huks_AESSQ_0400
     * @tc.desc   非法：符号与空白混合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0400 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ' 中 emoji 😀';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(44));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(31));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(31);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(15));
      expect(decodeB64(result).length - 16).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0400 end');
    });


    /**
     * @tc.name   testAesSeq0401
     * @tc.number SUB_Huks_AESSQ_0401
     * @tc.desc   1025 字符超长往返：密文 1041 字节、base64 1388，解密回明文
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0401 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'b'.repeat(1025);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptData(plain, (cipher: string) => {
          model.decryptData((back: string) => {
            resolve(cipher + '|' + back);
          });
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(1388));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(1388);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(1041));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(1041);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(1025));
      const seg1Len: number = result.split('|')[1].length;
      expect(seg1Len).assertEqual(1025);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0401 end');
    });

  });
}
