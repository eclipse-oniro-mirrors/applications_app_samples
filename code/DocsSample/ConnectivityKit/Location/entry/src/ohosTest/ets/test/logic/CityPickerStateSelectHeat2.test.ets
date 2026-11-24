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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../TestYield';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { CityPickerState } from '../model/CityPickerLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Location]';
const BUNDLE: string = 'Location_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for CityPickerState.selectHeat (31 cases). */
export default function cityPickerStateSelectHeat2Test(): void {
  describe('CityPickerStateSelectHeat2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0090
     * @tc.name      Location_CityPickerStateSelectHeat_0090
     * @tc.desc      CityPickerState.selectHeat(index=92) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0090 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(92);
      logInfo(`selectHeat(index=92): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0090 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0091
     * @tc.name      Location_CityPickerStateSelectHeat_0091
     * @tc.desc      CityPickerState.selectHeat(index=108) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0091 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(108);
      logInfo(`selectHeat(index=108): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0091 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0092
     * @tc.name      Location_CityPickerStateSelectHeat_0092
     * @tc.desc      CityPickerState.selectHeat(index=-29) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectHeat_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0092 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(-29);
      logInfo(`selectHeat(index=-29): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0092 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0093
     * @tc.name      Location_CityPickerStateSelectHeat_0093
     * @tc.desc      CityPickerState.selectHeat(index=46.12) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0093 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(46.12);
      logInfo(`selectHeat(index=46.12): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0093 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0094
     * @tc.name      Location_CityPickerStateSelectHeat_0094
     * @tc.desc      CityPickerState.selectHeat(index=38.78) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0094 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(38.78);
      logInfo(`selectHeat(index=38.78): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0094 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0095
     * @tc.name      Location_CityPickerStateSelectHeat_0095
     * @tc.desc      CityPickerState.selectHeat(index=158) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0095 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(158);
      logInfo(`selectHeat(index=158): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0095 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0096
     * @tc.name      Location_CityPickerStateSelectHeat_0096
     * @tc.desc      CityPickerState.selectHeat(index=-60) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectHeat_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0096 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(-60);
      logInfo(`selectHeat(index=-60): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0096 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0097
     * @tc.name      Location_CityPickerStateSelectHeat_0097
     * @tc.desc      CityPickerState.selectHeat(index=32.98) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0097 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(32.98);
      logInfo(`selectHeat(index=32.98): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0097 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0098
     * @tc.name      Location_CityPickerStateSelectHeat_0098
     * @tc.desc      CityPickerState.selectHeat(index=24) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0098 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(24);
      logInfo(`selectHeat(index=24): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0098 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0099
     * @tc.name      Location_CityPickerStateSelectHeat_0099
     * @tc.desc      CityPickerState.selectHeat(index=-96) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectHeat_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0099 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(-96);
      logInfo(`selectHeat(index=-96): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0099 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0100
     * @tc.name      Location_CityPickerStateSelectHeat_0100
     * @tc.desc      CityPickerState.selectHeat(index=-5) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectHeat_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0100 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(-5);
      logInfo(`selectHeat(index=-5): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0100 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0101
     * @tc.name      Location_CityPickerStateSelectHeat_0101
     * @tc.desc      CityPickerState.selectHeat(index=36) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0101 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(36);
      logInfo(`selectHeat(index=36): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0101 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0102
     * @tc.name      Location_CityPickerStateSelectHeat_0102
     * @tc.desc      CityPickerState.selectHeat(index=-90) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectHeat_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0102 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(-90);
      logInfo(`selectHeat(index=-90): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0102 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0103
     * @tc.name      Location_CityPickerStateSelectHeat_0103
     * @tc.desc      CityPickerState.selectHeat(index=-3) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectHeat_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0103 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(-3);
      logInfo(`selectHeat(index=-3): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0103 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0104
     * @tc.name      Location_CityPickerStateSelectHeat_0104
     * @tc.desc      CityPickerState.selectHeat(index=194) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0104 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(194);
      logInfo(`selectHeat(index=194): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0104 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0105
     * @tc.name      Location_CityPickerStateSelectHeat_0105
     * @tc.desc      CityPickerState.selectHeat(index=-53) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectHeat_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0105 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(-53);
      logInfo(`selectHeat(index=-53): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0105 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0106
     * @tc.name      Location_CityPickerStateSelectHeat_0106
     * @tc.desc      CityPickerState.selectHeat(index=-26) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectHeat_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0106 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(-26);
      logInfo(`selectHeat(index=-26): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0106 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0107
     * @tc.name      Location_CityPickerStateSelectHeat_0107
     * @tc.desc      CityPickerState.selectHeat(index=-68) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectHeat_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0107 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(-68);
      logInfo(`selectHeat(index=-68): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0107 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0108
     * @tc.name      Location_CityPickerStateSelectHeat_0108
     * @tc.desc      CityPickerState.selectHeat(index=-74) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectHeat_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0108 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(-74);
      logInfo(`selectHeat(index=-74): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0108 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0109
     * @tc.name      Location_CityPickerStateSelectHeat_0109
     * @tc.desc      CityPickerState.selectHeat(index=96.03) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0109 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(96.03);
      logInfo(`selectHeat(index=96.03): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0109 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0110
     * @tc.name      Location_CityPickerStateSelectHeat_0110
     * @tc.desc      CityPickerState.selectHeat(index=49.24) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0110 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(49.24);
      logInfo(`selectHeat(index=49.24): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0110 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0111
     * @tc.name      Location_CityPickerStateSelectHeat_0111
     * @tc.desc      CityPickerState.selectHeat(index=59.22) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0111 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(59.22);
      logInfo(`selectHeat(index=59.22): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0111 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0112
     * @tc.name      Location_CityPickerStateSelectHeat_0112
     * @tc.desc      CityPickerState.selectHeat(index=-92) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectHeat_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0112 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(-92);
      logInfo(`selectHeat(index=-92): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0112 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0113
     * @tc.name      Location_CityPickerStateSelectHeat_0113
     * @tc.desc      CityPickerState.selectHeat(index=19) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0113 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(19);
      logInfo(`selectHeat(index=19): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0113 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0114
     * @tc.name      Location_CityPickerStateSelectHeat_0114
     * @tc.desc      CityPickerState.selectHeat(index=-10) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectHeat_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0114 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(-10);
      logInfo(`selectHeat(index=-10): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0114 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0115
     * @tc.name      Location_CityPickerStateSelectHeat_0115
     * @tc.desc      CityPickerState.selectHeat(index=166) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0115 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(166);
      logInfo(`selectHeat(index=166): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0115 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0116
     * @tc.name      Location_CityPickerStateSelectHeat_0116
     * @tc.desc      CityPickerState.selectHeat(index=0.03) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0116 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(0.03);
      logInfo(`selectHeat(index=0.03): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0116 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0117
     * @tc.name      Location_CityPickerStateSelectHeat_0117
     * @tc.desc      CityPickerState.selectHeat(index=59) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0117 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(59);
      logInfo(`selectHeat(index=59): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0117 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0118
     * @tc.name      Location_CityPickerStateSelectHeat_0118
     * @tc.desc      CityPickerState.selectHeat(index=61.39) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0118 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(61.39);
      logInfo(`selectHeat(index=61.39): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0118 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0119
     * @tc.name      Location_CityPickerStateSelectHeat_0119
     * @tc.desc      CityPickerState.selectHeat(index=129) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0119 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(129);
      logInfo(`selectHeat(index=129): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0119 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0120
     * @tc.name      Location_CityPickerStateSelectHeat_0120
     * @tc.desc      CityPickerState.selectHeat(index=-46) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectHeat_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0120 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(-46);
      logInfo(`selectHeat(index=-46): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0120 end`);
    });
  });
}
