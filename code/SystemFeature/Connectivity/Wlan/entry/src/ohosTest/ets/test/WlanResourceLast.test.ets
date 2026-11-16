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

export default function wlanResourceLastTest() {
  describe('WlanResourceLastTest', () => {

    /**
     * @tc.name   testWlanResourceLast0001
     * @tc.number SUB_WLAN_RESOURCE_LAST_0001
     * @tc.desc   Load the internal info reason resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResourceLast0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: string = appContext.resourceManager.getStringByNameSync('GET_WIFI_INFO_INTERNAL');
      expect(value.length > 0).assertTrue();
      expect(value === 'GET_WIFI_INFO_INTERNAL').assertFalse();
      expect(value).assertEqual(value.trim());
    })

    /**
     * @tc.name   testWlanResourceLast0002
     * @tc.number SUB_WLAN_RESOURCE_LAST_0002
     * @tc.desc   Load the peers MAC reason resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResourceLast0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: string = appContext.resourceManager.getStringByNameSync('GET_WIFI_PEERS_MAC');
      expect(value.length > 0).assertTrue();
      expect(value === 'GET_WIFI_PEERS_MAC').assertFalse();
      expect(value).assertEqual(value.trim());
    })

    /**
     * @tc.name   testWlanResourceLast0003
     * @tc.number SUB_WLAN_RESOURCE_LAST_0003
     * @tc.desc   Load the local MAC reason resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResourceLast0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: string = appContext.resourceManager.getStringByNameSync('GET_WIFI_LOCAL_MAC');
      expect(value.length > 0).assertTrue();
      expect(value === 'GET_WIFI_LOCAL_MAC').assertFalse();
      expect(value).assertEqual(value.trim());
    })

    /**
     * @tc.name   testWlanResourceLast0004
     * @tc.number SUB_WLAN_RESOURCE_LAST_0004
     * @tc.desc   Load the Wi-Fi config reason resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResourceLast0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: string = appContext.resourceManager.getStringByNameSync('GET_WIFI_CONFIG');
      expect(value.length > 0).assertTrue();
      expect(value === 'GET_WIFI_CONFIG').assertFalse();
      expect(value).assertEqual(value.trim());
    })

    /**
     * @tc.name   testWlanResourceLast0005
     * @tc.number SUB_WLAN_RESOURCE_LAST_0005
     * @tc.desc   Load the set config reason resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResourceLast0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: string = appContext.resourceManager.getStringByNameSync('SET_WIFI_CONFIG');
      expect(value.length > 0).assertTrue();
      expect(value === 'SET_WIFI_CONFIG').assertFalse();
      expect(value).assertEqual(value.trim());
    })

    /**
     * @tc.name   testWlanResourceLast0006
     * @tc.number SUB_WLAN_RESOURCE_LAST_0006
     * @tc.desc   Load the main ability description resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResourceLast0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: string = appContext.resourceManager.getStringByNameSync('description_mainability');
      expect(value.length > 0).assertTrue();
      expect(value === 'description_mainability').assertFalse();
      expect(value).assertEqual(value.trim());
    })
  })
}
