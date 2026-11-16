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

export default function wlanDataSourceAux04Test() {
  describe('WlanDataSourceAux04Test', () => {

    /**
     * @tc.name   testWlanAux040001
     * @tc.number SUB_WLAN_AUX_04_0001
     * @tc.desc   Wlan data auxiliary size 4-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux040001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 43; index++) { source.pushData(makeInfo(index)); }
      expect(source.totalCount()).assertEqual(43);
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      expect(source.getData(42).timestamp).assertEqual(1042);
      expect(source.getData(43) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanAux040002
     * @tc.number SUB_WLAN_AUX_04_0002
     * @tc.desc   Wlan data auxiliary size 4-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux040002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 44; index++) { source.pushData(makeInfo(index)); }
      expect(source.totalCount()).assertEqual(44);
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      expect(source.getData(43).timestamp).assertEqual(1043);
      expect(source.getData(44) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanAux040003
     * @tc.number SUB_WLAN_AUX_04_0003
     * @tc.desc   Wlan data auxiliary size 4-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux040003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 45; index++) { source.pushData(makeInfo(index)); }
      expect(source.totalCount()).assertEqual(45);
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      expect(source.getData(44).timestamp).assertEqual(1044);
      expect(source.getData(45) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanAux040004
     * @tc.number SUB_WLAN_AUX_04_0004
     * @tc.desc   Wlan data auxiliary size 4-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux040004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 46; index++) { source.pushData(makeInfo(index)); }
      expect(source.totalCount()).assertEqual(46);
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      expect(source.getData(45).timestamp).assertEqual(1045);
      expect(source.getData(46) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanAux040005
     * @tc.number SUB_WLAN_AUX_04_0005
     * @tc.desc   Wlan data auxiliary size 4-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux040005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 47; index++) { source.pushData(makeInfo(index)); }
      expect(source.totalCount()).assertEqual(47);
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      expect(source.getData(46).timestamp).assertEqual(1046);
      expect(source.getData(47) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanAux040006
     * @tc.number SUB_WLAN_AUX_04_0006
     * @tc.desc   Wlan data auxiliary size 4-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux040006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 48; index++) { source.pushData(makeInfo(index)); }
      expect(source.totalCount()).assertEqual(48);
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      expect(source.getData(47).timestamp).assertEqual(1047);
      expect(source.getData(48) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanAux040007
     * @tc.number SUB_WLAN_AUX_04_0007
     * @tc.desc   Wlan data auxiliary size 4-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux040007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 49; index++) { source.pushData(makeInfo(index)); }
      expect(source.totalCount()).assertEqual(49);
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      expect(source.getData(48).timestamp).assertEqual(1048);
      expect(source.getData(49) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanAux040008
     * @tc.number SUB_WLAN_AUX_04_0008
     * @tc.desc   Wlan data auxiliary size 4-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux040008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 50; index++) { source.pushData(makeInfo(index)); }
      expect(source.totalCount()).assertEqual(50);
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      expect(source.getData(49).timestamp).assertEqual(1049);
      expect(source.getData(50) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanAux040009
     * @tc.number SUB_WLAN_AUX_04_0009
     * @tc.desc   Wlan data auxiliary size 4-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux040009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 51; index++) { source.pushData(makeInfo(index)); }
      expect(source.totalCount()).assertEqual(51);
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      expect(source.getData(50).timestamp).assertEqual(1050);
      expect(source.getData(51) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanAux040010
     * @tc.number SUB_WLAN_AUX_04_0010
     * @tc.desc   Wlan data auxiliary size 4-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux040010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 52; index++) { source.pushData(makeInfo(index)); }
      expect(source.totalCount()).assertEqual(52);
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      expect(source.getData(51).timestamp).assertEqual(1051);
      expect(source.getData(52) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanAux040011
     * @tc.number SUB_WLAN_AUX_04_0011
     * @tc.desc   Wlan data auxiliary size 4-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux040011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 53; index++) { source.pushData(makeInfo(index)); }
      expect(source.totalCount()).assertEqual(53);
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      expect(source.getData(52).timestamp).assertEqual(1052);
      expect(source.getData(53) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanAux040012
     * @tc.number SUB_WLAN_AUX_04_0012
     * @tc.desc   Wlan data auxiliary size 4-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux040012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 54; index++) { source.pushData(makeInfo(index)); }
      expect(source.totalCount()).assertEqual(54);
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      expect(source.getData(53).timestamp).assertEqual(1053);
      expect(source.getData(54) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanAux040013
     * @tc.number SUB_WLAN_AUX_04_0013
     * @tc.desc   Wlan data auxiliary size 4-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux040013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 55; index++) { source.pushData(makeInfo(index)); }
      expect(source.totalCount()).assertEqual(55);
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      expect(source.getData(54).timestamp).assertEqual(1054);
      expect(source.getData(55) === undefined).assertTrue();
    })

    /**
     * @tc.name   testWlanAux040014
     * @tc.number SUB_WLAN_AUX_04_0014
     * @tc.desc   Wlan data auxiliary size 4-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux040014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 56; index++) { source.pushData(makeInfo(index)); }
      expect(source.totalCount()).assertEqual(56);
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      expect(source.getData(55).timestamp).assertEqual(1055);
      expect(source.getData(56) === undefined).assertTrue();
    })
  })
}
