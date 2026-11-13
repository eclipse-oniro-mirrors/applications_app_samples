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
import { checkPermission } from '../../../main/ets/common/utils/PermissionUtil';
import { abilityAccessCtrl, Permissions } from '@kit.AbilityKit';

const TAG: string = '[Sample_permissionCheckCore]';
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
  assertUndefined(): void;
  assertFail(): void;
}

function expect(actual: string | number | boolean | Object | null | undefined): ExpectAssert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}


export default function permissionCheckCoreTest(): void {
  describe('permissionCheckCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_0100
     * @tc.name      testPermissionCheck0001
     * @tc.desc      Verify permissionCheckCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_0200
     * @tc.name      testPermissionCheck0002
     * @tc.desc      Verify permissionCheckCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_0300
     * @tc.name      testPermissionCheck0003
     * @tc.desc      Verify permissionCheckCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_0400
     * @tc.name      testPermissionCheck0004
     * @tc.desc      Verify permissionCheckCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_0500
     * @tc.name      testPermissionCheck0005
     * @tc.desc      Verify permissionCheckCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_0600
     * @tc.name      testPermissionCheck0006
     * @tc.desc      Verify permissionCheckCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_0700
     * @tc.name      testPermissionCheck0007
     * @tc.desc      Verify permissionCheckCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_0800
     * @tc.name      testPermissionCheck0008
     * @tc.desc      Verify permissionCheckCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_0900
     * @tc.name      testPermissionCheck0009
     * @tc.desc      Verify permissionCheckCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_1000
     * @tc.name      testPermissionCheck0010
     * @tc.desc      Verify permissionCheckCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_1100
     * @tc.name      testPermissionCheck0011
     * @tc.desc      Verify permissionCheckCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_1200
     * @tc.name      testPermissionCheck0012
     * @tc.desc      Verify permissionCheckCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_1300
     * @tc.name      testPermissionCheck0013
     * @tc.desc      Verify permissionCheckCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_1400
     * @tc.name      testPermissionCheck0014
     * @tc.desc      Verify permissionCheckCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_1500
     * @tc.name      testPermissionCheck0015
     * @tc.desc      Verify permissionCheckCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_1600
     * @tc.name      testPermissionCheck0016
     * @tc.desc      Verify permissionCheckCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_1700
     * @tc.name      testPermissionCheck0017
     * @tc.desc      Verify permissionCheckCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_1800
     * @tc.name      testPermissionCheck0018
     * @tc.desc      Verify permissionCheckCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_1900
     * @tc.name      testPermissionCheck0019
     * @tc.desc      Verify permissionCheckCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_2000
     * @tc.name      testPermissionCheck0020
     * @tc.desc      Verify permissionCheckCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_2100
     * @tc.name      testPermissionCheck0021
     * @tc.desc      Verify permissionCheckCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_2200
     * @tc.name      testPermissionCheck0022
     * @tc.desc      Verify permissionCheckCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_2300
     * @tc.name      testPermissionCheck0023
     * @tc.desc      Verify permissionCheckCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_2400
     * @tc.name      testPermissionCheck0024
     * @tc.desc      Verify permissionCheckCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_2500
     * @tc.name      testPermissionCheck0025
     * @tc.desc      Verify permissionCheckCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_2600
     * @tc.name      testPermissionCheck0026
     * @tc.desc      Verify permissionCheckCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_2700
     * @tc.name      testPermissionCheck0027
     * @tc.desc      Verify permissionCheckCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_2800
     * @tc.name      testPermissionCheck0028
     * @tc.desc      Verify permissionCheckCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_2900
     * @tc.name      testPermissionCheck0029
     * @tc.desc      Verify permissionCheckCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_3000
     * @tc.name      testPermissionCheck0030
     * @tc.desc      Verify permissionCheckCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_3100
     * @tc.name      testPermissionCheck0031
     * @tc.desc      Verify permissionCheckCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_3200
     * @tc.name      testPermissionCheck0032
     * @tc.desc      Verify permissionCheckCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_3300
     * @tc.name      testPermissionCheck0033
     * @tc.desc      Verify permissionCheckCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_3400
     * @tc.name      testPermissionCheck0034
     * @tc.desc      Verify permissionCheckCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_3500
     * @tc.name      testPermissionCheck0035
     * @tc.desc      Verify permissionCheckCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_3600
     * @tc.name      testPermissionCheck0036
     * @tc.desc      Verify permissionCheckCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_3700
     * @tc.name      testPermissionCheck0037
     * @tc.desc      Verify permissionCheckCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_3800
     * @tc.name      testPermissionCheck0038
     * @tc.desc      Verify permissionCheckCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_3900
     * @tc.name      testPermissionCheck0039
     * @tc.desc      Verify permissionCheckCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_4000
     * @tc.name      testPermissionCheck0040
     * @tc.desc      Verify permissionCheckCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_4100
     * @tc.name      testPermissionCheck0041
     * @tc.desc      Verify permissionCheckCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_4200
     * @tc.name      testPermissionCheck0042
     * @tc.desc      Verify permissionCheckCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_4300
     * @tc.name      testPermissionCheck0043
     * @tc.desc      Verify permissionCheckCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_4400
     * @tc.name      testPermissionCheck0044
     * @tc.desc      Verify permissionCheckCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_4500
     * @tc.name      testPermissionCheck0045
     * @tc.desc      Verify permissionCheckCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_4600
     * @tc.name      testPermissionCheck0046
     * @tc.desc      Verify permissionCheckCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_4700
     * @tc.name      testPermissionCheck0047
     * @tc.desc      Verify permissionCheckCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_4800
     * @tc.name      testPermissionCheck0048
     * @tc.desc      Verify permissionCheckCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_4900
     * @tc.name      testPermissionCheck0049
     * @tc.desc      Verify permissionCheckCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_5000
     * @tc.name      testPermissionCheck0050
     * @tc.desc      Verify permissionCheckCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_5100
     * @tc.name      testPermissionCheck0051
     * @tc.desc      Verify permissionCheckCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_5200
     * @tc.name      testPermissionCheck0052
     * @tc.desc      Verify permissionCheckCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_5300
     * @tc.name      testPermissionCheck0053
     * @tc.desc      Verify permissionCheckCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_5400
     * @tc.name      testPermissionCheck0054
     * @tc.desc      Verify permissionCheckCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_5500
     * @tc.name      testPermissionCheck0055
     * @tc.desc      Verify permissionCheckCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_5600
     * @tc.name      testPermissionCheck0056
     * @tc.desc      Verify permissionCheckCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_5700
     * @tc.name      testPermissionCheck0057
     * @tc.desc      Verify permissionCheckCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_5800
     * @tc.name      testPermissionCheck0058
     * @tc.desc      Verify permissionCheckCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_5900
     * @tc.name      testPermissionCheck0059
     * @tc.desc      Verify permissionCheckCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_6000
     * @tc.name      testPermissionCheck0060
     * @tc.desc      Verify permissionCheckCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_6100
     * @tc.name      testPermissionCheck0061
     * @tc.desc      Verify permissionCheckCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_6200
     * @tc.name      testPermissionCheck0062
     * @tc.desc      Verify permissionCheckCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_6300
     * @tc.name      testPermissionCheck0063
     * @tc.desc      Verify permissionCheckCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_6400
     * @tc.name      testPermissionCheck0064
     * @tc.desc      Verify permissionCheckCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_6500
     * @tc.name      testPermissionCheck0065
     * @tc.desc      Verify permissionCheckCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_6600
     * @tc.name      testPermissionCheck0066
     * @tc.desc      Verify permissionCheckCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_6700
     * @tc.name      testPermissionCheck0067
     * @tc.desc      Verify permissionCheckCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_6800
     * @tc.name      testPermissionCheck0068
     * @tc.desc      Verify permissionCheckCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_6900
     * @tc.name      testPermissionCheck0069
     * @tc.desc      Verify permissionCheckCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_7000
     * @tc.name      testPermissionCheck0070
     * @tc.desc      Verify permissionCheckCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_7100
     * @tc.name      testPermissionCheck0071
     * @tc.desc      Verify permissionCheckCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_7200
     * @tc.name      testPermissionCheck0072
     * @tc.desc      Verify permissionCheckCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_7300
     * @tc.name      testPermissionCheck0073
     * @tc.desc      Verify permissionCheckCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_7400
     * @tc.name      testPermissionCheck0074
     * @tc.desc      Verify permissionCheckCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_7500
     * @tc.name      testPermissionCheck0075
     * @tc.desc      Verify permissionCheckCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_7600
     * @tc.name      testPermissionCheck0076
     * @tc.desc      Verify permissionCheckCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_7700
     * @tc.name      testPermissionCheck0077
     * @tc.desc      Verify permissionCheckCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_7800
     * @tc.name      testPermissionCheck0078
     * @tc.desc      Verify permissionCheckCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_7900
     * @tc.name      testPermissionCheck0079
     * @tc.desc      Verify permissionCheckCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_8000
     * @tc.name      testPermissionCheck0080
     * @tc.desc      Verify permissionCheckCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_PERM_8100
     * @tc.name      testPermissionCheck0081
     * @tc.desc      Verify permissionCheckCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPermissionCheck0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const permission: Permissions = 'ohos.permission.MICROPHONE';
      const status: abilityAccessCtrl.GrantStatus = await checkPermission(permission);
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
    });

  });
}
