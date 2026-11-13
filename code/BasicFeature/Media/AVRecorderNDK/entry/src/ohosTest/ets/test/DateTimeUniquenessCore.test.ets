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

const TAG: string = '[Sample_dateTimeUniquenessCore]';
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
export default function dateTimeUniquenessCoreTest(): void {
  describe('dateTimeUniquenessCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_0100
     * @tc.name      testDateTimeUniqueness0001
     * @tc.desc      Verify dateTimeUniquenessCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(0)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_0200
     * @tc.name      testDateTimeUniqueness0002
     * @tc.desc      Verify dateTimeUniquenessCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(60)).assertEqual('01:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_0300
     * @tc.name      testDateTimeUniqueness0003
     * @tc.desc      Verify dateTimeUniquenessCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(120)).assertEqual('02:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_0400
     * @tc.name      testDateTimeUniqueness0004
     * @tc.desc      Verify dateTimeUniquenessCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(180)).assertEqual('03:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_0500
     * @tc.name      testDateTimeUniqueness0005
     * @tc.desc      Verify dateTimeUniquenessCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(240)).assertEqual('04:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_0600
     * @tc.name      testDateTimeUniqueness0006
     * @tc.desc      Verify dateTimeUniquenessCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(300)).assertEqual('05:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_0700
     * @tc.name      testDateTimeUniqueness0007
     * @tc.desc      Verify dateTimeUniquenessCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(360)).assertEqual('06:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_0800
     * @tc.name      testDateTimeUniqueness0008
     * @tc.desc      Verify dateTimeUniquenessCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(420)).assertEqual('07:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_0900
     * @tc.name      testDateTimeUniqueness0009
     * @tc.desc      Verify dateTimeUniquenessCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(480)).assertEqual('08:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_1000
     * @tc.name      testDateTimeUniqueness0010
     * @tc.desc      Verify dateTimeUniquenessCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(540)).assertEqual('09:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_1100
     * @tc.name      testDateTimeUniqueness0011
     * @tc.desc      Verify dateTimeUniquenessCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(600)).assertEqual('10:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_1200
     * @tc.name      testDateTimeUniqueness0012
     * @tc.desc      Verify dateTimeUniquenessCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(660)).assertEqual('11:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_1300
     * @tc.name      testDateTimeUniqueness0013
     * @tc.desc      Verify dateTimeUniquenessCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(720)).assertEqual('12:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_1400
     * @tc.name      testDateTimeUniqueness0014
     * @tc.desc      Verify dateTimeUniquenessCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(780)).assertEqual('13:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_1500
     * @tc.name      testDateTimeUniqueness0015
     * @tc.desc      Verify dateTimeUniquenessCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(840)).assertEqual('14:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_1600
     * @tc.name      testDateTimeUniqueness0016
     * @tc.desc      Verify dateTimeUniquenessCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(900)).assertEqual('15:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_1700
     * @tc.name      testDateTimeUniqueness0017
     * @tc.desc      Verify dateTimeUniquenessCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(960)).assertEqual('16:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_1800
     * @tc.name      testDateTimeUniqueness0018
     * @tc.desc      Verify dateTimeUniquenessCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(1020)).assertEqual('17:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_1900
     * @tc.name      testDateTimeUniqueness0019
     * @tc.desc      Verify dateTimeUniquenessCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(1080)).assertEqual('18:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_2000
     * @tc.name      testDateTimeUniqueness0020
     * @tc.desc      Verify dateTimeUniquenessCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(1140)).assertEqual('19:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_2100
     * @tc.name      testDateTimeUniqueness0021
     * @tc.desc      Verify dateTimeUniquenessCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(1200)).assertEqual('20:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_2200
     * @tc.name      testDateTimeUniqueness0022
     * @tc.desc      Verify dateTimeUniquenessCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(1260)).assertEqual('21:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_2300
     * @tc.name      testDateTimeUniqueness0023
     * @tc.desc      Verify dateTimeUniquenessCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(1320)).assertEqual('22:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_2400
     * @tc.name      testDateTimeUniqueness0024
     * @tc.desc      Verify dateTimeUniquenessCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(1380)).assertEqual('23:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_2500
     * @tc.name      testDateTimeUniqueness0025
     * @tc.desc      Verify dateTimeUniquenessCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(1440)).assertEqual('24:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_2600
     * @tc.name      testDateTimeUniqueness0026
     * @tc.desc      Verify dateTimeUniquenessCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(1500)).assertEqual('25:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_2700
     * @tc.name      testDateTimeUniqueness0027
     * @tc.desc      Verify dateTimeUniquenessCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(1560)).assertEqual('26:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_2800
     * @tc.name      testDateTimeUniqueness0028
     * @tc.desc      Verify dateTimeUniquenessCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(1620)).assertEqual('27:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_2900
     * @tc.name      testDateTimeUniqueness0029
     * @tc.desc      Verify dateTimeUniquenessCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(1680)).assertEqual('28:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_3000
     * @tc.name      testDateTimeUniqueness0030
     * @tc.desc      Verify dateTimeUniquenessCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(1740)).assertEqual('29:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_3100
     * @tc.name      testDateTimeUniqueness0031
     * @tc.desc      Verify dateTimeUniquenessCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(1800)).assertEqual('30:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_3200
     * @tc.name      testDateTimeUniqueness0032
     * @tc.desc      Verify dateTimeUniquenessCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(1860)).assertEqual('31:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_3300
     * @tc.name      testDateTimeUniqueness0033
     * @tc.desc      Verify dateTimeUniquenessCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(1920)).assertEqual('32:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_3400
     * @tc.name      testDateTimeUniqueness0034
     * @tc.desc      Verify dateTimeUniquenessCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(1980)).assertEqual('33:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_3500
     * @tc.name      testDateTimeUniqueness0035
     * @tc.desc      Verify dateTimeUniquenessCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(2040)).assertEqual('34:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_3600
     * @tc.name      testDateTimeUniqueness0036
     * @tc.desc      Verify dateTimeUniquenessCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(2100)).assertEqual('35:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_3700
     * @tc.name      testDateTimeUniqueness0037
     * @tc.desc      Verify dateTimeUniquenessCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(2160)).assertEqual('36:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_3800
     * @tc.name      testDateTimeUniqueness0038
     * @tc.desc      Verify dateTimeUniquenessCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(2220)).assertEqual('37:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_3900
     * @tc.name      testDateTimeUniqueness0039
     * @tc.desc      Verify dateTimeUniquenessCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(2280)).assertEqual('38:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_4000
     * @tc.name      testDateTimeUniqueness0040
     * @tc.desc      Verify dateTimeUniquenessCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(2340)).assertEqual('39:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_4100
     * @tc.name      testDateTimeUniqueness0041
     * @tc.desc      Verify dateTimeUniquenessCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(2400)).assertEqual('40:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_4200
     * @tc.name      testDateTimeUniqueness0042
     * @tc.desc      Verify dateTimeUniquenessCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(2460)).assertEqual('41:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_4300
     * @tc.name      testDateTimeUniqueness0043
     * @tc.desc      Verify dateTimeUniquenessCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(2520)).assertEqual('42:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_4400
     * @tc.name      testDateTimeUniqueness0044
     * @tc.desc      Verify dateTimeUniquenessCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(2580)).assertEqual('43:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_4500
     * @tc.name      testDateTimeUniqueness0045
     * @tc.desc      Verify dateTimeUniquenessCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(2640)).assertEqual('44:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_4600
     * @tc.name      testDateTimeUniqueness0046
     * @tc.desc      Verify dateTimeUniquenessCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(2700)).assertEqual('45:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_4700
     * @tc.name      testDateTimeUniqueness0047
     * @tc.desc      Verify dateTimeUniquenessCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(2760)).assertEqual('46:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_4800
     * @tc.name      testDateTimeUniqueness0048
     * @tc.desc      Verify dateTimeUniquenessCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(2820)).assertEqual('47:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_4900
     * @tc.name      testDateTimeUniqueness0049
     * @tc.desc      Verify dateTimeUniquenessCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(2880)).assertEqual('48:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_5000
     * @tc.name      testDateTimeUniqueness0050
     * @tc.desc      Verify dateTimeUniquenessCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(2940)).assertEqual('49:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_5100
     * @tc.name      testDateTimeUniqueness0051
     * @tc.desc      Verify dateTimeUniquenessCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(3000)).assertEqual('50:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_5200
     * @tc.name      testDateTimeUniqueness0052
     * @tc.desc      Verify dateTimeUniquenessCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(3060)).assertEqual('51:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_5300
     * @tc.name      testDateTimeUniqueness0053
     * @tc.desc      Verify dateTimeUniquenessCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(3120)).assertEqual('52:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_5400
     * @tc.name      testDateTimeUniqueness0054
     * @tc.desc      Verify dateTimeUniquenessCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(3180)).assertEqual('53:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_5500
     * @tc.name      testDateTimeUniqueness0055
     * @tc.desc      Verify dateTimeUniquenessCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(3240)).assertEqual('54:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_5600
     * @tc.name      testDateTimeUniqueness0056
     * @tc.desc      Verify dateTimeUniquenessCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(3300)).assertEqual('55:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_5700
     * @tc.name      testDateTimeUniqueness0057
     * @tc.desc      Verify dateTimeUniquenessCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(3360)).assertEqual('56:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_5800
     * @tc.name      testDateTimeUniqueness0058
     * @tc.desc      Verify dateTimeUniquenessCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(3420)).assertEqual('57:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_5900
     * @tc.name      testDateTimeUniqueness0059
     * @tc.desc      Verify dateTimeUniquenessCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(3480)).assertEqual('58:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_6000
     * @tc.name      testDateTimeUniqueness0060
     * @tc.desc      Verify dateTimeUniquenessCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(3540)).assertEqual('59:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_6100
     * @tc.name      testDateTimeUniqueness0061
     * @tc.desc      Verify dateTimeUniquenessCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(3600)).assertEqual('00:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_6200
     * @tc.name      testDateTimeUniqueness0062
     * @tc.desc      Verify dateTimeUniquenessCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(3660)).assertEqual('01:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_6300
     * @tc.name      testDateTimeUniqueness0063
     * @tc.desc      Verify dateTimeUniquenessCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(3720)).assertEqual('02:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_6400
     * @tc.name      testDateTimeUniqueness0064
     * @tc.desc      Verify dateTimeUniquenessCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(3780)).assertEqual('03:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_6500
     * @tc.name      testDateTimeUniqueness0065
     * @tc.desc      Verify dateTimeUniquenessCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(3840)).assertEqual('04:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_6600
     * @tc.name      testDateTimeUniqueness0066
     * @tc.desc      Verify dateTimeUniquenessCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(3900)).assertEqual('05:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_6700
     * @tc.name      testDateTimeUniqueness0067
     * @tc.desc      Verify dateTimeUniquenessCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(3960)).assertEqual('06:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_6800
     * @tc.name      testDateTimeUniqueness0068
     * @tc.desc      Verify dateTimeUniquenessCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(4020)).assertEqual('07:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_6900
     * @tc.name      testDateTimeUniqueness0069
     * @tc.desc      Verify dateTimeUniquenessCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(4080)).assertEqual('08:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_7000
     * @tc.name      testDateTimeUniqueness0070
     * @tc.desc      Verify dateTimeUniquenessCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(4140)).assertEqual('09:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_7100
     * @tc.name      testDateTimeUniqueness0071
     * @tc.desc      Verify dateTimeUniquenessCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(4200)).assertEqual('10:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_7200
     * @tc.name      testDateTimeUniqueness0072
     * @tc.desc      Verify dateTimeUniquenessCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(4260)).assertEqual('11:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_7300
     * @tc.name      testDateTimeUniqueness0073
     * @tc.desc      Verify dateTimeUniquenessCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(4320)).assertEqual('12:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_7400
     * @tc.name      testDateTimeUniqueness0074
     * @tc.desc      Verify dateTimeUniquenessCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(4380)).assertEqual('13:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_7500
     * @tc.name      testDateTimeUniqueness0075
     * @tc.desc      Verify dateTimeUniquenessCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(4440)).assertEqual('14:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_7600
     * @tc.name      testDateTimeUniqueness0076
     * @tc.desc      Verify dateTimeUniquenessCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(4500)).assertEqual('15:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_7700
     * @tc.name      testDateTimeUniqueness0077
     * @tc.desc      Verify dateTimeUniquenessCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(4560)).assertEqual('16:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_7800
     * @tc.name      testDateTimeUniqueness0078
     * @tc.desc      Verify dateTimeUniquenessCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(4620)).assertEqual('17:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_7900
     * @tc.name      testDateTimeUniqueness0079
     * @tc.desc      Verify dateTimeUniquenessCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(4680)).assertEqual('18:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_8000
     * @tc.name      testDateTimeUniqueness0080
     * @tc.desc      Verify dateTimeUniquenessCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(4740)).assertEqual('19:00');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_UNIQ_8100
     * @tc.name      testDateTimeUniqueness0081
     * @tc.desc      Verify dateTimeUniquenessCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeUniqueness0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(60) === dateTime(1)).assertFalse();
      expect(dateTime(4800)).assertEqual('20:00');
    });

  });
}
