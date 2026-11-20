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
import { paceTurn } from './TestPace';
import { camera } from '@kit.CameraKit';
import CameraService from '../../../main/ets/services/CameraService';
import { Resolution } from '../../../main/ets/services/CommonTypes';

interface VideoCapability extends camera.Profile {
  readonly frameRateRange: camera.FrameRateRange;
}


function preview(width: number, height: number): camera.Profile {
  return {
    format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP,
    size: { width: width, height: height }
  };
}

function previewWithFormat(width: number, height: number, format: camera.CameraFormat): camera.Profile {
  return {
    format: format,
    size: { width: width, height: height }
  };
}

function video(width: number, height: number): VideoCapability {
  return videoWithRate(width, height, 30, 60);
}

function videoWithRate(width: number, height: number, min: number, max: number): VideoCapability {
  return {
    format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP,
    size: { width: width, height: height },
    frameRateRange: { min: min, max: max }
  };
}

function resolution(width: number, height: number): Resolution {
  return { frameWidth: width, frameHeight: height } as Resolution;
}

function matchIndexes(profiles: camera.Profile[], target: Resolution): number[] {
  const result: number[] = [];
  for (let i = 0; i < profiles.length; i++) {
    if (profiles[i].size.width === target.frameWidth && profiles[i].size.height === target.frameHeight) {
      result.push(i);
    }
  }
  return result;
}

function videoMatchIndexes(profiles: VideoCapability[], target: Resolution): number[] {
  const result: number[] = [];
  for (let i = 0; i < profiles.length; i++) {
    if (profiles[i].size.width === target.frameWidth && profiles[i].size.height === target.frameHeight) {
      result.push(i);
    }
  }
  return result;
}

