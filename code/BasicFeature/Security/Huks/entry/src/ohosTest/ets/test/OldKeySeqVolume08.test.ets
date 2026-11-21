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

export default function oldKeySeqVolume08Test() {
  describe('OldKeySeqVolume08', () => {

    /**
     * @tc.name   testOldKeySeq0355
     * @tc.number SUB_Huks_OKSQ_0355
     * @tc.desc   状态：EID 链 21 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0355', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0355 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'e'.repeat(21);
      const mode: string = 'EID';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  if (mode === 'E') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      resolve('ok|' + c1);
    });
  } else if (mode === 'EE') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.encryptDataUserOldKey(plain, (c2: string) => {
        resolve('ok|' + c1 + '|' + c2);
      });
    });
  } else if (mode === 'EID') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.importKey().then(() => {
        model.decryptDataUserOldKey((back: string) => {
          resolve('ok|' + c1 + '|' + back);
        });
      });
    });
  } else {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.importKey().then(() => {
        model.decryptDataUserOldKey((back: string) => {
          model.encryptDataUserOldKey(plain, (c3: string) => {
            resolve('ok|' + c1 + '|' + back + '|' + c3);
          });
        });
      });
    });
  }
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[2]), String('e'.repeat(21)));
      expect(result.split('|')[2]).assertEqual('e'.repeat(21));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(44));
      const seg1Len: number = result.split('|')[1].length;
      expect(seg1Len).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[2].length), String(21));
      const seg2Len: number = result.split('|')[2].length;
      expect(seg2Len).assertEqual(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0355 end');
    });

    /**
     * @tc.name   testOldKeySeq0356
     * @tc.number SUB_Huks_OKSQ_0356
     * @tc.desc   状态：EID 链 22 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0356', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0356 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'e'.repeat(22);
      const mode: string = 'EID';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  if (mode === 'E') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      resolve('ok|' + c1);
    });
  } else if (mode === 'EE') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.encryptDataUserOldKey(plain, (c2: string) => {
        resolve('ok|' + c1 + '|' + c2);
      });
    });
  } else if (mode === 'EID') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.importKey().then(() => {
        model.decryptDataUserOldKey((back: string) => {
          resolve('ok|' + c1 + '|' + back);
        });
      });
    });
  } else {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.importKey().then(() => {
        model.decryptDataUserOldKey((back: string) => {
          model.encryptDataUserOldKey(plain, (c3: string) => {
            resolve('ok|' + c1 + '|' + back + '|' + c3);
          });
        });
      });
    });
  }
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[2]), String('e'.repeat(22)));
      expect(result.split('|')[2]).assertEqual('e'.repeat(22));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(44));
      const seg1Len: number = result.split('|')[1].length;
      expect(seg1Len).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[2].length), String(22));
      const seg2Len: number = result.split('|')[2].length;
      expect(seg2Len).assertEqual(22);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0356 end');
    });

    /**
     * @tc.name   testOldKeySeq0357
     * @tc.number SUB_Huks_OKSQ_0357
     * @tc.desc   状态：EID 链 23 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0357', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0357 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'e'.repeat(23);
      const mode: string = 'EID';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  if (mode === 'E') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      resolve('ok|' + c1);
    });
  } else if (mode === 'EE') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.encryptDataUserOldKey(plain, (c2: string) => {
        resolve('ok|' + c1 + '|' + c2);
      });
    });
  } else if (mode === 'EID') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.importKey().then(() => {
        model.decryptDataUserOldKey((back: string) => {
          resolve('ok|' + c1 + '|' + back);
        });
      });
    });
  } else {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.importKey().then(() => {
        model.decryptDataUserOldKey((back: string) => {
          model.encryptDataUserOldKey(plain, (c3: string) => {
            resolve('ok|' + c1 + '|' + back + '|' + c3);
          });
        });
      });
    });
  }
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[2]), String('e'.repeat(23)));
      expect(result.split('|')[2]).assertEqual('e'.repeat(23));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(44));
      const seg1Len: number = result.split('|')[1].length;
      expect(seg1Len).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[2].length), String(23));
      const seg2Len: number = result.split('|')[2].length;
      expect(seg2Len).assertEqual(23);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0357 end');
    });

    /**
     * @tc.name   testOldKeySeq0358
     * @tc.number SUB_Huks_OKSQ_0358
     * @tc.desc   状态：EID 链 24 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0358', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0358 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'e'.repeat(24);
      const mode: string = 'EID';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  if (mode === 'E') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      resolve('ok|' + c1);
    });
  } else if (mode === 'EE') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.encryptDataUserOldKey(plain, (c2: string) => {
        resolve('ok|' + c1 + '|' + c2);
      });
    });
  } else if (mode === 'EID') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.importKey().then(() => {
        model.decryptDataUserOldKey((back: string) => {
          resolve('ok|' + c1 + '|' + back);
        });
      });
    });
  } else {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.importKey().then(() => {
        model.decryptDataUserOldKey((back: string) => {
          model.encryptDataUserOldKey(plain, (c3: string) => {
            resolve('ok|' + c1 + '|' + back + '|' + c3);
          });
        });
      });
    });
  }
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[2]), String('e'.repeat(24)));
      expect(result.split('|')[2]).assertEqual('e'.repeat(24));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(44));
      const seg1Len: number = result.split('|')[1].length;
      expect(seg1Len).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[2].length), String(24));
      const seg2Len: number = result.split('|')[2].length;
      expect(seg2Len).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0358 end');
    });

    /**
     * @tc.name   testOldKeySeq0359
     * @tc.number SUB_Huks_OKSQ_0359
     * @tc.desc   状态：EID 链 25 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0359', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0359 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'e'.repeat(25);
      const mode: string = 'EID';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  if (mode === 'E') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      resolve('ok|' + c1);
    });
  } else if (mode === 'EE') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.encryptDataUserOldKey(plain, (c2: string) => {
        resolve('ok|' + c1 + '|' + c2);
      });
    });
  } else if (mode === 'EID') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.importKey().then(() => {
        model.decryptDataUserOldKey((back: string) => {
          resolve('ok|' + c1 + '|' + back);
        });
      });
    });
  } else {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.importKey().then(() => {
        model.decryptDataUserOldKey((back: string) => {
          model.encryptDataUserOldKey(plain, (c3: string) => {
            resolve('ok|' + c1 + '|' + back + '|' + c3);
          });
        });
      });
    });
  }
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[2]), String('e'.repeat(25)));
      expect(result.split('|')[2]).assertEqual('e'.repeat(25));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(44));
      const seg1Len: number = result.split('|')[1].length;
      expect(seg1Len).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[2].length), String(25));
      const seg2Len: number = result.split('|')[2].length;
      expect(seg2Len).assertEqual(25);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0359 end');
    });

    /**
     * @tc.name   testOldKeySeq0360
     * @tc.number SUB_Huks_OKSQ_0360
     * @tc.desc   状态：EID 链 26 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0360 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'e'.repeat(26);
      const mode: string = 'EID';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  if (mode === 'E') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      resolve('ok|' + c1);
    });
  } else if (mode === 'EE') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.encryptDataUserOldKey(plain, (c2: string) => {
        resolve('ok|' + c1 + '|' + c2);
      });
    });
  } else if (mode === 'EID') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.importKey().then(() => {
        model.decryptDataUserOldKey((back: string) => {
          resolve('ok|' + c1 + '|' + back);
        });
      });
    });
  } else {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.importKey().then(() => {
        model.decryptDataUserOldKey((back: string) => {
          model.encryptDataUserOldKey(plain, (c3: string) => {
            resolve('ok|' + c1 + '|' + back + '|' + c3);
          });
        });
      });
    });
  }
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[2]), String('e'.repeat(26)));
      expect(result.split('|')[2]).assertEqual('e'.repeat(26));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(44));
      const seg1Len: number = result.split('|')[1].length;
      expect(seg1Len).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[2].length), String(26));
      const seg2Len: number = result.split('|')[2].length;
      expect(seg2Len).assertEqual(26);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0360 end');
    });

    /**
     * @tc.name   testOldKeySeq0361
     * @tc.number SUB_Huks_OKSQ_0361
     * @tc.desc   状态：EID 链 27 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0361', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0361 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'e'.repeat(27);
      const mode: string = 'EID';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  if (mode === 'E') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      resolve('ok|' + c1);
    });
  } else if (mode === 'EE') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.encryptDataUserOldKey(plain, (c2: string) => {
        resolve('ok|' + c1 + '|' + c2);
      });
    });
  } else if (mode === 'EID') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.importKey().then(() => {
        model.decryptDataUserOldKey((back: string) => {
          resolve('ok|' + c1 + '|' + back);
        });
      });
    });
  } else {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.importKey().then(() => {
        model.decryptDataUserOldKey((back: string) => {
          model.encryptDataUserOldKey(plain, (c3: string) => {
            resolve('ok|' + c1 + '|' + back + '|' + c3);
          });
        });
      });
    });
  }
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[2]), String('e'.repeat(27)));
      expect(result.split('|')[2]).assertEqual('e'.repeat(27));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(44));
      const seg1Len: number = result.split('|')[1].length;
      expect(seg1Len).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[2].length), String(27));
      const seg2Len: number = result.split('|')[2].length;
      expect(seg2Len).assertEqual(27);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0361 end');
    });

    /**
     * @tc.name   testOldKeySeq0362
     * @tc.number SUB_Huks_OKSQ_0362
     * @tc.desc   状态：EID 链 28 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0362', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0362 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'e'.repeat(28);
      const mode: string = 'EID';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  if (mode === 'E') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      resolve('ok|' + c1);
    });
  } else if (mode === 'EE') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.encryptDataUserOldKey(plain, (c2: string) => {
        resolve('ok|' + c1 + '|' + c2);
      });
    });
  } else if (mode === 'EID') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.importKey().then(() => {
        model.decryptDataUserOldKey((back: string) => {
          resolve('ok|' + c1 + '|' + back);
        });
      });
    });
  } else {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.importKey().then(() => {
        model.decryptDataUserOldKey((back: string) => {
          model.encryptDataUserOldKey(plain, (c3: string) => {
            resolve('ok|' + c1 + '|' + back + '|' + c3);
          });
        });
      });
    });
  }
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[2]), String('e'.repeat(28)));
      expect(result.split('|')[2]).assertEqual('e'.repeat(28));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(44));
      const seg1Len: number = result.split('|')[1].length;
      expect(seg1Len).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[2].length), String(28));
      const seg2Len: number = result.split('|')[2].length;
      expect(seg2Len).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0362 end');
    });

    /**
     * @tc.name   testOldKeySeq0363
     * @tc.number SUB_Huks_OKSQ_0363
     * @tc.desc   状态：EID 链 29 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0363', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0363 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'e'.repeat(29);
      const mode: string = 'EID';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  if (mode === 'E') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      resolve('ok|' + c1);
    });
  } else if (mode === 'EE') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.encryptDataUserOldKey(plain, (c2: string) => {
        resolve('ok|' + c1 + '|' + c2);
      });
    });
  } else if (mode === 'EID') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.importKey().then(() => {
        model.decryptDataUserOldKey((back: string) => {
          resolve('ok|' + c1 + '|' + back);
        });
      });
    });
  } else {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.importKey().then(() => {
        model.decryptDataUserOldKey((back: string) => {
          model.encryptDataUserOldKey(plain, (c3: string) => {
            resolve('ok|' + c1 + '|' + back + '|' + c3);
          });
        });
      });
    });
  }
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[2]), String('e'.repeat(29)));
      expect(result.split('|')[2]).assertEqual('e'.repeat(29));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(44));
      const seg1Len: number = result.split('|')[1].length;
      expect(seg1Len).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[2].length), String(29));
      const seg2Len: number = result.split('|')[2].length;
      expect(seg2Len).assertEqual(29);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0363 end');
    });

    /**
     * @tc.name   testOldKeySeq0364
     * @tc.number SUB_Huks_OKSQ_0364
     * @tc.desc   状态：EID 链 30 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0364', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0364 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'e'.repeat(30);
      const mode: string = 'EID';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  if (mode === 'E') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      resolve('ok|' + c1);
    });
  } else if (mode === 'EE') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.encryptDataUserOldKey(plain, (c2: string) => {
        resolve('ok|' + c1 + '|' + c2);
      });
    });
  } else if (mode === 'EID') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.importKey().then(() => {
        model.decryptDataUserOldKey((back: string) => {
          resolve('ok|' + c1 + '|' + back);
        });
      });
    });
  } else {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.importKey().then(() => {
        model.decryptDataUserOldKey((back: string) => {
          model.encryptDataUserOldKey(plain, (c3: string) => {
            resolve('ok|' + c1 + '|' + back + '|' + c3);
          });
        });
      });
    });
  }
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[2]), String('e'.repeat(30)));
      expect(result.split('|')[2]).assertEqual('e'.repeat(30));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(44));
      const seg1Len: number = result.split('|')[1].length;
      expect(seg1Len).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[2].length), String(30));
      const seg2Len: number = result.split('|')[2].length;
      expect(seg2Len).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0364 end');
    });

    /**
     * @tc.name   testOldKeySeq0365
     * @tc.number SUB_Huks_OKSQ_0365
     * @tc.desc   状态：EIDE 链 31 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0365', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0365 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'e'.repeat(31);
      const mode: string = 'EIDE';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  if (mode === 'E') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      resolve('ok|' + c1);
    });
  } else if (mode === 'EE') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.encryptDataUserOldKey(plain, (c2: string) => {
        resolve('ok|' + c1 + '|' + c2);
      });
    });
  } else if (mode === 'EID') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.importKey().then(() => {
        model.decryptDataUserOldKey((back: string) => {
          resolve('ok|' + c1 + '|' + back);
        });
      });
    });
  } else {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.importKey().then(() => {
        model.decryptDataUserOldKey((back: string) => {
          model.encryptDataUserOldKey(plain, (c3: string) => {
            resolve('ok|' + c1 + '|' + back + '|' + c3);
          });
        });
      });
    });
  }
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[1] === result.split('|')[3]));
      expect(result.split('|')[1] === result.split('|')[3]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[2]), String('e'.repeat(31)));
      expect(result.split('|')[2]).assertEqual('e'.repeat(31));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(44));
      const seg1Len: number = result.split('|')[1].length;
      expect(seg1Len).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0365 end');
    });

    /**
     * @tc.name   testOldKeySeq0366
     * @tc.number SUB_Huks_OKSQ_0366
     * @tc.desc   状态：EIDE 链 32 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0366', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0366 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'e'.repeat(32);
      const mode: string = 'EIDE';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  if (mode === 'E') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      resolve('ok|' + c1);
    });
  } else if (mode === 'EE') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.encryptDataUserOldKey(plain, (c2: string) => {
        resolve('ok|' + c1 + '|' + c2);
      });
    });
  } else if (mode === 'EID') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.importKey().then(() => {
        model.decryptDataUserOldKey((back: string) => {
          resolve('ok|' + c1 + '|' + back);
        });
      });
    });
  } else {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.importKey().then(() => {
        model.decryptDataUserOldKey((back: string) => {
          model.encryptDataUserOldKey(plain, (c3: string) => {
            resolve('ok|' + c1 + '|' + back + '|' + c3);
          });
        });
      });
    });
  }
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[1] === result.split('|')[3]));
      expect(result.split('|')[1] === result.split('|')[3]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[2]), String('e'.repeat(32)));
      expect(result.split('|')[2]).assertEqual('e'.repeat(32));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(64));
      const seg1Len: number = result.split('|')[1].length;
      expect(seg1Len).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0366 end');
    });

    /**
     * @tc.name   testOldKeySeq0367
     * @tc.number SUB_Huks_OKSQ_0367
     * @tc.desc   状态：EIDE 链 33 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0367', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0367 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'e'.repeat(33);
      const mode: string = 'EIDE';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  if (mode === 'E') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      resolve('ok|' + c1);
    });
  } else if (mode === 'EE') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.encryptDataUserOldKey(plain, (c2: string) => {
        resolve('ok|' + c1 + '|' + c2);
      });
    });
  } else if (mode === 'EID') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.importKey().then(() => {
        model.decryptDataUserOldKey((back: string) => {
          resolve('ok|' + c1 + '|' + back);
        });
      });
    });
  } else {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.importKey().then(() => {
        model.decryptDataUserOldKey((back: string) => {
          model.encryptDataUserOldKey(plain, (c3: string) => {
            resolve('ok|' + c1 + '|' + back + '|' + c3);
          });
        });
      });
    });
  }
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[1] === result.split('|')[3]));
      expect(result.split('|')[1] === result.split('|')[3]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[2]), String('e'.repeat(33)));
      expect(result.split('|')[2]).assertEqual('e'.repeat(33));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(64));
      const seg1Len: number = result.split('|')[1].length;
      expect(seg1Len).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0367 end');
    });

    /**
     * @tc.name   testOldKeySeq0368
     * @tc.number SUB_Huks_OKSQ_0368
     * @tc.desc   状态：EIDE 链 34 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0368', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0368 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'e'.repeat(34);
      const mode: string = 'EIDE';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  if (mode === 'E') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      resolve('ok|' + c1);
    });
  } else if (mode === 'EE') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.encryptDataUserOldKey(plain, (c2: string) => {
        resolve('ok|' + c1 + '|' + c2);
      });
    });
  } else if (mode === 'EID') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.importKey().then(() => {
        model.decryptDataUserOldKey((back: string) => {
          resolve('ok|' + c1 + '|' + back);
        });
      });
    });
  } else {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.importKey().then(() => {
        model.decryptDataUserOldKey((back: string) => {
          model.encryptDataUserOldKey(plain, (c3: string) => {
            resolve('ok|' + c1 + '|' + back + '|' + c3);
          });
        });
      });
    });
  }
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[1] === result.split('|')[3]));
      expect(result.split('|')[1] === result.split('|')[3]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[2]), String('e'.repeat(34)));
      expect(result.split('|')[2]).assertEqual('e'.repeat(34));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(64));
      const seg1Len: number = result.split('|')[1].length;
      expect(seg1Len).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0368 end');
    });

    /**
     * @tc.name   testOldKeySeq0369
     * @tc.number SUB_Huks_OKSQ_0369
     * @tc.desc   状态：EIDE 链 35 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0369', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0369 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'e'.repeat(35);
      const mode: string = 'EIDE';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  if (mode === 'E') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      resolve('ok|' + c1);
    });
  } else if (mode === 'EE') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.encryptDataUserOldKey(plain, (c2: string) => {
        resolve('ok|' + c1 + '|' + c2);
      });
    });
  } else if (mode === 'EID') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.importKey().then(() => {
        model.decryptDataUserOldKey((back: string) => {
          resolve('ok|' + c1 + '|' + back);
        });
      });
    });
  } else {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.importKey().then(() => {
        model.decryptDataUserOldKey((back: string) => {
          model.encryptDataUserOldKey(plain, (c3: string) => {
            resolve('ok|' + c1 + '|' + back + '|' + c3);
          });
        });
      });
    });
  }
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[1] === result.split('|')[3]));
      expect(result.split('|')[1] === result.split('|')[3]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[2]), String('e'.repeat(35)));
      expect(result.split('|')[2]).assertEqual('e'.repeat(35));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(64));
      const seg1Len: number = result.split('|')[1].length;
      expect(seg1Len).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0369 end');
    });

    /**
     * @tc.name   testOldKeySeq0370
     * @tc.number SUB_Huks_OKSQ_0370
     * @tc.desc   状态：EIDE 链 36 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0370 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'e'.repeat(36);
      const mode: string = 'EIDE';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  if (mode === 'E') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      resolve('ok|' + c1);
    });
  } else if (mode === 'EE') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.encryptDataUserOldKey(plain, (c2: string) => {
        resolve('ok|' + c1 + '|' + c2);
      });
    });
  } else if (mode === 'EID') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.importKey().then(() => {
        model.decryptDataUserOldKey((back: string) => {
          resolve('ok|' + c1 + '|' + back);
        });
      });
    });
  } else {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.importKey().then(() => {
        model.decryptDataUserOldKey((back: string) => {
          model.encryptDataUserOldKey(plain, (c3: string) => {
            resolve('ok|' + c1 + '|' + back + '|' + c3);
          });
        });
      });
    });
  }
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[1] === result.split('|')[3]));
      expect(result.split('|')[1] === result.split('|')[3]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[2]), String('e'.repeat(36)));
      expect(result.split('|')[2]).assertEqual('e'.repeat(36));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(64));
      const seg1Len: number = result.split('|')[1].length;
      expect(seg1Len).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0370 end');
    });

    /**
     * @tc.name   testOldKeySeq0371
     * @tc.number SUB_Huks_OKSQ_0371
     * @tc.desc   状态：EIDE 链 37 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0371', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0371 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'e'.repeat(37);
      const mode: string = 'EIDE';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  if (mode === 'E') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      resolve('ok|' + c1);
    });
  } else if (mode === 'EE') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.encryptDataUserOldKey(plain, (c2: string) => {
        resolve('ok|' + c1 + '|' + c2);
      });
    });
  } else if (mode === 'EID') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.importKey().then(() => {
        model.decryptDataUserOldKey((back: string) => {
          resolve('ok|' + c1 + '|' + back);
        });
      });
    });
  } else {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.importKey().then(() => {
        model.decryptDataUserOldKey((back: string) => {
          model.encryptDataUserOldKey(plain, (c3: string) => {
            resolve('ok|' + c1 + '|' + back + '|' + c3);
          });
        });
      });
    });
  }
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[1] === result.split('|')[3]));
      expect(result.split('|')[1] === result.split('|')[3]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[2]), String('e'.repeat(37)));
      expect(result.split('|')[2]).assertEqual('e'.repeat(37));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(64));
      const seg1Len: number = result.split('|')[1].length;
      expect(seg1Len).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0371 end');
    });

    /**
     * @tc.name   testOldKeySeq0372
     * @tc.number SUB_Huks_OKSQ_0372
     * @tc.desc   状态：EIDE 链 38 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0372', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0372 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'e'.repeat(38);
      const mode: string = 'EIDE';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  if (mode === 'E') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      resolve('ok|' + c1);
    });
  } else if (mode === 'EE') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.encryptDataUserOldKey(plain, (c2: string) => {
        resolve('ok|' + c1 + '|' + c2);
      });
    });
  } else if (mode === 'EID') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.importKey().then(() => {
        model.decryptDataUserOldKey((back: string) => {
          resolve('ok|' + c1 + '|' + back);
        });
      });
    });
  } else {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.importKey().then(() => {
        model.decryptDataUserOldKey((back: string) => {
          model.encryptDataUserOldKey(plain, (c3: string) => {
            resolve('ok|' + c1 + '|' + back + '|' + c3);
          });
        });
      });
    });
  }
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[1] === result.split('|')[3]));
      expect(result.split('|')[1] === result.split('|')[3]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[2]), String('e'.repeat(38)));
      expect(result.split('|')[2]).assertEqual('e'.repeat(38));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(64));
      const seg1Len: number = result.split('|')[1].length;
      expect(seg1Len).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0372 end');
    });

    /**
     * @tc.name   testOldKeySeq0373
     * @tc.number SUB_Huks_OKSQ_0373
     * @tc.desc   状态：EIDE 链 39 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0373', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0373 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'e'.repeat(39);
      const mode: string = 'EIDE';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  if (mode === 'E') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      resolve('ok|' + c1);
    });
  } else if (mode === 'EE') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.encryptDataUserOldKey(plain, (c2: string) => {
        resolve('ok|' + c1 + '|' + c2);
      });
    });
  } else if (mode === 'EID') {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.importKey().then(() => {
        model.decryptDataUserOldKey((back: string) => {
          resolve('ok|' + c1 + '|' + back);
        });
      });
    });
  } else {
    model.encryptDataUserOldKey(plain, (c1: string) => {
      model.importKey().then(() => {
        model.decryptDataUserOldKey((back: string) => {
          model.encryptDataUserOldKey(plain, (c3: string) => {
            resolve('ok|' + c1 + '|' + back + '|' + c3);
          });
        });
      });
    });
  }
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[1] === result.split('|')[3]));
      expect(result.split('|')[1] === result.split('|')[3]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[2]), String('e'.repeat(39)));
      expect(result.split('|')[2]).assertEqual('e'.repeat(39));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(64));
      const seg1Len: number = result.split('|')[1].length;
      expect(seg1Len).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0373 end');
    });


    /**
     * @tc.name   testOldKeySeq0374
     * @tc.number SUB_Huks_OKSQ_0374
     * @tc.desc   EIDE 全链手写：7 字符补块 16、base64 24，首尾密文相等且解密回明文
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0374', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0374 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'e'.repeat(7);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptDataUserOldKey(plain, (c1: string) => {
          model.importKey().then(() => {
            model.decryptDataUserOldKey((back: string) => {
              model.encryptDataUserOldKey(plain, (c3: string) => {
                resolve(c1 + '|' + back + '|' + c3);
              });
            });
          });
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] === result.split('|')[2]));
      expect(result.split('|')[0] === result.split('|')[2]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String(plain));
      expect(result.split('|')[1]).assertEqual(plain);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(24));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0374 end');
    });

  });
}
