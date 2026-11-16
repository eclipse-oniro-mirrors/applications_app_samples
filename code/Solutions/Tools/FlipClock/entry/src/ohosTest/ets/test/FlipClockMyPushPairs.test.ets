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

export default function flipClockMyPushPairsTest() {
  describe('FlipClockMyPushPairsTest', () => {

    /**
     * @tc.name   testFlipClockPushPair0000
     * @tc.number SUB_FLIP_CLOCK_MORE3_PUSHP_0000
     * @tc.desc   Push paired tab entries 1 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockPushPair0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockPushPair0000 begin');
      const source: MyDataSource = new MyDataSource([]);
      for (let index: number = 0; index < 1; index++) {
        source.pushData(tabArray[index % 4]);
        source.pushData(tabArray[(index + 1) % 4]);
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(2);');
      expect(source.totalCount()).assertEqual(2);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).num).assertEqual(0);');
        expect(source.getData(0).num).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(source.totalCount() - 1).num).assertEqual(1 % 4);');
        expect(source.getData(source.totalCount() - 1).num).assertEqual(1 % 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockPushPair0000 end');
    })

    /**
     * @tc.name   testFlipClockPushPair0001
     * @tc.number SUB_FLIP_CLOCK_MORE3_PUSHP_0001
     * @tc.desc   Push paired tab entries 2 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockPushPair0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockPushPair0001 begin');
      const source: MyDataSource = new MyDataSource([]);
      for (let index: number = 0; index < 2; index++) {
        source.pushData(tabArray[index % 4]);
        source.pushData(tabArray[(index + 1) % 4]);
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(4);');
      expect(source.totalCount()).assertEqual(4);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).num).assertEqual(0);');
        expect(source.getData(0).num).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(source.totalCount() - 1).num).assertEqual(2 % 4);');
        expect(source.getData(source.totalCount() - 1).num).assertEqual(2 % 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockPushPair0001 end');
    })

    /**
     * @tc.name   testFlipClockPushPair0002
     * @tc.number SUB_FLIP_CLOCK_MORE3_PUSHP_0002
     * @tc.desc   Push paired tab entries 3 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockPushPair0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockPushPair0002 begin');
      const source: MyDataSource = new MyDataSource([]);
      for (let index: number = 0; index < 3; index++) {
        source.pushData(tabArray[index % 4]);
        source.pushData(tabArray[(index + 1) % 4]);
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(6);');
      expect(source.totalCount()).assertEqual(6);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).num).assertEqual(0);');
        expect(source.getData(0).num).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(source.totalCount() - 1).num).assertEqual(3 % 4);');
        expect(source.getData(source.totalCount() - 1).num).assertEqual(3 % 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockPushPair0002 end');
    })

    /**
     * @tc.name   testFlipClockPushPair0003
     * @tc.number SUB_FLIP_CLOCK_MORE3_PUSHP_0003
     * @tc.desc   Push paired tab entries 4 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockPushPair0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockPushPair0003 begin');
      const source: MyDataSource = new MyDataSource([]);
      for (let index: number = 0; index < 4; index++) {
        source.pushData(tabArray[index % 4]);
        source.pushData(tabArray[(index + 1) % 4]);
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(8);');
      expect(source.totalCount()).assertEqual(8);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).num).assertEqual(0);');
        expect(source.getData(0).num).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(source.totalCount() - 1).num).assertEqual(4 % 4);');
        expect(source.getData(source.totalCount() - 1).num).assertEqual(4 % 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockPushPair0003 end');
    })

    /**
     * @tc.name   testFlipClockPushPair0004
     * @tc.number SUB_FLIP_CLOCK_MORE3_PUSHP_0004
     * @tc.desc   Push paired tab entries 5 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockPushPair0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockPushPair0004 begin');
      const source: MyDataSource = new MyDataSource([]);
      for (let index: number = 0; index < 5; index++) {
        source.pushData(tabArray[index % 4]);
        source.pushData(tabArray[(index + 1) % 4]);
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(10);');
      expect(source.totalCount()).assertEqual(10);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).num).assertEqual(0);');
        expect(source.getData(0).num).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(source.totalCount() - 1).num).assertEqual(5 % 4);');
        expect(source.getData(source.totalCount() - 1).num).assertEqual(5 % 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockPushPair0004 end');
    })

    /**
     * @tc.name   testFlipClockPushPair0005
     * @tc.number SUB_FLIP_CLOCK_MORE3_PUSHP_0005
     * @tc.desc   Push paired tab entries 6 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockPushPair0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockPushPair0005 begin');
      const source: MyDataSource = new MyDataSource([]);
      for (let index: number = 0; index < 6; index++) {
        source.pushData(tabArray[index % 4]);
        source.pushData(tabArray[(index + 1) % 4]);
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(12);');
      expect(source.totalCount()).assertEqual(12);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).num).assertEqual(0);');
        expect(source.getData(0).num).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(source.totalCount() - 1).num).assertEqual(6 % 4);');
        expect(source.getData(source.totalCount() - 1).num).assertEqual(6 % 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockPushPair0005 end');
    })

    /**
     * @tc.name   testFlipClockPushPair0006
     * @tc.number SUB_FLIP_CLOCK_MORE3_PUSHP_0006
     * @tc.desc   Push paired tab entries 7 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockPushPair0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockPushPair0006 begin');
      const source: MyDataSource = new MyDataSource([]);
      for (let index: number = 0; index < 7; index++) {
        source.pushData(tabArray[index % 4]);
        source.pushData(tabArray[(index + 1) % 4]);
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(14);');
      expect(source.totalCount()).assertEqual(14);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).num).assertEqual(0);');
        expect(source.getData(0).num).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(source.totalCount() - 1).num).assertEqual(7 % 4);');
        expect(source.getData(source.totalCount() - 1).num).assertEqual(7 % 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockPushPair0006 end');
    })

    /**
     * @tc.name   testFlipClockPushPair0007
     * @tc.number SUB_FLIP_CLOCK_MORE3_PUSHP_0007
     * @tc.desc   Push paired tab entries 8 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockPushPair0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockPushPair0007 begin');
      const source: MyDataSource = new MyDataSource([]);
      for (let index: number = 0; index < 8; index++) {
        source.pushData(tabArray[index % 4]);
        source.pushData(tabArray[(index + 1) % 4]);
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(16);');
      expect(source.totalCount()).assertEqual(16);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).num).assertEqual(0);');
        expect(source.getData(0).num).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(source.totalCount() - 1).num).assertEqual(8 % 4);');
        expect(source.getData(source.totalCount() - 1).num).assertEqual(8 % 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockPushPair0007 end');
    })
  })
}
