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

const TAG: string = '[Sample_yuvCommonUtilEdge]';
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

export default function yuvCommonUtilEdgeTest(): void {
  describe('yuvCommonUtilEdgeTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0001
     * @tc.name      testExtYuvLimitEdge0000
     * @tc.desc      Limit edge -20 [0, 10].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimitEdge0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [0, 10];
      expect(limitNumberInRange(-20, range)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0002
     * @tc.name      testExtYuvFindEdge0001
     * @tc.desc      Find edge 0 [1, 5, 10, 20].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFindEdge0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [1, 5, 10, 20];
      expect(findRangeIndex(0, arr)).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0003
     * @tc.name      testExtYuvFixedEdge0002
     * @tc.desc      Fixed edge 12.999 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixedEdge0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(12.999, 2)).assertEqual('12.99');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0004
     * @tc.name      testExtYuvLimitEdge0003
     * @tc.desc      Limit edge 3 [100, 200].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimitEdge0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [100, 200];
      expect(limitNumberInRange(3, range)).assertEqual(100);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0005
     * @tc.name      testExtYuvFindEdge0004
     * @tc.desc      Find edge 4 [].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFindEdge0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [];
      expect(findRangeIndex(4, arr)).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0006
     * @tc.name      testExtYuvFixedEdge0005
     * @tc.desc      Fixed edge 99.999 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixedEdge0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(99.999, 1)).assertEqual('99.9');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0007
     * @tc.name      testExtYuvLimitEdge0006
     * @tc.desc      Limit edge 50 [2, 8].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimitEdge0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [2, 8];
      expect(limitNumberInRange(50, range)).assertEqual(8);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0008
     * @tc.name      testExtYuvFindEdge0007
     * @tc.desc      Find edge 10 [0, 2, 4, 8, 16].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFindEdge0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [0, 2, 4, 8, 16];
      expect(findRangeIndex(10, arr)).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0009
     * @tc.name      testExtYuvFixedEdge0008
     * @tc.desc      Fixed edge 9.97 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixedEdge0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(9.97, 0)).assertEqual('9');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0010
     * @tc.name      testExtYuvLimitEdge0009
     * @tc.desc      Limit edge -20 [].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimitEdge0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [];
      expect(limitNumberInRange(-20, range)).assertEqual(-20);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0011
     * @tc.name      testExtYuvFindEdge0010
     * @tc.desc      Find edge 30 [0, 1, 5, 10].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFindEdge0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [0, 1, 5, 10];
      expect(findRangeIndex(30, arr)).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0012
     * @tc.name      testExtYuvFixedEdge0011
     * @tc.desc      Fixed edge 0.005 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixedEdge0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(0.005, 3)).assertEqual('0.005');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0013
     * @tc.name      testExtYuvLimitEdge0012
     * @tc.desc      Limit edge 3 [-5, 5].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimitEdge0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [-5, 5];
      expect(limitNumberInRange(3, range)).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0014
     * @tc.name      testExtYuvFindEdge0013
     * @tc.desc      Find edge 0.5 [100].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFindEdge0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [100];
      expect(findRangeIndex(0.5, arr)).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0015
     * @tc.name      testExtYuvFixedEdge0014
     * @tc.desc      Fixed edge 0.1 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixedEdge0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(0.1, 2)).assertEqual('0.10');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0016
     * @tc.name      testExtYuvLimitEdge0015
     * @tc.desc      Limit edge 50 [0, 10].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimitEdge0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [0, 10];
      expect(limitNumberInRange(50, range)).assertEqual(10);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0017
     * @tc.name      testExtYuvFindEdge0016
     * @tc.desc      Find edge 5 [1, 5, 10, 20].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFindEdge0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [1, 5, 10, 20];
      expect(findRangeIndex(5, arr)).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0018
     * @tc.name      testExtYuvFixedEdge0017
     * @tc.desc      Fixed edge 1.234 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixedEdge0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(1.234, 1)).assertEqual('1.2');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0019
     * @tc.name      testExtYuvLimitEdge0018
     * @tc.desc      Limit edge -20 [100, 200].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimitEdge0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [100, 200];
      expect(limitNumberInRange(-20, range)).assertEqual(100);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0020
     * @tc.name      testExtYuvFindEdge0019
     * @tc.desc      Find edge 15 [].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFindEdge0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [];
      expect(findRangeIndex(15, arr)).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0021
     * @tc.name      testExtYuvFixedEdge0020
     * @tc.desc      Fixed edge 3.14159 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixedEdge0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(3.14159, 0)).assertEqual('3');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0022
     * @tc.name      testExtYuvLimitEdge0021
     * @tc.desc      Limit edge 3 [2, 8].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimitEdge0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [2, 8];
      expect(limitNumberInRange(3, range)).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0023
     * @tc.name      testExtYuvFindEdge0022
     * @tc.desc      Find edge -5 [0, 2, 4, 8, 16].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFindEdge0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [0, 2, 4, 8, 16];
      expect(findRangeIndex(-5, arr)).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0024
     * @tc.name      testExtYuvFixedEdge0023
     * @tc.desc      Fixed edge 1.05 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixedEdge0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(1.05, 3)).assertEqual('1.050');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0025
     * @tc.name      testExtYuvLimitEdge0024
     * @tc.desc      Limit edge 50 [].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimitEdge0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [];
      expect(limitNumberInRange(50, range)).assertEqual(50);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0026
     * @tc.name      testExtYuvFindEdge0025
     * @tc.desc      Find edge 1 [0, 1, 5, 10].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFindEdge0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [0, 1, 5, 10];
      expect(findRangeIndex(1, arr)).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0027
     * @tc.name      testExtYuvFixedEdge0026
     * @tc.desc      Fixed edge 12.999 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixedEdge0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(12.999, 2)).assertEqual('12.99');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0028
     * @tc.name      testExtYuvLimitEdge0027
     * @tc.desc      Limit edge -20 [-5, 5].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimitEdge0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [-5, 5];
      expect(limitNumberInRange(-20, range)).assertEqual(-5);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0029
     * @tc.name      testExtYuvFindEdge0028
     * @tc.desc      Find edge 9 [100].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFindEdge0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [100];
      expect(findRangeIndex(9, arr)).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0030
     * @tc.name      testExtYuvFixedEdge0029
     * @tc.desc      Fixed edge 99.999 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixedEdge0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(99.999, 1)).assertEqual('99.9');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0031
     * @tc.name      testExtYuvLimitEdge0030
     * @tc.desc      Limit edge 3 [0, 10].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimitEdge0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [0, 10];
      expect(limitNumberInRange(3, range)).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0032
     * @tc.name      testExtYuvFindEdge0031
     * @tc.desc      Find edge 20 [1, 5, 10, 20].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFindEdge0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [1, 5, 10, 20];
      expect(findRangeIndex(20, arr)).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0033
     * @tc.name      testExtYuvFixedEdge0032
     * @tc.desc      Fixed edge 9.97 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixedEdge0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(9.97, 0)).assertEqual('9');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0034
     * @tc.name      testExtYuvLimitEdge0033
     * @tc.desc      Limit edge 50 [100, 200].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimitEdge0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [100, 200];
      expect(limitNumberInRange(50, range)).assertEqual(100);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0035
     * @tc.name      testExtYuvFindEdge0034
     * @tc.desc      Find edge 0 [].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFindEdge0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [];
      expect(findRangeIndex(0, arr)).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0036
     * @tc.name      testExtYuvFixedEdge0035
     * @tc.desc      Fixed edge 0.005 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixedEdge0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(0.005, 3)).assertEqual('0.005');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0037
     * @tc.name      testExtYuvLimitEdge0036
     * @tc.desc      Limit edge -20 [2, 8].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimitEdge0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [2, 8];
      expect(limitNumberInRange(-20, range)).assertEqual(2);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0038
     * @tc.name      testExtYuvFindEdge0037
     * @tc.desc      Find edge 4 [0, 2, 4, 8, 16].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFindEdge0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [0, 2, 4, 8, 16];
      expect(findRangeIndex(4, arr)).assertEqual(2);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0039
     * @tc.name      testExtYuvFixedEdge0038
     * @tc.desc      Fixed edge 0.1 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixedEdge0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(0.1, 2)).assertEqual('0.10');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0040
     * @tc.name      testExtYuvLimitEdge0039
     * @tc.desc      Limit edge 3 [].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimitEdge0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [];
      expect(limitNumberInRange(3, range)).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0041
     * @tc.name      testExtYuvFindEdge0040
     * @tc.desc      Find edge 10 [0, 1, 5, 10].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFindEdge0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [0, 1, 5, 10];
      expect(findRangeIndex(10, arr)).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0042
     * @tc.name      testExtYuvFixedEdge0041
     * @tc.desc      Fixed edge 1.234 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixedEdge0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(1.234, 1)).assertEqual('1.2');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0043
     * @tc.name      testExtYuvLimitEdge0042
     * @tc.desc      Limit edge 50 [-5, 5].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimitEdge0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [-5, 5];
      expect(limitNumberInRange(50, range)).assertEqual(5);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0044
     * @tc.name      testExtYuvFindEdge0043
     * @tc.desc      Find edge 30 [100].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFindEdge0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [100];
      expect(findRangeIndex(30, arr)).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0045
     * @tc.name      testExtYuvFixedEdge0044
     * @tc.desc      Fixed edge 3.14159 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixedEdge0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(3.14159, 0)).assertEqual('3');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0046
     * @tc.name      testExtYuvLimitEdge0045
     * @tc.desc      Limit edge -20 [0, 10].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimitEdge0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [0, 10];
      expect(limitNumberInRange(-20, range)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0047
     * @tc.name      testExtYuvFindEdge0046
     * @tc.desc      Find edge 0.5 [1, 5, 10, 20].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFindEdge0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [1, 5, 10, 20];
      expect(findRangeIndex(0.5, arr)).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0048
     * @tc.name      testExtYuvFixedEdge0047
     * @tc.desc      Fixed edge 1.05 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixedEdge0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(1.05, 3)).assertEqual('1.050');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0049
     * @tc.name      testExtYuvLimitEdge0048
     * @tc.desc      Limit edge 3 [100, 200].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimitEdge0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [100, 200];
      expect(limitNumberInRange(3, range)).assertEqual(100);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0050
     * @tc.name      testExtYuvFindEdge0049
     * @tc.desc      Find edge 5 [].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFindEdge0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [];
      expect(findRangeIndex(5, arr)).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0051
     * @tc.name      testExtYuvFixedEdge0050
     * @tc.desc      Fixed edge 12.999 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixedEdge0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(12.999, 2)).assertEqual('12.99');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0052
     * @tc.name      testExtYuvLimitEdge0051
     * @tc.desc      Limit edge 50 [2, 8].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimitEdge0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [2, 8];
      expect(limitNumberInRange(50, range)).assertEqual(8);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0053
     * @tc.name      testExtYuvFindEdge0052
     * @tc.desc      Find edge 15 [0, 2, 4, 8, 16].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFindEdge0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [0, 2, 4, 8, 16];
      expect(findRangeIndex(15, arr)).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0054
     * @tc.name      testExtYuvFixedEdge0053
     * @tc.desc      Fixed edge 99.999 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixedEdge0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(99.999, 1)).assertEqual('99.9');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0055
     * @tc.name      testExtYuvLimitEdge0054
     * @tc.desc      Limit edge -20 [].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimitEdge0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [];
      expect(limitNumberInRange(-20, range)).assertEqual(-20);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0056
     * @tc.name      testExtYuvFindEdge0055
     * @tc.desc      Find edge -5 [0, 1, 5, 10].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFindEdge0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [0, 1, 5, 10];
      expect(findRangeIndex(-5, arr)).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0057
     * @tc.name      testExtYuvFixedEdge0056
     * @tc.desc      Fixed edge 9.97 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixedEdge0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(9.97, 0)).assertEqual('9');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0058
     * @tc.name      testExtYuvLimitEdge0057
     * @tc.desc      Limit edge 3 [-5, 5].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimitEdge0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [-5, 5];
      expect(limitNumberInRange(3, range)).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0059
     * @tc.name      testExtYuvFindEdge0058
     * @tc.desc      Find edge 1 [100].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFindEdge0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [100];
      expect(findRangeIndex(1, arr)).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0060
     * @tc.name      testExtYuvFixedEdge0059
     * @tc.desc      Fixed edge 0.005 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixedEdge0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(0.005, 3)).assertEqual('0.005');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0061
     * @tc.name      testExtYuvLimitEdge0060
     * @tc.desc      Limit edge 50 [0, 10].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimitEdge0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [0, 10];
      expect(limitNumberInRange(50, range)).assertEqual(10);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0062
     * @tc.name      testExtYuvFindEdge0061
     * @tc.desc      Find edge 9 [1, 5, 10, 20].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFindEdge0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [1, 5, 10, 20];
      expect(findRangeIndex(9, arr)).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0063
     * @tc.name      testExtYuvFixedEdge0062
     * @tc.desc      Fixed edge 0.1 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixedEdge0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(0.1, 2)).assertEqual('0.10');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0064
     * @tc.name      testExtYuvLimitEdge0063
     * @tc.desc      Limit edge -20 [100, 200].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimitEdge0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [100, 200];
      expect(limitNumberInRange(-20, range)).assertEqual(100);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0065
     * @tc.name      testExtYuvFindEdge0064
     * @tc.desc      Find edge 20 [].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFindEdge0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [];
      expect(findRangeIndex(20, arr)).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0066
     * @tc.name      testExtYuvFixedEdge0065
     * @tc.desc      Fixed edge 1.234 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixedEdge0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(1.234, 1)).assertEqual('1.2');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0067
     * @tc.name      testExtYuvLimitEdge0066
     * @tc.desc      Limit edge 3 [2, 8].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimitEdge0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [2, 8];
      expect(limitNumberInRange(3, range)).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0068
     * @tc.name      testExtYuvFindEdge0067
     * @tc.desc      Find edge 0 [0, 2, 4, 8, 16].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFindEdge0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [0, 2, 4, 8, 16];
      expect(findRangeIndex(0, arr)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0069
     * @tc.name      testExtYuvFixedEdge0068
     * @tc.desc      Fixed edge 3.14159 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixedEdge0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(3.14159, 0)).assertEqual('3');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0070
     * @tc.name      testExtYuvLimitEdge0069
     * @tc.desc      Limit edge 50 [].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimitEdge0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [];
      expect(limitNumberInRange(50, range)).assertEqual(50);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0071
     * @tc.name      testExtYuvFindEdge0070
     * @tc.desc      Find edge 4 [0, 1, 5, 10].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFindEdge0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [0, 1, 5, 10];
      expect(findRangeIndex(4, arr)).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0072
     * @tc.name      testExtYuvFixedEdge0071
     * @tc.desc      Fixed edge 1.05 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixedEdge0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(1.05, 3)).assertEqual('1.050');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0073
     * @tc.name      testExtYuvLimitEdge0072
     * @tc.desc      Limit edge -20 [-5, 5].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimitEdge0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [-5, 5];
      expect(limitNumberInRange(-20, range)).assertEqual(-5);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0074
     * @tc.name      testExtYuvFindEdge0073
     * @tc.desc      Find edge 10 [100].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFindEdge0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [100];
      expect(findRangeIndex(10, arr)).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0075
     * @tc.name      testExtYuvFixedEdge0074
     * @tc.desc      Fixed edge 12.999 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixedEdge0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(12.999, 2)).assertEqual('12.99');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0076
     * @tc.name      testExtYuvLimitEdge0075
     * @tc.desc      Limit edge 3 [0, 10].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimitEdge0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [0, 10];
      expect(limitNumberInRange(3, range)).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0077
     * @tc.name      testExtYuvFindEdge0076
     * @tc.desc      Find edge 30 [1, 5, 10, 20].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFindEdge0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [1, 5, 10, 20];
      expect(findRangeIndex(30, arr)).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0078
     * @tc.name      testExtYuvFixedEdge0077
     * @tc.desc      Fixed edge 99.999 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixedEdge0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(99.999, 1)).assertEqual('99.9');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0079
     * @tc.name      testExtYuvLimitEdge0078
     * @tc.desc      Limit edge 50 [100, 200].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimitEdge0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [100, 200];
      expect(limitNumberInRange(50, range)).assertEqual(100);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON2_0080
     * @tc.name      testExtYuvFindEdge0079
     * @tc.desc      Find edge 0.5 [].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFindEdge0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [];
      expect(findRangeIndex(0.5, arr)).assertEqual(-1);
    })
  });
}
