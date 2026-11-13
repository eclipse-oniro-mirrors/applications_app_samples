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

import { describe, it, expect, beforeAll, TestType, Size, Level } from '@ohos/hypium';
import { bundleManager } from '@kit.AbilityKit';
let info: bundleManager.BundleInfo;

export default function conversationPlusPermissionTest() {
  describe('ConversationPlusPermissionTest', () => {
    beforeAll(() => { info = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION); })

    /**
     * @tc.name   testSoftbusPlusPermission0001
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0001
     * @tc.desc   Check conversation permission set 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(1 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0002
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0002
     * @tc.desc   Check conversation permission set 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(2 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0003
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0003
     * @tc.desc   Check conversation permission set 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(3 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0004
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0004
     * @tc.desc   Check conversation permission set 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(4 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0005
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0005
     * @tc.desc   Check conversation permission set 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(5 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0006
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0006
     * @tc.desc   Check conversation permission set 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(6 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0007
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0007
     * @tc.desc   Check conversation permission set 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(7 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0008
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0008
     * @tc.desc   Check conversation permission set 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(8 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0009
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0009
     * @tc.desc   Check conversation permission set 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(9 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0010
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0010
     * @tc.desc   Check conversation permission set 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(10 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0011
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0011
     * @tc.desc   Check conversation permission set 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(11 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0012
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0012
     * @tc.desc   Check conversation permission set 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(12 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0013
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0013
     * @tc.desc   Check conversation permission set 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(13 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0014
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0014
     * @tc.desc   Check conversation permission set 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(14 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0015
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0015
     * @tc.desc   Check conversation permission set 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(15 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0016
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0016
     * @tc.desc   Check conversation permission set 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(16 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0017
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0017
     * @tc.desc   Check conversation permission set 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(17 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0018
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0018
     * @tc.desc   Check conversation permission set 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(18 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0019
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0019
     * @tc.desc   Check conversation permission set 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(19 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0020
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0020
     * @tc.desc   Check conversation permission set 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(20 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0021
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0021
     * @tc.desc   Check conversation permission set 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(21 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0022
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0022
     * @tc.desc   Check conversation permission set 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(22 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0023
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0023
     * @tc.desc   Check conversation permission set 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(23 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0024
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0024
     * @tc.desc   Check conversation permission set 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(24 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0025
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0025
     * @tc.desc   Check conversation permission set 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(25 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0026
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0026
     * @tc.desc   Check conversation permission set 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(26 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0027
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0027
     * @tc.desc   Check conversation permission set 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(27 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0028
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0028
     * @tc.desc   Check conversation permission set 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(28 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0029
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0029
     * @tc.desc   Check conversation permission set 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(29 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0030
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0030
     * @tc.desc   Check conversation permission set 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(30 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0031
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0031
     * @tc.desc   Check conversation permission set 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(31 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0032
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0032
     * @tc.desc   Check conversation permission set 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(32 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0033
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0033
     * @tc.desc   Check conversation permission set 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(33 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0034
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0034
     * @tc.desc   Check conversation permission set 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(34 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0035
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0035
     * @tc.desc   Check conversation permission set 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(35 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0036
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0036
     * @tc.desc   Check conversation permission set 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(36 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0037
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0037
     * @tc.desc   Check conversation permission set 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(37 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0038
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0038
     * @tc.desc   Check conversation permission set 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(38 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0039
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0039
     * @tc.desc   Check conversation permission set 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(39 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0040
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0040
     * @tc.desc   Check conversation permission set 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(40 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0041
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0041
     * @tc.desc   Check conversation permission set 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(41 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0042
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0042
     * @tc.desc   Check conversation permission set 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(42 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0043
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0043
     * @tc.desc   Check conversation permission set 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(43 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0044
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0044
     * @tc.desc   Check conversation permission set 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(44 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0045
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0045
     * @tc.desc   Check conversation permission set 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(45 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0046
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0046
     * @tc.desc   Check conversation permission set 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(46 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0047
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0047
     * @tc.desc   Check conversation permission set 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(47 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0048
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0048
     * @tc.desc   Check conversation permission set 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(48 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0049
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0049
     * @tc.desc   Check conversation permission set 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(49 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0050
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0050
     * @tc.desc   Check conversation permission set 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(50 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0051
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0051
     * @tc.desc   Check conversation permission set 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(51 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0052
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0052
     * @tc.desc   Check conversation permission set 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(52 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0053
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0053
     * @tc.desc   Check conversation permission set 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(53 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0054
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0054
     * @tc.desc   Check conversation permission set 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(54 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0055
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0055
     * @tc.desc   Check conversation permission set 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(55 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0056
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0056
     * @tc.desc   Check conversation permission set 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(56 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0057
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0057
     * @tc.desc   Check conversation permission set 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(57 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0058
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0058
     * @tc.desc   Check conversation permission set 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(58 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0059
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0059
     * @tc.desc   Check conversation permission set 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(59 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermission0060
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_0060
     * @tc.desc   Check conversation permission set 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermission0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        names.add(info.reqPermissionDetails[index].name);
        expect(info.reqPermissionDetails[index].reason.length > 0).assertTrue();
        expect(info.reqPermissionDetails[index].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.has('ohos.permission.DISTRIBUTED_DATASYNC')).assertTrue();
      expect(names.has('ohos.permission.sec.ACCESS_UDID')).assertTrue();
      expect(names.size >= 2).assertTrue();
      expect(60 % 2).assertEqual(0);
    })
  })
}
