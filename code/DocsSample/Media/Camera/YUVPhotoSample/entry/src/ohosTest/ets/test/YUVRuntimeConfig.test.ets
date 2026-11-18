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

const TAG: string = '[Sample_yuvRuntimeConfig]';
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

export default function yuvRuntimeConfigTest(): void {
  describe('yuvRuntimeConfigTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_RUNTIMECFG_0001
     * @tc.name      testExtYuvRuntimeCfg0000
     * @tc.desc      Runtime config 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvRuntimeCfg0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_RUNTIMECFG_0002
     * @tc.name      testExtYuvRuntimeCfg0001
     * @tc.desc      Runtime config 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvRuntimeCfg0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_RUNTIMECFG_0003
     * @tc.name      testExtYuvRuntimeCfg0002
     * @tc.desc      Runtime config 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvRuntimeCfg0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_RUNTIMECFG_0004
     * @tc.name      testExtYuvRuntimeCfg0003
     * @tc.desc      Runtime config 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvRuntimeCfg0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_RUNTIMECFG_0005
     * @tc.name      testExtYuvRuntimeCfg0004
     * @tc.desc      Runtime config 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvRuntimeCfg0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_RUNTIMECFG_0006
     * @tc.name      testExtYuvRuntimeCfg0005
     * @tc.desc      Runtime config 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvRuntimeCfg0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_RUNTIMECFG_0007
     * @tc.name      testExtYuvRuntimeCfg0006
     * @tc.desc      Runtime config 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvRuntimeCfg0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_RUNTIMECFG_0008
     * @tc.name      testExtYuvRuntimeCfg0007
     * @tc.desc      Runtime config 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvRuntimeCfg0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_RUNTIMECFG_0009
     * @tc.name      testExtYuvRuntimeCfg0008
     * @tc.desc      Runtime config 9.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvRuntimeCfg0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_RUNTIMECFG_0010
     * @tc.name      testExtYuvRuntimeCfg0009
     * @tc.desc      Runtime config 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvRuntimeCfg0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_RUNTIMECFG_0011
     * @tc.name      testExtYuvRuntimeCfg0010
     * @tc.desc      Runtime config 11.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvRuntimeCfg0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_RUNTIMECFG_0012
     * @tc.name      testExtYuvRuntimeCfg0011
     * @tc.desc      Runtime config 12.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvRuntimeCfg0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_RUNTIMECFG_0013
     * @tc.name      testExtYuvRuntimeCfg0012
     * @tc.desc      Runtime config 13.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvRuntimeCfg0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_RUNTIMECFG_0014
     * @tc.name      testExtYuvRuntimeCfg0013
     * @tc.desc      Runtime config 14.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvRuntimeCfg0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_RUNTIMECFG_0015
     * @tc.name      testExtYuvRuntimeCfg0014
     * @tc.desc      Runtime config 15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvRuntimeCfg0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_RUNTIMECFG_0016
     * @tc.name      testExtYuvRuntimeCfg0015
     * @tc.desc      Runtime config 16.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvRuntimeCfg0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_RUNTIMECFG_0017
     * @tc.name      testExtYuvRuntimeCfg0016
     * @tc.desc      Runtime config 17.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvRuntimeCfg0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_RUNTIMECFG_0018
     * @tc.name      testExtYuvRuntimeCfg0017
     * @tc.desc      Runtime config 18.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvRuntimeCfg0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_RUNTIMECFG_0019
     * @tc.name      testExtYuvRuntimeCfg0018
     * @tc.desc      Runtime config 19.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvRuntimeCfg0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_RUNTIMECFG_0020
     * @tc.name      testExtYuvRuntimeCfg0019
     * @tc.desc      Runtime config 20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvRuntimeCfg0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_RUNTIMECFG_0021
     * @tc.name      testExtYuvRuntimeCfg0020
     * @tc.desc      Runtime config 21.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvRuntimeCfg0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_RUNTIMECFG_0022
     * @tc.name      testExtYuvRuntimeCfg0021
     * @tc.desc      Runtime config 22.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvRuntimeCfg0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_RUNTIMECFG_0023
     * @tc.name      testExtYuvRuntimeCfg0022
     * @tc.desc      Runtime config 23.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvRuntimeCfg0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_RUNTIMECFG_0024
     * @tc.name      testExtYuvRuntimeCfg0023
     * @tc.desc      Runtime config 24.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvRuntimeCfg0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_RUNTIMECFG_0025
     * @tc.name      testExtYuvRuntimeCfg0024
     * @tc.desc      Runtime config 25.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvRuntimeCfg0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_RUNTIMECFG_0026
     * @tc.name      testExtYuvRuntimeCfg0025
     * @tc.desc      Runtime config 26.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvRuntimeCfg0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_RUNTIMECFG_0027
     * @tc.name      testExtYuvRuntimeCfg0026
     * @tc.desc      Runtime config 27.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvRuntimeCfg0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_RUNTIMECFG_0028
     * @tc.name      testExtYuvRuntimeCfg0027
     * @tc.desc      Runtime config 28.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvRuntimeCfg0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_RUNTIMECFG_0029
     * @tc.name      testExtYuvRuntimeCfg0028
     * @tc.desc      Runtime config 29.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvRuntimeCfg0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_RUNTIMECFG_0030
     * @tc.name      testExtYuvRuntimeCfg0029
     * @tc.desc      Runtime config 30.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvRuntimeCfg0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_RUNTIMECFG_0031
     * @tc.name      testExtYuvRuntimeCfg0030
     * @tc.desc      Runtime config 31.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvRuntimeCfg0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_RUNTIMECFG_0032
     * @tc.name      testExtYuvRuntimeCfg0031
     * @tc.desc      Runtime config 32.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvRuntimeCfg0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_RUNTIMECFG_0033
     * @tc.name      testExtYuvRuntimeCfg0032
     * @tc.desc      Runtime config 33.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvRuntimeCfg0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_RUNTIMECFG_0034
     * @tc.name      testExtYuvRuntimeCfg0033
     * @tc.desc      Runtime config 34.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvRuntimeCfg0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_RUNTIMECFG_0035
     * @tc.name      testExtYuvRuntimeCfg0034
     * @tc.desc      Runtime config 35.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvRuntimeCfg0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_RUNTIMECFG_0036
     * @tc.name      testExtYuvRuntimeCfg0035
     * @tc.desc      Runtime config 36.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvRuntimeCfg0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_RUNTIMECFG_0037
     * @tc.name      testExtYuvRuntimeCfg0036
     * @tc.desc      Runtime config 37.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvRuntimeCfg0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_RUNTIMECFG_0038
     * @tc.name      testExtYuvRuntimeCfg0037
     * @tc.desc      Runtime config 38.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvRuntimeCfg0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_RUNTIMECFG_0039
     * @tc.name      testExtYuvRuntimeCfg0038
     * @tc.desc      Runtime config 39.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvRuntimeCfg0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_RUNTIMECFG_0040
     * @tc.name      testExtYuvRuntimeCfg0039
     * @tc.desc      Runtime config 40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvRuntimeCfg0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraMode.PHOTO).assertEqual(0);
      expect(CameraMode.VIDEO).assertEqual(1);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
  });
}
