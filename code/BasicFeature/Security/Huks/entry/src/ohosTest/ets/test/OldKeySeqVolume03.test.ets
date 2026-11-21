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

export default function oldKeySeqVolume03Test() {
  describe('OldKeySeqVolume03', () => {

    /**
     * @tc.name   testOldKeySeq0094
     * @tc.number SUB_Huks_OKSQ_0094
     * @tc.desc   合法：61 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0094 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(61);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0094 end');
    });

    /**
     * @tc.name   testOldKeySeq0095
     * @tc.number SUB_Huks_OKSQ_0095
     * @tc.desc   合法：62 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0095 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(62);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0095 end');
    });

    /**
     * @tc.name   testOldKeySeq0096
     * @tc.number SUB_Huks_OKSQ_0096
     * @tc.desc   边界：63 字符 PKCS7 补块
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0096 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(63);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0096 end');
    });

    /**
     * @tc.name   testOldKeySeq0097
     * @tc.number SUB_Huks_OKSQ_0097
     * @tc.desc   边界：64 字符 PKCS7 补块
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0097 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(64);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0097 end');
    });

    /**
     * @tc.name   testOldKeySeq0098
     * @tc.number SUB_Huks_OKSQ_0098
     * @tc.desc   合法：65 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0098 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(65);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0098 end');
    });

    /**
     * @tc.name   testOldKeySeq0099
     * @tc.number SUB_Huks_OKSQ_0099
     * @tc.desc   合法：66 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0099 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(66);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0099 end');
    });

    /**
     * @tc.name   testOldKeySeq0100
     * @tc.number SUB_Huks_OKSQ_0100
     * @tc.desc   合法：67 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0100 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(67);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0100 end');
    });

    /**
     * @tc.name   testOldKeySeq0101
     * @tc.number SUB_Huks_OKSQ_0101
     * @tc.desc   合法：68 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0101 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(68);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0101 end');
    });

    /**
     * @tc.name   testOldKeySeq0102
     * @tc.number SUB_Huks_OKSQ_0102
     * @tc.desc   合法：69 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0102 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(69);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0102 end');
    });

    /**
     * @tc.name   testOldKeySeq0103
     * @tc.number SUB_Huks_OKSQ_0103
     * @tc.desc   合法：70 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0103 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(70);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0103 end');
    });

    /**
     * @tc.name   testOldKeySeq0104
     * @tc.number SUB_Huks_OKSQ_0104
     * @tc.desc   合法：71 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0104 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(71);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0104 end');
    });

    /**
     * @tc.name   testOldKeySeq0105
     * @tc.number SUB_Huks_OKSQ_0105
     * @tc.desc   合法：72 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0105 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(72);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0105 end');
    });

    /**
     * @tc.name   testOldKeySeq0106
     * @tc.number SUB_Huks_OKSQ_0106
     * @tc.desc   合法：73 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0106 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(73);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0106 end');
    });

    /**
     * @tc.name   testOldKeySeq0107
     * @tc.number SUB_Huks_OKSQ_0107
     * @tc.desc   合法：74 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0107 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(74);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0107 end');
    });

    /**
     * @tc.name   testOldKeySeq0108
     * @tc.number SUB_Huks_OKSQ_0108
     * @tc.desc   合法：75 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0108 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(75);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0108 end');
    });

    /**
     * @tc.name   testOldKeySeq0109
     * @tc.number SUB_Huks_OKSQ_0109
     * @tc.desc   合法：76 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0109 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(76);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0109 end');
    });

    /**
     * @tc.name   testOldKeySeq0110
     * @tc.number SUB_Huks_OKSQ_0110
     * @tc.desc   合法：77 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0110 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(77);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0110 end');
    });

    /**
     * @tc.name   testOldKeySeq0111
     * @tc.number SUB_Huks_OKSQ_0111
     * @tc.desc   合法：78 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0111 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(78);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0111 end');
    });

    /**
     * @tc.name   testOldKeySeq0112
     * @tc.number SUB_Huks_OKSQ_0112
     * @tc.desc   边界：79 字符 PKCS7 补块
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0112 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(79);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0112 end');
    });

    /**
     * @tc.name   testOldKeySeq0113
     * @tc.number SUB_Huks_OKSQ_0113
     * @tc.desc   边界：80 字符 PKCS7 补块
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0113 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(80);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0113 end');
    });

    /**
     * @tc.name   testOldKeySeq0114
     * @tc.number SUB_Huks_OKSQ_0114
     * @tc.desc   合法：81 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0114 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(81);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0114 end');
    });

    /**
     * @tc.name   testOldKeySeq0115
     * @tc.number SUB_Huks_OKSQ_0115
     * @tc.desc   合法：82 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0115 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(82);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0115 end');
    });

    /**
     * @tc.name   testOldKeySeq0116
     * @tc.number SUB_Huks_OKSQ_0116
     * @tc.desc   合法：83 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0116 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(83);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0116 end');
    });

    /**
     * @tc.name   testOldKeySeq0117
     * @tc.number SUB_Huks_OKSQ_0117
     * @tc.desc   合法：84 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0117 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(84);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0117 end');
    });

    /**
     * @tc.name   testOldKeySeq0118
     * @tc.number SUB_Huks_OKSQ_0118
     * @tc.desc   合法：85 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0118 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(85);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0118 end');
    });

    /**
     * @tc.name   testOldKeySeq0119
     * @tc.number SUB_Huks_OKSQ_0119
     * @tc.desc   合法：86 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0119 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(86);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0119 end');
    });

    /**
     * @tc.name   testOldKeySeq0120
     * @tc.number SUB_Huks_OKSQ_0120
     * @tc.desc   合法：87 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0120 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(87);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0120 end');
    });

    /**
     * @tc.name   testOldKeySeq0121
     * @tc.number SUB_Huks_OKSQ_0121
     * @tc.desc   合法：88 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0121 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(88);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0121 end');
    });

    /**
     * @tc.name   testOldKeySeq0122
     * @tc.number SUB_Huks_OKSQ_0122
     * @tc.desc   合法：89 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0122 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(89);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0122 end');
    });

    /**
     * @tc.name   testOldKeySeq0123
     * @tc.number SUB_Huks_OKSQ_0123
     * @tc.desc   合法：90 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0123 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(90);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0123 end');
    });

    /**
     * @tc.name   testOldKeySeq0124
     * @tc.number SUB_Huks_OKSQ_0124
     * @tc.desc   合法：91 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0124 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(91);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0124 end');
    });

    /**
     * @tc.name   testOldKeySeq0125
     * @tc.number SUB_Huks_OKSQ_0125
     * @tc.desc   合法：92 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0125 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(92);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0125 end');
    });

    /**
     * @tc.name   testOldKeySeq0126
     * @tc.number SUB_Huks_OKSQ_0126
     * @tc.desc   合法：93 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0126 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(93);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0126 end');
    });

    /**
     * @tc.name   testOldKeySeq0127
     * @tc.number SUB_Huks_OKSQ_0127
     * @tc.desc   合法：94 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0127 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(94);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0127 end');
    });

    /**
     * @tc.name   testOldKeySeq0128
     * @tc.number SUB_Huks_OKSQ_0128
     * @tc.desc   边界：95 字符 PKCS7 补块
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0128 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(95);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0128 end');
    });

    /**
     * @tc.name   testOldKeySeq0129
     * @tc.number SUB_Huks_OKSQ_0129
     * @tc.desc   边界：96 字符 PKCS7 补块
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0129 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(96);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0129 end');
    });

    /**
     * @tc.name   testOldKeySeq0130
     * @tc.number SUB_Huks_OKSQ_0130
     * @tc.desc   合法：97 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0130 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(97);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0130 end');
    });

    /**
     * @tc.name   testOldKeySeq0131
     * @tc.number SUB_Huks_OKSQ_0131
     * @tc.desc   合法：98 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0131 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(98);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0131 end');
    });

    /**
     * @tc.name   testOldKeySeq0132
     * @tc.number SUB_Huks_OKSQ_0132
     * @tc.desc   合法：99 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0132 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(99);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0132 end');
    });

    /**
     * @tc.name   testOldKeySeq0133
     * @tc.number SUB_Huks_OKSQ_0133
     * @tc.desc   合法：100 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0133 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(100);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0133 end');
    });

    /**
     * @tc.name   testOldKeySeq0134
     * @tc.number SUB_Huks_OKSQ_0134
     * @tc.desc   合法：101 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0134 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(101);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0134 end');
    });

    /**
     * @tc.name   testOldKeySeq0135
     * @tc.number SUB_Huks_OKSQ_0135
     * @tc.desc   合法：102 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0135 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(102);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0135 end');
    });

    /**
     * @tc.name   testOldKeySeq0136
     * @tc.number SUB_Huks_OKSQ_0136
     * @tc.desc   合法：103 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0136 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(103);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0136 end');
    });

    /**
     * @tc.name   testOldKeySeq0137
     * @tc.number SUB_Huks_OKSQ_0137
     * @tc.desc   合法：104 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0137 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(104);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0137 end');
    });

    /**
     * @tc.name   testOldKeySeq0138
     * @tc.number SUB_Huks_OKSQ_0138
     * @tc.desc   合法：105 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0138 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(105);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0138 end');
    });

    /**
     * @tc.name   testOldKeySeq0139
     * @tc.number SUB_Huks_OKSQ_0139
     * @tc.desc   合法：106 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0139 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(106);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0139 end');
    });

    /**
     * @tc.name   testOldKeySeq0140
     * @tc.number SUB_Huks_OKSQ_0140
     * @tc.desc   合法：107 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0140 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(107);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0140 end');
    });

    /**
     * @tc.name   testOldKeySeq0141
     * @tc.number SUB_Huks_OKSQ_0141
     * @tc.desc   合法：108 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0141 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(108);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0141 end');
    });

    /**
     * @tc.name   testOldKeySeq0142
     * @tc.number SUB_Huks_OKSQ_0142
     * @tc.desc   合法：109 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0142 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(109);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0142 end');
    });

    /**
     * @tc.name   testOldKeySeq0143
     * @tc.number SUB_Huks_OKSQ_0143
     * @tc.desc   合法：110 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0143 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(110);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0143 end');
    });

    /**
     * @tc.name   testOldKeySeq0144
     * @tc.number SUB_Huks_OKSQ_0144
     * @tc.desc   边界：111 字符 PKCS7 补块
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0144 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(111);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0144 end');
    });

    /**
     * @tc.name   testOldKeySeq0145
     * @tc.number SUB_Huks_OKSQ_0145
     * @tc.desc   边界：112 字符 PKCS7 补块
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0145 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(112);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0145 end');
    });

    /**
     * @tc.name   testOldKeySeq0146
     * @tc.number SUB_Huks_OKSQ_0146
     * @tc.desc   合法：113 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0146 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(113);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0146 end');
    });

    /**
     * @tc.name   testOldKeySeq0147
     * @tc.number SUB_Huks_OKSQ_0147
     * @tc.desc   合法：114 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0147 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(114);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0147 end');
    });

    /**
     * @tc.name   testOldKeySeq0148
     * @tc.number SUB_Huks_OKSQ_0148
     * @tc.desc   合法：115 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0148 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(115);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0148 end');
    });

    /**
     * @tc.name   testOldKeySeq0149
     * @tc.number SUB_Huks_OKSQ_0149
     * @tc.desc   合法：116 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0149 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(116);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0149 end');
    });

    /**
     * @tc.name   testOldKeySeq0150
     * @tc.number SUB_Huks_OKSQ_0150
     * @tc.desc   合法：117 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0150 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(117);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0150 end');
    });

    /**
     * @tc.name   testOldKeySeq0151
     * @tc.number SUB_Huks_OKSQ_0151
     * @tc.desc   合法：118 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0151 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(118);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0151 end');
    });

    /**
     * @tc.name   testOldKeySeq0152
     * @tc.number SUB_Huks_OKSQ_0152
     * @tc.desc   合法：119 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0152 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(119);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0152 end');
    });


    /**
     * @tc.name   testOldKeySeq0153
     * @tc.number SUB_Huks_OKSQ_0153
     * @tc.desc   120 字符补块边界：密文 128 字节、base64 172，导入后解密回明文
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0153 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'k'.repeat(120);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptDataUserOldKey(plain, (cipher: string) => {
          model.importKey().then(() => {
            model.decryptDataUserOldKey((back: string) => {
              resolve(cipher + '|' + back);
            });
          });
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(172));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(172);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(128));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(128);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String(plain));
      expect(result.split('|')[1]).assertEqual(plain);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0153 end');
    });

  });
}
