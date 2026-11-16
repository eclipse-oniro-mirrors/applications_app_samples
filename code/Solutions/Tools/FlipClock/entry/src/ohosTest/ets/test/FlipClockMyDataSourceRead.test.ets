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

export default function flipClockMyDataSourceReadTest() {
  describe('FlipClockMyDataSourceReadTest', () => {

    /**
     * @tc.name   testFlipClockMyRead0000
     * @tc.number SUB_FLIP_CLOCK_MORE_MYREAD_0000
     * @tc.desc   Read all 1 entries from MyDataSource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyRead0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]);
      for (let index: number = 0; index < 1; index++) { source.pushData(tabArray[index % 4]); }
      expect(source.totalCount()).assertEqual(1); for (let index: number = 0; index < 1; index++) { expect(source.getData(index).num).assertEqual(index % 4); }
      expect(source.getData(1) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockMyRead0001
     * @tc.number SUB_FLIP_CLOCK_MORE_MYREAD_0001
     * @tc.desc   Read all 2 entries from MyDataSource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyRead0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]);
      for (let index: number = 0; index < 2; index++) { source.pushData(tabArray[index % 4]); }
      expect(source.totalCount()).assertEqual(2); for (let index: number = 0; index < 2; index++) { expect(source.getData(index).num).assertEqual(index % 4); }
      expect(source.getData(2) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockMyRead0002
     * @tc.number SUB_FLIP_CLOCK_MORE_MYREAD_0002
     * @tc.desc   Read all 3 entries from MyDataSource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyRead0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]);
      for (let index: number = 0; index < 3; index++) { source.pushData(tabArray[index % 4]); }
      expect(source.totalCount()).assertEqual(3); for (let index: number = 0; index < 3; index++) { expect(source.getData(index).num).assertEqual(index % 4); }
      expect(source.getData(3) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockMyRead0003
     * @tc.number SUB_FLIP_CLOCK_MORE_MYREAD_0003
     * @tc.desc   Read all 4 entries from MyDataSource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyRead0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]);
      for (let index: number = 0; index < 4; index++) { source.pushData(tabArray[index % 4]); }
      expect(source.totalCount()).assertEqual(4); for (let index: number = 0; index < 4; index++) { expect(source.getData(index).num).assertEqual(index % 4); }
      expect(source.getData(4) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockMyRead0004
     * @tc.number SUB_FLIP_CLOCK_MORE_MYREAD_0004
     * @tc.desc   Read all 5 entries from MyDataSource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyRead0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]);
      for (let index: number = 0; index < 5; index++) { source.pushData(tabArray[index % 4]); }
      expect(source.totalCount()).assertEqual(5); for (let index: number = 0; index < 5; index++) { expect(source.getData(index).num).assertEqual(index % 4); }
      expect(source.getData(5) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockMyRead0005
     * @tc.number SUB_FLIP_CLOCK_MORE_MYREAD_0005
     * @tc.desc   Read all 6 entries from MyDataSource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyRead0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]);
      for (let index: number = 0; index < 6; index++) { source.pushData(tabArray[index % 4]); }
      expect(source.totalCount()).assertEqual(6); for (let index: number = 0; index < 6; index++) { expect(source.getData(index).num).assertEqual(index % 4); }
      expect(source.getData(6) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockMyRead0006
     * @tc.number SUB_FLIP_CLOCK_MORE_MYREAD_0006
     * @tc.desc   Read all 7 entries from MyDataSource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyRead0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]);
      for (let index: number = 0; index < 7; index++) { source.pushData(tabArray[index % 4]); }
      expect(source.totalCount()).assertEqual(7); for (let index: number = 0; index < 7; index++) { expect(source.getData(index).num).assertEqual(index % 4); }
      expect(source.getData(7) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockMyRead0007
     * @tc.number SUB_FLIP_CLOCK_MORE_MYREAD_0007
     * @tc.desc   Read all 8 entries from MyDataSource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyRead0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]);
      for (let index: number = 0; index < 8; index++) { source.pushData(tabArray[index % 4]); }
      expect(source.totalCount()).assertEqual(8); for (let index: number = 0; index < 8; index++) { expect(source.getData(index).num).assertEqual(index % 4); }
      expect(source.getData(8) === undefined).assertTrue();
    })
  })
}
