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

export default function wlanDataSourceAux04Test() {
  describe('WlanDataSourceAux04Test', () => {

    /**
     * @tc.name   ohos.samples.wlan_DataSourceAux04_0001
     * @tc.number SUB_WLAN_AUX_04_0001
     * @tc.desc   Verify source.totalCount() equals 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceAux04_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux04_0001 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 43; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(43));
      expect(source.totalCount()).assertEqual(43);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(42).timestamp), String(1042));
      expect(source.getData(42).timestamp).assertEqual(1042);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(43) === undefined));
      expect(source.getData(43) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux04_0001 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceAux04_0002
     * @tc.number SUB_WLAN_AUX_04_0002
     * @tc.desc   Verify source.totalCount() equals 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceAux04_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux04_0002 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 44; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(44));
      expect(source.totalCount()).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(43).timestamp), String(1043));
      expect(source.getData(43).timestamp).assertEqual(1043);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(44) === undefined));
      expect(source.getData(44) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux04_0002 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceAux04_0003
     * @tc.number SUB_WLAN_AUX_04_0003
     * @tc.desc   Verify source.totalCount() equals 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceAux04_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux04_0003 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 45; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(45));
      expect(source.totalCount()).assertEqual(45);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(44).timestamp), String(1044));
      expect(source.getData(44).timestamp).assertEqual(1044);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(45) === undefined));
      expect(source.getData(45) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux04_0003 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceAux04_0004
     * @tc.number SUB_WLAN_AUX_04_0004
     * @tc.desc   Verify source.totalCount() equals 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceAux04_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux04_0004 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 46; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(46));
      expect(source.totalCount()).assertEqual(46);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(45).timestamp), String(1045));
      expect(source.getData(45).timestamp).assertEqual(1045);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(46) === undefined));
      expect(source.getData(46) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux04_0004 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceAux04_0005
     * @tc.number SUB_WLAN_AUX_04_0005
     * @tc.desc   Verify source.totalCount() equals 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceAux04_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux04_0005 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 47; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(47));
      expect(source.totalCount()).assertEqual(47);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(46).timestamp), String(1046));
      expect(source.getData(46).timestamp).assertEqual(1046);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(47) === undefined));
      expect(source.getData(47) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux04_0005 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceAux04_0006
     * @tc.number SUB_WLAN_AUX_04_0006
     * @tc.desc   Verify source.totalCount() equals 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceAux04_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux04_0006 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 48; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(48));
      expect(source.totalCount()).assertEqual(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(47).timestamp), String(1047));
      expect(source.getData(47).timestamp).assertEqual(1047);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(48) === undefined));
      expect(source.getData(48) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux04_0006 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceAux04_0007
     * @tc.number SUB_WLAN_AUX_04_0007
     * @tc.desc   Verify source.totalCount() equals 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceAux04_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux04_0007 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 49; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(49));
      expect(source.totalCount()).assertEqual(49);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(48).timestamp), String(1048));
      expect(source.getData(48).timestamp).assertEqual(1048);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(49) === undefined));
      expect(source.getData(49) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux04_0007 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceAux04_0008
     * @tc.number SUB_WLAN_AUX_04_0008
     * @tc.desc   Verify source.totalCount() equals 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceAux04_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux04_0008 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 50; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(50));
      expect(source.totalCount()).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(49).timestamp), String(1049));
      expect(source.getData(49).timestamp).assertEqual(1049);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(50) === undefined));
      expect(source.getData(50) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux04_0008 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceAux04_0009
     * @tc.number SUB_WLAN_AUX_04_0009
     * @tc.desc   Verify source.totalCount() equals 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceAux04_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux04_0009 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 51; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(51));
      expect(source.totalCount()).assertEqual(51);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(50).timestamp), String(1050));
      expect(source.getData(50).timestamp).assertEqual(1050);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(51) === undefined));
      expect(source.getData(51) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux04_0009 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceAux04_0010
     * @tc.number SUB_WLAN_AUX_04_0010
     * @tc.desc   Verify source.totalCount() equals 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceAux04_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux04_0010 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 52; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(52));
      expect(source.totalCount()).assertEqual(52);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(51).timestamp), String(1051));
      expect(source.getData(51).timestamp).assertEqual(1051);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(52) === undefined));
      expect(source.getData(52) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux04_0010 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceAux04_0011
     * @tc.number SUB_WLAN_AUX_04_0011
     * @tc.desc   Verify source.totalCount() equals 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceAux04_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux04_0011 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 53; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(53));
      expect(source.totalCount()).assertEqual(53);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(52).timestamp), String(1052));
      expect(source.getData(52).timestamp).assertEqual(1052);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(53) === undefined));
      expect(source.getData(53) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux04_0011 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceAux04_0012
     * @tc.number SUB_WLAN_AUX_04_0012
     * @tc.desc   Verify source.totalCount() equals 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceAux04_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux04_0012 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 54; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(54));
      expect(source.totalCount()).assertEqual(54);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(53).timestamp), String(1053));
      expect(source.getData(53).timestamp).assertEqual(1053);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(54) === undefined));
      expect(source.getData(54) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux04_0012 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceAux04_0013
     * @tc.number SUB_WLAN_AUX_04_0013
     * @tc.desc   Verify source.totalCount() equals 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceAux04_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux04_0013 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 55; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(55));
      expect(source.totalCount()).assertEqual(55);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(54).timestamp), String(1054));
      expect(source.getData(54).timestamp).assertEqual(1054);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(55) === undefined));
      expect(source.getData(55) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux04_0013 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceAux04_0014
     * @tc.number SUB_WLAN_AUX_04_0014
     * @tc.desc   Verify source.totalCount() equals 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceAux04_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux04_0014 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 56; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(56));
      expect(source.totalCount()).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(55).timestamp), String(1055));
      expect(source.getData(55).timestamp).assertEqual(1055);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(56) === undefined));
      expect(source.getData(56) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux04_0014 end');
    })
  })
}
