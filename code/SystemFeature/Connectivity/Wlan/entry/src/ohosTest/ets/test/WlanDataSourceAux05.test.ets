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
import WifiDataSource from '../../../../src/main/ets/component/BasicDataSource';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';
function makeInfo(index: number): wifi.WifiScanInfo {
  return {
    ssid: `Wlan-${index}`, bssid: '00:11:22:33:44:55', bssidType: wifi.DeviceAddressType.REAL_DEVICE_ADDRESS, capabilities: 'ESS', securityType: wifi.WifiSecurityType.WIFI_SEC_TYPE_PSK, rssi: -40 - index, band: 2, frequency: 2412, channelWidth: 20, centerFrequency0: 2412, centerFrequency1: 0, infoElems: [], timestamp: 1000 + index, supportedWifiCategory: wifi.WifiCategory.DEFAULT, isHiLinkNetwork: false
    }
    ;
}

export default function wlanDataSourceAux05Test() {
  describe('WlanDataSourceAux05Test', () => {

    /**
     * @tc.name   testWlanAux050001
     * @tc.number SUB_WLAN_AUX_05_0001
     * @tc.desc   Verify source.totalCount() equals 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux050001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux050001 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 57; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(57));
      expect(source.totalCount()).assertEqual(57);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(56).timestamp), String(1056));
      expect(source.getData(56).timestamp).assertEqual(1056);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(57) === undefined));
      expect(source.getData(57) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux050001 end');
    })

    /**
     * @tc.name   testWlanAux050002
     * @tc.number SUB_WLAN_AUX_05_0002
     * @tc.desc   Verify source.totalCount() equals 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux050002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux050002 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 58; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(58));
      expect(source.totalCount()).assertEqual(58);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(57).timestamp), String(1057));
      expect(source.getData(57).timestamp).assertEqual(1057);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(58) === undefined));
      expect(source.getData(58) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux050002 end');
    })

    /**
     * @tc.name   testWlanAux050003
     * @tc.number SUB_WLAN_AUX_05_0003
     * @tc.desc   Verify source.totalCount() equals 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux050003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux050003 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 59; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(59));
      expect(source.totalCount()).assertEqual(59);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(58).timestamp), String(1058));
      expect(source.getData(58).timestamp).assertEqual(1058);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(59) === undefined));
      expect(source.getData(59) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux050003 end');
    })

    /**
     * @tc.name   testWlanAux050004
     * @tc.number SUB_WLAN_AUX_05_0004
     * @tc.desc   Verify source.totalCount() equals 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux050004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux050004 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 60; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(60));
      expect(source.totalCount()).assertEqual(60);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(59).timestamp), String(1059));
      expect(source.getData(59).timestamp).assertEqual(1059);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(60) === undefined));
      expect(source.getData(60) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux050004 end');
    })

    /**
     * @tc.name   testWlanAux050005
     * @tc.number SUB_WLAN_AUX_05_0005
     * @tc.desc   Verify source.totalCount() equals 61.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux050005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux050005 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 61; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(61));
      expect(source.totalCount()).assertEqual(61);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(60).timestamp), String(1060));
      expect(source.getData(60).timestamp).assertEqual(1060);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(61) === undefined));
      expect(source.getData(61) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux050005 end');
    })

    /**
     * @tc.name   testWlanAux050006
     * @tc.number SUB_WLAN_AUX_05_0006
     * @tc.desc   Verify source.totalCount() equals 62.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux050006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux050006 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 62; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(62));
      expect(source.totalCount()).assertEqual(62);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(61).timestamp), String(1061));
      expect(source.getData(61).timestamp).assertEqual(1061);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(62) === undefined));
      expect(source.getData(62) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux050006 end');
    })

    /**
     * @tc.name   testWlanAux050007
     * @tc.number SUB_WLAN_AUX_05_0007
     * @tc.desc   Verify source.totalCount() equals 63.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux050007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux050007 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 63; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(63));
      expect(source.totalCount()).assertEqual(63);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(62).timestamp), String(1062));
      expect(source.getData(62).timestamp).assertEqual(1062);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(63) === undefined));
      expect(source.getData(63) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux050007 end');
    })

    /**
     * @tc.name   testWlanAux050008
     * @tc.number SUB_WLAN_AUX_05_0008
     * @tc.desc   Verify source.totalCount() equals 64.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux050008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux050008 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 64; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(64));
      expect(source.totalCount()).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(63).timestamp), String(1063));
      expect(source.getData(63).timestamp).assertEqual(1063);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(64) === undefined));
      expect(source.getData(64) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux050008 end');
    })

    /**
     * @tc.name   testWlanAux050009
     * @tc.number SUB_WLAN_AUX_05_0009
     * @tc.desc   Verify source.totalCount() equals 65.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux050009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux050009 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 65; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(65));
      expect(source.totalCount()).assertEqual(65);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(64).timestamp), String(1064));
      expect(source.getData(64).timestamp).assertEqual(1064);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(65) === undefined));
      expect(source.getData(65) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux050009 end');
    })

    /**
     * @tc.name   testWlanAux050010
     * @tc.number SUB_WLAN_AUX_05_0010
     * @tc.desc   Verify source.totalCount() equals 66.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux050010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux050010 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 66; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(66));
      expect(source.totalCount()).assertEqual(66);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(65).timestamp), String(1065));
      expect(source.getData(65).timestamp).assertEqual(1065);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(66) === undefined));
      expect(source.getData(66) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux050010 end');
    })

    /**
     * @tc.name   testWlanAux050011
     * @tc.number SUB_WLAN_AUX_05_0011
     * @tc.desc   Verify source.totalCount() equals 67.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux050011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux050011 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 67; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(67));
      expect(source.totalCount()).assertEqual(67);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(66).timestamp), String(1066));
      expect(source.getData(66).timestamp).assertEqual(1066);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(67) === undefined));
      expect(source.getData(67) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux050011 end');
    })

    /**
     * @tc.name   testWlanAux050012
     * @tc.number SUB_WLAN_AUX_05_0012
     * @tc.desc   Verify source.totalCount() equals 68.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux050012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux050012 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 68; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(68));
      expect(source.totalCount()).assertEqual(68);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(67).timestamp), String(1067));
      expect(source.getData(67).timestamp).assertEqual(1067);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(68) === undefined));
      expect(source.getData(68) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux050012 end');
    })

    /**
     * @tc.name   testWlanAux050013
     * @tc.number SUB_WLAN_AUX_05_0013
     * @tc.desc   Verify source.totalCount() equals 69.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux050013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux050013 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 69; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(69));
      expect(source.totalCount()).assertEqual(69);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(68).timestamp), String(1068));
      expect(source.getData(68).timestamp).assertEqual(1068);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(69) === undefined));
      expect(source.getData(69) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux050013 end');
    })

    /**
     * @tc.name   testWlanAux050014
     * @tc.number SUB_WLAN_AUX_05_0014
     * @tc.desc   Verify source.totalCount() equals 70.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux050014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux050014 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 70; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(70));
      expect(source.totalCount()).assertEqual(70);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(69).timestamp), String(1069));
      expect(source.getData(69).timestamp).assertEqual(1069);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(70) === undefined));
      expect(source.getData(70) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux050014 end');
    })
  })
}
