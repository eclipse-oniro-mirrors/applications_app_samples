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

const TAG: string = '[Sample_dateTimeMinutesCore]';
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
export default function dateTimeMinutesCoreTest(): void {
  describe('dateTimeMinutesCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_0100
     * @tc.name      testDateTimeMinutes0001
     * @tc.desc      Verify dateTimeMinutesCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 0;
      const t: number = minute * 60 + 0;
      expect(dateTime(t)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_0200
     * @tc.name      testDateTimeMinutes0002
     * @tc.desc      Verify dateTimeMinutesCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 1;
      const t: number = minute * 60 + 1;
      expect(dateTime(t)).assertEqual('01:01');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_0300
     * @tc.name      testDateTimeMinutes0003
     * @tc.desc      Verify dateTimeMinutesCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 2;
      const t: number = minute * 60 + 2;
      expect(dateTime(t)).assertEqual('02:02');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_0400
     * @tc.name      testDateTimeMinutes0004
     * @tc.desc      Verify dateTimeMinutesCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 3;
      const t: number = minute * 60 + 3;
      expect(dateTime(t)).assertEqual('03:03');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_0500
     * @tc.name      testDateTimeMinutes0005
     * @tc.desc      Verify dateTimeMinutesCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 4;
      const t: number = minute * 60 + 4;
      expect(dateTime(t)).assertEqual('04:04');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_0600
     * @tc.name      testDateTimeMinutes0006
     * @tc.desc      Verify dateTimeMinutesCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 5;
      const t: number = minute * 60 + 5;
      expect(dateTime(t)).assertEqual('05:05');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_0700
     * @tc.name      testDateTimeMinutes0007
     * @tc.desc      Verify dateTimeMinutesCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 6;
      const t: number = minute * 60 + 6;
      expect(dateTime(t)).assertEqual('06:06');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_0800
     * @tc.name      testDateTimeMinutes0008
     * @tc.desc      Verify dateTimeMinutesCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 7;
      const t: number = minute * 60 + 7;
      expect(dateTime(t)).assertEqual('07:07');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_0900
     * @tc.name      testDateTimeMinutes0009
     * @tc.desc      Verify dateTimeMinutesCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 8;
      const t: number = minute * 60 + 8;
      expect(dateTime(t)).assertEqual('08:08');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_1000
     * @tc.name      testDateTimeMinutes0010
     * @tc.desc      Verify dateTimeMinutesCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 9;
      const t: number = minute * 60 + 9;
      expect(dateTime(t)).assertEqual('09:09');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_1100
     * @tc.name      testDateTimeMinutes0011
     * @tc.desc      Verify dateTimeMinutesCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 10;
      const t: number = minute * 60 + 10;
      expect(dateTime(t)).assertEqual('10:10');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_1200
     * @tc.name      testDateTimeMinutes0012
     * @tc.desc      Verify dateTimeMinutesCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 11;
      const t: number = minute * 60 + 11;
      expect(dateTime(t)).assertEqual('11:11');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_1300
     * @tc.name      testDateTimeMinutes0013
     * @tc.desc      Verify dateTimeMinutesCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 12;
      const t: number = minute * 60 + 12;
      expect(dateTime(t)).assertEqual('12:12');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_1400
     * @tc.name      testDateTimeMinutes0014
     * @tc.desc      Verify dateTimeMinutesCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 13;
      const t: number = minute * 60 + 13;
      expect(dateTime(t)).assertEqual('13:13');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_1500
     * @tc.name      testDateTimeMinutes0015
     * @tc.desc      Verify dateTimeMinutesCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 14;
      const t: number = minute * 60 + 14;
      expect(dateTime(t)).assertEqual('14:14');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_1600
     * @tc.name      testDateTimeMinutes0016
     * @tc.desc      Verify dateTimeMinutesCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 15;
      const t: number = minute * 60 + 15;
      expect(dateTime(t)).assertEqual('15:15');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_1700
     * @tc.name      testDateTimeMinutes0017
     * @tc.desc      Verify dateTimeMinutesCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 16;
      const t: number = minute * 60 + 16;
      expect(dateTime(t)).assertEqual('16:16');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_1800
     * @tc.name      testDateTimeMinutes0018
     * @tc.desc      Verify dateTimeMinutesCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 17;
      const t: number = minute * 60 + 17;
      expect(dateTime(t)).assertEqual('17:17');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_1900
     * @tc.name      testDateTimeMinutes0019
     * @tc.desc      Verify dateTimeMinutesCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 18;
      const t: number = minute * 60 + 18;
      expect(dateTime(t)).assertEqual('18:18');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_2000
     * @tc.name      testDateTimeMinutes0020
     * @tc.desc      Verify dateTimeMinutesCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 19;
      const t: number = minute * 60 + 19;
      expect(dateTime(t)).assertEqual('19:19');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_2100
     * @tc.name      testDateTimeMinutes0021
     * @tc.desc      Verify dateTimeMinutesCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 20;
      const t: number = minute * 60 + 20;
      expect(dateTime(t)).assertEqual('20:20');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_2200
     * @tc.name      testDateTimeMinutes0022
     * @tc.desc      Verify dateTimeMinutesCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 21;
      const t: number = minute * 60 + 21;
      expect(dateTime(t)).assertEqual('21:21');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_2300
     * @tc.name      testDateTimeMinutes0023
     * @tc.desc      Verify dateTimeMinutesCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 22;
      const t: number = minute * 60 + 22;
      expect(dateTime(t)).assertEqual('22:22');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_2400
     * @tc.name      testDateTimeMinutes0024
     * @tc.desc      Verify dateTimeMinutesCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 23;
      const t: number = minute * 60 + 23;
      expect(dateTime(t)).assertEqual('23:23');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_2500
     * @tc.name      testDateTimeMinutes0025
     * @tc.desc      Verify dateTimeMinutesCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 24;
      const t: number = minute * 60 + 24;
      expect(dateTime(t)).assertEqual('24:24');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_2600
     * @tc.name      testDateTimeMinutes0026
     * @tc.desc      Verify dateTimeMinutesCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 25;
      const t: number = minute * 60 + 25;
      expect(dateTime(t)).assertEqual('25:25');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_2700
     * @tc.name      testDateTimeMinutes0027
     * @tc.desc      Verify dateTimeMinutesCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 26;
      const t: number = minute * 60 + 26;
      expect(dateTime(t)).assertEqual('26:26');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_2800
     * @tc.name      testDateTimeMinutes0028
     * @tc.desc      Verify dateTimeMinutesCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 27;
      const t: number = minute * 60 + 27;
      expect(dateTime(t)).assertEqual('27:27');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_2900
     * @tc.name      testDateTimeMinutes0029
     * @tc.desc      Verify dateTimeMinutesCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 28;
      const t: number = minute * 60 + 28;
      expect(dateTime(t)).assertEqual('28:28');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_3000
     * @tc.name      testDateTimeMinutes0030
     * @tc.desc      Verify dateTimeMinutesCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 29;
      const t: number = minute * 60 + 29;
      expect(dateTime(t)).assertEqual('29:29');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_3100
     * @tc.name      testDateTimeMinutes0031
     * @tc.desc      Verify dateTimeMinutesCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 30;
      const t: number = minute * 60 + 30;
      expect(dateTime(t)).assertEqual('30:30');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_3200
     * @tc.name      testDateTimeMinutes0032
     * @tc.desc      Verify dateTimeMinutesCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 31;
      const t: number = minute * 60 + 31;
      expect(dateTime(t)).assertEqual('31:31');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_3300
     * @tc.name      testDateTimeMinutes0033
     * @tc.desc      Verify dateTimeMinutesCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 32;
      const t: number = minute * 60 + 32;
      expect(dateTime(t)).assertEqual('32:32');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_3400
     * @tc.name      testDateTimeMinutes0034
     * @tc.desc      Verify dateTimeMinutesCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 33;
      const t: number = minute * 60 + 33;
      expect(dateTime(t)).assertEqual('33:33');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_3500
     * @tc.name      testDateTimeMinutes0035
     * @tc.desc      Verify dateTimeMinutesCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 34;
      const t: number = minute * 60 + 34;
      expect(dateTime(t)).assertEqual('34:34');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_3600
     * @tc.name      testDateTimeMinutes0036
     * @tc.desc      Verify dateTimeMinutesCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 35;
      const t: number = minute * 60 + 35;
      expect(dateTime(t)).assertEqual('35:35');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_3700
     * @tc.name      testDateTimeMinutes0037
     * @tc.desc      Verify dateTimeMinutesCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 36;
      const t: number = minute * 60 + 36;
      expect(dateTime(t)).assertEqual('36:36');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_3800
     * @tc.name      testDateTimeMinutes0038
     * @tc.desc      Verify dateTimeMinutesCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 37;
      const t: number = minute * 60 + 37;
      expect(dateTime(t)).assertEqual('37:37');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_3900
     * @tc.name      testDateTimeMinutes0039
     * @tc.desc      Verify dateTimeMinutesCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 38;
      const t: number = minute * 60 + 38;
      expect(dateTime(t)).assertEqual('38:38');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_4000
     * @tc.name      testDateTimeMinutes0040
     * @tc.desc      Verify dateTimeMinutesCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 39;
      const t: number = minute * 60 + 39;
      expect(dateTime(t)).assertEqual('39:39');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_4100
     * @tc.name      testDateTimeMinutes0041
     * @tc.desc      Verify dateTimeMinutesCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 40;
      const t: number = minute * 60 + 40;
      expect(dateTime(t)).assertEqual('40:40');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_4200
     * @tc.name      testDateTimeMinutes0042
     * @tc.desc      Verify dateTimeMinutesCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 41;
      const t: number = minute * 60 + 41;
      expect(dateTime(t)).assertEqual('41:41');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_4300
     * @tc.name      testDateTimeMinutes0043
     * @tc.desc      Verify dateTimeMinutesCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 42;
      const t: number = minute * 60 + 42;
      expect(dateTime(t)).assertEqual('42:42');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_4400
     * @tc.name      testDateTimeMinutes0044
     * @tc.desc      Verify dateTimeMinutesCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 43;
      const t: number = minute * 60 + 43;
      expect(dateTime(t)).assertEqual('43:43');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_4500
     * @tc.name      testDateTimeMinutes0045
     * @tc.desc      Verify dateTimeMinutesCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 44;
      const t: number = minute * 60 + 44;
      expect(dateTime(t)).assertEqual('44:44');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_4600
     * @tc.name      testDateTimeMinutes0046
     * @tc.desc      Verify dateTimeMinutesCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 45;
      const t: number = minute * 60 + 45;
      expect(dateTime(t)).assertEqual('45:45');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_4700
     * @tc.name      testDateTimeMinutes0047
     * @tc.desc      Verify dateTimeMinutesCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 46;
      const t: number = minute * 60 + 46;
      expect(dateTime(t)).assertEqual('46:46');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_4800
     * @tc.name      testDateTimeMinutes0048
     * @tc.desc      Verify dateTimeMinutesCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 47;
      const t: number = minute * 60 + 47;
      expect(dateTime(t)).assertEqual('47:47');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_4900
     * @tc.name      testDateTimeMinutes0049
     * @tc.desc      Verify dateTimeMinutesCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 48;
      const t: number = minute * 60 + 48;
      expect(dateTime(t)).assertEqual('48:48');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_5000
     * @tc.name      testDateTimeMinutes0050
     * @tc.desc      Verify dateTimeMinutesCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 49;
      const t: number = minute * 60 + 49;
      expect(dateTime(t)).assertEqual('49:49');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_5100
     * @tc.name      testDateTimeMinutes0051
     * @tc.desc      Verify dateTimeMinutesCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 50;
      const t: number = minute * 60 + 50;
      expect(dateTime(t)).assertEqual('50:50');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_5200
     * @tc.name      testDateTimeMinutes0052
     * @tc.desc      Verify dateTimeMinutesCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 51;
      const t: number = minute * 60 + 51;
      expect(dateTime(t)).assertEqual('51:51');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_5300
     * @tc.name      testDateTimeMinutes0053
     * @tc.desc      Verify dateTimeMinutesCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 52;
      const t: number = minute * 60 + 52;
      expect(dateTime(t)).assertEqual('52:52');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_5400
     * @tc.name      testDateTimeMinutes0054
     * @tc.desc      Verify dateTimeMinutesCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 53;
      const t: number = minute * 60 + 53;
      expect(dateTime(t)).assertEqual('53:53');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_5500
     * @tc.name      testDateTimeMinutes0055
     * @tc.desc      Verify dateTimeMinutesCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 54;
      const t: number = minute * 60 + 54;
      expect(dateTime(t)).assertEqual('54:54');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_5600
     * @tc.name      testDateTimeMinutes0056
     * @tc.desc      Verify dateTimeMinutesCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 55;
      const t: number = minute * 60 + 55;
      expect(dateTime(t)).assertEqual('55:55');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_5700
     * @tc.name      testDateTimeMinutes0057
     * @tc.desc      Verify dateTimeMinutesCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 56;
      const t: number = minute * 60 + 56;
      expect(dateTime(t)).assertEqual('56:56');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_5800
     * @tc.name      testDateTimeMinutes0058
     * @tc.desc      Verify dateTimeMinutesCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 57;
      const t: number = minute * 60 + 57;
      expect(dateTime(t)).assertEqual('57:57');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_5900
     * @tc.name      testDateTimeMinutes0059
     * @tc.desc      Verify dateTimeMinutesCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 58;
      const t: number = minute * 60 + 58;
      expect(dateTime(t)).assertEqual('58:58');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_6000
     * @tc.name      testDateTimeMinutes0060
     * @tc.desc      Verify dateTimeMinutesCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 59;
      const t: number = minute * 60 + 59;
      expect(dateTime(t)).assertEqual('59:59');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_6100
     * @tc.name      testDateTimeMinutes0061
     * @tc.desc      Verify dateTimeMinutesCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 0;
      const t: number = minute * 60 + 0;
      expect(dateTime(t)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_6200
     * @tc.name      testDateTimeMinutes0062
     * @tc.desc      Verify dateTimeMinutesCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 1;
      const t: number = minute * 60 + 1;
      expect(dateTime(t)).assertEqual('01:01');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_6300
     * @tc.name      testDateTimeMinutes0063
     * @tc.desc      Verify dateTimeMinutesCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 2;
      const t: number = minute * 60 + 2;
      expect(dateTime(t)).assertEqual('02:02');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_6400
     * @tc.name      testDateTimeMinutes0064
     * @tc.desc      Verify dateTimeMinutesCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 3;
      const t: number = minute * 60 + 3;
      expect(dateTime(t)).assertEqual('03:03');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_6500
     * @tc.name      testDateTimeMinutes0065
     * @tc.desc      Verify dateTimeMinutesCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 4;
      const t: number = minute * 60 + 4;
      expect(dateTime(t)).assertEqual('04:04');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_6600
     * @tc.name      testDateTimeMinutes0066
     * @tc.desc      Verify dateTimeMinutesCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 5;
      const t: number = minute * 60 + 5;
      expect(dateTime(t)).assertEqual('05:05');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_6700
     * @tc.name      testDateTimeMinutes0067
     * @tc.desc      Verify dateTimeMinutesCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 6;
      const t: number = minute * 60 + 6;
      expect(dateTime(t)).assertEqual('06:06');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_6800
     * @tc.name      testDateTimeMinutes0068
     * @tc.desc      Verify dateTimeMinutesCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 7;
      const t: number = minute * 60 + 7;
      expect(dateTime(t)).assertEqual('07:07');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_6900
     * @tc.name      testDateTimeMinutes0069
     * @tc.desc      Verify dateTimeMinutesCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 8;
      const t: number = minute * 60 + 8;
      expect(dateTime(t)).assertEqual('08:08');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_7000
     * @tc.name      testDateTimeMinutes0070
     * @tc.desc      Verify dateTimeMinutesCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 9;
      const t: number = minute * 60 + 9;
      expect(dateTime(t)).assertEqual('09:09');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_7100
     * @tc.name      testDateTimeMinutes0071
     * @tc.desc      Verify dateTimeMinutesCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 10;
      const t: number = minute * 60 + 10;
      expect(dateTime(t)).assertEqual('10:10');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_7200
     * @tc.name      testDateTimeMinutes0072
     * @tc.desc      Verify dateTimeMinutesCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 11;
      const t: number = minute * 60 + 11;
      expect(dateTime(t)).assertEqual('11:11');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_7300
     * @tc.name      testDateTimeMinutes0073
     * @tc.desc      Verify dateTimeMinutesCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 12;
      const t: number = minute * 60 + 12;
      expect(dateTime(t)).assertEqual('12:12');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_7400
     * @tc.name      testDateTimeMinutes0074
     * @tc.desc      Verify dateTimeMinutesCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 13;
      const t: number = minute * 60 + 13;
      expect(dateTime(t)).assertEqual('13:13');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_7500
     * @tc.name      testDateTimeMinutes0075
     * @tc.desc      Verify dateTimeMinutesCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 14;
      const t: number = minute * 60 + 14;
      expect(dateTime(t)).assertEqual('14:14');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_7600
     * @tc.name      testDateTimeMinutes0076
     * @tc.desc      Verify dateTimeMinutesCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 15;
      const t: number = minute * 60 + 15;
      expect(dateTime(t)).assertEqual('15:15');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_7700
     * @tc.name      testDateTimeMinutes0077
     * @tc.desc      Verify dateTimeMinutesCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 16;
      const t: number = minute * 60 + 16;
      expect(dateTime(t)).assertEqual('16:16');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_7800
     * @tc.name      testDateTimeMinutes0078
     * @tc.desc      Verify dateTimeMinutesCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 17;
      const t: number = minute * 60 + 17;
      expect(dateTime(t)).assertEqual('17:17');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_7900
     * @tc.name      testDateTimeMinutes0079
     * @tc.desc      Verify dateTimeMinutesCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 18;
      const t: number = minute * 60 + 18;
      expect(dateTime(t)).assertEqual('18:18');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_8000
     * @tc.name      testDateTimeMinutes0080
     * @tc.desc      Verify dateTimeMinutesCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 19;
      const t: number = minute * 60 + 19;
      expect(dateTime(t)).assertEqual('19:19');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_MIN_8100
     * @tc.name      testDateTimeMinutes0081
     * @tc.desc      Verify dateTimeMinutesCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeMinutes0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const minute: number = 20;
      const t: number = minute * 60 + 20;
      expect(dateTime(t)).assertEqual('20:20');
    });

  });
}
