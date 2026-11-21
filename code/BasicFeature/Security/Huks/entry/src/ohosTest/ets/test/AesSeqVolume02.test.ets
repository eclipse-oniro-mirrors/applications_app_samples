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

export default function aesSeqVolume02Test() {
  describe('AesSeqVolume02', () => {

    /**
     * @tc.name   testAesSeq0042
     * @tc.number SUB_Huks_AESSQ_0042
     * @tc.desc   合法：1 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0042 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(1);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0042 end');
    });

    /**
     * @tc.name   testAesSeq0043
     * @tc.number SUB_Huks_AESSQ_0043
     * @tc.desc   合法：2 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0043 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(2);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0043 end');
    });

    /**
     * @tc.name   testAesSeq0044
     * @tc.number SUB_Huks_AESSQ_0044
     * @tc.desc   合法：3 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0044 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(3);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0044 end');
    });

    /**
     * @tc.name   testAesSeq0045
     * @tc.number SUB_Huks_AESSQ_0045
     * @tc.desc   合法：4 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0045 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(4);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0045 end');
    });

    /**
     * @tc.name   testAesSeq0046
     * @tc.number SUB_Huks_AESSQ_0046
     * @tc.desc   合法：5 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0046 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(5);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0046 end');
    });

    /**
     * @tc.name   testAesSeq0047
     * @tc.number SUB_Huks_AESSQ_0047
     * @tc.desc   合法：6 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0047 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(6);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0047 end');
    });

    /**
     * @tc.name   testAesSeq0048
     * @tc.number SUB_Huks_AESSQ_0048
     * @tc.desc   合法：7 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0048 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(7);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(32));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(23));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(23);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(7));
      expect(decodeB64(result).length - 16).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0048 end');
    });

    /**
     * @tc.name   testAesSeq0049
     * @tc.number SUB_Huks_AESSQ_0049
     * @tc.desc   合法：8 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0049 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(8);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0049 end');
    });

    /**
     * @tc.name   testAesSeq0050
     * @tc.number SUB_Huks_AESSQ_0050
     * @tc.desc   合法：9 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0050 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(9);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0050 end');
    });

    /**
     * @tc.name   testAesSeq0051
     * @tc.number SUB_Huks_AESSQ_0051
     * @tc.desc   合法：10 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0051 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(10);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0051 end');
    });

    /**
     * @tc.name   testAesSeq0052
     * @tc.number SUB_Huks_AESSQ_0052
     * @tc.desc   合法：11 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0052 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(11);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(36));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(27));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(27);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(11));
      expect(decodeB64(result).length - 16).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0052 end');
    });

    /**
     * @tc.name   testAesSeq0053
     * @tc.number SUB_Huks_AESSQ_0053
     * @tc.desc   合法：12 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0053 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(12);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0053 end');
    });

    /**
     * @tc.name   testAesSeq0054
     * @tc.number SUB_Huks_AESSQ_0054
     * @tc.desc   合法：13 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0054 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(13);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(40));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(29));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(29);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(13));
      expect(decodeB64(result).length - 16).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0054 end');
    });

    /**
     * @tc.name   testAesSeq0055
     * @tc.number SUB_Huks_AESSQ_0055
     * @tc.desc   合法：14 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0055 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(14);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0055 end');
    });

    /**
     * @tc.name   testAesSeq0056
     * @tc.number SUB_Huks_AESSQ_0056
     * @tc.desc   边界：15 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0056 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(15);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0056 end');
    });

    /**
     * @tc.name   testAesSeq0057
     * @tc.number SUB_Huks_AESSQ_0057
     * @tc.desc   边界：16 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0057 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(16);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0057 end');
    });

    /**
     * @tc.name   testAesSeq0058
     * @tc.number SUB_Huks_AESSQ_0058
     * @tc.desc   合法：17 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0058 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(17);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0058 end');
    });

    /**
     * @tc.name   testAesSeq0059
     * @tc.number SUB_Huks_AESSQ_0059
     * @tc.desc   合法：18 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0059 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(18);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0059 end');
    });

    /**
     * @tc.name   testAesSeq0060
     * @tc.number SUB_Huks_AESSQ_0060
     * @tc.desc   合法：19 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0060 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(19);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0060 end');
    });

    /**
     * @tc.name   testAesSeq0061
     * @tc.number SUB_Huks_AESSQ_0061
     * @tc.desc   合法：20 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0061 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(20);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0061 end');
    });

    /**
     * @tc.name   testAesSeq0062
     * @tc.number SUB_Huks_AESSQ_0062
     * @tc.desc   合法：21 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0062 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(21);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0062 end');
    });

    /**
     * @tc.name   testAesSeq0063
     * @tc.number SUB_Huks_AESSQ_0063
     * @tc.desc   合法：22 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0063 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(22);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0063 end');
    });

    /**
     * @tc.name   testAesSeq0064
     * @tc.number SUB_Huks_AESSQ_0064
     * @tc.desc   合法：23 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0064 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(23);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0064 end');
    });

    /**
     * @tc.name   testAesSeq0065
     * @tc.number SUB_Huks_AESSQ_0065
     * @tc.desc   合法：24 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0065 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(24);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0065 end');
    });

    /**
     * @tc.name   testAesSeq0066
     * @tc.number SUB_Huks_AESSQ_0066
     * @tc.desc   合法：25 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0066 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(25);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(56));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(41));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(41);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(25));
      expect(decodeB64(result).length - 16).assertEqual(25);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0066 end');
    });

    /**
     * @tc.name   testAesSeq0067
     * @tc.number SUB_Huks_AESSQ_0067
     * @tc.desc   合法：26 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0067 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(26);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(56));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(42));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(26));
      expect(decodeB64(result).length - 16).assertEqual(26);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0067 end');
    });

    /**
     * @tc.name   testAesSeq0068
     * @tc.number SUB_Huks_AESSQ_0068
     * @tc.desc   合法：27 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0068 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(27);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0068 end');
    });

    /**
     * @tc.name   testAesSeq0069
     * @tc.number SUB_Huks_AESSQ_0069
     * @tc.desc   合法：28 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0069 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(28);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0069 end');
    });

    /**
     * @tc.name   testAesSeq0070
     * @tc.number SUB_Huks_AESSQ_0070
     * @tc.desc   合法：29 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0070 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(29);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(60));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(60);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(45));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(45);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(29));
      expect(decodeB64(result).length - 16).assertEqual(29);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0070 end');
    });

    /**
     * @tc.name   testAesSeq0071
     * @tc.number SUB_Huks_AESSQ_0071
     * @tc.desc   合法：30 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0071 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(30);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0071 end');
    });

    /**
     * @tc.name   testAesSeq0072
     * @tc.number SUB_Huks_AESSQ_0072
     * @tc.desc   边界：31 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0072 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(31);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0072 end');
    });

    /**
     * @tc.name   testAesSeq0073
     * @tc.number SUB_Huks_AESSQ_0073
     * @tc.desc   边界：32 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0073 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(32);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0073 end');
    });

    /**
     * @tc.name   testAesSeq0074
     * @tc.number SUB_Huks_AESSQ_0074
     * @tc.desc   合法：33 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0074 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(33);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0074 end');
    });

    /**
     * @tc.name   testAesSeq0075
     * @tc.number SUB_Huks_AESSQ_0075
     * @tc.desc   合法：34 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0075 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(34);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(68));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(68);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(50));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(34));
      expect(decodeB64(result).length - 16).assertEqual(34);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0075 end');
    });

    /**
     * @tc.name   testAesSeq0076
     * @tc.number SUB_Huks_AESSQ_0076
     * @tc.desc   合法：35 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0076 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(35);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(68));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(68);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(51));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(51);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(35));
      expect(decodeB64(result).length - 16).assertEqual(35);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0076 end');
    });

    /**
     * @tc.name   testAesSeq0077
     * @tc.number SUB_Huks_AESSQ_0077
     * @tc.desc   合法：36 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0077 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(36);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0077 end');
    });

    /**
     * @tc.name   testAesSeq0078
     * @tc.number SUB_Huks_AESSQ_0078
     * @tc.desc   合法：37 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0078 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(37);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(72));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(72);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(53));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(53);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(37));
      expect(decodeB64(result).length - 16).assertEqual(37);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0078 end');
    });

    /**
     * @tc.name   testAesSeq0079
     * @tc.number SUB_Huks_AESSQ_0079
     * @tc.desc   合法：38 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0079 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(38);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(72));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(72);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(54));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(54);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(38));
      expect(decodeB64(result).length - 16).assertEqual(38);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0079 end');
    });

    /**
     * @tc.name   testAesSeq0080
     * @tc.number SUB_Huks_AESSQ_0080
     * @tc.desc   合法：39 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0080 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(39);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0080 end');
    });

    /**
     * @tc.name   testAesSeq0081
     * @tc.number SUB_Huks_AESSQ_0081
     * @tc.desc   合法：40 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0081 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(40);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0081 end');
    });

    /**
     * @tc.name   testAesSeq0082
     * @tc.number SUB_Huks_AESSQ_0082
     * @tc.desc   合法：41 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0082 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(41);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(76));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(57));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(57);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(41));
      expect(decodeB64(result).length - 16).assertEqual(41);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0082 end');
    });

    /**
     * @tc.name   testAesSeq0083
     * @tc.number SUB_Huks_AESSQ_0083
     * @tc.desc   合法：42 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0083 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(42);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0083 end');
    });

    /**
     * @tc.name   testAesSeq0084
     * @tc.number SUB_Huks_AESSQ_0084
     * @tc.desc   合法：43 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0084 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(43);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(80));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(80);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(59));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(59);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(43));
      expect(decodeB64(result).length - 16).assertEqual(43);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0084 end');
    });

    /**
     * @tc.name   testAesSeq0085
     * @tc.number SUB_Huks_AESSQ_0085
     * @tc.desc   合法：44 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0085 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(44);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(80));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(80);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(60));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(60);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(44));
      expect(decodeB64(result).length - 16).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0085 end');
    });

    /**
     * @tc.name   testAesSeq0086
     * @tc.number SUB_Huks_AESSQ_0086
     * @tc.desc   合法：45 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0086 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(45);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0086 end');
    });

    /**
     * @tc.name   testAesSeq0087
     * @tc.number SUB_Huks_AESSQ_0087
     * @tc.desc   合法：46 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0087 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(46);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(84));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(84);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(62));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(62);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(46));
      expect(decodeB64(result).length - 16).assertEqual(46);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0087 end');
    });

    /**
     * @tc.name   testAesSeq0088
     * @tc.number SUB_Huks_AESSQ_0088
     * @tc.desc   边界：47 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0088 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(47);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0088 end');
    });

    /**
     * @tc.name   testAesSeq0089
     * @tc.number SUB_Huks_AESSQ_0089
     * @tc.desc   边界：48 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0089 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(48);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0089 end');
    });

    /**
     * @tc.name   testAesSeq0090
     * @tc.number SUB_Huks_AESSQ_0090
     * @tc.desc   合法：49 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0090 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(49);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0090 end');
    });

    /**
     * @tc.name   testAesSeq0091
     * @tc.number SUB_Huks_AESSQ_0091
     * @tc.desc   合法：50 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0091 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(50);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(88));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(88);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(66));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(66);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(50));
      expect(decodeB64(result).length - 16).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0091 end');
    });

    /**
     * @tc.name   testAesSeq0092
     * @tc.number SUB_Huks_AESSQ_0092
     * @tc.desc   合法：51 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0092 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(51);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0092 end');
    });

    /**
     * @tc.name   testAesSeq0093
     * @tc.number SUB_Huks_AESSQ_0093
     * @tc.desc   合法：52 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0093 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(52);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(92));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(92);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(68));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(68);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(52));
      expect(decodeB64(result).length - 16).assertEqual(52);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0093 end');
    });

    /**
     * @tc.name   testAesSeq0094
     * @tc.number SUB_Huks_AESSQ_0094
     * @tc.desc   合法：53 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0094 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(53);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(92));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(92);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(69));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(69);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(53));
      expect(decodeB64(result).length - 16).assertEqual(53);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0094 end');
    });

    /**
     * @tc.name   testAesSeq0095
     * @tc.number SUB_Huks_AESSQ_0095
     * @tc.desc   合法：54 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0095 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(54);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0095 end');
    });

    /**
     * @tc.name   testAesSeq0096
     * @tc.number SUB_Huks_AESSQ_0096
     * @tc.desc   合法：55 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0096 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(55);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(96));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(96);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(71));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(71);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(55));
      expect(decodeB64(result).length - 16).assertEqual(55);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0096 end');
    });

    /**
     * @tc.name   testAesSeq0097
     * @tc.number SUB_Huks_AESSQ_0097
     * @tc.desc   合法：56 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0097 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(56);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0097 end');
    });

    /**
     * @tc.name   testAesSeq0098
     * @tc.number SUB_Huks_AESSQ_0098
     * @tc.desc   合法：57 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0098 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(57);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0098 end');
    });

    /**
     * @tc.name   testAesSeq0099
     * @tc.number SUB_Huks_AESSQ_0099
     * @tc.desc   合法：58 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0099 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(58);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(100));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(74));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(74);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(58));
      expect(decodeB64(result).length - 16).assertEqual(58);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0099 end');
    });

    /**
     * @tc.name   testAesSeq0100
     * @tc.number SUB_Huks_AESSQ_0100
     * @tc.desc   合法：59 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0100 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(59);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(100));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(75));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(59));
      expect(decodeB64(result).length - 16).assertEqual(59);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0100 end');
    });


    /**
     * @tc.name   testAesSeq0101
     * @tc.number SUB_Huks_AESSQ_0101
     * @tc.desc   60 字符边界（本桶上限外一格）：密文 76 字节、base64 104，且加密后解密回明文
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0101 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a'.repeat(60);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptData(plain, (cipher: string) => {
          model.decryptData((back: string) => {
            resolve(cipher + '|' + back);
          });
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(104));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(76));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String(plain));
      expect(result.split('|')[1]).assertEqual(plain);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0101 end');
    });

  });
}
