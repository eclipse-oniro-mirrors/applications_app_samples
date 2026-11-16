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
import { testTabs as tabArray } from './FlipClockTestTabs';

export default function flipClockMyDataSourcePushEdgeTest() {
  describe('FlipClockMyDataSourcePushEdgeTest', () => {

    /**
     * @tc.name   testFlipClockMyPushEmpty001
     * @tc.number SUB_FLIP_CLOCK_EDGE_MYPUSH_001
     * @tc.desc   Create an empty MyDataSource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyPushEmpty001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]);
      expect(source.totalCount()).assertEqual(0);
      expect(source.getData(0) === undefined).assertTrue();
      expect(source.getData(-1) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockMyPushOne002
     * @tc.number SUB_FLIP_CLOCK_EDGE_MYPUSH_002
     * @tc.desc   Push one tab entry.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyPushOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); source.pushData(tabArray[0]);
      expect(source.totalCount()).assertEqual(1); expect(source.getData(0).num).assertEqual(0); expect(source.getData(1) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockMyPushDuplicate003
     * @tc.number SUB_FLIP_CLOCK_EDGE_MYPUSH_003
     * @tc.desc   Push the same entry twice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyPushDuplicate003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); source.pushData(tabArray[0]); source.pushData(tabArray[0]);
      expect(source.totalCount()).assertEqual(2); expect(source.getData(0).num).assertEqual(0); expect(source.getData(1).num).assertEqual(0);
    })

    /**
     * @tc.name   testFlipClockMyPushFour004
     * @tc.number SUB_FLIP_CLOCK_EDGE_MYPUSH_004
     * @tc.desc   Push all four tab entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyPushFour004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); for (let i: number = 0; i < 4; i++) { source.pushData(tabArray[i]); }
      expect(source.totalCount()).assertEqual(4); expect(source.getData(3).num).assertEqual(3); expect(source.getData(4) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockMyPushOrder005
     * @tc.number SUB_FLIP_CLOCK_EDGE_MYPUSH_005
     * @tc.desc   Verify push keeps insertion order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyPushOrder005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); source.pushData(tabArray[2]); source.pushData(tabArray[0]);
      expect(source.getData(0).num).assertEqual(2); expect(source.getData(1).num).assertEqual(0); expect(source.totalCount()).assertEqual(2);
    })

    /**
     * @tc.name   testFlipClockMyPushFields006
     * @tc.number SUB_FLIP_CLOCK_EDGE_MYPUSH_006
     * @tc.desc   Verify tab resources survive push.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyPushFields006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); source.pushData(tabArray[1]);
      expect(source.getData(0).icon !== undefined).assertTrue(); expect(source.getData(0).text !== undefined).assertTrue(); expect(source.getData(0).num).assertEqual(1);
    })

    /**
     * @tc.name   testFlipClockMyPushRead007
     * @tc.number SUB_FLIP_CLOCK_EDGE_MYPUSH_007
     * @tc.desc   Read negative and trailing indexes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyPushRead007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); source.pushData(tabArray[0]); source.pushData(tabArray[1]);
      expect(source.getData(-1) === undefined).assertTrue(); expect(source.getData(2) === undefined).assertTrue(); expect(source.getData(1).num).assertEqual(1);
    })

    /**
     * @tc.name   testFlipClockMyPushCount008
     * @tc.number SUB_FLIP_CLOCK_EDGE_MYPUSH_008
     * @tc.desc   Verify count after repeated pushes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyPushCount008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); for (let i: number = 0; i < 8; i++) { source.pushData(tabArray[0]); }
      expect(source.totalCount()).assertEqual(8); expect(source.getData(7).num).assertEqual(0); expect(source.getData(8) === undefined).assertTrue();
    })
  })
}
