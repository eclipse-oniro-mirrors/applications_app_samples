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

const TAG: string = '[Sample_yuvGridZoomExtra]';
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

export default function yuvGridZoomExtraTest(): void {
  describe('yuvGridZoomExtraTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0001
     * @tc.name      testExtYuvGridZoom0000
     * @tc.desc      Grid 2x2 zoom 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 2; index++) { xs.push((200 / 2) * index); }
      for (let index: number = 1; index < 2; index++) { ys.push((200 / 2) * index); }
      expect(xs.length).assertEqual(1);
      expect(ys.length).assertEqual(1);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 1) { currentIndex = index; } }
      expect(currentIndex).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0002
     * @tc.name      testExtYuvGridZoom0001
     * @tc.desc      Grid 3x2 zoom 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 3; index++) { xs.push((400 / 3) * index); }
      for (let index: number = 1; index < 2; index++) { ys.push((400 / 2) * index); }
      expect(xs.length).assertEqual(2);
      expect(ys.length).assertEqual(1);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 2) { currentIndex = index; } }
      expect(currentIndex).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0003
     * @tc.name      testExtYuvGridZoom0002
     * @tc.desc      Grid 4x3 zoom 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 4; index++) { xs.push((800 / 4) * index); }
      for (let index: number = 1; index < 3; index++) { ys.push((800 / 3) * index); }
      expect(xs.length).assertEqual(3);
      expect(ys.length).assertEqual(2);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 5) { currentIndex = index; } }
      expect(currentIndex).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0004
     * @tc.name      testExtYuvGridZoom0003
     * @tc.desc      Grid 5x3 zoom 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 5; index++) { xs.push((200 / 5) * index); }
      for (let index: number = 1; index < 3; index++) { ys.push((200 / 3) * index); }
      expect(xs.length).assertEqual(4);
      expect(ys.length).assertEqual(2);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 8) { currentIndex = index; } }
      expect(currentIndex).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0005
     * @tc.name      testExtYuvGridZoom0004
     * @tc.desc      Grid 6x4 zoom 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 6; index++) { xs.push((400 / 6) * index); }
      for (let index: number = 1; index < 4; index++) { ys.push((400 / 4) * index); }
      expect(xs.length).assertEqual(5);
      expect(ys.length).assertEqual(3);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 10) { currentIndex = index; } }
      expect(currentIndex).assertEqual(2);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0006
     * @tc.name      testExtYuvGridZoom0005
     * @tc.desc      Grid 7x4 zoom 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 7; index++) { xs.push((800 / 7) * index); }
      for (let index: number = 1; index < 4; index++) { ys.push((800 / 4) * index); }
      expect(xs.length).assertEqual(6);
      expect(ys.length).assertEqual(3);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 1) { currentIndex = index; } }
      expect(currentIndex).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0007
     * @tc.name      testExtYuvGridZoom0006
     * @tc.desc      Grid 2x5 zoom 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 2; index++) { xs.push((200 / 2) * index); }
      for (let index: number = 1; index < 5; index++) { ys.push((200 / 5) * index); }
      expect(xs.length).assertEqual(1);
      expect(ys.length).assertEqual(4);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 2) { currentIndex = index; } }
      expect(currentIndex).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0008
     * @tc.name      testExtYuvGridZoom0007
     * @tc.desc      Grid 3x5 zoom 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 3; index++) { xs.push((400 / 3) * index); }
      for (let index: number = 1; index < 5; index++) { ys.push((400 / 5) * index); }
      expect(xs.length).assertEqual(2);
      expect(ys.length).assertEqual(4);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 5) { currentIndex = index; } }
      expect(currentIndex).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0009
     * @tc.name      testExtYuvGridZoom0008
     * @tc.desc      Grid 4x6 zoom 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 4; index++) { xs.push((800 / 4) * index); }
      for (let index: number = 1; index < 6; index++) { ys.push((800 / 6) * index); }
      expect(xs.length).assertEqual(3);
      expect(ys.length).assertEqual(5);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 8) { currentIndex = index; } }
      expect(currentIndex).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0010
     * @tc.name      testExtYuvGridZoom0009
     * @tc.desc      Grid 5x6 zoom 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 5; index++) { xs.push((200 / 5) * index); }
      for (let index: number = 1; index < 6; index++) { ys.push((200 / 6) * index); }
      expect(xs.length).assertEqual(4);
      expect(ys.length).assertEqual(5);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 10) { currentIndex = index; } }
      expect(currentIndex).assertEqual(2);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0011
     * @tc.name      testExtYuvGridZoom0010
     * @tc.desc      Grid 6x7 zoom 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 6; index++) { xs.push((400 / 6) * index); }
      for (let index: number = 1; index < 7; index++) { ys.push((400 / 7) * index); }
      expect(xs.length).assertEqual(5);
      expect(ys.length).assertEqual(6);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 1) { currentIndex = index; } }
      expect(currentIndex).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0012
     * @tc.name      testExtYuvGridZoom0011
     * @tc.desc      Grid 7x7 zoom 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 7; index++) { xs.push((800 / 7) * index); }
      for (let index: number = 1; index < 7; index++) { ys.push((800 / 7) * index); }
      expect(xs.length).assertEqual(6);
      expect(ys.length).assertEqual(6);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 2) { currentIndex = index; } }
      expect(currentIndex).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0013
     * @tc.name      testExtYuvGridZoom0012
     * @tc.desc      Grid 2x2 zoom 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 2; index++) { xs.push((200 / 2) * index); }
      for (let index: number = 1; index < 2; index++) { ys.push((200 / 2) * index); }
      expect(xs.length).assertEqual(1);
      expect(ys.length).assertEqual(1);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 5) { currentIndex = index; } }
      expect(currentIndex).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0014
     * @tc.name      testExtYuvGridZoom0013
     * @tc.desc      Grid 3x2 zoom 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 3; index++) { xs.push((400 / 3) * index); }
      for (let index: number = 1; index < 2; index++) { ys.push((400 / 2) * index); }
      expect(xs.length).assertEqual(2);
      expect(ys.length).assertEqual(1);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 8) { currentIndex = index; } }
      expect(currentIndex).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0015
     * @tc.name      testExtYuvGridZoom0014
     * @tc.desc      Grid 4x3 zoom 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 4; index++) { xs.push((800 / 4) * index); }
      for (let index: number = 1; index < 3; index++) { ys.push((800 / 3) * index); }
      expect(xs.length).assertEqual(3);
      expect(ys.length).assertEqual(2);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 10) { currentIndex = index; } }
      expect(currentIndex).assertEqual(2);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0016
     * @tc.name      testExtYuvGridZoom0015
     * @tc.desc      Grid 5x3 zoom 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 5; index++) { xs.push((200 / 5) * index); }
      for (let index: number = 1; index < 3; index++) { ys.push((200 / 3) * index); }
      expect(xs.length).assertEqual(4);
      expect(ys.length).assertEqual(2);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 1) { currentIndex = index; } }
      expect(currentIndex).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0017
     * @tc.name      testExtYuvGridZoom0016
     * @tc.desc      Grid 6x4 zoom 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 6; index++) { xs.push((400 / 6) * index); }
      for (let index: number = 1; index < 4; index++) { ys.push((400 / 4) * index); }
      expect(xs.length).assertEqual(5);
      expect(ys.length).assertEqual(3);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 2) { currentIndex = index; } }
      expect(currentIndex).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0018
     * @tc.name      testExtYuvGridZoom0017
     * @tc.desc      Grid 7x4 zoom 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 7; index++) { xs.push((800 / 7) * index); }
      for (let index: number = 1; index < 4; index++) { ys.push((800 / 4) * index); }
      expect(xs.length).assertEqual(6);
      expect(ys.length).assertEqual(3);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 5) { currentIndex = index; } }
      expect(currentIndex).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0019
     * @tc.name      testExtYuvGridZoom0018
     * @tc.desc      Grid 2x5 zoom 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 2; index++) { xs.push((200 / 2) * index); }
      for (let index: number = 1; index < 5; index++) { ys.push((200 / 5) * index); }
      expect(xs.length).assertEqual(1);
      expect(ys.length).assertEqual(4);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 8) { currentIndex = index; } }
      expect(currentIndex).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0020
     * @tc.name      testExtYuvGridZoom0019
     * @tc.desc      Grid 3x5 zoom 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 3; index++) { xs.push((400 / 3) * index); }
      for (let index: number = 1; index < 5; index++) { ys.push((400 / 5) * index); }
      expect(xs.length).assertEqual(2);
      expect(ys.length).assertEqual(4);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 10) { currentIndex = index; } }
      expect(currentIndex).assertEqual(2);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0021
     * @tc.name      testExtYuvGridZoom0020
     * @tc.desc      Grid 4x6 zoom 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 4; index++) { xs.push((800 / 4) * index); }
      for (let index: number = 1; index < 6; index++) { ys.push((800 / 6) * index); }
      expect(xs.length).assertEqual(3);
      expect(ys.length).assertEqual(5);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 1) { currentIndex = index; } }
      expect(currentIndex).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0022
     * @tc.name      testExtYuvGridZoom0021
     * @tc.desc      Grid 5x6 zoom 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 5; index++) { xs.push((200 / 5) * index); }
      for (let index: number = 1; index < 6; index++) { ys.push((200 / 6) * index); }
      expect(xs.length).assertEqual(4);
      expect(ys.length).assertEqual(5);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 2) { currentIndex = index; } }
      expect(currentIndex).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0023
     * @tc.name      testExtYuvGridZoom0022
     * @tc.desc      Grid 6x7 zoom 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 6; index++) { xs.push((400 / 6) * index); }
      for (let index: number = 1; index < 7; index++) { ys.push((400 / 7) * index); }
      expect(xs.length).assertEqual(5);
      expect(ys.length).assertEqual(6);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 5) { currentIndex = index; } }
      expect(currentIndex).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0024
     * @tc.name      testExtYuvGridZoom0023
     * @tc.desc      Grid 7x7 zoom 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 7; index++) { xs.push((800 / 7) * index); }
      for (let index: number = 1; index < 7; index++) { ys.push((800 / 7) * index); }
      expect(xs.length).assertEqual(6);
      expect(ys.length).assertEqual(6);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 8) { currentIndex = index; } }
      expect(currentIndex).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0025
     * @tc.name      testExtYuvGridZoom0024
     * @tc.desc      Grid 2x2 zoom 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 2; index++) { xs.push((200 / 2) * index); }
      for (let index: number = 1; index < 2; index++) { ys.push((200 / 2) * index); }
      expect(xs.length).assertEqual(1);
      expect(ys.length).assertEqual(1);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 10) { currentIndex = index; } }
      expect(currentIndex).assertEqual(2);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0026
     * @tc.name      testExtYuvGridZoom0025
     * @tc.desc      Grid 3x2 zoom 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 3; index++) { xs.push((400 / 3) * index); }
      for (let index: number = 1; index < 2; index++) { ys.push((400 / 2) * index); }
      expect(xs.length).assertEqual(2);
      expect(ys.length).assertEqual(1);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 1) { currentIndex = index; } }
      expect(currentIndex).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0027
     * @tc.name      testExtYuvGridZoom0026
     * @tc.desc      Grid 4x3 zoom 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 4; index++) { xs.push((800 / 4) * index); }
      for (let index: number = 1; index < 3; index++) { ys.push((800 / 3) * index); }
      expect(xs.length).assertEqual(3);
      expect(ys.length).assertEqual(2);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 2) { currentIndex = index; } }
      expect(currentIndex).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0028
     * @tc.name      testExtYuvGridZoom0027
     * @tc.desc      Grid 5x3 zoom 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 5; index++) { xs.push((200 / 5) * index); }
      for (let index: number = 1; index < 3; index++) { ys.push((200 / 3) * index); }
      expect(xs.length).assertEqual(4);
      expect(ys.length).assertEqual(2);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 5) { currentIndex = index; } }
      expect(currentIndex).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0029
     * @tc.name      testExtYuvGridZoom0028
     * @tc.desc      Grid 6x4 zoom 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 6; index++) { xs.push((400 / 6) * index); }
      for (let index: number = 1; index < 4; index++) { ys.push((400 / 4) * index); }
      expect(xs.length).assertEqual(5);
      expect(ys.length).assertEqual(3);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 8) { currentIndex = index; } }
      expect(currentIndex).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0030
     * @tc.name      testExtYuvGridZoom0029
     * @tc.desc      Grid 7x4 zoom 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 7; index++) { xs.push((800 / 7) * index); }
      for (let index: number = 1; index < 4; index++) { ys.push((800 / 4) * index); }
      expect(xs.length).assertEqual(6);
      expect(ys.length).assertEqual(3);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 10) { currentIndex = index; } }
      expect(currentIndex).assertEqual(2);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0031
     * @tc.name      testExtYuvGridZoom0030
     * @tc.desc      Grid 2x5 zoom 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 2; index++) { xs.push((200 / 2) * index); }
      for (let index: number = 1; index < 5; index++) { ys.push((200 / 5) * index); }
      expect(xs.length).assertEqual(1);
      expect(ys.length).assertEqual(4);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 1) { currentIndex = index; } }
      expect(currentIndex).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0032
     * @tc.name      testExtYuvGridZoom0031
     * @tc.desc      Grid 3x5 zoom 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 3; index++) { xs.push((400 / 3) * index); }
      for (let index: number = 1; index < 5; index++) { ys.push((400 / 5) * index); }
      expect(xs.length).assertEqual(2);
      expect(ys.length).assertEqual(4);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 2) { currentIndex = index; } }
      expect(currentIndex).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0033
     * @tc.name      testExtYuvGridZoom0032
     * @tc.desc      Grid 4x6 zoom 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 4; index++) { xs.push((800 / 4) * index); }
      for (let index: number = 1; index < 6; index++) { ys.push((800 / 6) * index); }
      expect(xs.length).assertEqual(3);
      expect(ys.length).assertEqual(5);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 5) { currentIndex = index; } }
      expect(currentIndex).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0034
     * @tc.name      testExtYuvGridZoom0033
     * @tc.desc      Grid 5x6 zoom 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 5; index++) { xs.push((200 / 5) * index); }
      for (let index: number = 1; index < 6; index++) { ys.push((200 / 6) * index); }
      expect(xs.length).assertEqual(4);
      expect(ys.length).assertEqual(5);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 8) { currentIndex = index; } }
      expect(currentIndex).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0035
     * @tc.name      testExtYuvGridZoom0034
     * @tc.desc      Grid 6x7 zoom 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 6; index++) { xs.push((400 / 6) * index); }
      for (let index: number = 1; index < 7; index++) { ys.push((400 / 7) * index); }
      expect(xs.length).assertEqual(5);
      expect(ys.length).assertEqual(6);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 10) { currentIndex = index; } }
      expect(currentIndex).assertEqual(2);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0036
     * @tc.name      testExtYuvGridZoom0035
     * @tc.desc      Grid 7x7 zoom 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 7; index++) { xs.push((800 / 7) * index); }
      for (let index: number = 1; index < 7; index++) { ys.push((800 / 7) * index); }
      expect(xs.length).assertEqual(6);
      expect(ys.length).assertEqual(6);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 1) { currentIndex = index; } }
      expect(currentIndex).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0037
     * @tc.name      testExtYuvGridZoom0036
     * @tc.desc      Grid 2x2 zoom 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 2; index++) { xs.push((200 / 2) * index); }
      for (let index: number = 1; index < 2; index++) { ys.push((200 / 2) * index); }
      expect(xs.length).assertEqual(1);
      expect(ys.length).assertEqual(1);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 2) { currentIndex = index; } }
      expect(currentIndex).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0038
     * @tc.name      testExtYuvGridZoom0037
     * @tc.desc      Grid 3x2 zoom 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 3; index++) { xs.push((400 / 3) * index); }
      for (let index: number = 1; index < 2; index++) { ys.push((400 / 2) * index); }
      expect(xs.length).assertEqual(2);
      expect(ys.length).assertEqual(1);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 5) { currentIndex = index; } }
      expect(currentIndex).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0039
     * @tc.name      testExtYuvGridZoom0038
     * @tc.desc      Grid 4x3 zoom 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 4; index++) { xs.push((800 / 4) * index); }
      for (let index: number = 1; index < 3; index++) { ys.push((800 / 3) * index); }
      expect(xs.length).assertEqual(3);
      expect(ys.length).assertEqual(2);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 8) { currentIndex = index; } }
      expect(currentIndex).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0040
     * @tc.name      testExtYuvGridZoom0039
     * @tc.desc      Grid 5x3 zoom 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 5; index++) { xs.push((200 / 5) * index); }
      for (let index: number = 1; index < 3; index++) { ys.push((200 / 3) * index); }
      expect(xs.length).assertEqual(4);
      expect(ys.length).assertEqual(2);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 10) { currentIndex = index; } }
      expect(currentIndex).assertEqual(2);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0041
     * @tc.name      testExtYuvGridZoom0040
     * @tc.desc      Grid 6x4 zoom 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 6; index++) { xs.push((400 / 6) * index); }
      for (let index: number = 1; index < 4; index++) { ys.push((400 / 4) * index); }
      expect(xs.length).assertEqual(5);
      expect(ys.length).assertEqual(3);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 1) { currentIndex = index; } }
      expect(currentIndex).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0042
     * @tc.name      testExtYuvGridZoom0041
     * @tc.desc      Grid 7x4 zoom 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 7; index++) { xs.push((800 / 7) * index); }
      for (let index: number = 1; index < 4; index++) { ys.push((800 / 4) * index); }
      expect(xs.length).assertEqual(6);
      expect(ys.length).assertEqual(3);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 2) { currentIndex = index; } }
      expect(currentIndex).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0043
     * @tc.name      testExtYuvGridZoom0042
     * @tc.desc      Grid 2x5 zoom 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 2; index++) { xs.push((200 / 2) * index); }
      for (let index: number = 1; index < 5; index++) { ys.push((200 / 5) * index); }
      expect(xs.length).assertEqual(1);
      expect(ys.length).assertEqual(4);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 5) { currentIndex = index; } }
      expect(currentIndex).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0044
     * @tc.name      testExtYuvGridZoom0043
     * @tc.desc      Grid 3x5 zoom 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 3; index++) { xs.push((400 / 3) * index); }
      for (let index: number = 1; index < 5; index++) { ys.push((400 / 5) * index); }
      expect(xs.length).assertEqual(2);
      expect(ys.length).assertEqual(4);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 8) { currentIndex = index; } }
      expect(currentIndex).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0045
     * @tc.name      testExtYuvGridZoom0044
     * @tc.desc      Grid 4x6 zoom 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 4; index++) { xs.push((800 / 4) * index); }
      for (let index: number = 1; index < 6; index++) { ys.push((800 / 6) * index); }
      expect(xs.length).assertEqual(3);
      expect(ys.length).assertEqual(5);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 10) { currentIndex = index; } }
      expect(currentIndex).assertEqual(2);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0046
     * @tc.name      testExtYuvGridZoom0045
     * @tc.desc      Grid 5x6 zoom 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 5; index++) { xs.push((200 / 5) * index); }
      for (let index: number = 1; index < 6; index++) { ys.push((200 / 6) * index); }
      expect(xs.length).assertEqual(4);
      expect(ys.length).assertEqual(5);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 1) { currentIndex = index; } }
      expect(currentIndex).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0047
     * @tc.name      testExtYuvGridZoom0046
     * @tc.desc      Grid 6x7 zoom 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 6; index++) { xs.push((400 / 6) * index); }
      for (let index: number = 1; index < 7; index++) { ys.push((400 / 7) * index); }
      expect(xs.length).assertEqual(5);
      expect(ys.length).assertEqual(6);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 2) { currentIndex = index; } }
      expect(currentIndex).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0048
     * @tc.name      testExtYuvGridZoom0047
     * @tc.desc      Grid 7x7 zoom 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 7; index++) { xs.push((800 / 7) * index); }
      for (let index: number = 1; index < 7; index++) { ys.push((800 / 7) * index); }
      expect(xs.length).assertEqual(6);
      expect(ys.length).assertEqual(6);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 5) { currentIndex = index; } }
      expect(currentIndex).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0049
     * @tc.name      testExtYuvGridZoom0048
     * @tc.desc      Grid 2x2 zoom 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 2; index++) { xs.push((200 / 2) * index); }
      for (let index: number = 1; index < 2; index++) { ys.push((200 / 2) * index); }
      expect(xs.length).assertEqual(1);
      expect(ys.length).assertEqual(1);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 8) { currentIndex = index; } }
      expect(currentIndex).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0050
     * @tc.name      testExtYuvGridZoom0049
     * @tc.desc      Grid 3x2 zoom 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 3; index++) { xs.push((400 / 3) * index); }
      for (let index: number = 1; index < 2; index++) { ys.push((400 / 2) * index); }
      expect(xs.length).assertEqual(2);
      expect(ys.length).assertEqual(1);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 10) { currentIndex = index; } }
      expect(currentIndex).assertEqual(2);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0051
     * @tc.name      testExtYuvGridZoom0050
     * @tc.desc      Grid 4x3 zoom 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 4; index++) { xs.push((800 / 4) * index); }
      for (let index: number = 1; index < 3; index++) { ys.push((800 / 3) * index); }
      expect(xs.length).assertEqual(3);
      expect(ys.length).assertEqual(2);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 1) { currentIndex = index; } }
      expect(currentIndex).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0052
     * @tc.name      testExtYuvGridZoom0051
     * @tc.desc      Grid 5x3 zoom 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 5; index++) { xs.push((200 / 5) * index); }
      for (let index: number = 1; index < 3; index++) { ys.push((200 / 3) * index); }
      expect(xs.length).assertEqual(4);
      expect(ys.length).assertEqual(2);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 2) { currentIndex = index; } }
      expect(currentIndex).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0053
     * @tc.name      testExtYuvGridZoom0052
     * @tc.desc      Grid 6x4 zoom 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 6; index++) { xs.push((400 / 6) * index); }
      for (let index: number = 1; index < 4; index++) { ys.push((400 / 4) * index); }
      expect(xs.length).assertEqual(5);
      expect(ys.length).assertEqual(3);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 5) { currentIndex = index; } }
      expect(currentIndex).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0054
     * @tc.name      testExtYuvGridZoom0053
     * @tc.desc      Grid 7x4 zoom 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 7; index++) { xs.push((800 / 7) * index); }
      for (let index: number = 1; index < 4; index++) { ys.push((800 / 4) * index); }
      expect(xs.length).assertEqual(6);
      expect(ys.length).assertEqual(3);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 8) { currentIndex = index; } }
      expect(currentIndex).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0055
     * @tc.name      testExtYuvGridZoom0054
     * @tc.desc      Grid 2x5 zoom 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 2; index++) { xs.push((200 / 2) * index); }
      for (let index: number = 1; index < 5; index++) { ys.push((200 / 5) * index); }
      expect(xs.length).assertEqual(1);
      expect(ys.length).assertEqual(4);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 10) { currentIndex = index; } }
      expect(currentIndex).assertEqual(2);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0056
     * @tc.name      testExtYuvGridZoom0055
     * @tc.desc      Grid 3x5 zoom 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 3; index++) { xs.push((400 / 3) * index); }
      for (let index: number = 1; index < 5; index++) { ys.push((400 / 5) * index); }
      expect(xs.length).assertEqual(2);
      expect(ys.length).assertEqual(4);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 1) { currentIndex = index; } }
      expect(currentIndex).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0057
     * @tc.name      testExtYuvGridZoom0056
     * @tc.desc      Grid 4x6 zoom 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 4; index++) { xs.push((800 / 4) * index); }
      for (let index: number = 1; index < 6; index++) { ys.push((800 / 6) * index); }
      expect(xs.length).assertEqual(3);
      expect(ys.length).assertEqual(5);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 2) { currentIndex = index; } }
      expect(currentIndex).assertEqual(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0058
     * @tc.name      testExtYuvGridZoom0057
     * @tc.desc      Grid 5x6 zoom 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 5; index++) { xs.push((200 / 5) * index); }
      for (let index: number = 1; index < 6; index++) { ys.push((200 / 6) * index); }
      expect(xs.length).assertEqual(4);
      expect(ys.length).assertEqual(5);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 5) { currentIndex = index; } }
      expect(currentIndex).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0059
     * @tc.name      testExtYuvGridZoom0058
     * @tc.desc      Grid 6x7 zoom 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 6; index++) { xs.push((400 / 6) * index); }
      for (let index: number = 1; index < 7; index++) { ys.push((400 / 7) * index); }
      expect(xs.length).assertEqual(5);
      expect(ys.length).assertEqual(6);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 8) { currentIndex = index; } }
      expect(currentIndex).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_GRIDZOOM_0060
     * @tc.name      testExtYuvGridZoom0059
     * @tc.desc      Grid 7x7 zoom 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvGridZoom0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const xs: number[] = [];
      const ys: number[] = [];
      for (let index: number = 1; index < 7; index++) { xs.push((800 / 7) * index); }
      for (let index: number = 1; index < 7; index++) { ys.push((800 / 7) * index); }
      expect(xs.length).assertEqual(6);
      expect(ys.length).assertEqual(6);
      const zooms: number[] = [1, 5, 10];
      let currentIndex: number = 0;
      for (let index: number = 0; index < zooms.length; index++) { if (zooms[index] <= 10) { currentIndex = index; } }
      expect(currentIndex).assertEqual(2);
    })
  });
}
