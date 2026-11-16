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
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';
let appContext = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext();

export default function wlanResourceContractTest() {
  describe('WlanResourceContractTest', () => {

    /**
     * @tc.name   testWlanResource0001
     * @tc.number SUB_WLAN_RESOURCE_0001
     * @tc.desc   Load the WLAN title string resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResource0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanResource0001 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('wlan');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value.length > 0).assertTrue();');
      expect(value.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value).assertEqual(value.trim());');
      expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value === \'wlan\').assertFalse();');
      expect(value === 'wlan').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanResource0001 end');
    })

    /**
     * @tc.name   testWlanResource0002
     * @tc.number SUB_WLAN_RESOURCE_0002
     * @tc.desc   Load the available WLAN label string resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResource0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanResource0002 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('available_wlan');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value.length > 0).assertTrue();');
      expect(value.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value).assertEqual(value.trim());');
      expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value === \'available_wlan\').assertFalse();');
      expect(value === 'available_wlan').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanResource0002 end');
    })

    /**
     * @tc.name   testWlanResource0003
     * @tc.number SUB_WLAN_RESOURCE_0003
     * @tc.desc   Load the connected label string resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResource0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanResource0003 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('connected');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value.length > 0).assertTrue();');
      expect(value.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value).assertEqual(value.trim());');
      expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value === \'connected\').assertFalse();');
      expect(value === 'connected').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanResource0003 end');
    })

    /**
     * @tc.name   testWlanResource0004
     * @tc.number SUB_WLAN_RESOURCE_0004
     * @tc.desc   Load the about title string resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResource0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanResource0004 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('about');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value.length > 0).assertTrue();');
      expect(value.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value).assertEqual(value.trim());');
      expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value === \'about\').assertFalse();');
      expect(value === 'about').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanResource0004 end');
    })

    /**
     * @tc.name   testWlanResource0005
     * @tc.number SUB_WLAN_RESOURCE_0005
     * @tc.desc   Load the IP address label string resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResource0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanResource0005 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('ip_address');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value.length > 0).assertTrue();');
      expect(value.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value).assertEqual(value.trim());');
      expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value === \'ip_address\').assertFalse();');
      expect(value === 'ip_address').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanResource0005 end');
    })

    /**
     * @tc.name   testWlanResource0006
     * @tc.number SUB_WLAN_RESOURCE_0006
     * @tc.desc   Load the country code label string resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanResource0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanResource0006 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('country_code');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value.length > 0).assertTrue();');
      expect(value.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value).assertEqual(value.trim());');
      expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value === \'country_code\').assertFalse();');
      expect(value === 'country_code').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanResource0006 end');
    })
  })
}
