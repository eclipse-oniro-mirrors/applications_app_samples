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

const TAG: string = '[Sample_yuvPreviewMath]';
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

export default function yuvPreviewMathTest(): void {
  describe('yuvPreviewMathTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0001
     * @tc.name      testExtYuvPreview0000
     * @tc.desc      Preview ratio 1.3333333333333333.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1.3333333333333333);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0002
     * @tc.name      testExtYuvPreview0001
     * @tc.desc      Preview ratio 1.7777777777777777.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1.7777777777777777);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0003
     * @tc.name      testExtYuvPreview0002
     * @tc.desc      Preview ratio 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0004
     * @tc.name      testExtYuvPreview0003
     * @tc.desc      Preview ratio 0.75.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(0.75);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0005
     * @tc.name      testExtYuvPreview0004
     * @tc.desc      Preview ratio 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(2);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0006
     * @tc.name      testExtYuvPreview0005
     * @tc.desc      Preview ratio 1.3333333333333333.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1.3333333333333333);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0007
     * @tc.name      testExtYuvPreview0006
     * @tc.desc      Preview ratio 1.7777777777777777.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1.7777777777777777);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0008
     * @tc.name      testExtYuvPreview0007
     * @tc.desc      Preview ratio 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0009
     * @tc.name      testExtYuvPreview0008
     * @tc.desc      Preview ratio 0.75.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(0.75);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0010
     * @tc.name      testExtYuvPreview0009
     * @tc.desc      Preview ratio 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(2);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0011
     * @tc.name      testExtYuvPreview0010
     * @tc.desc      Preview ratio 1.3333333333333333.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1.3333333333333333);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0012
     * @tc.name      testExtYuvPreview0011
     * @tc.desc      Preview ratio 1.7777777777777777.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1.7777777777777777);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0013
     * @tc.name      testExtYuvPreview0012
     * @tc.desc      Preview ratio 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0014
     * @tc.name      testExtYuvPreview0013
     * @tc.desc      Preview ratio 0.75.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(0.75);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0015
     * @tc.name      testExtYuvPreview0014
     * @tc.desc      Preview ratio 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(2);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0016
     * @tc.name      testExtYuvPreview0015
     * @tc.desc      Preview ratio 1.3333333333333333.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1.3333333333333333);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0017
     * @tc.name      testExtYuvPreview0016
     * @tc.desc      Preview ratio 1.7777777777777777.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1.7777777777777777);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0018
     * @tc.name      testExtYuvPreview0017
     * @tc.desc      Preview ratio 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0019
     * @tc.name      testExtYuvPreview0018
     * @tc.desc      Preview ratio 0.75.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(0.75);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0020
     * @tc.name      testExtYuvPreview0019
     * @tc.desc      Preview ratio 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(2);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0021
     * @tc.name      testExtYuvPreview0020
     * @tc.desc      Preview ratio 1.3333333333333333.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1.3333333333333333);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0022
     * @tc.name      testExtYuvPreview0021
     * @tc.desc      Preview ratio 1.7777777777777777.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1.7777777777777777);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0023
     * @tc.name      testExtYuvPreview0022
     * @tc.desc      Preview ratio 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0024
     * @tc.name      testExtYuvPreview0023
     * @tc.desc      Preview ratio 0.75.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(0.75);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0025
     * @tc.name      testExtYuvPreview0024
     * @tc.desc      Preview ratio 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(2);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0026
     * @tc.name      testExtYuvPreview0025
     * @tc.desc      Preview ratio 1.3333333333333333.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1.3333333333333333);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0027
     * @tc.name      testExtYuvPreview0026
     * @tc.desc      Preview ratio 1.7777777777777777.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1.7777777777777777);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0028
     * @tc.name      testExtYuvPreview0027
     * @tc.desc      Preview ratio 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0029
     * @tc.name      testExtYuvPreview0028
     * @tc.desc      Preview ratio 0.75.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(0.75);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0030
     * @tc.name      testExtYuvPreview0029
     * @tc.desc      Preview ratio 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(2);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0031
     * @tc.name      testExtYuvPreview0030
     * @tc.desc      Preview ratio 1.3333333333333333.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1.3333333333333333);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0032
     * @tc.name      testExtYuvPreview0031
     * @tc.desc      Preview ratio 1.7777777777777777.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1.7777777777777777);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0033
     * @tc.name      testExtYuvPreview0032
     * @tc.desc      Preview ratio 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0034
     * @tc.name      testExtYuvPreview0033
     * @tc.desc      Preview ratio 0.75.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(0.75);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0035
     * @tc.name      testExtYuvPreview0034
     * @tc.desc      Preview ratio 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(2);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0036
     * @tc.name      testExtYuvPreview0035
     * @tc.desc      Preview ratio 1.3333333333333333.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1.3333333333333333);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0037
     * @tc.name      testExtYuvPreview0036
     * @tc.desc      Preview ratio 1.7777777777777777.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1.7777777777777777);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0038
     * @tc.name      testExtYuvPreview0037
     * @tc.desc      Preview ratio 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0039
     * @tc.name      testExtYuvPreview0038
     * @tc.desc      Preview ratio 0.75.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(0.75);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0040
     * @tc.name      testExtYuvPreview0039
     * @tc.desc      Preview ratio 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(2);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0041
     * @tc.name      testExtYuvPreview0040
     * @tc.desc      Preview ratio 1.3333333333333333.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1.3333333333333333);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0042
     * @tc.name      testExtYuvPreview0041
     * @tc.desc      Preview ratio 1.7777777777777777.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1.7777777777777777);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0043
     * @tc.name      testExtYuvPreview0042
     * @tc.desc      Preview ratio 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0044
     * @tc.name      testExtYuvPreview0043
     * @tc.desc      Preview ratio 0.75.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(0.75);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0045
     * @tc.name      testExtYuvPreview0044
     * @tc.desc      Preview ratio 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(2);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0046
     * @tc.name      testExtYuvPreview0045
     * @tc.desc      Preview ratio 1.3333333333333333.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1.3333333333333333);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0047
     * @tc.name      testExtYuvPreview0046
     * @tc.desc      Preview ratio 1.7777777777777777.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1.7777777777777777);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0048
     * @tc.name      testExtYuvPreview0047
     * @tc.desc      Preview ratio 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0049
     * @tc.name      testExtYuvPreview0048
     * @tc.desc      Preview ratio 0.75.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(0.75);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0050
     * @tc.name      testExtYuvPreview0049
     * @tc.desc      Preview ratio 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(2);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0051
     * @tc.name      testExtYuvPreview0050
     * @tc.desc      Preview ratio 1.3333333333333333.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1.3333333333333333);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0052
     * @tc.name      testExtYuvPreview0051
     * @tc.desc      Preview ratio 1.7777777777777777.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1.7777777777777777);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0053
     * @tc.name      testExtYuvPreview0052
     * @tc.desc      Preview ratio 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0054
     * @tc.name      testExtYuvPreview0053
     * @tc.desc      Preview ratio 0.75.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(0.75);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0055
     * @tc.name      testExtYuvPreview0054
     * @tc.desc      Preview ratio 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(2);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0056
     * @tc.name      testExtYuvPreview0055
     * @tc.desc      Preview ratio 1.3333333333333333.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1.3333333333333333);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0057
     * @tc.name      testExtYuvPreview0056
     * @tc.desc      Preview ratio 1.7777777777777777.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1.7777777777777777);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0058
     * @tc.name      testExtYuvPreview0057
     * @tc.desc      Preview ratio 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(1);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0059
     * @tc.name      testExtYuvPreview0058
     * @tc.desc      Preview ratio 0.75.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(0.75);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW_0060
     * @tc.name      testExtYuvPreview0059
     * @tc.desc      Preview ratio 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreview0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: Size = WindowUtil.getMaxDisplaySize(2);
      expect(size.width).assertLarger(0);
      expect(size.height).assertLarger(0);
      expect(size.width / size.height).assertLarger(0);
      expect(WindowUtil.getWindowRatio()).assertLarger(0);
    })
  });
}
