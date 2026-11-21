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

export default function apiSmokeVolume02Test() {
  describe('ApiSmokeVolume02', () => {

    /**
     * @tc.name   testApiSmoke0018
     * @tc.number SUB_Huks_APISMK_0018
     * @tc.desc   冒烟：AES 单字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0018 begin');
      const model: HuksModel = new HuksModel();
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData('a', (c: string) => {
  resolve('ok|' + String(c.length));
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0018 end');
    });

    /**
     * @tc.name   testApiSmoke0019
     * @tc.number SUB_Huks_APISMK_0019
     * @tc.desc   冒烟：AES 短词
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0019 begin');
      const model: HuksModel = new HuksModel();
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData('api', (c: string) => {
  resolve('ok|' + String(c.length));
});
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0]), String('ok'));
      expect(result.split('|')[0]).assertEqual('ok');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Number(result.split('|')[1])), String(28));
      expect(Number(result.split('|')[1])).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number(result.split('|')[1]) % 4 === 0));
      expect(Number(result.split('|')[1]) % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0019 end');
    });

    /**
     * @tc.name   testApiSmoke0020
     * @tc.number SUB_Huks_APISMK_0020
     * @tc.desc   冒烟：AES 多字节
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0020 begin');
      const model: HuksModel = new HuksModel();
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData('中文😀', (c: string) => {
  resolve('ok|' + String(c.length));
});
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0]), String('ok'));
      expect(result.split('|')[0]).assertEqual('ok');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Number(result.split('|')[1])), String(36));
      expect(Number(result.split('|')[1])).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number(result.split('|')[1]) % 4 === 0));
      expect(Number(result.split('|')[1]) % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0020 end');
    });

    /**
     * @tc.name   testApiSmoke0021
     * @tc.number SUB_Huks_APISMK_0021
     * @tc.desc   冒烟：AES 63 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0021 begin');
      const model: HuksModel = new HuksModel();
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData('a'.repeat(63), (c: string) => {
  resolve('ok|' + String(c.length));
});
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0]), String('ok'));
      expect(result.split('|')[0]).assertEqual('ok');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Number(result.split('|')[1])), String(108));
      expect(Number(result.split('|')[1])).assertEqual(108);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number(result.split('|')[1]) % 4 === 0));
      expect(Number(result.split('|')[1]) % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0021 end');
    });

    /**
     * @tc.name   testApiSmoke0022
     * @tc.number SUB_Huks_APISMK_0022
     * @tc.desc   冒烟：AES 64 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0022 begin');
      const model: HuksModel = new HuksModel();
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData('a'.repeat(64), (c: string) => {
  resolve('ok|' + String(c.length));
});
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0]), String('ok'));
      expect(result.split('|')[0]).assertEqual('ok');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Number(result.split('|')[1])), String(108));
      expect(Number(result.split('|')[1])).assertEqual(108);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number(result.split('|')[1]) % 4 === 0));
      expect(Number(result.split('|')[1]) % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0022 end');
    });

    /**
     * @tc.name   testApiSmoke0023
     * @tc.number SUB_Huks_APISMK_0023
     * @tc.desc   冒烟：AES 65 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0023 begin');
      const model: HuksModel = new HuksModel();
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData('a'.repeat(65), (c: string) => {
  resolve('ok|' + String(c.length));
});
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0]), String('ok'));
      expect(result.split('|')[0]).assertEqual('ok');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Number(result.split('|')[1])), String(108));
      expect(Number(result.split('|')[1])).assertEqual(108);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number(result.split('|')[1]) % 4 === 0));
      expect(Number(result.split('|')[1]) % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0023 end');
    });

    /**
     * @tc.name   testApiSmoke0024
     * @tc.number SUB_Huks_APISMK_0024
     * @tc.desc   冒烟：AES 符号
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0024 begin');
      const model: HuksModel = new HuksModel();
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(' !@#%^&*()', (c: string) => {
  resolve('ok|' + String(c.length));
});
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0]), String('ok'));
      expect(result.split('|')[0]).assertEqual('ok');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Number(result.split('|')[1])), String(36));
      expect(Number(result.split('|')[1])).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number(result.split('|')[1]) % 4 === 0));
      expect(Number(result.split('|')[1]) % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0024 end');
    });

    /**
     * @tc.name   testApiSmoke0025
     * @tc.number SUB_Huks_APISMK_0025
     * @tc.desc   冒烟：SM2 单字符加密正常回调，密文按 DER 解析且 C2 为 1 字节
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0025 begin');
      const model: HuksModel = new HuksModel();
      // 正向对照：非空输入正常回调并按 DER 结构解析
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptDataUseSm2('q', (c: string) => {
          resolve(c);
        });
      });
      const decoded: Uint8Array = decodeB64(result);
      const c2Pos: number = sm2C2TagPos(decoded);
      const c2Len: number = sm2C2Len(decoded, c2Pos);
      const total: number = decoded.length;
      expect(decoded[0]).assertEqual(0x30);
      expect(c2Len).assertEqual(1);
      expect(total).assertEqual(c2Pos + 1 + sm2LenFieldSize(c2Len) + c2Len);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0025 end');
    });

    /**
     * @tc.name   testApiSmoke0026
     * @tc.number SUB_Huks_APISMK_0026
     * @tc.desc   冒烟：SM2 短词
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0026 begin');
      const model: HuksModel = new HuksModel();
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2('api', (c: string) => {
  resolve('ok|' + c);
});
});
      expect(result.split('|')[0]).assertEqual('ok');
      const plainBytes_0: number = sm2PlainLen('api');
      const decoded_0: Uint8Array = decodeB64(result.split('|')[1]);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testApiSmoke0027
     * @tc.number SUB_Huks_APISMK_0027
     * @tc.desc   冒烟：SM2 多字节
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0027 begin');
      const model: HuksModel = new HuksModel();
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2('中文😀', (c: string) => {
  resolve('ok|' + c);
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
    });

    /**
     * @tc.name   testApiSmoke0028
     * @tc.number SUB_Huks_APISMK_0028
     * @tc.desc   冒烟：SM2 63 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0028 begin');
      const model: HuksModel = new HuksModel();
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2('a'.repeat(63), (c: string) => {
  resolve('ok|' + c);
});
});
      expect(result.split('|')[0]).assertEqual('ok');
      const plainBytes_0: number = sm2PlainLen('a'.repeat(63));
      const decoded_0: Uint8Array = decodeB64(result.split('|')[1]);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testApiSmoke0029
     * @tc.number SUB_Huks_APISMK_0029
     * @tc.desc   冒烟：SM2 64 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0029 begin');
      const model: HuksModel = new HuksModel();
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2('a'.repeat(64), (c: string) => {
  resolve('ok|' + c);
});
});
      expect(result.split('|')[0]).assertEqual('ok');
      const plainBytes_0: number = sm2PlainLen('a'.repeat(64));
      const decoded_0: Uint8Array = decodeB64(result.split('|')[1]);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testApiSmoke0030
     * @tc.number SUB_Huks_APISMK_0030
     * @tc.desc   冒烟：SM2 65 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0030 begin');
      const model: HuksModel = new HuksModel();
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUseSm2('a'.repeat(65), (c: string) => {
  resolve('ok|' + c);
});
});
      expect(result.split('|')[0]).assertEqual('ok');
      const plainBytes_0: number = sm2PlainLen('a'.repeat(65));
      const decoded_0: Uint8Array = decodeB64(result.split('|')[1]);
      const c2Pos_0: number = sm2C2TagPos(decoded_0);
      const c2Len_0: number = sm2C2Len(decoded_0, c2Pos_0);
      const total_0: number = decoded_0.length;
      expect(decoded_0[0]).assertEqual(0x30);
      expect(c2Len_0).assertEqual(plainBytes_0);
      expect(total_0).assertEqual(c2Pos_0 + 1 + sm2LenFieldSize(c2Len_0) + c2Len_0);
    });

    /**
     * @tc.name   testApiSmoke0031
     * @tc.number SUB_Huks_APISMK_0031
     * @tc.desc   冒烟：SM4 单字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0031 begin');
      const model: HuksModel = new HuksModel();
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey('a', (c: string) => {
  resolve('ok|' + String(c.length));
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0031 end');
    });

    /**
     * @tc.name   testApiSmoke0032
     * @tc.number SUB_Huks_APISMK_0032
     * @tc.desc   冒烟：SM4 短词
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0032 begin');
      const model: HuksModel = new HuksModel();
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey('api', (c: string) => {
  resolve('ok|' + String(c.length));
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0032 end');
    });

    /**
     * @tc.name   testApiSmoke0033
     * @tc.number SUB_Huks_APISMK_0033
     * @tc.desc   冒烟：SM4 多字节
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0033 begin');
      const model: HuksModel = new HuksModel();
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey('中文😀', (c: string) => {
  resolve('ok|' + String(c.length));
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0033 end');
    });

    /**
     * @tc.name   testApiSmoke0034
     * @tc.number SUB_Huks_APISMK_0034
     * @tc.desc   冒烟：SM4 63 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0034 begin');
      const model: HuksModel = new HuksModel();
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey('a'.repeat(63), (c: string) => {
  resolve('ok|' + String(c.length));
});
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0]), String('ok'));
      expect(result.split('|')[0]).assertEqual('ok');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Number(result.split('|')[1])), String(88));
      expect(Number(result.split('|')[1])).assertEqual(88);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number(result.split('|')[1]) % 4 === 0));
      expect(Number(result.split('|')[1]) % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0034 end');
    });

    /**
     * @tc.name   testApiSmoke0035
     * @tc.number SUB_Huks_APISMK_0035
     * @tc.desc   冒烟：SM4 64 字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0035 begin');
      const model: HuksModel = new HuksModel();
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey('a'.repeat(64), (c: string) => {
  resolve('ok|' + String(c.length));
});
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0]), String('ok'));
      expect(result.split('|')[0]).assertEqual('ok');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Number(result.split('|')[1])), String(108));
      expect(Number(result.split('|')[1])).assertEqual(108);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number(result.split('|')[1]) % 4 === 0));
      expect(Number(result.split('|')[1]) % 4 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0035 end');
    });

    /**
     * @tc.name   testApiSmoke0036
     * @tc.number SUB_Huks_APISMK_0036
     * @tc.desc   冒烟：importKey 无参调用完成
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0036 begin');
      const model: HuksModel = new HuksModel();
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.importKey().then(() => {
  resolve('ok|0');
});
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0]), String('ok'));
      expect(result.split('|')[0]).assertEqual('ok');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Number(result.split('|')[1])), String(0));
      expect(Number(result.split('|')[1])).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number(result.split('|')[1]) >= 0));
      expect(Number(result.split('|')[1]) >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0036 end');
    });


    /**
     * @tc.name   testApiSmoke0037
     * @tc.number SUB_Huks_APISMK_0037
     * @tc.desc   AES 全链路串联 encrypt→decrypt 回明文
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0037 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'api-anchor';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptData(plain, (cipher: string) => {
          model.decryptData((back: string) => {
            resolve(cipher + '|' + back);
          });
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String(plain));
      expect(result.split('|')[1]).assertEqual(plain);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(36));
      expect(result.split('|')[0].length).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split('|')[0] !== ''));
      expect(result.split('|')[0] !== '').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0037 end');
    });

  });
}
