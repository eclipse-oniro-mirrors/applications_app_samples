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
import { MyDataSource } from '../../../main/ets/common/DataSource';
import { testTabs as tabArray } from './FlipClockTestTabs';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';
class FlipClockListener implements DataChangeListener {
  reloadCount: number = 0;
  addCount: number = 0;
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
    this.reloadCount++;
    }
}

export default function flipClockListenersTest() {
  describe('FlipClockListenersTest', () => {

    /**
     * @tc.name   ohos.samples.flipclock_Listeners_0001
     * @tc.number SUB_FLIP_CLOCK_LISTENER_001
     * @tc.desc   Notify a registered listener on push.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Listeners_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Listeners_0001 begin');
      const source: MyDataSource = new MyDataSource([]);
        const listener: FlipClockListener = new FlipClockListener();
      source.registerDataChangeListener(listener);
        source.pushData(tabArray[0]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.addCount), String(1));
      expect(listener.addCount).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1));
        expect(source.totalCount()).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.reloadCount), String(0));
        expect(listener.reloadCount).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Listeners_0001 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Listeners_0002
     * @tc.number SUB_FLIP_CLOCK_LISTENER_002
     * @tc.desc   Notify a registered listener on replace.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Listeners_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Listeners_0002 begin');
      const source: MyDataSource = new MyDataSource([]);
        const listener: FlipClockListener = new FlipClockListener();
      source.registerDataChangeListener(listener);
        source.replaceData(tabArray.slice());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.reloadCount), String(1));
      expect(listener.reloadCount).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(4));
        expect(source.totalCount()).assertEqual(4);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.addCount), String(0));
        expect(listener.addCount).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Listeners_0002 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Listeners_0003
     * @tc.number SUB_FLIP_CLOCK_LISTENER_003
     * @tc.desc   Stop notifications after unregister.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Listeners_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Listeners_0003 begin');
      const source: MyDataSource = new MyDataSource([]);
        const listener: FlipClockListener = new FlipClockListener();
      source.registerDataChangeListener(listener);
        source.unregisterDataChangeListener(listener);
        source.pushData(tabArray[0]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.addCount), String(0));
      expect(listener.addCount).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1));
        expect(source.totalCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Listeners_0003 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Listeners_0004
     * @tc.number SUB_FLIP_CLOCK_LISTENER_004
     * @tc.desc   Register the same listener twice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Listeners_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Listeners_0004 begin');
      const source: MyDataSource = new MyDataSource([]);
        const listener: FlipClockListener = new FlipClockListener();
      source.registerDataChangeListener(listener);
        source.registerDataChangeListener(listener);
        source.pushData(tabArray[0]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.addCount), String(1));
      expect(listener.addCount).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1));
        expect(source.totalCount()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Listeners_0004 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Listeners_0005
     * @tc.number SUB_FLIP_CLOCK_LISTENER_005
     * @tc.desc   Notify delete after data removal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Listeners_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Listeners_0005 begin');
      const source: MyDataSource = new MyDataSource(tabArray.slice());
        const listener: FlipClockListener = new FlipClockListener();
      source.registerDataChangeListener(listener);
        source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.addCount), String(1));
      expect(listener.addCount).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(3));
        expect(source.totalCount()).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Listeners_0005 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Listeners_0006
     * @tc.number SUB_FLIP_CLOCK_LISTENER_006
     * @tc.desc   Unknown listener removal keeps notifications.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Listeners_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Listeners_0006 begin');
      const source: MyDataSource = new MyDataSource([]);
        const first: FlipClockListener = new FlipClockListener();
        const second: FlipClockListener = new FlipClockListener();
      source.registerDataChangeListener(first);
        source.unregisterDataChangeListener(second);
        source.pushData(tabArray[0]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(first.addCount), String(1));
      expect(first.addCount).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(second.addCount), String(0));
        expect(second.addCount).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Listeners_0006 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Listeners_0007
     * @tc.number SUB_FLIP_CLOCK_LISTENER_007
     * @tc.desc   Two listeners both receive a push.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Listeners_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Listeners_0007 begin');
      const source: MyDataSource = new MyDataSource([]);
        const first: FlipClockListener = new FlipClockListener();
        const second: FlipClockListener = new FlipClockListener();
      source.registerDataChangeListener(first);
        source.registerDataChangeListener(second);
        source.pushData(tabArray[0]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(first.addCount), String(1));
      expect(first.addCount).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(second.addCount), String(1));
        expect(second.addCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Listeners_0007 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Listeners_0008
     * @tc.number SUB_FLIP_CLOCK_LISTENER_008
     * @tc.desc   Reload notification reaches both listeners.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Listeners_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Listeners_0008 begin');
      const source: MyDataSource = new MyDataSource([]);
        const first: FlipClockListener = new FlipClockListener();
        const second: FlipClockListener = new FlipClockListener();
      source.registerDataChangeListener(first);
        source.registerDataChangeListener(second);
        source.replaceData(tabArray.slice());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(first.reloadCount), String(1));
      expect(first.reloadCount).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(second.reloadCount), String(1));
        expect(second.reloadCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Listeners_0008 end');
    })
  })
}
