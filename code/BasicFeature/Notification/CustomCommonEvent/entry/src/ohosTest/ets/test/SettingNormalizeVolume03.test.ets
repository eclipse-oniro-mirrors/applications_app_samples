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

export default function settingNormalizeVolume03Test(): void {
  describe('SettingNormalizeVolume03Test', () => {

    /**
     * @tc.name   testSettingNormalizeVolume030001
     * @tc.number SUB_CCE_SETNORM_03_0001
     * @tc.desc   state=41 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030001 begin');
      const state: number = 41;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030001 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030002
     * @tc.number SUB_CCE_SETNORM_03_0002
     * @tc.desc   state=42 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030002 begin');
      const state: number = 42;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030002 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030003
     * @tc.number SUB_CCE_SETNORM_03_0003
     * @tc.desc   state=43 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030003 begin');
      const state: number = 43;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030003 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030004
     * @tc.number SUB_CCE_SETNORM_03_0004
     * @tc.desc   state=44 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030004 begin');
      const state: number = 44;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030004 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030005
     * @tc.number SUB_CCE_SETNORM_03_0005
     * @tc.desc   state=45 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030005 begin');
      const state: number = 45;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030005 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030006
     * @tc.number SUB_CCE_SETNORM_03_0006
     * @tc.desc   state=46 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030006 begin');
      const state: number = 46;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030006 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030007
     * @tc.number SUB_CCE_SETNORM_03_0007
     * @tc.desc   state=47 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030007 begin');
      const state: number = 47;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030007 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030008
     * @tc.number SUB_CCE_SETNORM_03_0008
     * @tc.desc   state=48 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030008 begin');
      const state: number = 48;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030008 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030009
     * @tc.number SUB_CCE_SETNORM_03_0009
     * @tc.desc   state=49 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030009 begin');
      const state: number = 49;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030009 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030010
     * @tc.number SUB_CCE_SETNORM_03_0010
     * @tc.desc   state=50 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030010 begin');
      const state: number = 50;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030010 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030011
     * @tc.number SUB_CCE_SETNORM_03_0011
     * @tc.desc   state=51 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030011 begin');
      const state: number = 51;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030011 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030012
     * @tc.number SUB_CCE_SETNORM_03_0012
     * @tc.desc   state=52 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030012 begin');
      const state: number = 52;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030012 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030013
     * @tc.number SUB_CCE_SETNORM_03_0013
     * @tc.desc   state=53 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030013 begin');
      const state: number = 53;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030013 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030014
     * @tc.number SUB_CCE_SETNORM_03_0014
     * @tc.desc   state=54 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030014 begin');
      const state: number = 54;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030014 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030015
     * @tc.number SUB_CCE_SETNORM_03_0015
     * @tc.desc   state=55 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030015 begin');
      const state: number = 55;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030015 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030016
     * @tc.number SUB_CCE_SETNORM_03_0016
     * @tc.desc   state=56 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030016 begin');
      const state: number = 56;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030016 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030017
     * @tc.number SUB_CCE_SETNORM_03_0017
     * @tc.desc   state=57 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030017 begin');
      const state: number = 57;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030017 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030018
     * @tc.number SUB_CCE_SETNORM_03_0018
     * @tc.desc   state=58 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030018 begin');
      const state: number = 58;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030018 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030019
     * @tc.number SUB_CCE_SETNORM_03_0019
     * @tc.desc   state=59 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030019 begin');
      const state: number = 59;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030019 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030020
     * @tc.number SUB_CCE_SETNORM_03_0020
     * @tc.desc   state=60 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030020 begin');
      const state: number = 60;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030020 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030021
     * @tc.number SUB_CCE_SETNORM_03_0021
     * @tc.desc   state=-37 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030021 begin');
      const state: number = -37;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030021 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030022
     * @tc.number SUB_CCE_SETNORM_03_0022
     * @tc.desc   state=-38 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030022 begin');
      const state: number = -38;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030022 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030023
     * @tc.number SUB_CCE_SETNORM_03_0023
     * @tc.desc   state=-39 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030023 begin');
      const state: number = -39;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030023 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030024
     * @tc.number SUB_CCE_SETNORM_03_0024
     * @tc.desc   state=-40 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030024 begin');
      const state: number = -40;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030024 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030025
     * @tc.number SUB_CCE_SETNORM_03_0025
     * @tc.desc   state=-41 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030025 begin');
      const state: number = -41;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030025 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030026
     * @tc.number SUB_CCE_SETNORM_03_0026
     * @tc.desc   state=-42 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030026 begin');
      const state: number = -42;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030026 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030027
     * @tc.number SUB_CCE_SETNORM_03_0027
     * @tc.desc   state=-43 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030027 begin');
      const state: number = -43;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030027 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030028
     * @tc.number SUB_CCE_SETNORM_03_0028
     * @tc.desc   state=-44 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030028 begin');
      const state: number = -44;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030028 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030029
     * @tc.number SUB_CCE_SETNORM_03_0029
     * @tc.desc   state=-45 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030029 begin');
      const state: number = -45;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030029 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030030
     * @tc.number SUB_CCE_SETNORM_03_0030
     * @tc.desc   state=-46 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030030 begin');
      const state: number = -46;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030030 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030031
     * @tc.number SUB_CCE_SETNORM_03_0031
     * @tc.desc   state=-47 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030031 begin');
      const state: number = -47;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030031 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030032
     * @tc.number SUB_CCE_SETNORM_03_0032
     * @tc.desc   state=-48 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030032 begin');
      const state: number = -48;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030032 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030033
     * @tc.number SUB_CCE_SETNORM_03_0033
     * @tc.desc   state=-49 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030033 begin');
      const state: number = -49;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030033 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030034
     * @tc.number SUB_CCE_SETNORM_03_0034
     * @tc.desc   state=-50 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030034 begin');
      const state: number = -50;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030034 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030035
     * @tc.number SUB_CCE_SETNORM_03_0035
     * @tc.desc   state=-51 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030035 begin');
      const state: number = -51;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030035 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030036
     * @tc.number SUB_CCE_SETNORM_03_0036
     * @tc.desc   state=-52 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030036 begin');
      const state: number = -52;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030036 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030037
     * @tc.number SUB_CCE_SETNORM_03_0037
     * @tc.desc   state=-53 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030037 begin');
      const state: number = -53;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030037 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030038
     * @tc.number SUB_CCE_SETNORM_03_0038
     * @tc.desc   state=-54 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030038 begin');
      const state: number = -54;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030038 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030039
     * @tc.number SUB_CCE_SETNORM_03_0039
     * @tc.desc   state=-55 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030039 begin');
      const state: number = -55;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030039 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030040
     * @tc.number SUB_CCE_SETNORM_03_0040
     * @tc.desc   state=-56 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030040 begin');
      const state: number = -56;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030040 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030041
     * @tc.number SUB_CCE_SETNORM_03_0041
     * @tc.desc   state=2.1 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030041 begin');
      const state: number = 2.1;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030041 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030042
     * @tc.number SUB_CCE_SETNORM_03_0042
     * @tc.desc   state=2.9 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030042 begin');
      const state: number = 2.9;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030042 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030043
     * @tc.number SUB_CCE_SETNORM_03_0043
     * @tc.desc   state=3.1 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030043 begin');
      const state: number = 3.1;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030043 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030044
     * @tc.number SUB_CCE_SETNORM_03_0044
     * @tc.desc   state=4.5 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030044 begin');
      const state: number = 4.5;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030044 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030045
     * @tc.number SUB_CCE_SETNORM_03_0045
     * @tc.desc   state=5.5 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030045 begin');
      const state: number = 5.5;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030045 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030046
     * @tc.number SUB_CCE_SETNORM_03_0046
     * @tc.desc   state=-3.5 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030046 begin');
      const state: number = -3.5;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030046 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030047
     * @tc.number SUB_CCE_SETNORM_03_0047
     * @tc.desc   state=-4.5 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030047 begin');
      const state: number = -4.5;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030047 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030048
     * @tc.number SUB_CCE_SETNORM_03_0048
     * @tc.desc   state=0.25 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030048 begin');
      const state: number = 0.25;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030048 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030049
     * @tc.number SUB_CCE_SETNORM_03_0049
     * @tc.desc   state=0.75 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030049 begin');
      const state: number = 0.75;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030049 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030050
     * @tc.number SUB_CCE_SETNORM_03_0050
     * @tc.desc   state=1.25 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030050 begin');
      const state: number = 1.25;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030050 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume030051
     * @tc.number SUB_CCE_SETNORM_03_0051
     * @tc.desc   正负 1e308 量级极大值经 normalizeState 统一回落 2，仍满足三态整数约束
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume030051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030051 begin');
      const bigPos: number = settingFeature.normalizeState(1e308);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(bigPos), String(2));
      expect(bigPos).assertEqual(2);
      const bigNeg: number = settingFeature.normalizeState(-1e308);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(bigNeg), String(2));
      expect(bigNeg).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(bigPos % 1 === 0 && bigNeg % 1 === 0));
      expect(bigPos % 1 === 0 && bigNeg % 1 === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume030051 end');
    })
  })
}
