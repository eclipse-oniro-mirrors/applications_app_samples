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
    ssid: `Wlan-${index}`,
    bssid: '00:11:22:33:44:55',
    bssidType: wifi.DeviceAddressType.REAL_DEVICE_ADDRESS,
    capabilities: 'ESS',
    securityType: wifi.WifiSecurityType.WIFI_SEC_TYPE_PSK,
    rssi: -40,
    band: 2,
    frequency: 2412,
    channelWidth: 20,
    centerFrequency0: 2412,
    centerFrequency1: 0,
    infoElems: [],
    timestamp: index,
    supportedWifiCategory: wifi.WifiCategory.DEFAULT,
    isHiLinkNetwork: false
  }
    ;
}

class WlanDataListener implements DataChangeListener {
  reloadCount: number = 0;
  addCount: number = 0;
  changeCount: number = 0;
  deleteCount: number = 0;
  moveCount: number = 0;
  lastIndex: number = -1;
  lastFrom: number = -1;
  lastTo: number = -1;

  onDataReloaded(): void {
    this.reloadCount++;
    }
  onDataAdded(index: number): void {
    this.addCount++;
    this.lastIndex = index;
    }
  onDataAdd(index: number): void {
    this.addCount++;
    this.lastIndex = index;
    }
  onDataMoved(from: number, to: number): void {
    this.moveCount++;
    this.lastFrom = from;
    this.lastTo = to;
    }
  onDataMove(from: number, to: number): void {
    this.moveCount++;
    this.lastFrom = from;
    this.lastTo = to;
    }
  onDataDeleted(index: number): void {
    this.deleteCount++;
    this.lastIndex = index;
    }
  onDataDelete(index: number): void {
    this.deleteCount++;
    this.lastIndex = index;
    }
  onDataChanged(index: number): void {
    this.changeCount++;
    this.lastIndex = index;
    }
  onDataChange(index: number): void {
    this.changeCount++;
    this.lastIndex = index;
    }
  onDatasetChange(dataOperations: DataOperation[]): void {
    this.reloadCount++;
    }
}

export default function wlanDataSourceListenerTest() {
  describe('WlanDataSourceListenerTest', () => {

    /**
     * @tc.name   ohos.samples.wlan_DataSourceListener_0001
     * @tc.number SUB_WLAN_LISTENER_0001
     * @tc.desc   Register one listener and reload data.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceListener_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceListener_0001 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      const listener: WlanDataListener = new WlanDataListener();
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.reloadCount), String(1));
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.addCount), String(0));
      expect(listener.addCount).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.changeCount), String(0));
      expect(listener.changeCount).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceListener_0001 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceListener_0002
     * @tc.number SUB_WLAN_LISTENER_0002
     * @tc.desc   Register the same listener twice without duplicate notifications.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceListener_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceListener_0002 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      const listener: WlanDataListener = new WlanDataListener();
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.reloadCount), String(1));
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(listener.reloadCount < 2));
      expect(listener.reloadCount < 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceListener_0002 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceListener_0003
     * @tc.number SUB_WLAN_LISTENER_0003
     * @tc.desc   Unregister a listener and stop notifications.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceListener_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceListener_0003 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      const listener: WlanDataListener = new WlanDataListener();
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.notifyDataReload();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.reloadCount), String(0));
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.addCount), String(0));
      expect(listener.addCount).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceListener_0003 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceListener_0004
     * @tc.number SUB_WLAN_LISTENER_0004
     * @tc.desc   Notify an add operation and keep the index.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceListener_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceListener_0004 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      const listener: WlanDataListener = new WlanDataListener();
      source.registerDataChangeListener(listener);
      source.pushData(makeInfo(1));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.addCount), String(1));
      expect(listener.addCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.lastIndex), String(0));
      expect(listener.lastIndex).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1));
      expect(source.totalCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceListener_0004 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceListener_0005
     * @tc.number SUB_WLAN_LISTENER_0005
     * @tc.desc   Notify an insert operation at a specific index.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceListener_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceListener_0005 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      const listener: WlanDataListener = new WlanDataListener();
      source.pushData(makeInfo(1));
      source.registerDataChangeListener(listener);
      source.addData(0, makeInfo(2));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.addCount), String(1));
      expect(listener.addCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.lastIndex), String(0));
      expect(listener.lastIndex).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(2));
      expect(source.totalCount()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceListener_0005 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceListener_0006
     * @tc.number SUB_WLAN_LISTENER_0006
     * @tc.desc   Notify a data change operation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceListener_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceListener_0006 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      const listener: WlanDataListener = new WlanDataListener();
      source.registerDataChangeListener(listener);
      source.notifyDataChange(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.changeCount), String(1));
      expect(listener.changeCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.lastIndex), String(2));
      expect(listener.lastIndex).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.reloadCount), String(0));
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceListener_0006 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceListener_0007
     * @tc.number SUB_WLAN_LISTENER_0007
     * @tc.desc   Notify a data delete operation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceListener_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceListener_0007 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      const listener: WlanDataListener = new WlanDataListener();
      source.registerDataChangeListener(listener);
      source.notifyDataDelete(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.deleteCount), String(1));
      expect(listener.deleteCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.lastIndex), String(1));
      expect(listener.lastIndex).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.addCount), String(0));
      expect(listener.addCount).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceListener_0007 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceListener_0008
     * @tc.number SUB_WLAN_LISTENER_0008
     * @tc.desc   Notify a data move operation with source and target.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceListener_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceListener_0008 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      const listener: WlanDataListener = new WlanDataListener();
      source.registerDataChangeListener(listener);
      source.notifyDataMove(1, 3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.moveCount), String(1));
      expect(listener.moveCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.lastFrom), String(1));
      expect(listener.lastFrom).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.lastTo), String(3));
      expect(listener.lastTo).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceListener_0008 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceListener_0009
     * @tc.number SUB_WLAN_LISTENER_0009
     * @tc.desc   Notify multiple operations and accumulate counts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceListener_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceListener_0009 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      const listener: WlanDataListener = new WlanDataListener();
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      source.notifyDataChange(0);
      source.notifyDataDelete(1);
      source.notifyDataMove(0, 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.reloadCount), String(1));
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.changeCount), String(1));
      expect(listener.changeCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.deleteCount), String(1));
      expect(listener.deleteCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.moveCount), String(1));
      expect(listener.moveCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceListener_0009 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceListener_0010
     * @tc.number SUB_WLAN_LISTENER_0010
     * @tc.desc   Notifications without listeners leave an empty source unchanged.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceListener_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceListener_0010 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      source.notifyDataReload();
      source.notifyDataAdd(0);
      source.notifyDataDelete(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(0));
      expect(source.totalCount()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(0) === undefined));
      expect(source.getData(0) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceListener_0010 end');
    })
  })
}
