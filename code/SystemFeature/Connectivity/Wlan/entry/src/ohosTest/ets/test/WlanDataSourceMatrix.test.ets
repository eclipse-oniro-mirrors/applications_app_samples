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
function makeInfo(index: number): wifi.WifiScanInfo {
  return { ssid: `Wlan-${index}`, bssid: '00:11:22:33:44:55', bssidType: wifi.DeviceAddressType.REAL_DEVICE_ADDRESS, capabilities: 'ESS', securityType: wifi.WifiSecurityType.WIFI_SEC_TYPE_PSK, rssi: -40 - index, band: 2, frequency: 2412, channelWidth: 20, centerFrequency0: 2412, centerFrequency1: 0, infoElems: [], timestamp: 1000 + index, supportedWifiCategory: wifi.WifiCategory.DEFAULT, isHiLinkNetwork: false };
}

export default function wlanDataSourceMatrixTest() {
  describe('WlanDataSourceMatrixTest', () => {

    /**
     * @tc.name   testWlanMatrixData0001
     * @tc.number SUB_WLAN_MATRIX_DATA_0001
     * @tc.desc   Wlan data source size 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanMatrixData0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 1; index++) { source.pushData(makeInfo(index)); }
      expect(source.totalCount()).assertEqual(1);
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      expect(source.getData(0).timestamp).assertEqual(1000);
      expect(source.getData(1) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanMatrixData0002
     * @tc.number SUB_WLAN_MATRIX_DATA_0002
     * @tc.desc   Wlan data source size 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanMatrixData0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 2; index++) { source.pushData(makeInfo(index)); }
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      expect(source.getData(1).timestamp).assertEqual(1001);
      expect(source.getData(2) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanMatrixData0003
     * @tc.number SUB_WLAN_MATRIX_DATA_0003
     * @tc.desc   Wlan data source size 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanMatrixData0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 3; index++) { source.pushData(makeInfo(index)); }
      expect(source.totalCount()).assertEqual(3);
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      expect(source.getData(2).timestamp).assertEqual(1002);
      expect(source.getData(3) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanMatrixData0004
     * @tc.number SUB_WLAN_MATRIX_DATA_0004
     * @tc.desc   Wlan data source size 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanMatrixData0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 4; index++) { source.pushData(makeInfo(index)); }
      expect(source.totalCount()).assertEqual(4);
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      expect(source.getData(3).timestamp).assertEqual(1003);
      expect(source.getData(4) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanMatrixData0005
     * @tc.number SUB_WLAN_MATRIX_DATA_0005
     * @tc.desc   Wlan data source size 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanMatrixData0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 5; index++) { source.pushData(makeInfo(index)); }
      expect(source.totalCount()).assertEqual(5);
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      expect(source.getData(4).timestamp).assertEqual(1004);
      expect(source.getData(5) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanMatrixData0006
     * @tc.number SUB_WLAN_MATRIX_DATA_0006
     * @tc.desc   Wlan data source size 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanMatrixData0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 6; index++) { source.pushData(makeInfo(index)); }
      expect(source.totalCount()).assertEqual(6);
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      expect(source.getData(5).timestamp).assertEqual(1005);
      expect(source.getData(6) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanMatrixData0007
     * @tc.number SUB_WLAN_MATRIX_DATA_0007
     * @tc.desc   Wlan data source size 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanMatrixData0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 7; index++) { source.pushData(makeInfo(index)); }
      expect(source.totalCount()).assertEqual(7);
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      expect(source.getData(6).timestamp).assertEqual(1006);
      expect(source.getData(7) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanMatrixData0008
     * @tc.number SUB_WLAN_MATRIX_DATA_0008
     * @tc.desc   Wlan data source size 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanMatrixData0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 8; index++) { source.pushData(makeInfo(index)); }
      expect(source.totalCount()).assertEqual(8);
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      expect(source.getData(7).timestamp).assertEqual(1007);
      expect(source.getData(8) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanMatrixData0009
     * @tc.number SUB_WLAN_MATRIX_DATA_0009
     * @tc.desc   Wlan data source size 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanMatrixData0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 9; index++) { source.pushData(makeInfo(index)); }
      expect(source.totalCount()).assertEqual(9);
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      expect(source.getData(8).timestamp).assertEqual(1008);
      expect(source.getData(9) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanMatrixData0010
     * @tc.number SUB_WLAN_MATRIX_DATA_0010
     * @tc.desc   Wlan data source size 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanMatrixData0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 10; index++) { source.pushData(makeInfo(index)); }
      expect(source.totalCount()).assertEqual(10);
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      expect(source.getData(9).timestamp).assertEqual(1009);
      expect(source.getData(10) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanMatrixData0011
     * @tc.number SUB_WLAN_MATRIX_DATA_0011
     * @tc.desc   Wlan data source size 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanMatrixData0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 11; index++) { source.pushData(makeInfo(index)); }
      expect(source.totalCount()).assertEqual(11);
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      expect(source.getData(10).timestamp).assertEqual(1010);
      expect(source.getData(11) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanMatrixData0012
     * @tc.number SUB_WLAN_MATRIX_DATA_0012
     * @tc.desc   Wlan data source size 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanMatrixData0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 12; index++) { source.pushData(makeInfo(index)); }
      expect(source.totalCount()).assertEqual(12);
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      expect(source.getData(11).timestamp).assertEqual(1011);
      expect(source.getData(12) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanMatrixData0013
     * @tc.number SUB_WLAN_MATRIX_DATA_0013
     * @tc.desc   Wlan data source size 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanMatrixData0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 13; index++) { source.pushData(makeInfo(index)); }
      expect(source.totalCount()).assertEqual(13);
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      expect(source.getData(12).timestamp).assertEqual(1012);
      expect(source.getData(13) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanMatrixData0014
     * @tc.number SUB_WLAN_MATRIX_DATA_0014
     * @tc.desc   Wlan data source size 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanMatrixData0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 14; index++) { source.pushData(makeInfo(index)); }
      expect(source.totalCount()).assertEqual(14);
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      expect(source.getData(13).timestamp).assertEqual(1013);
      expect(source.getData(14) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanMatrixData0015
     * @tc.number SUB_WLAN_MATRIX_DATA_0015
     * @tc.desc   Wlan data source size 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanMatrixData0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 15; index++) { source.pushData(makeInfo(index)); }
      expect(source.totalCount()).assertEqual(15);
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      expect(source.getData(14).timestamp).assertEqual(1014);
      expect(source.getData(15) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanMatrixData0016
     * @tc.number SUB_WLAN_MATRIX_DATA_0016
     * @tc.desc   Wlan data source size 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanMatrixData0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 16; index++) { source.pushData(makeInfo(index)); }
      expect(source.totalCount()).assertEqual(16);
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      expect(source.getData(15).timestamp).assertEqual(1015);
      expect(source.getData(16) === undefined).assertTrue();
    })
  })
}
