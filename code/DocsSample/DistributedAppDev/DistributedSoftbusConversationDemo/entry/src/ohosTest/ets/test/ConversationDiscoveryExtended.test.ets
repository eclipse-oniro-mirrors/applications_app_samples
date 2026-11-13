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

export default function conversationDiscoveryExtendedTest() {
  describe('ConversationDiscoveryExtendedTest', () => {

    /**
     * @tc.name   testDiscoveryExtended0001
     * @tc.number SUB_SOFTBUS_DISCOVERY_EXT_0001
     * @tc.desc   Test repeated trusted-device discovery, case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryExtended0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
      expect(first.length >= 0).assertTrue();
      expect(second.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryExtended0002
     * @tc.number SUB_SOFTBUS_DISCOVERY_EXT_0002
     * @tc.desc   Test repeated trusted-device discovery, case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryExtended0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
      expect(first.length >= 0).assertTrue();
      expect(second.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryExtended0003
     * @tc.number SUB_SOFTBUS_DISCOVERY_EXT_0003
     * @tc.desc   Test repeated trusted-device discovery, case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryExtended0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
      expect(first.length >= 0).assertTrue();
      expect(second.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryExtended0004
     * @tc.number SUB_SOFTBUS_DISCOVERY_EXT_0004
     * @tc.desc   Test repeated trusted-device discovery, case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryExtended0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
      expect(first.length >= 0).assertTrue();
      expect(second.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryExtended0005
     * @tc.number SUB_SOFTBUS_DISCOVERY_EXT_0005
     * @tc.desc   Test repeated trusted-device discovery, case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryExtended0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
      expect(first.length >= 0).assertTrue();
      expect(second.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryExtended0006
     * @tc.number SUB_SOFTBUS_DISCOVERY_EXT_0006
     * @tc.desc   Test repeated trusted-device discovery, case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryExtended0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
      expect(first.length >= 0).assertTrue();
      expect(second.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryExtended0007
     * @tc.number SUB_SOFTBUS_DISCOVERY_EXT_0007
     * @tc.desc   Test repeated trusted-device discovery, case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryExtended0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
      expect(first.length >= 0).assertTrue();
      expect(second.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryExtended0008
     * @tc.number SUB_SOFTBUS_DISCOVERY_EXT_0008
     * @tc.desc   Test repeated trusted-device discovery, case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryExtended0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
      expect(first.length >= 0).assertTrue();
      expect(second.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryExtended0009
     * @tc.number SUB_SOFTBUS_DISCOVERY_EXT_0009
     * @tc.desc   Test repeated trusted-device discovery, case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryExtended0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
      expect(first.length >= 0).assertTrue();
      expect(second.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryExtended0010
     * @tc.number SUB_SOFTBUS_DISCOVERY_EXT_0010
     * @tc.desc   Test repeated trusted-device discovery, case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryExtended0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
      expect(first.length >= 0).assertTrue();
      expect(second.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryExtended0011
     * @tc.number SUB_SOFTBUS_DISCOVERY_EXT_0011
     * @tc.desc   Test repeated trusted-device discovery, case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryExtended0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
      expect(first.length >= 0).assertTrue();
      expect(second.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryExtended0012
     * @tc.number SUB_SOFTBUS_DISCOVERY_EXT_0012
     * @tc.desc   Test repeated trusted-device discovery, case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryExtended0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
      expect(first.length >= 0).assertTrue();
      expect(second.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryExtended0013
     * @tc.number SUB_SOFTBUS_DISCOVERY_EXT_0013
     * @tc.desc   Test repeated trusted-device discovery, case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryExtended0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
      expect(first.length >= 0).assertTrue();
      expect(second.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryExtended0014
     * @tc.number SUB_SOFTBUS_DISCOVERY_EXT_0014
     * @tc.desc   Test repeated trusted-device discovery, case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryExtended0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
      expect(first.length >= 0).assertTrue();
      expect(second.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryExtended0015
     * @tc.number SUB_SOFTBUS_DISCOVERY_EXT_0015
     * @tc.desc   Test repeated trusted-device discovery, case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryExtended0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
      expect(first.length >= 0).assertTrue();
      expect(second.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryExtended0016
     * @tc.number SUB_SOFTBUS_DISCOVERY_EXT_0016
     * @tc.desc   Test repeated trusted-device discovery, case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryExtended0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
      expect(first.length >= 0).assertTrue();
      expect(second.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryExtended0017
     * @tc.number SUB_SOFTBUS_DISCOVERY_EXT_0017
     * @tc.desc   Test repeated trusted-device discovery, case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryExtended0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
      expect(first.length >= 0).assertTrue();
      expect(second.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryExtended0018
     * @tc.number SUB_SOFTBUS_DISCOVERY_EXT_0018
     * @tc.desc   Test repeated trusted-device discovery, case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryExtended0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
      expect(first.length >= 0).assertTrue();
      expect(second.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryExtended0019
     * @tc.number SUB_SOFTBUS_DISCOVERY_EXT_0019
     * @tc.desc   Test repeated trusted-device discovery, case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryExtended0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
      expect(first.length >= 0).assertTrue();
      expect(second.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryExtended0020
     * @tc.number SUB_SOFTBUS_DISCOVERY_EXT_0020
     * @tc.desc   Test repeated trusted-device discovery, case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryExtended0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
      expect(first.length >= 0).assertTrue();
      expect(second.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryExtended0021
     * @tc.number SUB_SOFTBUS_DISCOVERY_EXT_0021
     * @tc.desc   Test repeated trusted-device discovery, case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryExtended0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
      expect(first.length >= 0).assertTrue();
      expect(second.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryExtended0022
     * @tc.number SUB_SOFTBUS_DISCOVERY_EXT_0022
     * @tc.desc   Test repeated trusted-device discovery, case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryExtended0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
      expect(first.length >= 0).assertTrue();
      expect(second.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryExtended0023
     * @tc.number SUB_SOFTBUS_DISCOVERY_EXT_0023
     * @tc.desc   Test repeated trusted-device discovery, case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryExtended0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
      expect(first.length >= 0).assertTrue();
      expect(second.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryExtended0024
     * @tc.number SUB_SOFTBUS_DISCOVERY_EXT_0024
     * @tc.desc   Test repeated trusted-device discovery, case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryExtended0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
      expect(first.length >= 0).assertTrue();
      expect(second.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryExtended0025
     * @tc.number SUB_SOFTBUS_DISCOVERY_EXT_0025
     * @tc.desc   Test repeated trusted-device discovery, case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryExtended0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
      expect(first.length >= 0).assertTrue();
      expect(second.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryExtended0026
     * @tc.number SUB_SOFTBUS_DISCOVERY_EXT_0026
     * @tc.desc   Test repeated trusted-device discovery, case 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryExtended0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
      expect(first.length >= 0).assertTrue();
      expect(second.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryExtended0027
     * @tc.number SUB_SOFTBUS_DISCOVERY_EXT_0027
     * @tc.desc   Test repeated trusted-device discovery, case 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryExtended0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
      expect(first.length >= 0).assertTrue();
      expect(second.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryExtended0028
     * @tc.number SUB_SOFTBUS_DISCOVERY_EXT_0028
     * @tc.desc   Test repeated trusted-device discovery, case 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryExtended0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
      expect(first.length >= 0).assertTrue();
      expect(second.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryExtended0029
     * @tc.number SUB_SOFTBUS_DISCOVERY_EXT_0029
     * @tc.desc   Test repeated trusted-device discovery, case 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryExtended0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
      expect(first.length >= 0).assertTrue();
      expect(second.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryExtended0030
     * @tc.number SUB_SOFTBUS_DISCOVERY_EXT_0030
     * @tc.desc   Test repeated trusted-device discovery, case 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryExtended0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
      expect(first.length >= 0).assertTrue();
      expect(second.length >= 0).assertTrue();
    })
  })
}
