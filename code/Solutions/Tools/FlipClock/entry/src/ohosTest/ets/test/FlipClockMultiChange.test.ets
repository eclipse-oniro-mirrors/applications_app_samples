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
class ListenerMore3 implements DataChangeListener {
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

export default function flipClockMultiChangeTest() {
  describe('FlipClockMultiChangeTest', () => {

    /**
     * @tc.name   testFlipClockMultiChange0000
     * @tc.number SUB_FLIP_CLOCK_MORE3_MCH_0000
     * @tc.desc   Notify two listeners with change 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMultiChange0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMultiChange0000 begin');
      const source: MyDataSource = new MyDataSource([]);
        const one: ListenerMore3 = new ListenerMore3();
        const two: ListenerMore3 = new ListenerMore3();
      source.registerDataChangeListener(one);
        source.registerDataChangeListener(two);
        source.notifyDataChange(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(one.change), String(1));
      expect(one.change).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(two.change), String(1));
        expect(two.change).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(one.add), String(0));
        expect(one.add).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMultiChange0000 end');
    })

    /**
     * @tc.name   testFlipClockMultiChange0001
     * @tc.number SUB_FLIP_CLOCK_MORE3_MCH_0001
     * @tc.desc   Notify two listeners with change 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMultiChange0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMultiChange0001 begin');
      const source: MyDataSource = new MyDataSource([]);
        const one: ListenerMore3 = new ListenerMore3();
        const two: ListenerMore3 = new ListenerMore3();
      source.registerDataChangeListener(one);
        source.registerDataChangeListener(two);
        source.notifyDataChange(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(one.change), String(1));
      expect(one.change).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(two.change), String(1));
        expect(two.change).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(one.add), String(0));
        expect(one.add).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMultiChange0001 end');
    })

    /**
     * @tc.name   testFlipClockMultiChange0002
     * @tc.number SUB_FLIP_CLOCK_MORE3_MCH_0002
     * @tc.desc   Notify two listeners with change 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMultiChange0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMultiChange0002 begin');
      const source: MyDataSource = new MyDataSource([]);
        const one: ListenerMore3 = new ListenerMore3();
        const two: ListenerMore3 = new ListenerMore3();
      source.registerDataChangeListener(one);
        source.registerDataChangeListener(two);
        source.notifyDataChange(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(one.change), String(1));
      expect(one.change).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(two.change), String(1));
        expect(two.change).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(one.add), String(0));
        expect(one.add).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMultiChange0002 end');
    })

    /**
     * @tc.name   testFlipClockMultiChange0003
     * @tc.number SUB_FLIP_CLOCK_MORE3_MCH_0003
     * @tc.desc   Notify two listeners with change 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMultiChange0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMultiChange0003 begin');
      const source: MyDataSource = new MyDataSource([]);
        const one: ListenerMore3 = new ListenerMore3();
        const two: ListenerMore3 = new ListenerMore3();
      source.registerDataChangeListener(one);
        source.registerDataChangeListener(two);
        source.notifyDataChange(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(one.change), String(1));
      expect(one.change).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(two.change), String(1));
        expect(two.change).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(one.add), String(0));
        expect(one.add).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMultiChange0003 end');
    })

    /**
     * @tc.name   testFlipClockMultiChange0004
     * @tc.number SUB_FLIP_CLOCK_MORE3_MCH_0004
     * @tc.desc   Notify two listeners with change 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMultiChange0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMultiChange0004 begin');
      const source: MyDataSource = new MyDataSource([]);
        const one: ListenerMore3 = new ListenerMore3();
        const two: ListenerMore3 = new ListenerMore3();
      source.registerDataChangeListener(one);
        source.registerDataChangeListener(two);
        source.notifyDataChange(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(one.change), String(1));
      expect(one.change).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(two.change), String(1));
        expect(two.change).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(one.add), String(0));
        expect(one.add).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMultiChange0004 end');
    })

    /**
     * @tc.name   testFlipClockMultiChange0005
     * @tc.number SUB_FLIP_CLOCK_MORE3_MCH_0005
     * @tc.desc   Notify two listeners with change 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMultiChange0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMultiChange0005 begin');
      const source: MyDataSource = new MyDataSource([]);
        const one: ListenerMore3 = new ListenerMore3();
        const two: ListenerMore3 = new ListenerMore3();
      source.registerDataChangeListener(one);
        source.registerDataChangeListener(two);
        source.notifyDataChange(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(one.change), String(1));
      expect(one.change).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(two.change), String(1));
        expect(two.change).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(one.add), String(0));
        expect(one.add).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMultiChange0005 end');
    })

    /**
     * @tc.name   testFlipClockMultiChange0006
     * @tc.number SUB_FLIP_CLOCK_MORE3_MCH_0006
     * @tc.desc   Notify two listeners with change 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMultiChange0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMultiChange0006 begin');
      const source: MyDataSource = new MyDataSource([]);
        const one: ListenerMore3 = new ListenerMore3();
        const two: ListenerMore3 = new ListenerMore3();
      source.registerDataChangeListener(one);
        source.registerDataChangeListener(two);
        source.notifyDataChange(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(one.change), String(1));
      expect(one.change).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(two.change), String(1));
        expect(two.change).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(one.add), String(0));
        expect(one.add).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMultiChange0006 end');
    })

    /**
     * @tc.name   testFlipClockMultiChange0007
     * @tc.number SUB_FLIP_CLOCK_MORE3_MCH_0007
     * @tc.desc   Notify two listeners with change 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMultiChange0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMultiChange0007 begin');
      const source: MyDataSource = new MyDataSource([]);
        const one: ListenerMore3 = new ListenerMore3();
        const two: ListenerMore3 = new ListenerMore3();
      source.registerDataChangeListener(one);
        source.registerDataChangeListener(two);
        source.notifyDataChange(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(one.change), String(1));
      expect(one.change).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(two.change), String(1));
        expect(two.change).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(one.add), String(0));
        expect(one.add).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMultiChange0007 end');
    })
  })
}
