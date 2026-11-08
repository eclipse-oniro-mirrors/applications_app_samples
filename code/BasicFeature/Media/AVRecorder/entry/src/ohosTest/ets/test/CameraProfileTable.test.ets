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
import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { camera } from '@kit.CameraKit';
import CameraService from '../../../main/ets/services/CameraService';
import { Resolution } from '../../../main/ets/services/CommonTypes';
import { paceTurn } from './TestPace';

function preview(width: number, height: number): camera.Profile {
  return {
    format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP,
    size: { width: width, height: height }
  };
}

function video(width: number, height: number): camera.VideoProfile {
  return {
    format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP,
    size: { width: width, height: height },
    frameRateRange: { min: 30, max: 60 }
  };
}

function res(width: number, height: number): Resolution {
  return { frameWidth: width, frameHeight: height } as Resolution;
}

function previewMatches(profiles: camera.Profile[], target: Resolution): number {
  let count: number = 0;
  for (let i = 0; i < profiles.length; i++) {
    if (profiles[i].size.width === target.frameWidth && profiles[i].size.height === target.frameHeight) {
      count++;
    }
  }
  return count;
}

function videoMatches(profiles: camera.VideoProfile[], target: Resolution): number {
  let count: number = 0;
  for (let i = 0; i < profiles.length; i++) {
    if (profiles[i].size.width === target.frameWidth && profiles[i].size.height === target.frameHeight) {
      count++;
    }
  }
  return count;
}

