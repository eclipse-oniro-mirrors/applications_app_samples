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

export default function wlanResourceRemainingTest() {
  describe('WlanResourceRemainingTest', () => {

    /**
     * @tc.name   testWlanResourceRemain0001
     * @tc.number SUB_WLAN_RESOURCE_REMAIN_0001
     * @tc.desc   Load the 5 GHz feature string resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResourceRemain0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: string = appContext.resourceManager.getStringByNameSync('ghz_feature');
      expect(value.length > 0).assertTrue();
      expect(value === 'ghz_feature').assertFalse();
      expect(value).assertEqual(value.trim());
    })

    /**
     * @tc.name   testWlanResourceRemain0002
     * @tc.number SUB_WLAN_RESOURCE_REMAIN_0002
     * @tc.desc   Load the GAS/ANQP feature string resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResourceRemain0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: string = appContext.resourceManager.getStringByNameSync('gas_anqp_feature');
      expect(value.length > 0).assertTrue();
      expect(value === 'gas_anqp_feature').assertFalse();
      expect(value).assertEqual(value.trim());
    })

    /**
     * @tc.name   testWlanResourceRemain0003
     * @tc.number SUB_WLAN_RESOURCE_REMAIN_0003
     * @tc.desc   Load the WiFi Direct feature string resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResourceRemain0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: string = appContext.resourceManager.getStringByNameSync('wifi_direct');
      expect(value.length > 0).assertTrue();
      expect(value === 'wifi_direct').assertFalse();
      expect(value).assertEqual(value.trim());
    })

    /**
     * @tc.name   testWlanResourceRemain0004
     * @tc.number SUB_WLAN_RESOURCE_REMAIN_0004
     * @tc.desc   Load the Soft AP feature string resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResourceRemain0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: string = appContext.resourceManager.getStringByNameSync('soft_ap');
      expect(value.length > 0).assertTrue();
      expect(value === 'soft_ap').assertFalse();
      expect(value).assertEqual(value.trim());
    })

    /**
     * @tc.name   testWlanResourceRemain0005
     * @tc.number SUB_WLAN_RESOURCE_REMAIN_0005
     * @tc.desc   Load the GET_WIFI_INFO reason string resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResourceRemain0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: string = appContext.resourceManager.getStringByNameSync('GET_WIFI_INFO');
      expect(value.length > 0).assertTrue();
      expect(value === 'GET_WIFI_INFO').assertFalse();
      expect(value).assertEqual(value.trim());
    })

    /**
     * @tc.name   testWlanResourceRemain0006
     * @tc.number SUB_WLAN_RESOURCE_REMAIN_0006
     * @tc.desc   Load the SET_WIFI_INFO reason string resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResourceRemain0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: string = appContext.resourceManager.getStringByNameSync('SET_WIFI_INFO');
      expect(value.length > 0).assertTrue();
      expect(value === 'SET_WIFI_INFO').assertFalse();
      expect(value).assertEqual(value.trim());
    })

    /**
     * @tc.name   testWlanResourceRemain0007
     * @tc.number SUB_WLAN_RESOURCE_REMAIN_0007
     * @tc.desc   Load the manage connection reason string resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResourceRemain0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: string = appContext.resourceManager.getStringByNameSync('MANAGE_WIFI_CONNECTION');
      expect(value.length > 0).assertTrue();
      expect(value === 'MANAGE_WIFI_CONNECTION').assertFalse();
      expect(value).assertEqual(value.trim());
    })

    /**
     * @tc.name   testWlanResourceRemain0008
     * @tc.number SUB_WLAN_RESOURCE_REMAIN_0008
     * @tc.desc   Load the manage hotspot reason string resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResourceRemain0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: string = appContext.resourceManager.getStringByNameSync('MANAGE_WIFI_HOTSPOT');
      expect(value.length > 0).assertTrue();
      expect(value === 'MANAGE_WIFI_HOTSPOT').assertFalse();
      expect(value).assertEqual(value.trim());
    })

    /**
     * @tc.name   testWlanResourceRemain0009
     * @tc.number SUB_WLAN_RESOURCE_REMAIN_0009
     * @tc.desc   Load the location permission reason string resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResourceRemain0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: string = appContext.resourceManager.getStringByNameSync('location_permission');
      expect(value.length > 0).assertTrue();
      expect(value === 'location_permission').assertFalse();
      expect(value).assertEqual(value.trim());
    })

    /**
     * @tc.name   testWlanResourceRemain0010
     * @tc.number SUB_WLAN_RESOURCE_REMAIN_0010
     * @tc.desc   Load the approximately location permission reason string resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResourceRemain0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: string = appContext.resourceManager.getStringByNameSync('approximately_location_permission');
      expect(value.length > 0).assertTrue();
      expect(value === 'approximately_location_permission').assertFalse();
      expect(value).assertEqual(value.trim());
    })
  })
}
