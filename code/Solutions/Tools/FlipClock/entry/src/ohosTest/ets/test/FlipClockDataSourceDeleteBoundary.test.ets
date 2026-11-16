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

export default function flipClockDataSourceDeleteBoundaryTest() {
  describe('FlipClockDataSourceDeleteBoundaryTest', () => {

    /**
     * @tc.name   testFlipClockDeleteBoundary0001
     * @tc.number SUB_FLIP_CLOCK_BOUND_DEL_0001
     * @tc.desc   Delete MyDataSource at boundary index -9007199254740991.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockDeleteBoundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockDeleteBoundary0001 begin');
      const source: MyDataSource = new MyDataSource([tabArray[0], tabArray[1], tabArray[2]]);
      source.deleteData(-9007199254740991);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(2));
      expect(source.totalCount()).assertEqual(2);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(3) === undefined));
        expect(source.getData(3) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockDeleteBoundary0001 end');
    })

    /**
     * @tc.name   testFlipClockDeleteBoundary0002
     * @tc.number SUB_FLIP_CLOCK_BOUND_DEL_0002
     * @tc.desc   Delete MyDataSource at boundary index -3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockDeleteBoundary0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockDeleteBoundary0002 begin');
      const source: MyDataSource = new MyDataSource([tabArray[0], tabArray[1], tabArray[2]]);
      source.deleteData(-3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(2));
      expect(source.totalCount()).assertEqual(2);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(3) === undefined));
        expect(source.getData(3) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockDeleteBoundary0002 end');
    })

    /**
     * @tc.name   testFlipClockDeleteBoundary0003
     * @tc.number SUB_FLIP_CLOCK_BOUND_DEL_0003
     * @tc.desc   Delete MyDataSource at boundary index -2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockDeleteBoundary0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockDeleteBoundary0003 begin');
      const source: MyDataSource = new MyDataSource([tabArray[0], tabArray[1], tabArray[2]]);
      source.deleteData(-2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(2));
      expect(source.totalCount()).assertEqual(2);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(3) === undefined));
        expect(source.getData(3) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockDeleteBoundary0003 end');
    })

    /**
     * @tc.name   testFlipClockDeleteBoundary0004
     * @tc.number SUB_FLIP_CLOCK_BOUND_DEL_0004
     * @tc.desc   Delete MyDataSource at boundary index -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockDeleteBoundary0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockDeleteBoundary0004 begin');
      const source: MyDataSource = new MyDataSource([tabArray[0], tabArray[1], tabArray[2]]);
      source.deleteData(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(2));
      expect(source.totalCount()).assertEqual(2);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(3) === undefined));
        expect(source.getData(3) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockDeleteBoundary0004 end');
    })

    /**
     * @tc.name   testFlipClockDeleteBoundary0005
     * @tc.number SUB_FLIP_CLOCK_BOUND_DEL_0005
     * @tc.desc   Delete MyDataSource at boundary index 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockDeleteBoundary0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockDeleteBoundary0005 begin');
      const source: MyDataSource = new MyDataSource([tabArray[0], tabArray[1], tabArray[2]]);
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(2));
      expect(source.totalCount()).assertEqual(2);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(3) === undefined));
        expect(source.getData(3) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockDeleteBoundary0005 end');
    })

    /**
     * @tc.name   testFlipClockDeleteBoundary0006
     * @tc.number SUB_FLIP_CLOCK_BOUND_DEL_0006
     * @tc.desc   Delete MyDataSource at boundary index 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockDeleteBoundary0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockDeleteBoundary0006 begin');
      const source: MyDataSource = new MyDataSource([tabArray[0], tabArray[1], tabArray[2]]);
      source.deleteData(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(3));
      expect(source.totalCount()).assertEqual(3);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(3) === undefined));
        expect(source.getData(3) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockDeleteBoundary0006 end');
    })

    /**
     * @tc.name   testFlipClockDeleteBoundary0007
     * @tc.number SUB_FLIP_CLOCK_BOUND_DEL_0007
     * @tc.desc   Delete MyDataSource at boundary index 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockDeleteBoundary0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockDeleteBoundary0007 begin');
      const source: MyDataSource = new MyDataSource([tabArray[0], tabArray[1], tabArray[2]]);
      source.deleteData(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(3));
      expect(source.totalCount()).assertEqual(3);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(3) === undefined));
        expect(source.getData(3) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockDeleteBoundary0007 end');
    })

    /**
     * @tc.name   testFlipClockDeleteBoundary0008
     * @tc.number SUB_FLIP_CLOCK_BOUND_DEL_0008
     * @tc.desc   Delete MyDataSource at boundary index 9007199254740991.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockDeleteBoundary0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockDeleteBoundary0008 begin');
      const source: MyDataSource = new MyDataSource([tabArray[0], tabArray[1], tabArray[2]]);
      source.deleteData(9007199254740991);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(3));
      expect(source.totalCount()).assertEqual(3);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(3) === undefined));
        expect(source.getData(3) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockDeleteBoundary0008 end');
    })
  })
}
