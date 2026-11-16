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

export default function flipClockMyReplaceLargeTest() {
  describe('FlipClockMyReplaceLargeTest', () => {

    /**
     * @tc.name   testFlipClockMyReplaceLarge0000
     * @tc.number SUB_FLIP_CLOCK_MORE6_MREP_0000
     * @tc.desc   Replace MyDataSource with 17 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyReplaceLarge0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyReplaceLarge0000 begin');
      const source: MyDataSource = new MyDataSource([]);
        const next: TabType[] = [];
        for (let index: number = 0; index < 17; index++) {
          next.push(tabArray[index % 4]);
        }
      source.replaceData(next);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(17);');
        expect(source.totalCount()).assertEqual(17);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(16).num).assertEqual(0);');
        expect(source.getData(16).num).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyReplaceLarge0000 end');
    })

    /**
     * @tc.name   testFlipClockMyReplaceLarge0001
     * @tc.number SUB_FLIP_CLOCK_MORE6_MREP_0001
     * @tc.desc   Replace MyDataSource with 18 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyReplaceLarge0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyReplaceLarge0001 begin');
      const source: MyDataSource = new MyDataSource([]);
        const next: TabType[] = [];
        for (let index: number = 0; index < 18; index++) {
          next.push(tabArray[index % 4]);
        }
      source.replaceData(next);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(18);');
        expect(source.totalCount()).assertEqual(18);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(17).num).assertEqual(1);');
        expect(source.getData(17).num).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyReplaceLarge0001 end');
    })

    /**
     * @tc.name   testFlipClockMyReplaceLarge0002
     * @tc.number SUB_FLIP_CLOCK_MORE6_MREP_0002
     * @tc.desc   Replace MyDataSource with 19 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyReplaceLarge0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyReplaceLarge0002 begin');
      const source: MyDataSource = new MyDataSource([]);
        const next: TabType[] = [];
        for (let index: number = 0; index < 19; index++) {
          next.push(tabArray[index % 4]);
        }
      source.replaceData(next);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(19);');
        expect(source.totalCount()).assertEqual(19);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(18).num).assertEqual(2);');
        expect(source.getData(18).num).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyReplaceLarge0002 end');
    })

    /**
     * @tc.name   testFlipClockMyReplaceLarge0003
     * @tc.number SUB_FLIP_CLOCK_MORE6_MREP_0003
     * @tc.desc   Replace MyDataSource with 20 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyReplaceLarge0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyReplaceLarge0003 begin');
      const source: MyDataSource = new MyDataSource([]);
        const next: TabType[] = [];
        for (let index: number = 0; index < 20; index++) {
          next.push(tabArray[index % 4]);
        }
      source.replaceData(next);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(20);');
        expect(source.totalCount()).assertEqual(20);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(19).num).assertEqual(3);');
        expect(source.getData(19).num).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyReplaceLarge0003 end');
    })

    /**
     * @tc.name   testFlipClockMyReplaceLarge0004
     * @tc.number SUB_FLIP_CLOCK_MORE6_MREP_0004
     * @tc.desc   Replace MyDataSource with 21 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyReplaceLarge0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyReplaceLarge0004 begin');
      const source: MyDataSource = new MyDataSource([]);
        const next: TabType[] = [];
        for (let index: number = 0; index < 21; index++) {
          next.push(tabArray[index % 4]);
        }
      source.replaceData(next);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(21);');
        expect(source.totalCount()).assertEqual(21);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(20).num).assertEqual(0);');
        expect(source.getData(20).num).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyReplaceLarge0004 end');
    })

    /**
     * @tc.name   testFlipClockMyReplaceLarge0005
     * @tc.number SUB_FLIP_CLOCK_MORE6_MREP_0005
     * @tc.desc   Replace MyDataSource with 22 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyReplaceLarge0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyReplaceLarge0005 begin');
      const source: MyDataSource = new MyDataSource([]);
        const next: TabType[] = [];
        for (let index: number = 0; index < 22; index++) {
          next.push(tabArray[index % 4]);
        }
      source.replaceData(next);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(22);');
        expect(source.totalCount()).assertEqual(22);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(21).num).assertEqual(1);');
        expect(source.getData(21).num).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyReplaceLarge0005 end');
    })

    /**
     * @tc.name   testFlipClockMyReplaceLarge0006
     * @tc.number SUB_FLIP_CLOCK_MORE6_MREP_0006
     * @tc.desc   Replace MyDataSource with 23 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyReplaceLarge0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyReplaceLarge0006 begin');
      const source: MyDataSource = new MyDataSource([]);
        const next: TabType[] = [];
        for (let index: number = 0; index < 23; index++) {
          next.push(tabArray[index % 4]);
        }
      source.replaceData(next);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(23);');
        expect(source.totalCount()).assertEqual(23);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(22).num).assertEqual(2);');
        expect(source.getData(22).num).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyReplaceLarge0006 end');
    })

    /**
     * @tc.name   testFlipClockMyReplaceLarge0007
     * @tc.number SUB_FLIP_CLOCK_MORE6_MREP_0007
     * @tc.desc   Replace MyDataSource with 24 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyReplaceLarge0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyReplaceLarge0007 begin');
      const source: MyDataSource = new MyDataSource([]);
        const next: TabType[] = [];
        for (let index: number = 0; index < 24; index++) {
          next.push(tabArray[index % 4]);
        }
      source.replaceData(next);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(24);');
        expect(source.totalCount()).assertEqual(24);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(23).num).assertEqual(3);');
        expect(source.getData(23).num).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyReplaceLarge0007 end');
    })
  })
}
