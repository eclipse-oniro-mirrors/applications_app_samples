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
import { describe, beforeEach, it, expect } from '@ohos/hypium';
import { paceTurn } from './TestPace';
import { camera } from '@kit.CameraKit';
import CameraService from '../../../main/ets/services/CameraService';
import { Resolution } from '../../../main/ets/services/CommonTypes';

const SEED_MODULUS: number = 2147483648;
const WIDTH_UNIT: number = 320;
const HEIGHT_UNIT: number = 240;
const WIDTH_VARIANTS: number = 20;
const HEIGHT_VARIANTS: number = 15;

function nextSeed(seed: number): number {
  return (seed * 1103515245 + 12345) % SEED_MODULUS;
}

function res(width: number, height: number): Resolution {
  return { frameWidth: width, frameHeight: height } as Resolution;
}

function generatedProfiles(count: number, seed: number): camera.Profile[] {
  let state: number = seed;
  const list: camera.Profile[] = [];
  for (let i = 0; i < count; i++) {
    state = nextSeed(state);
    const width: number = WIDTH_UNIT * (1 + state % WIDTH_VARIANTS);
    state = nextSeed(state);
    const height: number = HEIGHT_UNIT * (1 + state % HEIGHT_VARIANTS);
    list.push({
      format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP,
      size: { width: width, height: height }
    });
  }
  return list;
}

function generatedVideoProfiles(count: number, seed: number): camera.VideoProfile[] {
  let state: number = seed;
  const list: camera.VideoProfile[] = [];
  for (let i = 0; i < count; i++) {
    state = nextSeed(state);
    const width: number = WIDTH_UNIT * (1 + state % WIDTH_VARIANTS);
    state = nextSeed(state);
    const height: number = HEIGHT_UNIT * (1 + state % HEIGHT_VARIANTS);
    list.push({
      format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP,
      size: { width: width, height: height },
      frameRateRange: { min: 30, max: 60 }
    });
  }
  return list;
}

function matchingIndexes(profiles: camera.Profile[], target: Resolution): number[] {
  const indexes: number[] = [];
  for (let i = 0; i < profiles.length; i++) {
    if (profiles[i].size.width === target.frameWidth && profiles[i].size.height === target.frameHeight) {
      indexes.push(i);
    }
  }
  return indexes;
}

function videoMatchingIndexes(profiles: camera.VideoProfile[], target: Resolution): number[] {
  const indexes: number[] = [];
  for (let i = 0; i < profiles.length; i++) {
    if (profiles[i].size.width === target.frameWidth && profiles[i].size.height === target.frameHeight) {
      indexes.push(i);
    }
  }
  return indexes;
}

function targetOf(profiles: camera.Profile[], index: number): Resolution {
  return res(profiles[index].size.width, profiles[index].size.height);
}

function videoTargetOf(profiles: camera.VideoProfile[], index: number): Resolution {
  return res(profiles[index].size.width, profiles[index].size.height);
}

