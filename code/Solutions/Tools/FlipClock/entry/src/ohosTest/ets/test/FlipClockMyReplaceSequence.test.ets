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

export default function flipClockMyReplaceSequenceTest() {
  describe('FlipClockMyReplaceSequenceTest', () => {

    /**
     * @tc.name   testFlipClockMyReplaceSeq0000
     * @tc.number SUB_FLIP_CLOCK_MORE4_MREP_0000
     * @tc.desc   Replace MyDataSource with 1 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyReplaceSeq0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyReplaceSeq0000 begin');
      const source: MyDataSource = new MyDataSource(tabArray.slice());
        const next: TabType[] = [];
      for (let index: number = 0; index < 1; index++) {
        next.push(tabArray[index % 4]);
        }
      source.replaceData(next);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1));
        expect(source.totalCount()).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).num), String(0));
        expect(source.getData(0).num).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyReplaceSeq0000 end');
    })

    /**
     * @tc.name   testFlipClockMyReplaceSeq0001
     * @tc.number SUB_FLIP_CLOCK_MORE4_MREP_0001
     * @tc.desc   Replace MyDataSource with 2 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyReplaceSeq0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyReplaceSeq0001 begin');
      const source: MyDataSource = new MyDataSource(tabArray.slice());
        const next: TabType[] = [];
      for (let index: number = 0; index < 2; index++) {
        next.push(tabArray[index % 4]);
        }
      source.replaceData(next);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(2));
        expect(source.totalCount()).assertEqual(2);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).num), String(0));
        expect(source.getData(0).num).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyReplaceSeq0001 end');
    })

    /**
     * @tc.name   testFlipClockMyReplaceSeq0002
     * @tc.number SUB_FLIP_CLOCK_MORE4_MREP_0002
     * @tc.desc   Replace MyDataSource with 3 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyReplaceSeq0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyReplaceSeq0002 begin');
      const source: MyDataSource = new MyDataSource(tabArray.slice());
        const next: TabType[] = [];
      for (let index: number = 0; index < 3; index++) {
        next.push(tabArray[index % 4]);
        }
      source.replaceData(next);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(3));
        expect(source.totalCount()).assertEqual(3);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).num), String(0));
        expect(source.getData(0).num).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyReplaceSeq0002 end');
    })

    /**
     * @tc.name   testFlipClockMyReplaceSeq0003
     * @tc.number SUB_FLIP_CLOCK_MORE4_MREP_0003
     * @tc.desc   Replace MyDataSource with 4 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyReplaceSeq0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyReplaceSeq0003 begin');
      const source: MyDataSource = new MyDataSource(tabArray.slice());
        const next: TabType[] = [];
      for (let index: number = 0; index < 4; index++) {
        next.push(tabArray[index % 4]);
        }
      source.replaceData(next);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(4));
        expect(source.totalCount()).assertEqual(4);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).num), String(0));
        expect(source.getData(0).num).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyReplaceSeq0003 end');
    })

    /**
     * @tc.name   testFlipClockMyReplaceSeq0004
     * @tc.number SUB_FLIP_CLOCK_MORE4_MREP_0004
     * @tc.desc   Replace MyDataSource with 5 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyReplaceSeq0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyReplaceSeq0004 begin');
      const source: MyDataSource = new MyDataSource(tabArray.slice());
        const next: TabType[] = [];
      for (let index: number = 0; index < 5; index++) {
        next.push(tabArray[index % 4]);
        }
      source.replaceData(next);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(5));
        expect(source.totalCount()).assertEqual(5);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).num), String(0));
        expect(source.getData(0).num).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyReplaceSeq0004 end');
    })

    /**
     * @tc.name   testFlipClockMyReplaceSeq0005
     * @tc.number SUB_FLIP_CLOCK_MORE4_MREP_0005
     * @tc.desc   Replace MyDataSource with 6 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyReplaceSeq0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyReplaceSeq0005 begin');
      const source: MyDataSource = new MyDataSource(tabArray.slice());
        const next: TabType[] = [];
      for (let index: number = 0; index < 6; index++) {
        next.push(tabArray[index % 4]);
        }
      source.replaceData(next);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(6));
        expect(source.totalCount()).assertEqual(6);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).num), String(0));
        expect(source.getData(0).num).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyReplaceSeq0005 end');
    })

    /**
     * @tc.name   testFlipClockMyReplaceSeq0006
     * @tc.number SUB_FLIP_CLOCK_MORE4_MREP_0006
     * @tc.desc   Replace MyDataSource with 7 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyReplaceSeq0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyReplaceSeq0006 begin');
      const source: MyDataSource = new MyDataSource(tabArray.slice());
        const next: TabType[] = [];
      for (let index: number = 0; index < 7; index++) {
        next.push(tabArray[index % 4]);
        }
      source.replaceData(next);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(7));
        expect(source.totalCount()).assertEqual(7);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).num), String(0));
        expect(source.getData(0).num).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyReplaceSeq0006 end');
    })

    /**
     * @tc.name   testFlipClockMyReplaceSeq0007
     * @tc.number SUB_FLIP_CLOCK_MORE4_MREP_0007
     * @tc.desc   Replace MyDataSource with 8 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyReplaceSeq0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyReplaceSeq0007 begin');
      const source: MyDataSource = new MyDataSource(tabArray.slice());
        const next: TabType[] = [];
      for (let index: number = 0; index < 8; index++) {
        next.push(tabArray[index % 4]);
        }
      source.replaceData(next);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(8));
        expect(source.totalCount()).assertEqual(8);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).num), String(0));
        expect(source.getData(0).num).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyReplaceSeq0007 end');
    })
  })
}
