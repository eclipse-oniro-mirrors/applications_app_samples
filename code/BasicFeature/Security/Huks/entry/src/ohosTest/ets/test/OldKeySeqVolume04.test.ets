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

export default function oldKeySeqVolume04Test() {
  describe('OldKeySeqVolume04', () => {

    /**
     * @tc.name   testOldKeySeq0154
     * @tc.number SUB_Huks_OKSQ_0154
     * @tc.desc   组合：1 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0154 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'S';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('S'));
      expect(result.split('|')[1]).assertEqual('S');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(24));
      expect(result.split('|')[0].length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(1));
      expect(result.split('|')[1].length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0154 end');
    });
    /**
     * @tc.name   testOldKeySeq0155
     * @tc.number SUB_Huks_OKSQ_0155
     * @tc.desc   组合：2 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0155 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sx'));
      expect(result.split('|')[1]).assertEqual('Sx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(24));
      expect(result.split('|')[0].length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(2));
      expect(result.split('|')[1].length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0155 end');
    });
    /**
     * @tc.name   testOldKeySeq0156
     * @tc.number SUB_Huks_OKSQ_0156
     * @tc.desc   组合：3 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0156 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxx'));
      expect(result.split('|')[1]).assertEqual('Sxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(24));
      expect(result.split('|')[0].length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(3));
      expect(result.split('|')[1].length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0156 end');
    });
    /**
     * @tc.name   testOldKeySeq0157
     * @tc.number SUB_Huks_OKSQ_0157
     * @tc.desc   组合：4 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0157 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(24));
      expect(result.split('|')[0].length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(4));
      expect(result.split('|')[1].length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0157 end');
    });
    /**
     * @tc.name   testOldKeySeq0158
     * @tc.number SUB_Huks_OKSQ_0158
     * @tc.desc   组合：5 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0158 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(24));
      expect(result.split('|')[0].length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(5));
      expect(result.split('|')[1].length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0158 end');
    });
    /**
     * @tc.name   testOldKeySeq0159
     * @tc.number SUB_Huks_OKSQ_0159
     * @tc.desc   组合：6 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0159 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(24));
      expect(result.split('|')[0].length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(6));
      expect(result.split('|')[1].length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0159 end');
    });
    /**
     * @tc.name   testOldKeySeq0160
     * @tc.number SUB_Huks_OKSQ_0160
     * @tc.desc   组合：7 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0160 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(24));
      expect(result.split('|')[0].length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(7));
      expect(result.split('|')[1].length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0160 end');
    });
    /**
     * @tc.name   testOldKeySeq0161
     * @tc.number SUB_Huks_OKSQ_0161
     * @tc.desc   组合：8 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0161 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(24));
      expect(result.split('|')[0].length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(8));
      expect(result.split('|')[1].length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0161 end');
    });
    /**
     * @tc.name   testOldKeySeq0162
     * @tc.number SUB_Huks_OKSQ_0162
     * @tc.desc   组合：9 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0162 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(24));
      expect(result.split('|')[0].length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(9));
      expect(result.split('|')[1].length).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0162 end');
    });
    /**
     * @tc.name   testOldKeySeq0163
     * @tc.number SUB_Huks_OKSQ_0163
     * @tc.desc   组合：10 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0163 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(24));
      expect(result.split('|')[0].length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(10));
      expect(result.split('|')[1].length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0163 end');
    });
    /**
     * @tc.name   testOldKeySeq0164
     * @tc.number SUB_Huks_OKSQ_0164
     * @tc.desc   组合：11 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0164 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(24));
      expect(result.split('|')[0].length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(11));
      expect(result.split('|')[1].length).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0164 end');
    });
    /**
     * @tc.name   testOldKeySeq0165
     * @tc.number SUB_Huks_OKSQ_0165
     * @tc.desc   组合：12 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0165 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(24));
      expect(result.split('|')[0].length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(12));
      expect(result.split('|')[1].length).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0165 end');
    });
    /**
     * @tc.name   testOldKeySeq0166
     * @tc.number SUB_Huks_OKSQ_0166
     * @tc.desc   组合：13 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0166 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(24));
      expect(result.split('|')[0].length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(13));
      expect(result.split('|')[1].length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0166 end');
    });
    /**
     * @tc.name   testOldKeySeq0167
     * @tc.number SUB_Huks_OKSQ_0167
     * @tc.desc   组合：14 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0167 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(24));
      expect(result.split('|')[0].length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(14));
      expect(result.split('|')[1].length).assertEqual(14);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0167 end');
    });
    /**
     * @tc.name   testOldKeySeq0168
     * @tc.number SUB_Huks_OKSQ_0168
     * @tc.desc   组合：15 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0168 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(24));
      expect(result.split('|')[0].length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(15));
      expect(result.split('|')[1].length).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0168 end');
    });
    /**
     * @tc.name   testOldKeySeq0169
     * @tc.number SUB_Huks_OKSQ_0169
     * @tc.desc   组合：16 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0169 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(44));
      expect(result.split('|')[0].length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(16));
      expect(result.split('|')[1].length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0169 end');
    });
    /**
     * @tc.name   testOldKeySeq0170
     * @tc.number SUB_Huks_OKSQ_0170
     * @tc.desc   组合：17 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0170 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(44));
      expect(result.split('|')[0].length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(17));
      expect(result.split('|')[1].length).assertEqual(17);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0170 end');
    });
    /**
     * @tc.name   testOldKeySeq0171
     * @tc.number SUB_Huks_OKSQ_0171
     * @tc.desc   组合：18 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0171 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(44));
      expect(result.split('|')[0].length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(18));
      expect(result.split('|')[1].length).assertEqual(18);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0171 end');
    });
    /**
     * @tc.name   testOldKeySeq0172
     * @tc.number SUB_Huks_OKSQ_0172
     * @tc.desc   组合：19 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0172 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(44));
      expect(result.split('|')[0].length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(19));
      expect(result.split('|')[1].length).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0172 end');
    });
    /**
     * @tc.name   testOldKeySeq0173
     * @tc.number SUB_Huks_OKSQ_0173
     * @tc.desc   组合：20 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0173 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(44));
      expect(result.split('|')[0].length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(20));
      expect(result.split('|')[1].length).assertEqual(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0173 end');
    });
    /**
     * @tc.name   testOldKeySeq0174
     * @tc.number SUB_Huks_OKSQ_0174
     * @tc.desc   组合：21 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0174 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(44));
      expect(result.split('|')[0].length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(21));
      expect(result.split('|')[1].length).assertEqual(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0174 end');
    });
    /**
     * @tc.name   testOldKeySeq0175
     * @tc.number SUB_Huks_OKSQ_0175
     * @tc.desc   组合：22 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0175 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(44));
      expect(result.split('|')[0].length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(22));
      expect(result.split('|')[1].length).assertEqual(22);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0175 end');
    });
    /**
     * @tc.name   testOldKeySeq0176
     * @tc.number SUB_Huks_OKSQ_0176
     * @tc.desc   组合：23 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0176 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(44));
      expect(result.split('|')[0].length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(23));
      expect(result.split('|')[1].length).assertEqual(23);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0176 end');
    });
    /**
     * @tc.name   testOldKeySeq0177
     * @tc.number SUB_Huks_OKSQ_0177
     * @tc.desc   组合：24 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0177 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(44));
      expect(result.split('|')[0].length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(24));
      expect(result.split('|')[1].length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0177 end');
    });
    /**
     * @tc.name   testOldKeySeq0178
     * @tc.number SUB_Huks_OKSQ_0178
     * @tc.desc   组合：25 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0178 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(44));
      expect(result.split('|')[0].length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(25));
      expect(result.split('|')[1].length).assertEqual(25);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0178 end');
    });
    /**
     * @tc.name   testOldKeySeq0179
     * @tc.number SUB_Huks_OKSQ_0179
     * @tc.desc   组合：26 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0179 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(44));
      expect(result.split('|')[0].length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(26));
      expect(result.split('|')[1].length).assertEqual(26);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0179 end');
    });
    /**
     * @tc.name   testOldKeySeq0180
     * @tc.number SUB_Huks_OKSQ_0180
     * @tc.desc   组合：27 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0180 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(44));
      expect(result.split('|')[0].length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(27));
      expect(result.split('|')[1].length).assertEqual(27);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0180 end');
    });
    /**
     * @tc.name   testOldKeySeq0181
     * @tc.number SUB_Huks_OKSQ_0181
     * @tc.desc   组合：28 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0181 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(44));
      expect(result.split('|')[0].length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(28));
      expect(result.split('|')[1].length).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0181 end');
    });
    /**
     * @tc.name   testOldKeySeq0182
     * @tc.number SUB_Huks_OKSQ_0182
     * @tc.desc   组合：29 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0182 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(44));
      expect(result.split('|')[0].length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(29));
      expect(result.split('|')[1].length).assertEqual(29);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0182 end');
    });
    /**
     * @tc.name   testOldKeySeq0183
     * @tc.number SUB_Huks_OKSQ_0183
     * @tc.desc   组合：30 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0183 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(44));
      expect(result.split('|')[0].length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(30));
      expect(result.split('|')[1].length).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0183 end');
    });
    /**
     * @tc.name   testOldKeySeq0184
     * @tc.number SUB_Huks_OKSQ_0184
     * @tc.desc   组合：31 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0184 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(44));
      expect(result.split('|')[0].length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(31));
      expect(result.split('|')[1].length).assertEqual(31);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0184 end');
    });
    /**
     * @tc.name   testOldKeySeq0185
     * @tc.number SUB_Huks_OKSQ_0185
     * @tc.desc   组合：32 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0185 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(64));
      expect(result.split('|')[0].length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(32));
      expect(result.split('|')[1].length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0185 end');
    });
    /**
     * @tc.name   testOldKeySeq0186
     * @tc.number SUB_Huks_OKSQ_0186
     * @tc.desc   组合：33 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0186 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(64));
      expect(result.split('|')[0].length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(33));
      expect(result.split('|')[1].length).assertEqual(33);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0186 end');
    });
    /**
     * @tc.name   testOldKeySeq0187
     * @tc.number SUB_Huks_OKSQ_0187
     * @tc.desc   组合：34 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0187 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(64));
      expect(result.split('|')[0].length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(34));
      expect(result.split('|')[1].length).assertEqual(34);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0187 end');
    });
    /**
     * @tc.name   testOldKeySeq0188
     * @tc.number SUB_Huks_OKSQ_0188
     * @tc.desc   组合：35 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0188 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(64));
      expect(result.split('|')[0].length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(35));
      expect(result.split('|')[1].length).assertEqual(35);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0188 end');
    });
    /**
     * @tc.name   testOldKeySeq0189
     * @tc.number SUB_Huks_OKSQ_0189
     * @tc.desc   组合：36 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0189 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(64));
      expect(result.split('|')[0].length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(36));
      expect(result.split('|')[1].length).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0189 end');
    });
    /**
     * @tc.name   testOldKeySeq0190
     * @tc.number SUB_Huks_OKSQ_0190
     * @tc.desc   组合：37 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0190 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(64));
      expect(result.split('|')[0].length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(37));
      expect(result.split('|')[1].length).assertEqual(37);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0190 end');
    });
    /**
     * @tc.name   testOldKeySeq0191
     * @tc.number SUB_Huks_OKSQ_0191
     * @tc.desc   组合：38 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0191 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(64));
      expect(result.split('|')[0].length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(38));
      expect(result.split('|')[1].length).assertEqual(38);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0191 end');
    });
    /**
     * @tc.name   testOldKeySeq0192
     * @tc.number SUB_Huks_OKSQ_0192
     * @tc.desc   组合：39 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0192 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(64));
      expect(result.split('|')[0].length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(39));
      expect(result.split('|')[1].length).assertEqual(39);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0192 end');
    });
    /**
     * @tc.name   testOldKeySeq0193
     * @tc.number SUB_Huks_OKSQ_0193
     * @tc.desc   组合：40 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0193 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(64));
      expect(result.split('|')[0].length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(40));
      expect(result.split('|')[1].length).assertEqual(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0193 end');
    });
    /**
     * @tc.name   testOldKeySeq0194
     * @tc.number SUB_Huks_OKSQ_0194
     * @tc.desc   组合：41 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0194 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(64));
      expect(result.split('|')[0].length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(41));
      expect(result.split('|')[1].length).assertEqual(41);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0194 end');
    });
    /**
     * @tc.name   testOldKeySeq0195
     * @tc.number SUB_Huks_OKSQ_0195
     * @tc.desc   组合：42 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0195 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(64));
      expect(result.split('|')[0].length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(42));
      expect(result.split('|')[1].length).assertEqual(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0195 end');
    });
    /**
     * @tc.name   testOldKeySeq0196
     * @tc.number SUB_Huks_OKSQ_0196
     * @tc.desc   组合：43 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0196 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(64));
      expect(result.split('|')[0].length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(43));
      expect(result.split('|')[1].length).assertEqual(43);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0196 end');
    });
    /**
     * @tc.name   testOldKeySeq0197
     * @tc.number SUB_Huks_OKSQ_0197
     * @tc.desc   组合：44 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0197 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(64));
      expect(result.split('|')[0].length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(44));
      expect(result.split('|')[1].length).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0197 end');
    });
    /**
     * @tc.name   testOldKeySeq0198
     * @tc.number SUB_Huks_OKSQ_0198
     * @tc.desc   组合：45 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0198 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(64));
      expect(result.split('|')[0].length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(45));
      expect(result.split('|')[1].length).assertEqual(45);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0198 end');
    });
    /**
     * @tc.name   testOldKeySeq0199
     * @tc.number SUB_Huks_OKSQ_0199
     * @tc.desc   组合：46 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0199 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(64));
      expect(result.split('|')[0].length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(46));
      expect(result.split('|')[1].length).assertEqual(46);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0199 end');
    });
    /**
     * @tc.name   testOldKeySeq0200
     * @tc.number SUB_Huks_OKSQ_0200
     * @tc.desc   组合：47 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0200 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(64));
      expect(result.split('|')[0].length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(47));
      expect(result.split('|')[1].length).assertEqual(47);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0200 end');
    });
    /**
     * @tc.name   testOldKeySeq0201
     * @tc.number SUB_Huks_OKSQ_0201
     * @tc.desc   组合：48 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0201 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(88));
      expect(result.split('|')[0].length).assertEqual(88);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(48));
      expect(result.split('|')[1].length).assertEqual(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0201 end');
    });
    /**
     * @tc.name   testOldKeySeq0202
     * @tc.number SUB_Huks_OKSQ_0202
     * @tc.desc   组合：49 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0202 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(88));
      expect(result.split('|')[0].length).assertEqual(88);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(49));
      expect(result.split('|')[1].length).assertEqual(49);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0202 end');
    });
    /**
     * @tc.name   testOldKeySeq0203
     * @tc.number SUB_Huks_OKSQ_0203
     * @tc.desc   组合：50 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0203 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(88));
      expect(result.split('|')[0].length).assertEqual(88);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(50));
      expect(result.split('|')[1].length).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0203 end');
    });
    /**
     * @tc.name   testOldKeySeq0204
     * @tc.number SUB_Huks_OKSQ_0204
     * @tc.desc   组合：51 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0204 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(88));
      expect(result.split('|')[0].length).assertEqual(88);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(51));
      expect(result.split('|')[1].length).assertEqual(51);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0204 end');
    });
    /**
     * @tc.name   testOldKeySeq0205
     * @tc.number SUB_Huks_OKSQ_0205
     * @tc.desc   组合：52 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0205 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(88));
      expect(result.split('|')[0].length).assertEqual(88);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(52));
      expect(result.split('|')[1].length).assertEqual(52);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0205 end');
    });
    /**
     * @tc.name   testOldKeySeq0206
     * @tc.number SUB_Huks_OKSQ_0206
     * @tc.desc   组合：53 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0206 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(88));
      expect(result.split('|')[0].length).assertEqual(88);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(53));
      expect(result.split('|')[1].length).assertEqual(53);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0206 end');
    });
    /**
     * @tc.name   testOldKeySeq0207
     * @tc.number SUB_Huks_OKSQ_0207
     * @tc.desc   组合：54 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0207 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(88));
      expect(result.split('|')[0].length).assertEqual(88);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(54));
      expect(result.split('|')[1].length).assertEqual(54);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0207 end');
    });
    /**
     * @tc.name   testOldKeySeq0208
     * @tc.number SUB_Huks_OKSQ_0208
     * @tc.desc   组合：55 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0208 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(88));
      expect(result.split('|')[0].length).assertEqual(88);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(55));
      expect(result.split('|')[1].length).assertEqual(55);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0208 end');
    });
    /**
     * @tc.name   testOldKeySeq0209
     * @tc.number SUB_Huks_OKSQ_0209
     * @tc.desc   组合：56 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0209 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(88));
      expect(result.split('|')[0].length).assertEqual(88);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(56));
      expect(result.split('|')[1].length).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0209 end');
    });
    /**
     * @tc.name   testOldKeySeq0210
     * @tc.number SUB_Huks_OKSQ_0210
     * @tc.desc   组合：57 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0210 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(88));
      expect(result.split('|')[0].length).assertEqual(88);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(57));
      expect(result.split('|')[1].length).assertEqual(57);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0210 end');
    });
    /**
     * @tc.name   testOldKeySeq0211
     * @tc.number SUB_Huks_OKSQ_0211
     * @tc.desc   组合：58 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0211 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(88));
      expect(result.split('|')[0].length).assertEqual(88);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(58));
      expect(result.split('|')[1].length).assertEqual(58);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0211 end');
    });
    /**
     * @tc.name   testOldKeySeq0212
     * @tc.number SUB_Huks_OKSQ_0212
     * @tc.desc   组合：59 字符字面值往返
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0212 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
  model.encryptDataUserOldKey(plain, (cipher: string) => {
    model.importKey().then(() => {
      model.decryptDataUserOldKey((back: string) => {
        resolve(cipher + '|' + back);
      });
    });
  });
});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'));
      expect(result.split('|')[1]).assertEqual('Sxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(88));
      expect(result.split('|')[0].length).assertEqual(88);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1].length), String(59));
      expect(result.split('|')[1].length).assertEqual(59);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0212 end');
    });


    /**
     * @tc.name   testOldKeySeq0213
     * @tc.number SUB_Huks_OKSQ_0213
     * @tc.desc   Sm中😀X 混合明文：6 个 UTF-16 单元取低 8 位后补块到 16，base64 24，解密为冻结字节串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOldKeySeq0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0213 begin');
      const model: HuksModel = new HuksModel();
      const plain: string = 'Sm中😀X';
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptDataUserOldKey(plain, (cipher: string) => {
          model.importKey().then(() => {
            model.decryptDataUserOldKey((back: string) => {
              resolve(cipher + '|' + back);
            });
          });
        });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[1]), String('Sm\u002D\u003D\u0000X'));
      expect(result.split('|')[1]).assertEqual('Sm\u002D\u003D\u0000X');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split('|')[0].length), String(24));
      expect(result.split('|')[0].length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(decodeB64(result.split('|')[0]).length), String(16));
      expect(decodeB64(result.split('|')[0]).length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testOldKeySeq0213 end');
    });

  });
}
