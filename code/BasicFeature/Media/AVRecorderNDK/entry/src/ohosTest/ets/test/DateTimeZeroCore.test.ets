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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeEach, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import DateTimeUtil, { dateTime } from '../../../main/ets/utils/DateTimeUtil';

const TAG: string = '[Sample_dateTimeZeroCore]';
const DOMAIN: number = 0xF811;

function it(name: string, filter: number, func: () => void | Promise<void>): void {
  hypiumIt(name, filter, async () => {
    hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
    try {
      await func();
    } finally {
      hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
    }
  });
}

interface ExpectAssert {
  assertEqual(expectValue: string | number | boolean | Object | null | undefined): void;
  assertTrue(): void;
  assertFalse(): void;
  assertLarger(expectValue: number): void;
  assertLargerOrEqual(expectValue: number): void;
  assertLess(expectValue: number): void;
  assertLessOrEqual(expectValue: number): void;
  assertUndefined(): void;
  assertFail(): void;
}

function expect(actual: string | number | boolean | Object | null | undefined): ExpectAssert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}
export default function dateTimeZeroCoreTest(): void {
  describe('dateTimeZeroCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_0100
     * @tc.name      testDateTimeZero0001
     * @tc.desc      Verify dateTimeZeroCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(0)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_0200
     * @tc.name      testDateTimeZero0002
     * @tc.desc      Verify dateTimeZeroCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(3600)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_0300
     * @tc.name      testDateTimeZero0003
     * @tc.desc      Verify dateTimeZeroCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(7200)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_0400
     * @tc.name      testDateTimeZero0004
     * @tc.desc      Verify dateTimeZeroCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(10800)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_0500
     * @tc.name      testDateTimeZero0005
     * @tc.desc      Verify dateTimeZeroCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(14400)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_0600
     * @tc.name      testDateTimeZero0006
     * @tc.desc      Verify dateTimeZeroCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(18000)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_0700
     * @tc.name      testDateTimeZero0007
     * @tc.desc      Verify dateTimeZeroCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(21600)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_0800
     * @tc.name      testDateTimeZero0008
     * @tc.desc      Verify dateTimeZeroCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(25200)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_0900
     * @tc.name      testDateTimeZero0009
     * @tc.desc      Verify dateTimeZeroCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(28800)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_1000
     * @tc.name      testDateTimeZero0010
     * @tc.desc      Verify dateTimeZeroCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(32400)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_1100
     * @tc.name      testDateTimeZero0011
     * @tc.desc      Verify dateTimeZeroCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(36000)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_1200
     * @tc.name      testDateTimeZero0012
     * @tc.desc      Verify dateTimeZeroCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(39600)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_1300
     * @tc.name      testDateTimeZero0013
     * @tc.desc      Verify dateTimeZeroCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(43200)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_1400
     * @tc.name      testDateTimeZero0014
     * @tc.desc      Verify dateTimeZeroCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(46800)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_1500
     * @tc.name      testDateTimeZero0015
     * @tc.desc      Verify dateTimeZeroCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(50400)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_1600
     * @tc.name      testDateTimeZero0016
     * @tc.desc      Verify dateTimeZeroCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(54000)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_1700
     * @tc.name      testDateTimeZero0017
     * @tc.desc      Verify dateTimeZeroCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(57600)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_1800
     * @tc.name      testDateTimeZero0018
     * @tc.desc      Verify dateTimeZeroCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(61200)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_1900
     * @tc.name      testDateTimeZero0019
     * @tc.desc      Verify dateTimeZeroCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(64800)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_2000
     * @tc.name      testDateTimeZero0020
     * @tc.desc      Verify dateTimeZeroCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(68400)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_2100
     * @tc.name      testDateTimeZero0021
     * @tc.desc      Verify dateTimeZeroCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(72000)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_2200
     * @tc.name      testDateTimeZero0022
     * @tc.desc      Verify dateTimeZeroCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(75600)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_2300
     * @tc.name      testDateTimeZero0023
     * @tc.desc      Verify dateTimeZeroCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(79200)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_2400
     * @tc.name      testDateTimeZero0024
     * @tc.desc      Verify dateTimeZeroCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(82800)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_2500
     * @tc.name      testDateTimeZero0025
     * @tc.desc      Verify dateTimeZeroCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(86400)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_2600
     * @tc.name      testDateTimeZero0026
     * @tc.desc      Verify dateTimeZeroCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(90000)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_2700
     * @tc.name      testDateTimeZero0027
     * @tc.desc      Verify dateTimeZeroCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(93600)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_2800
     * @tc.name      testDateTimeZero0028
     * @tc.desc      Verify dateTimeZeroCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(97200)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_2900
     * @tc.name      testDateTimeZero0029
     * @tc.desc      Verify dateTimeZeroCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(100800)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_3000
     * @tc.name      testDateTimeZero0030
     * @tc.desc      Verify dateTimeZeroCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(104400)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_3100
     * @tc.name      testDateTimeZero0031
     * @tc.desc      Verify dateTimeZeroCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(108000)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_3200
     * @tc.name      testDateTimeZero0032
     * @tc.desc      Verify dateTimeZeroCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(111600)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_3300
     * @tc.name      testDateTimeZero0033
     * @tc.desc      Verify dateTimeZeroCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(115200)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_3400
     * @tc.name      testDateTimeZero0034
     * @tc.desc      Verify dateTimeZeroCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(118800)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_3500
     * @tc.name      testDateTimeZero0035
     * @tc.desc      Verify dateTimeZeroCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(122400)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_3600
     * @tc.name      testDateTimeZero0036
     * @tc.desc      Verify dateTimeZeroCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(126000)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_3700
     * @tc.name      testDateTimeZero0037
     * @tc.desc      Verify dateTimeZeroCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(129600)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_3800
     * @tc.name      testDateTimeZero0038
     * @tc.desc      Verify dateTimeZeroCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(133200)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_3900
     * @tc.name      testDateTimeZero0039
     * @tc.desc      Verify dateTimeZeroCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(136800)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_4000
     * @tc.name      testDateTimeZero0040
     * @tc.desc      Verify dateTimeZeroCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(140400)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_4100
     * @tc.name      testDateTimeZero0041
     * @tc.desc      Verify dateTimeZeroCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(144000)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_4200
     * @tc.name      testDateTimeZero0042
     * @tc.desc      Verify dateTimeZeroCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(147600)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_4300
     * @tc.name      testDateTimeZero0043
     * @tc.desc      Verify dateTimeZeroCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(151200)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_4400
     * @tc.name      testDateTimeZero0044
     * @tc.desc      Verify dateTimeZeroCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(154800)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_4500
     * @tc.name      testDateTimeZero0045
     * @tc.desc      Verify dateTimeZeroCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(158400)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_4600
     * @tc.name      testDateTimeZero0046
     * @tc.desc      Verify dateTimeZeroCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(162000)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_4700
     * @tc.name      testDateTimeZero0047
     * @tc.desc      Verify dateTimeZeroCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(165600)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_4800
     * @tc.name      testDateTimeZero0048
     * @tc.desc      Verify dateTimeZeroCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(169200)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_4900
     * @tc.name      testDateTimeZero0049
     * @tc.desc      Verify dateTimeZeroCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(172800)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_5000
     * @tc.name      testDateTimeZero0050
     * @tc.desc      Verify dateTimeZeroCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(176400)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_5100
     * @tc.name      testDateTimeZero0051
     * @tc.desc      Verify dateTimeZeroCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(180000)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_5200
     * @tc.name      testDateTimeZero0052
     * @tc.desc      Verify dateTimeZeroCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(183600)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_5300
     * @tc.name      testDateTimeZero0053
     * @tc.desc      Verify dateTimeZeroCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(187200)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_5400
     * @tc.name      testDateTimeZero0054
     * @tc.desc      Verify dateTimeZeroCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(190800)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_5500
     * @tc.name      testDateTimeZero0055
     * @tc.desc      Verify dateTimeZeroCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(194400)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_5600
     * @tc.name      testDateTimeZero0056
     * @tc.desc      Verify dateTimeZeroCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(198000)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_5700
     * @tc.name      testDateTimeZero0057
     * @tc.desc      Verify dateTimeZeroCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(201600)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_5800
     * @tc.name      testDateTimeZero0058
     * @tc.desc      Verify dateTimeZeroCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(205200)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_5900
     * @tc.name      testDateTimeZero0059
     * @tc.desc      Verify dateTimeZeroCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(208800)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_6000
     * @tc.name      testDateTimeZero0060
     * @tc.desc      Verify dateTimeZeroCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(212400)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_6100
     * @tc.name      testDateTimeZero0061
     * @tc.desc      Verify dateTimeZeroCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(216000)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_6200
     * @tc.name      testDateTimeZero0062
     * @tc.desc      Verify dateTimeZeroCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(219600)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_6300
     * @tc.name      testDateTimeZero0063
     * @tc.desc      Verify dateTimeZeroCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(223200)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_6400
     * @tc.name      testDateTimeZero0064
     * @tc.desc      Verify dateTimeZeroCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(226800)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_6500
     * @tc.name      testDateTimeZero0065
     * @tc.desc      Verify dateTimeZeroCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(230400)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_6600
     * @tc.name      testDateTimeZero0066
     * @tc.desc      Verify dateTimeZeroCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(234000)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_6700
     * @tc.name      testDateTimeZero0067
     * @tc.desc      Verify dateTimeZeroCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(237600)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_6800
     * @tc.name      testDateTimeZero0068
     * @tc.desc      Verify dateTimeZeroCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(241200)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_6900
     * @tc.name      testDateTimeZero0069
     * @tc.desc      Verify dateTimeZeroCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(244800)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_7000
     * @tc.name      testDateTimeZero0070
     * @tc.desc      Verify dateTimeZeroCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(248400)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_7100
     * @tc.name      testDateTimeZero0071
     * @tc.desc      Verify dateTimeZeroCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(252000)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_7200
     * @tc.name      testDateTimeZero0072
     * @tc.desc      Verify dateTimeZeroCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(255600)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_7300
     * @tc.name      testDateTimeZero0073
     * @tc.desc      Verify dateTimeZeroCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(259200)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_7400
     * @tc.name      testDateTimeZero0074
     * @tc.desc      Verify dateTimeZeroCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(262800)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_7500
     * @tc.name      testDateTimeZero0075
     * @tc.desc      Verify dateTimeZeroCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(266400)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_7600
     * @tc.name      testDateTimeZero0076
     * @tc.desc      Verify dateTimeZeroCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(270000)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_7700
     * @tc.name      testDateTimeZero0077
     * @tc.desc      Verify dateTimeZeroCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(273600)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_7800
     * @tc.name      testDateTimeZero0078
     * @tc.desc      Verify dateTimeZeroCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(277200)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_7900
     * @tc.name      testDateTimeZero0079
     * @tc.desc      Verify dateTimeZeroCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(280800)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_8000
     * @tc.name      testDateTimeZero0080
     * @tc.desc      Verify dateTimeZeroCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(284400)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_ZERO_8100
     * @tc.name      testDateTimeZero0081
     * @tc.desc      Verify dateTimeZeroCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeZero0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(288000)).assertEqual('00:00');
      expect(dateTime(0)).assertEqual('00:00');
    });

  });
}
