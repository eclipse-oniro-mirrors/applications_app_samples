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
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { common } from '@kit.AbilityKit';
import { camera } from '@kit.CameraKit';
import CameraService from '../../../main/ets/services/CameraService';
import CameraServiceNDK from '../../../main/ets/services/CameraServiceNDK';
import { Resolution } from '../../../main/ets/services/CommonTypes';

const delegator = abilityDelegatorRegistry.getAbilityDelegator();

const TAG: string = '[Sample_avRecorderCameraIntegration]';
const DOMAIN: number = 0xF811;

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

export default function avRecorderCameraIntegrationTest(): void {
  describe('avRecorderCameraIntegrationTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0001
     * @tc.name      testExtRecCamInt0000
     * @tc.desc      CameraService init/select 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraService = new CameraService();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(0);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0002
     * @tc.name      testExtRecCamInt0001
     * @tc.desc      CameraServiceNDK init/select 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraServiceNDK = new CameraServiceNDK();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 720;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(1);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0003
     * @tc.name      testExtRecCamInt0002
     * @tc.desc      CameraService init/select 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraService = new CameraService();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1920;
      resolution.frameHeight = 1080;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(2);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0004
     * @tc.name      testExtRecCamInt0003
     * @tc.desc      CameraServiceNDK init/select 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraServiceNDK = new CameraServiceNDK();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(0);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0005
     * @tc.name      testExtRecCamInt0004
     * @tc.desc      CameraService init/select 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraService = new CameraService();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 720;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(1);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0006
     * @tc.name      testExtRecCamInt0005
     * @tc.desc      CameraServiceNDK init/select 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraServiceNDK = new CameraServiceNDK();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1920;
      resolution.frameHeight = 1080;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(2);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0007
     * @tc.name      testExtRecCamInt0006
     * @tc.desc      CameraService init/select 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraService = new CameraService();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(0);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0008
     * @tc.name      testExtRecCamInt0007
     * @tc.desc      CameraServiceNDK init/select 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraServiceNDK = new CameraServiceNDK();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 720;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(1);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0009
     * @tc.name      testExtRecCamInt0008
     * @tc.desc      CameraService init/select 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraService = new CameraService();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1920;
      resolution.frameHeight = 1080;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(2);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0010
     * @tc.name      testExtRecCamInt0009
     * @tc.desc      CameraServiceNDK init/select 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraServiceNDK = new CameraServiceNDK();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(0);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0011
     * @tc.name      testExtRecCamInt0010
     * @tc.desc      CameraService init/select 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraService = new CameraService();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 720;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(1);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0012
     * @tc.name      testExtRecCamInt0011
     * @tc.desc      CameraServiceNDK init/select 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraServiceNDK = new CameraServiceNDK();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1920;
      resolution.frameHeight = 1080;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(2);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0013
     * @tc.name      testExtRecCamInt0012
     * @tc.desc      CameraService init/select 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraService = new CameraService();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(0);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0014
     * @tc.name      testExtRecCamInt0013
     * @tc.desc      CameraServiceNDK init/select 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraServiceNDK = new CameraServiceNDK();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 720;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(1);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0015
     * @tc.name      testExtRecCamInt0014
     * @tc.desc      CameraService init/select 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraService = new CameraService();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1920;
      resolution.frameHeight = 1080;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(2);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0016
     * @tc.name      testExtRecCamInt0015
     * @tc.desc      CameraServiceNDK init/select 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraServiceNDK = new CameraServiceNDK();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(0);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0017
     * @tc.name      testExtRecCamInt0016
     * @tc.desc      CameraService init/select 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraService = new CameraService();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 720;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(1);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0018
     * @tc.name      testExtRecCamInt0017
     * @tc.desc      CameraServiceNDK init/select 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraServiceNDK = new CameraServiceNDK();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1920;
      resolution.frameHeight = 1080;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(2);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0019
     * @tc.name      testExtRecCamInt0018
     * @tc.desc      CameraService init/select 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraService = new CameraService();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(0);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0020
     * @tc.name      testExtRecCamInt0019
     * @tc.desc      CameraServiceNDK init/select 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraServiceNDK = new CameraServiceNDK();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 720;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(1);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0021
     * @tc.name      testExtRecCamInt0020
     * @tc.desc      CameraService init/select 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraService = new CameraService();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1920;
      resolution.frameHeight = 1080;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(2);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0022
     * @tc.name      testExtRecCamInt0021
     * @tc.desc      CameraServiceNDK init/select 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraServiceNDK = new CameraServiceNDK();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(0);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0023
     * @tc.name      testExtRecCamInt0022
     * @tc.desc      CameraService init/select 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraService = new CameraService();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 720;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(1);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0024
     * @tc.name      testExtRecCamInt0023
     * @tc.desc      CameraServiceNDK init/select 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraServiceNDK = new CameraServiceNDK();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1920;
      resolution.frameHeight = 1080;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(2);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0025
     * @tc.name      testExtRecCamInt0024
     * @tc.desc      CameraService init/select 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraService = new CameraService();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(0);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0026
     * @tc.name      testExtRecCamInt0025
     * @tc.desc      CameraServiceNDK init/select 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraServiceNDK = new CameraServiceNDK();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 720;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(1);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0027
     * @tc.name      testExtRecCamInt0026
     * @tc.desc      CameraService init/select 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraService = new CameraService();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1920;
      resolution.frameHeight = 1080;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(2);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0028
     * @tc.name      testExtRecCamInt0027
     * @tc.desc      CameraServiceNDK init/select 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraServiceNDK = new CameraServiceNDK();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(0);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0029
     * @tc.name      testExtRecCamInt0028
     * @tc.desc      CameraService init/select 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraService = new CameraService();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 720;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(1);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0030
     * @tc.name      testExtRecCamInt0029
     * @tc.desc      CameraServiceNDK init/select 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraServiceNDK = new CameraServiceNDK();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1920;
      resolution.frameHeight = 1080;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(2);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0031
     * @tc.name      testExtRecCamInt0030
     * @tc.desc      CameraService init/select 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraService = new CameraService();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(0);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0032
     * @tc.name      testExtRecCamInt0031
     * @tc.desc      CameraServiceNDK init/select 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraServiceNDK = new CameraServiceNDK();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 720;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(1);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0033
     * @tc.name      testExtRecCamInt0032
     * @tc.desc      CameraService init/select 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraService = new CameraService();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1920;
      resolution.frameHeight = 1080;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(2);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0034
     * @tc.name      testExtRecCamInt0033
     * @tc.desc      CameraServiceNDK init/select 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraServiceNDK = new CameraServiceNDK();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(0);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0035
     * @tc.name      testExtRecCamInt0034
     * @tc.desc      CameraService init/select 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraService = new CameraService();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 720;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(1);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0036
     * @tc.name      testExtRecCamInt0035
     * @tc.desc      CameraServiceNDK init/select 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraServiceNDK = new CameraServiceNDK();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1920;
      resolution.frameHeight = 1080;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(2);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0037
     * @tc.name      testExtRecCamInt0036
     * @tc.desc      CameraService init/select 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraService = new CameraService();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(0);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0038
     * @tc.name      testExtRecCamInt0037
     * @tc.desc      CameraServiceNDK init/select 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraServiceNDK = new CameraServiceNDK();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 720;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(1);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0039
     * @tc.name      testExtRecCamInt0038
     * @tc.desc      CameraService init/select 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraService = new CameraService();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1920;
      resolution.frameHeight = 1080;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(2);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0040
     * @tc.name      testExtRecCamInt0039
     * @tc.desc      CameraServiceNDK init/select 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraServiceNDK = new CameraServiceNDK();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(0);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0041
     * @tc.name      testExtRecCamInt0040
     * @tc.desc      CameraService init/select 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraService = new CameraService();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 720;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(1);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0042
     * @tc.name      testExtRecCamInt0041
     * @tc.desc      CameraServiceNDK init/select 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraServiceNDK = new CameraServiceNDK();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1920;
      resolution.frameHeight = 1080;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(2);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0043
     * @tc.name      testExtRecCamInt0042
     * @tc.desc      CameraService init/select 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraService = new CameraService();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(0);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0044
     * @tc.name      testExtRecCamInt0043
     * @tc.desc      CameraServiceNDK init/select 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraServiceNDK = new CameraServiceNDK();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 720;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(1);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0045
     * @tc.name      testExtRecCamInt0044
     * @tc.desc      CameraService init/select 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraService = new CameraService();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1920;
      resolution.frameHeight = 1080;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(2);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0046
     * @tc.name      testExtRecCamInt0045
     * @tc.desc      CameraServiceNDK init/select 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraServiceNDK = new CameraServiceNDK();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(0);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0047
     * @tc.name      testExtRecCamInt0046
     * @tc.desc      CameraService init/select 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraService = new CameraService();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 720;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(1);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0048
     * @tc.name      testExtRecCamInt0047
     * @tc.desc      CameraServiceNDK init/select 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraServiceNDK = new CameraServiceNDK();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1920;
      resolution.frameHeight = 1080;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(2);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0049
     * @tc.name      testExtRecCamInt0048
     * @tc.desc      CameraService init/select 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraService = new CameraService();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(0);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0050
     * @tc.name      testExtRecCamInt0049
     * @tc.desc      CameraServiceNDK init/select 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraServiceNDK = new CameraServiceNDK();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 720;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(1);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0051
     * @tc.name      testExtRecCamInt0050
     * @tc.desc      CameraService init/select 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraService = new CameraService();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1920;
      resolution.frameHeight = 1080;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(2);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0052
     * @tc.name      testExtRecCamInt0051
     * @tc.desc      CameraServiceNDK init/select 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraServiceNDK = new CameraServiceNDK();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(0);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0053
     * @tc.name      testExtRecCamInt0052
     * @tc.desc      CameraService init/select 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraService = new CameraService();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 720;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(1);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0054
     * @tc.name      testExtRecCamInt0053
     * @tc.desc      CameraServiceNDK init/select 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraServiceNDK = new CameraServiceNDK();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1920;
      resolution.frameHeight = 1080;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(2);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0055
     * @tc.name      testExtRecCamInt0054
     * @tc.desc      CameraService init/select 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraService = new CameraService();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(0);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0056
     * @tc.name      testExtRecCamInt0055
     * @tc.desc      CameraServiceNDK init/select 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraServiceNDK = new CameraServiceNDK();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 720;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(1);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0057
     * @tc.name      testExtRecCamInt0056
     * @tc.desc      CameraService init/select 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraService = new CameraService();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1920;
      resolution.frameHeight = 1080;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(2);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0058
     * @tc.name      testExtRecCamInt0057
     * @tc.desc      CameraServiceNDK init/select 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraServiceNDK = new CameraServiceNDK();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(0);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0059
     * @tc.name      testExtRecCamInt0058
     * @tc.desc      CameraService init/select 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraService = new CameraService();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 720;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(1);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMINT_0060
     * @tc.name      testExtRecCamInt0059
     * @tc.desc      CameraServiceNDK init/select 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamInt0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: CameraServiceNDK = new CameraServiceNDK();
      service.init(context);
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1920;
      resolution.frameHeight = 1080;
      const profileList: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } }
      ];
      expect(service.selectProfile(profileList, resolution)).assertEqual(2);
      await service.release();
      expect(context.filesDir.length).assertLarger(0);
    })
  });
}
