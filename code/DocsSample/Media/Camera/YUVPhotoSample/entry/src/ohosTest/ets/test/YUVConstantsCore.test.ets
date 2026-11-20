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

const TAG: string = '[Sample_yuvConstantsCore]';
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

export default function yuvConstantsCoreTest(): void {
  describe('yuvConstantsCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_CONST_0001
     * @tc.name      testExtYuvConstant0000
     * @tc.desc      Camera constants case 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvConstant0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_CONST_0002
     * @tc.name      testExtYuvConstant0001
     * @tc.desc      Camera constants case 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvConstant0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_CONST_0003
     * @tc.name      testExtYuvConstant0002
     * @tc.desc      Camera constants case 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvConstant0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_CONST_0004
     * @tc.name      testExtYuvConstant0003
     * @tc.desc      Camera constants case 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvConstant0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_CONST_0005
     * @tc.name      testExtYuvConstant0004
     * @tc.desc      Camera constants case 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvConstant0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_CONST_0006
     * @tc.name      testExtYuvConstant0005
     * @tc.desc      Camera constants case 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvConstant0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_CONST_0007
     * @tc.name      testExtYuvConstant0006
     * @tc.desc      Camera constants case 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvConstant0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_CONST_0008
     * @tc.name      testExtYuvConstant0007
     * @tc.desc      Camera constants case 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvConstant0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_CONST_0009
     * @tc.name      testExtYuvConstant0008
     * @tc.desc      Camera constants case 9.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvConstant0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_CONST_0010
     * @tc.name      testExtYuvConstant0009
     * @tc.desc      Camera constants case 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvConstant0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_CONST_0011
     * @tc.name      testExtYuvConstant0010
     * @tc.desc      Camera constants case 11.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvConstant0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_CONST_0012
     * @tc.name      testExtYuvConstant0011
     * @tc.desc      Camera constants case 12.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvConstant0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_CONST_0013
     * @tc.name      testExtYuvConstant0012
     * @tc.desc      Camera constants case 13.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvConstant0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_CONST_0014
     * @tc.name      testExtYuvConstant0013
     * @tc.desc      Camera constants case 14.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvConstant0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_CONST_0015
     * @tc.name      testExtYuvConstant0014
     * @tc.desc      Camera constants case 15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvConstant0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_CONST_0016
     * @tc.name      testExtYuvConstant0015
     * @tc.desc      Camera constants case 16.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvConstant0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_CONST_0017
     * @tc.name      testExtYuvConstant0016
     * @tc.desc      Camera constants case 17.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvConstant0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_CONST_0018
     * @tc.name      testExtYuvConstant0017
     * @tc.desc      Camera constants case 18.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvConstant0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_CONST_0019
     * @tc.name      testExtYuvConstant0018
     * @tc.desc      Camera constants case 19.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvConstant0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_CONST_0020
     * @tc.name      testExtYuvConstant0019
     * @tc.desc      Camera constants case 20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvConstant0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_CONST_0021
     * @tc.name      testExtYuvConstant0020
     * @tc.desc      Camera constants case 21.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvConstant0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_CONST_0022
     * @tc.name      testExtYuvConstant0021
     * @tc.desc      Camera constants case 22.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvConstant0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_CONST_0023
     * @tc.name      testExtYuvConstant0022
     * @tc.desc      Camera constants case 23.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvConstant0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_CONST_0024
     * @tc.name      testExtYuvConstant0023
     * @tc.desc      Camera constants case 24.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvConstant0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_CONST_0025
     * @tc.name      testExtYuvConstant0024
     * @tc.desc      Camera constants case 25.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvConstant0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_CONST_0026
     * @tc.name      testExtYuvConstant0025
     * @tc.desc      Camera constants case 26.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvConstant0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_CONST_0027
     * @tc.name      testExtYuvConstant0026
     * @tc.desc      Camera constants case 27.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvConstant0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_CONST_0028
     * @tc.name      testExtYuvConstant0027
     * @tc.desc      Camera constants case 28.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvConstant0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_CONST_0029
     * @tc.name      testExtYuvConstant0028
     * @tc.desc      Camera constants case 29.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvConstant0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_CONST_0030
     * @tc.name      testExtYuvConstant0029
     * @tc.desc      Camera constants case 30.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvConstant0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_CONST_0031
     * @tc.name      testExtYuvConstant0030
     * @tc.desc      Camera constants case 31.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvConstant0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_CONST_0032
     * @tc.name      testExtYuvConstant0031
     * @tc.desc      Camera constants case 32.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvConstant0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_CONST_0033
     * @tc.name      testExtYuvConstant0032
     * @tc.desc      Camera constants case 33.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvConstant0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_CONST_0034
     * @tc.name      testExtYuvConstant0033
     * @tc.desc      Camera constants case 34.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvConstant0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_CONST_0035
     * @tc.name      testExtYuvConstant0034
     * @tc.desc      Camera constants case 35.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvConstant0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_CONST_0036
     * @tc.name      testExtYuvConstant0035
     * @tc.desc      Camera constants case 36.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvConstant0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_CONST_0037
     * @tc.name      testExtYuvConstant0036
     * @tc.desc      Camera constants case 37.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvConstant0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_CONST_0038
     * @tc.name      testExtYuvConstant0037
     * @tc.desc      Camera constants case 38.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvConstant0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_CONST_0039
     * @tc.name      testExtYuvConstant0038
     * @tc.desc      Camera constants case 39.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvConstant0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_CONST_0040
     * @tc.name      testExtYuvConstant0039
     * @tc.desc      Camera constants case 40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvConstant0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(CameraConstant.RATIO_PHOTO).assertEqual(4 / 3);
      expect(CameraConstant.RATIO_VIDEO).assertEqual(16 / 9);
      expect(CameraConstant.PERMISSIONS.length).assertEqual(6);
      expect(CameraConstant.PERMISSIONS.indexOf('ohos.permission.CAMERA') >= 0).assertTrue();
    })
  });
}
