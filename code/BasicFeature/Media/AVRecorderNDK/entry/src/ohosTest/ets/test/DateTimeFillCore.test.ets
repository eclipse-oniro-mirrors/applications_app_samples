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

const TAG: string = '[Sample_dateTimeFillCore]';
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
export default function dateTimeFillCoreTest(): void {
  describe('dateTimeFillCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_0100
     * @tc.name      testDateTimeFill0001
     * @tc.desc      Verify dateTimeFillCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 0;
      expect(util.fill(value)).assertEqual('00');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_0200
     * @tc.name      testDateTimeFill0002
     * @tc.desc      Verify dateTimeFillCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 1;
      expect(util.fill(value)).assertEqual('01');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_0300
     * @tc.name      testDateTimeFill0003
     * @tc.desc      Verify dateTimeFillCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 2;
      expect(util.fill(value)).assertEqual('02');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_0400
     * @tc.name      testDateTimeFill0004
     * @tc.desc      Verify dateTimeFillCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 3;
      expect(util.fill(value)).assertEqual('03');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_0500
     * @tc.name      testDateTimeFill0005
     * @tc.desc      Verify dateTimeFillCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 4;
      expect(util.fill(value)).assertEqual('04');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_0600
     * @tc.name      testDateTimeFill0006
     * @tc.desc      Verify dateTimeFillCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 5;
      expect(util.fill(value)).assertEqual('05');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_0700
     * @tc.name      testDateTimeFill0007
     * @tc.desc      Verify dateTimeFillCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 6;
      expect(util.fill(value)).assertEqual('06');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_0800
     * @tc.name      testDateTimeFill0008
     * @tc.desc      Verify dateTimeFillCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 7;
      expect(util.fill(value)).assertEqual('07');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_0900
     * @tc.name      testDateTimeFill0009
     * @tc.desc      Verify dateTimeFillCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 8;
      expect(util.fill(value)).assertEqual('08');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_1000
     * @tc.name      testDateTimeFill0010
     * @tc.desc      Verify dateTimeFillCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 9;
      expect(util.fill(value)).assertEqual('09');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_1100
     * @tc.name      testDateTimeFill0011
     * @tc.desc      Verify dateTimeFillCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 10;
      expect(util.fill(value)).assertEqual('10');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_1200
     * @tc.name      testDateTimeFill0012
     * @tc.desc      Verify dateTimeFillCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 11;
      expect(util.fill(value)).assertEqual('11');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_1300
     * @tc.name      testDateTimeFill0013
     * @tc.desc      Verify dateTimeFillCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 12;
      expect(util.fill(value)).assertEqual('12');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_1400
     * @tc.name      testDateTimeFill0014
     * @tc.desc      Verify dateTimeFillCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 13;
      expect(util.fill(value)).assertEqual('13');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_1500
     * @tc.name      testDateTimeFill0015
     * @tc.desc      Verify dateTimeFillCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 14;
      expect(util.fill(value)).assertEqual('14');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_1600
     * @tc.name      testDateTimeFill0016
     * @tc.desc      Verify dateTimeFillCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 15;
      expect(util.fill(value)).assertEqual('15');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_1700
     * @tc.name      testDateTimeFill0017
     * @tc.desc      Verify dateTimeFillCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 16;
      expect(util.fill(value)).assertEqual('16');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_1800
     * @tc.name      testDateTimeFill0018
     * @tc.desc      Verify dateTimeFillCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 17;
      expect(util.fill(value)).assertEqual('17');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_1900
     * @tc.name      testDateTimeFill0019
     * @tc.desc      Verify dateTimeFillCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 18;
      expect(util.fill(value)).assertEqual('18');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_2000
     * @tc.name      testDateTimeFill0020
     * @tc.desc      Verify dateTimeFillCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 19;
      expect(util.fill(value)).assertEqual('19');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_2100
     * @tc.name      testDateTimeFill0021
     * @tc.desc      Verify dateTimeFillCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 20;
      expect(util.fill(value)).assertEqual('20');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_2200
     * @tc.name      testDateTimeFill0022
     * @tc.desc      Verify dateTimeFillCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 21;
      expect(util.fill(value)).assertEqual('21');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_2300
     * @tc.name      testDateTimeFill0023
     * @tc.desc      Verify dateTimeFillCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 22;
      expect(util.fill(value)).assertEqual('22');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_2400
     * @tc.name      testDateTimeFill0024
     * @tc.desc      Verify dateTimeFillCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 23;
      expect(util.fill(value)).assertEqual('23');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_2500
     * @tc.name      testDateTimeFill0025
     * @tc.desc      Verify dateTimeFillCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 24;
      expect(util.fill(value)).assertEqual('24');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_2600
     * @tc.name      testDateTimeFill0026
     * @tc.desc      Verify dateTimeFillCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 25;
      expect(util.fill(value)).assertEqual('25');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_2700
     * @tc.name      testDateTimeFill0027
     * @tc.desc      Verify dateTimeFillCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 26;
      expect(util.fill(value)).assertEqual('26');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_2800
     * @tc.name      testDateTimeFill0028
     * @tc.desc      Verify dateTimeFillCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 27;
      expect(util.fill(value)).assertEqual('27');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_2900
     * @tc.name      testDateTimeFill0029
     * @tc.desc      Verify dateTimeFillCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 28;
      expect(util.fill(value)).assertEqual('28');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_3000
     * @tc.name      testDateTimeFill0030
     * @tc.desc      Verify dateTimeFillCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 29;
      expect(util.fill(value)).assertEqual('29');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_3100
     * @tc.name      testDateTimeFill0031
     * @tc.desc      Verify dateTimeFillCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 30;
      expect(util.fill(value)).assertEqual('30');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_3200
     * @tc.name      testDateTimeFill0032
     * @tc.desc      Verify dateTimeFillCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 31;
      expect(util.fill(value)).assertEqual('31');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_3300
     * @tc.name      testDateTimeFill0033
     * @tc.desc      Verify dateTimeFillCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 32;
      expect(util.fill(value)).assertEqual('32');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_3400
     * @tc.name      testDateTimeFill0034
     * @tc.desc      Verify dateTimeFillCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 33;
      expect(util.fill(value)).assertEqual('33');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_3500
     * @tc.name      testDateTimeFill0035
     * @tc.desc      Verify dateTimeFillCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 34;
      expect(util.fill(value)).assertEqual('34');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_3600
     * @tc.name      testDateTimeFill0036
     * @tc.desc      Verify dateTimeFillCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 35;
      expect(util.fill(value)).assertEqual('35');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_3700
     * @tc.name      testDateTimeFill0037
     * @tc.desc      Verify dateTimeFillCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 36;
      expect(util.fill(value)).assertEqual('36');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_3800
     * @tc.name      testDateTimeFill0038
     * @tc.desc      Verify dateTimeFillCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 37;
      expect(util.fill(value)).assertEqual('37');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_3900
     * @tc.name      testDateTimeFill0039
     * @tc.desc      Verify dateTimeFillCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 38;
      expect(util.fill(value)).assertEqual('38');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_4000
     * @tc.name      testDateTimeFill0040
     * @tc.desc      Verify dateTimeFillCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 39;
      expect(util.fill(value)).assertEqual('39');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_4100
     * @tc.name      testDateTimeFill0041
     * @tc.desc      Verify dateTimeFillCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 40;
      expect(util.fill(value)).assertEqual('40');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_4200
     * @tc.name      testDateTimeFill0042
     * @tc.desc      Verify dateTimeFillCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 41;
      expect(util.fill(value)).assertEqual('41');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_4300
     * @tc.name      testDateTimeFill0043
     * @tc.desc      Verify dateTimeFillCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 42;
      expect(util.fill(value)).assertEqual('42');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_4400
     * @tc.name      testDateTimeFill0044
     * @tc.desc      Verify dateTimeFillCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 43;
      expect(util.fill(value)).assertEqual('43');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_4500
     * @tc.name      testDateTimeFill0045
     * @tc.desc      Verify dateTimeFillCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 44;
      expect(util.fill(value)).assertEqual('44');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_4600
     * @tc.name      testDateTimeFill0046
     * @tc.desc      Verify dateTimeFillCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 45;
      expect(util.fill(value)).assertEqual('45');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_4700
     * @tc.name      testDateTimeFill0047
     * @tc.desc      Verify dateTimeFillCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 46;
      expect(util.fill(value)).assertEqual('46');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_4800
     * @tc.name      testDateTimeFill0048
     * @tc.desc      Verify dateTimeFillCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 47;
      expect(util.fill(value)).assertEqual('47');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_4900
     * @tc.name      testDateTimeFill0049
     * @tc.desc      Verify dateTimeFillCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 48;
      expect(util.fill(value)).assertEqual('48');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_5000
     * @tc.name      testDateTimeFill0050
     * @tc.desc      Verify dateTimeFillCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 49;
      expect(util.fill(value)).assertEqual('49');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_5100
     * @tc.name      testDateTimeFill0051
     * @tc.desc      Verify dateTimeFillCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 50;
      expect(util.fill(value)).assertEqual('50');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_5200
     * @tc.name      testDateTimeFill0052
     * @tc.desc      Verify dateTimeFillCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 51;
      expect(util.fill(value)).assertEqual('51');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_5300
     * @tc.name      testDateTimeFill0053
     * @tc.desc      Verify dateTimeFillCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 52;
      expect(util.fill(value)).assertEqual('52');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_5400
     * @tc.name      testDateTimeFill0054
     * @tc.desc      Verify dateTimeFillCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 53;
      expect(util.fill(value)).assertEqual('53');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_5500
     * @tc.name      testDateTimeFill0055
     * @tc.desc      Verify dateTimeFillCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 54;
      expect(util.fill(value)).assertEqual('54');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_5600
     * @tc.name      testDateTimeFill0056
     * @tc.desc      Verify dateTimeFillCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 55;
      expect(util.fill(value)).assertEqual('55');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_5700
     * @tc.name      testDateTimeFill0057
     * @tc.desc      Verify dateTimeFillCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 56;
      expect(util.fill(value)).assertEqual('56');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_5800
     * @tc.name      testDateTimeFill0058
     * @tc.desc      Verify dateTimeFillCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 57;
      expect(util.fill(value)).assertEqual('57');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_5900
     * @tc.name      testDateTimeFill0059
     * @tc.desc      Verify dateTimeFillCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 58;
      expect(util.fill(value)).assertEqual('58');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_6000
     * @tc.name      testDateTimeFill0060
     * @tc.desc      Verify dateTimeFillCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 59;
      expect(util.fill(value)).assertEqual('59');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_6100
     * @tc.name      testDateTimeFill0061
     * @tc.desc      Verify dateTimeFillCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 60;
      expect(util.fill(value)).assertEqual('60');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_6200
     * @tc.name      testDateTimeFill0062
     * @tc.desc      Verify dateTimeFillCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 61;
      expect(util.fill(value)).assertEqual('61');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_6300
     * @tc.name      testDateTimeFill0063
     * @tc.desc      Verify dateTimeFillCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 62;
      expect(util.fill(value)).assertEqual('62');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_6400
     * @tc.name      testDateTimeFill0064
     * @tc.desc      Verify dateTimeFillCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 63;
      expect(util.fill(value)).assertEqual('63');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_6500
     * @tc.name      testDateTimeFill0065
     * @tc.desc      Verify dateTimeFillCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 64;
      expect(util.fill(value)).assertEqual('64');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_6600
     * @tc.name      testDateTimeFill0066
     * @tc.desc      Verify dateTimeFillCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 65;
      expect(util.fill(value)).assertEqual('65');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_6700
     * @tc.name      testDateTimeFill0067
     * @tc.desc      Verify dateTimeFillCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 66;
      expect(util.fill(value)).assertEqual('66');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_6800
     * @tc.name      testDateTimeFill0068
     * @tc.desc      Verify dateTimeFillCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 67;
      expect(util.fill(value)).assertEqual('67');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_6900
     * @tc.name      testDateTimeFill0069
     * @tc.desc      Verify dateTimeFillCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 68;
      expect(util.fill(value)).assertEqual('68');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_7000
     * @tc.name      testDateTimeFill0070
     * @tc.desc      Verify dateTimeFillCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 69;
      expect(util.fill(value)).assertEqual('69');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_7100
     * @tc.name      testDateTimeFill0071
     * @tc.desc      Verify dateTimeFillCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 70;
      expect(util.fill(value)).assertEqual('70');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_7200
     * @tc.name      testDateTimeFill0072
     * @tc.desc      Verify dateTimeFillCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 71;
      expect(util.fill(value)).assertEqual('71');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_7300
     * @tc.name      testDateTimeFill0073
     * @tc.desc      Verify dateTimeFillCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 72;
      expect(util.fill(value)).assertEqual('72');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_7400
     * @tc.name      testDateTimeFill0074
     * @tc.desc      Verify dateTimeFillCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 73;
      expect(util.fill(value)).assertEqual('73');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_7500
     * @tc.name      testDateTimeFill0075
     * @tc.desc      Verify dateTimeFillCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 74;
      expect(util.fill(value)).assertEqual('74');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_7600
     * @tc.name      testDateTimeFill0076
     * @tc.desc      Verify dateTimeFillCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 75;
      expect(util.fill(value)).assertEqual('75');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_7700
     * @tc.name      testDateTimeFill0077
     * @tc.desc      Verify dateTimeFillCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 76;
      expect(util.fill(value)).assertEqual('76');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_7800
     * @tc.name      testDateTimeFill0078
     * @tc.desc      Verify dateTimeFillCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 77;
      expect(util.fill(value)).assertEqual('77');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_7900
     * @tc.name      testDateTimeFill0079
     * @tc.desc      Verify dateTimeFillCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 78;
      expect(util.fill(value)).assertEqual('78');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_8000
     * @tc.name      testDateTimeFill0080
     * @tc.desc      Verify dateTimeFillCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 79;
      expect(util.fill(value)).assertEqual('79');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FILL_8100
     * @tc.name      testDateTimeFill0081
     * @tc.desc      Verify dateTimeFillCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFill0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const value: number = 80;
      expect(util.fill(value)).assertEqual('80');
      expect(util.fill(value).length).assertLargerOrEqual(1);
    });

  });
}
