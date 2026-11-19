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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import CameraService from '../../../main/ets/mode/CameraService';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF812;
const TAG: string = '[Sample_PhotoSameSource]';



export default function CameraGuardMatrixPart1Test(): void {
  describe('CameraGuardMatrixPart1', () => {

    /**
     * @tc.number    SUB_PHOTO_CGP1_0100
     * @tc.name      testMovingPhotoUnsupported0001
     * @tc.desc      Verify moving photo reports unsupported without a photo output.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMovingPhotoUnsupported0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMovingPhotoUnsupported0001 begin');
      expect(CameraService.isMovingPhotoSupported()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMovingPhotoUnsupported0001 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CGP1_0200
     * @tc.name      testEnableMovingPhotoNoOutput0002
     * @tc.desc      Verify toggling moving photo without an output is safe.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testEnableMovingPhotoNoOutput0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnableMovingPhotoNoOutput0002 begin');
      CameraService.enableMovingPhoto(true);
      CameraService.enableMovingPhoto(false);
      expect(CameraService.isMovingPhotoSupported()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEnableMovingPhotoNoOutput0002 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CGP1_0300
     * @tc.name      testInitFdWithoutContext0003
     * @tc.desc      Verify initFd returns zero when no context is attached.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInitFdWithoutContext0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInitFdWithoutContext0003 begin');
      expect(CameraService.initFd()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInitFdWithoutContext0003 end');
    })

  })
}
