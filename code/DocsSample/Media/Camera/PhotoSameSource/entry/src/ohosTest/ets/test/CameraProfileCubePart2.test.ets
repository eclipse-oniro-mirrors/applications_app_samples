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
import { previewProfile, videoConfig, capability } from './shared/PhotoProfileSupport';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF812;
const TAG: string = '[Sample_PhotoSameSource]';

export default function CameraProfileCubePart2Test(): void {
  describe('CameraProfileCubePart2', () => {

    /**
     * @tc.number    SUB_PHOTO_CPCP2_4100
     * @tc.name      testVideoCube0041
     * @tc.desc      Verify video selection for 1919x1080 format 1004 fps 30-60 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0041 begin');
      const cap = capability([], [videoConfig(1919, 1080, 1004, 30, 60)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0041 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP2_4200
     * @tc.name      testVideoCube0042
     * @tc.desc      Verify video selection for 1919x1080 format 1004 fps 59-60 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0042 begin');
      const cap = capability([], [videoConfig(1919, 1080, 1004, 59, 60)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0042 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP2_4300
     * @tc.name      testVideoCube0043
     * @tc.desc      Verify video selection for 1919x1080 format 1004 fps 30-61 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0043 begin');
      const cap = capability([], [videoConfig(1919, 1080, 1004, 30, 61)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0043 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP2_4400
     * @tc.name      testVideoCube0044
     * @tc.desc      Verify video selection for 1919x1081 format 1003 fps 0-0 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0044 begin');
      const cap = capability([], [videoConfig(1919, 1081, 1003, 0, 0)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0044 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP2_4500
     * @tc.name      testVideoCube0045
     * @tc.desc      Verify video selection for 1919x1081 format 1003 fps 30-60 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0045 begin');
      const cap = capability([], [videoConfig(1919, 1081, 1003, 30, 60)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0045 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP2_4600
     * @tc.name      testVideoCube0046
     * @tc.desc      Verify video selection for 1919x1081 format 1003 fps 59-60 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0046 begin');
      const cap = capability([], [videoConfig(1919, 1081, 1003, 59, 60)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0046 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP2_4700
     * @tc.name      testVideoCube0047
     * @tc.desc      Verify video selection for 1919x1081 format 1003 fps 30-61 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0047 begin');
      const cap = capability([], [videoConfig(1919, 1081, 1003, 30, 61)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0047 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP2_4800
     * @tc.name      testVideoCube0048
     * @tc.desc      Verify video selection for 1919x1081 format 1004 fps 0-0 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0048 begin');
      const cap = capability([], [videoConfig(1919, 1081, 1004, 0, 0)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0048 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP2_4900
     * @tc.name      testVideoCube0049
     * @tc.desc      Verify video selection for 1919x1081 format 1004 fps 30-60 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0049 begin');
      const cap = capability([], [videoConfig(1919, 1081, 1004, 30, 60)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0049 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP2_5000
     * @tc.name      testVideoCube0050
     * @tc.desc      Verify video selection for 1919x1081 format 1004 fps 59-60 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0050 begin');
      const cap = capability([], [videoConfig(1919, 1081, 1004, 59, 60)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0050 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP2_5100
     * @tc.name      testVideoCube0051
     * @tc.desc      Verify video selection for 1919x1081 format 1004 fps 30-61 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0051 begin');
      const cap = capability([], [videoConfig(1919, 1081, 1004, 30, 61)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0051 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP2_5200
     * @tc.name      testVideoCube0052
     * @tc.desc      Verify video selection for 1920x1079 format 1003 fps 0-0 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0052 begin');
      const cap = capability([], [videoConfig(1920, 1079, 1003, 0, 0)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0052 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP2_5300
     * @tc.name      testVideoCube0053
     * @tc.desc      Verify video selection for 1920x1079 format 1003 fps 30-60 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0053 begin');
      const cap = capability([], [videoConfig(1920, 1079, 1003, 30, 60)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0053 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP2_5400
     * @tc.name      testVideoCube0054
     * @tc.desc      Verify video selection for 1920x1079 format 1003 fps 59-60 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0054 begin');
      const cap = capability([], [videoConfig(1920, 1079, 1003, 59, 60)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0054 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP2_5500
     * @tc.name      testVideoCube0055
     * @tc.desc      Verify video selection for 1920x1079 format 1003 fps 30-61 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0055 begin');
      const cap = capability([], [videoConfig(1920, 1079, 1003, 30, 61)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0055 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP2_5600
     * @tc.name      testVideoCube0056
     * @tc.desc      Verify video selection for 1920x1079 format 1004 fps 0-0 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0056 begin');
      const cap = capability([], [videoConfig(1920, 1079, 1004, 0, 0)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0056 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP2_5700
     * @tc.name      testVideoCube0057
     * @tc.desc      Verify video selection for 1920x1079 format 1004 fps 30-60 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0057 begin');
      const cap = capability([], [videoConfig(1920, 1079, 1004, 30, 60)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0057 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP2_5800
     * @tc.name      testVideoCube0058
     * @tc.desc      Verify video selection for 1920x1079 format 1004 fps 59-60 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0058 begin');
      const cap = capability([], [videoConfig(1920, 1079, 1004, 59, 60)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0058 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP2_5900
     * @tc.name      testVideoCube0059
     * @tc.desc      Verify video selection for 1920x1079 format 1004 fps 30-61 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0059 begin');
      const cap = capability([], [videoConfig(1920, 1079, 1004, 30, 61)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0059 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP2_6000
     * @tc.name      testVideoCube0060
     * @tc.desc      Verify video selection for 1920x1080 format 1003 fps 0-0 returns the profile.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0060 begin');
      const cap = capability([], [videoConfig(1920, 1080, 1003, 0, 0)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked !== undefined).assertTrue();
      if (picked !== undefined) {
        expect(picked.size.width).assertEqual(1920);
        expect(picked.size.height).assertEqual(1080);
        expect(picked.frameRateRange.max).assertEqual(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0060 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP2_6100
     * @tc.name      testVideoCube0061
     * @tc.desc      Verify video selection for 1920x1080 format 1003 fps 30-60 returns the profile.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0061 begin');
      const cap = capability([], [videoConfig(1920, 1080, 1003, 30, 60)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked !== undefined).assertTrue();
      if (picked !== undefined) {
        expect(picked.size.width).assertEqual(1920);
        expect(picked.size.height).assertEqual(1080);
        expect(picked.frameRateRange.max).assertEqual(60);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0061 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP2_6200
     * @tc.name      testVideoCube0062
     * @tc.desc      Verify video selection for 1920x1080 format 1003 fps 59-60 returns the profile.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0062 begin');
      const cap = capability([], [videoConfig(1920, 1080, 1003, 59, 60)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked !== undefined).assertTrue();
      if (picked !== undefined) {
        expect(picked.size.width).assertEqual(1920);
        expect(picked.size.height).assertEqual(1080);
        expect(picked.frameRateRange.max).assertEqual(60);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0062 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP2_6300
     * @tc.name      testVideoCube0063
     * @tc.desc      Verify video selection for 1920x1080 format 1003 fps 30-61 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0063 begin');
      const cap = capability([], [videoConfig(1920, 1080, 1003, 30, 61)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0063 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP2_6400
     * @tc.name      testVideoCube0064
     * @tc.desc      Verify video selection for 1920x1080 format 1004 fps 0-0 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0064 begin');
      const cap = capability([], [videoConfig(1920, 1080, 1004, 0, 0)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0064 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP2_6500
     * @tc.name      testVideoCube0065
     * @tc.desc      Verify video selection for 1920x1080 format 1004 fps 30-60 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0065 begin');
      const cap = capability([], [videoConfig(1920, 1080, 1004, 30, 60)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0065 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP2_6600
     * @tc.name      testVideoCube0066
     * @tc.desc      Verify video selection for 1920x1080 format 1004 fps 59-60 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0066 begin');
      const cap = capability([], [videoConfig(1920, 1080, 1004, 59, 60)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0066 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP2_6700
     * @tc.name      testVideoCube0067
     * @tc.desc      Verify video selection for 1920x1080 format 1004 fps 30-61 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0067 begin');
      const cap = capability([], [videoConfig(1920, 1080, 1004, 30, 61)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0067 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP2_6800
     * @tc.name      testVideoCube0068
     * @tc.desc      Verify video selection for 1920x1081 format 1003 fps 0-0 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0068 begin');
      const cap = capability([], [videoConfig(1920, 1081, 1003, 0, 0)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0068 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP2_6900
     * @tc.name      testVideoCube0069
     * @tc.desc      Verify video selection for 1920x1081 format 1003 fps 30-60 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0069 begin');
      const cap = capability([], [videoConfig(1920, 1081, 1003, 30, 60)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0069 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP2_7000
     * @tc.name      testVideoCube0070
     * @tc.desc      Verify video selection for 1920x1081 format 1003 fps 59-60 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0070 begin');
      const cap = capability([], [videoConfig(1920, 1081, 1003, 59, 60)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0070 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP2_7100
     * @tc.name      testVideoCube0071
     * @tc.desc      Verify video selection for 1920x1081 format 1003 fps 30-61 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0071 begin');
      const cap = capability([], [videoConfig(1920, 1081, 1003, 30, 61)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0071 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP2_7200
     * @tc.name      testVideoCube0072
     * @tc.desc      Verify video selection for 1920x1081 format 1004 fps 0-0 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0072 begin');
      const cap = capability([], [videoConfig(1920, 1081, 1004, 0, 0)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0072 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP2_7300
     * @tc.name      testVideoCube0073
     * @tc.desc      Verify video selection for 1920x1081 format 1004 fps 30-60 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0073 begin');
      const cap = capability([], [videoConfig(1920, 1081, 1004, 30, 60)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0073 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP2_7400
     * @tc.name      testVideoCube0074
     * @tc.desc      Verify video selection for 1920x1081 format 1004 fps 59-60 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0074 begin');
      const cap = capability([], [videoConfig(1920, 1081, 1004, 59, 60)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0074 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP2_7500
     * @tc.name      testVideoCube0075
     * @tc.desc      Verify video selection for 1920x1081 format 1004 fps 30-61 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0075 begin');
      const cap = capability([], [videoConfig(1920, 1081, 1004, 30, 61)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0075 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP2_7600
     * @tc.name      testVideoCube0076
     * @tc.desc      Verify video selection for 1921x1079 format 1003 fps 0-0 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0076 begin');
      const cap = capability([], [videoConfig(1921, 1079, 1003, 0, 0)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0076 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP2_7700
     * @tc.name      testVideoCube0077
     * @tc.desc      Verify video selection for 1921x1079 format 1003 fps 30-60 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0077 begin');
      const cap = capability([], [videoConfig(1921, 1079, 1003, 30, 60)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0077 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP2_7800
     * @tc.name      testVideoCube0078
     * @tc.desc      Verify video selection for 1921x1079 format 1003 fps 59-60 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0078 begin');
      const cap = capability([], [videoConfig(1921, 1079, 1003, 59, 60)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0078 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP2_7900
     * @tc.name      testVideoCube0079
     * @tc.desc      Verify video selection for 1921x1079 format 1003 fps 30-61 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0079 begin');
      const cap = capability([], [videoConfig(1921, 1079, 1003, 30, 61)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0079 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP2_8000
     * @tc.name      testVideoCube0080
     * @tc.desc      Verify video selection for 1921x1079 format 1004 fps 0-0 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0080 begin');
      const cap = capability([], [videoConfig(1921, 1079, 1004, 0, 0)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0080 end');
    })

  })
}
