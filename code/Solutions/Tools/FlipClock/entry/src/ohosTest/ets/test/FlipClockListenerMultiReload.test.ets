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
class MultiReload implements DataChangeListener {
  r: number = 0; a: number = 0;
  onDataReloaded(): void { this.r++; }
  onDataAdded(index: number): void { this.a++; }
  onDataAdd(index: number): void { this.a++; }
  onDataMoved(from: number, to: number): void {}
  onDataMove(from: number, to: number): void {}
  onDataDeleted(index: number): void {}
  onDataDelete(index: number): void {}
  onDataChanged(index: number): void {}
  onDataChange(index: number): void {}
  onDatasetChange(dataOperations: DataOperation[]): void { this.r++; }
}

export default function flipClockListenerMultiReloadTest() {
  describe('FlipClockListenerMultiReloadTest', () => {

    /**
     * @tc.name   testFlipClockMultiReloadSeq0000
     * @tc.number SUB_FLIP_CLOCK_MORE6_MREL_0000
     * @tc.desc   Notify reload 1 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMultiReloadSeq0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); const l: MultiReload = new MultiReload(); source.registerDataChangeListener(l); for (let index: number = 0; index < 1; index++) { source.notifyDataReload(); } expect(l.r).assertEqual(1); expect(l.a).assertEqual(0);
    })

    /**
     * @tc.name   testFlipClockMultiReloadSeq0001
     * @tc.number SUB_FLIP_CLOCK_MORE6_MREL_0001
     * @tc.desc   Notify reload 2 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMultiReloadSeq0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); const l: MultiReload = new MultiReload(); source.registerDataChangeListener(l); for (let index: number = 0; index < 2; index++) { source.notifyDataReload(); } expect(l.r).assertEqual(2); expect(l.a).assertEqual(0);
    })

    /**
     * @tc.name   testFlipClockMultiReloadSeq0002
     * @tc.number SUB_FLIP_CLOCK_MORE6_MREL_0002
     * @tc.desc   Notify reload 3 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMultiReloadSeq0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); const l: MultiReload = new MultiReload(); source.registerDataChangeListener(l); for (let index: number = 0; index < 3; index++) { source.notifyDataReload(); } expect(l.r).assertEqual(3); expect(l.a).assertEqual(0);
    })

    /**
     * @tc.name   testFlipClockMultiReloadSeq0003
     * @tc.number SUB_FLIP_CLOCK_MORE6_MREL_0003
     * @tc.desc   Notify reload 4 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMultiReloadSeq0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); const l: MultiReload = new MultiReload(); source.registerDataChangeListener(l); for (let index: number = 0; index < 4; index++) { source.notifyDataReload(); } expect(l.r).assertEqual(4); expect(l.a).assertEqual(0);
    })

    /**
     * @tc.name   testFlipClockMultiReloadSeq0004
     * @tc.number SUB_FLIP_CLOCK_MORE6_MREL_0004
     * @tc.desc   Notify reload 5 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMultiReloadSeq0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); const l: MultiReload = new MultiReload(); source.registerDataChangeListener(l); for (let index: number = 0; index < 5; index++) { source.notifyDataReload(); } expect(l.r).assertEqual(5); expect(l.a).assertEqual(0);
    })

    /**
     * @tc.name   testFlipClockMultiReloadSeq0005
     * @tc.number SUB_FLIP_CLOCK_MORE6_MREL_0005
     * @tc.desc   Notify reload 6 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMultiReloadSeq0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); const l: MultiReload = new MultiReload(); source.registerDataChangeListener(l); for (let index: number = 0; index < 6; index++) { source.notifyDataReload(); } expect(l.r).assertEqual(6); expect(l.a).assertEqual(0);
    })

    /**
     * @tc.name   testFlipClockMultiReloadSeq0006
     * @tc.number SUB_FLIP_CLOCK_MORE6_MREL_0006
     * @tc.desc   Notify reload 7 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMultiReloadSeq0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); const l: MultiReload = new MultiReload(); source.registerDataChangeListener(l); for (let index: number = 0; index < 7; index++) { source.notifyDataReload(); } expect(l.r).assertEqual(7); expect(l.a).assertEqual(0);
    })

    /**
     * @tc.name   testFlipClockMultiReloadSeq0007
     * @tc.number SUB_FLIP_CLOCK_MORE6_MREL_0007
     * @tc.desc   Notify reload 8 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMultiReloadSeq0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); const l: MultiReload = new MultiReload(); source.registerDataChangeListener(l); for (let index: number = 0; index < 8; index++) { source.notifyDataReload(); } expect(l.r).assertEqual(8); expect(l.a).assertEqual(0);
    })
  })
}
