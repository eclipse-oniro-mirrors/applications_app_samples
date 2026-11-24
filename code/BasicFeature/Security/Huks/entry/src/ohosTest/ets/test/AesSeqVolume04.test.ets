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

export default function aesSeqVolume04Test() {
  describe('AesSeqVolume04', () => {

    /**
     * @tc.name   testAesSeq0162
     * @tc.number SUB_Huks_AESSQ_0162
     * @tc.desc   组合：1 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0162 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'R';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('R'));
      expect(result.split('|')[1]).assertEqual('R');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(24));
      expect(result.split('|')[0].length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(1));
      expect(result.split('|')[1].length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0162 end');
    });

    /**
     * @tc.name   testAesSeq0163
     * @tc.number SUB_Huks_AESSQ_0163
     * @tc.desc   组合：2 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0163 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rx'));
      expect(result.split('|')[1]).assertEqual('Rx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(24));
      expect(result.split('|')[0].length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(2));
      expect(result.split('|')[1].length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0163 end');
    });

    /**
     * @tc.name   testAesSeq0164
     * @tc.number SUB_Huks_AESSQ_0164
     * @tc.desc   组合：3 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0164 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxx'));
      expect(result.split('|')[1]).assertEqual('Rxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(28));
      expect(result.split('|')[0].length).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(3));
      expect(result.split('|')[1].length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0164 end');
    });

    /**
     * @tc.name   testAesSeq0165
     * @tc.number SUB_Huks_AESSQ_0165
     * @tc.desc   组合：4 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0165 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(28));
      expect(result.split('|')[0].length).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(4));
      expect(result.split('|')[1].length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0165 end');
    });

    /**
     * @tc.name   testAesSeq0166
     * @tc.number SUB_Huks_AESSQ_0166
     * @tc.desc   组合：5 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0166 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(28));
      expect(result.split('|')[0].length).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(5));
      expect(result.split('|')[1].length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0166 end');
    });

    /**
     * @tc.name   testAesSeq0167
     * @tc.number SUB_Huks_AESSQ_0167
     * @tc.desc   组合：6 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0167 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(32));
      expect(result.split('|')[0].length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(6));
      expect(result.split('|')[1].length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0167 end');
    });

    /**
     * @tc.name   testAesSeq0168
     * @tc.number SUB_Huks_AESSQ_0168
     * @tc.desc   组合：7 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0168 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(32));
      expect(result.split('|')[0].length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(7));
      expect(result.split('|')[1].length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0168 end');
    });

    /**
     * @tc.name   testAesSeq0169
     * @tc.number SUB_Huks_AESSQ_0169
     * @tc.desc   组合：8 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0169 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(32));
      expect(result.split('|')[0].length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(8));
      expect(result.split('|')[1].length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0169 end');
    });

    /**
     * @tc.name   testAesSeq0170
     * @tc.number SUB_Huks_AESSQ_0170
     * @tc.desc   组合：9 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0170 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(36));
      expect(result.split('|')[0].length).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(9));
      expect(result.split('|')[1].length).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0170 end');
    });

    /**
     * @tc.name   testAesSeq0171
     * @tc.number SUB_Huks_AESSQ_0171
     * @tc.desc   组合：10 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0171 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(36));
      expect(result.split('|')[0].length).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(10));
      expect(result.split('|')[1].length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0171 end');
    });

    /**
     * @tc.name   testAesSeq0172
     * @tc.number SUB_Huks_AESSQ_0172
     * @tc.desc   组合：11 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0172 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(36));
      expect(result.split('|')[0].length).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(11));
      expect(result.split('|')[1].length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0172 end');
    });

    /**
     * @tc.name   testAesSeq0173
     * @tc.number SUB_Huks_AESSQ_0173
     * @tc.desc   组合：12 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0173 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(40));
      expect(result.split('|')[0].length).assertEqual(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(12));
      expect(result.split('|')[1].length).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0173 end');
    });

    /**
     * @tc.name   testAesSeq0174
     * @tc.number SUB_Huks_AESSQ_0174
     * @tc.desc   组合：13 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0174 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(40));
      expect(result.split('|')[0].length).assertEqual(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(13));
      expect(result.split('|')[1].length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0174 end');
    });

    /**
     * @tc.name   testAesSeq0175
     * @tc.number SUB_Huks_AESSQ_0175
     * @tc.desc   组合：14 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0175 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(40));
      expect(result.split('|')[0].length).assertEqual(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(14));
      expect(result.split('|')[1].length).assertEqual(14);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0175 end');
    });

    /**
     * @tc.name   testAesSeq0176
     * @tc.number SUB_Huks_AESSQ_0176
     * @tc.desc   组合：15 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0176 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(44));
      expect(result.split('|')[0].length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(15));
      expect(result.split('|')[1].length).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0176 end');
    });

    /**
     * @tc.name   testAesSeq0177
     * @tc.number SUB_Huks_AESSQ_0177
     * @tc.desc   组合：16 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0177 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(44));
      expect(result.split('|')[0].length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(16));
      expect(result.split('|')[1].length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0177 end');
    });

    /**
     * @tc.name   testAesSeq0178
     * @tc.number SUB_Huks_AESSQ_0178
     * @tc.desc   组合：17 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0178 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(44));
      expect(result.split('|')[0].length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(17));
      expect(result.split('|')[1].length).assertEqual(17);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0178 end');
    });

    /**
     * @tc.name   testAesSeq0179
     * @tc.number SUB_Huks_AESSQ_0179
     * @tc.desc   组合：18 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0179 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(48));
      expect(result.split('|')[0].length).assertEqual(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(18));
      expect(result.split('|')[1].length).assertEqual(18);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0179 end');
    });

    /**
     * @tc.name   testAesSeq0180
     * @tc.number SUB_Huks_AESSQ_0180
     * @tc.desc   组合：19 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0180 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(48));
      expect(result.split('|')[0].length).assertEqual(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(19));
      expect(result.split('|')[1].length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0180 end');
    });

    /**
     * @tc.name   testAesSeq0181
     * @tc.number SUB_Huks_AESSQ_0181
     * @tc.desc   组合：20 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0181 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(48));
      expect(result.split('|')[0].length).assertEqual(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(20));
      expect(result.split('|')[1].length).assertEqual(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0181 end');
    });

    /**
     * @tc.name   testAesSeq0182
     * @tc.number SUB_Huks_AESSQ_0182
     * @tc.desc   组合：21 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0182 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(52));
      expect(result.split('|')[0].length).assertEqual(52);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(21));
      expect(result.split('|')[1].length).assertEqual(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0182 end');
    });

    /**
     * @tc.name   testAesSeq0183
     * @tc.number SUB_Huks_AESSQ_0183
     * @tc.desc   组合：22 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0183 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(52));
      expect(result.split('|')[0].length).assertEqual(52);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(22));
      expect(result.split('|')[1].length).assertEqual(22);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0183 end');
    });

    /**
     * @tc.name   testAesSeq0184
     * @tc.number SUB_Huks_AESSQ_0184
     * @tc.desc   组合：23 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0184 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(52));
      expect(result.split('|')[0].length).assertEqual(52);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(23));
      expect(result.split('|')[1].length).assertEqual(23);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0184 end');
    });

    /**
     * @tc.name   testAesSeq0185
     * @tc.number SUB_Huks_AESSQ_0185
     * @tc.desc   组合：24 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0185 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(56));
      expect(result.split('|')[0].length).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(24));
      expect(result.split('|')[1].length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0185 end');
    });

    /**
     * @tc.name   testAesSeq0186
     * @tc.number SUB_Huks_AESSQ_0186
     * @tc.desc   组合：25 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0186 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(56));
      expect(result.split('|')[0].length).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(25));
      expect(result.split('|')[1].length).assertEqual(25);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0186 end');
    });

    /**
     * @tc.name   testAesSeq0187
     * @tc.number SUB_Huks_AESSQ_0187
     * @tc.desc   组合：26 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0187 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(56));
      expect(result.split('|')[0].length).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(26));
      expect(result.split('|')[1].length).assertEqual(26);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0187 end');
    });

    /**
     * @tc.name   testAesSeq0188
     * @tc.number SUB_Huks_AESSQ_0188
     * @tc.desc   组合：27 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0188 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(60));
      expect(result.split('|')[0].length).assertEqual(60);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(27));
      expect(result.split('|')[1].length).assertEqual(27);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0188 end');
    });

    /**
     * @tc.name   testAesSeq0189
     * @tc.number SUB_Huks_AESSQ_0189
     * @tc.desc   组合：28 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0189 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(60));
      expect(result.split('|')[0].length).assertEqual(60);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(28));
      expect(result.split('|')[1].length).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0189 end');
    });

    /**
     * @tc.name   testAesSeq0190
     * @tc.number SUB_Huks_AESSQ_0190
     * @tc.desc   组合：29 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0190 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(60));
      expect(result.split('|')[0].length).assertEqual(60);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(29));
      expect(result.split('|')[1].length).assertEqual(29);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0190 end');
    });

    /**
     * @tc.name   testAesSeq0191
     * @tc.number SUB_Huks_AESSQ_0191
     * @tc.desc   组合：30 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0191 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(64));
      expect(result.split('|')[0].length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(30));
      expect(result.split('|')[1].length).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0191 end');
    });

    /**
     * @tc.name   testAesSeq0192
     * @tc.number SUB_Huks_AESSQ_0192
     * @tc.desc   组合：31 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0192 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(64));
      expect(result.split('|')[0].length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(31));
      expect(result.split('|')[1].length).assertEqual(31);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0192 end');
    });

    /**
     * @tc.name   testAesSeq0193
     * @tc.number SUB_Huks_AESSQ_0193
     * @tc.desc   组合：32 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0193 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(64));
      expect(result.split('|')[0].length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(32));
      expect(result.split('|')[1].length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0193 end');
    });

    /**
     * @tc.name   testAesSeq0194
     * @tc.number SUB_Huks_AESSQ_0194
     * @tc.desc   组合：33 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0194 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(68));
      expect(result.split('|')[0].length).assertEqual(68);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(33));
      expect(result.split('|')[1].length).assertEqual(33);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0194 end');
    });

    /**
     * @tc.name   testAesSeq0195
     * @tc.number SUB_Huks_AESSQ_0195
     * @tc.desc   组合：34 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0195 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(68));
      expect(result.split('|')[0].length).assertEqual(68);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(34));
      expect(result.split('|')[1].length).assertEqual(34);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0195 end');
    });

    /**
     * @tc.name   testAesSeq0196
     * @tc.number SUB_Huks_AESSQ_0196
     * @tc.desc   组合：35 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0196 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(68));
      expect(result.split('|')[0].length).assertEqual(68);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(35));
      expect(result.split('|')[1].length).assertEqual(35);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0196 end');
    });

    /**
     * @tc.name   testAesSeq0197
     * @tc.number SUB_Huks_AESSQ_0197
     * @tc.desc   组合：36 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0197 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(72));
      expect(result.split('|')[0].length).assertEqual(72);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(36));
      expect(result.split('|')[1].length).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0197 end');
    });

    /**
     * @tc.name   testAesSeq0198
     * @tc.number SUB_Huks_AESSQ_0198
     * @tc.desc   组合：37 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0198 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(72));
      expect(result.split('|')[0].length).assertEqual(72);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(37));
      expect(result.split('|')[1].length).assertEqual(37);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0198 end');
    });

    /**
     * @tc.name   testAesSeq0199
     * @tc.number SUB_Huks_AESSQ_0199
     * @tc.desc   组合：38 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0199 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(72));
      expect(result.split('|')[0].length).assertEqual(72);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(38));
      expect(result.split('|')[1].length).assertEqual(38);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0199 end');
    });

    /**
     * @tc.name   testAesSeq0200
     * @tc.number SUB_Huks_AESSQ_0200
     * @tc.desc   组合：39 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0200 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(76));
      expect(result.split('|')[0].length).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(39));
      expect(result.split('|')[1].length).assertEqual(39);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0200 end');
    });

    /**
     * @tc.name   testAesSeq0201
     * @tc.number SUB_Huks_AESSQ_0201
     * @tc.desc   组合：40 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0201 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(76));
      expect(result.split('|')[0].length).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(40));
      expect(result.split('|')[1].length).assertEqual(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0201 end');
    });

    /**
     * @tc.name   testAesSeq0202
     * @tc.number SUB_Huks_AESSQ_0202
     * @tc.desc   组合：41 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0202 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(76));
      expect(result.split('|')[0].length).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(41));
      expect(result.split('|')[1].length).assertEqual(41);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0202 end');
    });

    /**
     * @tc.name   testAesSeq0203
     * @tc.number SUB_Huks_AESSQ_0203
     * @tc.desc   组合：42 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0203 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(80));
      expect(result.split('|')[0].length).assertEqual(80);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(42));
      expect(result.split('|')[1].length).assertEqual(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0203 end');
    });

    /**
     * @tc.name   testAesSeq0204
     * @tc.number SUB_Huks_AESSQ_0204
     * @tc.desc   组合：43 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0204 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(80));
      expect(result.split('|')[0].length).assertEqual(80);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(43));
      expect(result.split('|')[1].length).assertEqual(43);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0204 end');
    });

    /**
     * @tc.name   testAesSeq0205
     * @tc.number SUB_Huks_AESSQ_0205
     * @tc.desc   组合：44 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0205 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(80));
      expect(result.split('|')[0].length).assertEqual(80);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(44));
      expect(result.split('|')[1].length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0205 end');
    });

    /**
     * @tc.name   testAesSeq0206
     * @tc.number SUB_Huks_AESSQ_0206
     * @tc.desc   组合：45 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0206 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(84));
      expect(result.split('|')[0].length).assertEqual(84);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(45));
      expect(result.split('|')[1].length).assertEqual(45);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0206 end');
    });

    /**
     * @tc.name   testAesSeq0207
     * @tc.number SUB_Huks_AESSQ_0207
     * @tc.desc   组合：46 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0207 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(84));
      expect(result.split('|')[0].length).assertEqual(84);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(46));
      expect(result.split('|')[1].length).assertEqual(46);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0207 end');
    });

    /**
     * @tc.name   testAesSeq0208
     * @tc.number SUB_Huks_AESSQ_0208
     * @tc.desc   组合：47 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0208 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(84));
      expect(result.split('|')[0].length).assertEqual(84);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(47));
      expect(result.split('|')[1].length).assertEqual(47);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0208 end');
    });

    /**
     * @tc.name   testAesSeq0209
     * @tc.number SUB_Huks_AESSQ_0209
     * @tc.desc   组合：48 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0209 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(88));
      expect(result.split('|')[0].length).assertEqual(88);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(48));
      expect(result.split('|')[1].length).assertEqual(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0209 end');
    });

    /**
     * @tc.name   testAesSeq0210
     * @tc.number SUB_Huks_AESSQ_0210
     * @tc.desc   组合：49 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0210 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(88));
      expect(result.split('|')[0].length).assertEqual(88);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(49));
      expect(result.split('|')[1].length).assertEqual(49);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0210 end');
    });

    /**
     * @tc.name   testAesSeq0211
     * @tc.number SUB_Huks_AESSQ_0211
     * @tc.desc   组合：50 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0211 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(88));
      expect(result.split('|')[0].length).assertEqual(88);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(50));
      expect(result.split('|')[1].length).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0211 end');
    });

    /**
     * @tc.name   testAesSeq0212
     * @tc.number SUB_Huks_AESSQ_0212
     * @tc.desc   组合：51 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0212 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(92));
      expect(result.split('|')[0].length).assertEqual(92);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(51));
      expect(result.split('|')[1].length).assertEqual(51);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0212 end');
    });

    /**
     * @tc.name   testAesSeq0213
     * @tc.number SUB_Huks_AESSQ_0213
     * @tc.desc   组合：52 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0213 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(92));
      expect(result.split('|')[0].length).assertEqual(92);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(52));
      expect(result.split('|')[1].length).assertEqual(52);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0213 end');
    });

    /**
     * @tc.name   testAesSeq0214
     * @tc.number SUB_Huks_AESSQ_0214
     * @tc.desc   组合：53 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0214 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(92));
      expect(result.split('|')[0].length).assertEqual(92);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(53));
      expect(result.split('|')[1].length).assertEqual(53);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0214 end');
    });

    /**
     * @tc.name   testAesSeq0215
     * @tc.number SUB_Huks_AESSQ_0215
     * @tc.desc   组合：54 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0215 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(96));
      expect(result.split('|')[0].length).assertEqual(96);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(54));
      expect(result.split('|')[1].length).assertEqual(54);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0215 end');
    });

    /**
     * @tc.name   testAesSeq0216
     * @tc.number SUB_Huks_AESSQ_0216
     * @tc.desc   组合：55 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0216 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(96));
      expect(result.split('|')[0].length).assertEqual(96);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(55));
      expect(result.split('|')[1].length).assertEqual(55);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0216 end');
    });

    /**
     * @tc.name   testAesSeq0217
     * @tc.number SUB_Huks_AESSQ_0217
     * @tc.desc   组合：56 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0217 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(96));
      expect(result.split('|')[0].length).assertEqual(96);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(56));
      expect(result.split('|')[1].length).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0217 end');
    });

    /**
     * @tc.name   testAesSeq0218
     * @tc.number SUB_Huks_AESSQ_0218
     * @tc.desc   组合：57 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0218 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(100));
      expect(result.split('|')[0].length).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(57));
      expect(result.split('|')[1].length).assertEqual(57);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0218 end');
    });

    /**
     * @tc.name   testAesSeq0219
     * @tc.number SUB_Huks_AESSQ_0219
     * @tc.desc   组合：58 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0219 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(100));
      expect(result.split('|')[0].length).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(58));
      expect(result.split('|')[1].length).assertEqual(58);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0219 end');
    });

    /**
     * @tc.name   testAesSeq0220
     * @tc.number SUB_Huks_AESSQ_0220
     * @tc.desc   组合：59 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0220 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptData(plain, (cipher: string) => {
    model.decryptData((back: string) => {
      resolve(cipher + '|' + back);
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(100));
      expect(result.split('|')[0].length).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(59));
      expect(result.split('|')[1].length).assertEqual(59);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0220 end');
    });


    /**
     * @tc.name   testAesSeq0221
     * @tc.number SUB_Huks_AESSQ_0221
     * @tc.desc   中文与 emoji 混合明文：Rt中😀X 为 10 字节 UTF-8，密文 26 字节、base64 36，解密为冻结字节串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAesSeq0221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0221 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Rt中😀X';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptData(plain, (cipher: string) => {
          model.decryptData((back: string) => {
            resolve(cipher + '|' + back);
          });
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Rt\u00E4\u00B8\u00AD\u00F0\u009F\u0098\u0080X'));
      expect(result.split('|')[1]).assertEqual('Rt\u00E4\u00B8\u00AD\u00F0\u009F\u0098\u0080X');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(36));
      expect(result.split('|')[0].length).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(26));
      expect(decodeB64(result.split('|')[0]).length).assertEqual(26);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAesSeq0221 end');
    });

  });
}
