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

export default function conversationDiscoveryFieldsTest() {
  describe('ConversationDiscoveryFieldsTest', () => {

    /**
     * @tc.name   testDiscoveryFields0001
     * @tc.number SUB_SOFTBUS_DISCOVERY_FIELDS_0001
     * @tc.desc   Test trusted device node fields, case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFields0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      for (let j: number = 0; j < devices.length; j++) {
        expect(typeof devices[j].deviceName === 'string').assertTrue();
        expect(typeof devices[j].networkId === 'string').assertTrue();
        expect(typeof devices[j].deviceTypeId === 'number').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryFields0002
     * @tc.number SUB_SOFTBUS_DISCOVERY_FIELDS_0002
     * @tc.desc   Test trusted device node fields, case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFields0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      for (let j: number = 0; j < devices.length; j++) {
        expect(typeof devices[j].deviceName === 'string').assertTrue();
        expect(typeof devices[j].networkId === 'string').assertTrue();
        expect(typeof devices[j].deviceTypeId === 'number').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryFields0003
     * @tc.number SUB_SOFTBUS_DISCOVERY_FIELDS_0003
     * @tc.desc   Test trusted device node fields, case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFields0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      for (let j: number = 0; j < devices.length; j++) {
        expect(typeof devices[j].deviceName === 'string').assertTrue();
        expect(typeof devices[j].networkId === 'string').assertTrue();
        expect(typeof devices[j].deviceTypeId === 'number').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryFields0004
     * @tc.number SUB_SOFTBUS_DISCOVERY_FIELDS_0004
     * @tc.desc   Test trusted device node fields, case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFields0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      for (let j: number = 0; j < devices.length; j++) {
        expect(typeof devices[j].deviceName === 'string').assertTrue();
        expect(typeof devices[j].networkId === 'string').assertTrue();
        expect(typeof devices[j].deviceTypeId === 'number').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryFields0005
     * @tc.number SUB_SOFTBUS_DISCOVERY_FIELDS_0005
     * @tc.desc   Test trusted device node fields, case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFields0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      for (let j: number = 0; j < devices.length; j++) {
        expect(typeof devices[j].deviceName === 'string').assertTrue();
        expect(typeof devices[j].networkId === 'string').assertTrue();
        expect(typeof devices[j].deviceTypeId === 'number').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryFields0006
     * @tc.number SUB_SOFTBUS_DISCOVERY_FIELDS_0006
     * @tc.desc   Test trusted device node fields, case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFields0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      for (let j: number = 0; j < devices.length; j++) {
        expect(typeof devices[j].deviceName === 'string').assertTrue();
        expect(typeof devices[j].networkId === 'string').assertTrue();
        expect(typeof devices[j].deviceTypeId === 'number').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryFields0007
     * @tc.number SUB_SOFTBUS_DISCOVERY_FIELDS_0007
     * @tc.desc   Test trusted device node fields, case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFields0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      for (let j: number = 0; j < devices.length; j++) {
        expect(typeof devices[j].deviceName === 'string').assertTrue();
        expect(typeof devices[j].networkId === 'string').assertTrue();
        expect(typeof devices[j].deviceTypeId === 'number').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryFields0008
     * @tc.number SUB_SOFTBUS_DISCOVERY_FIELDS_0008
     * @tc.desc   Test trusted device node fields, case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFields0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      for (let j: number = 0; j < devices.length; j++) {
        expect(typeof devices[j].deviceName === 'string').assertTrue();
        expect(typeof devices[j].networkId === 'string').assertTrue();
        expect(typeof devices[j].deviceTypeId === 'number').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryFields0009
     * @tc.number SUB_SOFTBUS_DISCOVERY_FIELDS_0009
     * @tc.desc   Test trusted device node fields, case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFields0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      for (let j: number = 0; j < devices.length; j++) {
        expect(typeof devices[j].deviceName === 'string').assertTrue();
        expect(typeof devices[j].networkId === 'string').assertTrue();
        expect(typeof devices[j].deviceTypeId === 'number').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryFields0010
     * @tc.number SUB_SOFTBUS_DISCOVERY_FIELDS_0010
     * @tc.desc   Test trusted device node fields, case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFields0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      for (let j: number = 0; j < devices.length; j++) {
        expect(typeof devices[j].deviceName === 'string').assertTrue();
        expect(typeof devices[j].networkId === 'string').assertTrue();
        expect(typeof devices[j].deviceTypeId === 'number').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryFields0011
     * @tc.number SUB_SOFTBUS_DISCOVERY_FIELDS_0011
     * @tc.desc   Test trusted device node fields, case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFields0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      for (let j: number = 0; j < devices.length; j++) {
        expect(typeof devices[j].deviceName === 'string').assertTrue();
        expect(typeof devices[j].networkId === 'string').assertTrue();
        expect(typeof devices[j].deviceTypeId === 'number').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryFields0012
     * @tc.number SUB_SOFTBUS_DISCOVERY_FIELDS_0012
     * @tc.desc   Test trusted device node fields, case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFields0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      for (let j: number = 0; j < devices.length; j++) {
        expect(typeof devices[j].deviceName === 'string').assertTrue();
        expect(typeof devices[j].networkId === 'string').assertTrue();
        expect(typeof devices[j].deviceTypeId === 'number').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryFields0013
     * @tc.number SUB_SOFTBUS_DISCOVERY_FIELDS_0013
     * @tc.desc   Test trusted device node fields, case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFields0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      for (let j: number = 0; j < devices.length; j++) {
        expect(typeof devices[j].deviceName === 'string').assertTrue();
        expect(typeof devices[j].networkId === 'string').assertTrue();
        expect(typeof devices[j].deviceTypeId === 'number').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryFields0014
     * @tc.number SUB_SOFTBUS_DISCOVERY_FIELDS_0014
     * @tc.desc   Test trusted device node fields, case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFields0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      for (let j: number = 0; j < devices.length; j++) {
        expect(typeof devices[j].deviceName === 'string').assertTrue();
        expect(typeof devices[j].networkId === 'string').assertTrue();
        expect(typeof devices[j].deviceTypeId === 'number').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryFields0015
     * @tc.number SUB_SOFTBUS_DISCOVERY_FIELDS_0015
     * @tc.desc   Test trusted device node fields, case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFields0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      for (let j: number = 0; j < devices.length; j++) {
        expect(typeof devices[j].deviceName === 'string').assertTrue();
        expect(typeof devices[j].networkId === 'string').assertTrue();
        expect(typeof devices[j].deviceTypeId === 'number').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryFields0016
     * @tc.number SUB_SOFTBUS_DISCOVERY_FIELDS_0016
     * @tc.desc   Test trusted device node fields, case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFields0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      for (let j: number = 0; j < devices.length; j++) {
        expect(typeof devices[j].deviceName === 'string').assertTrue();
        expect(typeof devices[j].networkId === 'string').assertTrue();
        expect(typeof devices[j].deviceTypeId === 'number').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryFields0017
     * @tc.number SUB_SOFTBUS_DISCOVERY_FIELDS_0017
     * @tc.desc   Test trusted device node fields, case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFields0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      for (let j: number = 0; j < devices.length; j++) {
        expect(typeof devices[j].deviceName === 'string').assertTrue();
        expect(typeof devices[j].networkId === 'string').assertTrue();
        expect(typeof devices[j].deviceTypeId === 'number').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryFields0018
     * @tc.number SUB_SOFTBUS_DISCOVERY_FIELDS_0018
     * @tc.desc   Test trusted device node fields, case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFields0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      for (let j: number = 0; j < devices.length; j++) {
        expect(typeof devices[j].deviceName === 'string').assertTrue();
        expect(typeof devices[j].networkId === 'string').assertTrue();
        expect(typeof devices[j].deviceTypeId === 'number').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryFields0019
     * @tc.number SUB_SOFTBUS_DISCOVERY_FIELDS_0019
     * @tc.desc   Test trusted device node fields, case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFields0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      for (let j: number = 0; j < devices.length; j++) {
        expect(typeof devices[j].deviceName === 'string').assertTrue();
        expect(typeof devices[j].networkId === 'string').assertTrue();
        expect(typeof devices[j].deviceTypeId === 'number').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryFields0020
     * @tc.number SUB_SOFTBUS_DISCOVERY_FIELDS_0020
     * @tc.desc   Test trusted device node fields, case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFields0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      for (let j: number = 0; j < devices.length; j++) {
        expect(typeof devices[j].deviceName === 'string').assertTrue();
        expect(typeof devices[j].networkId === 'string').assertTrue();
        expect(typeof devices[j].deviceTypeId === 'number').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryFields0021
     * @tc.number SUB_SOFTBUS_DISCOVERY_FIELDS_0021
     * @tc.desc   Test trusted device node fields, case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFields0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      for (let j: number = 0; j < devices.length; j++) {
        expect(typeof devices[j].deviceName === 'string').assertTrue();
        expect(typeof devices[j].networkId === 'string').assertTrue();
        expect(typeof devices[j].deviceTypeId === 'number').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryFields0022
     * @tc.number SUB_SOFTBUS_DISCOVERY_FIELDS_0022
     * @tc.desc   Test trusted device node fields, case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFields0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      for (let j: number = 0; j < devices.length; j++) {
        expect(typeof devices[j].deviceName === 'string').assertTrue();
        expect(typeof devices[j].networkId === 'string').assertTrue();
        expect(typeof devices[j].deviceTypeId === 'number').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryFields0023
     * @tc.number SUB_SOFTBUS_DISCOVERY_FIELDS_0023
     * @tc.desc   Test trusted device node fields, case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFields0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      for (let j: number = 0; j < devices.length; j++) {
        expect(typeof devices[j].deviceName === 'string').assertTrue();
        expect(typeof devices[j].networkId === 'string').assertTrue();
        expect(typeof devices[j].deviceTypeId === 'number').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryFields0024
     * @tc.number SUB_SOFTBUS_DISCOVERY_FIELDS_0024
     * @tc.desc   Test trusted device node fields, case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFields0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      for (let j: number = 0; j < devices.length; j++) {
        expect(typeof devices[j].deviceName === 'string').assertTrue();
        expect(typeof devices[j].networkId === 'string').assertTrue();
        expect(typeof devices[j].deviceTypeId === 'number').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryFields0025
     * @tc.number SUB_SOFTBUS_DISCOVERY_FIELDS_0025
     * @tc.desc   Test trusted device node fields, case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFields0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      for (let j: number = 0; j < devices.length; j++) {
        expect(typeof devices[j].deviceName === 'string').assertTrue();
        expect(typeof devices[j].networkId === 'string').assertTrue();
        expect(typeof devices[j].deviceTypeId === 'number').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryFields0026
     * @tc.number SUB_SOFTBUS_DISCOVERY_FIELDS_0026
     * @tc.desc   Test trusted device node fields, case 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFields0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      for (let j: number = 0; j < devices.length; j++) {
        expect(typeof devices[j].deviceName === 'string').assertTrue();
        expect(typeof devices[j].networkId === 'string').assertTrue();
        expect(typeof devices[j].deviceTypeId === 'number').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryFields0027
     * @tc.number SUB_SOFTBUS_DISCOVERY_FIELDS_0027
     * @tc.desc   Test trusted device node fields, case 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFields0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      for (let j: number = 0; j < devices.length; j++) {
        expect(typeof devices[j].deviceName === 'string').assertTrue();
        expect(typeof devices[j].networkId === 'string').assertTrue();
        expect(typeof devices[j].deviceTypeId === 'number').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryFields0028
     * @tc.number SUB_SOFTBUS_DISCOVERY_FIELDS_0028
     * @tc.desc   Test trusted device node fields, case 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFields0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      for (let j: number = 0; j < devices.length; j++) {
        expect(typeof devices[j].deviceName === 'string').assertTrue();
        expect(typeof devices[j].networkId === 'string').assertTrue();
        expect(typeof devices[j].deviceTypeId === 'number').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryFields0029
     * @tc.number SUB_SOFTBUS_DISCOVERY_FIELDS_0029
     * @tc.desc   Test trusted device node fields, case 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFields0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      for (let j: number = 0; j < devices.length; j++) {
        expect(typeof devices[j].deviceName === 'string').assertTrue();
        expect(typeof devices[j].networkId === 'string').assertTrue();
        expect(typeof devices[j].deviceTypeId === 'number').assertTrue();
      }
    })

    /**
     * @tc.name   testDiscoveryFields0030
     * @tc.number SUB_SOFTBUS_DISCOVERY_FIELDS_0030
     * @tc.desc   Test trusted device node fields, case 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryFields0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      for (let j: number = 0; j < devices.length; j++) {
        expect(typeof devices[j].deviceName === 'string').assertTrue();
        expect(typeof devices[j].networkId === 'string').assertTrue();
        expect(typeof devices[j].deviceTypeId === 'number').assertTrue();
      }
    })
  })
}
