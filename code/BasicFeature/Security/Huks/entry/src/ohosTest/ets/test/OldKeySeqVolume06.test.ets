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

export default function oldKeySeqVolume06Test() {
  describe('OldKeySeqVolume06', () => {

    /**
     * @tc.name   testOldKeySeq0274
     * @tc.number SUB_Huks_OKSQ_0274
     * @tc.desc   边界：1 个汉字取低 8 位共 1 字节，PKCS7 补块到 16 字节，base64 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0274', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0274 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(1);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0274 end');
    });

    /**
     * @tc.name   testOldKeySeq0275
     * @tc.number SUB_Huks_OKSQ_0275
     * @tc.desc   边界：2 个汉字取低 8 位共 2 字节，PKCS7 补块到 16 字节，base64 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0275', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0275 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(2);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0275 end');
    });

    /**
     * @tc.name   testOldKeySeq0276
     * @tc.number SUB_Huks_OKSQ_0276
     * @tc.desc   边界：3 个汉字取低 8 位共 3 字节，PKCS7 补块到 16 字节，base64 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0276', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0276 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(3);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0276 end');
    });

    /**
     * @tc.name   testOldKeySeq0277
     * @tc.number SUB_Huks_OKSQ_0277
     * @tc.desc   边界：4 个汉字取低 8 位共 4 字节，PKCS7 补块到 16 字节，base64 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0277', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0277 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(4);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0277 end');
    });

    /**
     * @tc.name   testOldKeySeq0278
     * @tc.number SUB_Huks_OKSQ_0278
     * @tc.desc   边界：5 个汉字取低 8 位共 5 字节，PKCS7 补块到 16 字节，base64 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0278', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0278 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(5);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0278 end');
    });

    /**
     * @tc.name   testOldKeySeq0279
     * @tc.number SUB_Huks_OKSQ_0279
     * @tc.desc   边界：6 个汉字取低 8 位共 6 字节，PKCS7 补块到 16 字节，base64 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0279', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0279 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(6);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0279 end');
    });

    /**
     * @tc.name   testOldKeySeq0280
     * @tc.number SUB_Huks_OKSQ_0280
     * @tc.desc   边界：7 个汉字取低 8 位共 7 字节，PKCS7 补块到 16 字节，base64 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0280 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(7);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0280 end');
    });

    /**
     * @tc.name   testOldKeySeq0281
     * @tc.number SUB_Huks_OKSQ_0281
     * @tc.desc   边界：8 个汉字取低 8 位共 8 字节，PKCS7 补块到 16 字节，base64 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0281', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0281 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(8);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0281 end');
    });

    /**
     * @tc.name   testOldKeySeq0282
     * @tc.number SUB_Huks_OKSQ_0282
     * @tc.desc   边界：9 个汉字取低 8 位共 9 字节，PKCS7 补块到 16 字节，base64 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0282', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0282 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(9);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0282 end');
    });

    /**
     * @tc.name   testOldKeySeq0283
     * @tc.number SUB_Huks_OKSQ_0283
     * @tc.desc   边界：10 个汉字取低 8 位共 10 字节，PKCS7 补块到 16 字节，base64 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0283', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0283 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(10);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0283 end');
    });

    /**
     * @tc.name   testOldKeySeq0284
     * @tc.number SUB_Huks_OKSQ_0284
     * @tc.desc   边界：11 个汉字取低 8 位共 11 字节，PKCS7 补块到 16 字节，base64 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0284', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0284 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(11);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0284 end');
    });

    /**
     * @tc.name   testOldKeySeq0285
     * @tc.number SUB_Huks_OKSQ_0285
     * @tc.desc   边界：12 个汉字取低 8 位共 12 字节，PKCS7 补块到 16 字节，base64 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0285', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0285 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(12);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0285 end');
    });

    /**
     * @tc.name   testOldKeySeq0286
     * @tc.number SUB_Huks_OKSQ_0286
     * @tc.desc   边界：13 个汉字取低 8 位共 13 字节，PKCS7 补块到 16 字节，base64 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0286', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0286 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(13);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0286 end');
    });

    /**
     * @tc.name   testOldKeySeq0287
     * @tc.number SUB_Huks_OKSQ_0287
     * @tc.desc   边界：14 个汉字取低 8 位共 14 字节，PKCS7 补块到 16 字节，base64 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0287', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0287 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(14);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0287 end');
    });

    /**
     * @tc.name   testOldKeySeq0288
     * @tc.number SUB_Huks_OKSQ_0288
     * @tc.desc   边界：15 个汉字取低 8 位共 15 字节，PKCS7 补块到 16 字节，base64 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0288', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0288 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(15);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0288 end');
    });

    /**
     * @tc.name   testOldKeySeq0289
     * @tc.number SUB_Huks_OKSQ_0289
     * @tc.desc   边界：16 个汉字取低 8 位共 16 字节，PKCS7 补块到 32 字节，base64 44
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0289', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0289 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(16);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0289 end');
    });

    /**
     * @tc.name   testOldKeySeq0290
     * @tc.number SUB_Huks_OKSQ_0290
     * @tc.desc   边界：17 个汉字取低 8 位共 17 字节，PKCS7 补块到 32 字节，base64 44
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0290 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(17);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0290 end');
    });

    /**
     * @tc.name   testOldKeySeq0291
     * @tc.number SUB_Huks_OKSQ_0291
     * @tc.desc   边界：18 个汉字取低 8 位共 18 字节，PKCS7 补块到 32 字节，base64 44
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0291', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0291 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(18);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0291 end');
    });

    /**
     * @tc.name   testOldKeySeq0292
     * @tc.number SUB_Huks_OKSQ_0292
     * @tc.desc   边界：19 个汉字取低 8 位共 19 字节，PKCS7 补块到 32 字节，base64 44
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0292', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0292 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(19);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0292 end');
    });

    /**
     * @tc.name   testOldKeySeq0293
     * @tc.number SUB_Huks_OKSQ_0293
     * @tc.desc   边界：20 个汉字取低 8 位共 20 字节，PKCS7 补块到 32 字节，base64 44
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0293', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0293 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(20);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0293 end');
    });

    /**
     * @tc.name   testOldKeySeq0294
     * @tc.number SUB_Huks_OKSQ_0294
     * @tc.desc   边界：1 个 emoji 共 2 个 UTF-16 单元取低 8 位，PKCS7 补块到 16 字节，base64 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0294', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0294 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '😀'.repeat(1);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0294 end');
    });

    /**
     * @tc.name   testOldKeySeq0295
     * @tc.number SUB_Huks_OKSQ_0295
     * @tc.desc   边界：2 个 emoji 共 4 个 UTF-16 单元取低 8 位，PKCS7 补块到 16 字节，base64 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0295', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0295 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '😀'.repeat(2);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0295 end');
    });

    /**
     * @tc.name   testOldKeySeq0296
     * @tc.number SUB_Huks_OKSQ_0296
     * @tc.desc   边界：3 个 emoji 共 6 个 UTF-16 单元取低 8 位，PKCS7 补块到 16 字节，base64 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0296', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0296 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '😀'.repeat(3);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0296 end');
    });

    /**
     * @tc.name   testOldKeySeq0297
     * @tc.number SUB_Huks_OKSQ_0297
     * @tc.desc   边界：4 个 emoji 共 8 个 UTF-16 单元取低 8 位，PKCS7 补块到 16 字节，base64 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0297', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0297 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '😀'.repeat(4);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0297 end');
    });

    /**
     * @tc.name   testOldKeySeq0298
     * @tc.number SUB_Huks_OKSQ_0298
     * @tc.desc   边界：5 个 emoji 共 10 个 UTF-16 单元取低 8 位，PKCS7 补块到 16 字节，base64 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0298', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0298 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '😀'.repeat(5);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0298 end');
    });

    /**
     * @tc.name   testOldKeySeq0299
     * @tc.number SUB_Huks_OKSQ_0299
     * @tc.desc   边界：6 个 emoji 共 12 个 UTF-16 单元取低 8 位，PKCS7 补块到 16 字节，base64 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0299', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0299 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '😀'.repeat(6);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0299 end');
    });

    /**
     * @tc.name   testOldKeySeq0300
     * @tc.number SUB_Huks_OKSQ_0300
     * @tc.desc   边界：7 个 emoji 共 14 个 UTF-16 单元取低 8 位，PKCS7 补块到 16 字节，base64 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0300 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '😀'.repeat(7);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0300 end');
    });

    /**
     * @tc.name   testOldKeySeq0301
     * @tc.number SUB_Huks_OKSQ_0301
     * @tc.desc   边界：8 个 emoji 共 16 个 UTF-16 单元取低 8 位，PKCS7 补块到 32 字节，base64 44
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0301 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '😀'.repeat(8);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0301 end');
    });

    /**
     * @tc.name   testOldKeySeq0302
     * @tc.number SUB_Huks_OKSQ_0302
     * @tc.desc   边界：9 个 emoji 共 18 个 UTF-16 单元取低 8 位，PKCS7 补块到 32 字节，base64 44
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0302 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '😀'.repeat(9);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0302 end');
    });

    /**
     * @tc.name   testOldKeySeq0303
     * @tc.number SUB_Huks_OKSQ_0303
     * @tc.desc   边界：10 个 emoji 共 20 个 UTF-16 单元取低 8 位，PKCS7 补块到 32 字节，base64 44
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0303', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0303 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '😀'.repeat(10);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0303 end');
    });

    /**
     * @tc.name   testOldKeySeq0304
     * @tc.number SUB_Huks_OKSQ_0304
     * @tc.desc   组合：1 组 ASCII、汉字与 emoji 混合，共 4 个 UTF-16 单元取低 8 位，PKCS7 补块到 16 字节，base64 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0304', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0304 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('a中😀').repeat(1);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0304 end');
    });

    /**
     * @tc.name   testOldKeySeq0305
     * @tc.number SUB_Huks_OKSQ_0305
     * @tc.desc   组合：2 组 ASCII、汉字与 emoji 混合，共 8 个 UTF-16 单元取低 8 位，PKCS7 补块到 16 字节，base64 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0305', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0305 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('a中😀').repeat(2);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0305 end');
    });

    /**
     * @tc.name   testOldKeySeq0306
     * @tc.number SUB_Huks_OKSQ_0306
     * @tc.desc   组合：3 组 ASCII、汉字与 emoji 混合，共 12 个 UTF-16 单元取低 8 位，PKCS7 补块到 16 字节，base64 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0306', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0306 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('a中😀').repeat(3);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0306 end');
    });

    /**
     * @tc.name   testOldKeySeq0307
     * @tc.number SUB_Huks_OKSQ_0307
     * @tc.desc   组合：4 组 ASCII、汉字与 emoji 混合，共 16 个 UTF-16 单元取低 8 位，PKCS7 补块到 32 字节，base64 44
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0307', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0307 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('a中😀').repeat(4);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0307 end');
    });

    /**
     * @tc.name   testOldKeySeq0308
     * @tc.number SUB_Huks_OKSQ_0308
     * @tc.desc   组合：5 组 ASCII、汉字与 emoji 混合，共 20 个 UTF-16 单元取低 8 位，PKCS7 补块到 32 字节，base64 44
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0308', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0308 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('a中😀').repeat(5);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0308 end');
    });

    /**
     * @tc.name   testOldKeySeq0309
     * @tc.number SUB_Huks_OKSQ_0309
     * @tc.desc   组合：6 组 ASCII、汉字与 emoji 混合，共 24 个 UTF-16 单元取低 8 位，PKCS7 补块到 32 字节，base64 44
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0309', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0309 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('a中😀').repeat(6);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0309 end');
    });

    /**
     * @tc.name   testOldKeySeq0310
     * @tc.number SUB_Huks_OKSQ_0310
     * @tc.desc   组合：7 组 ASCII、汉字与 emoji 混合，共 28 个 UTF-16 单元取低 8 位，PKCS7 补块到 32 字节，base64 44
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0310 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('a中😀').repeat(7);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0310 end');
    });

    /**
     * @tc.name   testOldKeySeq0311
     * @tc.number SUB_Huks_OKSQ_0311
     * @tc.desc   组合：8 组 ASCII、汉字与 emoji 混合，共 32 个 UTF-16 单元取低 8 位，PKCS7 补块到 48 字节，base64 64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0311', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0311 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('a中😀').repeat(8);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0311 end');
    });

    /**
     * @tc.name   testOldKeySeq0312
     * @tc.number SUB_Huks_OKSQ_0312
     * @tc.desc   组合：9 组 ASCII、汉字与 emoji 混合，共 36 个 UTF-16 单元取低 8 位，PKCS7 补块到 48 字节，base64 64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0312', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0312 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('a中😀').repeat(9);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0312 end');
    });

    /**
     * @tc.name   testOldKeySeq0313
     * @tc.number SUB_Huks_OKSQ_0313
     * @tc.desc   组合：10 组 ASCII、汉字与 emoji 混合，共 40 个 UTF-16 单元取低 8 位，PKCS7 补块到 48 字节，base64 64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0313', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0313 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('a中😀').repeat(10);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0313 end');
    });

    /**
     * @tc.name   testOldKeySeq0314
     * @tc.number SUB_Huks_OKSQ_0314
     * @tc.desc   组合：1 组以 emoji 开头的汉字与 ASCII 混合，共 4 个 UTF-16 单元取低 8 位，PKCS7 补块到 16 字节，base64 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0314', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0314 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('😀a中').repeat(1);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0314 end');
    });

    /**
     * @tc.name   testOldKeySeq0315
     * @tc.number SUB_Huks_OKSQ_0315
     * @tc.desc   组合：2 组以 emoji 开头的汉字与 ASCII 混合，共 8 个 UTF-16 单元取低 8 位，PKCS7 补块到 16 字节，base64 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0315', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0315 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('😀a中').repeat(2);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0315 end');
    });

    /**
     * @tc.name   testOldKeySeq0316
     * @tc.number SUB_Huks_OKSQ_0316
     * @tc.desc   组合：3 组以 emoji 开头的汉字与 ASCII 混合，共 12 个 UTF-16 单元取低 8 位，PKCS7 补块到 16 字节，base64 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0316', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0316 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('😀a中').repeat(3);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0316 end');
    });

    /**
     * @tc.name   testOldKeySeq0317
     * @tc.number SUB_Huks_OKSQ_0317
     * @tc.desc   组合：4 组以 emoji 开头的汉字与 ASCII 混合，共 16 个 UTF-16 单元取低 8 位，PKCS7 补块到 32 字节，base64 44
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0317', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0317 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('😀a中').repeat(4);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0317 end');
    });

    /**
     * @tc.name   testOldKeySeq0318
     * @tc.number SUB_Huks_OKSQ_0318
     * @tc.desc   组合：5 组以 emoji 开头的汉字与 ASCII 混合，共 20 个 UTF-16 单元取低 8 位，PKCS7 补块到 32 字节，base64 44
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0318', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0318 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('😀a中').repeat(5);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0318 end');
    });

    /**
     * @tc.name   testOldKeySeq0319
     * @tc.number SUB_Huks_OKSQ_0319
     * @tc.desc   组合：6 组以 emoji 开头的汉字与 ASCII 混合，共 24 个 UTF-16 单元取低 8 位，PKCS7 补块到 32 字节，base64 44
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0319', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0319 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('😀a中').repeat(6);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0319 end');
    });

    /**
     * @tc.name   testOldKeySeq0320
     * @tc.number SUB_Huks_OKSQ_0320
     * @tc.desc   组合：7 组以 emoji 开头的汉字与 ASCII 混合，共 28 个 UTF-16 单元取低 8 位，PKCS7 补块到 32 字节，base64 44
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0320 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('😀a中').repeat(7);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0320 end');
    });

    /**
     * @tc.name   testOldKeySeq0321
     * @tc.number SUB_Huks_OKSQ_0321
     * @tc.desc   组合：8 组以 emoji 开头的汉字与 ASCII 混合，共 32 个 UTF-16 单元取低 8 位，PKCS7 补块到 48 字节，base64 64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0321', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0321 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('😀a中').repeat(8);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0321 end');
    });

    /**
     * @tc.name   testOldKeySeq0322
     * @tc.number SUB_Huks_OKSQ_0322
     * @tc.desc   组合：9 组以 emoji 开头的汉字与 ASCII 混合，共 36 个 UTF-16 单元取低 8 位，PKCS7 补块到 48 字节，base64 64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0322', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0322 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('😀a中').repeat(9);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0322 end');
    });

    /**
     * @tc.name   testOldKeySeq0323
     * @tc.number SUB_Huks_OKSQ_0323
     * @tc.desc   组合：10 组以 emoji 开头的汉字与 ASCII 混合，共 40 个 UTF-16 单元取低 8 位，PKCS7 补块到 48 字节，base64 64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0323', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0323 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('😀a中').repeat(10);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0323 end');
    });

    /**
     * @tc.name   testOldKeySeq0324
     * @tc.number SUB_Huks_OKSQ_0324
     * @tc.desc   组合：1 组以汉字开头的 emoji 与 ASCII 混合，共 4 个 UTF-16 单元取低 8 位，PKCS7 补块到 16 字节，base64 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0324', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0324 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('中a😀').repeat(1);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0324 end');
    });

    /**
     * @tc.name   testOldKeySeq0325
     * @tc.number SUB_Huks_OKSQ_0325
     * @tc.desc   组合：2 组以汉字开头的 emoji 与 ASCII 混合，共 8 个 UTF-16 单元取低 8 位，PKCS7 补块到 16 字节，base64 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0325', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0325 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('中a😀').repeat(2);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0325 end');
    });

    /**
     * @tc.name   testOldKeySeq0326
     * @tc.number SUB_Huks_OKSQ_0326
     * @tc.desc   组合：3 组以汉字开头的 emoji 与 ASCII 混合，共 12 个 UTF-16 单元取低 8 位，PKCS7 补块到 16 字节，base64 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0326', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0326 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('中a😀').repeat(3);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0326 end');
    });

    /**
     * @tc.name   testOldKeySeq0327
     * @tc.number SUB_Huks_OKSQ_0327
     * @tc.desc   组合：4 组以汉字开头的 emoji 与 ASCII 混合，共 16 个 UTF-16 单元取低 8 位，PKCS7 补块到 32 字节，base64 44
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0327', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0327 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('中a😀').repeat(4);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0327 end');
    });

    /**
     * @tc.name   testOldKeySeq0328
     * @tc.number SUB_Huks_OKSQ_0328
     * @tc.desc   组合：5 组以汉字开头的 emoji 与 ASCII 混合，共 20 个 UTF-16 单元取低 8 位，PKCS7 补块到 32 字节，base64 44
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0328', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0328 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('中a😀').repeat(5);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0328 end');
    });

    /**
     * @tc.name   testOldKeySeq0329
     * @tc.number SUB_Huks_OKSQ_0329
     * @tc.desc   组合：6 组以汉字开头的 emoji 与 ASCII 混合，共 24 个 UTF-16 单元取低 8 位，PKCS7 补块到 32 字节，base64 44
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0329', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0329 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('中a😀').repeat(6);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0329 end');
    });

    /**
     * @tc.name   testOldKeySeq0330
     * @tc.number SUB_Huks_OKSQ_0330
     * @tc.desc   组合：7 组以汉字开头的 emoji 与 ASCII 混合，共 28 个 UTF-16 单元取低 8 位，PKCS7 补块到 32 字节，base64 44
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0330 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('中a😀').repeat(7);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0330 end');
    });

    /**
     * @tc.name   testOldKeySeq0331
     * @tc.number SUB_Huks_OKSQ_0331
     * @tc.desc   组合：8 组以汉字开头的 emoji 与 ASCII 混合，共 32 个 UTF-16 单元取低 8 位，PKCS7 补块到 48 字节，base64 64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0331', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0331 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('中a😀').repeat(8);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0331 end');
    });

    /**
     * @tc.name   testOldKeySeq0332
     * @tc.number SUB_Huks_OKSQ_0332
     * @tc.desc   组合：9 组以汉字开头的 emoji 与 ASCII 混合，共 36 个 UTF-16 单元取低 8 位，PKCS7 补块到 48 字节，base64 64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0332', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0332 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('中a😀').repeat(9);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0332 end');
    });


    /**
     * @tc.name   testOldKeySeq0333
     * @tc.number SUB_Huks_OKSQ_0333
     * @tc.desc   边界：4 个 emoji 共 8 个 UTF-16 单元取低 8 位，PKCS7 补块到 16 字节，base64 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0333', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0333 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '😀'.repeat(4);
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
        String(result.split('|')[0].length), String(24));
      const seg0Len: number = result.split('|')[0].length;
      expect(seg0Len).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(16));
      const seg0BytesLen: number = decodeB64(result.split('|')[0]).length;
      expect(seg0BytesLen).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('\u003D\u0000\u003D\u0000\u003D\u0000\u003D\u0000'));
      expect(result.split('|')[1]).assertEqual('\u003D\u0000\u003D\u0000\u003D\u0000\u003D\u0000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0333 end');
    });

  });
}
