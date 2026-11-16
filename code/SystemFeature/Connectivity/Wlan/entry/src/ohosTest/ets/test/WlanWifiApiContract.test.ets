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
import wifi from '@ohos.wifiManager';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function wlanWifiApiContractTest() {
  describe('WlanWifiApiContractTest', () => {

    /**
     * @tc.name   testWlanWifiScanApi0001
     * @tc.number SUB_WLAN_WIFI_API_0001
     * @tc.desc   Verify scan and result APIs are exported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanWifiScanApi0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanWifiScanApi0001 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof wifi.scan === \'function\').assertTrue();');
      expect(typeof wifi.scan === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof wifi.getScanResults === \'function\').assertTrue();');
      expect(typeof wifi.getScanResults === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof wifi.getScanInfoList === \'function\').assertTrue();');
      expect(typeof wifi.getScanInfoList === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanWifiScanApi0001 end');
    })

    /**
     * @tc.name   testWlanWifiConnectApi0002
     * @tc.number SUB_WLAN_WIFI_API_0002
     * @tc.desc   Verify connection and config APIs are exported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanWifiConnectApi0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanWifiConnectApi0002 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof wifi.getLinkedInfo === \'function\').assertTrue();');
      expect(typeof wifi.getLinkedInfo === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof wifi.addDeviceConfig === \'function\').assertTrue();');
      expect(typeof wifi.addDeviceConfig === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof wifi.disconnect === \'function\').assertTrue();');
      expect(typeof wifi.disconnect === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanWifiConnectApi0002 end');
    })

    /**
     * @tc.name   testWlanWifiInfoApi0003
     * @tc.number SUB_WLAN_WIFI_API_0003
     * @tc.desc   Verify address and link information APIs are exported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanWifiInfoApi0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanWifiInfoApi0003 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof wifi.getIpInfo === \'function\').assertTrue();');
      expect(typeof wifi.getIpInfo === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof wifi.getLinkedInfo === \'function\').assertTrue();');
      expect(typeof wifi.getLinkedInfo === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof wifi.getCountryCode === \'function\').assertTrue();');
      expect(typeof wifi.getCountryCode === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanWifiInfoApi0003 end');
    })

    /**
     * @tc.name   testWlanWifiControlApi0004
     * @tc.number SUB_WLAN_WIFI_API_0004
     * @tc.desc   Verify Wi-Fi control APIs are exported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanWifiControlApi0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanWifiControlApi0004 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof wifi.enableWifi === \'function\').assertTrue();');
      expect(typeof wifi.enableWifi === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof wifi.disableWifi === \'function\').assertTrue();');
      expect(typeof wifi.disableWifi === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof wifi.isWifiActive === \'function\').assertTrue();');
      expect(typeof wifi.isWifiActive === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanWifiControlApi0004 end');
    })

    /**
     * @tc.name   testWlanWifiFeatureApi0005
     * @tc.number SUB_WLAN_WIFI_API_0005
     * @tc.desc   Verify feature query API is exported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanWifiFeatureApi0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanWifiFeatureApi0005 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof wifi.isFeatureSupported === \'function\').assertTrue();');
      expect(typeof wifi.isFeatureSupported === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof wifi.getSignalLevel === \'function\').assertTrue();');
      expect(typeof wifi.getSignalLevel === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof wifi.isWifiActive === \'function\').assertTrue();');
      expect(typeof wifi.isWifiActive === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanWifiFeatureApi0005 end');
    })

    /**
     * @tc.name   testWlanWifiEventApi0006
     * @tc.number SUB_WLAN_WIFI_API_0006
     * @tc.desc   Verify Wi-Fi event subscription APIs are exported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanWifiEventApi0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanWifiEventApi0006 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof wifi.on === \'function\').assertTrue();');
      expect(typeof wifi.on === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof wifi.off === \'function\').assertTrue();');
      expect(typeof wifi.off === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof wifi.getP2pLinkedInfo === \'function\').assertTrue();');
      expect(typeof wifi.getP2pLinkedInfo === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanWifiEventApi0006 end');
    })

    /**
     * @tc.name   testWlanWifiSecurityEnum0007
     * @tc.number SUB_WLAN_WIFI_API_0007
     * @tc.desc   Verify Wi-Fi security enum values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanWifiSecurityEnum0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanWifiSecurityEnum0007 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(wifi.WifiSecurityType.WIFI_SEC_TYPE_INVALID).assertEqual(0);');
      expect(wifi.WifiSecurityType.WIFI_SEC_TYPE_INVALID).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(wifi.WifiSecurityType.WIFI_SEC_TYPE_OPEN).assertEqual(1);');
      expect(wifi.WifiSecurityType.WIFI_SEC_TYPE_OPEN).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(wifi.WifiSecurityType.WIFI_SEC_TYPE_PSK).assertEqual(3);');
      expect(wifi.WifiSecurityType.WIFI_SEC_TYPE_PSK).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanWifiSecurityEnum0007 end');
    })

    /**
     * @tc.name   testWlanWifiCategoryEnum0008
     * @tc.number SUB_WLAN_WIFI_API_0008
     * @tc.desc   Verify Wi-Fi category enum values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanWifiCategoryEnum0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanWifiCategoryEnum0008 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(wifi.WifiCategory.DEFAULT).assertEqual(1);');
      expect(wifi.WifiCategory.DEFAULT).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(wifi.WifiCategory.WIFI6).assertEqual(2);');
      expect(wifi.WifiCategory.WIFI6).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(wifi.WifiCategory.WIFI6_PLUS).assertEqual(3);');
      expect(wifi.WifiCategory.WIFI6_PLUS).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanWifiCategoryEnum0008 end');
    })
  })
}
