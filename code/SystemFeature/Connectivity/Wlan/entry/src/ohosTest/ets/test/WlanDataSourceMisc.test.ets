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
class MiscListener implements DataChangeListener {
  onDataReloaded(): void {
    }
  onDataAdded(index: number): void {
    }
  onDataAdd(index: number): void {
    }
  onDataMoved(from: number, to: number): void {
    }
  onDataMove(from: number, to: number): void {
    }
  onDataDeleted(index: number): void {
    }
  onDataDelete(index: number): void {
    }
  onDataChanged(index: number): void {
    }
  onDataChange(index: number): void {
    }
  onDatasetChange(dataOperations: DataOperation[]): void {
    }
}

function item(index: number): wifi.WifiScanInfo {
  return {
    ssid: `Wlan-${index}`, bssid: '00:11:22:33:44:55', bssidType: wifi.DeviceAddressType.REAL_DEVICE_ADDRESS, capabilities: 'ESS', securityType: wifi.WifiSecurityType.WIFI_SEC_TYPE_PSK, rssi: -40, band: 2, frequency: 2412, channelWidth: 20, centerFrequency0: 2412, centerFrequency1: 0, infoElems: [], timestamp: index, supportedWifiCategory: wifi.WifiCategory.DEFAULT, isHiLinkNetwork: false
    }
    ;
}

export default function wlanDataSourceMiscTest() {
  describe('WlanDataSourceMiscTest', () => {

    /**
     * @tc.name   testWlanMiscDataSourceLast0001
     * @tc.number SUB_WLAN_MISC_DS_0001
     * @tc.desc   Read the last inserted data source item.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanMiscDataSourceLast0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanMiscDataSourceLast0001 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      source.pushData(item(1));
      source.pushData(item(2));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(source.totalCount() - 1).ssid), String('Wlan-2'));
      expect(source.getData(source.totalCount() - 1).ssid).assertEqual('Wlan-2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(source.totalCount() - 1).timestamp), String(2));
      expect(source.getData(source.totalCount() - 1).timestamp).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanMiscDataSourceLast0001 end');
    })

    /**
     * @tc.name   testWlanMiscDataSourceRemoveUnknown0002
     * @tc.number SUB_WLAN_MISC_DS_0002
     * @tc.desc   Unregister a listener that was never registered.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanMiscDataSourceRemoveUnknown0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanMiscDataSourceRemoveUnknown0002 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      const listener: MiscListener = new MiscListener();
      source.unregisterDataChangeListener(listener);
      source.notifyDataReload();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(0));
      expect(source.totalCount()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(0) === undefined));
      expect(source.getData(0) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanMiscDataSourceRemoveUnknown0002 end');
    })

    /**
     * @tc.name   testWlanMiscDataSourceIndex0003
     * @tc.number SUB_WLAN_MISC_DS_0003
     * @tc.desc   Read indexes around a single data source item.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanMiscDataSourceIndex0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanMiscDataSourceIndex0003 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      source.pushData(item(9));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).ssid), String('Wlan-9'));
      expect(source.getData(0).ssid).assertEqual('Wlan-9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(1) === undefined));
      expect(source.getData(1) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(-1) === undefined));
      expect(source.getData(-1) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanMiscDataSourceIndex0003 end');
    })

    /**
     * @tc.name   testWlanMiscDataSourceAppend0004
     * @tc.number SUB_WLAN_MISC_DS_0004
     * @tc.desc   Append after one existing item.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanMiscDataSourceAppend0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanMiscDataSourceAppend0004 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      source.pushData(item(1));
      source.addData(source.totalCount(), item(2));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(2));
      expect(source.totalCount()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1).ssid), String('Wlan-2'));
      expect(source.getData(1).ssid).assertEqual('Wlan-2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanMiscDataSourceAppend0004 end');
    })
  })
}
