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

function preview(width: number, height: number): camera.Profile {
  return {
    format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP,
    size: { width: width, height: height }
  };
}

function previewFmt(width: number, height: number, format: camera.CameraFormat): camera.Profile {
  return {
    format: format,
    size: { width: width, height: height }
  };
}

function video(width: number, height: number): camera.VideoProfile {
  return videoRate(width, height, 30, 60);
}

function videoRate(width: number, height: number, min: number, max: number): camera.VideoProfile {
  return {
    format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP,
    size: { width: width, height: height },
    frameRateRange: { min: min, max: max }
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

function eightProfiles(): camera.Profile[] {
  return [
    preview(640, 480), preview(800, 600), preview(1280, 720), preview(1920, 1080),
    preview(2560, 1440), preview(3840, 2160), preview(4096, 2160), preview(1080, 1920)
  ];
}

export default function cameraSelectionEdgeTest() {
  describe('cameraSelectionEdgeTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_0100
     * @tc.name testCameraEdge0001
     * @tc.desc Verify a single preview profile is selected by an exact size match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(640, 480)];
      const target: Resolution = res(640, 480);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(profiles[index].size.width).assertEqual(640);
      expect(previewMatches(profiles, target)).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_0200
     * @tc.name testCameraEdge0002
     * @tc.desc Verify a single mismatching profile falls back to index zero without a match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(640, 480)];
      const target: Resolution = res(800, 600);
      expect(service.selectProfile(profiles, target)).assertEqual(0);
      expect(previewMatches(profiles, target)).assertEqual(0);
      expect(profiles[0].size.width).assertEqual(640);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_0300
     * @tc.name testCameraEdge0003
     * @tc.desc Verify the second preview profile is selected when it is the only match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(1280, 720), preview(1920, 1080)];
      const target: Resolution = res(1920, 1080);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(1);
      expect(previewMatches(profiles, target)).assertEqual(1);
      expect(profiles[index].size.width).assertEqual(1920);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_0400
     * @tc.name testCameraEdge0004
     * @tc.desc Verify the first preview profile is selected when it already matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(1920, 1080), preview(1280, 720)];
      const target: Resolution = res(1920, 1080);
      expect(service.selectProfile(profiles, target)).assertEqual(0);
      expect(previewMatches(profiles, target)).assertEqual(1);
      expect(profiles[0].size.height).assertEqual(1080);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_0500
     * @tc.name testCameraEdge0005
     * @tc.desc Verify the middle preview profile is selected from a three-element list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(640, 480), preview(1280, 720), preview(1920, 1080)];
      const index: number = service.selectProfile(profiles, res(1280, 720));
      expect(index).assertEqual(1);
      expect(profiles[index].size.width).assertEqual(1280);
      expect(previewMatches(profiles, res(1280, 720))).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_0600
     * @tc.name testCameraEdge0006
     * @tc.desc Verify the last preview profile is selected from a three-element list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(640, 480), preview(1280, 720), preview(1920, 1080)];
      const index: number = service.selectProfile(profiles, res(1920, 1080));
      expect(index).assertEqual(2);
      expect(profiles[index].size.height).assertEqual(1080);
      expect(previewMatches(profiles, res(1920, 1080))).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_0700
     * @tc.name testCameraEdge0007
     * @tc.desc Verify the third preview profile is selected from a four-element list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [
        preview(640, 480),
        preview(800, 600),
        preview(1280, 720),
        preview(1920, 1080)
      ];
      const index: number = service.selectProfile(profiles, res(1280, 720));
      expect(index).assertEqual(2);
      expect(profiles[index].size.width).assertEqual(1280);
      expect(profiles[index].size.height).assertEqual(720);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_0800
     * @tc.name testCameraEdge0008
     * @tc.desc Verify the fourth preview profile is selected from a four-element list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [
        preview(640, 480),
        preview(800, 600),
        preview(1280, 720),
        preview(1920, 1080)
      ];
      const index: number = service.selectProfile(profiles, res(1920, 1080));
      expect(index).assertEqual(3);
      expect(profiles[index].size.width).assertEqual(1920);
      expect(previewMatches(profiles, res(1920, 1080))).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_0900
     * @tc.name testCameraEdge0009
     * @tc.desc Verify the fifth preview profile is selected from a five-element list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [
        preview(640, 480), preview(800, 600), preview(1280, 720), preview(1920, 1080), preview(2560, 1440)
      ];
      const index: number = service.selectProfile(profiles, res(2560, 1440));
      expect(index).assertEqual(4);
      expect(profiles[index].size.height).assertEqual(1440);
      expect(previewMatches(profiles, res(2560, 1440))).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_1000
     * @tc.name testCameraEdge0010
     * @tc.desc Verify the sixth preview profile is selected from a six-element list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [
        preview(320, 240), preview(640, 480), preview(800, 600), preview(1280, 720), preview(1920, 1080),
        preview(3840, 2160)
      ];
      const index: number = service.selectProfile(profiles, res(3840, 2160));
      expect(index).assertEqual(5);
      expect(profiles[index].size.width).assertEqual(3840);
      expect(previewMatches(profiles, res(3840, 2160))).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_1100
     * @tc.name testCameraEdge0011
     * @tc.desc Verify the tenth preview profile is selected from a ten-element list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [];
      for (let i = 0; i < 9; i++) {
        profiles.push(preview(100 + i, 100 + i));
      }
      profiles.push(preview(1920, 1080));
      const index: number = service.selectProfile(profiles, res(1920, 1080));
      expect(index).assertEqual(9);
      expect(profiles[index].size.width).assertEqual(1920);
      expect(previewMatches(profiles, res(1920, 1080))).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_1200
     * @tc.name testCameraEdge0012
     * @tc.desc Verify preview selection on a realistic eight-entry capability list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = eightProfiles();
      const index: number = service.selectProfile(profiles, res(2560, 1440));
      expect(index).assertEqual(4);
      expect(profiles[index].size.width).assertEqual(2560);
      expect(previewMatches(profiles, res(2560, 1440))).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_1300
     * @tc.name testCameraEdge0013
     * @tc.desc Verify the wide 4096 by 2160 preview entry is selected from the capability list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = eightProfiles();
      const target: Resolution = res(4096, 2160);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(6);
      expect(profiles[index].size.width).assertEqual(4096);
      expect(previewMatches(profiles, target)).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_1400
     * @tc.name testCameraEdge0014
     * @tc.desc Verify the portrait preview entry is selected from the capability list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = eightProfiles();
      const target: Resolution = res(1080, 1920);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(7);
      expect(profiles[index].size.height).assertEqual(1920);
      expect(previewMatches(profiles, target)).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_1500
     * @tc.name testCameraEdge0015
     * @tc.desc Verify the 3840 by 2160 preview entry is selected from the capability list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = eightProfiles();
      const index: number = service.selectProfile(profiles, res(3840, 2160));
      expect(index).assertEqual(5);
      expect(profiles[index].size.width).assertEqual(3840);
      expect(previewMatches(profiles, res(3840, 2160))).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_1600
     * @tc.name testCameraEdge0016
     * @tc.desc Verify duplicated preview sizes resolve to the first occurrence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [
        preview(640, 480),
        preview(1920, 1080),
        preview(1280, 720),
        preview(1920, 1080)
      ];
      const index: number = service.selectProfile(profiles, res(1920, 1080));
      expect(index).assertEqual(1);
      expect(previewMatches(profiles, res(1920, 1080))).assertEqual(2);
      expect(profiles[index].size.width).assertEqual(1920);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_1700
     * @tc.name testCameraEdge0017
     * @tc.desc Verify duplicated preview sizes at the head of the list still resolve to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [
        preview(1920, 1080),
        preview(640, 480),
        preview(1280, 720),
        preview(1920, 1080)
      ];
      const index: number = service.selectProfile(profiles, res(1920, 1080));
      expect(index).assertEqual(0);
      expect(previewMatches(profiles, res(1920, 1080))).assertEqual(2);
      expect(profiles[index].size.height).assertEqual(1080);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_1800
     * @tc.name testCameraEdge0018
     * @tc.desc Verify an all-equal preview list resolves to index zero with multiple matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(1280, 720), preview(1280, 720), preview(1280, 720)];
      const index: number = service.selectProfile(profiles, res(1280, 720));
      expect(index).assertEqual(0);
      expect(previewMatches(profiles, res(1280, 720))).assertEqual(3);
      expect(profiles[index].size.width).assertEqual(1280);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_1900
     * @tc.name testCameraEdge0019
     * @tc.desc Verify an explicit zero-sized preview entry is matched instead of falling back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(1280, 720), preview(0, 0)];
      const index: number = service.selectProfile(profiles, res(0, 0));
      expect(index).assertEqual(1);
      expect(previewMatches(profiles, res(0, 0))).assertEqual(1);
      expect(profiles[index].size.width).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_2000
     * @tc.name testCameraEdge0020
     * @tc.desc Verify a zero-sized target falls back when no zero-sized preview entry exists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(1280, 720), preview(640, 480)];
      expect(service.selectProfile(profiles, res(0, 0))).assertEqual(0);
      expect(previewMatches(profiles, res(0, 0))).assertEqual(0);
      expect(profiles[0].size.width).assertEqual(1280);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_2100
     * @tc.name testCameraEdge0021
     * @tc.desc Verify a width-only preview match is rejected and the later exact match is used
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(1920, 720), preview(1920, 1080)];
      const index: number = service.selectProfile(profiles, res(1920, 1080));
      expect(index).assertEqual(1);
      expect(profiles[0].size.height).assertEqual(720);
      expect(previewMatches(profiles, res(1920, 1080))).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_2200
     * @tc.name testCameraEdge0022
     * @tc.desc Verify a height-only preview match is rejected and the later exact match is used
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(1280, 1080), preview(1920, 1080)];
      const index: number = service.selectProfile(profiles, res(1920, 1080));
      expect(index).assertEqual(1);
      expect(profiles[0].size.width).assertEqual(1280);
      expect(previewMatches(profiles, res(1920, 1080))).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_2300
     * @tc.name testCameraEdge0023
     * @tc.desc Verify a fractional frame width does not match an integer preview width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(1280, 720), preview(1920, 1080)];
      const target: Resolution = res(1920.5, 1080);
      expect(service.selectProfile(profiles, target)).assertEqual(0);
      expect(previewMatches(profiles, target)).assertEqual(0);
      expect(profiles[0].size.width).assertEqual(1280);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_2400
     * @tc.name testCameraEdge0024
     * @tc.desc Verify a fractional frame height does not match an integer preview height
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(1280, 720), preview(1920, 1080)];
      const target: Resolution = res(1920, 1079.5);
      expect(service.selectProfile(profiles, target)).assertEqual(0);
      expect(previewMatches(profiles, target)).assertEqual(0);
      expect(profiles[0].size.height).assertEqual(720);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_2500
     * @tc.name testCameraEdge0025
     * @tc.desc Verify a zero frame width does not match a normal preview entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(1920, 1080), preview(1280, 720)];
      expect(service.selectProfile(profiles, res(0, 1080))).assertEqual(0);
      expect(previewMatches(profiles, res(0, 1080))).assertEqual(0);
      expect(profiles[0].size.width).assertEqual(1920);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_2600
     * @tc.name testCameraEdge0026
     * @tc.desc Verify a zero frame height does not match a normal preview entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(1920, 1080), preview(1280, 720)];
      expect(service.selectProfile(profiles, res(1920, 0))).assertEqual(0);
      expect(previewMatches(profiles, res(1920, 0))).assertEqual(0);
      expect(profiles[0].size.height).assertEqual(1080);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_2700
     * @tc.name testCameraEdge0027
     * @tc.desc Verify an unavailable eight-K target falls back to the first preview entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = eightProfiles();
      const target: Resolution = res(7680, 4320);
      expect(service.selectProfile(profiles, target)).assertEqual(0);
      expect(previewMatches(profiles, target)).assertEqual(0);
      expect(profiles[0].size.width).assertEqual(640);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_2800
     * @tc.name testCameraEdge0028
     * @tc.desc Verify a one-pixel target falls back to the first preview entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(1280, 720), preview(1920, 1080)];
      expect(service.selectProfile(profiles, res(1, 1))).assertEqual(0);
      expect(previewMatches(profiles, res(1, 1))).assertEqual(0);
      expect(profiles[0].size.height).assertEqual(720);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_2900
     * @tc.name testCameraEdge0029
     * @tc.desc Verify a JPEG preview entry is selected by size and keeps its format
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const jpeg: camera.CameraFormat = camera.CameraFormat.CAMERA_FORMAT_JPEG;
      const profiles: camera.Profile[] = [preview(640, 480), preview(1280, 720), previewFmt(1920, 1080, jpeg)];
      const index: number = service.selectProfile(profiles, res(1920, 1080));
      expect(index).assertEqual(2);
      expect(profiles[index].format).assertEqual(jpeg);
      expect(previewMatches(profiles, res(1920, 1080))).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_3000
     * @tc.name testCameraEdge0030
     * @tc.desc Verify the first preview entry wins when equally sized formats differ
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const rgba: camera.CameraFormat = camera.CameraFormat.CAMERA_FORMAT_RGBA_8888;
      const profiles: camera.Profile[] = [previewFmt(1920, 1080, rgba), preview(1920, 1080)];
      const index: number = service.selectProfile(profiles, res(1920, 1080));
      expect(index).assertEqual(0);
      expect(profiles[index].format).assertEqual(rgba);
      expect(previewMatches(profiles, res(1920, 1080))).assertEqual(2);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_3100
     * @tc.name testCameraEdge0031
     * @tc.desc Verify a JPEG entry is selected even when another format precedes it at a different size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const jpeg: camera.CameraFormat = camera.CameraFormat.CAMERA_FORMAT_JPEG;
      const profiles: camera.Profile[] = [previewFmt(1280, 720, jpeg), preview(640, 480)];
      const index: number = service.selectProfile(profiles, res(1280, 720));
      expect(index).assertEqual(0);
      expect(profiles[index].format).assertEqual(jpeg);
      expect(profiles[1].size.width).assertEqual(640);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_3200
     * @tc.name testCameraEdge0032
     * @tc.desc Verify repeated preview selection with the same input is stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(640, 480), preview(1920, 1080)];
      const target: Resolution = res(1920, 1080);
      expect(service.selectProfile(profiles, target)).assertEqual(1);
      expect(service.selectProfile(profiles, target)).assertEqual(1);
      expect(profiles[1].size.width).assertEqual(1920);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_3300
     * @tc.name testCameraEdge0033
     * @tc.desc Verify selection reacts to a mutated target resolution without caching
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(1280, 720), preview(1920, 1080)];
      const target: Resolution = res(1280, 720);
      expect(service.selectProfile(profiles, target)).assertEqual(0);
      target.frameWidth = 1920;
      target.frameHeight = 1080;
      expect(service.selectProfile(profiles, target)).assertEqual(1);
      target.frameWidth = 999;
      target.frameHeight = 999;
      expect(service.selectProfile(profiles, target)).assertEqual(0);
      expect(previewMatches(profiles, target)).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_3400
     * @tc.name testCameraEdge0034
     * @tc.desc Verify one preview list resolves three different targets to three different entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(1280, 720), preview(1920, 1080), preview(3840, 2160)];
      expect(service.selectProfile(profiles, res(1280, 720))).assertEqual(0);
      expect(service.selectProfile(profiles, res(1920, 1080))).assertEqual(1);
      expect(service.selectProfile(profiles, res(3840, 2160))).assertEqual(2);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_3500
     * @tc.name testCameraEdge0035
     * @tc.desc Verify two service instances produce the same preview selection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const first: CameraService = new CameraService();
      const second: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(640, 480), preview(1920, 1080)];
      expect(first.selectProfile(profiles, res(1920, 1080))).assertEqual(1);
      expect(second.selectProfile(profiles, res(1920, 1080))).assertEqual(1);
      expect(profiles[1].size.width).assertEqual(1920);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_3600
     * @tc.name testCameraEdge0036
     * @tc.desc Verify selection uses value equality across separate Resolution instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(1280, 720), preview(1920, 1080)];
      const target: Resolution = res(1920, 1080);
      expect(service.selectProfile(profiles, target)).assertEqual(1);
      expect(service.selectProfile(profiles, res(1920, 1080))).assertEqual(1);
      expect(profiles[1].size.height).assertEqual(1080);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_3700
     * @tc.name testCameraEdge0037
     * @tc.desc Verify a descending preview list still resolves the smallest entry at its actual index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(1920, 1080), preview(1280, 720), preview(640, 480)];
      const index: number = service.selectProfile(profiles, res(640, 480));
      expect(index).assertEqual(2);
      expect(previewMatches(profiles, res(640, 480))).assertEqual(1);
      expect(profiles[index].size.width).assertEqual(640);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_3800
     * @tc.name testCameraEdge0038
     * @tc.desc Verify the last entry of a twenty-entry preview list is selected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [];
      for (let i = 0; i < 19; i++) {
        profiles.push(preview(64 + i, 48 + i));
      }
      profiles.push(preview(1920, 1080));
      const index: number = service.selectProfile(profiles, res(1920, 1080));
      expect(index).assertEqual(19);
      expect(profiles[index].size.height).assertEqual(1080);
      expect(previewMatches(profiles, res(1920, 1080))).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_3900
     * @tc.name testCameraEdge0039
     * @tc.desc Verify a missing target in a twenty-entry preview list falls back to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [];
      for (let i = 0; i < 20; i++) {
        profiles.push(preview(64 + i, 48 + i));
      }
      expect(service.selectProfile(profiles, res(1920, 1080))).assertEqual(0);
      expect(previewMatches(profiles, res(1920, 1080))).assertEqual(0);
      expect(profiles[0].size.width).assertEqual(64);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_4000
     * @tc.name testCameraEdge0040
     * @tc.desc Verify a single zero-sized preview entry matches a zero-sized target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [preview(0, 0)];
      expect(service.selectProfile(profiles, res(0, 0))).assertEqual(0);
      expect(previewMatches(profiles, res(0, 0))).assertEqual(1);
      expect(profiles[0].size.width).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_4100
     * @tc.name testCameraEdge0041
     * @tc.desc Verify a single video profile is selected with its frame rate range intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.VideoProfile[] = [video(1920, 1080)];
      const index: number = service.selectVideoProfile(profiles, res(1920, 1080));
      expect(index).assertEqual(0);
      expect(profiles[index].frameRateRange.min).assertEqual(30);
      expect(profiles[index].frameRateRange.max).assertEqual(60);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_4200
     * @tc.name testCameraEdge0042
     * @tc.desc Verify a mismatching single video profile falls back without a match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.VideoProfile[] = [video(640, 480)];
      expect(service.selectVideoProfile(profiles, res(1920, 1080))).assertEqual(0);
      expect(videoMatches(profiles, res(1920, 1080))).assertEqual(0);
      expect(profiles[0].size.width).assertEqual(640);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_4300
     * @tc.name testCameraEdge0043
     * @tc.desc Verify the middle video profile is selected from a three-entry list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.VideoProfile[] = [video(1280, 720), video(1920, 1080), video(3840, 2160)];
      const index: number = service.selectVideoProfile(profiles, res(1920, 1080));
      expect(index).assertEqual(1);
      expect(videoMatches(profiles, res(1920, 1080))).assertEqual(1);
      expect(profiles[index].frameRateRange.max).assertEqual(60);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_4400
     * @tc.name testCameraEdge0044
     * @tc.desc Verify the last video profile is selected from a three-entry list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.VideoProfile[] = [video(1280, 720), video(1920, 1080), video(3840, 2160)];
      const index: number = service.selectVideoProfile(profiles, res(3840, 2160));
      expect(index).assertEqual(2);
      expect(profiles[index].size.height).assertEqual(2160);
      expect(videoMatches(profiles, res(3840, 2160))).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_4500
     * @tc.name testCameraEdge0045
     * @tc.desc Verify the fifth video profile is selected from a five-entry list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.VideoProfile[] = [
        video(320, 240), video(640, 480), video(1280, 720), video(1920, 1080), video(2560, 1440)
      ];
      const index: number = service.selectVideoProfile(profiles, res(2560, 1440));
      expect(index).assertEqual(4);
      expect(profiles[index].size.width).assertEqual(2560);
      expect(videoMatches(profiles, res(2560, 1440))).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_4600
     * @tc.name testCameraEdge0046
     * @tc.desc Verify the tenth video profile is selected from a ten-entry list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.VideoProfile[] = [];
      for (let i = 0; i < 9; i++) {
        profiles.push(video(100 + i, 100 + i));
      }
      profiles.push(video(1920, 1080));
      const index: number = service.selectVideoProfile(profiles, res(1920, 1080));
      expect(index).assertEqual(9);
      expect(profiles[index].size.height).assertEqual(1080);
      expect(videoMatches(profiles, res(1920, 1080))).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_4700
     * @tc.name testCameraEdge0047
     * @tc.desc Verify duplicated video sizes resolve to their first occurrence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.VideoProfile[] = [
        video(1280, 720),
        video(1920, 1080),
        video(1280, 720),
        video(1920, 1080)
      ];
      const index: number = service.selectVideoProfile(profiles, res(1920, 1080));
      expect(index).assertEqual(1);
      expect(videoMatches(profiles, res(1920, 1080))).assertEqual(2);
      expect(profiles[index].size.width).assertEqual(1920);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_4800
     * @tc.name testCameraEdge0048
     * @tc.desc Verify an all-equal video list resolves to index zero with multiple matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.VideoProfile[] = [video(1920, 1080), video(1920, 1080)];
      const index: number = service.selectVideoProfile(profiles, res(1920, 1080));
      expect(index).assertEqual(0);
      expect(videoMatches(profiles, res(1920, 1080))).assertEqual(2);
      expect(profiles[index].size.height).assertEqual(1080);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_4900
     * @tc.name testCameraEdge0049
     * @tc.desc Verify an explicit zero-sized video entry matches a zero-sized target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.VideoProfile[] = [video(1280, 720), video(1920, 1080), video(0, 0)];
      const index: number = service.selectVideoProfile(profiles, res(0, 0));
      expect(index).assertEqual(2);
      expect(videoMatches(profiles, res(0, 0))).assertEqual(1);
      expect(profiles[index].size.width).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_5000
     * @tc.name testCameraEdge0050
     * @tc.desc Verify a zero-sized video target falls back when no zero entry exists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.VideoProfile[] = [video(1280, 720), video(1920, 1080)];
      expect(service.selectVideoProfile(profiles, res(0, 0))).assertEqual(0);
      expect(videoMatches(profiles, res(0, 0))).assertEqual(0);
      expect(profiles[0].size.width).assertEqual(1280);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_5100
     * @tc.name testCameraEdge0051
     * @tc.desc Verify video selection ignores frame rate and returns the first entry with the requested size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.VideoProfile[] = [videoRate(1920, 1080, 15, 30), videoRate(1920, 1080, 30, 60)];
      const index: number = service.selectVideoProfile(profiles, res(1920, 1080));
      expect(index).assertEqual(0);
      expect(profiles[index].frameRateRange.min).assertEqual(15);
      expect(profiles[index].frameRateRange.max).assertEqual(30);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_5200
     * @tc.name testCameraEdge0052
     * @tc.desc Verify portrait and landscape video entries are selected independently in one list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.VideoProfile[] = [video(720, 1280), video(1280, 720)];
      expect(service.selectVideoProfile(profiles, res(720, 1280))).assertEqual(0);
      expect(service.selectVideoProfile(profiles, res(1280, 720))).assertEqual(1);
      expect(videoMatches(profiles, res(1280, 720))).assertEqual(1);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_5300
     * @tc.name testCameraEdge0053
     * @tc.desc Verify a fractional video target does not match an integer profile width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.VideoProfile[] = [video(1280, 720), video(1920, 1080)];
      const target: Resolution = res(1280.5, 720);
      expect(service.selectVideoProfile(profiles, target)).assertEqual(0);
      expect(videoMatches(profiles, target)).assertEqual(0);
      expect(profiles[0].size.width).assertEqual(1280);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_5400
     * @tc.name testCameraEdge0054
     * @tc.desc Verify an unavailable large video target falls back to the first entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.VideoProfile[] = [video(1280, 720), video(1920, 1080)];
      expect(service.selectVideoProfile(profiles, res(9999, 9999))).assertEqual(0);
      expect(videoMatches(profiles, res(9999, 9999))).assertEqual(0);
      expect(profiles[0].size.height).assertEqual(720);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_5500
     * @tc.name testCameraEdge0055
     * @tc.desc Verify one video list resolves three targets to three distinct entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.VideoProfile[] = [video(1280, 720), video(1920, 1080), video(3840, 2160)];
      expect(service.selectVideoProfile(profiles, res(1280, 720))).assertEqual(0);
      expect(service.selectVideoProfile(profiles, res(1920, 1080))).assertEqual(1);
      expect(service.selectVideoProfile(profiles, res(3840, 2160))).assertEqual(2);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAM_EDGE_5600
     * @tc.name testCameraEdge0056
     * @tc.desc Verify two service instances produce the same video selection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraEdge0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const first: CameraService = new CameraService();
      const second: CameraService = new CameraService();
      const profiles: camera.VideoProfile[] = [video(1280, 720), video(1920, 1080)];
      expect(first.selectVideoProfile(profiles, res(1920, 1080))).assertEqual(1);
      expect(second.selectVideoProfile(profiles, res(1920, 1080))).assertEqual(1);
      expect(profiles[1].frameRateRange.max).assertEqual(60);
    })
  })
}
