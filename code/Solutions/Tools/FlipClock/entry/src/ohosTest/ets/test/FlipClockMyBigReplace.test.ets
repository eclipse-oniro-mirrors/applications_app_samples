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

export default function flipClockMyBigReplaceTest() {
  describe('FlipClockMyBigReplaceTest', () => {

    /**
     * @tc.name   testFlipClockMyBigReplace0000
     * @tc.number SUB_FLIP_CLOCK_MORE5_MBIG_0000
     * @tc.desc   Replace MyDataSource with 9 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyBigReplace0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); const next: TabType[] = []; for (let index: number = 0; index < 9; index++) { next.push(tabArray[index % 4]); }
      source.replaceData(next); expect(source.totalCount()).assertEqual(9); expect(source.getData(8).num).assertEqual(0);
    })

    /**
     * @tc.name   testFlipClockMyBigReplace0001
     * @tc.number SUB_FLIP_CLOCK_MORE5_MBIG_0001
     * @tc.desc   Replace MyDataSource with 10 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyBigReplace0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); const next: TabType[] = []; for (let index: number = 0; index < 10; index++) { next.push(tabArray[index % 4]); }
      source.replaceData(next); expect(source.totalCount()).assertEqual(10); expect(source.getData(9).num).assertEqual(1);
    })

    /**
     * @tc.name   testFlipClockMyBigReplace0002
     * @tc.number SUB_FLIP_CLOCK_MORE5_MBIG_0002
     * @tc.desc   Replace MyDataSource with 11 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyBigReplace0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); const next: TabType[] = []; for (let index: number = 0; index < 11; index++) { next.push(tabArray[index % 4]); }
      source.replaceData(next); expect(source.totalCount()).assertEqual(11); expect(source.getData(10).num).assertEqual(2);
    })

    /**
     * @tc.name   testFlipClockMyBigReplace0003
     * @tc.number SUB_FLIP_CLOCK_MORE5_MBIG_0003
     * @tc.desc   Replace MyDataSource with 12 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyBigReplace0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); const next: TabType[] = []; for (let index: number = 0; index < 12; index++) { next.push(tabArray[index % 4]); }
      source.replaceData(next); expect(source.totalCount()).assertEqual(12); expect(source.getData(11).num).assertEqual(3);
    })

    /**
     * @tc.name   testFlipClockMyBigReplace0004
     * @tc.number SUB_FLIP_CLOCK_MORE5_MBIG_0004
     * @tc.desc   Replace MyDataSource with 13 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyBigReplace0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); const next: TabType[] = []; for (let index: number = 0; index < 13; index++) { next.push(tabArray[index % 4]); }
      source.replaceData(next); expect(source.totalCount()).assertEqual(13); expect(source.getData(12).num).assertEqual(0);
    })

    /**
     * @tc.name   testFlipClockMyBigReplace0005
     * @tc.number SUB_FLIP_CLOCK_MORE5_MBIG_0005
     * @tc.desc   Replace MyDataSource with 14 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyBigReplace0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); const next: TabType[] = []; for (let index: number = 0; index < 14; index++) { next.push(tabArray[index % 4]); }
      source.replaceData(next); expect(source.totalCount()).assertEqual(14); expect(source.getData(13).num).assertEqual(1);
    })

    /**
     * @tc.name   testFlipClockMyBigReplace0006
     * @tc.number SUB_FLIP_CLOCK_MORE5_MBIG_0006
     * @tc.desc   Replace MyDataSource with 15 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyBigReplace0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); const next: TabType[] = []; for (let index: number = 0; index < 15; index++) { next.push(tabArray[index % 4]); }
      source.replaceData(next); expect(source.totalCount()).assertEqual(15); expect(source.getData(14).num).assertEqual(2);
    })

    /**
     * @tc.name   testFlipClockMyBigReplace0007
     * @tc.number SUB_FLIP_CLOCK_MORE5_MBIG_0007
     * @tc.desc   Replace MyDataSource with 16 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyBigReplace0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: MyDataSource = new MyDataSource([]); const next: TabType[] = []; for (let index: number = 0; index < 16; index++) { next.push(tabArray[index % 4]); }
      source.replaceData(next); expect(source.totalCount()).assertEqual(16); expect(source.getData(15).num).assertEqual(3);
    })
  })
}
