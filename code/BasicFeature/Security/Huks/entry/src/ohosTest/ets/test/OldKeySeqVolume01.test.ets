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
const PLAIN_512: string = 'a'.repeat(512);
const PLAIN_256: string = 'a'.repeat(256);
const PLAIN_255: string = 'a'.repeat(255);
const PLAIN_200: string = 'a'.repeat(200);
const PLAIN_128: string = 'a'.repeat(128);
const PLAIN_100: string = 'a'.repeat(100);

function decodeB64(text: string): Uint8Array {
  const helper: util.Base64Helper = new util.Base64Helper();
  return helper.decodeSync(text);
}

export default function oldKeySeqVolume01Test() {
  describe('OldKeySeqVolume01', () => {

    /**
     * @tc.name   testOldKeySeq0001
     * @tc.number SUB_Huks_OKSQ_0001
     * @tc.desc   合法：单字符明文按 PKCS7 补满一个 16 字节块
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0001 begin');
      const model: HuksModel = new HuksModel();
      // 正向对照：单字符明文按 PKCS7 补满一个 16 字节块
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptDataUserOldKey('a', (cipher: string) => {
          resolve(cipher);
        });
      });
      const decoded: Uint8Array = decodeB64(result);
      expect(decoded.length).assertEqual(16);
      expect(decoded.length % 16 === 0).assertTrue();
      expect(result.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0001 end');
    });

    /**
     * @tc.name   testOldKeySeq0002
     * @tc.number SUB_Huks_OKSQ_0002
     * @tc.desc   边界：1 字符补到 16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0002 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptDataUserOldKey(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(24));
      expect(result.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(16));
      expect(decodeB64(result).length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0002 end');
    });

    /**
     * @tc.name   testOldKeySeq0003
     * @tc.number SUB_Huks_OKSQ_0003
     * @tc.desc   合法：常规单词
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0003 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'hello';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptDataUserOldKey(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(24));
      expect(result.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(16));
      expect(decodeB64(result).length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0003 end');
    });

    /**
     * @tc.name   testOldKeySeq0004
     * @tc.number SUB_Huks_OKSQ_0004
     * @tc.desc   合法：7 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0004 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'aaaaaaa';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptDataUserOldKey(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(24));
      expect(result.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(16));
      expect(decodeB64(result).length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0004 end');
    });

    /**
     * @tc.name   testOldKeySeq0005
     * @tc.number SUB_Huks_OKSQ_0005
     * @tc.desc   合法：10 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0005 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'aaaaaaaaaa';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptDataUserOldKey(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(24));
      expect(result.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(16));
      expect(decodeB64(result).length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0005 end');
    });

    /**
     * @tc.name   testOldKeySeq0006
     * @tc.number SUB_Huks_OKSQ_0006
     * @tc.desc   边界：15 字符不越块
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0006 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'aaaaaaaaaaaaaaa';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptDataUserOldKey(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(24));
      expect(result.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(16));
      expect(decodeB64(result).length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0006 end');
    });

    /**
     * @tc.name   testOldKeySeq0007
     * @tc.number SUB_Huks_OKSQ_0007
     * @tc.desc   边界：16 字符整块再补满块
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0007 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'aaaaaaaaaaaaaaaa';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptDataUserOldKey(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(44));
      expect(result.length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(32));
      expect(decodeB64(result).length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0007 end');
    });

    /**
     * @tc.name   testOldKeySeq0008
     * @tc.number SUB_Huks_OKSQ_0008
     * @tc.desc   边界：17 字符越块补到 32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0008 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'aaaaaaaaaaaaaaaaa';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptDataUserOldKey(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(44));
      expect(result.length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(32));
      expect(decodeB64(result).length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0008 end');
    });

    /**
     * @tc.name   testOldKeySeq0009
     * @tc.number SUB_Huks_OKSQ_0009
     * @tc.desc   合法：20 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0009 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'aaaaaaaaaaaaaaaaaaaa';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptDataUserOldKey(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(44));
      expect(result.length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(32));
      expect(decodeB64(result).length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0009 end');
    });

    /**
     * @tc.name   testOldKeySeq0010
     * @tc.number SUB_Huks_OKSQ_0010
     * @tc.desc   边界：31 字符不越第 2 块
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0010 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptDataUserOldKey(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(44));
      expect(result.length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(32));
      expect(decodeB64(result).length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0010 end');
    });

    /**
     * @tc.name   testOldKeySeq0011
     * @tc.number SUB_Huks_OKSQ_0011
     * @tc.desc   边界：32 字符整块再补满块
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0011 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptDataUserOldKey(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(64));
      expect(result.length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(48));
      expect(decodeB64(result).length).assertEqual(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0011 end');
    });

    /**
     * @tc.name   testOldKeySeq0012
     * @tc.number SUB_Huks_OKSQ_0012
     * @tc.desc   边界：33 字符越块补到 48
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0012 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptDataUserOldKey(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(64));
      expect(result.length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(48));
      expect(decodeB64(result).length).assertEqual(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0012 end');
    });

    /**
     * @tc.name   testOldKeySeq0013
     * @tc.number SUB_Huks_OKSQ_0013
     * @tc.desc   合法：50 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0013 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptDataUserOldKey(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(88));
      expect(result.length).assertEqual(88);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(64));
      expect(decodeB64(result).length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0013 end');
    });

    /**
     * @tc.name   testOldKeySeq0014
     * @tc.number SUB_Huks_OKSQ_0014
     * @tc.desc   合法：64 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0014 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptDataUserOldKey(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(108));
      expect(result.length).assertEqual(108);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(80));
      expect(decodeB64(result).length).assertEqual(80);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0014 end');
    });

    /**
     * @tc.name   testOldKeySeq0015
     * @tc.number SUB_Huks_OKSQ_0015
     * @tc.desc   合法：100 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0015 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = PLAIN_100;
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptDataUserOldKey(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(152));
      expect(result.length).assertEqual(152);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(112));
      expect(decodeB64(result).length).assertEqual(112);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0015 end');
    });

    /**
     * @tc.name   testOldKeySeq0016
     * @tc.number SUB_Huks_OKSQ_0016
     * @tc.desc   合法：128 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0016 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = PLAIN_128;
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptDataUserOldKey(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(192));
      expect(result.length).assertEqual(192);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(144));
      expect(decodeB64(result).length).assertEqual(144);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0016 end');
    });

    /**
     * @tc.name   testOldKeySeq0017
     * @tc.number SUB_Huks_OKSQ_0017
     * @tc.desc   合法：200 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0017 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = PLAIN_200;
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptDataUserOldKey(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(280));
      expect(result.length).assertEqual(280);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(208));
      expect(decodeB64(result).length).assertEqual(208);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0017 end');
    });

    /**
     * @tc.name   testOldKeySeq0018
     * @tc.number SUB_Huks_OKSQ_0018
     * @tc.desc   边界：255 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0018 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = PLAIN_255;
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptDataUserOldKey(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(344));
      expect(result.length).assertEqual(344);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(256));
      expect(decodeB64(result).length).assertEqual(256);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0018 end');
    });

    /**
     * @tc.name   testOldKeySeq0019
     * @tc.number SUB_Huks_OKSQ_0019
     * @tc.desc   边界：256 字符整块再补满块
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0019 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = PLAIN_256;
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptDataUserOldKey(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(364));
      expect(result.length).assertEqual(364);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(272));
      expect(decodeB64(result).length).assertEqual(272);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0019 end');
    });

    /**
     * @tc.name   testOldKeySeq0020
     * @tc.number SUB_Huks_OKSQ_0020
     * @tc.desc   合法：512 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0020 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = PLAIN_512;
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptDataUserOldKey(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(704));
      expect(result.length).assertEqual(704);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(528));
      expect(decodeB64(result).length).assertEqual(528);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0020 end');
    });

    /**
     * @tc.name   testOldKeySeq0021
     * @tc.number SUB_Huks_OKSQ_0021
     * @tc.desc   极值：1000 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0021 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = PLAIN_1000;
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptDataUserOldKey(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1344));
      expect(result.length).assertEqual(1344);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1008));
      expect(decodeB64(result).length).assertEqual(1008);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0021 end');
    });

    /**
     * @tc.name   testOldKeySeq0022
     * @tc.number SUB_Huks_OKSQ_0022
     * @tc.desc   极值：1023 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0022 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = PLAIN_1023;
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptDataUserOldKey(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1368));
      expect(result.length).assertEqual(1368);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1024));
      expect(decodeB64(result).length).assertEqual(1024);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0022 end');
    });

    /**
     * @tc.name   testOldKeySeq0023
     * @tc.number SUB_Huks_OKSQ_0023
     * @tc.desc   极值：1024 字符整块再补满块
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0023 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = PLAIN_1024;
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptDataUserOldKey(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1388));
      expect(result.length).assertEqual(1388);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1040));
      expect(decodeB64(result).length).assertEqual(1040);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0023 end');
    });

    /**
     * @tc.name   testOldKeySeq0024
     * @tc.number SUB_Huks_OKSQ_0024
     * @tc.desc   边界：2 个汉字按 2 个 UTF-16 单元取低 8 位，补 1 块到 16 字节，base64 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0024 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中文';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptDataUserOldKey(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(24));
      expect(result.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(16));
      expect(decodeB64(result).length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0024 end');
    });

    /**
     * @tc.name   testOldKeySeq0025
     * @tc.number SUB_Huks_OKSQ_0025
     * @tc.desc   边界：4 个汉字按 4 个 UTF-16 单元取低 8 位，补 1 块到 16 字节，base64 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0025 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '中文测试';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptDataUserOldKey(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(24));
      expect(result.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(16));
      expect(decodeB64(result).length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0025 end');
    });

    /**
     * @tc.name   testOldKeySeq0026
     * @tc.number SUB_Huks_OKSQ_0026
     * @tc.desc   边界：emoji 按 2 个 UTF-16 单元取低 8 位，补 1 块到 16 字节，base64 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0026 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '😀';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptDataUserOldKey(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(24));
      expect(result.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(16));
      expect(decodeB64(result).length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0026 end');
    });

    /**
     * @tc.name   testOldKeySeq0027
     * @tc.number SUB_Huks_OKSQ_0027
     * @tc.desc   边界：3 个空格
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0027 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '   ';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptDataUserOldKey(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(24));
      expect(result.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(16));
      expect(decodeB64(result).length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0027 end');
    });

    /**
     * @tc.name   testOldKeySeq0028
     * @tc.number SUB_Huks_OKSQ_0028
     * @tc.desc   组合：ASCII 数字符号与中文混合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0028 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a1!中';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptDataUserOldKey(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(24));
      expect(result.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(16));
      expect(decodeB64(result).length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decodeB64(result).length % 16 === 0));
      expect(decodeB64(result).length % 16 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0028 end');
    });

    /**
     * @tc.name   testOldKeySeq0029
     * @tc.number SUB_Huks_OKSQ_0029
     * @tc.desc   15 与 16 字符 PKCS7 补块边界，固定密钥与 IV 下同明文密文确定
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0029 begin');
      const modelA: HuksModel = new HuksModel();
      const plain15: string = 'aaaaaaaaaaaaaaa';
      const cipher15A: string = await new Promise<string>((resolve: (value: string) => void) => {
        modelA.encryptDataUserOldKey(plain15, (c: string) => { resolve(c); });
      });
      const modelB: HuksModel = new HuksModel();
      const cipher15B: string = await new Promise<string>((resolve: (value: string) => void) => {
        modelB.encryptDataUserOldKey(plain15, (c: string) => { resolve(c); });
      });
      const plain16: string = 'aaaaaaaaaaaaaaaa';
      const cipher16: string = await new Promise<string>((resolve: (value: string) => void) => {
        modelB.encryptDataUserOldKey(plain16, (c: string) => { resolve(c); });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher15A.length), String(24));
      expect(cipher15A.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(cipher15A).length), String(16));
      expect(decodeB64(cipher15A).length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher16.length), String(44));
      expect(cipher16.length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(cipher16).length), String(32));
      expect(decodeB64(cipher16).length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(cipher15A === cipher15B), String(true));
      expect(cipher15A === cipher15B).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0029 end');
    });

  });
}
