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
import { limitNumberInRange, findRangeIndex, toFixed, getClampedChildPosition } from '../../../main/ets/utils/CommonUtil';

const TAG: string = '[Sample_yuvCommonUtilExtra]';
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

export default function yuvCommonUtilExtraTest(): void {
  describe('yuvCommonUtilExtraTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0001
     * @tc.name      testExtYuvLimitX0000
     * @tc.desc      Limit X -100 [0, 100].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimitX0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [0, 100];
      expect(limitNumberInRange(-100, range)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0002
     * @tc.name      testExtYuvFindX0001
     * @tc.desc      Find X 0 [0, 10, 20, 30].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFindX0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [0, 10, 20, 30];
      expect(findRangeIndex(0, arr)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0003
     * @tc.name      testExtYuvFixedX0002
     * @tc.desc      Fixed X 10.555 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixedX0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(10.555, 2)).assertEqual('10.55');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0004
     * @tc.name      testExtYuvClampX0003
     * @tc.desc      Clamp X 30x30 200,200.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClampX0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const edges: Edges = getClampedChildPosition({ width: 30, height: 30 }, { width: 400, height: 400 }, { x: 200, y: 200 });
      expect(edges.left).assertEqual(185.0);
      expect(edges.top).assertEqual(185.0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0005
     * @tc.name      testExtYuvLimitX0004
     * @tc.desc      Limit X 10 [0, 100].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimitX0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [0, 100];
      expect(limitNumberInRange(10, range)).assertEqual(10);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0006
     * @tc.name      testExtYuvFindX0005
     * @tc.desc      Find X 5 [0, 1, 5, 10].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFindX0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [0, 1, 5, 10];
      expect(findRangeIndex(5, arr)).assertEqual(2);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0007
     * @tc.name      testExtYuvFixedX0006
     * @tc.desc      Fixed X 2.001 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixedX0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(2.001, 0)).assertEqual('2');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0008
     * @tc.name      testExtYuvClampX0007
     * @tc.desc      Clamp X 60x60 100,100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClampX0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const edges: Edges = getClampedChildPosition({ width: 60, height: 60 }, { width: 400, height: 400 }, { x: 100, y: 100 });
      expect(edges.left).assertEqual(70.0);
      expect(edges.top).assertEqual(70.0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0009
     * @tc.name      testExtYuvLimitX0008
     * @tc.desc      Limit X 200 [0, 100].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimitX0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [0, 100];
      expect(limitNumberInRange(200, range)).assertEqual(100);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0010
     * @tc.name      testExtYuvFindX0009
     * @tc.desc      Find X 50 [].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFindX0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [];
      expect(findRangeIndex(50, arr)).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0011
     * @tc.name      testExtYuvFixedX0010
     * @tc.desc      Fixed X 1.999 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixedX0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(1.999, 1)).assertEqual('1.9');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0012
     * @tc.name      testExtYuvClampX0011
     * @tc.desc      Clamp X 100x100 50,50.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClampX0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const edges: Edges = getClampedChildPosition({ width: 100, height: 100 }, { width: 400, height: 400 }, { x: 50, y: 50 });
      expect(edges.left).assertEqual(0.0);
      expect(edges.top).assertEqual(0.0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0013
     * @tc.name      testExtYuvLimitX0012
     * @tc.desc      Limit X 5 [0, 100].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimitX0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [0, 100];
      expect(limitNumberInRange(5, range)).assertEqual(5);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0014
     * @tc.name      testExtYuvFindX0013
     * @tc.desc      Find X 1 [0].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFindX0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [0];
      expect(findRangeIndex(1, arr)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0015
     * @tc.name      testExtYuvFixedX0014
     * @tc.desc      Fixed X 99.95 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixedX0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(99.95, 2)).assertEqual('99.95');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0016
     * @tc.name      testExtYuvClampX0015
     * @tc.desc      Clamp X 30x30 0,0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClampX0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const edges: Edges = getClampedChildPosition({ width: 30, height: 30 }, { width: 400, height: 400 }, { x: 0, y: 0 });
      expect(edges.left).assertEqual(0);
      expect(edges.top).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0017
     * @tc.name      testExtYuvLimitX0016
     * @tc.desc      Limit X 100 [0, 100].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimitX0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [0, 100];
      expect(limitNumberInRange(100, range)).assertEqual(100);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0018
     * @tc.name      testExtYuvFindX0017
     * @tc.desc      Find X 15 [1, 3, 9].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFindX0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [1, 3, 9];
      expect(findRangeIndex(15, arr)).assertEqual(2);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0019
     * @tc.name      testExtYuvFixedX0018
     * @tc.desc      Fixed X 0.999 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixedX0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(0.999, 0)).assertEqual('0');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0020
     * @tc.name      testExtYuvClampX0019
     * @tc.desc      Clamp X 60x60 500,500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClampX0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const edges: Edges = getClampedChildPosition({ width: 60, height: 60 }, { width: 400, height: 400 }, { x: 500, y: 500 });
      expect(edges.left).assertEqual(340);
      expect(edges.top).assertEqual(340);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0021
     * @tc.name      testExtYuvLimitX0020
     * @tc.desc      Limit X 0 [0, 100].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimitX0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [0, 100];
      expect(limitNumberInRange(0, range)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0022
     * @tc.name      testExtYuvFindX0021
     * @tc.desc      Find X 0 [0, 10, 20, 30].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFindX0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [0, 10, 20, 30];
      expect(findRangeIndex(0, arr)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0023
     * @tc.name      testExtYuvFixedX0022
     * @tc.desc      Fixed X 10.555 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixedX0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(10.555, 1)).assertEqual('10.5');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0024
     * @tc.name      testExtYuvClampX0023
     * @tc.desc      Clamp X 100x100 200,200.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClampX0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const edges: Edges = getClampedChildPosition({ width: 100, height: 100 }, { width: 400, height: 400 }, { x: 200, y: 200 });
      expect(edges.left).assertEqual(150.0);
      expect(edges.top).assertEqual(150.0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0025
     * @tc.name      testExtYuvLimitX0024
     * @tc.desc      Limit X 50 [0, 100].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimitX0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [0, 100];
      expect(limitNumberInRange(50, range)).assertEqual(50);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0026
     * @tc.name      testExtYuvFindX0025
     * @tc.desc      Find X 5 [0, 1, 5, 10].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFindX0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [0, 1, 5, 10];
      expect(findRangeIndex(5, arr)).assertEqual(2);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0027
     * @tc.name      testExtYuvFixedX0026
     * @tc.desc      Fixed X 2.001 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixedX0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(2.001, 2)).assertEqual('2.00');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0028
     * @tc.name      testExtYuvClampX0027
     * @tc.desc      Clamp X 30x30 100,100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClampX0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const edges: Edges = getClampedChildPosition({ width: 30, height: 30 }, { width: 400, height: 400 }, { x: 100, y: 100 });
      expect(edges.left).assertEqual(85.0);
      expect(edges.top).assertEqual(85.0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0029
     * @tc.name      testExtYuvLimitX0028
     * @tc.desc      Limit X -10 [0, 100].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimitX0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [0, 100];
      expect(limitNumberInRange(-10, range)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0030
     * @tc.name      testExtYuvFindX0029
     * @tc.desc      Find X 50 [].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFindX0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [];
      expect(findRangeIndex(50, arr)).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0031
     * @tc.name      testExtYuvFixedX0030
     * @tc.desc      Fixed X 1.999 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixedX0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(1.999, 0)).assertEqual('1');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0032
     * @tc.name      testExtYuvClampX0031
     * @tc.desc      Clamp X 60x60 50,50.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClampX0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const edges: Edges = getClampedChildPosition({ width: 60, height: 60 }, { width: 400, height: 400 }, { x: 50, y: 50 });
      expect(edges.left).assertEqual(20.0);
      expect(edges.top).assertEqual(20.0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0033
     * @tc.name      testExtYuvLimitX0032
     * @tc.desc      Limit X 20 [0, 100].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimitX0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [0, 100];
      expect(limitNumberInRange(20, range)).assertEqual(20);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0034
     * @tc.name      testExtYuvFindX0033
     * @tc.desc      Find X 1 [0].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFindX0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [0];
      expect(findRangeIndex(1, arr)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0035
     * @tc.name      testExtYuvFixedX0034
     * @tc.desc      Fixed X 99.95 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixedX0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(99.95, 1)).assertEqual('99.9');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0036
     * @tc.name      testExtYuvClampX0035
     * @tc.desc      Clamp X 100x100 0,0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClampX0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const edges: Edges = getClampedChildPosition({ width: 100, height: 100 }, { width: 400, height: 400 }, { x: 0, y: 0 });
      expect(edges.left).assertEqual(0);
      expect(edges.top).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0037
     * @tc.name      testExtYuvLimitX0036
     * @tc.desc      Limit X -100 [0, 100].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimitX0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [0, 100];
      expect(limitNumberInRange(-100, range)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0038
     * @tc.name      testExtYuvFindX0037
     * @tc.desc      Find X 15 [1, 3, 9].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFindX0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [1, 3, 9];
      expect(findRangeIndex(15, arr)).assertEqual(2);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0039
     * @tc.name      testExtYuvFixedX0038
     * @tc.desc      Fixed X 0.999 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixedX0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(0.999, 2)).assertEqual('0.99');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0040
     * @tc.name      testExtYuvClampX0039
     * @tc.desc      Clamp X 30x30 500,500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClampX0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const edges: Edges = getClampedChildPosition({ width: 30, height: 30 }, { width: 400, height: 400 }, { x: 500, y: 500 });
      expect(edges.left).assertEqual(370);
      expect(edges.top).assertEqual(370);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0041
     * @tc.name      testExtYuvLimitX0040
     * @tc.desc      Limit X 10 [0, 100].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimitX0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [0, 100];
      expect(limitNumberInRange(10, range)).assertEqual(10);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0042
     * @tc.name      testExtYuvFindX0041
     * @tc.desc      Find X 0 [0, 10, 20, 30].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFindX0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [0, 10, 20, 30];
      expect(findRangeIndex(0, arr)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0043
     * @tc.name      testExtYuvFixedX0042
     * @tc.desc      Fixed X 10.555 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixedX0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(10.555, 0)).assertEqual('10');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0044
     * @tc.name      testExtYuvClampX0043
     * @tc.desc      Clamp X 60x60 200,200.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClampX0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const edges: Edges = getClampedChildPosition({ width: 60, height: 60 }, { width: 400, height: 400 }, { x: 200, y: 200 });
      expect(edges.left).assertEqual(170.0);
      expect(edges.top).assertEqual(170.0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0045
     * @tc.name      testExtYuvLimitX0044
     * @tc.desc      Limit X 200 [0, 100].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimitX0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [0, 100];
      expect(limitNumberInRange(200, range)).assertEqual(100);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0046
     * @tc.name      testExtYuvFindX0045
     * @tc.desc      Find X 5 [0, 1, 5, 10].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFindX0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [0, 1, 5, 10];
      expect(findRangeIndex(5, arr)).assertEqual(2);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0047
     * @tc.name      testExtYuvFixedX0046
     * @tc.desc      Fixed X 2.001 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixedX0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(2.001, 1)).assertEqual('2.0');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0048
     * @tc.name      testExtYuvClampX0047
     * @tc.desc      Clamp X 100x100 100,100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClampX0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const edges: Edges = getClampedChildPosition({ width: 100, height: 100 }, { width: 400, height: 400 }, { x: 100, y: 100 });
      expect(edges.left).assertEqual(50.0);
      expect(edges.top).assertEqual(50.0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0049
     * @tc.name      testExtYuvLimitX0048
     * @tc.desc      Limit X 5 [0, 100].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimitX0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [0, 100];
      expect(limitNumberInRange(5, range)).assertEqual(5);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0050
     * @tc.name      testExtYuvFindX0049
     * @tc.desc      Find X 50 [].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFindX0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [];
      expect(findRangeIndex(50, arr)).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0051
     * @tc.name      testExtYuvFixedX0050
     * @tc.desc      Fixed X 1.999 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixedX0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(1.999, 2)).assertEqual('1.99');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0052
     * @tc.name      testExtYuvClampX0051
     * @tc.desc      Clamp X 30x30 50,50.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClampX0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const edges: Edges = getClampedChildPosition({ width: 30, height: 30 }, { width: 400, height: 400 }, { x: 50, y: 50 });
      expect(edges.left).assertEqual(35.0);
      expect(edges.top).assertEqual(35.0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0053
     * @tc.name      testExtYuvLimitX0052
     * @tc.desc      Limit X 100 [0, 100].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimitX0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [0, 100];
      expect(limitNumberInRange(100, range)).assertEqual(100);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0054
     * @tc.name      testExtYuvFindX0053
     * @tc.desc      Find X 1 [0].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFindX0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [0];
      expect(findRangeIndex(1, arr)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0055
     * @tc.name      testExtYuvFixedX0054
     * @tc.desc      Fixed X 99.95 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixedX0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(99.95, 0)).assertEqual('99');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0056
     * @tc.name      testExtYuvClampX0055
     * @tc.desc      Clamp X 60x60 0,0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClampX0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const edges: Edges = getClampedChildPosition({ width: 60, height: 60 }, { width: 400, height: 400 }, { x: 0, y: 0 });
      expect(edges.left).assertEqual(0);
      expect(edges.top).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0057
     * @tc.name      testExtYuvLimitX0056
     * @tc.desc      Limit X 0 [0, 100].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimitX0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [0, 100];
      expect(limitNumberInRange(0, range)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0058
     * @tc.name      testExtYuvFindX0057
     * @tc.desc      Find X 15 [1, 3, 9].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFindX0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [1, 3, 9];
      expect(findRangeIndex(15, arr)).assertEqual(2);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0059
     * @tc.name      testExtYuvFixedX0058
     * @tc.desc      Fixed X 0.999 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixedX0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(0.999, 1)).assertEqual('0.9');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0060
     * @tc.name      testExtYuvClampX0059
     * @tc.desc      Clamp X 100x100 500,500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClampX0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const edges: Edges = getClampedChildPosition({ width: 100, height: 100 }, { width: 400, height: 400 }, { x: 500, y: 500 });
      expect(edges.left).assertEqual(300);
      expect(edges.top).assertEqual(300);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0061
     * @tc.name      testExtYuvLimitX0060
     * @tc.desc      Limit X 50 [0, 100].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimitX0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [0, 100];
      expect(limitNumberInRange(50, range)).assertEqual(50);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0062
     * @tc.name      testExtYuvFindX0061
     * @tc.desc      Find X 0 [0, 10, 20, 30].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFindX0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [0, 10, 20, 30];
      expect(findRangeIndex(0, arr)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0063
     * @tc.name      testExtYuvFixedX0062
     * @tc.desc      Fixed X 10.555 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixedX0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(10.555, 2)).assertEqual('10.55');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0064
     * @tc.name      testExtYuvClampX0063
     * @tc.desc      Clamp X 30x30 200,200.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClampX0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const edges: Edges = getClampedChildPosition({ width: 30, height: 30 }, { width: 400, height: 400 }, { x: 200, y: 200 });
      expect(edges.left).assertEqual(185.0);
      expect(edges.top).assertEqual(185.0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0065
     * @tc.name      testExtYuvLimitX0064
     * @tc.desc      Limit X -10 [0, 100].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimitX0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [0, 100];
      expect(limitNumberInRange(-10, range)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0066
     * @tc.name      testExtYuvFindX0065
     * @tc.desc      Find X 5 [0, 1, 5, 10].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFindX0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [0, 1, 5, 10];
      expect(findRangeIndex(5, arr)).assertEqual(2);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0067
     * @tc.name      testExtYuvFixedX0066
     * @tc.desc      Fixed X 2.001 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixedX0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(2.001, 0)).assertEqual('2');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0068
     * @tc.name      testExtYuvClampX0067
     * @tc.desc      Clamp X 60x60 100,100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClampX0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const edges: Edges = getClampedChildPosition({ width: 60, height: 60 }, { width: 400, height: 400 }, { x: 100, y: 100 });
      expect(edges.left).assertEqual(70.0);
      expect(edges.top).assertEqual(70.0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0069
     * @tc.name      testExtYuvLimitX0068
     * @tc.desc      Limit X 20 [0, 100].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimitX0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [0, 100];
      expect(limitNumberInRange(20, range)).assertEqual(20);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0070
     * @tc.name      testExtYuvFindX0069
     * @tc.desc      Find X 50 [].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFindX0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [];
      expect(findRangeIndex(50, arr)).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0071
     * @tc.name      testExtYuvFixedX0070
     * @tc.desc      Fixed X 1.999 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixedX0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(1.999, 1)).assertEqual('1.9');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0072
     * @tc.name      testExtYuvClampX0071
     * @tc.desc      Clamp X 100x100 50,50.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClampX0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const edges: Edges = getClampedChildPosition({ width: 100, height: 100 }, { width: 400, height: 400 }, { x: 50, y: 50 });
      expect(edges.left).assertEqual(0.0);
      expect(edges.top).assertEqual(0.0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0073
     * @tc.name      testExtYuvLimitX0072
     * @tc.desc      Limit X -100 [0, 100].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimitX0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [0, 100];
      expect(limitNumberInRange(-100, range)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0074
     * @tc.name      testExtYuvFindX0073
     * @tc.desc      Find X 1 [0].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFindX0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [0];
      expect(findRangeIndex(1, arr)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0075
     * @tc.name      testExtYuvFixedX0074
     * @tc.desc      Fixed X 99.95 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixedX0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(99.95, 2)).assertEqual('99.95');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0076
     * @tc.name      testExtYuvClampX0075
     * @tc.desc      Clamp X 30x30 0,0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClampX0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const edges: Edges = getClampedChildPosition({ width: 30, height: 30 }, { width: 400, height: 400 }, { x: 0, y: 0 });
      expect(edges.left).assertEqual(0);
      expect(edges.top).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0077
     * @tc.name      testExtYuvLimitX0076
     * @tc.desc      Limit X 10 [0, 100].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimitX0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [0, 100];
      expect(limitNumberInRange(10, range)).assertEqual(10);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0078
     * @tc.name      testExtYuvFindX0077
     * @tc.desc      Find X 15 [1, 3, 9].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFindX0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [1, 3, 9];
      expect(findRangeIndex(15, arr)).assertEqual(2);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0079
     * @tc.name      testExtYuvFixedX0078
     * @tc.desc      Fixed X 0.999 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixedX0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(0.999, 0)).assertEqual('0');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON3_0080
     * @tc.name      testExtYuvClampX0079
     * @tc.desc      Clamp X 60x60 500,500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClampX0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const edges: Edges = getClampedChildPosition({ width: 60, height: 60 }, { width: 400, height: 400 }, { x: 500, y: 500 });
      expect(edges.left).assertEqual(340);
      expect(edges.top).assertEqual(340);
    })
  });
}
