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

export default function wlanDataSourceAux01Test() {
  describe('WlanDataSourceAux01Test', () => {

    /**
     * @tc.name   ohos.samples.wlan_DataSourceAux01_0001
     * @tc.number SUB_WLAN_AUX_01_0001
     * @tc.desc   Verify source.totalCount() equals 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceAux01_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux01_0001 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 1; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1));
      expect(source.totalCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).timestamp), String(1000));
      expect(source.getData(0).timestamp).assertEqual(1000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(1) === undefined));
      expect(source.getData(1) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux01_0001 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceAux01_0002
     * @tc.number SUB_WLAN_AUX_01_0002
     * @tc.desc   Verify source.totalCount() equals 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceAux01_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux01_0002 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 2; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(2));
      expect(source.totalCount()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1).timestamp), String(1001));
      expect(source.getData(1).timestamp).assertEqual(1001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(2) === undefined));
      expect(source.getData(2) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux01_0002 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceAux01_0003
     * @tc.number SUB_WLAN_AUX_01_0003
     * @tc.desc   Verify source.totalCount() equals 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceAux01_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux01_0003 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 3; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(3));
      expect(source.totalCount()).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(2).timestamp), String(1002));
      expect(source.getData(2).timestamp).assertEqual(1002);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(3) === undefined));
      expect(source.getData(3) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux01_0003 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceAux01_0004
     * @tc.number SUB_WLAN_AUX_01_0004
     * @tc.desc   Verify source.totalCount() equals 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceAux01_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux01_0004 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 4; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(4));
      expect(source.totalCount()).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(3).timestamp), String(1003));
      expect(source.getData(3).timestamp).assertEqual(1003);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(4) === undefined));
      expect(source.getData(4) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux01_0004 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceAux01_0005
     * @tc.number SUB_WLAN_AUX_01_0005
     * @tc.desc   Verify source.totalCount() equals 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceAux01_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux01_0005 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 5; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(5));
      expect(source.totalCount()).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(4).timestamp), String(1004));
      expect(source.getData(4).timestamp).assertEqual(1004);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(5) === undefined));
      expect(source.getData(5) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux01_0005 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceAux01_0006
     * @tc.number SUB_WLAN_AUX_01_0006
     * @tc.desc   Verify source.totalCount() equals 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceAux01_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux01_0006 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 6; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(6));
      expect(source.totalCount()).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(5).timestamp), String(1005));
      expect(source.getData(5).timestamp).assertEqual(1005);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(6) === undefined));
      expect(source.getData(6) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux01_0006 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceAux01_0007
     * @tc.number SUB_WLAN_AUX_01_0007
     * @tc.desc   Verify source.totalCount() equals 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceAux01_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux01_0007 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 7; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(7));
      expect(source.totalCount()).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(6).timestamp), String(1006));
      expect(source.getData(6).timestamp).assertEqual(1006);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(7) === undefined));
      expect(source.getData(7) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux01_0007 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceAux01_0008
     * @tc.number SUB_WLAN_AUX_01_0008
     * @tc.desc   Verify source.totalCount() equals 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceAux01_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux01_0008 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 8; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(8));
      expect(source.totalCount()).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(7).timestamp), String(1007));
      expect(source.getData(7).timestamp).assertEqual(1007);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(8) === undefined));
      expect(source.getData(8) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux01_0008 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceAux01_0009
     * @tc.number SUB_WLAN_AUX_01_0009
     * @tc.desc   Verify source.totalCount() equals 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceAux01_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux01_0009 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 9; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(9));
      expect(source.totalCount()).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(8).timestamp), String(1008));
      expect(source.getData(8).timestamp).assertEqual(1008);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(9) === undefined));
      expect(source.getData(9) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux01_0009 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceAux01_0010
     * @tc.number SUB_WLAN_AUX_01_0010
     * @tc.desc   Verify source.totalCount() equals 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceAux01_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux01_0010 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 10; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(10));
      expect(source.totalCount()).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(9).timestamp), String(1009));
      expect(source.getData(9).timestamp).assertEqual(1009);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(10) === undefined));
      expect(source.getData(10) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux01_0010 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceAux01_0011
     * @tc.number SUB_WLAN_AUX_01_0011
     * @tc.desc   Verify source.totalCount() equals 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceAux01_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux01_0011 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 11; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(11));
      expect(source.totalCount()).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(10).timestamp), String(1010));
      expect(source.getData(10).timestamp).assertEqual(1010);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(11) === undefined));
      expect(source.getData(11) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux01_0011 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceAux01_0012
     * @tc.number SUB_WLAN_AUX_01_0012
     * @tc.desc   Verify source.totalCount() equals 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceAux01_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux01_0012 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 12; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(12));
      expect(source.totalCount()).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(11).timestamp), String(1011));
      expect(source.getData(11).timestamp).assertEqual(1011);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(12) === undefined));
      expect(source.getData(12) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux01_0012 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceAux01_0013
     * @tc.number SUB_WLAN_AUX_01_0013
     * @tc.desc   Verify source.totalCount() equals 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceAux01_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux01_0013 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 13; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(13));
      expect(source.totalCount()).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(12).timestamp), String(1012));
      expect(source.getData(12).timestamp).assertEqual(1012);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(13) === undefined));
      expect(source.getData(13) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux01_0013 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceAux01_0014
     * @tc.number SUB_WLAN_AUX_01_0014
     * @tc.desc   Verify source.totalCount() equals 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceAux01_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux01_0014 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 14; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(14));
      expect(source.totalCount()).assertEqual(14);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(13).timestamp), String(1013));
      expect(source.getData(13).timestamp).assertEqual(1013);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(14) === undefined));
      expect(source.getData(14) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux01_0014 end');
    })
  })
}
