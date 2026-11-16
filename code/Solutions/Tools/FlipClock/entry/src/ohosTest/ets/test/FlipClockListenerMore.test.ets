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
class MoreListener implements DataChangeListener {
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

export default function flipClockListenerMoreTest() {
  describe('FlipClockListenerMoreTest', () => {

    /**
     * @tc.name   testFlipClockMoreListener0001
     * @tc.number SUB_FLIP_CLOCK_MORE2_LISTENER_0001
     * @tc.desc   Verify notification counts for sequence 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMoreListener0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMoreListener0001 begin');
      const source: MyDataSource = new MyDataSource([]);
        const listener: MoreListener = new MoreListener();
        source.registerDataChangeListener(listener);
        source.notifyDataAdd(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.reload).assertEqual(0);');
      expect(listener.reload).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.add).assertEqual(1);');
        expect(listener.add).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.change).assertEqual(0);');
        expect(listener.change).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.del).assertEqual(0);');
        expect(listener.del).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.move).assertEqual(0);');
        expect(listener.move).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMoreListener0001 end');
    })

    /**
     * @tc.name   testFlipClockMoreListener0002
     * @tc.number SUB_FLIP_CLOCK_MORE2_LISTENER_0002
     * @tc.desc   Verify notification counts for sequence 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMoreListener0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMoreListener0002 begin');
      const source: MyDataSource = new MyDataSource([]);
        const listener: MoreListener = new MoreListener();
        source.registerDataChangeListener(listener);
        source.notifyDataChange(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.reload).assertEqual(0);');
      expect(listener.reload).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.add).assertEqual(0);');
        expect(listener.add).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.change).assertEqual(1);');
        expect(listener.change).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.del).assertEqual(0);');
        expect(listener.del).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.move).assertEqual(0);');
        expect(listener.move).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMoreListener0002 end');
    })

    /**
     * @tc.name   testFlipClockMoreListener0003
     * @tc.number SUB_FLIP_CLOCK_MORE2_LISTENER_0003
     * @tc.desc   Verify notification counts for sequence 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMoreListener0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMoreListener0003 begin');
      const source: MyDataSource = new MyDataSource([]);
        const listener: MoreListener = new MoreListener();
        source.registerDataChangeListener(listener);
        source.notifyDataDelete(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.reload).assertEqual(0);');
      expect(listener.reload).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.add).assertEqual(0);');
        expect(listener.add).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.change).assertEqual(0);');
        expect(listener.change).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.del).assertEqual(1);');
        expect(listener.del).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.move).assertEqual(0);');
        expect(listener.move).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMoreListener0003 end');
    })

    /**
     * @tc.name   testFlipClockMoreListener0004
     * @tc.number SUB_FLIP_CLOCK_MORE2_LISTENER_0004
     * @tc.desc   Verify notification counts for sequence 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMoreListener0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMoreListener0004 begin');
      const source: MyDataSource = new MyDataSource([]);
        const listener: MoreListener = new MoreListener();
        source.registerDataChangeListener(listener);
        source.notifyDataMove(0, 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.reload).assertEqual(0);');
      expect(listener.reload).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.add).assertEqual(0);');
        expect(listener.add).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.change).assertEqual(0);');
        expect(listener.change).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.del).assertEqual(0);');
        expect(listener.del).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.move).assertEqual(1);');
        expect(listener.move).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMoreListener0004 end');
    })

    /**
     * @tc.name   testFlipClockMoreListener0005
     * @tc.number SUB_FLIP_CLOCK_MORE2_LISTENER_0005
     * @tc.desc   Verify notification counts for sequence 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMoreListener0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMoreListener0005 begin');
      const source: MyDataSource = new MyDataSource([]);
        const listener: MoreListener = new MoreListener();
        source.registerDataChangeListener(listener);
        source.notifyDataReload();
        source.notifyDataAdd(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.reload).assertEqual(1);');
      expect(listener.reload).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.add).assertEqual(1);');
        expect(listener.add).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.change).assertEqual(0);');
        expect(listener.change).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.del).assertEqual(0);');
        expect(listener.del).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.move).assertEqual(0);');
        expect(listener.move).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMoreListener0005 end');
    })

    /**
     * @tc.name   testFlipClockMoreListener0006
     * @tc.number SUB_FLIP_CLOCK_MORE2_LISTENER_0006
     * @tc.desc   Verify notification counts for sequence 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMoreListener0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMoreListener0006 begin');
      const source: MyDataSource = new MyDataSource([]);
        const listener: MoreListener = new MoreListener();
        source.registerDataChangeListener(listener);
        source.notifyDataAdd(0);
        source.notifyDataChange(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.reload).assertEqual(0);');
      expect(listener.reload).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.add).assertEqual(1);');
        expect(listener.add).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.change).assertEqual(1);');
        expect(listener.change).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.del).assertEqual(0);');
        expect(listener.del).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.move).assertEqual(0);');
        expect(listener.move).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMoreListener0006 end');
    })

    /**
     * @tc.name   testFlipClockMoreListener0007
     * @tc.number SUB_FLIP_CLOCK_MORE2_LISTENER_0007
     * @tc.desc   Verify notification counts for sequence 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMoreListener0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMoreListener0007 begin');
      const source: MyDataSource = new MyDataSource([]);
        const listener: MoreListener = new MoreListener();
        source.registerDataChangeListener(listener);
        source.notifyDataChange(0);
        source.notifyDataDelete(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.reload).assertEqual(0);');
      expect(listener.reload).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.add).assertEqual(0);');
        expect(listener.add).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.change).assertEqual(1);');
        expect(listener.change).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.del).assertEqual(1);');
        expect(listener.del).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.move).assertEqual(0);');
        expect(listener.move).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMoreListener0007 end');
    })

    /**
     * @tc.name   testFlipClockMoreListener0008
     * @tc.number SUB_FLIP_CLOCK_MORE2_LISTENER_0008
     * @tc.desc   Verify notification counts for sequence 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMoreListener0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMoreListener0008 begin');
      const source: MyDataSource = new MyDataSource([]);
        const listener: MoreListener = new MoreListener();
        source.registerDataChangeListener(listener);
        source.notifyDataDelete(0);
        source.notifyDataMove(0, 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.reload).assertEqual(0);');
      expect(listener.reload).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.add).assertEqual(0);');
        expect(listener.add).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.change).assertEqual(0);');
        expect(listener.change).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.del).assertEqual(1);');
        expect(listener.del).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(listener.move).assertEqual(1);');
        expect(listener.move).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMoreListener0008 end');
    })
  })
}
