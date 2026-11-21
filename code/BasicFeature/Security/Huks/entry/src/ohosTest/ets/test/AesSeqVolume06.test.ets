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

export default function aesSeqVolume06Test() {
  describe('AesSeqVolume06', () => {

    /**
     * @tc.name   testAesSeq0282
     * @tc.number SUB_Huks_AESSQ_0282
     * @tc.desc   非法：1 个中文字符按 UTF-8 计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0282', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0282 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(1);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0282 end');
    });

    /**
     * @tc.name   testAesSeq0283
     * @tc.number SUB_Huks_AESSQ_0283
     * @tc.desc   非法：2 个中文字符按 UTF-8 计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0283', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0283 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(2);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(32));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(22));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(22);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(6));
      expect(decodeB64(result).length - 16).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0283 end');
    });

    /**
     * @tc.name   testAesSeq0284
     * @tc.number SUB_Huks_AESSQ_0284
     * @tc.desc   非法：3 个中文字符按 UTF-8 计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0284', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0284 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(3);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0284 end');
    });

    /**
     * @tc.name   testAesSeq0285
     * @tc.number SUB_Huks_AESSQ_0285
     * @tc.desc   非法：4 个中文字符按 UTF-8 计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0285', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0285 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(4);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(40));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(28));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(12));
      expect(decodeB64(result).length - 16).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0285 end');
    });

    /**
     * @tc.name   testAesSeq0286
     * @tc.number SUB_Huks_AESSQ_0286
     * @tc.desc   非法：5 个中文字符按 UTF-8 计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0286', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0286 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(5);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0286 end');
    });

    /**
     * @tc.name   testAesSeq0287
     * @tc.number SUB_Huks_AESSQ_0287
     * @tc.desc   非法：6 个中文字符按 UTF-8 计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0287', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0287 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(6);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0287 end');
    });

    /**
     * @tc.name   testAesSeq0288
     * @tc.number SUB_Huks_AESSQ_0288
     * @tc.desc   非法：7 个中文字符按 UTF-8 计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0288', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0288 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(7);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0288 end');
    });

    /**
     * @tc.name   testAesSeq0289
     * @tc.number SUB_Huks_AESSQ_0289
     * @tc.desc   非法：8 个中文字符按 UTF-8 计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0289', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0289 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(8);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(56));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(40));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(24));
      expect(decodeB64(result).length - 16).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0289 end');
    });

    /**
     * @tc.name   testAesSeq0290
     * @tc.number SUB_Huks_AESSQ_0290
     * @tc.desc   非法：9 个中文字符按 UTF-8 计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0290 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(9);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(60));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(60);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(43));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(43);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(27));
      expect(decodeB64(result).length - 16).assertEqual(27);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0290 end');
    });

    /**
     * @tc.name   testAesSeq0291
     * @tc.number SUB_Huks_AESSQ_0291
     * @tc.desc   非法：10 个中文字符按 UTF-8 计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0291', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0291 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(10);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(64));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(46));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(46);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(30));
      expect(decodeB64(result).length - 16).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0291 end');
    });

    /**
     * @tc.name   testAesSeq0292
     * @tc.number SUB_Huks_AESSQ_0292
     * @tc.desc   非法：11 个中文字符按 UTF-8 计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0292', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0292 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(11);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0292 end');
    });

    /**
     * @tc.name   testAesSeq0293
     * @tc.number SUB_Huks_AESSQ_0293
     * @tc.desc   非法：12 个中文字符按 UTF-8 计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0293', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0293 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(12);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(72));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(72);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(52));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(52);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(36));
      expect(decodeB64(result).length - 16).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0293 end');
    });

    /**
     * @tc.name   testAesSeq0294
     * @tc.number SUB_Huks_AESSQ_0294
     * @tc.desc   非法：13 个中文字符按 UTF-8 计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0294', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0294 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(13);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(76));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(55));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(55);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(39));
      expect(decodeB64(result).length - 16).assertEqual(39);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0294 end');
    });

    /**
     * @tc.name   testAesSeq0295
     * @tc.number SUB_Huks_AESSQ_0295
     * @tc.desc   非法：14 个中文字符按 UTF-8 计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0295', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0295 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(14);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(80));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(80);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(58));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(58);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(42));
      expect(decodeB64(result).length - 16).assertEqual(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0295 end');
    });

    /**
     * @tc.name   testAesSeq0296
     * @tc.number SUB_Huks_AESSQ_0296
     * @tc.desc   非法：15 个中文字符按 UTF-8 计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0296', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0296 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(15);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(84));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(84);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(61));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(61);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(45));
      expect(decodeB64(result).length - 16).assertEqual(45);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0296 end');
    });

    /**
     * @tc.name   testAesSeq0297
     * @tc.number SUB_Huks_AESSQ_0297
     * @tc.desc   非法：16 个中文字符按 UTF-8 计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0297', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0297 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(16);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0297 end');
    });

    /**
     * @tc.name   testAesSeq0298
     * @tc.number SUB_Huks_AESSQ_0298
     * @tc.desc   非法：17 个中文字符按 UTF-8 计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0298', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0298 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(17);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(92));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(92);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(67));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(67);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(51));
      expect(decodeB64(result).length - 16).assertEqual(51);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0298 end');
    });

    /**
     * @tc.name   testAesSeq0299
     * @tc.number SUB_Huks_AESSQ_0299
     * @tc.desc   非法：18 个中文字符按 UTF-8 计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0299', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0299 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(18);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(96));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(96);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(70));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(70);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(54));
      expect(decodeB64(result).length - 16).assertEqual(54);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0299 end');
    });

    /**
     * @tc.name   testAesSeq0300
     * @tc.number SUB_Huks_AESSQ_0300
     * @tc.desc   非法：19 个中文字符按 UTF-8 计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0300 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(19);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(100));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(73));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(73);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(57));
      expect(decodeB64(result).length - 16).assertEqual(57);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0300 end');
    });

    /**
     * @tc.name   testAesSeq0301
     * @tc.number SUB_Huks_AESSQ_0301
     * @tc.desc   非法：20 个中文字符按 UTF-8 计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0301 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(20);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(104));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(76));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(60));
      expect(decodeB64(result).length - 16).assertEqual(60);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0301 end');
    });

    /**
     * @tc.name   testAesSeq0302
     * @tc.number SUB_Huks_AESSQ_0302
     * @tc.desc   非法：1 个 emoji 按 UTF-8 计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0302 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '😀'.repeat(1);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0302 end');
    });

    /**
     * @tc.name   testAesSeq0303
     * @tc.number SUB_Huks_AESSQ_0303
     * @tc.desc   非法：2 个 emoji 按 UTF-8 计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0303', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0303 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '😀'.repeat(2);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(32));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(24));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(8));
      expect(decodeB64(result).length - 16).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0303 end');
    });

    /**
     * @tc.name   testAesSeq0304
     * @tc.number SUB_Huks_AESSQ_0304
     * @tc.desc   非法：3 个 emoji 按 UTF-8 计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0304', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0304 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '😀'.repeat(3);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(40));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(28));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(12));
      expect(decodeB64(result).length - 16).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0304 end');
    });

    /**
     * @tc.name   testAesSeq0305
     * @tc.number SUB_Huks_AESSQ_0305
     * @tc.desc   非法：4 个 emoji 按 UTF-8 计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0305', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0305 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '😀'.repeat(4);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0305 end');
    });

    /**
     * @tc.name   testAesSeq0306
     * @tc.number SUB_Huks_AESSQ_0306
     * @tc.desc   非法：5 个 emoji 按 UTF-8 计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0306', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0306 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '😀'.repeat(5);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0306 end');
    });

    /**
     * @tc.name   testAesSeq0307
     * @tc.number SUB_Huks_AESSQ_0307
     * @tc.desc   非法：6 个 emoji 按 UTF-8 计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0307', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0307 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '😀'.repeat(6);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(56));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(40));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(24));
      expect(decodeB64(result).length - 16).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0307 end');
    });

    /**
     * @tc.name   testAesSeq0308
     * @tc.number SUB_Huks_AESSQ_0308
     * @tc.desc   非法：7 个 emoji 按 UTF-8 计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0308', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0308 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '😀'.repeat(7);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(60));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(60);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(44));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(28));
      expect(decodeB64(result).length - 16).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0308 end');
    });

    /**
     * @tc.name   testAesSeq0309
     * @tc.number SUB_Huks_AESSQ_0309
     * @tc.desc   非法：8 个 emoji 按 UTF-8 计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0309', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0309 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '😀'.repeat(8);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0309 end');
    });

    /**
     * @tc.name   testAesSeq0310
     * @tc.number SUB_Huks_AESSQ_0310
     * @tc.desc   非法：9 个 emoji 按 UTF-8 计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0310 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '😀'.repeat(9);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(72));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(72);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(52));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(52);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(36));
      expect(decodeB64(result).length - 16).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0310 end');
    });

    /**
     * @tc.name   testAesSeq0311
     * @tc.number SUB_Huks_AESSQ_0311
     * @tc.desc   非法：10 个 emoji 按 UTF-8 计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0311', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0311 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '😀'.repeat(10);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(76));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(56));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(40));
      expect(decodeB64(result).length - 16).assertEqual(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0311 end');
    });

    /**
     * @tc.name   testAesSeq0312
     * @tc.number SUB_Huks_AESSQ_0312
     * @tc.desc   组合：ASCII 与多字节混合 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0312', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0312 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('a中😀').repeat(1);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(32));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(24));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(8));
      expect(decodeB64(result).length - 16).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0312 end');
    });

    /**
     * @tc.name   testAesSeq0313
     * @tc.number SUB_Huks_AESSQ_0313
     * @tc.desc   组合：ASCII 与多字节混合 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0313', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0313 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('a中😀').repeat(2);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0313 end');
    });

    /**
     * @tc.name   testAesSeq0314
     * @tc.number SUB_Huks_AESSQ_0314
     * @tc.desc   组合：ASCII 与多字节混合 3 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0314', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0314 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('a中😀').repeat(3);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(56));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(40));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(24));
      expect(decodeB64(result).length - 16).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0314 end');
    });

    /**
     * @tc.name   testAesSeq0315
     * @tc.number SUB_Huks_AESSQ_0315
     * @tc.desc   组合：ASCII 与多字节混合 4 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0315', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0315 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('a中😀').repeat(4);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0315 end');
    });

    /**
     * @tc.name   testAesSeq0316
     * @tc.number SUB_Huks_AESSQ_0316
     * @tc.desc   组合：ASCII 与多字节混合 5 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0316', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0316 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('a中😀').repeat(5);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(76));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(56));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(40));
      expect(decodeB64(result).length - 16).assertEqual(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0316 end');
    });

    /**
     * @tc.name   testAesSeq0317
     * @tc.number SUB_Huks_AESSQ_0317
     * @tc.desc   组合：ASCII 与多字节混合 6 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0317', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0317 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('a中😀').repeat(6);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0317 end');
    });

    /**
     * @tc.name   testAesSeq0318
     * @tc.number SUB_Huks_AESSQ_0318
     * @tc.desc   组合：ASCII 与多字节混合 7 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0318', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0318 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('a中😀').repeat(7);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(96));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(96);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(72));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(72);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(56));
      expect(decodeB64(result).length - 16).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0318 end');
    });

    /**
     * @tc.name   testAesSeq0319
     * @tc.number SUB_Huks_AESSQ_0319
     * @tc.desc   组合：ASCII 与多字节混合 8 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0319', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0319 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('a中😀').repeat(8);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0319 end');
    });

    /**
     * @tc.name   testAesSeq0320
     * @tc.number SUB_Huks_AESSQ_0320
     * @tc.desc   组合：ASCII 与多字节混合 9 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0320 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('a中😀').repeat(9);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(120));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(88));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(88);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(72));
      expect(decodeB64(result).length - 16).assertEqual(72);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0320 end');
    });

    /**
     * @tc.name   testAesSeq0321
     * @tc.number SUB_Huks_AESSQ_0321
     * @tc.desc   组合：ASCII 与多字节混合 10 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0321', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0321 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('a中😀').repeat(10);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(128));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(128);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(96));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(96);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(80));
      expect(decodeB64(result).length - 16).assertEqual(80);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0321 end');
    });

    /**
     * @tc.name   testAesSeq0322
     * @tc.number SUB_Huks_AESSQ_0322
     * @tc.desc   组合：emoji 开头的混合 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0322', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0322 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('😀a中').repeat(1);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(32));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(24));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(8));
      expect(decodeB64(result).length - 16).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0322 end');
    });

    /**
     * @tc.name   testAesSeq0323
     * @tc.number SUB_Huks_AESSQ_0323
     * @tc.desc   组合：emoji 开头的混合 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0323', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0323 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('😀a中').repeat(2);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0323 end');
    });

    /**
     * @tc.name   testAesSeq0324
     * @tc.number SUB_Huks_AESSQ_0324
     * @tc.desc   组合：emoji 开头的混合 3 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0324', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0324 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('😀a中').repeat(3);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(56));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(40));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(24));
      expect(decodeB64(result).length - 16).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0324 end');
    });

    /**
     * @tc.name   testAesSeq0325
     * @tc.number SUB_Huks_AESSQ_0325
     * @tc.desc   组合：emoji 开头的混合 4 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0325', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0325 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('😀a中').repeat(4);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0325 end');
    });

    /**
     * @tc.name   testAesSeq0326
     * @tc.number SUB_Huks_AESSQ_0326
     * @tc.desc   组合：emoji 开头的混合 5 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0326', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0326 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('😀a中').repeat(5);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(76));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(56));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(40));
      expect(decodeB64(result).length - 16).assertEqual(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0326 end');
    });

    /**
     * @tc.name   testAesSeq0327
     * @tc.number SUB_Huks_AESSQ_0327
     * @tc.desc   组合：emoji 开头的混合 6 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0327', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0327 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('😀a中').repeat(6);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0327 end');
    });

    /**
     * @tc.name   testAesSeq0328
     * @tc.number SUB_Huks_AESSQ_0328
     * @tc.desc   组合：emoji 开头的混合 7 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0328', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0328 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('😀a中').repeat(7);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(96));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(96);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(72));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(72);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(56));
      expect(decodeB64(result).length - 16).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0328 end');
    });

    /**
     * @tc.name   testAesSeq0329
     * @tc.number SUB_Huks_AESSQ_0329
     * @tc.desc   组合：emoji 开头的混合 8 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0329', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0329 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('😀a中').repeat(8);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0329 end');
    });

    /**
     * @tc.name   testAesSeq0330
     * @tc.number SUB_Huks_AESSQ_0330
     * @tc.desc   组合：emoji 开头的混合 9 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0330 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('😀a中').repeat(9);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(120));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(88));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(88);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(72));
      expect(decodeB64(result).length - 16).assertEqual(72);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0330 end');
    });

    /**
     * @tc.name   testAesSeq0331
     * @tc.number SUB_Huks_AESSQ_0331
     * @tc.desc   组合：emoji 开头的混合 10 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0331', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0331 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('😀a中').repeat(10);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(128));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(128);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(96));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(96);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(80));
      expect(decodeB64(result).length - 16).assertEqual(80);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0331 end');
    });

    /**
     * @tc.name   testAesSeq0332
     * @tc.number SUB_Huks_AESSQ_0332
     * @tc.desc   组合：中文开头的混合 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0332', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0332 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('中a😀').repeat(1);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(32));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(24));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(8));
      expect(decodeB64(result).length - 16).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0332 end');
    });

    /**
     * @tc.name   testAesSeq0333
     * @tc.number SUB_Huks_AESSQ_0333
     * @tc.desc   组合：中文开头的混合 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0333', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0333 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('中a😀').repeat(2);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0333 end');
    });

    /**
     * @tc.name   testAesSeq0334
     * @tc.number SUB_Huks_AESSQ_0334
     * @tc.desc   组合：中文开头的混合 3 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0334', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0334 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('中a😀').repeat(3);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(56));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(40));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(24));
      expect(decodeB64(result).length - 16).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0334 end');
    });

    /**
     * @tc.name   testAesSeq0335
     * @tc.number SUB_Huks_AESSQ_0335
     * @tc.desc   组合：中文开头的混合 4 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0335', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0335 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('中a😀').repeat(4);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0335 end');
    });

    /**
     * @tc.name   testAesSeq0336
     * @tc.number SUB_Huks_AESSQ_0336
     * @tc.desc   组合：中文开头的混合 5 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0336', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0336 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('中a😀').repeat(5);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(76));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(56));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(40));
      expect(decodeB64(result).length - 16).assertEqual(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0336 end');
    });

    /**
     * @tc.name   testAesSeq0337
     * @tc.number SUB_Huks_AESSQ_0337
     * @tc.desc   组合：中文开头的混合 6 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0337', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0337 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('中a😀').repeat(6);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0337 end');
    });

    /**
     * @tc.name   testAesSeq0338
     * @tc.number SUB_Huks_AESSQ_0338
     * @tc.desc   组合：中文开头的混合 7 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0338', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0338 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('中a😀').repeat(7);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(96));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(96);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(72));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(72);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(56));
      expect(decodeB64(result).length - 16).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0338 end');
    });

    /**
     * @tc.name   testAesSeq0339
     * @tc.number SUB_Huks_AESSQ_0339
     * @tc.desc   组合：中文开头的混合 8 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0339', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0339 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('中a😀').repeat(8);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0339 end');
    });

    /**
     * @tc.name   testAesSeq0340
     * @tc.number SUB_Huks_AESSQ_0340
     * @tc.desc   组合：中文开头的混合 9 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0340 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('中a😀').repeat(9);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(120));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(88));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(88);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(72));
      expect(decodeB64(result).length - 16).assertEqual(72);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0340 end');
    });


    /**
     * @tc.name   testAesSeq0341
     * @tc.number SUB_Huks_AESSQ_0341
     * @tc.desc   中😀🚀a 精确计长：12 字节 UTF-8，密文 28 字节、base64 40
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0341', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0341 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中😀🚀a';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptData(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(40));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(28));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(12));
      expect(decodeB64(result).length - 16).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0341 end');
    });

  });
}
