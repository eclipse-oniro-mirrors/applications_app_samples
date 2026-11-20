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
import CameraConstant from '../../../main/ets/constants/Constants';
import { CameraMode } from '../../../main/ets/viewmodels/PreviewViewModel';

const TAG: string = '[Sample_yuvModeContract]';
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

export default function yuvModeContractTest(): void {
  describe('yuvModeContractTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MODE_0001
     * @tc.name      testExtYuvMode0000
     * @tc.desc      Mode contract 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMode0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MODE_0002
     * @tc.name      testExtYuvMode0001
     * @tc.desc      Mode contract 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMode0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MODE_0003
     * @tc.name      testExtYuvMode0002
     * @tc.desc      Mode contract 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMode0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MODE_0004
     * @tc.name      testExtYuvMode0003
     * @tc.desc      Mode contract 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMode0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MODE_0005
     * @tc.name      testExtYuvMode0004
     * @tc.desc      Mode contract 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMode0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MODE_0006
     * @tc.name      testExtYuvMode0005
     * @tc.desc      Mode contract 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMode0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MODE_0007
     * @tc.name      testExtYuvMode0006
     * @tc.desc      Mode contract 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMode0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MODE_0008
     * @tc.name      testExtYuvMode0007
     * @tc.desc      Mode contract 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMode0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MODE_0009
     * @tc.name      testExtYuvMode0008
     * @tc.desc      Mode contract 9.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMode0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MODE_0010
     * @tc.name      testExtYuvMode0009
     * @tc.desc      Mode contract 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMode0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MODE_0011
     * @tc.name      testExtYuvMode0010
     * @tc.desc      Mode contract 11.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMode0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MODE_0012
     * @tc.name      testExtYuvMode0011
     * @tc.desc      Mode contract 12.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMode0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MODE_0013
     * @tc.name      testExtYuvMode0012
     * @tc.desc      Mode contract 13.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMode0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MODE_0014
     * @tc.name      testExtYuvMode0013
     * @tc.desc      Mode contract 14.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMode0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MODE_0015
     * @tc.name      testExtYuvMode0014
     * @tc.desc      Mode contract 15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMode0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MODE_0016
     * @tc.name      testExtYuvMode0015
     * @tc.desc      Mode contract 16.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMode0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MODE_0017
     * @tc.name      testExtYuvMode0016
     * @tc.desc      Mode contract 17.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMode0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MODE_0018
     * @tc.name      testExtYuvMode0017
     * @tc.desc      Mode contract 18.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMode0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MODE_0019
     * @tc.name      testExtYuvMode0018
     * @tc.desc      Mode contract 19.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMode0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MODE_0020
     * @tc.name      testExtYuvMode0019
     * @tc.desc      Mode contract 20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMode0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MODE_0021
     * @tc.name      testExtYuvMode0020
     * @tc.desc      Mode contract 21.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMode0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MODE_0022
     * @tc.name      testExtYuvMode0021
     * @tc.desc      Mode contract 22.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMode0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MODE_0023
     * @tc.name      testExtYuvMode0022
     * @tc.desc      Mode contract 23.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMode0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MODE_0024
     * @tc.name      testExtYuvMode0023
     * @tc.desc      Mode contract 24.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMode0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MODE_0025
     * @tc.name      testExtYuvMode0024
     * @tc.desc      Mode contract 25.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMode0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MODE_0026
     * @tc.name      testExtYuvMode0025
     * @tc.desc      Mode contract 26.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMode0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MODE_0027
     * @tc.name      testExtYuvMode0026
     * @tc.desc      Mode contract 27.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMode0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MODE_0028
     * @tc.name      testExtYuvMode0027
     * @tc.desc      Mode contract 28.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMode0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MODE_0029
     * @tc.name      testExtYuvMode0028
     * @tc.desc      Mode contract 29.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMode0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MODE_0030
     * @tc.name      testExtYuvMode0029
     * @tc.desc      Mode contract 30.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMode0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MODE_0031
     * @tc.name      testExtYuvMode0030
     * @tc.desc      Mode contract 31.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMode0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MODE_0032
     * @tc.name      testExtYuvMode0031
     * @tc.desc      Mode contract 32.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMode0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MODE_0033
     * @tc.name      testExtYuvMode0032
     * @tc.desc      Mode contract 33.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMode0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MODE_0034
     * @tc.name      testExtYuvMode0033
     * @tc.desc      Mode contract 34.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMode0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MODE_0035
     * @tc.name      testExtYuvMode0034
     * @tc.desc      Mode contract 35.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMode0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MODE_0036
     * @tc.name      testExtYuvMode0035
     * @tc.desc      Mode contract 36.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMode0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MODE_0037
     * @tc.name      testExtYuvMode0036
     * @tc.desc      Mode contract 37.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMode0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MODE_0038
     * @tc.name      testExtYuvMode0037
     * @tc.desc      Mode contract 38.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMode0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MODE_0039
     * @tc.name      testExtYuvMode0038
     * @tc.desc      Mode contract 39.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMode0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MODE_0040
     * @tc.name      testExtYuvMode0039
     * @tc.desc      Mode contract 40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMode0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
    })
  });
}
