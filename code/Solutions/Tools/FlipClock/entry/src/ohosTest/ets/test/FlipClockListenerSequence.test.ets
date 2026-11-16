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
import { MyDataSource } from '../../../main/ets/common/DataSource';
class SequenceListener implements DataChangeListener {
  reload: number = 0; add: number = 0; change: number = 0; del: number = 0; move: number = 0;
  onDataReloaded(): void { this.reload++; }
  onDataAdded(index: number): void { this.add++; }
  onDataAdd(index: number): void { this.add++; }
  onDataMoved(from: number, to: number): void { this.move++; }
  onDataMove(from: number, to: number): void { this.move++; }
  onDataDeleted(index: number): void { this.del++; }
  onDataDelete(index: number): void { this.del++; }
  onDataChanged(index: number): void { this.change++; }
  onDataChange(index: number): void { this.change++; }
  onDatasetChange(dataOperations: DataOperation[]): void { this.reload++; }
}

export default function flipClockListenerSequenceTest() {
  describe('FlipClockListenerSequenceTest', () => {

    /**
     * @tc.name   testFlipClockSequence0001
     * @tc.number SUB_FLIP_CLOCK_MORE_SEQ_0001
     * @tc.desc   Verify notification sequence variant 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockSequence0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); const listener: SequenceListener = new SequenceListener(); source.registerDataChangeListener(listener);
      source.notifyDataReload();
      expect(listener.reload).assertEqual(1); expect(listener.add).assertEqual(0); expect(listener.change).assertEqual(0); expect(listener.del).assertEqual(0); expect(listener.move).assertEqual(0);
    })

    /**
     * @tc.name   testFlipClockSequence0002
     * @tc.number SUB_FLIP_CLOCK_MORE_SEQ_0002
     * @tc.desc   Verify notification sequence variant 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockSequence0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); const listener: SequenceListener = new SequenceListener(); source.registerDataChangeListener(listener);
      source.notifyDataAdd(0);
      expect(listener.reload).assertEqual(0); expect(listener.add).assertEqual(1); expect(listener.change).assertEqual(0); expect(listener.del).assertEqual(0); expect(listener.move).assertEqual(0);
    })

    /**
     * @tc.name   testFlipClockSequence0003
     * @tc.number SUB_FLIP_CLOCK_MORE_SEQ_0003
     * @tc.desc   Verify notification sequence variant 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockSequence0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); const listener: SequenceListener = new SequenceListener(); source.registerDataChangeListener(listener);
      source.notifyDataChange(1);
      expect(listener.reload).assertEqual(0); expect(listener.add).assertEqual(0); expect(listener.change).assertEqual(1); expect(listener.del).assertEqual(0); expect(listener.move).assertEqual(0);
    })

    /**
     * @tc.name   testFlipClockSequence0004
     * @tc.number SUB_FLIP_CLOCK_MORE_SEQ_0004
     * @tc.desc   Verify notification sequence variant 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockSequence0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); const listener: SequenceListener = new SequenceListener(); source.registerDataChangeListener(listener);
      source.notifyDataDelete(2);
      expect(listener.reload).assertEqual(0); expect(listener.add).assertEqual(0); expect(listener.change).assertEqual(0); expect(listener.del).assertEqual(1); expect(listener.move).assertEqual(0);
    })

    /**
     * @tc.name   testFlipClockSequence0005
     * @tc.number SUB_FLIP_CLOCK_MORE_SEQ_0005
     * @tc.desc   Verify notification sequence variant 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockSequence0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); const listener: SequenceListener = new SequenceListener(); source.registerDataChangeListener(listener);
      source.notifyDataMove(0, 2);
      expect(listener.reload).assertEqual(0); expect(listener.add).assertEqual(0); expect(listener.change).assertEqual(0); expect(listener.del).assertEqual(0); expect(listener.move).assertEqual(1);
    })

    /**
     * @tc.name   testFlipClockSequence0006
     * @tc.number SUB_FLIP_CLOCK_MORE_SEQ_0006
     * @tc.desc   Verify notification sequence variant 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockSequence0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); const listener: SequenceListener = new SequenceListener(); source.registerDataChangeListener(listener);
      source.notifyDataReload(); source.notifyDataAdd(0);
      expect(listener.reload).assertEqual(1); expect(listener.add).assertEqual(1); expect(listener.change).assertEqual(0); expect(listener.del).assertEqual(0); expect(listener.move).assertEqual(0);
    })

    /**
     * @tc.name   testFlipClockSequence0007
     * @tc.number SUB_FLIP_CLOCK_MORE_SEQ_0007
     * @tc.desc   Verify notification sequence variant 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockSequence0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); const listener: SequenceListener = new SequenceListener(); source.registerDataChangeListener(listener);
      source.notifyDataAdd(0); source.notifyDataChange(1); source.notifyDataDelete(2); source.notifyDataMove(0, 2);
      expect(listener.reload).assertEqual(0); expect(listener.add).assertEqual(1); expect(listener.change).assertEqual(1); expect(listener.del).assertEqual(1); expect(listener.move).assertEqual(1);
    })

    /**
     * @tc.name   testFlipClockSequence0008
     * @tc.number SUB_FLIP_CLOCK_MORE_SEQ_0008
     * @tc.desc   Verify notification sequence variant 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockSequence0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); const listener: SequenceListener = new SequenceListener(); source.registerDataChangeListener(listener);
      source.notifyDataReload(); source.notifyDataChange(1);
      expect(listener.reload).assertEqual(1); expect(listener.add).assertEqual(0); expect(listener.change).assertEqual(1); expect(listener.del).assertEqual(0); expect(listener.move).assertEqual(0);
    })
  })
}
