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
class SequenceListener implements DataChangeListener {
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

export default function flipClockListenerSequenceTest() {
  describe('FlipClockListenerSequenceTest', () => {

    /**
     * @tc.name   ohos.samples.flipclock_ListenerSequence_0001
     * @tc.number SUB_FLIP_CLOCK_MORE_SEQ_0001
     * @tc.desc   Verify notification sequence variant 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ListenerSequence_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ListenerSequence_0001 begin');
      const source: MyDataSource = new MyDataSource([]);
        const listener: SequenceListener = new SequenceListener();
        source.registerDataChangeListener(listener);
      source.notifyDataReload();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.reload), String(1));
      expect(listener.reload).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.add), String(0));
        expect(listener.add).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.change), String(0));
        expect(listener.change).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.del), String(0));
        expect(listener.del).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.move), String(0));
        expect(listener.move).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ListenerSequence_0001 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ListenerSequence_0002
     * @tc.number SUB_FLIP_CLOCK_MORE_SEQ_0002
     * @tc.desc   Verify notification sequence variant 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ListenerSequence_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ListenerSequence_0002 begin');
      const source: MyDataSource = new MyDataSource([]);
        const listener: SequenceListener = new SequenceListener();
        source.registerDataChangeListener(listener);
      source.notifyDataAdd(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.reload), String(0));
      expect(listener.reload).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.add), String(1));
        expect(listener.add).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.change), String(0));
        expect(listener.change).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.del), String(0));
        expect(listener.del).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.move), String(0));
        expect(listener.move).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ListenerSequence_0002 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ListenerSequence_0003
     * @tc.number SUB_FLIP_CLOCK_MORE_SEQ_0003
     * @tc.desc   Verify notification sequence variant 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ListenerSequence_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ListenerSequence_0003 begin');
      const source: MyDataSource = new MyDataSource([]);
        const listener: SequenceListener = new SequenceListener();
        source.registerDataChangeListener(listener);
      source.notifyDataChange(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.reload), String(0));
      expect(listener.reload).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.add), String(0));
        expect(listener.add).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.change), String(1));
        expect(listener.change).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.del), String(0));
        expect(listener.del).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.move), String(0));
        expect(listener.move).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ListenerSequence_0003 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ListenerSequence_0004
     * @tc.number SUB_FLIP_CLOCK_MORE_SEQ_0004
     * @tc.desc   Verify notification sequence variant 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ListenerSequence_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ListenerSequence_0004 begin');
      const source: MyDataSource = new MyDataSource([]);
        const listener: SequenceListener = new SequenceListener();
        source.registerDataChangeListener(listener);
      source.notifyDataDelete(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.reload), String(0));
      expect(listener.reload).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.add), String(0));
        expect(listener.add).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.change), String(0));
        expect(listener.change).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.del), String(1));
        expect(listener.del).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.move), String(0));
        expect(listener.move).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ListenerSequence_0004 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ListenerSequence_0005
     * @tc.number SUB_FLIP_CLOCK_MORE_SEQ_0005
     * @tc.desc   Verify notification sequence variant 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ListenerSequence_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ListenerSequence_0005 begin');
      const source: MyDataSource = new MyDataSource([]);
        const listener: SequenceListener = new SequenceListener();
        source.registerDataChangeListener(listener);
      source.notifyDataMove(0, 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.reload), String(0));
      expect(listener.reload).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.add), String(0));
        expect(listener.add).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.change), String(0));
        expect(listener.change).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.del), String(0));
        expect(listener.del).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.move), String(1));
        expect(listener.move).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ListenerSequence_0005 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ListenerSequence_0006
     * @tc.number SUB_FLIP_CLOCK_MORE_SEQ_0006
     * @tc.desc   Verify notification sequence variant 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ListenerSequence_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ListenerSequence_0006 begin');
      const source: MyDataSource = new MyDataSource([]);
        const listener: SequenceListener = new SequenceListener();
        source.registerDataChangeListener(listener);
      source.notifyDataReload();
        source.notifyDataAdd(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.reload), String(1));
      expect(listener.reload).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.add), String(1));
        expect(listener.add).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.change), String(0));
        expect(listener.change).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.del), String(0));
        expect(listener.del).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.move), String(0));
        expect(listener.move).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ListenerSequence_0006 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ListenerSequence_0007
     * @tc.number SUB_FLIP_CLOCK_MORE_SEQ_0007
     * @tc.desc   Verify notification sequence variant 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ListenerSequence_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ListenerSequence_0007 begin');
      const source: MyDataSource = new MyDataSource([]);
        const listener: SequenceListener = new SequenceListener();
        source.registerDataChangeListener(listener);
      source.notifyDataAdd(0);
        source.notifyDataChange(1);
        source.notifyDataDelete(2);
        source.notifyDataMove(0, 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.reload), String(0));
      expect(listener.reload).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.add), String(1));
        expect(listener.add).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.change), String(1));
        expect(listener.change).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.del), String(1));
        expect(listener.del).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.move), String(1));
        expect(listener.move).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ListenerSequence_0007 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ListenerSequence_0008
     * @tc.number SUB_FLIP_CLOCK_MORE_SEQ_0008
     * @tc.desc   Verify notification sequence variant 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ListenerSequence_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ListenerSequence_0008 begin');
      const source: MyDataSource = new MyDataSource([]);
        const listener: SequenceListener = new SequenceListener();
        source.registerDataChangeListener(listener);
      source.notifyDataReload();
        source.notifyDataChange(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.reload), String(1));
      expect(listener.reload).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.add), String(0));
        expect(listener.add).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.change), String(1));
        expect(listener.change).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.del), String(0));
        expect(listener.del).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(listener.move), String(0));
        expect(listener.move).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ListenerSequence_0008 end');
    })
  })
}
