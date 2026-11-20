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

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { BLUETOOTH_PERMISSION, DATASYNC_PERMISSION } from '../../../main/ets/common/AppConstants';
import { PermissionOutcome, checkPermission, describePermissions } from '../../../main/ets/utils/PermissionUtil';

/**
 * 权限查询结果：首页与两个演示页都把 PermissionOutcome.describe() 原样贴在状态栏上。
 * 这里先验证纯文案规则，再在设备上真正查一次两个 user_grant 权限，
 * 确认"显示的授权状态"和"接口实际返回值"不会出现两种说法。
 */
export default function distributedPermissionModelMatrixTest() {
  describe('DistributedPermissionModelTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PERM_0100
     * @tc.name testPermission0001
     * @tc.desc Verify a granted permission is described by its short name only.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPermission0001', 0, () => {
      const granted = new PermissionOutcome('ohos.permission.DISTRIBUTED_DATASYNC', true, 0, '已授权');
      expect(granted.describe()).assertEqual('DISTRIBUTED_DATASYNC 已授权');
      expect(granted.describe().includes('未授权')).assertFalse();
      expect(granted.granted).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PERM_0200
     * @tc.name testPermission0002
     * @tc.desc Verify a denied permission keeps the code and the original message.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPermission0002', 0, () => {
      const denied = new PermissionOutcome('ohos.permission.ACCESS_BLUETOOTH', false, 201, 'denied');
      expect(denied.describe()).assertEqual('ACCESS_BLUETOOTH 未授权（201）：denied');
      expect(denied.describe().includes('201')).assertTrue();
      expect(denied.code).assertEqual(201);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PERM_0300
     * @tc.name testPermission0003
     * @tc.desc Verify only the ohos.permission prefix is stripped from the displayed name.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testPermission0003', 0, () => {
      expect(new PermissionOutcome('ohos.permission.CUSTOM_ONE', true, 0, '').describe())
        .assertEqual('CUSTOM_ONE 已授权');
      expect(new PermissionOutcome('custom.perm.NAME', false, 0, 'x').describe())
        .assertEqual('custom.perm.NAME 未授权（0）：x');
      expect(new PermissionOutcome('', true, 0, '').describe()).assertEqual(' 已授权');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PERM_0400
     * @tc.name testPermission0004
     * @tc.desc Verify the two documented permissions share the same prefix so the strip is symmetric.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPermission0004', 0, () => {
      const datasync = new PermissionOutcome(DATASYNC_PERMISSION, true, 0, '');
      const bluetooth = new PermissionOutcome(BLUETOOTH_PERMISSION, true, 0, '');
      expect(datasync.describe()).assertEqual('DISTRIBUTED_DATASYNC 已授权');
      expect(bluetooth.describe()).assertEqual('ACCESS_BLUETOOTH 已授权');
      expect(datasync.describe() === bluetooth.describe()).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PERM_0500
     * @tc.name testPermission0005
     * @tc.desc Verify the device answers both permission queries with the same name that was asked.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPermission0005', 0, () => {
      const datasync = checkPermission(DATASYNC_PERMISSION);
      const bluetooth = checkPermission(BLUETOOTH_PERMISSION);
      expect(datasync.code).assertEqual(0);
      expect(bluetooth.code).assertEqual(0);
      expect(datasync.name).assertEqual(DATASYNC_PERMISSION);
      expect(bluetooth.name).assertEqual(BLUETOOTH_PERMISSION);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PERM_0600
     * @tc.name testPermission0006
     * @tc.desc Verify the reported text always agrees with the granted flag returned by the system.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPermission0006', 0, () => {
      const outcomes: PermissionOutcome[] = [checkPermission(DATASYNC_PERMISSION), checkPermission(BLUETOOTH_PERMISSION)];
      for (let i = 0; i < outcomes.length; i++) {
        const expected = outcomes[i].granted ? '已授权' : '未授权';
        expect(outcomes[i].describe().includes(expected)).assertTrue();
      }
      expect(checkPermission(DATASYNC_PERMISSION).message.length > 0).assertTrue();
      // describe 必须带出各自的权限名（去掉 ohos.permission. 前缀），两个权限不能互相串台
      expect(outcomes[0].describe().includes('DISTRIBUTED_DATASYNC')).assertTrue();
      expect(outcomes[1].describe().includes('ACCESS_BLUETOOTH')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PERM_0700
     * @tc.name testPermission0007
     * @tc.desc Verify querying an undeclared permission name is answered instead of throwing.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testPermission0007', 0, () => {
      const unknown = checkPermission('ohos.permission.NOT_DECLARED_IN_MODULE');
      // 系统对未声明的权限要么返回未授权（code 0），要么直接抛 BusinessError，两条路径都必须是可读的
      if (unknown.code === 0) {
        expect(unknown.granted).assertFalse();
        expect(unknown.describe().includes('未授权')).assertTrue();
      } else {
        expect(unknown.granted).assertFalse();
        expect(unknown.message.includes('失败')).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PERM_0800
     * @tc.name testPermission0008
     * @tc.desc Verify the combined summary mentions both permissions and uses one separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPermission0008', 0, () => {
      const summary = describePermissions();
      expect(summary.includes('DISTRIBUTED_DATASYNC')).assertTrue();
      expect(summary.includes('ACCESS_BLUETOOTH')).assertTrue();
      expect(summary.split('；').length).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PERM_0900
     * @tc.name testPermission0009
     * @tc.desc Verify the combined summary equals the two individual descriptions joined in order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testPermission0009', 0, () => {
      const expected = `${checkPermission(DATASYNC_PERMISSION).describe()}；` +
        `${checkPermission(BLUETOOTH_PERMISSION).describe()}`;
      expect(describePermissions()).assertEqual(expected);
      expect(describePermissions().startsWith('DISTRIBUTED_DATASYNC')).assertTrue();
      expect(describePermissions().indexOf('DISTRIBUTED_DATASYNC') < describePermissions().indexOf('ACCESS_BLUETOOTH'))
        .assertTrue();
    });
  });
}
