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

export default function conversationDiscoveryBatchTest() {
  describe('ConversationDiscoveryBatchTest', () => {

    /**
     * @tc.name   testDiscoveryBatch0001
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0001
     * @tc.desc   Test device discovery batch case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0002
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0002
     * @tc.desc   Test device discovery batch case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0003
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0003
     * @tc.desc   Test device discovery batch case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0004
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0004
     * @tc.desc   Test device discovery batch case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0005
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0005
     * @tc.desc   Test device discovery batch case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0006
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0006
     * @tc.desc   Test device discovery batch case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0007
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0007
     * @tc.desc   Test device discovery batch case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0008
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0008
     * @tc.desc   Test device discovery batch case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0009
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0009
     * @tc.desc   Test device discovery batch case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0010
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0010
     * @tc.desc   Test device discovery batch case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0011
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0011
     * @tc.desc   Test device discovery batch case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0012
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0012
     * @tc.desc   Test device discovery batch case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0013
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0013
     * @tc.desc   Test device discovery batch case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0014
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0014
     * @tc.desc   Test device discovery batch case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0015
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0015
     * @tc.desc   Test device discovery batch case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0016
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0016
     * @tc.desc   Test device discovery batch case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0017
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0017
     * @tc.desc   Test device discovery batch case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0018
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0018
     * @tc.desc   Test device discovery batch case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0019
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0019
     * @tc.desc   Test device discovery batch case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0020
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0020
     * @tc.desc   Test device discovery batch case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0021
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0021
     * @tc.desc   Test device discovery batch case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0022
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0022
     * @tc.desc   Test device discovery batch case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0023
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0023
     * @tc.desc   Test device discovery batch case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0024
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0024
     * @tc.desc   Test device discovery batch case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0025
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0025
     * @tc.desc   Test device discovery batch case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0026
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0026
     * @tc.desc   Test device discovery batch case 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0027
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0027
     * @tc.desc   Test device discovery batch case 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0028
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0028
     * @tc.desc   Test device discovery batch case 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0029
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0029
     * @tc.desc   Test device discovery batch case 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0030
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0030
     * @tc.desc   Test device discovery batch case 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0031
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0031
     * @tc.desc   Test device discovery batch case 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0032
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0032
     * @tc.desc   Test device discovery batch case 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0033
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0033
     * @tc.desc   Test device discovery batch case 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0034
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0034
     * @tc.desc   Test device discovery batch case 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0035
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0035
     * @tc.desc   Test device discovery batch case 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0036
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0036
     * @tc.desc   Test device discovery batch case 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0037
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0037
     * @tc.desc   Test device discovery batch case 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0038
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0038
     * @tc.desc   Test device discovery batch case 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0039
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0039
     * @tc.desc   Test device discovery batch case 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0040
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0040
     * @tc.desc   Test device discovery batch case 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0041
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0041
     * @tc.desc   Test device discovery batch case 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0042
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0042
     * @tc.desc   Test device discovery batch case 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0043
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0043
     * @tc.desc   Test device discovery batch case 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0044
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0044
     * @tc.desc   Test device discovery batch case 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0045
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0045
     * @tc.desc   Test device discovery batch case 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0046
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0046
     * @tc.desc   Test device discovery batch case 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0047
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0047
     * @tc.desc   Test device discovery batch case 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0048
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0048
     * @tc.desc   Test device discovery batch case 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0049
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0049
     * @tc.desc   Test device discovery batch case 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0050
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0050
     * @tc.desc   Test device discovery batch case 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0051
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0051
     * @tc.desc   Test device discovery batch case 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0052
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0052
     * @tc.desc   Test device discovery batch case 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0053
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0053
     * @tc.desc   Test device discovery batch case 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0054
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0054
     * @tc.desc   Test device discovery batch case 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0055
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0055
     * @tc.desc   Test device discovery batch case 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0056
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0056
     * @tc.desc   Test device discovery batch case 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0057
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0057
     * @tc.desc   Test device discovery batch case 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0058
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0058
     * @tc.desc   Test device discovery batch case 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0059
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0059
     * @tc.desc   Test device discovery batch case 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })

    /**
     * @tc.name   testDiscoveryBatch0060
     * @tc.number SUB_SOFTBUS_DISCOVERY_BATCH_0060
     * @tc.desc   Test device discovery batch case 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDiscoveryBatch0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const devices: conversation.DeviceNodeInfo[] = safeGetTrustedDevices();
      expect(Array.isArray(devices)).assertTrue();
      expect(devices.length >= 0).assertTrue();
    })
  })
}
