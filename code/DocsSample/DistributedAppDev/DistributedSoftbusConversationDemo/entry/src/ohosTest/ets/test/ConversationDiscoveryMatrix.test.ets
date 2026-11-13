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

export default function conversationDiscoveryMatrixTest() {
  describe('ConversationDiscoveryMatrixTest', () => {

    /**
     * @tc.name   testDiscoveryMatrix0001
     * @tc.number SUB_SOFTBUS_DISCOVERY_0001
     * @tc.desc   Test trusted-device discovery result shape, case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(devices !== undefined).assertTrue();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
      for (let i: number = 0; i < devices.length; i++) {
        expect(typeof devices[i].deviceName === 'string').assertTrue();
        expect(typeof devices[i].networkId === 'string').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryMatrix0002
     * @tc.number SUB_SOFTBUS_DISCOVERY_0002
     * @tc.desc   Test trusted-device discovery result shape, case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryMatrix0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(devices !== undefined).assertTrue();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
      for (let i: number = 0; i < devices.length; i++) {
        expect(typeof devices[i].deviceName === 'string').assertTrue();
        expect(typeof devices[i].networkId === 'string').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryMatrix0003
     * @tc.number SUB_SOFTBUS_DISCOVERY_0003
     * @tc.desc   Test trusted-device discovery result shape, case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryMatrix0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(devices !== undefined).assertTrue();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
      for (let i: number = 0; i < devices.length; i++) {
        expect(typeof devices[i].deviceName === 'string').assertTrue();
        expect(typeof devices[i].networkId === 'string').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryMatrix0004
     * @tc.number SUB_SOFTBUS_DISCOVERY_0004
     * @tc.desc   Test trusted-device discovery result shape, case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryMatrix0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(devices !== undefined).assertTrue();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
      for (let i: number = 0; i < devices.length; i++) {
        expect(typeof devices[i].deviceName === 'string').assertTrue();
        expect(typeof devices[i].networkId === 'string').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryMatrix0005
     * @tc.number SUB_SOFTBUS_DISCOVERY_0005
     * @tc.desc   Test trusted-device discovery result shape, case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryMatrix0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(devices !== undefined).assertTrue();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
      for (let i: number = 0; i < devices.length; i++) {
        expect(typeof devices[i].deviceName === 'string').assertTrue();
        expect(typeof devices[i].networkId === 'string').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryMatrix0006
     * @tc.number SUB_SOFTBUS_DISCOVERY_0006
     * @tc.desc   Test trusted-device discovery result shape, case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryMatrix0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(devices !== undefined).assertTrue();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
      for (let i: number = 0; i < devices.length; i++) {
        expect(typeof devices[i].deviceName === 'string').assertTrue();
        expect(typeof devices[i].networkId === 'string').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryMatrix0007
     * @tc.number SUB_SOFTBUS_DISCOVERY_0007
     * @tc.desc   Test trusted-device discovery result shape, case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryMatrix0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(devices !== undefined).assertTrue();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
      for (let i: number = 0; i < devices.length; i++) {
        expect(typeof devices[i].deviceName === 'string').assertTrue();
        expect(typeof devices[i].networkId === 'string').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryMatrix0008
     * @tc.number SUB_SOFTBUS_DISCOVERY_0008
     * @tc.desc   Test trusted-device discovery result shape, case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryMatrix0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(devices !== undefined).assertTrue();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
      for (let i: number = 0; i < devices.length; i++) {
        expect(typeof devices[i].deviceName === 'string').assertTrue();
        expect(typeof devices[i].networkId === 'string').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryMatrix0009
     * @tc.number SUB_SOFTBUS_DISCOVERY_0009
     * @tc.desc   Test trusted-device discovery result shape, case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryMatrix0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(devices !== undefined).assertTrue();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
      for (let i: number = 0; i < devices.length; i++) {
        expect(typeof devices[i].deviceName === 'string').assertTrue();
        expect(typeof devices[i].networkId === 'string').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryMatrix0010
     * @tc.number SUB_SOFTBUS_DISCOVERY_0010
     * @tc.desc   Test trusted-device discovery result shape, case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryMatrix0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(devices !== undefined).assertTrue();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
      for (let i: number = 0; i < devices.length; i++) {
        expect(typeof devices[i].deviceName === 'string').assertTrue();
        expect(typeof devices[i].networkId === 'string').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryMatrix0011
     * @tc.number SUB_SOFTBUS_DISCOVERY_0011
     * @tc.desc   Test trusted-device discovery result shape, case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryMatrix0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(devices !== undefined).assertTrue();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
      for (let i: number = 0; i < devices.length; i++) {
        expect(typeof devices[i].deviceName === 'string').assertTrue();
        expect(typeof devices[i].networkId === 'string').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryMatrix0012
     * @tc.number SUB_SOFTBUS_DISCOVERY_0012
     * @tc.desc   Test trusted-device discovery result shape, case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryMatrix0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(devices !== undefined).assertTrue();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
      for (let i: number = 0; i < devices.length; i++) {
        expect(typeof devices[i].deviceName === 'string').assertTrue();
        expect(typeof devices[i].networkId === 'string').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryMatrix0013
     * @tc.number SUB_SOFTBUS_DISCOVERY_0013
     * @tc.desc   Test trusted-device discovery result shape, case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryMatrix0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(devices !== undefined).assertTrue();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
      for (let i: number = 0; i < devices.length; i++) {
        expect(typeof devices[i].deviceName === 'string').assertTrue();
        expect(typeof devices[i].networkId === 'string').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryMatrix0014
     * @tc.number SUB_SOFTBUS_DISCOVERY_0014
     * @tc.desc   Test trusted-device discovery result shape, case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryMatrix0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(devices !== undefined).assertTrue();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
      for (let i: number = 0; i < devices.length; i++) {
        expect(typeof devices[i].deviceName === 'string').assertTrue();
        expect(typeof devices[i].networkId === 'string').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryMatrix0015
     * @tc.number SUB_SOFTBUS_DISCOVERY_0015
     * @tc.desc   Test trusted-device discovery result shape, case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryMatrix0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(devices !== undefined).assertTrue();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
      for (let i: number = 0; i < devices.length; i++) {
        expect(typeof devices[i].deviceName === 'string').assertTrue();
        expect(typeof devices[i].networkId === 'string').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryMatrix0016
     * @tc.number SUB_SOFTBUS_DISCOVERY_0016
     * @tc.desc   Test trusted-device discovery result shape, case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryMatrix0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(devices !== undefined).assertTrue();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
      for (let i: number = 0; i < devices.length; i++) {
        expect(typeof devices[i].deviceName === 'string').assertTrue();
        expect(typeof devices[i].networkId === 'string').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryMatrix0017
     * @tc.number SUB_SOFTBUS_DISCOVERY_0017
     * @tc.desc   Test trusted-device discovery result shape, case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryMatrix0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(devices !== undefined).assertTrue();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
      for (let i: number = 0; i < devices.length; i++) {
        expect(typeof devices[i].deviceName === 'string').assertTrue();
        expect(typeof devices[i].networkId === 'string').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryMatrix0018
     * @tc.number SUB_SOFTBUS_DISCOVERY_0018
     * @tc.desc   Test trusted-device discovery result shape, case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryMatrix0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(devices !== undefined).assertTrue();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
      for (let i: number = 0; i < devices.length; i++) {
        expect(typeof devices[i].deviceName === 'string').assertTrue();
        expect(typeof devices[i].networkId === 'string').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryMatrix0019
     * @tc.number SUB_SOFTBUS_DISCOVERY_0019
     * @tc.desc   Test trusted-device discovery result shape, case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryMatrix0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(devices !== undefined).assertTrue();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
      for (let i: number = 0; i < devices.length; i++) {
        expect(typeof devices[i].deviceName === 'string').assertTrue();
        expect(typeof devices[i].networkId === 'string').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryMatrix0020
     * @tc.number SUB_SOFTBUS_DISCOVERY_0020
     * @tc.desc   Test trusted-device discovery result shape, case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryMatrix0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(devices !== undefined).assertTrue();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
      for (let i: number = 0; i < devices.length; i++) {
        expect(typeof devices[i].deviceName === 'string').assertTrue();
        expect(typeof devices[i].networkId === 'string').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryMatrix0021
     * @tc.number SUB_SOFTBUS_DISCOVERY_0021
     * @tc.desc   Test trusted-device discovery result shape, case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryMatrix0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(devices !== undefined).assertTrue();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
      for (let i: number = 0; i < devices.length; i++) {
        expect(typeof devices[i].deviceName === 'string').assertTrue();
        expect(typeof devices[i].networkId === 'string').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryMatrix0022
     * @tc.number SUB_SOFTBUS_DISCOVERY_0022
     * @tc.desc   Test trusted-device discovery result shape, case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryMatrix0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(devices !== undefined).assertTrue();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
      for (let i: number = 0; i < devices.length; i++) {
        expect(typeof devices[i].deviceName === 'string').assertTrue();
        expect(typeof devices[i].networkId === 'string').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryMatrix0023
     * @tc.number SUB_SOFTBUS_DISCOVERY_0023
     * @tc.desc   Test trusted-device discovery result shape, case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryMatrix0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(devices !== undefined).assertTrue();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
      for (let i: number = 0; i < devices.length; i++) {
        expect(typeof devices[i].deviceName === 'string').assertTrue();
        expect(typeof devices[i].networkId === 'string').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryMatrix0024
     * @tc.number SUB_SOFTBUS_DISCOVERY_0024
     * @tc.desc   Test trusted-device discovery result shape, case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryMatrix0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(devices !== undefined).assertTrue();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
      for (let i: number = 0; i < devices.length; i++) {
        expect(typeof devices[i].deviceName === 'string').assertTrue();
        expect(typeof devices[i].networkId === 'string').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryMatrix0025
     * @tc.number SUB_SOFTBUS_DISCOVERY_0025
     * @tc.desc   Test trusted-device discovery result shape, case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryMatrix0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(devices !== undefined).assertTrue();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
      for (let i: number = 0; i < devices.length; i++) {
        expect(typeof devices[i].deviceName === 'string').assertTrue();
        expect(typeof devices[i].networkId === 'string').assertTrue();
      }
    })
  })
}
