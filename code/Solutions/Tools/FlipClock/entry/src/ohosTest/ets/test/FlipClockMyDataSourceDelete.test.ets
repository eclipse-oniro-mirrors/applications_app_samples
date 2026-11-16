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

export default function flipClockMyDataSourceDeleteTest() {
  describe('FlipClockMyDataSourceDeleteTest', () => {

    /**
     * @tc.name   testFlipClockMyDataSourcedelete0001
     * @tc.number SUB_FLIP_CLOCK_MYDS_DELETE_0001
     * @tc.desc   Delete the first of 2 tab entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyDataSourcedelete0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]);
      for (let index: number = 0; index < 2; index++) { source.pushData(tabArray[index % tabArray.length]); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(1);
      expect(source.getData(0) !== undefined).assertTrue();
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockMyDataSourcedelete0002
     * @tc.number SUB_FLIP_CLOCK_MYDS_DELETE_0002
     * @tc.desc   Delete the first of 3 tab entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyDataSourcedelete0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]);
      for (let index: number = 0; index < 3; index++) { source.pushData(tabArray[index % tabArray.length]); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(0) !== undefined).assertTrue();
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockMyDataSourcedelete0003
     * @tc.number SUB_FLIP_CLOCK_MYDS_DELETE_0003
     * @tc.desc   Delete the first of 4 tab entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyDataSourcedelete0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]);
      for (let index: number = 0; index < 4; index++) { source.pushData(tabArray[index % tabArray.length]); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(3);
      expect(source.getData(0) !== undefined).assertTrue();
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockMyDataSourcedelete0004
     * @tc.number SUB_FLIP_CLOCK_MYDS_DELETE_0004
     * @tc.desc   Delete the first of 5 tab entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyDataSourcedelete0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]);
      for (let index: number = 0; index < 5; index++) { source.pushData(tabArray[index % tabArray.length]); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(4);
      expect(source.getData(0) !== undefined).assertTrue();
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockMyDataSourcedelete0005
     * @tc.number SUB_FLIP_CLOCK_MYDS_DELETE_0005
     * @tc.desc   Delete the first of 6 tab entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyDataSourcedelete0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]);
      for (let index: number = 0; index < 6; index++) { source.pushData(tabArray[index % tabArray.length]); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(5);
      expect(source.getData(0) !== undefined).assertTrue();
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockMyDataSourcedelete0006
     * @tc.number SUB_FLIP_CLOCK_MYDS_DELETE_0006
     * @tc.desc   Delete the first of 7 tab entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyDataSourcedelete0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]);
      for (let index: number = 0; index < 7; index++) { source.pushData(tabArray[index % tabArray.length]); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(6);
      expect(source.getData(0) !== undefined).assertTrue();
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockMyDataSourcedelete0007
     * @tc.number SUB_FLIP_CLOCK_MYDS_DELETE_0007
     * @tc.desc   Delete the first of 8 tab entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyDataSourcedelete0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]);
      for (let index: number = 0; index < 8; index++) { source.pushData(tabArray[index % tabArray.length]); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(7);
      expect(source.getData(0) !== undefined).assertTrue();
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockMyDataSourcedelete0008
     * @tc.number SUB_FLIP_CLOCK_MYDS_DELETE_0008
     * @tc.desc   Delete the first of 9 tab entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyDataSourcedelete0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]);
      for (let index: number = 0; index < 9; index++) { source.pushData(tabArray[index % tabArray.length]); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(8);
      expect(source.getData(0) !== undefined).assertTrue();
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })
  })
}
