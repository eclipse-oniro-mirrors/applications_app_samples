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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { common } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';
let appContext: common.Context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();

export default function wlanResourceLastTest() {
  describe('WlanResourceLastTest', () => {

    /**
     * @tc.name   ohos.samples.wlan_ResourceLast_0001
     * @tc.number SUB_WLAN_RESOURCE_LAST_0001
     * @tc.desc   Load the internal info reason resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ResourceLast_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceLast_0001 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('GET_WIFI_INFO_INTERNAL');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value.length > 0));
      expect(value.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value === 'GET_WIFI_INFO_INTERNAL'));
      expect(value === 'GET_WIFI_INFO_INTERNAL').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(value), String(value.trim()));
      expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceLast_0001 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ResourceLast_0002
     * @tc.number SUB_WLAN_RESOURCE_LAST_0002
     * @tc.desc   Load the peers MAC reason resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ResourceLast_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceLast_0002 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('GET_WIFI_PEERS_MAC');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value.length > 0));
      expect(value.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value === 'GET_WIFI_PEERS_MAC'));
      expect(value === 'GET_WIFI_PEERS_MAC').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(value), String(value.trim()));
      expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceLast_0002 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ResourceLast_0003
     * @tc.number SUB_WLAN_RESOURCE_LAST_0003
     * @tc.desc   Load the local MAC reason resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ResourceLast_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceLast_0003 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('GET_WIFI_LOCAL_MAC');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value.length > 0));
      expect(value.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value === 'GET_WIFI_LOCAL_MAC'));
      expect(value === 'GET_WIFI_LOCAL_MAC').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(value), String(value.trim()));
      expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceLast_0003 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ResourceLast_0004
     * @tc.number SUB_WLAN_RESOURCE_LAST_0004
     * @tc.desc   Load the Wi-Fi config reason resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ResourceLast_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceLast_0004 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('GET_WIFI_CONFIG');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value.length > 0));
      expect(value.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value === 'GET_WIFI_CONFIG'));
      expect(value === 'GET_WIFI_CONFIG').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(value), String(value.trim()));
      expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceLast_0004 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ResourceLast_0005
     * @tc.number SUB_WLAN_RESOURCE_LAST_0005
     * @tc.desc   Load the set config reason resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ResourceLast_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceLast_0005 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('SET_WIFI_CONFIG');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value.length > 0));
      expect(value.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value === 'SET_WIFI_CONFIG'));
      expect(value === 'SET_WIFI_CONFIG').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(value), String(value.trim()));
      expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceLast_0005 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ResourceLast_0006
     * @tc.number SUB_WLAN_RESOURCE_LAST_0006
     * @tc.desc   Load the main ability description resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ResourceLast_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceLast_0006 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('description_mainability');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value.length > 0));
      expect(value.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value === 'description_mainability'));
      expect(value === 'description_mainability').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(value), String(value.trim()));
      expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceLast_0006 end');
    })
  })
}
