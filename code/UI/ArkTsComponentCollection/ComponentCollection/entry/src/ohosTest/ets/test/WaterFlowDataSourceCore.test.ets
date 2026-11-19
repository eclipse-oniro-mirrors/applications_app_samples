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
import { describe, it, expect, Level, Size, TestType, beforeEachIt } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  WaterFlowDataSource
} from '../../../main/ets/pages/components/listAndGrid/waterFlowSample/WaterFlowDataSource';

const DOMAIN: number = 0xF814;
const TAG: string = 'WfdsCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function createFreshSource(): WaterFlowDataSource {
  return new WaterFlowDataSource();
}

export default function waterFlowDataSourceCoreTest(): void {
  // 在 describe 前注册到根级，每例开始前让出事件循环。
  beforeEachIt(async () => {
    await new Promise<void>((resolve: () => void) => {
      setTimeout(resolve, 1);
    });
  });
  describe('WaterFlowDataSourceCoreTest', () => {
    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0101
     * @tc.name      testWfds0101
     * @tc.desc      Verify a new data source reports total count of 28.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0101 begin');
      const source: WaterFlowDataSource = createFreshSource();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=28`);
      expect(source.totalCount()).assertEqual(28);
      log('testWfds0101 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0102
     * @tc.name      testWfds0102
     * @tc.desc      Verify getData returns 0 for the first index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0102 begin');
      const source: WaterFlowDataSource = createFreshSource();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected=0`);
      expect(source.getData(0)).assertEqual(0);
      log('testWfds0102 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0103
     * @tc.name      testWfds0103
     * @tc.desc      Verify getData returns 1 for the second index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0103 begin');
      const source: WaterFlowDataSource = createFreshSource();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1)=${source.getData(1)}, expected=1`);
      expect(source.getData(1)).assertEqual(1);
      log('testWfds0103 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0104
     * @tc.name      testWfds0104
     * @tc.desc      Verify getData returns the middle value 13 for index 13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0104 begin');
      const source: WaterFlowDataSource = createFreshSource();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(13)=${source.getData(13)}, expected=13`);
      expect(source.getData(13)).assertEqual(13);
      log('testWfds0104 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0105
     * @tc.name      testWfds0105
     * @tc.desc      Verify getData returns 27 for the last index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0105 begin');
      const source: WaterFlowDataSource = createFreshSource();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(27)=${source.getData(27)}, expected=27`);
      expect(source.getData(27)).assertEqual(27);
      log('testWfds0105 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0106
     * @tc.name      testWfds0106
     * @tc.desc      Verify getData returns undefined for an out-of-range index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0106 begin');
      const source: WaterFlowDataSource = createFreshSource();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(28)=${source.getData(28)}, expected=undefined`);
      expect(source.getData(28)).assertEqual(undefined);
      log('testWfds0106 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0107
     * @tc.name      testWfds0107
     * @tc.desc      Verify getData returns undefined for a negative index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0107 begin');
      const source: WaterFlowDataSource = createFreshSource();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(-1)=${source.getData(-1)}, expected=undefined`);
      expect(source.getData(-1)).assertEqual(undefined);
      log('testWfds0107 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0108
     * @tc.name      testWfds0108
     * @tc.desc      Verify getData returns a number type for a valid index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0108 begin');
      const source: WaterFlowDataSource = createFreshSource();
      const actual: number = source.getData(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testWfds0108 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0109
     * @tc.name      testWfds0109
     * @tc.desc      Verify totalCount returns a number type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0109 begin');
      const source: WaterFlowDataSource = createFreshSource();
      const actual: number = source.totalCount();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testWfds0109 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0110
     * @tc.name      testWfds0110
     * @tc.desc      Verify the initial sequence starts with values 0 to 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0110 begin');
      const source: WaterFlowDataSource = createFreshSource();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected=0`);
      expect(source.getData(0)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1)=${source.getData(1)}, expected=1`);
      expect(source.getData(1)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(2)=${source.getData(2)}, expected=2`);
      expect(source.getData(2)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(3)=${source.getData(3)}, expected=3`);
      expect(source.getData(3)).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(4)=${source.getData(4)}, expected=4`);
      expect(source.getData(4)).assertEqual(4);
      log('testWfds0110 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0111
     * @tc.name      testWfds0111
     * @tc.desc      Verify the initial sequence ends with values 23 to 27.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0111 begin');
      const source: WaterFlowDataSource = createFreshSource();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(23)=${source.getData(23)}, expected=23`);
      expect(source.getData(23)).assertEqual(23);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(24)=${source.getData(24)}, expected=24`);
      expect(source.getData(24)).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(25)=${source.getData(25)}, expected=25`);
      expect(source.getData(25)).assertEqual(25);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(26)=${source.getData(26)}, expected=26`);
      expect(source.getData(26)).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(27)=${source.getData(27)}, expected=27`);
      expect(source.getData(27)).assertEqual(27);
      log('testWfds0111 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0112
     * @tc.name      testWfds0112
     * @tc.desc      Verify add1stItem increases total count to 29.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0112 begin');
      const source: WaterFlowDataSource = createFreshSource();
      source.add1stItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=29`);
      expect(source.totalCount()).assertEqual(29);
      log('testWfds0112 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0113
     * @tc.name      testWfds0113
     * @tc.desc      Verify add1stItem puts the new value 28 at index 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0113 begin');
      const source: WaterFlowDataSource = createFreshSource();
      source.add1stItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected=28`);
      expect(source.getData(0)).assertEqual(28);
      log('testWfds0113 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0114
     * @tc.name      testWfds0114
     * @tc.desc      Verify add1stItem keeps the original first value at index 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0114 begin');
      const source: WaterFlowDataSource = createFreshSource();
      source.add1stItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1)=${source.getData(1)}, expected=0`);
      expect(source.getData(1)).assertEqual(0);
      log('testWfds0114 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0115
     * @tc.name      testWfds0115
     * @tc.desc      Verify addLastItem increases total count to 29.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0115 begin');
      const source: WaterFlowDataSource = createFreshSource();
      source.addLastItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=29`);
      expect(source.totalCount()).assertEqual(29);
      log('testWfds0115 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0116
     * @tc.name      testWfds0116
     * @tc.desc      Verify addLastItem appends value 28 at the tail index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0116 begin');
      const source: WaterFlowDataSource = createFreshSource();
      source.addLastItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(28)=${source.getData(28)}, expected=28`);
      expect(source.getData(28)).assertEqual(28);
      log('testWfds0116 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0117
     * @tc.name      testWfds0117
     * @tc.desc      Verify addLastItem does not change the first element.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0117 begin');
      const source: WaterFlowDataSource = createFreshSource();
      source.addLastItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected=0`);
      expect(source.getData(0)).assertEqual(0);
      log('testWfds0117 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0118
     * @tc.name      testWfds0118
     * @tc.desc      Verify addItem inserts value 28 at the given middle index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0118 begin');
      const source: WaterFlowDataSource = createFreshSource();
      source.addItem(14);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(14)=${source.getData(14)}, expected=28`);
      expect(source.getData(14)).assertEqual(28);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=29`);
      expect(source.totalCount()).assertEqual(29);
      log('testWfds0118 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0119
     * @tc.name      testWfds0119
     * @tc.desc      Verify addItem keeps neighbours ordered around the insert index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0119 begin');
      const source: WaterFlowDataSource = createFreshSource();
      source.addItem(14);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(13)=${source.getData(13)}, expected=13`);
      expect(source.getData(13)).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(15)=${source.getData(15)}, expected=14`);
      expect(source.getData(15)).assertEqual(14);
      log('testWfds0119 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0120
     * @tc.name      testWfds0120
     * @tc.desc      Verify addItem at index 0 behaves like adding a first item.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0120 begin');
      const source: WaterFlowDataSource = createFreshSource();
      source.addItem(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected=28`);
      expect(source.getData(0)).assertEqual(28);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1)=${source.getData(1)}, expected=0`);
      expect(source.getData(1)).assertEqual(0);
      log('testWfds0120 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0121
     * @tc.name      testWfds0121
     * @tc.desc      Verify addItem at the tail index appends the new value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0121 begin');
      const source: WaterFlowDataSource = createFreshSource();
      source.addItem(28);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(28)=${source.getData(28)}, expected=28`);
      expect(source.getData(28)).assertEqual(28);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=29`);
      expect(source.totalCount()).assertEqual(29);
      log('testWfds0121 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0122
     * @tc.name      testWfds0122
     * @tc.desc      Verify delete1stItem decreases total count to 27.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0122 begin');
      const source: WaterFlowDataSource = createFreshSource();
      source.delete1stItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=27`);
      expect(source.totalCount()).assertEqual(27);
      log('testWfds0122 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0123
     * @tc.name      testWfds0123
     * @tc.desc      Verify delete1stItem makes value 1 become the first element.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0123 begin');
      const source: WaterFlowDataSource = createFreshSource();
      source.delete1stItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected=1`);
      expect(source.getData(0)).assertEqual(1);
      log('testWfds0123 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0124
     * @tc.name      testWfds0124
     * @tc.desc      Verify delete2ndItem decreases total count to 27.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0124 begin');
      const source: WaterFlowDataSource = createFreshSource();
      source.delete2ndItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=27`);
      expect(source.totalCount()).assertEqual(27);
      log('testWfds0124 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0125
     * @tc.name      testWfds0125
     * @tc.desc      Verify delete2ndItem keeps the first element intact.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0125 begin');
      const source: WaterFlowDataSource = createFreshSource();
      source.delete2ndItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected=0`);
      expect(source.getData(0)).assertEqual(0);
      log('testWfds0125 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0126
     * @tc.name      testWfds0126
     * @tc.desc      Verify delete2ndItem makes value 2 become the second element.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0126 begin');
      const source: WaterFlowDataSource = createFreshSource();
      source.delete2ndItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1)=${source.getData(1)}, expected=2`);
      expect(source.getData(1)).assertEqual(2);
      log('testWfds0126 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0127
     * @tc.name      testWfds0127
     * @tc.desc      Verify deleteLastItem decreases total count to 27.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0127 begin');
      const source: WaterFlowDataSource = createFreshSource();
      source.deleteLastItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=27`);
      expect(source.totalCount()).assertEqual(27);
      log('testWfds0127 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0128
     * @tc.name      testWfds0128
     * @tc.desc      Verify deleteLastItem removes the tail value 27.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0128 begin');
      const source: WaterFlowDataSource = createFreshSource();
      source.deleteLastItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(26)=${source.getData(26)}, expected=26`);
      expect(source.getData(26)).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(27)=${source.getData(27)}, expected=undefined`);
      expect(source.getData(27)).assertEqual(undefined);
      log('testWfds0128 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0129
     * @tc.name      testWfds0129
     * @tc.desc      Verify reload decreases total count from 28 to 25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0129 begin');
      const source: WaterFlowDataSource = createFreshSource();
      source.reload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=25`);
      expect(source.totalCount()).assertEqual(25);
      log('testWfds0129 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0130
     * @tc.name      testWfds0130
     * @tc.desc      Verify reload removes the second element so value 2 shifts to index 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0130 begin');
      const source: WaterFlowDataSource = createFreshSource();
      source.reload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1)=${source.getData(1)}, expected=2`);
      expect(source.getData(1)).assertEqual(2);
      log('testWfds0130 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0131
     * @tc.name      testWfds0131
     * @tc.desc      Verify reload removes values 4 and 5 after removing value 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0131 begin');
      const source: WaterFlowDataSource = createFreshSource();
      source.reload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(2)=${source.getData(2)}, expected=3`);
      expect(source.getData(2)).assertEqual(3);
      log('assertEqual source.getData(3)=' + source.getData(3) + ', expected=6');
      expect(source.getData(3)).assertEqual(6);
      log('assertEqual source.getData(4)=' + source.getData(4) + ', expected=7');
      expect(source.getData(4)).assertEqual(7);
      log('testWfds0131 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0132
     * @tc.name      testWfds0132
     * @tc.desc      Verify registered listener receives one reloaded callback on reload.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0132 begin');
      const source: WaterFlowDataSource = createFreshSource();
      const listener: WfdsMockListener = new WfdsMockListener();
      source.registerDataChangeListener(listener);
      source.reload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadedCount=${listener.reloadedCount}, expected=1`);
      expect(listener.reloadedCount).assertEqual(1);
      log('testWfds0132 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0133
     * @tc.name      testWfds0133
     * @tc.desc      Verify add1stItem notifies registered listener with index 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0133 begin');
      const source: WaterFlowDataSource = createFreshSource();
      const listener: WfdsMockListener = new WfdsMockListener();
      source.registerDataChangeListener(listener);
      source.add1stItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedIndexes.length=${listener.addedIndexes.length}`);
      expect(listener.addedIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedIndexes[0]=${listener.addedIndexes[0]}`);
      expect(listener.addedIndexes[0]).assertEqual(0);
      log('testWfds0133 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0134
     * @tc.name      testWfds0134
     * @tc.desc      Verify addLastItem notifies registered listener with the new tail index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0134 begin');
      const source: WaterFlowDataSource = createFreshSource();
      const listener: WfdsMockListener = new WfdsMockListener();
      source.registerDataChangeListener(listener);
      source.addLastItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedIndexes.length=${listener.addedIndexes.length}`);
      expect(listener.addedIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedIndexes[0]=${listener.addedIndexes[0]}`);
      expect(listener.addedIndexes[0]).assertEqual(28);
      log('testWfds0134 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0135
     * @tc.name      testWfds0135
     * @tc.desc      Verify delete1stItem notifies registered listener with index 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0135 begin');
      const source: WaterFlowDataSource = createFreshSource();
      const listener: WfdsMockListener = new WfdsMockListener();
      source.registerDataChangeListener(listener);
      source.delete1stItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.deletedIndexes.length}, expected=1`);
      expect(listener.deletedIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.deletedIndexes[0]=${listener.deletedIndexes[0]}`);
      expect(listener.deletedIndexes[0]).assertEqual(0);
      log('testWfds0135 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0136
     * @tc.name      testWfds0136
     * @tc.desc      Verify registering the same listener twice only notifies once.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0136 begin');
      const source: WaterFlowDataSource = createFreshSource();
      const listener: WfdsMockListener = new WfdsMockListener();
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      source.add1stItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedIndexes.length=${listener.addedIndexes.length}`);
      expect(listener.addedIndexes.length).assertEqual(1);
      log('testWfds0136 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0137
     * @tc.name      testWfds0137
     * @tc.desc      Verify unregistered listener no longer receives callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0137 begin');
      const source: WaterFlowDataSource = createFreshSource();
      const listener: WfdsMockListener = new WfdsMockListener();
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.add1stItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedIndexes.length=${listener.addedIndexes.length}`);
      expect(listener.addedIndexes.length).assertEqual(0);
      log('testWfds0137 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0138
     * @tc.name      testWfds0138
     * @tc.desc      Verify notifying with no listeners does not throw.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0138 begin');
      const source: WaterFlowDataSource = createFreshSource();
      source.add1stItem();
      source.deleteLastItem();
      source.reload();
      log('assertEqual source.totalCount()=' + source.totalCount() + ', expected=25');
      expect(source.totalCount()).assertEqual(25);
      log('testWfds0138 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0139
     * @tc.name      testWfds0139
     * @tc.desc      Verify two registered listeners both receive the add callback.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0139 begin');
      const source: WaterFlowDataSource = createFreshSource();
      const first: WfdsMockListener = new WfdsMockListener();
      const second: WfdsMockListener = new WfdsMockListener();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.add1stItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.addedIndexes.length=${first.addedIndexes.length}`);
      expect(first.addedIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.addedIndexes.length=${second.addedIndexes.length}`);
      expect(second.addedIndexes.length).assertEqual(1);
      log('testWfds0139 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_WFDS_0140
     * @tc.name      testWfds0140
     * @tc.desc      Verify unregistering an unknown listener leaves registered ones intact.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWfds0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWfds0140 begin');
      const source: WaterFlowDataSource = createFreshSource();
      const listener: WfdsMockListener = new WfdsMockListener();
      const stranger: WfdsMockListener = new WfdsMockListener();
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(stranger);
      source.add1stItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedIndexes.length=${listener.addedIndexes.length}`);
      expect(listener.addedIndexes.length).assertEqual(1);
      log('testWfds0140 end');
    })
  })
}

