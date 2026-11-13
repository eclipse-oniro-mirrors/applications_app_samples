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

const TAG: string = '[Sample_dateTimeFormatCore]';
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
export default function dateTimeFormatCoreTest(): void {
  describe('dateTimeFormatCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_0100
     * @tc.name      testDateTimeFormat0001
     * @tc.desc      Verify dateTimeFormatCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(0);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_0200
     * @tc.name      testDateTimeFormat0002
     * @tc.desc      Verify dateTimeFormatCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(7);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_0300
     * @tc.name      testDateTimeFormat0003
     * @tc.desc      Verify dateTimeFormatCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(14);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_0400
     * @tc.name      testDateTimeFormat0004
     * @tc.desc      Verify dateTimeFormatCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(21);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_0500
     * @tc.name      testDateTimeFormat0005
     * @tc.desc      Verify dateTimeFormatCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(28);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_0600
     * @tc.name      testDateTimeFormat0006
     * @tc.desc      Verify dateTimeFormatCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(35);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_0700
     * @tc.name      testDateTimeFormat0007
     * @tc.desc      Verify dateTimeFormatCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(42);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_0800
     * @tc.name      testDateTimeFormat0008
     * @tc.desc      Verify dateTimeFormatCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(49);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_0900
     * @tc.name      testDateTimeFormat0009
     * @tc.desc      Verify dateTimeFormatCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(56);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_1000
     * @tc.name      testDateTimeFormat0010
     * @tc.desc      Verify dateTimeFormatCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(63);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_1100
     * @tc.name      testDateTimeFormat0011
     * @tc.desc      Verify dateTimeFormatCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(70);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_1200
     * @tc.name      testDateTimeFormat0012
     * @tc.desc      Verify dateTimeFormatCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(77);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_1300
     * @tc.name      testDateTimeFormat0013
     * @tc.desc      Verify dateTimeFormatCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(84);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_1400
     * @tc.name      testDateTimeFormat0014
     * @tc.desc      Verify dateTimeFormatCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(91);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_1500
     * @tc.name      testDateTimeFormat0015
     * @tc.desc      Verify dateTimeFormatCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(98);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_1600
     * @tc.name      testDateTimeFormat0016
     * @tc.desc      Verify dateTimeFormatCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(105);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_1700
     * @tc.name      testDateTimeFormat0017
     * @tc.desc      Verify dateTimeFormatCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(112);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_1800
     * @tc.name      testDateTimeFormat0018
     * @tc.desc      Verify dateTimeFormatCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(119);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_1900
     * @tc.name      testDateTimeFormat0019
     * @tc.desc      Verify dateTimeFormatCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(126);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_2000
     * @tc.name      testDateTimeFormat0020
     * @tc.desc      Verify dateTimeFormatCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(133);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_2100
     * @tc.name      testDateTimeFormat0021
     * @tc.desc      Verify dateTimeFormatCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(140);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_2200
     * @tc.name      testDateTimeFormat0022
     * @tc.desc      Verify dateTimeFormatCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(147);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_2300
     * @tc.name      testDateTimeFormat0023
     * @tc.desc      Verify dateTimeFormatCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(154);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_2400
     * @tc.name      testDateTimeFormat0024
     * @tc.desc      Verify dateTimeFormatCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(161);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_2500
     * @tc.name      testDateTimeFormat0025
     * @tc.desc      Verify dateTimeFormatCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(168);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_2600
     * @tc.name      testDateTimeFormat0026
     * @tc.desc      Verify dateTimeFormatCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(175);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_2700
     * @tc.name      testDateTimeFormat0027
     * @tc.desc      Verify dateTimeFormatCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(182);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_2800
     * @tc.name      testDateTimeFormat0028
     * @tc.desc      Verify dateTimeFormatCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(189);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_2900
     * @tc.name      testDateTimeFormat0029
     * @tc.desc      Verify dateTimeFormatCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(196);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_3000
     * @tc.name      testDateTimeFormat0030
     * @tc.desc      Verify dateTimeFormatCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(203);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_3100
     * @tc.name      testDateTimeFormat0031
     * @tc.desc      Verify dateTimeFormatCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(210);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_3200
     * @tc.name      testDateTimeFormat0032
     * @tc.desc      Verify dateTimeFormatCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(217);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_3300
     * @tc.name      testDateTimeFormat0033
     * @tc.desc      Verify dateTimeFormatCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(224);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_3400
     * @tc.name      testDateTimeFormat0034
     * @tc.desc      Verify dateTimeFormatCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(231);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_3500
     * @tc.name      testDateTimeFormat0035
     * @tc.desc      Verify dateTimeFormatCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(238);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_3600
     * @tc.name      testDateTimeFormat0036
     * @tc.desc      Verify dateTimeFormatCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(245);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_3700
     * @tc.name      testDateTimeFormat0037
     * @tc.desc      Verify dateTimeFormatCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(252);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_3800
     * @tc.name      testDateTimeFormat0038
     * @tc.desc      Verify dateTimeFormatCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(259);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_3900
     * @tc.name      testDateTimeFormat0039
     * @tc.desc      Verify dateTimeFormatCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(266);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_4000
     * @tc.name      testDateTimeFormat0040
     * @tc.desc      Verify dateTimeFormatCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(273);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_4100
     * @tc.name      testDateTimeFormat0041
     * @tc.desc      Verify dateTimeFormatCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(280);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_4200
     * @tc.name      testDateTimeFormat0042
     * @tc.desc      Verify dateTimeFormatCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(287);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_4300
     * @tc.name      testDateTimeFormat0043
     * @tc.desc      Verify dateTimeFormatCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(294);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_4400
     * @tc.name      testDateTimeFormat0044
     * @tc.desc      Verify dateTimeFormatCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(301);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_4500
     * @tc.name      testDateTimeFormat0045
     * @tc.desc      Verify dateTimeFormatCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(308);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_4600
     * @tc.name      testDateTimeFormat0046
     * @tc.desc      Verify dateTimeFormatCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(315);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_4700
     * @tc.name      testDateTimeFormat0047
     * @tc.desc      Verify dateTimeFormatCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(322);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_4800
     * @tc.name      testDateTimeFormat0048
     * @tc.desc      Verify dateTimeFormatCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(329);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_4900
     * @tc.name      testDateTimeFormat0049
     * @tc.desc      Verify dateTimeFormatCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(336);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_5000
     * @tc.name      testDateTimeFormat0050
     * @tc.desc      Verify dateTimeFormatCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(343);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_5100
     * @tc.name      testDateTimeFormat0051
     * @tc.desc      Verify dateTimeFormatCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(350);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_5200
     * @tc.name      testDateTimeFormat0052
     * @tc.desc      Verify dateTimeFormatCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(357);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_5300
     * @tc.name      testDateTimeFormat0053
     * @tc.desc      Verify dateTimeFormatCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(364);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_5400
     * @tc.name      testDateTimeFormat0054
     * @tc.desc      Verify dateTimeFormatCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(371);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_5500
     * @tc.name      testDateTimeFormat0055
     * @tc.desc      Verify dateTimeFormatCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(378);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_5600
     * @tc.name      testDateTimeFormat0056
     * @tc.desc      Verify dateTimeFormatCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(385);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_5700
     * @tc.name      testDateTimeFormat0057
     * @tc.desc      Verify dateTimeFormatCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(392);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_5800
     * @tc.name      testDateTimeFormat0058
     * @tc.desc      Verify dateTimeFormatCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(399);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_5900
     * @tc.name      testDateTimeFormat0059
     * @tc.desc      Verify dateTimeFormatCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(406);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_6000
     * @tc.name      testDateTimeFormat0060
     * @tc.desc      Verify dateTimeFormatCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(413);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_6100
     * @tc.name      testDateTimeFormat0061
     * @tc.desc      Verify dateTimeFormatCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(420);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_6200
     * @tc.name      testDateTimeFormat0062
     * @tc.desc      Verify dateTimeFormatCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(427);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_6300
     * @tc.name      testDateTimeFormat0063
     * @tc.desc      Verify dateTimeFormatCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(434);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_6400
     * @tc.name      testDateTimeFormat0064
     * @tc.desc      Verify dateTimeFormatCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(441);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_6500
     * @tc.name      testDateTimeFormat0065
     * @tc.desc      Verify dateTimeFormatCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(448);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_6600
     * @tc.name      testDateTimeFormat0066
     * @tc.desc      Verify dateTimeFormatCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(455);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_6700
     * @tc.name      testDateTimeFormat0067
     * @tc.desc      Verify dateTimeFormatCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(462);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_6800
     * @tc.name      testDateTimeFormat0068
     * @tc.desc      Verify dateTimeFormatCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(469);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_6900
     * @tc.name      testDateTimeFormat0069
     * @tc.desc      Verify dateTimeFormatCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(476);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_7000
     * @tc.name      testDateTimeFormat0070
     * @tc.desc      Verify dateTimeFormatCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(483);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_7100
     * @tc.name      testDateTimeFormat0071
     * @tc.desc      Verify dateTimeFormatCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(490);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_7200
     * @tc.name      testDateTimeFormat0072
     * @tc.desc      Verify dateTimeFormatCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(497);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_7300
     * @tc.name      testDateTimeFormat0073
     * @tc.desc      Verify dateTimeFormatCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(504);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_7400
     * @tc.name      testDateTimeFormat0074
     * @tc.desc      Verify dateTimeFormatCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(511);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_7500
     * @tc.name      testDateTimeFormat0075
     * @tc.desc      Verify dateTimeFormatCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(518);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_7600
     * @tc.name      testDateTimeFormat0076
     * @tc.desc      Verify dateTimeFormatCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(525);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_7700
     * @tc.name      testDateTimeFormat0077
     * @tc.desc      Verify dateTimeFormatCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(532);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_7800
     * @tc.name      testDateTimeFormat0078
     * @tc.desc      Verify dateTimeFormatCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(539);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_7900
     * @tc.name      testDateTimeFormat0079
     * @tc.desc      Verify dateTimeFormatCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(546);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_8000
     * @tc.name      testDateTimeFormat0080
     * @tc.desc      Verify dateTimeFormatCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(553);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_FMT_8100
     * @tc.name      testDateTimeFormat0081
     * @tc.desc      Verify dateTimeFormatCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeFormat0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const text: string = dateTime(560);
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
      expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
    });

  });
}
