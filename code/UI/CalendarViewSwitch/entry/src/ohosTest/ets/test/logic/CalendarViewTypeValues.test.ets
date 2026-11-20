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
import { CalendarViewType } from '../../../../main/ets/bridge/CalendarSwitchBridge';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CalendarViewSwitch]';
const BUNDLE: string = 'CalendarViewSwitch_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for CalendarViewType (3 cases). */
export default function calendarViewTypeValuesTest(): void {
  describe('CalendarViewTypeValuesTest', () => {
    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CALENDAR_VIEW_TYPE_VALUES_0001
     * @tc.name      CalendarViewSwitch_CalendarViewTypeValues_0001
     * @tc.desc      CalendarViewType.YEAR keeps value 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CalendarViewSwitch_CalendarViewTypeValues_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalendarViewTypeValues_0001 begin`);
      const actual: number = CalendarViewType.YEAR;
      logInfo(`CalendarViewType.YEAR: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CalendarViewTypeValues_0001 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CALENDAR_VIEW_TYPE_VALUES_0002
     * @tc.name      CalendarViewSwitch_CalendarViewTypeValues_0002
     * @tc.desc      CalendarViewType.MONTH keeps value 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CalendarViewSwitch_CalendarViewTypeValues_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CalendarViewTypeValues_0002 begin`);
      const actual: number = CalendarViewType.MONTH;
      logInfo(`CalendarViewType.MONTH: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CalendarViewTypeValues_0002 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CALENDAR_VIEW_TYPE_VALUES_0003
     * @tc.name      CalendarViewSwitch_CalendarViewTypeValues_0003
     * @tc.desc      CalendarViewType.WEEK keeps value 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_CalendarViewTypeValues_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CalendarViewTypeValues_0003 begin`);
      const actual: number = CalendarViewType.WEEK;
      logInfo(`CalendarViewType.WEEK: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}CalendarViewTypeValues_0003 end`);
    });
  });
}
