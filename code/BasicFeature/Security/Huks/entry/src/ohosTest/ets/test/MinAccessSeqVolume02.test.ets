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

export default function minAccessSeqVolume02Test() {
  describe('MinAccessSeqVolume02', () => {

    /**
     * @tc.name   testMinAccessSeq0030
     * @tc.number SUB_Huks_MCSQ_0030
     * @tc.desc   合法：1 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0030 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(1);
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
     * @tc.name   testMinAccessSeq0031
     * @tc.number SUB_Huks_MCSQ_0031
     * @tc.desc   合法：2 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0031 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(2);
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
     * @tc.name   testMinAccessSeq0032
     * @tc.number SUB_Huks_MCSQ_0032
     * @tc.desc   合法：3 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0032 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(3);
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
     * @tc.name   testMinAccessSeq0033
     * @tc.number SUB_Huks_MCSQ_0033
     * @tc.desc   合法：4 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0033 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(4);
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
     * @tc.name   testMinAccessSeq0034
     * @tc.number SUB_Huks_MCSQ_0034
     * @tc.desc   合法：5 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0034 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(5);
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
     * @tc.name   testMinAccessSeq0035
     * @tc.number SUB_Huks_MCSQ_0035
     * @tc.desc   合法：6 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0035 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(6);
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
     * @tc.name   testMinAccessSeq0036
     * @tc.number SUB_Huks_MCSQ_0036
     * @tc.desc   合法：7 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0036 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(7);
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
     * @tc.name   testMinAccessSeq0037
     * @tc.number SUB_Huks_MCSQ_0037
     * @tc.desc   合法：8 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0037 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(8);
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
     * @tc.name   testMinAccessSeq0038
     * @tc.number SUB_Huks_MCSQ_0038
     * @tc.desc   合法：9 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0038 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(9);
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
     * @tc.name   testMinAccessSeq0039
     * @tc.number SUB_Huks_MCSQ_0039
     * @tc.desc   合法：10 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0039 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(10);
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
     * @tc.name   testMinAccessSeq0040
     * @tc.number SUB_Huks_MCSQ_0040
     * @tc.desc   合法：11 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0040 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(11);
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
     * @tc.name   testMinAccessSeq0041
     * @tc.number SUB_Huks_MCSQ_0041
     * @tc.desc   合法：12 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0041 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(12);
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
     * @tc.name   testMinAccessSeq0042
     * @tc.number SUB_Huks_MCSQ_0042
     * @tc.desc   合法：13 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0042 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(13);
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
     * @tc.name   testMinAccessSeq0043
     * @tc.number SUB_Huks_MCSQ_0043
     * @tc.desc   合法：14 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0043 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(14);
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
     * @tc.name   testMinAccessSeq0044
     * @tc.number SUB_Huks_MCSQ_0044
     * @tc.desc   边界：15 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0044 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(15);
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
     * @tc.name   testMinAccessSeq0045
     * @tc.number SUB_Huks_MCSQ_0045
     * @tc.desc   边界：16 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0045 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(16);
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
     * @tc.name   testMinAccessSeq0046
     * @tc.number SUB_Huks_MCSQ_0046
     * @tc.desc   合法：17 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0046 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(17);
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
     * @tc.name   testMinAccessSeq0047
     * @tc.number SUB_Huks_MCSQ_0047
     * @tc.desc   合法：18 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0047 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(18);
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
     * @tc.name   testMinAccessSeq0048
     * @tc.number SUB_Huks_MCSQ_0048
     * @tc.desc   合法：19 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0048 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(19);
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
     * @tc.name   testMinAccessSeq0049
     * @tc.number SUB_Huks_MCSQ_0049
     * @tc.desc   合法：20 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0049 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(20);
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
     * @tc.name   testMinAccessSeq0050
     * @tc.number SUB_Huks_MCSQ_0050
     * @tc.desc   合法：21 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0050 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(21);
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
     * @tc.name   testMinAccessSeq0051
     * @tc.number SUB_Huks_MCSQ_0051
     * @tc.desc   合法：22 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0051 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(22);
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
     * @tc.name   testMinAccessSeq0052
     * @tc.number SUB_Huks_MCSQ_0052
     * @tc.desc   合法：23 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0052 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(23);
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
     * @tc.name   testMinAccessSeq0053
     * @tc.number SUB_Huks_MCSQ_0053
     * @tc.desc   合法：24 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0053 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(24);
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
     * @tc.name   testMinAccessSeq0054
     * @tc.number SUB_Huks_MCSQ_0054
     * @tc.desc   合法：25 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0054 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(25);
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
     * @tc.name   testMinAccessSeq0055
     * @tc.number SUB_Huks_MCSQ_0055
     * @tc.desc   合法：26 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0055 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(26);
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
     * @tc.name   testMinAccessSeq0056
     * @tc.number SUB_Huks_MCSQ_0056
     * @tc.desc   合法：27 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0056 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(27);
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
     * @tc.name   testMinAccessSeq0057
     * @tc.number SUB_Huks_MCSQ_0057
     * @tc.desc   合法：28 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0057 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(28);
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
     * @tc.name   testMinAccessSeq0058
     * @tc.number SUB_Huks_MCSQ_0058
     * @tc.desc   合法：29 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0058 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(29);
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
     * @tc.name   testMinAccessSeq0059
     * @tc.number SUB_Huks_MCSQ_0059
     * @tc.desc   合法：30 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0059 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(30);
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
     * @tc.name   testMinAccessSeq0060
     * @tc.number SUB_Huks_MCSQ_0060
     * @tc.desc   边界：31 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0060 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(31);
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
     * @tc.name   testMinAccessSeq0061
     * @tc.number SUB_Huks_MCSQ_0061
     * @tc.desc   边界：32 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0061 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(32);
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
     * @tc.name   testMinAccessSeq0062
     * @tc.number SUB_Huks_MCSQ_0062
     * @tc.desc   合法：33 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0062 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(33);
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
     * @tc.name   testMinAccessSeq0063
     * @tc.number SUB_Huks_MCSQ_0063
     * @tc.desc   合法：34 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0063 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(34);
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
     * @tc.name   testMinAccessSeq0064
     * @tc.number SUB_Huks_MCSQ_0064
     * @tc.desc   合法：35 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0064 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(35);
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
     * @tc.name   testMinAccessSeq0065
     * @tc.number SUB_Huks_MCSQ_0065
     * @tc.desc   合法：36 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0065 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(36);
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
     * @tc.name   testMinAccessSeq0066
     * @tc.number SUB_Huks_MCSQ_0066
     * @tc.desc   合法：37 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0066 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(37);
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
     * @tc.name   testMinAccessSeq0067
     * @tc.number SUB_Huks_MCSQ_0067
     * @tc.desc   合法：38 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0067 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(38);
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
     * @tc.name   testMinAccessSeq0068
     * @tc.number SUB_Huks_MCSQ_0068
     * @tc.desc   合法：39 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0068 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(39);
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
     * @tc.name   testMinAccessSeq0069
     * @tc.number SUB_Huks_MCSQ_0069
     * @tc.desc   合法：40 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0069 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(40);
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
     * @tc.name   testMinAccessSeq0070
     * @tc.number SUB_Huks_MCSQ_0070
     * @tc.desc   合法：41 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0070 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(41);
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
     * @tc.name   testMinAccessSeq0071
     * @tc.number SUB_Huks_MCSQ_0071
     * @tc.desc   合法：42 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0071 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(42);
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
     * @tc.name   testMinAccessSeq0072
     * @tc.number SUB_Huks_MCSQ_0072
     * @tc.desc   合法：43 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0072 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(43);
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
     * @tc.name   testMinAccessSeq0073
     * @tc.number SUB_Huks_MCSQ_0073
     * @tc.desc   合法：44 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0073 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(44);
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
     * @tc.name   testMinAccessSeq0074
     * @tc.number SUB_Huks_MCSQ_0074
     * @tc.desc   合法：45 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0074 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(45);
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
     * @tc.name   testMinAccessSeq0075
     * @tc.number SUB_Huks_MCSQ_0075
     * @tc.desc   合法：46 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0075 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(46);
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
     * @tc.name   testMinAccessSeq0076
     * @tc.number SUB_Huks_MCSQ_0076
     * @tc.desc   边界：47 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0076 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(47);
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
     * @tc.name   testMinAccessSeq0077
     * @tc.number SUB_Huks_MCSQ_0077
     * @tc.desc   边界：48 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0077 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(48);
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
     * @tc.name   testMinAccessSeq0078
     * @tc.number SUB_Huks_MCSQ_0078
     * @tc.desc   合法：49 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0078 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(49);
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
     * @tc.name   testMinAccessSeq0079
     * @tc.number SUB_Huks_MCSQ_0079
     * @tc.desc   合法：50 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0079 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(50);
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
     * @tc.name   testMinAccessSeq0080
     * @tc.number SUB_Huks_MCSQ_0080
     * @tc.desc   合法：51 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0080 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(51);
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
     * @tc.name   testMinAccessSeq0081
     * @tc.number SUB_Huks_MCSQ_0081
     * @tc.desc   合法：52 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0081 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(52);
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
     * @tc.name   testMinAccessSeq0082
     * @tc.number SUB_Huks_MCSQ_0082
     * @tc.desc   合法：53 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0082 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(53);
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
     * @tc.name   testMinAccessSeq0083
     * @tc.number SUB_Huks_MCSQ_0083
     * @tc.desc   合法：54 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0083 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(54);
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
     * @tc.name   testMinAccessSeq0084
     * @tc.number SUB_Huks_MCSQ_0084
     * @tc.desc   合法：55 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0084 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(55);
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
     * @tc.name   testMinAccessSeq0085
     * @tc.number SUB_Huks_MCSQ_0085
     * @tc.desc   合法：56 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0085 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(56);
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
     * @tc.name   testMinAccessSeq0086
     * @tc.number SUB_Huks_MCSQ_0086
     * @tc.desc   合法：57 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0086 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(57);
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
     * @tc.name   testMinAccessSeq0087
     * @tc.number SUB_Huks_MCSQ_0087
     * @tc.desc   合法：58 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0087 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(58);
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
     * @tc.name   testMinAccessSeq0088
     * @tc.number SUB_Huks_MCSQ_0088
     * @tc.desc   合法：59 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0088 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(59);
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
     * @tc.name   testMinAccessSeq0089
     * @tc.number SUB_Huks_MCSQ_0089
     * @tc.desc   60 码元边界：密文 156 字节、base64 208
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0089 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'm'.repeat(60);
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
