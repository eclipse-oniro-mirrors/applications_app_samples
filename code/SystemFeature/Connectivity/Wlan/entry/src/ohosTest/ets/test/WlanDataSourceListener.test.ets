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
import wifi from '@ohos.wifiManager';
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
     * @tc.name   testWlanListenerRegister0001
     * @tc.number SUB_WLAN_LISTENER_0001
     * @tc.desc   Register one listener and reload data.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanListenerRegister0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanListenerRegister0001 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      const listener: WlanDataListener = new WlanDataListener();
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.reloadCount).assertEqual(1);');
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.addCount).assertEqual(0);');
      expect(listener.addCount).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.changeCount).assertEqual(0);');
      expect(listener.changeCount).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanListenerRegister0001 end');
    })

    /**
     * @tc.name   testWlanListenerDuplicate0002
     * @tc.number SUB_WLAN_LISTENER_0002
     * @tc.desc   Register the same listener twice without duplicate notifications.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanListenerDuplicate0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanListenerDuplicate0002 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      const listener: WlanDataListener = new WlanDataListener();
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.reloadCount).assertEqual(1);');
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.reloadCount < 2).assertTrue();');
      expect(listener.reloadCount < 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanListenerDuplicate0002 end');
    })

    /**
     * @tc.name   testWlanListenerUnregister0003
     * @tc.number SUB_WLAN_LISTENER_0003
     * @tc.desc   Unregister a listener and stop notifications.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanListenerUnregister0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanListenerUnregister0003 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      const listener: WlanDataListener = new WlanDataListener();
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.notifyDataReload();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.reloadCount).assertEqual(0);');
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.addCount).assertEqual(0);');
      expect(listener.addCount).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanListenerUnregister0003 end');
    })

    /**
     * @tc.name   testWlanListenerAdd0004
     * @tc.number SUB_WLAN_LISTENER_0004
     * @tc.desc   Notify an add operation and keep the index.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanListenerAdd0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanListenerAdd0004 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      const listener: WlanDataListener = new WlanDataListener();
      source.registerDataChangeListener(listener);
      source.pushData(makeInfo(1));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.addCount).assertEqual(1);');
      expect(listener.addCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.lastIndex).assertEqual(0);');
      expect(listener.lastIndex).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1);');
      expect(source.totalCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanListenerAdd0004 end');
    })

    /**
     * @tc.name   testWlanListenerInsert0005
     * @tc.number SUB_WLAN_LISTENER_0005
     * @tc.desc   Notify an insert operation at a specific index.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanListenerInsert0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanListenerInsert0005 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      const listener: WlanDataListener = new WlanDataListener();
      source.pushData(makeInfo(1));
      source.registerDataChangeListener(listener);
      source.addData(0, makeInfo(2));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.addCount).assertEqual(1);');
      expect(listener.addCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.lastIndex).assertEqual(0);');
      expect(listener.lastIndex).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(2);');
      expect(source.totalCount()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanListenerInsert0005 end');
    })

    /**
     * @tc.name   testWlanListenerChange0006
     * @tc.number SUB_WLAN_LISTENER_0006
     * @tc.desc   Notify a data change operation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanListenerChange0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanListenerChange0006 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      const listener: WlanDataListener = new WlanDataListener();
      source.registerDataChangeListener(listener);
      source.notifyDataChange(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.changeCount).assertEqual(1);');
      expect(listener.changeCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.lastIndex).assertEqual(2);');
      expect(listener.lastIndex).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.reloadCount).assertEqual(0);');
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanListenerChange0006 end');
    })

    /**
     * @tc.name   testWlanListenerDelete0007
     * @tc.number SUB_WLAN_LISTENER_0007
     * @tc.desc   Notify a data delete operation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanListenerDelete0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanListenerDelete0007 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      const listener: WlanDataListener = new WlanDataListener();
      source.registerDataChangeListener(listener);
      source.notifyDataDelete(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.deleteCount).assertEqual(1);');
      expect(listener.deleteCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.lastIndex).assertEqual(1);');
      expect(listener.lastIndex).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.addCount).assertEqual(0);');
      expect(listener.addCount).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanListenerDelete0007 end');
    })

    /**
     * @tc.name   testWlanListenerMove0008
     * @tc.number SUB_WLAN_LISTENER_0008
     * @tc.desc   Notify a data move operation with source and target.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanListenerMove0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanListenerMove0008 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      const listener: WlanDataListener = new WlanDataListener();
      source.registerDataChangeListener(listener);
      source.notifyDataMove(1, 3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.moveCount).assertEqual(1);');
      expect(listener.moveCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.lastFrom).assertEqual(1);');
      expect(listener.lastFrom).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.lastTo).assertEqual(3);');
      expect(listener.lastTo).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanListenerMove0008 end');
    })

    /**
     * @tc.name   testWlanListenerMulti0009
     * @tc.number SUB_WLAN_LISTENER_0009
     * @tc.desc   Notify multiple operations and accumulate counts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanListenerMulti0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanListenerMulti0009 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      const listener: WlanDataListener = new WlanDataListener();
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      source.notifyDataChange(0);
      source.notifyDataDelete(1);
      source.notifyDataMove(0, 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.reloadCount).assertEqual(1);');
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.changeCount).assertEqual(1);');
      expect(listener.changeCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.deleteCount).assertEqual(1);');
      expect(listener.deleteCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.moveCount).assertEqual(1);');
      expect(listener.moveCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanListenerMulti0009 end');
    })

    /**
     * @tc.name   testWlanListenerEmptyNoop0010
     * @tc.number SUB_WLAN_LISTENER_0010
     * @tc.desc   Notifications without listeners leave an empty source unchanged.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanListenerEmptyNoop0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanListenerEmptyNoop0010 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      source.notifyDataReload();
      source.notifyDataAdd(0);
      source.notifyDataDelete(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(0);');
      expect(source.totalCount()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0) === undefined).assertTrue();');
      expect(source.getData(0) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanListenerEmptyNoop0010 end');
    })
  })
}
