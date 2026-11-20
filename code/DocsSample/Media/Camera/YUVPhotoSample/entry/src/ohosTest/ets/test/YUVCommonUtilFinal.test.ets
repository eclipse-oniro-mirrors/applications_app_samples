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

const TAG: string = '[Sample_yuvCommonUtilFinal]';
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

export default function yuvCommonUtilFinalTest(): void {
  describe('yuvCommonUtilFinalTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON5_0001
     * @tc.name      testExtYuvFinalLimit0000
     * @tc.desc      Final limit -1 [0, 0].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFinalLimit0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(limitNumberInRange(-1, [0, 0])).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON5_0002
     * @tc.name      testExtYuvFinalFind0001
     * @tc.desc      Final find 0.5 [0, 1, 2].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFinalFind0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(findRangeIndex(0.5, [0, 1, 2])).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON5_0003
     * @tc.name      testExtYuvFinalFixed0002
     * @tc.desc      Final fixed 1.5 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFinalFixed0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(1.5, 2)).assertEqual('1.50');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON5_0004
     * @tc.name      testExtYuvFinalLimit0003
     * @tc.desc      Final limit 2 [].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFinalLimit0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(limitNumberInRange(2, [])).assertEqual(2);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON5_0005
     * @tc.name      testExtYuvFinalFind0004
     * @tc.desc      Final find 3 [0, 1].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFinalFind0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(findRangeIndex(3, [0, 1])).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON5_0006
     * @tc.name      testExtYuvFinalFixed0005
     * @tc.desc      Final fixed 0.5 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFinalFixed0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(0.5, 2)).assertEqual('0.50');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON5_0007
     * @tc.name      testExtYuvFinalLimit0006
     * @tc.desc      Final limit 1 [-1, 1].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFinalLimit0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(limitNumberInRange(1, [-1, 1])).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON5_0008
     * @tc.name      testExtYuvFinalFind0007
     * @tc.desc      Final find 1 [].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFinalFind0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(findRangeIndex(1, [])).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON5_0009
     * @tc.name      testExtYuvFinalFixed0008
     * @tc.desc      Final fixed 0.0 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFinalFixed0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(0.0, 2)).assertEqual('0.00');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON5_0010
     * @tc.name      testExtYuvFinalLimit0009
     * @tc.desc      Final limit 0 [1, 1].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFinalLimit0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(limitNumberInRange(0, [1, 1])).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON5_0011
     * @tc.name      testExtYuvFinalFind0010
     * @tc.desc      Final find 0 [1, 2, 3].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFinalFind0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(findRangeIndex(0, [1, 2, 3])).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON5_0012
     * @tc.name      testExtYuvFinalFixed0011
     * @tc.desc      Final fixed 9.99 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFinalFixed0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(9.99, 2)).assertEqual('9.99');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON5_0013
     * @tc.name      testExtYuvFinalLimit0012
     * @tc.desc      Final limit -1 [0, 0].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFinalLimit0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(limitNumberInRange(-1, [0, 0])).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON5_0014
     * @tc.name      testExtYuvFinalFind0013
     * @tc.desc      Final find 2 [0, 1, 2].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFinalFind0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(findRangeIndex(2, [0, 1, 2])).assertEqual(2);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON5_0015
     * @tc.name      testExtYuvFinalFixed0014
     * @tc.desc      Final fixed 1.5 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFinalFixed0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(1.5, 2)).assertEqual('1.50');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON5_0016
     * @tc.name      testExtYuvFinalLimit0015
     * @tc.desc      Final limit 2 [].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFinalLimit0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(limitNumberInRange(2, [])).assertEqual(2);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON5_0017
     * @tc.name      testExtYuvFinalFind0016
     * @tc.desc      Final find 0.5 [0, 1].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFinalFind0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(findRangeIndex(0.5, [0, 1])).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON5_0018
     * @tc.name      testExtYuvFinalFixed0017
     * @tc.desc      Final fixed 0.5 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFinalFixed0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(0.5, 2)).assertEqual('0.50');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON5_0019
     * @tc.name      testExtYuvFinalLimit0018
     * @tc.desc      Final limit 1 [-1, 1].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFinalLimit0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(limitNumberInRange(1, [-1, 1])).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON5_0020
     * @tc.name      testExtYuvFinalFind0019
     * @tc.desc      Final find 3 [].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFinalFind0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(findRangeIndex(3, [])).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON5_0021
     * @tc.name      testExtYuvFinalFixed0020
     * @tc.desc      Final fixed 0.0 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFinalFixed0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(0.0, 2)).assertEqual('0.00');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON5_0022
     * @tc.name      testExtYuvFinalLimit0021
     * @tc.desc      Final limit 0 [1, 1].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFinalLimit0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(limitNumberInRange(0, [1, 1])).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON5_0023
     * @tc.name      testExtYuvFinalFind0022
     * @tc.desc      Final find 1 [1, 2, 3].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFinalFind0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(findRangeIndex(1, [1, 2, 3])).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON5_0024
     * @tc.name      testExtYuvFinalFixed0023
     * @tc.desc      Final fixed 9.99 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFinalFixed0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(9.99, 2)).assertEqual('9.99');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON5_0025
     * @tc.name      testExtYuvFinalLimit0024
     * @tc.desc      Final limit -1 [0, 0].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFinalLimit0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(limitNumberInRange(-1, [0, 0])).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON5_0026
     * @tc.name      testExtYuvFinalFind0025
     * @tc.desc      Final find 0 [0, 1, 2].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFinalFind0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(findRangeIndex(0, [0, 1, 2])).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON5_0027
     * @tc.name      testExtYuvFinalFixed0026
     * @tc.desc      Final fixed 1.5 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFinalFixed0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(1.5, 2)).assertEqual('1.50');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON5_0028
     * @tc.name      testExtYuvFinalLimit0027
     * @tc.desc      Final limit 2 [].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFinalLimit0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(limitNumberInRange(2, [])).assertEqual(2);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON5_0029
     * @tc.name      testExtYuvFinalFind0028
     * @tc.desc      Final find 2 [0, 1].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFinalFind0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(findRangeIndex(2, [0, 1])).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON5_0030
     * @tc.name      testExtYuvFinalFixed0029
     * @tc.desc      Final fixed 0.5 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFinalFixed0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(0.5, 2)).assertEqual('0.50');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON5_0031
     * @tc.name      testExtYuvFinalLimit0030
     * @tc.desc      Final limit 1 [-1, 1].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFinalLimit0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(limitNumberInRange(1, [-1, 1])).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON5_0032
     * @tc.name      testExtYuvFinalFind0031
     * @tc.desc      Final find 0.5 [].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFinalFind0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(findRangeIndex(0.5, [])).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON5_0033
     * @tc.name      testExtYuvFinalFixed0032
     * @tc.desc      Final fixed 0.0 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFinalFixed0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(0.0, 2)).assertEqual('0.00');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON5_0034
     * @tc.name      testExtYuvFinalLimit0033
     * @tc.desc      Final limit 0 [1, 1].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFinalLimit0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(limitNumberInRange(0, [1, 1])).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON5_0035
     * @tc.name      testExtYuvFinalFind0034
     * @tc.desc      Final find 3 [1, 2, 3].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFinalFind0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(findRangeIndex(3, [1, 2, 3])).assertEqual(2);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON5_0036
     * @tc.name      testExtYuvFinalFixed0035
     * @tc.desc      Final fixed 9.99 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFinalFixed0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(9.99, 2)).assertEqual('9.99');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON5_0037
     * @tc.name      testExtYuvFinalLimit0036
     * @tc.desc      Final limit -1 [0, 0].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFinalLimit0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(limitNumberInRange(-1, [0, 0])).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON5_0038
     * @tc.name      testExtYuvFinalFind0037
     * @tc.desc      Final find 1 [0, 1, 2].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFinalFind0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(findRangeIndex(1, [0, 1, 2])).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON5_0039
     * @tc.name      testExtYuvFinalFixed0038
     * @tc.desc      Final fixed 1.5 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFinalFixed0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(1.5, 2)).assertEqual('1.50');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON5_0040
     * @tc.name      testExtYuvFinalLimit0039
     * @tc.desc      Final limit 2 [].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFinalLimit0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(limitNumberInRange(2, [])).assertEqual(2);
    })
  });
}
