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
const PLAIN_1023: string = 'a'.repeat(1023);
const PLAIN_1000: string = 'a'.repeat(1000);
const PLAIN_513: string = 'a'.repeat(513);
const PLAIN_512: string = 'a'.repeat(512);
const PLAIN_500: string = 'a'.repeat(500);
const PLAIN_257: string = 'a'.repeat(257);
const PLAIN_256: string = 'a'.repeat(256);
const PLAIN_255: string = 'a'.repeat(255);
const PLAIN_200: string = 'a'.repeat(200);
const PLAIN_128: string = 'a'.repeat(128);
const PLAIN_100: string = 'a'.repeat(100);

function decodeB64(text: string): Uint8Array {
  const helper: util.Base64Helper = new util.Base64Helper();
  return helper.decodeSync(text);
}

export default function aesSeqVolume01Test() {
  describe('AesSeqVolume01', () => {

    /**
     * @tc.name   testAesSeq0001
     * @tc.number SUB_Huks_AESSQ_0001
     * @tc.desc   合法：单字符明文密文等于 1 字节明文加 16 字节 GCM tag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0001 begin');
      const model: HuksModel = new HuksModel();
      // 正向对照：单字符明文密文 = 1 字节明文 + 16 字节 GCM tag
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptData('a', (cipher: string) => {
          resolve(cipher);
        });
      });
      const decoded: Uint8Array = decodeB64(result);
      expect(decoded.length).assertEqual(17);
      expect(decoded.length > 16).assertTrue();
      expect(result.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0001 end');
    });

    /**
     * @tc.name   testAesSeq0002
     * @tc.number SUB_Huks_AESSQ_0002
     * @tc.desc   合法：单字符最小非空输入
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0002 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptData(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(24));
      expect(result.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(17));
      expect(decodeB64(result).length).assertEqual(17);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1));
      expect(decodeB64(result).length - 16).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0002 end');
    });

    /**
     * @tc.name   testAesSeq0003
     * @tc.number SUB_Huks_AESSQ_0003
     * @tc.desc   边界：2 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0003 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'ab';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptData(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(24));
      expect(result.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(18));
      expect(decodeB64(result).length).assertEqual(18);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(2));
      expect(decodeB64(result).length - 16).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0003 end');
    });

    /**
     * @tc.name   testAesSeq0004
     * @tc.number SUB_Huks_AESSQ_0004
     * @tc.desc   边界：3 字符越过 base64 分组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0004 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'abc';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptData(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(28));
      expect(result.length).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(19));
      expect(decodeB64(result).length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(3));
      expect(decodeB64(result).length - 16).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0004 end');
    });

    /**
     * @tc.name   testAesSeq0005
     * @tc.number SUB_Huks_AESSQ_0005
     * @tc.desc   合法：常规单词
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0005 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'hello';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptData(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(28));
      expect(result.length).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(21));
      expect(decodeB64(result).length).assertEqual(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(5));
      expect(decodeB64(result).length - 16).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0005 end');
    });

    /**
     * @tc.name   testAesSeq0006
     * @tc.number SUB_Huks_AESSQ_0006
     * @tc.desc   合法：7 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0006 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'aaaaaaa';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptData(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(32));
      expect(result.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(23));
      expect(decodeB64(result).length).assertEqual(23);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(7));
      expect(decodeB64(result).length - 16).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0006 end');
    });

    /**
     * @tc.name   testAesSeq0007
     * @tc.number SUB_Huks_AESSQ_0007
     * @tc.desc   边界：8 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0007 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'aaaaaaaa';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptData(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(32));
      expect(result.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(24));
      expect(decodeB64(result).length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(8));
      expect(decodeB64(result).length - 16).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0007 end');
    });

    /**
     * @tc.name   testAesSeq0008
     * @tc.number SUB_Huks_AESSQ_0008
     * @tc.desc   合法：10 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0008 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'aaaaaaaaaa';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptData(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(36));
      expect(result.length).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(26));
      expect(decodeB64(result).length).assertEqual(26);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(10));
      expect(decodeB64(result).length - 16).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0008 end');
    });

    /**
     * @tc.name   testAesSeq0009
     * @tc.number SUB_Huks_AESSQ_0009
     * @tc.desc   边界：15 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0009 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'aaaaaaaaaaaaaaa';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptData(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(44));
      expect(result.length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(31));
      expect(decodeB64(result).length).assertEqual(31);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(15));
      expect(decodeB64(result).length - 16).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0009 end');
    });

    /**
     * @tc.name   testAesSeq0010
     * @tc.number SUB_Huks_AESSQ_0010
     * @tc.desc   边界：16 字符整块
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0010 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'aaaaaaaaaaaaaaaa';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptData(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(44));
      expect(result.length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(32));
      expect(decodeB64(result).length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(16));
      expect(decodeB64(result).length - 16).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0010 end');
    });

    /**
     * @tc.name   testAesSeq0011
     * @tc.number SUB_Huks_AESSQ_0011
     * @tc.desc   边界：17 字符越过整块
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0011 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'aaaaaaaaaaaaaaaaa';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptData(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(44));
      expect(result.length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(33));
      expect(decodeB64(result).length).assertEqual(33);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(17));
      expect(decodeB64(result).length - 16).assertEqual(17);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0011 end');
    });

    /**
     * @tc.name   testAesSeq0012
     * @tc.number SUB_Huks_AESSQ_0012
     * @tc.desc   边界：19 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0012 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'aaaaaaaaaaaaaaaaaaa';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptData(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(48));
      expect(result.length).assertEqual(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(35));
      expect(decodeB64(result).length).assertEqual(35);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(19));
      expect(decodeB64(result).length - 16).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0012 end');
    });

    /**
     * @tc.name   testAesSeq0013
     * @tc.number SUB_Huks_AESSQ_0013
     * @tc.desc   边界：20 字符（历史缓冲容量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0013 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'aaaaaaaaaaaaaaaaaaaa';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptData(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(48));
      expect(result.length).assertEqual(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(36));
      expect(decodeB64(result).length).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(20));
      expect(decodeB64(result).length - 16).assertEqual(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0013 end');
    });

    /**
     * @tc.name   testAesSeq0014
     * @tc.number SUB_Huks_AESSQ_0014
     * @tc.desc   边界：21 字符越过历史缓冲
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0014 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'aaaaaaaaaaaaaaaaaaaaa';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptData(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(52));
      expect(result.length).assertEqual(52);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(37));
      expect(decodeB64(result).length).assertEqual(37);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(21));
      expect(decodeB64(result).length - 16).assertEqual(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0014 end');
    });

    /**
     * @tc.name   testAesSeq0015
     * @tc.number SUB_Huks_AESSQ_0015
     * @tc.desc   合法：31 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0015 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptData(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(64));
      expect(result.length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(47));
      expect(decodeB64(result).length).assertEqual(47);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(31));
      expect(decodeB64(result).length - 16).assertEqual(31);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0015 end');
    });

    /**
     * @tc.name   testAesSeq0016
     * @tc.number SUB_Huks_AESSQ_0016
     * @tc.desc   合法：32 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0016 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptData(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(64));
      expect(result.length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(48));
      expect(decodeB64(result).length).assertEqual(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(32));
      expect(decodeB64(result).length - 16).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0016 end');
    });

    /**
     * @tc.name   testAesSeq0017
     * @tc.number SUB_Huks_AESSQ_0017
     * @tc.desc   边界：33 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0017 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptData(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(68));
      expect(result.length).assertEqual(68);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(49));
      expect(decodeB64(result).length).assertEqual(49);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(33));
      expect(decodeB64(result).length - 16).assertEqual(33);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0017 end');
    });

    /**
     * @tc.name   testAesSeq0018
     * @tc.number SUB_Huks_AESSQ_0018
     * @tc.desc   合法：50 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0018 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptData(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(88));
      expect(result.length).assertEqual(88);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(66));
      expect(decodeB64(result).length).assertEqual(66);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(50));
      expect(decodeB64(result).length - 16).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0018 end');
    });

    /**
     * @tc.name   testAesSeq0019
     * @tc.number SUB_Huks_AESSQ_0019
     * @tc.desc   合法：64 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0019 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptData(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(108));
      expect(result.length).assertEqual(108);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(80));
      expect(decodeB64(result).length).assertEqual(80);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(64));
      expect(decodeB64(result).length - 16).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0019 end');
    });

    /**
     * @tc.name   testAesSeq0020
     * @tc.number SUB_Huks_AESSQ_0020
     * @tc.desc   合法：100 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0020 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = PLAIN_100;
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptData(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(156));
      expect(result.length).assertEqual(156);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(116));
      expect(decodeB64(result).length).assertEqual(116);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(100));
      expect(decodeB64(result).length - 16).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0020 end');
    });

    /**
     * @tc.name   testAesSeq0021
     * @tc.number SUB_Huks_AESSQ_0021
     * @tc.desc   合法：128 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0021 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = PLAIN_128;
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptData(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(192));
      expect(result.length).assertEqual(192);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(144));
      expect(decodeB64(result).length).assertEqual(144);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(128));
      expect(decodeB64(result).length - 16).assertEqual(128);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0021 end');
    });

    /**
     * @tc.name   testAesSeq0022
     * @tc.number SUB_Huks_AESSQ_0022
     * @tc.desc   合法：200 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0022 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = PLAIN_200;
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptData(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(288));
      expect(result.length).assertEqual(288);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(216));
      expect(decodeB64(result).length).assertEqual(216);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(200));
      expect(decodeB64(result).length - 16).assertEqual(200);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0022 end');
    });

    /**
     * @tc.name   testAesSeq0023
     * @tc.number SUB_Huks_AESSQ_0023
     * @tc.desc   边界：255 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0023 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = PLAIN_255;
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptData(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(364));
      expect(result.length).assertEqual(364);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(271));
      expect(decodeB64(result).length).assertEqual(271);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(255));
      expect(decodeB64(result).length - 16).assertEqual(255);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0023 end');
    });

    /**
     * @tc.name   testAesSeq0024
     * @tc.number SUB_Huks_AESSQ_0024
     * @tc.desc   边界：256 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0024 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = PLAIN_256;
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptData(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(364));
      expect(result.length).assertEqual(364);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(272));
      expect(decodeB64(result).length).assertEqual(272);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(256));
      expect(decodeB64(result).length - 16).assertEqual(256);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0024 end');
    });

    /**
     * @tc.name   testAesSeq0025
     * @tc.number SUB_Huks_AESSQ_0025
     * @tc.desc   边界：257 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0025 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = PLAIN_257;
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptData(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(364));
      expect(result.length).assertEqual(364);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(273));
      expect(decodeB64(result).length).assertEqual(273);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(257));
      expect(decodeB64(result).length - 16).assertEqual(257);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0025 end');
    });

    /**
     * @tc.name   testAesSeq0026
     * @tc.number SUB_Huks_AESSQ_0026
     * @tc.desc   合法：500 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0026 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = PLAIN_500;
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptData(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(688));
      expect(result.length).assertEqual(688);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(516));
      expect(decodeB64(result).length).assertEqual(516);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(500));
      expect(decodeB64(result).length - 16).assertEqual(500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0026 end');
    });

    /**
     * @tc.name   testAesSeq0027
     * @tc.number SUB_Huks_AESSQ_0027
     * @tc.desc   边界：512 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0027 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = PLAIN_512;
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptData(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(704));
      expect(result.length).assertEqual(704);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(528));
      expect(decodeB64(result).length).assertEqual(528);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(512));
      expect(decodeB64(result).length - 16).assertEqual(512);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0027 end');
    });

    /**
     * @tc.name   testAesSeq0028
     * @tc.number SUB_Huks_AESSQ_0028
     * @tc.desc   边界：513 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0028 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = PLAIN_513;
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptData(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(708));
      expect(result.length).assertEqual(708);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(529));
      expect(decodeB64(result).length).assertEqual(529);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(513));
      expect(decodeB64(result).length - 16).assertEqual(513);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0028 end');
    });

    /**
     * @tc.name   testAesSeq0029
     * @tc.number SUB_Huks_AESSQ_0029
     * @tc.desc   极值：1000 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0029 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = PLAIN_1000;
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptData(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1356));
      expect(result.length).assertEqual(1356);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1016));
      expect(decodeB64(result).length).assertEqual(1016);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1000));
      expect(decodeB64(result).length - 16).assertEqual(1000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0029 end');
    });

    /**
     * @tc.name   testAesSeq0030
     * @tc.number SUB_Huks_AESSQ_0030
     * @tc.desc   极值：1023 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0030 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = PLAIN_1023;
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptData(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1388));
      expect(result.length).assertEqual(1388);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1039));
      expect(decodeB64(result).length).assertEqual(1039);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1023));
      expect(decodeB64(result).length - 16).assertEqual(1023);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0030 end');
    });

    /**
     * @tc.name   testAesSeq0031
     * @tc.number SUB_Huks_AESSQ_0031
     * @tc.desc   极值：1024 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0031 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = PLAIN_1024;
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptData(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1388));
      expect(result.length).assertEqual(1388);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1040));
      expect(decodeB64(result).length).assertEqual(1040);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1024));
      expect(decodeB64(result).length - 16).assertEqual(1024);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0031 end');
    });

    /**
     * @tc.name   testAesSeq0032
     * @tc.number SUB_Huks_AESSQ_0032
     * @tc.desc   非法：2 个中文字符按 UTF-8 6 字节
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0032 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中文';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptData(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(32));
      expect(result.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(22));
      expect(decodeB64(result).length).assertEqual(22);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(6));
      expect(decodeB64(result).length - 16).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0032 end');
    });

    /**
     * @tc.name   testAesSeq0033
     * @tc.number SUB_Huks_AESSQ_0033
     * @tc.desc   非法：4 个中文字符按 UTF-8 12 字节
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0033 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中文测试';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptData(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(40));
      expect(result.length).assertEqual(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(28));
      expect(decodeB64(result).length).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(12));
      expect(decodeB64(result).length - 16).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0033 end');
    });

    /**
     * @tc.name   testAesSeq0034
     * @tc.number SUB_Huks_AESSQ_0034
     * @tc.desc   非法：emoji 按 UTF-8 4 字节
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0034 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '😀';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptData(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(28));
      expect(result.length).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(20));
      expect(decodeB64(result).length).assertEqual(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(4));
      expect(decodeB64(result).length - 16).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0034 end');
    });

    /**
     * @tc.name   testAesSeq0035
     * @tc.number SUB_Huks_AESSQ_0035
     * @tc.desc   边界：3 个空格
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0035 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '   ';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptData(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(28));
      expect(result.length).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(19));
      expect(decodeB64(result).length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(3));
      expect(decodeB64(result).length - 16).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0035 end');
    });

    /**
     * @tc.name   testAesSeq0036
     * @tc.number SUB_Huks_AESSQ_0036
     * @tc.desc   组合：ASCII 数字符号与中文混合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0036 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a1!中';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptData(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(32));
      expect(result.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(22));
      expect(decodeB64(result).length).assertEqual(22);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(6));
      expect(decodeB64(result).length - 16).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0036 end');
    });

    /**
     * @tc.name   testAesSeq0037
     * @tc.number SUB_Huks_AESSQ_0037
     * @tc.desc   23 字符明文完整参与加密不截断到 20 字节缓冲，解密原样恢复
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0037 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'aaaaaaaaaaaaaaaaaaaaaaa';
      const cipher: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptData(plain, (c: string) => { resolve(c); });
      });
      const restored: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.decryptData((d: string) => { resolve(d); });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(cipher).length), String(39));
      expect(decodeB64(cipher).length).assertEqual(39);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher.length), String(52));
      expect(cipher.length).assertEqual(52);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored), plain);
      expect(restored).assertEqual(plain);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0037 end');
    });

  });
}
