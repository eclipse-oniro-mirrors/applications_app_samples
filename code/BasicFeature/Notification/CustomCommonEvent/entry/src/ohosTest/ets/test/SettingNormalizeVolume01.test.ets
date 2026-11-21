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

export default function settingNormalizeVolume01Test(): void {
  describe('SettingNormalizeVolume01Test', () => {

    /**
     * @tc.name   testSettingNormalizeVolume010001
     * @tc.number SUB_CCE_SETNORM_01_0001
     * @tc.desc   state=-20 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010001 begin');
      const state: number = -20;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010001 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010002
     * @tc.number SUB_CCE_SETNORM_01_0002
     * @tc.desc   state=-19 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010002 begin');
      const state: number = -19;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010002 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010003
     * @tc.number SUB_CCE_SETNORM_01_0003
     * @tc.desc   state=-18 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010003 begin');
      const state: number = -18;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010003 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010004
     * @tc.number SUB_CCE_SETNORM_01_0004
     * @tc.desc   state=-17 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010004 begin');
      const state: number = -17;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010004 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010005
     * @tc.number SUB_CCE_SETNORM_01_0005
     * @tc.desc   state=-16 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010005 begin');
      const state: number = -16;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010005 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010006
     * @tc.number SUB_CCE_SETNORM_01_0006
     * @tc.desc   state=-15 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010006 begin');
      const state: number = -15;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010006 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010007
     * @tc.number SUB_CCE_SETNORM_01_0007
     * @tc.desc   state=-14 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010007 begin');
      const state: number = -14;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010007 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010008
     * @tc.number SUB_CCE_SETNORM_01_0008
     * @tc.desc   state=-13 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010008 begin');
      const state: number = -13;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010008 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010009
     * @tc.number SUB_CCE_SETNORM_01_0009
     * @tc.desc   state=-12 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010009 begin');
      const state: number = -12;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010009 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010010
     * @tc.number SUB_CCE_SETNORM_01_0010
     * @tc.desc   state=-11 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010010 begin');
      const state: number = -11;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010010 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010011
     * @tc.number SUB_CCE_SETNORM_01_0011
     * @tc.desc   state=-10 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010011 begin');
      const state: number = -10;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010011 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010012
     * @tc.number SUB_CCE_SETNORM_01_0012
     * @tc.desc   state=-9 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010012 begin');
      const state: number = -9;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010012 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010013
     * @tc.number SUB_CCE_SETNORM_01_0013
     * @tc.desc   state=-8 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010013 begin');
      const state: number = -8;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010013 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010014
     * @tc.number SUB_CCE_SETNORM_01_0014
     * @tc.desc   state=-7 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010014 begin');
      const state: number = -7;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010014 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010015
     * @tc.number SUB_CCE_SETNORM_01_0015
     * @tc.desc   state=-6 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010015 begin');
      const state: number = -6;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010015 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010016
     * @tc.number SUB_CCE_SETNORM_01_0016
     * @tc.desc   state=-5 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010016 begin');
      const state: number = -5;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010016 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010017
     * @tc.number SUB_CCE_SETNORM_01_0017
     * @tc.desc   state=-4 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010017 begin');
      const state: number = -4;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010017 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010018
     * @tc.number SUB_CCE_SETNORM_01_0018
     * @tc.desc   state=-3 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010018 begin');
      const state: number = -3;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010018 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010019
     * @tc.number SUB_CCE_SETNORM_01_0019
     * @tc.desc   state=-2 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010019 begin');
      const state: number = -2;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010019 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010020
     * @tc.number SUB_CCE_SETNORM_01_0020
     * @tc.desc   state=-1 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010020 begin');
      const state: number = -1;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010020 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010021
     * @tc.number SUB_CCE_SETNORM_01_0021
     * @tc.desc   state=0 归一为 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010021 begin');
      const state: number = 0;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010021 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010022
     * @tc.number SUB_CCE_SETNORM_01_0022
     * @tc.desc   state=1 归一为 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010022 begin');
      const state: number = 1;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('1'));
      expect(String(result)).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010022 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010023
     * @tc.number SUB_CCE_SETNORM_01_0023
     * @tc.desc   state=2 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010023 begin');
      const state: number = 2;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010023 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010024
     * @tc.number SUB_CCE_SETNORM_01_0024
     * @tc.desc   state=3 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010024 begin');
      const state: number = 3;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010024 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010025
     * @tc.number SUB_CCE_SETNORM_01_0025
     * @tc.desc   state=4 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010025 begin');
      const state: number = 4;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010025 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010026
     * @tc.number SUB_CCE_SETNORM_01_0026
     * @tc.desc   state=5 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010026 begin');
      const state: number = 5;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010026 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010027
     * @tc.number SUB_CCE_SETNORM_01_0027
     * @tc.desc   state=6 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010027 begin');
      const state: number = 6;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010027 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010028
     * @tc.number SUB_CCE_SETNORM_01_0028
     * @tc.desc   state=7 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010028 begin');
      const state: number = 7;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010028 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010029
     * @tc.number SUB_CCE_SETNORM_01_0029
     * @tc.desc   state=8 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010029 begin');
      const state: number = 8;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010029 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010030
     * @tc.number SUB_CCE_SETNORM_01_0030
     * @tc.desc   state=9 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010030 begin');
      const state: number = 9;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010030 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010031
     * @tc.number SUB_CCE_SETNORM_01_0031
     * @tc.desc   state=10 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010031 begin');
      const state: number = 10;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010031 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010032
     * @tc.number SUB_CCE_SETNORM_01_0032
     * @tc.desc   state=11 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010032 begin');
      const state: number = 11;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010032 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010033
     * @tc.number SUB_CCE_SETNORM_01_0033
     * @tc.desc   state=12 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010033 begin');
      const state: number = 12;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010033 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010034
     * @tc.number SUB_CCE_SETNORM_01_0034
     * @tc.desc   state=13 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010034 begin');
      const state: number = 13;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010034 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010035
     * @tc.number SUB_CCE_SETNORM_01_0035
     * @tc.desc   state=14 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010035 begin');
      const state: number = 14;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010035 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010036
     * @tc.number SUB_CCE_SETNORM_01_0036
     * @tc.desc   state=15 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010036 begin');
      const state: number = 15;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010036 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010037
     * @tc.number SUB_CCE_SETNORM_01_0037
     * @tc.desc   state=16 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010037 begin');
      const state: number = 16;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010037 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010038
     * @tc.number SUB_CCE_SETNORM_01_0038
     * @tc.desc   state=17 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010038 begin');
      const state: number = 17;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010038 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010039
     * @tc.number SUB_CCE_SETNORM_01_0039
     * @tc.desc   state=18 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010039 begin');
      const state: number = 18;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010039 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010040
     * @tc.number SUB_CCE_SETNORM_01_0040
     * @tc.desc   state=19 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010040 begin');
      const state: number = 19;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010040 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010041
     * @tc.number SUB_CCE_SETNORM_01_0041
     * @tc.desc   state=20 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010041 begin');
      const state: number = 20;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010041 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010042
     * @tc.number SUB_CCE_SETNORM_01_0042
     * @tc.desc   state=21 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010042 begin');
      const state: number = 21;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010042 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010043
     * @tc.number SUB_CCE_SETNORM_01_0043
     * @tc.desc   state=22 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010043 begin');
      const state: number = 22;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010043 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010044
     * @tc.number SUB_CCE_SETNORM_01_0044
     * @tc.desc   state=23 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010044 begin');
      const state: number = 23;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010044 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010045
     * @tc.number SUB_CCE_SETNORM_01_0045
     * @tc.desc   state=24 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010045 begin');
      const state: number = 24;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010045 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010046
     * @tc.number SUB_CCE_SETNORM_01_0046
     * @tc.desc   state=0.5 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010046 begin');
      const state: number = 0.5;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010046 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010047
     * @tc.number SUB_CCE_SETNORM_01_0047
     * @tc.desc   state=1.5 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010047 begin');
      const state: number = 1.5;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010047 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010048
     * @tc.number SUB_CCE_SETNORM_01_0048
     * @tc.desc   state=2.5 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010048 begin');
      const state: number = 2.5;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010048 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010049
     * @tc.number SUB_CCE_SETNORM_01_0049
     * @tc.desc   state=1000000 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010049 begin');
      const state: number = 1000000;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010049 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010050
     * @tc.number SUB_CCE_SETNORM_01_0050
     * @tc.desc   state=-1000000 归一为 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010050 begin');
      const state: number = -1000000;
      const result: number = settingFeature.normalizeState(state);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 0 && result <= 2));
      expect(result >= 0 && result <= 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010050 end');
    })

    /**
     * @tc.name   testSettingNormalizeVolume010051
     * @tc.number SUB_CCE_SETNORM_01_0051
     * @tc.desc   合法三态原样放行，非法值 3 与负数统一回落 NEVER
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSettingNormalizeVolume010051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010051 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(settingFeature.normalizeState(0)), '0');
      expect(settingFeature.normalizeState(0)).assertEqual(0);
      expect(settingFeature.normalizeState(1)).assertEqual(1);
      expect(settingFeature.normalizeState(2)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(settingFeature.normalizeState(3)), '2');
      expect(settingFeature.normalizeState(3)).assertEqual(2);
      expect(settingFeature.normalizeState(-5)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSettingNormalizeVolume010051 end');
    })
  })
}
