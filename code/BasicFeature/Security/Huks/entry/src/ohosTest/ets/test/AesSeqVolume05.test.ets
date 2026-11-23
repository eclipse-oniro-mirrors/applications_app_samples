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

export default function aesSeqVolume05Test() {
  describe('AesSeqVolume05', () => {

    /**
     * @tc.name   testAesSeq0222
     * @tc.number SUB_Huks_AESSQ_0222
     * @tc.desc   合法：1 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0222 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(1);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(24));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(17));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(17);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0222 end');
    });

    /**
     * @tc.name   testAesSeq0223
     * @tc.number SUB_Huks_AESSQ_0223
     * @tc.desc   合法：2 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0223 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(2);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(24));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(18));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(18);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0223 end');
    });

    /**
     * @tc.name   testAesSeq0224
     * @tc.number SUB_Huks_AESSQ_0224
     * @tc.desc   合法：3 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0224 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(3);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(28));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(19));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0224 end');
    });

    /**
     * @tc.name   testAesSeq0225
     * @tc.number SUB_Huks_AESSQ_0225
     * @tc.desc   合法：4 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0225 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(4);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(28));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(20));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0225 end');
    });

    /**
     * @tc.name   testAesSeq0226
     * @tc.number SUB_Huks_AESSQ_0226
     * @tc.desc   合法：5 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0226 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(5);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(28));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(21));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0226 end');
    });

    /**
     * @tc.name   testAesSeq0227
     * @tc.number SUB_Huks_AESSQ_0227
     * @tc.desc   合法：6 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0227 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(6);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(32));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(22));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(22);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0227 end');
    });

    /**
     * @tc.name   testAesSeq0228
     * @tc.number SUB_Huks_AESSQ_0228
     * @tc.desc   合法：7 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0228 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(7);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(32));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(23));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(23);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0228 end');
    });

    /**
     * @tc.name   testAesSeq0229
     * @tc.number SUB_Huks_AESSQ_0229
     * @tc.desc   合法：8 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0229 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(8);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(32));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(24));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0229 end');
    });

    /**
     * @tc.name   testAesSeq0230
     * @tc.number SUB_Huks_AESSQ_0230
     * @tc.desc   合法：9 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0230 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(9);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(36));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(25));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(25);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0230 end');
    });

    /**
     * @tc.name   testAesSeq0231
     * @tc.number SUB_Huks_AESSQ_0231
     * @tc.desc   合法：10 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0231 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(10);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(36));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(26));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(26);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0231 end');
    });

    /**
     * @tc.name   testAesSeq0232
     * @tc.number SUB_Huks_AESSQ_0232
     * @tc.desc   合法：11 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0232 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(11);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(36));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(27));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(27);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0232 end');
    });

    /**
     * @tc.name   testAesSeq0233
     * @tc.number SUB_Huks_AESSQ_0233
     * @tc.desc   合法：12 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0233 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(12);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(40));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(28));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0233 end');
    });

    /**
     * @tc.name   testAesSeq0234
     * @tc.number SUB_Huks_AESSQ_0234
     * @tc.desc   合法：13 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0234 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(13);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(40));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(29));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(29);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0234 end');
    });

    /**
     * @tc.name   testAesSeq0235
     * @tc.number SUB_Huks_AESSQ_0235
     * @tc.desc   合法：14 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0235 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(14);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(40));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(30));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0235 end');
    });

    /**
     * @tc.name   testAesSeq0236
     * @tc.number SUB_Huks_AESSQ_0236
     * @tc.desc   边界：15 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0236 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(15);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(44));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(31));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(31);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0236 end');
    });

    /**
     * @tc.name   testAesSeq0237
     * @tc.number SUB_Huks_AESSQ_0237
     * @tc.desc   边界：16 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0237 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(16);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(44));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(32));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0237 end');
    });

    /**
     * @tc.name   testAesSeq0238
     * @tc.number SUB_Huks_AESSQ_0238
     * @tc.desc   合法：17 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0238 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(17);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(44));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(33));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(33);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0238 end');
    });

    /**
     * @tc.name   testAesSeq0239
     * @tc.number SUB_Huks_AESSQ_0239
     * @tc.desc   合法：18 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0239 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(18);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(48));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(34));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(34);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0239 end');
    });

    /**
     * @tc.name   testAesSeq0240
     * @tc.number SUB_Huks_AESSQ_0240
     * @tc.desc   合法：19 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0240 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(19);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(48));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(35));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(35);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0240 end');
    });

    /**
     * @tc.name   testAesSeq0241
     * @tc.number SUB_Huks_AESSQ_0241
     * @tc.desc   合法：20 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0241 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(20);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(48));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(36));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0241 end');
    });

    /**
     * @tc.name   testAesSeq0242
     * @tc.number SUB_Huks_AESSQ_0242
     * @tc.desc   合法：21 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0242 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(21);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(52));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(52);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(37));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(37);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0242 end');
    });

    /**
     * @tc.name   testAesSeq0243
     * @tc.number SUB_Huks_AESSQ_0243
     * @tc.desc   合法：22 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0243 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(22);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(52));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(52);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(38));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(38);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0243 end');
    });

    /**
     * @tc.name   testAesSeq0244
     * @tc.number SUB_Huks_AESSQ_0244
     * @tc.desc   合法：23 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0244 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(23);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(52));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(52);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(39));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(39);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0244 end');
    });

    /**
     * @tc.name   testAesSeq0245
     * @tc.number SUB_Huks_AESSQ_0245
     * @tc.desc   合法：24 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0245 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(24);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(56));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(40));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0245 end');
    });

    /**
     * @tc.name   testAesSeq0246
     * @tc.number SUB_Huks_AESSQ_0246
     * @tc.desc   合法：25 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0246 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(25);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(56));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(41));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(41);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0246 end');
    });

    /**
     * @tc.name   testAesSeq0247
     * @tc.number SUB_Huks_AESSQ_0247
     * @tc.desc   合法：26 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0247 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(26);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(56));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(42));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0247 end');
    });

    /**
     * @tc.name   testAesSeq0248
     * @tc.number SUB_Huks_AESSQ_0248
     * @tc.desc   合法：27 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0248 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(27);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(60));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(60);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(43));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(43);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0248 end');
    });

    /**
     * @tc.name   testAesSeq0249
     * @tc.number SUB_Huks_AESSQ_0249
     * @tc.desc   合法：28 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0249 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(28);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(60));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(60);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(44));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0249 end');
    });

    /**
     * @tc.name   testAesSeq0250
     * @tc.number SUB_Huks_AESSQ_0250
     * @tc.desc   合法：29 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0250 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(29);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(60));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(60);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(45));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(45);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0250 end');
    });

    /**
     * @tc.name   testAesSeq0251
     * @tc.number SUB_Huks_AESSQ_0251
     * @tc.desc   合法：30 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0251 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(30);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(64));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(46));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(46);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0251 end');
    });

    /**
     * @tc.name   testAesSeq0252
     * @tc.number SUB_Huks_AESSQ_0252
     * @tc.desc   边界：31 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0252 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(31);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(64));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(47));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(47);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0252 end');
    });

    /**
     * @tc.name   testAesSeq0253
     * @tc.number SUB_Huks_AESSQ_0253
     * @tc.desc   边界：32 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0253 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(32);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(64));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(48));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0253 end');
    });

    /**
     * @tc.name   testAesSeq0254
     * @tc.number SUB_Huks_AESSQ_0254
     * @tc.desc   合法：33 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0254 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(33);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(68));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(68);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(49));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(49);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0254 end');
    });

    /**
     * @tc.name   testAesSeq0255
     * @tc.number SUB_Huks_AESSQ_0255
     * @tc.desc   合法：34 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0255 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(34);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(68));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(68);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(50));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0255 end');
    });

    /**
     * @tc.name   testAesSeq0256
     * @tc.number SUB_Huks_AESSQ_0256
     * @tc.desc   合法：35 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0256 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(35);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(68));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(68);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(51));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(51);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0256 end');
    });

    /**
     * @tc.name   testAesSeq0257
     * @tc.number SUB_Huks_AESSQ_0257
     * @tc.desc   合法：36 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0257 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(36);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(72));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(72);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(52));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(52);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0257 end');
    });

    /**
     * @tc.name   testAesSeq0258
     * @tc.number SUB_Huks_AESSQ_0258
     * @tc.desc   合法：37 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0258 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(37);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(72));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(72);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(53));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(53);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0258 end');
    });

    /**
     * @tc.name   testAesSeq0259
     * @tc.number SUB_Huks_AESSQ_0259
     * @tc.desc   合法：38 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0259 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(38);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(72));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(72);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(54));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(54);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0259 end');
    });

    /**
     * @tc.name   testAesSeq0260
     * @tc.number SUB_Huks_AESSQ_0260
     * @tc.desc   合法：39 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0260 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(39);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(76));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(55));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(55);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0260 end');
    });

    /**
     * @tc.name   testAesSeq0261
     * @tc.number SUB_Huks_AESSQ_0261
     * @tc.desc   合法：40 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0261 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(40);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(76));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(56));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0261 end');
    });

    /**
     * @tc.name   testAesSeq0262
     * @tc.number SUB_Huks_AESSQ_0262
     * @tc.desc   合法：41 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0262 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(41);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(76));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(57));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(57);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0262 end');
    });

    /**
     * @tc.name   testAesSeq0263
     * @tc.number SUB_Huks_AESSQ_0263
     * @tc.desc   合法：42 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0263 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(42);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(80));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(80);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(58));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(58);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0263 end');
    });

    /**
     * @tc.name   testAesSeq0264
     * @tc.number SUB_Huks_AESSQ_0264
     * @tc.desc   合法：43 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0264 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(43);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(80));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(80);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(59));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(59);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0264 end');
    });

    /**
     * @tc.name   testAesSeq0265
     * @tc.number SUB_Huks_AESSQ_0265
     * @tc.desc   合法：44 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0265 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(44);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(80));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(80);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(60));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(60);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0265 end');
    });

    /**
     * @tc.name   testAesSeq0266
     * @tc.number SUB_Huks_AESSQ_0266
     * @tc.desc   合法：45 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0266 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(45);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(84));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(84);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(61));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(61);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0266 end');
    });

    /**
     * @tc.name   testAesSeq0267
     * @tc.number SUB_Huks_AESSQ_0267
     * @tc.desc   合法：46 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0267 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(46);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(84));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(84);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(62));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(62);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0267 end');
    });

    /**
     * @tc.name   testAesSeq0268
     * @tc.number SUB_Huks_AESSQ_0268
     * @tc.desc   边界：47 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0268 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(47);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(84));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(84);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(63));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(63);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0268 end');
    });

    /**
     * @tc.name   testAesSeq0269
     * @tc.number SUB_Huks_AESSQ_0269
     * @tc.desc   边界：48 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0269 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(48);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(88));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(88);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(64));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0269 end');
    });

    /**
     * @tc.name   testAesSeq0270
     * @tc.number SUB_Huks_AESSQ_0270
     * @tc.desc   合法：49 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0270 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(49);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(88));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(88);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(65));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(65);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0270 end');
    });

    /**
     * @tc.name   testAesSeq0271
     * @tc.number SUB_Huks_AESSQ_0271
     * @tc.desc   合法：50 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0271', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0271 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(50);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(88));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(88);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(66));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(66);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0271 end');
    });

    /**
     * @tc.name   testAesSeq0272
     * @tc.number SUB_Huks_AESSQ_0272
     * @tc.desc   合法：51 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0272', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0272 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(51);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(92));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(92);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(67));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(67);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0272 end');
    });

    /**
     * @tc.name   testAesSeq0273
     * @tc.number SUB_Huks_AESSQ_0273
     * @tc.desc   合法：52 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0273', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0273 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(52);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(92));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(92);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(68));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(68);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0273 end');
    });

    /**
     * @tc.name   testAesSeq0274
     * @tc.number SUB_Huks_AESSQ_0274
     * @tc.desc   合法：53 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0274', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0274 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(53);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(92));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(92);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(69));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(69);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0274 end');
    });

    /**
     * @tc.name   testAesSeq0275
     * @tc.number SUB_Huks_AESSQ_0275
     * @tc.desc   合法：54 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0275', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0275 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(54);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(96));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(96);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(70));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(70);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0275 end');
    });

    /**
     * @tc.name   testAesSeq0276
     * @tc.number SUB_Huks_AESSQ_0276
     * @tc.desc   合法：55 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0276', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0276 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(55);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(96));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(96);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(71));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(71);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0276 end');
    });

    /**
     * @tc.name   testAesSeq0277
     * @tc.number SUB_Huks_AESSQ_0277
     * @tc.desc   合法：56 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0277', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0277 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(56);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(96));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(96);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(72));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(72);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0277 end');
    });

    /**
     * @tc.name   testAesSeq0278
     * @tc.number SUB_Huks_AESSQ_0278
     * @tc.desc   合法：57 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0278', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0278 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(57);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(100));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(73));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(73);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0278 end');
    });

    /**
     * @tc.name   testAesSeq0279
     * @tc.number SUB_Huks_AESSQ_0279
     * @tc.desc   合法：58 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0279', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0279 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(58);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(100));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(74));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(74);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0279 end');
    });

    /**
     * @tc.name   testAesSeq0280
     * @tc.number SUB_Huks_AESSQ_0280
     * @tc.desc   合法：59 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0280 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(59);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (c1: string) => {
    model.encryptData(plain, (c2: string) => {
      resolve(c1 + '|' + c2);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== result.split('|')[1]));
      expect(result.split('|')[0] !== result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(100));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(75));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(75);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0280 end');
    });


    /**
     * @tc.name   testAesSeq0281
     * @tc.number SUB_Huks_AESSQ_0281
     * @tc.desc   三连加密互异（随机 IV）且长度 48：20 字符明文为 36 字节密文
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0281', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0281 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'd'.repeat(20);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptData(plain, (c1: string) => {
          model.encryptData(plain, (c2: string) => {
            model.encryptData(plain, (c3: string) => {
              resolve(c1 + '|' + c2 + '|' + c3);
            });
          });
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(result.split('|')[0] !== result.split('|')[1] && result.split('|')[1] !== result.split('|')[2]));
      const segsEqual01: boolean = result.split('|')[0] !== result.split('|')[1];
      const segsEqual12: boolean = result.split('|')[1] !== result.split('|')[2];
      expect(segsEqual01 && segsEqual12).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(48));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(36));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0281 end');
    });

  });
}
