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
import { camera } from '@kit.CameraKit';
import { Constants } from '../../../main/ets/common/Constants';

import { hilog } from '@kit.PerformanceAnalysisKit';

interface VideoSizeConfig {
  width: number;
  height: number;
}

interface VideoRateRangeConfig {
  min: number;
  max: number;
}

interface VideoConfig {
  format: number;
  size: VideoSizeConfig;
  frameRateRange: VideoRateRangeConfig;
}

const DOMAIN: number = 0xF812;
const TAG: string = '[Sample_PhotoSameSource]';

function previewProfile(width: number, height: number, format: number): camera.Profile {
  return { format: format, size: { width: width, height: height } };
}

function videoConfig(width: number, height: number, format: number, min: number, max: number): VideoConfig {
  return { format: format, size: { width: width, height: height }, frameRateRange: { min: min, max: max } };
}

function capability(previews: camera.Profile[], videos: VideoConfig[],
  photos: camera.Profile[]): camera.CameraOutputCapability {
  return {
    previewProfiles: previews,
    photoProfiles: photos,
    videoProfiles: videos,
    supportedMetadataObjectTypes: []
  } as camera.CameraOutputCapability;
}


export default function CameraProfileMatrixPart1Test(): void {
  describe('CameraProfileMatrixPart1', () => {

    /**
     * @tc.number    SUB_PHOTO_CPRP1_0100
     * @tc.name      testPreviewEmpty0001
     * @tc.desc      Verify preview selection returns undefined for an empty list.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPreviewEmpty0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewEmpty0001 begin');
      const cap = capability([], [], []);
      expect(CameraService.getPreviewProfile(cap) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewEmpty0001 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPRP1_0200
     * @tc.name      testPreviewExact0002
     * @tc.desc      Verify preview selection matches the configured size and format.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPreviewExact0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewExact0002 begin');
      const cap = capability([previewProfile(1920, 1080, 1003)], [], []);
      const picked = CameraService.getPreviewProfile(cap);
      expect(picked !== undefined).assertTrue();
      if (picked !== undefined) {
        expect(picked.size.width).assertEqual(1920);
        expect(picked.size.height).assertEqual(1080);
        expect(picked.format).assertEqual(1003);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewExact0002 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPRP1_0300
     * @tc.name      testPreviewWrongWidth0003
     * @tc.desc      Verify preview selection rejects a profile with wrong width.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPreviewWrongWidth0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWrongWidth0003 begin');
      const cap = capability([previewProfile(1920 - 1, 1080, 1003)], [], []);
      expect(CameraService.getPreviewProfile(cap) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWrongWidth0003 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPRP1_0400
     * @tc.name      testPreviewWrongHeight0004
     * @tc.desc      Verify preview selection rejects a profile with wrong height.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPreviewWrongHeight0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWrongHeight0004 begin');
      const cap = capability([previewProfile(1920, 1080 - 1, 1003)], [], []);
      expect(CameraService.getPreviewProfile(cap) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWrongHeight0004 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPRP1_0500
     * @tc.name      testPreviewWrongFormat0005
     * @tc.desc      Verify preview selection rejects a profile with wrong format.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPreviewWrongFormat0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWrongFormat0005 begin');
      const cap = capability([previewProfile(1920, 1080, 1004)], [], []);
      expect(CameraService.getPreviewProfile(cap) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewWrongFormat0005 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPRP1_0600
     * @tc.name      testPreviewSecondEntry0006
     * @tc.desc      Verify preview selection scans past non-matching entries.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPreviewSecondEntry0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSecondEntry0006 begin');
      const cap = capability([previewProfile(1280, 720, 1003), previewProfile(1920, 1080, 1003)], [], []);
      const picked = CameraService.getPreviewProfile(cap);
      expect(picked !== undefined).assertTrue();
      if (picked !== undefined) {
        expect(picked.size.width).assertEqual(1920);
        expect(picked.size.height).assertEqual(1080);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewSecondEntry0006 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPRP1_0700
     * @tc.name      testPreviewUsesWidthFirst0007
     * @tc.desc      Verify a width match with wrong height still returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPreviewUsesWidthFirst0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewUsesWidthFirst0007 begin');
      const cap = capability([previewProfile(1920, 1081, 1003), previewProfile(1921, 1080, 1003)], [], []);
      expect(CameraService.getPreviewProfile(cap) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewUsesWidthFirst0007 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPRP1_0800
     * @tc.name      testPreviewIgnoresPhotoOnly0008
     * @tc.desc      Verify preview selection ignores photo profiles only.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPreviewIgnoresPhotoOnly0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewIgnoresPhotoOnly0008 begin');
      const cap = capability([], [], [previewProfile(1920, 1080, 1003)]);
      expect(CameraService.getPreviewProfile(cap) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewIgnoresPhotoOnly0008 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPRP1_0900
     * @tc.name      testPreviewIgnoresVideoOnly0009
     * @tc.desc      Verify preview selection ignores video profiles only.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPreviewIgnoresVideoOnly0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewIgnoresVideoOnly0009 begin');
      const cap = capability([], [videoConfig(1920, 1080, 1003, 30, 60)], []);
      expect(CameraService.getPreviewProfile(cap) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewIgnoresVideoOnly0009 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPRP1_1000
     * @tc.name      testPreviewFourCandidates0010
     * @tc.desc      Verify preview selection picks the only matching entry among four.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPreviewFourCandidates0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewFourCandidates0010 begin');
      const cap = capability([previewProfile(640, 480, 1003), previewProfile(1280, 720, 1003),
        previewProfile(1920, 1080, 1003), previewProfile(1920, 1080, 1004)], [], []);
      const picked = CameraService.getPreviewProfile(cap);
      expect(picked !== undefined).assertTrue();
      if (picked !== undefined) {
        expect(picked.format).assertEqual(1003);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewFourCandidates0010 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPRP1_1100
     * @tc.name      testVideoEmpty0011
     * @tc.desc      Verify video selection returns undefined for an empty list.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testVideoEmpty0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoEmpty0011 begin');
      const cap = capability([], [], []);
      expect(CameraService.getVideoProfile(cap) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoEmpty0011 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPRP1_1200
     * @tc.name      testVideoExact0012
     * @tc.desc      Verify video selection matches size, format and 30-60 fps.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testVideoExact0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoExact0012 begin');
      const cap = capability([], [videoConfig(1920, 1080, 1003, 30, 60)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked !== undefined).assertTrue();
      if (picked !== undefined) {
        expect(picked.size.width).assertEqual(1920);
        expect(picked.size.height).assertEqual(1080);
        expect(picked.frameRateRange.max).assertEqual(60);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoExact0012 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPRP1_1300
     * @tc.name      testVideoMaxAboveCeiling0013
     * @tc.desc      Verify video selection rejects a max frame rate above 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoMaxAboveCeiling0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoMaxAboveCeiling0013 begin');
      const cap = capability([], [videoConfig(1920, 1080, 1003, 30, 61)], []);
      expect(CameraService.getVideoProfile(cap) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoMaxAboveCeiling0013 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPRP1_1400
     * @tc.name      testVideoMinAboveCeiling0014
     * @tc.desc      Verify video selection rejects a min frame rate above 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoMinAboveCeiling0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoMinAboveCeiling0014 begin');
      const cap = capability([], [videoConfig(1920, 1080, 1003, 61, 90)], []);
      expect(CameraService.getVideoProfile(cap) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoMinAboveCeiling0014 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPRP1_1500
     * @tc.name      testVideoZeroRange0015
     * @tc.desc      Verify video selection accepts a zero frame rate range.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoZeroRange0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoZeroRange0015 begin');
      const cap = capability([], [videoConfig(1920, 1080, 1003, 0, 0)], []);
      expect(CameraService.getVideoProfile(cap) !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoZeroRange0015 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPRP1_1600
     * @tc.name      testVideoLowRange0016
     * @tc.desc      Verify video selection accepts 24-60 fps.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoLowRange0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoLowRange0016 begin');
      const cap = capability([], [videoConfig(1920, 1080, 1003, 24, 60)], []);
      expect(CameraService.getVideoProfile(cap) !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoLowRange0016 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPRP1_1700
     * @tc.name      testVideoBoundaryRange0017
     * @tc.desc      Verify video selection accepts 59-60 fps.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoBoundaryRange0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoBoundaryRange0017 begin');
      const cap = capability([], [videoConfig(1920, 1080, 1003, 59, 60)], []);
      expect(CameraService.getVideoProfile(cap) !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoBoundaryRange0017 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPRP1_1800
     * @tc.name      testVideoWrongFormat0018
     * @tc.desc      Verify video selection rejects a wrong format.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoWrongFormat0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoWrongFormat0018 begin');
      const cap = capability([], [videoConfig(1920, 1080, 1004, 30, 60)], []);
      expect(CameraService.getVideoProfile(cap) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoWrongFormat0018 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPRP1_1900
     * @tc.name      testVideoWrongWidth0019
     * @tc.desc      Verify video selection rejects a wrong width.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoWrongWidth0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoWrongWidth0019 begin');
      const cap = capability([], [videoConfig(1920 + 1, 1080, 1003, 30, 60)], []);
      expect(CameraService.getVideoProfile(cap) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoWrongWidth0019 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPRP1_2000
     * @tc.name      testVideoWrongHeight0020
     * @tc.desc      Verify video selection rejects a wrong height.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoWrongHeight0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoWrongHeight0020 begin');
      const cap = capability([], [videoConfig(1920, 1080 + 1, 1003, 30, 60)], []);
      expect(CameraService.getVideoProfile(cap) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoWrongHeight0020 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPRP1_2100
     * @tc.name      testVideoSecondEntry0021
     * @tc.desc      Verify video selection scans past non-matching entries.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoSecondEntry0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoSecondEntry0021 begin');
      const cap = capability([], [videoConfig(1280, 720, 1003, 30, 60), videoConfig(1920, 1080, 1003, 24, 30)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked !== undefined).assertTrue();
      if (picked !== undefined) {
        expect(picked.frameRateRange.min).assertEqual(24);
        expect(picked.frameRateRange.max).assertEqual(30);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoSecondEntry0021 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPRP1_2200
     * @tc.name      testVideoIgnoresPreviewOnly0022
     * @tc.desc      Verify video selection ignores preview profiles only.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoIgnoresPreviewOnly0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoIgnoresPreviewOnly0022 begin');
      const cap = capability([previewProfile(1920, 1080, 1003)], [], []);
      expect(CameraService.getVideoProfile(cap) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoIgnoresPreviewOnly0022 end');
    })

  })
}
