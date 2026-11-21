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

export default function aesSeqVolume08Test() {
  describe('AesSeqVolume08', () => {

    /**
     * @tc.name   testAesSeq0402
     * @tc.number SUB_Huks_AESSQ_0402
     * @tc.desc   合法：1026 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0402', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0402 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1026);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1392));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1392);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1042));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1042);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1026));
      expect(decodeB64(result).length - 16).assertEqual(1026);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0402 end');
    });

    /**
     * @tc.name   testAesSeq0403
     * @tc.number SUB_Huks_AESSQ_0403
     * @tc.desc   合法：1027 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0403', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0403 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1027);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1392));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1392);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1043));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1043);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1027));
      expect(decodeB64(result).length - 16).assertEqual(1027);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0403 end');
    });

    /**
     * @tc.name   testAesSeq0404
     * @tc.number SUB_Huks_AESSQ_0404
     * @tc.desc   合法：1028 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0404', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0404 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1028);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1392));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1392);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1044));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1044);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1028));
      expect(decodeB64(result).length - 16).assertEqual(1028);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0404 end');
    });

    /**
     * @tc.name   testAesSeq0405
     * @tc.number SUB_Huks_AESSQ_0405
     * @tc.desc   合法：1029 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0405', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0405 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1029);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1396));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1396);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1045));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1045);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1029));
      expect(decodeB64(result).length - 16).assertEqual(1029);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0405 end');
    });

    /**
     * @tc.name   testAesSeq0406
     * @tc.number SUB_Huks_AESSQ_0406
     * @tc.desc   合法：1030 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0406', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0406 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1030);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1396));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1396);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1046));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1046);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1030));
      expect(decodeB64(result).length - 16).assertEqual(1030);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0406 end');
    });

    /**
     * @tc.name   testAesSeq0407
     * @tc.number SUB_Huks_AESSQ_0407
     * @tc.desc   合法：1031 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0407', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0407 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1031);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1396));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1396);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1047));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1047);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1031));
      expect(decodeB64(result).length - 16).assertEqual(1031);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0407 end');
    });

    /**
     * @tc.name   testAesSeq0408
     * @tc.number SUB_Huks_AESSQ_0408
     * @tc.desc   合法：1032 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0408', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0408 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1032);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1400));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1400);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1048));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1048);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1032));
      expect(decodeB64(result).length - 16).assertEqual(1032);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0408 end');
    });

    /**
     * @tc.name   testAesSeq0409
     * @tc.number SUB_Huks_AESSQ_0409
     * @tc.desc   合法：1033 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0409', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0409 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1033);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1400));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1400);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1049));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1049);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1033));
      expect(decodeB64(result).length - 16).assertEqual(1033);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0409 end');
    });

    /**
     * @tc.name   testAesSeq0410
     * @tc.number SUB_Huks_AESSQ_0410
     * @tc.desc   合法：1034 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0410 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1034);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1400));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1400);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1050));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1050);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1034));
      expect(decodeB64(result).length - 16).assertEqual(1034);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0410 end');
    });

    /**
     * @tc.name   testAesSeq0411
     * @tc.number SUB_Huks_AESSQ_0411
     * @tc.desc   合法：1035 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0411', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0411 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1035);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1404));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1404);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1051));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1051);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1035));
      expect(decodeB64(result).length - 16).assertEqual(1035);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0411 end');
    });

    /**
     * @tc.name   testAesSeq0412
     * @tc.number SUB_Huks_AESSQ_0412
     * @tc.desc   合法：1036 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0412', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0412 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1036);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1404));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1404);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1052));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1052);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1036));
      expect(decodeB64(result).length - 16).assertEqual(1036);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0412 end');
    });

    /**
     * @tc.name   testAesSeq0413
     * @tc.number SUB_Huks_AESSQ_0413
     * @tc.desc   合法：1037 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0413', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0413 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1037);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1404));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1404);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1053));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1053);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1037));
      expect(decodeB64(result).length - 16).assertEqual(1037);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0413 end');
    });

    /**
     * @tc.name   testAesSeq0414
     * @tc.number SUB_Huks_AESSQ_0414
     * @tc.desc   合法：1038 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0414', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0414 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1038);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1408));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1408);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1054));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1054);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1038));
      expect(decodeB64(result).length - 16).assertEqual(1038);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0414 end');
    });

    /**
     * @tc.name   testAesSeq0415
     * @tc.number SUB_Huks_AESSQ_0415
     * @tc.desc   边界：1039 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0415', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0415 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1039);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1408));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1408);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1055));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1055);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1039));
      expect(decodeB64(result).length - 16).assertEqual(1039);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0415 end');
    });

    /**
     * @tc.name   testAesSeq0416
     * @tc.number SUB_Huks_AESSQ_0416
     * @tc.desc   边界：1040 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0416', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0416 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1040);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1408));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1408);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1056));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1056);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1040));
      expect(decodeB64(result).length - 16).assertEqual(1040);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0416 end');
    });

    /**
     * @tc.name   testAesSeq0417
     * @tc.number SUB_Huks_AESSQ_0417
     * @tc.desc   合法：1041 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0417', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0417 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1041);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1412));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1412);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1057));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1057);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1041));
      expect(decodeB64(result).length - 16).assertEqual(1041);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0417 end');
    });

    /**
     * @tc.name   testAesSeq0418
     * @tc.number SUB_Huks_AESSQ_0418
     * @tc.desc   合法：1042 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0418', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0418 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1042);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1412));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1412);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1058));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1058);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1042));
      expect(decodeB64(result).length - 16).assertEqual(1042);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0418 end');
    });

    /**
     * @tc.name   testAesSeq0419
     * @tc.number SUB_Huks_AESSQ_0419
     * @tc.desc   合法：1043 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0419', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0419 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1043);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1412));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1412);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1059));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1059);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1043));
      expect(decodeB64(result).length - 16).assertEqual(1043);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0419 end');
    });

    /**
     * @tc.name   testAesSeq0420
     * @tc.number SUB_Huks_AESSQ_0420
     * @tc.desc   合法：1044 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0420 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1044);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1416));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1416);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1060));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1060);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1044));
      expect(decodeB64(result).length - 16).assertEqual(1044);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0420 end');
    });

    /**
     * @tc.name   testAesSeq0421
     * @tc.number SUB_Huks_AESSQ_0421
     * @tc.desc   合法：1045 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0421', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0421 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1045);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1416));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1416);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1061));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1061);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1045));
      expect(decodeB64(result).length - 16).assertEqual(1045);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0421 end');
    });

    /**
     * @tc.name   testAesSeq0422
     * @tc.number SUB_Huks_AESSQ_0422
     * @tc.desc   合法：1046 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0422', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0422 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1046);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1416));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1416);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1062));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1062);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1046));
      expect(decodeB64(result).length - 16).assertEqual(1046);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0422 end');
    });

    /**
     * @tc.name   testAesSeq0423
     * @tc.number SUB_Huks_AESSQ_0423
     * @tc.desc   合法：1047 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0423', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0423 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1047);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1420));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1420);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1063));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1063);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1047));
      expect(decodeB64(result).length - 16).assertEqual(1047);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0423 end');
    });

    /**
     * @tc.name   testAesSeq0424
     * @tc.number SUB_Huks_AESSQ_0424
     * @tc.desc   合法：1048 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0424', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0424 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1048);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1420));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1420);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1064));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1064);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1048));
      expect(decodeB64(result).length - 16).assertEqual(1048);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0424 end');
    });

    /**
     * @tc.name   testAesSeq0425
     * @tc.number SUB_Huks_AESSQ_0425
     * @tc.desc   合法：1049 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0425', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0425 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1049);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1420));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1420);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1065));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1065);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1049));
      expect(decodeB64(result).length - 16).assertEqual(1049);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0425 end');
    });

    /**
     * @tc.name   testAesSeq0426
     * @tc.number SUB_Huks_AESSQ_0426
     * @tc.desc   合法：1050 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0426', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0426 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1050);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1424));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1424);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1066));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1066);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1050));
      expect(decodeB64(result).length - 16).assertEqual(1050);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0426 end');
    });

    /**
     * @tc.name   testAesSeq0427
     * @tc.number SUB_Huks_AESSQ_0427
     * @tc.desc   合法：1051 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0427', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0427 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1051);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1424));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1424);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1067));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1067);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1051));
      expect(decodeB64(result).length - 16).assertEqual(1051);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0427 end');
    });

    /**
     * @tc.name   testAesSeq0428
     * @tc.number SUB_Huks_AESSQ_0428
     * @tc.desc   合法：1052 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0428', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0428 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1052);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1424));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1424);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1068));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1068);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1052));
      expect(decodeB64(result).length - 16).assertEqual(1052);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0428 end');
    });

    /**
     * @tc.name   testAesSeq0429
     * @tc.number SUB_Huks_AESSQ_0429
     * @tc.desc   合法：1053 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0429', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0429 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1053);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1428));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1428);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1069));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1069);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1053));
      expect(decodeB64(result).length - 16).assertEqual(1053);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0429 end');
    });

    /**
     * @tc.name   testAesSeq0430
     * @tc.number SUB_Huks_AESSQ_0430
     * @tc.desc   合法：1054 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0430 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1054);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1428));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1428);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1070));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1070);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1054));
      expect(decodeB64(result).length - 16).assertEqual(1054);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0430 end');
    });

    /**
     * @tc.name   testAesSeq0431
     * @tc.number SUB_Huks_AESSQ_0431
     * @tc.desc   边界：1055 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0431', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0431 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1055);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1428));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1428);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1071));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1071);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1055));
      expect(decodeB64(result).length - 16).assertEqual(1055);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0431 end');
    });

    /**
     * @tc.name   testAesSeq0432
     * @tc.number SUB_Huks_AESSQ_0432
     * @tc.desc   边界：1056 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0432', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0432 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1056);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1432));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1432);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1072));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1072);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1056));
      expect(decodeB64(result).length - 16).assertEqual(1056);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0432 end');
    });

    /**
     * @tc.name   testAesSeq0433
     * @tc.number SUB_Huks_AESSQ_0433
     * @tc.desc   合法：1057 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0433', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0433 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1057);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1432));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1432);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1073));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1073);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1057));
      expect(decodeB64(result).length - 16).assertEqual(1057);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0433 end');
    });

    /**
     * @tc.name   testAesSeq0434
     * @tc.number SUB_Huks_AESSQ_0434
     * @tc.desc   合法：1058 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0434', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0434 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1058);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1432));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1432);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1074));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1074);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1058));
      expect(decodeB64(result).length - 16).assertEqual(1058);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0434 end');
    });

    /**
     * @tc.name   testAesSeq0435
     * @tc.number SUB_Huks_AESSQ_0435
     * @tc.desc   合法：1059 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0435', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0435 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1059);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1436));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1436);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1075));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1075);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1059));
      expect(decodeB64(result).length - 16).assertEqual(1059);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0435 end');
    });

    /**
     * @tc.name   testAesSeq0436
     * @tc.number SUB_Huks_AESSQ_0436
     * @tc.desc   合法：1060 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0436', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0436 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1060);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1436));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1436);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1076));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1076);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1060));
      expect(decodeB64(result).length - 16).assertEqual(1060);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0436 end');
    });

    /**
     * @tc.name   testAesSeq0437
     * @tc.number SUB_Huks_AESSQ_0437
     * @tc.desc   合法：1061 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0437', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0437 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1061);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1436));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1436);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1077));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1077);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1061));
      expect(decodeB64(result).length - 16).assertEqual(1061);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0437 end');
    });

    /**
     * @tc.name   testAesSeq0438
     * @tc.number SUB_Huks_AESSQ_0438
     * @tc.desc   合法：1062 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0438', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0438 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1062);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1440));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1440);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1078));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1078);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1062));
      expect(decodeB64(result).length - 16).assertEqual(1062);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0438 end');
    });

    /**
     * @tc.name   testAesSeq0439
     * @tc.number SUB_Huks_AESSQ_0439
     * @tc.desc   合法：1063 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0439', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0439 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1063);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1440));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1440);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1079));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1079);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1063));
      expect(decodeB64(result).length - 16).assertEqual(1063);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0439 end');
    });

    /**
     * @tc.name   testAesSeq0440
     * @tc.number SUB_Huks_AESSQ_0440
     * @tc.desc   合法：1064 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0440 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1064);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1440));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1440);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1080));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1080);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1064));
      expect(decodeB64(result).length - 16).assertEqual(1064);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0440 end');
    });

    /**
     * @tc.name   testAesSeq0441
     * @tc.number SUB_Huks_AESSQ_0441
     * @tc.desc   合法：1065 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0441', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0441 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1065);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1444));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1444);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1081));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1081);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1065));
      expect(decodeB64(result).length - 16).assertEqual(1065);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0441 end');
    });

    /**
     * @tc.name   testAesSeq0442
     * @tc.number SUB_Huks_AESSQ_0442
     * @tc.desc   合法：1066 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0442', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0442 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1066);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1444));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1444);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1082));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1082);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1066));
      expect(decodeB64(result).length - 16).assertEqual(1066);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0442 end');
    });

    /**
     * @tc.name   testAesSeq0443
     * @tc.number SUB_Huks_AESSQ_0443
     * @tc.desc   合法：1067 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0443', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0443 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1067);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1444));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1444);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1083));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1083);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1067));
      expect(decodeB64(result).length - 16).assertEqual(1067);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0443 end');
    });

    /**
     * @tc.name   testAesSeq0444
     * @tc.number SUB_Huks_AESSQ_0444
     * @tc.desc   合法：1068 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0444', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0444 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1068);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1448));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1448);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1084));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1084);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1068));
      expect(decodeB64(result).length - 16).assertEqual(1068);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0444 end');
    });

    /**
     * @tc.name   testAesSeq0445
     * @tc.number SUB_Huks_AESSQ_0445
     * @tc.desc   合法：1069 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0445', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0445 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1069);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1448));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1448);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1085));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1085);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1069));
      expect(decodeB64(result).length - 16).assertEqual(1069);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0445 end');
    });

    /**
     * @tc.name   testAesSeq0446
     * @tc.number SUB_Huks_AESSQ_0446
     * @tc.desc   合法：1070 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0446', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0446 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1070);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1448));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1448);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1086));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1086);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1070));
      expect(decodeB64(result).length - 16).assertEqual(1070);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0446 end');
    });

    /**
     * @tc.name   testAesSeq0447
     * @tc.number SUB_Huks_AESSQ_0447
     * @tc.desc   边界：1071 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0447', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0447 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1071);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1452));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1452);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1087));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1087);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1071));
      expect(decodeB64(result).length - 16).assertEqual(1071);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0447 end');
    });

    /**
     * @tc.name   testAesSeq0448
     * @tc.number SUB_Huks_AESSQ_0448
     * @tc.desc   边界：1072 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0448', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0448 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1072);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1452));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1452);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1088));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1088);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1072));
      expect(decodeB64(result).length - 16).assertEqual(1072);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0448 end');
    });

    /**
     * @tc.name   testAesSeq0449
     * @tc.number SUB_Huks_AESSQ_0449
     * @tc.desc   合法：1073 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0449', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0449 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1073);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1452));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1452);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1089));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1089);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1073));
      expect(decodeB64(result).length - 16).assertEqual(1073);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0449 end');
    });

    /**
     * @tc.name   testAesSeq0450
     * @tc.number SUB_Huks_AESSQ_0450
     * @tc.desc   合法：1074 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0450 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1074);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1456));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1456);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1090));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1090);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1074));
      expect(decodeB64(result).length - 16).assertEqual(1074);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0450 end');
    });

    /**
     * @tc.name   testAesSeq0451
     * @tc.number SUB_Huks_AESSQ_0451
     * @tc.desc   合法：1075 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0451', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0451 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1075);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1456));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1456);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1091));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1091);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1075));
      expect(decodeB64(result).length - 16).assertEqual(1075);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0451 end');
    });

    /**
     * @tc.name   testAesSeq0452
     * @tc.number SUB_Huks_AESSQ_0452
     * @tc.desc   合法：1076 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0452', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0452 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1076);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1456));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1456);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1092));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1092);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1076));
      expect(decodeB64(result).length - 16).assertEqual(1076);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0452 end');
    });

    /**
     * @tc.name   testAesSeq0453
     * @tc.number SUB_Huks_AESSQ_0453
     * @tc.desc   合法：1077 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0453', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0453 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1077);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1460));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1460);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1093));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1093);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1077));
      expect(decodeB64(result).length - 16).assertEqual(1077);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0453 end');
    });

    /**
     * @tc.name   testAesSeq0454
     * @tc.number SUB_Huks_AESSQ_0454
     * @tc.desc   合法：1078 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0454', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0454 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1078);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1460));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1460);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1094));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1094);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1078));
      expect(decodeB64(result).length - 16).assertEqual(1078);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0454 end');
    });

    /**
     * @tc.name   testAesSeq0455
     * @tc.number SUB_Huks_AESSQ_0455
     * @tc.desc   合法：1079 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0455', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0455 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1079);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1460));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1460);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1095));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1095);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1079));
      expect(decodeB64(result).length - 16).assertEqual(1079);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0455 end');
    });

    /**
     * @tc.name   testAesSeq0456
     * @tc.number SUB_Huks_AESSQ_0456
     * @tc.desc   合法：1080 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0456', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0456 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1080);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1464));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1464);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1096));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1096);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1080));
      expect(decodeB64(result).length - 16).assertEqual(1080);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0456 end');
    });

    /**
     * @tc.name   testAesSeq0457
     * @tc.number SUB_Huks_AESSQ_0457
     * @tc.desc   合法：1081 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0457', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0457 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1081);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1464));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1464);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1097));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1097);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1081));
      expect(decodeB64(result).length - 16).assertEqual(1081);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0457 end');
    });

    /**
     * @tc.name   testAesSeq0458
     * @tc.number SUB_Huks_AESSQ_0458
     * @tc.desc   合法：1082 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0458', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0458 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1082);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1464));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1464);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1098));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1098);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1082));
      expect(decodeB64(result).length - 16).assertEqual(1082);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0458 end');
    });

    /**
     * @tc.name   testAesSeq0459
     * @tc.number SUB_Huks_AESSQ_0459
     * @tc.desc   合法：1083 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0459', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0459 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1083);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1468));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1468);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1099));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1099);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1083));
      expect(decodeB64(result).length - 16).assertEqual(1083);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0459 end');
    });

    /**
     * @tc.name   testAesSeq0460
     * @tc.number SUB_Huks_AESSQ_0460
     * @tc.desc   合法：1084 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0460 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1084);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    resolve(cipher);
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1468));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1468);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1100));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1084));
      expect(decodeB64(result).length - 16).assertEqual(1084);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0460 end');
    });


    /**
     * @tc.name   testAesSeq0461
     * @tc.number SUB_Huks_AESSQ_0461
     * @tc.desc   1085 字符越出本桶一格：密文 1101 字节、base64 1468
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0461', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0461 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'c'.repeat(1085);
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptData(plain, (cipher: string) => {
          resolve(cipher);
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1468));
      const resultLen: number = result.length;
      expect(resultLen).assertEqual(1468);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length), String(1101));
      const bytesLen: number = decodeB64(result).length;
      expect(bytesLen).assertEqual(1101);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result).length - 16), String(1085));
      expect(decodeB64(result).length - 16).assertEqual(1085);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0461 end');
    });

  });
}
