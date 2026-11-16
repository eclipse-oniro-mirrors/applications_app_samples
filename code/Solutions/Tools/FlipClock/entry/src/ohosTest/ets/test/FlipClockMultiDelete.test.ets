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

export default function flipClockMultiDeleteTest() {
  describe('FlipClockMultiDeleteTest', () => {

    /**
     * @tc.name   testFlipClockMultiDelete0000
     * @tc.number SUB_FLIP_CLOCK_MORE3_MDEL_0000
     * @tc.desc   Notify two listeners with delete 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMultiDelete0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMultiDelete0000 begin');
      const source: MyDataSource = new MyDataSource([]);
        const one: ListenerMore3 = new ListenerMore3();
        const two: ListenerMore3 = new ListenerMore3();
      source.registerDataChangeListener(one);
        source.registerDataChangeListener(two);
        source.notifyDataDelete(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(one.del).assertEqual(1);');
      expect(one.del).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(two.del).assertEqual(1);');
        expect(two.del).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(one.move).assertEqual(0);');
        expect(one.move).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMultiDelete0000 end');
    })

    /**
     * @tc.name   testFlipClockMultiDelete0001
     * @tc.number SUB_FLIP_CLOCK_MORE3_MDEL_0001
     * @tc.desc   Notify two listeners with delete 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMultiDelete0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMultiDelete0001 begin');
      const source: MyDataSource = new MyDataSource([]);
        const one: ListenerMore3 = new ListenerMore3();
        const two: ListenerMore3 = new ListenerMore3();
      source.registerDataChangeListener(one);
        source.registerDataChangeListener(two);
        source.notifyDataDelete(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(one.del).assertEqual(1);');
      expect(one.del).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(two.del).assertEqual(1);');
        expect(two.del).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(one.move).assertEqual(0);');
        expect(one.move).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMultiDelete0001 end');
    })

    /**
     * @tc.name   testFlipClockMultiDelete0002
     * @tc.number SUB_FLIP_CLOCK_MORE3_MDEL_0002
     * @tc.desc   Notify two listeners with delete 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMultiDelete0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMultiDelete0002 begin');
      const source: MyDataSource = new MyDataSource([]);
        const one: ListenerMore3 = new ListenerMore3();
        const two: ListenerMore3 = new ListenerMore3();
      source.registerDataChangeListener(one);
        source.registerDataChangeListener(two);
        source.notifyDataDelete(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(one.del).assertEqual(1);');
      expect(one.del).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(two.del).assertEqual(1);');
        expect(two.del).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(one.move).assertEqual(0);');
        expect(one.move).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMultiDelete0002 end');
    })

    /**
     * @tc.name   testFlipClockMultiDelete0003
     * @tc.number SUB_FLIP_CLOCK_MORE3_MDEL_0003
     * @tc.desc   Notify two listeners with delete 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMultiDelete0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMultiDelete0003 begin');
      const source: MyDataSource = new MyDataSource([]);
        const one: ListenerMore3 = new ListenerMore3();
        const two: ListenerMore3 = new ListenerMore3();
      source.registerDataChangeListener(one);
        source.registerDataChangeListener(two);
        source.notifyDataDelete(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(one.del).assertEqual(1);');
      expect(one.del).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(two.del).assertEqual(1);');
        expect(two.del).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(one.move).assertEqual(0);');
        expect(one.move).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMultiDelete0003 end');
    })

    /**
     * @tc.name   testFlipClockMultiDelete0004
     * @tc.number SUB_FLIP_CLOCK_MORE3_MDEL_0004
     * @tc.desc   Notify two listeners with delete 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMultiDelete0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMultiDelete0004 begin');
      const source: MyDataSource = new MyDataSource([]);
        const one: ListenerMore3 = new ListenerMore3();
        const two: ListenerMore3 = new ListenerMore3();
      source.registerDataChangeListener(one);
        source.registerDataChangeListener(two);
        source.notifyDataDelete(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(one.del).assertEqual(1);');
      expect(one.del).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(two.del).assertEqual(1);');
        expect(two.del).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(one.move).assertEqual(0);');
        expect(one.move).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMultiDelete0004 end');
    })

    /**
     * @tc.name   testFlipClockMultiDelete0005
     * @tc.number SUB_FLIP_CLOCK_MORE3_MDEL_0005
     * @tc.desc   Notify two listeners with delete 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMultiDelete0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMultiDelete0005 begin');
      const source: MyDataSource = new MyDataSource([]);
        const one: ListenerMore3 = new ListenerMore3();
        const two: ListenerMore3 = new ListenerMore3();
      source.registerDataChangeListener(one);
        source.registerDataChangeListener(two);
        source.notifyDataDelete(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(one.del).assertEqual(1);');
      expect(one.del).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(two.del).assertEqual(1);');
        expect(two.del).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(one.move).assertEqual(0);');
        expect(one.move).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMultiDelete0005 end');
    })

    /**
     * @tc.name   testFlipClockMultiDelete0006
     * @tc.number SUB_FLIP_CLOCK_MORE3_MDEL_0006
     * @tc.desc   Notify two listeners with delete 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMultiDelete0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMultiDelete0006 begin');
      const source: MyDataSource = new MyDataSource([]);
        const one: ListenerMore3 = new ListenerMore3();
        const two: ListenerMore3 = new ListenerMore3();
      source.registerDataChangeListener(one);
        source.registerDataChangeListener(two);
        source.notifyDataDelete(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(one.del).assertEqual(1);');
      expect(one.del).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(two.del).assertEqual(1);');
        expect(two.del).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(one.move).assertEqual(0);');
        expect(one.move).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMultiDelete0006 end');
    })

    /**
     * @tc.name   testFlipClockMultiDelete0007
     * @tc.number SUB_FLIP_CLOCK_MORE3_MDEL_0007
     * @tc.desc   Notify two listeners with delete 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMultiDelete0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMultiDelete0007 begin');
      const source: MyDataSource = new MyDataSource([]);
        const one: ListenerMore3 = new ListenerMore3();
        const two: ListenerMore3 = new ListenerMore3();
      source.registerDataChangeListener(one);
        source.registerDataChangeListener(two);
        source.notifyDataDelete(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(one.del).assertEqual(1);');
      expect(one.del).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(two.del).assertEqual(1);');
        expect(two.del).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(one.move).assertEqual(0);');
        expect(one.move).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMultiDelete0007 end');
    })
  })
}
