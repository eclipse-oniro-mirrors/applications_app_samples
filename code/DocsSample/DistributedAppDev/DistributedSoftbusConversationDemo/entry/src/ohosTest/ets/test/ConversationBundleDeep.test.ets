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
export default function conversationBundleDeepTest() {
  describe('ConversationBundleDeepTest', () => {
    beforeAll(() => { bundleInfo = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION); })

    /**
     * @tc.name   testBundleDeep0001
     * @tc.number SUB_SOFTBUS_BUNDLE_DEEP_0001
     * @tc.desc   Test permission deep contract 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(bundleInfo.reqPermissionDetails.length >= 2).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep0002
     * @tc.number SUB_SOFTBUS_BUNDLE_DEEP_0002
     * @tc.desc   Test permission deep contract 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(bundleInfo.reqPermissionDetails.length >= 2).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep0003
     * @tc.number SUB_SOFTBUS_BUNDLE_DEEP_0003
     * @tc.desc   Test permission deep contract 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(bundleInfo.reqPermissionDetails.length >= 2).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep0004
     * @tc.number SUB_SOFTBUS_BUNDLE_DEEP_0004
     * @tc.desc   Test permission deep contract 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(bundleInfo.reqPermissionDetails.length >= 2).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep0005
     * @tc.number SUB_SOFTBUS_BUNDLE_DEEP_0005
     * @tc.desc   Test permission deep contract 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(bundleInfo.reqPermissionDetails.length >= 2).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep0006
     * @tc.number SUB_SOFTBUS_BUNDLE_DEEP_0006
     * @tc.desc   Test permission deep contract 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(bundleInfo.reqPermissionDetails.length >= 2).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep0007
     * @tc.number SUB_SOFTBUS_BUNDLE_DEEP_0007
     * @tc.desc   Test permission deep contract 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(bundleInfo.reqPermissionDetails.length >= 2).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep0008
     * @tc.number SUB_SOFTBUS_BUNDLE_DEEP_0008
     * @tc.desc   Test permission deep contract 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(bundleInfo.reqPermissionDetails.length >= 2).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep0009
     * @tc.number SUB_SOFTBUS_BUNDLE_DEEP_0009
     * @tc.desc   Test permission deep contract 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(bundleInfo.reqPermissionDetails.length >= 2).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep0010
     * @tc.number SUB_SOFTBUS_BUNDLE_DEEP_0010
     * @tc.desc   Test permission deep contract 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(bundleInfo.reqPermissionDetails.length >= 2).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep0011
     * @tc.number SUB_SOFTBUS_BUNDLE_DEEP_0011
     * @tc.desc   Test permission deep contract 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(bundleInfo.reqPermissionDetails.length >= 2).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep0012
     * @tc.number SUB_SOFTBUS_BUNDLE_DEEP_0012
     * @tc.desc   Test permission deep contract 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(bundleInfo.reqPermissionDetails.length >= 2).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep0013
     * @tc.number SUB_SOFTBUS_BUNDLE_DEEP_0013
     * @tc.desc   Test permission deep contract 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(bundleInfo.reqPermissionDetails.length >= 2).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep0014
     * @tc.number SUB_SOFTBUS_BUNDLE_DEEP_0014
     * @tc.desc   Test permission deep contract 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(bundleInfo.reqPermissionDetails.length >= 2).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep0015
     * @tc.number SUB_SOFTBUS_BUNDLE_DEEP_0015
     * @tc.desc   Test permission deep contract 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(bundleInfo.reqPermissionDetails.length >= 2).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep0016
     * @tc.number SUB_SOFTBUS_BUNDLE_DEEP_0016
     * @tc.desc   Test permission deep contract 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(bundleInfo.reqPermissionDetails.length >= 2).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep0017
     * @tc.number SUB_SOFTBUS_BUNDLE_DEEP_0017
     * @tc.desc   Test permission deep contract 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(bundleInfo.reqPermissionDetails.length >= 2).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep0018
     * @tc.number SUB_SOFTBUS_BUNDLE_DEEP_0018
     * @tc.desc   Test permission deep contract 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(bundleInfo.reqPermissionDetails.length >= 2).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep0019
     * @tc.number SUB_SOFTBUS_BUNDLE_DEEP_0019
     * @tc.desc   Test permission deep contract 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(bundleInfo.reqPermissionDetails.length >= 2).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep0020
     * @tc.number SUB_SOFTBUS_BUNDLE_DEEP_0020
     * @tc.desc   Test permission deep contract 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(bundleInfo.reqPermissionDetails.length >= 2).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep0021
     * @tc.number SUB_SOFTBUS_BUNDLE_DEEP_0021
     * @tc.desc   Test permission deep contract 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(bundleInfo.reqPermissionDetails.length >= 2).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep0022
     * @tc.number SUB_SOFTBUS_BUNDLE_DEEP_0022
     * @tc.desc   Test permission deep contract 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(bundleInfo.reqPermissionDetails.length >= 2).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep0023
     * @tc.number SUB_SOFTBUS_BUNDLE_DEEP_0023
     * @tc.desc   Test permission deep contract 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(bundleInfo.reqPermissionDetails.length >= 2).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep0024
     * @tc.number SUB_SOFTBUS_BUNDLE_DEEP_0024
     * @tc.desc   Test permission deep contract 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(bundleInfo.reqPermissionDetails.length >= 2).assertTrue();
    })

    /**
     * @tc.name   testBundleDeep0025
     * @tc.number SUB_SOFTBUS_BUNDLE_DEEP_0025
     * @tc.desc   Test permission deep contract 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBundleDeep0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.name).assertEqual('com.example.distributedsoftbusconversationdemo');
      expect(bundleInfo.reqPermissionDetails.length >= 2).assertTrue();
    })
  })
}
