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

export default function CameraProfileCubePart3Test(): void {
  describe('CameraProfileCubePart3', () => {

    /**
     * @tc.number    SUB_PHOTO_CPCP3_8100
     * @tc.name      testVideoCube0081
     * @tc.desc      Verify video selection for 1921x1079 format 1004 fps 30-60 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0081 begin');
      const cap = capability([], [videoProfile(1921, 1079, 1004, 30, 60)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0081 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP3_8200
     * @tc.name      testVideoCube0082
     * @tc.desc      Verify video selection for 1921x1079 format 1004 fps 59-60 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0082 begin');
      const cap = capability([], [videoProfile(1921, 1079, 1004, 59, 60)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0082 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP3_8300
     * @tc.name      testVideoCube0083
     * @tc.desc      Verify video selection for 1921x1079 format 1004 fps 30-61 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0083 begin');
      const cap = capability([], [videoProfile(1921, 1079, 1004, 30, 61)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0083 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP3_8400
     * @tc.name      testVideoCube0084
     * @tc.desc      Verify video selection for 1921x1080 format 1003 fps 0-0 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0084 begin');
      const cap = capability([], [videoProfile(1921, 1080, 1003, 0, 0)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0084 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP3_8500
     * @tc.name      testVideoCube0085
     * @tc.desc      Verify video selection for 1921x1080 format 1003 fps 30-60 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0085 begin');
      const cap = capability([], [videoProfile(1921, 1080, 1003, 30, 60)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0085 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP3_8600
     * @tc.name      testVideoCube0086
     * @tc.desc      Verify video selection for 1921x1080 format 1003 fps 59-60 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0086 begin');
      const cap = capability([], [videoProfile(1921, 1080, 1003, 59, 60)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0086 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP3_8700
     * @tc.name      testVideoCube0087
     * @tc.desc      Verify video selection for 1921x1080 format 1003 fps 30-61 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0087 begin');
      const cap = capability([], [videoProfile(1921, 1080, 1003, 30, 61)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0087 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP3_8800
     * @tc.name      testVideoCube0088
     * @tc.desc      Verify video selection for 1921x1080 format 1004 fps 0-0 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0088 begin');
      const cap = capability([], [videoProfile(1921, 1080, 1004, 0, 0)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0088 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP3_8900
     * @tc.name      testVideoCube0089
     * @tc.desc      Verify video selection for 1921x1080 format 1004 fps 30-60 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0089 begin');
      const cap = capability([], [videoProfile(1921, 1080, 1004, 30, 60)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0089 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP3_9000
     * @tc.name      testVideoCube0090
     * @tc.desc      Verify video selection for 1921x1080 format 1004 fps 59-60 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0090 begin');
      const cap = capability([], [videoProfile(1921, 1080, 1004, 59, 60)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0090 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP3_9100
     * @tc.name      testVideoCube0091
     * @tc.desc      Verify video selection for 1921x1080 format 1004 fps 30-61 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0091 begin');
      const cap = capability([], [videoProfile(1921, 1080, 1004, 30, 61)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0091 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP3_9200
     * @tc.name      testVideoCube0092
     * @tc.desc      Verify video selection for 1921x1081 format 1003 fps 0-0 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0092 begin');
      const cap = capability([], [videoProfile(1921, 1081, 1003, 0, 0)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0092 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP3_9300
     * @tc.name      testVideoCube0093
     * @tc.desc      Verify video selection for 1921x1081 format 1003 fps 30-60 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0093 begin');
      const cap = capability([], [videoProfile(1921, 1081, 1003, 30, 60)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0093 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP3_9400
     * @tc.name      testVideoCube0094
     * @tc.desc      Verify video selection for 1921x1081 format 1003 fps 59-60 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0094 begin');
      const cap = capability([], [videoProfile(1921, 1081, 1003, 59, 60)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0094 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP3_9500
     * @tc.name      testVideoCube0095
     * @tc.desc      Verify video selection for 1921x1081 format 1003 fps 30-61 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0095 begin');
      const cap = capability([], [videoProfile(1921, 1081, 1003, 30, 61)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0095 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP3_9600
     * @tc.name      testVideoCube0096
     * @tc.desc      Verify video selection for 1921x1081 format 1004 fps 0-0 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0096 begin');
      const cap = capability([], [videoProfile(1921, 1081, 1004, 0, 0)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0096 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP3_9700
     * @tc.name      testVideoCube0097
     * @tc.desc      Verify video selection for 1921x1081 format 1004 fps 30-60 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0097 begin');
      const cap = capability([], [videoProfile(1921, 1081, 1004, 30, 60)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0097 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP3_9800
     * @tc.name      testVideoCube0098
     * @tc.desc      Verify video selection for 1921x1081 format 1004 fps 59-60 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0098 begin');
      const cap = capability([], [videoProfile(1921, 1081, 1004, 59, 60)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0098 end');
    })

    /**
     * @tc.number    SUB_PHOTO_CPCP3_9900
     * @tc.name      testVideoCube0099
     * @tc.desc      Verify video selection for 1921x1081 format 1004 fps 30-61 returns undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoCube0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0099 begin');
      const cap = capability([], [videoProfile(1921, 1081, 1004, 30, 61)], []);
      const picked = CameraService.getVideoProfile(cap);
      expect(picked === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoCube0099 end');
    })

  })
}
