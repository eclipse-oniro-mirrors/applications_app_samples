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

export default function aesSeqVolume09Test() {
  describe('AesSeqVolume09', () => {

    /**
     * @tc.name   testAesSeq0462
     * @tc.number SUB_Huks_AESSQ_0462
     * @tc.desc   组合：混合类 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0462', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0462 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'hello world';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(36));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(27));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(27);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(11));
      expect(decodeB64(result).length - 16).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0462 end');
    });

    /**
     * @tc.name   testAesSeq0463
     * @tc.number SUB_Huks_AESSQ_0463
     * @tc.desc   组合：混合类 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0463', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0463 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Huks AES-GCM 测试';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(48));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(35));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(35);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(19));
      expect(decodeB64(result).length - 16).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0463 end');
    });

    /**
     * @tc.name   testAesSeq0464
     * @tc.number SUB_Huks_AESSQ_0464
     * @tc.desc   组合：混合类 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0464', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0464 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '0'.repeat(10);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(36));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(26));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(26);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(10));
      expect(decodeB64(result).length - 16).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0464 end');
    });

    /**
     * @tc.name   testAesSeq0465
     * @tc.number SUB_Huks_AESSQ_0465
     * @tc.desc   组合：混合类 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0465', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0465 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '9'.repeat(20);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(48));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(36));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(20));
      expect(decodeB64(result).length - 16).assertEqual(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0465 end');
    });

    /**
     * @tc.name   testAesSeq0466
     * @tc.number SUB_Huks_AESSQ_0466
     * @tc.desc   组合：混合类 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0466', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0466 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Z'.repeat(30);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(64));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(46));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(46);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(30));
      expect(decodeB64(result).length - 16).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0466 end');
    });

    /**
     * @tc.name   testAesSeq0467
     * @tc.number SUB_Huks_AESSQ_0467
     * @tc.desc   组合：混合类 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0467', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0467 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = ' '.repeat(40);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(76));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(56));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(40));
      expect(decodeB64(result).length - 16).assertEqual(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0467 end');
    });

    /**
     * @tc.name   testAesSeq0468
     * @tc.number SUB_Huks_AESSQ_0468
     * @tc.desc   组合：混合类 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0468', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0468 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'x'.repeat(50);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(88));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(88);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(66));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(66);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(50));
      expect(decodeB64(result).length - 16).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0468 end');
    });

    /**
     * @tc.name   testAesSeq0469
     * @tc.number SUB_Huks_AESSQ_0469
     * @tc.desc   组合：混合类 8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0469', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0469 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '\t'.repeat(8);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(32));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(24));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(8));
      expect(decodeB64(result).length - 16).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0469 end');
    });

    /**
     * @tc.name   testAesSeq0470
     * @tc.number SUB_Huks_AESSQ_0470
     * @tc.desc   组合：混合类 9
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0470 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '🔐'.repeat(3);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(40));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(28));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(12));
      expect(decodeB64(result).length - 16).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0470 end');
    });

    /**
     * @tc.name   testAesSeq0471
     * @tc.number SUB_Huks_AESSQ_0471
     * @tc.desc   组合：混合类 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0471', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0471 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '🚀汉'.repeat(5);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(68));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(68);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(51));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(51);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(35));
      expect(decodeB64(result).length - 16).assertEqual(35);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0471 end');
    });

    /**
     * @tc.name   testAesSeq0472
     * @tc.number SUB_Huks_AESSQ_0472
     * @tc.desc   组合：混合类 11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0472', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0472 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '密码😀abc'.repeat(2);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(56));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(42));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(26));
      expect(decodeB64(result).length - 16).assertEqual(26);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0472 end');
    });

    /**
     * @tc.name   testAesSeq0473
     * @tc.number SUB_Huks_AESSQ_0473
     * @tc.desc   组合：混合类 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0473', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0473 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'a😀b中c🚀'.repeat(4);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(96));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(96);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(72));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(72);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(56));
      expect(decodeB64(result).length - 16).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0473 end');
    });

    /**
     * @tc.name   testAesSeq0474
     * @tc.number SUB_Huks_AESSQ_0474
     * @tc.desc   组合：混合类 13
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0474', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0474 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '!@#$%^&*()-_=+[]{};:,.<>/?'.repeat(2);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(92));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(92);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(68));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(68);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(52));
      expect(decodeB64(result).length - 16).assertEqual(52);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0474 end');
    });

    /**
     * @tc.name   testAesSeq0475
     * @tc.number SUB_Huks_AESSQ_0475
     * @tc.desc   组合：混合类 14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0475', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0475 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'QWER'.repeat(15);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(104));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(76));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(60));
      expect(decodeB64(result).length - 16).assertEqual(60);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0475 end');
    });

    /**
     * @tc.name   testAesSeq0476
     * @tc.number SUB_Huks_AESSQ_0476
     * @tc.desc   组合：混合类 15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0476', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0476 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'azAZ09'.repeat(10);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(104));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(76));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(60));
      expect(decodeB64(result).length - 16).assertEqual(60);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0476 end');
    });

    /**
     * @tc.name   testAesSeq0477
     * @tc.number SUB_Huks_AESSQ_0477
     * @tc.desc   组合：混合类 16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0477', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0477 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'e'.repeat(55);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(96));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(96);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(71));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(71);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(55));
      expect(decodeB64(result).length - 16).assertEqual(55);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0477 end');
    });

    /**
     * @tc.name   testAesSeq0478
     * @tc.number SUB_Huks_AESSQ_0478
     * @tc.desc   组合：混合类 17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0478', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0478 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'f'.repeat(56);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(96));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(96);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(72));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(72);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(56));
      expect(decodeB64(result).length - 16).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0478 end');
    });

    /**
     * @tc.name   testAesSeq0479
     * @tc.number SUB_Huks_AESSQ_0479
     * @tc.desc   组合：混合类 18
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0479', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0479 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'g'.repeat(57);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(100));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(73));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(73);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(57));
      expect(decodeB64(result).length - 16).assertEqual(57);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0479 end');
    });

    /**
     * @tc.name   testAesSeq0480
     * @tc.number SUB_Huks_AESSQ_0480
     * @tc.desc   组合：混合类 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0480 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'h'.repeat(58);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(100));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(74));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(74);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(58));
      expect(decodeB64(result).length - 16).assertEqual(58);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0480 end');
    });


    /**
     * @tc.name   testAesSeq0481
     * @tc.number SUB_Huks_AESSQ_0481
     * @tc.desc   🔐🚀 重复 30 组：240 字节 UTF-8，密文 256 字节、base64 344
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0481', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0481 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = '🔐🚀'.repeat(30);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptData(plain, (cipher: string) => {
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(240));
      expect(decodeB64(result).length - 16).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0481 end');
    });

  });
}
