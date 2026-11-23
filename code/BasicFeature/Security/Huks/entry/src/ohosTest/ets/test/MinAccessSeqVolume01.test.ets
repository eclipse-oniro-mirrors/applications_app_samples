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
const PLAIN_1024: string = 'a'.repeat(1024);
const PLAIN_512: string = 'a'.repeat(512);
const PLAIN_256: string = 'a'.repeat(256);
const PLAIN_128: string = 'a'.repeat(128);
const PLAIN_100: string = 'a'.repeat(100);

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

export default function minAccessSeqVolume01Test() {
  describe('MinAccessSeqVolume01', () => {

    /**
     * @tc.name   testMinAccessSeq0001
     * @tc.number SUB_Huks_MCSQ_0001
     * @tc.desc   合法：单字符输入按 DER 结构解析，C2 等于明文字节数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0001 begin');
      const model: HuksModel = new HuksModel();
      // 正向对照：非空输入正常回调并按 DER 结构解析
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptDataUseSm2('r', (cipher: string) => {
          resolve(cipher);
        });
      });
      const decoded: Uint8Array = decodeB64(result);
      const c2Pos: number = sm2C2TagPos(decoded);
      const c2Len: number = sm2C2Len(decoded, c2Pos);
      const total: number = decoded.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c2Len), String(1));
      expect(c2Len).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(decoded[0]), String(0x30));
      expect(decoded[0]).assertEqual(0x30);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(total),
        String(c2Pos + 1 + sm2LenFieldSize(c2Len) + c2Len));
      expect(total).assertEqual(c2Pos + 1 + sm2LenFieldSize(c2Len) + c2Len);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0001 end');
    });

    /**
     * @tc.name   testMinAccessSeq0002
     * @tc.number SUB_Huks_MCSQ_0002
     * @tc.desc   边界：1 字符 97 字节
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0002 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a';
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
     * @tc.name   testMinAccessSeq0003
     * @tc.number SUB_Huks_MCSQ_0003
     * @tc.desc   合法：3 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0003 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'abc';
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
     * @tc.name   testMinAccessSeq0004
     * @tc.number SUB_Huks_MCSQ_0004
     * @tc.desc   合法：常规单词
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0004 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'hello';
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
     * @tc.name   testMinAccessSeq0005
     * @tc.number SUB_Huks_MCSQ_0005
     * @tc.desc   合法：7 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0005 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'aaaaaaa';
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
     * @tc.name   testMinAccessSeq0006
     * @tc.number SUB_Huks_MCSQ_0006
     * @tc.desc   边界：8 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0006 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'aaaaaaaa';
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
     * @tc.name   testMinAccessSeq0007
     * @tc.number SUB_Huks_MCSQ_0007
     * @tc.desc   合法：10 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0007 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'aaaaaaaaaa';
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
     * @tc.name   testMinAccessSeq0008
     * @tc.number SUB_Huks_MCSQ_0008
     * @tc.desc   边界：15 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0008 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'aaaaaaaaaaaaaaa';
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
     * @tc.name   testMinAccessSeq0009
     * @tc.number SUB_Huks_MCSQ_0009
     * @tc.desc   边界：16 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0009 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'aaaaaaaaaaaaaaaa';
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
     * @tc.name   testMinAccessSeq0010
     * @tc.number SUB_Huks_MCSQ_0010
     * @tc.desc   边界：17 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0010 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'aaaaaaaaaaaaaaaaa';
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
     * @tc.name   testMinAccessSeq0011
     * @tc.number SUB_Huks_MCSQ_0011
     * @tc.desc   合法：20 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0011 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'aaaaaaaaaaaaaaaaaaaa';
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
     * @tc.name   testMinAccessSeq0012
     * @tc.number SUB_Huks_MCSQ_0012
     * @tc.desc   边界：31 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0012 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
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
     * @tc.name   testMinAccessSeq0013
     * @tc.number SUB_Huks_MCSQ_0013
     * @tc.desc   边界：32 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0013 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
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
     * @tc.name   testMinAccessSeq0014
     * @tc.number SUB_Huks_MCSQ_0014
     * @tc.desc   边界：33 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0014 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
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
     * @tc.name   testMinAccessSeq0015
     * @tc.number SUB_Huks_MCSQ_0015
     * @tc.desc   合法：64 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0015 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
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
     * @tc.name   testMinAccessSeq0016
     * @tc.number SUB_Huks_MCSQ_0016
     * @tc.desc   合法：100 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0016 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = PLAIN_100;
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
     * @tc.name   testMinAccessSeq0017
     * @tc.number SUB_Huks_MCSQ_0017
     * @tc.desc   合法：128 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0017 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = PLAIN_128;
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
     * @tc.name   testMinAccessSeq0018
     * @tc.number SUB_Huks_MCSQ_0018
     * @tc.desc   合法：256 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0018 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = PLAIN_256;
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
     * @tc.name   testMinAccessSeq0019
     * @tc.number SUB_Huks_MCSQ_0019
     * @tc.desc   极值：512 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0019 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = PLAIN_512;
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
     * @tc.name   testMinAccessSeq0020
     * @tc.number SUB_Huks_MCSQ_0020
     * @tc.desc   极值：1024 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0020 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = PLAIN_1024;
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
     * @tc.name   testMinAccessSeq0021
     * @tc.number SUB_Huks_MCSQ_0021
     * @tc.desc   非法：中文按 UTF-16 每字符 1 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0021 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中文';
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
     * @tc.name   testMinAccessSeq0022
     * @tc.number SUB_Huks_MCSQ_0022
     * @tc.desc   非法：中文按 UTF-16 4 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0022 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中文测试';
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
     * @tc.name   testMinAccessSeq0023
     * @tc.number SUB_Huks_MCSQ_0023
     * @tc.desc   非法：emoji 按 UTF-16 2 码元
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0023 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '😀';
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
     * @tc.name   testMinAccessSeq0024
     * @tc.number SUB_Huks_MCSQ_0024
     * @tc.desc   组合：ASCII 数字符号与中文混合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0024 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a1!中';
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
     * @tc.name   testMinAccessSeq0025
     * @tc.number SUB_Huks_MCSQ_0025
     * @tc.desc   32 字符两次加密 C2 均为 32 字节，随机 k 使密文互异
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMinAccessSeq0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMinAccessSeq0025 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
      const cipherA: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptDataUseSm2(plain, (c: string) => { resolve(c); });
      });
      const cipherB: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptDataUseSm2(plain, (c: string) => { resolve(c); });
      });
      expect(cipherA === cipherB).assertFalse();
      const plainBytes_0: number = sm2PlainLen(plain);
      const decoded_0: Uint8Array = decodeB64(cipherA);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

  });
}
