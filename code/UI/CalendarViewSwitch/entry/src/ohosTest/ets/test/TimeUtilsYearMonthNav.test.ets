/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { TimeUtils } from '../../../main/ets/bridge/CalendarSwitchBridge';

const DOMAIN: number = 0xF814;
const TAG: string = 'TimeUtilsYearMonthNavTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function timeUtilsYearMonthNavTest(): void {
  describe('TimeUtilsYearMonthNavTest', () => {
    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_YEARMONTHNAV_0101
     * @tc.name      testYearMonthNav0101
     * @tc.desc      Checks getLastYearMonth maps January 2024 back to 2023-12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testYearMonthNav0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testYearMonthNav0101 begin');
      const actual: string = TimeUtils.getLastYearMonth(2024, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='2023-12'`);
      expect(actual).assertEqual('2023-12');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='string'`);
      expect(typeof actual).assertEqual('string');
      log('testYearMonthNav0101 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_YEARMONTHNAV_0102
     * @tc.name      testYearMonthNav0102
     * @tc.desc      Checks getLastYearMonth maps June 2024 to 2024-5 without zero padding.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testYearMonthNav0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testYearMonthNav0102 begin');
      const actual: string = TimeUtils.getLastYearMonth(2024, 6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='2024-5'`);
      expect(actual).assertEqual('2024-5');
      log('testYearMonthNav0102 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_YEARMONTHNAV_0103
     * @tc.name      testYearMonthNav0103
     * @tc.desc      Checks getLastYearMonth maps December 2023 to 2023-11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testYearMonthNav0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testYearMonthNav0103 begin');
      const actual: string = TimeUtils.getLastYearMonth(2023, 12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='2023-11'`);
      expect(actual).assertEqual('2023-11');
      log('testYearMonthNav0103 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_YEARMONTHNAV_0104
     * @tc.name      testYearMonthNav0104
     * @tc.desc      Checks getLastYearMonth maps December 2024 to 2024-11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testYearMonthNav0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testYearMonthNav0104 begin');
      const actual: string = TimeUtils.getLastYearMonth(2024, 12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='2024-11'`);
      expect(actual).assertEqual('2024-11');
      log('testYearMonthNav0104 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_YEARMONTHNAV_0105
     * @tc.name      testYearMonthNav0105
     * @tc.desc      Checks getLastYearMonth maps February 2024 to 2024-1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testYearMonthNav0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testYearMonthNav0105 begin');
      const actual: string = TimeUtils.getLastYearMonth(2024, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='2024-1'`);
      expect(actual).assertEqual('2024-1');
      log('testYearMonthNav0105 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_YEARMONTHNAV_0106
     * @tc.name      testYearMonthNav0106
     * @tc.desc      Checks getLastYearMonth maps January 2025 back to 2024-12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testYearMonthNav0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testYearMonthNav0106 begin');
      const actual: string = TimeUtils.getLastYearMonth(2025, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='2024-12'`);
      expect(actual).assertEqual('2024-12');
      log('testYearMonthNav0106 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_YEARMONTHNAV_0107
     * @tc.name      testYearMonthNav0107
     * @tc.desc      Checks getNextYearMonth maps December 2024 forward to 2025-1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testYearMonthNav0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testYearMonthNav0107 begin');
      const actual: string = TimeUtils.getNextYearMonth(2024, 12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='2025-1'`);
      expect(actual).assertEqual('2025-1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='string'`);
      expect(typeof actual).assertEqual('string');
      log('testYearMonthNav0107 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_YEARMONTHNAV_0108
     * @tc.name      testYearMonthNav0108
     * @tc.desc      Checks getNextYearMonth maps June 2024 to 2024-7 without zero padding.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testYearMonthNav0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testYearMonthNav0108 begin');
      const actual: string = TimeUtils.getNextYearMonth(2024, 6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='2024-7'`);
      expect(actual).assertEqual('2024-7');
      log('testYearMonthNav0108 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_YEARMONTHNAV_0109
     * @tc.name      testYearMonthNav0109
     * @tc.desc      Checks getNextYearMonth maps January 2024 to 2024-2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testYearMonthNav0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testYearMonthNav0109 begin');
      const actual: string = TimeUtils.getNextYearMonth(2024, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='2024-2'`);
      expect(actual).assertEqual('2024-2');
      log('testYearMonthNav0109 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_YEARMONTHNAV_0110
     * @tc.name      testYearMonthNav0110
     * @tc.desc      Checks getNextYearMonth maps November 2024 to 2024-12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testYearMonthNav0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testYearMonthNav0110 begin');
      const actual: string = TimeUtils.getNextYearMonth(2024, 11);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='2024-12'`);
      expect(actual).assertEqual('2024-12');
      log('testYearMonthNav0110 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_YEARMONTHNAV_0111
     * @tc.name      testYearMonthNav0111
     * @tc.desc      Checks getNextYearMonth maps December 2023 forward to 2024-1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testYearMonthNav0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testYearMonthNav0111 begin');
      const actual: string = TimeUtils.getNextYearMonth(2023, 12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='2024-1'`);
      expect(actual).assertEqual('2024-1');
      log('testYearMonthNav0111 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_YEARMONTHNAV_0112
     * @tc.name      testYearMonthNav0112
     * @tc.desc      Checks getNextYearMonth maps December 2025 forward to 2026-1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testYearMonthNav0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testYearMonthNav0112 begin');
      const actual: string = TimeUtils.getNextYearMonth(2025, 12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='2026-1'`);
      expect(actual).assertEqual('2026-1');
      log('testYearMonthNav0112 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_YEARMONTHNAV_0113
     * @tc.name      testYearMonthNav0113
     * @tc.desc      Checks getLastYear maps January 2024 back to 2023.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testYearMonthNav0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testYearMonthNav0113 begin');
      const actual: number = TimeUtils.getLastYear(2024, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=2023`);
      expect(actual).assertEqual(2023);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testYearMonthNav0113 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_YEARMONTHNAV_0114
     * @tc.name      testYearMonthNav0114
     * @tc.desc      Checks getLastYear keeps the year for June 2024.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testYearMonthNav0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testYearMonthNav0114 begin');
      const actual: number = TimeUtils.getLastYear(2024, 6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=2024`);
      expect(actual).assertEqual(2024);
      log('testYearMonthNav0114 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_YEARMONTHNAV_0115
     * @tc.name      testYearMonthNav0115
     * @tc.desc      Checks getLastYear keeps the year for December 2023.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testYearMonthNav0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testYearMonthNav0115 begin');
      const actual: number = TimeUtils.getLastYear(2023, 12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=2023`);
      expect(actual).assertEqual(2023);
      log('testYearMonthNav0115 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_YEARMONTHNAV_0116
     * @tc.name      testYearMonthNav0116
     * @tc.desc      Checks getLastYear keeps the year for December 2024.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testYearMonthNav0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testYearMonthNav0116 begin');
      const actual: number = TimeUtils.getLastYear(2024, 12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=2024`);
      expect(actual).assertEqual(2024);
      log('testYearMonthNav0116 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_YEARMONTHNAV_0117
     * @tc.name      testYearMonthNav0117
     * @tc.desc      Checks getLastMonth wraps January 2024 to month 12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testYearMonthNav0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testYearMonthNav0117 begin');
      const actual: number = TimeUtils.getLastMonth(2024, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=12`);
      expect(actual).assertEqual(12);
      log('testYearMonthNav0117 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_YEARMONTHNAV_0118
     * @tc.name      testYearMonthNav0118
     * @tc.desc      Checks getLastMonth maps June 2024 to month 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testYearMonthNav0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testYearMonthNav0118 begin');
      const actual: number = TimeUtils.getLastMonth(2024, 6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=5`);
      expect(actual).assertEqual(5);
      log('testYearMonthNav0118 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_YEARMONTHNAV_0119
     * @tc.name      testYearMonthNav0119
     * @tc.desc      Checks getLastMonth maps February 2024 to month 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testYearMonthNav0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testYearMonthNav0119 begin');
      const actual: number = TimeUtils.getLastMonth(2024, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=1`);
      expect(actual).assertEqual(1);
      log('testYearMonthNav0119 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_YEARMONTHNAV_0120
     * @tc.name      testYearMonthNav0120
     * @tc.desc      Checks getLastMonth maps December 2024 to month 11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testYearMonthNav0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testYearMonthNav0120 begin');
      const actual: number = TimeUtils.getLastMonth(2024, 12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=11`);
      expect(actual).assertEqual(11);
      log('testYearMonthNav0120 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_YEARMONTHNAV_0121
     * @tc.name      testYearMonthNav0121
     * @tc.desc      Checks getNextYear maps December 2024 forward to 2025.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testYearMonthNav0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testYearMonthNav0121 begin');
      const actual: number = TimeUtils.getNextYear(2024, 12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=2025`);
      expect(actual).assertEqual(2025);
      log('testYearMonthNav0121 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_YEARMONTHNAV_0122
     * @tc.name      testYearMonthNav0122
     * @tc.desc      Checks getNextYear keeps the year for June 2024.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testYearMonthNav0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testYearMonthNav0122 begin');
      const actual: number = TimeUtils.getNextYear(2024, 6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=2024`);
      expect(actual).assertEqual(2024);
      log('testYearMonthNav0122 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_YEARMONTHNAV_0123
     * @tc.name      testYearMonthNav0123
     * @tc.desc      Checks getNextYear keeps the year for January 2023.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testYearMonthNav0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testYearMonthNav0123 begin');
      const actual: number = TimeUtils.getNextYear(2023, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=2023`);
      expect(actual).assertEqual(2023);
      log('testYearMonthNav0123 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_YEARMONTHNAV_0124
     * @tc.name      testYearMonthNav0124
     * @tc.desc      Checks getNextYear keeps the year for November 2024.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testYearMonthNav0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testYearMonthNav0124 begin');
      const actual: number = TimeUtils.getNextYear(2024, 11);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=2024`);
      expect(actual).assertEqual(2024);
      log('testYearMonthNav0124 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_YEARMONTHNAV_0125
     * @tc.name      testYearMonthNav0125
     * @tc.desc      Checks getNextMonth wraps December 2024 to month 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testYearMonthNav0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testYearMonthNav0125 begin');
      const actual: number = TimeUtils.getNextMonth(2024, 12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=1`);
      expect(actual).assertEqual(1);
      log('testYearMonthNav0125 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_YEARMONTHNAV_0126
     * @tc.name      testYearMonthNav0126
     * @tc.desc      Checks getNextMonth maps June 2024 to month 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testYearMonthNav0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testYearMonthNav0126 begin');
      const actual: number = TimeUtils.getNextMonth(2024, 6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=7`);
      expect(actual).assertEqual(7);
      log('testYearMonthNav0126 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_YEARMONTHNAV_0127
     * @tc.name      testYearMonthNav0127
     * @tc.desc      Checks getNextMonth maps January 2024 to month 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testYearMonthNav0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testYearMonthNav0127 begin');
      const actual: number = TimeUtils.getNextMonth(2024, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=2`);
      expect(actual).assertEqual(2);
      log('testYearMonthNav0127 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_YEARMONTHNAV_0128
     * @tc.name      testYearMonthNav0128
     * @tc.desc      Checks getNextMonth maps November 2024 to month 12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testYearMonthNav0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testYearMonthNav0128 begin');
      const actual: number = TimeUtils.getNextMonth(2024, 11);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=12`);
      expect(actual).assertEqual(12);
      log('testYearMonthNav0128 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_YEARMONTHNAV_0129
     * @tc.name      testYearMonthNav0129
     * @tc.desc      Checks getLastYearMonth month part matches getLastMonth for all 12 months.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testYearMonthNav0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testYearMonthNav0129 begin');
      let allMatch: boolean = true;
      for (let month: number = 1; month <= 12; month++) {
        const yearMonth: string = TimeUtils.getLastYearMonth(2024, month);
        const parts: string[] = yearMonth.split('-');
        if (Number(parts[0]) !== TimeUtils.getLastYear(2024, month) ||
          Number(parts[1]) !== TimeUtils.getLastMonth(2024, month)) {
          allMatch = false;
          break;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue allMatch=${allMatch}`);
      expect(allMatch).assertTrue();
      log('testYearMonthNav0129 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_YEARMONTHNAV_0130
     * @tc.name      testYearMonthNav0130
     * @tc.desc      Checks getNextYearMonth month part matches getNextMonth for all 12 months.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testYearMonthNav0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testYearMonthNav0130 begin');
      let allMatch: boolean = true;
      for (let month: number = 1; month <= 12; month++) {
        const yearMonth: string = TimeUtils.getNextYearMonth(2024, month);
        const parts: string[] = yearMonth.split('-');
        if (Number(parts[0]) !== TimeUtils.getNextYear(2024, month) ||
          Number(parts[1]) !== TimeUtils.getNextMonth(2024, month)) {
          allMatch = false;
          break;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue allMatch=${allMatch}`);
      expect(allMatch).assertTrue();
      log('testYearMonthNav0130 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_YEARMONTHNAV_0131
     * @tc.name      testYearMonthNav0131
     * @tc.desc      Checks getLastYearMonth and getNextYearMonth are mutual inverses mid year.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testYearMonthNav0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testYearMonthNav0131 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${TimeUtils.getNextYearMonth(2024, 1)}`);
      expect(TimeUtils.getNextYearMonth(2024, 1)).assertEqual('2024-2');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${TimeUtils.getLastYearMonth(2024, 2)}`);
      expect(TimeUtils.getLastYearMonth(2024, 2)).assertEqual('2024-1');
      log('testYearMonthNav0131 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_YEARMONTHNAV_0132
     * @tc.name      testYearMonthNav0132
     * @tc.desc      Checks getLastSunday maps Wednesday 2024-06-19 to Sunday 2024-06-16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testYearMonthNav0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testYearMonthNav0132 begin');
      const actual: Date = TimeUtils.getLastSunday(new Date(2024, 5, 19));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual.getFullYear()=${actual.getFullYear()}, expected=2024`);
      expect(actual.getFullYear()).assertEqual(2024);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual.getMonth()=${actual.getMonth()}, expected=5`);
      expect(actual.getMonth()).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual.getDate()=${actual.getDate()}, expected=16`);
      expect(actual.getDate()).assertEqual(16);
      log('testYearMonthNav0132 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_YEARMONTHNAV_0133
     * @tc.name      testYearMonthNav0133
     * @tc.desc      Checks getLastSunday keeps a Sunday 2024-02-18 unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testYearMonthNav0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testYearMonthNav0133 begin');
      const actual: Date = TimeUtils.getLastSunday(new Date(2024, 1, 18));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual.getFullYear()=${actual.getFullYear()}, expected=2024`);
      expect(actual.getFullYear()).assertEqual(2024);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual.getMonth()=${actual.getMonth()}, expected=1`);
      expect(actual.getMonth()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual.getDate()=${actual.getDate()}, expected=18`);
      expect(actual.getDate()).assertEqual(18);
      log('testYearMonthNav0133 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_YEARMONTHNAV_0134
     * @tc.name      testYearMonthNav0134
     * @tc.desc      Checks getLastSunday maps Saturday 2024-02-24 back to 2024-02-18.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testYearMonthNav0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testYearMonthNav0134 begin');
      const actual: Date = TimeUtils.getLastSunday(new Date(2024, 1, 24));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual.getFullYear()=${actual.getFullYear()}, expected=2024`);
      expect(actual.getFullYear()).assertEqual(2024);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual.getMonth()=${actual.getMonth()}, expected=1`);
      expect(actual.getMonth()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual.getDate()=${actual.getDate()}, expected=18`);
      expect(actual.getDate()).assertEqual(18);
      log('testYearMonthNav0134 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_YEARMONTHNAV_0135
     * @tc.name      testYearMonthNav0135
     * @tc.desc      Checks getLastSunday rolls Monday 2024-01-01 back to 2023-12-31.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testYearMonthNav0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testYearMonthNav0135 begin');
      const actual: Date = TimeUtils.getLastSunday(new Date(2024, 0, 1));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual.getFullYear()=${actual.getFullYear()}, expected=2023`);
      expect(actual.getFullYear()).assertEqual(2023);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual.getMonth()=${actual.getMonth()}, expected=11`);
      expect(actual.getMonth()).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual.getDate()=${actual.getDate()}, expected=31`);
      expect(actual.getDate()).assertEqual(31);
      log('testYearMonthNav0135 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_YEARMONTHNAV_0136
     * @tc.name      testYearMonthNav0136
     * @tc.desc      Checks getLastSunday maps Monday 2024-09-30 back to 2024-09-29.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testYearMonthNav0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testYearMonthNav0136 begin');
      const actual: Date = TimeUtils.getLastSunday(new Date(2024, 8, 30));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual.getFullYear()=${actual.getFullYear()}, expected=2024`);
      expect(actual.getFullYear()).assertEqual(2024);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual.getMonth()=${actual.getMonth()}, expected=8`);
      expect(actual.getMonth()).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual.getDate()=${actual.getDate()}, expected=29`);
      expect(actual.getDate()).assertEqual(29);
      log('testYearMonthNav0136 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_YEARMONTHNAV_0137
     * @tc.name      testYearMonthNav0137
     * @tc.desc      Checks getLastSunday result is always a Sunday weekday.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testYearMonthNav0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testYearMonthNav0137 begin');
      const actual: Date = TimeUtils.getLastSunday(new Date(2024, 10, 13));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual.getDay()=${actual.getDay()}, expected=0`);
      expect(actual.getDay()).assertEqual(0);
      log('testYearMonthNav0137 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_YEARMONTHNAV_0138
     * @tc.name      testYearMonthNav0138
     * @tc.desc      Checks getLastSunday does not mutate the input date.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testYearMonthNav0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testYearMonthNav0138 begin');
      const input: Date = new Date(2024, 5, 19);
      TimeUtils.getLastSunday(input);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual input.getFullYear()=${input.getFullYear()}, expected=2024`);
      expect(input.getFullYear()).assertEqual(2024);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual input.getMonth()=${input.getMonth()}, expected=5`);
      expect(input.getMonth()).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual input.getDate()=${input.getDate()}, expected=19`);
      expect(input.getDate()).assertEqual(19);
      log('testYearMonthNav0138 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_YEARMONTHNAV_0139
     * @tc.name      testYearMonthNav0139
     * @tc.desc      Checks weeksBetweenDates returns 0 for today and a number type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testYearMonthNav0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testYearMonthNav0139 begin');
      const actual: number = TimeUtils.weeksBetweenDates(new Date());
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=0`);
      expect(actual).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testYearMonthNav0139 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_YEARMONTHNAV_0140
     * @tc.name      testYearMonthNav0140
     * @tc.desc      Checks weeksBetweenDates returns 1 for seven days ahead and 2 for fourteen.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testYearMonthNav0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testYearMonthNav0140 begin');
      const todayMs: number = new Date().getTime();
      const nextWeek: number = TimeUtils.weeksBetweenDates(new Date(todayMs + 7 * 86400000));
      const weekAfter: number = TimeUtils.weeksBetweenDates(new Date(todayMs + 14 * 86400000));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nextWeek=${nextWeek}, expected=1`);
      expect(nextWeek).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual weekAfter=${weekAfter}, expected=2`);
      expect(weekAfter).assertEqual(2);
      log('testYearMonthNav0140 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_YEARMONTHNAV_0141
     * @tc.name      testYearMonthNav0141
     * @tc.desc      Checks weeksBetweenDates returns negative values for past weeks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testYearMonthNav0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testYearMonthNav0141 begin');
      const todayMs: number = new Date().getTime();
      const lastWeek: number = TimeUtils.weeksBetweenDates(new Date(todayMs - 7 * 86400000));
      const threeWeeksAgo: number = TimeUtils.weeksBetweenDates(new Date(todayMs - 21 * 86400000));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual lastWeek=${lastWeek}, expected=-1`);
      expect(lastWeek).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual threeWeeksAgo=${threeWeeksAgo}, expected=-3`);
      expect(threeWeeksAgo).assertEqual(-3);
      log('testYearMonthNav0141 end');
    })
  })
}
