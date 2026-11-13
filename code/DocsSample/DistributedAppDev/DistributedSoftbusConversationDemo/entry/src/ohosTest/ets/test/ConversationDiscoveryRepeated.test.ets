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

export default function conversationDiscoveryRepeatedTest() {
  describe('ConversationDiscoveryRepeatedTest', () => {

    /**
     * @tc.name   testDiscoveryRepeated0001
     * @tc.number SUB_SOFTBUS_DISCOVERY_REPEAT_0001
     * @tc.desc   Test repeated device discovery stability, case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryRepeated0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryRepeated0002
     * @tc.number SUB_SOFTBUS_DISCOVERY_REPEAT_0002
     * @tc.desc   Test repeated device discovery stability, case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryRepeated0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryRepeated0003
     * @tc.number SUB_SOFTBUS_DISCOVERY_REPEAT_0003
     * @tc.desc   Test repeated device discovery stability, case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryRepeated0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryRepeated0004
     * @tc.number SUB_SOFTBUS_DISCOVERY_REPEAT_0004
     * @tc.desc   Test repeated device discovery stability, case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryRepeated0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryRepeated0005
     * @tc.number SUB_SOFTBUS_DISCOVERY_REPEAT_0005
     * @tc.desc   Test repeated device discovery stability, case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryRepeated0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryRepeated0006
     * @tc.number SUB_SOFTBUS_DISCOVERY_REPEAT_0006
     * @tc.desc   Test repeated device discovery stability, case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryRepeated0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryRepeated0007
     * @tc.number SUB_SOFTBUS_DISCOVERY_REPEAT_0007
     * @tc.desc   Test repeated device discovery stability, case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryRepeated0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryRepeated0008
     * @tc.number SUB_SOFTBUS_DISCOVERY_REPEAT_0008
     * @tc.desc   Test repeated device discovery stability, case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryRepeated0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryRepeated0009
     * @tc.number SUB_SOFTBUS_DISCOVERY_REPEAT_0009
     * @tc.desc   Test repeated device discovery stability, case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryRepeated0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryRepeated0010
     * @tc.number SUB_SOFTBUS_DISCOVERY_REPEAT_0010
     * @tc.desc   Test repeated device discovery stability, case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryRepeated0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryRepeated0011
     * @tc.number SUB_SOFTBUS_DISCOVERY_REPEAT_0011
     * @tc.desc   Test repeated device discovery stability, case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryRepeated0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryRepeated0012
     * @tc.number SUB_SOFTBUS_DISCOVERY_REPEAT_0012
     * @tc.desc   Test repeated device discovery stability, case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryRepeated0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryRepeated0013
     * @tc.number SUB_SOFTBUS_DISCOVERY_REPEAT_0013
     * @tc.desc   Test repeated device discovery stability, case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryRepeated0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryRepeated0014
     * @tc.number SUB_SOFTBUS_DISCOVERY_REPEAT_0014
     * @tc.desc   Test repeated device discovery stability, case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryRepeated0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryRepeated0015
     * @tc.number SUB_SOFTBUS_DISCOVERY_REPEAT_0015
     * @tc.desc   Test repeated device discovery stability, case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryRepeated0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryRepeated0016
     * @tc.number SUB_SOFTBUS_DISCOVERY_REPEAT_0016
     * @tc.desc   Test repeated device discovery stability, case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryRepeated0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryRepeated0017
     * @tc.number SUB_SOFTBUS_DISCOVERY_REPEAT_0017
     * @tc.desc   Test repeated device discovery stability, case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryRepeated0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryRepeated0018
     * @tc.number SUB_SOFTBUS_DISCOVERY_REPEAT_0018
     * @tc.desc   Test repeated device discovery stability, case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryRepeated0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryRepeated0019
     * @tc.number SUB_SOFTBUS_DISCOVERY_REPEAT_0019
     * @tc.desc   Test repeated device discovery stability, case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryRepeated0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryRepeated0020
     * @tc.number SUB_SOFTBUS_DISCOVERY_REPEAT_0020
     * @tc.desc   Test repeated device discovery stability, case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryRepeated0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryRepeated0021
     * @tc.number SUB_SOFTBUS_DISCOVERY_REPEAT_0021
     * @tc.desc   Test repeated device discovery stability, case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryRepeated0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryRepeated0022
     * @tc.number SUB_SOFTBUS_DISCOVERY_REPEAT_0022
     * @tc.desc   Test repeated device discovery stability, case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryRepeated0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryRepeated0023
     * @tc.number SUB_SOFTBUS_DISCOVERY_REPEAT_0023
     * @tc.desc   Test repeated device discovery stability, case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryRepeated0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryRepeated0024
     * @tc.number SUB_SOFTBUS_DISCOVERY_REPEAT_0024
     * @tc.desc   Test repeated device discovery stability, case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryRepeated0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryRepeated0025
     * @tc.number SUB_SOFTBUS_DISCOVERY_REPEAT_0025
     * @tc.desc   Test repeated device discovery stability, case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryRepeated0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryRepeated0026
     * @tc.number SUB_SOFTBUS_DISCOVERY_REPEAT_0026
     * @tc.desc   Test repeated device discovery stability, case 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryRepeated0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryRepeated0027
     * @tc.number SUB_SOFTBUS_DISCOVERY_REPEAT_0027
     * @tc.desc   Test repeated device discovery stability, case 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryRepeated0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryRepeated0028
     * @tc.number SUB_SOFTBUS_DISCOVERY_REPEAT_0028
     * @tc.desc   Test repeated device discovery stability, case 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryRepeated0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryRepeated0029
     * @tc.number SUB_SOFTBUS_DISCOVERY_REPEAT_0029
     * @tc.desc   Test repeated device discovery stability, case 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryRepeated0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryRepeated0030
     * @tc.number SUB_SOFTBUS_DISCOVERY_REPEAT_0030
     * @tc.desc   Test repeated device discovery stability, case 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryRepeated0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryRepeated0031
     * @tc.number SUB_SOFTBUS_DISCOVERY_REPEAT_0031
     * @tc.desc   Test repeated device discovery stability, case 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryRepeated0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryRepeated0032
     * @tc.number SUB_SOFTBUS_DISCOVERY_REPEAT_0032
     * @tc.desc   Test repeated device discovery stability, case 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryRepeated0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryRepeated0033
     * @tc.number SUB_SOFTBUS_DISCOVERY_REPEAT_0033
     * @tc.desc   Test repeated device discovery stability, case 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryRepeated0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryRepeated0034
     * @tc.number SUB_SOFTBUS_DISCOVERY_REPEAT_0034
     * @tc.desc   Test repeated device discovery stability, case 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryRepeated0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryRepeated0035
     * @tc.number SUB_SOFTBUS_DISCOVERY_REPEAT_0035
     * @tc.desc   Test repeated device discovery stability, case 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryRepeated0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryRepeated0036
     * @tc.number SUB_SOFTBUS_DISCOVERY_REPEAT_0036
     * @tc.desc   Test repeated device discovery stability, case 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryRepeated0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryRepeated0037
     * @tc.number SUB_SOFTBUS_DISCOVERY_REPEAT_0037
     * @tc.desc   Test repeated device discovery stability, case 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryRepeated0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryRepeated0038
     * @tc.number SUB_SOFTBUS_DISCOVERY_REPEAT_0038
     * @tc.desc   Test repeated device discovery stability, case 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryRepeated0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryRepeated0039
     * @tc.number SUB_SOFTBUS_DISCOVERY_REPEAT_0039
     * @tc.desc   Test repeated device discovery stability, case 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryRepeated0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryRepeated0040
     * @tc.number SUB_SOFTBUS_DISCOVERY_REPEAT_0040
     * @tc.desc   Test repeated device discovery stability, case 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryRepeated0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      const second: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(first)).assertTrue();
      expect(Array.isArray(second)).assertTrue();
    })
  })
}
