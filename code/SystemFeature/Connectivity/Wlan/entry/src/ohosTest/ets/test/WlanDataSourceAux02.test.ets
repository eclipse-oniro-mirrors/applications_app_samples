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

export default function wlanDataSourceAux02Test() {
  describe('WlanDataSourceAux02Test', () => {

    /**
     * @tc.name   ohos.samples.wlan_DataSourceAux02_0001
     * @tc.number SUB_WLAN_AUX_02_0001
     * @tc.desc   Verify source.totalCount() equals 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceAux02_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux02_0001 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 15; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(15));
      expect(source.totalCount()).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(14).timestamp), String(1014));
      expect(source.getData(14).timestamp).assertEqual(1014);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(15) === undefined));
      expect(source.getData(15) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux02_0001 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceAux02_0002
     * @tc.number SUB_WLAN_AUX_02_0002
     * @tc.desc   Verify source.totalCount() equals 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceAux02_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux02_0002 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 16; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(16));
      expect(source.totalCount()).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(15).timestamp), String(1015));
      expect(source.getData(15).timestamp).assertEqual(1015);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(16) === undefined));
      expect(source.getData(16) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux02_0002 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceAux02_0003
     * @tc.number SUB_WLAN_AUX_02_0003
     * @tc.desc   Verify source.totalCount() equals 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceAux02_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux02_0003 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 17; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(17));
      expect(source.totalCount()).assertEqual(17);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(16).timestamp), String(1016));
      expect(source.getData(16).timestamp).assertEqual(1016);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(17) === undefined));
      expect(source.getData(17) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux02_0003 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceAux02_0004
     * @tc.number SUB_WLAN_AUX_02_0004
     * @tc.desc   Verify source.totalCount() equals 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceAux02_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux02_0004 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 18; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(18));
      expect(source.totalCount()).assertEqual(18);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(17).timestamp), String(1017));
      expect(source.getData(17).timestamp).assertEqual(1017);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(18) === undefined));
      expect(source.getData(18) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux02_0004 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceAux02_0005
     * @tc.number SUB_WLAN_AUX_02_0005
     * @tc.desc   Verify source.totalCount() equals 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceAux02_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux02_0005 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 19; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(19));
      expect(source.totalCount()).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(18).timestamp), String(1018));
      expect(source.getData(18).timestamp).assertEqual(1018);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(19) === undefined));
      expect(source.getData(19) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux02_0005 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceAux02_0006
     * @tc.number SUB_WLAN_AUX_02_0006
     * @tc.desc   Verify source.totalCount() equals 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceAux02_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux02_0006 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 20; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(20));
      expect(source.totalCount()).assertEqual(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(19).timestamp), String(1019));
      expect(source.getData(19).timestamp).assertEqual(1019);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(20) === undefined));
      expect(source.getData(20) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux02_0006 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceAux02_0007
     * @tc.number SUB_WLAN_AUX_02_0007
     * @tc.desc   Verify source.totalCount() equals 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceAux02_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux02_0007 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 21; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(21));
      expect(source.totalCount()).assertEqual(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(20).timestamp), String(1020));
      expect(source.getData(20).timestamp).assertEqual(1020);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(21) === undefined));
      expect(source.getData(21) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux02_0007 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceAux02_0008
     * @tc.number SUB_WLAN_AUX_02_0008
     * @tc.desc   Verify source.totalCount() equals 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceAux02_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux02_0008 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 22; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(22));
      expect(source.totalCount()).assertEqual(22);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(21).timestamp), String(1021));
      expect(source.getData(21).timestamp).assertEqual(1021);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(22) === undefined));
      expect(source.getData(22) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux02_0008 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceAux02_0009
     * @tc.number SUB_WLAN_AUX_02_0009
     * @tc.desc   Verify source.totalCount() equals 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceAux02_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux02_0009 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 23; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(23));
      expect(source.totalCount()).assertEqual(23);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(22).timestamp), String(1022));
      expect(source.getData(22).timestamp).assertEqual(1022);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(23) === undefined));
      expect(source.getData(23) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux02_0009 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceAux02_0010
     * @tc.number SUB_WLAN_AUX_02_0010
     * @tc.desc   Verify source.totalCount() equals 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceAux02_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux02_0010 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 24; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(24));
      expect(source.totalCount()).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(23).timestamp), String(1023));
      expect(source.getData(23).timestamp).assertEqual(1023);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(24) === undefined));
      expect(source.getData(24) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux02_0010 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceAux02_0011
     * @tc.number SUB_WLAN_AUX_02_0011
     * @tc.desc   Verify source.totalCount() equals 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceAux02_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux02_0011 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 25; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(25));
      expect(source.totalCount()).assertEqual(25);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(24).timestamp), String(1024));
      expect(source.getData(24).timestamp).assertEqual(1024);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(25) === undefined));
      expect(source.getData(25) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux02_0011 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceAux02_0012
     * @tc.number SUB_WLAN_AUX_02_0012
     * @tc.desc   Verify source.totalCount() equals 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceAux02_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux02_0012 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 26; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(26));
      expect(source.totalCount()).assertEqual(26);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(25).timestamp), String(1025));
      expect(source.getData(25).timestamp).assertEqual(1025);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(26) === undefined));
      expect(source.getData(26) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux02_0012 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceAux02_0013
     * @tc.number SUB_WLAN_AUX_02_0013
     * @tc.desc   Verify source.totalCount() equals 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceAux02_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux02_0013 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 27; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(27));
      expect(source.totalCount()).assertEqual(27);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(26).timestamp), String(1026));
      expect(source.getData(26).timestamp).assertEqual(1026);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(27) === undefined));
      expect(source.getData(27) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux02_0013 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceAux02_0014
     * @tc.number SUB_WLAN_AUX_02_0014
     * @tc.desc   Verify source.totalCount() equals 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceAux02_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux02_0014 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      for (let index: number = 0; index < 28; index++) {
        source.pushData(makeInfo(index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(28));
      expect(source.totalCount()).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-0'));
      expect(source.getData(0).ssid).assertEqual('Wlan-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(27).timestamp), String(1027));
      expect(source.getData(27).timestamp).assertEqual(1027);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(28) === undefined));
      expect(source.getData(28) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceAux02_0014 end');
    })
  })
}
