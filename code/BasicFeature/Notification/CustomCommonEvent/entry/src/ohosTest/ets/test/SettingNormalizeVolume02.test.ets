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
import settingFeature from '../../../main/ets/feature/SettingFeature';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_CustomCommonEvent]';

export default function settingNormalizeVolume02Test(): void {
  describe('SettingNormalizeVolume02Test', () => {

    /**
     * @tc.name   testSettingNormalizeVolume020001
     * @tc.number SUB_CCE_SETNORM_02_0001
     * @tc.desc   state=25 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020001 begin');
      const state: number = 25;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020001 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020002
     * @tc.number SUB_CCE_SETNORM_02_0002
     * @tc.desc   state=26 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020002 begin');
      const state: number = 26;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020002 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020003
     * @tc.number SUB_CCE_SETNORM_02_0003
     * @tc.desc   state=27 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020003 begin');
      const state: number = 27;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020003 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020004
     * @tc.number SUB_CCE_SETNORM_02_0004
     * @tc.desc   state=28 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020004 begin');
      const state: number = 28;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020004 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020005
     * @tc.number SUB_CCE_SETNORM_02_0005
     * @tc.desc   state=29 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020005 begin');
      const state: number = 29;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020005 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020006
     * @tc.number SUB_CCE_SETNORM_02_0006
     * @tc.desc   state=30 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020006 begin');
      const state: number = 30;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020006 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020007
     * @tc.number SUB_CCE_SETNORM_02_0007
     * @tc.desc   state=31 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020007 begin');
      const state: number = 31;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020007 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020008
     * @tc.number SUB_CCE_SETNORM_02_0008
     * @tc.desc   state=32 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020008 begin');
      const state: number = 32;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020008 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020009
     * @tc.number SUB_CCE_SETNORM_02_0009
     * @tc.desc   state=33 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020009 begin');
      const state: number = 33;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020009 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020010
     * @tc.number SUB_CCE_SETNORM_02_0010
     * @tc.desc   state=34 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020010 begin');
      const state: number = 34;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020010 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020011
     * @tc.number SUB_CCE_SETNORM_02_0011
     * @tc.desc   state=35 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020011 begin');
      const state: number = 35;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020011 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020012
     * @tc.number SUB_CCE_SETNORM_02_0012
     * @tc.desc   state=36 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020012 begin');
      const state: number = 36;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020012 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020013
     * @tc.number SUB_CCE_SETNORM_02_0013
     * @tc.desc   state=37 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020013 begin');
      const state: number = 37;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020013 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020014
     * @tc.number SUB_CCE_SETNORM_02_0014
     * @tc.desc   state=38 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020014 begin');
      const state: number = 38;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020014 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020015
     * @tc.number SUB_CCE_SETNORM_02_0015
     * @tc.desc   state=39 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020015 begin');
      const state: number = 39;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020015 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020016
     * @tc.number SUB_CCE_SETNORM_02_0016
     * @tc.desc   state=40 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020016 begin');
      const state: number = 40;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020016 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020017
     * @tc.number SUB_CCE_SETNORM_02_0017
     * @tc.desc   state=-21 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020017 begin');
      const state: number = -21;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020017 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020018
     * @tc.number SUB_CCE_SETNORM_02_0018
     * @tc.desc   state=-22 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020018 begin');
      const state: number = -22;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020018 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020019
     * @tc.number SUB_CCE_SETNORM_02_0019
     * @tc.desc   state=-23 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020019 begin');
      const state: number = -23;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020019 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020020
     * @tc.number SUB_CCE_SETNORM_02_0020
     * @tc.desc   state=-24 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020020 begin');
      const state: number = -24;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020020 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020021
     * @tc.number SUB_CCE_SETNORM_02_0021
     * @tc.desc   state=-25 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020021 begin');
      const state: number = -25;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020021 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020022
     * @tc.number SUB_CCE_SETNORM_02_0022
     * @tc.desc   state=-26 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020022 begin');
      const state: number = -26;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020022 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020023
     * @tc.number SUB_CCE_SETNORM_02_0023
     * @tc.desc   state=-27 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020023 begin');
      const state: number = -27;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020023 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020024
     * @tc.number SUB_CCE_SETNORM_02_0024
     * @tc.desc   state=-28 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020024 begin');
      const state: number = -28;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020024 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020025
     * @tc.number SUB_CCE_SETNORM_02_0025
     * @tc.desc   state=-29 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020025 begin');
      const state: number = -29;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020025 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020026
     * @tc.number SUB_CCE_SETNORM_02_0026
     * @tc.desc   state=-30 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020026 begin');
      const state: number = -30;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020026 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020027
     * @tc.number SUB_CCE_SETNORM_02_0027
     * @tc.desc   state=-31 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020027 begin');
      const state: number = -31;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020027 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020028
     * @tc.number SUB_CCE_SETNORM_02_0028
     * @tc.desc   state=-32 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020028 begin');
      const state: number = -32;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020028 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020029
     * @tc.number SUB_CCE_SETNORM_02_0029
     * @tc.desc   state=-33 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020029 begin');
      const state: number = -33;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020029 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020030
     * @tc.number SUB_CCE_SETNORM_02_0030
     * @tc.desc   state=-34 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020030 begin');
      const state: number = -34;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020030 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020031
     * @tc.number SUB_CCE_SETNORM_02_0031
     * @tc.desc   state=-35 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020031 begin');
      const state: number = -35;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020031 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020032
     * @tc.number SUB_CCE_SETNORM_02_0032
     * @tc.desc   state=-36 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020032 begin');
      const state: number = -36;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020032 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020033
     * @tc.number SUB_CCE_SETNORM_02_0033
     * @tc.desc   state=0.5 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020033 begin');
      const state: number = 0.5;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020033 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020034
     * @tc.number SUB_CCE_SETNORM_02_0034
     * @tc.desc   state=1.5 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020034 begin');
      const state: number = 1.5;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020034 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020035
     * @tc.number SUB_CCE_SETNORM_02_0035
     * @tc.desc   state=2.5 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020035 begin');
      const state: number = 2.5;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020035 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020036
     * @tc.number SUB_CCE_SETNORM_02_0036
     * @tc.desc   state=3.5 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020036 begin');
      const state: number = 3.5;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020036 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020037
     * @tc.number SUB_CCE_SETNORM_02_0037
     * @tc.desc   state=0.1 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020037 begin');
      const state: number = 0.1;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020037 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020038
     * @tc.number SUB_CCE_SETNORM_02_0038
     * @tc.desc   state=0.9 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020038 begin');
      const state: number = 0.9;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020038 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020039
     * @tc.number SUB_CCE_SETNORM_02_0039
     * @tc.desc   state=1.1 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020039 begin');
      const state: number = 1.1;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020039 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020040
     * @tc.number SUB_CCE_SETNORM_02_0040
     * @tc.desc   state=1.9 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020040 begin');
      const state: number = 1.9;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020040 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020041
     * @tc.number SUB_CCE_SETNORM_02_0041
     * @tc.desc   state=-0.5 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020041 begin');
      const state: number = -0.5;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020041 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020042
     * @tc.number SUB_CCE_SETNORM_02_0042
     * @tc.desc   state=-1.5 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020042 begin');
      const state: number = -1.5;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020042 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020043
     * @tc.number SUB_CCE_SETNORM_02_0043
     * @tc.desc   state=-2.5 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020043 begin');
      const state: number = -2.5;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020043 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020044
     * @tc.number SUB_CCE_SETNORM_02_0044
     * @tc.desc   state=99.5 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020044 begin');
      const state: number = 99.5;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020044 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020045
     * @tc.number SUB_CCE_SETNORM_02_0045
     * @tc.desc   state=-99.5 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020045 begin');
      const state: number = -99.5;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020045 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020046
     * @tc.number SUB_CCE_SETNORM_02_0046
     * @tc.desc   state=123456.789 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020046 begin');
      const state: number = 123456.789;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020046 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020047
     * @tc.number SUB_CCE_SETNORM_02_0047
     * @tc.desc   state=-123456.789 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020047 begin');
      const state: number = -123456.789;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020047 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020048
     * @tc.number SUB_CCE_SETNORM_02_0048
     * @tc.desc   state=10000000000 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020048 begin');
      const state: number = 10000000000;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020048 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020049
     * @tc.number SUB_CCE_SETNORM_02_0049
     * @tc.desc   state=-10000000000 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020049 begin');
      const state: number = -10000000000;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020049 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020050
     * @tc.number SUB_CCE_SETNORM_02_0050
     * @tc.desc   state=1000000000000000 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020050 begin');
      const state: number = 1000000000000000;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020050 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume020051
     * @tc.number SUB_CCE_SETNORM_02_0051
     * @tc.desc   NaN 与正无穷经 normalizeState 统一回落 2，仍满足三态整数约束
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume020051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020051 begin');
      const nanState: number = settingFeature.normalizeState(Number.NaN);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(nanState), '2');
      expect(nanState).assertEqual(2);
      const infState: number = settingFeature.normalizeState(Number.POSITIVE_INFINITY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(infState), '2');
      expect(infState).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(nanState % 1 === 0 && infState % 1 === 0));
      expect(nanState % 1 === 0 && infState % 1 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume020051 end');
    })
  })
}
