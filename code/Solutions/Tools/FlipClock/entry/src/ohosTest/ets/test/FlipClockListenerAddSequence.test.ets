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
class AddListener implements DataChangeListener {
  adds: number = 0; reloads: number = 0;
  onDataReloaded(): void { this.reloads++; }
  onDataAdded(index: number): void { this.adds++; }
  onDataAdd(index: number): void { this.adds++; }
  onDataMoved(from: number, to: number): void {}
  onDataMove(from: number, to: number): void {}
  onDataDeleted(index: number): void {}
  onDataDelete(index: number): void {}
  onDataChanged(index: number): void {}
  onDataChange(index: number): void {}
  onDatasetChange(dataOperations: DataOperation[]): void { this.reloads++; }
}

export default function flipClockListenerAddSequenceTest() {
  describe('FlipClockListenerAddSequenceTest', () => {

    /**
     * @tc.name   testFlipClockAddSeq0000
     * @tc.number SUB_FLIP_CLOCK_MORE4_ADDSEQ_0000
     * @tc.desc   Notify add 1 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAddSeq0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); const l: AddListener = new AddListener(); source.registerDataChangeListener(l);
      for (let index: number = 0; index < 1; index++) { source.notifyDataAdd(index); }
      expect(l.adds).assertEqual(1); expect(l.reloads).assertEqual(0);
    })

    /**
     * @tc.name   testFlipClockAddSeq0001
     * @tc.number SUB_FLIP_CLOCK_MORE4_ADDSEQ_0001
     * @tc.desc   Notify add 2 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAddSeq0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); const l: AddListener = new AddListener(); source.registerDataChangeListener(l);
      for (let index: number = 0; index < 2; index++) { source.notifyDataAdd(index); }
      expect(l.adds).assertEqual(2); expect(l.reloads).assertEqual(0);
    })

    /**
     * @tc.name   testFlipClockAddSeq0002
     * @tc.number SUB_FLIP_CLOCK_MORE4_ADDSEQ_0002
     * @tc.desc   Notify add 3 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAddSeq0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); const l: AddListener = new AddListener(); source.registerDataChangeListener(l);
      for (let index: number = 0; index < 3; index++) { source.notifyDataAdd(index); }
      expect(l.adds).assertEqual(3); expect(l.reloads).assertEqual(0);
    })

    /**
     * @tc.name   testFlipClockAddSeq0003
     * @tc.number SUB_FLIP_CLOCK_MORE4_ADDSEQ_0003
     * @tc.desc   Notify add 4 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAddSeq0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); const l: AddListener = new AddListener(); source.registerDataChangeListener(l);
      for (let index: number = 0; index < 4; index++) { source.notifyDataAdd(index); }
      expect(l.adds).assertEqual(4); expect(l.reloads).assertEqual(0);
    })

    /**
     * @tc.name   testFlipClockAddSeq0004
     * @tc.number SUB_FLIP_CLOCK_MORE4_ADDSEQ_0004
     * @tc.desc   Notify add 5 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAddSeq0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); const l: AddListener = new AddListener(); source.registerDataChangeListener(l);
      for (let index: number = 0; index < 5; index++) { source.notifyDataAdd(index); }
      expect(l.adds).assertEqual(5); expect(l.reloads).assertEqual(0);
    })

    /**
     * @tc.name   testFlipClockAddSeq0005
     * @tc.number SUB_FLIP_CLOCK_MORE4_ADDSEQ_0005
     * @tc.desc   Notify add 6 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAddSeq0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); const l: AddListener = new AddListener(); source.registerDataChangeListener(l);
      for (let index: number = 0; index < 6; index++) { source.notifyDataAdd(index); }
      expect(l.adds).assertEqual(6); expect(l.reloads).assertEqual(0);
    })

    /**
     * @tc.name   testFlipClockAddSeq0006
     * @tc.number SUB_FLIP_CLOCK_MORE4_ADDSEQ_0006
     * @tc.desc   Notify add 7 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAddSeq0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); const l: AddListener = new AddListener(); source.registerDataChangeListener(l);
      for (let index: number = 0; index < 7; index++) { source.notifyDataAdd(index); }
      expect(l.adds).assertEqual(7); expect(l.reloads).assertEqual(0);
    })

    /**
     * @tc.name   testFlipClockAddSeq0007
     * @tc.number SUB_FLIP_CLOCK_MORE4_ADDSEQ_0007
     * @tc.desc   Notify add 8 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAddSeq0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); const l: AddListener = new AddListener(); source.registerDataChangeListener(l);
      for (let index: number = 0; index < 8; index++) { source.notifyDataAdd(index); }
      expect(l.adds).assertEqual(8); expect(l.reloads).assertEqual(0);
    })
  })
}
