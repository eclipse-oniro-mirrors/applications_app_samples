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
import { limitNumberInRange, findRangeIndex, toFixed } from '../../../main/ets/utils/CommonUtil';

const TAG: string = '[Sample_yuvCommonUtilExtreme]';
const DOMAIN: number = 0xF817;

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

export default function yuvCommonUtilExtremeTest(): void {
  describe('yuvCommonUtilExtremeTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON4_0001
     * @tc.name      testExtYuvExtLimit0000
     * @tc.desc      Extreme limit -2 [0, 0].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvExtLimit0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(limitNumberInRange(-2, [0, 0])).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON4_0002
     * @tc.name      testExtYuvExtFind0001
     * @tc.desc      Extreme find 0.5 [0, 1, 2, 3].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvExtFind0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(findRangeIndex(0.5, [0, 1, 2, 3])).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON4_0003
     * @tc.name      testExtYuvExtFixed0002
     * @tc.desc      Extreme fixed 1.999 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvExtFixed0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(1.999, 2)).assertEqual('1.99');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON4_0004
     * @tc.name      testExtYuvExtLimit0003
     * @tc.desc      Extreme limit 1 [].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvExtLimit0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(limitNumberInRange(1, [])).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON4_0005
     * @tc.name      testExtYuvExtFind0004
     * @tc.desc      Extreme find 3 [0, 1].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvExtFind0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(findRangeIndex(3, [0, 1])).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON4_0006
     * @tc.name      testExtYuvExtFixed0005
     * @tc.desc      Extreme fixed 0.999 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvExtFixed0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(0.999, 2)).assertEqual('0.99');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON4_0007
     * @tc.name      testExtYuvExtLimit0006
     * @tc.desc      Extreme limit -2 [-1, 1].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvExtLimit0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(limitNumberInRange(-2, [-1, 1])).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON4_0008
     * @tc.name      testExtYuvExtFind0007
     * @tc.desc      Extreme find 0.5 [].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvExtFind0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(findRangeIndex(0.5, [])).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON4_0009
     * @tc.name      testExtYuvExtFixed0008
     * @tc.desc      Extreme fixed 0.0 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvExtFixed0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(0.0, 2)).assertEqual('0.00');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON4_0010
     * @tc.name      testExtYuvExtLimit0009
     * @tc.desc      Extreme limit 1 [5, 5].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvExtLimit0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(limitNumberInRange(1, [5, 5])).assertEqual(5);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON4_0011
     * @tc.name      testExtYuvExtFind0010
     * @tc.desc      Extreme find 3 [10].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvExtFind0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(findRangeIndex(3, [10])).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON4_0012
     * @tc.name      testExtYuvExtFixed0011
     * @tc.desc      Extreme fixed 10.0 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvExtFixed0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(10.0, 2)).assertEqual('10.00');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON4_0013
     * @tc.name      testExtYuvExtLimit0012
     * @tc.desc      Extreme limit -2 [0, 0].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvExtLimit0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(limitNumberInRange(-2, [0, 0])).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON4_0014
     * @tc.name      testExtYuvExtFind0013
     * @tc.desc      Extreme find 0.5 [0, 1, 2, 3].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvExtFind0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(findRangeIndex(0.5, [0, 1, 2, 3])).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON4_0015
     * @tc.name      testExtYuvExtFixed0014
     * @tc.desc      Extreme fixed 1.999 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvExtFixed0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(1.999, 2)).assertEqual('1.99');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON4_0016
     * @tc.name      testExtYuvExtLimit0015
     * @tc.desc      Extreme limit 1 [].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvExtLimit0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(limitNumberInRange(1, [])).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON4_0017
     * @tc.name      testExtYuvExtFind0016
     * @tc.desc      Extreme find 3 [0, 1].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvExtFind0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(findRangeIndex(3, [0, 1])).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON4_0018
     * @tc.name      testExtYuvExtFixed0017
     * @tc.desc      Extreme fixed 0.999 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvExtFixed0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(0.999, 2)).assertEqual('0.99');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON4_0019
     * @tc.name      testExtYuvExtLimit0018
     * @tc.desc      Extreme limit -2 [-1, 1].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvExtLimit0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(limitNumberInRange(-2, [-1, 1])).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON4_0020
     * @tc.name      testExtYuvExtFind0019
     * @tc.desc      Extreme find 0.5 [].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvExtFind0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(findRangeIndex(0.5, [])).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON4_0021
     * @tc.name      testExtYuvExtFixed0020
     * @tc.desc      Extreme fixed 0.0 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvExtFixed0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(0.0, 2)).assertEqual('0.00');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON4_0022
     * @tc.name      testExtYuvExtLimit0021
     * @tc.desc      Extreme limit 1 [5, 5].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvExtLimit0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(limitNumberInRange(1, [5, 5])).assertEqual(5);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON4_0023
     * @tc.name      testExtYuvExtFind0022
     * @tc.desc      Extreme find 3 [10].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvExtFind0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(findRangeIndex(3, [10])).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON4_0024
     * @tc.name      testExtYuvExtFixed0023
     * @tc.desc      Extreme fixed 10.0 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvExtFixed0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(10.0, 2)).assertEqual('10.00');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON4_0025
     * @tc.name      testExtYuvExtLimit0024
     * @tc.desc      Extreme limit -2 [0, 0].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvExtLimit0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(limitNumberInRange(-2, [0, 0])).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON4_0026
     * @tc.name      testExtYuvExtFind0025
     * @tc.desc      Extreme find 0.5 [0, 1, 2, 3].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvExtFind0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(findRangeIndex(0.5, [0, 1, 2, 3])).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON4_0027
     * @tc.name      testExtYuvExtFixed0026
     * @tc.desc      Extreme fixed 1.999 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvExtFixed0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(1.999, 2)).assertEqual('1.99');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON4_0028
     * @tc.name      testExtYuvExtLimit0027
     * @tc.desc      Extreme limit 1 [].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvExtLimit0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(limitNumberInRange(1, [])).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON4_0029
     * @tc.name      testExtYuvExtFind0028
     * @tc.desc      Extreme find 3 [0, 1].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvExtFind0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(findRangeIndex(3, [0, 1])).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON4_0030
     * @tc.name      testExtYuvExtFixed0029
     * @tc.desc      Extreme fixed 0.999 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvExtFixed0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(0.999, 2)).assertEqual('0.99');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON4_0031
     * @tc.name      testExtYuvExtLimit0030
     * @tc.desc      Extreme limit -2 [-1, 1].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvExtLimit0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(limitNumberInRange(-2, [-1, 1])).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON4_0032
     * @tc.name      testExtYuvExtFind0031
     * @tc.desc      Extreme find 0.5 [].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvExtFind0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(findRangeIndex(0.5, [])).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON4_0033
     * @tc.name      testExtYuvExtFixed0032
     * @tc.desc      Extreme fixed 0.0 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvExtFixed0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(0.0, 2)).assertEqual('0.00');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON4_0034
     * @tc.name      testExtYuvExtLimit0033
     * @tc.desc      Extreme limit 1 [5, 5].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvExtLimit0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(limitNumberInRange(1, [5, 5])).assertEqual(5);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON4_0035
     * @tc.name      testExtYuvExtFind0034
     * @tc.desc      Extreme find 3 [10].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvExtFind0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(findRangeIndex(3, [10])).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON4_0036
     * @tc.name      testExtYuvExtFixed0035
     * @tc.desc      Extreme fixed 10.0 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvExtFixed0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(10.0, 2)).assertEqual('10.00');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON4_0037
     * @tc.name      testExtYuvExtLimit0036
     * @tc.desc      Extreme limit -2 [0, 0].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvExtLimit0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(limitNumberInRange(-2, [0, 0])).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON4_0038
     * @tc.name      testExtYuvExtFind0037
     * @tc.desc      Extreme find 0.5 [0, 1, 2, 3].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvExtFind0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(findRangeIndex(0.5, [0, 1, 2, 3])).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON4_0039
     * @tc.name      testExtYuvExtFixed0038
     * @tc.desc      Extreme fixed 1.999 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvExtFixed0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(1.999, 2)).assertEqual('1.99');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON4_0040
     * @tc.name      testExtYuvExtLimit0039
     * @tc.desc      Extreme limit 1 [].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvExtLimit0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(limitNumberInRange(1, [])).assertEqual(1);
    })
  });
}
