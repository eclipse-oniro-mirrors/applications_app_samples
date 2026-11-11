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
import CameraServiceNDK from '../../../main/ets/services/CameraServiceNDK';
import { Resolution } from '../../../main/ets/services/CommonTypes';
import { camera } from '@kit.CameraKit';

const TAG: string = '[Sample_avRecorderCameraNativeSelection]';
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
  assertClose(expectValue: number, precision: number): void;
  assertUndefined(): void;
  assertFail(): void;
}

function expect(actual: string | number | boolean | Object | null | undefined): ExpectAssert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function avRecorderCameraNativeSelectionTest(): void {
  describe('avRecorderCameraNDKSelectionTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKCAM_0001
     * @tc.name      testExtRecNativeCam0000
     * @tc.desc      Native camera selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0001
     * @tc.desc      Native camera selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0002
     * @tc.desc      Native camera selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0003
     * @tc.desc      Native camera selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0004
     * @tc.desc      Native camera selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0005
     * @tc.desc      Native camera selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0006
     * @tc.desc      Native camera selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0007
     * @tc.desc      Native camera selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0008
     * @tc.desc      Native camera selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0009
     * @tc.desc      Native camera selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0010
     * @tc.desc      Native camera selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0011
     * @tc.desc      Native camera selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0012
     * @tc.desc      Native camera selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0013
     * @tc.desc      Native camera selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0014
     * @tc.desc      Native camera selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0015
     * @tc.desc      Native camera selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0016
     * @tc.desc      Native camera selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0017
     * @tc.desc      Native camera selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0018
     * @tc.desc      Native camera selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0019
     * @tc.desc      Native camera selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0020
     * @tc.desc      Native camera selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0021
     * @tc.desc      Native camera selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0022
     * @tc.desc      Native camera selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0023
     * @tc.desc      Native camera selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0024
     * @tc.desc      Native camera selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0025
     * @tc.desc      Native camera selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0026
     * @tc.desc      Native camera selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0027
     * @tc.desc      Native camera selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0028
     * @tc.desc      Native camera selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0029
     * @tc.desc      Native camera selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0030
     * @tc.desc      Native camera selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0031
     * @tc.desc      Native camera selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0032
     * @tc.desc      Native camera selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0033
     * @tc.desc      Native camera selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0034
     * @tc.desc      Native camera selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0035
     * @tc.desc      Native camera selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0036
     * @tc.desc      Native camera selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0037
     * @tc.desc      Native camera selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0038
     * @tc.desc      Native camera selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0039
     * @tc.desc      Native camera selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0040
     * @tc.desc      Native camera selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0041
     * @tc.desc      Native camera selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0042
     * @tc.desc      Native camera selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0043
     * @tc.desc      Native camera selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0044
     * @tc.desc      Native camera selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0045
     * @tc.desc      Native camera selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0046
     * @tc.desc      Native camera selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0047
     * @tc.desc      Native camera selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0048
     * @tc.desc      Native camera selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0049
     * @tc.desc      Native camera selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0050
     * @tc.desc      Native camera selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0051
     * @tc.desc      Native camera selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0052
     * @tc.desc      Native camera selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0053
     * @tc.desc      Native camera selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0054
     * @tc.desc      Native camera selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0055
     * @tc.desc      Native camera selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0056
     * @tc.desc      Native camera selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0057
     * @tc.desc      Native camera selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0058
     * @tc.desc      Native camera selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0059
     * @tc.desc      Native camera selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0060
     * @tc.desc      Native camera selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0061
     * @tc.desc      Native camera selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0062
     * @tc.desc      Native camera selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0063
     * @tc.desc      Native camera selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0064
     * @tc.desc      Native camera selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0065
     * @tc.desc      Native camera selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0066
     * @tc.desc      Native camera selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0067
     * @tc.desc      Native camera selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0068
     * @tc.desc      Native camera selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0069
     * @tc.desc      Native camera selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0070
     * @tc.desc      Native camera selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0071
     * @tc.desc      Native camera selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0072
     * @tc.desc      Native camera selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0073
     * @tc.desc      Native camera selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0074
     * @tc.desc      Native camera selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.name      testExtRecNativeCam0075
     * @tc.desc      Native camera selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeCam0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
