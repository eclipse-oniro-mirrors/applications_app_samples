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
import { formatDuration, formatTime, getDayStart, padTwo } from '../main/ets/geofence/utils/TimeUtil';

const SINGLE_DIGIT: number = 9;
const DOUBLE_DIGIT: number = 12;
const DURATION_MS: number = 3661000;
const DURATION_TEXT: string = '01:01:01';
const ZERO_DURATION_TEXT: string = '00:00:00';
const EXPECTED_TIME_TEXT: string = '03:04:05';
const DAY_START_HOUR: number = 0;
const YEAR_2026: number = 2026;
const JANUARY: number = 0;
const DAY_TWO: number = 2;
const HOUR_THREE: number = 3;
const MINUTE_FOUR: number = 4;
const SECOND_FIVE: number = 5;

export default function timeUtilTest() {
  describe('TimeUtil', () => {
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMEUTIL_PADTWO_0100
     * @tc.name      testPadTwo0001
     * @tc.desc      Verify padTwo pads a single-digit input to two characters and
     *               keeps a double-digit input unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPadTwo0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(padTwo(SINGLE_DIGIT)).assertEqual('09');
      expect(padTwo(DOUBLE_DIGIT)).assertEqual('12');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMEUTIL_FORMATDURATION_0100
     * @tc.name      testFormatDuration0001
     * @tc.desc      Verify formatDuration renders 3661000 ms as 01:01:01 and 0 ms
     *               as 00:00:00.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatDuration0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(formatDuration(DURATION_MS)).assertEqual(DURATION_TEXT);
      expect(formatDuration(0)).assertEqual(ZERO_DURATION_TEXT);
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMEUTIL_FORMATTIME_0100
     * @tc.name      testFormatTime0001
     * @tc.desc      Verify formatTime renders a timestamp of 03:04:05 as the
     *               03:04:05 text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatTime0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const timestamp: number = new Date(YEAR_2026, JANUARY, DAY_TWO, HOUR_THREE, MINUTE_FOUR, SECOND_FIVE)
        .getTime();
      expect(formatTime(timestamp)).assertEqual(EXPECTED_TIME_TEXT);
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMEUTIL_DAYSTART_0100
     * @tc.name      testGetDayStart0001
     * @tc.desc      Verify getDayStart resets the time to midnight of the same day
     *               and returns a value earlier than the input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testGetDayStart0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const timestamp: number = new Date(YEAR_2026, JANUARY, DAY_TWO, HOUR_THREE, MINUTE_FOUR, SECOND_FIVE)
        .getTime();
      const dayStart: number = getDayStart(timestamp);
      expect(new Date(dayStart).getHours()).assertEqual(DAY_START_HOUR);
      expect(dayStart < timestamp).assertTrue();
    });
  });
}
