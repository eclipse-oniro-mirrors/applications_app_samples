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
import { MyDataSource, TabType } from '../../../main/ets/common/DataSource';
import { testTabs as tabArray } from './FlipClockTestTabs';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function flipClockMyDataSourceReplaceTest() {
  describe('FlipClockMyDataSourceReplaceTest', () => {

    /**
     * @tc.name   testFlipClockMyDataSourcereplace0000
     * @tc.number SUB_FLIP_CLOCK_MYDS_REPLACE_0000
     * @tc.desc   Replace MyDataSource content with 0 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyDataSourcereplace0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyDataSourcereplace0000 begin');
      const source: MyDataSource = new MyDataSource(tabArray.slice());
      const next: TabType[] = [];
      for (let index: number = 0; index < 0; index++) {
        next.push(tabArray[index % tabArray.length]);
        }
      source.replaceData(next);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(0));
      expect(source.totalCount()).assertEqual(0);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).num), String(0));
        expect(source.getData(0).num).assertEqual(0);
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyDataSourcereplace0000 end');
    })

    /**
     * @tc.name   testFlipClockMyDataSourcereplace0001
     * @tc.number SUB_FLIP_CLOCK_MYDS_REPLACE_0001
     * @tc.desc   Replace MyDataSource content with 1 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyDataSourcereplace0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyDataSourcereplace0001 begin');
      const source: MyDataSource = new MyDataSource(tabArray.slice());
      const next: TabType[] = [];
      for (let index: number = 0; index < 1; index++) {
        next.push(tabArray[index % tabArray.length]);
        }
      source.replaceData(next);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1));
      expect(source.totalCount()).assertEqual(1);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).num), String(0));
        expect(source.getData(0).num).assertEqual(0);
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyDataSourcereplace0001 end');
    })

    /**
     * @tc.name   testFlipClockMyDataSourcereplace0002
     * @tc.number SUB_FLIP_CLOCK_MYDS_REPLACE_0002
     * @tc.desc   Replace MyDataSource content with 2 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyDataSourcereplace0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyDataSourcereplace0002 begin');
      const source: MyDataSource = new MyDataSource(tabArray.slice());
      const next: TabType[] = [];
      for (let index: number = 0; index < 2; index++) {
        next.push(tabArray[index % tabArray.length]);
        }
      source.replaceData(next);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(2));
      expect(source.totalCount()).assertEqual(2);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).num), String(0));
        expect(source.getData(0).num).assertEqual(0);
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyDataSourcereplace0002 end');
    })

    /**
     * @tc.name   testFlipClockMyDataSourcereplace0003
     * @tc.number SUB_FLIP_CLOCK_MYDS_REPLACE_0003
     * @tc.desc   Replace MyDataSource content with 3 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyDataSourcereplace0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyDataSourcereplace0003 begin');
      const source: MyDataSource = new MyDataSource(tabArray.slice());
      const next: TabType[] = [];
      for (let index: number = 0; index < 3; index++) {
        next.push(tabArray[index % tabArray.length]);
        }
      source.replaceData(next);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(3));
      expect(source.totalCount()).assertEqual(3);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).num), String(0));
        expect(source.getData(0).num).assertEqual(0);
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyDataSourcereplace0003 end');
    })

    /**
     * @tc.name   testFlipClockMyDataSourcereplace0004
     * @tc.number SUB_FLIP_CLOCK_MYDS_REPLACE_0004
     * @tc.desc   Replace MyDataSource content with 4 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyDataSourcereplace0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyDataSourcereplace0004 begin');
      const source: MyDataSource = new MyDataSource(tabArray.slice());
      const next: TabType[] = [];
      for (let index: number = 0; index < 4; index++) {
        next.push(tabArray[index % tabArray.length]);
        }
      source.replaceData(next);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(4));
      expect(source.totalCount()).assertEqual(4);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).num), String(0));
        expect(source.getData(0).num).assertEqual(0);
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyDataSourcereplace0004 end');
    })

    /**
     * @tc.name   testFlipClockMyDataSourcereplace0005
     * @tc.number SUB_FLIP_CLOCK_MYDS_REPLACE_0005
     * @tc.desc   Replace MyDataSource content with 5 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyDataSourcereplace0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyDataSourcereplace0005 begin');
      const source: MyDataSource = new MyDataSource(tabArray.slice());
      const next: TabType[] = [];
      for (let index: number = 0; index < 5; index++) {
        next.push(tabArray[index % tabArray.length]);
        }
      source.replaceData(next);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(5));
      expect(source.totalCount()).assertEqual(5);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).num), String(0));
        expect(source.getData(0).num).assertEqual(0);
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyDataSourcereplace0005 end');
    })

    /**
     * @tc.name   testFlipClockMyDataSourcereplace0006
     * @tc.number SUB_FLIP_CLOCK_MYDS_REPLACE_0006
     * @tc.desc   Replace MyDataSource content with 6 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyDataSourcereplace0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyDataSourcereplace0006 begin');
      const source: MyDataSource = new MyDataSource(tabArray.slice());
      const next: TabType[] = [];
      for (let index: number = 0; index < 6; index++) {
        next.push(tabArray[index % tabArray.length]);
        }
      source.replaceData(next);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(6));
      expect(source.totalCount()).assertEqual(6);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).num), String(0));
        expect(source.getData(0).num).assertEqual(0);
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyDataSourcereplace0006 end');
    })

    /**
     * @tc.name   testFlipClockMyDataSourcereplace0007
     * @tc.number SUB_FLIP_CLOCK_MYDS_REPLACE_0007
     * @tc.desc   Replace MyDataSource content with 7 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyDataSourcereplace0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyDataSourcereplace0007 begin');
      const source: MyDataSource = new MyDataSource(tabArray.slice());
      const next: TabType[] = [];
      for (let index: number = 0; index < 7; index++) {
        next.push(tabArray[index % tabArray.length]);
        }
      source.replaceData(next);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(7));
      expect(source.totalCount()).assertEqual(7);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).num), String(0));
        expect(source.getData(0).num).assertEqual(0);
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyDataSourcereplace0007 end');
    })
  })
}
