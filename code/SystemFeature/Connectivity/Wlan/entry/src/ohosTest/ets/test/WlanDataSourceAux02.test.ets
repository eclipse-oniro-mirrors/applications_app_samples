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

export default function wlanDataSourceAux02Test() {
  describe('WlanDataSourceAux02Test', () => {

    /**
     * @tc.name   testWlanAux020001
     * @tc.number SUB_WLAN_AUX_02_0001
     * @tc.desc   Wlan data auxiliary size 2-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux020001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 15; index++) { source.pushData(makeInfo(index)); }
      expect(source.totalCount()).assertEqual(15);
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      expect(source.getData(14).timestamp).assertEqual(1014);
      expect(source.getData(15) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanAux020002
     * @tc.number SUB_WLAN_AUX_02_0002
     * @tc.desc   Wlan data auxiliary size 2-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux020002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 16; index++) { source.pushData(makeInfo(index)); }
      expect(source.totalCount()).assertEqual(16);
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      expect(source.getData(15).timestamp).assertEqual(1015);
      expect(source.getData(16) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanAux020003
     * @tc.number SUB_WLAN_AUX_02_0003
     * @tc.desc   Wlan data auxiliary size 2-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux020003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 17; index++) { source.pushData(makeInfo(index)); }
      expect(source.totalCount()).assertEqual(17);
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      expect(source.getData(16).timestamp).assertEqual(1016);
      expect(source.getData(17) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanAux020004
     * @tc.number SUB_WLAN_AUX_02_0004
     * @tc.desc   Wlan data auxiliary size 2-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux020004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 18; index++) { source.pushData(makeInfo(index)); }
      expect(source.totalCount()).assertEqual(18);
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      expect(source.getData(17).timestamp).assertEqual(1017);
      expect(source.getData(18) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanAux020005
     * @tc.number SUB_WLAN_AUX_02_0005
     * @tc.desc   Wlan data auxiliary size 2-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux020005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 19; index++) { source.pushData(makeInfo(index)); }
      expect(source.totalCount()).assertEqual(19);
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      expect(source.getData(18).timestamp).assertEqual(1018);
      expect(source.getData(19) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanAux020006
     * @tc.number SUB_WLAN_AUX_02_0006
     * @tc.desc   Wlan data auxiliary size 2-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux020006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 20; index++) { source.pushData(makeInfo(index)); }
      expect(source.totalCount()).assertEqual(20);
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      expect(source.getData(19).timestamp).assertEqual(1019);
      expect(source.getData(20) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanAux020007
     * @tc.number SUB_WLAN_AUX_02_0007
     * @tc.desc   Wlan data auxiliary size 2-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux020007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 21; index++) { source.pushData(makeInfo(index)); }
      expect(source.totalCount()).assertEqual(21);
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      expect(source.getData(20).timestamp).assertEqual(1020);
      expect(source.getData(21) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanAux020008
     * @tc.number SUB_WLAN_AUX_02_0008
     * @tc.desc   Wlan data auxiliary size 2-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux020008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 22; index++) { source.pushData(makeInfo(index)); }
      expect(source.totalCount()).assertEqual(22);
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      expect(source.getData(21).timestamp).assertEqual(1021);
      expect(source.getData(22) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanAux020009
     * @tc.number SUB_WLAN_AUX_02_0009
     * @tc.desc   Wlan data auxiliary size 2-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux020009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 23; index++) { source.pushData(makeInfo(index)); }
      expect(source.totalCount()).assertEqual(23);
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      expect(source.getData(22).timestamp).assertEqual(1022);
      expect(source.getData(23) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanAux020010
     * @tc.number SUB_WLAN_AUX_02_0010
     * @tc.desc   Wlan data auxiliary size 2-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux020010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 24; index++) { source.pushData(makeInfo(index)); }
      expect(source.totalCount()).assertEqual(24);
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      expect(source.getData(23).timestamp).assertEqual(1023);
      expect(source.getData(24) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanAux020011
     * @tc.number SUB_WLAN_AUX_02_0011
     * @tc.desc   Wlan data auxiliary size 2-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux020011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 25; index++) { source.pushData(makeInfo(index)); }
      expect(source.totalCount()).assertEqual(25);
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      expect(source.getData(24).timestamp).assertEqual(1024);
      expect(source.getData(25) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanAux020012
     * @tc.number SUB_WLAN_AUX_02_0012
     * @tc.desc   Wlan data auxiliary size 2-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux020012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 26; index++) { source.pushData(makeInfo(index)); }
      expect(source.totalCount()).assertEqual(26);
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      expect(source.getData(25).timestamp).assertEqual(1025);
      expect(source.getData(26) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanAux020013
     * @tc.number SUB_WLAN_AUX_02_0013
     * @tc.desc   Wlan data auxiliary size 2-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux020013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 27; index++) { source.pushData(makeInfo(index)); }
      expect(source.totalCount()).assertEqual(27);
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      expect(source.getData(26).timestamp).assertEqual(1026);
      expect(source.getData(27) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanAux020014
     * @tc.number SUB_WLAN_AUX_02_0014
     * @tc.desc   Wlan data auxiliary size 2-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux020014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 28; index++) { source.pushData(makeInfo(index)); }
      expect(source.totalCount()).assertEqual(28);
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      expect(source.getData(27).timestamp).assertEqual(1027);
      expect(source.getData(28) === undefined).assertTrue();
    })
  })
}
