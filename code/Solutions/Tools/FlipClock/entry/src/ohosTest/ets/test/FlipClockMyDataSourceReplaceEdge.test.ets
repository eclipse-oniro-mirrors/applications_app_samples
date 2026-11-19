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

export default function flipClockMyDataSourceReplaceEdgeTest() {
  describe('FlipClockMyDataSourceReplaceEdgeTest', () => {

    /**
     * @tc.name   ohos.samples.flipclock_MyDataSourceReplaceEdge_0001
     * @tc.number SUB_FLIP_CLOCK_EDGE_MYREP_001
     * @tc.desc   Replace with an empty array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_MyDataSourceReplaceEdge_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_MyDataSourceReplaceEdge_0001 begin');
      const source: MyDataSource = new MyDataSource(tabArray.slice());
        source.replaceData([]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(0));
      expect(source.totalCount()).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(0) === undefined));
        expect(source.getData(0) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_MyDataSourceReplaceEdge_0001 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_MyDataSourceReplaceEdge_0002
     * @tc.number SUB_FLIP_CLOCK_EDGE_MYREP_002
     * @tc.desc   Replace with one entry.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_MyDataSourceReplaceEdge_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_MyDataSourceReplaceEdge_0002 begin');
      const source: MyDataSource = new MyDataSource(tabArray.slice());
        source.replaceData([tabArray[2]]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1));
      expect(source.totalCount()).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).num), String(2));
        expect(source.getData(0).num).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_MyDataSourceReplaceEdge_0002 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_MyDataSourceReplaceEdge_0003
     * @tc.number SUB_FLIP_CLOCK_EDGE_MYREP_003
     * @tc.desc   Replace with the same array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_MyDataSourceReplaceEdge_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_MyDataSourceReplaceEdge_0003 begin');
      const source: MyDataSource = new MyDataSource(tabArray.slice());
        source.replaceData(tabArray.slice());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(4));
      expect(source.totalCount()).assertEqual(4);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(3).num), String(3));
        expect(source.getData(3).num).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_MyDataSourceReplaceEdge_0003 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_MyDataSourceReplaceEdge_0004
     * @tc.number SUB_FLIP_CLOCK_EDGE_MYREP_004
     * @tc.desc   Replace with duplicate entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_MyDataSourceReplaceEdge_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_MyDataSourceReplaceEdge_0004 begin');
      const source: MyDataSource = new MyDataSource([]);
        source.replaceData([tabArray[0], tabArray[0]]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(2));
      expect(source.totalCount()).assertEqual(2);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1).num), String(0));
        expect(source.getData(1).num).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_MyDataSourceReplaceEdge_0004 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_MyDataSourceReplaceEdge_0005
     * @tc.number SUB_FLIP_CLOCK_EDGE_MYREP_005
     * @tc.desc   Replace with reversed order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_MyDataSourceReplaceEdge_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_MyDataSourceReplaceEdge_0005 begin');
      const source: MyDataSource = new MyDataSource([]);
        source.replaceData([tabArray[3], tabArray[2], tabArray[1], tabArray[0]]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).num), String(3));
      expect(source.getData(0).num).assertEqual(3);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(3).num), String(0));
        expect(source.getData(3).num).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_MyDataSourceReplaceEdge_0005 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_MyDataSourceReplaceEdge_0006
     * @tc.number SUB_FLIP_CLOCK_EDGE_MYREP_006
     * @tc.desc   Replace with six entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_MyDataSourceReplaceEdge_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_MyDataSourceReplaceEdge_0006 begin');
      const source: MyDataSource = new MyDataSource([]);
        source.replaceData([tabArray[0],tabArray[1],tabArray[2],tabArray[3],tabArray[0],tabArray[1]]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(6));
      expect(source.totalCount()).assertEqual(6);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(5).num), String(1));
        expect(source.getData(5).num).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_MyDataSourceReplaceEdge_0006 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_MyDataSourceReplaceEdge_0007
     * @tc.number SUB_FLIP_CLOCK_EDGE_MYREP_007
     * @tc.desc   Read trailing index after replace.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_MyDataSourceReplaceEdge_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_MyDataSourceReplaceEdge_0007 begin');
      const source: MyDataSource = new MyDataSource([]);
        source.replaceData([tabArray[1]]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).num), String(1));
      expect(source.getData(0).num).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(1) === undefined));
        expect(source.getData(1) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_MyDataSourceReplaceEdge_0007 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_MyDataSourceReplaceEdge_0008
     * @tc.number SUB_FLIP_CLOCK_EDGE_MYREP_008
     * @tc.desc   Replace twice and verify count.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_MyDataSourceReplaceEdge_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_MyDataSourceReplaceEdge_0008 begin');
      const source: MyDataSource = new MyDataSource([]);
        source.replaceData([tabArray[0]]);
        source.replaceData(tabArray.slice());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(4));
      expect(source.totalCount()).assertEqual(4);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).num), String(0));
        expect(source.getData(0).num).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_MyDataSourceReplaceEdge_0008 end');
    })
  })
}
