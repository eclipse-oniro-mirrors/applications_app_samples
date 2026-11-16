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
import { MyDataSource, TabType } from '../../../main/ets/common/DataSource';
import { testTabs as tabArray } from './FlipClockTestTabs';

export default function flipClockMyDeleteLargeTest() {
  describe('FlipClockMyDeleteLargeTest', () => {

    /**
     * @tc.name   testFlipClockMyDeleteLarge0000
     * @tc.number SUB_FLIP_CLOCK_MORE6_MDEL_0000
     * @tc.desc   Delete first from 10 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyDeleteLarge0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); for (let index: number = 0; index < 10; index++) { source.pushData(tabArray[index % 4]); }
      source.deleteData(0); expect(source.totalCount()).assertEqual(9); expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockMyDeleteLarge0001
     * @tc.number SUB_FLIP_CLOCK_MORE6_MDEL_0001
     * @tc.desc   Delete first from 11 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyDeleteLarge0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); for (let index: number = 0; index < 11; index++) { source.pushData(tabArray[index % 4]); }
      source.deleteData(0); expect(source.totalCount()).assertEqual(10); expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockMyDeleteLarge0002
     * @tc.number SUB_FLIP_CLOCK_MORE6_MDEL_0002
     * @tc.desc   Delete first from 12 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyDeleteLarge0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); for (let index: number = 0; index < 12; index++) { source.pushData(tabArray[index % 4]); }
      source.deleteData(0); expect(source.totalCount()).assertEqual(11); expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockMyDeleteLarge0003
     * @tc.number SUB_FLIP_CLOCK_MORE6_MDEL_0003
     * @tc.desc   Delete first from 13 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyDeleteLarge0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); for (let index: number = 0; index < 13; index++) { source.pushData(tabArray[index % 4]); }
      source.deleteData(0); expect(source.totalCount()).assertEqual(12); expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockMyDeleteLarge0004
     * @tc.number SUB_FLIP_CLOCK_MORE6_MDEL_0004
     * @tc.desc   Delete first from 14 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyDeleteLarge0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); for (let index: number = 0; index < 14; index++) { source.pushData(tabArray[index % 4]); }
      source.deleteData(0); expect(source.totalCount()).assertEqual(13); expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockMyDeleteLarge0005
     * @tc.number SUB_FLIP_CLOCK_MORE6_MDEL_0005
     * @tc.desc   Delete first from 15 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyDeleteLarge0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); for (let index: number = 0; index < 15; index++) { source.pushData(tabArray[index % 4]); }
      source.deleteData(0); expect(source.totalCount()).assertEqual(14); expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockMyDeleteLarge0006
     * @tc.number SUB_FLIP_CLOCK_MORE6_MDEL_0006
     * @tc.desc   Delete first from 16 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyDeleteLarge0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); for (let index: number = 0; index < 16; index++) { source.pushData(tabArray[index % 4]); }
      source.deleteData(0); expect(source.totalCount()).assertEqual(15); expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockMyDeleteLarge0007
     * @tc.number SUB_FLIP_CLOCK_MORE6_MDEL_0007
     * @tc.desc   Delete first from 17 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyDeleteLarge0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); for (let index: number = 0; index < 17; index++) { source.pushData(tabArray[index % 4]); }
      source.deleteData(0); expect(source.totalCount()).assertEqual(16); expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })
  })
}
