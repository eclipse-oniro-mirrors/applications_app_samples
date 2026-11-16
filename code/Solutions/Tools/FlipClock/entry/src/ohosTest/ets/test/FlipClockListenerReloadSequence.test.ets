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
class ReloadListener implements DataChangeListener {
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

export default function flipClockListenerReloadSequenceTest() {
  describe('FlipClockListenerReloadSequenceTest', () => {

    /**
     * @tc.name   testFlipClockReloadSeq0000
     * @tc.number SUB_FLIP_CLOCK_MORE5_REL_0000
     * @tc.desc   Notify reload 1 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockReloadSeq0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); const l: ReloadListener = new ReloadListener(); source.registerDataChangeListener(l);
      for (let index: number = 0; index < 1; index++) { source.notifyDataReload(); }
      expect(l.r).assertEqual(1); expect(l.a).assertEqual(0);
    })

    /**
     * @tc.name   testFlipClockReloadSeq0001
     * @tc.number SUB_FLIP_CLOCK_MORE5_REL_0001
     * @tc.desc   Notify reload 2 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockReloadSeq0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); const l: ReloadListener = new ReloadListener(); source.registerDataChangeListener(l);
      for (let index: number = 0; index < 2; index++) { source.notifyDataReload(); }
      expect(l.r).assertEqual(2); expect(l.a).assertEqual(0);
    })

    /**
     * @tc.name   testFlipClockReloadSeq0002
     * @tc.number SUB_FLIP_CLOCK_MORE5_REL_0002
     * @tc.desc   Notify reload 3 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockReloadSeq0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); const l: ReloadListener = new ReloadListener(); source.registerDataChangeListener(l);
      for (let index: number = 0; index < 3; index++) { source.notifyDataReload(); }
      expect(l.r).assertEqual(3); expect(l.a).assertEqual(0);
    })

    /**
     * @tc.name   testFlipClockReloadSeq0003
     * @tc.number SUB_FLIP_CLOCK_MORE5_REL_0003
     * @tc.desc   Notify reload 4 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockReloadSeq0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); const l: ReloadListener = new ReloadListener(); source.registerDataChangeListener(l);
      for (let index: number = 0; index < 4; index++) { source.notifyDataReload(); }
      expect(l.r).assertEqual(4); expect(l.a).assertEqual(0);
    })

    /**
     * @tc.name   testFlipClockReloadSeq0004
     * @tc.number SUB_FLIP_CLOCK_MORE5_REL_0004
     * @tc.desc   Notify reload 5 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockReloadSeq0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); const l: ReloadListener = new ReloadListener(); source.registerDataChangeListener(l);
      for (let index: number = 0; index < 5; index++) { source.notifyDataReload(); }
      expect(l.r).assertEqual(5); expect(l.a).assertEqual(0);
    })

    /**
     * @tc.name   testFlipClockReloadSeq0005
     * @tc.number SUB_FLIP_CLOCK_MORE5_REL_0005
     * @tc.desc   Notify reload 6 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockReloadSeq0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); const l: ReloadListener = new ReloadListener(); source.registerDataChangeListener(l);
      for (let index: number = 0; index < 6; index++) { source.notifyDataReload(); }
      expect(l.r).assertEqual(6); expect(l.a).assertEqual(0);
    })

    /**
     * @tc.name   testFlipClockReloadSeq0006
     * @tc.number SUB_FLIP_CLOCK_MORE5_REL_0006
     * @tc.desc   Notify reload 7 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockReloadSeq0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); const l: ReloadListener = new ReloadListener(); source.registerDataChangeListener(l);
      for (let index: number = 0; index < 7; index++) { source.notifyDataReload(); }
      expect(l.r).assertEqual(7); expect(l.a).assertEqual(0);
    })

    /**
     * @tc.name   testFlipClockReloadSeq0007
     * @tc.number SUB_FLIP_CLOCK_MORE5_REL_0007
     * @tc.desc   Notify reload 8 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockReloadSeq0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); const l: ReloadListener = new ReloadListener(); source.registerDataChangeListener(l);
      for (let index: number = 0; index < 8; index++) { source.notifyDataReload(); }
      expect(l.r).assertEqual(8); expect(l.a).assertEqual(0);
    })
  })
}
