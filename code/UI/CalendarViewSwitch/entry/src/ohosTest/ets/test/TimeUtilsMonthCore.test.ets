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
const TAG: string = 'TimeUtilsMonthCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function timeUtilsMonthCoreTest(): void {
  describe('TimeUtilsMonthCoreTest', () => {
    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0001
     * @tc.name      testMonthCore0001
     * @tc.desc      Checks getLastDayOfMonth returns 31 for January 2024.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0001 begin');
      const actual: number = TimeUtils.getLastDayOfMonth(2024, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=31`);
      expect(actual).assertEqual(31);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testMonthCore0001 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0002
     * @tc.name      testMonthCore0002
     * @tc.desc      Checks getLastDayOfMonth returns 29 for leap February 2024.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0002 begin');
      const actual: number = TimeUtils.getLastDayOfMonth(2024, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=29`);
      expect(actual).assertEqual(29);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testMonthCore0002 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0003
     * @tc.name      testMonthCore0003
     * @tc.desc      Checks getLastDayOfMonth returns 28 for common February 2023.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0003 begin');
      const actual: number = TimeUtils.getLastDayOfMonth(2023, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=28`);
      expect(actual).assertEqual(28);
      log('testMonthCore0003 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0004
     * @tc.name      testMonthCore0004
     * @tc.desc      Checks getLastDayOfMonth returns 29 for February of a year divisible by 400.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0004 begin');
      const actual: number = TimeUtils.getLastDayOfMonth(2000, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=29`);
      expect(actual).assertEqual(29);
      log('testMonthCore0004 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0005
     * @tc.name      testMonthCore0005
     * @tc.desc      Checks getLastDayOfMonth returns 28 for February 1900 which is a common year.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0005 begin');
      const actual: number = TimeUtils.getLastDayOfMonth(1900, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=28`);
      expect(actual).assertEqual(28);
      log('testMonthCore0005 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0006
     * @tc.name      testMonthCore0006
     * @tc.desc      Checks getLastDayOfMonth returns 28 for February 2100 which is a common year.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0006 begin');
      const actual: number = TimeUtils.getLastDayOfMonth(2100, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=28`);
      expect(actual).assertEqual(28);
      log('testMonthCore0006 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0007
     * @tc.name      testMonthCore0007
     * @tc.desc      Checks getLastDayOfMonth returns 30 for April 2024.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0007 begin');
      const actual: number = TimeUtils.getLastDayOfMonth(2024, 4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=30`);
      expect(actual).assertEqual(30);
      log('testMonthCore0007 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0008
     * @tc.name      testMonthCore0008
     * @tc.desc      Checks getLastDayOfMonth returns 30 for June 2024.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0008 begin');
      const actual: number = TimeUtils.getLastDayOfMonth(2024, 6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=30`);
      expect(actual).assertEqual(30);
      log('testMonthCore0008 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0009
     * @tc.name      testMonthCore0009
     * @tc.desc      Checks getLastDayOfMonth returns 30 for September 2024.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0009 begin');
      const actual: number = TimeUtils.getLastDayOfMonth(2024, 9);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=30`);
      expect(actual).assertEqual(30);
      log('testMonthCore0009 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0010
     * @tc.name      testMonthCore0010
     * @tc.desc      Checks getLastDayOfMonth returns 30 for November 2024.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0010 begin');
      const actual: number = TimeUtils.getLastDayOfMonth(2024, 11);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=30`);
      expect(actual).assertEqual(30);
      log('testMonthCore0010 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0011
     * @tc.name      testMonthCore0011
     * @tc.desc      Checks getLastDayOfMonth returns 31 for March 2024.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0011 begin');
      const actual: number = TimeUtils.getLastDayOfMonth(2024, 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=31`);
      expect(actual).assertEqual(31);
      log('testMonthCore0011 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0012
     * @tc.name      testMonthCore0012
     * @tc.desc      Checks getLastDayOfMonth returns 31 for May 2024.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0012 begin');
      const actual: number = TimeUtils.getLastDayOfMonth(2024, 5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=31`);
      expect(actual).assertEqual(31);
      log('testMonthCore0012 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0013
     * @tc.name      testMonthCore0013
     * @tc.desc      Checks getLastDayOfMonth returns 31 for July 2024.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0013 begin');
      const actual: number = TimeUtils.getLastDayOfMonth(2024, 7);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=31`);
      expect(actual).assertEqual(31);
      log('testMonthCore0013 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0014
     * @tc.name      testMonthCore0014
     * @tc.desc      Checks getLastDayOfMonth returns 31 for August 2024.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0014 begin');
      const actual: number = TimeUtils.getLastDayOfMonth(2024, 8);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=31`);
      expect(actual).assertEqual(31);
      log('testMonthCore0014 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0015
     * @tc.name      testMonthCore0015
     * @tc.desc      Checks getLastDayOfMonth returns 31 for October 2024.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0015 begin');
      const actual: number = TimeUtils.getLastDayOfMonth(2024, 10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=31`);
      expect(actual).assertEqual(31);
      log('testMonthCore0015 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0016
     * @tc.name      testMonthCore0016
     * @tc.desc      Checks getLastDayOfMonth returns 31 for December 2024.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0016 begin');
      const actual: number = TimeUtils.getLastDayOfMonth(2024, 12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=31`);
      expect(actual).assertEqual(31);
      log('testMonthCore0016 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0017
     * @tc.name      testMonthCore0017
     * @tc.desc      Checks getLastDayOfMonth rolls month 13 over to January of the next year.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0017 begin');
      const actual: number = TimeUtils.getLastDayOfMonth(2024, 13);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=31`);
      expect(actual).assertEqual(31);
      log('testMonthCore0017 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0018
     * @tc.name      testMonthCore0018
     * @tc.desc      Checks getLastDayOfMonth rolls month 0 back to December of the previous year.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0018 begin');
      const actual: number = TimeUtils.getLastDayOfMonth(2024, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=31`);
      expect(actual).assertEqual(31);
      log('testMonthCore0018 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0019
     * @tc.name      testMonthCore0019
     * @tc.desc      Checks getLastDayOfMonth returns 31 for December 2023.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0019 begin');
      const actual: number = TimeUtils.getLastDayOfMonth(2023, 12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=31`);
      expect(actual).assertEqual(31);
      log('testMonthCore0019 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0020
     * @tc.name      testMonthCore0020
     * @tc.desc      Checks getLastDayOfMonth returns 29 for leap February 1996.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0020 begin');
      const actual: number = TimeUtils.getLastDayOfMonth(1996, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=29`);
      expect(actual).assertEqual(29);
      log('testMonthCore0020 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0021
     * @tc.name      testMonthCore0021
     * @tc.desc      Checks getMonthDays returns 29 for leap February 2024.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0021 begin');
      const actual: number = TimeUtils.getMonthDays(2024, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=29`);
      expect(actual).assertEqual(29);
      log('testMonthCore0021 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0022
     * @tc.name      testMonthCore0022
     * @tc.desc      Checks getMonthDays returns 28 for common February 2023.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0022 begin');
      const actual: number = TimeUtils.getMonthDays(2023, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=28`);
      expect(actual).assertEqual(28);
      log('testMonthCore0022 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0023
     * @tc.name      testMonthCore0023
     * @tc.desc      Checks getMonthDays returns 29 for February 2000 divisible by 400.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0023 begin');
      const actual: number = TimeUtils.getMonthDays(2000, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=29`);
      expect(actual).assertEqual(29);
      log('testMonthCore0023 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0024
     * @tc.name      testMonthCore0024
     * @tc.desc      Checks getMonthDays returns 28 for February 1900 not divisible by 400.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0024 begin');
      const actual: number = TimeUtils.getMonthDays(1900, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=28`);
      expect(actual).assertEqual(28);
      log('testMonthCore0024 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0025
     * @tc.name      testMonthCore0025
     * @tc.desc      Checks getMonthDays returns 28 for February 2100 not divisible by 400.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0025 begin');
      const actual: number = TimeUtils.getMonthDays(2100, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=28`);
      expect(actual).assertEqual(28);
      log('testMonthCore0025 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0026
     * @tc.name      testMonthCore0026
     * @tc.desc      Checks getMonthDays returns 30 for April 2024.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0026 begin');
      const actual: number = TimeUtils.getMonthDays(2024, 4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=30`);
      expect(actual).assertEqual(30);
      log('testMonthCore0026 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0027
     * @tc.name      testMonthCore0027
     * @tc.desc      Checks getMonthDays returns 30 for November 2024.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0027 begin');
      const actual: number = TimeUtils.getMonthDays(2024, 11);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=30`);
      expect(actual).assertEqual(30);
      log('testMonthCore0027 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0028
     * @tc.name      testMonthCore0028
     * @tc.desc      Checks getMonthDays returns 31 for January 2024.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0028 begin');
      const actual: number = TimeUtils.getMonthDays(2024, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=31`);
      expect(actual).assertEqual(31);
      log('testMonthCore0028 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0029
     * @tc.name      testMonthCore0029
     * @tc.desc      Checks getMonthDays returns 31 for December 2024.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0029 begin');
      const actual: number = TimeUtils.getMonthDays(2024, 12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=31`);
      expect(actual).assertEqual(31);
      log('testMonthCore0029 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0030
     * @tc.name      testMonthCore0030
     * @tc.desc      Checks getMonthDays returns the fallback 0 for illegal month 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0030 begin');
      const actual: number = TimeUtils.getMonthDays(2024, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=0`);
      expect(actual).assertEqual(0);
      log('testMonthCore0030 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0031
     * @tc.name      testMonthCore0031
     * @tc.desc      Checks getMonthDays returns the fallback 0 for illegal month 13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0031 begin');
      const actual: number = TimeUtils.getMonthDays(2024, 13);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=0`);
      expect(actual).assertEqual(0);
      log('testMonthCore0031 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0032
     * @tc.name      testMonthCore0032
     * @tc.desc      Checks getCurrentMonthDays builds 29 ascending days for leap February 2024.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0032 begin');
      const days: number[] = TimeUtils.getCurrentMonthDays(2024, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual days.length=${days.length}, expected=29`);
      expect(days.length).assertEqual(29);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual days[0]=${days[0]}, expected=1`);
      expect(days[0]).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual days[28]=${days[28]}, expected=29`);
      expect(days[28]).assertEqual(29);
      log('testMonthCore0032 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0033
     * @tc.name      testMonthCore0033
     * @tc.desc      Checks getCurrentMonthDays builds 28 days for common February 2023.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0033 begin');
      const days: number[] = TimeUtils.getCurrentMonthDays(2023, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual days.length=${days.length}, expected=28`);
      expect(days.length).assertEqual(28);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual days[27]=${days[27]}, expected=28`);
      expect(days[27]).assertEqual(28);
      log('testMonthCore0033 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0034
     * @tc.name      testMonthCore0034
     * @tc.desc      Checks getCurrentMonthDays builds 31 days for January 2024.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0034 begin');
      const days: number[] = TimeUtils.getCurrentMonthDays(2024, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual days.length=${days.length}, expected=31`);
      expect(days.length).assertEqual(31);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual days[30]=${days[30]}, expected=31`);
      expect(days[30]).assertEqual(31);
      log('testMonthCore0034 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0035
     * @tc.name      testMonthCore0035
     * @tc.desc      Checks getCurrentMonthDays builds 30 days for April 2024.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0035 begin');
      const days: number[] = TimeUtils.getCurrentMonthDays(2024, 4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual days.length=${days.length}, expected=30`);
      expect(days.length).assertEqual(30);
      log('testMonthCore0035 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0036
     * @tc.name      testMonthCore0036
     * @tc.desc      Checks getCurrentMonthDays builds 31 days for December 2024.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0036 begin');
      const days: number[] = TimeUtils.getCurrentMonthDays(2024, 12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual days.length=${days.length}, expected=31`);
      expect(days.length).assertEqual(31);
      log('testMonthCore0036 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0037
     * @tc.name      testMonthCore0037
     * @tc.desc      Checks getCurrentMonthDays output is strictly ascending from 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0037 begin');
      const days: number[] = TimeUtils.getCurrentMonthDays(2024, 3);
      let ascending: boolean = days.length === 31;
      for (let i: number = 0; i < days.length; i++) {
        if (days[i] !== i + 1) {
          ascending = false;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ascending=${ascending}`);
      expect(ascending).assertTrue();
      log('testMonthCore0037 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0038
     * @tc.name      testMonthCore0038
     * @tc.desc      Checks getPreviousMonthLastDays returns the last day of December 2023.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0038 begin');
      const days: number[] = TimeUtils.getPreviousMonthLastDays(2024, 1, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual days.length=${days.length}, expected=1`);
      expect(days.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual days[0]=${days[0]}, expected=31`);
      expect(days[0]).assertEqual(31);
      log('testMonthCore0038 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0039
     * @tc.name      testMonthCore0039
     * @tc.desc      Checks getPreviousMonthLastDays returns the last three days of December 2023.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0039 begin');
      const days: number[] = TimeUtils.getPreviousMonthLastDays(2024, 1, 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual days.length=${days.length}, expected=3`);
      expect(days.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual days[0]=${days[0]}, expected=29`);
      expect(days[0]).assertEqual(29);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual days[2]=${days[2]}, expected=31`);
      expect(days[2]).assertEqual(31);
      log('testMonthCore0039 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0040
     * @tc.name      testMonthCore0040
     * @tc.desc      Checks getPreviousMonthLastDays returns an empty array when the month starts on Sunday.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0040 begin');
      const days: number[] = TimeUtils.getPreviousMonthLastDays(2024, 3, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual days.length=${days.length}, expected=0`);
      expect(days.length).assertEqual(0);
      log('testMonthCore0040 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0041
     * @tc.name      testMonthCore0041
     * @tc.desc      Checks getPreviousMonthLastDays returns the last five days of leap February 2024.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0041 begin');
      const days: number[] = TimeUtils.getPreviousMonthLastDays(2024, 3, 5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual days.length=${days.length}, expected=5`);
      expect(days.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual days[0]=${days[0]}, expected=25`);
      expect(days[0]).assertEqual(25);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual days[4]=${days[4]}, expected=29`);
      expect(days[4]).assertEqual(29);
      log('testMonthCore0041 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0042
     * @tc.name      testMonthCore0042
     * @tc.desc      Checks getPreviousMonthLastDays returns the last two days of November 2024.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0042 begin');
      const days: number[] = TimeUtils.getPreviousMonthLastDays(2024, 12, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual days.length=${days.length}, expected=2`);
      expect(days.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual days[0]=${days[0]}, expected=29`);
      expect(days[0]).assertEqual(29);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual days[1]=${days[1]}, expected=30`);
      expect(days[1]).assertEqual(30);
      log('testMonthCore0042 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0043
     * @tc.name      testMonthCore0043
     * @tc.desc      Checks getPreviousMonthLastDays rolls month 0 back to November 2023.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0043 begin');
      const days: number[] = TimeUtils.getPreviousMonthLastDays(2024, 0, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual days.length=${days.length}, expected=1`);
      expect(days.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual days[0]=${days[0]}, expected=30`);
      expect(days[0]).assertEqual(30);
      log('testMonthCore0043 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0044
     * @tc.name      testMonthCore0044
     * @tc.desc      Checks getPreviousMonthLastDays returns day 28 for common February 2023.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0044 begin');
      const days: number[] = TimeUtils.getPreviousMonthLastDays(2023, 3, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual days.length=${days.length}, expected=1`);
      expect(days.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual days[0]=${days[0]}, expected=28`);
      expect(days[0]).assertEqual(28);
      log('testMonthCore0044 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0045
     * @tc.name      testMonthCore0045
     * @tc.desc      Checks getWeekDay returns 1 for Monday 2024-01-01.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0045 begin');
      const actual: number = TimeUtils.getWeekDay(2024, 1, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=1`);
      expect(actual).assertEqual(1);
      log('testMonthCore0045 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0046
     * @tc.name      testMonthCore0046
     * @tc.desc      Checks getWeekDay returns 4 for Thursday 2024-02-29.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0046 begin');
      const actual: number = TimeUtils.getWeekDay(2024, 2, 29);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=4`);
      expect(actual).assertEqual(4);
      log('testMonthCore0046 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0047
     * @tc.name      testMonthCore0047
     * @tc.desc      Checks getWeekDay returns 0 for Sunday 2023-12-31.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0047 begin');
      const actual: number = TimeUtils.getWeekDay(2023, 12, 31);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=0`);
      expect(actual).assertEqual(0);
      log('testMonthCore0047 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0048
     * @tc.name      testMonthCore0048
     * @tc.desc      Checks getWeekDay returns 6 for Saturday 2024-02-10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0048 begin');
      const actual: number = TimeUtils.getWeekDay(2024, 2, 10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=6`);
      expect(actual).assertEqual(6);
      log('testMonthCore0048 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0049
     * @tc.name      testMonthCore0049
     * @tc.desc      Checks getWeekDay returns 6 for Saturday 2000-01-01.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0049 begin');
      const actual: number = TimeUtils.getWeekDay(2000, 1, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=6`);
      expect(actual).assertEqual(6);
      log('testMonthCore0049 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0050
     * @tc.name      testMonthCore0050
     * @tc.desc      Checks getWeekDay returns 4 for the epoch Thursday 1970-01-01.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0050 begin');
      const actual: number = TimeUtils.getWeekDay(1970, 1, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=4`);
      expect(actual).assertEqual(4);
      log('testMonthCore0050 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0051
     * @tc.name      testMonthCore0051
     * @tc.desc      Checks getWeekDay returns 5 for Friday 2100-01-01.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0051 begin');
      const actual: number = TimeUtils.getWeekDay(2100, 1, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=5`);
      expect(actual).assertEqual(5);
      log('testMonthCore0051 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0052
     * @tc.name      testMonthCore0052
     * @tc.desc      Checks getWeekDay returns 0 for Sunday 2024-06-16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0052 begin');
      const actual: number = TimeUtils.getWeekDay(2024, 6, 16);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=0`);
      expect(actual).assertEqual(0);
      log('testMonthCore0052 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0053
     * @tc.name      testMonthCore0053
     * @tc.desc      Checks getWeekDay returns 3 for Wednesday 2024-12-25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0053 begin');
      const actual: number = TimeUtils.getWeekDay(2024, 12, 25);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=3`);
      expect(actual).assertEqual(3);
      log('testMonthCore0053 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0054
     * @tc.name      testMonthCore0054
     * @tc.desc      Checks getWeekDay rolls month 13 over to Wednesday 2025-01-01.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0054 begin');
      const actual: number = TimeUtils.getWeekDay(2024, 13, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=3`);
      expect(actual).assertEqual(3);
      log('testMonthCore0054 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0055
     * @tc.name      testMonthCore0055
     * @tc.desc      Checks getWeekDay rolls month 0 back to Friday 2023-12-01.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0055 begin');
      const actual: number = TimeUtils.getWeekDay(2024, 0, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=5`);
      expect(actual).assertEqual(5);
      log('testMonthCore0055 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_MONTHCORE_0056
     * @tc.name      testMonthCore0056
     * @tc.desc      Checks getWeekDay returns 4 for Thursday 2024-07-04.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMonthCore0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMonthCore0056 begin');
      const actual: number = TimeUtils.getWeekDay(2024, 7, 4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=4`);
      expect(actual).assertEqual(4);
      log('testMonthCore0056 end');
    })
  })
}
