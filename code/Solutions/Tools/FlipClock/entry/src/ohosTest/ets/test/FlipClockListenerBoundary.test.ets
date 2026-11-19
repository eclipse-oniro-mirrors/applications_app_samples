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
class BoundaryListener implements DataChangeListener {
  reload: number = 0;
    add: number = 0;
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
    this.reload++;
    }
}

export default function flipClockListenerBoundaryTest() {
  describe('FlipClockListenerBoundaryTest', () => {

    /**
     * @tc.name   ohos.samples.flipclock_ListenerBoundary_0001
     * @tc.number SUB_FLIP_CLOCK_BOUND_LIS_001
     * @tc.desc   Notify without registered listeners.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ListenerBoundary_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ListenerBoundary_0001 begin');
      const source: MyDataSource = new MyDataSource([]);
        source.notifyDataReload();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(0));
        expect(source.totalCount()).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(0) === undefined));
        expect(source.getData(0) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ListenerBoundary_0001 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ListenerBoundary_0002
     * @tc.number SUB_FLIP_CLOCK_BOUND_LIS_002
     * @tc.desc   Register and notify one listener.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ListenerBoundary_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ListenerBoundary_0002 begin');
      const source: MyDataSource = new MyDataSource([]);
        const l: BoundaryListener = new BoundaryListener();
        source.registerDataChangeListener(l);
        source.notifyDataReload();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(l.reload), String(1));
        expect(l.reload).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(l.add), String(0));
        expect(l.add).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ListenerBoundary_0002 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ListenerBoundary_0003
     * @tc.number SUB_FLIP_CLOCK_BOUND_LIS_003
     * @tc.desc   Register the same listener three times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ListenerBoundary_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ListenerBoundary_0003 begin');
      const source: MyDataSource = new MyDataSource([]);
        const l: BoundaryListener = new BoundaryListener();
        source.registerDataChangeListener(l);
        source.registerDataChangeListener(l);
        source.registerDataChangeListener(l);
        source.notifyDataReload();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(l.reload), String(1));
        expect(l.reload).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ListenerBoundary_0003 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ListenerBoundary_0004
     * @tc.number SUB_FLIP_CLOCK_BOUND_LIS_004
     * @tc.desc   Unregister an unknown listener.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ListenerBoundary_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ListenerBoundary_0004 begin');
      const source: MyDataSource = new MyDataSource([]);
        const l: BoundaryListener = new BoundaryListener();
        source.unregisterDataChangeListener(l);
        source.notifyDataReload();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(l.reload), String(0));
        expect(l.reload).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ListenerBoundary_0004 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ListenerBoundary_0005
     * @tc.number SUB_FLIP_CLOCK_BOUND_LIS_005
     * @tc.desc   Unregister twice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ListenerBoundary_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ListenerBoundary_0005 begin');
      const source: MyDataSource = new MyDataSource([]);
        const l: BoundaryListener = new BoundaryListener();
        source.registerDataChangeListener(l);
        source.unregisterDataChangeListener(l);
        source.unregisterDataChangeListener(l);
        source.notifyDataReload();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(l.reload), String(0));
        expect(l.reload).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ListenerBoundary_0005 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ListenerBoundary_0006
     * @tc.number SUB_FLIP_CLOCK_BOUND_LIS_006
     * @tc.desc   Re-register after unregister.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ListenerBoundary_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ListenerBoundary_0006 begin');
      const source: MyDataSource = new MyDataSource([]);
        const l: BoundaryListener = new BoundaryListener();
        source.registerDataChangeListener(l);
        source.unregisterDataChangeListener(l);
        source.registerDataChangeListener(l);
        source.notifyDataReload();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(l.reload), String(1));
        expect(l.reload).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ListenerBoundary_0006 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ListenerBoundary_0007
     * @tc.number SUB_FLIP_CLOCK_BOUND_LIS_007
     * @tc.desc   Two listeners both receive reload.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ListenerBoundary_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ListenerBoundary_0007 begin');
      const source: MyDataSource = new MyDataSource([]);
        const a: BoundaryListener = new BoundaryListener();
        const b: BoundaryListener = new BoundaryListener();
        source.registerDataChangeListener(a);
        source.registerDataChangeListener(b);
        source.notifyDataReload();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(a.reload), String(1));
        expect(a.reload).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(b.reload), String(1));
        expect(b.reload).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ListenerBoundary_0007 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ListenerBoundary_0008
     * @tc.number SUB_FLIP_CLOCK_BOUND_LIS_008
     * @tc.desc   Unregister one of two listeners.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ListenerBoundary_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ListenerBoundary_0008 begin');
      const source: MyDataSource = new MyDataSource([]);
        const a: BoundaryListener = new BoundaryListener();
        const b: BoundaryListener = new BoundaryListener();
        source.registerDataChangeListener(a);
        source.registerDataChangeListener(b);
        source.unregisterDataChangeListener(a);
        source.notifyDataReload();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(a.reload), String(0));
        expect(a.reload).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(b.reload), String(1));
        expect(b.reload).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ListenerBoundary_0008 end');
    })
  })
}
