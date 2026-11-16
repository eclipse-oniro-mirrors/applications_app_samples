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
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
let appContext = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext();

export default function wlanResourceExtraTest() {
  describe('WlanResourceExtraTest', () => {

    /**
     * @tc.name   testWlanResourceExtra0001
     * @tc.number SUB_WLAN_RESOURCE_EXTRA_0001
     * @tc.desc   Load the gateway resource string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResourceExtra0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: string = appContext.resourceManager.getStringByNameSync('gate_way');
      expect(value.length > 0).assertTrue();
      expect(value === 'gate_way').assertFalse();
      expect(value).assertEqual(value.trim());
    })

    /**
     * @tc.name   testWlanResourceExtra0002
     * @tc.number SUB_WLAN_RESOURCE_EXTRA_0002
     * @tc.desc   Load the netmask resource string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResourceExtra0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: string = appContext.resourceManager.getStringByNameSync('net_mask');
      expect(value.length > 0).assertTrue();
      expect(value === 'net_mask').assertFalse();
      expect(value).assertEqual(value.trim());
    })

    /**
     * @tc.name   testWlanResourceExtra0003
     * @tc.number SUB_WLAN_RESOURCE_EXTRA_0003
     * @tc.desc   Load the primary DNS resource string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResourceExtra0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: string = appContext.resourceManager.getStringByNameSync('primary_dns');
      expect(value.length > 0).assertTrue();
      expect(value === 'primary_dns').assertFalse();
      expect(value).assertEqual(value.trim());
    })

    /**
     * @tc.name   testWlanResourceExtra0004
     * @tc.number SUB_WLAN_RESOURCE_EXTRA_0004
     * @tc.desc   Load the second DNS resource string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResourceExtra0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: string = appContext.resourceManager.getStringByNameSync('second_dns');
      expect(value.length > 0).assertTrue();
      expect(value === 'second_dns').assertFalse();
      expect(value).assertEqual(value.trim());
    })

    /**
     * @tc.name   testWlanResourceExtra0005
     * @tc.number SUB_WLAN_RESOURCE_EXTRA_0005
     * @tc.desc   Load the server IP resource string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResourceExtra0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: string = appContext.resourceManager.getStringByNameSync('server_ip');
      expect(value.length > 0).assertTrue();
      expect(value === 'server_ip').assertFalse();
      expect(value).assertEqual(value.trim());
    })

    /**
     * @tc.name   testWlanResourceExtra0006
     * @tc.number SUB_WLAN_RESOURCE_EXTRA_0006
     * @tc.desc   Load the lease duration resource string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResourceExtra0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: string = appContext.resourceManager.getStringByNameSync('lease_duration');
      expect(value.length > 0).assertTrue();
      expect(value === 'lease_duration').assertFalse();
      expect(value).assertEqual(value.trim());
    })

    /**
     * @tc.name   testWlanResourceExtra0007
     * @tc.number SUB_WLAN_RESOURCE_EXTRA_0007
     * @tc.desc   Load the infrastructure feature resource string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResourceExtra0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: string = appContext.resourceManager.getStringByNameSync('infrastructure_feature');
      expect(value.length > 0).assertTrue();
      expect(value === 'infrastructure_feature').assertFalse();
      expect(value).assertEqual(value.trim());
    })

    /**
     * @tc.name   testWlanResourceExtra0008
     * @tc.number SUB_WLAN_RESOURCE_EXTRA_0008
     * @tc.desc   Load the WiFi Aware feature resource string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResourceExtra0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: string = appContext.resourceManager.getStringByNameSync('wifi_aware');
      expect(value.length > 0).assertTrue();
      expect(value === 'wifi_aware').assertFalse();
      expect(value).assertEqual(value.trim());
    })
  })
}
