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

export default function flipClockMyDataSourcePushEdgeTest() {
  describe('FlipClockMyDataSourcePushEdgeTest', () => {

    /**
     * @tc.name   ohos.samples.flipclock_MyDataSourcePushEdge_0001
     * @tc.number SUB_FLIP_CLOCK_EDGE_MYPUSH_001
     * @tc.desc   Create an empty MyDataSource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_MyDataSourcePushEdge_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_MyDataSourcePushEdge_0001 begin');
      const source: MyDataSource = new MyDataSource([]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(0));
      expect(source.totalCount()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(0) === undefined));
      expect(source.getData(0) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(-1) === undefined));
      expect(source.getData(-1) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_MyDataSourcePushEdge_0001 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_MyDataSourcePushEdge_0002
     * @tc.number SUB_FLIP_CLOCK_EDGE_MYPUSH_002
     * @tc.desc   Push one tab entry.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_MyDataSourcePushEdge_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_MyDataSourcePushEdge_0002 begin');
      const source: MyDataSource = new MyDataSource([]);
        source.pushData(tabArray[0]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1));
      expect(source.totalCount()).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).num), String(0));
        expect(source.getData(0).num).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(1) === undefined));
        expect(source.getData(1) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_MyDataSourcePushEdge_0002 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_MyDataSourcePushEdge_0003
     * @tc.number SUB_FLIP_CLOCK_EDGE_MYPUSH_003
     * @tc.desc   Push the same entry twice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_MyDataSourcePushEdge_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_MyDataSourcePushEdge_0003 begin');
      const source: MyDataSource = new MyDataSource([]);
        source.pushData(tabArray[0]);
        source.pushData(tabArray[0]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(2));
      expect(source.totalCount()).assertEqual(2);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).num), String(0));
        expect(source.getData(0).num).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1).num), String(0));
        expect(source.getData(1).num).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_MyDataSourcePushEdge_0003 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_MyDataSourcePushEdge_0004
     * @tc.number SUB_FLIP_CLOCK_EDGE_MYPUSH_004
     * @tc.desc   Push all four tab entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_MyDataSourcePushEdge_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_MyDataSourcePushEdge_0004 begin');
      const source: MyDataSource = new MyDataSource([]);
        for (let i: number = 0; i < 4; i++) {
          source.pushData(tabArray[i]);
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(4));
      expect(source.totalCount()).assertEqual(4);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(3).num), String(3));
        expect(source.getData(3).num).assertEqual(3);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(4) === undefined));
        expect(source.getData(4) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_MyDataSourcePushEdge_0004 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_MyDataSourcePushEdge_0005
     * @tc.number SUB_FLIP_CLOCK_EDGE_MYPUSH_005
     * @tc.desc   Verify push keeps insertion order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_MyDataSourcePushEdge_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_MyDataSourcePushEdge_0005 begin');
      const source: MyDataSource = new MyDataSource([]);
        source.pushData(tabArray[2]);
        source.pushData(tabArray[0]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).num), String(2));
      expect(source.getData(0).num).assertEqual(2);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1).num), String(0));
        expect(source.getData(1).num).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(2));
        expect(source.totalCount()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_MyDataSourcePushEdge_0005 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_MyDataSourcePushEdge_0006
     * @tc.number SUB_FLIP_CLOCK_EDGE_MYPUSH_006
     * @tc.desc   Verify tab resources survive push.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_MyDataSourcePushEdge_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_MyDataSourcePushEdge_0006 begin');
      const source: MyDataSource = new MyDataSource([]);
        source.pushData(tabArray[1]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(0).icon !== undefined));
      expect(source.getData(0).icon !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(0).text !== undefined));
        expect(source.getData(0).text !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).num), String(1));
        expect(source.getData(0).num).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_MyDataSourcePushEdge_0006 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_MyDataSourcePushEdge_0007
     * @tc.number SUB_FLIP_CLOCK_EDGE_MYPUSH_007
     * @tc.desc   Read negative and trailing indexes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_MyDataSourcePushEdge_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_MyDataSourcePushEdge_0007 begin');
      const source: MyDataSource = new MyDataSource([]);
        source.pushData(tabArray[0]);
        source.pushData(tabArray[1]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(-1) === undefined));
      expect(source.getData(-1) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(2) === undefined));
        expect(source.getData(2) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1).num), String(1));
        expect(source.getData(1).num).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_MyDataSourcePushEdge_0007 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_MyDataSourcePushEdge_0008
     * @tc.number SUB_FLIP_CLOCK_EDGE_MYPUSH_008
     * @tc.desc   Verify count after repeated pushes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_MyDataSourcePushEdge_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_MyDataSourcePushEdge_0008 begin');
      const source: MyDataSource = new MyDataSource([]);
        for (let i: number = 0; i < 8; i++) {
          source.pushData(tabArray[0]);
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(8));
      expect(source.totalCount()).assertEqual(8);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(7).num), String(0));
        expect(source.getData(7).num).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(8) === undefined));
        expect(source.getData(8) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_MyDataSourcePushEdge_0008 end');
    })
  })
}
