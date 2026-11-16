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

function makeScanInfo(index: number, ssid: string): wifi.WifiScanInfo {
  return {
    ssid: ssid,
    bssid: '00:11:22:33:44:55',
    bssidType: wifi.DeviceAddressType.REAL_DEVICE_ADDRESS,
    capabilities: 'ESS',
    securityType: wifi.WifiSecurityType.WIFI_SEC_TYPE_PSK,
    rssi: -40 - index,
    band: 2,
    frequency: 2412,
    channelWidth: 20,
    centerFrequency0: 2412,
    centerFrequency1: 0,
    infoElems: [],
    timestamp: 1000 + index,
    supportedWifiCategory: wifi.WifiCategory.DEFAULT,
    isHiLinkNetwork: false
  }
    ;
}

export default function wlanDataSourceDataTest() {
  describe('WlanDataSourceDataTest', () => {

    /**
     * @tc.name   testWlanDataSourcePushOne0001
     * @tc.number SUB_WLAN_DATASOURCE_PUSH_0001
     * @tc.desc   Push one scan result into the data source.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanDataSourcePushOne0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanDataSourcePushOne0001 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      const item: wifi.WifiScanInfo = makeScanInfo(1, 'Wlan-One');
      source.pushData(item);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1));
      expect(source.totalCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-One'));
      expect(source.getData(0).ssid).assertEqual('Wlan-One');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).bssid), String('00:11:22:33:44:55'));
      expect(source.getData(0).bssid).assertEqual('00:11:22:33:44:55');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).rssi), String(-41));
      expect(source.getData(0).rssi).assertEqual(-41);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanDataSourcePushOne0001 end');
    })

    /**
     * @tc.name   testWlanDataSourcePushThree0002
     * @tc.number SUB_WLAN_DATASOURCE_PUSH_0002
     * @tc.desc   Push three scan results and verify order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanDataSourcePushThree0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanDataSourcePushThree0002 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      source.pushData(makeScanInfo(1, 'Wlan-A'));
      source.pushData(makeScanInfo(2, 'Wlan-B'));
      source.pushData(makeScanInfo(3, 'Wlan-C'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(3));
      expect(source.totalCount()).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-A'));
      expect(source.getData(0).ssid).assertEqual('Wlan-A');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1).ssid), String('Wlan-B'));
      expect(source.getData(1).ssid).assertEqual('Wlan-B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(2).ssid), String('Wlan-C'));
      expect(source.getData(2).ssid).assertEqual('Wlan-C');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanDataSourcePushThree0002 end');
    })

    /**
     * @tc.name   testWlanDataSourceAddFront0003
     * @tc.number SUB_WLAN_DATASOURCE_ADD_0003
     * @tc.desc   Insert a scan result at the front.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanDataSourceAddFront0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanDataSourceAddFront0003 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      source.pushData(makeScanInfo(1, 'Wlan-B'));
      source.addData(0, makeScanInfo(2, 'Wlan-A'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(2));
      expect(source.totalCount()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-A'));
      expect(source.getData(0).ssid).assertEqual('Wlan-A');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1).ssid), String('Wlan-B'));
      expect(source.getData(1).ssid).assertEqual('Wlan-B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).timestamp), String(1002));
      expect(source.getData(0).timestamp).assertEqual(1002);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanDataSourceAddFront0003 end');
    })

    /**
     * @tc.name   testWlanDataSourceAddMiddle0004
     * @tc.number SUB_WLAN_DATASOURCE_ADD_0004
     * @tc.desc   Insert a scan result in the middle.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanDataSourceAddMiddle0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanDataSourceAddMiddle0004 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      source.pushData(makeScanInfo(1, 'Wlan-A'));
      source.pushData(makeScanInfo(2, 'Wlan-C'));
      source.addData(1, makeScanInfo(3, 'Wlan-B'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(3));
      expect(source.totalCount()).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1).ssid), String('Wlan-B'));
      expect(source.getData(1).ssid).assertEqual('Wlan-B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(2).ssid), String('Wlan-C'));
      expect(source.getData(2).ssid).assertEqual('Wlan-C');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanDataSourceAddMiddle0004 end');
    })

    /**
     * @tc.name   testWlanDataSourcePush0005
     * @tc.number SUB_WLAN_DATASOURCE_PUSH_0005
     * @tc.desc   Push scan result variant 5 into the data source.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanDataSourcePush0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanDataSourcePush0005 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      const item: wifi.WifiScanInfo = makeScanInfo(5, 'Wlan-5');
      source.pushData(item);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1));
      expect(source.totalCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-5'));
      expect(source.getData(0).ssid).assertEqual('Wlan-5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).timestamp), String(1005));
      expect(source.getData(0).timestamp).assertEqual(1005);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanDataSourcePush0005 end');
    })

    /**
     * @tc.name   testWlanDataSourcePush0006
     * @tc.number SUB_WLAN_DATASOURCE_PUSH_0006
     * @tc.desc   Push scan result variant 6 into the data source.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanDataSourcePush0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanDataSourcePush0006 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      const item: wifi.WifiScanInfo = makeScanInfo(6, 'Wlan-6');
      source.pushData(item);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1));
      expect(source.totalCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-6'));
      expect(source.getData(0).ssid).assertEqual('Wlan-6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).timestamp), String(1006));
      expect(source.getData(0).timestamp).assertEqual(1006);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanDataSourcePush0006 end');
    })

    /**
     * @tc.name   testWlanDataSourcePush0007
     * @tc.number SUB_WLAN_DATASOURCE_PUSH_0007
     * @tc.desc   Push scan result variant 7 into the data source.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanDataSourcePush0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanDataSourcePush0007 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      const item: wifi.WifiScanInfo = makeScanInfo(7, 'Wlan-7');
      source.pushData(item);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1));
      expect(source.totalCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-7'));
      expect(source.getData(0).ssid).assertEqual('Wlan-7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).timestamp), String(1007));
      expect(source.getData(0).timestamp).assertEqual(1007);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanDataSourcePush0007 end');
    })

    /**
     * @tc.name   testWlanDataSourcePush0008
     * @tc.number SUB_WLAN_DATASOURCE_PUSH_0008
     * @tc.desc   Push scan result variant 8 into the data source.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanDataSourcePush0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanDataSourcePush0008 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      const item: wifi.WifiScanInfo = makeScanInfo(8, 'Wlan-8');
      source.pushData(item);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1));
      expect(source.totalCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-8'));
      expect(source.getData(0).ssid).assertEqual('Wlan-8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).timestamp), String(1008));
      expect(source.getData(0).timestamp).assertEqual(1008);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanDataSourcePush0008 end');
    })

    /**
     * @tc.name   testWlanDataSourcePush0009
     * @tc.number SUB_WLAN_DATASOURCE_PUSH_0009
     * @tc.desc   Push scan result variant 9 into the data source.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanDataSourcePush0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanDataSourcePush0009 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      const item: wifi.WifiScanInfo = makeScanInfo(9, 'Wlan-9');
      source.pushData(item);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1));
      expect(source.totalCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-9'));
      expect(source.getData(0).ssid).assertEqual('Wlan-9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).timestamp), String(1009));
      expect(source.getData(0).timestamp).assertEqual(1009);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanDataSourcePush0009 end');
    })

    /**
     * @tc.name   testWlanDataSourcePush0010
     * @tc.number SUB_WLAN_DATASOURCE_PUSH_0010
     * @tc.desc   Push scan result variant 10 into the data source.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanDataSourcePush0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanDataSourcePush0010 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      const item: wifi.WifiScanInfo = makeScanInfo(10, 'Wlan-10');
      source.pushData(item);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1));
      expect(source.totalCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-10'));
      expect(source.getData(0).ssid).assertEqual('Wlan-10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).timestamp), String(1010));
      expect(source.getData(0).timestamp).assertEqual(1010);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanDataSourcePush0010 end');
    })

    /**
     * @tc.name   testWlanDataSourcePush0011
     * @tc.number SUB_WLAN_DATASOURCE_PUSH_0011
     * @tc.desc   Push scan result variant 11 into the data source.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanDataSourcePush0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanDataSourcePush0011 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      const item: wifi.WifiScanInfo = makeScanInfo(11, 'Wlan-11');
      source.pushData(item);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1));
      expect(source.totalCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-11'));
      expect(source.getData(0).ssid).assertEqual('Wlan-11');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).timestamp), String(1011));
      expect(source.getData(0).timestamp).assertEqual(1011);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanDataSourcePush0011 end');
    })

    /**
     * @tc.name   testWlanDataSourcePush0012
     * @tc.number SUB_WLAN_DATASOURCE_PUSH_0012
     * @tc.desc   Push scan result variant 12 into the data source.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanDataSourcePush0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanDataSourcePush0012 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      const item: wifi.WifiScanInfo = makeScanInfo(12, 'Wlan-12');
      source.pushData(item);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1));
      expect(source.totalCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-12'));
      expect(source.getData(0).ssid).assertEqual('Wlan-12');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).timestamp), String(1012));
      expect(source.getData(0).timestamp).assertEqual(1012);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanDataSourcePush0012 end');
    })

    /**
     * @tc.name   testWlanDataSourcePush0013
     * @tc.number SUB_WLAN_DATASOURCE_PUSH_0013
     * @tc.desc   Push scan result variant 13 into the data source.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanDataSourcePush0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanDataSourcePush0013 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      const item: wifi.WifiScanInfo = makeScanInfo(13, 'Wlan-13');
      source.pushData(item);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1));
      expect(source.totalCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-13'));
      expect(source.getData(0).ssid).assertEqual('Wlan-13');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).timestamp), String(1013));
      expect(source.getData(0).timestamp).assertEqual(1013);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanDataSourcePush0013 end');
    })

    /**
     * @tc.name   testWlanDataSourcePush0014
     * @tc.number SUB_WLAN_DATASOURCE_PUSH_0014
     * @tc.desc   Push scan result variant 14 into the data source.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanDataSourcePush0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanDataSourcePush0014 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      const item: wifi.WifiScanInfo = makeScanInfo(14, 'Wlan-14');
      source.pushData(item);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1));
      expect(source.totalCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-14'));
      expect(source.getData(0).ssid).assertEqual('Wlan-14');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).timestamp), String(1014));
      expect(source.getData(0).timestamp).assertEqual(1014);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanDataSourcePush0014 end');
    })
  })
}
