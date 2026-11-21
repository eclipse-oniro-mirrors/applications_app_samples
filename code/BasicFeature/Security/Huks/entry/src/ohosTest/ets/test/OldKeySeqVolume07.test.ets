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

export default function oldKeySeqVolume07Test() {
  describe('OldKeySeqVolume07', () => {

    /**
     * @tc.name   testOldKeySeq0334
     * @tc.number SUB_Huks_OKSQ_0334
     * @tc.desc   状态：E 链 1 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0334', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0334 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'e'.repeat(1);
      const mode: string = 'E';
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
        String(result.split('|')[1].length), String(24));
      const seg1Len: number = result.split('|')[1].length;
      expect(seg1Len).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[1]).length), String(16));
      const seg1BytesLen: number = decodeB64(result.split('|')[1]).length;
      expect(seg1BytesLen).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result.split('|')[1]).length % 16 === 0));
      expect(decodeB64(result.split('|')[1]).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0334 end');
    });

    /**
     * @tc.name   testOldKeySeq0335
     * @tc.number SUB_Huks_OKSQ_0335
     * @tc.desc   状态：E 链 2 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0335', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0335 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'e'.repeat(2);
      const mode: string = 'E';
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
        String(result.split('|')[1].length), String(24));
      const seg1Len: number = result.split('|')[1].length;
      expect(seg1Len).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[1]).length), String(16));
      const seg1BytesLen: number = decodeB64(result.split('|')[1]).length;
      expect(seg1BytesLen).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result.split('|')[1]).length % 16 === 0));
      expect(decodeB64(result.split('|')[1]).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0335 end');
    });

    /**
     * @tc.name   testOldKeySeq0336
     * @tc.number SUB_Huks_OKSQ_0336
     * @tc.desc   状态：E 链 3 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0336', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0336 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'e'.repeat(3);
      const mode: string = 'E';
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
        String(result.split('|')[1].length), String(24));
      const seg1Len: number = result.split('|')[1].length;
      expect(seg1Len).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[1]).length), String(16));
      const seg1BytesLen: number = decodeB64(result.split('|')[1]).length;
      expect(seg1BytesLen).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result.split('|')[1]).length % 16 === 0));
      expect(decodeB64(result.split('|')[1]).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0336 end');
    });

    /**
     * @tc.name   testOldKeySeq0337
     * @tc.number SUB_Huks_OKSQ_0337
     * @tc.desc   状态：E 链 4 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0337', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0337 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'e'.repeat(4);
      const mode: string = 'E';
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
        String(result.split('|')[1].length), String(24));
      const seg1Len: number = result.split('|')[1].length;
      expect(seg1Len).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[1]).length), String(16));
      const seg1BytesLen: number = decodeB64(result.split('|')[1]).length;
      expect(seg1BytesLen).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result.split('|')[1]).length % 16 === 0));
      expect(decodeB64(result.split('|')[1]).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0337 end');
    });

    /**
     * @tc.name   testOldKeySeq0338
     * @tc.number SUB_Huks_OKSQ_0338
     * @tc.desc   状态：E 链 5 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0338', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0338 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'e'.repeat(5);
      const mode: string = 'E';
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
        String(result.split('|')[1].length), String(24));
      const seg1Len: number = result.split('|')[1].length;
      expect(seg1Len).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[1]).length), String(16));
      const seg1BytesLen: number = decodeB64(result.split('|')[1]).length;
      expect(seg1BytesLen).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result.split('|')[1]).length % 16 === 0));
      expect(decodeB64(result.split('|')[1]).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0338 end');
    });

    /**
     * @tc.name   testOldKeySeq0339
     * @tc.number SUB_Huks_OKSQ_0339
     * @tc.desc   状态：E 链 6 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0339', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0339 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'e'.repeat(6);
      const mode: string = 'E';
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
        String(result.split('|')[1].length), String(24));
      const seg1Len: number = result.split('|')[1].length;
      expect(seg1Len).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[1]).length), String(16));
      const seg1BytesLen: number = decodeB64(result.split('|')[1]).length;
      expect(seg1BytesLen).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result.split('|')[1]).length % 16 === 0));
      expect(decodeB64(result.split('|')[1]).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0339 end');
    });

    /**
     * @tc.name   testOldKeySeq0340
     * @tc.number SUB_Huks_OKSQ_0340
     * @tc.desc   状态：E 链 7 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0340 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'e'.repeat(7);
      const mode: string = 'E';
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
        String(result.split('|')[1].length), String(24));
      const seg1Len: number = result.split('|')[1].length;
      expect(seg1Len).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[1]).length), String(16));
      const seg1BytesLen: number = decodeB64(result.split('|')[1]).length;
      expect(seg1BytesLen).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result.split('|')[1]).length % 16 === 0));
      expect(decodeB64(result.split('|')[1]).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0340 end');
    });

    /**
     * @tc.name   testOldKeySeq0341
     * @tc.number SUB_Huks_OKSQ_0341
     * @tc.desc   状态：E 链 8 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0341', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0341 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'e'.repeat(8);
      const mode: string = 'E';
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
        String(result.split('|')[1].length), String(24));
      const seg1Len: number = result.split('|')[1].length;
      expect(seg1Len).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[1]).length), String(16));
      const seg1BytesLen: number = decodeB64(result.split('|')[1]).length;
      expect(seg1BytesLen).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result.split('|')[1]).length % 16 === 0));
      expect(decodeB64(result.split('|')[1]).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0341 end');
    });

    /**
     * @tc.name   testOldKeySeq0342
     * @tc.number SUB_Huks_OKSQ_0342
     * @tc.desc   状态：E 链 9 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0342', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0342 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'e'.repeat(9);
      const mode: string = 'E';
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
        String(result.split('|')[1].length), String(24));
      const seg1Len: number = result.split('|')[1].length;
      expect(seg1Len).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[1]).length), String(16));
      const seg1BytesLen: number = decodeB64(result.split('|')[1]).length;
      expect(seg1BytesLen).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result.split('|')[1]).length % 16 === 0));
      expect(decodeB64(result.split('|')[1]).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0342 end');
    });

    /**
     * @tc.name   testOldKeySeq0343
     * @tc.number SUB_Huks_OKSQ_0343
     * @tc.desc   状态：E 链 10 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0343', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0343 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'e'.repeat(10);
      const mode: string = 'E';
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
        String(result.split('|')[1].length), String(24));
      const seg1Len: number = result.split('|')[1].length;
      expect(seg1Len).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[1]).length), String(16));
      const seg1BytesLen: number = decodeB64(result.split('|')[1]).length;
      expect(seg1BytesLen).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result.split('|')[1]).length % 16 === 0));
      expect(decodeB64(result.split('|')[1]).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0343 end');
    });

    /**
     * @tc.name   testOldKeySeq0344
     * @tc.number SUB_Huks_OKSQ_0344
     * @tc.desc   状态：EE 链 11 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0344', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0344 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'e'.repeat(11);
      const mode: string = 'EE';
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[1] === result.split('|')[2]));
      expect(result.split('|')[1] === result.split('|')[2]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(24));
      const seg1Len: number = result.split('|')[1].length;
      expect(seg1Len).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[1]).length), String(16));
      const seg1BytesLen: number = decodeB64(result.split('|')[1]).length;
      expect(seg1BytesLen).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0344 end');
    });

    /**
     * @tc.name   testOldKeySeq0345
     * @tc.number SUB_Huks_OKSQ_0345
     * @tc.desc   状态：EE 链 12 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0345', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0345 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'e'.repeat(12);
      const mode: string = 'EE';
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[1] === result.split('|')[2]));
      expect(result.split('|')[1] === result.split('|')[2]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(24));
      const seg1Len: number = result.split('|')[1].length;
      expect(seg1Len).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[1]).length), String(16));
      const seg1BytesLen: number = decodeB64(result.split('|')[1]).length;
      expect(seg1BytesLen).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0345 end');
    });

    /**
     * @tc.name   testOldKeySeq0346
     * @tc.number SUB_Huks_OKSQ_0346
     * @tc.desc   状态：EE 链 13 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0346', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0346 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'e'.repeat(13);
      const mode: string = 'EE';
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[1] === result.split('|')[2]));
      expect(result.split('|')[1] === result.split('|')[2]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(24));
      const seg1Len: number = result.split('|')[1].length;
      expect(seg1Len).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[1]).length), String(16));
      const seg1BytesLen: number = decodeB64(result.split('|')[1]).length;
      expect(seg1BytesLen).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0346 end');
    });

    /**
     * @tc.name   testOldKeySeq0347
     * @tc.number SUB_Huks_OKSQ_0347
     * @tc.desc   状态：EE 链 14 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0347', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0347 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'e'.repeat(14);
      const mode: string = 'EE';
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[1] === result.split('|')[2]));
      expect(result.split('|')[1] === result.split('|')[2]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(24));
      const seg1Len: number = result.split('|')[1].length;
      expect(seg1Len).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[1]).length), String(16));
      const seg1BytesLen: number = decodeB64(result.split('|')[1]).length;
      expect(seg1BytesLen).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0347 end');
    });

    /**
     * @tc.name   testOldKeySeq0348
     * @tc.number SUB_Huks_OKSQ_0348
     * @tc.desc   状态：EE 链 15 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0348', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0348 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'e'.repeat(15);
      const mode: string = 'EE';
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[1] === result.split('|')[2]));
      expect(result.split('|')[1] === result.split('|')[2]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(24));
      const seg1Len: number = result.split('|')[1].length;
      expect(seg1Len).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[1]).length), String(16));
      const seg1BytesLen: number = decodeB64(result.split('|')[1]).length;
      expect(seg1BytesLen).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0348 end');
    });

    /**
     * @tc.name   testOldKeySeq0349
     * @tc.number SUB_Huks_OKSQ_0349
     * @tc.desc   状态：EE 链 16 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0349', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0349 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'e'.repeat(16);
      const mode: string = 'EE';
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[1] === result.split('|')[2]));
      expect(result.split('|')[1] === result.split('|')[2]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(44));
      const seg1Len: number = result.split('|')[1].length;
      expect(seg1Len).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[1]).length), String(32));
      const seg1BytesLen: number = decodeB64(result.split('|')[1]).length;
      expect(seg1BytesLen).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0349 end');
    });

    /**
     * @tc.name   testOldKeySeq0350
     * @tc.number SUB_Huks_OKSQ_0350
     * @tc.desc   状态：EE 链 17 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0350 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'e'.repeat(17);
      const mode: string = 'EE';
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[1] === result.split('|')[2]));
      expect(result.split('|')[1] === result.split('|')[2]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(44));
      const seg1Len: number = result.split('|')[1].length;
      expect(seg1Len).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[1]).length), String(32));
      const seg1BytesLen: number = decodeB64(result.split('|')[1]).length;
      expect(seg1BytesLen).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0350 end');
    });

    /**
     * @tc.name   testOldKeySeq0351
     * @tc.number SUB_Huks_OKSQ_0351
     * @tc.desc   状态：EE 链 18 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0351', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0351 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'e'.repeat(18);
      const mode: string = 'EE';
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[1] === result.split('|')[2]));
      expect(result.split('|')[1] === result.split('|')[2]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(44));
      const seg1Len: number = result.split('|')[1].length;
      expect(seg1Len).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[1]).length), String(32));
      const seg1BytesLen: number = decodeB64(result.split('|')[1]).length;
      expect(seg1BytesLen).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0351 end');
    });

    /**
     * @tc.name   testOldKeySeq0352
     * @tc.number SUB_Huks_OKSQ_0352
     * @tc.desc   状态：EE 链 19 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0352', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0352 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'e'.repeat(19);
      const mode: string = 'EE';
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[1] === result.split('|')[2]));
      expect(result.split('|')[1] === result.split('|')[2]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(44));
      const seg1Len: number = result.split('|')[1].length;
      expect(seg1Len).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[1]).length), String(32));
      const seg1BytesLen: number = decodeB64(result.split('|')[1]).length;
      expect(seg1BytesLen).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0352 end');
    });

    /**
     * @tc.name   testOldKeySeq0353
     * @tc.number SUB_Huks_OKSQ_0353
     * @tc.desc   状态：EE 链 20 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0353', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0353 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'e'.repeat(20);
      const mode: string = 'EE';
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[1] === result.split('|')[2]));
      expect(result.split('|')[1] === result.split('|')[2]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(44));
      const seg1Len: number = result.split('|')[1].length;
      expect(seg1Len).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[1]).length), String(32));
      const seg1BytesLen: number = decodeB64(result.split('|')[1]).length;
      expect(seg1BytesLen).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0353 end');
    });


    /**
     * @tc.name   testOldKeySeq0354
     * @tc.number SUB_Huks_OKSQ_0354
     * @tc.desc   EE 双加密手写：21 字符补块 32、base64 44，两次密文相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0354', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0354 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'e'.repeat(21);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptDataUserOldKey(plain, (c1: string) => {
          model.encryptDataUserOldKey(plain, (c2: string) => {
            resolve(c1 + '|' + c2);
          });
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] === result.split('|')[1]));
      expect(result.split('|')[0] === result.split('|')[1]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(44));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(32));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0354 end');
    });

  });
}
