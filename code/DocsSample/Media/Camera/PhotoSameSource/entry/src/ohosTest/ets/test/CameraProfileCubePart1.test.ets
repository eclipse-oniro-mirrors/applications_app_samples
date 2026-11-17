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
import { Constants } from '../../../main/ets/common/Constants';
import { previewProfile, videoProfile, capability } from './shared/PhotoProfileSupport';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF812;
const TAG: string = '[Sample_PhotoSameSource]';

export default function CameraProfileCubePart1Test(): void {
  describe('CameraProfileCubePart1', () => {

    /**
     * @tc.number    SUB_PHOTO_CPCP1_0100
     * @tc.name      testPreviewCube0001
     * @tc.desc      Verify preview selection for 1919x1079 format 1002 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPreviewCube0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0001 begin');
      const cap = capability([previewProfile(1919, 1079, 1002)], [], []);
      const picked = CameraService.getPreviewProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0001 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP1_0200
     * @tc.name      testPreviewCube0002
     * @tc.desc      Verify preview selection for 1919x1079 format 1003 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPreviewCube0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0002 begin');
      const cap = capability([previewProfile(1919, 1079, 1003)], [], []);
      const picked = CameraService.getPreviewProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0002 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP1_0300
     * @tc.name      testPreviewCube0003
     * @tc.desc      Verify preview selection for 1919x1079 format 1004 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPreviewCube0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0003 begin');
      const cap = capability([previewProfile(1919, 1079, 1004)], [], []);
      const picked = CameraService.getPreviewProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0003 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP1_0400
     * @tc.name      testPreviewCube0004
     * @tc.desc      Verify preview selection for 1919x1080 format 1002 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPreviewCube0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0004 begin');
      const cap = capability([previewProfile(1919, 1080, 1002)], [], []);
      const picked = CameraService.getPreviewProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0004 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP1_0500
     * @tc.name      testPreviewCube0005
     * @tc.desc      Verify preview selection for 1919x1080 format 1003 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPreviewCube0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0005 begin');
      const cap = capability([previewProfile(1919, 1080, 1003)], [], []);
      const picked = CameraService.getPreviewProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0005 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP1_0600
     * @tc.name      testPreviewCube0006
     * @tc.desc      Verify preview selection for 1919x1080 format 1004 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPreviewCube0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0006 begin');
      const cap = capability([previewProfile(1919, 1080, 1004)], [], []);
      const picked = CameraService.getPreviewProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0006 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP1_0700
     * @tc.name      testPreviewCube0007
     * @tc.desc      Verify preview selection for 1919x1081 format 1002 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPreviewCube0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0007 begin');
      const cap = capability([previewProfile(1919, 1081, 1002)], [], []);
      const picked = CameraService.getPreviewProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0007 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP1_0800
     * @tc.name      testPreviewCube0008
     * @tc.desc      Verify preview selection for 1919x1081 format 1003 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPreviewCube0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0008 begin');
      const cap = capability([previewProfile(1919, 1081, 1003)], [], []);
      const picked = CameraService.getPreviewProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0008 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP1_0900
     * @tc.name      testPreviewCube0009
     * @tc.desc      Verify preview selection for 1919x1081 format 1004 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPreviewCube0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0009 begin');
      const cap = capability([previewProfile(1919, 1081, 1004)], [], []);
      const picked = CameraService.getPreviewProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0009 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP1_1000
     * @tc.name      testPreviewCube0010
     * @tc.desc      Verify preview selection for 1920x1079 format 1002 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPreviewCube0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0010 begin');
      const cap = capability([previewProfile(1920, 1079, 1002)], [], []);
      const picked = CameraService.getPreviewProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0010 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP1_1100
     * @tc.name      testPreviewCube0011
     * @tc.desc      Verify preview selection for 1920x1079 format 1003 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPreviewCube0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0011 begin');
      const cap = capability([previewProfile(1920, 1079, 1003)], [], []);
      const picked = CameraService.getPreviewProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0011 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP1_1200
     * @tc.name      testPreviewCube0012
     * @tc.desc      Verify preview selection for 1920x1079 format 1004 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPreviewCube0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0012 begin');
      const cap = capability([previewProfile(1920, 1079, 1004)], [], []);
      const picked = CameraService.getPreviewProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0012 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP1_1300
     * @tc.name      testPreviewCube0013
     * @tc.desc      Verify preview selection for 1920x1080 format 1002 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPreviewCube0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0013 begin');
      const cap = capability([previewProfile(1920, 1080, 1002)], [], []);
      const picked = CameraService.getPreviewProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0013 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP1_1400
     * @tc.name      testPreviewCube0014
     * @tc.desc      Verify preview selection for 1920x1080 format 1003 returns the profile.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPreviewCube0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0014 begin');
      const cap = capability([previewProfile(1920, 1080, 1003)], [], []);
      const picked = CameraService.getPreviewProfile(cap);
      expect(picked !== undefined).assertTrue();
      if (picked !== undefined) {
        expect(picked.size.width).assertEqual(1920);
        expect(picked.size.height).assertEqual(1080);
        expect(picked.format).assertEqual(1003);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0014 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP1_1500
     * @tc.name      testPreviewCube0015
     * @tc.desc      Verify preview selection for 1920x1080 format 1004 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPreviewCube0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0015 begin');
      const cap = capability([previewProfile(1920, 1080, 1004)], [], []);
      const picked = CameraService.getPreviewProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0015 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP1_1600
     * @tc.name      testPreviewCube0016
     * @tc.desc      Verify preview selection for 1920x1081 format 1002 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPreviewCube0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0016 begin');
      const cap = capability([previewProfile(1920, 1081, 1002)], [], []);
      const picked = CameraService.getPreviewProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0016 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP1_1700
     * @tc.name      testPreviewCube0017
     * @tc.desc      Verify preview selection for 1920x1081 format 1003 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPreviewCube0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0017 begin');
      const cap = capability([previewProfile(1920, 1081, 1003)], [], []);
      const picked = CameraService.getPreviewProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0017 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP1_1800
     * @tc.name      testPreviewCube0018
     * @tc.desc      Verify preview selection for 1920x1081 format 1004 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPreviewCube0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0018 begin');
      const cap = capability([previewProfile(1920, 1081, 1004)], [], []);
      const picked = CameraService.getPreviewProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0018 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP1_1900
     * @tc.name      testPreviewCube0019
     * @tc.desc      Verify preview selection for 1921x1079 format 1002 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPreviewCube0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0019 begin');
      const cap = capability([previewProfile(1921, 1079, 1002)], [], []);
      const picked = CameraService.getPreviewProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0019 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP1_2000
     * @tc.name      testPreviewCube0020
     * @tc.desc      Verify preview selection for 1921x1079 format 1003 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPreviewCube0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0020 begin');
      const cap = capability([previewProfile(1921, 1079, 1003)], [], []);
      const picked = CameraService.getPreviewProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0020 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP1_2100
     * @tc.name      testPreviewCube0021
     * @tc.desc      Verify preview selection for 1921x1079 format 1004 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPreviewCube0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0021 begin');
      const cap = capability([previewProfile(1921, 1079, 1004)], [], []);
      const picked = CameraService.getPreviewProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0021 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP1_2200
     * @tc.name      testPreviewCube0022
     * @tc.desc      Verify preview selection for 1921x1080 format 1002 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPreviewCube0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0022 begin');
      const cap = capability([previewProfile(1921, 1080, 1002)], [], []);
      const picked = CameraService.getPreviewProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0022 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP1_2300
     * @tc.name      testPreviewCube0023
     * @tc.desc      Verify preview selection for 1921x1080 format 1003 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPreviewCube0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0023 begin');
      const cap = capability([previewProfile(1921, 1080, 1003)], [], []);
      const picked = CameraService.getPreviewProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0023 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP1_2400
     * @tc.name      testPreviewCube0024
     * @tc.desc      Verify preview selection for 1921x1080 format 1004 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPreviewCube0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0024 begin');
      const cap = capability([previewProfile(1921, 1080, 1004)], [], []);
      const picked = CameraService.getPreviewProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0024 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP1_2500
     * @tc.name      testPreviewCube0025
     * @tc.desc      Verify preview selection for 1921x1081 format 1002 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPreviewCube0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0025 begin');
      const cap = capability([previewProfile(1921, 1081, 1002)], [], []);
      const picked = CameraService.getPreviewProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0025 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP1_2600
     * @tc.name      testPreviewCube0026
     * @tc.desc      Verify preview selection for 1921x1081 format 1003 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPreviewCube0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0026 begin');
      const cap = capability([previewProfile(1921, 1081, 1003)], [], []);
      const picked = CameraService.getPreviewProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0026 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP1_2700
     * @tc.name      testPreviewCube0027
     * @tc.desc      Verify preview selection for 1921x1081 format 1004 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPreviewCube0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0027 begin');
      const cap = capability([previewProfile(1921, 1081, 1004)], [], []);
      const picked = CameraService.getPreviewProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreviewCube0027 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP1_2800
     * @tc.name      testVideoCube0028
     * @tc.desc      Verify video selection for 1919x1079 format 1003 fps 0-0 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0028 begin');
      const cap = capability([], [videoProfile(1919, 1079, 1003, 0, 0)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0028 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP1_2900
     * @tc.name      testVideoCube0029
     * @tc.desc      Verify video selection for 1919x1079 format 1003 fps 30-60 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0029 begin');
      const cap = capability([], [videoProfile(1919, 1079, 1003, 30, 60)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0029 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP1_3000
     * @tc.name      testVideoCube0030
     * @tc.desc      Verify video selection for 1919x1079 format 1003 fps 59-60 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0030 begin');
      const cap = capability([], [videoProfile(1919, 1079, 1003, 59, 60)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0030 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP1_3100
     * @tc.name      testVideoCube0031
     * @tc.desc      Verify video selection for 1919x1079 format 1003 fps 30-61 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0031 begin');
      const cap = capability([], [videoProfile(1919, 1079, 1003, 30, 61)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0031 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP1_3200
     * @tc.name      testVideoCube0032
     * @tc.desc      Verify video selection for 1919x1079 format 1004 fps 0-0 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0032 begin');
      const cap = capability([], [videoProfile(1919, 1079, 1004, 0, 0)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0032 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP1_3300
     * @tc.name      testVideoCube0033
     * @tc.desc      Verify video selection for 1919x1079 format 1004 fps 30-60 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0033 begin');
      const cap = capability([], [videoProfile(1919, 1079, 1004, 30, 60)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0033 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP1_3400
     * @tc.name      testVideoCube0034
     * @tc.desc      Verify video selection for 1919x1079 format 1004 fps 59-60 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0034 begin');
      const cap = capability([], [videoProfile(1919, 1079, 1004, 59, 60)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0034 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP1_3500
     * @tc.name      testVideoCube0035
     * @tc.desc      Verify video selection for 1919x1079 format 1004 fps 30-61 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0035 begin');
      const cap = capability([], [videoProfile(1919, 1079, 1004, 30, 61)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0035 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP1_3600
     * @tc.name      testVideoCube0036
     * @tc.desc      Verify video selection for 1919x1080 format 1003 fps 0-0 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0036 begin');
      const cap = capability([], [videoProfile(1919, 1080, 1003, 0, 0)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0036 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP1_3700
     * @tc.name      testVideoCube0037
     * @tc.desc      Verify video selection for 1919x1080 format 1003 fps 30-60 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0037 begin');
      const cap = capability([], [videoProfile(1919, 1080, 1003, 30, 60)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0037 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP1_3800
     * @tc.name      testVideoCube0038
     * @tc.desc      Verify video selection for 1919x1080 format 1003 fps 59-60 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0038 begin');
      const cap = capability([], [videoProfile(1919, 1080, 1003, 59, 60)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0038 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP1_3900
     * @tc.name      testVideoCube0039
     * @tc.desc      Verify video selection for 1919x1080 format 1003 fps 30-61 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0039 begin');
      const cap = capability([], [videoProfile(1919, 1080, 1003, 30, 61)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0039 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP1_4000
     * @tc.name      testVideoCube0040
     * @tc.desc      Verify video selection for 1919x1080 format 1004 fps 0-0 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0040 begin');
      const cap = capability([], [videoProfile(1919, 1080, 1004, 0, 0)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0040 end');
    })

  })
}
