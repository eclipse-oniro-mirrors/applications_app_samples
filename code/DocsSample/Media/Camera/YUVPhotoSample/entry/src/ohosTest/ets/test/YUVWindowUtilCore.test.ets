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
import WindowUtil from '../../../main/ets/utils/WindowUtil';

const TAG: string = '[Sample_yuvWindowUtilCore]';
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

export default function yuvWindowUtilCoreTest(): void {
  describe('yuvWindowUtilCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_WINDOW_0001
     * @tc.name      testExtYuvWindow0000
     * @tc.desc      WindowUtil ratio 1.3333333333333333.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvWindow0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1.3333333333333333);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_WINDOW_0002
     * @tc.name      testExtYuvWindow0001
     * @tc.desc      WindowUtil ratio 1.7777777777777777.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvWindow0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1.7777777777777777);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_WINDOW_0003
     * @tc.name      testExtYuvWindow0002
     * @tc.desc      WindowUtil ratio 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvWindow0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_WINDOW_0004
     * @tc.name      testExtYuvWindow0003
     * @tc.desc      WindowUtil ratio 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvWindow0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(0.5);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_WINDOW_0005
     * @tc.name      testExtYuvWindow0004
     * @tc.desc      WindowUtil ratio 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvWindow0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(2);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_WINDOW_0006
     * @tc.name      testExtYuvWindow0005
     * @tc.desc      WindowUtil ratio 1.3333333333333333.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvWindow0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1.3333333333333333);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_WINDOW_0007
     * @tc.name      testExtYuvWindow0006
     * @tc.desc      WindowUtil ratio 1.7777777777777777.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvWindow0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1.7777777777777777);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_WINDOW_0008
     * @tc.name      testExtYuvWindow0007
     * @tc.desc      WindowUtil ratio 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvWindow0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_WINDOW_0009
     * @tc.name      testExtYuvWindow0008
     * @tc.desc      WindowUtil ratio 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvWindow0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(0.5);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_WINDOW_0010
     * @tc.name      testExtYuvWindow0009
     * @tc.desc      WindowUtil ratio 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvWindow0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(2);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_WINDOW_0011
     * @tc.name      testExtYuvWindow0010
     * @tc.desc      WindowUtil ratio 1.3333333333333333.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvWindow0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1.3333333333333333);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_WINDOW_0012
     * @tc.name      testExtYuvWindow0011
     * @tc.desc      WindowUtil ratio 1.7777777777777777.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvWindow0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1.7777777777777777);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_WINDOW_0013
     * @tc.name      testExtYuvWindow0012
     * @tc.desc      WindowUtil ratio 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvWindow0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_WINDOW_0014
     * @tc.name      testExtYuvWindow0013
     * @tc.desc      WindowUtil ratio 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvWindow0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(0.5);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_WINDOW_0015
     * @tc.name      testExtYuvWindow0014
     * @tc.desc      WindowUtil ratio 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvWindow0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(2);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_WINDOW_0016
     * @tc.name      testExtYuvWindow0015
     * @tc.desc      WindowUtil ratio 1.3333333333333333.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvWindow0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1.3333333333333333);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_WINDOW_0017
     * @tc.name      testExtYuvWindow0016
     * @tc.desc      WindowUtil ratio 1.7777777777777777.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvWindow0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1.7777777777777777);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_WINDOW_0018
     * @tc.name      testExtYuvWindow0017
     * @tc.desc      WindowUtil ratio 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvWindow0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_WINDOW_0019
     * @tc.name      testExtYuvWindow0018
     * @tc.desc      WindowUtil ratio 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvWindow0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(0.5);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_WINDOW_0020
     * @tc.name      testExtYuvWindow0019
     * @tc.desc      WindowUtil ratio 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvWindow0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(2);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_WINDOW_0021
     * @tc.name      testExtYuvWindow0020
     * @tc.desc      WindowUtil ratio 1.3333333333333333.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvWindow0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1.3333333333333333);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_WINDOW_0022
     * @tc.name      testExtYuvWindow0021
     * @tc.desc      WindowUtil ratio 1.7777777777777777.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvWindow0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1.7777777777777777);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_WINDOW_0023
     * @tc.name      testExtYuvWindow0022
     * @tc.desc      WindowUtil ratio 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvWindow0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_WINDOW_0024
     * @tc.name      testExtYuvWindow0023
     * @tc.desc      WindowUtil ratio 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvWindow0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(0.5);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_WINDOW_0025
     * @tc.name      testExtYuvWindow0024
     * @tc.desc      WindowUtil ratio 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvWindow0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(2);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_WINDOW_0026
     * @tc.name      testExtYuvWindow0025
     * @tc.desc      WindowUtil ratio 1.3333333333333333.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvWindow0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1.3333333333333333);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_WINDOW_0027
     * @tc.name      testExtYuvWindow0026
     * @tc.desc      WindowUtil ratio 1.7777777777777777.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvWindow0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1.7777777777777777);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_WINDOW_0028
     * @tc.name      testExtYuvWindow0027
     * @tc.desc      WindowUtil ratio 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvWindow0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_WINDOW_0029
     * @tc.name      testExtYuvWindow0028
     * @tc.desc      WindowUtil ratio 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvWindow0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(0.5);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_WINDOW_0030
     * @tc.name      testExtYuvWindow0029
     * @tc.desc      WindowUtil ratio 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvWindow0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(2);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_WINDOW_0031
     * @tc.name      testExtYuvWindow0030
     * @tc.desc      WindowUtil ratio 1.3333333333333333.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvWindow0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1.3333333333333333);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_WINDOW_0032
     * @tc.name      testExtYuvWindow0031
     * @tc.desc      WindowUtil ratio 1.7777777777777777.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvWindow0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1.7777777777777777);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_WINDOW_0033
     * @tc.name      testExtYuvWindow0032
     * @tc.desc      WindowUtil ratio 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvWindow0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_WINDOW_0034
     * @tc.name      testExtYuvWindow0033
     * @tc.desc      WindowUtil ratio 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvWindow0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(0.5);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_WINDOW_0035
     * @tc.name      testExtYuvWindow0034
     * @tc.desc      WindowUtil ratio 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvWindow0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(2);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_WINDOW_0036
     * @tc.name      testExtYuvWindow0035
     * @tc.desc      WindowUtil ratio 1.3333333333333333.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvWindow0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1.3333333333333333);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_WINDOW_0037
     * @tc.name      testExtYuvWindow0036
     * @tc.desc      WindowUtil ratio 1.7777777777777777.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvWindow0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1.7777777777777777);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_WINDOW_0038
     * @tc.name      testExtYuvWindow0037
     * @tc.desc      WindowUtil ratio 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvWindow0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_WINDOW_0039
     * @tc.name      testExtYuvWindow0038
     * @tc.desc      WindowUtil ratio 0.5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvWindow0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(0.5);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_WINDOW_0040
     * @tc.name      testExtYuvWindow0039
     * @tc.desc      WindowUtil ratio 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvWindow0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(2);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
  });
}
