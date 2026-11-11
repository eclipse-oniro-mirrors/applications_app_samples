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

const TAG: string = '[Sample_yuvPreviewContract]';
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

export default function yuvPreviewContractTest(): void {
  describe('yuvPreviewContractTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW2_0001
     * @tc.name      testExtYuvPreviewContract0000
     * @tc.desc      Preview contract 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreviewContract0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW2_0002
     * @tc.name      testExtYuvPreviewContract0001
     * @tc.desc      Preview contract 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreviewContract0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW2_0003
     * @tc.name      testExtYuvPreviewContract0002
     * @tc.desc      Preview contract 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreviewContract0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW2_0004
     * @tc.name      testExtYuvPreviewContract0003
     * @tc.desc      Preview contract 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreviewContract0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW2_0005
     * @tc.name      testExtYuvPreviewContract0004
     * @tc.desc      Preview contract 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreviewContract0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW2_0006
     * @tc.name      testExtYuvPreviewContract0005
     * @tc.desc      Preview contract 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreviewContract0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW2_0007
     * @tc.name      testExtYuvPreviewContract0006
     * @tc.desc      Preview contract 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreviewContract0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW2_0008
     * @tc.name      testExtYuvPreviewContract0007
     * @tc.desc      Preview contract 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreviewContract0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW2_0009
     * @tc.name      testExtYuvPreviewContract0008
     * @tc.desc      Preview contract 9.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreviewContract0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW2_0010
     * @tc.name      testExtYuvPreviewContract0009
     * @tc.desc      Preview contract 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreviewContract0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW2_0011
     * @tc.name      testExtYuvPreviewContract0010
     * @tc.desc      Preview contract 11.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreviewContract0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW2_0012
     * @tc.name      testExtYuvPreviewContract0011
     * @tc.desc      Preview contract 12.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreviewContract0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW2_0013
     * @tc.name      testExtYuvPreviewContract0012
     * @tc.desc      Preview contract 13.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreviewContract0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW2_0014
     * @tc.name      testExtYuvPreviewContract0013
     * @tc.desc      Preview contract 14.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreviewContract0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW2_0015
     * @tc.name      testExtYuvPreviewContract0014
     * @tc.desc      Preview contract 15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreviewContract0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW2_0016
     * @tc.name      testExtYuvPreviewContract0015
     * @tc.desc      Preview contract 16.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreviewContract0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW2_0017
     * @tc.name      testExtYuvPreviewContract0016
     * @tc.desc      Preview contract 17.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreviewContract0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW2_0018
     * @tc.name      testExtYuvPreviewContract0017
     * @tc.desc      Preview contract 18.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreviewContract0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW2_0019
     * @tc.name      testExtYuvPreviewContract0018
     * @tc.desc      Preview contract 19.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreviewContract0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW2_0020
     * @tc.name      testExtYuvPreviewContract0019
     * @tc.desc      Preview contract 20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreviewContract0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW2_0021
     * @tc.name      testExtYuvPreviewContract0020
     * @tc.desc      Preview contract 21.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreviewContract0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW2_0022
     * @tc.name      testExtYuvPreviewContract0021
     * @tc.desc      Preview contract 22.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreviewContract0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW2_0023
     * @tc.name      testExtYuvPreviewContract0022
     * @tc.desc      Preview contract 23.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreviewContract0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW2_0024
     * @tc.name      testExtYuvPreviewContract0023
     * @tc.desc      Preview contract 24.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreviewContract0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW2_0025
     * @tc.name      testExtYuvPreviewContract0024
     * @tc.desc      Preview contract 25.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreviewContract0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW2_0026
     * @tc.name      testExtYuvPreviewContract0025
     * @tc.desc      Preview contract 26.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreviewContract0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW2_0027
     * @tc.name      testExtYuvPreviewContract0026
     * @tc.desc      Preview contract 27.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreviewContract0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW2_0028
     * @tc.name      testExtYuvPreviewContract0027
     * @tc.desc      Preview contract 28.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreviewContract0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW2_0029
     * @tc.name      testExtYuvPreviewContract0028
     * @tc.desc      Preview contract 29.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreviewContract0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_PREVIEW2_0030
     * @tc.name      testExtYuvPreviewContract0029
     * @tc.desc      Preview contract 30.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvPreviewContract0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
    })
  });
}
