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

const TAG: string = '[Sample_dateTimeBoundaryCore]';
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
export default function dateTimeBoundaryCoreTest(): void {
  describe('dateTimeBoundaryCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_0100
     * @tc.name      testDateTimeBoundary0001
     * @tc.desc      Verify dateTimeBoundaryCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[0])).assertEqual(expected[0]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_0200
     * @tc.name      testDateTimeBoundary0002
     * @tc.desc      Verify dateTimeBoundaryCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[1])).assertEqual(expected[1]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_0300
     * @tc.name      testDateTimeBoundary0003
     * @tc.desc      Verify dateTimeBoundaryCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[2])).assertEqual(expected[2]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_0400
     * @tc.name      testDateTimeBoundary0004
     * @tc.desc      Verify dateTimeBoundaryCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[3])).assertEqual(expected[3]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_0500
     * @tc.name      testDateTimeBoundary0005
     * @tc.desc      Verify dateTimeBoundaryCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[4])).assertEqual(expected[4]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_0600
     * @tc.name      testDateTimeBoundary0006
     * @tc.desc      Verify dateTimeBoundaryCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[5])).assertEqual(expected[5]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_0700
     * @tc.name      testDateTimeBoundary0007
     * @tc.desc      Verify dateTimeBoundaryCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[6])).assertEqual(expected[6]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_0800
     * @tc.name      testDateTimeBoundary0008
     * @tc.desc      Verify dateTimeBoundaryCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[7])).assertEqual(expected[7]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_0900
     * @tc.name      testDateTimeBoundary0009
     * @tc.desc      Verify dateTimeBoundaryCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[0])).assertEqual(expected[0]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_1000
     * @tc.name      testDateTimeBoundary0010
     * @tc.desc      Verify dateTimeBoundaryCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[1])).assertEqual(expected[1]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_1100
     * @tc.name      testDateTimeBoundary0011
     * @tc.desc      Verify dateTimeBoundaryCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[2])).assertEqual(expected[2]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_1200
     * @tc.name      testDateTimeBoundary0012
     * @tc.desc      Verify dateTimeBoundaryCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[3])).assertEqual(expected[3]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_1300
     * @tc.name      testDateTimeBoundary0013
     * @tc.desc      Verify dateTimeBoundaryCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[4])).assertEqual(expected[4]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_1400
     * @tc.name      testDateTimeBoundary0014
     * @tc.desc      Verify dateTimeBoundaryCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[5])).assertEqual(expected[5]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_1500
     * @tc.name      testDateTimeBoundary0015
     * @tc.desc      Verify dateTimeBoundaryCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[6])).assertEqual(expected[6]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_1600
     * @tc.name      testDateTimeBoundary0016
     * @tc.desc      Verify dateTimeBoundaryCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[7])).assertEqual(expected[7]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_1700
     * @tc.name      testDateTimeBoundary0017
     * @tc.desc      Verify dateTimeBoundaryCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[0])).assertEqual(expected[0]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_1800
     * @tc.name      testDateTimeBoundary0018
     * @tc.desc      Verify dateTimeBoundaryCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[1])).assertEqual(expected[1]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_1900
     * @tc.name      testDateTimeBoundary0019
     * @tc.desc      Verify dateTimeBoundaryCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[2])).assertEqual(expected[2]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_2000
     * @tc.name      testDateTimeBoundary0020
     * @tc.desc      Verify dateTimeBoundaryCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[3])).assertEqual(expected[3]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_2100
     * @tc.name      testDateTimeBoundary0021
     * @tc.desc      Verify dateTimeBoundaryCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[4])).assertEqual(expected[4]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_2200
     * @tc.name      testDateTimeBoundary0022
     * @tc.desc      Verify dateTimeBoundaryCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[5])).assertEqual(expected[5]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_2300
     * @tc.name      testDateTimeBoundary0023
     * @tc.desc      Verify dateTimeBoundaryCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[6])).assertEqual(expected[6]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_2400
     * @tc.name      testDateTimeBoundary0024
     * @tc.desc      Verify dateTimeBoundaryCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[7])).assertEqual(expected[7]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_2500
     * @tc.name      testDateTimeBoundary0025
     * @tc.desc      Verify dateTimeBoundaryCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[0])).assertEqual(expected[0]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_2600
     * @tc.name      testDateTimeBoundary0026
     * @tc.desc      Verify dateTimeBoundaryCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[1])).assertEqual(expected[1]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_2700
     * @tc.name      testDateTimeBoundary0027
     * @tc.desc      Verify dateTimeBoundaryCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[2])).assertEqual(expected[2]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_2800
     * @tc.name      testDateTimeBoundary0028
     * @tc.desc      Verify dateTimeBoundaryCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[3])).assertEqual(expected[3]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_2900
     * @tc.name      testDateTimeBoundary0029
     * @tc.desc      Verify dateTimeBoundaryCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[4])).assertEqual(expected[4]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_3000
     * @tc.name      testDateTimeBoundary0030
     * @tc.desc      Verify dateTimeBoundaryCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[5])).assertEqual(expected[5]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_3100
     * @tc.name      testDateTimeBoundary0031
     * @tc.desc      Verify dateTimeBoundaryCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[6])).assertEqual(expected[6]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_3200
     * @tc.name      testDateTimeBoundary0032
     * @tc.desc      Verify dateTimeBoundaryCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[7])).assertEqual(expected[7]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_3300
     * @tc.name      testDateTimeBoundary0033
     * @tc.desc      Verify dateTimeBoundaryCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[0])).assertEqual(expected[0]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_3400
     * @tc.name      testDateTimeBoundary0034
     * @tc.desc      Verify dateTimeBoundaryCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[1])).assertEqual(expected[1]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_3500
     * @tc.name      testDateTimeBoundary0035
     * @tc.desc      Verify dateTimeBoundaryCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[2])).assertEqual(expected[2]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_3600
     * @tc.name      testDateTimeBoundary0036
     * @tc.desc      Verify dateTimeBoundaryCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[3])).assertEqual(expected[3]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_3700
     * @tc.name      testDateTimeBoundary0037
     * @tc.desc      Verify dateTimeBoundaryCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[4])).assertEqual(expected[4]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_3800
     * @tc.name      testDateTimeBoundary0038
     * @tc.desc      Verify dateTimeBoundaryCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[5])).assertEqual(expected[5]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_3900
     * @tc.name      testDateTimeBoundary0039
     * @tc.desc      Verify dateTimeBoundaryCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[6])).assertEqual(expected[6]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_4000
     * @tc.name      testDateTimeBoundary0040
     * @tc.desc      Verify dateTimeBoundaryCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[7])).assertEqual(expected[7]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_4100
     * @tc.name      testDateTimeBoundary0041
     * @tc.desc      Verify dateTimeBoundaryCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[0])).assertEqual(expected[0]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_4200
     * @tc.name      testDateTimeBoundary0042
     * @tc.desc      Verify dateTimeBoundaryCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[1])).assertEqual(expected[1]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_4300
     * @tc.name      testDateTimeBoundary0043
     * @tc.desc      Verify dateTimeBoundaryCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[2])).assertEqual(expected[2]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_4400
     * @tc.name      testDateTimeBoundary0044
     * @tc.desc      Verify dateTimeBoundaryCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[3])).assertEqual(expected[3]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_4500
     * @tc.name      testDateTimeBoundary0045
     * @tc.desc      Verify dateTimeBoundaryCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[4])).assertEqual(expected[4]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_4600
     * @tc.name      testDateTimeBoundary0046
     * @tc.desc      Verify dateTimeBoundaryCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[5])).assertEqual(expected[5]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_4700
     * @tc.name      testDateTimeBoundary0047
     * @tc.desc      Verify dateTimeBoundaryCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[6])).assertEqual(expected[6]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_4800
     * @tc.name      testDateTimeBoundary0048
     * @tc.desc      Verify dateTimeBoundaryCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[7])).assertEqual(expected[7]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_4900
     * @tc.name      testDateTimeBoundary0049
     * @tc.desc      Verify dateTimeBoundaryCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[0])).assertEqual(expected[0]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_5000
     * @tc.name      testDateTimeBoundary0050
     * @tc.desc      Verify dateTimeBoundaryCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[1])).assertEqual(expected[1]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_5100
     * @tc.name      testDateTimeBoundary0051
     * @tc.desc      Verify dateTimeBoundaryCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[2])).assertEqual(expected[2]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_5200
     * @tc.name      testDateTimeBoundary0052
     * @tc.desc      Verify dateTimeBoundaryCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[3])).assertEqual(expected[3]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_5300
     * @tc.name      testDateTimeBoundary0053
     * @tc.desc      Verify dateTimeBoundaryCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[4])).assertEqual(expected[4]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_5400
     * @tc.name      testDateTimeBoundary0054
     * @tc.desc      Verify dateTimeBoundaryCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[5])).assertEqual(expected[5]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_5500
     * @tc.name      testDateTimeBoundary0055
     * @tc.desc      Verify dateTimeBoundaryCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[6])).assertEqual(expected[6]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_5600
     * @tc.name      testDateTimeBoundary0056
     * @tc.desc      Verify dateTimeBoundaryCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[7])).assertEqual(expected[7]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_5700
     * @tc.name      testDateTimeBoundary0057
     * @tc.desc      Verify dateTimeBoundaryCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[0])).assertEqual(expected[0]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_5800
     * @tc.name      testDateTimeBoundary0058
     * @tc.desc      Verify dateTimeBoundaryCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[1])).assertEqual(expected[1]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_5900
     * @tc.name      testDateTimeBoundary0059
     * @tc.desc      Verify dateTimeBoundaryCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[2])).assertEqual(expected[2]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_6000
     * @tc.name      testDateTimeBoundary0060
     * @tc.desc      Verify dateTimeBoundaryCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[3])).assertEqual(expected[3]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_6100
     * @tc.name      testDateTimeBoundary0061
     * @tc.desc      Verify dateTimeBoundaryCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[4])).assertEqual(expected[4]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_6200
     * @tc.name      testDateTimeBoundary0062
     * @tc.desc      Verify dateTimeBoundaryCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[5])).assertEqual(expected[5]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_6300
     * @tc.name      testDateTimeBoundary0063
     * @tc.desc      Verify dateTimeBoundaryCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[6])).assertEqual(expected[6]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_6400
     * @tc.name      testDateTimeBoundary0064
     * @tc.desc      Verify dateTimeBoundaryCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[7])).assertEqual(expected[7]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_6500
     * @tc.name      testDateTimeBoundary0065
     * @tc.desc      Verify dateTimeBoundaryCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[0])).assertEqual(expected[0]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_6600
     * @tc.name      testDateTimeBoundary0066
     * @tc.desc      Verify dateTimeBoundaryCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[1])).assertEqual(expected[1]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_6700
     * @tc.name      testDateTimeBoundary0067
     * @tc.desc      Verify dateTimeBoundaryCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[2])).assertEqual(expected[2]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_6800
     * @tc.name      testDateTimeBoundary0068
     * @tc.desc      Verify dateTimeBoundaryCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[3])).assertEqual(expected[3]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_6900
     * @tc.name      testDateTimeBoundary0069
     * @tc.desc      Verify dateTimeBoundaryCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[4])).assertEqual(expected[4]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_7000
     * @tc.name      testDateTimeBoundary0070
     * @tc.desc      Verify dateTimeBoundaryCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[5])).assertEqual(expected[5]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_7100
     * @tc.name      testDateTimeBoundary0071
     * @tc.desc      Verify dateTimeBoundaryCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[6])).assertEqual(expected[6]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_7200
     * @tc.name      testDateTimeBoundary0072
     * @tc.desc      Verify dateTimeBoundaryCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[7])).assertEqual(expected[7]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_7300
     * @tc.name      testDateTimeBoundary0073
     * @tc.desc      Verify dateTimeBoundaryCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[0])).assertEqual(expected[0]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_7400
     * @tc.name      testDateTimeBoundary0074
     * @tc.desc      Verify dateTimeBoundaryCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[1])).assertEqual(expected[1]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_7500
     * @tc.name      testDateTimeBoundary0075
     * @tc.desc      Verify dateTimeBoundaryCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[2])).assertEqual(expected[2]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_7600
     * @tc.name      testDateTimeBoundary0076
     * @tc.desc      Verify dateTimeBoundaryCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[3])).assertEqual(expected[3]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_7700
     * @tc.name      testDateTimeBoundary0077
     * @tc.desc      Verify dateTimeBoundaryCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[4])).assertEqual(expected[4]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_7800
     * @tc.name      testDateTimeBoundary0078
     * @tc.desc      Verify dateTimeBoundaryCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[5])).assertEqual(expected[5]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_7900
     * @tc.name      testDateTimeBoundary0079
     * @tc.desc      Verify dateTimeBoundaryCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[6])).assertEqual(expected[6]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_8000
     * @tc.name      testDateTimeBoundary0080
     * @tc.desc      Verify dateTimeBoundaryCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[7])).assertEqual(expected[7]);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_BOUND_8100
     * @tc.name      testDateTimeBoundary0081
     * @tc.desc      Verify dateTimeBoundaryCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeBoundary0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 59, 60, 3599, 3600, 86399, 86400, 90000];
      const expected: string[] = ['00:00', '00:59', '01:00', '59:59', '00:00', '59:59', '00:00', '00:00'];
      expect(dateTime(inputs[0])).assertEqual(expected[0]);
    });

  });
}
