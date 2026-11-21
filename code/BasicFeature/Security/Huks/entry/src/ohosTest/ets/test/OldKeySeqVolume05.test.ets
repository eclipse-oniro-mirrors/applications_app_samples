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

export default function oldKeySeqVolume05Test() {
  describe('OldKeySeqVolume05', () => {

    /**
     * @tc.name   testOldKeySeq0214
     * @tc.number SUB_Huks_OKSQ_0214
     * @tc.desc   边界：1 字符补满一个填充块
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0214 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(1);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(24));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(16));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0214 end');
    });

    /**
     * @tc.name   testOldKeySeq0215
     * @tc.number SUB_Huks_OKSQ_0215
     * @tc.desc   边界：1 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0215 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(1);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(24));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(16));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0215 end');
    });

    /**
     * @tc.name   testOldKeySeq0216
     * @tc.number SUB_Huks_OKSQ_0216
     * @tc.desc   边界：2 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0216 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(2);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(24));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(16));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0216 end');
    });

    /**
     * @tc.name   testOldKeySeq0217
     * @tc.number SUB_Huks_OKSQ_0217
     * @tc.desc   边界：3 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0217 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(3);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(24));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(16));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0217 end');
    });

    /**
     * @tc.name   testOldKeySeq0218
     * @tc.number SUB_Huks_OKSQ_0218
     * @tc.desc   边界：4 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0218 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(4);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(24));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(16));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0218 end');
    });

    /**
     * @tc.name   testOldKeySeq0219
     * @tc.number SUB_Huks_OKSQ_0219
     * @tc.desc   边界：5 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0219 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(5);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(24));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(16));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0219 end');
    });

    /**
     * @tc.name   testOldKeySeq0220
     * @tc.number SUB_Huks_OKSQ_0220
     * @tc.desc   边界：14 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0220 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(14);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(24));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(16));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0220 end');
    });

    /**
     * @tc.name   testOldKeySeq0221
     * @tc.number SUB_Huks_OKSQ_0221
     * @tc.desc   边界：15 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0221 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(15);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(24));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(16));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0221 end');
    });

    /**
     * @tc.name   testOldKeySeq0222
     * @tc.number SUB_Huks_OKSQ_0222
     * @tc.desc   边界：16 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0222 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(16);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0222 end');
    });

    /**
     * @tc.name   testOldKeySeq0223
     * @tc.number SUB_Huks_OKSQ_0223
     * @tc.desc   边界：17 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0223 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(17);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0223 end');
    });

    /**
     * @tc.name   testOldKeySeq0224
     * @tc.number SUB_Huks_OKSQ_0224
     * @tc.desc   边界：18 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0224 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(18);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0224 end');
    });

    /**
     * @tc.name   testOldKeySeq0225
     * @tc.number SUB_Huks_OKSQ_0225
     * @tc.desc   边界：19 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0225 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(19);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0225 end');
    });

    /**
     * @tc.name   testOldKeySeq0226
     * @tc.number SUB_Huks_OKSQ_0226
     * @tc.desc   边界：20 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0226 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(20);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0226 end');
    });

    /**
     * @tc.name   testOldKeySeq0227
     * @tc.number SUB_Huks_OKSQ_0227
     * @tc.desc   边界：21 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0227 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(21);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0227 end');
    });

    /**
     * @tc.name   testOldKeySeq0228
     * @tc.number SUB_Huks_OKSQ_0228
     * @tc.desc   边界：22 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0228 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(22);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0228 end');
    });

    /**
     * @tc.name   testOldKeySeq0229
     * @tc.number SUB_Huks_OKSQ_0229
     * @tc.desc   边界：23 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0229 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(23);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0229 end');
    });

    /**
     * @tc.name   testOldKeySeq0230
     * @tc.number SUB_Huks_OKSQ_0230
     * @tc.desc   边界：31 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0230 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(31);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0230 end');
    });

    /**
     * @tc.name   testOldKeySeq0231
     * @tc.number SUB_Huks_OKSQ_0231
     * @tc.desc   边界：32 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0231 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(32);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0231 end');
    });

    /**
     * @tc.name   testOldKeySeq0232
     * @tc.number SUB_Huks_OKSQ_0232
     * @tc.desc   边界：33 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0232 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(33);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0232 end');
    });

    /**
     * @tc.name   testOldKeySeq0233
     * @tc.number SUB_Huks_OKSQ_0233
     * @tc.desc   边界：47 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0233 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(47);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0233 end');
    });

    /**
     * @tc.name   testOldKeySeq0234
     * @tc.number SUB_Huks_OKSQ_0234
     * @tc.desc   边界：48 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0234 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(48);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0234 end');
    });

    /**
     * @tc.name   testOldKeySeq0235
     * @tc.number SUB_Huks_OKSQ_0235
     * @tc.desc   边界：49 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0235 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(49);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0235 end');
    });

    /**
     * @tc.name   testOldKeySeq0236
     * @tc.number SUB_Huks_OKSQ_0236
     * @tc.desc   边界：62 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0236 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(62);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0236 end');
    });

    /**
     * @tc.name   testOldKeySeq0237
     * @tc.number SUB_Huks_OKSQ_0237
     * @tc.desc   边界：63 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0237 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(63);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0237 end');
    });

    /**
     * @tc.name   testOldKeySeq0238
     * @tc.number SUB_Huks_OKSQ_0238
     * @tc.desc   边界：64 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0238 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(64);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0238 end');
    });

    /**
     * @tc.name   testOldKeySeq0239
     * @tc.number SUB_Huks_OKSQ_0239
     * @tc.desc   边界：65 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0239 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(65);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0239 end');
    });

    /**
     * @tc.name   testOldKeySeq0240
     * @tc.number SUB_Huks_OKSQ_0240
     * @tc.desc   边界：66 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0240 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(66);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0240 end');
    });

    /**
     * @tc.name   testOldKeySeq0241
     * @tc.number SUB_Huks_OKSQ_0241
     * @tc.desc   边界：95 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0241 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(95);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0241 end');
    });

    /**
     * @tc.name   testOldKeySeq0242
     * @tc.number SUB_Huks_OKSQ_0242
     * @tc.desc   边界：96 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0242 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(96);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0242 end');
    });

    /**
     * @tc.name   testOldKeySeq0243
     * @tc.number SUB_Huks_OKSQ_0243
     * @tc.desc   边界：97 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0243 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(97);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0243 end');
    });

    /**
     * @tc.name   testOldKeySeq0244
     * @tc.number SUB_Huks_OKSQ_0244
     * @tc.desc   边界：127 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0244 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(127);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0244 end');
    });

    /**
     * @tc.name   testOldKeySeq0245
     * @tc.number SUB_Huks_OKSQ_0245
     * @tc.desc   边界：128 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0245 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(128);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0245 end');
    });

    /**
     * @tc.name   testOldKeySeq0246
     * @tc.number SUB_Huks_OKSQ_0246
     * @tc.desc   边界：129 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0246 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(129);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0246 end');
    });

    /**
     * @tc.name   testOldKeySeq0247
     * @tc.number SUB_Huks_OKSQ_0247
     * @tc.desc   边界：130 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0247 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(130);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0247 end');
    });

    /**
     * @tc.name   testOldKeySeq0248
     * @tc.number SUB_Huks_OKSQ_0248
     * @tc.desc   边界：254 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0248 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(254);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(344));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(344);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(256));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(256);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0248 end');
    });

    /**
     * @tc.name   testOldKeySeq0249
     * @tc.number SUB_Huks_OKSQ_0249
     * @tc.desc   边界：255 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0249 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(255);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(344));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(344);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(256));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(256);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0249 end');
    });

    /**
     * @tc.name   testOldKeySeq0250
     * @tc.number SUB_Huks_OKSQ_0250
     * @tc.desc   边界：256 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0250 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(256);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0250 end');
    });

    /**
     * @tc.name   testOldKeySeq0251
     * @tc.number SUB_Huks_OKSQ_0251
     * @tc.desc   边界：257 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0251 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(257);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0251 end');
    });

    /**
     * @tc.name   testOldKeySeq0252
     * @tc.number SUB_Huks_OKSQ_0252
     * @tc.desc   边界：258 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0252 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(258);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0252 end');
    });

    /**
     * @tc.name   testOldKeySeq0253
     * @tc.number SUB_Huks_OKSQ_0253
     * @tc.desc   边界：510 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0253 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(510);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(684));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(684);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(512));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(512);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0253 end');
    });

    /**
     * @tc.name   testOldKeySeq0254
     * @tc.number SUB_Huks_OKSQ_0254
     * @tc.desc   边界：511 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0254 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(511);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(684));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(684);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(512));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(512);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0254 end');
    });

    /**
     * @tc.name   testOldKeySeq0255
     * @tc.number SUB_Huks_OKSQ_0255
     * @tc.desc   边界：512 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0255 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(512);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0255 end');
    });

    /**
     * @tc.name   testOldKeySeq0256
     * @tc.number SUB_Huks_OKSQ_0256
     * @tc.desc   边界：513 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0256 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(513);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0256 end');
    });

    /**
     * @tc.name   testOldKeySeq0257
     * @tc.number SUB_Huks_OKSQ_0257
     * @tc.desc   边界：514 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0257 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(514);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0257 end');
    });

    /**
     * @tc.name   testOldKeySeq0258
     * @tc.number SUB_Huks_OKSQ_0258
     * @tc.desc   边界：766 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0258 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(766);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1024));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1024);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(768));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0258 end');
    });

    /**
     * @tc.name   testOldKeySeq0259
     * @tc.number SUB_Huks_OKSQ_0259
     * @tc.desc   边界：767 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0259 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(767);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1024));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1024);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(768));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0259 end');
    });

    /**
     * @tc.name   testOldKeySeq0260
     * @tc.number SUB_Huks_OKSQ_0260
     * @tc.desc   边界：768 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0260 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(768);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0260 end');
    });

    /**
     * @tc.name   testOldKeySeq0261
     * @tc.number SUB_Huks_OKSQ_0261
     * @tc.desc   边界：769 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0261 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(769);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0261 end');
    });

    /**
     * @tc.name   testOldKeySeq0262
     * @tc.number SUB_Huks_OKSQ_0262
     * @tc.desc   边界：1021 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0262 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(1021);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1368));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1368);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1024));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1024);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0262 end');
    });

    /**
     * @tc.name   testOldKeySeq0263
     * @tc.number SUB_Huks_OKSQ_0263
     * @tc.desc   边界：1022 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0263 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(1022);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1368));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1368);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1024));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1024);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0263 end');
    });

    /**
     * @tc.name   testOldKeySeq0264
     * @tc.number SUB_Huks_OKSQ_0264
     * @tc.desc   边界：1023 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0264 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(1023);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1368));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1368);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1024));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1024);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0264 end');
    });

    /**
     * @tc.name   testOldKeySeq0265
     * @tc.number SUB_Huks_OKSQ_0265
     * @tc.desc   边界：1024 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0265 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(1024);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0265 end');
    });

    /**
     * @tc.name   testOldKeySeq0266
     * @tc.number SUB_Huks_OKSQ_0266
     * @tc.desc   边界：1025 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0266 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(1025);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0266 end');
    });

    /**
     * @tc.name   testOldKeySeq0267
     * @tc.number SUB_Huks_OKSQ_0267
     * @tc.desc   边界：1026 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0267 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(1026);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0267 end');
    });

    /**
     * @tc.name   testOldKeySeq0268
     * @tc.number SUB_Huks_OKSQ_0268
     * @tc.desc   非法：符号与空白混合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0268 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '   ';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(24));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(16));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0268 end');
    });

    /**
     * @tc.name   testOldKeySeq0269
     * @tc.number SUB_Huks_OKSQ_0269
     * @tc.desc   非法：符号与空白混合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0269 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '!@#$%^&*()';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(24));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(16));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0269 end');
    });

    /**
     * @tc.name   testOldKeySeq0270
     * @tc.number SUB_Huks_OKSQ_0270
     * @tc.desc   非法：符号与空白混合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0270 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a b c d e';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(24));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(16));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0270 end');
    });

    /**
     * @tc.name   testOldKeySeq0271
     * @tc.number SUB_Huks_OKSQ_0271
     * @tc.desc   非法：符号与空白混合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0271', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0271 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '<tag>&"quoted"';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(24));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(16));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0271 end');
    });

    /**
     * @tc.name   testOldKeySeq0272
     * @tc.number SUB_Huks_OKSQ_0272
     * @tc.desc   非法：符号与空白混合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0272', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0272 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ' 中 emoji 😀';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(24));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(16));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0272 end');
    });


    /**
     * @tc.name   testOldKeySeq0273
     * @tc.number SUB_Huks_OKSQ_0273
     * @tc.desc   2048 字符补块边界：密文 2064 字节、base64 2752
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0273', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0273 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'p'.repeat(2048);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptDataUserOldKey(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2752));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(2752);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(2064));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(2064);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0273 end');
    });

  });
}
