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

import { describe, it, expect, beforeAll, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { formatDateTime, formatDuration, formatTime, getDayStart, padTwo } from 'library';

const DOMAIN: number = 0xF811;
const SUITE_TAG: string = '[Sample_GeofenceCheckIn_Time]';

export default function timeUtilLogicTest() {
  describe('TimeUtilLogicTest', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'suite start');
    });

    afterAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'suite end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIME_0100
     * @tc.name      testPadTwo0001
     * @tc.desc      Verify the padding helper adds a leading zero only for single
     *               digit values and keeps longer values unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPadTwo0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPadTwo0001';
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', TAG + ' start');
      expect(padTwo(0)).assertEqual('00');
      expect(padTwo(9)).assertEqual('09');
      expect(padTwo(10)).assertEqual('10');
      expect(padTwo(59)).assertEqual('59');
      expect(padTwo(100)).assertEqual('100');
      expect(padTwo(7).length).assertEqual(2);
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIME_0200
     * @tc.name      testFormatDuration0001
     * @tc.desc      Verify the duration formatter renders padded hour, minute and
     *               second parts, rounds fractional seconds down and renders a zero
     *               duration for negative and missing values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatDuration0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFormatDuration0001';
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', TAG + ' start');
      expect(formatDuration(0)).assertEqual('00:00:00');
      expect(formatDuration(-500)).assertEqual('00:00:00');
      expect(formatDuration(999)).assertEqual('00:00:00');
      expect(formatDuration(1000)).assertEqual('00:00:01');
      expect(formatDuration(59999)).assertEqual('00:00:59');
      expect(formatDuration(60000)).assertEqual('00:01:00');
      expect(formatDuration(3600000)).assertEqual('01:00:00');
      expect(formatDuration(3661000)).assertEqual('01:01:01');
      expect(formatDuration(86399999)).assertEqual('23:59:59');
      expect(formatDuration(125000).length).assertEqual(8);
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIME_0300
     * @tc.name      testFormatDateTime0001
     * @tc.desc      Verify the date time formatter renders the placeholder for zero
     *               and negative timestamps and renders the padded local date and
     *               time text for a fixed local date.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatDateTime0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFormatDateTime0001';
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', TAG + ' start');
      expect(formatDateTime(0)).assertEqual('--');
      expect(formatDateTime(-1)).assertEqual('--');
      const sample: Date = new Date(2026, 0, 15, 9, 5, 3);
      const formatted: string = formatDateTime(sample.getTime());
      expect(formatted).assertEqual('2026-01-15 09:05:03');
      expect(formatted.length).assertEqual(19);
      expect(formatted.substring(11)).assertEqual('09:05:03');
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIME_0400
     * @tc.name      testFormatTime0001
     * @tc.desc      Verify the time formatter renders the placeholder for zero and
     *               negative timestamps and renders the padded local hour, minute
     *               and second text for fixed local times.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatTime0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFormatTime0001';
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', TAG + ' start');
      expect(formatTime(0)).assertEqual('--');
      const lateEvening: Date = new Date(2026, 10, 6, 23, 59, 9);
      expect(formatTime(lateEvening.getTime())).assertEqual('23:59:09');
      const midnight: Date = new Date(2026, 0, 1, 0, 0, 0);
      expect(formatTime(midnight.getTime())).assertEqual('00:00:00');
      expect(formatTime(midnight.getTime()).length).assertEqual(8);
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIME_0500
     * @tc.name      testGetDayStart0001
     * @tc.desc      Verify the day start helper normalizes morning and evening times
     *               of the same local day to the same local midnight, never returns
     *               a later timestamp and stays idempotent.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testGetDayStart0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testGetDayStart0001';
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', TAG + ' start');
      const morning: Date = new Date(2026, 0, 15, 9, 30, 0);
      const evening: Date = new Date(2026, 0, 15, 22, 15, 0);
      const morningTs: number = morning.getTime();
      const eveningTs: number = evening.getTime();
      const morningStart: number = getDayStart(morningTs);
      const eveningStart: number = getDayStart(eveningTs);
      expect(morningStart).assertEqual(eveningStart);
      expect(morningStart <= morningTs).assertTrue();
      expect(eveningStart <= eveningTs).assertTrue();
      expect(formatDateTime(morningStart).substring(11)).assertEqual('00:00:00');
      expect(formatDateTime(eveningStart).substring(0, 10)).assertEqual('2026-01-15');
      expect(getDayStart(morningStart)).assertEqual(morningStart);
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', TAG + ' end');
    });
  });
}
