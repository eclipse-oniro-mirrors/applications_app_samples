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
import WifiDataSource from '../../../../src/main/ets/component/BasicDataSource';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';
class MultiListener implements DataChangeListener {
  reloadCount: number = 0;
  addCount: number = 0;
  changeCount: number = 0;
  deleteCount: number = 0;
  moveCount: number = 0;
  onDataReloaded(): void {
    this.reloadCount++;
    }
  onDataAdded(index: number): void {
    this.addCount++;
    }
  onDataAdd(index: number): void {
    this.addCount++;
    }
  onDataMoved(from: number, to: number): void {
    this.moveCount++;
    }
  onDataMove(from: number, to: number): void {
    this.moveCount++;
    }
  onDataDeleted(index: number): void {
    this.deleteCount++;
    }
  onDataDelete(index: number): void {
    this.deleteCount++;
    }
  onDataChanged(index: number): void {
    this.changeCount++;
    }
  onDataChange(index: number): void {
    this.changeCount++;
    }
  onDatasetChange(dataOperations: DataOperation[]): void {
    this.reloadCount++;
    }
}

export default function wlanDataSourceMultiListenerTest() {
  describe('WlanDataSourceMultiListenerTest', () => {

    /**
     * @tc.name   ohos.samples.wlan_DataSourceMultiListener_0001
     * @tc.number SUB_WLAN_MULTI_0001
     * @tc.desc   Notify two registered listeners on reload.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceMultiListener_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceMultiListener_0001 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      const first: MultiListener = new MultiListener();
      const second: MultiListener = new MultiListener();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.notifyDataReload();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(first.reloadCount), String(1));
      expect(first.reloadCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(second.reloadCount), String(1));
      expect(second.reloadCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(first.reloadCount + second.reloadCount), String(2));
      expect(first.reloadCount + second.reloadCount).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceMultiListener_0001 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceMultiListener_0002
     * @tc.number SUB_WLAN_MULTI_0002
     * @tc.desc   Unregister one listener while keeping the other.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceMultiListener_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceMultiListener_0002 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      const first: MultiListener = new MultiListener();
      const second: MultiListener = new MultiListener();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.unregisterDataChangeListener(first);
      source.notifyDataReload();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(first.reloadCount), String(0));
      expect(first.reloadCount).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(second.reloadCount), String(1));
      expect(second.reloadCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceMultiListener_0002 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceMultiListener_0003
     * @tc.number SUB_WLAN_MULTI_0003
     * @tc.desc   Notify change to both listeners.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceMultiListener_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceMultiListener_0003 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      const first: MultiListener = new MultiListener();
      const second: MultiListener = new MultiListener();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.notifyDataChange(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(first.changeCount), String(1));
      expect(first.changeCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(second.changeCount), String(1));
      expect(second.changeCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceMultiListener_0003 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceMultiListener_0004
     * @tc.number SUB_WLAN_MULTI_0004
     * @tc.desc   Notify delete to both listeners.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceMultiListener_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceMultiListener_0004 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      const first: MultiListener = new MultiListener();
      const second: MultiListener = new MultiListener();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.notifyDataDelete(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(first.deleteCount), String(1));
      expect(first.deleteCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(second.deleteCount), String(1));
      expect(second.deleteCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceMultiListener_0004 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceMultiListener_0005
     * @tc.number SUB_WLAN_MULTI_0005
     * @tc.desc   Notify move to both listeners.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceMultiListener_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceMultiListener_0005 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      const first: MultiListener = new MultiListener();
      const second: MultiListener = new MultiListener();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.notifyDataMove(0, 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(first.moveCount), String(1));
      expect(first.moveCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(second.moveCount), String(1));
      expect(second.moveCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceMultiListener_0005 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_DataSourceMultiListener_0006
     * @tc.number SUB_WLAN_MULTI_0006
     * @tc.desc   Removing an unknown listener does not affect registered listeners.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_DataSourceMultiListener_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceMultiListener_0006 begin');
      const source: WifiDataSource = new WifiDataSource([]);
      const first: MultiListener = new MultiListener();
      const second: MultiListener = new MultiListener();
      source.registerDataChangeListener(first);
      source.unregisterDataChangeListener(second);
      source.notifyDataReload();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(first.reloadCount), String(1));
      expect(first.reloadCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(second.reloadCount), String(0));
      expect(second.reloadCount).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_DataSourceMultiListener_0006 end');
    })
  })
}
