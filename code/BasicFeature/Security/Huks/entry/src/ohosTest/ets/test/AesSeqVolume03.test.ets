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

export default function aesSeqVolume03Test() {
  describe('AesSeqVolume03', () => {

    /**
     * @tc.name   testAesSeq0102
     * @tc.number SUB_Huks_AESSQ_0102
     * @tc.desc   合法：61 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0102 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(61);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(104));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(77));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(77);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(61));
      expect(decodeB64(result).length - 16).assertEqual(61);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0102 end');
    });

    /**
     * @tc.name   testAesSeq0103
     * @tc.number SUB_Huks_AESSQ_0103
     * @tc.desc   合法：62 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0103 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(62);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0103 end');
    });

    /**
     * @tc.name   testAesSeq0104
     * @tc.number SUB_Huks_AESSQ_0104
     * @tc.desc   边界：63 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0104 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(63);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0104 end');
    });

    /**
     * @tc.name   testAesSeq0105
     * @tc.number SUB_Huks_AESSQ_0105
     * @tc.desc   边界：64 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0105 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(64);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0105 end');
    });

    /**
     * @tc.name   testAesSeq0106
     * @tc.number SUB_Huks_AESSQ_0106
     * @tc.desc   合法：65 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0106 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(65);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0106 end');
    });

    /**
     * @tc.name   testAesSeq0107
     * @tc.number SUB_Huks_AESSQ_0107
     * @tc.desc   合法：66 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0107 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(66);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0107 end');
    });

    /**
     * @tc.name   testAesSeq0108
     * @tc.number SUB_Huks_AESSQ_0108
     * @tc.desc   合法：67 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0108 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(67);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(112));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(112);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(83));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(83);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(67));
      expect(decodeB64(result).length - 16).assertEqual(67);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0108 end');
    });

    /**
     * @tc.name   testAesSeq0109
     * @tc.number SUB_Huks_AESSQ_0109
     * @tc.desc   合法：68 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0109 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(68);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(112));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(112);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(84));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(84);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(68));
      expect(decodeB64(result).length - 16).assertEqual(68);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0109 end');
    });

    /**
     * @tc.name   testAesSeq0110
     * @tc.number SUB_Huks_AESSQ_0110
     * @tc.desc   合法：69 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0110 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(69);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(116));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(116);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(85));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(85);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(69));
      expect(decodeB64(result).length - 16).assertEqual(69);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0110 end');
    });

    /**
     * @tc.name   testAesSeq0111
     * @tc.number SUB_Huks_AESSQ_0111
     * @tc.desc   合法：70 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0111 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(70);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(116));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(116);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(86));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(86);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(70));
      expect(decodeB64(result).length - 16).assertEqual(70);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0111 end');
    });

    /**
     * @tc.name   testAesSeq0112
     * @tc.number SUB_Huks_AESSQ_0112
     * @tc.desc   合法：71 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0112 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(71);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(116));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(116);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(87));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(87);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(71));
      expect(decodeB64(result).length - 16).assertEqual(71);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0112 end');
    });

    /**
     * @tc.name   testAesSeq0113
     * @tc.number SUB_Huks_AESSQ_0113
     * @tc.desc   合法：72 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0113 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(72);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0113 end');
    });

    /**
     * @tc.name   testAesSeq0114
     * @tc.number SUB_Huks_AESSQ_0114
     * @tc.desc   合法：73 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0114 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(73);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(120));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(89));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(89);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(73));
      expect(decodeB64(result).length - 16).assertEqual(73);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0114 end');
    });

    /**
     * @tc.name   testAesSeq0115
     * @tc.number SUB_Huks_AESSQ_0115
     * @tc.desc   合法：74 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0115 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(74);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(120));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(90));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(90);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(74));
      expect(decodeB64(result).length - 16).assertEqual(74);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0115 end');
    });

    /**
     * @tc.name   testAesSeq0116
     * @tc.number SUB_Huks_AESSQ_0116
     * @tc.desc   合法：75 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0116 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(75);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(124));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(124);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(91));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(91);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(75));
      expect(decodeB64(result).length - 16).assertEqual(75);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0116 end');
    });

    /**
     * @tc.name   testAesSeq0117
     * @tc.number SUB_Huks_AESSQ_0117
     * @tc.desc   合法：76 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0117 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(76);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(124));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(124);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(92));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(92);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(76));
      expect(decodeB64(result).length - 16).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0117 end');
    });

    /**
     * @tc.name   testAesSeq0118
     * @tc.number SUB_Huks_AESSQ_0118
     * @tc.desc   合法：77 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0118 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(77);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(124));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(124);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(93));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(93);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(77));
      expect(decodeB64(result).length - 16).assertEqual(77);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0118 end');
    });

    /**
     * @tc.name   testAesSeq0119
     * @tc.number SUB_Huks_AESSQ_0119
     * @tc.desc   合法：78 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0119 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(78);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(128));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(128);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(94));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(94);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(78));
      expect(decodeB64(result).length - 16).assertEqual(78);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0119 end');
    });

    /**
     * @tc.name   testAesSeq0120
     * @tc.number SUB_Huks_AESSQ_0120
     * @tc.desc   边界：79 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0120 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(79);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(128));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(128);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(95));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(95);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(79));
      expect(decodeB64(result).length - 16).assertEqual(79);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0120 end');
    });

    /**
     * @tc.name   testAesSeq0121
     * @tc.number SUB_Huks_AESSQ_0121
     * @tc.desc   边界：80 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0121 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(80);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0121 end');
    });

    /**
     * @tc.name   testAesSeq0122
     * @tc.number SUB_Huks_AESSQ_0122
     * @tc.desc   合法：81 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0122 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(81);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(132));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(132);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(97));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(97);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(81));
      expect(decodeB64(result).length - 16).assertEqual(81);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0122 end');
    });

    /**
     * @tc.name   testAesSeq0123
     * @tc.number SUB_Huks_AESSQ_0123
     * @tc.desc   合法：82 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0123 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(82);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(132));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(132);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(98));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(98);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(82));
      expect(decodeB64(result).length - 16).assertEqual(82);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0123 end');
    });

    /**
     * @tc.name   testAesSeq0124
     * @tc.number SUB_Huks_AESSQ_0124
     * @tc.desc   合法：83 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0124 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(83);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(132));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(132);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(99));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(99);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(83));
      expect(decodeB64(result).length - 16).assertEqual(83);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0124 end');
    });

    /**
     * @tc.name   testAesSeq0125
     * @tc.number SUB_Huks_AESSQ_0125
     * @tc.desc   合法：84 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0125 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(84);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(136));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(136);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(100));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(84));
      expect(decodeB64(result).length - 16).assertEqual(84);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0125 end');
    });

    /**
     * @tc.name   testAesSeq0126
     * @tc.number SUB_Huks_AESSQ_0126
     * @tc.desc   合法：85 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0126 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(85);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(136));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(136);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(101));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(101);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(85));
      expect(decodeB64(result).length - 16).assertEqual(85);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0126 end');
    });

    /**
     * @tc.name   testAesSeq0127
     * @tc.number SUB_Huks_AESSQ_0127
     * @tc.desc   合法：86 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0127 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(86);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(136));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(136);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(102));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(102);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(86));
      expect(decodeB64(result).length - 16).assertEqual(86);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0127 end');
    });

    /**
     * @tc.name   testAesSeq0128
     * @tc.number SUB_Huks_AESSQ_0128
     * @tc.desc   合法：87 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0128 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(87);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(140));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(140);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(103));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(103);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(87));
      expect(decodeB64(result).length - 16).assertEqual(87);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0128 end');
    });

    /**
     * @tc.name   testAesSeq0129
     * @tc.number SUB_Huks_AESSQ_0129
     * @tc.desc   合法：88 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0129 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(88);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(140));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(140);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(104));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(88));
      expect(decodeB64(result).length - 16).assertEqual(88);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0129 end');
    });

    /**
     * @tc.name   testAesSeq0130
     * @tc.number SUB_Huks_AESSQ_0130
     * @tc.desc   合法：89 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0130 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(89);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(140));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(140);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(105));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(105);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(89));
      expect(decodeB64(result).length - 16).assertEqual(89);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0130 end');
    });

    /**
     * @tc.name   testAesSeq0131
     * @tc.number SUB_Huks_AESSQ_0131
     * @tc.desc   合法：90 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0131 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(90);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(144));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(144);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(106));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(106);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(90));
      expect(decodeB64(result).length - 16).assertEqual(90);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0131 end');
    });

    /**
     * @tc.name   testAesSeq0132
     * @tc.number SUB_Huks_AESSQ_0132
     * @tc.desc   合法：91 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0132 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(91);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(144));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(144);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(107));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(107);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(91));
      expect(decodeB64(result).length - 16).assertEqual(91);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0132 end');
    });

    /**
     * @tc.name   testAesSeq0133
     * @tc.number SUB_Huks_AESSQ_0133
     * @tc.desc   合法：92 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0133 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(92);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(144));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(144);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(108));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(108);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(92));
      expect(decodeB64(result).length - 16).assertEqual(92);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0133 end');
    });

    /**
     * @tc.name   testAesSeq0134
     * @tc.number SUB_Huks_AESSQ_0134
     * @tc.desc   合法：93 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0134 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(93);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(148));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(148);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(109));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(109);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(93));
      expect(decodeB64(result).length - 16).assertEqual(93);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0134 end');
    });

    /**
     * @tc.name   testAesSeq0135
     * @tc.number SUB_Huks_AESSQ_0135
     * @tc.desc   合法：94 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0135 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(94);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(148));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(148);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(110));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(110);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(94));
      expect(decodeB64(result).length - 16).assertEqual(94);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0135 end');
    });

    /**
     * @tc.name   testAesSeq0136
     * @tc.number SUB_Huks_AESSQ_0136
     * @tc.desc   边界：95 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0136 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(95);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0136 end');
    });

    /**
     * @tc.name   testAesSeq0137
     * @tc.number SUB_Huks_AESSQ_0137
     * @tc.desc   边界：96 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0137 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(96);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0137 end');
    });

    /**
     * @tc.name   testAesSeq0138
     * @tc.number SUB_Huks_AESSQ_0138
     * @tc.desc   合法：97 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0138 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(97);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0138 end');
    });

    /**
     * @tc.name   testAesSeq0139
     * @tc.number SUB_Huks_AESSQ_0139
     * @tc.desc   合法：98 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0139 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(98);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(152));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(152);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(114));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(114);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(98));
      expect(decodeB64(result).length - 16).assertEqual(98);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0139 end');
    });

    /**
     * @tc.name   testAesSeq0140
     * @tc.number SUB_Huks_AESSQ_0140
     * @tc.desc   合法：99 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0140 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(99);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(156));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(156);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(115));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(115);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(99));
      expect(decodeB64(result).length - 16).assertEqual(99);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0140 end');
    });

    /**
     * @tc.name   testAesSeq0141
     * @tc.number SUB_Huks_AESSQ_0141
     * @tc.desc   合法：100 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0141 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(100);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(156));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(156);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(116));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(116);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(100));
      expect(decodeB64(result).length - 16).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0141 end');
    });

    /**
     * @tc.name   testAesSeq0142
     * @tc.number SUB_Huks_AESSQ_0142
     * @tc.desc   合法：101 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0142 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(101);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(156));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(156);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(117));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(117);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(101));
      expect(decodeB64(result).length - 16).assertEqual(101);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0142 end');
    });

    /**
     * @tc.name   testAesSeq0143
     * @tc.number SUB_Huks_AESSQ_0143
     * @tc.desc   合法：102 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0143 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(102);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(160));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(118));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(118);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(102));
      expect(decodeB64(result).length - 16).assertEqual(102);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0143 end');
    });

    /**
     * @tc.name   testAesSeq0144
     * @tc.number SUB_Huks_AESSQ_0144
     * @tc.desc   合法：103 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0144 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(103);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(160));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(119));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(119);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(103));
      expect(decodeB64(result).length - 16).assertEqual(103);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0144 end');
    });

    /**
     * @tc.name   testAesSeq0145
     * @tc.number SUB_Huks_AESSQ_0145
     * @tc.desc   合法：104 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0145 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(104);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(160));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(120));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(104));
      expect(decodeB64(result).length - 16).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0145 end');
    });

    /**
     * @tc.name   testAesSeq0146
     * @tc.number SUB_Huks_AESSQ_0146
     * @tc.desc   合法：105 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0146 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(105);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(164));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(164);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(121));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(121);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(105));
      expect(decodeB64(result).length - 16).assertEqual(105);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0146 end');
    });

    /**
     * @tc.name   testAesSeq0147
     * @tc.number SUB_Huks_AESSQ_0147
     * @tc.desc   合法：106 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0147 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(106);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(164));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(164);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(122));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(122);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(106));
      expect(decodeB64(result).length - 16).assertEqual(106);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0147 end');
    });

    /**
     * @tc.name   testAesSeq0148
     * @tc.number SUB_Huks_AESSQ_0148
     * @tc.desc   合法：107 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0148 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(107);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(164));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(164);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(123));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(123);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(107));
      expect(decodeB64(result).length - 16).assertEqual(107);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0148 end');
    });

    /**
     * @tc.name   testAesSeq0149
     * @tc.number SUB_Huks_AESSQ_0149
     * @tc.desc   合法：108 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0149 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(108);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(168));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(168);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(124));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(124);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(108));
      expect(decodeB64(result).length - 16).assertEqual(108);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0149 end');
    });

    /**
     * @tc.name   testAesSeq0150
     * @tc.number SUB_Huks_AESSQ_0150
     * @tc.desc   合法：109 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0150 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(109);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(168));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(168);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(125));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(125);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(109));
      expect(decodeB64(result).length - 16).assertEqual(109);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0150 end');
    });

    /**
     * @tc.name   testAesSeq0151
     * @tc.number SUB_Huks_AESSQ_0151
     * @tc.desc   合法：110 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0151 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(110);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(168));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(168);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(126));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(126);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(110));
      expect(decodeB64(result).length - 16).assertEqual(110);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0151 end');
    });

    /**
     * @tc.name   testAesSeq0152
     * @tc.number SUB_Huks_AESSQ_0152
     * @tc.desc   边界：111 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0152 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(111);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(172));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(172);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(127));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(127);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(111));
      expect(decodeB64(result).length - 16).assertEqual(111);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0152 end');
    });

    /**
     * @tc.name   testAesSeq0153
     * @tc.number SUB_Huks_AESSQ_0153
     * @tc.desc   边界：112 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0153 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(112);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(172));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(172);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(128));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(128);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(112));
      expect(decodeB64(result).length - 16).assertEqual(112);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0153 end');
    });

    /**
     * @tc.name   testAesSeq0154
     * @tc.number SUB_Huks_AESSQ_0154
     * @tc.desc   合法：113 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0154 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(113);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(172));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(172);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(129));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(129);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(113));
      expect(decodeB64(result).length - 16).assertEqual(113);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0154 end');
    });

    /**
     * @tc.name   testAesSeq0155
     * @tc.number SUB_Huks_AESSQ_0155
     * @tc.desc   合法：114 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0155 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(114);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(176));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(176);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(130));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(130);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(114));
      expect(decodeB64(result).length - 16).assertEqual(114);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0155 end');
    });

    /**
     * @tc.name   testAesSeq0156
     * @tc.number SUB_Huks_AESSQ_0156
     * @tc.desc   合法：115 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0156 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(115);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(176));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(176);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(131));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(131);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(115));
      expect(decodeB64(result).length - 16).assertEqual(115);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0156 end');
    });

    /**
     * @tc.name   testAesSeq0157
     * @tc.number SUB_Huks_AESSQ_0157
     * @tc.desc   合法：116 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0157 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(116);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(176));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(176);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(132));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(132);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(116));
      expect(decodeB64(result).length - 16).assertEqual(116);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0157 end');
    });

    /**
     * @tc.name   testAesSeq0158
     * @tc.number SUB_Huks_AESSQ_0158
     * @tc.desc   合法：117 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0158 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(117);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(180));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(180);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(133));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(133);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(117));
      expect(decodeB64(result).length - 16).assertEqual(117);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0158 end');
    });

    /**
     * @tc.name   testAesSeq0159
     * @tc.number SUB_Huks_AESSQ_0159
     * @tc.desc   合法：118 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0159 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(118);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(180));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(180);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(134));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(134);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(118));
      expect(decodeB64(result).length - 16).assertEqual(118);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0159 end');
    });

    /**
     * @tc.name   testAesSeq0160
     * @tc.number SUB_Huks_AESSQ_0160
     * @tc.desc   合法：119 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0160 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(119);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(180));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(180);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(135));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(135);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(119));
      expect(decodeB64(result).length - 16).assertEqual(119);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0160 end');
    });


    /**
     * @tc.name   testAesSeq0161
     * @tc.number SUB_Huks_AESSQ_0161
     * @tc.desc   120 字符边界往返：密文 136 字节、base64 184，解密回明文
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0161 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(120);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptData(plain, (cipher: string) => {
          model.decryptData((back: string) => {
            resolve(cipher + '|' + back);
          });
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(184));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(184);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(136));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(136);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(120));
      const seg1Len: number = result.split('|')[1].length;
      expect(seg1Len).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0161 end');
    });

  });
}
