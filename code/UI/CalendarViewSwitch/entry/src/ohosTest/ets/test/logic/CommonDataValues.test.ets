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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { CommonData, DeviceType, ScheduleInfo } from '../../../../main/ets/bridge/CalendarSwitchBridge';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CalendarViewSwitch]';
const BUNDLE: string = 'CalendarViewSwitch_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for CommonData (5 cases). */
export default function commonDataValuesTest(): void {
  describe('CommonDataValuesTest', () => {
    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_COMMON_DATA_VALUES_0001
     * @tc.name      CalendarViewSwitch_CommonDataValues_0001
     * @tc.desc      CommonData.SCHEDULE_ARRAY keeps value len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CalendarViewSwitch_CommonDataValues_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CommonDataValues_0001 begin`);
      const actual: string[] = CommonData.SCHEDULE_ARRAY;
      logInfo(`CommonData.SCHEDULE_ARRAY: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}CommonDataValues_0001 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_COMMON_DATA_VALUES_0002
     * @tc.name      CalendarViewSwitch_CommonDataValues_0002
     * @tc.desc      CommonData.CURRENT_SELECT_DATE keeps value ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CalendarViewSwitch_CommonDataValues_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CommonDataValues_0002 begin`);
      const actual: string = CommonData.CURRENT_SELECT_DATE;
      logInfo(`CommonData.CURRENT_SELECT_DATE: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CommonDataValues_0002 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_COMMON_DATA_VALUES_0003
     * @tc.name      CalendarViewSwitch_CommonDataValues_0003
     * @tc.desc      CommonData.DEVICE_TYPE keeps value DeviceType.PHONE
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_CommonDataValues_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommonDataValues_0003 begin`);
      const actual: DeviceType = CommonData.DEVICE_TYPE;
      logInfo(`CommonData.DEVICE_TYPE: actual=${actual}`);
      expect(actual).assertEqual(DeviceType.PHONE);
      logInfo(`${BUNDLE}CommonDataValues_0003 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_COMMON_DATA_VALUES_0004
     * @tc.name      CalendarViewSwitch_CommonDataValues_0004
     * @tc.desc      CommonData.IS_FOLD keeps value false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_CommonDataValues_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommonDataValues_0004 begin`);
      const actual: boolean = CommonData.IS_FOLD;
      logInfo(`CommonData.IS_FOLD: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}CommonDataValues_0004 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_COMMON_DATA_VALUES_0005
     * @tc.name      CalendarViewSwitch_CommonDataValues_0005
     * @tc.desc      CommonData.SCHEDULE_DATA keeps value len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_CommonDataValues_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CommonDataValues_0005 begin`);
      const actual: ScheduleInfo[] = CommonData.SCHEDULE_DATA;
      logInfo(`CommonData.SCHEDULE_DATA: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}CommonDataValues_0005 end`);
    });
  });
}
