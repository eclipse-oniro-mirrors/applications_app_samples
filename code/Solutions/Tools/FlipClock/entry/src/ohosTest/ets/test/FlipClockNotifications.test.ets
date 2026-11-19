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
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';
class NotifyListener implements DataChangeListener {
  reload: number = 0;
    add: number = 0;
    change: number = 0;
    del: number = 0;
    move: number = 0;
  onDataReloaded(): void {
    this.reload++;
    }
  onDataAdded(index: number): void {
    this.add++;
    }
  onDataAdd(index: number): void {
    this.add++;
    }
  onDataMoved(from: number, to: number): void {
    this.move++;
    }
  onDataMove(from: number, to: number): void {
    this.move++;
    }
  onDataDeleted(index: number): void {
    this.del++;
    }
  onDataDelete(index: number): void {
    this.del++;
    }
  onDataChanged(index: number): void {
    this.change++;
    }
  onDataChange(index: number): void {
    this.change++;
    }
  onDatasetChange(dataOperations: DataOperation[]): void {
    this.reload++;
    }
}

export default function flipClockNotificationsTest() {
  describe('FlipClockNotificationsTest', () => {

    /**
     * @tc.name   ohos.samples.flipclock_Notifications_0001
     * @tc.number SUB_FLIP_CLOCK_EDGE_NOTIFY_001
     * @tc.desc   Notify data change to a listener.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Notifications_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Notifications_0001 begin');
      const source: MyDataSource = new MyDataSource([]);
        const listener: NotifyListener = new NotifyListener();
        source.registerDataChangeListener(listener);
        source.notifyDataChange(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.change), String(1));
      expect(listener.change).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.reload), String(0));
        expect(listener.reload).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.del), String(0));
        expect(listener.del).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Notifications_0001 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Notifications_0002
     * @tc.number SUB_FLIP_CLOCK_EDGE_NOTIFY_002
     * @tc.desc   Notify data delete to a listener.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Notifications_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Notifications_0002 begin');
      const source: MyDataSource = new MyDataSource([]);
        const listener: NotifyListener = new NotifyListener();
        source.registerDataChangeListener(listener);
        source.notifyDataDelete(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.del), String(1));
      expect(listener.del).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.change), String(0));
        expect(listener.change).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.add), String(0));
        expect(listener.add).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Notifications_0002 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Notifications_0003
     * @tc.number SUB_FLIP_CLOCK_EDGE_NOTIFY_003
     * @tc.desc   Notify data move to a listener.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Notifications_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Notifications_0003 begin');
      const source: MyDataSource = new MyDataSource([]);
        const listener: NotifyListener = new NotifyListener();
        source.registerDataChangeListener(listener);
        source.notifyDataMove(0, 3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.move), String(1));
      expect(listener.move).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.add), String(0));
        expect(listener.add).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.del), String(0));
        expect(listener.del).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Notifications_0003 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Notifications_0004
     * @tc.number SUB_FLIP_CLOCK_EDGE_NOTIFY_004
     * @tc.desc   Notify reload to a listener.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Notifications_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Notifications_0004 begin');
      const source: MyDataSource = new MyDataSource([]);
        const listener: NotifyListener = new NotifyListener();
        source.registerDataChangeListener(listener);
        source.notifyDataReload();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.reload), String(1));
      expect(listener.reload).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.change), String(0));
        expect(listener.change).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.move), String(0));
        expect(listener.move).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Notifications_0004 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Notifications_0005
     * @tc.number SUB_FLIP_CLOCK_EDGE_NOTIFY_005
     * @tc.desc   Notify add to a listener.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Notifications_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Notifications_0005 begin');
      const source: MyDataSource = new MyDataSource([]);
        const listener: NotifyListener = new NotifyListener();
        source.registerDataChangeListener(listener);
        source.notifyDataAdd(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.add), String(1));
      expect(listener.add).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.reload), String(0));
        expect(listener.reload).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.del), String(0));
        expect(listener.del).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Notifications_0005 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Notifications_0006
     * @tc.number SUB_FLIP_CLOCK_EDGE_NOTIFY_006
     * @tc.desc   Notify two listeners on change.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Notifications_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Notifications_0006 begin');
      const source: MyDataSource = new MyDataSource([]);
        const a: NotifyListener = new NotifyListener();
        const b: NotifyListener = new NotifyListener();
        source.registerDataChangeListener(a);
        source.registerDataChangeListener(b);
        source.notifyDataChange(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(a.change), String(1));
      expect(a.change).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(b.change), String(1));
        expect(b.change).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(a.add), String(0));
        expect(a.add).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Notifications_0006 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Notifications_0007
     * @tc.number SUB_FLIP_CLOCK_EDGE_NOTIFY_007
     * @tc.desc   Stop notifications after unregister.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Notifications_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Notifications_0007 begin');
      const source: MyDataSource = new MyDataSource([]);
        const listener: NotifyListener = new NotifyListener();
        source.registerDataChangeListener(listener);
        source.unregisterDataChangeListener(listener);
        source.notifyDataReload();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.reload), String(0));
      expect(listener.reload).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.add), String(0));
        expect(listener.add).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Notifications_0007 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Notifications_0008
     * @tc.number SUB_FLIP_CLOCK_EDGE_NOTIFY_008
     * @tc.desc   Register duplicate listener once.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Notifications_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Notifications_0008 begin');
      const source: MyDataSource = new MyDataSource([]);
        const listener: NotifyListener = new NotifyListener();
        source.registerDataChangeListener(listener);
        source.registerDataChangeListener(listener);
        source.notifyDataReload();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.reload), String(1));
      expect(listener.reload).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.add), String(0));
        expect(listener.add).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.del), String(0));
        expect(listener.del).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Notifications_0008 end');
    })
  })
}
