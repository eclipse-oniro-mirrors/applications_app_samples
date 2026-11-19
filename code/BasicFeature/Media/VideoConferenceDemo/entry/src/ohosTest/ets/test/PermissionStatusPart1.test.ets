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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { checkPermission } from '../../../main/ets/common/utils/PermissionUtil';
import { abilityAccessCtrl, Permissions } from '@kit.AbilityKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_VideoConferenceDemo]';

export default function PermissionStatusPart1Test(): void {
  describe('PermissionStatusPart1', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_VIDEO_CONF_PERMP1_0100
     * @tc.name      testPermissionStatus0001
     * @tc.desc      Verify permission check returns a defined grant status for ohos.permission.MICROPHONE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPermissionStatus0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPermissionStatus0001 begin');
      const status: abilityAccessCtrl.GrantStatus = await checkPermission('ohos.permission.MICROPHONE' as Permissions);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED || status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPermissionStatus0001 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_PERMP1_0200
     * @tc.name      testPermissionStatus0002
     * @tc.desc      Verify permission check returns a defined grant status for ohos.permission.CAMERA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPermissionStatus0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPermissionStatus0002 begin');
      const status: abilityAccessCtrl.GrantStatus = await checkPermission('ohos.permission.CAMERA' as Permissions);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED || status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPermissionStatus0002 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_PERMP1_0300
     * @tc.name      testPermissionStatus0003
     * @tc.desc      Verify permission check returns a defined grant status for ohos.permission.INTERNET.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPermissionStatus0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPermissionStatus0003 begin');
      const status: abilityAccessCtrl.GrantStatus = await checkPermission('ohos.permission.INTERNET' as Permissions);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED || status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPermissionStatus0003 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_PERMP1_0400
     * @tc.name      testPermissionStatus0004
     * @tc.desc      Verify permission check returns a defined grant status for ohos.permission.LOCATION.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPermissionStatus0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPermissionStatus0004 begin');
      const status: abilityAccessCtrl.GrantStatus = await checkPermission('ohos.permission.LOCATION' as Permissions);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED || status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPermissionStatus0004 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_PERMP1_0500
     * @tc.name      testPermissionStatus0005
     * @tc.desc      Verify permission check returns a defined grant status for ohos.permission.APPROXIMATELY_LOCATION.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPermissionStatus0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPermissionStatus0005 begin');
      const status: abilityAccessCtrl.GrantStatus = await checkPermission('ohos.permission.APPROXIMATELY_LOCATION' as Permissions);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED || status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPermissionStatus0005 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_PERMP1_0600
     * @tc.name      testPermissionStatus0006
     * @tc.desc      Verify permission check returns a defined grant status for ohos.permission.READ_MEDIA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPermissionStatus0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPermissionStatus0006 begin');
      const status: abilityAccessCtrl.GrantStatus = await checkPermission('ohos.permission.READ_MEDIA' as Permissions);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED || status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPermissionStatus0006 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_PERMP1_0700
     * @tc.name      testPermissionStatus0007
     * @tc.desc      Verify permission check returns a defined grant status for ohos.permission.WRITE_MEDIA.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPermissionStatus0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPermissionStatus0007 begin');
      const status: abilityAccessCtrl.GrantStatus = await checkPermission('ohos.permission.WRITE_MEDIA' as Permissions);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED || status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPermissionStatus0007 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_PERMP1_0800
     * @tc.name      testPermissionStatus0008
     * @tc.desc      Verify permission check returns a defined grant status for ohos.permission.READ_IMAGEVIDEO.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPermissionStatus0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPermissionStatus0008 begin');
      const status: abilityAccessCtrl.GrantStatus = await checkPermission('ohos.permission.READ_IMAGEVIDEO' as Permissions);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED || status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPermissionStatus0008 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_PERMP1_0900
     * @tc.name      testPermissionStatus0009
     * @tc.desc      Verify permission check returns a defined grant status for ohos.permission.WRITE_IMAGEVIDEO.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPermissionStatus0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPermissionStatus0009 begin');
      const status: abilityAccessCtrl.GrantStatus = await checkPermission('ohos.permission.WRITE_IMAGEVIDEO' as Permissions);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED || status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPermissionStatus0009 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_PERMP1_1000
     * @tc.name      testPermissionStatus0010
     * @tc.desc      Verify permission check returns a defined grant status for ohos.permission.READ_AUDIO.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPermissionStatus0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPermissionStatus0010 begin');
      const status: abilityAccessCtrl.GrantStatus = await checkPermission('ohos.permission.READ_AUDIO' as Permissions);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED || status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPermissionStatus0010 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_PERMP1_1100
     * @tc.name      testPermissionStatus0011
     * @tc.desc      Verify permission check returns a defined grant status for ohos.permission.WRITE_AUDIO.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPermissionStatus0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPermissionStatus0011 begin');
      const status: abilityAccessCtrl.GrantStatus = await checkPermission('ohos.permission.WRITE_AUDIO' as Permissions);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED || status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPermissionStatus0011 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_PERMP1_1200
     * @tc.name      testPermissionStatus0012
     * @tc.desc      Verify permission check returns a defined grant status for ohos.permission.READ_DOCUMENT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPermissionStatus0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPermissionStatus0012 begin');
      const status: abilityAccessCtrl.GrantStatus = await checkPermission('ohos.permission.READ_DOCUMENT' as Permissions);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED || status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPermissionStatus0012 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_PERMP1_1300
     * @tc.name      testPermissionStatus0013
     * @tc.desc      Verify permission check returns a defined grant status for ohos.permission.WRITE_DOCUMENT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPermissionStatus0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPermissionStatus0013 begin');
      const status: abilityAccessCtrl.GrantStatus = await checkPermission('ohos.permission.WRITE_DOCUMENT' as Permissions);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED || status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPermissionStatus0013 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_PERMP1_1400
     * @tc.name      testPermissionStatus0014
     * @tc.desc      Verify permission check returns a defined grant status for ohos.permission.DISTRIBUTED_DATASYNC.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPermissionStatus0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPermissionStatus0014 begin');
      const status: abilityAccessCtrl.GrantStatus = await checkPermission('ohos.permission.DISTRIBUTED_DATASYNC' as Permissions);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED || status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPermissionStatus0014 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_PERMP1_1500
     * @tc.name      testPermissionStatus0015
     * @tc.desc      Verify permission check returns a defined grant status for ohos.permission.READ_CALENDAR.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPermissionStatus0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPermissionStatus0015 begin');
      const status: abilityAccessCtrl.GrantStatus = await checkPermission('ohos.permission.READ_CALENDAR' as Permissions);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED || status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPermissionStatus0015 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_PERMP1_1600
     * @tc.name      testPermissionStatus0016
     * @tc.desc      Verify permission check returns a defined grant status for ohos.permission.WRITE_CALENDAR.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPermissionStatus0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPermissionStatus0016 begin');
      const status: abilityAccessCtrl.GrantStatus = await checkPermission('ohos.permission.WRITE_CALENDAR' as Permissions);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED || status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPermissionStatus0016 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_PERMP1_1700
     * @tc.name      testPermissionStatus0017
     * @tc.desc      Verify permission check returns a defined grant status for ohos.permission.READ_CONTACTS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPermissionStatus0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPermissionStatus0017 begin');
      const status: abilityAccessCtrl.GrantStatus = await checkPermission('ohos.permission.READ_CONTACTS' as Permissions);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED || status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPermissionStatus0017 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_PERMP1_1800
     * @tc.name      testPermissionStatus0018
     * @tc.desc      Verify permission check returns a defined grant status for ohos.permission.WRITE_CONTACTS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPermissionStatus0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPermissionStatus0018 begin');
      const status: abilityAccessCtrl.GrantStatus = await checkPermission('ohos.permission.WRITE_CONTACTS' as Permissions);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED || status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPermissionStatus0018 end');
    })

  })
}
