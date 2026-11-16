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
function info(index: number): wifi.WifiScanInfo {
  return { ssid: `Wlan-${index}`, bssid: '00:11:22:33:44:55', bssidType: wifi.DeviceAddressType.REAL_DEVICE_ADDRESS, capabilities: 'ESS', securityType: wifi.WifiSecurityType.WIFI_SEC_TYPE_PSK, rssi: -40, band: 2, frequency: 2412, channelWidth: 20, centerFrequency0: 2412, centerFrequency1: 0, infoElems: [], timestamp: index, supportedWifiCategory: wifi.WifiCategory.DEFAULT, isHiLinkNetwork: false };
}

export default function wlanDataSourceEdgeTest() {
  describe('WlanDataSourceEdgeTest', () => {

    /**
     * @tc.name   testWlanDataEdgeEmpty0001
     * @tc.number SUB_WLAN_DATA_EDGE_0001
     * @tc.desc   Read invalid indexes from an empty data source.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanDataEdgeEmpty0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      expect(source.getData(-1) === undefined).assertTrue();
      expect(source.getData(0) === undefined).assertTrue();
      expect(source.getData(99) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanDataEdgeAddEmpty0002
     * @tc.number SUB_WLAN_DATA_EDGE_0002
     * @tc.desc   Insert into an empty data source at index zero.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanDataEdgeAddEmpty0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      source.addData(0, info(1));
      expect(source.totalCount()).assertEqual(1);
      expect(source.getData(0).ssid).assertEqual('Wlan-1');
      expect(source.getData(1) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanDataEdgeAddPastEnd0003
     * @tc.number SUB_WLAN_DATA_EDGE_0003
     * @tc.desc   Insert past the end of an empty data source.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanDataEdgeAddPastEnd0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      source.addData(5, info(2));
      expect(source.totalCount()).assertEqual(1);
      expect(source.getData(0).ssid).assertEqual('Wlan-2');
      expect(source.getData(0).timestamp).assertEqual(2);
    })

    /**
     * @tc.name   testWlanDataEdgeDuplicate0004
     * @tc.number SUB_WLAN_DATA_EDGE_0004
     * @tc.desc   Push the same scan result twice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanDataEdgeDuplicate0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      const item: wifi.WifiScanInfo = info(3);
      source.pushData(item);
      source.pushData(item);
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(0).ssid).assertEqual('Wlan-3');
      expect(source.getData(1).ssid).assertEqual('Wlan-3');
    })

    /**
     * @tc.name   testWlanDataEdgeAppend0005
     * @tc.number SUB_WLAN_DATA_EDGE_0005
     * @tc.desc   Append using the current length as index.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanDataEdgeAppend0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      source.pushData(info(1));
      source.addData(source.totalCount(), info(2));
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(0).ssid).assertEqual('Wlan-1');
      expect(source.getData(1).ssid).assertEqual('Wlan-2');
    })

    /**
     * @tc.name   testWlanDataEdgePush0006
     * @tc.number SUB_WLAN_DATA_EDGE_0006
     * @tc.desc   Push and read 6 scan results.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanDataEdgePush0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 6; index++) {
        source.pushData(info(index));
      }
      expect(source.totalCount()).assertEqual(6);
      expect(source.getData(0).timestamp).assertEqual(0);
      expect(source.getData(5).timestamp).assertEqual(5);
      expect(source.getData(6) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanDataEdgePush0007
     * @tc.number SUB_WLAN_DATA_EDGE_0007
     * @tc.desc   Push and read 7 scan results.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanDataEdgePush0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 7; index++) {
        source.pushData(info(index));
      }
      expect(source.totalCount()).assertEqual(7);
      expect(source.getData(0).timestamp).assertEqual(0);
      expect(source.getData(6).timestamp).assertEqual(6);
      expect(source.getData(7) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanDataEdgePush0008
     * @tc.number SUB_WLAN_DATA_EDGE_0008
     * @tc.desc   Push and read 8 scan results.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanDataEdgePush0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 8; index++) {
        source.pushData(info(index));
      }
      expect(source.totalCount()).assertEqual(8);
      expect(source.getData(0).timestamp).assertEqual(0);
      expect(source.getData(7).timestamp).assertEqual(7);
      expect(source.getData(8) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanDataEdgePush0009
     * @tc.number SUB_WLAN_DATA_EDGE_0009
     * @tc.desc   Push and read 9 scan results.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanDataEdgePush0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 9; index++) {
        source.pushData(info(index));
      }
      expect(source.totalCount()).assertEqual(9);
      expect(source.getData(0).timestamp).assertEqual(0);
      expect(source.getData(8).timestamp).assertEqual(8);
      expect(source.getData(9) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanDataEdgePush0010
     * @tc.number SUB_WLAN_DATA_EDGE_0010
     * @tc.desc   Push and read 10 scan results.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanDataEdgePush0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 10; index++) {
        source.pushData(info(index));
      }
      expect(source.totalCount()).assertEqual(10);
      expect(source.getData(0).timestamp).assertEqual(0);
      expect(source.getData(9).timestamp).assertEqual(9);
      expect(source.getData(10) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanDataEdgePush0011
     * @tc.number SUB_WLAN_DATA_EDGE_0011
     * @tc.desc   Push and read 11 scan results.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanDataEdgePush0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 11; index++) {
        source.pushData(info(index));
      }
      expect(source.totalCount()).assertEqual(11);
      expect(source.getData(0).timestamp).assertEqual(0);
      expect(source.getData(10).timestamp).assertEqual(10);
      expect(source.getData(11) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanDataEdgePush0012
     * @tc.number SUB_WLAN_DATA_EDGE_0012
     * @tc.desc   Push and read 12 scan results.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanDataEdgePush0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 12; index++) {
        source.pushData(info(index));
      }
      expect(source.totalCount()).assertEqual(12);
      expect(source.getData(0).timestamp).assertEqual(0);
      expect(source.getData(11).timestamp).assertEqual(11);
      expect(source.getData(12) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanDataEdgePush0013
     * @tc.number SUB_WLAN_DATA_EDGE_0013
     * @tc.desc   Push and read 13 scan results.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanDataEdgePush0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 13; index++) {
        source.pushData(info(index));
      }
      expect(source.totalCount()).assertEqual(13);
      expect(source.getData(0).timestamp).assertEqual(0);
      expect(source.getData(12).timestamp).assertEqual(12);
      expect(source.getData(13) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanDataEdgePush0014
     * @tc.number SUB_WLAN_DATA_EDGE_0014
     * @tc.desc   Push and read 14 scan results.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanDataEdgePush0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 14; index++) {
        source.pushData(info(index));
      }
      expect(source.totalCount()).assertEqual(14);
      expect(source.getData(0).timestamp).assertEqual(0);
      expect(source.getData(13).timestamp).assertEqual(13);
      expect(source.getData(14) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanDataEdgePush0015
     * @tc.number SUB_WLAN_DATA_EDGE_0015
     * @tc.desc   Push and read 15 scan results.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanDataEdgePush0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 15; index++) {
        source.pushData(info(index));
      }
      expect(source.totalCount()).assertEqual(15);
      expect(source.getData(0).timestamp).assertEqual(0);
      expect(source.getData(14).timestamp).assertEqual(14);
      expect(source.getData(15) === undefined).assertTrue();
    })
  })
}
