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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeEach, TestType, Size, Level, Assert } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import CameraServiceNDK from '../../../main/ets/services/CameraServiceNDK';
import { Resolution } from '../../../main/ets/services/CommonTypes';
import { camera } from '@kit.CameraKit';

const TAG: string = '[Sample_avRecorderCameraNDKSelection]';
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

function expect(actual: string | number | boolean | Object | null | undefined): Assert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function avRecorderCameraNDKSelectionTest(): void {
  describe('avRecorderCameraNDKSelectionTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0001
     * @tc.name      testExtRecNdkCam0000
     * @tc.desc      NDK camera selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(0);
      expect(profiles[selected].size.width).assertEqual(640);
      expect(profiles[selected].size.height).assertEqual(480);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0002
     * @tc.name      testExtRecNdkCam0001
     * @tc.desc      NDK camera selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 720;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(1);
      expect(profiles[selected].size.width).assertEqual(1280);
      expect(profiles[selected].size.height).assertEqual(720);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0003
     * @tc.name      testExtRecNdkCam0002
     * @tc.desc      NDK camera selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1920;
      resolution.frameHeight = 1080;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(2);
      expect(profiles[selected].size.width).assertEqual(1920);
      expect(profiles[selected].size.height).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0004
     * @tc.name      testExtRecNdkCam0003
     * @tc.desc      NDK camera selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 3840;
      resolution.frameHeight = 2160;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(3);
      expect(profiles[selected].size.width).assertEqual(3840);
      expect(profiles[selected].size.height).assertEqual(2160);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0005
     * @tc.name      testExtRecNdkCam0004
     * @tc.desc      NDK camera selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(0);
      expect(profiles[selected].size.width).assertEqual(640);
      expect(profiles[selected].size.height).assertEqual(480);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0006
     * @tc.name      testExtRecNdkCam0005
     * @tc.desc      NDK camera selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 720;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(1);
      expect(profiles[selected].size.width).assertEqual(1280);
      expect(profiles[selected].size.height).assertEqual(720);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0007
     * @tc.name      testExtRecNdkCam0006
     * @tc.desc      NDK camera selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1920;
      resolution.frameHeight = 1080;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(2);
      expect(profiles[selected].size.width).assertEqual(1920);
      expect(profiles[selected].size.height).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0008
     * @tc.name      testExtRecNdkCam0007
     * @tc.desc      NDK camera selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 3840;
      resolution.frameHeight = 2160;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(3);
      expect(profiles[selected].size.width).assertEqual(3840);
      expect(profiles[selected].size.height).assertEqual(2160);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0009
     * @tc.name      testExtRecNdkCam0008
     * @tc.desc      NDK camera selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(0);
      expect(profiles[selected].size.width).assertEqual(640);
      expect(profiles[selected].size.height).assertEqual(480);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0010
     * @tc.name      testExtRecNdkCam0009
     * @tc.desc      NDK camera selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 720;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(1);
      expect(profiles[selected].size.width).assertEqual(1280);
      expect(profiles[selected].size.height).assertEqual(720);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0011
     * @tc.name      testExtRecNdkCam0010
     * @tc.desc      NDK camera selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1920;
      resolution.frameHeight = 1080;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(2);
      expect(profiles[selected].size.width).assertEqual(1920);
      expect(profiles[selected].size.height).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0012
     * @tc.name      testExtRecNdkCam0011
     * @tc.desc      NDK camera selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 3840;
      resolution.frameHeight = 2160;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(3);
      expect(profiles[selected].size.width).assertEqual(3840);
      expect(profiles[selected].size.height).assertEqual(2160);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0013
     * @tc.name      testExtRecNdkCam0012
     * @tc.desc      NDK camera selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(0);
      expect(profiles[selected].size.width).assertEqual(640);
      expect(profiles[selected].size.height).assertEqual(480);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0014
     * @tc.name      testExtRecNdkCam0013
     * @tc.desc      NDK camera selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 720;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(1);
      expect(profiles[selected].size.width).assertEqual(1280);
      expect(profiles[selected].size.height).assertEqual(720);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0015
     * @tc.name      testExtRecNdkCam0014
     * @tc.desc      NDK camera selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1920;
      resolution.frameHeight = 1080;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(2);
      expect(profiles[selected].size.width).assertEqual(1920);
      expect(profiles[selected].size.height).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0016
     * @tc.name      testExtRecNdkCam0015
     * @tc.desc      NDK camera selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 3840;
      resolution.frameHeight = 2160;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(3);
      expect(profiles[selected].size.width).assertEqual(3840);
      expect(profiles[selected].size.height).assertEqual(2160);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0017
     * @tc.name      testExtRecNdkCam0016
     * @tc.desc      NDK camera selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(0);
      expect(profiles[selected].size.width).assertEqual(640);
      expect(profiles[selected].size.height).assertEqual(480);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0018
     * @tc.name      testExtRecNdkCam0017
     * @tc.desc      NDK camera selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 720;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(1);
      expect(profiles[selected].size.width).assertEqual(1280);
      expect(profiles[selected].size.height).assertEqual(720);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0019
     * @tc.name      testExtRecNdkCam0018
     * @tc.desc      NDK camera selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1920;
      resolution.frameHeight = 1080;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(2);
      expect(profiles[selected].size.width).assertEqual(1920);
      expect(profiles[selected].size.height).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0020
     * @tc.name      testExtRecNdkCam0019
     * @tc.desc      NDK camera selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 3840;
      resolution.frameHeight = 2160;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(3);
      expect(profiles[selected].size.width).assertEqual(3840);
      expect(profiles[selected].size.height).assertEqual(2160);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0021
     * @tc.name      testExtRecNdkCam0020
     * @tc.desc      NDK camera selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(0);
      expect(profiles[selected].size.width).assertEqual(640);
      expect(profiles[selected].size.height).assertEqual(480);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0022
     * @tc.name      testExtRecNdkCam0021
     * @tc.desc      NDK camera selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 720;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(1);
      expect(profiles[selected].size.width).assertEqual(1280);
      expect(profiles[selected].size.height).assertEqual(720);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0023
     * @tc.name      testExtRecNdkCam0022
     * @tc.desc      NDK camera selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1920;
      resolution.frameHeight = 1080;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(2);
      expect(profiles[selected].size.width).assertEqual(1920);
      expect(profiles[selected].size.height).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0024
     * @tc.name      testExtRecNdkCam0023
     * @tc.desc      NDK camera selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 3840;
      resolution.frameHeight = 2160;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(3);
      expect(profiles[selected].size.width).assertEqual(3840);
      expect(profiles[selected].size.height).assertEqual(2160);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0025
     * @tc.name      testExtRecNdkCam0024
     * @tc.desc      NDK camera selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(0);
      expect(profiles[selected].size.width).assertEqual(640);
      expect(profiles[selected].size.height).assertEqual(480);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0026
     * @tc.name      testExtRecNdkCam0025
     * @tc.desc      NDK camera selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 720;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(1);
      expect(profiles[selected].size.width).assertEqual(1280);
      expect(profiles[selected].size.height).assertEqual(720);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0027
     * @tc.name      testExtRecNdkCam0026
     * @tc.desc      NDK camera selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1920;
      resolution.frameHeight = 1080;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(2);
      expect(profiles[selected].size.width).assertEqual(1920);
      expect(profiles[selected].size.height).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0028
     * @tc.name      testExtRecNdkCam0027
     * @tc.desc      NDK camera selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 3840;
      resolution.frameHeight = 2160;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(3);
      expect(profiles[selected].size.width).assertEqual(3840);
      expect(profiles[selected].size.height).assertEqual(2160);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0029
     * @tc.name      testExtRecNdkCam0028
     * @tc.desc      NDK camera selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(0);
      expect(profiles[selected].size.width).assertEqual(640);
      expect(profiles[selected].size.height).assertEqual(480);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0030
     * @tc.name      testExtRecNdkCam0029
     * @tc.desc      NDK camera selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 720;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(1);
      expect(profiles[selected].size.width).assertEqual(1280);
      expect(profiles[selected].size.height).assertEqual(720);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0031
     * @tc.name      testExtRecNdkCam0030
     * @tc.desc      NDK camera selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1920;
      resolution.frameHeight = 1080;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(2);
      expect(profiles[selected].size.width).assertEqual(1920);
      expect(profiles[selected].size.height).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0032
     * @tc.name      testExtRecNdkCam0031
     * @tc.desc      NDK camera selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 3840;
      resolution.frameHeight = 2160;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(3);
      expect(profiles[selected].size.width).assertEqual(3840);
      expect(profiles[selected].size.height).assertEqual(2160);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0033
     * @tc.name      testExtRecNdkCam0032
     * @tc.desc      NDK camera selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(0);
      expect(profiles[selected].size.width).assertEqual(640);
      expect(profiles[selected].size.height).assertEqual(480);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0034
     * @tc.name      testExtRecNdkCam0033
     * @tc.desc      NDK camera selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 720;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(1);
      expect(profiles[selected].size.width).assertEqual(1280);
      expect(profiles[selected].size.height).assertEqual(720);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0035
     * @tc.name      testExtRecNdkCam0034
     * @tc.desc      NDK camera selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1920;
      resolution.frameHeight = 1080;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(2);
      expect(profiles[selected].size.width).assertEqual(1920);
      expect(profiles[selected].size.height).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0036
     * @tc.name      testExtRecNdkCam0035
     * @tc.desc      NDK camera selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 3840;
      resolution.frameHeight = 2160;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(3);
      expect(profiles[selected].size.width).assertEqual(3840);
      expect(profiles[selected].size.height).assertEqual(2160);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0037
     * @tc.name      testExtRecNdkCam0036
     * @tc.desc      NDK camera selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(0);
      expect(profiles[selected].size.width).assertEqual(640);
      expect(profiles[selected].size.height).assertEqual(480);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0038
     * @tc.name      testExtRecNdkCam0037
     * @tc.desc      NDK camera selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 720;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(1);
      expect(profiles[selected].size.width).assertEqual(1280);
      expect(profiles[selected].size.height).assertEqual(720);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0039
     * @tc.name      testExtRecNdkCam0038
     * @tc.desc      NDK camera selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1920;
      resolution.frameHeight = 1080;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(2);
      expect(profiles[selected].size.width).assertEqual(1920);
      expect(profiles[selected].size.height).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0040
     * @tc.name      testExtRecNdkCam0039
     * @tc.desc      NDK camera selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 3840;
      resolution.frameHeight = 2160;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(3);
      expect(profiles[selected].size.width).assertEqual(3840);
      expect(profiles[selected].size.height).assertEqual(2160);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0041
     * @tc.name      testExtRecNdkCam0040
     * @tc.desc      NDK camera selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(0);
      expect(profiles[selected].size.width).assertEqual(640);
      expect(profiles[selected].size.height).assertEqual(480);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0042
     * @tc.name      testExtRecNdkCam0041
     * @tc.desc      NDK camera selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 720;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(1);
      expect(profiles[selected].size.width).assertEqual(1280);
      expect(profiles[selected].size.height).assertEqual(720);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0043
     * @tc.name      testExtRecNdkCam0042
     * @tc.desc      NDK camera selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1920;
      resolution.frameHeight = 1080;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(2);
      expect(profiles[selected].size.width).assertEqual(1920);
      expect(profiles[selected].size.height).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0044
     * @tc.name      testExtRecNdkCam0043
     * @tc.desc      NDK camera selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 3840;
      resolution.frameHeight = 2160;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(3);
      expect(profiles[selected].size.width).assertEqual(3840);
      expect(profiles[selected].size.height).assertEqual(2160);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0045
     * @tc.name      testExtRecNdkCam0044
     * @tc.desc      NDK camera selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(0);
      expect(profiles[selected].size.width).assertEqual(640);
      expect(profiles[selected].size.height).assertEqual(480);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0046
     * @tc.name      testExtRecNdkCam0045
     * @tc.desc      NDK camera selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 720;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(1);
      expect(profiles[selected].size.width).assertEqual(1280);
      expect(profiles[selected].size.height).assertEqual(720);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0047
     * @tc.name      testExtRecNdkCam0046
     * @tc.desc      NDK camera selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1920;
      resolution.frameHeight = 1080;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(2);
      expect(profiles[selected].size.width).assertEqual(1920);
      expect(profiles[selected].size.height).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0048
     * @tc.name      testExtRecNdkCam0047
     * @tc.desc      NDK camera selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 3840;
      resolution.frameHeight = 2160;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(3);
      expect(profiles[selected].size.width).assertEqual(3840);
      expect(profiles[selected].size.height).assertEqual(2160);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0049
     * @tc.name      testExtRecNdkCam0048
     * @tc.desc      NDK camera selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(0);
      expect(profiles[selected].size.width).assertEqual(640);
      expect(profiles[selected].size.height).assertEqual(480);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0050
     * @tc.name      testExtRecNdkCam0049
     * @tc.desc      NDK camera selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 720;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(1);
      expect(profiles[selected].size.width).assertEqual(1280);
      expect(profiles[selected].size.height).assertEqual(720);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0051
     * @tc.name      testExtRecNdkCam0050
     * @tc.desc      NDK camera selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1920;
      resolution.frameHeight = 1080;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(2);
      expect(profiles[selected].size.width).assertEqual(1920);
      expect(profiles[selected].size.height).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0052
     * @tc.name      testExtRecNdkCam0051
     * @tc.desc      NDK camera selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 3840;
      resolution.frameHeight = 2160;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(3);
      expect(profiles[selected].size.width).assertEqual(3840);
      expect(profiles[selected].size.height).assertEqual(2160);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0053
     * @tc.name      testExtRecNdkCam0052
     * @tc.desc      NDK camera selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(0);
      expect(profiles[selected].size.width).assertEqual(640);
      expect(profiles[selected].size.height).assertEqual(480);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0054
     * @tc.name      testExtRecNdkCam0053
     * @tc.desc      NDK camera selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 720;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(1);
      expect(profiles[selected].size.width).assertEqual(1280);
      expect(profiles[selected].size.height).assertEqual(720);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0055
     * @tc.name      testExtRecNdkCam0054
     * @tc.desc      NDK camera selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1920;
      resolution.frameHeight = 1080;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(2);
      expect(profiles[selected].size.width).assertEqual(1920);
      expect(profiles[selected].size.height).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0056
     * @tc.name      testExtRecNdkCam0055
     * @tc.desc      NDK camera selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 3840;
      resolution.frameHeight = 2160;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(3);
      expect(profiles[selected].size.width).assertEqual(3840);
      expect(profiles[selected].size.height).assertEqual(2160);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0057
     * @tc.name      testExtRecNdkCam0056
     * @tc.desc      NDK camera selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(0);
      expect(profiles[selected].size.width).assertEqual(640);
      expect(profiles[selected].size.height).assertEqual(480);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0058
     * @tc.name      testExtRecNdkCam0057
     * @tc.desc      NDK camera selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 720;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(1);
      expect(profiles[selected].size.width).assertEqual(1280);
      expect(profiles[selected].size.height).assertEqual(720);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0059
     * @tc.name      testExtRecNdkCam0058
     * @tc.desc      NDK camera selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1920;
      resolution.frameHeight = 1080;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(2);
      expect(profiles[selected].size.width).assertEqual(1920);
      expect(profiles[selected].size.height).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0060
     * @tc.name      testExtRecNdkCam0059
     * @tc.desc      NDK camera selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 3840;
      resolution.frameHeight = 2160;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(3);
      expect(profiles[selected].size.width).assertEqual(3840);
      expect(profiles[selected].size.height).assertEqual(2160);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0061
     * @tc.name      testExtRecNdkCam0060
     * @tc.desc      NDK camera selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(0);
      expect(profiles[selected].size.width).assertEqual(640);
      expect(profiles[selected].size.height).assertEqual(480);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0062
     * @tc.name      testExtRecNdkCam0061
     * @tc.desc      NDK camera selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 720;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(1);
      expect(profiles[selected].size.width).assertEqual(1280);
      expect(profiles[selected].size.height).assertEqual(720);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0063
     * @tc.name      testExtRecNdkCam0062
     * @tc.desc      NDK camera selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1920;
      resolution.frameHeight = 1080;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(2);
      expect(profiles[selected].size.width).assertEqual(1920);
      expect(profiles[selected].size.height).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0064
     * @tc.name      testExtRecNdkCam0063
     * @tc.desc      NDK camera selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 3840;
      resolution.frameHeight = 2160;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(3);
      expect(profiles[selected].size.width).assertEqual(3840);
      expect(profiles[selected].size.height).assertEqual(2160);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0065
     * @tc.name      testExtRecNdkCam0064
     * @tc.desc      NDK camera selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(0);
      expect(profiles[selected].size.width).assertEqual(640);
      expect(profiles[selected].size.height).assertEqual(480);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0066
     * @tc.name      testExtRecNdkCam0065
     * @tc.desc      NDK camera selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 720;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(1);
      expect(profiles[selected].size.width).assertEqual(1280);
      expect(profiles[selected].size.height).assertEqual(720);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0067
     * @tc.name      testExtRecNdkCam0066
     * @tc.desc      NDK camera selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1920;
      resolution.frameHeight = 1080;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(2);
      expect(profiles[selected].size.width).assertEqual(1920);
      expect(profiles[selected].size.height).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0068
     * @tc.name      testExtRecNdkCam0067
     * @tc.desc      NDK camera selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 3840;
      resolution.frameHeight = 2160;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(3);
      expect(profiles[selected].size.width).assertEqual(3840);
      expect(profiles[selected].size.height).assertEqual(2160);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0069
     * @tc.name      testExtRecNdkCam0068
     * @tc.desc      NDK camera selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(0);
      expect(profiles[selected].size.width).assertEqual(640);
      expect(profiles[selected].size.height).assertEqual(480);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0070
     * @tc.name      testExtRecNdkCam0069
     * @tc.desc      NDK camera selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 720;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(1);
      expect(profiles[selected].size.width).assertEqual(1280);
      expect(profiles[selected].size.height).assertEqual(720);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0071
     * @tc.name      testExtRecNdkCam0070
     * @tc.desc      NDK camera selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1920;
      resolution.frameHeight = 1080;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(2);
      expect(profiles[selected].size.width).assertEqual(1920);
      expect(profiles[selected].size.height).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0072
     * @tc.name      testExtRecNdkCam0071
     * @tc.desc      NDK camera selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 3840;
      resolution.frameHeight = 2160;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(3);
      expect(profiles[selected].size.width).assertEqual(3840);
      expect(profiles[selected].size.height).assertEqual(2160);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0073
     * @tc.name      testExtRecNdkCam0072
     * @tc.desc      NDK camera selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(0);
      expect(profiles[selected].size.width).assertEqual(640);
      expect(profiles[selected].size.height).assertEqual(480);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0074
     * @tc.name      testExtRecNdkCam0073
     * @tc.desc      NDK camera selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1280;
      resolution.frameHeight = 720;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(1);
      expect(profiles[selected].size.width).assertEqual(1280);
      expect(profiles[selected].size.height).assertEqual(720);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0075
     * @tc.name      testExtRecNdkCam0074
     * @tc.desc      NDK camera selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 1920;
      resolution.frameHeight = 1080;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(2);
      expect(profiles[selected].size.width).assertEqual(1920);
      expect(profiles[selected].size.height).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0076
     * @tc.name      testExtRecNdkCam0075
     * @tc.desc      NDK camera selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkCam0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      const resolution: Resolution = new Resolution();
      resolution.frameWidth = 3840;
      resolution.frameHeight = 2160;
      const profiles: camera.Profile[] = [
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 640, height: 480 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1280, height: 720 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 1920, height: 1080 } },
        { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3840, height: 2160 } }
      ];
      const selected: number = service.selectProfile(profiles, resolution);
      expect(selected).assertEqual(3);
      expect(profiles[selected].size.width).assertEqual(3840);
      expect(profiles[selected].size.height).assertEqual(2160);
    })
  });
}
