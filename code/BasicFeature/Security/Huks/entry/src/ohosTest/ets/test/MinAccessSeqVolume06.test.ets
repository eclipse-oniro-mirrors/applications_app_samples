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

function sm2HeaderSize(decoded: Uint8Array): number {
  if (decoded[1] === 0x81) {
    return 3;
  }
  if (decoded[1] === 0x82) {
    return 4;
  }
  return 2;
}

function sm2C2TagPos(decoded: Uint8Array): number {
  const header: number = sm2HeaderSize(decoded);
  const lx: number = decoded[header + 1];
  const ly: number = decoded[header + 3 + lx];
  return header + 38 + lx + ly;
}

function sm2LenFieldSize(c2Len: number): number {
  if (c2Len < 0x80) {
    return 1;
  }
  if (c2Len < 0x100) {
    return 2;
  }
  return 3;
}

function sm2C2Len(decoded: Uint8Array, tagPos: number): number {
  const first: number = decoded[tagPos + 1];
  if (first === 0x81) {
    return decoded[tagPos + 2];
  }
  if (first === 0x82) {
    return decoded[tagPos + 2] * 256 + decoded[tagPos + 3];
  }
  return first;
}

// main 冻结行为：SM2 明文按 UTF-16 代码单元逐字节转换，C2 长度即代码单元数
function sm2PlainLen(text: string): number {
  return text.length;
}

