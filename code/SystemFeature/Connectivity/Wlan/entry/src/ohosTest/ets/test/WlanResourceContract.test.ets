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

import { describe, it, expect, beforeAll, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { common, AbilityDelegatorRegistry } from '@kit.AbilityKit';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';
let appContext: common.Context = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext();

export default function wlanResourceContractTest() {
  describe('WlanResourceContractTest', () => {

    /**
     * @tc.name   ohos.samples.wlan_ResourceContract_0001
     * @tc.number SUB_WLAN_RESOURCE_0001
     * @tc.desc   Load the WLAN title string resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ResourceContract_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceContract_0001 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('wlan');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value.length > 0));
      expect(value.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(value), String(value.trim()));
      expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value === 'wlan'));
      expect(value === 'wlan').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceContract_0001 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ResourceContract_0002
     * @tc.number SUB_WLAN_RESOURCE_0002
     * @tc.desc   Load the available WLAN label string resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ResourceContract_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceContract_0002 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('available_wlan');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value.length > 0));
      expect(value.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(value), String(value.trim()));
      expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value === 'available_wlan'));
      expect(value === 'available_wlan').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceContract_0002 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ResourceContract_0003
     * @tc.number SUB_WLAN_RESOURCE_0003
     * @tc.desc   Load the connected label string resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ResourceContract_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceContract_0003 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('connected');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value.length > 0));
      expect(value.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(value), String(value.trim()));
      expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value === 'connected'));
      expect(value === 'connected').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceContract_0003 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ResourceContract_0004
     * @tc.number SUB_WLAN_RESOURCE_0004
     * @tc.desc   Load the about title string resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ResourceContract_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceContract_0004 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('about');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value.length > 0));
      expect(value.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(value), String(value.trim()));
      expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value === 'about'));
      expect(value === 'about').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceContract_0004 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ResourceContract_0005
     * @tc.number SUB_WLAN_RESOURCE_0005
     * @tc.desc   Load the IP address label string resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ResourceContract_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceContract_0005 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('ip_address');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value.length > 0));
      expect(value.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(value), String(value.trim()));
      expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value === 'ip_address'));
      expect(value === 'ip_address').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceContract_0005 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ResourceContract_0006
     * @tc.number SUB_WLAN_RESOURCE_0006
     * @tc.desc   Load the country code label string resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ResourceContract_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceContract_0006 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('country_code');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value.length > 0));
      expect(value.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(value), String(value.trim()));
      expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value === 'country_code'));
      expect(value === 'country_code').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceContract_0006 end');
    })
  })
}