export default function cameraProfileSelectTest() {
  describe('cameraProfileSelectTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_AVRECORDER_CAMERA_PROFILE_0100
     * @tc.name testCameraProfile0001
     * @tc.desc Verify selectProfile returns the index of the only matching preview profile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraProfile0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(1920, 1080)];
      const target: Resolution = resolution(1920, 1080);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(target.frameWidth);
      expect(profiles[index].size.height).assertEqual(target.frameHeight);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAMERA_PROFILE_0200
     * @tc.name testCameraProfile0002
     * @tc.desc Verify selectProfile finds a matching profile in the middle of the list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraProfile0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(1280, 720), preview(1920, 1080), preview(640, 480)];
      const target: Resolution = resolution(1920, 1080);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(1);
      expect(profiles[index].size.width).assertEqual(1920);
      expect(matchIndexes(profiles, target).length).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAMERA_PROFILE_0300
     * @tc.name testCameraProfile0003
     * @tc.desc Verify selectProfile finds a matching profile at the end of the list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraProfile0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(1280, 720), preview(1920, 1080), preview(3840, 2160)];
      const target: Resolution = resolution(3840, 2160);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(2);
      expect(profiles[index].size.height).assertEqual(2160);
      expect(matchIndexes(profiles, target).length).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAMERA_PROFILE_0400
     * @tc.name testCameraProfile0004
     * @tc.desc Verify selectProfile falls back to index zero when no profile has the requested size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraProfile0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(1280, 720), preview(640, 480)];
      const target: Resolution = resolution(1920, 1080);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(matchIndexes(profiles, target).length).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(1280);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAMERA_PROFILE_0500
     * @tc.name testCameraProfile0005
     * @tc.desc Verify selectProfile returns index zero for an empty profile list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraProfile0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [];
      expect(profiles.length).assertEqual(0);
      expect(service.selectProfile(profiles, resolution(1920, 1080))).assertEqual(0);
      expect(service.selectProfile(profiles, resolution(0, 0))).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAMERA_PROFILE_0600
     * @tc.name testCameraProfile0006
     * @tc.desc Verify selectProfile requires the height to match as well as the width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraProfile0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(640, 480), preview(1920, 720)];
      const target: Resolution = resolution(1920, 1080);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(matchIndexes(profiles, target).length).assertEqual(0);
      expect(profiles[index].size.height).assertEqual(480);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAMERA_PROFILE_0700
     * @tc.name testCameraProfile0007
     * @tc.desc Verify selectProfile requires the width to match as well as the height
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraProfile0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(640, 480), preview(1280, 1080)];
      const target: Resolution = resolution(1920, 1080);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(matchIndexes(profiles, target).length).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(640);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAMERA_PROFILE_0800
     * @tc.name testCameraProfile0008
     * @tc.desc Verify selectProfile does not treat a portrait profile as a landscape match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraProfile0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(1080, 1920), preview(1920, 1080)];
      expect(service.selectProfile(profiles, resolution(1920, 1080))).assertEqual(1);
      expect(service.selectProfile(profiles, resolution(1080, 1920))).assertEqual(0);
      expect(profiles[1].size.width).assertEqual(1920);
      expect(profiles[0].size.height).assertEqual(1920);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAMERA_PROFILE_0900
     * @tc.name testCameraProfile0009
     * @tc.desc Verify selectProfile returns the first index when several profiles share the same size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraProfile0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [
        preview(640, 480), preview(1920, 1080), preview(1280, 720), preview(1920, 1080)
      ];
      const target: Resolution = resolution(1920, 1080);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(1);
      expect(matchIndexes(profiles, target).length).assertEqual(2);
      expect(profiles[index].size.width).assertEqual(1920);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAMERA_PROFILE_1000
     * @tc.name testCameraProfile0010
     * @tc.desc Verify selectProfile matches an explicit zero-sized profile instead of falling back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraProfile0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(1280, 720), preview(0, 0)];
      expect(service.selectProfile(profiles, resolution(0, 0))).assertEqual(1);
      expect(profiles[1].size.width).assertEqual(0);
      expect(service.selectProfile(profiles, resolution(0, 1))).assertEqual(0);
      expect(profiles[0].size.height).assertEqual(720);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAMERA_PROFILE_1100
     * @tc.name testCameraProfile0011
     * @tc.desc Verify selectVideoProfile returns the index of the matching video profile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraProfile0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: VideoCapability[] = [video(1280, 720), video(1920, 1080), video(3840, 2160)];
      expect(service.selectVideoProfile(profiles, resolution(1280, 720))).assertEqual(0);
      expect(service.selectVideoProfile(profiles, resolution(1920, 1080))).assertEqual(1);
      expect(service.selectVideoProfile(profiles, resolution(3840, 2160))).assertEqual(2);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAMERA_PROFILE_1200
     * @tc.name testCameraProfile0012
     * @tc.desc Verify selectVideoProfile falls back to index zero when the size is unavailable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraProfile0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: VideoCapability[] = [video(1280, 720), video(640, 480)];
      const target: Resolution = resolution(1920, 1080);
      const index: number = service.selectVideoProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(videoMatchIndexes(profiles, target).length).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(1280);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAMERA_PROFILE_1300
     * @tc.name testCameraProfile0013
     * @tc.desc Verify selectVideoProfile requires both dimensions to match exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraProfile0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: VideoCapability[] = [video(640, 480), video(1920, 720), video(1280, 1080)];
      expect(service.selectVideoProfile(profiles, resolution(1920, 1080))).assertEqual(0);
      expect(videoMatchIndexes(profiles, resolution(1920, 1080)).length).assertEqual(0);
      expect(service.selectVideoProfile(profiles, resolution(1920, 720))).assertEqual(1);
      expect(profiles[1].size.height).assertEqual(720);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAMERA_PROFILE_1400
     * @tc.name testCameraProfile0014
     * @tc.desc Verify selectVideoProfile returns index zero for an empty video profile list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraProfile0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: VideoCapability[] = [];
      expect(profiles.length).assertEqual(0);
      expect(service.selectVideoProfile(profiles, resolution(1920, 1080))).assertEqual(0);
      expect(service.selectVideoProfile(profiles, resolution(0, 0))).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAMERA_PROFILE_1500
     * @tc.name testCameraProfile0015
     * @tc.desc Verify selectVideoProfile returns the first matching index for duplicated sizes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraProfile0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: VideoCapability[] = [
        video(1920, 1080), video(1280, 720), video(1920, 1080)
      ];
      expect(service.selectVideoProfile(profiles, resolution(1920, 1080))).assertEqual(0);
      expect(videoMatchIndexes(profiles, resolution(1920, 1080)).length).assertEqual(2);
      expect(service.selectVideoProfile(profiles, resolution(1280, 720))).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAMERA_PROFILE_1600
     * @tc.name testCameraProfile0016
     * @tc.desc Verify preview selection is driven by the profile size even when its pixel format differs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraProfile0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const rgba: camera.CameraFormat = camera.CameraFormat.CAMERA_FORMAT_RGBA_8888;
      const profiles: camera.Profile[] = [preview(1280, 720), previewWithFormat(1920, 1080, rgba)];
      const index: number = service.selectProfile(profiles, resolution(1920, 1080));
      expect(index).assertEqual(1);
      expect(profiles[index].format).assertEqual(rgba);
      expect(profiles[index].size.width).assertEqual(1920);
      expect(profiles[index].size.height).assertEqual(1080);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAMERA_PROFILE_1700
     * @tc.name testCameraProfile0017
     * @tc.desc Verify video selection is driven by the profile size even when its frame rate range differs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraProfile0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: VideoCapability[] = [video(1280, 720), videoWithRate(1920, 1080, 15, 30)];
      const index: number = service.selectVideoProfile(profiles, resolution(1920, 1080));
      expect(index).assertEqual(1);
      expect(profiles[index].frameRateRange.min).assertEqual(15);
      expect(profiles[index].frameRateRange.max).assertEqual(30);
      expect(profiles[index].size.width).assertEqual(1920);
    })
  })
}
