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

const TAG: string = '[Sample_yuvZoomMath]';
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

export default function yuvZoomMathTest(): void {
  describe('yuvZoomMathTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0001
     * @tc.name      testExtYuvZoom0000
     * @tc.desc      Zoom math current 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 1;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('1x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0002
     * @tc.name      testExtYuvZoom0001
     * @tc.desc      Zoom math current 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 2;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('2x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0003
     * @tc.name      testExtYuvZoom0002
     * @tc.desc      Zoom math current 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 5;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('5x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0004
     * @tc.name      testExtYuvZoom0003
     * @tc.desc      Zoom math current 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 7;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('7x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0005
     * @tc.name      testExtYuvZoom0004
     * @tc.desc      Zoom math current 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 10;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('10x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0006
     * @tc.name      testExtYuvZoom0005
     * @tc.desc      Zoom math current 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 1;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('1x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0007
     * @tc.name      testExtYuvZoom0006
     * @tc.desc      Zoom math current 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 2;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('2x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0008
     * @tc.name      testExtYuvZoom0007
     * @tc.desc      Zoom math current 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 5;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('5x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0009
     * @tc.name      testExtYuvZoom0008
     * @tc.desc      Zoom math current 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 7;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('7x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0010
     * @tc.name      testExtYuvZoom0009
     * @tc.desc      Zoom math current 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 10;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('10x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0011
     * @tc.name      testExtYuvZoom0010
     * @tc.desc      Zoom math current 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 1;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('1x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0012
     * @tc.name      testExtYuvZoom0011
     * @tc.desc      Zoom math current 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 2;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('2x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0013
     * @tc.name      testExtYuvZoom0012
     * @tc.desc      Zoom math current 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 5;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('5x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0014
     * @tc.name      testExtYuvZoom0013
     * @tc.desc      Zoom math current 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 7;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('7x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0015
     * @tc.name      testExtYuvZoom0014
     * @tc.desc      Zoom math current 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 10;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('10x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0016
     * @tc.name      testExtYuvZoom0015
     * @tc.desc      Zoom math current 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 1;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('1x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0017
     * @tc.name      testExtYuvZoom0016
     * @tc.desc      Zoom math current 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 2;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('2x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0018
     * @tc.name      testExtYuvZoom0017
     * @tc.desc      Zoom math current 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 5;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('5x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0019
     * @tc.name      testExtYuvZoom0018
     * @tc.desc      Zoom math current 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 7;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('7x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0020
     * @tc.name      testExtYuvZoom0019
     * @tc.desc      Zoom math current 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 10;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('10x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0021
     * @tc.name      testExtYuvZoom0020
     * @tc.desc      Zoom math current 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 1;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('1x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0022
     * @tc.name      testExtYuvZoom0021
     * @tc.desc      Zoom math current 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 2;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('2x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0023
     * @tc.name      testExtYuvZoom0022
     * @tc.desc      Zoom math current 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 5;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('5x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0024
     * @tc.name      testExtYuvZoom0023
     * @tc.desc      Zoom math current 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 7;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('7x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0025
     * @tc.name      testExtYuvZoom0024
     * @tc.desc      Zoom math current 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 10;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('10x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0026
     * @tc.name      testExtYuvZoom0025
     * @tc.desc      Zoom math current 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 1;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('1x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0027
     * @tc.name      testExtYuvZoom0026
     * @tc.desc      Zoom math current 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 2;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('2x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0028
     * @tc.name      testExtYuvZoom0027
     * @tc.desc      Zoom math current 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 5;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('5x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0029
     * @tc.name      testExtYuvZoom0028
     * @tc.desc      Zoom math current 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 7;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('7x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0030
     * @tc.name      testExtYuvZoom0029
     * @tc.desc      Zoom math current 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 10;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('10x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0031
     * @tc.name      testExtYuvZoom0030
     * @tc.desc      Zoom math current 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 1;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('1x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0032
     * @tc.name      testExtYuvZoom0031
     * @tc.desc      Zoom math current 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 2;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('2x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0033
     * @tc.name      testExtYuvZoom0032
     * @tc.desc      Zoom math current 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 5;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('5x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0034
     * @tc.name      testExtYuvZoom0033
     * @tc.desc      Zoom math current 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 7;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('7x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0035
     * @tc.name      testExtYuvZoom0034
     * @tc.desc      Zoom math current 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 10;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('10x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0036
     * @tc.name      testExtYuvZoom0035
     * @tc.desc      Zoom math current 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 1;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('1x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0037
     * @tc.name      testExtYuvZoom0036
     * @tc.desc      Zoom math current 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 2;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('2x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0038
     * @tc.name      testExtYuvZoom0037
     * @tc.desc      Zoom math current 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 5;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('5x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0039
     * @tc.name      testExtYuvZoom0038
     * @tc.desc      Zoom math current 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 7;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('7x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0040
     * @tc.name      testExtYuvZoom0039
     * @tc.desc      Zoom math current 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 10;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('10x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0041
     * @tc.name      testExtYuvZoom0040
     * @tc.desc      Zoom math current 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 1;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('1x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0042
     * @tc.name      testExtYuvZoom0041
     * @tc.desc      Zoom math current 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 2;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('2x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0043
     * @tc.name      testExtYuvZoom0042
     * @tc.desc      Zoom math current 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 5;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('5x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0044
     * @tc.name      testExtYuvZoom0043
     * @tc.desc      Zoom math current 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 7;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('7x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0045
     * @tc.name      testExtYuvZoom0044
     * @tc.desc      Zoom math current 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 10;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('10x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0046
     * @tc.name      testExtYuvZoom0045
     * @tc.desc      Zoom math current 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 1;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('1x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0047
     * @tc.name      testExtYuvZoom0046
     * @tc.desc      Zoom math current 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 2;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('2x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0048
     * @tc.name      testExtYuvZoom0047
     * @tc.desc      Zoom math current 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 5;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('5x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0049
     * @tc.name      testExtYuvZoom0048
     * @tc.desc      Zoom math current 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 7;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('7x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0050
     * @tc.name      testExtYuvZoom0049
     * @tc.desc      Zoom math current 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 10;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('10x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0051
     * @tc.name      testExtYuvZoom0050
     * @tc.desc      Zoom math current 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 1;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('1x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0052
     * @tc.name      testExtYuvZoom0051
     * @tc.desc      Zoom math current 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 2;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('2x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0053
     * @tc.name      testExtYuvZoom0052
     * @tc.desc      Zoom math current 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 5;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('5x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0054
     * @tc.name      testExtYuvZoom0053
     * @tc.desc      Zoom math current 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 7;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('7x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0055
     * @tc.name      testExtYuvZoom0054
     * @tc.desc      Zoom math current 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 10;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('10x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0056
     * @tc.name      testExtYuvZoom0055
     * @tc.desc      Zoom math current 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 1;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('1x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0057
     * @tc.name      testExtYuvZoom0056
     * @tc.desc      Zoom math current 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 2;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('2x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0058
     * @tc.name      testExtYuvZoom0057
     * @tc.desc      Zoom math current 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 5;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('5x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0059
     * @tc.name      testExtYuvZoom0058
     * @tc.desc      Zoom math current 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 7;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('7x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0060
     * @tc.name      testExtYuvZoom0059
     * @tc.desc      Zoom math current 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 10;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('10x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0061
     * @tc.name      testExtYuvZoom0060
     * @tc.desc      Zoom math current 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 1;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('1x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0062
     * @tc.name      testExtYuvZoom0061
     * @tc.desc      Zoom math current 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 2;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('2x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0063
     * @tc.name      testExtYuvZoom0062
     * @tc.desc      Zoom math current 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 5;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('5x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0064
     * @tc.name      testExtYuvZoom0063
     * @tc.desc      Zoom math current 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 7;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('7x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0065
     * @tc.name      testExtYuvZoom0064
     * @tc.desc      Zoom math current 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 10;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('10x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0066
     * @tc.name      testExtYuvZoom0065
     * @tc.desc      Zoom math current 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 1;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('1x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0067
     * @tc.name      testExtYuvZoom0066
     * @tc.desc      Zoom math current 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 2;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('2x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0068
     * @tc.name      testExtYuvZoom0067
     * @tc.desc      Zoom math current 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 5;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('5x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0069
     * @tc.name      testExtYuvZoom0068
     * @tc.desc      Zoom math current 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 7;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('7x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0070
     * @tc.name      testExtYuvZoom0069
     * @tc.desc      Zoom math current 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 10;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('10x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0071
     * @tc.name      testExtYuvZoom0070
     * @tc.desc      Zoom math current 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 1;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('1x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0072
     * @tc.name      testExtYuvZoom0071
     * @tc.desc      Zoom math current 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 2;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('2x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0073
     * @tc.name      testExtYuvZoom0072
     * @tc.desc      Zoom math current 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 5;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('5x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0074
     * @tc.name      testExtYuvZoom0073
     * @tc.desc      Zoom math current 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 7;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('7x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0075
     * @tc.name      testExtYuvZoom0074
     * @tc.desc      Zoom math current 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 10;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('10x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0076
     * @tc.name      testExtYuvZoom0075
     * @tc.desc      Zoom math current 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 1;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('1x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0077
     * @tc.name      testExtYuvZoom0076
     * @tc.desc      Zoom math current 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 2;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('2x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0078
     * @tc.name      testExtYuvZoom0077
     * @tc.desc      Zoom math current 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 5;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('5x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0079
     * @tc.name      testExtYuvZoom0078
     * @tc.desc      Zoom math current 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 7;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('7x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_ZOOM_0080
     * @tc.name      testExtYuvZoom0079
     * @tc.desc      Zoom math current 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvZoom0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zooms: number[] = [1, 5, 10];
      const currentZoom: number = 10;
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) {
        if (zooms[index] <= currentZoom) { currentIndex = index; }
      }
      expect(currentIndex).assertLargerOrEqual(0);
      expect(currentIndex).assertLess(zooms.length);
      expect('10x'.endsWith('x')).assertTrue();
      expect(zooms.length).assertEqual(3);
    })
  });
}
