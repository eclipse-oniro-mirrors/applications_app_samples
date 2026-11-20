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

const TAG: string = '[Sample_yuvCommonUtilCore]';
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

export default function yuvCommonUtilCoreTest(): void {
  describe('yuvCommonUtilCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0001
     * @tc.name      testExtYuvLimit0000
     * @tc.desc      limitNumberInRange -10 in [0, 10].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimit0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [0, 10];
      expect(limitNumberInRange(-10, range)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0002
     * @tc.name      testExtYuvFind0001
     * @tc.desc      findRangeIndex 0 in [1, 2, 3].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFind0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [1, 2, 3];
      expect(findRangeIndex(0, arr)).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0003
     * @tc.name      testExtYuvFixed0002
     * @tc.desc      toFixed 12.999 digit 2 -> 12.99.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixed0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(12.999, 2)).assertEqual('12.99');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0004
     * @tc.name      testExtYuvClamp0003
     * @tc.desc      Clamp child 20x20 at 150,150.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClamp0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const child: Size = { width: 20, height: 20 };
      const parent: Size = { width: 100, height: 100 };
      const edges: Edges = getClampedChildPosition(child, parent, { x: 150, y: 150 });
      expect(edges.left).assertEqual(80.0);
      expect(edges.top).assertEqual(80.0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0005
     * @tc.name      testExtYuvLimit0004
     * @tc.desc      limitNumberInRange 5 in [-5, 5].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimit0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [-5, 5];
      expect(limitNumberInRange(5, range)).assertEqual(5);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0006
     * @tc.name      testExtYuvFind0005
     * @tc.desc      findRangeIndex 5 in [1, 2, 3].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFind0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [1, 2, 3];
      expect(findRangeIndex(5, arr)).assertEqual(2);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0007
     * @tc.name      testExtYuvFixed0006
     * @tc.desc      toFixed 9.97 digit 2 -> 9.97.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixed0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(9.97, 2)).assertEqual('9.97');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0008
     * @tc.name      testExtYuvClamp0007
     * @tc.desc      Clamp child 50x40 at 50,50.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClamp0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const child: Size = { width: 50, height: 40 };
      const parent: Size = { width: 200, height: 200 };
      const edges: Edges = getClampedChildPosition(child, parent, { x: 50, y: 50 });
      expect(edges.left).assertEqual(25.0);
      expect(edges.top).assertEqual(30.0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0009
     * @tc.name      testExtYuvLimit0008
     * @tc.desc      limitNumberInRange -10 in [5, 5].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimit0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [5, 5];
      expect(limitNumberInRange(-10, range)).assertEqual(5);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0010
     * @tc.name      testExtYuvFind0009
     * @tc.desc      findRangeIndex -1 in [1, 2, 3].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFind0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [1, 2, 3];
      expect(findRangeIndex(-1, arr)).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0011
     * @tc.name      testExtYuvFixed0010
     * @tc.desc      toFixed 3.14159 digit 2 -> 3.14.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixed0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(3.14159, 2)).assertEqual('3.14');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0012
     * @tc.name      testExtYuvClamp0011
     * @tc.desc      Clamp child 80x60 at 0,0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClamp0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const child: Size = { width: 80, height: 60 };
      const parent: Size = { width: 300, height: 300 };
      const edges: Edges = getClampedChildPosition(child, parent, { x: 0, y: 0 });
      expect(edges.left).assertEqual(0.0);
      expect(edges.top).assertEqual(0.0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0013
     * @tc.name      testExtYuvLimit0012
     * @tc.desc      limitNumberInRange 5 in [].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimit0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [];
      expect(limitNumberInRange(5, range)).assertEqual(5);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0014
     * @tc.name      testExtYuvFind0013
     * @tc.desc      findRangeIndex 4 in [1, 2, 3].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFind0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [1, 2, 3];
      expect(findRangeIndex(4, arr)).assertEqual(2);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0015
     * @tc.name      testExtYuvFixed0014
     * @tc.desc      toFixed 12.999 digit 2 -> 12.99.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixed0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(12.999, 2)).assertEqual('12.99');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0016
     * @tc.name      testExtYuvClamp0015
     * @tc.desc      Clamp child 20x20 at -10,-10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClamp0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const child: Size = { width: 20, height: 20 };
      const parent: Size = { width: 100, height: 100 };
      const edges: Edges = getClampedChildPosition(child, parent, { x: -10, y: -10 });
      expect(edges.left).assertEqual(0.0);
      expect(edges.top).assertEqual(0.0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0017
     * @tc.name      testExtYuvLimit0016
     * @tc.desc      limitNumberInRange -10 in [2, 8].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimit0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [2, 8];
      expect(limitNumberInRange(-10, range)).assertEqual(2);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0018
     * @tc.name      testExtYuvFind0017
     * @tc.desc      findRangeIndex 11 in [1, 2, 3].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFind0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [1, 2, 3];
      expect(findRangeIndex(11, arr)).assertEqual(2);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0019
     * @tc.name      testExtYuvFixed0018
     * @tc.desc      toFixed 9.97 digit 2 -> 9.97.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixed0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(9.97, 2)).assertEqual('9.97');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0020
     * @tc.name      testExtYuvClamp0019
     * @tc.desc      Clamp child 50x40 at 400,400.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClamp0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const child: Size = { width: 50, height: 40 };
      const parent: Size = { width: 200, height: 200 };
      const edges: Edges = getClampedChildPosition(child, parent, { x: 400, y: 400 });
      expect(edges.left).assertEqual(150.0);
      expect(edges.top).assertEqual(160.0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0021
     * @tc.name      testExtYuvLimit0020
     * @tc.desc      limitNumberInRange 5 in [0, 10].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimit0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [0, 10];
      expect(limitNumberInRange(5, range)).assertEqual(5);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0022
     * @tc.name      testExtYuvFind0021
     * @tc.desc      findRangeIndex 1 in [1, 2, 3].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFind0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [1, 2, 3];
      expect(findRangeIndex(1, arr)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0023
     * @tc.name      testExtYuvFixed0022
     * @tc.desc      toFixed 3.14159 digit 2 -> 3.14.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixed0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(3.14159, 2)).assertEqual('3.14');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0024
     * @tc.name      testExtYuvClamp0023
     * @tc.desc      Clamp child 80x60 at 150,150.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClamp0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const child: Size = { width: 80, height: 60 };
      const parent: Size = { width: 300, height: 300 };
      const edges: Edges = getClampedChildPosition(child, parent, { x: 150, y: 150 });
      expect(edges.left).assertEqual(110.0);
      expect(edges.top).assertEqual(120.0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0025
     * @tc.name      testExtYuvLimit0024
     * @tc.desc      limitNumberInRange -10 in [-5, 5].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimit0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [-5, 5];
      expect(limitNumberInRange(-10, range)).assertEqual(-5);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0026
     * @tc.name      testExtYuvFind0025
     * @tc.desc      findRangeIndex 10 in [1, 2, 3].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFind0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [1, 2, 3];
      expect(findRangeIndex(10, arr)).assertEqual(2);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0027
     * @tc.name      testExtYuvFixed0026
     * @tc.desc      toFixed 12.999 digit 2 -> 12.99.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixed0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(12.999, 2)).assertEqual('12.99');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0028
     * @tc.name      testExtYuvClamp0027
     * @tc.desc      Clamp child 20x20 at 50,50.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClamp0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const child: Size = { width: 20, height: 20 };
      const parent: Size = { width: 100, height: 100 };
      const edges: Edges = getClampedChildPosition(child, parent, { x: 50, y: 50 });
      expect(edges.left).assertEqual(40.0);
      expect(edges.top).assertEqual(40.0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0029
     * @tc.name      testExtYuvLimit0028
     * @tc.desc      limitNumberInRange 5 in [5, 5].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimit0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [5, 5];
      expect(limitNumberInRange(5, range)).assertEqual(5);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0030
     * @tc.name      testExtYuvFind0029
     * @tc.desc      findRangeIndex 0.5 in [1, 2, 3].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFind0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [1, 2, 3];
      expect(findRangeIndex(0.5, arr)).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0031
     * @tc.name      testExtYuvFixed0030
     * @tc.desc      toFixed 9.97 digit 2 -> 9.97.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixed0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(9.97, 2)).assertEqual('9.97');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0032
     * @tc.name      testExtYuvClamp0031
     * @tc.desc      Clamp child 50x40 at 0,0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClamp0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const child: Size = { width: 50, height: 40 };
      const parent: Size = { width: 200, height: 200 };
      const edges: Edges = getClampedChildPosition(child, parent, { x: 0, y: 0 });
      expect(edges.left).assertEqual(0.0);
      expect(edges.top).assertEqual(0.0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0033
     * @tc.name      testExtYuvLimit0032
     * @tc.desc      limitNumberInRange -10 in [].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimit0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [];
      expect(limitNumberInRange(-10, range)).assertEqual(-10);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0034
     * @tc.name      testExtYuvFind0033
     * @tc.desc      findRangeIndex 9 in [1, 2, 3].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFind0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [1, 2, 3];
      expect(findRangeIndex(9, arr)).assertEqual(2);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0035
     * @tc.name      testExtYuvFixed0034
     * @tc.desc      toFixed 3.14159 digit 2 -> 3.14.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixed0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(3.14159, 2)).assertEqual('3.14');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0036
     * @tc.name      testExtYuvClamp0035
     * @tc.desc      Clamp child 80x60 at -10,-10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClamp0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const child: Size = { width: 80, height: 60 };
      const parent: Size = { width: 300, height: 300 };
      const edges: Edges = getClampedChildPosition(child, parent, { x: -10, y: -10 });
      expect(edges.left).assertEqual(0.0);
      expect(edges.top).assertEqual(0.0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0037
     * @tc.name      testExtYuvLimit0036
     * @tc.desc      limitNumberInRange 5 in [2, 8].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimit0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [2, 8];
      expect(limitNumberInRange(5, range)).assertEqual(5);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0038
     * @tc.name      testExtYuvFind0037
     * @tc.desc      findRangeIndex 0 in [1, 2, 3].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFind0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [1, 2, 3];
      expect(findRangeIndex(0, arr)).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0039
     * @tc.name      testExtYuvFixed0038
     * @tc.desc      toFixed 12.999 digit 2 -> 12.99.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixed0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(12.999, 2)).assertEqual('12.99');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0040
     * @tc.name      testExtYuvClamp0039
     * @tc.desc      Clamp child 20x20 at 400,400.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClamp0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const child: Size = { width: 20, height: 20 };
      const parent: Size = { width: 100, height: 100 };
      const edges: Edges = getClampedChildPosition(child, parent, { x: 400, y: 400 });
      expect(edges.left).assertEqual(80.0);
      expect(edges.top).assertEqual(80.0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0041
     * @tc.name      testExtYuvLimit0040
     * @tc.desc      limitNumberInRange -10 in [0, 10].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimit0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [0, 10];
      expect(limitNumberInRange(-10, range)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0042
     * @tc.name      testExtYuvFind0041
     * @tc.desc      findRangeIndex 5 in [1, 2, 3].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFind0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [1, 2, 3];
      expect(findRangeIndex(5, arr)).assertEqual(2);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0043
     * @tc.name      testExtYuvFixed0042
     * @tc.desc      toFixed 9.97 digit 2 -> 9.97.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixed0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(9.97, 2)).assertEqual('9.97');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0044
     * @tc.name      testExtYuvClamp0043
     * @tc.desc      Clamp child 50x40 at 150,150.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClamp0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const child: Size = { width: 50, height: 40 };
      const parent: Size = { width: 200, height: 200 };
      const edges: Edges = getClampedChildPosition(child, parent, { x: 150, y: 150 });
      expect(edges.left).assertEqual(125.0);
      expect(edges.top).assertEqual(130.0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0045
     * @tc.name      testExtYuvLimit0044
     * @tc.desc      limitNumberInRange 5 in [-5, 5].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimit0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [-5, 5];
      expect(limitNumberInRange(5, range)).assertEqual(5);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0046
     * @tc.name      testExtYuvFind0045
     * @tc.desc      findRangeIndex -1 in [1, 2, 3].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFind0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [1, 2, 3];
      expect(findRangeIndex(-1, arr)).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0047
     * @tc.name      testExtYuvFixed0046
     * @tc.desc      toFixed 3.14159 digit 2 -> 3.14.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixed0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(3.14159, 2)).assertEqual('3.14');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0048
     * @tc.name      testExtYuvClamp0047
     * @tc.desc      Clamp child 80x60 at 50,50.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClamp0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const child: Size = { width: 80, height: 60 };
      const parent: Size = { width: 300, height: 300 };
      const edges: Edges = getClampedChildPosition(child, parent, { x: 50, y: 50 });
      expect(edges.left).assertEqual(10.0);
      expect(edges.top).assertEqual(20.0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0049
     * @tc.name      testExtYuvLimit0048
     * @tc.desc      limitNumberInRange -10 in [5, 5].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimit0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [5, 5];
      expect(limitNumberInRange(-10, range)).assertEqual(5);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0050
     * @tc.name      testExtYuvFind0049
     * @tc.desc      findRangeIndex 4 in [1, 2, 3].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFind0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [1, 2, 3];
      expect(findRangeIndex(4, arr)).assertEqual(2);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0051
     * @tc.name      testExtYuvFixed0050
     * @tc.desc      toFixed 12.999 digit 2 -> 12.99.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixed0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(12.999, 2)).assertEqual('12.99');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0052
     * @tc.name      testExtYuvClamp0051
     * @tc.desc      Clamp child 20x20 at 0,0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClamp0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const child: Size = { width: 20, height: 20 };
      const parent: Size = { width: 100, height: 100 };
      const edges: Edges = getClampedChildPosition(child, parent, { x: 0, y: 0 });
      expect(edges.left).assertEqual(0.0);
      expect(edges.top).assertEqual(0.0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0053
     * @tc.name      testExtYuvLimit0052
     * @tc.desc      limitNumberInRange 5 in [].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimit0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [];
      expect(limitNumberInRange(5, range)).assertEqual(5);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0054
     * @tc.name      testExtYuvFind0053
     * @tc.desc      findRangeIndex 11 in [1, 2, 3].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFind0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [1, 2, 3];
      expect(findRangeIndex(11, arr)).assertEqual(2);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0055
     * @tc.name      testExtYuvFixed0054
     * @tc.desc      toFixed 9.97 digit 2 -> 9.97.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixed0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(9.97, 2)).assertEqual('9.97');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0056
     * @tc.name      testExtYuvClamp0055
     * @tc.desc      Clamp child 50x40 at -10,-10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClamp0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const child: Size = { width: 50, height: 40 };
      const parent: Size = { width: 200, height: 200 };
      const edges: Edges = getClampedChildPosition(child, parent, { x: -10, y: -10 });
      expect(edges.left).assertEqual(0.0);
      expect(edges.top).assertEqual(0.0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0057
     * @tc.name      testExtYuvLimit0056
     * @tc.desc      limitNumberInRange -10 in [2, 8].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimit0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [2, 8];
      expect(limitNumberInRange(-10, range)).assertEqual(2);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0058
     * @tc.name      testExtYuvFind0057
     * @tc.desc      findRangeIndex 1 in [1, 2, 3].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFind0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [1, 2, 3];
      expect(findRangeIndex(1, arr)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0059
     * @tc.name      testExtYuvFixed0058
     * @tc.desc      toFixed 3.14159 digit 2 -> 3.14.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixed0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(3.14159, 2)).assertEqual('3.14');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0060
     * @tc.name      testExtYuvClamp0059
     * @tc.desc      Clamp child 80x60 at 400,400.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClamp0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const child: Size = { width: 80, height: 60 };
      const parent: Size = { width: 300, height: 300 };
      const edges: Edges = getClampedChildPosition(child, parent, { x: 400, y: 400 });
      expect(edges.left).assertEqual(220.0);
      expect(edges.top).assertEqual(240.0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0061
     * @tc.name      testExtYuvLimit0060
     * @tc.desc      limitNumberInRange 5 in [0, 10].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimit0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [0, 10];
      expect(limitNumberInRange(5, range)).assertEqual(5);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0062
     * @tc.name      testExtYuvFind0061
     * @tc.desc      findRangeIndex 10 in [1, 2, 3].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFind0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [1, 2, 3];
      expect(findRangeIndex(10, arr)).assertEqual(2);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0063
     * @tc.name      testExtYuvFixed0062
     * @tc.desc      toFixed 12.999 digit 2 -> 12.99.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixed0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(12.999, 2)).assertEqual('12.99');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0064
     * @tc.name      testExtYuvClamp0063
     * @tc.desc      Clamp child 20x20 at 150,150.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClamp0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const child: Size = { width: 20, height: 20 };
      const parent: Size = { width: 100, height: 100 };
      const edges: Edges = getClampedChildPosition(child, parent, { x: 150, y: 150 });
      expect(edges.left).assertEqual(80.0);
      expect(edges.top).assertEqual(80.0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0065
     * @tc.name      testExtYuvLimit0064
     * @tc.desc      limitNumberInRange -10 in [-5, 5].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimit0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [-5, 5];
      expect(limitNumberInRange(-10, range)).assertEqual(-5);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0066
     * @tc.name      testExtYuvFind0065
     * @tc.desc      findRangeIndex 0.5 in [1, 2, 3].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFind0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [1, 2, 3];
      expect(findRangeIndex(0.5, arr)).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0067
     * @tc.name      testExtYuvFixed0066
     * @tc.desc      toFixed 9.97 digit 2 -> 9.97.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixed0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(9.97, 2)).assertEqual('9.97');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0068
     * @tc.name      testExtYuvClamp0067
     * @tc.desc      Clamp child 50x40 at 50,50.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClamp0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const child: Size = { width: 50, height: 40 };
      const parent: Size = { width: 200, height: 200 };
      const edges: Edges = getClampedChildPosition(child, parent, { x: 50, y: 50 });
      expect(edges.left).assertEqual(25.0);
      expect(edges.top).assertEqual(30.0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0069
     * @tc.name      testExtYuvLimit0068
     * @tc.desc      limitNumberInRange 5 in [5, 5].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimit0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [5, 5];
      expect(limitNumberInRange(5, range)).assertEqual(5);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0070
     * @tc.name      testExtYuvFind0069
     * @tc.desc      findRangeIndex 9 in [1, 2, 3].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFind0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [1, 2, 3];
      expect(findRangeIndex(9, arr)).assertEqual(2);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0071
     * @tc.name      testExtYuvFixed0070
     * @tc.desc      toFixed 3.14159 digit 2 -> 3.14.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixed0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(3.14159, 2)).assertEqual('3.14');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0072
     * @tc.name      testExtYuvClamp0071
     * @tc.desc      Clamp child 80x60 at 0,0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClamp0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const child: Size = { width: 80, height: 60 };
      const parent: Size = { width: 300, height: 300 };
      const edges: Edges = getClampedChildPosition(child, parent, { x: 0, y: 0 });
      expect(edges.left).assertEqual(0.0);
      expect(edges.top).assertEqual(0.0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0073
     * @tc.name      testExtYuvLimit0072
     * @tc.desc      limitNumberInRange -10 in [].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimit0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [];
      expect(limitNumberInRange(-10, range)).assertEqual(-10);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0074
     * @tc.name      testExtYuvFind0073
     * @tc.desc      findRangeIndex 0 in [1, 2, 3].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFind0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [1, 2, 3];
      expect(findRangeIndex(0, arr)).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0075
     * @tc.name      testExtYuvFixed0074
     * @tc.desc      toFixed 12.999 digit 2 -> 12.99.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixed0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(12.999, 2)).assertEqual('12.99');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0076
     * @tc.name      testExtYuvClamp0075
     * @tc.desc      Clamp child 20x20 at -10,-10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClamp0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const child: Size = { width: 20, height: 20 };
      const parent: Size = { width: 100, height: 100 };
      const edges: Edges = getClampedChildPosition(child, parent, { x: -10, y: -10 });
      expect(edges.left).assertEqual(0.0);
      expect(edges.top).assertEqual(0.0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0077
     * @tc.name      testExtYuvLimit0076
     * @tc.desc      limitNumberInRange 5 in [2, 8].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimit0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [2, 8];
      expect(limitNumberInRange(5, range)).assertEqual(5);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0078
     * @tc.name      testExtYuvFind0077
     * @tc.desc      findRangeIndex 5 in [1, 2, 3].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFind0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [1, 2, 3];
      expect(findRangeIndex(5, arr)).assertEqual(2);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0079
     * @tc.name      testExtYuvFixed0078
     * @tc.desc      toFixed 9.97 digit 2 -> 9.97.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixed0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(9.97, 2)).assertEqual('9.97');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0080
     * @tc.name      testExtYuvClamp0079
     * @tc.desc      Clamp child 50x40 at 400,400.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClamp0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const child: Size = { width: 50, height: 40 };
      const parent: Size = { width: 200, height: 200 };
      const edges: Edges = getClampedChildPosition(child, parent, { x: 400, y: 400 });
      expect(edges.left).assertEqual(150.0);
      expect(edges.top).assertEqual(160.0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0081
     * @tc.name      testExtYuvLimit0080
     * @tc.desc      limitNumberInRange -10 in [0, 10].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimit0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [0, 10];
      expect(limitNumberInRange(-10, range)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0082
     * @tc.name      testExtYuvFind0081
     * @tc.desc      findRangeIndex -1 in [1, 2, 3].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFind0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [1, 2, 3];
      expect(findRangeIndex(-1, arr)).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0083
     * @tc.name      testExtYuvFixed0082
     * @tc.desc      toFixed 3.14159 digit 2 -> 3.14.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixed0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(3.14159, 2)).assertEqual('3.14');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0084
     * @tc.name      testExtYuvClamp0083
     * @tc.desc      Clamp child 80x60 at 150,150.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClamp0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const child: Size = { width: 80, height: 60 };
      const parent: Size = { width: 300, height: 300 };
      const edges: Edges = getClampedChildPosition(child, parent, { x: 150, y: 150 });
      expect(edges.left).assertEqual(110.0);
      expect(edges.top).assertEqual(120.0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0085
     * @tc.name      testExtYuvLimit0084
     * @tc.desc      limitNumberInRange 5 in [-5, 5].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimit0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [-5, 5];
      expect(limitNumberInRange(5, range)).assertEqual(5);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0086
     * @tc.name      testExtYuvFind0085
     * @tc.desc      findRangeIndex 4 in [1, 2, 3].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFind0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [1, 2, 3];
      expect(findRangeIndex(4, arr)).assertEqual(2);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0087
     * @tc.name      testExtYuvFixed0086
     * @tc.desc      toFixed 12.999 digit 2 -> 12.99.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixed0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(12.999, 2)).assertEqual('12.99');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0088
     * @tc.name      testExtYuvClamp0087
     * @tc.desc      Clamp child 20x20 at 50,50.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClamp0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const child: Size = { width: 20, height: 20 };
      const parent: Size = { width: 100, height: 100 };
      const edges: Edges = getClampedChildPosition(child, parent, { x: 50, y: 50 });
      expect(edges.left).assertEqual(40.0);
      expect(edges.top).assertEqual(40.0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0089
     * @tc.name      testExtYuvLimit0088
     * @tc.desc      limitNumberInRange -10 in [5, 5].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimit0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [5, 5];
      expect(limitNumberInRange(-10, range)).assertEqual(5);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0090
     * @tc.name      testExtYuvFind0089
     * @tc.desc      findRangeIndex 11 in [1, 2, 3].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFind0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [1, 2, 3];
      expect(findRangeIndex(11, arr)).assertEqual(2);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0091
     * @tc.name      testExtYuvFixed0090
     * @tc.desc      toFixed 9.97 digit 2 -> 9.97.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixed0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(9.97, 2)).assertEqual('9.97');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0092
     * @tc.name      testExtYuvClamp0091
     * @tc.desc      Clamp child 50x40 at 0,0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClamp0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const child: Size = { width: 50, height: 40 };
      const parent: Size = { width: 200, height: 200 };
      const edges: Edges = getClampedChildPosition(child, parent, { x: 0, y: 0 });
      expect(edges.left).assertEqual(0.0);
      expect(edges.top).assertEqual(0.0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0093
     * @tc.name      testExtYuvLimit0092
     * @tc.desc      limitNumberInRange 5 in [].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimit0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [];
      expect(limitNumberInRange(5, range)).assertEqual(5);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0094
     * @tc.name      testExtYuvFind0093
     * @tc.desc      findRangeIndex 1 in [1, 2, 3].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFind0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [1, 2, 3];
      expect(findRangeIndex(1, arr)).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0095
     * @tc.name      testExtYuvFixed0094
     * @tc.desc      toFixed 3.14159 digit 2 -> 3.14.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixed0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(3.14159, 2)).assertEqual('3.14');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0096
     * @tc.name      testExtYuvClamp0095
     * @tc.desc      Clamp child 80x60 at -10,-10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClamp0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const child: Size = { width: 80, height: 60 };
      const parent: Size = { width: 300, height: 300 };
      const edges: Edges = getClampedChildPosition(child, parent, { x: -10, y: -10 });
      expect(edges.left).assertEqual(0.0);
      expect(edges.top).assertEqual(0.0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0097
     * @tc.name      testExtYuvLimit0096
     * @tc.desc      limitNumberInRange -10 in [2, 8].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimit0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [2, 8];
      expect(limitNumberInRange(-10, range)).assertEqual(2);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0098
     * @tc.name      testExtYuvFind0097
     * @tc.desc      findRangeIndex 10 in [1, 2, 3].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFind0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [1, 2, 3];
      expect(findRangeIndex(10, arr)).assertEqual(2);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0099
     * @tc.name      testExtYuvFixed0098
     * @tc.desc      toFixed 12.999 digit 2 -> 12.99.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixed0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(12.999, 2)).assertEqual('12.99');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0100
     * @tc.name      testExtYuvClamp0099
     * @tc.desc      Clamp child 20x20 at 400,400.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClamp0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const child: Size = { width: 20, height: 20 };
      const parent: Size = { width: 100, height: 100 };
      const edges: Edges = getClampedChildPosition(child, parent, { x: 400, y: 400 });
      expect(edges.left).assertEqual(80.0);
      expect(edges.top).assertEqual(80.0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0101
     * @tc.name      testExtYuvLimit0100
     * @tc.desc      limitNumberInRange 5 in [0, 10].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimit0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [0, 10];
      expect(limitNumberInRange(5, range)).assertEqual(5);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0102
     * @tc.name      testExtYuvFind0101
     * @tc.desc      findRangeIndex 0.5 in [1, 2, 3].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFind0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [1, 2, 3];
      expect(findRangeIndex(0.5, arr)).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0103
     * @tc.name      testExtYuvFixed0102
     * @tc.desc      toFixed 9.97 digit 2 -> 9.97.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixed0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(9.97, 2)).assertEqual('9.97');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0104
     * @tc.name      testExtYuvClamp0103
     * @tc.desc      Clamp child 50x40 at 150,150.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClamp0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const child: Size = { width: 50, height: 40 };
      const parent: Size = { width: 200, height: 200 };
      const edges: Edges = getClampedChildPosition(child, parent, { x: 150, y: 150 });
      expect(edges.left).assertEqual(125.0);
      expect(edges.top).assertEqual(130.0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0105
     * @tc.name      testExtYuvLimit0104
     * @tc.desc      limitNumberInRange -10 in [-5, 5].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimit0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [-5, 5];
      expect(limitNumberInRange(-10, range)).assertEqual(-5);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0106
     * @tc.name      testExtYuvFind0105
     * @tc.desc      findRangeIndex 9 in [1, 2, 3].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFind0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [1, 2, 3];
      expect(findRangeIndex(9, arr)).assertEqual(2);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0107
     * @tc.name      testExtYuvFixed0106
     * @tc.desc      toFixed 3.14159 digit 2 -> 3.14.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixed0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(3.14159, 2)).assertEqual('3.14');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0108
     * @tc.name      testExtYuvClamp0107
     * @tc.desc      Clamp child 80x60 at 50,50.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClamp0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const child: Size = { width: 80, height: 60 };
      const parent: Size = { width: 300, height: 300 };
      const edges: Edges = getClampedChildPosition(child, parent, { x: 50, y: 50 });
      expect(edges.left).assertEqual(10.0);
      expect(edges.top).assertEqual(20.0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0109
     * @tc.name      testExtYuvLimit0108
     * @tc.desc      limitNumberInRange 5 in [5, 5].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimit0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [5, 5];
      expect(limitNumberInRange(5, range)).assertEqual(5);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0110
     * @tc.name      testExtYuvFind0109
     * @tc.desc      findRangeIndex 0 in [1, 2, 3].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFind0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [1, 2, 3];
      expect(findRangeIndex(0, arr)).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0111
     * @tc.name      testExtYuvFixed0110
     * @tc.desc      toFixed 12.999 digit 2 -> 12.99.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixed0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(12.999, 2)).assertEqual('12.99');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0112
     * @tc.name      testExtYuvClamp0111
     * @tc.desc      Clamp child 20x20 at 0,0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClamp0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const child: Size = { width: 20, height: 20 };
      const parent: Size = { width: 100, height: 100 };
      const edges: Edges = getClampedChildPosition(child, parent, { x: 0, y: 0 });
      expect(edges.left).assertEqual(0.0);
      expect(edges.top).assertEqual(0.0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0113
     * @tc.name      testExtYuvLimit0112
     * @tc.desc      limitNumberInRange -10 in [].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimit0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [];
      expect(limitNumberInRange(-10, range)).assertEqual(-10);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0114
     * @tc.name      testExtYuvFind0113
     * @tc.desc      findRangeIndex 5 in [1, 2, 3].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFind0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [1, 2, 3];
      expect(findRangeIndex(5, arr)).assertEqual(2);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0115
     * @tc.name      testExtYuvFixed0114
     * @tc.desc      toFixed 9.97 digit 2 -> 9.97.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixed0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(9.97, 2)).assertEqual('9.97');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0116
     * @tc.name      testExtYuvClamp0115
     * @tc.desc      Clamp child 50x40 at -10,-10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClamp0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const child: Size = { width: 50, height: 40 };
      const parent: Size = { width: 200, height: 200 };
      const edges: Edges = getClampedChildPosition(child, parent, { x: -10, y: -10 });
      expect(edges.left).assertEqual(0.0);
      expect(edges.top).assertEqual(0.0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0117
     * @tc.name      testExtYuvLimit0116
     * @tc.desc      limitNumberInRange 5 in [2, 8].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvLimit0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const range: number[] = [2, 8];
      expect(limitNumberInRange(5, range)).assertEqual(5);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0118
     * @tc.name      testExtYuvFind0117
     * @tc.desc      findRangeIndex -1 in [1, 2, 3].
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFind0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr: number[] = [1, 2, 3];
      expect(findRangeIndex(-1, arr)).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0119
     * @tc.name      testExtYuvFixed0118
     * @tc.desc      toFixed 3.14159 digit 2 -> 3.14.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvFixed0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(toFixed(3.14159, 2)).assertEqual('3.14');
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_COMMON_0120
     * @tc.name      testExtYuvClamp0119
     * @tc.desc      Clamp child 80x60 at 400,400.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvClamp0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const child: Size = { width: 80, height: 60 };
      const parent: Size = { width: 300, height: 300 };
      const edges: Edges = getClampedChildPosition(child, parent, { x: 400, y: 400 });
      expect(edges.left).assertEqual(220.0);
      expect(edges.top).assertEqual(240.0);
    })
  });
}
