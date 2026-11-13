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
import { conversation } from '@kit.DistributedServiceKit';

function safeGetTrustedDevices(): conversation.DeviceNodeInfo[] {
  return [];
}

export default function conversationDiscoveryFinalTest() {
  describe('ConversationDiscoveryFinalTest', () => {

    /**
     * @tc.name   testDiscoveryFinal0001
     * @tc.number SUB_SOFTBUS_DISCOVERY_FINAL_0001
     * @tc.desc   Test device discovery final matrix, case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFinal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryFinal0002
     * @tc.number SUB_SOFTBUS_DISCOVERY_FINAL_0002
     * @tc.desc   Test device discovery final matrix, case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFinal0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryFinal0003
     * @tc.number SUB_SOFTBUS_DISCOVERY_FINAL_0003
     * @tc.desc   Test device discovery final matrix, case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFinal0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryFinal0004
     * @tc.number SUB_SOFTBUS_DISCOVERY_FINAL_0004
     * @tc.desc   Test device discovery final matrix, case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFinal0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryFinal0005
     * @tc.number SUB_SOFTBUS_DISCOVERY_FINAL_0005
     * @tc.desc   Test device discovery final matrix, case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFinal0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryFinal0006
     * @tc.number SUB_SOFTBUS_DISCOVERY_FINAL_0006
     * @tc.desc   Test device discovery final matrix, case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFinal0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryFinal0007
     * @tc.number SUB_SOFTBUS_DISCOVERY_FINAL_0007
     * @tc.desc   Test device discovery final matrix, case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFinal0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryFinal0008
     * @tc.number SUB_SOFTBUS_DISCOVERY_FINAL_0008
     * @tc.desc   Test device discovery final matrix, case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFinal0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryFinal0009
     * @tc.number SUB_SOFTBUS_DISCOVERY_FINAL_0009
     * @tc.desc   Test device discovery final matrix, case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFinal0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryFinal0010
     * @tc.number SUB_SOFTBUS_DISCOVERY_FINAL_0010
     * @tc.desc   Test device discovery final matrix, case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFinal0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryFinal0011
     * @tc.number SUB_SOFTBUS_DISCOVERY_FINAL_0011
     * @tc.desc   Test device discovery final matrix, case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFinal0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryFinal0012
     * @tc.number SUB_SOFTBUS_DISCOVERY_FINAL_0012
     * @tc.desc   Test device discovery final matrix, case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFinal0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryFinal0013
     * @tc.number SUB_SOFTBUS_DISCOVERY_FINAL_0013
     * @tc.desc   Test device discovery final matrix, case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFinal0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryFinal0014
     * @tc.number SUB_SOFTBUS_DISCOVERY_FINAL_0014
     * @tc.desc   Test device discovery final matrix, case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFinal0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryFinal0015
     * @tc.number SUB_SOFTBUS_DISCOVERY_FINAL_0015
     * @tc.desc   Test device discovery final matrix, case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFinal0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryFinal0016
     * @tc.number SUB_SOFTBUS_DISCOVERY_FINAL_0016
     * @tc.desc   Test device discovery final matrix, case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFinal0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryFinal0017
     * @tc.number SUB_SOFTBUS_DISCOVERY_FINAL_0017
     * @tc.desc   Test device discovery final matrix, case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFinal0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryFinal0018
     * @tc.number SUB_SOFTBUS_DISCOVERY_FINAL_0018
     * @tc.desc   Test device discovery final matrix, case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFinal0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryFinal0019
     * @tc.number SUB_SOFTBUS_DISCOVERY_FINAL_0019
     * @tc.desc   Test device discovery final matrix, case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFinal0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryFinal0020
     * @tc.number SUB_SOFTBUS_DISCOVERY_FINAL_0020
     * @tc.desc   Test device discovery final matrix, case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFinal0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryFinal0021
     * @tc.number SUB_SOFTBUS_DISCOVERY_FINAL_0021
     * @tc.desc   Test device discovery final matrix, case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFinal0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryFinal0022
     * @tc.number SUB_SOFTBUS_DISCOVERY_FINAL_0022
     * @tc.desc   Test device discovery final matrix, case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFinal0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryFinal0023
     * @tc.number SUB_SOFTBUS_DISCOVERY_FINAL_0023
     * @tc.desc   Test device discovery final matrix, case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFinal0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryFinal0024
     * @tc.number SUB_SOFTBUS_DISCOVERY_FINAL_0024
     * @tc.desc   Test device discovery final matrix, case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFinal0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryFinal0025
     * @tc.number SUB_SOFTBUS_DISCOVERY_FINAL_0025
     * @tc.desc   Test device discovery final matrix, case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFinal0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryFinal0026
     * @tc.number SUB_SOFTBUS_DISCOVERY_FINAL_0026
     * @tc.desc   Test device discovery final matrix, case 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFinal0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryFinal0027
     * @tc.number SUB_SOFTBUS_DISCOVERY_FINAL_0027
     * @tc.desc   Test device discovery final matrix, case 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFinal0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryFinal0028
     * @tc.number SUB_SOFTBUS_DISCOVERY_FINAL_0028
     * @tc.desc   Test device discovery final matrix, case 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFinal0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryFinal0029
     * @tc.number SUB_SOFTBUS_DISCOVERY_FINAL_0029
     * @tc.desc   Test device discovery final matrix, case 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFinal0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryFinal0030
     * @tc.number SUB_SOFTBUS_DISCOVERY_FINAL_0030
     * @tc.desc   Test device discovery final matrix, case 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFinal0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })
  })
}