/**
 * Mock DataChangeListener used by WaterFlowDataSource test cases.
 */
class WfdsMockListener implements DataChangeListener {
  reloadedCount: number = 0;
  addedIndexes: number[] = [];
  deletedIndexes: number[] = [];
  changedIndexes: number[] = [];
  movedCount: number = 0;
  moveFrom: number = -1;
  moveTo: number = -1;

  onDataReloaded(): void {
    this.reloadedCount++;
  }

  onDataAdded(index: number): void {
    this.addedIndexes.push(index);
  }

  onDataAdd(index: number): void {
    this.addedIndexes.push(index);
  }

  onDataMoved(from: number, to: number): void {
    this.moveFrom = from;
    this.moveTo = to;
    this.movedCount++;
  }

  onDataMove(from: number, to: number): void {
    this.moveFrom = from;
    this.moveTo = to;
    this.movedCount++;
  }

  onDataDeleted(index: number): void {
    this.deletedIndexes.push(index);
  }

  onDataDelete(index: number): void {
    this.deletedIndexes.push(index);
  }

  onDataChanged(index: number): void {
    this.changedIndexes.push(index);
  }

  onDataChange(index: number): void {
    this.changedIndexes.push(index);
  }

  onDatasetChange(operations: Object[]): void {
    this.reloadedCount++;
  }
}
