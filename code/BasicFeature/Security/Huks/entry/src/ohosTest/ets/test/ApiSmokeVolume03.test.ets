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
import { util } from '@kit.ArkTS';
import { HuksModel } from '../../../main/ets/model/HuksModel';
import { Flag } from '../../../main/ets/pages/Index';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_Huks]';

function decodeB64(input: string): Uint8Array {
  const helper: util.Base64Helper = new util.Base64Helper();
  return helper.decodeSync(input);
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

export default function apiSmokeVolume03Test() {
  describe('ApiSmokeVolume03', () => {

    /**
     * @tc.name   testApiSmoke0038
     * @tc.number SUB_Huks_APISMK_0038
     * @tc.desc   配对：AES 单字符往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0038 begin');
      const model: HuksModel = new HuksModel();
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData('a', (c: string) => {
  model.decryptData((back: string) => {
    resolve('ok|' + back + '|' + String(c.length));
  });
});
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0]), String('ok'));
      expect(result.split('|')[0]).assertEqual('ok');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('a'));
      expect(result.split('|')[1]).assertEqual('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Number(result.split('|')[2])), String(24));
      expect(Number(result.split('|')[2])).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0038 end');
    });

    /**
     * @tc.name   testApiSmoke0039
     * @tc.number SUB_Huks_APISMK_0039
     * @tc.desc   配对：AES 短词往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0039 begin');
      const model: HuksModel = new HuksModel();
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData('pair', (c: string) => {
  model.decryptData((back: string) => {
    resolve('ok|' + back + '|' + String(c.length));
  });
});
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0]), String('ok'));
      expect(result.split('|')[0]).assertEqual('ok');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('pair'));
      expect(result.split('|')[1]).assertEqual('pair');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Number(result.split('|')[2])), String(28));
      expect(Number(result.split('|')[2])).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0039 end');
    });

    /**
     * @tc.name   testApiSmoke0040
     * @tc.number SUB_Huks_APISMK_0040
     * @tc.desc   配对：AES 多字节往返为按字节还原的冻结字符串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0040 begin');
      const model: HuksModel = new HuksModel();
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData('中文😀', (c: string) => {
  model.decryptData((back: string) => {
    resolve('ok|' + back + '|' + String(c.length));
  });
});
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0]), String('ok'));
      expect(result.split('|')[0]).assertEqual('ok');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('\u00E4\u00B8\u00AD\u00E6\u0096\u0087\u00F0\u009F\u0098\u0080'));
      expect(result.split('|')[1]).assertEqual('\u00E4\u00B8\u00AD\u00E6\u0096\u0087\u00F0\u009F\u0098\u0080');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Number(result.split('|')[2])), String(36));
      expect(Number(result.split('|')[2])).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0040 end');
    });

    /**
     * @tc.name   testApiSmoke0041
     * @tc.number SUB_Huks_APISMK_0041
     * @tc.desc   配对：AES 40 字符往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0041 begin');
      const model: HuksModel = new HuksModel();
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData('a'.repeat(40), (c: string) => {
  model.decryptData((back: string) => {
    resolve('ok|' + back + '|' + String(c.length));
  });
});
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0]), String('ok'));
      expect(result.split('|')[0]).assertEqual('ok');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('a'.repeat(40)));
      expect(result.split('|')[1]).assertEqual('a'.repeat(40));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Number(result.split('|')[2])), String(76));
      expect(Number(result.split('|')[2])).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0041 end');
    });

    /**
     * @tc.name   testApiSmoke0042
     * @tc.number SUB_Huks_APISMK_0042
     * @tc.desc   配对：SM4 单字符 E→I→D
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0042 begin');
      const model: HuksModel = new HuksModel();
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey('a', (c: string) => {
  model.importKey().then(() => {
    model.decryptDataUserOldKey((back: string) => {
      resolve('ok|' + back + '|' + String(c.length));
    });
  });
});
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0]), String('ok'));
      expect(result.split('|')[0]).assertEqual('ok');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('a'));
      expect(result.split('|')[1]).assertEqual('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Number(result.split('|')[2])), String(24));
      expect(Number(result.split('|')[2])).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0042 end');
    });

    /**
     * @tc.name   testApiSmoke0043
     * @tc.number SUB_Huks_APISMK_0043
     * @tc.desc   配对：SM4 短词 E→I→D
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0043 begin');
      const model: HuksModel = new HuksModel();
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey('pair', (c: string) => {
  model.importKey().then(() => {
    model.decryptDataUserOldKey((back: string) => {
      resolve('ok|' + back + '|' + String(c.length));
    });
  });
});
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0]), String('ok'));
      expect(result.split('|')[0]).assertEqual('ok');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('pair'));
      expect(result.split('|')[1]).assertEqual('pair');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Number(result.split('|')[2])), String(24));
      expect(Number(result.split('|')[2])).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0043 end');
    });

    /**
     * @tc.name   testApiSmoke0044
     * @tc.number SUB_Huks_APISMK_0044
     * @tc.desc   配对：SM4 多字节 E→I→D 往返为冻结字节串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0044 begin');
      const model: HuksModel = new HuksModel();
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey('中文😀', (c: string) => {
  model.importKey().then(() => {
    model.decryptDataUserOldKey((back: string) => {
      resolve('ok|' + back + '|' + String(c.length));
    });
  });
});
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0]), String('ok'));
      expect(result.split('|')[0]).assertEqual('ok');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('\u002D\u0087\u003D\u0000'));
      expect(result.split('|')[1]).assertEqual('\u002D\u0087\u003D\u0000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Number(result.split('|')[2])), String(24));
      expect(Number(result.split('|')[2])).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0044 end');
    });

    /**
     * @tc.name   testApiSmoke0045
     * @tc.number SUB_Huks_APISMK_0045
     * @tc.desc   配对：SM4 40 字符 E→I→D
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0045 begin');
      const model: HuksModel = new HuksModel();
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey('a'.repeat(40), (c: string) => {
  model.importKey().then(() => {
    model.decryptDataUserOldKey((back: string) => {
      resolve('ok|' + back + '|' + String(c.length));
    });
  });
});
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0]), String('ok'));
      expect(result.split('|')[0]).assertEqual('ok');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('a'.repeat(40)));
      expect(result.split('|')[1]).assertEqual('a'.repeat(40));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Number(result.split('|')[2])), String(64));
      expect(Number(result.split('|')[2])).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0045 end');
    });

    /**
     * @tc.name   testApiSmoke0046
     * @tc.number SUB_Huks_APISMK_0046
     * @tc.desc   配对：SM2 同单字符两次加密均正常回调，各自按 DER 解析且 C2 为 1 字节
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0046 begin');
      const model: HuksModel = new HuksModel();
      // 正向对照：同明文两次加密，密文均按 DER 结构解析且 C2 各为 1 字节
      const first: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptDataUseSm2('q', (c1: string) => {
          resolve(c1);
        });
      });
      const second: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptDataUseSm2('q', (c2: string) => {
          resolve(c2);
        });
      });
      const decoded1: Uint8Array = decodeB64(first);
      const decoded2: Uint8Array = decodeB64(second);
      const c2Pos1: number = sm2C2TagPos(decoded1);
      const c2Pos2: number = sm2C2TagPos(decoded2);
      const c2Len1: number = sm2C2Len(decoded1, c2Pos1);
      const c2Len2: number = sm2C2Len(decoded2, c2Pos2);
      expect(decoded1[0]).assertEqual(0x30);
      expect(c2Len1).assertEqual(1);
      expect(c2Len2).assertEqual(1);
      expect(decoded1.length).assertEqual(c2Pos1 + 1 + sm2LenFieldSize(c2Len1) + c2Len1);
      expect(decoded2.length).assertEqual(c2Pos2 + 1 + sm2LenFieldSize(c2Len2) + c2Len2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0046 end');
    });

    /**
     * @tc.name   testApiSmoke0047
     * @tc.number SUB_Huks_APISMK_0047
     * @tc.desc   配对：SM2 短词双加密
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0047 begin');
      const model: HuksModel = new HuksModel();
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2('pair', (c1: string) => {
  model.encryptDataUseSm2('pair', (c2: string) => {
    resolve('ok|' + c1 + '|' + c2);
  });
});
});
      expect(result.split('|')[0]).assertEqual('ok');
      const plainBytes_0: number = sm2PlainLen('pair');
      const decoded_0: Uint8Array = decodeB64(result.split('|')[1]);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
      const plainBytes_1: number = sm2PlainLen('pair');
      const decoded_1: Uint8Array = decodeB64(result.split('|')[2]);
      const c2Pos_1: number = sm2C2TagPos(decoded_1);
      const c2Len_1: number = sm2C2Len(decoded_1, c2Pos_1);
      const total_1: number = decoded_1.length;
      expect(decoded_1[0]).assertEqual(0x30);
      expect(c2Len_1).assertEqual(plainBytes_1);
      expect(total_1).assertEqual(c2Pos_1 + 1 + sm2LenFieldSize(c2Len_1) + c2Len_1);
    });

    /**
     * @tc.name   testApiSmoke0048
     * @tc.number SUB_Huks_APISMK_0048
     * @tc.desc   配对：SM2 多字节双加密
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0048 begin');
      const model: HuksModel = new HuksModel();
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2('中文😀', (c1: string) => {
  model.encryptDataUseSm2('中文😀', (c2: string) => {
    resolve('ok|' + c1 + '|' + c2);
  });
});
});
      expect(result.split('|')[0]).assertEqual('ok');
      const plainBytes_0: number = sm2PlainLen('中文😀');
      const decoded_0: Uint8Array = decodeB64(result.split('|')[1]);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
      const plainBytes_1: number = sm2PlainLen('中文😀');
      const decoded_1: Uint8Array = decodeB64(result.split('|')[2]);
      const c2Pos_1: number = sm2C2TagPos(decoded_1);
      const c2Len_1: number = sm2C2Len(decoded_1, c2Pos_1);
      const total_1: number = decoded_1.length;
      expect(decoded_1[0]).assertEqual(0x30);
      expect(c2Len_1).assertEqual(plainBytes_1);
      expect(total_1).assertEqual(c2Pos_1 + 1 + sm2LenFieldSize(c2Len_1) + c2Len_1);
    });

    /**
     * @tc.name   testApiSmoke0049
     * @tc.number SUB_Huks_APISMK_0049
     * @tc.desc   配对：SM2 40 字符双加密
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0049 begin');
      const model: HuksModel = new HuksModel();
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2('a'.repeat(40), (c1: string) => {
  model.encryptDataUseSm2('a'.repeat(40), (c2: string) => {
    resolve('ok|' + c1 + '|' + c2);
  });
});
});
      expect(result.split('|')[0]).assertEqual('ok');
      const plainBytes_0: number = sm2PlainLen('a'.repeat(40));
      const decoded_0: Uint8Array = decodeB64(result.split('|')[1]);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
      const plainBytes_1: number = sm2PlainLen('a'.repeat(40));
      const decoded_1: Uint8Array = decodeB64(result.split('|')[2]);
      const c2Pos_1: number = sm2C2TagPos(decoded_1);
      const c2Len_1: number = sm2C2Len(decoded_1, c2Pos_1);
      const total_1: number = decoded_1.length;
      expect(decoded_1[0]).assertEqual(0x30);
      expect(c2Len_1).assertEqual(plainBytes_1);
      expect(total_1).assertEqual(c2Pos_1 + 1 + sm2LenFieldSize(c2Len_1) + c2Len_1);
    });

    /**
     * @tc.name   testApiSmoke0050
     * @tc.number SUB_Huks_APISMK_0050
     * @tc.desc   配对：Flag 置 0 读回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0050 begin');
      const model: HuksModel = new HuksModel();
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  Flag.set(0);
resolve('ok|' + String(Flag.value) + '|' + String(Flag.value));
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0]), String('ok'));
      expect(result.split('|')[0]).assertEqual('ok');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Number(result.split('|')[1])), String(0));
      expect(Number(result.split('|')[1])).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[1] === result.split('|')[2]));
      expect(result.split('|')[1] === result.split('|')[2]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0050 end');
    });

    /**
     * @tc.name   testApiSmoke0051
     * @tc.number SUB_Huks_APISMK_0051
     * @tc.desc   配对：Flag 置 1 读回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0051 begin');
      const model: HuksModel = new HuksModel();
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  Flag.set(1);
resolve('ok|' + String(Flag.value) + '|' + String(Flag.value));
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0]), String('ok'));
      expect(result.split('|')[0]).assertEqual('ok');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Number(result.split('|')[1])), String(1));
      expect(Number(result.split('|')[1])).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[1] === result.split('|')[2]));
      expect(result.split('|')[1] === result.split('|')[2]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0051 end');
    });

    /**
     * @tc.name   testApiSmoke0052
     * @tc.number SUB_Huks_APISMK_0052
     * @tc.desc   配对：Flag 置 -1 读回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0052 begin');
      const model: HuksModel = new HuksModel();
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  Flag.set(-1);
resolve('ok|' + String(Flag.value) + '|' + String(Flag.value));
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0]), String('ok'));
      expect(result.split('|')[0]).assertEqual('ok');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Number(result.split('|')[1])), String(-1));
      expect(Number(result.split('|')[1])).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[1] === result.split('|')[2]));
      expect(result.split('|')[1] === result.split('|')[2]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0052 end');
    });

    /**
     * @tc.name   testApiSmoke0053
     * @tc.number SUB_Huks_APISMK_0053
     * @tc.desc   配对：Flag 置 3.5 读回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0053 begin');
      const model: HuksModel = new HuksModel();
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  Flag.set(3.5);
resolve('ok|' + String(Flag.value) + '|' + String(Flag.value));
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0]), String('ok'));
      expect(result.split('|')[0]).assertEqual('ok');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Number(result.split('|')[1])), String(3.5));
      expect(Number(result.split('|')[1])).assertEqual(3.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[1] === result.split('|')[2]));
      expect(result.split('|')[1] === result.split('|')[2]).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0053 end');
    });

    /**
     * @tc.name   testApiSmoke0054
     * @tc.number SUB_Huks_APISMK_0054
     * @tc.desc   配对：SM4 先导入后加密单字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0054 begin');
      const model: HuksModel = new HuksModel();
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.importKey().then(() => {
  model.encryptDataUserOldKey('a', (c: string) => {
    resolve('ok|' + String(c.length));
  });
});
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0]), String('ok'));
      expect(result.split('|')[0]).assertEqual('ok');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Number(result.split('|')[1])), String(24));
      expect(Number(result.split('|')[1])).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number(result.split('|')[1]) % 4 === 0));
      expect(Number(result.split('|')[1]) % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0054 end');
    });

    /**
     * @tc.name   testApiSmoke0055
     * @tc.number SUB_Huks_APISMK_0055
     * @tc.desc   配对：SM4 先导入后加密短词
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0055 begin');
      const model: HuksModel = new HuksModel();
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.importKey().then(() => {
  model.encryptDataUserOldKey('pair', (c: string) => {
    resolve('ok|' + String(c.length));
  });
});
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0]), String('ok'));
      expect(result.split('|')[0]).assertEqual('ok');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Number(result.split('|')[1])), String(24));
      expect(Number(result.split('|')[1])).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number(result.split('|')[1]) % 4 === 0));
      expect(Number(result.split('|')[1]) % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0055 end');
    });

    /**
     * @tc.name   testApiSmoke0056
     * @tc.number SUB_Huks_APISMK_0056
     * @tc.desc   配对：SM4 先导入后加密 40 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0056 begin');
      const model: HuksModel = new HuksModel();
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.importKey().then(() => {
  model.encryptDataUserOldKey('a'.repeat(40), (c: string) => {
    resolve('ok|' + String(c.length));
  });
});
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0]), String('ok'));
      expect(result.split('|')[0]).assertEqual('ok');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Number(result.split('|')[1])), String(64));
      expect(Number(result.split('|')[1])).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number(result.split('|')[1]) % 4 === 0));
      expect(Number(result.split('|')[1]) % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0056 end');
    });


    /**
     * @tc.name   testApiSmoke0057
     * @tc.number SUB_Huks_APISMK_0057
     * @tc.desc   连续九次安全调用全部完成且未抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0057 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'smoke-chain';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptData(plain, (c1: string) => {
          model.decryptData((back: string) => {
            model.encryptDataUseSm2(plain, (c2: string) => {
              model.encryptDataUserOldKey(plain, (c3: string) => {
                model.importKey().then(() => {
                  model.decryptDataUserOldKey((oldBack: string) => {
                    resolve('ok|' + back + '|' + oldBack + '|' + String(c2.length));
                  });
                });
              });
            });
          });
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0]), String('ok'));
      expect(result.split('|')[0]).assertEqual('ok');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String(plain));
      expect(result.split('|')[1]).assertEqual(plain);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[2]), String(plain));
      expect(result.split('|')[2]).assertEqual(plain);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0057 end');
    });

  });
}
