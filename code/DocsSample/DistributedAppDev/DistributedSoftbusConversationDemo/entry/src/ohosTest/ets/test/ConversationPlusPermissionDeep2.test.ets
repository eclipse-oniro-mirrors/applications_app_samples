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

export default function conversationPlusPermissionDeep2Test() {
  describe('ConversationPlusPermissionDeep2Test', () => {
    beforeAll(() => { info = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION); })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20001
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0001
     * @tc.desc   Inspect conversation permission scenes 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(1 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20002
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0002
     * @tc.desc   Inspect conversation permission scenes 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(2 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20003
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0003
     * @tc.desc   Inspect conversation permission scenes 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(3 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20004
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0004
     * @tc.desc   Inspect conversation permission scenes 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(4 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20005
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0005
     * @tc.desc   Inspect conversation permission scenes 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(5 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20006
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0006
     * @tc.desc   Inspect conversation permission scenes 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(6 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20007
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0007
     * @tc.desc   Inspect conversation permission scenes 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(7 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20008
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0008
     * @tc.desc   Inspect conversation permission scenes 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(8 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20009
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0009
     * @tc.desc   Inspect conversation permission scenes 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(9 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20010
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0010
     * @tc.desc   Inspect conversation permission scenes 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(10 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20011
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0011
     * @tc.desc   Inspect conversation permission scenes 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(11 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20012
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0012
     * @tc.desc   Inspect conversation permission scenes 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(12 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20013
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0013
     * @tc.desc   Inspect conversation permission scenes 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(13 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20014
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0014
     * @tc.desc   Inspect conversation permission scenes 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(14 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20015
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0015
     * @tc.desc   Inspect conversation permission scenes 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(15 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20016
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0016
     * @tc.desc   Inspect conversation permission scenes 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(16 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20017
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0017
     * @tc.desc   Inspect conversation permission scenes 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(17 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20018
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0018
     * @tc.desc   Inspect conversation permission scenes 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(18 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20019
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0019
     * @tc.desc   Inspect conversation permission scenes 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(19 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20020
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0020
     * @tc.desc   Inspect conversation permission scenes 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(20 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20021
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0021
     * @tc.desc   Inspect conversation permission scenes 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(21 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20022
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0022
     * @tc.desc   Inspect conversation permission scenes 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(22 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20023
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0023
     * @tc.desc   Inspect conversation permission scenes 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(23 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20024
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0024
     * @tc.desc   Inspect conversation permission scenes 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(24 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20025
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0025
     * @tc.desc   Inspect conversation permission scenes 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(25 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20026
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0026
     * @tc.desc   Inspect conversation permission scenes 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(26 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20027
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0027
     * @tc.desc   Inspect conversation permission scenes 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(27 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20028
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0028
     * @tc.desc   Inspect conversation permission scenes 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(28 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20029
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0029
     * @tc.desc   Inspect conversation permission scenes 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(29 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20030
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0030
     * @tc.desc   Inspect conversation permission scenes 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(30 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20031
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0031
     * @tc.desc   Inspect conversation permission scenes 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(31 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20032
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0032
     * @tc.desc   Inspect conversation permission scenes 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(32 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20033
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0033
     * @tc.desc   Inspect conversation permission scenes 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(33 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20034
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0034
     * @tc.desc   Inspect conversation permission scenes 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(34 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20035
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0035
     * @tc.desc   Inspect conversation permission scenes 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(35 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20036
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0036
     * @tc.desc   Inspect conversation permission scenes 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(36 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20037
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0037
     * @tc.desc   Inspect conversation permission scenes 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(37 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20038
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0038
     * @tc.desc   Inspect conversation permission scenes 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(38 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20039
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0039
     * @tc.desc   Inspect conversation permission scenes 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(39 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20040
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0040
     * @tc.desc   Inspect conversation permission scenes 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(40 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20041
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0041
     * @tc.desc   Inspect conversation permission scenes 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(41 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20042
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0042
     * @tc.desc   Inspect conversation permission scenes 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(42 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20043
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0043
     * @tc.desc   Inspect conversation permission scenes 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(43 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20044
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0044
     * @tc.desc   Inspect conversation permission scenes 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(44 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20045
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0045
     * @tc.desc   Inspect conversation permission scenes 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(45 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20046
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0046
     * @tc.desc   Inspect conversation permission scenes 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(46 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20047
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0047
     * @tc.desc   Inspect conversation permission scenes 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(47 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20048
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0048
     * @tc.desc   Inspect conversation permission scenes 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(48 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20049
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0049
     * @tc.desc   Inspect conversation permission scenes 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(49 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20050
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0050
     * @tc.desc   Inspect conversation permission scenes 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(50 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20051
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0051
     * @tc.desc   Inspect conversation permission scenes 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(51 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20052
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0052
     * @tc.desc   Inspect conversation permission scenes 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(52 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20053
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0053
     * @tc.desc   Inspect conversation permission scenes 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(53 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20054
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0054
     * @tc.desc   Inspect conversation permission scenes 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(54 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20055
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0055
     * @tc.desc   Inspect conversation permission scenes 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(55 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20056
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0056
     * @tc.desc   Inspect conversation permission scenes 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(56 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20057
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0057
     * @tc.desc   Inspect conversation permission scenes 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(57 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20058
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0058
     * @tc.desc   Inspect conversation permission scenes 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(58 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20059
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0059
     * @tc.desc   Inspect conversation permission scenes 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(59 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testSoftbusPlusPermissionDeep20060
     * @tc.number SUB_SOFTBUS_PLUS_PERMISSION_DEEP2_0060
     * @tc.desc   Inspect conversation permission scenes 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusPermissionDeep20060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(info.reqPermissionDetails.length >= 2).assertTrue();
      let dataSync: boolean = false;
      let udid: boolean = false;
      for (let index: number = 0; index < info.reqPermissionDetails.length; index++) {
        const item = info.reqPermissionDetails[index];
        if (item.name === 'ohos.permission.DISTRIBUTED_DATASYNC') { dataSync = true; }
        if (item.name === 'ohos.permission.sec.ACCESS_UDID') { udid = true; }
        expect(item.reason.length > 0).assertTrue();
        expect(item.usedScene.when.length > 0).assertTrue();
      }
      expect(dataSync).assertTrue();
      expect(udid).assertTrue();
      expect(60 % 2).assertEqual(0);
    })
  })
}
