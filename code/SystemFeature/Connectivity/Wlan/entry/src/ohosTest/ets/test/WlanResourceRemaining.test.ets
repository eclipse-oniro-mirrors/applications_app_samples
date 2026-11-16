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
import { common, AbilityDelegatorRegistry } from '@kit.AbilityKit';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';
let appContext: common.Context = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext();

export default function wlanResourceRemainingTest() {
  describe('WlanResourceRemainingTest', () => {

    /**
     * @tc.name   ohos.samples.wlan_ResourceRemaining_0001
     * @tc.number SUB_WLAN_RESOURCE_REMAIN_0001
     * @tc.desc   Load the 5 GHz feature string resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ResourceRemaining_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceRemaining_0001 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('ghz_feature');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value.length > 0));
      expect(value.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value === 'ghz_feature'));
      expect(value === 'ghz_feature').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(value), String(value.trim()));
      expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceRemaining_0001 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ResourceRemaining_0002
     * @tc.number SUB_WLAN_RESOURCE_REMAIN_0002
     * @tc.desc   Load the GAS/ANQP feature string resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ResourceRemaining_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceRemaining_0002 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('gas_anqp_feature');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value.length > 0));
      expect(value.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value === 'gas_anqp_feature'));
      expect(value === 'gas_anqp_feature').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(value), String(value.trim()));
      expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceRemaining_0002 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ResourceRemaining_0003
     * @tc.number SUB_WLAN_RESOURCE_REMAIN_0003
     * @tc.desc   Load the WiFi Direct feature string resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ResourceRemaining_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceRemaining_0003 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('wifi_direct');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value.length > 0));
      expect(value.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value === 'wifi_direct'));
      expect(value === 'wifi_direct').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(value), String(value.trim()));
      expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceRemaining_0003 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ResourceRemaining_0004
     * @tc.number SUB_WLAN_RESOURCE_REMAIN_0004
     * @tc.desc   Load the Soft AP feature string resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ResourceRemaining_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceRemaining_0004 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('soft_ap');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value.length > 0));
      expect(value.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value === 'soft_ap'));
      expect(value === 'soft_ap').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(value), String(value.trim()));
      expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceRemaining_0004 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ResourceRemaining_0005
     * @tc.number SUB_WLAN_RESOURCE_REMAIN_0005
     * @tc.desc   Load the GET_WIFI_INFO reason string resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ResourceRemaining_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceRemaining_0005 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('GET_WIFI_INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value.length > 0));
      expect(value.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value === 'GET_WIFI_INFO'));
      expect(value === 'GET_WIFI_INFO').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(value), String(value.trim()));
      expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceRemaining_0005 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ResourceRemaining_0006
     * @tc.number SUB_WLAN_RESOURCE_REMAIN_0006
     * @tc.desc   Load the SET_WIFI_INFO reason string resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ResourceRemaining_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceRemaining_0006 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('SET_WIFI_INFO');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value.length > 0));
      expect(value.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value === 'SET_WIFI_INFO'));
      expect(value === 'SET_WIFI_INFO').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(value), String(value.trim()));
      expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceRemaining_0006 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ResourceRemaining_0007
     * @tc.number SUB_WLAN_RESOURCE_REMAIN_0007
     * @tc.desc   Load the manage connection reason string resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ResourceRemaining_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceRemaining_0007 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('MANAGE_WIFI_CONNECTION');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value.length > 0));
      expect(value.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value === 'MANAGE_WIFI_CONNECTION'));
      expect(value === 'MANAGE_WIFI_CONNECTION').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(value), String(value.trim()));
      expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceRemaining_0007 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ResourceRemaining_0008
     * @tc.number SUB_WLAN_RESOURCE_REMAIN_0008
     * @tc.desc   Load the manage hotspot reason string resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ResourceRemaining_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceRemaining_0008 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('MANAGE_WIFI_HOTSPOT');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value.length > 0));
      expect(value.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value === 'MANAGE_WIFI_HOTSPOT'));
      expect(value === 'MANAGE_WIFI_HOTSPOT').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(value), String(value.trim()));
      expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceRemaining_0008 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ResourceRemaining_0009
     * @tc.number SUB_WLAN_RESOURCE_REMAIN_0009
     * @tc.desc   Load the location permission reason string resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ResourceRemaining_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceRemaining_0009 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('location_permission');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value.length > 0));
      expect(value.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value === 'location_permission'));
      expect(value === 'location_permission').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(value), String(value.trim()));
      expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceRemaining_0009 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ResourceRemaining_0010
     * @tc.number SUB_WLAN_RESOURCE_REMAIN_0010
     * @tc.desc   Load the approximately location permission reason string resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ResourceRemaining_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceRemaining_0010 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('approximately_location_permission');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value.length > 0));
      expect(value.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value === 'approximately_location_permission'));
      expect(value === 'approximately_location_permission').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(value), String(value.trim()));
      expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceRemaining_0010 end');
    })
  })
}
