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

const TAG: string = '[Sample_yuvGridLineMath]';
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

export default function yuvGridLineMathTest(): void {
  describe('yuvGridLineMathTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0001
     * @tc.name      testExtYuvGrid0000
     * @tc.desc      Grid 1x1 on 100x100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 1;
      const rows: number = 1;
      const width: number = 100;
      const height: number = 100;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(0);
      expect(ys.length).assertEqual(0);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0002
     * @tc.name      testExtYuvGrid0001
     * @tc.desc      Grid 2x1 on 300x200.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 2;
      const rows: number = 1;
      const width: number = 300;
      const height: number = 200;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(1);
      expect(ys.length).assertEqual(0);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0003
     * @tc.name      testExtYuvGrid0002
     * @tc.desc      Grid 3x2 on 720x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 3;
      const rows: number = 2;
      const width: number = 720;
      const height: number = 480;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(2);
      expect(ys.length).assertEqual(1);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0004
     * @tc.name      testExtYuvGrid0003
     * @tc.desc      Grid 4x2 on 1080x1920.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 4;
      const rows: number = 2;
      const width: number = 1080;
      const height: number = 1920;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(3);
      expect(ys.length).assertEqual(1);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0005
     * @tc.name      testExtYuvGrid0004
     * @tc.desc      Grid 5x3 on 100x100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 5;
      const rows: number = 3;
      const width: number = 100;
      const height: number = 100;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(4);
      expect(ys.length).assertEqual(2);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0006
     * @tc.name      testExtYuvGrid0005
     * @tc.desc      Grid 6x3 on 300x200.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 6;
      const rows: number = 3;
      const width: number = 300;
      const height: number = 200;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(5);
      expect(ys.length).assertEqual(2);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0007
     * @tc.name      testExtYuvGrid0006
     * @tc.desc      Grid 7x4 on 720x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 7;
      const rows: number = 4;
      const width: number = 720;
      const height: number = 480;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(6);
      expect(ys.length).assertEqual(3);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0008
     * @tc.name      testExtYuvGrid0007
     * @tc.desc      Grid 8x4 on 1080x1920.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 8;
      const rows: number = 4;
      const width: number = 1080;
      const height: number = 1920;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(7);
      expect(ys.length).assertEqual(3);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0009
     * @tc.name      testExtYuvGrid0008
     * @tc.desc      Grid 1x5 on 100x100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 1;
      const rows: number = 5;
      const width: number = 100;
      const height: number = 100;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(0);
      expect(ys.length).assertEqual(4);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0010
     * @tc.name      testExtYuvGrid0009
     * @tc.desc      Grid 2x5 on 300x200.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 2;
      const rows: number = 5;
      const width: number = 300;
      const height: number = 200;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(1);
      expect(ys.length).assertEqual(4);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0011
     * @tc.name      testExtYuvGrid0010
     * @tc.desc      Grid 3x6 on 720x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 3;
      const rows: number = 6;
      const width: number = 720;
      const height: number = 480;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(2);
      expect(ys.length).assertEqual(5);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0012
     * @tc.name      testExtYuvGrid0011
     * @tc.desc      Grid 4x6 on 1080x1920.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 4;
      const rows: number = 6;
      const width: number = 1080;
      const height: number = 1920;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(3);
      expect(ys.length).assertEqual(5);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0013
     * @tc.name      testExtYuvGrid0012
     * @tc.desc      Grid 5x7 on 100x100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 5;
      const rows: number = 7;
      const width: number = 100;
      const height: number = 100;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(4);
      expect(ys.length).assertEqual(6);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0014
     * @tc.name      testExtYuvGrid0013
     * @tc.desc      Grid 6x7 on 300x200.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 6;
      const rows: number = 7;
      const width: number = 300;
      const height: number = 200;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(5);
      expect(ys.length).assertEqual(6);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0015
     * @tc.name      testExtYuvGrid0014
     * @tc.desc      Grid 7x8 on 720x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 7;
      const rows: number = 8;
      const width: number = 720;
      const height: number = 480;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(6);
      expect(ys.length).assertEqual(7);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0016
     * @tc.name      testExtYuvGrid0015
     * @tc.desc      Grid 8x8 on 1080x1920.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 8;
      const rows: number = 8;
      const width: number = 1080;
      const height: number = 1920;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(7);
      expect(ys.length).assertEqual(7);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0017
     * @tc.name      testExtYuvGrid0016
     * @tc.desc      Grid 1x1 on 100x100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 1;
      const rows: number = 1;
      const width: number = 100;
      const height: number = 100;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(0);
      expect(ys.length).assertEqual(0);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0018
     * @tc.name      testExtYuvGrid0017
     * @tc.desc      Grid 2x1 on 300x200.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 2;
      const rows: number = 1;
      const width: number = 300;
      const height: number = 200;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(1);
      expect(ys.length).assertEqual(0);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0019
     * @tc.name      testExtYuvGrid0018
     * @tc.desc      Grid 3x2 on 720x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 3;
      const rows: number = 2;
      const width: number = 720;
      const height: number = 480;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(2);
      expect(ys.length).assertEqual(1);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0020
     * @tc.name      testExtYuvGrid0019
     * @tc.desc      Grid 4x2 on 1080x1920.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 4;
      const rows: number = 2;
      const width: number = 1080;
      const height: number = 1920;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(3);
      expect(ys.length).assertEqual(1);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0021
     * @tc.name      testExtYuvGrid0020
     * @tc.desc      Grid 5x3 on 100x100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 5;
      const rows: number = 3;
      const width: number = 100;
      const height: number = 100;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(4);
      expect(ys.length).assertEqual(2);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0022
     * @tc.name      testExtYuvGrid0021
     * @tc.desc      Grid 6x3 on 300x200.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 6;
      const rows: number = 3;
      const width: number = 300;
      const height: number = 200;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(5);
      expect(ys.length).assertEqual(2);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0023
     * @tc.name      testExtYuvGrid0022
     * @tc.desc      Grid 7x4 on 720x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 7;
      const rows: number = 4;
      const width: number = 720;
      const height: number = 480;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(6);
      expect(ys.length).assertEqual(3);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0024
     * @tc.name      testExtYuvGrid0023
     * @tc.desc      Grid 8x4 on 1080x1920.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 8;
      const rows: number = 4;
      const width: number = 1080;
      const height: number = 1920;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(7);
      expect(ys.length).assertEqual(3);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0025
     * @tc.name      testExtYuvGrid0024
     * @tc.desc      Grid 1x5 on 100x100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 1;
      const rows: number = 5;
      const width: number = 100;
      const height: number = 100;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(0);
      expect(ys.length).assertEqual(4);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0026
     * @tc.name      testExtYuvGrid0025
     * @tc.desc      Grid 2x5 on 300x200.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 2;
      const rows: number = 5;
      const width: number = 300;
      const height: number = 200;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(1);
      expect(ys.length).assertEqual(4);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0027
     * @tc.name      testExtYuvGrid0026
     * @tc.desc      Grid 3x6 on 720x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 3;
      const rows: number = 6;
      const width: number = 720;
      const height: number = 480;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(2);
      expect(ys.length).assertEqual(5);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0028
     * @tc.name      testExtYuvGrid0027
     * @tc.desc      Grid 4x6 on 1080x1920.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 4;
      const rows: number = 6;
      const width: number = 1080;
      const height: number = 1920;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(3);
      expect(ys.length).assertEqual(5);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0029
     * @tc.name      testExtYuvGrid0028
     * @tc.desc      Grid 5x7 on 100x100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 5;
      const rows: number = 7;
      const width: number = 100;
      const height: number = 100;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(4);
      expect(ys.length).assertEqual(6);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0030
     * @tc.name      testExtYuvGrid0029
     * @tc.desc      Grid 6x7 on 300x200.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 6;
      const rows: number = 7;
      const width: number = 300;
      const height: number = 200;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(5);
      expect(ys.length).assertEqual(6);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0031
     * @tc.name      testExtYuvGrid0030
     * @tc.desc      Grid 7x8 on 720x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 7;
      const rows: number = 8;
      const width: number = 720;
      const height: number = 480;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(6);
      expect(ys.length).assertEqual(7);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0032
     * @tc.name      testExtYuvGrid0031
     * @tc.desc      Grid 8x8 on 1080x1920.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 8;
      const rows: number = 8;
      const width: number = 1080;
      const height: number = 1920;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(7);
      expect(ys.length).assertEqual(7);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0033
     * @tc.name      testExtYuvGrid0032
     * @tc.desc      Grid 1x1 on 100x100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 1;
      const rows: number = 1;
      const width: number = 100;
      const height: number = 100;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(0);
      expect(ys.length).assertEqual(0);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0034
     * @tc.name      testExtYuvGrid0033
     * @tc.desc      Grid 2x1 on 300x200.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 2;
      const rows: number = 1;
      const width: number = 300;
      const height: number = 200;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(1);
      expect(ys.length).assertEqual(0);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0035
     * @tc.name      testExtYuvGrid0034
     * @tc.desc      Grid 3x2 on 720x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 3;
      const rows: number = 2;
      const width: number = 720;
      const height: number = 480;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(2);
      expect(ys.length).assertEqual(1);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0036
     * @tc.name      testExtYuvGrid0035
     * @tc.desc      Grid 4x2 on 1080x1920.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 4;
      const rows: number = 2;
      const width: number = 1080;
      const height: number = 1920;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(3);
      expect(ys.length).assertEqual(1);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0037
     * @tc.name      testExtYuvGrid0036
     * @tc.desc      Grid 5x3 on 100x100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 5;
      const rows: number = 3;
      const width: number = 100;
      const height: number = 100;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(4);
      expect(ys.length).assertEqual(2);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0038
     * @tc.name      testExtYuvGrid0037
     * @tc.desc      Grid 6x3 on 300x200.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 6;
      const rows: number = 3;
      const width: number = 300;
      const height: number = 200;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(5);
      expect(ys.length).assertEqual(2);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0039
     * @tc.name      testExtYuvGrid0038
     * @tc.desc      Grid 7x4 on 720x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 7;
      const rows: number = 4;
      const width: number = 720;
      const height: number = 480;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(6);
      expect(ys.length).assertEqual(3);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0040
     * @tc.name      testExtYuvGrid0039
     * @tc.desc      Grid 8x4 on 1080x1920.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 8;
      const rows: number = 4;
      const width: number = 1080;
      const height: number = 1920;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(7);
      expect(ys.length).assertEqual(3);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0041
     * @tc.name      testExtYuvGrid0040
     * @tc.desc      Grid 1x5 on 100x100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 1;
      const rows: number = 5;
      const width: number = 100;
      const height: number = 100;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(0);
      expect(ys.length).assertEqual(4);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0042
     * @tc.name      testExtYuvGrid0041
     * @tc.desc      Grid 2x5 on 300x200.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 2;
      const rows: number = 5;
      const width: number = 300;
      const height: number = 200;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(1);
      expect(ys.length).assertEqual(4);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0043
     * @tc.name      testExtYuvGrid0042
     * @tc.desc      Grid 3x6 on 720x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 3;
      const rows: number = 6;
      const width: number = 720;
      const height: number = 480;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(2);
      expect(ys.length).assertEqual(5);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0044
     * @tc.name      testExtYuvGrid0043
     * @tc.desc      Grid 4x6 on 1080x1920.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 4;
      const rows: number = 6;
      const width: number = 1080;
      const height: number = 1920;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(3);
      expect(ys.length).assertEqual(5);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0045
     * @tc.name      testExtYuvGrid0044
     * @tc.desc      Grid 5x7 on 100x100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 5;
      const rows: number = 7;
      const width: number = 100;
      const height: number = 100;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(4);
      expect(ys.length).assertEqual(6);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0046
     * @tc.name      testExtYuvGrid0045
     * @tc.desc      Grid 6x7 on 300x200.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 6;
      const rows: number = 7;
      const width: number = 300;
      const height: number = 200;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(5);
      expect(ys.length).assertEqual(6);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0047
     * @tc.name      testExtYuvGrid0046
     * @tc.desc      Grid 7x8 on 720x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 7;
      const rows: number = 8;
      const width: number = 720;
      const height: number = 480;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(6);
      expect(ys.length).assertEqual(7);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0048
     * @tc.name      testExtYuvGrid0047
     * @tc.desc      Grid 8x8 on 1080x1920.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 8;
      const rows: number = 8;
      const width: number = 1080;
      const height: number = 1920;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(7);
      expect(ys.length).assertEqual(7);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0049
     * @tc.name      testExtYuvGrid0048
     * @tc.desc      Grid 1x1 on 100x100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 1;
      const rows: number = 1;
      const width: number = 100;
      const height: number = 100;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(0);
      expect(ys.length).assertEqual(0);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0050
     * @tc.name      testExtYuvGrid0049
     * @tc.desc      Grid 2x1 on 300x200.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 2;
      const rows: number = 1;
      const width: number = 300;
      const height: number = 200;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(1);
      expect(ys.length).assertEqual(0);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0051
     * @tc.name      testExtYuvGrid0050
     * @tc.desc      Grid 3x2 on 720x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 3;
      const rows: number = 2;
      const width: number = 720;
      const height: number = 480;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(2);
      expect(ys.length).assertEqual(1);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0052
     * @tc.name      testExtYuvGrid0051
     * @tc.desc      Grid 4x2 on 1080x1920.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 4;
      const rows: number = 2;
      const width: number = 1080;
      const height: number = 1920;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(3);
      expect(ys.length).assertEqual(1);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0053
     * @tc.name      testExtYuvGrid0052
     * @tc.desc      Grid 5x3 on 100x100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 5;
      const rows: number = 3;
      const width: number = 100;
      const height: number = 100;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(4);
      expect(ys.length).assertEqual(2);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0054
     * @tc.name      testExtYuvGrid0053
     * @tc.desc      Grid 6x3 on 300x200.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 6;
      const rows: number = 3;
      const width: number = 300;
      const height: number = 200;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(5);
      expect(ys.length).assertEqual(2);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0055
     * @tc.name      testExtYuvGrid0054
     * @tc.desc      Grid 7x4 on 720x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 7;
      const rows: number = 4;
      const width: number = 720;
      const height: number = 480;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(6);
      expect(ys.length).assertEqual(3);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0056
     * @tc.name      testExtYuvGrid0055
     * @tc.desc      Grid 8x4 on 1080x1920.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 8;
      const rows: number = 4;
      const width: number = 1080;
      const height: number = 1920;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(7);
      expect(ys.length).assertEqual(3);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0057
     * @tc.name      testExtYuvGrid0056
     * @tc.desc      Grid 1x5 on 100x100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 1;
      const rows: number = 5;
      const width: number = 100;
      const height: number = 100;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(0);
      expect(ys.length).assertEqual(4);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0058
     * @tc.name      testExtYuvGrid0057
     * @tc.desc      Grid 2x5 on 300x200.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 2;
      const rows: number = 5;
      const width: number = 300;
      const height: number = 200;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(1);
      expect(ys.length).assertEqual(4);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0059
     * @tc.name      testExtYuvGrid0058
     * @tc.desc      Grid 3x6 on 720x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 3;
      const rows: number = 6;
      const width: number = 720;
      const height: number = 480;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(2);
      expect(ys.length).assertEqual(5);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0060
     * @tc.name      testExtYuvGrid0059
     * @tc.desc      Grid 4x6 on 1080x1920.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 4;
      const rows: number = 6;
      const width: number = 1080;
      const height: number = 1920;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(3);
      expect(ys.length).assertEqual(5);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0061
     * @tc.name      testExtYuvGrid0060
     * @tc.desc      Grid 5x7 on 100x100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 5;
      const rows: number = 7;
      const width: number = 100;
      const height: number = 100;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(4);
      expect(ys.length).assertEqual(6);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0062
     * @tc.name      testExtYuvGrid0061
     * @tc.desc      Grid 6x7 on 300x200.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 6;
      const rows: number = 7;
      const width: number = 300;
      const height: number = 200;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(5);
      expect(ys.length).assertEqual(6);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0063
     * @tc.name      testExtYuvGrid0062
     * @tc.desc      Grid 7x8 on 720x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 7;
      const rows: number = 8;
      const width: number = 720;
      const height: number = 480;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(6);
      expect(ys.length).assertEqual(7);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0064
     * @tc.name      testExtYuvGrid0063
     * @tc.desc      Grid 8x8 on 1080x1920.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 8;
      const rows: number = 8;
      const width: number = 1080;
      const height: number = 1920;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(7);
      expect(ys.length).assertEqual(7);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0065
     * @tc.name      testExtYuvGrid0064
     * @tc.desc      Grid 1x1 on 100x100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 1;
      const rows: number = 1;
      const width: number = 100;
      const height: number = 100;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(0);
      expect(ys.length).assertEqual(0);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0066
     * @tc.name      testExtYuvGrid0065
     * @tc.desc      Grid 2x1 on 300x200.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 2;
      const rows: number = 1;
      const width: number = 300;
      const height: number = 200;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(1);
      expect(ys.length).assertEqual(0);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0067
     * @tc.name      testExtYuvGrid0066
     * @tc.desc      Grid 3x2 on 720x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 3;
      const rows: number = 2;
      const width: number = 720;
      const height: number = 480;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(2);
      expect(ys.length).assertEqual(1);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0068
     * @tc.name      testExtYuvGrid0067
     * @tc.desc      Grid 4x2 on 1080x1920.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 4;
      const rows: number = 2;
      const width: number = 1080;
      const height: number = 1920;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(3);
      expect(ys.length).assertEqual(1);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0069
     * @tc.name      testExtYuvGrid0068
     * @tc.desc      Grid 5x3 on 100x100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 5;
      const rows: number = 3;
      const width: number = 100;
      const height: number = 100;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(4);
      expect(ys.length).assertEqual(2);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0070
     * @tc.name      testExtYuvGrid0069
     * @tc.desc      Grid 6x3 on 300x200.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 6;
      const rows: number = 3;
      const width: number = 300;
      const height: number = 200;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(5);
      expect(ys.length).assertEqual(2);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0071
     * @tc.name      testExtYuvGrid0070
     * @tc.desc      Grid 7x4 on 720x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 7;
      const rows: number = 4;
      const width: number = 720;
      const height: number = 480;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(6);
      expect(ys.length).assertEqual(3);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0072
     * @tc.name      testExtYuvGrid0071
     * @tc.desc      Grid 8x4 on 1080x1920.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 8;
      const rows: number = 4;
      const width: number = 1080;
      const height: number = 1920;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(7);
      expect(ys.length).assertEqual(3);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0073
     * @tc.name      testExtYuvGrid0072
     * @tc.desc      Grid 1x5 on 100x100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 1;
      const rows: number = 5;
      const width: number = 100;
      const height: number = 100;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(0);
      expect(ys.length).assertEqual(4);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0074
     * @tc.name      testExtYuvGrid0073
     * @tc.desc      Grid 2x5 on 300x200.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 2;
      const rows: number = 5;
      const width: number = 300;
      const height: number = 200;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(1);
      expect(ys.length).assertEqual(4);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0075
     * @tc.name      testExtYuvGrid0074
     * @tc.desc      Grid 3x6 on 720x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 3;
      const rows: number = 6;
      const width: number = 720;
      const height: number = 480;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(2);
      expect(ys.length).assertEqual(5);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0076
     * @tc.name      testExtYuvGrid0075
     * @tc.desc      Grid 4x6 on 1080x1920.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 4;
      const rows: number = 6;
      const width: number = 1080;
      const height: number = 1920;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(3);
      expect(ys.length).assertEqual(5);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0077
     * @tc.name      testExtYuvGrid0076
     * @tc.desc      Grid 5x7 on 100x100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 5;
      const rows: number = 7;
      const width: number = 100;
      const height: number = 100;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(4);
      expect(ys.length).assertEqual(6);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0078
     * @tc.name      testExtYuvGrid0077
     * @tc.desc      Grid 6x7 on 300x200.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 6;
      const rows: number = 7;
      const width: number = 300;
      const height: number = 200;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(5);
      expect(ys.length).assertEqual(6);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0079
     * @tc.name      testExtYuvGrid0078
     * @tc.desc      Grid 7x8 on 720x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 7;
      const rows: number = 8;
      const width: number = 720;
      const height: number = 480;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(6);
      expect(ys.length).assertEqual(7);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRID_0080
     * @tc.name      testExtYuvGrid0079
     * @tc.desc      Grid 8x8 on 1080x1920.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGrid0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const cols: number = 8;
      const rows: number = 8;
      const width: number = 1080;
      const height: number = 1920;
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < cols; index++) { xs.push((width / cols) * index); }
      for (let index: number = 1; index < rows; index++) { ys.push((height / rows) * index); }
      expect(xs.length).assertEqual(7);
      expect(ys.length).assertEqual(7);
      expect(cols).assertLarger(0);
      expect(rows).assertLarger(0);
    })
  });
}
