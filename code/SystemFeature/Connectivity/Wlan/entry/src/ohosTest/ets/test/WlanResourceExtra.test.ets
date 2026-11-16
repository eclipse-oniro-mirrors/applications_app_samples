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

export default function wlanResourceExtraTest() {
  describe('WlanResourceExtraTest', () => {

    /**
     * @tc.name   ohos.samples.wlan_ResourceExtra_0001
     * @tc.number SUB_WLAN_RESOURCE_EXTRA_0001
     * @tc.desc   Load the gateway resource string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ResourceExtra_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceExtra_0001 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('gate_way');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value.length > 0));
      expect(value.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value === 'gate_way'));
      expect(value === 'gate_way').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(value), String(value.trim()));
      expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceExtra_0001 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ResourceExtra_0002
     * @tc.number SUB_WLAN_RESOURCE_EXTRA_0002
     * @tc.desc   Load the netmask resource string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ResourceExtra_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceExtra_0002 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('net_mask');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value.length > 0));
      expect(value.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value === 'net_mask'));
      expect(value === 'net_mask').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(value), String(value.trim()));
      expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceExtra_0002 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ResourceExtra_0003
     * @tc.number SUB_WLAN_RESOURCE_EXTRA_0003
     * @tc.desc   Load the primary DNS resource string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ResourceExtra_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceExtra_0003 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('primary_dns');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value.length > 0));
      expect(value.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value === 'primary_dns'));
      expect(value === 'primary_dns').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(value), String(value.trim()));
      expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceExtra_0003 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ResourceExtra_0004
     * @tc.number SUB_WLAN_RESOURCE_EXTRA_0004
     * @tc.desc   Load the second DNS resource string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ResourceExtra_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceExtra_0004 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('second_dns');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value.length > 0));
      expect(value.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value === 'second_dns'));
      expect(value === 'second_dns').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(value), String(value.trim()));
      expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceExtra_0004 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ResourceExtra_0005
     * @tc.number SUB_WLAN_RESOURCE_EXTRA_0005
     * @tc.desc   Load the server IP resource string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ResourceExtra_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceExtra_0005 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('server_ip');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value.length > 0));
      expect(value.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value === 'server_ip'));
      expect(value === 'server_ip').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(value), String(value.trim()));
      expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceExtra_0005 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ResourceExtra_0006
     * @tc.number SUB_WLAN_RESOURCE_EXTRA_0006
     * @tc.desc   Load the lease duration resource string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ResourceExtra_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceExtra_0006 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('lease_duration');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value.length > 0));
      expect(value.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value === 'lease_duration'));
      expect(value === 'lease_duration').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(value), String(value.trim()));
      expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceExtra_0006 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ResourceExtra_0007
     * @tc.number SUB_WLAN_RESOURCE_EXTRA_0007
     * @tc.desc   Load the infrastructure feature resource string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ResourceExtra_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceExtra_0007 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('infrastructure_feature');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value.length > 0));
      expect(value.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value === 'infrastructure_feature'));
      expect(value === 'infrastructure_feature').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(value), String(value.trim()));
      expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceExtra_0007 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_ResourceExtra_0008
     * @tc.number SUB_WLAN_RESOURCE_EXTRA_0008
     * @tc.desc   Load the WiFi Aware feature resource string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_ResourceExtra_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceExtra_0008 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('wifi_aware');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value.length > 0));
      expect(value.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value === 'wifi_aware'));
      expect(value === 'wifi_aware').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(value), String(value.trim()));
      expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_ResourceExtra_0008 end');
    })
  })
}
