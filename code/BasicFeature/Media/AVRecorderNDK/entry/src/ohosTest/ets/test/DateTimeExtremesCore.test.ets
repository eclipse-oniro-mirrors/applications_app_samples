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

const TAG: string = '[Sample_dateTimeExtremesCore]';
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
export default function dateTimeExtremesCoreTest(): void {
  describe('dateTimeExtremesCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_0100
     * @tc.name      testDateTimeExtremes0001
     * @tc.desc      Verify dateTimeExtremesCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[0])).assertEqual(expected[0]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_0200
     * @tc.name      testDateTimeExtremes0002
     * @tc.desc      Verify dateTimeExtremesCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[1])).assertEqual(expected[1]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_0300
     * @tc.name      testDateTimeExtremes0003
     * @tc.desc      Verify dateTimeExtremesCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[2])).assertEqual(expected[2]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_0400
     * @tc.name      testDateTimeExtremes0004
     * @tc.desc      Verify dateTimeExtremesCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[3])).assertEqual(expected[3]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_0500
     * @tc.name      testDateTimeExtremes0005
     * @tc.desc      Verify dateTimeExtremesCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[4])).assertEqual(expected[4]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_0600
     * @tc.name      testDateTimeExtremes0006
     * @tc.desc      Verify dateTimeExtremesCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[5])).assertEqual(expected[5]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_0700
     * @tc.name      testDateTimeExtremes0007
     * @tc.desc      Verify dateTimeExtremesCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[6])).assertEqual(expected[6]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_0800
     * @tc.name      testDateTimeExtremes0008
     * @tc.desc      Verify dateTimeExtremesCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[7])).assertEqual(expected[7]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_0900
     * @tc.name      testDateTimeExtremes0009
     * @tc.desc      Verify dateTimeExtremesCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[0])).assertEqual(expected[0]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_1000
     * @tc.name      testDateTimeExtremes0010
     * @tc.desc      Verify dateTimeExtremesCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[1])).assertEqual(expected[1]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_1100
     * @tc.name      testDateTimeExtremes0011
     * @tc.desc      Verify dateTimeExtremesCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[2])).assertEqual(expected[2]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_1200
     * @tc.name      testDateTimeExtremes0012
     * @tc.desc      Verify dateTimeExtremesCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[3])).assertEqual(expected[3]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_1300
     * @tc.name      testDateTimeExtremes0013
     * @tc.desc      Verify dateTimeExtremesCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[4])).assertEqual(expected[4]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_1400
     * @tc.name      testDateTimeExtremes0014
     * @tc.desc      Verify dateTimeExtremesCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[5])).assertEqual(expected[5]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_1500
     * @tc.name      testDateTimeExtremes0015
     * @tc.desc      Verify dateTimeExtremesCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[6])).assertEqual(expected[6]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_1600
     * @tc.name      testDateTimeExtremes0016
     * @tc.desc      Verify dateTimeExtremesCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[7])).assertEqual(expected[7]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_1700
     * @tc.name      testDateTimeExtremes0017
     * @tc.desc      Verify dateTimeExtremesCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[0])).assertEqual(expected[0]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_1800
     * @tc.name      testDateTimeExtremes0018
     * @tc.desc      Verify dateTimeExtremesCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[1])).assertEqual(expected[1]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_1900
     * @tc.name      testDateTimeExtremes0019
     * @tc.desc      Verify dateTimeExtremesCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[2])).assertEqual(expected[2]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_2000
     * @tc.name      testDateTimeExtremes0020
     * @tc.desc      Verify dateTimeExtremesCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[3])).assertEqual(expected[3]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_2100
     * @tc.name      testDateTimeExtremes0021
     * @tc.desc      Verify dateTimeExtremesCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[4])).assertEqual(expected[4]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_2200
     * @tc.name      testDateTimeExtremes0022
     * @tc.desc      Verify dateTimeExtremesCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[5])).assertEqual(expected[5]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_2300
     * @tc.name      testDateTimeExtremes0023
     * @tc.desc      Verify dateTimeExtremesCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[6])).assertEqual(expected[6]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_2400
     * @tc.name      testDateTimeExtremes0024
     * @tc.desc      Verify dateTimeExtremesCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[7])).assertEqual(expected[7]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_2500
     * @tc.name      testDateTimeExtremes0025
     * @tc.desc      Verify dateTimeExtremesCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[0])).assertEqual(expected[0]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_2600
     * @tc.name      testDateTimeExtremes0026
     * @tc.desc      Verify dateTimeExtremesCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[1])).assertEqual(expected[1]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_2700
     * @tc.name      testDateTimeExtremes0027
     * @tc.desc      Verify dateTimeExtremesCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[2])).assertEqual(expected[2]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_2800
     * @tc.name      testDateTimeExtremes0028
     * @tc.desc      Verify dateTimeExtremesCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[3])).assertEqual(expected[3]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_2900
     * @tc.name      testDateTimeExtremes0029
     * @tc.desc      Verify dateTimeExtremesCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[4])).assertEqual(expected[4]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_3000
     * @tc.name      testDateTimeExtremes0030
     * @tc.desc      Verify dateTimeExtremesCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[5])).assertEqual(expected[5]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_3100
     * @tc.name      testDateTimeExtremes0031
     * @tc.desc      Verify dateTimeExtremesCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[6])).assertEqual(expected[6]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_3200
     * @tc.name      testDateTimeExtremes0032
     * @tc.desc      Verify dateTimeExtremesCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[7])).assertEqual(expected[7]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_3300
     * @tc.name      testDateTimeExtremes0033
     * @tc.desc      Verify dateTimeExtremesCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[0])).assertEqual(expected[0]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_3400
     * @tc.name      testDateTimeExtremes0034
     * @tc.desc      Verify dateTimeExtremesCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[1])).assertEqual(expected[1]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_3500
     * @tc.name      testDateTimeExtremes0035
     * @tc.desc      Verify dateTimeExtremesCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[2])).assertEqual(expected[2]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_3600
     * @tc.name      testDateTimeExtremes0036
     * @tc.desc      Verify dateTimeExtremesCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[3])).assertEqual(expected[3]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_3700
     * @tc.name      testDateTimeExtremes0037
     * @tc.desc      Verify dateTimeExtremesCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[4])).assertEqual(expected[4]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_3800
     * @tc.name      testDateTimeExtremes0038
     * @tc.desc      Verify dateTimeExtremesCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[5])).assertEqual(expected[5]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_3900
     * @tc.name      testDateTimeExtremes0039
     * @tc.desc      Verify dateTimeExtremesCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[6])).assertEqual(expected[6]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_4000
     * @tc.name      testDateTimeExtremes0040
     * @tc.desc      Verify dateTimeExtremesCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[7])).assertEqual(expected[7]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_4100
     * @tc.name      testDateTimeExtremes0041
     * @tc.desc      Verify dateTimeExtremesCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[0])).assertEqual(expected[0]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_4200
     * @tc.name      testDateTimeExtremes0042
     * @tc.desc      Verify dateTimeExtremesCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[1])).assertEqual(expected[1]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_4300
     * @tc.name      testDateTimeExtremes0043
     * @tc.desc      Verify dateTimeExtremesCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[2])).assertEqual(expected[2]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_4400
     * @tc.name      testDateTimeExtremes0044
     * @tc.desc      Verify dateTimeExtremesCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[3])).assertEqual(expected[3]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_4500
     * @tc.name      testDateTimeExtremes0045
     * @tc.desc      Verify dateTimeExtremesCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[4])).assertEqual(expected[4]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_4600
     * @tc.name      testDateTimeExtremes0046
     * @tc.desc      Verify dateTimeExtremesCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[5])).assertEqual(expected[5]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_4700
     * @tc.name      testDateTimeExtremes0047
     * @tc.desc      Verify dateTimeExtremesCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[6])).assertEqual(expected[6]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_4800
     * @tc.name      testDateTimeExtremes0048
     * @tc.desc      Verify dateTimeExtremesCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[7])).assertEqual(expected[7]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_4900
     * @tc.name      testDateTimeExtremes0049
     * @tc.desc      Verify dateTimeExtremesCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[0])).assertEqual(expected[0]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_5000
     * @tc.name      testDateTimeExtremes0050
     * @tc.desc      Verify dateTimeExtremesCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[1])).assertEqual(expected[1]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_5100
     * @tc.name      testDateTimeExtremes0051
     * @tc.desc      Verify dateTimeExtremesCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[2])).assertEqual(expected[2]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_5200
     * @tc.name      testDateTimeExtremes0052
     * @tc.desc      Verify dateTimeExtremesCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[3])).assertEqual(expected[3]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_5300
     * @tc.name      testDateTimeExtremes0053
     * @tc.desc      Verify dateTimeExtremesCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[4])).assertEqual(expected[4]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_5400
     * @tc.name      testDateTimeExtremes0054
     * @tc.desc      Verify dateTimeExtremesCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[5])).assertEqual(expected[5]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_5500
     * @tc.name      testDateTimeExtremes0055
     * @tc.desc      Verify dateTimeExtremesCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[6])).assertEqual(expected[6]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_5600
     * @tc.name      testDateTimeExtremes0056
     * @tc.desc      Verify dateTimeExtremesCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[7])).assertEqual(expected[7]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_5700
     * @tc.name      testDateTimeExtremes0057
     * @tc.desc      Verify dateTimeExtremesCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[0])).assertEqual(expected[0]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_5800
     * @tc.name      testDateTimeExtremes0058
     * @tc.desc      Verify dateTimeExtremesCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[1])).assertEqual(expected[1]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_5900
     * @tc.name      testDateTimeExtremes0059
     * @tc.desc      Verify dateTimeExtremesCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[2])).assertEqual(expected[2]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_6000
     * @tc.name      testDateTimeExtremes0060
     * @tc.desc      Verify dateTimeExtremesCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[3])).assertEqual(expected[3]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_6100
     * @tc.name      testDateTimeExtremes0061
     * @tc.desc      Verify dateTimeExtremesCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[4])).assertEqual(expected[4]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_6200
     * @tc.name      testDateTimeExtremes0062
     * @tc.desc      Verify dateTimeExtremesCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[5])).assertEqual(expected[5]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_6300
     * @tc.name      testDateTimeExtremes0063
     * @tc.desc      Verify dateTimeExtremesCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[6])).assertEqual(expected[6]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_6400
     * @tc.name      testDateTimeExtremes0064
     * @tc.desc      Verify dateTimeExtremesCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[7])).assertEqual(expected[7]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_6500
     * @tc.name      testDateTimeExtremes0065
     * @tc.desc      Verify dateTimeExtremesCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[0])).assertEqual(expected[0]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_6600
     * @tc.name      testDateTimeExtremes0066
     * @tc.desc      Verify dateTimeExtremesCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[1])).assertEqual(expected[1]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_6700
     * @tc.name      testDateTimeExtremes0067
     * @tc.desc      Verify dateTimeExtremesCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[2])).assertEqual(expected[2]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_6800
     * @tc.name      testDateTimeExtremes0068
     * @tc.desc      Verify dateTimeExtremesCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[3])).assertEqual(expected[3]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_6900
     * @tc.name      testDateTimeExtremes0069
     * @tc.desc      Verify dateTimeExtremesCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[4])).assertEqual(expected[4]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_7000
     * @tc.name      testDateTimeExtremes0070
     * @tc.desc      Verify dateTimeExtremesCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[5])).assertEqual(expected[5]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_7100
     * @tc.name      testDateTimeExtremes0071
     * @tc.desc      Verify dateTimeExtremesCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[6])).assertEqual(expected[6]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_7200
     * @tc.name      testDateTimeExtremes0072
     * @tc.desc      Verify dateTimeExtremesCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[7])).assertEqual(expected[7]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_7300
     * @tc.name      testDateTimeExtremes0073
     * @tc.desc      Verify dateTimeExtremesCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[0])).assertEqual(expected[0]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_7400
     * @tc.name      testDateTimeExtremes0074
     * @tc.desc      Verify dateTimeExtremesCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[1])).assertEqual(expected[1]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_7500
     * @tc.name      testDateTimeExtremes0075
     * @tc.desc      Verify dateTimeExtremesCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[2])).assertEqual(expected[2]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_7600
     * @tc.name      testDateTimeExtremes0076
     * @tc.desc      Verify dateTimeExtremesCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[3])).assertEqual(expected[3]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_7700
     * @tc.name      testDateTimeExtremes0077
     * @tc.desc      Verify dateTimeExtremesCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[4])).assertEqual(expected[4]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_7800
     * @tc.name      testDateTimeExtremes0078
     * @tc.desc      Verify dateTimeExtremesCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[5])).assertEqual(expected[5]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_7900
     * @tc.name      testDateTimeExtremes0079
     * @tc.desc      Verify dateTimeExtremesCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[6])).assertEqual(expected[6]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_8000
     * @tc.name      testDateTimeExtremes0080
     * @tc.desc      Verify dateTimeExtremesCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[7])).assertEqual(expected[7]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_EXTREME_8100
     * @tc.name      testDateTimeExtremes0081
     * @tc.desc      Verify dateTimeExtremesCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeExtremes0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [86399, 86400, 90000, 604800, 0, 3599, 3601, 7200];
      const expected: string[] = ['59:59', '00:00', '00:00', '00:00', '00:00', '59:59', '00:01', '00:00'];
      expect(dateTime(inputs[0])).assertEqual(expected[0]);
    });

  });
}
