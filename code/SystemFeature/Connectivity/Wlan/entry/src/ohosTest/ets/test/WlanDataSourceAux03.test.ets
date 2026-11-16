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

export default function wlanDataSourceAux03Test() {
  describe('WlanDataSourceAux03Test', () => {

    /**
     * @tc.name   testWlanAux030001
     * @tc.number SUB_WLAN_AUX_03_0001
     * @tc.desc   Verify source.totalCount() equals 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux030001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux030001 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 29; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(29));
      expect(source.totalCount()).assertEqual(29);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(28).timestamp), String(1028));
      expect(source.getData(28).timestamp).assertEqual(1028);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(29) === undefined));
      expect(source.getData(29) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux030001 end');
    })

    /**
     * @tc.name   testWlanAux030002
     * @tc.number SUB_WLAN_AUX_03_0002
     * @tc.desc   Verify source.totalCount() equals 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux030002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux030002 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 30; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(30));
      expect(source.totalCount()).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(29).timestamp), String(1029));
      expect(source.getData(29).timestamp).assertEqual(1029);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(30) === undefined));
      expect(source.getData(30) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux030002 end');
    })

    /**
     * @tc.name   testWlanAux030003
     * @tc.number SUB_WLAN_AUX_03_0003
     * @tc.desc   Verify source.totalCount() equals 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux030003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux030003 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 31; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(31));
      expect(source.totalCount()).assertEqual(31);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(30).timestamp), String(1030));
      expect(source.getData(30).timestamp).assertEqual(1030);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(31) === undefined));
      expect(source.getData(31) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux030003 end');
    })

    /**
     * @tc.name   testWlanAux030004
     * @tc.number SUB_WLAN_AUX_03_0004
     * @tc.desc   Verify source.totalCount() equals 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux030004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux030004 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 32; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(32));
      expect(source.totalCount()).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(31).timestamp), String(1031));
      expect(source.getData(31).timestamp).assertEqual(1031);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(32) === undefined));
      expect(source.getData(32) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux030004 end');
    })

    /**
     * @tc.name   testWlanAux030005
     * @tc.number SUB_WLAN_AUX_03_0005
     * @tc.desc   Verify source.totalCount() equals 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux030005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux030005 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 33; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(33));
      expect(source.totalCount()).assertEqual(33);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(32).timestamp), String(1032));
      expect(source.getData(32).timestamp).assertEqual(1032);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(33) === undefined));
      expect(source.getData(33) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux030005 end');
    })

    /**
     * @tc.name   testWlanAux030006
     * @tc.number SUB_WLAN_AUX_03_0006
     * @tc.desc   Verify source.totalCount() equals 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux030006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux030006 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 34; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(34));
      expect(source.totalCount()).assertEqual(34);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(33).timestamp), String(1033));
      expect(source.getData(33).timestamp).assertEqual(1033);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(34) === undefined));
      expect(source.getData(34) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux030006 end');
    })

    /**
     * @tc.name   testWlanAux030007
     * @tc.number SUB_WLAN_AUX_03_0007
     * @tc.desc   Verify source.totalCount() equals 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux030007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux030007 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 35; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(35));
      expect(source.totalCount()).assertEqual(35);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(34).timestamp), String(1034));
      expect(source.getData(34).timestamp).assertEqual(1034);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(35) === undefined));
      expect(source.getData(35) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux030007 end');
    })

    /**
     * @tc.name   testWlanAux030008
     * @tc.number SUB_WLAN_AUX_03_0008
     * @tc.desc   Verify source.totalCount() equals 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux030008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux030008 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 36; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(36));
      expect(source.totalCount()).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(35).timestamp), String(1035));
      expect(source.getData(35).timestamp).assertEqual(1035);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(36) === undefined));
      expect(source.getData(36) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux030008 end');
    })

    /**
     * @tc.name   testWlanAux030009
     * @tc.number SUB_WLAN_AUX_03_0009
     * @tc.desc   Verify source.totalCount() equals 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux030009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux030009 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 37; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(37));
      expect(source.totalCount()).assertEqual(37);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(36).timestamp), String(1036));
      expect(source.getData(36).timestamp).assertEqual(1036);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(37) === undefined));
      expect(source.getData(37) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux030009 end');
    })

    /**
     * @tc.name   testWlanAux030010
     * @tc.number SUB_WLAN_AUX_03_0010
     * @tc.desc   Verify source.totalCount() equals 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux030010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux030010 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 38; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(38));
      expect(source.totalCount()).assertEqual(38);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(37).timestamp), String(1037));
      expect(source.getData(37).timestamp).assertEqual(1037);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(38) === undefined));
      expect(source.getData(38) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux030010 end');
    })

    /**
     * @tc.name   testWlanAux030011
     * @tc.number SUB_WLAN_AUX_03_0011
     * @tc.desc   Verify source.totalCount() equals 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux030011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux030011 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 39; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(39));
      expect(source.totalCount()).assertEqual(39);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(38).timestamp), String(1038));
      expect(source.getData(38).timestamp).assertEqual(1038);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(39) === undefined));
      expect(source.getData(39) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux030011 end');
    })

    /**
     * @tc.name   testWlanAux030012
     * @tc.number SUB_WLAN_AUX_03_0012
     * @tc.desc   Verify source.totalCount() equals 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux030012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux030012 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 40; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(40));
      expect(source.totalCount()).assertEqual(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(39).timestamp), String(1039));
      expect(source.getData(39).timestamp).assertEqual(1039);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(40) === undefined));
      expect(source.getData(40) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux030012 end');
    })

    /**
     * @tc.name   testWlanAux030013
     * @tc.number SUB_WLAN_AUX_03_0013
     * @tc.desc   Verify source.totalCount() equals 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux030013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux030013 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 41; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(41));
      expect(source.totalCount()).assertEqual(41);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(40).timestamp), String(1040));
      expect(source.getData(40).timestamp).assertEqual(1040);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(41) === undefined));
      expect(source.getData(41) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux030013 end');
    })

    /**
     * @tc.name   testWlanAux030014
     * @tc.number SUB_WLAN_AUX_03_0014
     * @tc.desc   Verify source.totalCount() equals 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanAux030014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux030014 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 42; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(42));
      expect(source.totalCount()).assertEqual(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(41).timestamp), String(1041));
      expect(source.getData(41).timestamp).assertEqual(1041);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(42) === undefined));
      expect(source.getData(42) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanAux030014 end');
    })
  })
}
