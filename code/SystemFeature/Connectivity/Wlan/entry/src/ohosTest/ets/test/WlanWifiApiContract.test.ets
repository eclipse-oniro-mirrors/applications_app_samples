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
import { wifiManager as wifi } from '@kit.ConnectivityKit';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function wlanWifiApiContractTest() {
  describe('WlanWifiApiContractTest', () => {

    /**
     * @tc.name   ohos.samples.wlan_WifiApiContract_0001
     * @tc.number SUB_WLAN_WIFI_API_0001
     * @tc.desc   Verify scan and result APIs are exported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_WifiApiContract_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_WifiApiContract_0001 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof wifi.scan === 'function'));
      expect(typeof wifi.scan === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof wifi.getScanResults === 'function'));
      expect(typeof wifi.getScanResults === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof wifi.getScanInfoList === 'function'));
      expect(typeof wifi.getScanInfoList === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_WifiApiContract_0001 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_WifiApiContract_0002
     * @tc.number SUB_WLAN_WIFI_API_0002
     * @tc.desc   Verify connection and config APIs are exported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_WifiApiContract_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_WifiApiContract_0002 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof wifi.getLinkedInfo === 'function'));
      expect(typeof wifi.getLinkedInfo === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof wifi.addDeviceConfig === 'function'));
      expect(typeof wifi.addDeviceConfig === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof wifi.disconnect === 'function'));
      expect(typeof wifi.disconnect === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_WifiApiContract_0002 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_WifiApiContract_0003
     * @tc.number SUB_WLAN_WIFI_API_0003
     * @tc.desc   Verify address and link information APIs are exported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_WifiApiContract_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_WifiApiContract_0003 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof wifi.getIpInfo === 'function'));
      expect(typeof wifi.getIpInfo === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof wifi.getLinkedInfo === 'function'));
      expect(typeof wifi.getLinkedInfo === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof wifi.getCountryCode === 'function'));
      expect(typeof wifi.getCountryCode === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_WifiApiContract_0003 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_WifiApiContract_0004
     * @tc.number SUB_WLAN_WIFI_API_0004
     * @tc.desc   Verify Wi-Fi control APIs are exported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_WifiApiContract_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_WifiApiContract_0004 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof wifi.enableWifi === 'function'));
      expect(typeof wifi.enableWifi === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof wifi.disableWifi === 'function'));
      expect(typeof wifi.disableWifi === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof wifi.isWifiActive === 'function'));
      expect(typeof wifi.isWifiActive === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_WifiApiContract_0004 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_WifiApiContract_0005
     * @tc.number SUB_WLAN_WIFI_API_0005
     * @tc.desc   Verify feature query API is exported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_WifiApiContract_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_WifiApiContract_0005 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof wifi.isFeatureSupported === 'function'));
      expect(typeof wifi.isFeatureSupported === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof wifi.getSignalLevel === 'function'));
      expect(typeof wifi.getSignalLevel === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof wifi.isWifiActive === 'function'));
      expect(typeof wifi.isWifiActive === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_WifiApiContract_0005 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_WifiApiContract_0006
     * @tc.number SUB_WLAN_WIFI_API_0006
     * @tc.desc   Verify Wi-Fi event subscription APIs are exported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_WifiApiContract_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_WifiApiContract_0006 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof wifi.on === 'function'));
      expect(typeof wifi.on === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof wifi.off === 'function'));
      expect(typeof wifi.off === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof wifi.getP2pLinkedInfo === 'function'));
      expect(typeof wifi.getP2pLinkedInfo === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_WifiApiContract_0006 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_WifiApiContract_0007
     * @tc.number SUB_WLAN_WIFI_API_0007
     * @tc.desc   Verify Wi-Fi security enum values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_WifiApiContract_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_WifiApiContract_0007 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(wifi.WifiSecurityType.WIFI_SEC_TYPE_INVALID), String(0));
      expect(wifi.WifiSecurityType.WIFI_SEC_TYPE_INVALID).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(wifi.WifiSecurityType.WIFI_SEC_TYPE_OPEN), String(1));
      expect(wifi.WifiSecurityType.WIFI_SEC_TYPE_OPEN).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(wifi.WifiSecurityType.WIFI_SEC_TYPE_PSK), String(3));
      expect(wifi.WifiSecurityType.WIFI_SEC_TYPE_PSK).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_WifiApiContract_0007 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_WifiApiContract_0008
     * @tc.number SUB_WLAN_WIFI_API_0008
     * @tc.desc   Verify Wi-Fi category enum values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_WifiApiContract_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_WifiApiContract_0008 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(wifi.WifiCategory.DEFAULT), String(1));
      expect(wifi.WifiCategory.DEFAULT).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(wifi.WifiCategory.WIFI6), String(2));
      expect(wifi.WifiCategory.WIFI6).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(wifi.WifiCategory.WIFI6_PLUS), String(3));
      expect(wifi.WifiCategory.WIFI6_PLUS).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_WifiApiContract_0008 end');
    })
  })
}
