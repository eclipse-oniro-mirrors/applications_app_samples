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

export default function flipClockDataSourceIndexBoundaryTest() {
  describe('FlipClockDataSourceIndexBoundaryTest', () => {

    /**
     * @tc.name   testFlipClockIndexBoundary0001
     * @tc.number SUB_FLIP_CLOCK_BOUND_IDX_0001
     * @tc.desc   Read MyDataSource at boundary index -9007199254740991.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockIndexBoundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockIndexBoundary0001 begin');
      const source: MyDataSource = new MyDataSource([tabArray[0], tabArray[1], tabArray[2]]);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(-9007199254740991) === undefined).assertTrue();');
      expect(source.getData(-9007199254740991) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(3);');
        expect(source.totalCount()).assertEqual(3);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).num).assertEqual(0);');
        expect(source.getData(0).num).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockIndexBoundary0001 end');
    })

    /**
     * @tc.name   testFlipClockIndexBoundary0002
     * @tc.number SUB_FLIP_CLOCK_BOUND_IDX_0002
     * @tc.desc   Read MyDataSource at boundary index -2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockIndexBoundary0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockIndexBoundary0002 begin');
      const source: MyDataSource = new MyDataSource([tabArray[0], tabArray[1], tabArray[2]]);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(-2) === undefined).assertTrue();');
      expect(source.getData(-2) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(3);');
        expect(source.totalCount()).assertEqual(3);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).num).assertEqual(0);');
        expect(source.getData(0).num).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockIndexBoundary0002 end');
    })

    /**
     * @tc.name   testFlipClockIndexBoundary0003
     * @tc.number SUB_FLIP_CLOCK_BOUND_IDX_0003
     * @tc.desc   Read MyDataSource at boundary index -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockIndexBoundary0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockIndexBoundary0003 begin');
      const source: MyDataSource = new MyDataSource([tabArray[0], tabArray[1], tabArray[2]]);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(-1) === undefined).assertTrue();');
      expect(source.getData(-1) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(3);');
        expect(source.totalCount()).assertEqual(3);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).num).assertEqual(0);');
        expect(source.getData(0).num).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockIndexBoundary0003 end');
    })

    /**
     * @tc.name   testFlipClockIndexBoundary0004
     * @tc.number SUB_FLIP_CLOCK_BOUND_IDX_0004
     * @tc.desc   Read MyDataSource at boundary index 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockIndexBoundary0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockIndexBoundary0004 begin');
      const source: MyDataSource = new MyDataSource([tabArray[0], tabArray[1], tabArray[2]]);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).num).assertEqual(0);');
      expect(source.getData(0).num).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(3);');
        expect(source.totalCount()).assertEqual(3);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0) !== undefined).assertTrue();');
        expect(source.getData(0) !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockIndexBoundary0004 end');
    })

    /**
     * @tc.name   testFlipClockIndexBoundary0005
     * @tc.number SUB_FLIP_CLOCK_BOUND_IDX_0005
     * @tc.desc   Read MyDataSource at boundary index 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockIndexBoundary0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockIndexBoundary0005 begin');
      const source: MyDataSource = new MyDataSource([tabArray[0], tabArray[1], tabArray[2]]);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1).num).assertEqual(1);');
      expect(source.getData(1).num).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(3);');
        expect(source.totalCount()).assertEqual(3);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1) !== undefined).assertTrue();');
        expect(source.getData(1) !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockIndexBoundary0005 end');
    })

    /**
     * @tc.name   testFlipClockIndexBoundary0006
     * @tc.number SUB_FLIP_CLOCK_BOUND_IDX_0006
     * @tc.desc   Read MyDataSource at boundary index 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockIndexBoundary0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockIndexBoundary0006 begin');
      const source: MyDataSource = new MyDataSource([tabArray[0], tabArray[1], tabArray[2]]);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(2).num).assertEqual(2);');
      expect(source.getData(2).num).assertEqual(2);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(3);');
        expect(source.totalCount()).assertEqual(3);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(2) !== undefined).assertTrue();');
        expect(source.getData(2) !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockIndexBoundary0006 end');
    })

    /**
     * @tc.name   testFlipClockIndexBoundary0007
     * @tc.number SUB_FLIP_CLOCK_BOUND_IDX_0007
     * @tc.desc   Read MyDataSource at boundary index 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockIndexBoundary0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockIndexBoundary0007 begin');
      const source: MyDataSource = new MyDataSource([tabArray[0], tabArray[1], tabArray[2]]);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(3) === undefined).assertTrue();');
      expect(source.getData(3) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(3);');
        expect(source.totalCount()).assertEqual(3);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).num).assertEqual(0);');
        expect(source.getData(0).num).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockIndexBoundary0007 end');
    })

    /**
     * @tc.name   testFlipClockIndexBoundary0008
     * @tc.number SUB_FLIP_CLOCK_BOUND_IDX_0008
     * @tc.desc   Read MyDataSource at boundary index 9007199254740991.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockIndexBoundary0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockIndexBoundary0008 begin');
      const source: MyDataSource = new MyDataSource([tabArray[0], tabArray[1], tabArray[2]]);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(9007199254740991) === undefined).assertTrue();');
      expect(source.getData(9007199254740991) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(3);');
        expect(source.totalCount()).assertEqual(3);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).num).assertEqual(0);');
        expect(source.getData(0).num).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockIndexBoundary0008 end');
    })
  })
}
