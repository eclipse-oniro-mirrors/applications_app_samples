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
import wifi from '@ohos.wifiManager';
import WifiDataSource from '../../../../src/main/ets/component/BasicDataSource';
function item(index: number): wifi.WifiScanInfo {
  return { ssid: `Wlan-${index}`, bssid: '00:11:22:33:44:55', bssidType: wifi.DeviceAddressType.REAL_DEVICE_ADDRESS, capabilities: 'ESS', securityType: wifi.WifiSecurityType.WIFI_SEC_TYPE_PSK, rssi: -40, band: 2, frequency: 2412, channelWidth: 20, centerFrequency0: 2412, centerFrequency1: 0, infoElems: [], timestamp: index, supportedWifiCategory: wifi.WifiCategory.DEFAULT, isHiLinkNetwork: false };
}
class EdgeListener implements DataChangeListener {
  count: number = 0;
  onDataReloaded(): void { this.count++; }
  onDataAdded(index: number): void { this.count++; }
  onDataAdd(index: number): void { this.count++; }
  onDataMoved(from: number, to: number): void { this.count++; }
  onDataMove(from: number, to: number): void { this.count++; }
  onDataDeleted(index: number): void { this.count++; }
  onDataDelete(index: number): void { this.count++; }
  onDataChanged(index: number): void { this.count++; }
  onDataChange(index: number): void { this.count++; }
  onDatasetChange(dataOperations: DataOperation[]): void { this.count++; }
}

export default function wlanDataSourceEdge2Test() {
  describe('WlanDataSourceEdge2Test', () => {

    /**
     * @tc.name   testWlanDataEdgeNegative0001
     * @tc.number SUB_WLAN_DATA_EDGE2_0001
     * @tc.desc   Insert at a negative index into an empty source.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanDataEdgeNegative0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      source.addData(-1, item(1));
      expect(source.totalCount()).assertEqual(1);
      expect(source.getData(0).ssid).assertEqual('Wlan-1');
    })

    /**
     * @tc.name   testWlanDataEdgeBeyond0002
     * @tc.number SUB_WLAN_DATA_EDGE2_0002
     * @tc.desc   Insert far beyond the current source length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanDataEdgeBeyond0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      source.pushData(item(1));
      source.pushData(item(2));
      source.addData(100, item(3));
      expect(source.totalCount()).assertEqual(3);
      expect(source.getData(2).ssid).assertEqual('Wlan-3');
    })

    /**
     * @tc.name   testWlanDataEdgeDoubleRemove0003
     * @tc.number SUB_WLAN_DATA_EDGE2_0003
     * @tc.desc   Unregister the same listener twice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanDataEdgeDoubleRemove0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      const listener: EdgeListener = new EdgeListener();
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.notifyDataReload();
      expect(listener.count).assertEqual(0);
    })

    /**
     * @tc.name   testWlanDataEdgeReRegister0004
     * @tc.number SUB_WLAN_DATA_EDGE2_0004
     * @tc.desc   Re-register a listener after unregistering it.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanDataEdgeReRegister0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      const listener: EdgeListener = new EdgeListener();
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      expect(listener.count).assertEqual(1);
    })
  })
}