export default function cameraSelectionInvariantTest() {
  describe('cameraSelectionInvariantTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_AVRECORDER_CAMERA_INVARIANT_0100
     * @tc.name testCameraInvariant0001
     * @tc.desc Verify selection on a generated capability list returns the first profile with the target size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraInvariant0001', 0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = generatedProfiles(8, 7);
      const target: Resolution = targetOf(profiles, 3);
      const expected: number[] = matchingIndexes(profiles, target);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(expected[0]);
      expect(profiles[index].size.width).assertEqual(target.frameWidth);
      expect(profiles[index].size.height).assertEqual(target.frameHeight);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAMERA_INVARIANT_0200
     * @tc.name testCameraInvariant0002
     * @tc.desc Verify a generated list without the target size falls back to index zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraInvariant0002', 0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = generatedProfiles(8, 7);
      const target: Resolution = res(2, 3);
      expect(matchingIndexes(profiles, target).length).assertEqual(0);
      expect(service.selectProfile(profiles, target)).assertEqual(0);
      expect(profiles[0].size.width).assertEqual(WIDTH_UNIT * (1 + nextSeed(7) % WIDTH_VARIANTS));
    })

    /**
     * @tc.number SUB_AVRECORDER_CAMERA_INVARIANT_0300
     * @tc.name testCameraInvariant0003
     * @tc.desc Verify duplicated sizes resolve to the earliest matching index, never a later duplicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraInvariant0003', 0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = generatedProfiles(6, 11);
      profiles[5] = {
        format: profiles[2].format,
        size: { width: profiles[2].size.width, height: profiles[2].size.height }
      };
      const target: Resolution = targetOf(profiles, 2);
      const matches: number[] = matchingIndexes(profiles, target);
      const index: number = service.selectProfile(profiles, target);
      expect(matches.length > 1).assertTrue();
      expect(index).assertEqual(matches[0]);
      expect(index < matches[matches.length - 1]).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_CAMERA_INVARIANT_0400
     * @tc.name testCameraInvariant0004
     * @tc.desc Verify a matching first entry is reported as index zero and not as a fallback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraInvariant0004', 0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = generatedProfiles(5, 23);
      const target: Resolution = targetOf(profiles, 0);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(0);
      expect(matchingIndexes(profiles, target).length > 0).assertTrue();
      expect(profiles[0].size.width).assertEqual(target.frameWidth);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAMERA_INVARIANT_0500
     * @tc.name testCameraInvariant0005
     * @tc.desc Verify selection reaches the final entry of a long generated capability list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraInvariant0005', 0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = generatedProfiles(21, 99);
      profiles[20] = { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 3, height: 5 } };
      const target: Resolution = targetOf(profiles, 20);
      const matches: number[] = matchingIndexes(profiles, target);
      const index: number = service.selectProfile(profiles, target);
      expect(index).assertEqual(20);
      expect(matches.length).assertEqual(1);
      expect(profiles[index].size.height).assertEqual(target.frameHeight);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAMERA_INVARIANT_0600
     * @tc.name testCameraInvariant0006
     * @tc.desc Verify two generated lists resolve the same target according to their own contents
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraInvariant0006', 0, () => {
      const service: CameraService = new CameraService();
      const first: camera.Profile[] = generatedProfiles(9, 17);
      const second: camera.Profile[] = generatedProfiles(9, 29);
      const target: Resolution = targetOf(first, 4);
      const firstMatches: number[] = matchingIndexes(first, target);
      const secondMatches: number[] = matchingIndexes(second, target);
      expect(service.selectProfile(first, target)).assertEqual(firstMatches[0]);
      expect(service.selectProfile(second, target))
        .assertEqual(secondMatches.length === 0 ? 0 : secondMatches[0]);
      expect(first.length).assertEqual(second.length);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAMERA_INVARIANT_0700
     * @tc.name testCameraInvariant0007
     * @tc.desc Verify an explicit zero-sized profile is still matched exactly at its own index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraInvariant0007', 0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = generatedProfiles(6, 3);
      profiles[4] = { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 0, height: 0 } };
      const target: Resolution = res(0, 0);
      expect(service.selectProfile(profiles, target)).assertEqual(4);
      expect(matchingIndexes(profiles, target).length).assertEqual(1);
      expect(profiles[4].size.width).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAMERA_INVARIANT_0800
     * @tc.name testCameraInvariant0008
     * @tc.desc Verify the returned index is always the smallest match or the fallback zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraInvariant0008', 0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = generatedProfiles(12, 41);
      const targets: Resolution[] = [targetOf(profiles, 1), targetOf(profiles, 7), res(1, 1)];
      for (let i = 0; i < targets.length; i++) {
        const matches: number[] = matchingIndexes(profiles, targets[i]);
        const index: number = service.selectProfile(profiles, targets[i]);
        expect(index).assertEqual(matches.length === 0 ? 0 : matches[0]);
        expect(index <= (matches.length === 0 ? 0 : matches[0])).assertTrue();
        expect(index >= 0).assertTrue();
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_CAMERA_INVARIANT_0900
     * @tc.name testCameraInvariant0009
     * @tc.desc Verify a target that only matches the height never scores a profile match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraInvariant0009', 0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = generatedProfiles(7, 53);
      const target: Resolution = res(1, profiles[0].size.height);
      expect(matchingIndexes(profiles, target).length).assertEqual(0);
      expect(service.selectProfile(profiles, target)).assertEqual(0);
      expect(profiles[0].size.height).assertEqual(target.frameHeight);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAMERA_INVARIANT_1000
     * @tc.name testCameraInvariant0010
     * @tc.desc Verify a target that only matches the width never scores a profile match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraInvariant0010', 0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = generatedProfiles(7, 61);
      const target: Resolution = res(profiles[0].size.width, 1);
      expect(matchingIndexes(profiles, target).length).assertEqual(0);
      expect(service.selectProfile(profiles, target)).assertEqual(0);
      expect(profiles[0].size.width).assertEqual(target.frameWidth);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAMERA_INVARIANT_1100
     * @tc.name testCameraInvariant0011
     * @tc.desc Verify a single-entry list distinguishes its one real match from a fallback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraInvariant0011', 0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = [{
        format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP,
        size: { width: 1280, height: 720 }
      }];
      expect(service.selectProfile(profiles, res(1280, 720))).assertEqual(0);
      expect(matchingIndexes(profiles, res(1280, 720)).length).assertEqual(1);
      expect(service.selectProfile(profiles, res(1920, 1080))).assertEqual(0);
      expect(matchingIndexes(profiles, res(1920, 1080)).length).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAMERA_INVARIANT_1200
     * @tc.name testCameraInvariant0012
     * @tc.desc Verify the middle entry of a thirteen-profile list is selected exactly once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraInvariant0012', 0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.Profile[] = generatedProfiles(13, 31);
      profiles[6] = { format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP, size: { width: 5, height: 7 } };
      const target: Resolution = targetOf(profiles, 6);
      const matches: number[] = matchingIndexes(profiles, target);
      expect(service.selectProfile(profiles, target)).assertEqual(6);
      expect(matches.length).assertEqual(1);
      expect(profiles[6].size.width).assertEqual(target.frameWidth);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAMERA_INVARIANT_1300
     * @tc.name testCameraInvariant0013
     * @tc.desc Verify video selection on a generated list returns the earliest matching profile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraInvariant0013', 0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.VideoProfile[] = generatedVideoProfiles(8, 5);
      const target: Resolution = videoTargetOf(profiles, 4);
      const matches: number[] = videoMatchingIndexes(profiles, target);
      expect(service.selectVideoProfile(profiles, target)).assertEqual(matches[0]);
      expect(profiles[matches[0]].size.width).assertEqual(target.frameWidth);
      expect(profiles[matches[0]].frameRateRange.min).assertEqual(30);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAMERA_INVARIANT_1400
     * @tc.name testCameraInvariant0014
     * @tc.desc Verify video selection falls back to zero when a generated list lacks the target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraInvariant0014', 0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.VideoProfile[] = generatedVideoProfiles(8, 5);
      const target: Resolution = res(2, 2);
      expect(videoMatchingIndexes(profiles, target).length).assertEqual(0);
      expect(service.selectVideoProfile(profiles, target)).assertEqual(0);
      expect(profiles[0].frameRateRange.max).assertEqual(60);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAMERA_INVARIANT_1500
     * @tc.name testCameraInvariant0015
     * @tc.desc Verify duplicated video sizes resolve to the earliest duplicate index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraInvariant0015', 0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.VideoProfile[] = generatedVideoProfiles(7, 13);
      profiles[6] = {
        format: profiles[1].format,
        size: { width: profiles[1].size.width, height: profiles[1].size.height },
        frameRateRange: { min: 15, max: 30 }
      };
      const target: Resolution = videoTargetOf(profiles, 1);
      const matches: number[] = videoMatchingIndexes(profiles, target);
      const index: number = service.selectVideoProfile(profiles, target);
      expect(matches.length).assertEqual(2);
      expect(index).assertEqual(matches[0]);
      expect(profiles[index].frameRateRange.max).assertEqual(60);
    })

    /**
     * @tc.number SUB_AVRECORDER_CAMERA_INVARIANT_1600
     * @tc.name testCameraInvariant0016
     * @tc.desc Verify video selection reaches the last entry of a long generated list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCameraInvariant0016', 0, () => {
      const service: CameraService = new CameraService();
      const profiles: camera.VideoProfile[] = generatedVideoProfiles(16, 77);
      profiles[15] = {
        format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP,
        size: { width: 7, height: 9 },
        frameRateRange: { min: 30, max: 60 }
      };
      const target: Resolution = videoTargetOf(profiles, 15);
      expect(service.selectVideoProfile(profiles, target)).assertEqual(15);
      expect(videoMatchingIndexes(profiles, target).length).assertEqual(1);
      expect(profiles[15].size.height).assertEqual(target.frameHeight);
    })
  })
}