export default function cameraProfileTableTest() {
  describe('cameraProfileTableTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_0100
     * @tc.name testCameraTable0001
     * @tc.desc Verify selectVideoProfile returns the first exact 640x480 match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.VideoProfile[] = [video(640, 480)];
      const target: Resolution = res(640, 480);
      const index: number = service.selectVideoProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(640);
      expect(profiles[index].size.height).assertEqual(480);
      expect(videoMatches(profiles, target)).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_0200
     * @tc.name testCameraTable0002
     * @tc.desc Verify selectProfile falls back to index 0 when 2048x1536 is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(1280, 720), preview(1920, 1080)];
      const target: Resolution = res(2048, 1536);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(1280);
      expect(profiles[index].size.height).assertEqual(720);
      expect(previewMatches(profiles, target)).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_0300
     * @tc.name testCameraTable0003
     * @tc.desc Verify selectProfile returns the first exact 3840x2160 match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(1920, 1080), preview(2560, 1440), preview(3840, 2160)];
      const target: Resolution = res(3840, 2160);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(2);
      expect(profiles[index].size.width).assertEqual(3840);
      expect(profiles[index].size.height).assertEqual(2160);
      expect(previewMatches(profiles, target)).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_0400
     * @tc.name testCameraTable0004
     * @tc.desc Verify selectVideoProfile falls back to index 0 when 2048x1536 is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.VideoProfile[] = [
        video(2560, 1440),
        video(3840, 2160),
        video(800, 600),
        video(1080, 1920)
      ];
      const target: Resolution = res(2048, 1536);
      const index: number = service.selectVideoProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(2560);
      expect(profiles[index].size.height).assertEqual(1440);
      expect(videoMatches(profiles, target)).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_0500
     * @tc.name testCameraTable0005
     * @tc.desc Verify selectProfile returns the first exact 640x480 match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [
        preview(3840, 2160),
        preview(800, 600),
        preview(1080, 1920),
        preview(4096, 2160),
        preview(640, 480)
      ];
      const target: Resolution = res(640, 480);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(4);
      expect(profiles[index].size.width).assertEqual(640);
      expect(profiles[index].size.height).assertEqual(480);
      expect(previewMatches(profiles, target)).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_0600
     * @tc.name testCameraTable0006
     * @tc.desc Verify selectProfile falls back to index 0 when 2048x1536 is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [
        preview(800, 600),
        preview(1080, 1920),
        preview(4096, 2160),
        preview(640, 480),
        preview(1280, 720),
        preview(1920, 1080)
      ];
      const target: Resolution = res(2048, 1536);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(800);
      expect(profiles[index].size.height).assertEqual(600);
      expect(previewMatches(profiles, target)).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_0700
     * @tc.name testCameraTable0007
     * @tc.desc Verify selectVideoProfile returns the first exact 1080x1920 match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.VideoProfile[] = [video(1080, 1920)];
      const target: Resolution = res(1080, 1920);
      const index: number = service.selectVideoProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(1080);
      expect(profiles[index].size.height).assertEqual(1920);
      expect(videoMatches(profiles, target)).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_0800
     * @tc.name testCameraTable0008
     * @tc.desc Verify selectProfile falls back to index 0 when 2048x1536 is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(4096, 2160), preview(640, 480)];
      const target: Resolution = res(2048, 1536);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(4096);
      expect(profiles[index].size.height).assertEqual(2160);
      expect(previewMatches(profiles, target)).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_0900
     * @tc.name testCameraTable0009
     * @tc.desc Verify selectProfile returns the first exact 1920x1080 match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(640, 480), preview(1280, 720), preview(1920, 1080)];
      const target: Resolution = res(1920, 1080);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(2);
      expect(profiles[index].size.width).assertEqual(1920);
      expect(profiles[index].size.height).assertEqual(1080);
      expect(previewMatches(profiles, target)).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_1000
     * @tc.name testCameraTable0010
     * @tc.desc Verify selectVideoProfile falls back to index 0 when 2048x1536 is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.VideoProfile[] = [
        video(1280, 720),
        video(1920, 1080),
        video(2560, 1440),
        video(3840, 2160)
      ];
      const target: Resolution = res(2048, 1536);
      const index: number = service.selectVideoProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(1280);
      expect(profiles[index].size.height).assertEqual(720);
      expect(videoMatches(profiles, target)).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_1100
     * @tc.name testCameraTable0011
     * @tc.desc Verify selectProfile returns the first exact 1920x1080 match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [
        preview(1920, 1080),
        preview(2560, 1440),
        preview(3840, 2160),
        preview(800, 600),
        preview(1080, 1920)
      ];
      const target: Resolution = res(1920, 1080);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(1920);
      expect(profiles[index].size.height).assertEqual(1080);
      expect(previewMatches(profiles, target)).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_1200
     * @tc.name testCameraTable0012
     * @tc.desc Verify selectProfile falls back to index 0 when 2048x1536 is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [
        preview(2560, 1440),
        preview(3840, 2160),
        preview(800, 600),
        preview(1080, 1920),
        preview(4096, 2160),
        preview(640, 480)
      ];
      const target: Resolution = res(2048, 1536);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(2560);
      expect(profiles[index].size.height).assertEqual(1440);
      expect(previewMatches(profiles, target)).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_1300
     * @tc.name testCameraTable0013
     * @tc.desc Verify selectVideoProfile returns the first exact 3840x2160 match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.VideoProfile[] = [video(3840, 2160)];
      const target: Resolution = res(3840, 2160);
      const index: number = service.selectVideoProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(3840);
      expect(profiles[index].size.height).assertEqual(2160);
      expect(videoMatches(profiles, target)).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_1400
     * @tc.name testCameraTable0014
     * @tc.desc Verify selectProfile falls back to index 0 when 2048x1536 is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(800, 600), preview(1080, 1920)];
      const target: Resolution = res(2048, 1536);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(800);
      expect(profiles[index].size.height).assertEqual(600);
      expect(previewMatches(profiles, target)).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_1500
     * @tc.name testCameraTable0015
     * @tc.desc Verify selectProfile returns the first exact 640x480 match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(1080, 1920), preview(4096, 2160), preview(640, 480)];
      const target: Resolution = res(640, 480);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(2);
      expect(profiles[index].size.width).assertEqual(640);
      expect(profiles[index].size.height).assertEqual(480);
      expect(previewMatches(profiles, target)).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_1600
     * @tc.name testCameraTable0016
     * @tc.desc Verify selectVideoProfile falls back to index 0 when 2048x1536 is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.VideoProfile[] = [video(4096, 2160), video(640, 480), video(1280, 720), video(1920, 1080)];
      const target: Resolution = res(2048, 1536);
      const index: number = service.selectVideoProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(4096);
      expect(profiles[index].size.height).assertEqual(2160);
      expect(videoMatches(profiles, target)).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_1700
     * @tc.name testCameraTable0017
     * @tc.desc Verify selectProfile returns the first exact 1280x720 match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [
        preview(640, 480),
        preview(1280, 720),
        preview(1920, 1080),
        preview(2560, 1440),
        preview(3840, 2160)
      ];
      const target: Resolution = res(1280, 720);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(1);
      expect(profiles[index].size.width).assertEqual(1280);
      expect(profiles[index].size.height).assertEqual(720);
      expect(previewMatches(profiles, target)).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_1800
     * @tc.name testCameraTable0018
     * @tc.desc Verify selectProfile falls back to index 0 when 2048x1536 is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [
        preview(1280, 720),
        preview(1920, 1080),
        preview(2560, 1440),
        preview(3840, 2160),
        preview(800, 600),
        preview(1080, 1920)
      ];
      const target: Resolution = res(2048, 1536);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(1280);
      expect(profiles[index].size.height).assertEqual(720);
      expect(previewMatches(profiles, target)).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_1900
     * @tc.name testCameraTable0019
     * @tc.desc Verify selectVideoProfile returns the first exact 1920x1080 match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.VideoProfile[] = [video(1920, 1080)];
      const target: Resolution = res(1920, 1080);
      const index: number = service.selectVideoProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(1920);
      expect(profiles[index].size.height).assertEqual(1080);
      expect(videoMatches(profiles, target)).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_2000
     * @tc.name testCameraTable0020
     * @tc.desc Verify selectProfile falls back to index 0 when 2048x1536 is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(2560, 1440), preview(3840, 2160)];
      const target: Resolution = res(2048, 1536);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(2560);
      expect(profiles[index].size.height).assertEqual(1440);
      expect(previewMatches(profiles, target)).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_2100
     * @tc.name testCameraTable0021
     * @tc.desc Verify selectProfile returns the first exact 1080x1920 match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(3840, 2160), preview(800, 600), preview(1080, 1920)];
      const target: Resolution = res(1080, 1920);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(2);
      expect(profiles[index].size.width).assertEqual(1080);
      expect(profiles[index].size.height).assertEqual(1920);
      expect(previewMatches(profiles, target)).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_2200
     * @tc.name testCameraTable0022
     * @tc.desc Verify selectVideoProfile falls back to index 0 when 2048x1536 is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.VideoProfile[] = [video(800, 600), video(1080, 1920), video(4096, 2160), video(640, 480)];
      const target: Resolution = res(2048, 1536);
      const index: number = service.selectVideoProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(800);
      expect(profiles[index].size.height).assertEqual(600);
      expect(videoMatches(profiles, target)).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_2300
     * @tc.name testCameraTable0023
     * @tc.desc Verify selectProfile returns the first exact 640x480 match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [
        preview(1080, 1920),
        preview(4096, 2160),
        preview(640, 480),
        preview(1280, 720),
        preview(1920, 1080)
      ];
      const target: Resolution = res(640, 480);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(2);
      expect(profiles[index].size.width).assertEqual(640);
      expect(profiles[index].size.height).assertEqual(480);
      expect(previewMatches(profiles, target)).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_2400
     * @tc.name testCameraTable0024
     * @tc.desc Verify selectProfile falls back to index 0 when 2048x1536 is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [
        preview(4096, 2160),
        preview(640, 480),
        preview(1280, 720),
        preview(1920, 1080),
        preview(2560, 1440),
        preview(3840, 2160)
      ];
      const target: Resolution = res(2048, 1536);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(4096);
      expect(profiles[index].size.height).assertEqual(2160);
      expect(previewMatches(profiles, target)).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_2500
     * @tc.name testCameraTable0025
     * @tc.desc Verify selectVideoProfile returns the first exact 640x480 match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.VideoProfile[] = [video(640, 480)];
      const target: Resolution = res(640, 480);
      const index: number = service.selectVideoProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(640);
      expect(profiles[index].size.height).assertEqual(480);
      expect(videoMatches(profiles, target)).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_2600
     * @tc.name testCameraTable0026
     * @tc.desc Verify selectProfile falls back to index 0 when 2048x1536 is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(1280, 720), preview(1920, 1080)];
      const target: Resolution = res(2048, 1536);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(1280);
      expect(profiles[index].size.height).assertEqual(720);
      expect(previewMatches(profiles, target)).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_2700
     * @tc.name testCameraTable0027
     * @tc.desc Verify selectProfile returns the first exact 3840x2160 match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(1920, 1080), preview(2560, 1440), preview(3840, 2160)];
      const target: Resolution = res(3840, 2160);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(2);
      expect(profiles[index].size.width).assertEqual(3840);
      expect(profiles[index].size.height).assertEqual(2160);
      expect(previewMatches(profiles, target)).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_2800
     * @tc.name testCameraTable0028
     * @tc.desc Verify selectVideoProfile falls back to index 0 when 2048x1536 is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.VideoProfile[] = [
        video(2560, 1440),
        video(3840, 2160),
        video(800, 600),
        video(1080, 1920)
      ];
      const target: Resolution = res(2048, 1536);
      const index: number = service.selectVideoProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(2560);
      expect(profiles[index].size.height).assertEqual(1440);
      expect(videoMatches(profiles, target)).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_2900
     * @tc.name testCameraTable0029
     * @tc.desc Verify selectProfile returns the first exact 4096x2160 match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [
        preview(3840, 2160),
        preview(800, 600),
        preview(1080, 1920),
        preview(4096, 2160),
        preview(640, 480)
      ];
      const target: Resolution = res(4096, 2160);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(3);
      expect(profiles[index].size.width).assertEqual(4096);
      expect(profiles[index].size.height).assertEqual(2160);
      expect(previewMatches(profiles, target)).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_3000
     * @tc.name testCameraTable0030
     * @tc.desc Verify selectProfile falls back to index 0 when 2048x1536 is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [
        preview(800, 600),
        preview(1080, 1920),
        preview(4096, 2160),
        preview(640, 480),
        preview(1280, 720),
        preview(1920, 1080)
      ];
      const target: Resolution = res(2048, 1536);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(800);
      expect(profiles[index].size.height).assertEqual(600);
      expect(previewMatches(profiles, target)).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_3100
     * @tc.name testCameraTable0031
     * @tc.desc Verify selectVideoProfile returns the first exact 1080x1920 match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.VideoProfile[] = [video(1080, 1920)];
      const target: Resolution = res(1080, 1920);
      const index: number = service.selectVideoProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(1080);
      expect(profiles[index].size.height).assertEqual(1920);
      expect(videoMatches(profiles, target)).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_3200
     * @tc.name testCameraTable0032
     * @tc.desc Verify selectProfile falls back to index 0 when 2048x1536 is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(4096, 2160), preview(640, 480)];
      const target: Resolution = res(2048, 1536);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(4096);
      expect(profiles[index].size.height).assertEqual(2160);
      expect(previewMatches(profiles, target)).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_3300
     * @tc.name testCameraTable0033
     * @tc.desc Verify selectProfile returns the first exact 1920x1080 match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(640, 480), preview(1280, 720), preview(1920, 1080)];
      const target: Resolution = res(1920, 1080);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(2);
      expect(profiles[index].size.width).assertEqual(1920);
      expect(profiles[index].size.height).assertEqual(1080);
      expect(previewMatches(profiles, target)).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_3400
     * @tc.name testCameraTable0034
     * @tc.desc Verify selectVideoProfile falls back to index 0 when 2048x1536 is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.VideoProfile[] = [
        video(1280, 720),
        video(1920, 1080),
        video(2560, 1440),
        video(3840, 2160)
      ];
      const target: Resolution = res(2048, 1536);
      const index: number = service.selectVideoProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(1280);
      expect(profiles[index].size.height).assertEqual(720);
      expect(videoMatches(profiles, target)).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_3500
     * @tc.name testCameraTable0035
     * @tc.desc Verify selectProfile returns the first exact 1080x1920 match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [
        preview(1920, 1080),
        preview(2560, 1440),
        preview(3840, 2160),
        preview(800, 600),
        preview(1080, 1920)
      ];
      const target: Resolution = res(1080, 1920);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(4);
      expect(profiles[index].size.width).assertEqual(1080);
      expect(profiles[index].size.height).assertEqual(1920);
      expect(previewMatches(profiles, target)).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_3600
     * @tc.name testCameraTable0036
     * @tc.desc Verify selectProfile falls back to index 0 when 2048x1536 is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [
        preview(2560, 1440),
        preview(3840, 2160),
        preview(800, 600),
        preview(1080, 1920),
        preview(4096, 2160),
        preview(640, 480)
      ];
      const target: Resolution = res(2048, 1536);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(2560);
      expect(profiles[index].size.height).assertEqual(1440);
      expect(previewMatches(profiles, target)).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_3700
     * @tc.name testCameraTable0037
     * @tc.desc Verify selectVideoProfile returns the first exact 3840x2160 match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.VideoProfile[] = [video(3840, 2160)];
      const target: Resolution = res(3840, 2160);
      const index: number = service.selectVideoProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(3840);
      expect(profiles[index].size.height).assertEqual(2160);
      expect(videoMatches(profiles, target)).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_3800
     * @tc.name testCameraTable0038
     * @tc.desc Verify selectProfile falls back to index 0 when 2048x1536 is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(800, 600), preview(1080, 1920)];
      const target: Resolution = res(2048, 1536);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(800);
      expect(profiles[index].size.height).assertEqual(600);
      expect(previewMatches(profiles, target)).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_3900
     * @tc.name testCameraTable0039
     * @tc.desc Verify selectProfile returns the first exact 640x480 match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(1080, 1920), preview(4096, 2160), preview(640, 480)];
      const target: Resolution = res(640, 480);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(2);
      expect(profiles[index].size.width).assertEqual(640);
      expect(profiles[index].size.height).assertEqual(480);
      expect(previewMatches(profiles, target)).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_4000
     * @tc.name testCameraTable0040
     * @tc.desc Verify selectVideoProfile falls back to index 0 when 2048x1536 is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.VideoProfile[] = [video(4096, 2160), video(640, 480), video(1280, 720), video(1920, 1080)];
      const target: Resolution = res(2048, 1536);
      const index: number = service.selectVideoProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(4096);
      expect(profiles[index].size.height).assertEqual(2160);
      expect(videoMatches(profiles, target)).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_4100
     * @tc.name testCameraTable0041
     * @tc.desc Verify selectProfile returns the first exact 640x480 match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [
        preview(640, 480),
        preview(1280, 720),
        preview(1920, 1080),
        preview(2560, 1440),
        preview(3840, 2160)
      ];
      const target: Resolution = res(640, 480);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(640);
      expect(profiles[index].size.height).assertEqual(480);
      expect(previewMatches(profiles, target)).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_4200
     * @tc.name testCameraTable0042
     * @tc.desc Verify selectProfile falls back to index 0 when 2048x1536 is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [
        preview(1280, 720),
        preview(1920, 1080),
        preview(2560, 1440),
        preview(3840, 2160),
        preview(800, 600),
        preview(1080, 1920)
      ];
      const target: Resolution = res(2048, 1536);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(1280);
      expect(profiles[index].size.height).assertEqual(720);
      expect(previewMatches(profiles, target)).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_4300
     * @tc.name testCameraTable0043
     * @tc.desc Verify selectVideoProfile returns the first exact 1920x1080 match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.VideoProfile[] = [video(1920, 1080)];
      const target: Resolution = res(1920, 1080);
      const index: number = service.selectVideoProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(1920);
      expect(profiles[index].size.height).assertEqual(1080);
      expect(videoMatches(profiles, target)).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_4400
     * @tc.name testCameraTable0044
     * @tc.desc Verify selectProfile falls back to index 0 when 2048x1536 is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(2560, 1440), preview(3840, 2160)];
      const target: Resolution = res(2048, 1536);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(2560);
      expect(profiles[index].size.height).assertEqual(1440);
      expect(previewMatches(profiles, target)).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_4500
     * @tc.name testCameraTable0045
     * @tc.desc Verify selectProfile returns the first exact 1080x1920 match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(3840, 2160), preview(800, 600), preview(1080, 1920)];
      const target: Resolution = res(1080, 1920);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(2);
      expect(profiles[index].size.width).assertEqual(1080);
      expect(profiles[index].size.height).assertEqual(1920);
      expect(previewMatches(profiles, target)).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_4600
     * @tc.name testCameraTable0046
     * @tc.desc Verify selectVideoProfile falls back to index 0 when 2048x1536 is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.VideoProfile[] = [video(800, 600), video(1080, 1920), video(4096, 2160), video(640, 480)];
      const target: Resolution = res(2048, 1536);
      const index: number = service.selectVideoProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(800);
      expect(profiles[index].size.height).assertEqual(600);
      expect(videoMatches(profiles, target)).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_4700
     * @tc.name testCameraTable0047
     * @tc.desc Verify selectProfile returns the first exact 4096x2160 match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [
        preview(1080, 1920),
        preview(4096, 2160),
        preview(640, 480),
        preview(1280, 720),
        preview(1920, 1080)
      ];
      const target: Resolution = res(4096, 2160);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(1);
      expect(profiles[index].size.width).assertEqual(4096);
      expect(profiles[index].size.height).assertEqual(2160);
      expect(previewMatches(profiles, target)).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_4800
     * @tc.name testCameraTable0048
     * @tc.desc Verify selectProfile falls back to index 0 when 2048x1536 is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [
        preview(4096, 2160),
        preview(640, 480),
        preview(1280, 720),
        preview(1920, 1080),
        preview(2560, 1440),
        preview(3840, 2160)
      ];
      const target: Resolution = res(2048, 1536);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(4096);
      expect(profiles[index].size.height).assertEqual(2160);
      expect(previewMatches(profiles, target)).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_4900
     * @tc.name testCameraTable0049
     * @tc.desc Verify selectVideoProfile returns the first exact 640x480 match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.VideoProfile[] = [video(640, 480)];
      const target: Resolution = res(640, 480);
      const index: number = service.selectVideoProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(640);
      expect(profiles[index].size.height).assertEqual(480);
      expect(videoMatches(profiles, target)).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_5000
     * @tc.name testCameraTable0050
     * @tc.desc Verify selectProfile falls back to index 0 when 2048x1536 is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(1280, 720), preview(1920, 1080)];
      const target: Resolution = res(2048, 1536);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(1280);
      expect(profiles[index].size.height).assertEqual(720);
      expect(previewMatches(profiles, target)).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_5100
     * @tc.name testCameraTable0051
     * @tc.desc Verify selectProfile returns the first exact 3840x2160 match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(1920, 1080), preview(2560, 1440), preview(3840, 2160)];
      const target: Resolution = res(3840, 2160);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(2);
      expect(profiles[index].size.width).assertEqual(3840);
      expect(profiles[index].size.height).assertEqual(2160);
      expect(previewMatches(profiles, target)).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_5200
     * @tc.name testCameraTable0052
     * @tc.desc Verify selectVideoProfile falls back to index 0 when 2048x1536 is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.VideoProfile[] = [
        video(2560, 1440),
        video(3840, 2160),
        video(800, 600),
        video(1080, 1920)
      ];
      const target: Resolution = res(2048, 1536);
      const index: number = service.selectVideoProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(2560);
      expect(profiles[index].size.height).assertEqual(1440);
      expect(videoMatches(profiles, target)).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_5300
     * @tc.name testCameraTable0053
     * @tc.desc Verify selectProfile returns the first exact 1080x1920 match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [
        preview(3840, 2160),
        preview(800, 600),
        preview(1080, 1920),
        preview(4096, 2160),
        preview(640, 480)
      ];
      const target: Resolution = res(1080, 1920);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(2);
      expect(profiles[index].size.width).assertEqual(1080);
      expect(profiles[index].size.height).assertEqual(1920);
      expect(previewMatches(profiles, target)).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_5400
     * @tc.name testCameraTable0054
     * @tc.desc Verify selectProfile falls back to index 0 when 2048x1536 is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [
        preview(800, 600),
        preview(1080, 1920),
        preview(4096, 2160),
        preview(640, 480),
        preview(1280, 720),
        preview(1920, 1080)
      ];
      const target: Resolution = res(2048, 1536);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(800);
      expect(profiles[index].size.height).assertEqual(600);
      expect(previewMatches(profiles, target)).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_5500
     * @tc.name testCameraTable0055
     * @tc.desc Verify selectVideoProfile returns the first exact 1080x1920 match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.VideoProfile[] = [video(1080, 1920)];
      const target: Resolution = res(1080, 1920);
      const index: number = service.selectVideoProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(1080);
      expect(profiles[index].size.height).assertEqual(1920);
      expect(videoMatches(profiles, target)).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_5600
     * @tc.name testCameraTable0056
     * @tc.desc Verify selectProfile falls back to index 0 when 2048x1536 is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(4096, 2160), preview(640, 480)];
      const target: Resolution = res(2048, 1536);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(4096);
      expect(profiles[index].size.height).assertEqual(2160);
      expect(previewMatches(profiles, target)).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_5700
     * @tc.name testCameraTable0057
     * @tc.desc Verify selectProfile returns the first exact 1920x1080 match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(640, 480), preview(1280, 720), preview(1920, 1080)];
      const target: Resolution = res(1920, 1080);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(2);
      expect(profiles[index].size.width).assertEqual(1920);
      expect(profiles[index].size.height).assertEqual(1080);
      expect(previewMatches(profiles, target)).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_5800
     * @tc.name testCameraTable0058
     * @tc.desc Verify selectVideoProfile falls back to index 0 when 2048x1536 is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.VideoProfile[] = [
        video(1280, 720),
        video(1920, 1080),
        video(2560, 1440),
        video(3840, 2160)
      ];
      const target: Resolution = res(2048, 1536);
      const index: number = service.selectVideoProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(1280);
      expect(profiles[index].size.height).assertEqual(720);
      expect(videoMatches(profiles, target)).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_5900
     * @tc.name testCameraTable0059
     * @tc.desc Verify selectProfile returns the first exact 800x600 match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [
        preview(1920, 1080),
        preview(2560, 1440),
        preview(3840, 2160),
        preview(800, 600),
        preview(1080, 1920)
      ];
      const target: Resolution = res(800, 600);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(3);
      expect(profiles[index].size.width).assertEqual(800);
      expect(profiles[index].size.height).assertEqual(600);
      expect(previewMatches(profiles, target)).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_6000
     * @tc.name testCameraTable0060
     * @tc.desc Verify selectProfile falls back to index 0 when 2048x1536 is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [
        preview(2560, 1440),
        preview(3840, 2160),
        preview(800, 600),
        preview(1080, 1920),
        preview(4096, 2160),
        preview(640, 480)
      ];
      const target: Resolution = res(2048, 1536);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(2560);
      expect(profiles[index].size.height).assertEqual(1440);
      expect(previewMatches(profiles, target)).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_6100
     * @tc.name testCameraTable0061
     * @tc.desc Verify selectVideoProfile returns the first exact 3840x2160 match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.VideoProfile[] = [video(3840, 2160)];
      const target: Resolution = res(3840, 2160);
      const index: number = service.selectVideoProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(3840);
      expect(profiles[index].size.height).assertEqual(2160);
      expect(videoMatches(profiles, target)).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_6200
     * @tc.name testCameraTable0062
     * @tc.desc Verify selectProfile falls back to index 0 when 2048x1536 is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(800, 600), preview(1080, 1920)];
      const target: Resolution = res(2048, 1536);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(800);
      expect(profiles[index].size.height).assertEqual(600);
      expect(previewMatches(profiles, target)).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_6300
     * @tc.name testCameraTable0063
     * @tc.desc Verify selectProfile returns the first exact 640x480 match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(1080, 1920), preview(4096, 2160), preview(640, 480)];
      const target: Resolution = res(640, 480);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(2);
      expect(profiles[index].size.width).assertEqual(640);
      expect(profiles[index].size.height).assertEqual(480);
      expect(previewMatches(profiles, target)).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_6400
     * @tc.name testCameraTable0064
     * @tc.desc Verify selectVideoProfile falls back to index 0 when 2048x1536 is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.VideoProfile[] = [video(4096, 2160), video(640, 480), video(1280, 720), video(1920, 1080)];
      const target: Resolution = res(2048, 1536);
      const index: number = service.selectVideoProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(4096);
      expect(profiles[index].size.height).assertEqual(2160);
      expect(videoMatches(profiles, target)).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_6500
     * @tc.name testCameraTable0065
     * @tc.desc Verify selectProfile returns the first exact 3840x2160 match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [
        preview(640, 480),
        preview(1280, 720),
        preview(1920, 1080),
        preview(2560, 1440),
        preview(3840, 2160)
      ];
      const target: Resolution = res(3840, 2160);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(4);
      expect(profiles[index].size.width).assertEqual(3840);
      expect(profiles[index].size.height).assertEqual(2160);
      expect(previewMatches(profiles, target)).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_6600
     * @tc.name testCameraTable0066
     * @tc.desc Verify selectProfile falls back to index 0 when 2048x1536 is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [
        preview(1280, 720),
        preview(1920, 1080),
        preview(2560, 1440),
        preview(3840, 2160),
        preview(800, 600),
        preview(1080, 1920)
      ];
      const target: Resolution = res(2048, 1536);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(1280);
      expect(profiles[index].size.height).assertEqual(720);
      expect(previewMatches(profiles, target)).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_6700
     * @tc.name testCameraTable0067
     * @tc.desc Verify selectVideoProfile returns the first exact 1920x1080 match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.VideoProfile[] = [video(1920, 1080)];
      const target: Resolution = res(1920, 1080);
      const index: number = service.selectVideoProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(1920);
      expect(profiles[index].size.height).assertEqual(1080);
      expect(videoMatches(profiles, target)).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_6800
     * @tc.name testCameraTable0068
     * @tc.desc Verify selectProfile falls back to index 0 when 2048x1536 is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(2560, 1440), preview(3840, 2160)];
      const target: Resolution = res(2048, 1536);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(2560);
      expect(profiles[index].size.height).assertEqual(1440);
      expect(previewMatches(profiles, target)).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_6900
     * @tc.name testCameraTable0069
     * @tc.desc Verify selectProfile returns the first exact 1080x1920 match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(3840, 2160), preview(800, 600), preview(1080, 1920)];
      const target: Resolution = res(1080, 1920);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(2);
      expect(profiles[index].size.width).assertEqual(1080);
      expect(profiles[index].size.height).assertEqual(1920);
      expect(previewMatches(profiles, target)).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_7000
     * @tc.name testCameraTable0070
     * @tc.desc Verify selectVideoProfile falls back to index 0 when 2048x1536 is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.VideoProfile[] = [video(800, 600), video(1080, 1920), video(4096, 2160), video(640, 480)];
      const target: Resolution = res(2048, 1536);
      const index: number = service.selectVideoProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(800);
      expect(profiles[index].size.height).assertEqual(600);
      expect(videoMatches(profiles, target)).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_7100
     * @tc.name testCameraTable0071
     * @tc.desc Verify selectProfile returns the first exact 1080x1920 match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [
        preview(1080, 1920),
        preview(4096, 2160),
        preview(640, 480),
        preview(1280, 720),
        preview(1920, 1080)
      ];
      const target: Resolution = res(1080, 1920);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(1080);
      expect(profiles[index].size.height).assertEqual(1920);
      expect(previewMatches(profiles, target)).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_7200
     * @tc.name testCameraTable0072
     * @tc.desc Verify selectProfile falls back to index 0 when 2048x1536 is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [
        preview(4096, 2160),
        preview(640, 480),
        preview(1280, 720),
        preview(1920, 1080),
        preview(2560, 1440),
        preview(3840, 2160)
      ];
      const target: Resolution = res(2048, 1536);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(4096);
      expect(profiles[index].size.height).assertEqual(2160);
      expect(previewMatches(profiles, target)).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_7300
     * @tc.name testCameraTable0073
     * @tc.desc Verify selectVideoProfile returns the first exact 640x480 match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.VideoProfile[] = [video(640, 480)];
      const target: Resolution = res(640, 480);
      const index: number = service.selectVideoProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(640);
      expect(profiles[index].size.height).assertEqual(480);
      expect(videoMatches(profiles, target)).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_7400
     * @tc.name testCameraTable0074
     * @tc.desc Verify selectProfile falls back to index 0 when 2048x1536 is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(1280, 720), preview(1920, 1080)];
      const target: Resolution = res(2048, 1536);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(1280);
      expect(profiles[index].size.height).assertEqual(720);
      expect(previewMatches(profiles, target)).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_7500
     * @tc.name testCameraTable0075
     * @tc.desc Verify selectProfile returns the first exact 3840x2160 match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(1920, 1080), preview(2560, 1440), preview(3840, 2160)];
      const target: Resolution = res(3840, 2160);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(2);
      expect(profiles[index].size.width).assertEqual(3840);
      expect(profiles[index].size.height).assertEqual(2160);
      expect(previewMatches(profiles, target)).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_7600
     * @tc.name testCameraTable0076
     * @tc.desc Verify selectVideoProfile falls back to index 0 when 2048x1536 is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.VideoProfile[] = [
        video(2560, 1440),
        video(3840, 2160),
        video(800, 600),
        video(1080, 1920)
      ];
      const target: Resolution = res(2048, 1536);
      const index: number = service.selectVideoProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(2560);
      expect(profiles[index].size.height).assertEqual(1440);
      expect(videoMatches(profiles, target)).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_7700
     * @tc.name testCameraTable0077
     * @tc.desc Verify selectProfile returns the first exact 800x600 match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [
        preview(3840, 2160),
        preview(800, 600),
        preview(1080, 1920),
        preview(4096, 2160),
        preview(640, 480)
      ];
      const target: Resolution = res(800, 600);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(1);
      expect(profiles[index].size.width).assertEqual(800);
      expect(profiles[index].size.height).assertEqual(600);
      expect(previewMatches(profiles, target)).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_7800
     * @tc.name testCameraTable0078
     * @tc.desc Verify selectProfile falls back to index 0 when 2048x1536 is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [
        preview(800, 600),
        preview(1080, 1920),
        preview(4096, 2160),
        preview(640, 480),
        preview(1280, 720),
        preview(1920, 1080)
      ];
      const target: Resolution = res(2048, 1536);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(800);
      expect(profiles[index].size.height).assertEqual(600);
      expect(previewMatches(profiles, target)).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_7900
     * @tc.name testCameraTable0079
     * @tc.desc Verify selectVideoProfile returns the first exact 1080x1920 match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.VideoProfile[] = [video(1080, 1920)];
      const target: Resolution = res(1080, 1920);
      const index: number = service.selectVideoProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(1080);
      expect(profiles[index].size.height).assertEqual(1920);
      expect(videoMatches(profiles, target)).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_8000
     * @tc.name testCameraTable0080
     * @tc.desc Verify selectProfile falls back to index 0 when 2048x1536 is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(4096, 2160), preview(640, 480)];
      const target: Resolution = res(2048, 1536);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(4096);
      expect(profiles[index].size.height).assertEqual(2160);
      expect(previewMatches(profiles, target)).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_8100
     * @tc.name testCameraTable0081
     * @tc.desc Verify selectProfile returns the first exact 1920x1080 match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(640, 480), preview(1280, 720), preview(1920, 1080)];
      const target: Resolution = res(1920, 1080);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(2);
      expect(profiles[index].size.width).assertEqual(1920);
      expect(profiles[index].size.height).assertEqual(1080);
      expect(previewMatches(profiles, target)).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_8200
     * @tc.name testCameraTable0082
     * @tc.desc Verify selectVideoProfile falls back to index 0 when 2048x1536 is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.VideoProfile[] = [
        video(1280, 720),
        video(1920, 1080),
        video(2560, 1440),
        video(3840, 2160)
      ];
      const target: Resolution = res(2048, 1536);
      const index: number = service.selectVideoProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(1280);
      expect(profiles[index].size.height).assertEqual(720);
      expect(videoMatches(profiles, target)).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_8300
     * @tc.name testCameraTable0083
     * @tc.desc Verify selectProfile returns the first exact 3840x2160 match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [
        preview(1920, 1080),
        preview(2560, 1440),
        preview(3840, 2160),
        preview(800, 600),
        preview(1080, 1920)
      ];
      const target: Resolution = res(3840, 2160);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(2);
      expect(profiles[index].size.width).assertEqual(3840);
      expect(profiles[index].size.height).assertEqual(2160);
      expect(previewMatches(profiles, target)).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_TABLE_8400
     * @tc.name testCameraTable0084
     * @tc.desc Verify selectProfile falls back to index 0 when 2048x1536 is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraTable0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [
        preview(2560, 1440),
        preview(3840, 2160),
        preview(800, 600),
        preview(1080, 1920),
        preview(4096, 2160),
        preview(640, 480)
      ];
      const target: Resolution = res(2048, 1536);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(2560);
      expect(profiles[index].size.height).assertEqual(1440);
      expect(previewMatches(profiles, target)).assertEqual(0);
    })
  })
}
