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

let bundleInfo: bundleManager.BundleInfo;

export default function conversationPermissionMatrixTest() {
  describe('ConversationPermissionMatrixTest', () => {

    beforeAll(() => {
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION;
      bundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
    })

    /**
     * @tc.name   testPermissionMatrix0001
     * @tc.number SUB_SOFTBUS_PERMISSION_0001
     * @tc.desc   Test distributed permission declarations. Permission matrix case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.reqPermissionDetails.length >= 2).assertTrue();
      let foundDataSync: boolean = false;
      let foundUdid: boolean = false;
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        const name: string = bundleInfo.reqPermissionDetails[i].name;
        if (name === 'ohos.permission.DISTRIBUTED_DATASYNC') {
          foundDataSync = true;
        }
        if (name === 'ohos.permission.sec.ACCESS_UDID') {
          foundUdid = true;
        }
      }
      expect(foundDataSync).assertTrue();
      expect(foundUdid).assertTrue();
    })

    /**
     * @tc.name   testPermissionMatrix0002
     * @tc.number SUB_SOFTBUS_PERMISSION_0002
     * @tc.desc   Test permission reason and usedScene. Permission matrix case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionMatrix0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        names.add(bundleInfo.reqPermissionDetails[i].name);
        expect(bundleInfo.reqPermissionDetails[i].reason.length > 0).assertTrue();
        expect(bundleInfo.reqPermissionDetails[i].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.size).assertEqual(bundleInfo.reqPermissionDetails.length);
    })

    /**
     * @tc.name   testPermissionMatrix0003
     * @tc.number SUB_SOFTBUS_PERMISSION_0003
     * @tc.desc   Test distributed permission declarations. Permission matrix case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionMatrix0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.reqPermissionDetails.length >= 2).assertTrue();
      let foundDataSync: boolean = false;
      let foundUdid: boolean = false;
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        const name: string = bundleInfo.reqPermissionDetails[i].name;
        if (name === 'ohos.permission.DISTRIBUTED_DATASYNC') {
          foundDataSync = true;
        }
        if (name === 'ohos.permission.sec.ACCESS_UDID') {
          foundUdid = true;
        }
      }
      expect(foundDataSync).assertTrue();
      expect(foundUdid).assertTrue();
    })

    /**
     * @tc.name   testPermissionMatrix0004
     * @tc.number SUB_SOFTBUS_PERMISSION_0004
     * @tc.desc   Test permission reason and usedScene. Permission matrix case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionMatrix0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        names.add(bundleInfo.reqPermissionDetails[i].name);
        expect(bundleInfo.reqPermissionDetails[i].reason.length > 0).assertTrue();
        expect(bundleInfo.reqPermissionDetails[i].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.size).assertEqual(bundleInfo.reqPermissionDetails.length);
    })

    /**
     * @tc.name   testPermissionMatrix0005
     * @tc.number SUB_SOFTBUS_PERMISSION_0005
     * @tc.desc   Test distributed permission declarations. Permission matrix case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionMatrix0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.reqPermissionDetails.length >= 2).assertTrue();
      let foundDataSync: boolean = false;
      let foundUdid: boolean = false;
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        const name: string = bundleInfo.reqPermissionDetails[i].name;
        if (name === 'ohos.permission.DISTRIBUTED_DATASYNC') {
          foundDataSync = true;
        }
        if (name === 'ohos.permission.sec.ACCESS_UDID') {
          foundUdid = true;
        }
      }
      expect(foundDataSync).assertTrue();
      expect(foundUdid).assertTrue();
    })

    /**
     * @tc.name   testPermissionMatrix0006
     * @tc.number SUB_SOFTBUS_PERMISSION_0006
     * @tc.desc   Test permission reason and usedScene. Permission matrix case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionMatrix0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        names.add(bundleInfo.reqPermissionDetails[i].name);
        expect(bundleInfo.reqPermissionDetails[i].reason.length > 0).assertTrue();
        expect(bundleInfo.reqPermissionDetails[i].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.size).assertEqual(bundleInfo.reqPermissionDetails.length);
    })

    /**
     * @tc.name   testPermissionMatrix0007
     * @tc.number SUB_SOFTBUS_PERMISSION_0007
     * @tc.desc   Test distributed permission declarations. Permission matrix case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionMatrix0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.reqPermissionDetails.length >= 2).assertTrue();
      let foundDataSync: boolean = false;
      let foundUdid: boolean = false;
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        const name: string = bundleInfo.reqPermissionDetails[i].name;
        if (name === 'ohos.permission.DISTRIBUTED_DATASYNC') {
          foundDataSync = true;
        }
        if (name === 'ohos.permission.sec.ACCESS_UDID') {
          foundUdid = true;
        }
      }
      expect(foundDataSync).assertTrue();
      expect(foundUdid).assertTrue();
    })

    /**
     * @tc.name   testPermissionMatrix0008
     * @tc.number SUB_SOFTBUS_PERMISSION_0008
     * @tc.desc   Test permission reason and usedScene. Permission matrix case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionMatrix0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        names.add(bundleInfo.reqPermissionDetails[i].name);
        expect(bundleInfo.reqPermissionDetails[i].reason.length > 0).assertTrue();
        expect(bundleInfo.reqPermissionDetails[i].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.size).assertEqual(bundleInfo.reqPermissionDetails.length);
    })

    /**
     * @tc.name   testPermissionMatrix0009
     * @tc.number SUB_SOFTBUS_PERMISSION_0009
     * @tc.desc   Test distributed permission declarations. Permission matrix case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionMatrix0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.reqPermissionDetails.length >= 2).assertTrue();
      let foundDataSync: boolean = false;
      let foundUdid: boolean = false;
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        const name: string = bundleInfo.reqPermissionDetails[i].name;
        if (name === 'ohos.permission.DISTRIBUTED_DATASYNC') {
          foundDataSync = true;
        }
        if (name === 'ohos.permission.sec.ACCESS_UDID') {
          foundUdid = true;
        }
      }
      expect(foundDataSync).assertTrue();
      expect(foundUdid).assertTrue();
    })

    /**
     * @tc.name   testPermissionMatrix0010
     * @tc.number SUB_SOFTBUS_PERMISSION_0010
     * @tc.desc   Test permission reason and usedScene. Permission matrix case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionMatrix0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        names.add(bundleInfo.reqPermissionDetails[i].name);
        expect(bundleInfo.reqPermissionDetails[i].reason.length > 0).assertTrue();
        expect(bundleInfo.reqPermissionDetails[i].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.size).assertEqual(bundleInfo.reqPermissionDetails.length);
    })

    /**
     * @tc.name   testPermissionMatrix0011
     * @tc.number SUB_SOFTBUS_PERMISSION_0011
     * @tc.desc   Test distributed permission declarations. Permission matrix case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionMatrix0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.reqPermissionDetails.length >= 2).assertTrue();
      let foundDataSync: boolean = false;
      let foundUdid: boolean = false;
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        const name: string = bundleInfo.reqPermissionDetails[i].name;
        if (name === 'ohos.permission.DISTRIBUTED_DATASYNC') {
          foundDataSync = true;
        }
        if (name === 'ohos.permission.sec.ACCESS_UDID') {
          foundUdid = true;
        }
      }
      expect(foundDataSync).assertTrue();
      expect(foundUdid).assertTrue();
    })

    /**
     * @tc.name   testPermissionMatrix0012
     * @tc.number SUB_SOFTBUS_PERMISSION_0012
     * @tc.desc   Test permission reason and usedScene. Permission matrix case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionMatrix0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        names.add(bundleInfo.reqPermissionDetails[i].name);
        expect(bundleInfo.reqPermissionDetails[i].reason.length > 0).assertTrue();
        expect(bundleInfo.reqPermissionDetails[i].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.size).assertEqual(bundleInfo.reqPermissionDetails.length);
    })

    /**
     * @tc.name   testPermissionMatrix0013
     * @tc.number SUB_SOFTBUS_PERMISSION_0013
     * @tc.desc   Test distributed permission declarations. Permission matrix case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionMatrix0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.reqPermissionDetails.length >= 2).assertTrue();
      let foundDataSync: boolean = false;
      let foundUdid: boolean = false;
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        const name: string = bundleInfo.reqPermissionDetails[i].name;
        if (name === 'ohos.permission.DISTRIBUTED_DATASYNC') {
          foundDataSync = true;
        }
        if (name === 'ohos.permission.sec.ACCESS_UDID') {
          foundUdid = true;
        }
      }
      expect(foundDataSync).assertTrue();
      expect(foundUdid).assertTrue();
    })

    /**
     * @tc.name   testPermissionMatrix0014
     * @tc.number SUB_SOFTBUS_PERMISSION_0014
     * @tc.desc   Test permission reason and usedScene. Permission matrix case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionMatrix0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        names.add(bundleInfo.reqPermissionDetails[i].name);
        expect(bundleInfo.reqPermissionDetails[i].reason.length > 0).assertTrue();
        expect(bundleInfo.reqPermissionDetails[i].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.size).assertEqual(bundleInfo.reqPermissionDetails.length);
    })

    /**
     * @tc.name   testPermissionMatrix0015
     * @tc.number SUB_SOFTBUS_PERMISSION_0015
     * @tc.desc   Test distributed permission declarations. Permission matrix case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionMatrix0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.reqPermissionDetails.length >= 2).assertTrue();
      let foundDataSync: boolean = false;
      let foundUdid: boolean = false;
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        const name: string = bundleInfo.reqPermissionDetails[i].name;
        if (name === 'ohos.permission.DISTRIBUTED_DATASYNC') {
          foundDataSync = true;
        }
        if (name === 'ohos.permission.sec.ACCESS_UDID') {
          foundUdid = true;
        }
      }
      expect(foundDataSync).assertTrue();
      expect(foundUdid).assertTrue();
    })

    /**
     * @tc.name   testPermissionMatrix0016
     * @tc.number SUB_SOFTBUS_PERMISSION_0016
     * @tc.desc   Test permission reason and usedScene. Permission matrix case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionMatrix0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        names.add(bundleInfo.reqPermissionDetails[i].name);
        expect(bundleInfo.reqPermissionDetails[i].reason.length > 0).assertTrue();
        expect(bundleInfo.reqPermissionDetails[i].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.size).assertEqual(bundleInfo.reqPermissionDetails.length);
    })

    /**
     * @tc.name   testPermissionMatrix0017
     * @tc.number SUB_SOFTBUS_PERMISSION_0017
     * @tc.desc   Test distributed permission declarations. Permission matrix case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionMatrix0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.reqPermissionDetails.length >= 2).assertTrue();
      let foundDataSync: boolean = false;
      let foundUdid: boolean = false;
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        const name: string = bundleInfo.reqPermissionDetails[i].name;
        if (name === 'ohos.permission.DISTRIBUTED_DATASYNC') {
          foundDataSync = true;
        }
        if (name === 'ohos.permission.sec.ACCESS_UDID') {
          foundUdid = true;
        }
      }
      expect(foundDataSync).assertTrue();
      expect(foundUdid).assertTrue();
    })

    /**
     * @tc.name   testPermissionMatrix0018
     * @tc.number SUB_SOFTBUS_PERMISSION_0018
     * @tc.desc   Test permission reason and usedScene. Permission matrix case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionMatrix0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        names.add(bundleInfo.reqPermissionDetails[i].name);
        expect(bundleInfo.reqPermissionDetails[i].reason.length > 0).assertTrue();
        expect(bundleInfo.reqPermissionDetails[i].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.size).assertEqual(bundleInfo.reqPermissionDetails.length);
    })

    /**
     * @tc.name   testPermissionMatrix0019
     * @tc.number SUB_SOFTBUS_PERMISSION_0019
     * @tc.desc   Test distributed permission declarations. Permission matrix case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionMatrix0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.reqPermissionDetails.length >= 2).assertTrue();
      let foundDataSync: boolean = false;
      let foundUdid: boolean = false;
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        const name: string = bundleInfo.reqPermissionDetails[i].name;
        if (name === 'ohos.permission.DISTRIBUTED_DATASYNC') {
          foundDataSync = true;
        }
        if (name === 'ohos.permission.sec.ACCESS_UDID') {
          foundUdid = true;
        }
      }
      expect(foundDataSync).assertTrue();
      expect(foundUdid).assertTrue();
    })

    /**
     * @tc.name   testPermissionMatrix0020
     * @tc.number SUB_SOFTBUS_PERMISSION_0020
     * @tc.desc   Test permission reason and usedScene. Permission matrix case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionMatrix0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        names.add(bundleInfo.reqPermissionDetails[i].name);
        expect(bundleInfo.reqPermissionDetails[i].reason.length > 0).assertTrue();
        expect(bundleInfo.reqPermissionDetails[i].usedScene.abilities.length > 0).assertTrue();
      }
      expect(names.size).assertEqual(bundleInfo.reqPermissionDetails.length);
    })
  })
}
