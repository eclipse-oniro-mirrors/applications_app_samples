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
     * @tc.name   ohos.samples.flipclock_DataSourceIndexBoundary_0001
     * @tc.number SUB_FLIP_CLOCK_BOUND_IDX_0001
     * @tc.desc   Read MyDataSource at boundary index -9007199254740991.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_DataSourceIndexBoundary_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_DataSourceIndexBoundary_0001 begin');
      const source: MyDataSource = new MyDataSource([tabArray[0], tabArray[1], tabArray[2]]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(-9007199254740991) === undefined));
      expect(source.getData(-9007199254740991) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(3));
        expect(source.totalCount()).assertEqual(3);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).num), String(0));
        expect(source.getData(0).num).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_DataSourceIndexBoundary_0001 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_DataSourceIndexBoundary_0002
     * @tc.number SUB_FLIP_CLOCK_BOUND_IDX_0002
     * @tc.desc   Read MyDataSource at boundary index -2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_DataSourceIndexBoundary_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_DataSourceIndexBoundary_0002 begin');
      const source: MyDataSource = new MyDataSource([tabArray[0], tabArray[1], tabArray[2]]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(-2) === undefined));
      expect(source.getData(-2) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(3));
        expect(source.totalCount()).assertEqual(3);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).num), String(0));
        expect(source.getData(0).num).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_DataSourceIndexBoundary_0002 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_DataSourceIndexBoundary_0003
     * @tc.number SUB_FLIP_CLOCK_BOUND_IDX_0003
     * @tc.desc   Read MyDataSource at boundary index -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_DataSourceIndexBoundary_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_DataSourceIndexBoundary_0003 begin');
      const source: MyDataSource = new MyDataSource([tabArray[0], tabArray[1], tabArray[2]]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(-1) === undefined));
      expect(source.getData(-1) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(3));
        expect(source.totalCount()).assertEqual(3);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).num), String(0));
        expect(source.getData(0).num).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_DataSourceIndexBoundary_0003 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_DataSourceIndexBoundary_0004
     * @tc.number SUB_FLIP_CLOCK_BOUND_IDX_0004
     * @tc.desc   Read MyDataSource at boundary index 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_DataSourceIndexBoundary_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_DataSourceIndexBoundary_0004 begin');
      const source: MyDataSource = new MyDataSource([tabArray[0], tabArray[1], tabArray[2]]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).num), String(0));
      expect(source.getData(0).num).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(3));
        expect(source.totalCount()).assertEqual(3);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(0) !== undefined));
        expect(source.getData(0) !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_DataSourceIndexBoundary_0004 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_DataSourceIndexBoundary_0005
     * @tc.number SUB_FLIP_CLOCK_BOUND_IDX_0005
     * @tc.desc   Read MyDataSource at boundary index 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_DataSourceIndexBoundary_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_DataSourceIndexBoundary_0005 begin');
      const source: MyDataSource = new MyDataSource([tabArray[0], tabArray[1], tabArray[2]]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1).num), String(1));
      expect(source.getData(1).num).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(3));
        expect(source.totalCount()).assertEqual(3);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(1) !== undefined));
        expect(source.getData(1) !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_DataSourceIndexBoundary_0005 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_DataSourceIndexBoundary_0006
     * @tc.number SUB_FLIP_CLOCK_BOUND_IDX_0006
     * @tc.desc   Read MyDataSource at boundary index 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_DataSourceIndexBoundary_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_DataSourceIndexBoundary_0006 begin');
      const source: MyDataSource = new MyDataSource([tabArray[0], tabArray[1], tabArray[2]]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(2).num), String(2));
      expect(source.getData(2).num).assertEqual(2);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(3));
        expect(source.totalCount()).assertEqual(3);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(2) !== undefined));
        expect(source.getData(2) !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_DataSourceIndexBoundary_0006 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_DataSourceIndexBoundary_0007
     * @tc.number SUB_FLIP_CLOCK_BOUND_IDX_0007
     * @tc.desc   Read MyDataSource at boundary index 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_DataSourceIndexBoundary_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_DataSourceIndexBoundary_0007 begin');
      const source: MyDataSource = new MyDataSource([tabArray[0], tabArray[1], tabArray[2]]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(3) === undefined));
      expect(source.getData(3) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(3));
        expect(source.totalCount()).assertEqual(3);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).num), String(0));
        expect(source.getData(0).num).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_DataSourceIndexBoundary_0007 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_DataSourceIndexBoundary_0008
     * @tc.number SUB_FLIP_CLOCK_BOUND_IDX_0008
     * @tc.desc   Read MyDataSource at boundary index 9007199254740991.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_DataSourceIndexBoundary_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_DataSourceIndexBoundary_0008 begin');
      const source: MyDataSource = new MyDataSource([tabArray[0], tabArray[1], tabArray[2]]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(9007199254740991) === undefined));
      expect(source.getData(9007199254740991) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(3));
        expect(source.totalCount()).assertEqual(3);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).num), String(0));
        expect(source.getData(0).num).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_DataSourceIndexBoundary_0008 end');
    })
  })
}
