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
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanResourceExtra0001 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('gate_way');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value.length > 0).assertTrue();');
      expect(value.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value === \'gate_way\').assertFalse();');
      expect(value === 'gate_way').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value).assertEqual(value.trim());');
      expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanResourceExtra0001 end');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanResourceExtra0002 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('net_mask');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value.length > 0).assertTrue();');
      expect(value.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value === \'net_mask\').assertFalse();');
      expect(value === 'net_mask').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value).assertEqual(value.trim());');
      expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanResourceExtra0002 end');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanResourceExtra0003 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('primary_dns');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value.length > 0).assertTrue();');
      expect(value.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value === \'primary_dns\').assertFalse();');
      expect(value === 'primary_dns').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value).assertEqual(value.trim());');
      expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanResourceExtra0003 end');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanResourceExtra0004 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('second_dns');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value.length > 0).assertTrue();');
      expect(value.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value === \'second_dns\').assertFalse();');
      expect(value === 'second_dns').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value).assertEqual(value.trim());');
      expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanResourceExtra0004 end');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanResourceExtra0005 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('server_ip');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value.length > 0).assertTrue();');
      expect(value.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value === \'server_ip\').assertFalse();');
      expect(value === 'server_ip').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value).assertEqual(value.trim());');
      expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanResourceExtra0005 end');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanResourceExtra0006 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('lease_duration');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value.length > 0).assertTrue();');
      expect(value.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value === \'lease_duration\').assertFalse();');
      expect(value === 'lease_duration').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value).assertEqual(value.trim());');
      expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanResourceExtra0006 end');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanResourceExtra0007 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('infrastructure_feature');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value.length > 0).assertTrue();');
      expect(value.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value === \'infrastructure_feature\').assertFalse();');
      expect(value === 'infrastructure_feature').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value).assertEqual(value.trim());');
      expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanResourceExtra0007 end');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanResourceExtra0008 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('wifi_aware');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value.length > 0).assertTrue();');
      expect(value.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value === \'wifi_aware\').assertFalse();');
      expect(value === 'wifi_aware').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value).assertEqual(value.trim());');
      expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanResourceExtra0008 end');
    })
  })
}
