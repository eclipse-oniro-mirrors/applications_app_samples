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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { MyDataSource } from '../../../main/ets/common/DataSource';
import { testTabs as tabArray } from './FlipClockTestTabs';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function flipClockMyDataSourceDeleteEdgeTest() {
  describe('FlipClockMyDataSourceDeleteEdgeTest', () => {

    /**
     * @tc.name   testFlipClockMyDeleteEmpty001
     * @tc.number SUB_FLIP_CLOCK_EDGE_MYDEL_001
     * @tc.desc   Delete from an empty data source.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyDeleteEmpty001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyDeleteEmpty001 begin');
      const source: MyDataSource = new MyDataSource([]);
        source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(0));
      expect(source.totalCount()).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(0) === undefined));
        expect(source.getData(0) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyDeleteEmpty001 end');
    })

    /**
     * @tc.name   testFlipClockMyDeleteFirst002
     * @tc.number SUB_FLIP_CLOCK_EDGE_MYDEL_002
     * @tc.desc   Delete the first of two entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyDeleteFirst002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyDeleteFirst002 begin');
      const source: MyDataSource = new MyDataSource([]);
        source.pushData(tabArray[0]);
        source.pushData(tabArray[1]);
        source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1));
      expect(source.totalCount()).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).num), String(1));
        expect(source.getData(0).num).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyDeleteFirst002 end');
    })

    /**
     * @tc.name   testFlipClockMyDeleteLast003
     * @tc.number SUB_FLIP_CLOCK_EDGE_MYDEL_003
     * @tc.desc   Delete the last of two entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyDeleteLast003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyDeleteLast003 begin');
      const source: MyDataSource = new MyDataSource([]);
        source.pushData(tabArray[0]);
        source.pushData(tabArray[1]);
        source.deleteData(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1));
      expect(source.totalCount()).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).num), String(0));
        expect(source.getData(0).num).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyDeleteLast003 end');
    })

    /**
     * @tc.name   testFlipClockMyDeleteBeyond004
     * @tc.number SUB_FLIP_CLOCK_EDGE_MYDEL_004
     * @tc.desc   Delete beyond the data source length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyDeleteBeyond004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyDeleteBeyond004 begin');
      const source: MyDataSource = new MyDataSource([]);
        source.pushData(tabArray[0]);
        source.deleteData(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1));
      expect(source.totalCount()).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).num), String(0));
        expect(source.getData(0).num).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyDeleteBeyond004 end');
    })

    /**
     * @tc.name   testFlipClockMyDeleteNegative005
     * @tc.number SUB_FLIP_CLOCK_EDGE_MYDEL_005
     * @tc.desc   Delete with a negative index.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyDeleteNegative005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyDeleteNegative005 begin');
      const source: MyDataSource = new MyDataSource([]);
        source.pushData(tabArray[0]);
        source.deleteData(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.totalCount() <= 1));
      expect(source.totalCount() <= 1).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(0) === undefined || source.getData(0).num === 0));
        expect(source.getData(0) === undefined || source.getData(0).num === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyDeleteNegative005 end');
    })

    /**
     * @tc.name   testFlipClockMyDeleteAll006
     * @tc.number SUB_FLIP_CLOCK_EDGE_MYDEL_006
     * @tc.desc   Delete all four entries one by one.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyDeleteAll006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyDeleteAll006 begin');
      const source: MyDataSource = new MyDataSource(tabArray.slice());
        for (let i: number = 0; i < 4; i++) {
          source.deleteData(0);
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(0));
      expect(source.totalCount()).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(0) === undefined));
        expect(source.getData(0) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyDeleteAll006 end');
    })

    /**
     * @tc.name   testFlipClockMyDeleteTail007
     * @tc.number SUB_FLIP_CLOCK_EDGE_MYDEL_007
     * @tc.desc   Delete the final entry of three.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyDeleteTail007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyDeleteTail007 begin');
      const source: MyDataSource = new MyDataSource([]);
        for (let i: number = 0; i < 3; i++) {
          source.pushData(tabArray[i]);
        }
          source.deleteData(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(2));
      expect(source.totalCount()).assertEqual(2);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(2) === undefined));
        expect(source.getData(2) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyDeleteTail007 end');
    })

    /**
     * @tc.name   testFlipClockMyDeleteMid008
     * @tc.number SUB_FLIP_CLOCK_EDGE_MYDEL_008
     * @tc.desc   Delete a middle entry.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyDeleteMid008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyDeleteMid008 begin');
      const source: MyDataSource = new MyDataSource([]);
        for (let i: number = 0; i < 4; i++) {
          source.pushData(tabArray[i]);
        }
          source.deleteData(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(3));
      expect(source.totalCount()).assertEqual(3);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(2).num), String(3));
        expect(source.getData(2).num).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyDeleteMid008 end');
    })
  })
}
