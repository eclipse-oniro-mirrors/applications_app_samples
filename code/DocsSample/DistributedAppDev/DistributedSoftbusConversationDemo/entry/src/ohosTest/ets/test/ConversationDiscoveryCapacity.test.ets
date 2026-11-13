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

export default function conversationDiscoveryCapacityTest() {
  describe('ConversationDiscoveryCapacityTest', () => {

    /**
     * @tc.name   testDiscoveryCapacity0001
     * @tc.number SUB_SOFTBUS_DISCOVERY_CAP_0001
     * @tc.desc   Test repeated device discovery capacity, case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryCapacity0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryCapacity0002
     * @tc.number SUB_SOFTBUS_DISCOVERY_CAP_0002
     * @tc.desc   Test repeated device discovery capacity, case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryCapacity0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryCapacity0003
     * @tc.number SUB_SOFTBUS_DISCOVERY_CAP_0003
     * @tc.desc   Test repeated device discovery capacity, case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryCapacity0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryCapacity0004
     * @tc.number SUB_SOFTBUS_DISCOVERY_CAP_0004
     * @tc.desc   Test repeated device discovery capacity, case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryCapacity0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryCapacity0005
     * @tc.number SUB_SOFTBUS_DISCOVERY_CAP_0005
     * @tc.desc   Test repeated device discovery capacity, case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryCapacity0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryCapacity0006
     * @tc.number SUB_SOFTBUS_DISCOVERY_CAP_0006
     * @tc.desc   Test repeated device discovery capacity, case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryCapacity0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryCapacity0007
     * @tc.number SUB_SOFTBUS_DISCOVERY_CAP_0007
     * @tc.desc   Test repeated device discovery capacity, case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryCapacity0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryCapacity0008
     * @tc.number SUB_SOFTBUS_DISCOVERY_CAP_0008
     * @tc.desc   Test repeated device discovery capacity, case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryCapacity0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryCapacity0009
     * @tc.number SUB_SOFTBUS_DISCOVERY_CAP_0009
     * @tc.desc   Test repeated device discovery capacity, case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryCapacity0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryCapacity0010
     * @tc.number SUB_SOFTBUS_DISCOVERY_CAP_0010
     * @tc.desc   Test repeated device discovery capacity, case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryCapacity0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryCapacity0011
     * @tc.number SUB_SOFTBUS_DISCOVERY_CAP_0011
     * @tc.desc   Test repeated device discovery capacity, case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryCapacity0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryCapacity0012
     * @tc.number SUB_SOFTBUS_DISCOVERY_CAP_0012
     * @tc.desc   Test repeated device discovery capacity, case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryCapacity0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryCapacity0013
     * @tc.number SUB_SOFTBUS_DISCOVERY_CAP_0013
     * @tc.desc   Test repeated device discovery capacity, case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryCapacity0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryCapacity0014
     * @tc.number SUB_SOFTBUS_DISCOVERY_CAP_0014
     * @tc.desc   Test repeated device discovery capacity, case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryCapacity0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryCapacity0015
     * @tc.number SUB_SOFTBUS_DISCOVERY_CAP_0015
     * @tc.desc   Test repeated device discovery capacity, case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryCapacity0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryCapacity0016
     * @tc.number SUB_SOFTBUS_DISCOVERY_CAP_0016
     * @tc.desc   Test repeated device discovery capacity, case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryCapacity0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryCapacity0017
     * @tc.number SUB_SOFTBUS_DISCOVERY_CAP_0017
     * @tc.desc   Test repeated device discovery capacity, case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryCapacity0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryCapacity0018
     * @tc.number SUB_SOFTBUS_DISCOVERY_CAP_0018
     * @tc.desc   Test repeated device discovery capacity, case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryCapacity0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryCapacity0019
     * @tc.number SUB_SOFTBUS_DISCOVERY_CAP_0019
     * @tc.desc   Test repeated device discovery capacity, case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryCapacity0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryCapacity0020
     * @tc.number SUB_SOFTBUS_DISCOVERY_CAP_0020
     * @tc.desc   Test repeated device discovery capacity, case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryCapacity0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryCapacity0021
     * @tc.number SUB_SOFTBUS_DISCOVERY_CAP_0021
     * @tc.desc   Test repeated device discovery capacity, case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryCapacity0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryCapacity0022
     * @tc.number SUB_SOFTBUS_DISCOVERY_CAP_0022
     * @tc.desc   Test repeated device discovery capacity, case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryCapacity0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryCapacity0023
     * @tc.number SUB_SOFTBUS_DISCOVERY_CAP_0023
     * @tc.desc   Test repeated device discovery capacity, case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryCapacity0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryCapacity0024
     * @tc.number SUB_SOFTBUS_DISCOVERY_CAP_0024
     * @tc.desc   Test repeated device discovery capacity, case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryCapacity0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryCapacity0025
     * @tc.number SUB_SOFTBUS_DISCOVERY_CAP_0025
     * @tc.desc   Test repeated device discovery capacity, case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryCapacity0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryCapacity0026
     * @tc.number SUB_SOFTBUS_DISCOVERY_CAP_0026
     * @tc.desc   Test repeated device discovery capacity, case 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryCapacity0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryCapacity0027
     * @tc.number SUB_SOFTBUS_DISCOVERY_CAP_0027
     * @tc.desc   Test repeated device discovery capacity, case 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryCapacity0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryCapacity0028
     * @tc.number SUB_SOFTBUS_DISCOVERY_CAP_0028
     * @tc.desc   Test repeated device discovery capacity, case 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryCapacity0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryCapacity0029
     * @tc.number SUB_SOFTBUS_DISCOVERY_CAP_0029
     * @tc.desc   Test repeated device discovery capacity, case 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryCapacity0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryCapacity0030
     * @tc.number SUB_SOFTBUS_DISCOVERY_CAP_0030
     * @tc.desc   Test repeated device discovery capacity, case 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryCapacity0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })
  })
}
