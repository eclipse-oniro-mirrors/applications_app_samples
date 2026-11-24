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
import { Flag } from '../../../main/ets/pages/Index';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_Huks]';

export default function apiSmokeVolume01Test() {
  describe('ApiSmokeVolume01', () => {

    /**
     * @tc.name   testApiSmoke0001
     * @tc.number SUB_Huks_APISMK_0001
     * @tc.desc   API 面：encryptData(plainText, resultCallback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0001 begin');
      const model: HuksModel = new HuksModel();
      const result: number = model.encryptData.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof model.encryptData === 'undefined'));
      expect(typeof model.encryptData === 'undefined').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof model.encryptData === 'function'));
      expect(typeof model.encryptData === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0001 end');
    });

    /**
     * @tc.name   testApiSmoke0002
     * @tc.number SUB_Huks_APISMK_0002
     * @tc.desc   API 面：decryptData(resultCallback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0002 begin');
      const model: HuksModel = new HuksModel();
      const result: number = model.decryptData.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof model.decryptData === 'undefined'));
      expect(typeof model.decryptData === 'undefined').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof model.decryptData === 'function'));
      expect(typeof model.decryptData === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0002 end');
    });

    /**
     * @tc.name   testApiSmoke0003
     * @tc.number SUB_Huks_APISMK_0003
     * @tc.desc   API 面：encryptDataUseSm2(plainText, resultCallback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0003 begin');
      const model: HuksModel = new HuksModel();
      const result: number = model.encryptDataUseSm2.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof model.encryptDataUseSm2 === 'undefined'));
      expect(typeof model.encryptDataUseSm2 === 'undefined').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof model.encryptDataUseSm2 === 'function'));
      expect(typeof model.encryptDataUseSm2 === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0003 end');
    });

    /**
     * @tc.name   testApiSmoke0004
     * @tc.number SUB_Huks_APISMK_0004
     * @tc.desc   API 面：finishSession(handle, options, resultCallback, authToken)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0004 begin');
      const model: HuksModel = new HuksModel();
      const result: number = model.finishSession.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof model.finishSession === 'undefined'));
      expect(typeof model.finishSession === 'undefined').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof model.finishSession === 'function'));
      expect(typeof model.finishSession === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(4));
      expect(result).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0004 end');
    });

    /**
     * @tc.name   testApiSmoke0005
     * @tc.number SUB_Huks_APISMK_0005
     * @tc.desc   API 面：userIAMAuthFinger(finishSessionFunction, param)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0005 begin');
      const model: HuksModel = new HuksModel();
      const result: number = model.userIAMAuthFinger.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof model.userIAMAuthFinger === 'undefined'));
      expect(typeof model.userIAMAuthFinger === 'undefined').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof model.userIAMAuthFinger === 'function'));
      expect(typeof model.userIAMAuthFinger === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0005 end');
    });

    /**
     * @tc.name   testApiSmoke0006
     * @tc.number SUB_Huks_APISMK_0006
     * @tc.desc   API 面：decryptDataUseSm2(resultCallback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0006 begin');
      const model: HuksModel = new HuksModel();
      const result: number = model.decryptDataUseSm2.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof model.decryptDataUseSm2 === 'undefined'));
      expect(typeof model.decryptDataUseSm2 === 'undefined').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof model.decryptDataUseSm2 === 'function'));
      expect(typeof model.decryptDataUseSm2 === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0006 end');
    });

    /**
     * @tc.name   testApiSmoke0007
     * @tc.number SUB_Huks_APISMK_0007
     * @tc.desc   API 面：encryptDataUserOldKey(plainText, resultCallback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0007 begin');
      const model: HuksModel = new HuksModel();
      const result: number = model.encryptDataUserOldKey.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof model.encryptDataUserOldKey === 'undefined'));
      expect(typeof model.encryptDataUserOldKey === 'undefined').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof model.encryptDataUserOldKey === 'function'));
      expect(typeof model.encryptDataUserOldKey === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0007 end');
    });

    /**
     * @tc.name   testApiSmoke0008
     * @tc.number SUB_Huks_APISMK_0008
     * @tc.desc   API 面：importKey()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0008 begin');
      const model: HuksModel = new HuksModel();
      const result: number = model.importKey.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof model.importKey === 'undefined'));
      expect(typeof model.importKey === 'undefined').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof model.importKey === 'function'));
      expect(typeof model.importKey === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0008 end');
    });

    /**
     * @tc.name   testApiSmoke0009
     * @tc.number SUB_Huks_APISMK_0009
     * @tc.desc   API 面：decryptDataUserOldKey(resultCallback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0009 begin');
      const model: HuksModel = new HuksModel();
      const result: number = model.decryptDataUserOldKey.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof model.decryptDataUserOldKey === 'undefined'));
      expect(typeof model.decryptDataUserOldKey === 'undefined').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof model.decryptDataUserOldKey === 'function'));
      expect(typeof model.decryptDataUserOldKey === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0009 end');
    });

    /**
     * @tc.name   testApiSmoke0010
     * @tc.number SUB_Huks_APISMK_0010
     * @tc.desc   API 面：HuksModel 无参构造
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0010 begin');
      const model: HuksModel = new HuksModel();
      const result: number = HuksModel.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof HuksModel === 'undefined'));
      expect(typeof HuksModel === 'undefined').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof HuksModel === 'function'));
      expect(typeof HuksModel === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0010 end');
    });

    /**
     * @tc.name   testApiSmoke0011
     * @tc.number SUB_Huks_APISMK_0011
     * @tc.desc   API 面：Flag 无参构造
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0011 begin');
      const model: HuksModel = new HuksModel();
      const result: number = Flag.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof Flag === 'undefined'));
      expect(typeof Flag === 'undefined').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof Flag === 'function'));
      expect(typeof Flag === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0011 end');
    });

    /**
     * @tc.name   testApiSmoke0012
     * @tc.number SUB_Huks_APISMK_0012
     * @tc.desc   API 面：Flag.set(v)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0012 begin');
      const model: HuksModel = new HuksModel();
      const result: number = Flag.set.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof Flag.set === 'undefined'));
      expect(typeof Flag.set === 'undefined').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof Flag.set === 'function'));
      expect(typeof Flag.set === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0012 end');
    });

    /**
     * @tc.name   testApiSmoke0013
     * @tc.number SUB_Huks_APISMK_0013
     * @tc.desc   单字符 '!' 加密解密往返，密文 24 字符且明文恢复
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiSmoke0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0013 begin');
      const model: HuksModel = new HuksModel();
      const cipher: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.encryptData('!', (c: string) => { resolve(c); });
      });
      const restored: string = await new Promise<string>((resolve: (value: string) => void) => {
        model.decryptData((d: string) => { resolve(d); });
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher.length), String(24));
      expect(cipher.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored), String('!'));
      expect(restored).assertEqual('!');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored.length), String(1));
      expect(restored.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiSmoke0013 end');
    });

  });
}
