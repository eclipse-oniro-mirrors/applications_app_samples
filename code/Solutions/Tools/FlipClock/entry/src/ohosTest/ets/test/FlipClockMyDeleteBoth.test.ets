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

export default function flipClockMyDeleteBothTest() {
  describe('FlipClockMyDeleteBothTest', () => {

    /**
     * @tc.name   testFlipClockDeleteBoth0000
     * @tc.number SUB_FLIP_CLOCK_MORE3_DELB_0000
     * @tc.desc   Delete both ends from 2 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockDeleteBoth0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockDeleteBoth0000 begin');
      const source: MyDataSource = new MyDataSource([]);
      for (let index: number = 0; index < 2; index++) {
        source.pushData(tabArray[index % 4]);
        }
      source.deleteData(0);
        source.deleteData(source.totalCount() - 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(0));
      expect(source.totalCount()).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
        expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockDeleteBoth0000 end');
    })

    /**
     * @tc.name   testFlipClockDeleteBoth0001
     * @tc.number SUB_FLIP_CLOCK_MORE3_DELB_0001
     * @tc.desc   Delete both ends from 3 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockDeleteBoth0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockDeleteBoth0001 begin');
      const source: MyDataSource = new MyDataSource([]);
      for (let index: number = 0; index < 3; index++) {
        source.pushData(tabArray[index % 4]);
        }
      source.deleteData(0);
        source.deleteData(source.totalCount() - 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1));
      expect(source.totalCount()).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
        expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockDeleteBoth0001 end');
    })

    /**
     * @tc.name   testFlipClockDeleteBoth0002
     * @tc.number SUB_FLIP_CLOCK_MORE3_DELB_0002
     * @tc.desc   Delete both ends from 4 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockDeleteBoth0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockDeleteBoth0002 begin');
      const source: MyDataSource = new MyDataSource([]);
      for (let index: number = 0; index < 4; index++) {
        source.pushData(tabArray[index % 4]);
        }
      source.deleteData(0);
        source.deleteData(source.totalCount() - 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(2));
      expect(source.totalCount()).assertEqual(2);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
        expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockDeleteBoth0002 end');
    })

    /**
     * @tc.name   testFlipClockDeleteBoth0003
     * @tc.number SUB_FLIP_CLOCK_MORE3_DELB_0003
     * @tc.desc   Delete both ends from 5 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockDeleteBoth0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockDeleteBoth0003 begin');
      const source: MyDataSource = new MyDataSource([]);
      for (let index: number = 0; index < 5; index++) {
        source.pushData(tabArray[index % 4]);
        }
      source.deleteData(0);
        source.deleteData(source.totalCount() - 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(3));
      expect(source.totalCount()).assertEqual(3);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
        expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockDeleteBoth0003 end');
    })

    /**
     * @tc.name   testFlipClockDeleteBoth0004
     * @tc.number SUB_FLIP_CLOCK_MORE3_DELB_0004
     * @tc.desc   Delete both ends from 6 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockDeleteBoth0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockDeleteBoth0004 begin');
      const source: MyDataSource = new MyDataSource([]);
      for (let index: number = 0; index < 6; index++) {
        source.pushData(tabArray[index % 4]);
        }
      source.deleteData(0);
        source.deleteData(source.totalCount() - 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(4));
      expect(source.totalCount()).assertEqual(4);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
        expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockDeleteBoth0004 end');
    })

    /**
     * @tc.name   testFlipClockDeleteBoth0005
     * @tc.number SUB_FLIP_CLOCK_MORE3_DELB_0005
     * @tc.desc   Delete both ends from 7 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockDeleteBoth0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockDeleteBoth0005 begin');
      const source: MyDataSource = new MyDataSource([]);
      for (let index: number = 0; index < 7; index++) {
        source.pushData(tabArray[index % 4]);
        }
      source.deleteData(0);
        source.deleteData(source.totalCount() - 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(5));
      expect(source.totalCount()).assertEqual(5);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
        expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockDeleteBoth0005 end');
    })

    /**
     * @tc.name   testFlipClockDeleteBoth0006
     * @tc.number SUB_FLIP_CLOCK_MORE3_DELB_0006
     * @tc.desc   Delete both ends from 8 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockDeleteBoth0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockDeleteBoth0006 begin');
      const source: MyDataSource = new MyDataSource([]);
      for (let index: number = 0; index < 8; index++) {
        source.pushData(tabArray[index % 4]);
        }
      source.deleteData(0);
        source.deleteData(source.totalCount() - 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(6));
      expect(source.totalCount()).assertEqual(6);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
        expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockDeleteBoth0006 end');
    })

    /**
     * @tc.name   testFlipClockDeleteBoth0007
     * @tc.number SUB_FLIP_CLOCK_MORE3_DELB_0007
     * @tc.desc   Delete both ends from 9 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockDeleteBoth0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockDeleteBoth0007 begin');
      const source: MyDataSource = new MyDataSource([]);
      for (let index: number = 0; index < 9; index++) {
        source.pushData(tabArray[index % 4]);
        }
      source.deleteData(0);
        source.deleteData(source.totalCount() - 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(7));
      expect(source.totalCount()).assertEqual(7);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
        expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockDeleteBoth0007 end');
    })
  })
}
