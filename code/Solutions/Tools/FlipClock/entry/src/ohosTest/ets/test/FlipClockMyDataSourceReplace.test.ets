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

export default function flipClockMyDataSourceReplaceTest() {
  describe('FlipClockMyDataSourceReplaceTest', () => {

    /**
     * @tc.name   testFlipClockMyDataSourcereplace0000
     * @tc.number SUB_FLIP_CLOCK_MYDS_REPLACE_0000
     * @tc.desc   Replace MyDataSource content with 0 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyDataSourcereplace0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource(tabArray.slice());
      const next: TabType[] = [];
      for (let index: number = 0; index < 0; index++) { next.push(tabArray[index % tabArray.length]); }
      source.replaceData(next);
      expect(source.totalCount()).assertEqual(0);
      if (source.totalCount() > 0) { expect(source.getData(0).num).assertEqual(0); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockMyDataSourcereplace0001
     * @tc.number SUB_FLIP_CLOCK_MYDS_REPLACE_0001
     * @tc.desc   Replace MyDataSource content with 1 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyDataSourcereplace0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource(tabArray.slice());
      const next: TabType[] = [];
      for (let index: number = 0; index < 1; index++) { next.push(tabArray[index % tabArray.length]); }
      source.replaceData(next);
      expect(source.totalCount()).assertEqual(1);
      if (source.totalCount() > 0) { expect(source.getData(0).num).assertEqual(0); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockMyDataSourcereplace0002
     * @tc.number SUB_FLIP_CLOCK_MYDS_REPLACE_0002
     * @tc.desc   Replace MyDataSource content with 2 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyDataSourcereplace0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource(tabArray.slice());
      const next: TabType[] = [];
      for (let index: number = 0; index < 2; index++) { next.push(tabArray[index % tabArray.length]); }
      source.replaceData(next);
      expect(source.totalCount()).assertEqual(2);
      if (source.totalCount() > 0) { expect(source.getData(0).num).assertEqual(0); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockMyDataSourcereplace0003
     * @tc.number SUB_FLIP_CLOCK_MYDS_REPLACE_0003
     * @tc.desc   Replace MyDataSource content with 3 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyDataSourcereplace0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource(tabArray.slice());
      const next: TabType[] = [];
      for (let index: number = 0; index < 3; index++) { next.push(tabArray[index % tabArray.length]); }
      source.replaceData(next);
      expect(source.totalCount()).assertEqual(3);
      if (source.totalCount() > 0) { expect(source.getData(0).num).assertEqual(0); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockMyDataSourcereplace0004
     * @tc.number SUB_FLIP_CLOCK_MYDS_REPLACE_0004
     * @tc.desc   Replace MyDataSource content with 4 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyDataSourcereplace0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource(tabArray.slice());
      const next: TabType[] = [];
      for (let index: number = 0; index < 4; index++) { next.push(tabArray[index % tabArray.length]); }
      source.replaceData(next);
      expect(source.totalCount()).assertEqual(4);
      if (source.totalCount() > 0) { expect(source.getData(0).num).assertEqual(0); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockMyDataSourcereplace0005
     * @tc.number SUB_FLIP_CLOCK_MYDS_REPLACE_0005
     * @tc.desc   Replace MyDataSource content with 5 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyDataSourcereplace0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource(tabArray.slice());
      const next: TabType[] = [];
      for (let index: number = 0; index < 5; index++) { next.push(tabArray[index % tabArray.length]); }
      source.replaceData(next);
      expect(source.totalCount()).assertEqual(5);
      if (source.totalCount() > 0) { expect(source.getData(0).num).assertEqual(0); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockMyDataSourcereplace0006
     * @tc.number SUB_FLIP_CLOCK_MYDS_REPLACE_0006
     * @tc.desc   Replace MyDataSource content with 6 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyDataSourcereplace0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource(tabArray.slice());
      const next: TabType[] = [];
      for (let index: number = 0; index < 6; index++) { next.push(tabArray[index % tabArray.length]); }
      source.replaceData(next);
      expect(source.totalCount()).assertEqual(6);
      if (source.totalCount() > 0) { expect(source.getData(0).num).assertEqual(0); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockMyDataSourcereplace0007
     * @tc.number SUB_FLIP_CLOCK_MYDS_REPLACE_0007
     * @tc.desc   Replace MyDataSource content with 7 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyDataSourcereplace0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource(tabArray.slice());
      const next: TabType[] = [];
      for (let index: number = 0; index < 7; index++) { next.push(tabArray[index % tabArray.length]); }
      source.replaceData(next);
      expect(source.totalCount()).assertEqual(7);
      if (source.totalCount() > 0) { expect(source.getData(0).num).assertEqual(0); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })
  })
}