export default function minAccessSeqVolume06Test() {
  describe('MinAccessSeqVolume06', () => {

    /**
     * @tc.name   testMinAccessSeq0270
     * @tc.number SUB_Huks_MCSQ_0270
     * @tc.desc   边界：1 字符最小非空输入
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0270 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(1);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0271
     * @tc.number SUB_Huks_MCSQ_0271
     * @tc.desc   边界：1 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0271', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0271 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(1);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0272
     * @tc.number SUB_Huks_MCSQ_0272
     * @tc.desc   边界：2 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0272', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0272 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(2);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0273
     * @tc.number SUB_Huks_MCSQ_0273
     * @tc.desc   边界：3 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0273', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0273 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(3);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0274
     * @tc.number SUB_Huks_MCSQ_0274
     * @tc.desc   边界：4 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0274', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0274 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(4);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0275
     * @tc.number SUB_Huks_MCSQ_0275
     * @tc.desc   边界：5 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0275', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0275 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(5);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0276
     * @tc.number SUB_Huks_MCSQ_0276
     * @tc.desc   边界：14 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0276', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0276 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(14);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0277
     * @tc.number SUB_Huks_MCSQ_0277
     * @tc.desc   边界：15 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0277', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0277 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(15);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0278
     * @tc.number SUB_Huks_MCSQ_0278
     * @tc.desc   边界：16 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0278', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0278 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(16);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0279
     * @tc.number SUB_Huks_MCSQ_0279
     * @tc.desc   边界：17 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0279', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0279 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(17);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0280
     * @tc.number SUB_Huks_MCSQ_0280
     * @tc.desc   边界：18 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0280 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(18);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0281
     * @tc.number SUB_Huks_MCSQ_0281
     * @tc.desc   边界：19 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0281', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0281 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(19);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0282
     * @tc.number SUB_Huks_MCSQ_0282
     * @tc.desc   边界：20 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0282', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0282 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(20);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0283
     * @tc.number SUB_Huks_MCSQ_0283
     * @tc.desc   边界：21 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0283', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0283 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(21);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0284
     * @tc.number SUB_Huks_MCSQ_0284
     * @tc.desc   边界：22 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0284', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0284 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(22);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0285
     * @tc.number SUB_Huks_MCSQ_0285
     * @tc.desc   边界：23 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0285', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0285 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(23);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0286
     * @tc.number SUB_Huks_MCSQ_0286
     * @tc.desc   边界：31 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0286', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0286 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(31);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0287
     * @tc.number SUB_Huks_MCSQ_0287
     * @tc.desc   边界：32 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0287', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0287 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(32);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0288
     * @tc.number SUB_Huks_MCSQ_0288
     * @tc.desc   边界：33 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0288', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0288 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(33);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0289
     * @tc.number SUB_Huks_MCSQ_0289
     * @tc.desc   边界：47 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0289', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0289 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(47);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0290
     * @tc.number SUB_Huks_MCSQ_0290
     * @tc.desc   边界：48 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0290 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(48);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0291
     * @tc.number SUB_Huks_MCSQ_0291
     * @tc.desc   边界：49 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0291', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0291 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(49);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0292
     * @tc.number SUB_Huks_MCSQ_0292
     * @tc.desc   边界：62 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0292', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0292 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(62);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0293
     * @tc.number SUB_Huks_MCSQ_0293
     * @tc.desc   边界：63 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0293', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0293 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(63);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0294
     * @tc.number SUB_Huks_MCSQ_0294
     * @tc.desc   边界：64 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0294', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0294 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(64);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0295
     * @tc.number SUB_Huks_MCSQ_0295
     * @tc.desc   边界：65 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0295', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0295 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(65);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0296
     * @tc.number SUB_Huks_MCSQ_0296
     * @tc.desc   边界：66 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0296', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0296 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(66);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0297
     * @tc.number SUB_Huks_MCSQ_0297
     * @tc.desc   边界：95 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0297', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0297 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(95);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0298
     * @tc.number SUB_Huks_MCSQ_0298
     * @tc.desc   边界：96 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0298', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0298 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(96);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0299
     * @tc.number SUB_Huks_MCSQ_0299
     * @tc.desc   边界：97 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0299', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0299 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(97);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0300
     * @tc.number SUB_Huks_MCSQ_0300
     * @tc.desc   边界：127 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0300 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(127);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0301
     * @tc.number SUB_Huks_MCSQ_0301
     * @tc.desc   边界：128 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0301 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(128);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0302
     * @tc.number SUB_Huks_MCSQ_0302
     * @tc.desc   边界：129 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0302 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(129);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0303
     * @tc.number SUB_Huks_MCSQ_0303
     * @tc.desc   边界：130 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0303', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0303 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(130);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0304
     * @tc.number SUB_Huks_MCSQ_0304
     * @tc.desc   边界：254 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0304', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0304 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(254);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0305
     * @tc.number SUB_Huks_MCSQ_0305
     * @tc.desc   边界：255 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0305', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0305 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(255);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0306
     * @tc.number SUB_Huks_MCSQ_0306
     * @tc.desc   边界：256 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0306', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0306 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(256);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0307
     * @tc.number SUB_Huks_MCSQ_0307
     * @tc.desc   边界：257 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0307', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0307 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(257);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0308
     * @tc.number SUB_Huks_MCSQ_0308
     * @tc.desc   边界：258 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0308', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0308 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(258);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0309
     * @tc.number SUB_Huks_MCSQ_0309
     * @tc.desc   边界：510 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0309', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0309 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(510);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0310
     * @tc.number SUB_Huks_MCSQ_0310
     * @tc.desc   边界：511 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0310 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(511);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0311
     * @tc.number SUB_Huks_MCSQ_0311
     * @tc.desc   边界：512 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0311', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0311 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(512);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0312
     * @tc.number SUB_Huks_MCSQ_0312
     * @tc.desc   边界：513 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0312', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0312 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(513);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0313
     * @tc.number SUB_Huks_MCSQ_0313
     * @tc.desc   边界：514 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0313', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0313 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(514);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0314
     * @tc.number SUB_Huks_MCSQ_0314
     * @tc.desc   边界：766 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0314', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0314 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(766);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0315
     * @tc.number SUB_Huks_MCSQ_0315
     * @tc.desc   边界：767 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0315', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0315 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(767);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0316
     * @tc.number SUB_Huks_MCSQ_0316
     * @tc.desc   边界：768 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0316', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0316 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(768);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0317
     * @tc.number SUB_Huks_MCSQ_0317
     * @tc.desc   边界：769 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0317', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0317 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(769);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0318
     * @tc.number SUB_Huks_MCSQ_0318
     * @tc.desc   边界：1021 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0318', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0318 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(1021);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0319
     * @tc.number SUB_Huks_MCSQ_0319
     * @tc.desc   边界：1022 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0319', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0319 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(1022);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0320
     * @tc.number SUB_Huks_MCSQ_0320
     * @tc.desc   边界：1023 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0320 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(1023);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0321
     * @tc.number SUB_Huks_MCSQ_0321
     * @tc.desc   边界：1024 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0321', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0321 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(1024);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0322
     * @tc.number SUB_Huks_MCSQ_0322
     * @tc.desc   边界：1025 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0322', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0322 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(1025);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0323
     * @tc.number SUB_Huks_MCSQ_0323
     * @tc.desc   边界：1026 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0323', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0323 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(1026);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0324
     * @tc.number SUB_Huks_MCSQ_0324
     * @tc.desc   非法：符号与空白混合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0324', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0324 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '   ';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0325
     * @tc.number SUB_Huks_MCSQ_0325
     * @tc.desc   非法：符号与空白混合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0325', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0325 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '!@#$%^&*()';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0326
     * @tc.number SUB_Huks_MCSQ_0326
     * @tc.desc   非法：符号与空白混合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0326', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0326 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a b c d e';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0327
     * @tc.number SUB_Huks_MCSQ_0327
     * @tc.desc   非法：符号与空白混合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0327', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0327 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '<tag>&"quoted"';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testMinAccessSeq0328
     * @tc.number SUB_Huks_MCSQ_0328
     * @tc.desc   非法：符号与空白混合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0328', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0328 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ' 中 emoji 😀';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });


    /**
     * @tc.name   testMinAccessSeq0329
     * @tc.number SUB_Huks_MCSQ_0329
     * @tc.desc   1024 码元极值：C2 为 1024 字节，总长为 DER 结构自洽值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0329', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0329 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 's'.repeat(1024);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptDataUseSm2(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(result);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

  });
}
