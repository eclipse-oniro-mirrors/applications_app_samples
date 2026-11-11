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
import CameraService from '../../../main/ets/services/CameraService';
import { Resolution } from '../../../main/ets/services/CommonTypes';
import { camera } from '@kit.CameraKit';

const TAG: string = '[Sample_avRecorderCameraSelection]';
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

export default function avRecorderCameraSelectionTest(): void {
  describe('avRecorderCameraSelectionTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0001
     * @tc.name      testExtRecCameraSelect0000
     * @tc.desc      CameraService selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0002
     * @tc.name      testExtRecCameraSelect0001
     * @tc.desc      CameraService selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0003
     * @tc.name      testExtRecCameraSelect0002
     * @tc.desc      CameraService selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0004
     * @tc.name      testExtRecCameraSelect0003
     * @tc.desc      CameraService selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0005
     * @tc.name      testExtRecCameraSelect0004
     * @tc.desc      CameraService selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0006
     * @tc.name      testExtRecCameraSelect0005
     * @tc.desc      CameraService selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0007
     * @tc.name      testExtRecCameraSelect0006
     * @tc.desc      CameraService selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0008
     * @tc.name      testExtRecCameraSelect0007
     * @tc.desc      CameraService selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0009
     * @tc.name      testExtRecCameraSelect0008
     * @tc.desc      CameraService selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0010
     * @tc.name      testExtRecCameraSelect0009
     * @tc.desc      CameraService selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0011
     * @tc.name      testExtRecCameraSelect0010
     * @tc.desc      CameraService selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0012
     * @tc.name      testExtRecCameraSelect0011
     * @tc.desc      CameraService selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0013
     * @tc.name      testExtRecCameraSelect0012
     * @tc.desc      CameraService selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0014
     * @tc.name      testExtRecCameraSelect0013
     * @tc.desc      CameraService selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0015
     * @tc.name      testExtRecCameraSelect0014
     * @tc.desc      CameraService selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0016
     * @tc.name      testExtRecCameraSelect0015
     * @tc.desc      CameraService selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0017
     * @tc.name      testExtRecCameraSelect0016
     * @tc.desc      CameraService selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0018
     * @tc.name      testExtRecCameraSelect0017
     * @tc.desc      CameraService selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0019
     * @tc.name      testExtRecCameraSelect0018
     * @tc.desc      CameraService selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0020
     * @tc.name      testExtRecCameraSelect0019
     * @tc.desc      CameraService selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0021
     * @tc.name      testExtRecCameraSelect0020
     * @tc.desc      CameraService selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0022
     * @tc.name      testExtRecCameraSelect0021
     * @tc.desc      CameraService selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0023
     * @tc.name      testExtRecCameraSelect0022
     * @tc.desc      CameraService selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0024
     * @tc.name      testExtRecCameraSelect0023
     * @tc.desc      CameraService selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0025
     * @tc.name      testExtRecCameraSelect0024
     * @tc.desc      CameraService selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0026
     * @tc.name      testExtRecCameraSelect0025
     * @tc.desc      CameraService selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0027
     * @tc.name      testExtRecCameraSelect0026
     * @tc.desc      CameraService selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0028
     * @tc.name      testExtRecCameraSelect0027
     * @tc.desc      CameraService selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0029
     * @tc.name      testExtRecCameraSelect0028
     * @tc.desc      CameraService selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0030
     * @tc.name      testExtRecCameraSelect0029
     * @tc.desc      CameraService selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0031
     * @tc.name      testExtRecCameraSelect0030
     * @tc.desc      CameraService selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0032
     * @tc.name      testExtRecCameraSelect0031
     * @tc.desc      CameraService selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0033
     * @tc.name      testExtRecCameraSelect0032
     * @tc.desc      CameraService selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0034
     * @tc.name      testExtRecCameraSelect0033
     * @tc.desc      CameraService selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0035
     * @tc.name      testExtRecCameraSelect0034
     * @tc.desc      CameraService selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0036
     * @tc.name      testExtRecCameraSelect0035
     * @tc.desc      CameraService selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0037
     * @tc.name      testExtRecCameraSelect0036
     * @tc.desc      CameraService selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0038
     * @tc.name      testExtRecCameraSelect0037
     * @tc.desc      CameraService selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0039
     * @tc.name      testExtRecCameraSelect0038
     * @tc.desc      CameraService selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0040
     * @tc.name      testExtRecCameraSelect0039
     * @tc.desc      CameraService selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0041
     * @tc.name      testExtRecCameraSelect0040
     * @tc.desc      CameraService selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0042
     * @tc.name      testExtRecCameraSelect0041
     * @tc.desc      CameraService selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0043
     * @tc.name      testExtRecCameraSelect0042
     * @tc.desc      CameraService selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0044
     * @tc.name      testExtRecCameraSelect0043
     * @tc.desc      CameraService selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0045
     * @tc.name      testExtRecCameraSelect0044
     * @tc.desc      CameraService selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0046
     * @tc.name      testExtRecCameraSelect0045
     * @tc.desc      CameraService selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0047
     * @tc.name      testExtRecCameraSelect0046
     * @tc.desc      CameraService selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0048
     * @tc.name      testExtRecCameraSelect0047
     * @tc.desc      CameraService selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0049
     * @tc.name      testExtRecCameraSelect0048
     * @tc.desc      CameraService selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0050
     * @tc.name      testExtRecCameraSelect0049
     * @tc.desc      CameraService selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0051
     * @tc.name      testExtRecCameraSelect0050
     * @tc.desc      CameraService selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0052
     * @tc.name      testExtRecCameraSelect0051
     * @tc.desc      CameraService selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0053
     * @tc.name      testExtRecCameraSelect0052
     * @tc.desc      CameraService selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0054
     * @tc.name      testExtRecCameraSelect0053
     * @tc.desc      CameraService selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0055
     * @tc.name      testExtRecCameraSelect0054
     * @tc.desc      CameraService selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0056
     * @tc.name      testExtRecCameraSelect0055
     * @tc.desc      CameraService selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0057
     * @tc.name      testExtRecCameraSelect0056
     * @tc.desc      CameraService selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0058
     * @tc.name      testExtRecCameraSelect0057
     * @tc.desc      CameraService selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0059
     * @tc.name      testExtRecCameraSelect0058
     * @tc.desc      CameraService selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0060
     * @tc.name      testExtRecCameraSelect0059
     * @tc.desc      CameraService selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0061
     * @tc.name      testExtRecCameraSelect0060
     * @tc.desc      CameraService selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0062
     * @tc.name      testExtRecCameraSelect0061
     * @tc.desc      CameraService selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0063
     * @tc.name      testExtRecCameraSelect0062
     * @tc.desc      CameraService selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0064
     * @tc.name      testExtRecCameraSelect0063
     * @tc.desc      CameraService selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0065
     * @tc.name      testExtRecCameraSelect0064
     * @tc.desc      CameraService selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0066
     * @tc.name      testExtRecCameraSelect0065
     * @tc.desc      CameraService selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0067
     * @tc.name      testExtRecCameraSelect0066
     * @tc.desc      CameraService selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0068
     * @tc.name      testExtRecCameraSelect0067
     * @tc.desc      CameraService selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0069
     * @tc.name      testExtRecCameraSelect0068
     * @tc.desc      CameraService selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0070
     * @tc.name      testExtRecCameraSelect0069
     * @tc.desc      CameraService selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0071
     * @tc.name      testExtRecCameraSelect0070
     * @tc.desc      CameraService selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0072
     * @tc.name      testExtRecCameraSelect0071
     * @tc.desc      CameraService selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0073
     * @tc.name      testExtRecCameraSelect0072
     * @tc.desc      CameraService selects 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0074
     * @tc.name      testExtRecCameraSelect0073
     * @tc.desc      CameraService selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0075
     * @tc.name      testExtRecCameraSelect0074
     * @tc.desc      CameraService selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMSELECT_0076
     * @tc.name      testExtRecCameraSelect0075
     * @tc.desc      CameraService selects 3840x2160.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCameraSelect0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
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
