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

export default function minAccessSeqVolume05Test() {
  describe('MinAccessSeqVolume05', () => {

    /**
     * @tc.name   testMinAccessSeq0210
     * @tc.number SUB_Huks_MCSQ_0210
     * @tc.desc   非法：1 个中文字符按 UTF-16 单元计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0210 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(1);
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
     * @tc.name   testMinAccessSeq0211
     * @tc.number SUB_Huks_MCSQ_0211
     * @tc.desc   非法：2 个中文字符按 UTF-16 单元计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0211 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(2);
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
     * @tc.name   testMinAccessSeq0212
     * @tc.number SUB_Huks_MCSQ_0212
     * @tc.desc   非法：3 个中文字符按 UTF-16 单元计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0212 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(3);
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
     * @tc.name   testMinAccessSeq0213
     * @tc.number SUB_Huks_MCSQ_0213
     * @tc.desc   非法：4 个中文字符按 UTF-16 单元计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0213 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(4);
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
     * @tc.name   testMinAccessSeq0214
     * @tc.number SUB_Huks_MCSQ_0214
     * @tc.desc   非法：5 个中文字符按 UTF-16 单元计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0214 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(5);
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
     * @tc.name   testMinAccessSeq0215
     * @tc.number SUB_Huks_MCSQ_0215
     * @tc.desc   非法：6 个中文字符按 UTF-16 单元计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0215 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(6);
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
     * @tc.name   testMinAccessSeq0216
     * @tc.number SUB_Huks_MCSQ_0216
     * @tc.desc   非法：7 个中文字符按 UTF-16 单元计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0216 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(7);
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
     * @tc.name   testMinAccessSeq0217
     * @tc.number SUB_Huks_MCSQ_0217
     * @tc.desc   非法：8 个中文字符按 UTF-16 单元计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0217 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(8);
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
     * @tc.name   testMinAccessSeq0218
     * @tc.number SUB_Huks_MCSQ_0218
     * @tc.desc   非法：9 个中文字符按 UTF-16 单元计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0218 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(9);
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
     * @tc.name   testMinAccessSeq0219
     * @tc.number SUB_Huks_MCSQ_0219
     * @tc.desc   非法：10 个中文字符按 UTF-16 单元计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0219 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(10);
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
     * @tc.name   testMinAccessSeq0220
     * @tc.number SUB_Huks_MCSQ_0220
     * @tc.desc   非法：11 个中文字符按 UTF-16 单元计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0220 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(11);
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
     * @tc.name   testMinAccessSeq0221
     * @tc.number SUB_Huks_MCSQ_0221
     * @tc.desc   非法：12 个中文字符按 UTF-16 单元计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0221 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(12);
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
     * @tc.name   testMinAccessSeq0222
     * @tc.number SUB_Huks_MCSQ_0222
     * @tc.desc   非法：13 个中文字符按 UTF-16 单元计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0222 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(13);
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
     * @tc.name   testMinAccessSeq0223
     * @tc.number SUB_Huks_MCSQ_0223
     * @tc.desc   非法：14 个中文字符按 UTF-16 单元计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0223 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(14);
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
     * @tc.name   testMinAccessSeq0224
     * @tc.number SUB_Huks_MCSQ_0224
     * @tc.desc   非法：15 个中文字符按 UTF-16 单元计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0224 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(15);
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
     * @tc.name   testMinAccessSeq0225
     * @tc.number SUB_Huks_MCSQ_0225
     * @tc.desc   非法：16 个中文字符按 UTF-16 单元计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0225 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(16);
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
     * @tc.name   testMinAccessSeq0226
     * @tc.number SUB_Huks_MCSQ_0226
     * @tc.desc   非法：17 个中文字符按 UTF-16 单元计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0226 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(17);
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
     * @tc.name   testMinAccessSeq0227
     * @tc.number SUB_Huks_MCSQ_0227
     * @tc.desc   非法：18 个中文字符按 UTF-16 单元计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0227 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(18);
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
     * @tc.name   testMinAccessSeq0228
     * @tc.number SUB_Huks_MCSQ_0228
     * @tc.desc   非法：19 个中文字符按 UTF-16 单元计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0228 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(19);
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
     * @tc.name   testMinAccessSeq0229
     * @tc.number SUB_Huks_MCSQ_0229
     * @tc.desc   非法：20 个中文字符按 UTF-16 单元计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0229 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中'.repeat(20);
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
     * @tc.name   testMinAccessSeq0230
     * @tc.number SUB_Huks_MCSQ_0230
     * @tc.desc   非法：1 个 emoji 按 UTF-16 单元计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0230 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '😀'.repeat(1);
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
     * @tc.name   testMinAccessSeq0231
     * @tc.number SUB_Huks_MCSQ_0231
     * @tc.desc   非法：2 个 emoji 按 UTF-16 单元计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0231 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '😀'.repeat(2);
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
     * @tc.name   testMinAccessSeq0232
     * @tc.number SUB_Huks_MCSQ_0232
     * @tc.desc   非法：3 个 emoji 按 UTF-16 单元计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0232 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '😀'.repeat(3);
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
     * @tc.name   testMinAccessSeq0233
     * @tc.number SUB_Huks_MCSQ_0233
     * @tc.desc   非法：4 个 emoji 按 UTF-16 单元计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0233 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '😀'.repeat(4);
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
     * @tc.name   testMinAccessSeq0234
     * @tc.number SUB_Huks_MCSQ_0234
     * @tc.desc   非法：5 个 emoji 按 UTF-16 单元计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0234 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '😀'.repeat(5);
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
     * @tc.name   testMinAccessSeq0235
     * @tc.number SUB_Huks_MCSQ_0235
     * @tc.desc   非法：6 个 emoji 按 UTF-16 单元计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0235 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '😀'.repeat(6);
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
     * @tc.name   testMinAccessSeq0236
     * @tc.number SUB_Huks_MCSQ_0236
     * @tc.desc   非法：7 个 emoji 按 UTF-16 单元计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0236 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '😀'.repeat(7);
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
     * @tc.name   testMinAccessSeq0237
     * @tc.number SUB_Huks_MCSQ_0237
     * @tc.desc   非法：8 个 emoji 按 UTF-16 单元计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0237 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '😀'.repeat(8);
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
     * @tc.name   testMinAccessSeq0238
     * @tc.number SUB_Huks_MCSQ_0238
     * @tc.desc   非法：9 个 emoji 按 UTF-16 单元计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0238 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '😀'.repeat(9);
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
     * @tc.name   testMinAccessSeq0239
     * @tc.number SUB_Huks_MCSQ_0239
     * @tc.desc   非法：10 个 emoji 按 UTF-16 单元计长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0239 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '😀'.repeat(10);
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
     * @tc.name   testMinAccessSeq0240
     * @tc.number SUB_Huks_MCSQ_0240
     * @tc.desc   组合：ASCII 与多字节混合 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0240 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('a中😀').repeat(1);
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
     * @tc.name   testMinAccessSeq0241
     * @tc.number SUB_Huks_MCSQ_0241
     * @tc.desc   组合：ASCII 与多字节混合 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0241 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('a中😀').repeat(2);
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
     * @tc.name   testMinAccessSeq0242
     * @tc.number SUB_Huks_MCSQ_0242
     * @tc.desc   组合：ASCII 与多字节混合 3 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0242 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('a中😀').repeat(3);
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
     * @tc.name   testMinAccessSeq0243
     * @tc.number SUB_Huks_MCSQ_0243
     * @tc.desc   组合：ASCII 与多字节混合 4 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0243 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('a中😀').repeat(4);
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
     * @tc.name   testMinAccessSeq0244
     * @tc.number SUB_Huks_MCSQ_0244
     * @tc.desc   组合：ASCII 与多字节混合 5 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0244 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('a中😀').repeat(5);
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
     * @tc.name   testMinAccessSeq0245
     * @tc.number SUB_Huks_MCSQ_0245
     * @tc.desc   组合：ASCII 与多字节混合 6 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0245 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('a中😀').repeat(6);
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
     * @tc.name   testMinAccessSeq0246
     * @tc.number SUB_Huks_MCSQ_0246
     * @tc.desc   组合：ASCII 与多字节混合 7 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0246 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('a中😀').repeat(7);
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
     * @tc.name   testMinAccessSeq0247
     * @tc.number SUB_Huks_MCSQ_0247
     * @tc.desc   组合：ASCII 与多字节混合 8 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0247 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('a中😀').repeat(8);
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
     * @tc.name   testMinAccessSeq0248
     * @tc.number SUB_Huks_MCSQ_0248
     * @tc.desc   组合：ASCII 与多字节混合 9 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0248 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('a中😀').repeat(9);
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
     * @tc.name   testMinAccessSeq0249
     * @tc.number SUB_Huks_MCSQ_0249
     * @tc.desc   组合：ASCII 与多字节混合 10 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0249 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('a中😀').repeat(10);
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
     * @tc.name   testMinAccessSeq0250
     * @tc.number SUB_Huks_MCSQ_0250
     * @tc.desc   组合：emoji 开头的混合 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0250 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('😀a中').repeat(1);
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
     * @tc.name   testMinAccessSeq0251
     * @tc.number SUB_Huks_MCSQ_0251
     * @tc.desc   组合：emoji 开头的混合 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0251 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('😀a中').repeat(2);
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
     * @tc.name   testMinAccessSeq0252
     * @tc.number SUB_Huks_MCSQ_0252
     * @tc.desc   组合：emoji 开头的混合 3 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0252 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('😀a中').repeat(3);
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
     * @tc.name   testMinAccessSeq0253
     * @tc.number SUB_Huks_MCSQ_0253
     * @tc.desc   组合：emoji 开头的混合 4 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0253 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('😀a中').repeat(4);
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
     * @tc.name   testMinAccessSeq0254
     * @tc.number SUB_Huks_MCSQ_0254
     * @tc.desc   组合：emoji 开头的混合 5 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0254 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('😀a中').repeat(5);
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
     * @tc.name   testMinAccessSeq0255
     * @tc.number SUB_Huks_MCSQ_0255
     * @tc.desc   组合：emoji 开头的混合 6 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0255 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('😀a中').repeat(6);
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
     * @tc.name   testMinAccessSeq0256
     * @tc.number SUB_Huks_MCSQ_0256
     * @tc.desc   组合：emoji 开头的混合 7 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0256 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('😀a中').repeat(7);
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
     * @tc.name   testMinAccessSeq0257
     * @tc.number SUB_Huks_MCSQ_0257
     * @tc.desc   组合：emoji 开头的混合 8 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0257 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('😀a中').repeat(8);
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
     * @tc.name   testMinAccessSeq0258
     * @tc.number SUB_Huks_MCSQ_0258
     * @tc.desc   组合：emoji 开头的混合 9 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0258 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('😀a中').repeat(9);
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
     * @tc.name   testMinAccessSeq0259
     * @tc.number SUB_Huks_MCSQ_0259
     * @tc.desc   组合：emoji 开头的混合 10 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0259 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('😀a中').repeat(10);
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
     * @tc.name   testMinAccessSeq0260
     * @tc.number SUB_Huks_MCSQ_0260
     * @tc.desc   组合：中文开头的混合 1 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0260 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('中a😀').repeat(1);
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
     * @tc.name   testMinAccessSeq0261
     * @tc.number SUB_Huks_MCSQ_0261
     * @tc.desc   组合：中文开头的混合 2 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0261 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('中a😀').repeat(2);
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
     * @tc.name   testMinAccessSeq0262
     * @tc.number SUB_Huks_MCSQ_0262
     * @tc.desc   组合：中文开头的混合 3 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0262 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('中a😀').repeat(3);
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
     * @tc.name   testMinAccessSeq0263
     * @tc.number SUB_Huks_MCSQ_0263
     * @tc.desc   组合：中文开头的混合 4 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0263 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('中a😀').repeat(4);
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
     * @tc.name   testMinAccessSeq0264
     * @tc.number SUB_Huks_MCSQ_0264
     * @tc.desc   组合：中文开头的混合 5 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0264 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('中a😀').repeat(5);
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
     * @tc.name   testMinAccessSeq0265
     * @tc.number SUB_Huks_MCSQ_0265
     * @tc.desc   组合：中文开头的混合 6 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0265 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('中a😀').repeat(6);
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
     * @tc.name   testMinAccessSeq0266
     * @tc.number SUB_Huks_MCSQ_0266
     * @tc.desc   组合：中文开头的混合 7 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0266 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('中a😀').repeat(7);
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
     * @tc.name   testMinAccessSeq0267
     * @tc.number SUB_Huks_MCSQ_0267
     * @tc.desc   组合：中文开头的混合 8 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0267 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('中a😀').repeat(8);
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
     * @tc.name   testMinAccessSeq0268
     * @tc.number SUB_Huks_MCSQ_0268
     * @tc.desc   组合：中文开头的混合 9 组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0268 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ('中a😀').repeat(9);
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
     * @tc.name   testMinAccessSeq0269
     * @tc.number SUB_Huks_MCSQ_0269
     * @tc.desc   5 个 emoji 共 10 码元：密文 106 字节、base64 144
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0269 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '😀'.repeat(5);
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
